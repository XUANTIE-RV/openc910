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
module ct_ifu_ibuf(
  cp0_ifu_icg_en,
  cp0_yy_clk_en,
  cpurst_b,
  forever_cpuclk,
  ibctrl_ibuf_bypass_not_select,
  ibctrl_ibuf_create_vld,
  ibctrl_ibuf_data_vld,
  ibctrl_ibuf_flush,
  ibctrl_ibuf_merge_vld,
  ibctrl_ibuf_retire_vld,
  ibdp_ibuf_h0_32_start,
  ibdp_ibuf_h0_bkpta,
  ibdp_ibuf_h0_bkptb,
  ibdp_ibuf_h0_data,
  ibdp_ibuf_h0_fence,
  ibdp_ibuf_h0_high_expt,
  ibdp_ibuf_h0_ldst,
  ibdp_ibuf_h0_no_spec,
  ibdp_ibuf_h0_pc,
  ibdp_ibuf_h0_spe_vld,
  ibdp_ibuf_h0_split0,
  ibdp_ibuf_h0_split1,
  ibdp_ibuf_h0_vl,
  ibdp_ibuf_h0_vl_pred,
  ibdp_ibuf_h0_vld,
  ibdp_ibuf_h0_vlmul,
  ibdp_ibuf_h0_vsew,
  ibdp_ibuf_h1_data,
  ibdp_ibuf_h1_pc,
  ibdp_ibuf_h1_vl,
  ibdp_ibuf_h1_vlmul,
  ibdp_ibuf_h1_vsew,
  ibdp_ibuf_h2_data,
  ibdp_ibuf_h2_pc,
  ibdp_ibuf_h2_vl,
  ibdp_ibuf_h2_vlmul,
  ibdp_ibuf_h2_vsew,
  ibdp_ibuf_h3_data,
  ibdp_ibuf_h3_pc,
  ibdp_ibuf_h3_vl,
  ibdp_ibuf_h3_vlmul,
  ibdp_ibuf_h3_vsew,
  ibdp_ibuf_h4_data,
  ibdp_ibuf_h4_pc,
  ibdp_ibuf_h4_vl,
  ibdp_ibuf_h4_vlmul,
  ibdp_ibuf_h4_vsew,
  ibdp_ibuf_h5_data,
  ibdp_ibuf_h5_pc,
  ibdp_ibuf_h5_vl,
  ibdp_ibuf_h5_vlmul,
  ibdp_ibuf_h5_vsew,
  ibdp_ibuf_h6_data,
  ibdp_ibuf_h6_pc,
  ibdp_ibuf_h6_vl,
  ibdp_ibuf_h6_vlmul,
  ibdp_ibuf_h6_vsew,
  ibdp_ibuf_h7_data,
  ibdp_ibuf_h7_pc,
  ibdp_ibuf_h7_vl,
  ibdp_ibuf_h7_vlmul,
  ibdp_ibuf_h7_vsew,
  ibdp_ibuf_h8_data,
  ibdp_ibuf_h8_pc,
  ibdp_ibuf_h8_vl,
  ibdp_ibuf_h8_vlmul,
  ibdp_ibuf_h8_vsew,
  ibdp_ibuf_half_vld_num,
  ibdp_ibuf_hn_32_start,
  ibdp_ibuf_hn_acc_err,
  ibdp_ibuf_hn_acc_err_vld,
  ibdp_ibuf_hn_bkpta,
  ibdp_ibuf_hn_bkpta_vld,
  ibdp_ibuf_hn_bkptb,
  ibdp_ibuf_hn_bkptb_vld,
  ibdp_ibuf_hn_fence,
  ibdp_ibuf_hn_high_expt,
  ibdp_ibuf_hn_ldst,
  ibdp_ibuf_hn_mmu_acc_deny,
  ibdp_ibuf_hn_mmu_acc_deny_vld,
  ibdp_ibuf_hn_no_spec,
  ibdp_ibuf_hn_no_spec_vld,
  ibdp_ibuf_hn_pgflt,
  ibdp_ibuf_hn_pgflt_vld,
  ibdp_ibuf_hn_split0,
  ibdp_ibuf_hn_split1,
  ibdp_ibuf_hn_vl_pred,
  ibdp_ibuf_hn_vld,
  ibuf_ibctrl_empty,
  ibuf_ibctrl_stall,
  ibuf_ibdp_bypass_inst0,
  ibuf_ibdp_bypass_inst0_bkpta,
  ibuf_ibdp_bypass_inst0_bkptb,
  ibuf_ibdp_bypass_inst0_ecc_err,
  ibuf_ibdp_bypass_inst0_expt,
  ibuf_ibdp_bypass_inst0_fence,
  ibuf_ibdp_bypass_inst0_high_expt,
  ibuf_ibdp_bypass_inst0_no_spec,
  ibuf_ibdp_bypass_inst0_pc,
  ibuf_ibdp_bypass_inst0_split0,
  ibuf_ibdp_bypass_inst0_split1,
  ibuf_ibdp_bypass_inst0_valid,
  ibuf_ibdp_bypass_inst0_vec,
  ibuf_ibdp_bypass_inst0_vl,
  ibuf_ibdp_bypass_inst0_vl_pred,
  ibuf_ibdp_bypass_inst0_vlmul,
  ibuf_ibdp_bypass_inst0_vsew,
  ibuf_ibdp_bypass_inst1,
  ibuf_ibdp_bypass_inst1_bkpta,
  ibuf_ibdp_bypass_inst1_bkptb,
  ibuf_ibdp_bypass_inst1_ecc_err,
  ibuf_ibdp_bypass_inst1_expt,
  ibuf_ibdp_bypass_inst1_fence,
  ibuf_ibdp_bypass_inst1_high_expt,
  ibuf_ibdp_bypass_inst1_no_spec,
  ibuf_ibdp_bypass_inst1_pc,
  ibuf_ibdp_bypass_inst1_split0,
  ibuf_ibdp_bypass_inst1_split1,
  ibuf_ibdp_bypass_inst1_valid,
  ibuf_ibdp_bypass_inst1_vec,
  ibuf_ibdp_bypass_inst1_vl,
  ibuf_ibdp_bypass_inst1_vl_pred,
  ibuf_ibdp_bypass_inst1_vlmul,
  ibuf_ibdp_bypass_inst1_vsew,
  ibuf_ibdp_bypass_inst2,
  ibuf_ibdp_bypass_inst2_bkpta,
  ibuf_ibdp_bypass_inst2_bkptb,
  ibuf_ibdp_bypass_inst2_ecc_err,
  ibuf_ibdp_bypass_inst2_expt,
  ibuf_ibdp_bypass_inst2_fence,
  ibuf_ibdp_bypass_inst2_high_expt,
  ibuf_ibdp_bypass_inst2_no_spec,
  ibuf_ibdp_bypass_inst2_pc,
  ibuf_ibdp_bypass_inst2_split0,
  ibuf_ibdp_bypass_inst2_split1,
  ibuf_ibdp_bypass_inst2_valid,
  ibuf_ibdp_bypass_inst2_vec,
  ibuf_ibdp_bypass_inst2_vl,
  ibuf_ibdp_bypass_inst2_vl_pred,
  ibuf_ibdp_bypass_inst2_vlmul,
  ibuf_ibdp_bypass_inst2_vsew,
  ibuf_ibdp_inst0,
  ibuf_ibdp_inst0_bkpta,
  ibuf_ibdp_inst0_bkptb,
  ibuf_ibdp_inst0_ecc_err,
  ibuf_ibdp_inst0_expt_vld,
  ibuf_ibdp_inst0_fence,
  ibuf_ibdp_inst0_high_expt,
  ibuf_ibdp_inst0_no_spec,
  ibuf_ibdp_inst0_pc,
  ibuf_ibdp_inst0_split0,
  ibuf_ibdp_inst0_split1,
  ibuf_ibdp_inst0_valid,
  ibuf_ibdp_inst0_vec,
  ibuf_ibdp_inst0_vl,
  ibuf_ibdp_inst0_vl_pred,
  ibuf_ibdp_inst0_vlmul,
  ibuf_ibdp_inst0_vsew,
  ibuf_ibdp_inst1,
  ibuf_ibdp_inst1_bkpta,
  ibuf_ibdp_inst1_bkptb,
  ibuf_ibdp_inst1_ecc_err,
  ibuf_ibdp_inst1_expt_vld,
  ibuf_ibdp_inst1_fence,
  ibuf_ibdp_inst1_high_expt,
  ibuf_ibdp_inst1_no_spec,
  ibuf_ibdp_inst1_pc,
  ibuf_ibdp_inst1_split0,
  ibuf_ibdp_inst1_split1,
  ibuf_ibdp_inst1_valid,
  ibuf_ibdp_inst1_vec,
  ibuf_ibdp_inst1_vl,
  ibuf_ibdp_inst1_vl_pred,
  ibuf_ibdp_inst1_vlmul,
  ibuf_ibdp_inst1_vsew,
  ibuf_ibdp_inst2,
  ibuf_ibdp_inst2_bkpta,
  ibuf_ibdp_inst2_bkptb,
  ibuf_ibdp_inst2_ecc_err,
  ibuf_ibdp_inst2_expt_vld,
  ibuf_ibdp_inst2_fence,
  ibuf_ibdp_inst2_high_expt,
  ibuf_ibdp_inst2_no_spec,
  ibuf_ibdp_inst2_pc,
  ibuf_ibdp_inst2_split0,
  ibuf_ibdp_inst2_split1,
  ibuf_ibdp_inst2_valid,
  ibuf_ibdp_inst2_vec,
  ibuf_ibdp_inst2_vl,
  ibuf_ibdp_inst2_vl_pred,
  ibuf_ibdp_inst2_vlmul,
  ibuf_ibdp_inst2_vsew,
  ibuf_lbuf_empty,
  pad_yy_icg_scan_en
);

// &Ports; @23
input           cp0_ifu_icg_en;                        
input           cp0_yy_clk_en;                         
input           cpurst_b;                              
input           forever_cpuclk;                        
input           ibctrl_ibuf_bypass_not_select;         
input           ibctrl_ibuf_create_vld;                
input           ibctrl_ibuf_data_vld;                  
input           ibctrl_ibuf_flush;                     
input           ibctrl_ibuf_merge_vld;                 
input           ibctrl_ibuf_retire_vld;                
input           ibdp_ibuf_h0_32_start;                 
input           ibdp_ibuf_h0_bkpta;                    
input           ibdp_ibuf_h0_bkptb;                    
input   [15:0]  ibdp_ibuf_h0_data;                     
input           ibdp_ibuf_h0_fence;                    
input           ibdp_ibuf_h0_high_expt;                
input           ibdp_ibuf_h0_ldst;                     
input           ibdp_ibuf_h0_no_spec;                  
input   [14:0]  ibdp_ibuf_h0_pc;                       
input           ibdp_ibuf_h0_spe_vld;                  
input           ibdp_ibuf_h0_split0;                   
input           ibdp_ibuf_h0_split1;                   
input   [7 :0]  ibdp_ibuf_h0_vl;                       
input           ibdp_ibuf_h0_vl_pred;                  
input           ibdp_ibuf_h0_vld;                      
input   [1 :0]  ibdp_ibuf_h0_vlmul;                    
input   [2 :0]  ibdp_ibuf_h0_vsew;                     
input   [15:0]  ibdp_ibuf_h1_data;                     
input   [14:0]  ibdp_ibuf_h1_pc;                       
input   [7 :0]  ibdp_ibuf_h1_vl;                       
input   [1 :0]  ibdp_ibuf_h1_vlmul;                    
input   [2 :0]  ibdp_ibuf_h1_vsew;                     
input   [15:0]  ibdp_ibuf_h2_data;                     
input   [14:0]  ibdp_ibuf_h2_pc;                       
input   [7 :0]  ibdp_ibuf_h2_vl;                       
input   [1 :0]  ibdp_ibuf_h2_vlmul;                    
input   [2 :0]  ibdp_ibuf_h2_vsew;                     
input   [15:0]  ibdp_ibuf_h3_data;                     
input   [14:0]  ibdp_ibuf_h3_pc;                       
input   [7 :0]  ibdp_ibuf_h3_vl;                       
input   [1 :0]  ibdp_ibuf_h3_vlmul;                    
input   [2 :0]  ibdp_ibuf_h3_vsew;                     
input   [15:0]  ibdp_ibuf_h4_data;                     
input   [14:0]  ibdp_ibuf_h4_pc;                       
input   [7 :0]  ibdp_ibuf_h4_vl;                       
input   [1 :0]  ibdp_ibuf_h4_vlmul;                    
input   [2 :0]  ibdp_ibuf_h4_vsew;                     
input   [15:0]  ibdp_ibuf_h5_data;                     
input   [14:0]  ibdp_ibuf_h5_pc;                       
input   [7 :0]  ibdp_ibuf_h5_vl;                       
input   [1 :0]  ibdp_ibuf_h5_vlmul;                    
input   [2 :0]  ibdp_ibuf_h5_vsew;                     
input   [15:0]  ibdp_ibuf_h6_data;                     
input   [14:0]  ibdp_ibuf_h6_pc;                       
input   [7 :0]  ibdp_ibuf_h6_vl;                       
input   [1 :0]  ibdp_ibuf_h6_vlmul;                    
input   [2 :0]  ibdp_ibuf_h6_vsew;                     
input   [15:0]  ibdp_ibuf_h7_data;                     
input   [14:0]  ibdp_ibuf_h7_pc;                       
input   [7 :0]  ibdp_ibuf_h7_vl;                       
input   [1 :0]  ibdp_ibuf_h7_vlmul;                    
input   [2 :0]  ibdp_ibuf_h7_vsew;                     
input   [15:0]  ibdp_ibuf_h8_data;                     
input   [14:0]  ibdp_ibuf_h8_pc;                       
input   [7 :0]  ibdp_ibuf_h8_vl;                       
input   [1 :0]  ibdp_ibuf_h8_vlmul;                    
input   [2 :0]  ibdp_ibuf_h8_vsew;                     
input   [3 :0]  ibdp_ibuf_half_vld_num;                
input   [7 :0]  ibdp_ibuf_hn_32_start;                 
input   [7 :0]  ibdp_ibuf_hn_acc_err;                  
input           ibdp_ibuf_hn_acc_err_vld;              
input   [7 :0]  ibdp_ibuf_hn_bkpta;                    
input           ibdp_ibuf_hn_bkpta_vld;                
input   [7 :0]  ibdp_ibuf_hn_bkptb;                    
input           ibdp_ibuf_hn_bkptb_vld;                
input   [7 :0]  ibdp_ibuf_hn_fence;                    
input   [7 :0]  ibdp_ibuf_hn_high_expt;                
input   [7 :0]  ibdp_ibuf_hn_ldst;                     
input   [7 :0]  ibdp_ibuf_hn_mmu_acc_deny;             
input           ibdp_ibuf_hn_mmu_acc_deny_vld;         
input   [7 :0]  ibdp_ibuf_hn_no_spec;                  
input           ibdp_ibuf_hn_no_spec_vld;              
input   [7 :0]  ibdp_ibuf_hn_pgflt;                    
input           ibdp_ibuf_hn_pgflt_vld;                
input   [7 :0]  ibdp_ibuf_hn_split0;                   
input   [7 :0]  ibdp_ibuf_hn_split1;                   
input   [7 :0]  ibdp_ibuf_hn_vl_pred;                  
input   [7 :0]  ibdp_ibuf_hn_vld;                      
input           pad_yy_icg_scan_en;                    
output          ibuf_ibctrl_empty;                     
output          ibuf_ibctrl_stall;                     
output  [31:0]  ibuf_ibdp_bypass_inst0;                
output          ibuf_ibdp_bypass_inst0_bkpta;          
output          ibuf_ibdp_bypass_inst0_bkptb;          
output          ibuf_ibdp_bypass_inst0_ecc_err;        
output          ibuf_ibdp_bypass_inst0_expt;           
output          ibuf_ibdp_bypass_inst0_fence;          
output          ibuf_ibdp_bypass_inst0_high_expt;      
output          ibuf_ibdp_bypass_inst0_no_spec;        
output  [14:0]  ibuf_ibdp_bypass_inst0_pc;             
output          ibuf_ibdp_bypass_inst0_split0;         
output          ibuf_ibdp_bypass_inst0_split1;         
output          ibuf_ibdp_bypass_inst0_valid;          
output  [3 :0]  ibuf_ibdp_bypass_inst0_vec;            
output  [7 :0]  ibuf_ibdp_bypass_inst0_vl;             
output          ibuf_ibdp_bypass_inst0_vl_pred;        
output  [1 :0]  ibuf_ibdp_bypass_inst0_vlmul;          
output  [2 :0]  ibuf_ibdp_bypass_inst0_vsew;           
output  [31:0]  ibuf_ibdp_bypass_inst1;                
output          ibuf_ibdp_bypass_inst1_bkpta;          
output          ibuf_ibdp_bypass_inst1_bkptb;          
output          ibuf_ibdp_bypass_inst1_ecc_err;        
output          ibuf_ibdp_bypass_inst1_expt;           
output          ibuf_ibdp_bypass_inst1_fence;          
output          ibuf_ibdp_bypass_inst1_high_expt;      
output          ibuf_ibdp_bypass_inst1_no_spec;        
output  [14:0]  ibuf_ibdp_bypass_inst1_pc;             
output          ibuf_ibdp_bypass_inst1_split0;         
output          ibuf_ibdp_bypass_inst1_split1;         
output          ibuf_ibdp_bypass_inst1_valid;          
output  [3 :0]  ibuf_ibdp_bypass_inst1_vec;            
output  [7 :0]  ibuf_ibdp_bypass_inst1_vl;             
output          ibuf_ibdp_bypass_inst1_vl_pred;        
output  [1 :0]  ibuf_ibdp_bypass_inst1_vlmul;          
output  [2 :0]  ibuf_ibdp_bypass_inst1_vsew;           
output  [31:0]  ibuf_ibdp_bypass_inst2;                
output          ibuf_ibdp_bypass_inst2_bkpta;          
output          ibuf_ibdp_bypass_inst2_bkptb;          
output          ibuf_ibdp_bypass_inst2_ecc_err;        
output          ibuf_ibdp_bypass_inst2_expt;           
output          ibuf_ibdp_bypass_inst2_fence;          
output          ibuf_ibdp_bypass_inst2_high_expt;      
output          ibuf_ibdp_bypass_inst2_no_spec;        
output  [14:0]  ibuf_ibdp_bypass_inst2_pc;             
output          ibuf_ibdp_bypass_inst2_split0;         
output          ibuf_ibdp_bypass_inst2_split1;         
output          ibuf_ibdp_bypass_inst2_valid;          
output  [3 :0]  ibuf_ibdp_bypass_inst2_vec;            
output  [7 :0]  ibuf_ibdp_bypass_inst2_vl;             
output          ibuf_ibdp_bypass_inst2_vl_pred;        
output  [1 :0]  ibuf_ibdp_bypass_inst2_vlmul;          
output  [2 :0]  ibuf_ibdp_bypass_inst2_vsew;           
output  [31:0]  ibuf_ibdp_inst0;                       
output          ibuf_ibdp_inst0_bkpta;                 
output          ibuf_ibdp_inst0_bkptb;                 
output          ibuf_ibdp_inst0_ecc_err;               
output          ibuf_ibdp_inst0_expt_vld;              
output          ibuf_ibdp_inst0_fence;                 
output          ibuf_ibdp_inst0_high_expt;             
output          ibuf_ibdp_inst0_no_spec;               
output  [14:0]  ibuf_ibdp_inst0_pc;                    
output          ibuf_ibdp_inst0_split0;                
output          ibuf_ibdp_inst0_split1;                
output          ibuf_ibdp_inst0_valid;                 
output  [3 :0]  ibuf_ibdp_inst0_vec;                   
output  [7 :0]  ibuf_ibdp_inst0_vl;                    
output          ibuf_ibdp_inst0_vl_pred;               
output  [1 :0]  ibuf_ibdp_inst0_vlmul;                 
output  [2 :0]  ibuf_ibdp_inst0_vsew;                  
output  [31:0]  ibuf_ibdp_inst1;                       
output          ibuf_ibdp_inst1_bkpta;                 
output          ibuf_ibdp_inst1_bkptb;                 
output          ibuf_ibdp_inst1_ecc_err;               
output          ibuf_ibdp_inst1_expt_vld;              
output          ibuf_ibdp_inst1_fence;                 
output          ibuf_ibdp_inst1_high_expt;             
output          ibuf_ibdp_inst1_no_spec;               
output  [14:0]  ibuf_ibdp_inst1_pc;                    
output          ibuf_ibdp_inst1_split0;                
output          ibuf_ibdp_inst1_split1;                
output          ibuf_ibdp_inst1_valid;                 
output  [3 :0]  ibuf_ibdp_inst1_vec;                   
output  [7 :0]  ibuf_ibdp_inst1_vl;                    
output          ibuf_ibdp_inst1_vl_pred;               
output  [1 :0]  ibuf_ibdp_inst1_vlmul;                 
output  [2 :0]  ibuf_ibdp_inst1_vsew;                  
output  [31:0]  ibuf_ibdp_inst2;                       
output          ibuf_ibdp_inst2_bkpta;                 
output          ibuf_ibdp_inst2_bkptb;                 
output          ibuf_ibdp_inst2_ecc_err;               
output          ibuf_ibdp_inst2_expt_vld;              
output          ibuf_ibdp_inst2_fence;                 
output          ibuf_ibdp_inst2_high_expt;             
output          ibuf_ibdp_inst2_no_spec;               
output  [14:0]  ibuf_ibdp_inst2_pc;                    
output          ibuf_ibdp_inst2_split0;                
output          ibuf_ibdp_inst2_split1;                
output          ibuf_ibdp_inst2_valid;                 
output  [3 :0]  ibuf_ibdp_inst2_vec;                   
output  [7 :0]  ibuf_ibdp_inst2_vl;                    
output          ibuf_ibdp_inst2_vl_pred;               
output  [1 :0]  ibuf_ibdp_inst2_vlmul;                 
output  [2 :0]  ibuf_ibdp_inst2_vsew;                  
output          ibuf_lbuf_empty;                       

// &Regs; @24
reg     [2 :0]  bypass_way_half_num;                   
reg             bypass_way_inst0_32_start;             
reg             bypass_way_inst0_bkpta;                
reg             bypass_way_inst0_bkptb;                
reg     [31:0]  bypass_way_inst0_data;                 
reg             bypass_way_inst0_ecc_err;              
reg             bypass_way_inst0_expt;                 
reg             bypass_way_inst0_fence;                
reg             bypass_way_inst0_high_expt;            
reg             bypass_way_inst0_no_spec;              
reg     [14:0]  bypass_way_inst0_pc;                   
reg             bypass_way_inst0_split0;               
reg             bypass_way_inst0_split1;               
reg             bypass_way_inst0_valid;                
reg     [3 :0]  bypass_way_inst0_vec;                  
reg     [7 :0]  bypass_way_inst0_vl;                   
reg             bypass_way_inst0_vl_pred;              
reg     [1 :0]  bypass_way_inst0_vlmul;                
reg     [2 :0]  bypass_way_inst0_vsew;                 
reg             bypass_way_inst1_32_start;             
reg             bypass_way_inst1_bkpta;                
reg             bypass_way_inst1_bkptb;                
reg     [31:0]  bypass_way_inst1_data;                 
reg             bypass_way_inst1_ecc_err;              
reg             bypass_way_inst1_expt;                 
reg             bypass_way_inst1_fence;                
reg             bypass_way_inst1_high_expt;            
reg             bypass_way_inst1_no_spec;              
reg     [14:0]  bypass_way_inst1_pc;                   
reg             bypass_way_inst1_split0;               
reg             bypass_way_inst1_split1;               
reg             bypass_way_inst1_valid;                
reg     [3 :0]  bypass_way_inst1_vec;                  
reg     [7 :0]  bypass_way_inst1_vl;                   
reg             bypass_way_inst1_vl_pred;              
reg     [1 :0]  bypass_way_inst1_vlmul;                
reg     [2 :0]  bypass_way_inst1_vsew;                 
reg             bypass_way_inst2_bkpta;                
reg             bypass_way_inst2_bkptb;                
reg     [31:0]  bypass_way_inst2_data;                 
reg             bypass_way_inst2_ecc_err;              
reg             bypass_way_inst2_expt;                 
reg             bypass_way_inst2_fence;                
reg             bypass_way_inst2_high_expt;            
reg             bypass_way_inst2_no_spec;              
reg     [14:0]  bypass_way_inst2_pc;                   
reg             bypass_way_inst2_split0;               
reg             bypass_way_inst2_split1;               
reg             bypass_way_inst2_valid;                
reg     [3 :0]  bypass_way_inst2_vec;                  
reg     [7 :0]  bypass_way_inst2_vl;                   
reg             bypass_way_inst2_vl_pred;              
reg     [1 :0]  bypass_way_inst2_vlmul;                
reg     [2 :0]  bypass_way_inst2_vsew;                 
reg     [4 :0]  create_num_pre;                        
reg     [4 :0]  create_num_pre_bypass;                 
reg     [31:0]  create_pointer_pre;                    
reg     [8 :0]  ib_hn_create_vld_bypass;               
reg     [4 :0]  ibuf_create_num;                       
reg     [4 :0]  ibuf_create_num_pre;                   
reg     [31:0]  ibuf_create_pointer;                   
reg     [2 :0]  ibuf_pop3_half_num;                    
reg     [5 :0]  ibuf_pop3_retire_vld;                  
reg             ibuf_pop_inst0_bkpta;                  
reg             ibuf_pop_inst0_bkptb;                  
reg     [31:0]  ibuf_pop_inst0_data;                   
reg             ibuf_pop_inst0_ecc_err;                
reg             ibuf_pop_inst0_expt;                   
reg             ibuf_pop_inst0_fence;                  
reg             ibuf_pop_inst0_high_expt;              
reg             ibuf_pop_inst0_no_spec;                
reg     [14:0]  ibuf_pop_inst0_pc;                     
reg             ibuf_pop_inst0_split0;                 
reg             ibuf_pop_inst0_split1;                 
reg             ibuf_pop_inst0_valid;                  
reg     [3 :0]  ibuf_pop_inst0_vec;                    
reg     [7 :0]  ibuf_pop_inst0_vl;                     
reg             ibuf_pop_inst0_vl_pred;                
reg     [1 :0]  ibuf_pop_inst0_vlmul;                  
reg     [2 :0]  ibuf_pop_inst0_vsew;                   
reg             ibuf_pop_inst1_bkpta;                  
reg             ibuf_pop_inst1_bkptb;                  
reg     [31:0]  ibuf_pop_inst1_data;                   
reg             ibuf_pop_inst1_ecc_err;                
reg             ibuf_pop_inst1_expt;                   
reg             ibuf_pop_inst1_fence;                  
reg             ibuf_pop_inst1_high_expt;              
reg             ibuf_pop_inst1_no_spec;                
reg     [14:0]  ibuf_pop_inst1_pc;                     
reg             ibuf_pop_inst1_split0;                 
reg             ibuf_pop_inst1_split1;                 
reg             ibuf_pop_inst1_valid;                  
reg     [3 :0]  ibuf_pop_inst1_vec;                    
reg     [7 :0]  ibuf_pop_inst1_vl;                     
reg             ibuf_pop_inst1_vl_pred;                
reg     [1 :0]  ibuf_pop_inst1_vlmul;                  
reg     [2 :0]  ibuf_pop_inst1_vsew;                   
reg             ibuf_pop_inst2_bkpta;                  
reg             ibuf_pop_inst2_bkptb;                  
reg     [31:0]  ibuf_pop_inst2_data;                   
reg             ibuf_pop_inst2_ecc_err;                
reg             ibuf_pop_inst2_expt;                   
reg             ibuf_pop_inst2_fence;                  
reg             ibuf_pop_inst2_high_expt;              
reg             ibuf_pop_inst2_no_spec;                
reg     [14:0]  ibuf_pop_inst2_pc;                     
reg             ibuf_pop_inst2_split0;                 
reg             ibuf_pop_inst2_split1;                 
reg             ibuf_pop_inst2_valid;                  
reg     [3 :0]  ibuf_pop_inst2_vec;                    
reg     [7 :0]  ibuf_pop_inst2_vl;                     
reg             ibuf_pop_inst2_vl_pred;                
reg     [1 :0]  ibuf_pop_inst2_vlmul;                  
reg     [2 :0]  ibuf_pop_inst2_vsew;                   
reg     [4 :0]  ibuf_retire_num;                       
reg     [4 :0]  ibuf_retire_num_pre;                   
reg     [31:0]  ibuf_retire_pointer;                   
reg     [4 :0]  merge_way_inst1_num;                   
reg     [8 :0]  merge_way_inst_mask;                   
reg     [31:0]  merge_way_retire_pointer;              
reg     [15:0]  pop_h0_data;                           
reg     [14:0]  pop_h0_pc;                             
reg     [7 :0]  pop_h0_vl;                             
reg     [1 :0]  pop_h0_vlmul;                          
reg     [2 :0]  pop_h0_vsew;                           
reg     [15:0]  pop_h1_data;                           
reg     [14:0]  pop_h1_pc;                             
reg     [7 :0]  pop_h1_vl;                             
reg     [1 :0]  pop_h1_vlmul;                          
reg     [2 :0]  pop_h1_vsew;                           
reg     [15:0]  pop_h2_data;                           
reg     [14:0]  pop_h2_pc;                             
reg     [7 :0]  pop_h2_vl;                             
reg     [1 :0]  pop_h2_vlmul;                          
reg     [2 :0]  pop_h2_vsew;                           
reg     [15:0]  pop_h3_data;                           
reg     [14:0]  pop_h3_pc;                             
reg     [7 :0]  pop_h3_vl;                             
reg     [1 :0]  pop_h3_vlmul;                          
reg     [2 :0]  pop_h3_vsew;                           
reg     [15:0]  pop_h4_data;                           
reg     [14:0]  pop_h4_pc;                             
reg     [7 :0]  pop_h4_vl;                             
reg     [1 :0]  pop_h4_vlmul;                          
reg     [2 :0]  pop_h4_vsew;                           
reg     [15:0]  pop_h5_data;                           
reg     [4 :0]  retire_num_pre;                        
reg     [31:0]  retire_pointer_pre;                    
reg     [31:0]  retire_pointer_pre_bypass;             

// &Wires; @25
wire            bypass_vld;                            
wire            bypass_way_h0_32_start;                
wire            bypass_way_h0_acc_err;                 
wire            bypass_way_h0_bkpta;                   
wire            bypass_way_h0_bkptb;                   
wire    [15:0]  bypass_way_h0_data;                    
wire            bypass_way_h0_ecc_err;                 
wire            bypass_way_h0_expt;                    
wire            bypass_way_h0_fence;                   
wire            bypass_way_h0_high_expt;               
wire            bypass_way_h0_no_spec;                 
wire    [14:0]  bypass_way_h0_pc;                      
wire            bypass_way_h0_pgflt;                   
wire            bypass_way_h0_split0;                  
wire            bypass_way_h0_split1;                  
wire    [3 :0]  bypass_way_h0_vec;                     
wire    [7 :0]  bypass_way_h0_vl;                      
wire            bypass_way_h0_vl_pred;                 
wire            bypass_way_h0_vld;                     
wire    [1 :0]  bypass_way_h0_vlmul;                   
wire    [2 :0]  bypass_way_h0_vsew;                    
wire            bypass_way_h1_32_start;                
wire            bypass_way_h1_acc_err;                 
wire            bypass_way_h1_bkpta;                   
wire            bypass_way_h1_bkptb;                   
wire    [15:0]  bypass_way_h1_data;                    
wire            bypass_way_h1_ecc_err;                 
wire            bypass_way_h1_expt;                    
wire            bypass_way_h1_fence;                   
wire            bypass_way_h1_high_expt;               
wire            bypass_way_h1_no_spec;                 
wire    [14:0]  bypass_way_h1_pc;                      
wire            bypass_way_h1_pgflt;                   
wire            bypass_way_h1_split0;                  
wire            bypass_way_h1_split1;                  
wire    [3 :0]  bypass_way_h1_vec;                     
wire    [7 :0]  bypass_way_h1_vl;                      
wire            bypass_way_h1_vl_pred;                 
wire            bypass_way_h1_vld;                     
wire    [1 :0]  bypass_way_h1_vlmul;                   
wire    [2 :0]  bypass_way_h1_vsew;                    
wire            bypass_way_h2_32_start;                
wire            bypass_way_h2_acc_err;                 
wire            bypass_way_h2_bkpta;                   
wire            bypass_way_h2_bkptb;                   
wire    [15:0]  bypass_way_h2_data;                    
wire            bypass_way_h2_ecc_err;                 
wire            bypass_way_h2_expt;                    
wire            bypass_way_h2_fence;                   
wire            bypass_way_h2_high_expt;               
wire            bypass_way_h2_no_spec;                 
wire    [14:0]  bypass_way_h2_pc;                      
wire            bypass_way_h2_pgflt;                   
wire            bypass_way_h2_split0;                  
wire            bypass_way_h2_split1;                  
wire    [3 :0]  bypass_way_h2_vec;                     
wire    [7 :0]  bypass_way_h2_vl;                      
wire            bypass_way_h2_vl_pred;                 
wire            bypass_way_h2_vld;                     
wire    [1 :0]  bypass_way_h2_vlmul;                   
wire    [2 :0]  bypass_way_h2_vsew;                    
wire            bypass_way_h3_32_start;                
wire            bypass_way_h3_acc_err;                 
wire            bypass_way_h3_bkpta;                   
wire            bypass_way_h3_bkptb;                   
wire    [15:0]  bypass_way_h3_data;                    
wire            bypass_way_h3_ecc_err;                 
wire            bypass_way_h3_expt;                    
wire            bypass_way_h3_fence;                   
wire            bypass_way_h3_high_expt;               
wire            bypass_way_h3_no_spec;                 
wire    [14:0]  bypass_way_h3_pc;                      
wire            bypass_way_h3_pgflt;                   
wire            bypass_way_h3_split0;                  
wire            bypass_way_h3_split1;                  
wire    [3 :0]  bypass_way_h3_vec;                     
wire    [7 :0]  bypass_way_h3_vl;                      
wire            bypass_way_h3_vl_pred;                 
wire            bypass_way_h3_vld;                     
wire    [1 :0]  bypass_way_h3_vlmul;                   
wire    [2 :0]  bypass_way_h3_vsew;                    
wire            bypass_way_h4_32_start;                
wire            bypass_way_h4_acc_err;                 
wire            bypass_way_h4_bkpta;                   
wire            bypass_way_h4_bkptb;                   
wire    [15:0]  bypass_way_h4_data;                    
wire            bypass_way_h4_ecc_err;                 
wire            bypass_way_h4_expt;                    
wire            bypass_way_h4_fence;                   
wire            bypass_way_h4_high_expt;               
wire            bypass_way_h4_no_spec;                 
wire    [14:0]  bypass_way_h4_pc;                      
wire            bypass_way_h4_pgflt;                   
wire            bypass_way_h4_split0;                  
wire            bypass_way_h4_split1;                  
wire    [3 :0]  bypass_way_h4_vec;                     
wire    [7 :0]  bypass_way_h4_vl;                      
wire            bypass_way_h4_vl_pred;                 
wire            bypass_way_h4_vld;                     
wire    [1 :0]  bypass_way_h4_vlmul;                   
wire    [2 :0]  bypass_way_h4_vsew;                    
wire    [15:0]  bypass_way_h5_data;                    
wire            cp0_ifu_icg_en;                        
wire            cp0_yy_clk_en;                         
wire            cpurst_b;                              
wire    [31:0]  entry_32_start;                        
wire    [31:0]  entry_acc_err;                         
wire    [31:0]  entry_bkpta;                           
wire    [31:0]  entry_bkptb;                           
wire    [31:0]  entry_create;                          
wire    [31:0]  entry_create_32_start;                 
wire    [31:0]  entry_create_acc_err;                  
wire    [31:0]  entry_create_bkpta;                    
wire    [31:0]  entry_create_bkptb;                    
wire    [31:0]  entry_create_bypass_pre;               
wire    [31:0]  entry_create_fence;                    
wire    [31:0]  entry_create_high_expt;                
wire    [15:0]  entry_create_inst_data_0;              
wire    [15:0]  entry_create_inst_data_1;              
wire    [15:0]  entry_create_inst_data_10;             
wire    [15:0]  entry_create_inst_data_11;             
wire    [15:0]  entry_create_inst_data_12;             
wire    [15:0]  entry_create_inst_data_13;             
wire    [15:0]  entry_create_inst_data_14;             
wire    [15:0]  entry_create_inst_data_15;             
wire    [15:0]  entry_create_inst_data_16;             
wire    [15:0]  entry_create_inst_data_17;             
wire    [15:0]  entry_create_inst_data_18;             
wire    [15:0]  entry_create_inst_data_19;             
wire    [15:0]  entry_create_inst_data_2;              
wire    [15:0]  entry_create_inst_data_20;             
wire    [15:0]  entry_create_inst_data_21;             
wire    [15:0]  entry_create_inst_data_22;             
wire    [15:0]  entry_create_inst_data_23;             
wire    [15:0]  entry_create_inst_data_24;             
wire    [15:0]  entry_create_inst_data_25;             
wire    [15:0]  entry_create_inst_data_26;             
wire    [15:0]  entry_create_inst_data_27;             
wire    [15:0]  entry_create_inst_data_28;             
wire    [15:0]  entry_create_inst_data_29;             
wire    [15:0]  entry_create_inst_data_3;              
wire    [15:0]  entry_create_inst_data_30;             
wire    [15:0]  entry_create_inst_data_31;             
wire    [15:0]  entry_create_inst_data_4;              
wire    [15:0]  entry_create_inst_data_5;              
wire    [15:0]  entry_create_inst_data_6;              
wire    [15:0]  entry_create_inst_data_7;              
wire    [15:0]  entry_create_inst_data_8;              
wire    [15:0]  entry_create_inst_data_9;              
wire    [31:0]  entry_create_no_spec;                  
wire    [31:0]  entry_create_nopass_pre;               
wire    [31:0]  entry_create_nopass_pre_for_gateclk;   
wire    [14:0]  entry_create_pc_0;                     
wire    [14:0]  entry_create_pc_1;                     
wire    [14:0]  entry_create_pc_10;                    
wire    [14:0]  entry_create_pc_11;                    
wire    [14:0]  entry_create_pc_12;                    
wire    [14:0]  entry_create_pc_13;                    
wire    [14:0]  entry_create_pc_14;                    
wire    [14:0]  entry_create_pc_15;                    
wire    [14:0]  entry_create_pc_16;                    
wire    [14:0]  entry_create_pc_17;                    
wire    [14:0]  entry_create_pc_18;                    
wire    [14:0]  entry_create_pc_19;                    
wire    [14:0]  entry_create_pc_2;                     
wire    [14:0]  entry_create_pc_20;                    
wire    [14:0]  entry_create_pc_21;                    
wire    [14:0]  entry_create_pc_22;                    
wire    [14:0]  entry_create_pc_23;                    
wire    [14:0]  entry_create_pc_24;                    
wire    [14:0]  entry_create_pc_25;                    
wire    [14:0]  entry_create_pc_26;                    
wire    [14:0]  entry_create_pc_27;                    
wire    [14:0]  entry_create_pc_28;                    
wire    [14:0]  entry_create_pc_29;                    
wire    [14:0]  entry_create_pc_3;                     
wire    [14:0]  entry_create_pc_30;                    
wire    [14:0]  entry_create_pc_31;                    
wire    [14:0]  entry_create_pc_4;                     
wire    [14:0]  entry_create_pc_5;                     
wire    [14:0]  entry_create_pc_6;                     
wire    [14:0]  entry_create_pc_7;                     
wire    [14:0]  entry_create_pc_8;                     
wire    [14:0]  entry_create_pc_9;                     
wire    [31:0]  entry_create_pgflt;                    
wire    [31:0]  entry_create_pre;                      
wire    [31:0]  entry_create_split0;                   
wire    [31:0]  entry_create_split1;                   
wire    [7 :0]  entry_create_vl_0;                     
wire    [7 :0]  entry_create_vl_1;                     
wire    [7 :0]  entry_create_vl_10;                    
wire    [7 :0]  entry_create_vl_11;                    
wire    [7 :0]  entry_create_vl_12;                    
wire    [7 :0]  entry_create_vl_13;                    
wire    [7 :0]  entry_create_vl_14;                    
wire    [7 :0]  entry_create_vl_15;                    
wire    [7 :0]  entry_create_vl_16;                    
wire    [7 :0]  entry_create_vl_17;                    
wire    [7 :0]  entry_create_vl_18;                    
wire    [7 :0]  entry_create_vl_19;                    
wire    [7 :0]  entry_create_vl_2;                     
wire    [7 :0]  entry_create_vl_20;                    
wire    [7 :0]  entry_create_vl_21;                    
wire    [7 :0]  entry_create_vl_22;                    
wire    [7 :0]  entry_create_vl_23;                    
wire    [7 :0]  entry_create_vl_24;                    
wire    [7 :0]  entry_create_vl_25;                    
wire    [7 :0]  entry_create_vl_26;                    
wire    [7 :0]  entry_create_vl_27;                    
wire    [7 :0]  entry_create_vl_28;                    
wire    [7 :0]  entry_create_vl_29;                    
wire    [7 :0]  entry_create_vl_3;                     
wire    [7 :0]  entry_create_vl_30;                    
wire    [7 :0]  entry_create_vl_31;                    
wire    [7 :0]  entry_create_vl_4;                     
wire    [7 :0]  entry_create_vl_5;                     
wire    [7 :0]  entry_create_vl_6;                     
wire    [7 :0]  entry_create_vl_7;                     
wire    [7 :0]  entry_create_vl_8;                     
wire    [7 :0]  entry_create_vl_9;                     
wire    [31:0]  entry_create_vl_pred;                  
wire    [1 :0]  entry_create_vlmul_0;                  
wire    [1 :0]  entry_create_vlmul_1;                  
wire    [1 :0]  entry_create_vlmul_10;                 
wire    [1 :0]  entry_create_vlmul_11;                 
wire    [1 :0]  entry_create_vlmul_12;                 
wire    [1 :0]  entry_create_vlmul_13;                 
wire    [1 :0]  entry_create_vlmul_14;                 
wire    [1 :0]  entry_create_vlmul_15;                 
wire    [1 :0]  entry_create_vlmul_16;                 
wire    [1 :0]  entry_create_vlmul_17;                 
wire    [1 :0]  entry_create_vlmul_18;                 
wire    [1 :0]  entry_create_vlmul_19;                 
wire    [1 :0]  entry_create_vlmul_2;                  
wire    [1 :0]  entry_create_vlmul_20;                 
wire    [1 :0]  entry_create_vlmul_21;                 
wire    [1 :0]  entry_create_vlmul_22;                 
wire    [1 :0]  entry_create_vlmul_23;                 
wire    [1 :0]  entry_create_vlmul_24;                 
wire    [1 :0]  entry_create_vlmul_25;                 
wire    [1 :0]  entry_create_vlmul_26;                 
wire    [1 :0]  entry_create_vlmul_27;                 
wire    [1 :0]  entry_create_vlmul_28;                 
wire    [1 :0]  entry_create_vlmul_29;                 
wire    [1 :0]  entry_create_vlmul_3;                  
wire    [1 :0]  entry_create_vlmul_30;                 
wire    [1 :0]  entry_create_vlmul_31;                 
wire    [1 :0]  entry_create_vlmul_4;                  
wire    [1 :0]  entry_create_vlmul_5;                  
wire    [1 :0]  entry_create_vlmul_6;                  
wire    [1 :0]  entry_create_vlmul_7;                  
wire    [1 :0]  entry_create_vlmul_8;                  
wire    [1 :0]  entry_create_vlmul_9;                  
wire    [2 :0]  entry_create_vsew_0;                   
wire    [2 :0]  entry_create_vsew_1;                   
wire    [2 :0]  entry_create_vsew_10;                  
wire    [2 :0]  entry_create_vsew_11;                  
wire    [2 :0]  entry_create_vsew_12;                  
wire    [2 :0]  entry_create_vsew_13;                  
wire    [2 :0]  entry_create_vsew_14;                  
wire    [2 :0]  entry_create_vsew_15;                  
wire    [2 :0]  entry_create_vsew_16;                  
wire    [2 :0]  entry_create_vsew_17;                  
wire    [2 :0]  entry_create_vsew_18;                  
wire    [2 :0]  entry_create_vsew_19;                  
wire    [2 :0]  entry_create_vsew_2;                   
wire    [2 :0]  entry_create_vsew_20;                  
wire    [2 :0]  entry_create_vsew_21;                  
wire    [2 :0]  entry_create_vsew_22;                  
wire    [2 :0]  entry_create_vsew_23;                  
wire    [2 :0]  entry_create_vsew_24;                  
wire    [2 :0]  entry_create_vsew_25;                  
wire    [2 :0]  entry_create_vsew_26;                  
wire    [2 :0]  entry_create_vsew_27;                  
wire    [2 :0]  entry_create_vsew_28;                  
wire    [2 :0]  entry_create_vsew_29;                  
wire    [2 :0]  entry_create_vsew_3;                   
wire    [2 :0]  entry_create_vsew_30;                  
wire    [2 :0]  entry_create_vsew_31;                  
wire    [2 :0]  entry_create_vsew_4;                   
wire    [2 :0]  entry_create_vsew_5;                   
wire    [2 :0]  entry_create_vsew_6;                   
wire    [2 :0]  entry_create_vsew_7;                   
wire    [2 :0]  entry_create_vsew_8;                   
wire    [2 :0]  entry_create_vsew_9;                   
wire    [31:0]  entry_data_create;                     
wire    [31:0]  entry_data_create_clk_en;              
wire    [31:0]  entry_fence;                           
wire    [31:0]  entry_high_expt;                       
wire    [15:0]  entry_inst_data_0;                     
wire    [15:0]  entry_inst_data_1;                     
wire    [15:0]  entry_inst_data_10;                    
wire    [15:0]  entry_inst_data_11;                    
wire    [15:0]  entry_inst_data_12;                    
wire    [15:0]  entry_inst_data_13;                    
wire    [15:0]  entry_inst_data_14;                    
wire    [15:0]  entry_inst_data_15;                    
wire    [15:0]  entry_inst_data_16;                    
wire    [15:0]  entry_inst_data_17;                    
wire    [15:0]  entry_inst_data_18;                    
wire    [15:0]  entry_inst_data_19;                    
wire    [15:0]  entry_inst_data_2;                     
wire    [15:0]  entry_inst_data_20;                    
wire    [15:0]  entry_inst_data_21;                    
wire    [15:0]  entry_inst_data_22;                    
wire    [15:0]  entry_inst_data_23;                    
wire    [15:0]  entry_inst_data_24;                    
wire    [15:0]  entry_inst_data_25;                    
wire    [15:0]  entry_inst_data_26;                    
wire    [15:0]  entry_inst_data_27;                    
wire    [15:0]  entry_inst_data_28;                    
wire    [15:0]  entry_inst_data_29;                    
wire    [15:0]  entry_inst_data_3;                     
wire    [15:0]  entry_inst_data_30;                    
wire    [15:0]  entry_inst_data_31;                    
wire    [15:0]  entry_inst_data_4;                     
wire    [15:0]  entry_inst_data_5;                     
wire    [15:0]  entry_inst_data_6;                     
wire    [15:0]  entry_inst_data_7;                     
wire    [15:0]  entry_inst_data_8;                     
wire    [15:0]  entry_inst_data_9;                     
wire    [31:0]  entry_no_spec;                         
wire    [14:0]  entry_pc_0;                            
wire    [14:0]  entry_pc_1;                            
wire    [14:0]  entry_pc_10;                           
wire    [14:0]  entry_pc_11;                           
wire    [14:0]  entry_pc_12;                           
wire    [14:0]  entry_pc_13;                           
wire    [14:0]  entry_pc_14;                           
wire    [14:0]  entry_pc_15;                           
wire    [14:0]  entry_pc_16;                           
wire    [14:0]  entry_pc_17;                           
wire    [14:0]  entry_pc_18;                           
wire    [14:0]  entry_pc_19;                           
wire    [14:0]  entry_pc_2;                            
wire    [14:0]  entry_pc_20;                           
wire    [14:0]  entry_pc_21;                           
wire    [14:0]  entry_pc_22;                           
wire    [14:0]  entry_pc_23;                           
wire    [14:0]  entry_pc_24;                           
wire    [14:0]  entry_pc_25;                           
wire    [14:0]  entry_pc_26;                           
wire    [14:0]  entry_pc_27;                           
wire    [14:0]  entry_pc_28;                           
wire    [14:0]  entry_pc_29;                           
wire    [14:0]  entry_pc_3;                            
wire    [14:0]  entry_pc_30;                           
wire    [14:0]  entry_pc_31;                           
wire    [14:0]  entry_pc_4;                            
wire    [14:0]  entry_pc_5;                            
wire    [14:0]  entry_pc_6;                            
wire    [14:0]  entry_pc_7;                            
wire    [14:0]  entry_pc_8;                            
wire    [14:0]  entry_pc_9;                            
wire    [31:0]  entry_pc_create;                       
wire    [31:0]  entry_pc_create_bypass_pre;            
wire    [31:0]  entry_pc_create_clk_en;                
wire    [31:0]  entry_pc_create_nopass_pre_for_gateclk; 
wire    [31:0]  entry_pgflt;                           
wire    [31:0]  entry_retire;                          
wire            entry_spe_data_vld;                    
wire    [31:0]  entry_split0;                          
wire    [31:0]  entry_split1;                          
wire    [7 :0]  entry_vl_0;                            
wire    [7 :0]  entry_vl_1;                            
wire    [7 :0]  entry_vl_10;                           
wire    [7 :0]  entry_vl_11;                           
wire    [7 :0]  entry_vl_12;                           
wire    [7 :0]  entry_vl_13;                           
wire    [7 :0]  entry_vl_14;                           
wire    [7 :0]  entry_vl_15;                           
wire    [7 :0]  entry_vl_16;                           
wire    [7 :0]  entry_vl_17;                           
wire    [7 :0]  entry_vl_18;                           
wire    [7 :0]  entry_vl_19;                           
wire    [7 :0]  entry_vl_2;                            
wire    [7 :0]  entry_vl_20;                           
wire    [7 :0]  entry_vl_21;                           
wire    [7 :0]  entry_vl_22;                           
wire    [7 :0]  entry_vl_23;                           
wire    [7 :0]  entry_vl_24;                           
wire    [7 :0]  entry_vl_25;                           
wire    [7 :0]  entry_vl_26;                           
wire    [7 :0]  entry_vl_27;                           
wire    [7 :0]  entry_vl_28;                           
wire    [7 :0]  entry_vl_29;                           
wire    [7 :0]  entry_vl_3;                            
wire    [7 :0]  entry_vl_30;                           
wire    [7 :0]  entry_vl_31;                           
wire    [7 :0]  entry_vl_4;                            
wire    [7 :0]  entry_vl_5;                            
wire    [7 :0]  entry_vl_6;                            
wire    [7 :0]  entry_vl_7;                            
wire    [7 :0]  entry_vl_8;                            
wire    [7 :0]  entry_vl_9;                            
wire    [31:0]  entry_vl_pred;                         
wire    [31:0]  entry_vld;                             
wire    [31:0]  entry_vld_create_clk_en;               
wire    [31:0]  entry_vld_retire_clk_en;               
wire    [1 :0]  entry_vlmul_0;                         
wire    [1 :0]  entry_vlmul_1;                         
wire    [1 :0]  entry_vlmul_10;                        
wire    [1 :0]  entry_vlmul_11;                        
wire    [1 :0]  entry_vlmul_12;                        
wire    [1 :0]  entry_vlmul_13;                        
wire    [1 :0]  entry_vlmul_14;                        
wire    [1 :0]  entry_vlmul_15;                        
wire    [1 :0]  entry_vlmul_16;                        
wire    [1 :0]  entry_vlmul_17;                        
wire    [1 :0]  entry_vlmul_18;                        
wire    [1 :0]  entry_vlmul_19;                        
wire    [1 :0]  entry_vlmul_2;                         
wire    [1 :0]  entry_vlmul_20;                        
wire    [1 :0]  entry_vlmul_21;                        
wire    [1 :0]  entry_vlmul_22;                        
wire    [1 :0]  entry_vlmul_23;                        
wire    [1 :0]  entry_vlmul_24;                        
wire    [1 :0]  entry_vlmul_25;                        
wire    [1 :0]  entry_vlmul_26;                        
wire    [1 :0]  entry_vlmul_27;                        
wire    [1 :0]  entry_vlmul_28;                        
wire    [1 :0]  entry_vlmul_29;                        
wire    [1 :0]  entry_vlmul_3;                         
wire    [1 :0]  entry_vlmul_30;                        
wire    [1 :0]  entry_vlmul_31;                        
wire    [1 :0]  entry_vlmul_4;                         
wire    [1 :0]  entry_vlmul_5;                         
wire    [1 :0]  entry_vlmul_6;                         
wire    [1 :0]  entry_vlmul_7;                         
wire    [1 :0]  entry_vlmul_8;                         
wire    [1 :0]  entry_vlmul_9;                         
wire    [2 :0]  entry_vsew_0;                          
wire    [2 :0]  entry_vsew_1;                          
wire    [2 :0]  entry_vsew_10;                         
wire    [2 :0]  entry_vsew_11;                         
wire    [2 :0]  entry_vsew_12;                         
wire    [2 :0]  entry_vsew_13;                         
wire    [2 :0]  entry_vsew_14;                         
wire    [2 :0]  entry_vsew_15;                         
wire    [2 :0]  entry_vsew_16;                         
wire    [2 :0]  entry_vsew_17;                         
wire    [2 :0]  entry_vsew_18;                         
wire    [2 :0]  entry_vsew_19;                         
wire    [2 :0]  entry_vsew_2;                          
wire    [2 :0]  entry_vsew_20;                         
wire    [2 :0]  entry_vsew_21;                         
wire    [2 :0]  entry_vsew_22;                         
wire    [2 :0]  entry_vsew_23;                         
wire    [2 :0]  entry_vsew_24;                         
wire    [2 :0]  entry_vsew_25;                         
wire    [2 :0]  entry_vsew_26;                         
wire    [2 :0]  entry_vsew_27;                         
wire    [2 :0]  entry_vsew_28;                         
wire    [2 :0]  entry_vsew_29;                         
wire    [2 :0]  entry_vsew_3;                          
wire    [2 :0]  entry_vsew_30;                         
wire    [2 :0]  entry_vsew_31;                         
wire    [2 :0]  entry_vsew_4;                          
wire    [2 :0]  entry_vsew_5;                          
wire    [2 :0]  entry_vsew_6;                          
wire    [2 :0]  entry_vsew_7;                          
wire    [2 :0]  entry_vsew_8;                          
wire    [2 :0]  entry_vsew_9;                          
wire            forever_cpuclk;                        
wire    [15:0]  ib_h0_data;                            
wire    [14:0]  ib_h0_pc;                              
wire    [7 :0]  ib_h0_vl;                              
wire    [1 :0]  ib_h0_vlmul;                           
wire    [2 :0]  ib_h0_vsew;                            
wire    [15:0]  ib_h1_data;                            
wire    [14:0]  ib_h1_pc;                              
wire    [7 :0]  ib_h1_vl;                              
wire    [1 :0]  ib_h1_vlmul;                           
wire    [2 :0]  ib_h1_vsew;                            
wire    [15:0]  ib_h2_data;                            
wire    [14:0]  ib_h2_pc;                              
wire    [7 :0]  ib_h2_vl;                              
wire    [1 :0]  ib_h2_vlmul;                           
wire    [2 :0]  ib_h2_vsew;                            
wire    [15:0]  ib_h3_data;                            
wire    [14:0]  ib_h3_pc;                              
wire    [7 :0]  ib_h3_vl;                              
wire    [1 :0]  ib_h3_vlmul;                           
wire    [2 :0]  ib_h3_vsew;                            
wire    [15:0]  ib_h4_data;                            
wire    [14:0]  ib_h4_pc;                              
wire    [7 :0]  ib_h4_vl;                              
wire    [1 :0]  ib_h4_vlmul;                           
wire    [2 :0]  ib_h4_vsew;                            
wire    [15:0]  ib_h5_data;                            
wire    [14:0]  ib_h5_pc;                              
wire    [7 :0]  ib_h5_vl;                              
wire    [1 :0]  ib_h5_vlmul;                           
wire    [2 :0]  ib_h5_vsew;                            
wire    [15:0]  ib_h6_data;                            
wire    [14:0]  ib_h6_pc;                              
wire    [7 :0]  ib_h6_vl;                              
wire    [1 :0]  ib_h6_vlmul;                           
wire    [2 :0]  ib_h6_vsew;                            
wire    [15:0]  ib_h7_data;                            
wire    [14:0]  ib_h7_pc;                              
wire    [7 :0]  ib_h7_vl;                              
wire    [1 :0]  ib_h7_vlmul;                           
wire    [2 :0]  ib_h7_vsew;                            
wire    [15:0]  ib_h8_data;                            
wire    [14:0]  ib_h8_pc;                              
wire    [7 :0]  ib_h8_vl;                              
wire    [1 :0]  ib_h8_vlmul;                           
wire    [2 :0]  ib_h8_vsew;                            
wire    [8 :0]  ib_hn_32_start;                        
wire    [8 :0]  ib_hn_acc_err;                         
wire    [8 :0]  ib_hn_bkpta;                           
wire    [8 :0]  ib_hn_bkptb;                           
wire    [8 :0]  ib_hn_create_vld;                      
wire    [8 :0]  ib_hn_fence;                           
wire    [8 :0]  ib_hn_high_expt;                       
wire    [8 :0]  ib_hn_ldst;                            
wire    [8 :0]  ib_hn_no_spec;                         
wire    [8 :0]  ib_hn_pgflt;                           
wire    [8 :0]  ib_hn_split0;                          
wire    [8 :0]  ib_hn_split1;                          
wire    [8 :0]  ib_hn_vl_pred;                         
wire            ibctrl_ibuf_bypass_not_select;         
wire            ibctrl_ibuf_create_vld;                
wire            ibctrl_ibuf_data_vld;                  
wire            ibctrl_ibuf_flush;                     
wire            ibctrl_ibuf_merge_vld;                 
wire            ibctrl_ibuf_retire_vld;                
wire            ibdp_ibuf_h0_32_start;                 
wire            ibdp_ibuf_h0_bkpta;                    
wire            ibdp_ibuf_h0_bkptb;                    
wire    [15:0]  ibdp_ibuf_h0_data;                     
wire            ibdp_ibuf_h0_fence;                    
wire            ibdp_ibuf_h0_high_expt;                
wire            ibdp_ibuf_h0_ldst;                     
wire            ibdp_ibuf_h0_no_spec;                  
wire    [14:0]  ibdp_ibuf_h0_pc;                       
wire            ibdp_ibuf_h0_spe_vld;                  
wire            ibdp_ibuf_h0_split0;                   
wire            ibdp_ibuf_h0_split1;                   
wire    [7 :0]  ibdp_ibuf_h0_vl;                       
wire            ibdp_ibuf_h0_vl_pred;                  
wire            ibdp_ibuf_h0_vld;                      
wire    [1 :0]  ibdp_ibuf_h0_vlmul;                    
wire    [2 :0]  ibdp_ibuf_h0_vsew;                     
wire    [15:0]  ibdp_ibuf_h1_data;                     
wire    [14:0]  ibdp_ibuf_h1_pc;                       
wire    [7 :0]  ibdp_ibuf_h1_vl;                       
wire    [1 :0]  ibdp_ibuf_h1_vlmul;                    
wire    [2 :0]  ibdp_ibuf_h1_vsew;                     
wire    [15:0]  ibdp_ibuf_h2_data;                     
wire    [14:0]  ibdp_ibuf_h2_pc;                       
wire    [7 :0]  ibdp_ibuf_h2_vl;                       
wire    [1 :0]  ibdp_ibuf_h2_vlmul;                    
wire    [2 :0]  ibdp_ibuf_h2_vsew;                     
wire    [15:0]  ibdp_ibuf_h3_data;                     
wire    [14:0]  ibdp_ibuf_h3_pc;                       
wire    [7 :0]  ibdp_ibuf_h3_vl;                       
wire    [1 :0]  ibdp_ibuf_h3_vlmul;                    
wire    [2 :0]  ibdp_ibuf_h3_vsew;                     
wire    [15:0]  ibdp_ibuf_h4_data;                     
wire    [14:0]  ibdp_ibuf_h4_pc;                       
wire    [7 :0]  ibdp_ibuf_h4_vl;                       
wire    [1 :0]  ibdp_ibuf_h4_vlmul;                    
wire    [2 :0]  ibdp_ibuf_h4_vsew;                     
wire    [15:0]  ibdp_ibuf_h5_data;                     
wire    [14:0]  ibdp_ibuf_h5_pc;                       
wire    [7 :0]  ibdp_ibuf_h5_vl;                       
wire    [1 :0]  ibdp_ibuf_h5_vlmul;                    
wire    [2 :0]  ibdp_ibuf_h5_vsew;                     
wire    [15:0]  ibdp_ibuf_h6_data;                     
wire    [14:0]  ibdp_ibuf_h6_pc;                       
wire    [7 :0]  ibdp_ibuf_h6_vl;                       
wire    [1 :0]  ibdp_ibuf_h6_vlmul;                    
wire    [2 :0]  ibdp_ibuf_h6_vsew;                     
wire    [15:0]  ibdp_ibuf_h7_data;                     
wire    [14:0]  ibdp_ibuf_h7_pc;                       
wire    [7 :0]  ibdp_ibuf_h7_vl;                       
wire    [1 :0]  ibdp_ibuf_h7_vlmul;                    
wire    [2 :0]  ibdp_ibuf_h7_vsew;                     
wire    [15:0]  ibdp_ibuf_h8_data;                     
wire    [14:0]  ibdp_ibuf_h8_pc;                       
wire    [7 :0]  ibdp_ibuf_h8_vl;                       
wire    [1 :0]  ibdp_ibuf_h8_vlmul;                    
wire    [2 :0]  ibdp_ibuf_h8_vsew;                     
wire    [3 :0]  ibdp_ibuf_half_vld_num;                
wire    [7 :0]  ibdp_ibuf_hn_32_start;                 
wire    [7 :0]  ibdp_ibuf_hn_acc_err;                  
wire            ibdp_ibuf_hn_acc_err_vld;              
wire    [7 :0]  ibdp_ibuf_hn_bkpta;                    
wire            ibdp_ibuf_hn_bkpta_vld;                
wire    [7 :0]  ibdp_ibuf_hn_bkptb;                    
wire            ibdp_ibuf_hn_bkptb_vld;                
wire    [7 :0]  ibdp_ibuf_hn_fence;                    
wire    [7 :0]  ibdp_ibuf_hn_high_expt;                
wire    [7 :0]  ibdp_ibuf_hn_ldst;                     
wire    [7 :0]  ibdp_ibuf_hn_mmu_acc_deny;             
wire            ibdp_ibuf_hn_mmu_acc_deny_vld;         
wire    [7 :0]  ibdp_ibuf_hn_no_spec;                  
wire            ibdp_ibuf_hn_no_spec_vld;              
wire    [7 :0]  ibdp_ibuf_hn_pgflt;                    
wire            ibdp_ibuf_hn_pgflt_vld;                
wire    [7 :0]  ibdp_ibuf_hn_split0;                   
wire    [7 :0]  ibdp_ibuf_hn_split1;                   
wire    [7 :0]  ibdp_ibuf_hn_vl_pred;                  
wire    [7 :0]  ibdp_ibuf_hn_vld;                      
wire    [31:0]  ibuf_create_pointer0;                  
wire    [31:0]  ibuf_create_pointer1;                  
wire    [31:0]  ibuf_create_pointer2;                  
wire    [31:0]  ibuf_create_pointer3;                  
wire    [31:0]  ibuf_create_pointer4;                  
wire    [31:0]  ibuf_create_pointer5;                  
wire    [31:0]  ibuf_create_pointer6;                  
wire    [31:0]  ibuf_create_pointer7;                  
wire    [31:0]  ibuf_create_pointer8;                  
wire            ibuf_create_pointer_update_clk;        
wire            ibuf_create_pointer_update_clk_en;     
wire            ibuf_create_vld;                       
wire            ibuf_empty;                            
wire            ibuf_flush;                            
wire            ibuf_full;                             
wire            ibuf_ibctrl_empty;                     
wire            ibuf_ibctrl_stall;                     
wire    [31:0]  ibuf_ibdp_bypass_inst0;                
wire            ibuf_ibdp_bypass_inst0_bkpta;          
wire            ibuf_ibdp_bypass_inst0_bkptb;          
wire            ibuf_ibdp_bypass_inst0_ecc_err;        
wire            ibuf_ibdp_bypass_inst0_expt;           
wire            ibuf_ibdp_bypass_inst0_fence;          
wire            ibuf_ibdp_bypass_inst0_high_expt;      
wire            ibuf_ibdp_bypass_inst0_no_spec;        
wire    [14:0]  ibuf_ibdp_bypass_inst0_pc;             
wire            ibuf_ibdp_bypass_inst0_split0;         
wire            ibuf_ibdp_bypass_inst0_split1;         
wire            ibuf_ibdp_bypass_inst0_valid;          
wire    [3 :0]  ibuf_ibdp_bypass_inst0_vec;            
wire    [7 :0]  ibuf_ibdp_bypass_inst0_vl;             
wire            ibuf_ibdp_bypass_inst0_vl_pred;        
wire    [1 :0]  ibuf_ibdp_bypass_inst0_vlmul;          
wire    [2 :0]  ibuf_ibdp_bypass_inst0_vsew;           
wire    [31:0]  ibuf_ibdp_bypass_inst1;                
wire            ibuf_ibdp_bypass_inst1_bkpta;          
wire            ibuf_ibdp_bypass_inst1_bkptb;          
wire            ibuf_ibdp_bypass_inst1_ecc_err;        
wire            ibuf_ibdp_bypass_inst1_expt;           
wire            ibuf_ibdp_bypass_inst1_fence;          
wire            ibuf_ibdp_bypass_inst1_high_expt;      
wire            ibuf_ibdp_bypass_inst1_no_spec;        
wire    [14:0]  ibuf_ibdp_bypass_inst1_pc;             
wire            ibuf_ibdp_bypass_inst1_split0;         
wire            ibuf_ibdp_bypass_inst1_split1;         
wire            ibuf_ibdp_bypass_inst1_valid;          
wire    [3 :0]  ibuf_ibdp_bypass_inst1_vec;            
wire    [7 :0]  ibuf_ibdp_bypass_inst1_vl;             
wire            ibuf_ibdp_bypass_inst1_vl_pred;        
wire    [1 :0]  ibuf_ibdp_bypass_inst1_vlmul;          
wire    [2 :0]  ibuf_ibdp_bypass_inst1_vsew;           
wire    [31:0]  ibuf_ibdp_bypass_inst2;                
wire            ibuf_ibdp_bypass_inst2_bkpta;          
wire            ibuf_ibdp_bypass_inst2_bkptb;          
wire            ibuf_ibdp_bypass_inst2_ecc_err;        
wire            ibuf_ibdp_bypass_inst2_expt;           
wire            ibuf_ibdp_bypass_inst2_fence;          
wire            ibuf_ibdp_bypass_inst2_high_expt;      
wire            ibuf_ibdp_bypass_inst2_no_spec;        
wire    [14:0]  ibuf_ibdp_bypass_inst2_pc;             
wire            ibuf_ibdp_bypass_inst2_split0;         
wire            ibuf_ibdp_bypass_inst2_split1;         
wire            ibuf_ibdp_bypass_inst2_valid;          
wire    [3 :0]  ibuf_ibdp_bypass_inst2_vec;            
wire    [7 :0]  ibuf_ibdp_bypass_inst2_vl;             
wire            ibuf_ibdp_bypass_inst2_vl_pred;        
wire    [1 :0]  ibuf_ibdp_bypass_inst2_vlmul;          
wire    [2 :0]  ibuf_ibdp_bypass_inst2_vsew;           
wire    [31:0]  ibuf_ibdp_inst0;                       
wire            ibuf_ibdp_inst0_bkpta;                 
wire            ibuf_ibdp_inst0_bkptb;                 
wire            ibuf_ibdp_inst0_ecc_err;               
wire            ibuf_ibdp_inst0_expt_vld;              
wire            ibuf_ibdp_inst0_fence;                 
wire            ibuf_ibdp_inst0_high_expt;             
wire            ibuf_ibdp_inst0_no_spec;               
wire    [14:0]  ibuf_ibdp_inst0_pc;                    
wire            ibuf_ibdp_inst0_split0;                
wire            ibuf_ibdp_inst0_split1;                
wire            ibuf_ibdp_inst0_valid;                 
wire    [3 :0]  ibuf_ibdp_inst0_vec;                   
wire    [7 :0]  ibuf_ibdp_inst0_vl;                    
wire            ibuf_ibdp_inst0_vl_pred;               
wire    [1 :0]  ibuf_ibdp_inst0_vlmul;                 
wire    [2 :0]  ibuf_ibdp_inst0_vsew;                  
wire    [31:0]  ibuf_ibdp_inst1;                       
wire            ibuf_ibdp_inst1_bkpta;                 
wire            ibuf_ibdp_inst1_bkptb;                 
wire            ibuf_ibdp_inst1_ecc_err;               
wire            ibuf_ibdp_inst1_expt_vld;              
wire            ibuf_ibdp_inst1_fence;                 
wire            ibuf_ibdp_inst1_high_expt;             
wire            ibuf_ibdp_inst1_no_spec;               
wire    [14:0]  ibuf_ibdp_inst1_pc;                    
wire            ibuf_ibdp_inst1_split0;                
wire            ibuf_ibdp_inst1_split1;                
wire            ibuf_ibdp_inst1_valid;                 
wire    [3 :0]  ibuf_ibdp_inst1_vec;                   
wire    [7 :0]  ibuf_ibdp_inst1_vl;                    
wire            ibuf_ibdp_inst1_vl_pred;               
wire    [1 :0]  ibuf_ibdp_inst1_vlmul;                 
wire    [2 :0]  ibuf_ibdp_inst1_vsew;                  
wire    [31:0]  ibuf_ibdp_inst2;                       
wire            ibuf_ibdp_inst2_bkpta;                 
wire            ibuf_ibdp_inst2_bkptb;                 
wire            ibuf_ibdp_inst2_ecc_err;               
wire            ibuf_ibdp_inst2_expt_vld;              
wire            ibuf_ibdp_inst2_fence;                 
wire            ibuf_ibdp_inst2_high_expt;             
wire            ibuf_ibdp_inst2_no_spec;               
wire    [14:0]  ibuf_ibdp_inst2_pc;                    
wire            ibuf_ibdp_inst2_split0;                
wire            ibuf_ibdp_inst2_split1;                
wire            ibuf_ibdp_inst2_valid;                 
wire    [3 :0]  ibuf_ibdp_inst2_vec;                   
wire    [7 :0]  ibuf_ibdp_inst2_vl;                    
wire            ibuf_ibdp_inst2_vl_pred;               
wire    [1 :0]  ibuf_ibdp_inst2_vlmul;                 
wire    [2 :0]  ibuf_ibdp_inst2_vsew;                  
wire            ibuf_lbuf_empty;                       
wire    [31:0]  ibuf_merge_retire_pointer;             
wire    [8 :0]  ibuf_nopass_merge_mask;                
wire            ibuf_num_clk;                          
wire            ibuf_num_clk_en;                       
wire            ibuf_num_updt;                         
wire    [5 :0]  ibuf_pop_retire_vld;                   
wire    [31:0]  ibuf_retire_pointer0;                  
wire    [31:0]  ibuf_retire_pointer1;                  
wire    [31:0]  ibuf_retire_pointer2;                  
wire    [31:0]  ibuf_retire_pointer3;                  
wire    [31:0]  ibuf_retire_pointer4;                  
wire    [31:0]  ibuf_retire_pointer5;                  
wire            ibuf_retire_pointer_update_clk;        
wire            ibuf_retire_pointer_update_clk_en;     
wire            ibuf_retire_vld;                       
wire    [4 :0]  merge_half_num;                        
wire    [31:0]  merge_way_inst0;                       
wire            merge_way_inst0_bkpta;                 
wire            merge_way_inst0_bkptb;                 
wire            merge_way_inst0_ecc_err;               
wire            merge_way_inst0_expt;                  
wire            merge_way_inst0_fence;                 
wire            merge_way_inst0_high_expt;             
wire            merge_way_inst0_no_spec;               
wire    [14:0]  merge_way_inst0_pc;                    
wire            merge_way_inst0_sel;                   
wire            merge_way_inst0_split0;                
wire            merge_way_inst0_split1;                
wire            merge_way_inst0_valid;                 
wire    [3 :0]  merge_way_inst0_vec;                   
wire    [7 :0]  merge_way_inst0_vl;                    
wire            merge_way_inst0_vl_pred;               
wire    [1 :0]  merge_way_inst0_vlmul;                 
wire    [2 :0]  merge_way_inst0_vsew;                  
wire    [31:0]  merge_way_inst1;                       
wire            merge_way_inst1_bkpta;                 
wire            merge_way_inst1_bkptb;                 
wire            merge_way_inst1_ecc_err;               
wire            merge_way_inst1_expt;                  
wire            merge_way_inst1_fence;                 
wire            merge_way_inst1_high_expt;             
wire            merge_way_inst1_no_spec;               
wire    [14:0]  merge_way_inst1_pc;                    
wire            merge_way_inst1_sel;                   
wire            merge_way_inst1_split0;                
wire            merge_way_inst1_split1;                
wire            merge_way_inst1_valid;                 
wire    [3 :0]  merge_way_inst1_vec;                   
wire    [7 :0]  merge_way_inst1_vl;                    
wire            merge_way_inst1_vl_pred;               
wire    [1 :0]  merge_way_inst1_vlmul;                 
wire    [2 :0]  merge_way_inst1_vsew;                  
wire            pad_yy_icg_scan_en;                    
wire            pop_h0_32_start;                       
wire            pop_h0_acc_err;                        
wire            pop_h0_bkpta;                          
wire            pop_h0_bkptb;                          
wire            pop_h0_ecc_err;                        
wire            pop_h0_expt;                           
wire            pop_h0_fence;                          
wire            pop_h0_high_expt;                      
wire            pop_h0_no_spec;                        
wire            pop_h0_pgflt;                          
wire            pop_h0_split0;                         
wire            pop_h0_split1;                         
wire    [3 :0]  pop_h0_vec;                            
wire            pop_h0_vl_pred;                        
wire            pop_h0_vld;                            
wire            pop_h1_32_start;                       
wire            pop_h1_acc_err;                        
wire            pop_h1_bkpta;                          
wire            pop_h1_bkptb;                          
wire            pop_h1_ecc_err;                        
wire            pop_h1_expt;                           
wire            pop_h1_fence;                          
wire            pop_h1_high_expt;                      
wire            pop_h1_no_spec;                        
wire            pop_h1_pgflt;                          
wire            pop_h1_split0;                         
wire            pop_h1_split1;                         
wire    [3 :0]  pop_h1_vec;                            
wire            pop_h1_vl_pred;                        
wire            pop_h1_vld;                            
wire            pop_h2_32_start;                       
wire            pop_h2_acc_err;                        
wire            pop_h2_bkpta;                          
wire            pop_h2_bkptb;                          
wire            pop_h2_ecc_err;                        
wire            pop_h2_expt;                           
wire            pop_h2_fence;                          
wire            pop_h2_high_expt;                      
wire            pop_h2_no_spec;                        
wire            pop_h2_pgflt;                          
wire            pop_h2_split0;                         
wire            pop_h2_split1;                         
wire    [3 :0]  pop_h2_vec;                            
wire            pop_h2_vl_pred;                        
wire            pop_h2_vld;                            
wire            pop_h3_32_start;                       
wire            pop_h3_acc_err;                        
wire            pop_h3_bkpta;                          
wire            pop_h3_bkptb;                          
wire            pop_h3_ecc_err;                        
wire            pop_h3_expt;                           
wire            pop_h3_fence;                          
wire            pop_h3_high_expt;                      
wire            pop_h3_no_spec;                        
wire            pop_h3_pgflt;                          
wire            pop_h3_split0;                         
wire            pop_h3_split1;                         
wire    [3 :0]  pop_h3_vec;                            
wire            pop_h3_vl_pred;                        
wire            pop_h3_vld;                            
wire            pop_h4_32_start;                       
wire            pop_h4_acc_err;                        
wire            pop_h4_bkpta;                          
wire            pop_h4_bkptb;                          
wire            pop_h4_ecc_err;                        
wire            pop_h4_expt;                           
wire            pop_h4_fence;                          
wire            pop_h4_high_expt;                      
wire            pop_h4_no_spec;                        
wire            pop_h4_pgflt;                          
wire            pop_h4_split0;                         
wire            pop_h4_split1;                         
wire    [3 :0]  pop_h4_vec;                            
wire            pop_h4_vl_pred;                        
wire            pop_h4_vld;                            
wire            retire_vld_0;                          
wire            retire_vld_1;                          
wire            retire_vld_2;                          
wire            retire_vld_3;                          
wire            retire_vld_4;                          
wire            retire_vld_5;                          


//==========================================================
//                  Instance 32 Entries
//==========================================================
// &ConnRule(s/_x$/[0]/); @30
// &ConnRule(s/_v$/_0/); @31
// &Instance("ct_ifu_ibuf_entry","x_ct_ifu_ibuf_entry_0"); @32
ct_ifu_ibuf_entry  x_ct_ifu_ibuf_entry_0 (
  .cp0_ifu_icg_en              (cp0_ifu_icg_en             ),
  .cp0_yy_clk_en               (cp0_yy_clk_en              ),
  .cpurst_b                    (cpurst_b                   ),
  .entry_32_start_x            (entry_32_start[0]          ),
  .entry_acc_err_x             (entry_acc_err[0]           ),
  .entry_bkpta_x               (entry_bkpta[0]             ),
  .entry_bkptb_x               (entry_bkptb[0]             ),
  .entry_create_32_start_x     (entry_create_32_start[0]   ),
  .entry_create_acc_err_x      (entry_create_acc_err[0]    ),
  .entry_create_bkpta_x        (entry_create_bkpta[0]      ),
  .entry_create_bkptb_x        (entry_create_bkptb[0]      ),
  .entry_create_fence_x        (entry_create_fence[0]      ),
  .entry_create_high_expt_x    (entry_create_high_expt[0]  ),
  .entry_create_inst_data_v    (entry_create_inst_data_0   ),
  .entry_create_no_spec_x      (entry_create_no_spec[0]    ),
  .entry_create_pc_v           (entry_create_pc_0          ),
  .entry_create_pgflt_x        (entry_create_pgflt[0]      ),
  .entry_create_split0_x       (entry_create_split0[0]     ),
  .entry_create_split1_x       (entry_create_split1[0]     ),
  .entry_create_vl_pred_x      (entry_create_vl_pred[0]    ),
  .entry_create_vl_v           (entry_create_vl_0          ),
  .entry_create_vlmul_v        (entry_create_vlmul_0       ),
  .entry_create_vsew_v         (entry_create_vsew_0        ),
  .entry_create_x              (entry_create[0]            ),
  .entry_data_create_clk_en_x  (entry_data_create_clk_en[0]),
  .entry_data_create_x         (entry_data_create[0]       ),
  .entry_fence_x               (entry_fence[0]             ),
  .entry_high_expt_x           (entry_high_expt[0]         ),
  .entry_inst_data_v           (entry_inst_data_0          ),
  .entry_no_spec_x             (entry_no_spec[0]           ),
  .entry_pc_create_clk_en_x    (entry_pc_create_clk_en[0]  ),
  .entry_pc_create_x           (entry_pc_create[0]         ),
  .entry_pc_v                  (entry_pc_0                 ),
  .entry_pgflt_x               (entry_pgflt[0]             ),
  .entry_retire_x              (entry_retire[0]            ),
  .entry_spe_data_vld          (entry_spe_data_vld         ),
  .entry_split0_x              (entry_split0[0]            ),
  .entry_split1_x              (entry_split1[0]            ),
  .entry_vl_pred_x             (entry_vl_pred[0]           ),
  .entry_vl_v                  (entry_vl_0                 ),
  .entry_vld_create_clk_en_x   (entry_vld_create_clk_en[0] ),
  .entry_vld_retire_clk_en_x   (entry_vld_retire_clk_en[0] ),
  .entry_vld_x                 (entry_vld[0]               ),
  .entry_vlmul_v               (entry_vlmul_0              ),
  .entry_vsew_v                (entry_vsew_0               ),
  .forever_cpuclk              (forever_cpuclk             ),
  .ibuf_flush                  (ibuf_flush                 ),
  .pad_yy_icg_scan_en          (pad_yy_icg_scan_en         )
);


// &ConnRule(s/_x$/[1]/); @34
// &ConnRule(s/_v$/_1/); @35
// &Instance("ct_ifu_ibuf_entry","x_ct_ifu_ibuf_entry_1"); @36
ct_ifu_ibuf_entry  x_ct_ifu_ibuf_entry_1 (
  .cp0_ifu_icg_en              (cp0_ifu_icg_en             ),
  .cp0_yy_clk_en               (cp0_yy_clk_en              ),
  .cpurst_b                    (cpurst_b                   ),
  .entry_32_start_x            (entry_32_start[1]          ),
  .entry_acc_err_x             (entry_acc_err[1]           ),
  .entry_bkpta_x               (entry_bkpta[1]             ),
  .entry_bkptb_x               (entry_bkptb[1]             ),
  .entry_create_32_start_x     (entry_create_32_start[1]   ),
  .entry_create_acc_err_x      (entry_create_acc_err[1]    ),
  .entry_create_bkpta_x        (entry_create_bkpta[1]      ),
  .entry_create_bkptb_x        (entry_create_bkptb[1]      ),
  .entry_create_fence_x        (entry_create_fence[1]      ),
  .entry_create_high_expt_x    (entry_create_high_expt[1]  ),
  .entry_create_inst_data_v    (entry_create_inst_data_1   ),
  .entry_create_no_spec_x      (entry_create_no_spec[1]    ),
  .entry_create_pc_v           (entry_create_pc_1          ),
  .entry_create_pgflt_x        (entry_create_pgflt[1]      ),
  .entry_create_split0_x       (entry_create_split0[1]     ),
  .entry_create_split1_x       (entry_create_split1[1]     ),
  .entry_create_vl_pred_x      (entry_create_vl_pred[1]    ),
  .entry_create_vl_v           (entry_create_vl_1          ),
  .entry_create_vlmul_v        (entry_create_vlmul_1       ),
  .entry_create_vsew_v         (entry_create_vsew_1        ),
  .entry_create_x              (entry_create[1]            ),
  .entry_data_create_clk_en_x  (entry_data_create_clk_en[1]),
  .entry_data_create_x         (entry_data_create[1]       ),
  .entry_fence_x               (entry_fence[1]             ),
  .entry_high_expt_x           (entry_high_expt[1]         ),
  .entry_inst_data_v           (entry_inst_data_1          ),
  .entry_no_spec_x             (entry_no_spec[1]           ),
  .entry_pc_create_clk_en_x    (entry_pc_create_clk_en[1]  ),
  .entry_pc_create_x           (entry_pc_create[1]         ),
  .entry_pc_v                  (entry_pc_1                 ),
  .entry_pgflt_x               (entry_pgflt[1]             ),
  .entry_retire_x              (entry_retire[1]            ),
  .entry_spe_data_vld          (entry_spe_data_vld         ),
  .entry_split0_x              (entry_split0[1]            ),
  .entry_split1_x              (entry_split1[1]            ),
  .entry_vl_pred_x             (entry_vl_pred[1]           ),
  .entry_vl_v                  (entry_vl_1                 ),
  .entry_vld_create_clk_en_x   (entry_vld_create_clk_en[1] ),
  .entry_vld_retire_clk_en_x   (entry_vld_retire_clk_en[1] ),
  .entry_vld_x                 (entry_vld[1]               ),
  .entry_vlmul_v               (entry_vlmul_1              ),
  .entry_vsew_v                (entry_vsew_1               ),
  .forever_cpuclk              (forever_cpuclk             ),
  .ibuf_flush                  (ibuf_flush                 ),
  .pad_yy_icg_scan_en          (pad_yy_icg_scan_en         )
);


// &ConnRule(s/_x$/[2]/); @38
// &ConnRule(s/_v$/_2/); @39
// &Instance("ct_ifu_ibuf_entry","x_ct_ifu_ibuf_entry_2"); @40
ct_ifu_ibuf_entry  x_ct_ifu_ibuf_entry_2 (
  .cp0_ifu_icg_en              (cp0_ifu_icg_en             ),
  .cp0_yy_clk_en               (cp0_yy_clk_en              ),
  .cpurst_b                    (cpurst_b                   ),
  .entry_32_start_x            (entry_32_start[2]          ),
  .entry_acc_err_x             (entry_acc_err[2]           ),
  .entry_bkpta_x               (entry_bkpta[2]             ),
  .entry_bkptb_x               (entry_bkptb[2]             ),
  .entry_create_32_start_x     (entry_create_32_start[2]   ),
  .entry_create_acc_err_x      (entry_create_acc_err[2]    ),
  .entry_create_bkpta_x        (entry_create_bkpta[2]      ),
  .entry_create_bkptb_x        (entry_create_bkptb[2]      ),
  .entry_create_fence_x        (entry_create_fence[2]      ),
  .entry_create_high_expt_x    (entry_create_high_expt[2]  ),
  .entry_create_inst_data_v    (entry_create_inst_data_2   ),
  .entry_create_no_spec_x      (entry_create_no_spec[2]    ),
  .entry_create_pc_v           (entry_create_pc_2          ),
  .entry_create_pgflt_x        (entry_create_pgflt[2]      ),
  .entry_create_split0_x       (entry_create_split0[2]     ),
  .entry_create_split1_x       (entry_create_split1[2]     ),
  .entry_create_vl_pred_x      (entry_create_vl_pred[2]    ),
  .entry_create_vl_v           (entry_create_vl_2          ),
  .entry_create_vlmul_v        (entry_create_vlmul_2       ),
  .entry_create_vsew_v         (entry_create_vsew_2        ),
  .entry_create_x              (entry_create[2]            ),
  .entry_data_create_clk_en_x  (entry_data_create_clk_en[2]),
  .entry_data_create_x         (entry_data_create[2]       ),
  .entry_fence_x               (entry_fence[2]             ),
  .entry_high_expt_x           (entry_high_expt[2]         ),
  .entry_inst_data_v           (entry_inst_data_2          ),
  .entry_no_spec_x             (entry_no_spec[2]           ),
  .entry_pc_create_clk_en_x    (entry_pc_create_clk_en[2]  ),
  .entry_pc_create_x           (entry_pc_create[2]         ),
  .entry_pc_v                  (entry_pc_2                 ),
  .entry_pgflt_x               (entry_pgflt[2]             ),
  .entry_retire_x              (entry_retire[2]            ),
  .entry_spe_data_vld          (entry_spe_data_vld         ),
  .entry_split0_x              (entry_split0[2]            ),
  .entry_split1_x              (entry_split1[2]            ),
  .entry_vl_pred_x             (entry_vl_pred[2]           ),
  .entry_vl_v                  (entry_vl_2                 ),
  .entry_vld_create_clk_en_x   (entry_vld_create_clk_en[2] ),
  .entry_vld_retire_clk_en_x   (entry_vld_retire_clk_en[2] ),
  .entry_vld_x                 (entry_vld[2]               ),
  .entry_vlmul_v               (entry_vlmul_2              ),
  .entry_vsew_v                (entry_vsew_2               ),
  .forever_cpuclk              (forever_cpuclk             ),
  .ibuf_flush                  (ibuf_flush                 ),
  .pad_yy_icg_scan_en          (pad_yy_icg_scan_en         )
);


// &ConnRule(s/_x$/[3]/); @42
// &ConnRule(s/_v$/_3/); @43
// &Instance("ct_ifu_ibuf_entry","x_ct_ifu_ibuf_entry_3"); @44
ct_ifu_ibuf_entry  x_ct_ifu_ibuf_entry_3 (
  .cp0_ifu_icg_en              (cp0_ifu_icg_en             ),
  .cp0_yy_clk_en               (cp0_yy_clk_en              ),
  .cpurst_b                    (cpurst_b                   ),
  .entry_32_start_x            (entry_32_start[3]          ),
  .entry_acc_err_x             (entry_acc_err[3]           ),
  .entry_bkpta_x               (entry_bkpta[3]             ),
  .entry_bkptb_x               (entry_bkptb[3]             ),
  .entry_create_32_start_x     (entry_create_32_start[3]   ),
  .entry_create_acc_err_x      (entry_create_acc_err[3]    ),
  .entry_create_bkpta_x        (entry_create_bkpta[3]      ),
  .entry_create_bkptb_x        (entry_create_bkptb[3]      ),
  .entry_create_fence_x        (entry_create_fence[3]      ),
  .entry_create_high_expt_x    (entry_create_high_expt[3]  ),
  .entry_create_inst_data_v    (entry_create_inst_data_3   ),
  .entry_create_no_spec_x      (entry_create_no_spec[3]    ),
  .entry_create_pc_v           (entry_create_pc_3          ),
  .entry_create_pgflt_x        (entry_create_pgflt[3]      ),
  .entry_create_split0_x       (entry_create_split0[3]     ),
  .entry_create_split1_x       (entry_create_split1[3]     ),
  .entry_create_vl_pred_x      (entry_create_vl_pred[3]    ),
  .entry_create_vl_v           (entry_create_vl_3          ),
  .entry_create_vlmul_v        (entry_create_vlmul_3       ),
  .entry_create_vsew_v         (entry_create_vsew_3        ),
  .entry_create_x              (entry_create[3]            ),
  .entry_data_create_clk_en_x  (entry_data_create_clk_en[3]),
  .entry_data_create_x         (entry_data_create[3]       ),
  .entry_fence_x               (entry_fence[3]             ),
  .entry_high_expt_x           (entry_high_expt[3]         ),
  .entry_inst_data_v           (entry_inst_data_3          ),
  .entry_no_spec_x             (entry_no_spec[3]           ),
  .entry_pc_create_clk_en_x    (entry_pc_create_clk_en[3]  ),
  .entry_pc_create_x           (entry_pc_create[3]         ),
  .entry_pc_v                  (entry_pc_3                 ),
  .entry_pgflt_x               (entry_pgflt[3]             ),
  .entry_retire_x              (entry_retire[3]            ),
  .entry_spe_data_vld          (entry_spe_data_vld         ),
  .entry_split0_x              (entry_split0[3]            ),
  .entry_split1_x              (entry_split1[3]            ),
  .entry_vl_pred_x             (entry_vl_pred[3]           ),
  .entry_vl_v                  (entry_vl_3                 ),
  .entry_vld_create_clk_en_x   (entry_vld_create_clk_en[3] ),
  .entry_vld_retire_clk_en_x   (entry_vld_retire_clk_en[3] ),
  .entry_vld_x                 (entry_vld[3]               ),
  .entry_vlmul_v               (entry_vlmul_3              ),
  .entry_vsew_v                (entry_vsew_3               ),
  .forever_cpuclk              (forever_cpuclk             ),
  .ibuf_flush                  (ibuf_flush                 ),
  .pad_yy_icg_scan_en          (pad_yy_icg_scan_en         )
);


// &ConnRule(s/_x$/[4]/); @46
// &ConnRule(s/_v$/_4/); @47
// &Instance("ct_ifu_ibuf_entry","x_ct_ifu_ibuf_entry_4"); @48
ct_ifu_ibuf_entry  x_ct_ifu_ibuf_entry_4 (
  .cp0_ifu_icg_en              (cp0_ifu_icg_en             ),
  .cp0_yy_clk_en               (cp0_yy_clk_en              ),
  .cpurst_b                    (cpurst_b                   ),
  .entry_32_start_x            (entry_32_start[4]          ),
  .entry_acc_err_x             (entry_acc_err[4]           ),
  .entry_bkpta_x               (entry_bkpta[4]             ),
  .entry_bkptb_x               (entry_bkptb[4]             ),
  .entry_create_32_start_x     (entry_create_32_start[4]   ),
  .entry_create_acc_err_x      (entry_create_acc_err[4]    ),
  .entry_create_bkpta_x        (entry_create_bkpta[4]      ),
  .entry_create_bkptb_x        (entry_create_bkptb[4]      ),
  .entry_create_fence_x        (entry_create_fence[4]      ),
  .entry_create_high_expt_x    (entry_create_high_expt[4]  ),
  .entry_create_inst_data_v    (entry_create_inst_data_4   ),
  .entry_create_no_spec_x      (entry_create_no_spec[4]    ),
  .entry_create_pc_v           (entry_create_pc_4          ),
  .entry_create_pgflt_x        (entry_create_pgflt[4]      ),
  .entry_create_split0_x       (entry_create_split0[4]     ),
  .entry_create_split1_x       (entry_create_split1[4]     ),
  .entry_create_vl_pred_x      (entry_create_vl_pred[4]    ),
  .entry_create_vl_v           (entry_create_vl_4          ),
  .entry_create_vlmul_v        (entry_create_vlmul_4       ),
  .entry_create_vsew_v         (entry_create_vsew_4        ),
  .entry_create_x              (entry_create[4]            ),
  .entry_data_create_clk_en_x  (entry_data_create_clk_en[4]),
  .entry_data_create_x         (entry_data_create[4]       ),
  .entry_fence_x               (entry_fence[4]             ),
  .entry_high_expt_x           (entry_high_expt[4]         ),
  .entry_inst_data_v           (entry_inst_data_4          ),
  .entry_no_spec_x             (entry_no_spec[4]           ),
  .entry_pc_create_clk_en_x    (entry_pc_create_clk_en[4]  ),
  .entry_pc_create_x           (entry_pc_create[4]         ),
  .entry_pc_v                  (entry_pc_4                 ),
  .entry_pgflt_x               (entry_pgflt[4]             ),
  .entry_retire_x              (entry_retire[4]            ),
  .entry_spe_data_vld          (entry_spe_data_vld         ),
  .entry_split0_x              (entry_split0[4]            ),
  .entry_split1_x              (entry_split1[4]            ),
  .entry_vl_pred_x             (entry_vl_pred[4]           ),
  .entry_vl_v                  (entry_vl_4                 ),
  .entry_vld_create_clk_en_x   (entry_vld_create_clk_en[4] ),
  .entry_vld_retire_clk_en_x   (entry_vld_retire_clk_en[4] ),
  .entry_vld_x                 (entry_vld[4]               ),
  .entry_vlmul_v               (entry_vlmul_4              ),
  .entry_vsew_v                (entry_vsew_4               ),
  .forever_cpuclk              (forever_cpuclk             ),
  .ibuf_flush                  (ibuf_flush                 ),
  .pad_yy_icg_scan_en          (pad_yy_icg_scan_en         )
);


// &ConnRule(s/_x$/[5]/); @50
// &ConnRule(s/_v$/_5/); @51
// &Instance("ct_ifu_ibuf_entry","x_ct_ifu_ibuf_entry_5"); @52
ct_ifu_ibuf_entry  x_ct_ifu_ibuf_entry_5 (
  .cp0_ifu_icg_en              (cp0_ifu_icg_en             ),
  .cp0_yy_clk_en               (cp0_yy_clk_en              ),
  .cpurst_b                    (cpurst_b                   ),
  .entry_32_start_x            (entry_32_start[5]          ),
  .entry_acc_err_x             (entry_acc_err[5]           ),
  .entry_bkpta_x               (entry_bkpta[5]             ),
  .entry_bkptb_x               (entry_bkptb[5]             ),
  .entry_create_32_start_x     (entry_create_32_start[5]   ),
  .entry_create_acc_err_x      (entry_create_acc_err[5]    ),
  .entry_create_bkpta_x        (entry_create_bkpta[5]      ),
  .entry_create_bkptb_x        (entry_create_bkptb[5]      ),
  .entry_create_fence_x        (entry_create_fence[5]      ),
  .entry_create_high_expt_x    (entry_create_high_expt[5]  ),
  .entry_create_inst_data_v    (entry_create_inst_data_5   ),
  .entry_create_no_spec_x      (entry_create_no_spec[5]    ),
  .entry_create_pc_v           (entry_create_pc_5          ),
  .entry_create_pgflt_x        (entry_create_pgflt[5]      ),
  .entry_create_split0_x       (entry_create_split0[5]     ),
  .entry_create_split1_x       (entry_create_split1[5]     ),
  .entry_create_vl_pred_x      (entry_create_vl_pred[5]    ),
  .entry_create_vl_v           (entry_create_vl_5          ),
  .entry_create_vlmul_v        (entry_create_vlmul_5       ),
  .entry_create_vsew_v         (entry_create_vsew_5        ),
  .entry_create_x              (entry_create[5]            ),
  .entry_data_create_clk_en_x  (entry_data_create_clk_en[5]),
  .entry_data_create_x         (entry_data_create[5]       ),
  .entry_fence_x               (entry_fence[5]             ),
  .entry_high_expt_x           (entry_high_expt[5]         ),
  .entry_inst_data_v           (entry_inst_data_5          ),
  .entry_no_spec_x             (entry_no_spec[5]           ),
  .entry_pc_create_clk_en_x    (entry_pc_create_clk_en[5]  ),
  .entry_pc_create_x           (entry_pc_create[5]         ),
  .entry_pc_v                  (entry_pc_5                 ),
  .entry_pgflt_x               (entry_pgflt[5]             ),
  .entry_retire_x              (entry_retire[5]            ),
  .entry_spe_data_vld          (entry_spe_data_vld         ),
  .entry_split0_x              (entry_split0[5]            ),
  .entry_split1_x              (entry_split1[5]            ),
  .entry_vl_pred_x             (entry_vl_pred[5]           ),
  .entry_vl_v                  (entry_vl_5                 ),
  .entry_vld_create_clk_en_x   (entry_vld_create_clk_en[5] ),
  .entry_vld_retire_clk_en_x   (entry_vld_retire_clk_en[5] ),
  .entry_vld_x                 (entry_vld[5]               ),
  .entry_vlmul_v               (entry_vlmul_5              ),
  .entry_vsew_v                (entry_vsew_5               ),
  .forever_cpuclk              (forever_cpuclk             ),
  .ibuf_flush                  (ibuf_flush                 ),
  .pad_yy_icg_scan_en          (pad_yy_icg_scan_en         )
);


// &ConnRule(s/_x$/[6]/); @54
// &ConnRule(s/_v$/_6/); @55
// &Instance("ct_ifu_ibuf_entry","x_ct_ifu_ibuf_entry_6"); @56
ct_ifu_ibuf_entry  x_ct_ifu_ibuf_entry_6 (
  .cp0_ifu_icg_en              (cp0_ifu_icg_en             ),
  .cp0_yy_clk_en               (cp0_yy_clk_en              ),
  .cpurst_b                    (cpurst_b                   ),
  .entry_32_start_x            (entry_32_start[6]          ),
  .entry_acc_err_x             (entry_acc_err[6]           ),
  .entry_bkpta_x               (entry_bkpta[6]             ),
  .entry_bkptb_x               (entry_bkptb[6]             ),
  .entry_create_32_start_x     (entry_create_32_start[6]   ),
  .entry_create_acc_err_x      (entry_create_acc_err[6]    ),
  .entry_create_bkpta_x        (entry_create_bkpta[6]      ),
  .entry_create_bkptb_x        (entry_create_bkptb[6]      ),
  .entry_create_fence_x        (entry_create_fence[6]      ),
  .entry_create_high_expt_x    (entry_create_high_expt[6]  ),
  .entry_create_inst_data_v    (entry_create_inst_data_6   ),
  .entry_create_no_spec_x      (entry_create_no_spec[6]    ),
  .entry_create_pc_v           (entry_create_pc_6          ),
  .entry_create_pgflt_x        (entry_create_pgflt[6]      ),
  .entry_create_split0_x       (entry_create_split0[6]     ),
  .entry_create_split1_x       (entry_create_split1[6]     ),
  .entry_create_vl_pred_x      (entry_create_vl_pred[6]    ),
  .entry_create_vl_v           (entry_create_vl_6          ),
  .entry_create_vlmul_v        (entry_create_vlmul_6       ),
  .entry_create_vsew_v         (entry_create_vsew_6        ),
  .entry_create_x              (entry_create[6]            ),
  .entry_data_create_clk_en_x  (entry_data_create_clk_en[6]),
  .entry_data_create_x         (entry_data_create[6]       ),
  .entry_fence_x               (entry_fence[6]             ),
  .entry_high_expt_x           (entry_high_expt[6]         ),
  .entry_inst_data_v           (entry_inst_data_6          ),
  .entry_no_spec_x             (entry_no_spec[6]           ),
  .entry_pc_create_clk_en_x    (entry_pc_create_clk_en[6]  ),
  .entry_pc_create_x           (entry_pc_create[6]         ),
  .entry_pc_v                  (entry_pc_6                 ),
  .entry_pgflt_x               (entry_pgflt[6]             ),
  .entry_retire_x              (entry_retire[6]            ),
  .entry_spe_data_vld          (entry_spe_data_vld         ),
  .entry_split0_x              (entry_split0[6]            ),
  .entry_split1_x              (entry_split1[6]            ),
  .entry_vl_pred_x             (entry_vl_pred[6]           ),
  .entry_vl_v                  (entry_vl_6                 ),
  .entry_vld_create_clk_en_x   (entry_vld_create_clk_en[6] ),
  .entry_vld_retire_clk_en_x   (entry_vld_retire_clk_en[6] ),
  .entry_vld_x                 (entry_vld[6]               ),
  .entry_vlmul_v               (entry_vlmul_6              ),
  .entry_vsew_v                (entry_vsew_6               ),
  .forever_cpuclk              (forever_cpuclk             ),
  .ibuf_flush                  (ibuf_flush                 ),
  .pad_yy_icg_scan_en          (pad_yy_icg_scan_en         )
);


// &ConnRule(s/_x$/[7]/); @58
// &ConnRule(s/_v$/_7/); @59
// &Instance("ct_ifu_ibuf_entry","x_ct_ifu_ibuf_entry_7"); @60
ct_ifu_ibuf_entry  x_ct_ifu_ibuf_entry_7 (
  .cp0_ifu_icg_en              (cp0_ifu_icg_en             ),
  .cp0_yy_clk_en               (cp0_yy_clk_en              ),
  .cpurst_b                    (cpurst_b                   ),
  .entry_32_start_x            (entry_32_start[7]          ),
  .entry_acc_err_x             (entry_acc_err[7]           ),
  .entry_bkpta_x               (entry_bkpta[7]             ),
  .entry_bkptb_x               (entry_bkptb[7]             ),
  .entry_create_32_start_x     (entry_create_32_start[7]   ),
  .entry_create_acc_err_x      (entry_create_acc_err[7]    ),
  .entry_create_bkpta_x        (entry_create_bkpta[7]      ),
  .entry_create_bkptb_x        (entry_create_bkptb[7]      ),
  .entry_create_fence_x        (entry_create_fence[7]      ),
  .entry_create_high_expt_x    (entry_create_high_expt[7]  ),
  .entry_create_inst_data_v    (entry_create_inst_data_7   ),
  .entry_create_no_spec_x      (entry_create_no_spec[7]    ),
  .entry_create_pc_v           (entry_create_pc_7          ),
  .entry_create_pgflt_x        (entry_create_pgflt[7]      ),
  .entry_create_split0_x       (entry_create_split0[7]     ),
  .entry_create_split1_x       (entry_create_split1[7]     ),
  .entry_create_vl_pred_x      (entry_create_vl_pred[7]    ),
  .entry_create_vl_v           (entry_create_vl_7          ),
  .entry_create_vlmul_v        (entry_create_vlmul_7       ),
  .entry_create_vsew_v         (entry_create_vsew_7        ),
  .entry_create_x              (entry_create[7]            ),
  .entry_data_create_clk_en_x  (entry_data_create_clk_en[7]),
  .entry_data_create_x         (entry_data_create[7]       ),
  .entry_fence_x               (entry_fence[7]             ),
  .entry_high_expt_x           (entry_high_expt[7]         ),
  .entry_inst_data_v           (entry_inst_data_7          ),
  .entry_no_spec_x             (entry_no_spec[7]           ),
  .entry_pc_create_clk_en_x    (entry_pc_create_clk_en[7]  ),
  .entry_pc_create_x           (entry_pc_create[7]         ),
  .entry_pc_v                  (entry_pc_7                 ),
  .entry_pgflt_x               (entry_pgflt[7]             ),
  .entry_retire_x              (entry_retire[7]            ),
  .entry_spe_data_vld          (entry_spe_data_vld         ),
  .entry_split0_x              (entry_split0[7]            ),
  .entry_split1_x              (entry_split1[7]            ),
  .entry_vl_pred_x             (entry_vl_pred[7]           ),
  .entry_vl_v                  (entry_vl_7                 ),
  .entry_vld_create_clk_en_x   (entry_vld_create_clk_en[7] ),
  .entry_vld_retire_clk_en_x   (entry_vld_retire_clk_en[7] ),
  .entry_vld_x                 (entry_vld[7]               ),
  .entry_vlmul_v               (entry_vlmul_7              ),
  .entry_vsew_v                (entry_vsew_7               ),
  .forever_cpuclk              (forever_cpuclk             ),
  .ibuf_flush                  (ibuf_flush                 ),
  .pad_yy_icg_scan_en          (pad_yy_icg_scan_en         )
);


// &ConnRule(s/_x$/[8]/); @62
// &ConnRule(s/_v$/_8/); @63
// &Instance("ct_ifu_ibuf_entry","x_ct_ifu_ibuf_entry_8"); @64
ct_ifu_ibuf_entry  x_ct_ifu_ibuf_entry_8 (
  .cp0_ifu_icg_en              (cp0_ifu_icg_en             ),
  .cp0_yy_clk_en               (cp0_yy_clk_en              ),
  .cpurst_b                    (cpurst_b                   ),
  .entry_32_start_x            (entry_32_start[8]          ),
  .entry_acc_err_x             (entry_acc_err[8]           ),
  .entry_bkpta_x               (entry_bkpta[8]             ),
  .entry_bkptb_x               (entry_bkptb[8]             ),
  .entry_create_32_start_x     (entry_create_32_start[8]   ),
  .entry_create_acc_err_x      (entry_create_acc_err[8]    ),
  .entry_create_bkpta_x        (entry_create_bkpta[8]      ),
  .entry_create_bkptb_x        (entry_create_bkptb[8]      ),
  .entry_create_fence_x        (entry_create_fence[8]      ),
  .entry_create_high_expt_x    (entry_create_high_expt[8]  ),
  .entry_create_inst_data_v    (entry_create_inst_data_8   ),
  .entry_create_no_spec_x      (entry_create_no_spec[8]    ),
  .entry_create_pc_v           (entry_create_pc_8          ),
  .entry_create_pgflt_x        (entry_create_pgflt[8]      ),
  .entry_create_split0_x       (entry_create_split0[8]     ),
  .entry_create_split1_x       (entry_create_split1[8]     ),
  .entry_create_vl_pred_x      (entry_create_vl_pred[8]    ),
  .entry_create_vl_v           (entry_create_vl_8          ),
  .entry_create_vlmul_v        (entry_create_vlmul_8       ),
  .entry_create_vsew_v         (entry_create_vsew_8        ),
  .entry_create_x              (entry_create[8]            ),
  .entry_data_create_clk_en_x  (entry_data_create_clk_en[8]),
  .entry_data_create_x         (entry_data_create[8]       ),
  .entry_fence_x               (entry_fence[8]             ),
  .entry_high_expt_x           (entry_high_expt[8]         ),
  .entry_inst_data_v           (entry_inst_data_8          ),
  .entry_no_spec_x             (entry_no_spec[8]           ),
  .entry_pc_create_clk_en_x    (entry_pc_create_clk_en[8]  ),
  .entry_pc_create_x           (entry_pc_create[8]         ),
  .entry_pc_v                  (entry_pc_8                 ),
  .entry_pgflt_x               (entry_pgflt[8]             ),
  .entry_retire_x              (entry_retire[8]            ),
  .entry_spe_data_vld          (entry_spe_data_vld         ),
  .entry_split0_x              (entry_split0[8]            ),
  .entry_split1_x              (entry_split1[8]            ),
  .entry_vl_pred_x             (entry_vl_pred[8]           ),
  .entry_vl_v                  (entry_vl_8                 ),
  .entry_vld_create_clk_en_x   (entry_vld_create_clk_en[8] ),
  .entry_vld_retire_clk_en_x   (entry_vld_retire_clk_en[8] ),
  .entry_vld_x                 (entry_vld[8]               ),
  .entry_vlmul_v               (entry_vlmul_8              ),
  .entry_vsew_v                (entry_vsew_8               ),
  .forever_cpuclk              (forever_cpuclk             ),
  .ibuf_flush                  (ibuf_flush                 ),
  .pad_yy_icg_scan_en          (pad_yy_icg_scan_en         )
);


// &ConnRule(s/_x$/[9]/); @66
// &ConnRule(s/_v$/_9/); @67
// &Instance("ct_ifu_ibuf_entry","x_ct_ifu_ibuf_entry_9"); @68
ct_ifu_ibuf_entry  x_ct_ifu_ibuf_entry_9 (
  .cp0_ifu_icg_en              (cp0_ifu_icg_en             ),
  .cp0_yy_clk_en               (cp0_yy_clk_en              ),
  .cpurst_b                    (cpurst_b                   ),
  .entry_32_start_x            (entry_32_start[9]          ),
  .entry_acc_err_x             (entry_acc_err[9]           ),
  .entry_bkpta_x               (entry_bkpta[9]             ),
  .entry_bkptb_x               (entry_bkptb[9]             ),
  .entry_create_32_start_x     (entry_create_32_start[9]   ),
  .entry_create_acc_err_x      (entry_create_acc_err[9]    ),
  .entry_create_bkpta_x        (entry_create_bkpta[9]      ),
  .entry_create_bkptb_x        (entry_create_bkptb[9]      ),
  .entry_create_fence_x        (entry_create_fence[9]      ),
  .entry_create_high_expt_x    (entry_create_high_expt[9]  ),
  .entry_create_inst_data_v    (entry_create_inst_data_9   ),
  .entry_create_no_spec_x      (entry_create_no_spec[9]    ),
  .entry_create_pc_v           (entry_create_pc_9          ),
  .entry_create_pgflt_x        (entry_create_pgflt[9]      ),
  .entry_create_split0_x       (entry_create_split0[9]     ),
  .entry_create_split1_x       (entry_create_split1[9]     ),
  .entry_create_vl_pred_x      (entry_create_vl_pred[9]    ),
  .entry_create_vl_v           (entry_create_vl_9          ),
  .entry_create_vlmul_v        (entry_create_vlmul_9       ),
  .entry_create_vsew_v         (entry_create_vsew_9        ),
  .entry_create_x              (entry_create[9]            ),
  .entry_data_create_clk_en_x  (entry_data_create_clk_en[9]),
  .entry_data_create_x         (entry_data_create[9]       ),
  .entry_fence_x               (entry_fence[9]             ),
  .entry_high_expt_x           (entry_high_expt[9]         ),
  .entry_inst_data_v           (entry_inst_data_9          ),
  .entry_no_spec_x             (entry_no_spec[9]           ),
  .entry_pc_create_clk_en_x    (entry_pc_create_clk_en[9]  ),
  .entry_pc_create_x           (entry_pc_create[9]         ),
  .entry_pc_v                  (entry_pc_9                 ),
  .entry_pgflt_x               (entry_pgflt[9]             ),
  .entry_retire_x              (entry_retire[9]            ),
  .entry_spe_data_vld          (entry_spe_data_vld         ),
  .entry_split0_x              (entry_split0[9]            ),
  .entry_split1_x              (entry_split1[9]            ),
  .entry_vl_pred_x             (entry_vl_pred[9]           ),
  .entry_vl_v                  (entry_vl_9                 ),
  .entry_vld_create_clk_en_x   (entry_vld_create_clk_en[9] ),
  .entry_vld_retire_clk_en_x   (entry_vld_retire_clk_en[9] ),
  .entry_vld_x                 (entry_vld[9]               ),
  .entry_vlmul_v               (entry_vlmul_9              ),
  .entry_vsew_v                (entry_vsew_9               ),
  .forever_cpuclk              (forever_cpuclk             ),
  .ibuf_flush                  (ibuf_flush                 ),
  .pad_yy_icg_scan_en          (pad_yy_icg_scan_en         )
);


// &ConnRule(s/_x$/[10]/); @70
// &ConnRule(s/_v$/_10/); @71
// &Instance("ct_ifu_ibuf_entry","x_ct_ifu_ibuf_entry_10"); @72
ct_ifu_ibuf_entry  x_ct_ifu_ibuf_entry_10 (
  .cp0_ifu_icg_en               (cp0_ifu_icg_en              ),
  .cp0_yy_clk_en                (cp0_yy_clk_en               ),
  .cpurst_b                     (cpurst_b                    ),
  .entry_32_start_x             (entry_32_start[10]          ),
  .entry_acc_err_x              (entry_acc_err[10]           ),
  .entry_bkpta_x                (entry_bkpta[10]             ),
  .entry_bkptb_x                (entry_bkptb[10]             ),
  .entry_create_32_start_x      (entry_create_32_start[10]   ),
  .entry_create_acc_err_x       (entry_create_acc_err[10]    ),
  .entry_create_bkpta_x         (entry_create_bkpta[10]      ),
  .entry_create_bkptb_x         (entry_create_bkptb[10]      ),
  .entry_create_fence_x         (entry_create_fence[10]      ),
  .entry_create_high_expt_x     (entry_create_high_expt[10]  ),
  .entry_create_inst_data_v     (entry_create_inst_data_10   ),
  .entry_create_no_spec_x       (entry_create_no_spec[10]    ),
  .entry_create_pc_v            (entry_create_pc_10          ),
  .entry_create_pgflt_x         (entry_create_pgflt[10]      ),
  .entry_create_split0_x        (entry_create_split0[10]     ),
  .entry_create_split1_x        (entry_create_split1[10]     ),
  .entry_create_vl_pred_x       (entry_create_vl_pred[10]    ),
  .entry_create_vl_v            (entry_create_vl_10          ),
  .entry_create_vlmul_v         (entry_create_vlmul_10       ),
  .entry_create_vsew_v          (entry_create_vsew_10        ),
  .entry_create_x               (entry_create[10]            ),
  .entry_data_create_clk_en_x   (entry_data_create_clk_en[10]),
  .entry_data_create_x          (entry_data_create[10]       ),
  .entry_fence_x                (entry_fence[10]             ),
  .entry_high_expt_x            (entry_high_expt[10]         ),
  .entry_inst_data_v            (entry_inst_data_10          ),
  .entry_no_spec_x              (entry_no_spec[10]           ),
  .entry_pc_create_clk_en_x     (entry_pc_create_clk_en[10]  ),
  .entry_pc_create_x            (entry_pc_create[10]         ),
  .entry_pc_v                   (entry_pc_10                 ),
  .entry_pgflt_x                (entry_pgflt[10]             ),
  .entry_retire_x               (entry_retire[10]            ),
  .entry_spe_data_vld           (entry_spe_data_vld          ),
  .entry_split0_x               (entry_split0[10]            ),
  .entry_split1_x               (entry_split1[10]            ),
  .entry_vl_pred_x              (entry_vl_pred[10]           ),
  .entry_vl_v                   (entry_vl_10                 ),
  .entry_vld_create_clk_en_x    (entry_vld_create_clk_en[10] ),
  .entry_vld_retire_clk_en_x    (entry_vld_retire_clk_en[10] ),
  .entry_vld_x                  (entry_vld[10]               ),
  .entry_vlmul_v                (entry_vlmul_10              ),
  .entry_vsew_v                 (entry_vsew_10               ),
  .forever_cpuclk               (forever_cpuclk              ),
  .ibuf_flush                   (ibuf_flush                  ),
  .pad_yy_icg_scan_en           (pad_yy_icg_scan_en          )
);


// &ConnRule(s/_x$/[11]/); @74
// &ConnRule(s/_v$/_11/); @75
// &Instance("ct_ifu_ibuf_entry","x_ct_ifu_ibuf_entry_11"); @76
ct_ifu_ibuf_entry  x_ct_ifu_ibuf_entry_11 (
  .cp0_ifu_icg_en               (cp0_ifu_icg_en              ),
  .cp0_yy_clk_en                (cp0_yy_clk_en               ),
  .cpurst_b                     (cpurst_b                    ),
  .entry_32_start_x             (entry_32_start[11]          ),
  .entry_acc_err_x              (entry_acc_err[11]           ),
  .entry_bkpta_x                (entry_bkpta[11]             ),
  .entry_bkptb_x                (entry_bkptb[11]             ),
  .entry_create_32_start_x      (entry_create_32_start[11]   ),
  .entry_create_acc_err_x       (entry_create_acc_err[11]    ),
  .entry_create_bkpta_x         (entry_create_bkpta[11]      ),
  .entry_create_bkptb_x         (entry_create_bkptb[11]      ),
  .entry_create_fence_x         (entry_create_fence[11]      ),
  .entry_create_high_expt_x     (entry_create_high_expt[11]  ),
  .entry_create_inst_data_v     (entry_create_inst_data_11   ),
  .entry_create_no_spec_x       (entry_create_no_spec[11]    ),
  .entry_create_pc_v            (entry_create_pc_11          ),
  .entry_create_pgflt_x         (entry_create_pgflt[11]      ),
  .entry_create_split0_x        (entry_create_split0[11]     ),
  .entry_create_split1_x        (entry_create_split1[11]     ),
  .entry_create_vl_pred_x       (entry_create_vl_pred[11]    ),
  .entry_create_vl_v            (entry_create_vl_11          ),
  .entry_create_vlmul_v         (entry_create_vlmul_11       ),
  .entry_create_vsew_v          (entry_create_vsew_11        ),
  .entry_create_x               (entry_create[11]            ),
  .entry_data_create_clk_en_x   (entry_data_create_clk_en[11]),
  .entry_data_create_x          (entry_data_create[11]       ),
  .entry_fence_x                (entry_fence[11]             ),
  .entry_high_expt_x            (entry_high_expt[11]         ),
  .entry_inst_data_v            (entry_inst_data_11          ),
  .entry_no_spec_x              (entry_no_spec[11]           ),
  .entry_pc_create_clk_en_x     (entry_pc_create_clk_en[11]  ),
  .entry_pc_create_x            (entry_pc_create[11]         ),
  .entry_pc_v                   (entry_pc_11                 ),
  .entry_pgflt_x                (entry_pgflt[11]             ),
  .entry_retire_x               (entry_retire[11]            ),
  .entry_spe_data_vld           (entry_spe_data_vld          ),
  .entry_split0_x               (entry_split0[11]            ),
  .entry_split1_x               (entry_split1[11]            ),
  .entry_vl_pred_x              (entry_vl_pred[11]           ),
  .entry_vl_v                   (entry_vl_11                 ),
  .entry_vld_create_clk_en_x    (entry_vld_create_clk_en[11] ),
  .entry_vld_retire_clk_en_x    (entry_vld_retire_clk_en[11] ),
  .entry_vld_x                  (entry_vld[11]               ),
  .entry_vlmul_v                (entry_vlmul_11              ),
  .entry_vsew_v                 (entry_vsew_11               ),
  .forever_cpuclk               (forever_cpuclk              ),
  .ibuf_flush                   (ibuf_flush                  ),
  .pad_yy_icg_scan_en           (pad_yy_icg_scan_en          )
);


// &ConnRule(s/_x$/[12]/); @78
// &ConnRule(s/_v$/_12/); @79
// &Instance("ct_ifu_ibuf_entry","x_ct_ifu_ibuf_entry_12"); @80
ct_ifu_ibuf_entry  x_ct_ifu_ibuf_entry_12 (
  .cp0_ifu_icg_en               (cp0_ifu_icg_en              ),
  .cp0_yy_clk_en                (cp0_yy_clk_en               ),
  .cpurst_b                     (cpurst_b                    ),
  .entry_32_start_x             (entry_32_start[12]          ),
  .entry_acc_err_x              (entry_acc_err[12]           ),
  .entry_bkpta_x                (entry_bkpta[12]             ),
  .entry_bkptb_x                (entry_bkptb[12]             ),
  .entry_create_32_start_x      (entry_create_32_start[12]   ),
  .entry_create_acc_err_x       (entry_create_acc_err[12]    ),
  .entry_create_bkpta_x         (entry_create_bkpta[12]      ),
  .entry_create_bkptb_x         (entry_create_bkptb[12]      ),
  .entry_create_fence_x         (entry_create_fence[12]      ),
  .entry_create_high_expt_x     (entry_create_high_expt[12]  ),
  .entry_create_inst_data_v     (entry_create_inst_data_12   ),
  .entry_create_no_spec_x       (entry_create_no_spec[12]    ),
  .entry_create_pc_v            (entry_create_pc_12          ),
  .entry_create_pgflt_x         (entry_create_pgflt[12]      ),
  .entry_create_split0_x        (entry_create_split0[12]     ),
  .entry_create_split1_x        (entry_create_split1[12]     ),
  .entry_create_vl_pred_x       (entry_create_vl_pred[12]    ),
  .entry_create_vl_v            (entry_create_vl_12          ),
  .entry_create_vlmul_v         (entry_create_vlmul_12       ),
  .entry_create_vsew_v          (entry_create_vsew_12        ),
  .entry_create_x               (entry_create[12]            ),
  .entry_data_create_clk_en_x   (entry_data_create_clk_en[12]),
  .entry_data_create_x          (entry_data_create[12]       ),
  .entry_fence_x                (entry_fence[12]             ),
  .entry_high_expt_x            (entry_high_expt[12]         ),
  .entry_inst_data_v            (entry_inst_data_12          ),
  .entry_no_spec_x              (entry_no_spec[12]           ),
  .entry_pc_create_clk_en_x     (entry_pc_create_clk_en[12]  ),
  .entry_pc_create_x            (entry_pc_create[12]         ),
  .entry_pc_v                   (entry_pc_12                 ),
  .entry_pgflt_x                (entry_pgflt[12]             ),
  .entry_retire_x               (entry_retire[12]            ),
  .entry_spe_data_vld           (entry_spe_data_vld          ),
  .entry_split0_x               (entry_split0[12]            ),
  .entry_split1_x               (entry_split1[12]            ),
  .entry_vl_pred_x              (entry_vl_pred[12]           ),
  .entry_vl_v                   (entry_vl_12                 ),
  .entry_vld_create_clk_en_x    (entry_vld_create_clk_en[12] ),
  .entry_vld_retire_clk_en_x    (entry_vld_retire_clk_en[12] ),
  .entry_vld_x                  (entry_vld[12]               ),
  .entry_vlmul_v                (entry_vlmul_12              ),
  .entry_vsew_v                 (entry_vsew_12               ),
  .forever_cpuclk               (forever_cpuclk              ),
  .ibuf_flush                   (ibuf_flush                  ),
  .pad_yy_icg_scan_en           (pad_yy_icg_scan_en          )
);


// &ConnRule(s/_x$/[13]/); @82
// &ConnRule(s/_v$/_13/); @83
// &Instance("ct_ifu_ibuf_entry","x_ct_ifu_ibuf_entry_13"); @84
ct_ifu_ibuf_entry  x_ct_ifu_ibuf_entry_13 (
  .cp0_ifu_icg_en               (cp0_ifu_icg_en              ),
  .cp0_yy_clk_en                (cp0_yy_clk_en               ),
  .cpurst_b                     (cpurst_b                    ),
  .entry_32_start_x             (entry_32_start[13]          ),
  .entry_acc_err_x              (entry_acc_err[13]           ),
  .entry_bkpta_x                (entry_bkpta[13]             ),
  .entry_bkptb_x                (entry_bkptb[13]             ),
  .entry_create_32_start_x      (entry_create_32_start[13]   ),
  .entry_create_acc_err_x       (entry_create_acc_err[13]    ),
  .entry_create_bkpta_x         (entry_create_bkpta[13]      ),
  .entry_create_bkptb_x         (entry_create_bkptb[13]      ),
  .entry_create_fence_x         (entry_create_fence[13]      ),
  .entry_create_high_expt_x     (entry_create_high_expt[13]  ),
  .entry_create_inst_data_v     (entry_create_inst_data_13   ),
  .entry_create_no_spec_x       (entry_create_no_spec[13]    ),
  .entry_create_pc_v            (entry_create_pc_13          ),
  .entry_create_pgflt_x         (entry_create_pgflt[13]      ),
  .entry_create_split0_x        (entry_create_split0[13]     ),
  .entry_create_split1_x        (entry_create_split1[13]     ),
  .entry_create_vl_pred_x       (entry_create_vl_pred[13]    ),
  .entry_create_vl_v            (entry_create_vl_13          ),
  .entry_create_vlmul_v         (entry_create_vlmul_13       ),
  .entry_create_vsew_v          (entry_create_vsew_13        ),
  .entry_create_x               (entry_create[13]            ),
  .entry_data_create_clk_en_x   (entry_data_create_clk_en[13]),
  .entry_data_create_x          (entry_data_create[13]       ),
  .entry_fence_x                (entry_fence[13]             ),
  .entry_high_expt_x            (entry_high_expt[13]         ),
  .entry_inst_data_v            (entry_inst_data_13          ),
  .entry_no_spec_x              (entry_no_spec[13]           ),
  .entry_pc_create_clk_en_x     (entry_pc_create_clk_en[13]  ),
  .entry_pc_create_x            (entry_pc_create[13]         ),
  .entry_pc_v                   (entry_pc_13                 ),
  .entry_pgflt_x                (entry_pgflt[13]             ),
  .entry_retire_x               (entry_retire[13]            ),
  .entry_spe_data_vld           (entry_spe_data_vld          ),
  .entry_split0_x               (entry_split0[13]            ),
  .entry_split1_x               (entry_split1[13]            ),
  .entry_vl_pred_x              (entry_vl_pred[13]           ),
  .entry_vl_v                   (entry_vl_13                 ),
  .entry_vld_create_clk_en_x    (entry_vld_create_clk_en[13] ),
  .entry_vld_retire_clk_en_x    (entry_vld_retire_clk_en[13] ),
  .entry_vld_x                  (entry_vld[13]               ),
  .entry_vlmul_v                (entry_vlmul_13              ),
  .entry_vsew_v                 (entry_vsew_13               ),
  .forever_cpuclk               (forever_cpuclk              ),
  .ibuf_flush                   (ibuf_flush                  ),
  .pad_yy_icg_scan_en           (pad_yy_icg_scan_en          )
);


// &ConnRule(s/_x$/[14]/); @86
// &ConnRule(s/_v$/_14/); @87
// &Instance("ct_ifu_ibuf_entry","x_ct_ifu_ibuf_entry_14"); @88
ct_ifu_ibuf_entry  x_ct_ifu_ibuf_entry_14 (
  .cp0_ifu_icg_en               (cp0_ifu_icg_en              ),
  .cp0_yy_clk_en                (cp0_yy_clk_en               ),
  .cpurst_b                     (cpurst_b                    ),
  .entry_32_start_x             (entry_32_start[14]          ),
  .entry_acc_err_x              (entry_acc_err[14]           ),
  .entry_bkpta_x                (entry_bkpta[14]             ),
  .entry_bkptb_x                (entry_bkptb[14]             ),
  .entry_create_32_start_x      (entry_create_32_start[14]   ),
  .entry_create_acc_err_x       (entry_create_acc_err[14]    ),
  .entry_create_bkpta_x         (entry_create_bkpta[14]      ),
  .entry_create_bkptb_x         (entry_create_bkptb[14]      ),
  .entry_create_fence_x         (entry_create_fence[14]      ),
  .entry_create_high_expt_x     (entry_create_high_expt[14]  ),
  .entry_create_inst_data_v     (entry_create_inst_data_14   ),
  .entry_create_no_spec_x       (entry_create_no_spec[14]    ),
  .entry_create_pc_v            (entry_create_pc_14          ),
  .entry_create_pgflt_x         (entry_create_pgflt[14]      ),
  .entry_create_split0_x        (entry_create_split0[14]     ),
  .entry_create_split1_x        (entry_create_split1[14]     ),
  .entry_create_vl_pred_x       (entry_create_vl_pred[14]    ),
  .entry_create_vl_v            (entry_create_vl_14          ),
  .entry_create_vlmul_v         (entry_create_vlmul_14       ),
  .entry_create_vsew_v          (entry_create_vsew_14        ),
  .entry_create_x               (entry_create[14]            ),
  .entry_data_create_clk_en_x   (entry_data_create_clk_en[14]),
  .entry_data_create_x          (entry_data_create[14]       ),
  .entry_fence_x                (entry_fence[14]             ),
  .entry_high_expt_x            (entry_high_expt[14]         ),
  .entry_inst_data_v            (entry_inst_data_14          ),
  .entry_no_spec_x              (entry_no_spec[14]           ),
  .entry_pc_create_clk_en_x     (entry_pc_create_clk_en[14]  ),
  .entry_pc_create_x            (entry_pc_create[14]         ),
  .entry_pc_v                   (entry_pc_14                 ),
  .entry_pgflt_x                (entry_pgflt[14]             ),
  .entry_retire_x               (entry_retire[14]            ),
  .entry_spe_data_vld           (entry_spe_data_vld          ),
  .entry_split0_x               (entry_split0[14]            ),
  .entry_split1_x               (entry_split1[14]            ),
  .entry_vl_pred_x              (entry_vl_pred[14]           ),
  .entry_vl_v                   (entry_vl_14                 ),
  .entry_vld_create_clk_en_x    (entry_vld_create_clk_en[14] ),
  .entry_vld_retire_clk_en_x    (entry_vld_retire_clk_en[14] ),
  .entry_vld_x                  (entry_vld[14]               ),
  .entry_vlmul_v                (entry_vlmul_14              ),
  .entry_vsew_v                 (entry_vsew_14               ),
  .forever_cpuclk               (forever_cpuclk              ),
  .ibuf_flush                   (ibuf_flush                  ),
  .pad_yy_icg_scan_en           (pad_yy_icg_scan_en          )
);


// &ConnRule(s/_x$/[15]/); @90
// &ConnRule(s/_v$/_15/); @91
// &Instance("ct_ifu_ibuf_entry","x_ct_ifu_ibuf_entry_15"); @92
ct_ifu_ibuf_entry  x_ct_ifu_ibuf_entry_15 (
  .cp0_ifu_icg_en               (cp0_ifu_icg_en              ),
  .cp0_yy_clk_en                (cp0_yy_clk_en               ),
  .cpurst_b                     (cpurst_b                    ),
  .entry_32_start_x             (entry_32_start[15]          ),
  .entry_acc_err_x              (entry_acc_err[15]           ),
  .entry_bkpta_x                (entry_bkpta[15]             ),
  .entry_bkptb_x                (entry_bkptb[15]             ),
  .entry_create_32_start_x      (entry_create_32_start[15]   ),
  .entry_create_acc_err_x       (entry_create_acc_err[15]    ),
  .entry_create_bkpta_x         (entry_create_bkpta[15]      ),
  .entry_create_bkptb_x         (entry_create_bkptb[15]      ),
  .entry_create_fence_x         (entry_create_fence[15]      ),
  .entry_create_high_expt_x     (entry_create_high_expt[15]  ),
  .entry_create_inst_data_v     (entry_create_inst_data_15   ),
  .entry_create_no_spec_x       (entry_create_no_spec[15]    ),
  .entry_create_pc_v            (entry_create_pc_15          ),
  .entry_create_pgflt_x         (entry_create_pgflt[15]      ),
  .entry_create_split0_x        (entry_create_split0[15]     ),
  .entry_create_split1_x        (entry_create_split1[15]     ),
  .entry_create_vl_pred_x       (entry_create_vl_pred[15]    ),
  .entry_create_vl_v            (entry_create_vl_15          ),
  .entry_create_vlmul_v         (entry_create_vlmul_15       ),
  .entry_create_vsew_v          (entry_create_vsew_15        ),
  .entry_create_x               (entry_create[15]            ),
  .entry_data_create_clk_en_x   (entry_data_create_clk_en[15]),
  .entry_data_create_x          (entry_data_create[15]       ),
  .entry_fence_x                (entry_fence[15]             ),
  .entry_high_expt_x            (entry_high_expt[15]         ),
  .entry_inst_data_v            (entry_inst_data_15          ),
  .entry_no_spec_x              (entry_no_spec[15]           ),
  .entry_pc_create_clk_en_x     (entry_pc_create_clk_en[15]  ),
  .entry_pc_create_x            (entry_pc_create[15]         ),
  .entry_pc_v                   (entry_pc_15                 ),
  .entry_pgflt_x                (entry_pgflt[15]             ),
  .entry_retire_x               (entry_retire[15]            ),
  .entry_spe_data_vld           (entry_spe_data_vld          ),
  .entry_split0_x               (entry_split0[15]            ),
  .entry_split1_x               (entry_split1[15]            ),
  .entry_vl_pred_x              (entry_vl_pred[15]           ),
  .entry_vl_v                   (entry_vl_15                 ),
  .entry_vld_create_clk_en_x    (entry_vld_create_clk_en[15] ),
  .entry_vld_retire_clk_en_x    (entry_vld_retire_clk_en[15] ),
  .entry_vld_x                  (entry_vld[15]               ),
  .entry_vlmul_v                (entry_vlmul_15              ),
  .entry_vsew_v                 (entry_vsew_15               ),
  .forever_cpuclk               (forever_cpuclk              ),
  .ibuf_flush                   (ibuf_flush                  ),
  .pad_yy_icg_scan_en           (pad_yy_icg_scan_en          )
);


// &ConnRule(s/_x$/[16]/); @94
// &ConnRule(s/_v$/_16/); @95
// &Instance("ct_ifu_ibuf_entry","x_ct_ifu_ibuf_entry_16"); @96
ct_ifu_ibuf_entry  x_ct_ifu_ibuf_entry_16 (
  .cp0_ifu_icg_en               (cp0_ifu_icg_en              ),
  .cp0_yy_clk_en                (cp0_yy_clk_en               ),
  .cpurst_b                     (cpurst_b                    ),
  .entry_32_start_x             (entry_32_start[16]          ),
  .entry_acc_err_x              (entry_acc_err[16]           ),
  .entry_bkpta_x                (entry_bkpta[16]             ),
  .entry_bkptb_x                (entry_bkptb[16]             ),
  .entry_create_32_start_x      (entry_create_32_start[16]   ),
  .entry_create_acc_err_x       (entry_create_acc_err[16]    ),
  .entry_create_bkpta_x         (entry_create_bkpta[16]      ),
  .entry_create_bkptb_x         (entry_create_bkptb[16]      ),
  .entry_create_fence_x         (entry_create_fence[16]      ),
  .entry_create_high_expt_x     (entry_create_high_expt[16]  ),
  .entry_create_inst_data_v     (entry_create_inst_data_16   ),
  .entry_create_no_spec_x       (entry_create_no_spec[16]    ),
  .entry_create_pc_v            (entry_create_pc_16          ),
  .entry_create_pgflt_x         (entry_create_pgflt[16]      ),
  .entry_create_split0_x        (entry_create_split0[16]     ),
  .entry_create_split1_x        (entry_create_split1[16]     ),
  .entry_create_vl_pred_x       (entry_create_vl_pred[16]    ),
  .entry_create_vl_v            (entry_create_vl_16          ),
  .entry_create_vlmul_v         (entry_create_vlmul_16       ),
  .entry_create_vsew_v          (entry_create_vsew_16        ),
  .entry_create_x               (entry_create[16]            ),
  .entry_data_create_clk_en_x   (entry_data_create_clk_en[16]),
  .entry_data_create_x          (entry_data_create[16]       ),
  .entry_fence_x                (entry_fence[16]             ),
  .entry_high_expt_x            (entry_high_expt[16]         ),
  .entry_inst_data_v            (entry_inst_data_16          ),
  .entry_no_spec_x              (entry_no_spec[16]           ),
  .entry_pc_create_clk_en_x     (entry_pc_create_clk_en[16]  ),
  .entry_pc_create_x            (entry_pc_create[16]         ),
  .entry_pc_v                   (entry_pc_16                 ),
  .entry_pgflt_x                (entry_pgflt[16]             ),
  .entry_retire_x               (entry_retire[16]            ),
  .entry_spe_data_vld           (entry_spe_data_vld          ),
  .entry_split0_x               (entry_split0[16]            ),
  .entry_split1_x               (entry_split1[16]            ),
  .entry_vl_pred_x              (entry_vl_pred[16]           ),
  .entry_vl_v                   (entry_vl_16                 ),
  .entry_vld_create_clk_en_x    (entry_vld_create_clk_en[16] ),
  .entry_vld_retire_clk_en_x    (entry_vld_retire_clk_en[16] ),
  .entry_vld_x                  (entry_vld[16]               ),
  .entry_vlmul_v                (entry_vlmul_16              ),
  .entry_vsew_v                 (entry_vsew_16               ),
  .forever_cpuclk               (forever_cpuclk              ),
  .ibuf_flush                   (ibuf_flush                  ),
  .pad_yy_icg_scan_en           (pad_yy_icg_scan_en          )
);


// &ConnRule(s/_x$/[17]/); @98
// &ConnRule(s/_v$/_17/); @99
// &Instance("ct_ifu_ibuf_entry","x_ct_ifu_ibuf_entry_17"); @100
ct_ifu_ibuf_entry  x_ct_ifu_ibuf_entry_17 (
  .cp0_ifu_icg_en               (cp0_ifu_icg_en              ),
  .cp0_yy_clk_en                (cp0_yy_clk_en               ),
  .cpurst_b                     (cpurst_b                    ),
  .entry_32_start_x             (entry_32_start[17]          ),
  .entry_acc_err_x              (entry_acc_err[17]           ),
  .entry_bkpta_x                (entry_bkpta[17]             ),
  .entry_bkptb_x                (entry_bkptb[17]             ),
  .entry_create_32_start_x      (entry_create_32_start[17]   ),
  .entry_create_acc_err_x       (entry_create_acc_err[17]    ),
  .entry_create_bkpta_x         (entry_create_bkpta[17]      ),
  .entry_create_bkptb_x         (entry_create_bkptb[17]      ),
  .entry_create_fence_x         (entry_create_fence[17]      ),
  .entry_create_high_expt_x     (entry_create_high_expt[17]  ),
  .entry_create_inst_data_v     (entry_create_inst_data_17   ),
  .entry_create_no_spec_x       (entry_create_no_spec[17]    ),
  .entry_create_pc_v            (entry_create_pc_17          ),
  .entry_create_pgflt_x         (entry_create_pgflt[17]      ),
  .entry_create_split0_x        (entry_create_split0[17]     ),
  .entry_create_split1_x        (entry_create_split1[17]     ),
  .entry_create_vl_pred_x       (entry_create_vl_pred[17]    ),
  .entry_create_vl_v            (entry_create_vl_17          ),
  .entry_create_vlmul_v         (entry_create_vlmul_17       ),
  .entry_create_vsew_v          (entry_create_vsew_17        ),
  .entry_create_x               (entry_create[17]            ),
  .entry_data_create_clk_en_x   (entry_data_create_clk_en[17]),
  .entry_data_create_x          (entry_data_create[17]       ),
  .entry_fence_x                (entry_fence[17]             ),
  .entry_high_expt_x            (entry_high_expt[17]         ),
  .entry_inst_data_v            (entry_inst_data_17          ),
  .entry_no_spec_x              (entry_no_spec[17]           ),
  .entry_pc_create_clk_en_x     (entry_pc_create_clk_en[17]  ),
  .entry_pc_create_x            (entry_pc_create[17]         ),
  .entry_pc_v                   (entry_pc_17                 ),
  .entry_pgflt_x                (entry_pgflt[17]             ),
  .entry_retire_x               (entry_retire[17]            ),
  .entry_spe_data_vld           (entry_spe_data_vld          ),
  .entry_split0_x               (entry_split0[17]            ),
  .entry_split1_x               (entry_split1[17]            ),
  .entry_vl_pred_x              (entry_vl_pred[17]           ),
  .entry_vl_v                   (entry_vl_17                 ),
  .entry_vld_create_clk_en_x    (entry_vld_create_clk_en[17] ),
  .entry_vld_retire_clk_en_x    (entry_vld_retire_clk_en[17] ),
  .entry_vld_x                  (entry_vld[17]               ),
  .entry_vlmul_v                (entry_vlmul_17              ),
  .entry_vsew_v                 (entry_vsew_17               ),
  .forever_cpuclk               (forever_cpuclk              ),
  .ibuf_flush                   (ibuf_flush                  ),
  .pad_yy_icg_scan_en           (pad_yy_icg_scan_en          )
);


// &ConnRule(s/_x$/[18]/); @102
// &ConnRule(s/_v$/_18/); @103
// &Instance("ct_ifu_ibuf_entry","x_ct_ifu_ibuf_entry_18"); @104
ct_ifu_ibuf_entry  x_ct_ifu_ibuf_entry_18 (
  .cp0_ifu_icg_en               (cp0_ifu_icg_en              ),
  .cp0_yy_clk_en                (cp0_yy_clk_en               ),
  .cpurst_b                     (cpurst_b                    ),
  .entry_32_start_x             (entry_32_start[18]          ),
  .entry_acc_err_x              (entry_acc_err[18]           ),
  .entry_bkpta_x                (entry_bkpta[18]             ),
  .entry_bkptb_x                (entry_bkptb[18]             ),
  .entry_create_32_start_x      (entry_create_32_start[18]   ),
  .entry_create_acc_err_x       (entry_create_acc_err[18]    ),
  .entry_create_bkpta_x         (entry_create_bkpta[18]      ),
  .entry_create_bkptb_x         (entry_create_bkptb[18]      ),
  .entry_create_fence_x         (entry_create_fence[18]      ),
  .entry_create_high_expt_x     (entry_create_high_expt[18]  ),
  .entry_create_inst_data_v     (entry_create_inst_data_18   ),
  .entry_create_no_spec_x       (entry_create_no_spec[18]    ),
  .entry_create_pc_v            (entry_create_pc_18          ),
  .entry_create_pgflt_x         (entry_create_pgflt[18]      ),
  .entry_create_split0_x        (entry_create_split0[18]     ),
  .entry_create_split1_x        (entry_create_split1[18]     ),
  .entry_create_vl_pred_x       (entry_create_vl_pred[18]    ),
  .entry_create_vl_v            (entry_create_vl_18          ),
  .entry_create_vlmul_v         (entry_create_vlmul_18       ),
  .entry_create_vsew_v          (entry_create_vsew_18        ),
  .entry_create_x               (entry_create[18]            ),
  .entry_data_create_clk_en_x   (entry_data_create_clk_en[18]),
  .entry_data_create_x          (entry_data_create[18]       ),
  .entry_fence_x                (entry_fence[18]             ),
  .entry_high_expt_x            (entry_high_expt[18]         ),
  .entry_inst_data_v            (entry_inst_data_18          ),
  .entry_no_spec_x              (entry_no_spec[18]           ),
  .entry_pc_create_clk_en_x     (entry_pc_create_clk_en[18]  ),
  .entry_pc_create_x            (entry_pc_create[18]         ),
  .entry_pc_v                   (entry_pc_18                 ),
  .entry_pgflt_x                (entry_pgflt[18]             ),
  .entry_retire_x               (entry_retire[18]            ),
  .entry_spe_data_vld           (entry_spe_data_vld          ),
  .entry_split0_x               (entry_split0[18]            ),
  .entry_split1_x               (entry_split1[18]            ),
  .entry_vl_pred_x              (entry_vl_pred[18]           ),
  .entry_vl_v                   (entry_vl_18                 ),
  .entry_vld_create_clk_en_x    (entry_vld_create_clk_en[18] ),
  .entry_vld_retire_clk_en_x    (entry_vld_retire_clk_en[18] ),
  .entry_vld_x                  (entry_vld[18]               ),
  .entry_vlmul_v                (entry_vlmul_18              ),
  .entry_vsew_v                 (entry_vsew_18               ),
  .forever_cpuclk               (forever_cpuclk              ),
  .ibuf_flush                   (ibuf_flush                  ),
  .pad_yy_icg_scan_en           (pad_yy_icg_scan_en          )
);


// &ConnRule(s/_x$/[19]/); @106
// &ConnRule(s/_v$/_19/); @107
// &Instance("ct_ifu_ibuf_entry","x_ct_ifu_ibuf_entry_19"); @108
ct_ifu_ibuf_entry  x_ct_ifu_ibuf_entry_19 (
  .cp0_ifu_icg_en               (cp0_ifu_icg_en              ),
  .cp0_yy_clk_en                (cp0_yy_clk_en               ),
  .cpurst_b                     (cpurst_b                    ),
  .entry_32_start_x             (entry_32_start[19]          ),
  .entry_acc_err_x              (entry_acc_err[19]           ),
  .entry_bkpta_x                (entry_bkpta[19]             ),
  .entry_bkptb_x                (entry_bkptb[19]             ),
  .entry_create_32_start_x      (entry_create_32_start[19]   ),
  .entry_create_acc_err_x       (entry_create_acc_err[19]    ),
  .entry_create_bkpta_x         (entry_create_bkpta[19]      ),
  .entry_create_bkptb_x         (entry_create_bkptb[19]      ),
  .entry_create_fence_x         (entry_create_fence[19]      ),
  .entry_create_high_expt_x     (entry_create_high_expt[19]  ),
  .entry_create_inst_data_v     (entry_create_inst_data_19   ),
  .entry_create_no_spec_x       (entry_create_no_spec[19]    ),
  .entry_create_pc_v            (entry_create_pc_19          ),
  .entry_create_pgflt_x         (entry_create_pgflt[19]      ),
  .entry_create_split0_x        (entry_create_split0[19]     ),
  .entry_create_split1_x        (entry_create_split1[19]     ),
  .entry_create_vl_pred_x       (entry_create_vl_pred[19]    ),
  .entry_create_vl_v            (entry_create_vl_19          ),
  .entry_create_vlmul_v         (entry_create_vlmul_19       ),
  .entry_create_vsew_v          (entry_create_vsew_19        ),
  .entry_create_x               (entry_create[19]            ),
  .entry_data_create_clk_en_x   (entry_data_create_clk_en[19]),
  .entry_data_create_x          (entry_data_create[19]       ),
  .entry_fence_x                (entry_fence[19]             ),
  .entry_high_expt_x            (entry_high_expt[19]         ),
  .entry_inst_data_v            (entry_inst_data_19          ),
  .entry_no_spec_x              (entry_no_spec[19]           ),
  .entry_pc_create_clk_en_x     (entry_pc_create_clk_en[19]  ),
  .entry_pc_create_x            (entry_pc_create[19]         ),
  .entry_pc_v                   (entry_pc_19                 ),
  .entry_pgflt_x                (entry_pgflt[19]             ),
  .entry_retire_x               (entry_retire[19]            ),
  .entry_spe_data_vld           (entry_spe_data_vld          ),
  .entry_split0_x               (entry_split0[19]            ),
  .entry_split1_x               (entry_split1[19]            ),
  .entry_vl_pred_x              (entry_vl_pred[19]           ),
  .entry_vl_v                   (entry_vl_19                 ),
  .entry_vld_create_clk_en_x    (entry_vld_create_clk_en[19] ),
  .entry_vld_retire_clk_en_x    (entry_vld_retire_clk_en[19] ),
  .entry_vld_x                  (entry_vld[19]               ),
  .entry_vlmul_v                (entry_vlmul_19              ),
  .entry_vsew_v                 (entry_vsew_19               ),
  .forever_cpuclk               (forever_cpuclk              ),
  .ibuf_flush                   (ibuf_flush                  ),
  .pad_yy_icg_scan_en           (pad_yy_icg_scan_en          )
);


// &ConnRule(s/_x$/[20]/); @110
// &ConnRule(s/_v$/_20/); @111
// &Instance("ct_ifu_ibuf_entry","x_ct_ifu_ibuf_entry_20"); @112
ct_ifu_ibuf_entry  x_ct_ifu_ibuf_entry_20 (
  .cp0_ifu_icg_en               (cp0_ifu_icg_en              ),
  .cp0_yy_clk_en                (cp0_yy_clk_en               ),
  .cpurst_b                     (cpurst_b                    ),
  .entry_32_start_x             (entry_32_start[20]          ),
  .entry_acc_err_x              (entry_acc_err[20]           ),
  .entry_bkpta_x                (entry_bkpta[20]             ),
  .entry_bkptb_x                (entry_bkptb[20]             ),
  .entry_create_32_start_x      (entry_create_32_start[20]   ),
  .entry_create_acc_err_x       (entry_create_acc_err[20]    ),
  .entry_create_bkpta_x         (entry_create_bkpta[20]      ),
  .entry_create_bkptb_x         (entry_create_bkptb[20]      ),
  .entry_create_fence_x         (entry_create_fence[20]      ),
  .entry_create_high_expt_x     (entry_create_high_expt[20]  ),
  .entry_create_inst_data_v     (entry_create_inst_data_20   ),
  .entry_create_no_spec_x       (entry_create_no_spec[20]    ),
  .entry_create_pc_v            (entry_create_pc_20          ),
  .entry_create_pgflt_x         (entry_create_pgflt[20]      ),
  .entry_create_split0_x        (entry_create_split0[20]     ),
  .entry_create_split1_x        (entry_create_split1[20]     ),
  .entry_create_vl_pred_x       (entry_create_vl_pred[20]    ),
  .entry_create_vl_v            (entry_create_vl_20          ),
  .entry_create_vlmul_v         (entry_create_vlmul_20       ),
  .entry_create_vsew_v          (entry_create_vsew_20        ),
  .entry_create_x               (entry_create[20]            ),
  .entry_data_create_clk_en_x   (entry_data_create_clk_en[20]),
  .entry_data_create_x          (entry_data_create[20]       ),
  .entry_fence_x                (entry_fence[20]             ),
  .entry_high_expt_x            (entry_high_expt[20]         ),
  .entry_inst_data_v            (entry_inst_data_20          ),
  .entry_no_spec_x              (entry_no_spec[20]           ),
  .entry_pc_create_clk_en_x     (entry_pc_create_clk_en[20]  ),
  .entry_pc_create_x            (entry_pc_create[20]         ),
  .entry_pc_v                   (entry_pc_20                 ),
  .entry_pgflt_x                (entry_pgflt[20]             ),
  .entry_retire_x               (entry_retire[20]            ),
  .entry_spe_data_vld           (entry_spe_data_vld          ),
  .entry_split0_x               (entry_split0[20]            ),
  .entry_split1_x               (entry_split1[20]            ),
  .entry_vl_pred_x              (entry_vl_pred[20]           ),
  .entry_vl_v                   (entry_vl_20                 ),
  .entry_vld_create_clk_en_x    (entry_vld_create_clk_en[20] ),
  .entry_vld_retire_clk_en_x    (entry_vld_retire_clk_en[20] ),
  .entry_vld_x                  (entry_vld[20]               ),
  .entry_vlmul_v                (entry_vlmul_20              ),
  .entry_vsew_v                 (entry_vsew_20               ),
  .forever_cpuclk               (forever_cpuclk              ),
  .ibuf_flush                   (ibuf_flush                  ),
  .pad_yy_icg_scan_en           (pad_yy_icg_scan_en          )
);


// &ConnRule(s/_x$/[21]/); @114
// &ConnRule(s/_v$/_21/); @115
// &Instance("ct_ifu_ibuf_entry","x_ct_ifu_ibuf_entry_21"); @116
ct_ifu_ibuf_entry  x_ct_ifu_ibuf_entry_21 (
  .cp0_ifu_icg_en               (cp0_ifu_icg_en              ),
  .cp0_yy_clk_en                (cp0_yy_clk_en               ),
  .cpurst_b                     (cpurst_b                    ),
  .entry_32_start_x             (entry_32_start[21]          ),
  .entry_acc_err_x              (entry_acc_err[21]           ),
  .entry_bkpta_x                (entry_bkpta[21]             ),
  .entry_bkptb_x                (entry_bkptb[21]             ),
  .entry_create_32_start_x      (entry_create_32_start[21]   ),
  .entry_create_acc_err_x       (entry_create_acc_err[21]    ),
  .entry_create_bkpta_x         (entry_create_bkpta[21]      ),
  .entry_create_bkptb_x         (entry_create_bkptb[21]      ),
  .entry_create_fence_x         (entry_create_fence[21]      ),
  .entry_create_high_expt_x     (entry_create_high_expt[21]  ),
  .entry_create_inst_data_v     (entry_create_inst_data_21   ),
  .entry_create_no_spec_x       (entry_create_no_spec[21]    ),
  .entry_create_pc_v            (entry_create_pc_21          ),
  .entry_create_pgflt_x         (entry_create_pgflt[21]      ),
  .entry_create_split0_x        (entry_create_split0[21]     ),
  .entry_create_split1_x        (entry_create_split1[21]     ),
  .entry_create_vl_pred_x       (entry_create_vl_pred[21]    ),
  .entry_create_vl_v            (entry_create_vl_21          ),
  .entry_create_vlmul_v         (entry_create_vlmul_21       ),
  .entry_create_vsew_v          (entry_create_vsew_21        ),
  .entry_create_x               (entry_create[21]            ),
  .entry_data_create_clk_en_x   (entry_data_create_clk_en[21]),
  .entry_data_create_x          (entry_data_create[21]       ),
  .entry_fence_x                (entry_fence[21]             ),
  .entry_high_expt_x            (entry_high_expt[21]         ),
  .entry_inst_data_v            (entry_inst_data_21          ),
  .entry_no_spec_x              (entry_no_spec[21]           ),
  .entry_pc_create_clk_en_x     (entry_pc_create_clk_en[21]  ),
  .entry_pc_create_x            (entry_pc_create[21]         ),
  .entry_pc_v                   (entry_pc_21                 ),
  .entry_pgflt_x                (entry_pgflt[21]             ),
  .entry_retire_x               (entry_retire[21]            ),
  .entry_spe_data_vld           (entry_spe_data_vld          ),
  .entry_split0_x               (entry_split0[21]            ),
  .entry_split1_x               (entry_split1[21]            ),
  .entry_vl_pred_x              (entry_vl_pred[21]           ),
  .entry_vl_v                   (entry_vl_21                 ),
  .entry_vld_create_clk_en_x    (entry_vld_create_clk_en[21] ),
  .entry_vld_retire_clk_en_x    (entry_vld_retire_clk_en[21] ),
  .entry_vld_x                  (entry_vld[21]               ),
  .entry_vlmul_v                (entry_vlmul_21              ),
  .entry_vsew_v                 (entry_vsew_21               ),
  .forever_cpuclk               (forever_cpuclk              ),
  .ibuf_flush                   (ibuf_flush                  ),
  .pad_yy_icg_scan_en           (pad_yy_icg_scan_en          )
);


// &ConnRule(s/_x$/[22]/); @118
// &ConnRule(s/_v$/_22/); @119
// &Instance("ct_ifu_ibuf_entry","x_ct_ifu_ibuf_entry_22"); @120
ct_ifu_ibuf_entry  x_ct_ifu_ibuf_entry_22 (
  .cp0_ifu_icg_en               (cp0_ifu_icg_en              ),
  .cp0_yy_clk_en                (cp0_yy_clk_en               ),
  .cpurst_b                     (cpurst_b                    ),
  .entry_32_start_x             (entry_32_start[22]          ),
  .entry_acc_err_x              (entry_acc_err[22]           ),
  .entry_bkpta_x                (entry_bkpta[22]             ),
  .entry_bkptb_x                (entry_bkptb[22]             ),
  .entry_create_32_start_x      (entry_create_32_start[22]   ),
  .entry_create_acc_err_x       (entry_create_acc_err[22]    ),
  .entry_create_bkpta_x         (entry_create_bkpta[22]      ),
  .entry_create_bkptb_x         (entry_create_bkptb[22]      ),
  .entry_create_fence_x         (entry_create_fence[22]      ),
  .entry_create_high_expt_x     (entry_create_high_expt[22]  ),
  .entry_create_inst_data_v     (entry_create_inst_data_22   ),
  .entry_create_no_spec_x       (entry_create_no_spec[22]    ),
  .entry_create_pc_v            (entry_create_pc_22          ),
  .entry_create_pgflt_x         (entry_create_pgflt[22]      ),
  .entry_create_split0_x        (entry_create_split0[22]     ),
  .entry_create_split1_x        (entry_create_split1[22]     ),
  .entry_create_vl_pred_x       (entry_create_vl_pred[22]    ),
  .entry_create_vl_v            (entry_create_vl_22          ),
  .entry_create_vlmul_v         (entry_create_vlmul_22       ),
  .entry_create_vsew_v          (entry_create_vsew_22        ),
  .entry_create_x               (entry_create[22]            ),
  .entry_data_create_clk_en_x   (entry_data_create_clk_en[22]),
  .entry_data_create_x          (entry_data_create[22]       ),
  .entry_fence_x                (entry_fence[22]             ),
  .entry_high_expt_x            (entry_high_expt[22]         ),
  .entry_inst_data_v            (entry_inst_data_22          ),
  .entry_no_spec_x              (entry_no_spec[22]           ),
  .entry_pc_create_clk_en_x     (entry_pc_create_clk_en[22]  ),
  .entry_pc_create_x            (entry_pc_create[22]         ),
  .entry_pc_v                   (entry_pc_22                 ),
  .entry_pgflt_x                (entry_pgflt[22]             ),
  .entry_retire_x               (entry_retire[22]            ),
  .entry_spe_data_vld           (entry_spe_data_vld          ),
  .entry_split0_x               (entry_split0[22]            ),
  .entry_split1_x               (entry_split1[22]            ),
  .entry_vl_pred_x              (entry_vl_pred[22]           ),
  .entry_vl_v                   (entry_vl_22                 ),
  .entry_vld_create_clk_en_x    (entry_vld_create_clk_en[22] ),
  .entry_vld_retire_clk_en_x    (entry_vld_retire_clk_en[22] ),
  .entry_vld_x                  (entry_vld[22]               ),
  .entry_vlmul_v                (entry_vlmul_22              ),
  .entry_vsew_v                 (entry_vsew_22               ),
  .forever_cpuclk               (forever_cpuclk              ),
  .ibuf_flush                   (ibuf_flush                  ),
  .pad_yy_icg_scan_en           (pad_yy_icg_scan_en          )
);


// &ConnRule(s/_x$/[23]/); @122
// &ConnRule(s/_v$/_23/); @123
// &Instance("ct_ifu_ibuf_entry","x_ct_ifu_ibuf_entry_23"); @124
ct_ifu_ibuf_entry  x_ct_ifu_ibuf_entry_23 (
  .cp0_ifu_icg_en               (cp0_ifu_icg_en              ),
  .cp0_yy_clk_en                (cp0_yy_clk_en               ),
  .cpurst_b                     (cpurst_b                    ),
  .entry_32_start_x             (entry_32_start[23]          ),
  .entry_acc_err_x              (entry_acc_err[23]           ),
  .entry_bkpta_x                (entry_bkpta[23]             ),
  .entry_bkptb_x                (entry_bkptb[23]             ),
  .entry_create_32_start_x      (entry_create_32_start[23]   ),
  .entry_create_acc_err_x       (entry_create_acc_err[23]    ),
  .entry_create_bkpta_x         (entry_create_bkpta[23]      ),
  .entry_create_bkptb_x         (entry_create_bkptb[23]      ),
  .entry_create_fence_x         (entry_create_fence[23]      ),
  .entry_create_high_expt_x     (entry_create_high_expt[23]  ),
  .entry_create_inst_data_v     (entry_create_inst_data_23   ),
  .entry_create_no_spec_x       (entry_create_no_spec[23]    ),
  .entry_create_pc_v            (entry_create_pc_23          ),
  .entry_create_pgflt_x         (entry_create_pgflt[23]      ),
  .entry_create_split0_x        (entry_create_split0[23]     ),
  .entry_create_split1_x        (entry_create_split1[23]     ),
  .entry_create_vl_pred_x       (entry_create_vl_pred[23]    ),
  .entry_create_vl_v            (entry_create_vl_23          ),
  .entry_create_vlmul_v         (entry_create_vlmul_23       ),
  .entry_create_vsew_v          (entry_create_vsew_23        ),
  .entry_create_x               (entry_create[23]            ),
  .entry_data_create_clk_en_x   (entry_data_create_clk_en[23]),
  .entry_data_create_x          (entry_data_create[23]       ),
  .entry_fence_x                (entry_fence[23]             ),
  .entry_high_expt_x            (entry_high_expt[23]         ),
  .entry_inst_data_v            (entry_inst_data_23          ),
  .entry_no_spec_x              (entry_no_spec[23]           ),
  .entry_pc_create_clk_en_x     (entry_pc_create_clk_en[23]  ),
  .entry_pc_create_x            (entry_pc_create[23]         ),
  .entry_pc_v                   (entry_pc_23                 ),
  .entry_pgflt_x                (entry_pgflt[23]             ),
  .entry_retire_x               (entry_retire[23]            ),
  .entry_spe_data_vld           (entry_spe_data_vld          ),
  .entry_split0_x               (entry_split0[23]            ),
  .entry_split1_x               (entry_split1[23]            ),
  .entry_vl_pred_x              (entry_vl_pred[23]           ),
  .entry_vl_v                   (entry_vl_23                 ),
  .entry_vld_create_clk_en_x    (entry_vld_create_clk_en[23] ),
  .entry_vld_retire_clk_en_x    (entry_vld_retire_clk_en[23] ),
  .entry_vld_x                  (entry_vld[23]               ),
  .entry_vlmul_v                (entry_vlmul_23              ),
  .entry_vsew_v                 (entry_vsew_23               ),
  .forever_cpuclk               (forever_cpuclk              ),
  .ibuf_flush                   (ibuf_flush                  ),
  .pad_yy_icg_scan_en           (pad_yy_icg_scan_en          )
);


// &ConnRule(s/_x$/[24]/); @126
// &ConnRule(s/_v$/_24/); @127
// &Instance("ct_ifu_ibuf_entry","x_ct_ifu_ibuf_entry_24"); @128
ct_ifu_ibuf_entry  x_ct_ifu_ibuf_entry_24 (
  .cp0_ifu_icg_en               (cp0_ifu_icg_en              ),
  .cp0_yy_clk_en                (cp0_yy_clk_en               ),
  .cpurst_b                     (cpurst_b                    ),
  .entry_32_start_x             (entry_32_start[24]          ),
  .entry_acc_err_x              (entry_acc_err[24]           ),
  .entry_bkpta_x                (entry_bkpta[24]             ),
  .entry_bkptb_x                (entry_bkptb[24]             ),
  .entry_create_32_start_x      (entry_create_32_start[24]   ),
  .entry_create_acc_err_x       (entry_create_acc_err[24]    ),
  .entry_create_bkpta_x         (entry_create_bkpta[24]      ),
  .entry_create_bkptb_x         (entry_create_bkptb[24]      ),
  .entry_create_fence_x         (entry_create_fence[24]      ),
  .entry_create_high_expt_x     (entry_create_high_expt[24]  ),
  .entry_create_inst_data_v     (entry_create_inst_data_24   ),
  .entry_create_no_spec_x       (entry_create_no_spec[24]    ),
  .entry_create_pc_v            (entry_create_pc_24          ),
  .entry_create_pgflt_x         (entry_create_pgflt[24]      ),
  .entry_create_split0_x        (entry_create_split0[24]     ),
  .entry_create_split1_x        (entry_create_split1[24]     ),
  .entry_create_vl_pred_x       (entry_create_vl_pred[24]    ),
  .entry_create_vl_v            (entry_create_vl_24          ),
  .entry_create_vlmul_v         (entry_create_vlmul_24       ),
  .entry_create_vsew_v          (entry_create_vsew_24        ),
  .entry_create_x               (entry_create[24]            ),
  .entry_data_create_clk_en_x   (entry_data_create_clk_en[24]),
  .entry_data_create_x          (entry_data_create[24]       ),
  .entry_fence_x                (entry_fence[24]             ),
  .entry_high_expt_x            (entry_high_expt[24]         ),
  .entry_inst_data_v            (entry_inst_data_24          ),
  .entry_no_spec_x              (entry_no_spec[24]           ),
  .entry_pc_create_clk_en_x     (entry_pc_create_clk_en[24]  ),
  .entry_pc_create_x            (entry_pc_create[24]         ),
  .entry_pc_v                   (entry_pc_24                 ),
  .entry_pgflt_x                (entry_pgflt[24]             ),
  .entry_retire_x               (entry_retire[24]            ),
  .entry_spe_data_vld           (entry_spe_data_vld          ),
  .entry_split0_x               (entry_split0[24]            ),
  .entry_split1_x               (entry_split1[24]            ),
  .entry_vl_pred_x              (entry_vl_pred[24]           ),
  .entry_vl_v                   (entry_vl_24                 ),
  .entry_vld_create_clk_en_x    (entry_vld_create_clk_en[24] ),
  .entry_vld_retire_clk_en_x    (entry_vld_retire_clk_en[24] ),
  .entry_vld_x                  (entry_vld[24]               ),
  .entry_vlmul_v                (entry_vlmul_24              ),
  .entry_vsew_v                 (entry_vsew_24               ),
  .forever_cpuclk               (forever_cpuclk              ),
  .ibuf_flush                   (ibuf_flush                  ),
  .pad_yy_icg_scan_en           (pad_yy_icg_scan_en          )
);


// &ConnRule(s/_x$/[25]/); @130
// &ConnRule(s/_v$/_25/); @131
// &Instance("ct_ifu_ibuf_entry","x_ct_ifu_ibuf_entry_25"); @132
ct_ifu_ibuf_entry  x_ct_ifu_ibuf_entry_25 (
  .cp0_ifu_icg_en               (cp0_ifu_icg_en              ),
  .cp0_yy_clk_en                (cp0_yy_clk_en               ),
  .cpurst_b                     (cpurst_b                    ),
  .entry_32_start_x             (entry_32_start[25]          ),
  .entry_acc_err_x              (entry_acc_err[25]           ),
  .entry_bkpta_x                (entry_bkpta[25]             ),
  .entry_bkptb_x                (entry_bkptb[25]             ),
  .entry_create_32_start_x      (entry_create_32_start[25]   ),
  .entry_create_acc_err_x       (entry_create_acc_err[25]    ),
  .entry_create_bkpta_x         (entry_create_bkpta[25]      ),
  .entry_create_bkptb_x         (entry_create_bkptb[25]      ),
  .entry_create_fence_x         (entry_create_fence[25]      ),
  .entry_create_high_expt_x     (entry_create_high_expt[25]  ),
  .entry_create_inst_data_v     (entry_create_inst_data_25   ),
  .entry_create_no_spec_x       (entry_create_no_spec[25]    ),
  .entry_create_pc_v            (entry_create_pc_25          ),
  .entry_create_pgflt_x         (entry_create_pgflt[25]      ),
  .entry_create_split0_x        (entry_create_split0[25]     ),
  .entry_create_split1_x        (entry_create_split1[25]     ),
  .entry_create_vl_pred_x       (entry_create_vl_pred[25]    ),
  .entry_create_vl_v            (entry_create_vl_25          ),
  .entry_create_vlmul_v         (entry_create_vlmul_25       ),
  .entry_create_vsew_v          (entry_create_vsew_25        ),
  .entry_create_x               (entry_create[25]            ),
  .entry_data_create_clk_en_x   (entry_data_create_clk_en[25]),
  .entry_data_create_x          (entry_data_create[25]       ),
  .entry_fence_x                (entry_fence[25]             ),
  .entry_high_expt_x            (entry_high_expt[25]         ),
  .entry_inst_data_v            (entry_inst_data_25          ),
  .entry_no_spec_x              (entry_no_spec[25]           ),
  .entry_pc_create_clk_en_x     (entry_pc_create_clk_en[25]  ),
  .entry_pc_create_x            (entry_pc_create[25]         ),
  .entry_pc_v                   (entry_pc_25                 ),
  .entry_pgflt_x                (entry_pgflt[25]             ),
  .entry_retire_x               (entry_retire[25]            ),
  .entry_spe_data_vld           (entry_spe_data_vld          ),
  .entry_split0_x               (entry_split0[25]            ),
  .entry_split1_x               (entry_split1[25]            ),
  .entry_vl_pred_x              (entry_vl_pred[25]           ),
  .entry_vl_v                   (entry_vl_25                 ),
  .entry_vld_create_clk_en_x    (entry_vld_create_clk_en[25] ),
  .entry_vld_retire_clk_en_x    (entry_vld_retire_clk_en[25] ),
  .entry_vld_x                  (entry_vld[25]               ),
  .entry_vlmul_v                (entry_vlmul_25              ),
  .entry_vsew_v                 (entry_vsew_25               ),
  .forever_cpuclk               (forever_cpuclk              ),
  .ibuf_flush                   (ibuf_flush                  ),
  .pad_yy_icg_scan_en           (pad_yy_icg_scan_en          )
);


// &ConnRule(s/_x$/[26]/); @134
// &ConnRule(s/_v$/_26/); @135
// &Instance("ct_ifu_ibuf_entry","x_ct_ifu_ibuf_entry_26"); @136
ct_ifu_ibuf_entry  x_ct_ifu_ibuf_entry_26 (
  .cp0_ifu_icg_en               (cp0_ifu_icg_en              ),
  .cp0_yy_clk_en                (cp0_yy_clk_en               ),
  .cpurst_b                     (cpurst_b                    ),
  .entry_32_start_x             (entry_32_start[26]          ),
  .entry_acc_err_x              (entry_acc_err[26]           ),
  .entry_bkpta_x                (entry_bkpta[26]             ),
  .entry_bkptb_x                (entry_bkptb[26]             ),
  .entry_create_32_start_x      (entry_create_32_start[26]   ),
  .entry_create_acc_err_x       (entry_create_acc_err[26]    ),
  .entry_create_bkpta_x         (entry_create_bkpta[26]      ),
  .entry_create_bkptb_x         (entry_create_bkptb[26]      ),
  .entry_create_fence_x         (entry_create_fence[26]      ),
  .entry_create_high_expt_x     (entry_create_high_expt[26]  ),
  .entry_create_inst_data_v     (entry_create_inst_data_26   ),
  .entry_create_no_spec_x       (entry_create_no_spec[26]    ),
  .entry_create_pc_v            (entry_create_pc_26          ),
  .entry_create_pgflt_x         (entry_create_pgflt[26]      ),
  .entry_create_split0_x        (entry_create_split0[26]     ),
  .entry_create_split1_x        (entry_create_split1[26]     ),
  .entry_create_vl_pred_x       (entry_create_vl_pred[26]    ),
  .entry_create_vl_v            (entry_create_vl_26          ),
  .entry_create_vlmul_v         (entry_create_vlmul_26       ),
  .entry_create_vsew_v          (entry_create_vsew_26        ),
  .entry_create_x               (entry_create[26]            ),
  .entry_data_create_clk_en_x   (entry_data_create_clk_en[26]),
  .entry_data_create_x          (entry_data_create[26]       ),
  .entry_fence_x                (entry_fence[26]             ),
  .entry_high_expt_x            (entry_high_expt[26]         ),
  .entry_inst_data_v            (entry_inst_data_26          ),
  .entry_no_spec_x              (entry_no_spec[26]           ),
  .entry_pc_create_clk_en_x     (entry_pc_create_clk_en[26]  ),
  .entry_pc_create_x            (entry_pc_create[26]         ),
  .entry_pc_v                   (entry_pc_26                 ),
  .entry_pgflt_x                (entry_pgflt[26]             ),
  .entry_retire_x               (entry_retire[26]            ),
  .entry_spe_data_vld           (entry_spe_data_vld          ),
  .entry_split0_x               (entry_split0[26]            ),
  .entry_split1_x               (entry_split1[26]            ),
  .entry_vl_pred_x              (entry_vl_pred[26]           ),
  .entry_vl_v                   (entry_vl_26                 ),
  .entry_vld_create_clk_en_x    (entry_vld_create_clk_en[26] ),
  .entry_vld_retire_clk_en_x    (entry_vld_retire_clk_en[26] ),
  .entry_vld_x                  (entry_vld[26]               ),
  .entry_vlmul_v                (entry_vlmul_26              ),
  .entry_vsew_v                 (entry_vsew_26               ),
  .forever_cpuclk               (forever_cpuclk              ),
  .ibuf_flush                   (ibuf_flush                  ),
  .pad_yy_icg_scan_en           (pad_yy_icg_scan_en          )
);


// &ConnRule(s/_x$/[27]/); @138
// &ConnRule(s/_v$/_27/); @139
// &Instance("ct_ifu_ibuf_entry","x_ct_ifu_ibuf_entry_27"); @140
ct_ifu_ibuf_entry  x_ct_ifu_ibuf_entry_27 (
  .cp0_ifu_icg_en               (cp0_ifu_icg_en              ),
  .cp0_yy_clk_en                (cp0_yy_clk_en               ),
  .cpurst_b                     (cpurst_b                    ),
  .entry_32_start_x             (entry_32_start[27]          ),
  .entry_acc_err_x              (entry_acc_err[27]           ),
  .entry_bkpta_x                (entry_bkpta[27]             ),
  .entry_bkptb_x                (entry_bkptb[27]             ),
  .entry_create_32_start_x      (entry_create_32_start[27]   ),
  .entry_create_acc_err_x       (entry_create_acc_err[27]    ),
  .entry_create_bkpta_x         (entry_create_bkpta[27]      ),
  .entry_create_bkptb_x         (entry_create_bkptb[27]      ),
  .entry_create_fence_x         (entry_create_fence[27]      ),
  .entry_create_high_expt_x     (entry_create_high_expt[27]  ),
  .entry_create_inst_data_v     (entry_create_inst_data_27   ),
  .entry_create_no_spec_x       (entry_create_no_spec[27]    ),
  .entry_create_pc_v            (entry_create_pc_27          ),
  .entry_create_pgflt_x         (entry_create_pgflt[27]      ),
  .entry_create_split0_x        (entry_create_split0[27]     ),
  .entry_create_split1_x        (entry_create_split1[27]     ),
  .entry_create_vl_pred_x       (entry_create_vl_pred[27]    ),
  .entry_create_vl_v            (entry_create_vl_27          ),
  .entry_create_vlmul_v         (entry_create_vlmul_27       ),
  .entry_create_vsew_v          (entry_create_vsew_27        ),
  .entry_create_x               (entry_create[27]            ),
  .entry_data_create_clk_en_x   (entry_data_create_clk_en[27]),
  .entry_data_create_x          (entry_data_create[27]       ),
  .entry_fence_x                (entry_fence[27]             ),
  .entry_high_expt_x            (entry_high_expt[27]         ),
  .entry_inst_data_v            (entry_inst_data_27          ),
  .entry_no_spec_x              (entry_no_spec[27]           ),
  .entry_pc_create_clk_en_x     (entry_pc_create_clk_en[27]  ),
  .entry_pc_create_x            (entry_pc_create[27]         ),
  .entry_pc_v                   (entry_pc_27                 ),
  .entry_pgflt_x                (entry_pgflt[27]             ),
  .entry_retire_x               (entry_retire[27]            ),
  .entry_spe_data_vld           (entry_spe_data_vld          ),
  .entry_split0_x               (entry_split0[27]            ),
  .entry_split1_x               (entry_split1[27]            ),
  .entry_vl_pred_x              (entry_vl_pred[27]           ),
  .entry_vl_v                   (entry_vl_27                 ),
  .entry_vld_create_clk_en_x    (entry_vld_create_clk_en[27] ),
  .entry_vld_retire_clk_en_x    (entry_vld_retire_clk_en[27] ),
  .entry_vld_x                  (entry_vld[27]               ),
  .entry_vlmul_v                (entry_vlmul_27              ),
  .entry_vsew_v                 (entry_vsew_27               ),
  .forever_cpuclk               (forever_cpuclk              ),
  .ibuf_flush                   (ibuf_flush                  ),
  .pad_yy_icg_scan_en           (pad_yy_icg_scan_en          )
);


// &ConnRule(s/_x$/[28]/); @142
// &ConnRule(s/_v$/_28/); @143
// &Instance("ct_ifu_ibuf_entry","x_ct_ifu_ibuf_entry_28"); @144
ct_ifu_ibuf_entry  x_ct_ifu_ibuf_entry_28 (
  .cp0_ifu_icg_en               (cp0_ifu_icg_en              ),
  .cp0_yy_clk_en                (cp0_yy_clk_en               ),
  .cpurst_b                     (cpurst_b                    ),
  .entry_32_start_x             (entry_32_start[28]          ),
  .entry_acc_err_x              (entry_acc_err[28]           ),
  .entry_bkpta_x                (entry_bkpta[28]             ),
  .entry_bkptb_x                (entry_bkptb[28]             ),
  .entry_create_32_start_x      (entry_create_32_start[28]   ),
  .entry_create_acc_err_x       (entry_create_acc_err[28]    ),
  .entry_create_bkpta_x         (entry_create_bkpta[28]      ),
  .entry_create_bkptb_x         (entry_create_bkptb[28]      ),
  .entry_create_fence_x         (entry_create_fence[28]      ),
  .entry_create_high_expt_x     (entry_create_high_expt[28]  ),
  .entry_create_inst_data_v     (entry_create_inst_data_28   ),
  .entry_create_no_spec_x       (entry_create_no_spec[28]    ),
  .entry_create_pc_v            (entry_create_pc_28          ),
  .entry_create_pgflt_x         (entry_create_pgflt[28]      ),
  .entry_create_split0_x        (entry_create_split0[28]     ),
  .entry_create_split1_x        (entry_create_split1[28]     ),
  .entry_create_vl_pred_x       (entry_create_vl_pred[28]    ),
  .entry_create_vl_v            (entry_create_vl_28          ),
  .entry_create_vlmul_v         (entry_create_vlmul_28       ),
  .entry_create_vsew_v          (entry_create_vsew_28        ),
  .entry_create_x               (entry_create[28]            ),
  .entry_data_create_clk_en_x   (entry_data_create_clk_en[28]),
  .entry_data_create_x          (entry_data_create[28]       ),
  .entry_fence_x                (entry_fence[28]             ),
  .entry_high_expt_x            (entry_high_expt[28]         ),
  .entry_inst_data_v            (entry_inst_data_28          ),
  .entry_no_spec_x              (entry_no_spec[28]           ),
  .entry_pc_create_clk_en_x     (entry_pc_create_clk_en[28]  ),
  .entry_pc_create_x            (entry_pc_create[28]         ),
  .entry_pc_v                   (entry_pc_28                 ),
  .entry_pgflt_x                (entry_pgflt[28]             ),
  .entry_retire_x               (entry_retire[28]            ),
  .entry_spe_data_vld           (entry_spe_data_vld          ),
  .entry_split0_x               (entry_split0[28]            ),
  .entry_split1_x               (entry_split1[28]            ),
  .entry_vl_pred_x              (entry_vl_pred[28]           ),
  .entry_vl_v                   (entry_vl_28                 ),
  .entry_vld_create_clk_en_x    (entry_vld_create_clk_en[28] ),
  .entry_vld_retire_clk_en_x    (entry_vld_retire_clk_en[28] ),
  .entry_vld_x                  (entry_vld[28]               ),
  .entry_vlmul_v                (entry_vlmul_28              ),
  .entry_vsew_v                 (entry_vsew_28               ),
  .forever_cpuclk               (forever_cpuclk              ),
  .ibuf_flush                   (ibuf_flush                  ),
  .pad_yy_icg_scan_en           (pad_yy_icg_scan_en          )
);


// &ConnRule(s/_x$/[29]/); @146
// &ConnRule(s/_v$/_29/); @147
// &Instance("ct_ifu_ibuf_entry","x_ct_ifu_ibuf_entry_29"); @148
ct_ifu_ibuf_entry  x_ct_ifu_ibuf_entry_29 (
  .cp0_ifu_icg_en               (cp0_ifu_icg_en              ),
  .cp0_yy_clk_en                (cp0_yy_clk_en               ),
  .cpurst_b                     (cpurst_b                    ),
  .entry_32_start_x             (entry_32_start[29]          ),
  .entry_acc_err_x              (entry_acc_err[29]           ),
  .entry_bkpta_x                (entry_bkpta[29]             ),
  .entry_bkptb_x                (entry_bkptb[29]             ),
  .entry_create_32_start_x      (entry_create_32_start[29]   ),
  .entry_create_acc_err_x       (entry_create_acc_err[29]    ),
  .entry_create_bkpta_x         (entry_create_bkpta[29]      ),
  .entry_create_bkptb_x         (entry_create_bkptb[29]      ),
  .entry_create_fence_x         (entry_create_fence[29]      ),
  .entry_create_high_expt_x     (entry_create_high_expt[29]  ),
  .entry_create_inst_data_v     (entry_create_inst_data_29   ),
  .entry_create_no_spec_x       (entry_create_no_spec[29]    ),
  .entry_create_pc_v            (entry_create_pc_29          ),
  .entry_create_pgflt_x         (entry_create_pgflt[29]      ),
  .entry_create_split0_x        (entry_create_split0[29]     ),
  .entry_create_split1_x        (entry_create_split1[29]     ),
  .entry_create_vl_pred_x       (entry_create_vl_pred[29]    ),
  .entry_create_vl_v            (entry_create_vl_29          ),
  .entry_create_vlmul_v         (entry_create_vlmul_29       ),
  .entry_create_vsew_v          (entry_create_vsew_29        ),
  .entry_create_x               (entry_create[29]            ),
  .entry_data_create_clk_en_x   (entry_data_create_clk_en[29]),
  .entry_data_create_x          (entry_data_create[29]       ),
  .entry_fence_x                (entry_fence[29]             ),
  .entry_high_expt_x            (entry_high_expt[29]         ),
  .entry_inst_data_v            (entry_inst_data_29          ),
  .entry_no_spec_x              (entry_no_spec[29]           ),
  .entry_pc_create_clk_en_x     (entry_pc_create_clk_en[29]  ),
  .entry_pc_create_x            (entry_pc_create[29]         ),
  .entry_pc_v                   (entry_pc_29                 ),
  .entry_pgflt_x                (entry_pgflt[29]             ),
  .entry_retire_x               (entry_retire[29]            ),
  .entry_spe_data_vld           (entry_spe_data_vld          ),
  .entry_split0_x               (entry_split0[29]            ),
  .entry_split1_x               (entry_split1[29]            ),
  .entry_vl_pred_x              (entry_vl_pred[29]           ),
  .entry_vl_v                   (entry_vl_29                 ),
  .entry_vld_create_clk_en_x    (entry_vld_create_clk_en[29] ),
  .entry_vld_retire_clk_en_x    (entry_vld_retire_clk_en[29] ),
  .entry_vld_x                  (entry_vld[29]               ),
  .entry_vlmul_v                (entry_vlmul_29              ),
  .entry_vsew_v                 (entry_vsew_29               ),
  .forever_cpuclk               (forever_cpuclk              ),
  .ibuf_flush                   (ibuf_flush                  ),
  .pad_yy_icg_scan_en           (pad_yy_icg_scan_en          )
);


// &ConnRule(s/_x$/[30]/); @150
// &ConnRule(s/_v$/_30/); @151
// &Instance("ct_ifu_ibuf_entry","x_ct_ifu_ibuf_entry_30"); @152
ct_ifu_ibuf_entry  x_ct_ifu_ibuf_entry_30 (
  .cp0_ifu_icg_en               (cp0_ifu_icg_en              ),
  .cp0_yy_clk_en                (cp0_yy_clk_en               ),
  .cpurst_b                     (cpurst_b                    ),
  .entry_32_start_x             (entry_32_start[30]          ),
  .entry_acc_err_x              (entry_acc_err[30]           ),
  .entry_bkpta_x                (entry_bkpta[30]             ),
  .entry_bkptb_x                (entry_bkptb[30]             ),
  .entry_create_32_start_x      (entry_create_32_start[30]   ),
  .entry_create_acc_err_x       (entry_create_acc_err[30]    ),
  .entry_create_bkpta_x         (entry_create_bkpta[30]      ),
  .entry_create_bkptb_x         (entry_create_bkptb[30]      ),
  .entry_create_fence_x         (entry_create_fence[30]      ),
  .entry_create_high_expt_x     (entry_create_high_expt[30]  ),
  .entry_create_inst_data_v     (entry_create_inst_data_30   ),
  .entry_create_no_spec_x       (entry_create_no_spec[30]    ),
  .entry_create_pc_v            (entry_create_pc_30          ),
  .entry_create_pgflt_x         (entry_create_pgflt[30]      ),
  .entry_create_split0_x        (entry_create_split0[30]     ),
  .entry_create_split1_x        (entry_create_split1[30]     ),
  .entry_create_vl_pred_x       (entry_create_vl_pred[30]    ),
  .entry_create_vl_v            (entry_create_vl_30          ),
  .entry_create_vlmul_v         (entry_create_vlmul_30       ),
  .entry_create_vsew_v          (entry_create_vsew_30        ),
  .entry_create_x               (entry_create[30]            ),
  .entry_data_create_clk_en_x   (entry_data_create_clk_en[30]),
  .entry_data_create_x          (entry_data_create[30]       ),
  .entry_fence_x                (entry_fence[30]             ),
  .entry_high_expt_x            (entry_high_expt[30]         ),
  .entry_inst_data_v            (entry_inst_data_30          ),
  .entry_no_spec_x              (entry_no_spec[30]           ),
  .entry_pc_create_clk_en_x     (entry_pc_create_clk_en[30]  ),
  .entry_pc_create_x            (entry_pc_create[30]         ),
  .entry_pc_v                   (entry_pc_30                 ),
  .entry_pgflt_x                (entry_pgflt[30]             ),
  .entry_retire_x               (entry_retire[30]            ),
  .entry_spe_data_vld           (entry_spe_data_vld          ),
  .entry_split0_x               (entry_split0[30]            ),
  .entry_split1_x               (entry_split1[30]            ),
  .entry_vl_pred_x              (entry_vl_pred[30]           ),
  .entry_vl_v                   (entry_vl_30                 ),
  .entry_vld_create_clk_en_x    (entry_vld_create_clk_en[30] ),
  .entry_vld_retire_clk_en_x    (entry_vld_retire_clk_en[30] ),
  .entry_vld_x                  (entry_vld[30]               ),
  .entry_vlmul_v                (entry_vlmul_30              ),
  .entry_vsew_v                 (entry_vsew_30               ),
  .forever_cpuclk               (forever_cpuclk              ),
  .ibuf_flush                   (ibuf_flush                  ),
  .pad_yy_icg_scan_en           (pad_yy_icg_scan_en          )
);


// &ConnRule(s/_x$/[31]/); @154
// &ConnRule(s/_v$/_31/); @155
// &Instance("ct_ifu_ibuf_entry","x_ct_ifu_ibuf_entry_31"); @156
ct_ifu_ibuf_entry  x_ct_ifu_ibuf_entry_31 (
  .cp0_ifu_icg_en               (cp0_ifu_icg_en              ),
  .cp0_yy_clk_en                (cp0_yy_clk_en               ),
  .cpurst_b                     (cpurst_b                    ),
  .entry_32_start_x             (entry_32_start[31]          ),
  .entry_acc_err_x              (entry_acc_err[31]           ),
  .entry_bkpta_x                (entry_bkpta[31]             ),
  .entry_bkptb_x                (entry_bkptb[31]             ),
  .entry_create_32_start_x      (entry_create_32_start[31]   ),
  .entry_create_acc_err_x       (entry_create_acc_err[31]    ),
  .entry_create_bkpta_x         (entry_create_bkpta[31]      ),
  .entry_create_bkptb_x         (entry_create_bkptb[31]      ),
  .entry_create_fence_x         (entry_create_fence[31]      ),
  .entry_create_high_expt_x     (entry_create_high_expt[31]  ),
  .entry_create_inst_data_v     (entry_create_inst_data_31   ),
  .entry_create_no_spec_x       (entry_create_no_spec[31]    ),
  .entry_create_pc_v            (entry_create_pc_31          ),
  .entry_create_pgflt_x         (entry_create_pgflt[31]      ),
  .entry_create_split0_x        (entry_create_split0[31]     ),
  .entry_create_split1_x        (entry_create_split1[31]     ),
  .entry_create_vl_pred_x       (entry_create_vl_pred[31]    ),
  .entry_create_vl_v            (entry_create_vl_31          ),
  .entry_create_vlmul_v         (entry_create_vlmul_31       ),
  .entry_create_vsew_v          (entry_create_vsew_31        ),
  .entry_create_x               (entry_create[31]            ),
  .entry_data_create_clk_en_x   (entry_data_create_clk_en[31]),
  .entry_data_create_x          (entry_data_create[31]       ),
  .entry_fence_x                (entry_fence[31]             ),
  .entry_high_expt_x            (entry_high_expt[31]         ),
  .entry_inst_data_v            (entry_inst_data_31          ),
  .entry_no_spec_x              (entry_no_spec[31]           ),
  .entry_pc_create_clk_en_x     (entry_pc_create_clk_en[31]  ),
  .entry_pc_create_x            (entry_pc_create[31]         ),
  .entry_pc_v                   (entry_pc_31                 ),
  .entry_pgflt_x                (entry_pgflt[31]             ),
  .entry_retire_x               (entry_retire[31]            ),
  .entry_spe_data_vld           (entry_spe_data_vld          ),
  .entry_split0_x               (entry_split0[31]            ),
  .entry_split1_x               (entry_split1[31]            ),
  .entry_vl_pred_x              (entry_vl_pred[31]           ),
  .entry_vl_v                   (entry_vl_31                 ),
  .entry_vld_create_clk_en_x    (entry_vld_create_clk_en[31] ),
  .entry_vld_retire_clk_en_x    (entry_vld_retire_clk_en[31] ),
  .entry_vld_x                  (entry_vld[31]               ),
  .entry_vlmul_v                (entry_vlmul_31              ),
  .entry_vsew_v                 (entry_vsew_31               ),
  .forever_cpuclk               (forever_cpuclk              ),
  .ibuf_flush                   (ibuf_flush                  ),
  .pad_yy_icg_scan_en           (pad_yy_icg_scan_en          )
);


//==========================================================
//               Create Pointer Logic
//==========================================================
parameter ENTRY_NUM = 32;

//According to the number of Half Word Pipedown, 
//Pre generate create pointer
// &CombBeg; @165
always @( ibuf_create_pointer[31:0]
       or ibdp_ibuf_half_vld_num[3:0])
begin
case(ibdp_ibuf_half_vld_num[3:0])
  4'b0001 : create_pointer_pre[ENTRY_NUM-1:0] = {ibuf_create_pointer[ENTRY_NUM-2:0],
                                                 ibuf_create_pointer[ENTRY_NUM-1]};
  4'b0010 : create_pointer_pre[ENTRY_NUM-1:0] = {ibuf_create_pointer[ENTRY_NUM-3:0],
                                                 ibuf_create_pointer[ENTRY_NUM-1:ENTRY_NUM-2]};
  4'b0011 : create_pointer_pre[ENTRY_NUM-1:0] = {ibuf_create_pointer[ENTRY_NUM-4:0],
                                                 ibuf_create_pointer[ENTRY_NUM-1:ENTRY_NUM-3]};
  4'b0100 : create_pointer_pre[ENTRY_NUM-1:0] = {ibuf_create_pointer[ENTRY_NUM-5:0],
                                                 ibuf_create_pointer[ENTRY_NUM-1:ENTRY_NUM-4]};
  4'b0101 : create_pointer_pre[ENTRY_NUM-1:0] = {ibuf_create_pointer[ENTRY_NUM-6:0],
                                                 ibuf_create_pointer[ENTRY_NUM-1:ENTRY_NUM-5]};
  4'b0110 : create_pointer_pre[ENTRY_NUM-1:0] = {ibuf_create_pointer[ENTRY_NUM-7:0],
                                                 ibuf_create_pointer[ENTRY_NUM-1:ENTRY_NUM-6]};
  4'b0111 : create_pointer_pre[ENTRY_NUM-1:0] = {ibuf_create_pointer[ENTRY_NUM-8:0],
                                                 ibuf_create_pointer[ENTRY_NUM-1:ENTRY_NUM-7]};
  4'b1000 : create_pointer_pre[ENTRY_NUM-1:0] = {ibuf_create_pointer[ENTRY_NUM-9:0],
                                                 ibuf_create_pointer[ENTRY_NUM-1:ENTRY_NUM-8]};
  4'b1001 : create_pointer_pre[ENTRY_NUM-1:0] = {ibuf_create_pointer[ENTRY_NUM-10:0],
                                                 ibuf_create_pointer[ENTRY_NUM-1:ENTRY_NUM-9]};
  default : create_pointer_pre[ENTRY_NUM-1:0] =  ibuf_create_pointer[ENTRY_NUM-1:0];
endcase
// &CombEnd; @187
end

//Pre generate create pointer after bypass
//bypass_half_num[2:0] can only be 3/4/5/6 normally
//&CombBeg;
//casez({bypass_way_inst2_valid, bypass_way_half_num[2:0]})
//  4'b0??? : create_pointer_pre_bypass[ENTRY_NUM-1:0] = ibuf_create_pointer[ENTRY_NUM-1:0];
//  4'b1011 : create_pointer_pre_bypass[ENTRY_NUM-1:0] = {create_pointer_pre[2:0],
//                                                        create_pointer_pre[ENTRY_NUM-1:3]}; 
//  4'b1100 : create_pointer_pre_bypass[ENTRY_NUM-1:0] = {create_pointer_pre[3:0],
//                                                        create_pointer_pre[ENTRY_NUM-1:4]}; 
//  4'b1101 : create_pointer_pre_bypass[ENTRY_NUM-1:0] = {create_pointer_pre[4:0],
//                                                        create_pointer_pre[ENTRY_NUM-1:5]}; 
//  4'b1110 : create_pointer_pre_bypass[ENTRY_NUM-1:0] = {create_pointer_pre[5:0],
//                                                        create_pointer_pre[ENTRY_NUM-1:6]};
//  default : create_pointer_pre_bypass[ENTRY_NUM-1:0] = create_pointer_pre[ENTRY_NUM-1:0];
//endcase
//&CombEnd;
//-----------Create Pointer Register Update-----------------
//Gate Clock
// &Instance("gated_clk_cell","x_ibuf_create_pointer_update_clk"); @207
gated_clk_cell  x_ibuf_create_pointer_update_clk (
  .clk_in                            (forever_cpuclk                   ),
  .clk_out                           (ibuf_create_pointer_update_clk   ),
  .external_en                       (1'b0                             ),
  .global_en                         (cp0_yy_clk_en                    ),
  .local_en                          (ibuf_create_pointer_update_clk_en),
  .module_en                         (cp0_ifu_icg_en                   ),
  .pad_yy_icg_scan_en                (pad_yy_icg_scan_en               )
);

// &Connect( .clk_in         (forever_cpuclk), @208
//           .clk_out        (ibuf_create_pointer_update_clk),//Out Clock @209
//           .external_en    (1'b0), @210
//           .global_en      (cp0_yy_clk_en), @211
//           .local_en       (ibuf_create_pointer_update_clk_en),//Local Condition @212
//           .module_en      (cp0_ifu_icg_en) @213
//         ); @214
assign ibuf_create_pointer_update_clk_en = ibuf_flush || ibuf_create_vld;

//Update Logic
always @(posedge ibuf_create_pointer_update_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ibuf_create_pointer[ENTRY_NUM-1:0] <= {{(ENTRY_NUM-1){1'b0}}, 1'b1};
  else if(ibuf_flush)
    ibuf_create_pointer[ENTRY_NUM-1:0] <= {{(ENTRY_NUM-1){1'b0}}, 1'b1};
  else if(ibuf_create_vld)
    ibuf_create_pointer[ENTRY_NUM-1:0] <= create_pointer_pre[ENTRY_NUM-1:0];
//  else if(ibuf_create_vld && bypass_vld)
//    ibuf_create_pointer[ENTRY_NUM-1:0] <= create_pointer_pre_bypass[ENTRY_NUM-1:0];
  else
    ibuf_create_pointer[ENTRY_NUM-1:0] <= ibuf_create_pointer[ENTRY_NUM-1:0];
end

//===create_num and retire_num for ibuf full/empty logic===
//Gate Clk
// &Instance("gated_clk_cell","x_ibuf_num_clk"); @234
gated_clk_cell  x_ibuf_num_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (ibuf_num_clk      ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (ibuf_num_clk_en   ),
  .module_en          (cp0_ifu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect( .clk_in         (forever_cpuclk), @235
//           .clk_out        (ibuf_num_clk),//Out Clock @236
//           .external_en    (1'b0), @237
//           .global_en      (cp0_yy_clk_en), @238
//           .local_en       (ibuf_num_clk_en),//Local Condition @239
//           .module_en      (cp0_ifu_icg_en) @240
//         ); @241
assign ibuf_num_clk_en = ibuf_num_updt;
assign ibuf_num_updt   = ibuf_flush || 
                         ibuf_retire_vld || 
                         ibuf_create_vld;

//ibuf_create_num[4:0]
always @(posedge ibuf_num_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ibuf_create_num[4:0] <= 5'b0;
  else if(ibuf_flush || ibuf_create_vld)
    ibuf_create_num[4:0] <= ibuf_create_num_pre[4:0];
  else
    ibuf_create_num[4:0] <= ibuf_create_num[4:0];
end

// &CombBeg; @258
always @( bypass_vld
       or ibuf_create_vld
       or ibuf_create_num[4:0]
       or ibuf_flush
       or create_num_pre_bypass[4:0]
       or create_num_pre[4:0])
begin
if(ibuf_flush)
  ibuf_create_num_pre[4:0] = 5'b0;
else if(ibuf_create_vld && !bypass_vld)
  ibuf_create_num_pre[4:0] = create_num_pre[4:0];
else if(ibuf_create_vld && bypass_vld)
  ibuf_create_num_pre[4:0] = create_num_pre_bypass[4:0];
else
  ibuf_create_num_pre[4:0] = ibuf_create_num[4:0];
// &CombEnd; @267
end

// &CombBeg; @269
always @( ibuf_create_num[4:0]
       or ibdp_ibuf_half_vld_num[3:0])
begin
case(ibdp_ibuf_half_vld_num[3:0])
  4'b0001 : create_num_pre[4:0] = ibuf_create_num[4:0] + 5'd1;
  4'b0010 : create_num_pre[4:0] = ibuf_create_num[4:0] + 5'd2;
  4'b0011 : create_num_pre[4:0] = ibuf_create_num[4:0] + 5'd3;
  4'b0100 : create_num_pre[4:0] = ibuf_create_num[4:0] + 5'd4;
  4'b0101 : create_num_pre[4:0] = ibuf_create_num[4:0] + 5'd5;
  4'b0110 : create_num_pre[4:0] = ibuf_create_num[4:0] + 5'd6;
  4'b0111 : create_num_pre[4:0] = ibuf_create_num[4:0] + 5'd7;
  4'b1000 : create_num_pre[4:0] = ibuf_create_num[4:0] + 5'd8;
  4'b1001 : create_num_pre[4:0] = ibuf_create_num[4:0] + 5'd9;
  default : create_num_pre[4:0] = ibuf_create_num[4:0];
endcase
// &CombEnd; @282
end

// &CombBeg; @284
always @( ibuf_create_num[4:0]
       or bypass_way_inst2_valid
       or bypass_way_half_num[2:0]
       or create_num_pre[4:0])
begin
casez({bypass_way_inst2_valid, bypass_way_half_num[2:0]})
  4'b0??? : create_num_pre_bypass[4:0] = ibuf_create_num[4:0];
  4'b1011 : create_num_pre_bypass[4:0] = create_num_pre[4:0] - 5'd3;
  4'b1100 : create_num_pre_bypass[4:0] = create_num_pre[4:0] - 5'd4;
  4'b1101 : create_num_pre_bypass[4:0] = create_num_pre[4:0] - 5'd5;
  4'b1110 : create_num_pre_bypass[4:0] = create_num_pre[4:0] - 5'd6;
  default : create_num_pre_bypass[4:0] = create_num_pre[4:0];
endcase
// &CombEnd; @293
end

//ibuf_retire_num[4:0]
always @(posedge ibuf_num_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ibuf_retire_num[4:0] <= 5'b0;
  else if(ibuf_flush || ibuf_retire_vld)
    ibuf_retire_num[4:0] <= ibuf_retire_num_pre[4:0];
  else
    ibuf_retire_num[4:0] <= ibuf_retire_num[4:0];
end

// &CombBeg; @306
always @( ibuf_flush
       or ibuf_retire_num[4:0]
       or retire_num_pre[4:0]
       or ibuf_retire_vld)
begin
if(ibuf_flush)
  ibuf_retire_num_pre[4:0] = 5'b0;
else if(ibuf_retire_vld)
  ibuf_retire_num_pre[4:0] = retire_num_pre[4:0];
else
  ibuf_retire_num_pre[4:0] = ibuf_retire_num[4:0];
// &CombEnd; @313
end

// &CombBeg; @315
always @( merge_half_num[4:0]
       or ibuf_create_num[4:0]
       or ibuf_retire_num[4:0]
       or ibuf_pop_inst2_valid
       or ibuf_pop3_half_num[2:0])
begin
casez({ibuf_pop_inst2_valid, ibuf_pop3_half_num[2:0]})
  4'b0??? : retire_num_pre[4:0] = ibuf_create_num[4:0] + merge_half_num[4:0];
  4'b1011 : retire_num_pre[4:0] = ibuf_retire_num[4:0] + 5'd3;
  4'b1100 : retire_num_pre[4:0] = ibuf_retire_num[4:0] + 5'd4;
  4'b1101 : retire_num_pre[4:0] = ibuf_retire_num[4:0] + 5'd5;
  4'b1110 : retire_num_pre[4:0] = ibuf_retire_num[4:0] + 5'd6;
  default : retire_num_pre[4:0] = ibuf_retire_num[4:0];
endcase
// &CombEnd; @324
end

//ibuf_create_vld
assign ibuf_create_vld = ibctrl_ibuf_create_vld;
//ibctrl_ibuf_flush
assign ibuf_flush = ibctrl_ibuf_flush;
//bypass_vld when ibuf empty
//ib_ctrl_ibuf_bypass_not_select means idu_stall or bju_mispred stall
//When stop bypass way and only ibuf way write in
assign bypass_vld = (ibuf_create_num[4:0] == 
                     ibuf_retire_num[4:0]) && 
                     !ibctrl_ibuf_bypass_not_select;
//There are most 9 Half will be wrote into ibuf
//Thus need 9 create pointer to point different entry 
assign ibuf_create_pointer0[ENTRY_NUM-1:0] =  ibuf_create_pointer[ENTRY_NUM-1:0];
assign ibuf_create_pointer1[ENTRY_NUM-1:0] = {ibuf_create_pointer[ENTRY_NUM-2:0],
                                              ibuf_create_pointer[ENTRY_NUM-1]};
assign ibuf_create_pointer2[ENTRY_NUM-1:0] = {ibuf_create_pointer[ENTRY_NUM-3:0],
                                              ibuf_create_pointer[ENTRY_NUM-1:ENTRY_NUM-2]};
assign ibuf_create_pointer3[ENTRY_NUM-1:0] = {ibuf_create_pointer[ENTRY_NUM-4:0],
                                              ibuf_create_pointer[ENTRY_NUM-1:ENTRY_NUM-3]};
assign ibuf_create_pointer4[ENTRY_NUM-1:0] = {ibuf_create_pointer[ENTRY_NUM-5:0],
                                              ibuf_create_pointer[ENTRY_NUM-1:ENTRY_NUM-4]};
assign ibuf_create_pointer5[ENTRY_NUM-1:0] = {ibuf_create_pointer[ENTRY_NUM-6:0],
                                              ibuf_create_pointer[ENTRY_NUM-1:ENTRY_NUM-5]};
assign ibuf_create_pointer6[ENTRY_NUM-1:0] = {ibuf_create_pointer[ENTRY_NUM-7:0],
                                              ibuf_create_pointer[ENTRY_NUM-1:ENTRY_NUM-6]};
assign ibuf_create_pointer7[ENTRY_NUM-1:0] = {ibuf_create_pointer[ENTRY_NUM-8:0],
                                              ibuf_create_pointer[ENTRY_NUM-1:ENTRY_NUM-7]};
assign ibuf_create_pointer8[ENTRY_NUM-1:0] = {ibuf_create_pointer[ENTRY_NUM-9:0],
                                              ibuf_create_pointer[ENTRY_NUM-1:ENTRY_NUM-8]};


//==========================================================
//               IBUF FULL/EMPTY Logic
//==========================================================
//Use the create_pointer_pre, 
//read the entry will be pointed to
//If the entry is valid now, means ibuf full
assign ibuf_full  = |({ibuf_create_pointer[ENTRY_NUM-9:0],
                       ibuf_create_pointer[ENTRY_NUM-1:ENTRY_NUM-8]} & 
                       entry_vld[31:0]);
assign ibuf_empty = (ibuf_create_num[4:0] == 
                     ibuf_retire_num[4:0]) && 
                    !entry_vld[0]; //in case of 32 entry all valid

assign ibuf_lbuf_empty   = ibuf_empty;        
assign ibuf_ibctrl_stall = ibuf_full;
assign ibuf_ibctrl_empty = ibuf_empty;
//==========================================================
//               Retire Pointer Logic
//==========================================================
//According to the number of Half Word Write Out, 
//Pre generate retire pointer
//ibuf_write_out_half_num means the num of 
//pre generating 3 inst
//ibuf_write_out_half_num[3:0] can be 3/4/5/6

//if !ibuf_write_out_inst3_vld means ibuf write out empty
//set retire_pointer_pre = ibuf_create_pointer
// &CombBeg; @386
always @( ibuf_merge_retire_pointer[31:0]
       or ibuf_retire_pointer[31:0]
       or ibuf_pop_inst2_valid
       or ibuf_pop3_half_num[2:0])
begin
casez({ibuf_pop_inst2_valid, ibuf_pop3_half_num[2:0]})
  4'b0??? : retire_pointer_pre[ENTRY_NUM-1:0] =  ibuf_merge_retire_pointer[ENTRY_NUM-1:0];
  4'b1011 : retire_pointer_pre[ENTRY_NUM-1:0] = {ibuf_retire_pointer[ENTRY_NUM-4:0],
                                                 ibuf_retire_pointer[ENTRY_NUM-1:ENTRY_NUM-3]};
  4'b1100 : retire_pointer_pre[ENTRY_NUM-1:0] = {ibuf_retire_pointer[ENTRY_NUM-5:0],
                                                 ibuf_retire_pointer[ENTRY_NUM-1:ENTRY_NUM-4]};
  4'b1101 : retire_pointer_pre[ENTRY_NUM-1:0] = {ibuf_retire_pointer[ENTRY_NUM-6:0],
                                                 ibuf_retire_pointer[ENTRY_NUM-1:ENTRY_NUM-5]};
  4'b1110 : retire_pointer_pre[ENTRY_NUM-1:0] = {ibuf_retire_pointer[ENTRY_NUM-7:0],
                                                 ibuf_retire_pointer[ENTRY_NUM-1:ENTRY_NUM-6]};
  default : retire_pointer_pre[ENTRY_NUM-1:0] =  ibuf_retire_pointer[ENTRY_NUM-1:0];
endcase
// &CombEnd; @399
end

// &CombBeg; @401
always @( bypass_way_inst2_valid
       or ibuf_create_pointer[31:0]
       or bypass_way_half_num[2:0]
       or create_pointer_pre[31:0])
begin
casez({bypass_way_inst2_valid,bypass_way_half_num[2:0]})
  4'b0??? : retire_pointer_pre_bypass[ENTRY_NUM-1:0] =  create_pointer_pre[ENTRY_NUM-1:0];
  4'b1011 : retire_pointer_pre_bypass[ENTRY_NUM-1:0] = {ibuf_create_pointer[ENTRY_NUM-4:0],
                                                        ibuf_create_pointer[ENTRY_NUM-1:ENTRY_NUM-3]}; 
  4'b1100 : retire_pointer_pre_bypass[ENTRY_NUM-1:0] = {ibuf_create_pointer[ENTRY_NUM-5:0],
                                                        ibuf_create_pointer[ENTRY_NUM-1:ENTRY_NUM-4]}; 
  4'b1101 : retire_pointer_pre_bypass[ENTRY_NUM-1:0] = {ibuf_create_pointer[ENTRY_NUM-6:0],
                                                        ibuf_create_pointer[ENTRY_NUM-1:ENTRY_NUM-5]}; 
  4'b1110 : retire_pointer_pre_bypass[ENTRY_NUM-1:0] = {ibuf_create_pointer[ENTRY_NUM-7:0],
                                                        ibuf_create_pointer[ENTRY_NUM-1:ENTRY_NUM-6]};
  default : retire_pointer_pre_bypass[ENTRY_NUM-1:0] =  {ENTRY_NUM{1'bx}};
endcase
// &CombEnd; @414
end



//-----------Retire Pointer Register Update-----------------
//Gate Clock
// &Instance("gated_clk_cell","x_ibuf_retire_pointer_update_clk"); @420
gated_clk_cell  x_ibuf_retire_pointer_update_clk (
  .clk_in                            (forever_cpuclk                   ),
  .clk_out                           (ibuf_retire_pointer_update_clk   ),
  .external_en                       (1'b0                             ),
  .global_en                         (cp0_yy_clk_en                    ),
  .local_en                          (ibuf_retire_pointer_update_clk_en),
  .module_en                         (cp0_ifu_icg_en                   ),
  .pad_yy_icg_scan_en                (pad_yy_icg_scan_en               )
);

// &Connect( .clk_in         (forever_cpuclk), @421
//           .clk_out        (ibuf_retire_pointer_update_clk),//Out Clock @422
//           .external_en    (1'b0), @423
//           .global_en      (cp0_yy_clk_en), @424
//           .local_en       (ibuf_retire_pointer_update_clk_en),//Local Condition @425
//           .module_en      (cp0_ifu_icg_en) @426
//         ); @427
assign ibuf_retire_pointer_update_clk_en = ibuf_flush 
                                        || ibuf_retire_vld
                                        || ibuf_create_vld;

//Update Logic
always @(posedge ibuf_retire_pointer_update_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ibuf_retire_pointer[ENTRY_NUM-1:0] <= {{(ENTRY_NUM-1){1'b0}}, 1'b1};
  else if(ibuf_flush)
    ibuf_retire_pointer[ENTRY_NUM-1:0] <= {{(ENTRY_NUM-1){1'b0}}, 1'b1};
  else if(ibuf_retire_vld)
    ibuf_retire_pointer[ENTRY_NUM-1:0] <= retire_pointer_pre[ENTRY_NUM-1:0];
  else if(ibuf_create_vld && bypass_vld)
    ibuf_retire_pointer[ENTRY_NUM-1:0] <= retire_pointer_pre_bypass[ENTRY_NUM-1:0];
  else
    ibuf_retire_pointer[ENTRY_NUM-1:0] <= ibuf_retire_pointer[ENTRY_NUM-1:0];
end

//ibuf_retire_vld
assign ibuf_retire_vld = ibctrl_ibuf_retire_vld;

//There are most 6 Half will be wrote into ibuf
//Thus need 6 retire pointer to point different entry 
assign ibuf_retire_pointer0[ENTRY_NUM-1:0] = ibuf_retire_pointer[ENTRY_NUM-1:0];
assign ibuf_retire_pointer1[ENTRY_NUM-1:0] = {ibuf_retire_pointer[ENTRY_NUM-2:0],
                                              ibuf_retire_pointer[ENTRY_NUM-1]};
assign ibuf_retire_pointer2[ENTRY_NUM-1:0] = {ibuf_retire_pointer[ENTRY_NUM-3:0],
                                              ibuf_retire_pointer[ENTRY_NUM-1:ENTRY_NUM-2]};
assign ibuf_retire_pointer3[ENTRY_NUM-1:0] = {ibuf_retire_pointer[ENTRY_NUM-4:0],
                                              ibuf_retire_pointer[ENTRY_NUM-1:ENTRY_NUM-3]};
assign ibuf_retire_pointer4[ENTRY_NUM-1:0] = {ibuf_retire_pointer[ENTRY_NUM-5:0],
                                              ibuf_retire_pointer[ENTRY_NUM-1:ENTRY_NUM-4]};
assign ibuf_retire_pointer5[ENTRY_NUM-1:0] = {ibuf_retire_pointer[ENTRY_NUM-6:0],
                                              ibuf_retire_pointer[ENTRY_NUM-1:ENTRY_NUM-5]};

//==========================================================
//                  IBUF Create Logic
//==========================================================
//Include signal as following:
//entry_create[n]
//entry_retire[n]
//entry_create_inst_data_n
//entry_create_acc_err[n]
//entry_create_pgflt[n]
//entry_create_tinv[n]
//entry_create_tfatal[n]
//entry_create_high_expt[n]
//entry_create_inst_32_start[n]
//entry_create_split0[n]
//entry_create_split1[n]
//entry_create_fence[n]

//entry_create[n]
assign entry_create_nopass_pre[31:0]  = (ibuf_create_pointer0[31:0] & {32{ib_hn_create_vld[8]}} & {32{ibuf_nopass_merge_mask[8]}}) | 
                                        (ibuf_create_pointer1[31:0] & {32{ib_hn_create_vld[7]}} & {32{ibuf_nopass_merge_mask[7]}}) |  
                                        (ibuf_create_pointer2[31:0] & {32{ib_hn_create_vld[6]}} & {32{ibuf_nopass_merge_mask[6]}}) |  
                                        (ibuf_create_pointer3[31:0] & {32{ib_hn_create_vld[5]}} & {32{ibuf_nopass_merge_mask[5]}}) |  
                                        (ibuf_create_pointer4[31:0] & {32{ib_hn_create_vld[4]}} & {32{ibuf_nopass_merge_mask[4]}}) |  
                                        (ibuf_create_pointer5[31:0] & {32{ib_hn_create_vld[3]}} & {32{ibuf_nopass_merge_mask[3]}}) |  
                                        (ibuf_create_pointer6[31:0] & {32{ib_hn_create_vld[2]}} & {32{ibuf_nopass_merge_mask[2]}}) |  
                                        (ibuf_create_pointer7[31:0] & {32{ib_hn_create_vld[1]}} & {32{ibuf_nopass_merge_mask[1]}}) |  
                                        (ibuf_create_pointer8[31:0] & {32{ib_hn_create_vld[0]}} & {32{ibuf_nopass_merge_mask[0]}});
assign entry_create_nopass_pre_for_gateclk[31:0] = 
                                        (ibuf_create_pointer0[31:0] & {32{ib_hn_create_vld[8]}}) | 
                                        (ibuf_create_pointer1[31:0] & {32{ib_hn_create_vld[7]}}) |  
                                        (ibuf_create_pointer2[31:0] & {32{ib_hn_create_vld[6]}}) |  
                                        (ibuf_create_pointer3[31:0] & {32{ib_hn_create_vld[5]}}) |  
                                        (ibuf_create_pointer4[31:0] & {32{ib_hn_create_vld[4]}}) |  
                                        (ibuf_create_pointer5[31:0] & {32{ib_hn_create_vld[3]}}) |  
                                        (ibuf_create_pointer6[31:0] & {32{ib_hn_create_vld[2]}}) |  
                                        (ibuf_create_pointer7[31:0] & {32{ib_hn_create_vld[1]}}) |  
                                        (ibuf_create_pointer8[31:0] & {32{ib_hn_create_vld[0]}});
assign entry_pc_create_nopass_pre_for_gateclk[31:0] = 
                                        (ibuf_create_pointer0[31:0] & {32{ib_hn_create_vld[8]}} & {32{ib_hn_ldst[8]}}) | 
                                        (ibuf_create_pointer1[31:0] & {32{ib_hn_create_vld[7]}} & {32{ib_hn_ldst[7]}}) |  
                                        (ibuf_create_pointer2[31:0] & {32{ib_hn_create_vld[6]}} & {32{ib_hn_ldst[6]}}) |  
                                        (ibuf_create_pointer3[31:0] & {32{ib_hn_create_vld[5]}} & {32{ib_hn_ldst[5]}}) |  
                                        (ibuf_create_pointer4[31:0] & {32{ib_hn_create_vld[4]}} & {32{ib_hn_ldst[4]}}) |  
                                        (ibuf_create_pointer5[31:0] & {32{ib_hn_create_vld[3]}} & {32{ib_hn_ldst[3]}}) |  
                                        (ibuf_create_pointer6[31:0] & {32{ib_hn_create_vld[2]}} & {32{ib_hn_ldst[2]}}) |  
                                        (ibuf_create_pointer7[31:0] & {32{ib_hn_create_vld[1]}} & {32{ib_hn_ldst[1]}}) |  
                                        (ibuf_create_pointer8[31:0] & {32{ib_hn_create_vld[0]}} & {32{ib_hn_ldst[0]}});                 
assign entry_create_bypass_pre[31:0]  = (ibuf_create_pointer0[31:0] & {32{ib_hn_create_vld_bypass[8]}}) | 
                                        (ibuf_create_pointer1[31:0] & {32{ib_hn_create_vld_bypass[7]}}) |  
                                        (ibuf_create_pointer2[31:0] & {32{ib_hn_create_vld_bypass[6]}}) |  
                                        (ibuf_create_pointer3[31:0] & {32{ib_hn_create_vld_bypass[5]}}) |  
                                        (ibuf_create_pointer4[31:0] & {32{ib_hn_create_vld_bypass[4]}}) |  
                                        (ibuf_create_pointer5[31:0] & {32{ib_hn_create_vld_bypass[3]}}) |  
                                        (ibuf_create_pointer6[31:0] & {32{ib_hn_create_vld_bypass[2]}}) |  
                                        (ibuf_create_pointer7[31:0] & {32{ib_hn_create_vld_bypass[1]}}) |  
                                        (ibuf_create_pointer8[31:0] & {32{ib_hn_create_vld_bypass[0]}});
assign entry_pc_create_bypass_pre[31:0]  = 
                                        (ibuf_create_pointer0[31:0] & {32{ib_hn_create_vld_bypass[8]}} & {32{ib_hn_ldst[8]}}) | 
                                        (ibuf_create_pointer1[31:0] & {32{ib_hn_create_vld_bypass[7]}} & {32{ib_hn_ldst[7]}}) |  
                                        (ibuf_create_pointer2[31:0] & {32{ib_hn_create_vld_bypass[6]}} & {32{ib_hn_ldst[6]}}) |  
                                        (ibuf_create_pointer3[31:0] & {32{ib_hn_create_vld_bypass[5]}} & {32{ib_hn_ldst[5]}}) |  
                                        (ibuf_create_pointer4[31:0] & {32{ib_hn_create_vld_bypass[4]}} & {32{ib_hn_ldst[4]}}) |  
                                        (ibuf_create_pointer5[31:0] & {32{ib_hn_create_vld_bypass[3]}} & {32{ib_hn_ldst[3]}}) |  
                                        (ibuf_create_pointer6[31:0] & {32{ib_hn_create_vld_bypass[2]}} & {32{ib_hn_ldst[2]}}) |  
                                        (ibuf_create_pointer7[31:0] & {32{ib_hn_create_vld_bypass[1]}} & {32{ib_hn_ldst[1]}}) |  
                                        (ibuf_create_pointer8[31:0] & {32{ib_hn_create_vld_bypass[0]}} & {32{ib_hn_ldst[0]}});  
assign entry_create_pre[31:0]         = (bypass_vld) 
                                      ? entry_create_bypass_pre[31:0] 
                                      : entry_create_nopass_pre[31:0];
assign entry_create[31:0]             = entry_create_pre[31:0] & {32{ibuf_create_vld}};

//for power consumption
assign entry_pc_create[31:0]          = entry_create_pre[31:0] & {32{~ibuf_full}};
assign entry_pc_create_clk_en[31:0]   = entry_pc_create_bypass_pre[31:0] | 
                                        entry_pc_create_nopass_pre_for_gateclk[31:0];
//For timing consider
assign entry_data_create[31:0]        = entry_create_pre[31:0] & {32{~ibuf_full}} & {32{ibctrl_ibuf_data_vld}};
assign entry_data_create_clk_en[31:0] = entry_create_bypass_pre[31:0] | 
                                        entry_create_nopass_pre_for_gateclk[31:0];

assign entry_vld_create_clk_en[31:0]  = ibuf_create_pointer0[31:0] | 
                                        ibuf_create_pointer1[31:0] | 
                                        ibuf_create_pointer2[31:0] | 
                                        ibuf_create_pointer3[31:0] | 
                                        ibuf_create_pointer4[31:0] | 
                                        ibuf_create_pointer5[31:0] | 
                                        ibuf_create_pointer6[31:0] | 
                                        ibuf_create_pointer7[31:0] | 
                                        ibuf_create_pointer8[31:0]; 
assign entry_spe_data_vld             = ibctrl_ibuf_data_vld && 
                                       ( ibdp_ibuf_h0_vld && ibdp_ibuf_h0_spe_vld ||
                                         ibdp_ibuf_hn_acc_err_vld ||
                                         ibdp_ibuf_hn_mmu_acc_deny_vld ||
                                         ibdp_ibuf_hn_pgflt_vld ||
                                         ibdp_ibuf_hn_bkpta_vld ||
                                         ibdp_ibuf_hn_bkptb_vld ||
                                         ibdp_ibuf_hn_no_spec_vld);
                                          
//entry_create_acc_err[n]
assign entry_create_acc_err[31:0]    = (ibuf_create_pointer0[31:0] & {32{ib_hn_acc_err[8]}}) | 
                                       (ibuf_create_pointer1[31:0] & {32{ib_hn_acc_err[7]}}) |  
                                       (ibuf_create_pointer2[31:0] & {32{ib_hn_acc_err[6]}}) |  
                                       (ibuf_create_pointer3[31:0] & {32{ib_hn_acc_err[5]}}) |  
                                       (ibuf_create_pointer4[31:0] & {32{ib_hn_acc_err[4]}}) |  
                                       (ibuf_create_pointer5[31:0] & {32{ib_hn_acc_err[3]}}) |  
                                       (ibuf_create_pointer6[31:0] & {32{ib_hn_acc_err[2]}}) |  
                                       (ibuf_create_pointer7[31:0] & {32{ib_hn_acc_err[1]}}) |  
                                       (ibuf_create_pointer8[31:0] & {32{ib_hn_acc_err[0]}});

// &Force("nonport","ib_hn_ecc_err_bypass"); @586

//entry_create_pgflt[n]
assign entry_create_pgflt[31:0]      = (ibuf_create_pointer0[31:0] & {32{ib_hn_pgflt[8]}}) | 
                                       (ibuf_create_pointer1[31:0] & {32{ib_hn_pgflt[7]}}) |  
                                       (ibuf_create_pointer2[31:0] & {32{ib_hn_pgflt[6]}}) |  
                                       (ibuf_create_pointer3[31:0] & {32{ib_hn_pgflt[5]}}) |  
                                       (ibuf_create_pointer4[31:0] & {32{ib_hn_pgflt[4]}}) |  
                                       (ibuf_create_pointer5[31:0] & {32{ib_hn_pgflt[3]}}) |  
                                       (ibuf_create_pointer6[31:0] & {32{ib_hn_pgflt[2]}}) |  
                                       (ibuf_create_pointer7[31:0] & {32{ib_hn_pgflt[1]}}) |  
                                       (ibuf_create_pointer8[31:0] & {32{ib_hn_pgflt[0]}});

//entry_create_high_expt[n]
assign entry_create_high_expt[31:0]  = (ibuf_create_pointer0[31:0] & {32{ib_hn_high_expt[8]}}) | 
                                       (ibuf_create_pointer1[31:0] & {32{ib_hn_high_expt[7]}}) |  
                                       (ibuf_create_pointer2[31:0] & {32{ib_hn_high_expt[6]}}) |  
                                       (ibuf_create_pointer3[31:0] & {32{ib_hn_high_expt[5]}}) |  
                                       (ibuf_create_pointer4[31:0] & {32{ib_hn_high_expt[4]}}) |  
                                       (ibuf_create_pointer5[31:0] & {32{ib_hn_high_expt[3]}}) |  
                                       (ibuf_create_pointer6[31:0] & {32{ib_hn_high_expt[2]}}) |  
                                       (ibuf_create_pointer7[31:0] & {32{ib_hn_high_expt[1]}}) |  
                                       (ibuf_create_pointer8[31:0] & {32{ib_hn_high_expt[0]}});

//entry_create_split1[n]
assign entry_create_split1[31:0]     = (ibuf_create_pointer0[31:0] & {32{ib_hn_split1[8]}}) | 
                                       (ibuf_create_pointer1[31:0] & {32{ib_hn_split1[7]}}) |  
                                       (ibuf_create_pointer2[31:0] & {32{ib_hn_split1[6]}}) |  
                                       (ibuf_create_pointer3[31:0] & {32{ib_hn_split1[5]}}) |  
                                       (ibuf_create_pointer4[31:0] & {32{ib_hn_split1[4]}}) |  
                                       (ibuf_create_pointer5[31:0] & {32{ib_hn_split1[3]}}) |  
                                       (ibuf_create_pointer6[31:0] & {32{ib_hn_split1[2]}}) |  
                                       (ibuf_create_pointer7[31:0] & {32{ib_hn_split1[1]}}) |  
                                       (ibuf_create_pointer8[31:0] & {32{ib_hn_split1[0]}});
                                   
//entry_create_split0[n]
assign entry_create_split0[31:0]     = (ibuf_create_pointer0[31:0] & {32{ib_hn_split0[8]}}) | 
                                       (ibuf_create_pointer1[31:0] & {32{ib_hn_split0[7]}}) |  
                                       (ibuf_create_pointer2[31:0] & {32{ib_hn_split0[6]}}) |  
                                       (ibuf_create_pointer3[31:0] & {32{ib_hn_split0[5]}}) |  
                                       (ibuf_create_pointer4[31:0] & {32{ib_hn_split0[4]}}) |  
                                       (ibuf_create_pointer5[31:0] & {32{ib_hn_split0[3]}}) |  
                                       (ibuf_create_pointer6[31:0] & {32{ib_hn_split0[2]}}) |  
                                       (ibuf_create_pointer7[31:0] & {32{ib_hn_split0[1]}}) |  
                                       (ibuf_create_pointer8[31:0] & {32{ib_hn_split0[0]}});
                                   
//entry_create_fence[n]
assign entry_create_fence[31:0]       = (ibuf_create_pointer0[31:0] & {32{ib_hn_fence[8]}}) | 
                                        (ibuf_create_pointer1[31:0] & {32{ib_hn_fence[7]}}) |  
                                        (ibuf_create_pointer2[31:0] & {32{ib_hn_fence[6]}}) |  
                                        (ibuf_create_pointer3[31:0] & {32{ib_hn_fence[5]}}) |  
                                        (ibuf_create_pointer4[31:0] & {32{ib_hn_fence[4]}}) |  
                                        (ibuf_create_pointer5[31:0] & {32{ib_hn_fence[3]}}) |  
                                        (ibuf_create_pointer6[31:0] & {32{ib_hn_fence[2]}}) |  
                                        (ibuf_create_pointer7[31:0] & {32{ib_hn_fence[1]}}) |  
                                        (ibuf_create_pointer8[31:0] & {32{ib_hn_fence[0]}});
                                     

//entry_create_bkpta[n]
assign entry_create_bkpta[31:0]      = (ibuf_create_pointer0[31:0] & {32{ib_hn_bkpta[8]}}) | 
                                       (ibuf_create_pointer1[31:0] & {32{ib_hn_bkpta[7]}}) |  
                                       (ibuf_create_pointer2[31:0] & {32{ib_hn_bkpta[6]}}) |  
                                       (ibuf_create_pointer3[31:0] & {32{ib_hn_bkpta[5]}}) |  
                                       (ibuf_create_pointer4[31:0] & {32{ib_hn_bkpta[4]}}) |  
                                       (ibuf_create_pointer5[31:0] & {32{ib_hn_bkpta[3]}}) |  
                                       (ibuf_create_pointer6[31:0] & {32{ib_hn_bkpta[2]}}) |  
                                       (ibuf_create_pointer7[31:0] & {32{ib_hn_bkpta[1]}}) |  
                                       (ibuf_create_pointer8[31:0] & {32{ib_hn_bkpta[0]}});
                                     

//entry_create_bkptb[n]
assign entry_create_bkptb[31:0]      = (ibuf_create_pointer0[31:0] & {32{ib_hn_bkptb[8]}}) | 
                                       (ibuf_create_pointer1[31:0] & {32{ib_hn_bkptb[7]}}) |  
                                       (ibuf_create_pointer2[31:0] & {32{ib_hn_bkptb[6]}}) |  
                                       (ibuf_create_pointer3[31:0] & {32{ib_hn_bkptb[5]}}) |  
                                       (ibuf_create_pointer4[31:0] & {32{ib_hn_bkptb[4]}}) |  
                                       (ibuf_create_pointer5[31:0] & {32{ib_hn_bkptb[3]}}) |  
                                       (ibuf_create_pointer6[31:0] & {32{ib_hn_bkptb[2]}}) |  
                                       (ibuf_create_pointer7[31:0] & {32{ib_hn_bkptb[1]}}) |  
                                       (ibuf_create_pointer8[31:0] & {32{ib_hn_bkptb[0]}});
                                     
//entry_create_no_spec[n]
assign entry_create_no_spec[31:0]    = (ibuf_create_pointer0[31:0] & {32{ib_hn_no_spec[8]}}) | 
                                       (ibuf_create_pointer1[31:0] & {32{ib_hn_no_spec[7]}}) |  
                                       (ibuf_create_pointer2[31:0] & {32{ib_hn_no_spec[6]}}) |  
                                       (ibuf_create_pointer3[31:0] & {32{ib_hn_no_spec[5]}}) |  
                                       (ibuf_create_pointer4[31:0] & {32{ib_hn_no_spec[4]}}) |  
                                       (ibuf_create_pointer5[31:0] & {32{ib_hn_no_spec[3]}}) |  
                                       (ibuf_create_pointer6[31:0] & {32{ib_hn_no_spec[2]}}) |  
                                       (ibuf_create_pointer7[31:0] & {32{ib_hn_no_spec[1]}}) |  
                                       (ibuf_create_pointer8[31:0] & {32{ib_hn_no_spec[0]}});


//entry_create_vl_pred[n]
assign entry_create_vl_pred[31:0]    = (ibuf_create_pointer0[31:0] & {32{ib_hn_vl_pred[8]}}) | 
                                       (ibuf_create_pointer1[31:0] & {32{ib_hn_vl_pred[7]}}) |  
                                       (ibuf_create_pointer2[31:0] & {32{ib_hn_vl_pred[6]}}) |  
                                       (ibuf_create_pointer3[31:0] & {32{ib_hn_vl_pred[5]}}) |  
                                       (ibuf_create_pointer4[31:0] & {32{ib_hn_vl_pred[4]}}) |  
                                       (ibuf_create_pointer5[31:0] & {32{ib_hn_vl_pred[3]}}) |  
                                       (ibuf_create_pointer6[31:0] & {32{ib_hn_vl_pred[2]}}) |  
                                       (ibuf_create_pointer7[31:0] & {32{ib_hn_vl_pred[1]}}) |  
                                       (ibuf_create_pointer8[31:0] & {32{ib_hn_vl_pred[0]}});

//entry_create_32_start[n]
assign entry_create_32_start[31:0]   = (ibuf_create_pointer0[31:0] & {32{ib_hn_32_start[8]}}) | 
                                       (ibuf_create_pointer1[31:0] & {32{ib_hn_32_start[7]}}) |  
                                       (ibuf_create_pointer2[31:0] & {32{ib_hn_32_start[6]}}) |  
                                       (ibuf_create_pointer3[31:0] & {32{ib_hn_32_start[5]}}) |  
                                       (ibuf_create_pointer4[31:0] & {32{ib_hn_32_start[4]}}) |  
                                       (ibuf_create_pointer5[31:0] & {32{ib_hn_32_start[3]}}) |  
                                       (ibuf_create_pointer6[31:0] & {32{ib_hn_32_start[2]}}) |  
                                       (ibuf_create_pointer7[31:0] & {32{ib_hn_32_start[1]}}) |  
                                       (ibuf_create_pointer8[31:0] & {32{ib_hn_32_start[0]}});

//entry_create_inst_data_n
assign entry_create_inst_data_0[15:0]  = ({16{ibuf_create_pointer0[ 0]}} & ib_h0_data[15:0]) | 
                                         ({16{ibuf_create_pointer1[ 0]}} & ib_h1_data[15:0]) | 
                                         ({16{ibuf_create_pointer2[ 0]}} & ib_h2_data[15:0]) | 
                                         ({16{ibuf_create_pointer3[ 0]}} & ib_h3_data[15:0]) | 
                                         ({16{ibuf_create_pointer4[ 0]}} & ib_h4_data[15:0]) | 
                                         ({16{ibuf_create_pointer5[ 0]}} & ib_h5_data[15:0]) | 
                                         ({16{ibuf_create_pointer6[ 0]}} & ib_h6_data[15:0]) | 
                                         ({16{ibuf_create_pointer7[ 0]}} & ib_h7_data[15:0]) | 
                                         ({16{ibuf_create_pointer8[ 0]}} & ib_h8_data[15:0]);

//entry_create_inst_data_n
assign entry_create_inst_data_1[15:0]  = ({16{ibuf_create_pointer0[ 1]}} & ib_h0_data[15:0]) | 
                                         ({16{ibuf_create_pointer1[ 1]}} & ib_h1_data[15:0]) | 
                                         ({16{ibuf_create_pointer2[ 1]}} & ib_h2_data[15:0]) | 
                                         ({16{ibuf_create_pointer3[ 1]}} & ib_h3_data[15:0]) | 
                                         ({16{ibuf_create_pointer4[ 1]}} & ib_h4_data[15:0]) | 
                                         ({16{ibuf_create_pointer5[ 1]}} & ib_h5_data[15:0]) | 
                                         ({16{ibuf_create_pointer6[ 1]}} & ib_h6_data[15:0]) | 
                                         ({16{ibuf_create_pointer7[ 1]}} & ib_h7_data[15:0]) | 
                                         ({16{ibuf_create_pointer8[ 1]}} & ib_h8_data[15:0]);

//entry_create_inst_data_n
assign entry_create_inst_data_2[15:0]  = ({16{ibuf_create_pointer0[ 2]}} & ib_h0_data[15:0]) | 
                                         ({16{ibuf_create_pointer1[ 2]}} & ib_h1_data[15:0]) | 
                                         ({16{ibuf_create_pointer2[ 2]}} & ib_h2_data[15:0]) | 
                                         ({16{ibuf_create_pointer3[ 2]}} & ib_h3_data[15:0]) | 
                                         ({16{ibuf_create_pointer4[ 2]}} & ib_h4_data[15:0]) | 
                                         ({16{ibuf_create_pointer5[ 2]}} & ib_h5_data[15:0]) | 
                                         ({16{ibuf_create_pointer6[ 2]}} & ib_h6_data[15:0]) | 
                                         ({16{ibuf_create_pointer7[ 2]}} & ib_h7_data[15:0]) | 
                                         ({16{ibuf_create_pointer8[ 2]}} & ib_h8_data[15:0]);

//entry_create_inst_data_n
assign entry_create_inst_data_3[15:0]  = ({16{ibuf_create_pointer0[ 3]}} & ib_h0_data[15:0]) | 
                                         ({16{ibuf_create_pointer1[ 3]}} & ib_h1_data[15:0]) | 
                                         ({16{ibuf_create_pointer2[ 3]}} & ib_h2_data[15:0]) | 
                                         ({16{ibuf_create_pointer3[ 3]}} & ib_h3_data[15:0]) | 
                                         ({16{ibuf_create_pointer4[ 3]}} & ib_h4_data[15:0]) | 
                                         ({16{ibuf_create_pointer5[ 3]}} & ib_h5_data[15:0]) | 
                                         ({16{ibuf_create_pointer6[ 3]}} & ib_h6_data[15:0]) | 
                                         ({16{ibuf_create_pointer7[ 3]}} & ib_h7_data[15:0]) | 
                                         ({16{ibuf_create_pointer8[ 3]}} & ib_h8_data[15:0]);

//entry_create_inst_data_n
assign entry_create_inst_data_4[15:0]  = ({16{ibuf_create_pointer0[ 4]}} & ib_h0_data[15:0]) | 
                                         ({16{ibuf_create_pointer1[ 4]}} & ib_h1_data[15:0]) | 
                                         ({16{ibuf_create_pointer2[ 4]}} & ib_h2_data[15:0]) | 
                                         ({16{ibuf_create_pointer3[ 4]}} & ib_h3_data[15:0]) | 
                                         ({16{ibuf_create_pointer4[ 4]}} & ib_h4_data[15:0]) | 
                                         ({16{ibuf_create_pointer5[ 4]}} & ib_h5_data[15:0]) | 
                                         ({16{ibuf_create_pointer6[ 4]}} & ib_h6_data[15:0]) | 
                                         ({16{ibuf_create_pointer7[ 4]}} & ib_h7_data[15:0]) | 
                                         ({16{ibuf_create_pointer8[ 4]}} & ib_h8_data[15:0]);

//entry_create_inst_data_n
assign entry_create_inst_data_5[15:0]  = ({16{ibuf_create_pointer0[ 5]}} & ib_h0_data[15:0]) | 
                                         ({16{ibuf_create_pointer1[ 5]}} & ib_h1_data[15:0]) | 
                                         ({16{ibuf_create_pointer2[ 5]}} & ib_h2_data[15:0]) | 
                                         ({16{ibuf_create_pointer3[ 5]}} & ib_h3_data[15:0]) | 
                                         ({16{ibuf_create_pointer4[ 5]}} & ib_h4_data[15:0]) | 
                                         ({16{ibuf_create_pointer5[ 5]}} & ib_h5_data[15:0]) | 
                                         ({16{ibuf_create_pointer6[ 5]}} & ib_h6_data[15:0]) | 
                                         ({16{ibuf_create_pointer7[ 5]}} & ib_h7_data[15:0]) | 
                                         ({16{ibuf_create_pointer8[ 5]}} & ib_h8_data[15:0]);

//entry_create_inst_data_n
assign entry_create_inst_data_6[15:0]  = ({16{ibuf_create_pointer0[ 6]}} & ib_h0_data[15:0]) | 
                                         ({16{ibuf_create_pointer1[ 6]}} & ib_h1_data[15:0]) | 
                                         ({16{ibuf_create_pointer2[ 6]}} & ib_h2_data[15:0]) | 
                                         ({16{ibuf_create_pointer3[ 6]}} & ib_h3_data[15:0]) | 
                                         ({16{ibuf_create_pointer4[ 6]}} & ib_h4_data[15:0]) | 
                                         ({16{ibuf_create_pointer5[ 6]}} & ib_h5_data[15:0]) | 
                                         ({16{ibuf_create_pointer6[ 6]}} & ib_h6_data[15:0]) | 
                                         ({16{ibuf_create_pointer7[ 6]}} & ib_h7_data[15:0]) | 
                                         ({16{ibuf_create_pointer8[ 6]}} & ib_h8_data[15:0]);

//entry_create_inst_data_n
assign entry_create_inst_data_7[15:0]  = ({16{ibuf_create_pointer0[ 7]}} & ib_h0_data[15:0]) | 
                                         ({16{ibuf_create_pointer1[ 7]}} & ib_h1_data[15:0]) | 
                                         ({16{ibuf_create_pointer2[ 7]}} & ib_h2_data[15:0]) | 
                                         ({16{ibuf_create_pointer3[ 7]}} & ib_h3_data[15:0]) | 
                                         ({16{ibuf_create_pointer4[ 7]}} & ib_h4_data[15:0]) | 
                                         ({16{ibuf_create_pointer5[ 7]}} & ib_h5_data[15:0]) | 
                                         ({16{ibuf_create_pointer6[ 7]}} & ib_h6_data[15:0]) | 
                                         ({16{ibuf_create_pointer7[ 7]}} & ib_h7_data[15:0]) | 
                                         ({16{ibuf_create_pointer8[ 7]}} & ib_h8_data[15:0]);

//entry_create_inst_data_n
assign entry_create_inst_data_8[15:0]  = ({16{ibuf_create_pointer0[ 8]}} & ib_h0_data[15:0]) | 
                                         ({16{ibuf_create_pointer1[ 8]}} & ib_h1_data[15:0]) | 
                                         ({16{ibuf_create_pointer2[ 8]}} & ib_h2_data[15:0]) | 
                                         ({16{ibuf_create_pointer3[ 8]}} & ib_h3_data[15:0]) | 
                                         ({16{ibuf_create_pointer4[ 8]}} & ib_h4_data[15:0]) | 
                                         ({16{ibuf_create_pointer5[ 8]}} & ib_h5_data[15:0]) | 
                                         ({16{ibuf_create_pointer6[ 8]}} & ib_h6_data[15:0]) | 
                                         ({16{ibuf_create_pointer7[ 8]}} & ib_h7_data[15:0]) | 
                                         ({16{ibuf_create_pointer8[ 8]}} & ib_h8_data[15:0]);

//entry_create_inst_data_n
assign entry_create_inst_data_9[15:0]  = ({16{ibuf_create_pointer0[ 9]}} & ib_h0_data[15:0]) | 
                                         ({16{ibuf_create_pointer1[ 9]}} & ib_h1_data[15:0]) | 
                                         ({16{ibuf_create_pointer2[ 9]}} & ib_h2_data[15:0]) | 
                                         ({16{ibuf_create_pointer3[ 9]}} & ib_h3_data[15:0]) | 
                                         ({16{ibuf_create_pointer4[ 9]}} & ib_h4_data[15:0]) | 
                                         ({16{ibuf_create_pointer5[ 9]}} & ib_h5_data[15:0]) | 
                                         ({16{ibuf_create_pointer6[ 9]}} & ib_h6_data[15:0]) | 
                                         ({16{ibuf_create_pointer7[ 9]}} & ib_h7_data[15:0]) | 
                                         ({16{ibuf_create_pointer8[ 9]}} & ib_h8_data[15:0]);

//entry_create_inst_data_n
assign entry_create_inst_data_10[15:0] = ({16{ibuf_create_pointer0[10]}} & ib_h0_data[15:0]) | 
                                         ({16{ibuf_create_pointer1[10]}} & ib_h1_data[15:0]) | 
                                         ({16{ibuf_create_pointer2[10]}} & ib_h2_data[15:0]) | 
                                         ({16{ibuf_create_pointer3[10]}} & ib_h3_data[15:0]) | 
                                         ({16{ibuf_create_pointer4[10]}} & ib_h4_data[15:0]) | 
                                         ({16{ibuf_create_pointer5[10]}} & ib_h5_data[15:0]) | 
                                         ({16{ibuf_create_pointer6[10]}} & ib_h6_data[15:0]) | 
                                         ({16{ibuf_create_pointer7[10]}} & ib_h7_data[15:0]) | 
                                         ({16{ibuf_create_pointer8[10]}} & ib_h8_data[15:0]);

//entry_create_inst_data_n
assign entry_create_inst_data_11[15:0] = ({16{ibuf_create_pointer0[11]}} & ib_h0_data[15:0]) | 
                                         ({16{ibuf_create_pointer1[11]}} & ib_h1_data[15:0]) | 
                                         ({16{ibuf_create_pointer2[11]}} & ib_h2_data[15:0]) | 
                                         ({16{ibuf_create_pointer3[11]}} & ib_h3_data[15:0]) | 
                                         ({16{ibuf_create_pointer4[11]}} & ib_h4_data[15:0]) | 
                                         ({16{ibuf_create_pointer5[11]}} & ib_h5_data[15:0]) | 
                                         ({16{ibuf_create_pointer6[11]}} & ib_h6_data[15:0]) | 
                                         ({16{ibuf_create_pointer7[11]}} & ib_h7_data[15:0]) | 
                                         ({16{ibuf_create_pointer8[11]}} & ib_h8_data[15:0]);

//entry_create_inst_data_n
assign entry_create_inst_data_12[15:0] = ({16{ibuf_create_pointer0[12]}} & ib_h0_data[15:0]) | 
                                         ({16{ibuf_create_pointer1[12]}} & ib_h1_data[15:0]) | 
                                         ({16{ibuf_create_pointer2[12]}} & ib_h2_data[15:0]) | 
                                         ({16{ibuf_create_pointer3[12]}} & ib_h3_data[15:0]) | 
                                         ({16{ibuf_create_pointer4[12]}} & ib_h4_data[15:0]) | 
                                         ({16{ibuf_create_pointer5[12]}} & ib_h5_data[15:0]) | 
                                         ({16{ibuf_create_pointer6[12]}} & ib_h6_data[15:0]) | 
                                         ({16{ibuf_create_pointer7[12]}} & ib_h7_data[15:0]) | 
                                         ({16{ibuf_create_pointer8[12]}} & ib_h8_data[15:0]);

//entry_create_inst_data_n
assign entry_create_inst_data_13[15:0] = ({16{ibuf_create_pointer0[13]}} & ib_h0_data[15:0]) | 
                                         ({16{ibuf_create_pointer1[13]}} & ib_h1_data[15:0]) | 
                                         ({16{ibuf_create_pointer2[13]}} & ib_h2_data[15:0]) | 
                                         ({16{ibuf_create_pointer3[13]}} & ib_h3_data[15:0]) | 
                                         ({16{ibuf_create_pointer4[13]}} & ib_h4_data[15:0]) | 
                                         ({16{ibuf_create_pointer5[13]}} & ib_h5_data[15:0]) | 
                                         ({16{ibuf_create_pointer6[13]}} & ib_h6_data[15:0]) | 
                                         ({16{ibuf_create_pointer7[13]}} & ib_h7_data[15:0]) | 
                                         ({16{ibuf_create_pointer8[13]}} & ib_h8_data[15:0]);

//entry_create_inst_data_n
assign entry_create_inst_data_14[15:0] = ({16{ibuf_create_pointer0[14]}} & ib_h0_data[15:0]) | 
                                         ({16{ibuf_create_pointer1[14]}} & ib_h1_data[15:0]) | 
                                         ({16{ibuf_create_pointer2[14]}} & ib_h2_data[15:0]) | 
                                         ({16{ibuf_create_pointer3[14]}} & ib_h3_data[15:0]) | 
                                         ({16{ibuf_create_pointer4[14]}} & ib_h4_data[15:0]) | 
                                         ({16{ibuf_create_pointer5[14]}} & ib_h5_data[15:0]) | 
                                         ({16{ibuf_create_pointer6[14]}} & ib_h6_data[15:0]) | 
                                         ({16{ibuf_create_pointer7[14]}} & ib_h7_data[15:0]) | 
                                         ({16{ibuf_create_pointer8[14]}} & ib_h8_data[15:0]);

//entry_create_inst_data_n
assign entry_create_inst_data_15[15:0] = ({16{ibuf_create_pointer0[15]}} & ib_h0_data[15:0]) | 
                                         ({16{ibuf_create_pointer1[15]}} & ib_h1_data[15:0]) | 
                                         ({16{ibuf_create_pointer2[15]}} & ib_h2_data[15:0]) | 
                                         ({16{ibuf_create_pointer3[15]}} & ib_h3_data[15:0]) | 
                                         ({16{ibuf_create_pointer4[15]}} & ib_h4_data[15:0]) | 
                                         ({16{ibuf_create_pointer5[15]}} & ib_h5_data[15:0]) | 
                                         ({16{ibuf_create_pointer6[15]}} & ib_h6_data[15:0]) | 
                                         ({16{ibuf_create_pointer7[15]}} & ib_h7_data[15:0]) | 
                                         ({16{ibuf_create_pointer8[15]}} & ib_h8_data[15:0]);

//entry_create_inst_data_n
assign entry_create_inst_data_16[15:0] = ({16{ibuf_create_pointer0[16]}} & ib_h0_data[15:0]) | 
                                         ({16{ibuf_create_pointer1[16]}} & ib_h1_data[15:0]) | 
                                         ({16{ibuf_create_pointer2[16]}} & ib_h2_data[15:0]) | 
                                         ({16{ibuf_create_pointer3[16]}} & ib_h3_data[15:0]) | 
                                         ({16{ibuf_create_pointer4[16]}} & ib_h4_data[15:0]) | 
                                         ({16{ibuf_create_pointer5[16]}} & ib_h5_data[15:0]) | 
                                         ({16{ibuf_create_pointer6[16]}} & ib_h6_data[15:0]) | 
                                         ({16{ibuf_create_pointer7[16]}} & ib_h7_data[15:0]) | 
                                         ({16{ibuf_create_pointer8[16]}} & ib_h8_data[15:0]);

//entry_create_inst_data_n
assign entry_create_inst_data_17[15:0] = ({16{ibuf_create_pointer0[17]}} & ib_h0_data[15:0]) | 
                                         ({16{ibuf_create_pointer1[17]}} & ib_h1_data[15:0]) | 
                                         ({16{ibuf_create_pointer2[17]}} & ib_h2_data[15:0]) | 
                                         ({16{ibuf_create_pointer3[17]}} & ib_h3_data[15:0]) | 
                                         ({16{ibuf_create_pointer4[17]}} & ib_h4_data[15:0]) | 
                                         ({16{ibuf_create_pointer5[17]}} & ib_h5_data[15:0]) | 
                                         ({16{ibuf_create_pointer6[17]}} & ib_h6_data[15:0]) | 
                                         ({16{ibuf_create_pointer7[17]}} & ib_h7_data[15:0]) | 
                                         ({16{ibuf_create_pointer8[17]}} & ib_h8_data[15:0]);

//entry_create_inst_data_n
assign entry_create_inst_data_18[15:0] = ({16{ibuf_create_pointer0[18]}} & ib_h0_data[15:0]) | 
                                         ({16{ibuf_create_pointer1[18]}} & ib_h1_data[15:0]) | 
                                         ({16{ibuf_create_pointer2[18]}} & ib_h2_data[15:0]) | 
                                         ({16{ibuf_create_pointer3[18]}} & ib_h3_data[15:0]) | 
                                         ({16{ibuf_create_pointer4[18]}} & ib_h4_data[15:0]) | 
                                         ({16{ibuf_create_pointer5[18]}} & ib_h5_data[15:0]) | 
                                         ({16{ibuf_create_pointer6[18]}} & ib_h6_data[15:0]) | 
                                         ({16{ibuf_create_pointer7[18]}} & ib_h7_data[15:0]) | 
                                         ({16{ibuf_create_pointer8[18]}} & ib_h8_data[15:0]);

//entry_create_inst_data_n
assign entry_create_inst_data_19[15:0] = ({16{ibuf_create_pointer0[19]}} & ib_h0_data[15:0]) | 
                                         ({16{ibuf_create_pointer1[19]}} & ib_h1_data[15:0]) | 
                                         ({16{ibuf_create_pointer2[19]}} & ib_h2_data[15:0]) | 
                                         ({16{ibuf_create_pointer3[19]}} & ib_h3_data[15:0]) | 
                                         ({16{ibuf_create_pointer4[19]}} & ib_h4_data[15:0]) | 
                                         ({16{ibuf_create_pointer5[19]}} & ib_h5_data[15:0]) | 
                                         ({16{ibuf_create_pointer6[19]}} & ib_h6_data[15:0]) | 
                                         ({16{ibuf_create_pointer7[19]}} & ib_h7_data[15:0]) | 
                                         ({16{ibuf_create_pointer8[19]}} & ib_h8_data[15:0]);

//entry_create_inst_data_n
assign entry_create_inst_data_20[15:0] = ({16{ibuf_create_pointer0[20]}} & ib_h0_data[15:0]) | 
                                         ({16{ibuf_create_pointer1[20]}} & ib_h1_data[15:0]) | 
                                         ({16{ibuf_create_pointer2[20]}} & ib_h2_data[15:0]) | 
                                         ({16{ibuf_create_pointer3[20]}} & ib_h3_data[15:0]) | 
                                         ({16{ibuf_create_pointer4[20]}} & ib_h4_data[15:0]) | 
                                         ({16{ibuf_create_pointer5[20]}} & ib_h5_data[15:0]) | 
                                         ({16{ibuf_create_pointer6[20]}} & ib_h6_data[15:0]) | 
                                         ({16{ibuf_create_pointer7[20]}} & ib_h7_data[15:0]) | 
                                         ({16{ibuf_create_pointer8[20]}} & ib_h8_data[15:0]);

//entry_create_inst_data_n
assign entry_create_inst_data_21[15:0] = ({16{ibuf_create_pointer0[21]}} & ib_h0_data[15:0]) | 
                                         ({16{ibuf_create_pointer1[21]}} & ib_h1_data[15:0]) | 
                                         ({16{ibuf_create_pointer2[21]}} & ib_h2_data[15:0]) | 
                                         ({16{ibuf_create_pointer3[21]}} & ib_h3_data[15:0]) | 
                                         ({16{ibuf_create_pointer4[21]}} & ib_h4_data[15:0]) | 
                                         ({16{ibuf_create_pointer5[21]}} & ib_h5_data[15:0]) | 
                                         ({16{ibuf_create_pointer6[21]}} & ib_h6_data[15:0]) | 
                                         ({16{ibuf_create_pointer7[21]}} & ib_h7_data[15:0]) | 
                                         ({16{ibuf_create_pointer8[21]}} & ib_h8_data[15:0]);

//entry_create_inst_data_n
assign entry_create_inst_data_22[15:0] = ({16{ibuf_create_pointer0[22]}} & ib_h0_data[15:0]) | 
                                         ({16{ibuf_create_pointer1[22]}} & ib_h1_data[15:0]) | 
                                         ({16{ibuf_create_pointer2[22]}} & ib_h2_data[15:0]) | 
                                         ({16{ibuf_create_pointer3[22]}} & ib_h3_data[15:0]) | 
                                         ({16{ibuf_create_pointer4[22]}} & ib_h4_data[15:0]) | 
                                         ({16{ibuf_create_pointer5[22]}} & ib_h5_data[15:0]) | 
                                         ({16{ibuf_create_pointer6[22]}} & ib_h6_data[15:0]) | 
                                         ({16{ibuf_create_pointer7[22]}} & ib_h7_data[15:0]) | 
                                         ({16{ibuf_create_pointer8[22]}} & ib_h8_data[15:0]);

//entry_create_inst_data_n
assign entry_create_inst_data_23[15:0] = ({16{ibuf_create_pointer0[23]}} & ib_h0_data[15:0]) | 
                                         ({16{ibuf_create_pointer1[23]}} & ib_h1_data[15:0]) | 
                                         ({16{ibuf_create_pointer2[23]}} & ib_h2_data[15:0]) | 
                                         ({16{ibuf_create_pointer3[23]}} & ib_h3_data[15:0]) | 
                                         ({16{ibuf_create_pointer4[23]}} & ib_h4_data[15:0]) | 
                                         ({16{ibuf_create_pointer5[23]}} & ib_h5_data[15:0]) | 
                                         ({16{ibuf_create_pointer6[23]}} & ib_h6_data[15:0]) | 
                                         ({16{ibuf_create_pointer7[23]}} & ib_h7_data[15:0]) | 
                                         ({16{ibuf_create_pointer8[23]}} & ib_h8_data[15:0]);

//entry_create_inst_data_n
assign entry_create_inst_data_24[15:0] = ({16{ibuf_create_pointer0[24]}} & ib_h0_data[15:0]) | 
                                         ({16{ibuf_create_pointer1[24]}} & ib_h1_data[15:0]) | 
                                         ({16{ibuf_create_pointer2[24]}} & ib_h2_data[15:0]) | 
                                         ({16{ibuf_create_pointer3[24]}} & ib_h3_data[15:0]) | 
                                         ({16{ibuf_create_pointer4[24]}} & ib_h4_data[15:0]) | 
                                         ({16{ibuf_create_pointer5[24]}} & ib_h5_data[15:0]) | 
                                         ({16{ibuf_create_pointer6[24]}} & ib_h6_data[15:0]) | 
                                         ({16{ibuf_create_pointer7[24]}} & ib_h7_data[15:0]) | 
                                         ({16{ibuf_create_pointer8[24]}} & ib_h8_data[15:0]);

//entry_create_inst_data_n
assign entry_create_inst_data_25[15:0] = ({16{ibuf_create_pointer0[25]}} & ib_h0_data[15:0]) | 
                                         ({16{ibuf_create_pointer1[25]}} & ib_h1_data[15:0]) | 
                                         ({16{ibuf_create_pointer2[25]}} & ib_h2_data[15:0]) | 
                                         ({16{ibuf_create_pointer3[25]}} & ib_h3_data[15:0]) | 
                                         ({16{ibuf_create_pointer4[25]}} & ib_h4_data[15:0]) | 
                                         ({16{ibuf_create_pointer5[25]}} & ib_h5_data[15:0]) | 
                                         ({16{ibuf_create_pointer6[25]}} & ib_h6_data[15:0]) | 
                                         ({16{ibuf_create_pointer7[25]}} & ib_h7_data[15:0]) | 
                                         ({16{ibuf_create_pointer8[25]}} & ib_h8_data[15:0]);

//entry_create_inst_data_n
assign entry_create_inst_data_26[15:0] = ({16{ibuf_create_pointer0[26]}} & ib_h0_data[15:0]) | 
                                         ({16{ibuf_create_pointer1[26]}} & ib_h1_data[15:0]) | 
                                         ({16{ibuf_create_pointer2[26]}} & ib_h2_data[15:0]) | 
                                         ({16{ibuf_create_pointer3[26]}} & ib_h3_data[15:0]) | 
                                         ({16{ibuf_create_pointer4[26]}} & ib_h4_data[15:0]) | 
                                         ({16{ibuf_create_pointer5[26]}} & ib_h5_data[15:0]) | 
                                         ({16{ibuf_create_pointer6[26]}} & ib_h6_data[15:0]) | 
                                         ({16{ibuf_create_pointer7[26]}} & ib_h7_data[15:0]) | 
                                         ({16{ibuf_create_pointer8[26]}} & ib_h8_data[15:0]);

//entry_create_inst_data_n
assign entry_create_inst_data_27[15:0] = ({16{ibuf_create_pointer0[27]}} & ib_h0_data[15:0]) | 
                                         ({16{ibuf_create_pointer1[27]}} & ib_h1_data[15:0]) | 
                                         ({16{ibuf_create_pointer2[27]}} & ib_h2_data[15:0]) | 
                                         ({16{ibuf_create_pointer3[27]}} & ib_h3_data[15:0]) | 
                                         ({16{ibuf_create_pointer4[27]}} & ib_h4_data[15:0]) | 
                                         ({16{ibuf_create_pointer5[27]}} & ib_h5_data[15:0]) | 
                                         ({16{ibuf_create_pointer6[27]}} & ib_h6_data[15:0]) | 
                                         ({16{ibuf_create_pointer7[27]}} & ib_h7_data[15:0]) | 
                                         ({16{ibuf_create_pointer8[27]}} & ib_h8_data[15:0]);

//entry_create_inst_data_n
assign entry_create_inst_data_28[15:0] = ({16{ibuf_create_pointer0[28]}} & ib_h0_data[15:0]) | 
                                         ({16{ibuf_create_pointer1[28]}} & ib_h1_data[15:0]) | 
                                         ({16{ibuf_create_pointer2[28]}} & ib_h2_data[15:0]) | 
                                         ({16{ibuf_create_pointer3[28]}} & ib_h3_data[15:0]) | 
                                         ({16{ibuf_create_pointer4[28]}} & ib_h4_data[15:0]) | 
                                         ({16{ibuf_create_pointer5[28]}} & ib_h5_data[15:0]) | 
                                         ({16{ibuf_create_pointer6[28]}} & ib_h6_data[15:0]) | 
                                         ({16{ibuf_create_pointer7[28]}} & ib_h7_data[15:0]) | 
                                         ({16{ibuf_create_pointer8[28]}} & ib_h8_data[15:0]);

//entry_create_inst_data_n
assign entry_create_inst_data_29[15:0] = ({16{ibuf_create_pointer0[29]}} & ib_h0_data[15:0]) | 
                                         ({16{ibuf_create_pointer1[29]}} & ib_h1_data[15:0]) | 
                                         ({16{ibuf_create_pointer2[29]}} & ib_h2_data[15:0]) | 
                                         ({16{ibuf_create_pointer3[29]}} & ib_h3_data[15:0]) | 
                                         ({16{ibuf_create_pointer4[29]}} & ib_h4_data[15:0]) | 
                                         ({16{ibuf_create_pointer5[29]}} & ib_h5_data[15:0]) | 
                                         ({16{ibuf_create_pointer6[29]}} & ib_h6_data[15:0]) | 
                                         ({16{ibuf_create_pointer7[29]}} & ib_h7_data[15:0]) | 
                                         ({16{ibuf_create_pointer8[29]}} & ib_h8_data[15:0]);

//entry_create_inst_data_n
assign entry_create_inst_data_30[15:0] = ({16{ibuf_create_pointer0[30]}} & ib_h0_data[15:0]) | 
                                         ({16{ibuf_create_pointer1[30]}} & ib_h1_data[15:0]) | 
                                         ({16{ibuf_create_pointer2[30]}} & ib_h2_data[15:0]) | 
                                         ({16{ibuf_create_pointer3[30]}} & ib_h3_data[15:0]) | 
                                         ({16{ibuf_create_pointer4[30]}} & ib_h4_data[15:0]) | 
                                         ({16{ibuf_create_pointer5[30]}} & ib_h5_data[15:0]) | 
                                         ({16{ibuf_create_pointer6[30]}} & ib_h6_data[15:0]) | 
                                         ({16{ibuf_create_pointer7[30]}} & ib_h7_data[15:0]) | 
                                         ({16{ibuf_create_pointer8[30]}} & ib_h8_data[15:0]);

//entry_create_inst_data_n
assign entry_create_inst_data_31[15:0] = ({16{ibuf_create_pointer0[31]}} & ib_h0_data[15:0]) | 
                                         ({16{ibuf_create_pointer1[31]}} & ib_h1_data[15:0]) | 
                                         ({16{ibuf_create_pointer2[31]}} & ib_h2_data[15:0]) | 
                                         ({16{ibuf_create_pointer3[31]}} & ib_h3_data[15:0]) | 
                                         ({16{ibuf_create_pointer4[31]}} & ib_h4_data[15:0]) | 
                                         ({16{ibuf_create_pointer5[31]}} & ib_h5_data[15:0]) | 
                                         ({16{ibuf_create_pointer6[31]}} & ib_h6_data[15:0]) | 
                                         ({16{ibuf_create_pointer7[31]}} & ib_h7_data[15:0]) | 
                                         ({16{ibuf_create_pointer8[31]}} & ib_h8_data[15:0]);

//entry_create_inst_pc_n
assign entry_create_pc_0[14:0]         = ({15{ibuf_create_pointer0[0]}} & ib_h0_pc[14:0]) | 
                                         ({15{ibuf_create_pointer1[0]}} & ib_h1_pc[14:0]) | 
                                         ({15{ibuf_create_pointer2[0]}} & ib_h2_pc[14:0]) | 
                                         ({15{ibuf_create_pointer3[0]}} & ib_h3_pc[14:0]) | 
                                         ({15{ibuf_create_pointer4[0]}} & ib_h4_pc[14:0]) | 
                                         ({15{ibuf_create_pointer5[0]}} & ib_h5_pc[14:0]) | 
                                         ({15{ibuf_create_pointer6[0]}} & ib_h6_pc[14:0]) | 
                                         ({15{ibuf_create_pointer7[0]}} & ib_h7_pc[14:0]) | 
                                         ({15{ibuf_create_pointer8[0]}} & ib_h8_pc[14:0]);

assign entry_create_pc_1[14:0]         = ({15{ibuf_create_pointer0[1]}} & ib_h0_pc[14:0]) | 
                                         ({15{ibuf_create_pointer1[1]}} & ib_h1_pc[14:0]) | 
                                         ({15{ibuf_create_pointer2[1]}} & ib_h2_pc[14:0]) | 
                                         ({15{ibuf_create_pointer3[1]}} & ib_h3_pc[14:0]) | 
                                         ({15{ibuf_create_pointer4[1]}} & ib_h4_pc[14:0]) | 
                                         ({15{ibuf_create_pointer5[1]}} & ib_h5_pc[14:0]) | 
                                         ({15{ibuf_create_pointer6[1]}} & ib_h6_pc[14:0]) | 
                                         ({15{ibuf_create_pointer7[1]}} & ib_h7_pc[14:0]) | 
                                         ({15{ibuf_create_pointer8[1]}} & ib_h8_pc[14:0]);

assign entry_create_pc_2[14:0]         = ({15{ibuf_create_pointer0[2]}} & ib_h0_pc[14:0]) | 
                                         ({15{ibuf_create_pointer1[2]}} & ib_h1_pc[14:0]) | 
                                         ({15{ibuf_create_pointer2[2]}} & ib_h2_pc[14:0]) | 
                                         ({15{ibuf_create_pointer3[2]}} & ib_h3_pc[14:0]) | 
                                         ({15{ibuf_create_pointer4[2]}} & ib_h4_pc[14:0]) | 
                                         ({15{ibuf_create_pointer5[2]}} & ib_h5_pc[14:0]) | 
                                         ({15{ibuf_create_pointer6[2]}} & ib_h6_pc[14:0]) | 
                                         ({15{ibuf_create_pointer7[2]}} & ib_h7_pc[14:0]) | 
                                         ({15{ibuf_create_pointer8[2]}} & ib_h8_pc[14:0]);

assign entry_create_pc_3[14:0]         = ({15{ibuf_create_pointer0[3]}} & ib_h0_pc[14:0]) | 
                                         ({15{ibuf_create_pointer1[3]}} & ib_h1_pc[14:0]) | 
                                         ({15{ibuf_create_pointer2[3]}} & ib_h2_pc[14:0]) | 
                                         ({15{ibuf_create_pointer3[3]}} & ib_h3_pc[14:0]) | 
                                         ({15{ibuf_create_pointer4[3]}} & ib_h4_pc[14:0]) | 
                                         ({15{ibuf_create_pointer5[3]}} & ib_h5_pc[14:0]) | 
                                         ({15{ibuf_create_pointer6[3]}} & ib_h6_pc[14:0]) | 
                                         ({15{ibuf_create_pointer7[3]}} & ib_h7_pc[14:0]) | 
                                         ({15{ibuf_create_pointer8[3]}} & ib_h8_pc[14:0]);

assign entry_create_pc_4[14:0]         = ({15{ibuf_create_pointer0[4]}} & ib_h0_pc[14:0]) | 
                                         ({15{ibuf_create_pointer1[4]}} & ib_h1_pc[14:0]) | 
                                         ({15{ibuf_create_pointer2[4]}} & ib_h2_pc[14:0]) | 
                                         ({15{ibuf_create_pointer3[4]}} & ib_h3_pc[14:0]) | 
                                         ({15{ibuf_create_pointer4[4]}} & ib_h4_pc[14:0]) | 
                                         ({15{ibuf_create_pointer5[4]}} & ib_h5_pc[14:0]) | 
                                         ({15{ibuf_create_pointer6[4]}} & ib_h6_pc[14:0]) | 
                                         ({15{ibuf_create_pointer7[4]}} & ib_h7_pc[14:0]) | 
                                         ({15{ibuf_create_pointer8[4]}} & ib_h8_pc[14:0]);

assign entry_create_pc_5[14:0]         = ({15{ibuf_create_pointer0[5]}} & ib_h0_pc[14:0]) | 
                                         ({15{ibuf_create_pointer1[5]}} & ib_h1_pc[14:0]) | 
                                         ({15{ibuf_create_pointer2[5]}} & ib_h2_pc[14:0]) | 
                                         ({15{ibuf_create_pointer3[5]}} & ib_h3_pc[14:0]) | 
                                         ({15{ibuf_create_pointer4[5]}} & ib_h4_pc[14:0]) | 
                                         ({15{ibuf_create_pointer5[5]}} & ib_h5_pc[14:0]) | 
                                         ({15{ibuf_create_pointer6[5]}} & ib_h6_pc[14:0]) | 
                                         ({15{ibuf_create_pointer7[5]}} & ib_h7_pc[14:0]) | 
                                         ({15{ibuf_create_pointer8[5]}} & ib_h8_pc[14:0]);

assign entry_create_pc_6[14:0]         = ({15{ibuf_create_pointer0[6]}} & ib_h0_pc[14:0]) | 
                                         ({15{ibuf_create_pointer1[6]}} & ib_h1_pc[14:0]) | 
                                         ({15{ibuf_create_pointer2[6]}} & ib_h2_pc[14:0]) | 
                                         ({15{ibuf_create_pointer3[6]}} & ib_h3_pc[14:0]) | 
                                         ({15{ibuf_create_pointer4[6]}} & ib_h4_pc[14:0]) | 
                                         ({15{ibuf_create_pointer5[6]}} & ib_h5_pc[14:0]) | 
                                         ({15{ibuf_create_pointer6[6]}} & ib_h6_pc[14:0]) | 
                                         ({15{ibuf_create_pointer7[6]}} & ib_h7_pc[14:0]) | 
                                         ({15{ibuf_create_pointer8[6]}} & ib_h8_pc[14:0]);

assign entry_create_pc_7[14:0]         = ({15{ibuf_create_pointer0[7]}} & ib_h0_pc[14:0]) | 
                                         ({15{ibuf_create_pointer1[7]}} & ib_h1_pc[14:0]) | 
                                         ({15{ibuf_create_pointer2[7]}} & ib_h2_pc[14:0]) | 
                                         ({15{ibuf_create_pointer3[7]}} & ib_h3_pc[14:0]) | 
                                         ({15{ibuf_create_pointer4[7]}} & ib_h4_pc[14:0]) | 
                                         ({15{ibuf_create_pointer5[7]}} & ib_h5_pc[14:0]) | 
                                         ({15{ibuf_create_pointer6[7]}} & ib_h6_pc[14:0]) | 
                                         ({15{ibuf_create_pointer7[7]}} & ib_h7_pc[14:0]) | 
                                         ({15{ibuf_create_pointer8[7]}} & ib_h8_pc[14:0]);

assign entry_create_pc_8[14:0]         = ({15{ibuf_create_pointer0[8]}} & ib_h0_pc[14:0]) | 
                                         ({15{ibuf_create_pointer1[8]}} & ib_h1_pc[14:0]) | 
                                         ({15{ibuf_create_pointer2[8]}} & ib_h2_pc[14:0]) | 
                                         ({15{ibuf_create_pointer3[8]}} & ib_h3_pc[14:0]) | 
                                         ({15{ibuf_create_pointer4[8]}} & ib_h4_pc[14:0]) | 
                                         ({15{ibuf_create_pointer5[8]}} & ib_h5_pc[14:0]) | 
                                         ({15{ibuf_create_pointer6[8]}} & ib_h6_pc[14:0]) | 
                                         ({15{ibuf_create_pointer7[8]}} & ib_h7_pc[14:0]) | 
                                         ({15{ibuf_create_pointer8[8]}} & ib_h8_pc[14:0]);

assign entry_create_pc_9[14:0]         = ({15{ibuf_create_pointer0[9]}} & ib_h0_pc[14:0]) | 
                                         ({15{ibuf_create_pointer1[9]}} & ib_h1_pc[14:0]) | 
                                         ({15{ibuf_create_pointer2[9]}} & ib_h2_pc[14:0]) | 
                                         ({15{ibuf_create_pointer3[9]}} & ib_h3_pc[14:0]) | 
                                         ({15{ibuf_create_pointer4[9]}} & ib_h4_pc[14:0]) | 
                                         ({15{ibuf_create_pointer5[9]}} & ib_h5_pc[14:0]) | 
                                         ({15{ibuf_create_pointer6[9]}} & ib_h6_pc[14:0]) | 
                                         ({15{ibuf_create_pointer7[9]}} & ib_h7_pc[14:0]) | 
                                         ({15{ibuf_create_pointer8[9]}} & ib_h8_pc[14:0]);

assign entry_create_pc_10[14:0]        = ({15{ibuf_create_pointer0[10]}} & ib_h0_pc[14:0]) | 
                                         ({15{ibuf_create_pointer1[10]}} & ib_h1_pc[14:0]) | 
                                         ({15{ibuf_create_pointer2[10]}} & ib_h2_pc[14:0]) | 
                                         ({15{ibuf_create_pointer3[10]}} & ib_h3_pc[14:0]) | 
                                         ({15{ibuf_create_pointer4[10]}} & ib_h4_pc[14:0]) | 
                                         ({15{ibuf_create_pointer5[10]}} & ib_h5_pc[14:0]) | 
                                         ({15{ibuf_create_pointer6[10]}} & ib_h6_pc[14:0]) | 
                                         ({15{ibuf_create_pointer7[10]}} & ib_h7_pc[14:0]) | 
                                         ({15{ibuf_create_pointer8[10]}} & ib_h8_pc[14:0]);

assign entry_create_pc_11[14:0]        = ({15{ibuf_create_pointer0[11]}} & ib_h0_pc[14:0]) | 
                                         ({15{ibuf_create_pointer1[11]}} & ib_h1_pc[14:0]) | 
                                         ({15{ibuf_create_pointer2[11]}} & ib_h2_pc[14:0]) | 
                                         ({15{ibuf_create_pointer3[11]}} & ib_h3_pc[14:0]) | 
                                         ({15{ibuf_create_pointer4[11]}} & ib_h4_pc[14:0]) | 
                                         ({15{ibuf_create_pointer5[11]}} & ib_h5_pc[14:0]) | 
                                         ({15{ibuf_create_pointer6[11]}} & ib_h6_pc[14:0]) | 
                                         ({15{ibuf_create_pointer7[11]}} & ib_h7_pc[14:0]) | 
                                         ({15{ibuf_create_pointer8[11]}} & ib_h8_pc[14:0]);

assign entry_create_pc_12[14:0]        = ({15{ibuf_create_pointer0[12]}} & ib_h0_pc[14:0]) | 
                                         ({15{ibuf_create_pointer1[12]}} & ib_h1_pc[14:0]) | 
                                         ({15{ibuf_create_pointer2[12]}} & ib_h2_pc[14:0]) | 
                                         ({15{ibuf_create_pointer3[12]}} & ib_h3_pc[14:0]) | 
                                         ({15{ibuf_create_pointer4[12]}} & ib_h4_pc[14:0]) | 
                                         ({15{ibuf_create_pointer5[12]}} & ib_h5_pc[14:0]) | 
                                         ({15{ibuf_create_pointer6[12]}} & ib_h6_pc[14:0]) | 
                                         ({15{ibuf_create_pointer7[12]}} & ib_h7_pc[14:0]) | 
                                         ({15{ibuf_create_pointer8[12]}} & ib_h8_pc[14:0]);

assign entry_create_pc_13[14:0]        = ({15{ibuf_create_pointer0[13]}} & ib_h0_pc[14:0]) | 
                                         ({15{ibuf_create_pointer1[13]}} & ib_h1_pc[14:0]) | 
                                         ({15{ibuf_create_pointer2[13]}} & ib_h2_pc[14:0]) | 
                                         ({15{ibuf_create_pointer3[13]}} & ib_h3_pc[14:0]) | 
                                         ({15{ibuf_create_pointer4[13]}} & ib_h4_pc[14:0]) | 
                                         ({15{ibuf_create_pointer5[13]}} & ib_h5_pc[14:0]) | 
                                         ({15{ibuf_create_pointer6[13]}} & ib_h6_pc[14:0]) | 
                                         ({15{ibuf_create_pointer7[13]}} & ib_h7_pc[14:0]) | 
                                         ({15{ibuf_create_pointer8[13]}} & ib_h8_pc[14:0]);

assign entry_create_pc_14[14:0]        = ({15{ibuf_create_pointer0[14]}} & ib_h0_pc[14:0]) | 
                                         ({15{ibuf_create_pointer1[14]}} & ib_h1_pc[14:0]) | 
                                         ({15{ibuf_create_pointer2[14]}} & ib_h2_pc[14:0]) | 
                                         ({15{ibuf_create_pointer3[14]}} & ib_h3_pc[14:0]) | 
                                         ({15{ibuf_create_pointer4[14]}} & ib_h4_pc[14:0]) | 
                                         ({15{ibuf_create_pointer5[14]}} & ib_h5_pc[14:0]) | 
                                         ({15{ibuf_create_pointer6[14]}} & ib_h6_pc[14:0]) | 
                                         ({15{ibuf_create_pointer7[14]}} & ib_h7_pc[14:0]) | 
                                         ({15{ibuf_create_pointer8[14]}} & ib_h8_pc[14:0]);

assign entry_create_pc_15[14:0]        = ({15{ibuf_create_pointer0[15]}} & ib_h0_pc[14:0]) | 
                                         ({15{ibuf_create_pointer1[15]}} & ib_h1_pc[14:0]) | 
                                         ({15{ibuf_create_pointer2[15]}} & ib_h2_pc[14:0]) | 
                                         ({15{ibuf_create_pointer3[15]}} & ib_h3_pc[14:0]) | 
                                         ({15{ibuf_create_pointer4[15]}} & ib_h4_pc[14:0]) | 
                                         ({15{ibuf_create_pointer5[15]}} & ib_h5_pc[14:0]) | 
                                         ({15{ibuf_create_pointer6[15]}} & ib_h6_pc[14:0]) | 
                                         ({15{ibuf_create_pointer7[15]}} & ib_h7_pc[14:0]) | 
                                         ({15{ibuf_create_pointer8[15]}} & ib_h8_pc[14:0]);

assign entry_create_pc_16[14:0]        = ({15{ibuf_create_pointer0[16]}} & ib_h0_pc[14:0]) | 
                                         ({15{ibuf_create_pointer1[16]}} & ib_h1_pc[14:0]) | 
                                         ({15{ibuf_create_pointer2[16]}} & ib_h2_pc[14:0]) | 
                                         ({15{ibuf_create_pointer3[16]}} & ib_h3_pc[14:0]) | 
                                         ({15{ibuf_create_pointer4[16]}} & ib_h4_pc[14:0]) | 
                                         ({15{ibuf_create_pointer5[16]}} & ib_h5_pc[14:0]) | 
                                         ({15{ibuf_create_pointer6[16]}} & ib_h6_pc[14:0]) | 
                                         ({15{ibuf_create_pointer7[16]}} & ib_h7_pc[14:0]) | 
                                         ({15{ibuf_create_pointer8[16]}} & ib_h8_pc[14:0]);

assign entry_create_pc_17[14:0]        = ({15{ibuf_create_pointer0[17]}} & ib_h0_pc[14:0]) | 
                                         ({15{ibuf_create_pointer1[17]}} & ib_h1_pc[14:0]) | 
                                         ({15{ibuf_create_pointer2[17]}} & ib_h2_pc[14:0]) | 
                                         ({15{ibuf_create_pointer3[17]}} & ib_h3_pc[14:0]) | 
                                         ({15{ibuf_create_pointer4[17]}} & ib_h4_pc[14:0]) | 
                                         ({15{ibuf_create_pointer5[17]}} & ib_h5_pc[14:0]) | 
                                         ({15{ibuf_create_pointer6[17]}} & ib_h6_pc[14:0]) | 
                                         ({15{ibuf_create_pointer7[17]}} & ib_h7_pc[14:0]) | 
                                         ({15{ibuf_create_pointer8[17]}} & ib_h8_pc[14:0]);

assign entry_create_pc_18[14:0]        = ({15{ibuf_create_pointer0[18]}} & ib_h0_pc[14:0]) | 
                                         ({15{ibuf_create_pointer1[18]}} & ib_h1_pc[14:0]) | 
                                         ({15{ibuf_create_pointer2[18]}} & ib_h2_pc[14:0]) | 
                                         ({15{ibuf_create_pointer3[18]}} & ib_h3_pc[14:0]) | 
                                         ({15{ibuf_create_pointer4[18]}} & ib_h4_pc[14:0]) | 
                                         ({15{ibuf_create_pointer5[18]}} & ib_h5_pc[14:0]) | 
                                         ({15{ibuf_create_pointer6[18]}} & ib_h6_pc[14:0]) | 
                                         ({15{ibuf_create_pointer7[18]}} & ib_h7_pc[14:0]) | 
                                         ({15{ibuf_create_pointer8[18]}} & ib_h8_pc[14:0]);

assign entry_create_pc_19[14:0]        = ({15{ibuf_create_pointer0[19]}} & ib_h0_pc[14:0]) | 
                                         ({15{ibuf_create_pointer1[19]}} & ib_h1_pc[14:0]) | 
                                         ({15{ibuf_create_pointer2[19]}} & ib_h2_pc[14:0]) | 
                                         ({15{ibuf_create_pointer3[19]}} & ib_h3_pc[14:0]) | 
                                         ({15{ibuf_create_pointer4[19]}} & ib_h4_pc[14:0]) | 
                                         ({15{ibuf_create_pointer5[19]}} & ib_h5_pc[14:0]) | 
                                         ({15{ibuf_create_pointer6[19]}} & ib_h6_pc[14:0]) | 
                                         ({15{ibuf_create_pointer7[19]}} & ib_h7_pc[14:0]) | 
                                         ({15{ibuf_create_pointer8[19]}} & ib_h8_pc[14:0]);

assign entry_create_pc_20[14:0]        = ({15{ibuf_create_pointer0[20]}} & ib_h0_pc[14:0]) | 
                                         ({15{ibuf_create_pointer1[20]}} & ib_h1_pc[14:0]) | 
                                         ({15{ibuf_create_pointer2[20]}} & ib_h2_pc[14:0]) | 
                                         ({15{ibuf_create_pointer3[20]}} & ib_h3_pc[14:0]) | 
                                         ({15{ibuf_create_pointer4[20]}} & ib_h4_pc[14:0]) | 
                                         ({15{ibuf_create_pointer5[20]}} & ib_h5_pc[14:0]) | 
                                         ({15{ibuf_create_pointer6[20]}} & ib_h6_pc[14:0]) | 
                                         ({15{ibuf_create_pointer7[20]}} & ib_h7_pc[14:0]) | 
                                         ({15{ibuf_create_pointer8[20]}} & ib_h8_pc[14:0]);

assign entry_create_pc_21[14:0]        = ({15{ibuf_create_pointer0[21]}} & ib_h0_pc[14:0]) | 
                                         ({15{ibuf_create_pointer1[21]}} & ib_h1_pc[14:0]) | 
                                         ({15{ibuf_create_pointer2[21]}} & ib_h2_pc[14:0]) | 
                                         ({15{ibuf_create_pointer3[21]}} & ib_h3_pc[14:0]) | 
                                         ({15{ibuf_create_pointer4[21]}} & ib_h4_pc[14:0]) | 
                                         ({15{ibuf_create_pointer5[21]}} & ib_h5_pc[14:0]) | 
                                         ({15{ibuf_create_pointer6[21]}} & ib_h6_pc[14:0]) | 
                                         ({15{ibuf_create_pointer7[21]}} & ib_h7_pc[14:0]) | 
                                         ({15{ibuf_create_pointer8[21]}} & ib_h8_pc[14:0]);

assign entry_create_pc_22[14:0]        = ({15{ibuf_create_pointer0[22]}} & ib_h0_pc[14:0]) | 
                                         ({15{ibuf_create_pointer1[22]}} & ib_h1_pc[14:0]) | 
                                         ({15{ibuf_create_pointer2[22]}} & ib_h2_pc[14:0]) | 
                                         ({15{ibuf_create_pointer3[22]}} & ib_h3_pc[14:0]) | 
                                         ({15{ibuf_create_pointer4[22]}} & ib_h4_pc[14:0]) | 
                                         ({15{ibuf_create_pointer5[22]}} & ib_h5_pc[14:0]) | 
                                         ({15{ibuf_create_pointer6[22]}} & ib_h6_pc[14:0]) | 
                                         ({15{ibuf_create_pointer7[22]}} & ib_h7_pc[14:0]) | 
                                         ({15{ibuf_create_pointer8[22]}} & ib_h8_pc[14:0]);

assign entry_create_pc_23[14:0]        = ({15{ibuf_create_pointer0[23]}} & ib_h0_pc[14:0]) | 
                                         ({15{ibuf_create_pointer1[23]}} & ib_h1_pc[14:0]) | 
                                         ({15{ibuf_create_pointer2[23]}} & ib_h2_pc[14:0]) | 
                                         ({15{ibuf_create_pointer3[23]}} & ib_h3_pc[14:0]) | 
                                         ({15{ibuf_create_pointer4[23]}} & ib_h4_pc[14:0]) | 
                                         ({15{ibuf_create_pointer5[23]}} & ib_h5_pc[14:0]) | 
                                         ({15{ibuf_create_pointer6[23]}} & ib_h6_pc[14:0]) | 
                                         ({15{ibuf_create_pointer7[23]}} & ib_h7_pc[14:0]) | 
                                         ({15{ibuf_create_pointer8[23]}} & ib_h8_pc[14:0]);

assign entry_create_pc_24[14:0]        = ({15{ibuf_create_pointer0[24]}} & ib_h0_pc[14:0]) | 
                                         ({15{ibuf_create_pointer1[24]}} & ib_h1_pc[14:0]) | 
                                         ({15{ibuf_create_pointer2[24]}} & ib_h2_pc[14:0]) | 
                                         ({15{ibuf_create_pointer3[24]}} & ib_h3_pc[14:0]) | 
                                         ({15{ibuf_create_pointer4[24]}} & ib_h4_pc[14:0]) | 
                                         ({15{ibuf_create_pointer5[24]}} & ib_h5_pc[14:0]) | 
                                         ({15{ibuf_create_pointer6[24]}} & ib_h6_pc[14:0]) | 
                                         ({15{ibuf_create_pointer7[24]}} & ib_h7_pc[14:0]) | 
                                         ({15{ibuf_create_pointer8[24]}} & ib_h8_pc[14:0]);

assign entry_create_pc_25[14:0]        = ({15{ibuf_create_pointer0[25]}} & ib_h0_pc[14:0]) | 
                                         ({15{ibuf_create_pointer1[25]}} & ib_h1_pc[14:0]) | 
                                         ({15{ibuf_create_pointer2[25]}} & ib_h2_pc[14:0]) | 
                                         ({15{ibuf_create_pointer3[25]}} & ib_h3_pc[14:0]) | 
                                         ({15{ibuf_create_pointer4[25]}} & ib_h4_pc[14:0]) | 
                                         ({15{ibuf_create_pointer5[25]}} & ib_h5_pc[14:0]) | 
                                         ({15{ibuf_create_pointer6[25]}} & ib_h6_pc[14:0]) | 
                                         ({15{ibuf_create_pointer7[25]}} & ib_h7_pc[14:0]) | 
                                         ({15{ibuf_create_pointer8[25]}} & ib_h8_pc[14:0]);

assign entry_create_pc_26[14:0]        = ({15{ibuf_create_pointer0[26]}} & ib_h0_pc[14:0]) | 
                                         ({15{ibuf_create_pointer1[26]}} & ib_h1_pc[14:0]) | 
                                         ({15{ibuf_create_pointer2[26]}} & ib_h2_pc[14:0]) | 
                                         ({15{ibuf_create_pointer3[26]}} & ib_h3_pc[14:0]) | 
                                         ({15{ibuf_create_pointer4[26]}} & ib_h4_pc[14:0]) | 
                                         ({15{ibuf_create_pointer5[26]}} & ib_h5_pc[14:0]) | 
                                         ({15{ibuf_create_pointer6[26]}} & ib_h6_pc[14:0]) | 
                                         ({15{ibuf_create_pointer7[26]}} & ib_h7_pc[14:0]) | 
                                         ({15{ibuf_create_pointer8[26]}} & ib_h8_pc[14:0]);

assign entry_create_pc_27[14:0]        = ({15{ibuf_create_pointer0[27]}} & ib_h0_pc[14:0]) | 
                                         ({15{ibuf_create_pointer1[27]}} & ib_h1_pc[14:0]) | 
                                         ({15{ibuf_create_pointer2[27]}} & ib_h2_pc[14:0]) | 
                                         ({15{ibuf_create_pointer3[27]}} & ib_h3_pc[14:0]) | 
                                         ({15{ibuf_create_pointer4[27]}} & ib_h4_pc[14:0]) | 
                                         ({15{ibuf_create_pointer5[27]}} & ib_h5_pc[14:0]) | 
                                         ({15{ibuf_create_pointer6[27]}} & ib_h6_pc[14:0]) | 
                                         ({15{ibuf_create_pointer7[27]}} & ib_h7_pc[14:0]) | 
                                         ({15{ibuf_create_pointer8[27]}} & ib_h8_pc[14:0]);

assign entry_create_pc_28[14:0]        = ({15{ibuf_create_pointer0[28]}} & ib_h0_pc[14:0]) | 
                                         ({15{ibuf_create_pointer1[28]}} & ib_h1_pc[14:0]) | 
                                         ({15{ibuf_create_pointer2[28]}} & ib_h2_pc[14:0]) | 
                                         ({15{ibuf_create_pointer3[28]}} & ib_h3_pc[14:0]) | 
                                         ({15{ibuf_create_pointer4[28]}} & ib_h4_pc[14:0]) | 
                                         ({15{ibuf_create_pointer5[28]}} & ib_h5_pc[14:0]) | 
                                         ({15{ibuf_create_pointer6[28]}} & ib_h6_pc[14:0]) | 
                                         ({15{ibuf_create_pointer7[28]}} & ib_h7_pc[14:0]) | 
                                         ({15{ibuf_create_pointer8[28]}} & ib_h8_pc[14:0]);

assign entry_create_pc_29[14:0]        = ({15{ibuf_create_pointer0[29]}} & ib_h0_pc[14:0]) | 
                                         ({15{ibuf_create_pointer1[29]}} & ib_h1_pc[14:0]) | 
                                         ({15{ibuf_create_pointer2[29]}} & ib_h2_pc[14:0]) | 
                                         ({15{ibuf_create_pointer3[29]}} & ib_h3_pc[14:0]) | 
                                         ({15{ibuf_create_pointer4[29]}} & ib_h4_pc[14:0]) | 
                                         ({15{ibuf_create_pointer5[29]}} & ib_h5_pc[14:0]) | 
                                         ({15{ibuf_create_pointer6[29]}} & ib_h6_pc[14:0]) | 
                                         ({15{ibuf_create_pointer7[29]}} & ib_h7_pc[14:0]) | 
                                         ({15{ibuf_create_pointer8[29]}} & ib_h8_pc[14:0]);

assign entry_create_pc_30[14:0]        = ({15{ibuf_create_pointer0[30]}} & ib_h0_pc[14:0]) | 
                                         ({15{ibuf_create_pointer1[30]}} & ib_h1_pc[14:0]) | 
                                         ({15{ibuf_create_pointer2[30]}} & ib_h2_pc[14:0]) | 
                                         ({15{ibuf_create_pointer3[30]}} & ib_h3_pc[14:0]) | 
                                         ({15{ibuf_create_pointer4[30]}} & ib_h4_pc[14:0]) | 
                                         ({15{ibuf_create_pointer5[30]}} & ib_h5_pc[14:0]) | 
                                         ({15{ibuf_create_pointer6[30]}} & ib_h6_pc[14:0]) | 
                                         ({15{ibuf_create_pointer7[30]}} & ib_h7_pc[14:0]) | 
                                         ({15{ibuf_create_pointer8[30]}} & ib_h8_pc[14:0]);

assign entry_create_pc_31[14:0]        = ({15{ibuf_create_pointer0[31]}} & ib_h0_pc[14:0]) | 
                                         ({15{ibuf_create_pointer1[31]}} & ib_h1_pc[14:0]) | 
                                         ({15{ibuf_create_pointer2[31]}} & ib_h2_pc[14:0]) | 
                                         ({15{ibuf_create_pointer3[31]}} & ib_h3_pc[14:0]) | 
                                         ({15{ibuf_create_pointer4[31]}} & ib_h4_pc[14:0]) | 
                                         ({15{ibuf_create_pointer5[31]}} & ib_h5_pc[14:0]) | 
                                         ({15{ibuf_create_pointer6[31]}} & ib_h6_pc[14:0]) | 
                                         ({15{ibuf_create_pointer7[31]}} & ib_h7_pc[14:0]) | 
                                         ({15{ibuf_create_pointer8[31]}} & ib_h8_pc[14:0]);

//entry_create_inst_data_n
assign entry_create_vlmul_0[1:0]       = ({2{ibuf_create_pointer0[ 0]}} & ib_h0_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer1[ 0]}} & ib_h1_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer2[ 0]}} & ib_h2_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer3[ 0]}} & ib_h3_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer4[ 0]}} & ib_h4_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer5[ 0]}} & ib_h5_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer6[ 0]}} & ib_h6_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer7[ 0]}} & ib_h7_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer8[ 0]}} & ib_h8_vlmul[1:0]);

//entry_create_inst_data_n
assign entry_create_vlmul_1[1:0]       = ({2{ibuf_create_pointer0[ 1]}} & ib_h0_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer1[ 1]}} & ib_h1_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer2[ 1]}} & ib_h2_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer3[ 1]}} & ib_h3_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer4[ 1]}} & ib_h4_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer5[ 1]}} & ib_h5_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer6[ 1]}} & ib_h6_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer7[ 1]}} & ib_h7_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer8[ 1]}} & ib_h8_vlmul[1:0]);

//entry_create_inst_data_n
assign entry_create_vlmul_2[1:0]       = ({2{ibuf_create_pointer0[ 2]}} & ib_h0_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer1[ 2]}} & ib_h1_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer2[ 2]}} & ib_h2_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer3[ 2]}} & ib_h3_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer4[ 2]}} & ib_h4_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer5[ 2]}} & ib_h5_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer6[ 2]}} & ib_h6_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer7[ 2]}} & ib_h7_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer8[ 2]}} & ib_h8_vlmul[1:0]);

//entry_create_inst_data_n
assign entry_create_vlmul_3[1:0]       = ({2{ibuf_create_pointer0[ 3]}} & ib_h0_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer1[ 3]}} & ib_h1_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer2[ 3]}} & ib_h2_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer3[ 3]}} & ib_h3_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer4[ 3]}} & ib_h4_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer5[ 3]}} & ib_h5_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer6[ 3]}} & ib_h6_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer7[ 3]}} & ib_h7_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer8[ 3]}} & ib_h8_vlmul[1:0]);

//entry_create_inst_data_n
assign entry_create_vlmul_4[1:0]       = ({2{ibuf_create_pointer0[ 4]}} & ib_h0_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer1[ 4]}} & ib_h1_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer2[ 4]}} & ib_h2_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer3[ 4]}} & ib_h3_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer4[ 4]}} & ib_h4_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer5[ 4]}} & ib_h5_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer6[ 4]}} & ib_h6_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer7[ 4]}} & ib_h7_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer8[ 4]}} & ib_h8_vlmul[1:0]);

//entry_create_inst_data_n
assign entry_create_vlmul_5[1:0]       = ({2{ibuf_create_pointer0[ 5]}} & ib_h0_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer1[ 5]}} & ib_h1_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer2[ 5]}} & ib_h2_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer3[ 5]}} & ib_h3_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer4[ 5]}} & ib_h4_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer5[ 5]}} & ib_h5_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer6[ 5]}} & ib_h6_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer7[ 5]}} & ib_h7_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer8[ 5]}} & ib_h8_vlmul[1:0]);

//entry_create_inst_data_n
assign entry_create_vlmul_6[1:0]       = ({2{ibuf_create_pointer0[ 6]}} & ib_h0_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer1[ 6]}} & ib_h1_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer2[ 6]}} & ib_h2_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer3[ 6]}} & ib_h3_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer4[ 6]}} & ib_h4_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer5[ 6]}} & ib_h5_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer6[ 6]}} & ib_h6_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer7[ 6]}} & ib_h7_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer8[ 6]}} & ib_h8_vlmul[1:0]);

//entry_create_inst_data_n
assign entry_create_vlmul_7[1:0]       = ({2{ibuf_create_pointer0[ 7]}} & ib_h0_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer1[ 7]}} & ib_h1_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer2[ 7]}} & ib_h2_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer3[ 7]}} & ib_h3_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer4[ 7]}} & ib_h4_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer5[ 7]}} & ib_h5_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer6[ 7]}} & ib_h6_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer7[ 7]}} & ib_h7_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer8[ 7]}} & ib_h8_vlmul[1:0]);

//entry_create_inst_data_n
assign entry_create_vlmul_8[1:0]       = ({2{ibuf_create_pointer0[ 8]}} & ib_h0_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer1[ 8]}} & ib_h1_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer2[ 8]}} & ib_h2_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer3[ 8]}} & ib_h3_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer4[ 8]}} & ib_h4_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer5[ 8]}} & ib_h5_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer6[ 8]}} & ib_h6_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer7[ 8]}} & ib_h7_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer8[ 8]}} & ib_h8_vlmul[1:0]);

//entry_create_inst_data_n
assign entry_create_vlmul_9[1:0]       = ({2{ibuf_create_pointer0[ 9]}} & ib_h0_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer1[ 9]}} & ib_h1_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer2[ 9]}} & ib_h2_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer3[ 9]}} & ib_h3_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer4[ 9]}} & ib_h4_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer5[ 9]}} & ib_h5_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer6[ 9]}} & ib_h6_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer7[ 9]}} & ib_h7_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer8[ 9]}} & ib_h8_vlmul[1:0]);

//entry_create_inst_data_n
assign entry_create_vlmul_10[1:0]      = ({2{ibuf_create_pointer0[10]}} & ib_h0_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer1[10]}} & ib_h1_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer2[10]}} & ib_h2_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer3[10]}} & ib_h3_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer4[10]}} & ib_h4_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer5[10]}} & ib_h5_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer6[10]}} & ib_h6_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer7[10]}} & ib_h7_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer8[10]}} & ib_h8_vlmul[1:0]);

//entry_create_inst_data_n
assign entry_create_vlmul_11[1:0]      = ({2{ibuf_create_pointer0[11]}} & ib_h0_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer1[11]}} & ib_h1_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer2[11]}} & ib_h2_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer3[11]}} & ib_h3_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer4[11]}} & ib_h4_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer5[11]}} & ib_h5_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer6[11]}} & ib_h6_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer7[11]}} & ib_h7_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer8[11]}} & ib_h8_vlmul[1:0]);

//entry_create_inst_data_n
assign entry_create_vlmul_12[1:0]      = ({2{ibuf_create_pointer0[12]}} & ib_h0_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer1[12]}} & ib_h1_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer2[12]}} & ib_h2_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer3[12]}} & ib_h3_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer4[12]}} & ib_h4_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer5[12]}} & ib_h5_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer6[12]}} & ib_h6_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer7[12]}} & ib_h7_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer8[12]}} & ib_h8_vlmul[1:0]);

//entry_create_inst_data_n
assign entry_create_vlmul_13[1:0]      = ({2{ibuf_create_pointer0[13]}} & ib_h0_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer1[13]}} & ib_h1_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer2[13]}} & ib_h2_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer3[13]}} & ib_h3_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer4[13]}} & ib_h4_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer5[13]}} & ib_h5_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer6[13]}} & ib_h6_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer7[13]}} & ib_h7_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer8[13]}} & ib_h8_vlmul[1:0]);

//entry_create_inst_data_n
assign entry_create_vlmul_14[1:0]      = ({2{ibuf_create_pointer0[14]}} & ib_h0_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer1[14]}} & ib_h1_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer2[14]}} & ib_h2_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer3[14]}} & ib_h3_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer4[14]}} & ib_h4_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer5[14]}} & ib_h5_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer6[14]}} & ib_h6_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer7[14]}} & ib_h7_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer8[14]}} & ib_h8_vlmul[1:0]);

//entry_create_inst_data_n
assign entry_create_vlmul_15[1:0]      = ({2{ibuf_create_pointer0[15]}} & ib_h0_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer1[15]}} & ib_h1_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer2[15]}} & ib_h2_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer3[15]}} & ib_h3_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer4[15]}} & ib_h4_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer5[15]}} & ib_h5_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer6[15]}} & ib_h6_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer7[15]}} & ib_h7_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer8[15]}} & ib_h8_vlmul[1:0]);

//entry_create_inst_data_n
assign entry_create_vlmul_16[1:0]      = ({2{ibuf_create_pointer0[16]}} & ib_h0_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer1[16]}} & ib_h1_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer2[16]}} & ib_h2_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer3[16]}} & ib_h3_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer4[16]}} & ib_h4_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer5[16]}} & ib_h5_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer6[16]}} & ib_h6_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer7[16]}} & ib_h7_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer8[16]}} & ib_h8_vlmul[1:0]);

//entry_create_inst_data_n
assign entry_create_vlmul_17[1:0]      = ({2{ibuf_create_pointer0[17]}} & ib_h0_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer1[17]}} & ib_h1_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer2[17]}} & ib_h2_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer3[17]}} & ib_h3_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer4[17]}} & ib_h4_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer5[17]}} & ib_h5_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer6[17]}} & ib_h6_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer7[17]}} & ib_h7_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer8[17]}} & ib_h8_vlmul[1:0]);

//entry_create_inst_data_n
assign entry_create_vlmul_18[1:0]      = ({2{ibuf_create_pointer0[18]}} & ib_h0_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer1[18]}} & ib_h1_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer2[18]}} & ib_h2_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer3[18]}} & ib_h3_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer4[18]}} & ib_h4_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer5[18]}} & ib_h5_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer6[18]}} & ib_h6_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer7[18]}} & ib_h7_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer8[18]}} & ib_h8_vlmul[1:0]);

//entry_create_inst_data_n
assign entry_create_vlmul_19[1:0]      = ({2{ibuf_create_pointer0[19]}} & ib_h0_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer1[19]}} & ib_h1_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer2[19]}} & ib_h2_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer3[19]}} & ib_h3_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer4[19]}} & ib_h4_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer5[19]}} & ib_h5_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer6[19]}} & ib_h6_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer7[19]}} & ib_h7_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer8[19]}} & ib_h8_vlmul[1:0]);

//entry_create_inst_data_n
assign entry_create_vlmul_20[1:0]      = ({2{ibuf_create_pointer0[20]}} & ib_h0_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer1[20]}} & ib_h1_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer2[20]}} & ib_h2_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer3[20]}} & ib_h3_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer4[20]}} & ib_h4_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer5[20]}} & ib_h5_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer6[20]}} & ib_h6_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer7[20]}} & ib_h7_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer8[20]}} & ib_h8_vlmul[1:0]);

//entry_create_inst_data_n
assign entry_create_vlmul_21[1:0]      = ({2{ibuf_create_pointer0[21]}} & ib_h0_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer1[21]}} & ib_h1_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer2[21]}} & ib_h2_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer3[21]}} & ib_h3_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer4[21]}} & ib_h4_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer5[21]}} & ib_h5_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer6[21]}} & ib_h6_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer7[21]}} & ib_h7_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer8[21]}} & ib_h8_vlmul[1:0]);

//entry_create_inst_data_n
assign entry_create_vlmul_22[1:0]     =  ({2{ibuf_create_pointer0[22]}} & ib_h0_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer1[22]}} & ib_h1_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer2[22]}} & ib_h2_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer3[22]}} & ib_h3_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer4[22]}} & ib_h4_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer5[22]}} & ib_h5_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer6[22]}} & ib_h6_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer7[22]}} & ib_h7_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer8[22]}} & ib_h8_vlmul[1:0]);

//entry_create_inst_data_n
assign entry_create_vlmul_23[1:0]      = ({2{ibuf_create_pointer0[23]}} & ib_h0_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer1[23]}} & ib_h1_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer2[23]}} & ib_h2_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer3[23]}} & ib_h3_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer4[23]}} & ib_h4_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer5[23]}} & ib_h5_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer6[23]}} & ib_h6_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer7[23]}} & ib_h7_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer8[23]}} & ib_h8_vlmul[1:0]);

//entry_create_inst_data_n
assign entry_create_vlmul_24[1:0]      = ({2{ibuf_create_pointer0[24]}} & ib_h0_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer1[24]}} & ib_h1_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer2[24]}} & ib_h2_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer3[24]}} & ib_h3_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer4[24]}} & ib_h4_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer5[24]}} & ib_h5_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer6[24]}} & ib_h6_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer7[24]}} & ib_h7_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer8[24]}} & ib_h8_vlmul[1:0]);

//entry_create_inst_data_n
assign entry_create_vlmul_25[1:0]      = ({2{ibuf_create_pointer0[25]}} & ib_h0_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer1[25]}} & ib_h1_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer2[25]}} & ib_h2_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer3[25]}} & ib_h3_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer4[25]}} & ib_h4_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer5[25]}} & ib_h5_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer6[25]}} & ib_h6_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer7[25]}} & ib_h7_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer8[25]}} & ib_h8_vlmul[1:0]);

//entry_create_inst_data_n
assign entry_create_vlmul_26[1:0]      = ({2{ibuf_create_pointer0[26]}} & ib_h0_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer1[26]}} & ib_h1_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer2[26]}} & ib_h2_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer3[26]}} & ib_h3_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer4[26]}} & ib_h4_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer5[26]}} & ib_h5_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer6[26]}} & ib_h6_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer7[26]}} & ib_h7_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer8[26]}} & ib_h8_vlmul[1:0]);

//entry_create_inst_data_n
assign entry_create_vlmul_27[1:0]      = ({2{ibuf_create_pointer0[27]}} & ib_h0_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer1[27]}} & ib_h1_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer2[27]}} & ib_h2_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer3[27]}} & ib_h3_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer4[27]}} & ib_h4_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer5[27]}} & ib_h5_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer6[27]}} & ib_h6_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer7[27]}} & ib_h7_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer8[27]}} & ib_h8_vlmul[1:0]);

//entry_create_inst_data_n
assign entry_create_vlmul_28[1:0]      = ({2{ibuf_create_pointer0[28]}} & ib_h0_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer1[28]}} & ib_h1_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer2[28]}} & ib_h2_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer3[28]}} & ib_h3_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer4[28]}} & ib_h4_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer5[28]}} & ib_h5_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer6[28]}} & ib_h6_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer7[28]}} & ib_h7_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer8[28]}} & ib_h8_vlmul[1:0]);

//entry_create_inst_data_n
assign entry_create_vlmul_29[1:0]      = ({2{ibuf_create_pointer0[29]}} & ib_h0_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer1[29]}} & ib_h1_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer2[29]}} & ib_h2_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer3[29]}} & ib_h3_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer4[29]}} & ib_h4_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer5[29]}} & ib_h5_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer6[29]}} & ib_h6_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer7[29]}} & ib_h7_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer8[29]}} & ib_h8_vlmul[1:0]);

//entry_create_inst_data_n
assign entry_create_vlmul_30[1:0]      = ({2{ibuf_create_pointer0[30]}} & ib_h0_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer1[30]}} & ib_h1_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer2[30]}} & ib_h2_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer3[30]}} & ib_h3_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer4[30]}} & ib_h4_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer5[30]}} & ib_h5_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer6[30]}} & ib_h6_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer7[30]}} & ib_h7_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer8[30]}} & ib_h8_vlmul[1:0]);

//entry_create_inst_data_n
assign entry_create_vlmul_31[1:0]      = ({2{ibuf_create_pointer0[31]}} & ib_h0_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer1[31]}} & ib_h1_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer2[31]}} & ib_h2_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer3[31]}} & ib_h3_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer4[31]}} & ib_h4_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer5[31]}} & ib_h5_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer6[31]}} & ib_h6_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer7[31]}} & ib_h7_vlmul[1:0]) | 
                                         ({2{ibuf_create_pointer8[31]}} & ib_h8_vlmul[1:0]);


//entry_create_inst_data_n
assign entry_create_vsew_0[2:0]        = ({3{ibuf_create_pointer0[ 0]}} & ib_h0_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer1[ 0]}} & ib_h1_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer2[ 0]}} & ib_h2_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer3[ 0]}} & ib_h3_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer4[ 0]}} & ib_h4_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer5[ 0]}} & ib_h5_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer6[ 0]}} & ib_h6_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer7[ 0]}} & ib_h7_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer8[ 0]}} & ib_h8_vsew[2:0]);

//entry_create_inst_data_n
assign entry_create_vsew_1[2:0]        = ({3{ibuf_create_pointer0[ 1]}} & ib_h0_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer1[ 1]}} & ib_h1_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer2[ 1]}} & ib_h2_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer3[ 1]}} & ib_h3_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer4[ 1]}} & ib_h4_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer5[ 1]}} & ib_h5_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer6[ 1]}} & ib_h6_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer7[ 1]}} & ib_h7_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer8[ 1]}} & ib_h8_vsew[2:0]);

//entry_create_inst_data_n
assign entry_create_vsew_2[2:0]        = ({3{ibuf_create_pointer0[ 2]}} & ib_h0_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer1[ 2]}} & ib_h1_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer2[ 2]}} & ib_h2_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer3[ 2]}} & ib_h3_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer4[ 2]}} & ib_h4_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer5[ 2]}} & ib_h5_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer6[ 2]}} & ib_h6_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer7[ 2]}} & ib_h7_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer8[ 2]}} & ib_h8_vsew[2:0]);

//entry_create_inst_data_n
assign entry_create_vsew_3[2:0]        = ({3{ibuf_create_pointer0[ 3]}} & ib_h0_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer1[ 3]}} & ib_h1_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer2[ 3]}} & ib_h2_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer3[ 3]}} & ib_h3_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer4[ 3]}} & ib_h4_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer5[ 3]}} & ib_h5_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer6[ 3]}} & ib_h6_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer7[ 3]}} & ib_h7_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer8[ 3]}} & ib_h8_vsew[2:0]);

//entry_create_inst_data_n
assign entry_create_vsew_4[2:0]        = ({3{ibuf_create_pointer0[ 4]}} & ib_h0_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer1[ 4]}} & ib_h1_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer2[ 4]}} & ib_h2_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer3[ 4]}} & ib_h3_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer4[ 4]}} & ib_h4_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer5[ 4]}} & ib_h5_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer6[ 4]}} & ib_h6_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer7[ 4]}} & ib_h7_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer8[ 4]}} & ib_h8_vsew[2:0]);

//entry_create_inst_data_n
assign entry_create_vsew_5[2:0]        = ({3{ibuf_create_pointer0[ 5]}} & ib_h0_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer1[ 5]}} & ib_h1_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer2[ 5]}} & ib_h2_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer3[ 5]}} & ib_h3_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer4[ 5]}} & ib_h4_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer5[ 5]}} & ib_h5_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer6[ 5]}} & ib_h6_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer7[ 5]}} & ib_h7_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer8[ 5]}} & ib_h8_vsew[2:0]);

//entry_create_inst_data_n
assign entry_create_vsew_6[2:0]        = ({3{ibuf_create_pointer0[ 6]}} & ib_h0_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer1[ 6]}} & ib_h1_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer2[ 6]}} & ib_h2_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer3[ 6]}} & ib_h3_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer4[ 6]}} & ib_h4_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer5[ 6]}} & ib_h5_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer6[ 6]}} & ib_h6_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer7[ 6]}} & ib_h7_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer8[ 6]}} & ib_h8_vsew[2:0]);

//entry_create_inst_data_n
assign entry_create_vsew_7[2:0]        = ({3{ibuf_create_pointer0[ 7]}} & ib_h0_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer1[ 7]}} & ib_h1_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer2[ 7]}} & ib_h2_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer3[ 7]}} & ib_h3_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer4[ 7]}} & ib_h4_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer5[ 7]}} & ib_h5_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer6[ 7]}} & ib_h6_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer7[ 7]}} & ib_h7_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer8[ 7]}} & ib_h8_vsew[2:0]);

//entry_create_inst_data_n
assign entry_create_vsew_8[2:0]        = ({3{ibuf_create_pointer0[ 8]}} & ib_h0_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer1[ 8]}} & ib_h1_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer2[ 8]}} & ib_h2_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer3[ 8]}} & ib_h3_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer4[ 8]}} & ib_h4_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer5[ 8]}} & ib_h5_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer6[ 8]}} & ib_h6_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer7[ 8]}} & ib_h7_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer8[ 8]}} & ib_h8_vsew[2:0]);

//entry_create_inst_data_n
assign entry_create_vsew_9[2:0]        = ({3{ibuf_create_pointer0[ 9]}} & ib_h0_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer1[ 9]}} & ib_h1_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer2[ 9]}} & ib_h2_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer3[ 9]}} & ib_h3_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer4[ 9]}} & ib_h4_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer5[ 9]}} & ib_h5_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer6[ 9]}} & ib_h6_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer7[ 9]}} & ib_h7_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer8[ 9]}} & ib_h8_vsew[2:0]);

//entry_create_inst_data_n
assign entry_create_vsew_10[2:0]       = ({3{ibuf_create_pointer0[10]}} & ib_h0_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer1[10]}} & ib_h1_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer2[10]}} & ib_h2_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer3[10]}} & ib_h3_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer4[10]}} & ib_h4_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer5[10]}} & ib_h5_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer6[10]}} & ib_h6_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer7[10]}} & ib_h7_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer8[10]}} & ib_h8_vsew[2:0]);

//entry_create_inst_data_n
assign entry_create_vsew_11[2:0]       = ({3{ibuf_create_pointer0[11]}} & ib_h0_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer1[11]}} & ib_h1_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer2[11]}} & ib_h2_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer3[11]}} & ib_h3_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer4[11]}} & ib_h4_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer5[11]}} & ib_h5_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer6[11]}} & ib_h6_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer7[11]}} & ib_h7_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer8[11]}} & ib_h8_vsew[2:0]);

//entry_create_inst_data_n
assign entry_create_vsew_12[2:0]       = ({3{ibuf_create_pointer0[12]}} & ib_h0_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer1[12]}} & ib_h1_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer2[12]}} & ib_h2_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer3[12]}} & ib_h3_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer4[12]}} & ib_h4_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer5[12]}} & ib_h5_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer6[12]}} & ib_h6_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer7[12]}} & ib_h7_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer8[12]}} & ib_h8_vsew[2:0]);

//entry_create_inst_data_n
assign entry_create_vsew_13[2:0]       = ({3{ibuf_create_pointer0[13]}} & ib_h0_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer1[13]}} & ib_h1_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer2[13]}} & ib_h2_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer3[13]}} & ib_h3_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer4[13]}} & ib_h4_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer5[13]}} & ib_h5_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer6[13]}} & ib_h6_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer7[13]}} & ib_h7_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer8[13]}} & ib_h8_vsew[2:0]);

//entry_create_inst_data_n
assign entry_create_vsew_14[2:0]       = ({3{ibuf_create_pointer0[14]}} & ib_h0_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer1[14]}} & ib_h1_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer2[14]}} & ib_h2_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer3[14]}} & ib_h3_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer4[14]}} & ib_h4_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer5[14]}} & ib_h5_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer6[14]}} & ib_h6_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer7[14]}} & ib_h7_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer8[14]}} & ib_h8_vsew[2:0]);

//entry_create_inst_data_n
assign entry_create_vsew_15[2:0]       = ({3{ibuf_create_pointer0[15]}} & ib_h0_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer1[15]}} & ib_h1_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer2[15]}} & ib_h2_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer3[15]}} & ib_h3_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer4[15]}} & ib_h4_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer5[15]}} & ib_h5_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer6[15]}} & ib_h6_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer7[15]}} & ib_h7_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer8[15]}} & ib_h8_vsew[2:0]);

//entry_create_inst_data_n
assign entry_create_vsew_16[2:0]       = ({3{ibuf_create_pointer0[16]}} & ib_h0_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer1[16]}} & ib_h1_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer2[16]}} & ib_h2_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer3[16]}} & ib_h3_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer4[16]}} & ib_h4_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer5[16]}} & ib_h5_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer6[16]}} & ib_h6_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer7[16]}} & ib_h7_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer8[16]}} & ib_h8_vsew[2:0]);

//entry_create_inst_data_n
assign entry_create_vsew_17[2:0]       = ({3{ibuf_create_pointer0[17]}} & ib_h0_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer1[17]}} & ib_h1_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer2[17]}} & ib_h2_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer3[17]}} & ib_h3_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer4[17]}} & ib_h4_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer5[17]}} & ib_h5_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer6[17]}} & ib_h6_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer7[17]}} & ib_h7_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer8[17]}} & ib_h8_vsew[2:0]);

//entry_create_inst_data_n
assign entry_create_vsew_18[2:0]       = ({3{ibuf_create_pointer0[18]}} & ib_h0_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer1[18]}} & ib_h1_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer2[18]}} & ib_h2_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer3[18]}} & ib_h3_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer4[18]}} & ib_h4_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer5[18]}} & ib_h5_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer6[18]}} & ib_h6_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer7[18]}} & ib_h7_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer8[18]}} & ib_h8_vsew[2:0]);

//entry_create_inst_data_n
assign entry_create_vsew_19[2:0]       = ({3{ibuf_create_pointer0[19]}} & ib_h0_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer1[19]}} & ib_h1_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer2[19]}} & ib_h2_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer3[19]}} & ib_h3_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer4[19]}} & ib_h4_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer5[19]}} & ib_h5_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer6[19]}} & ib_h6_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer7[19]}} & ib_h7_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer8[19]}} & ib_h8_vsew[2:0]);

//entry_create_inst_data_n
assign entry_create_vsew_20[2:0]       = ({3{ibuf_create_pointer0[20]}} & ib_h0_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer1[20]}} & ib_h1_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer2[20]}} & ib_h2_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer3[20]}} & ib_h3_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer4[20]}} & ib_h4_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer5[20]}} & ib_h5_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer6[20]}} & ib_h6_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer7[20]}} & ib_h7_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer8[20]}} & ib_h8_vsew[2:0]);

//entry_create_inst_data_n
assign entry_create_vsew_21[2:0]       = ({3{ibuf_create_pointer0[21]}} & ib_h0_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer1[21]}} & ib_h1_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer2[21]}} & ib_h2_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer3[21]}} & ib_h3_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer4[21]}} & ib_h4_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer5[21]}} & ib_h5_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer6[21]}} & ib_h6_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer7[21]}} & ib_h7_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer8[21]}} & ib_h8_vsew[2:0]);

//entry_create_inst_data_n
assign entry_create_vsew_22[2:0]       = ({3{ibuf_create_pointer0[22]}} & ib_h0_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer1[22]}} & ib_h1_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer2[22]}} & ib_h2_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer3[22]}} & ib_h3_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer4[22]}} & ib_h4_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer5[22]}} & ib_h5_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer6[22]}} & ib_h6_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer7[22]}} & ib_h7_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer8[22]}} & ib_h8_vsew[2:0]);

//entry_create_inst_data_n
assign entry_create_vsew_23[2:0]       = ({3{ibuf_create_pointer0[23]}} & ib_h0_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer1[23]}} & ib_h1_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer2[23]}} & ib_h2_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer3[23]}} & ib_h3_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer4[23]}} & ib_h4_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer5[23]}} & ib_h5_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer6[23]}} & ib_h6_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer7[23]}} & ib_h7_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer8[23]}} & ib_h8_vsew[2:0]);

//entry_create_inst_data_n
assign entry_create_vsew_24[2:0]       = ({3{ibuf_create_pointer0[24]}} & ib_h0_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer1[24]}} & ib_h1_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer2[24]}} & ib_h2_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer3[24]}} & ib_h3_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer4[24]}} & ib_h4_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer5[24]}} & ib_h5_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer6[24]}} & ib_h6_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer7[24]}} & ib_h7_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer8[24]}} & ib_h8_vsew[2:0]);

//entry_create_inst_data_n
assign entry_create_vsew_25[2:0]       = ({3{ibuf_create_pointer0[25]}} & ib_h0_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer1[25]}} & ib_h1_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer2[25]}} & ib_h2_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer3[25]}} & ib_h3_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer4[25]}} & ib_h4_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer5[25]}} & ib_h5_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer6[25]}} & ib_h6_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer7[25]}} & ib_h7_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer8[25]}} & ib_h8_vsew[2:0]);

//entry_create_inst_data_n
assign entry_create_vsew_26[2:0]       = ({3{ibuf_create_pointer0[26]}} & ib_h0_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer1[26]}} & ib_h1_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer2[26]}} & ib_h2_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer3[26]}} & ib_h3_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer4[26]}} & ib_h4_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer5[26]}} & ib_h5_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer6[26]}} & ib_h6_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer7[26]}} & ib_h7_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer8[26]}} & ib_h8_vsew[2:0]);

//entry_create_inst_data_n
assign entry_create_vsew_27[2:0]       = ({3{ibuf_create_pointer0[27]}} & ib_h0_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer1[27]}} & ib_h1_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer2[27]}} & ib_h2_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer3[27]}} & ib_h3_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer4[27]}} & ib_h4_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer5[27]}} & ib_h5_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer6[27]}} & ib_h6_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer7[27]}} & ib_h7_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer8[27]}} & ib_h8_vsew[2:0]);

//entry_create_inst_data_n
assign entry_create_vsew_28[2:0]       = ({3{ibuf_create_pointer0[28]}} & ib_h0_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer1[28]}} & ib_h1_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer2[28]}} & ib_h2_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer3[28]}} & ib_h3_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer4[28]}} & ib_h4_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer5[28]}} & ib_h5_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer6[28]}} & ib_h6_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer7[28]}} & ib_h7_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer8[28]}} & ib_h8_vsew[2:0]);

//entry_create_inst_data_n
assign entry_create_vsew_29[2:0]       = ({3{ibuf_create_pointer0[29]}} & ib_h0_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer1[29]}} & ib_h1_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer2[29]}} & ib_h2_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer3[29]}} & ib_h3_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer4[29]}} & ib_h4_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer5[29]}} & ib_h5_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer6[29]}} & ib_h6_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer7[29]}} & ib_h7_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer8[29]}} & ib_h8_vsew[2:0]);

//entry_create_inst_data_n
assign entry_create_vsew_30[2:0]       = ({3{ibuf_create_pointer0[30]}} & ib_h0_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer1[30]}} & ib_h1_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer2[30]}} & ib_h2_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer3[30]}} & ib_h3_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer4[30]}} & ib_h4_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer5[30]}} & ib_h5_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer6[30]}} & ib_h6_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer7[30]}} & ib_h7_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer8[30]}} & ib_h8_vsew[2:0]);

//entry_create_inst_data_n
assign entry_create_vsew_31[2:0]       = ({3{ibuf_create_pointer0[31]}} & ib_h0_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer1[31]}} & ib_h1_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer2[31]}} & ib_h2_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer3[31]}} & ib_h3_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer4[31]}} & ib_h4_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer5[31]}} & ib_h5_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer6[31]}} & ib_h6_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer7[31]}} & ib_h7_vsew[2:0]) | 
                                         ({3{ibuf_create_pointer8[31]}} & ib_h8_vsew[2:0]);

//entry_create_inst_data_n
assign entry_create_vl_0[7:0]          = ({8{ibuf_create_pointer0[ 0]}} & ib_h0_vl[7:0]) | 
                                         ({8{ibuf_create_pointer1[ 0]}} & ib_h1_vl[7:0]) | 
                                         ({8{ibuf_create_pointer2[ 0]}} & ib_h2_vl[7:0]) | 
                                         ({8{ibuf_create_pointer3[ 0]}} & ib_h3_vl[7:0]) | 
                                         ({8{ibuf_create_pointer4[ 0]}} & ib_h4_vl[7:0]) | 
                                         ({8{ibuf_create_pointer5[ 0]}} & ib_h5_vl[7:0]) | 
                                         ({8{ibuf_create_pointer6[ 0]}} & ib_h6_vl[7:0]) | 
                                         ({8{ibuf_create_pointer7[ 0]}} & ib_h7_vl[7:0]) | 
                                         ({8{ibuf_create_pointer8[ 0]}} & ib_h8_vl[7:0]);

//entry_create_inst_data_n
assign entry_create_vl_1[7:0]          = ({8{ibuf_create_pointer0[ 1]}} & ib_h0_vl[7:0]) | 
                                         ({8{ibuf_create_pointer1[ 1]}} & ib_h1_vl[7:0]) | 
                                         ({8{ibuf_create_pointer2[ 1]}} & ib_h2_vl[7:0]) | 
                                         ({8{ibuf_create_pointer3[ 1]}} & ib_h3_vl[7:0]) | 
                                         ({8{ibuf_create_pointer4[ 1]}} & ib_h4_vl[7:0]) | 
                                         ({8{ibuf_create_pointer5[ 1]}} & ib_h5_vl[7:0]) | 
                                         ({8{ibuf_create_pointer6[ 1]}} & ib_h6_vl[7:0]) | 
                                         ({8{ibuf_create_pointer7[ 1]}} & ib_h7_vl[7:0]) | 
                                         ({8{ibuf_create_pointer8[ 1]}} & ib_h8_vl[7:0]);

//entry_create_inst_data_n
assign entry_create_vl_2[7:0]          = ({8{ibuf_create_pointer0[ 2]}} & ib_h0_vl[7:0]) | 
                                         ({8{ibuf_create_pointer1[ 2]}} & ib_h1_vl[7:0]) | 
                                         ({8{ibuf_create_pointer2[ 2]}} & ib_h2_vl[7:0]) | 
                                         ({8{ibuf_create_pointer3[ 2]}} & ib_h3_vl[7:0]) | 
                                         ({8{ibuf_create_pointer4[ 2]}} & ib_h4_vl[7:0]) | 
                                         ({8{ibuf_create_pointer5[ 2]}} & ib_h5_vl[7:0]) | 
                                         ({8{ibuf_create_pointer6[ 2]}} & ib_h6_vl[7:0]) | 
                                         ({8{ibuf_create_pointer7[ 2]}} & ib_h7_vl[7:0]) | 
                                         ({8{ibuf_create_pointer8[ 2]}} & ib_h8_vl[7:0]);

//entry_create_inst_data_n
assign entry_create_vl_3[7:0]          = ({8{ibuf_create_pointer0[ 3]}} & ib_h0_vl[7:0]) | 
                                         ({8{ibuf_create_pointer1[ 3]}} & ib_h1_vl[7:0]) | 
                                         ({8{ibuf_create_pointer2[ 3]}} & ib_h2_vl[7:0]) | 
                                         ({8{ibuf_create_pointer3[ 3]}} & ib_h3_vl[7:0]) | 
                                         ({8{ibuf_create_pointer4[ 3]}} & ib_h4_vl[7:0]) | 
                                         ({8{ibuf_create_pointer5[ 3]}} & ib_h5_vl[7:0]) | 
                                         ({8{ibuf_create_pointer6[ 3]}} & ib_h6_vl[7:0]) | 
                                         ({8{ibuf_create_pointer7[ 3]}} & ib_h7_vl[7:0]) | 
                                         ({8{ibuf_create_pointer8[ 3]}} & ib_h8_vl[7:0]);

//entry_create_inst_data_n
assign entry_create_vl_4[7:0]          = ({8{ibuf_create_pointer0[ 4]}} & ib_h0_vl[7:0]) | 
                                         ({8{ibuf_create_pointer1[ 4]}} & ib_h1_vl[7:0]) | 
                                         ({8{ibuf_create_pointer2[ 4]}} & ib_h2_vl[7:0]) | 
                                         ({8{ibuf_create_pointer3[ 4]}} & ib_h3_vl[7:0]) | 
                                         ({8{ibuf_create_pointer4[ 4]}} & ib_h4_vl[7:0]) | 
                                         ({8{ibuf_create_pointer5[ 4]}} & ib_h5_vl[7:0]) | 
                                         ({8{ibuf_create_pointer6[ 4]}} & ib_h6_vl[7:0]) | 
                                         ({8{ibuf_create_pointer7[ 4]}} & ib_h7_vl[7:0]) | 
                                         ({8{ibuf_create_pointer8[ 4]}} & ib_h8_vl[7:0]);

//entry_create_inst_data_n
assign entry_create_vl_5[7:0]          = ({8{ibuf_create_pointer0[ 5]}} & ib_h0_vl[7:0]) | 
                                         ({8{ibuf_create_pointer1[ 5]}} & ib_h1_vl[7:0]) | 
                                         ({8{ibuf_create_pointer2[ 5]}} & ib_h2_vl[7:0]) | 
                                         ({8{ibuf_create_pointer3[ 5]}} & ib_h3_vl[7:0]) | 
                                         ({8{ibuf_create_pointer4[ 5]}} & ib_h4_vl[7:0]) | 
                                         ({8{ibuf_create_pointer5[ 5]}} & ib_h5_vl[7:0]) | 
                                         ({8{ibuf_create_pointer6[ 5]}} & ib_h6_vl[7:0]) | 
                                         ({8{ibuf_create_pointer7[ 5]}} & ib_h7_vl[7:0]) | 
                                         ({8{ibuf_create_pointer8[ 5]}} & ib_h8_vl[7:0]);

//entry_create_inst_data_n
assign entry_create_vl_6[7:0]          = ({8{ibuf_create_pointer0[ 6]}} & ib_h0_vl[7:0]) | 
                                         ({8{ibuf_create_pointer1[ 6]}} & ib_h1_vl[7:0]) | 
                                         ({8{ibuf_create_pointer2[ 6]}} & ib_h2_vl[7:0]) | 
                                         ({8{ibuf_create_pointer3[ 6]}} & ib_h3_vl[7:0]) | 
                                         ({8{ibuf_create_pointer4[ 6]}} & ib_h4_vl[7:0]) | 
                                         ({8{ibuf_create_pointer5[ 6]}} & ib_h5_vl[7:0]) | 
                                         ({8{ibuf_create_pointer6[ 6]}} & ib_h6_vl[7:0]) | 
                                         ({8{ibuf_create_pointer7[ 6]}} & ib_h7_vl[7:0]) | 
                                         ({8{ibuf_create_pointer8[ 6]}} & ib_h8_vl[7:0]);

//entry_create_inst_data_n
assign entry_create_vl_7[7:0]          = ({8{ibuf_create_pointer0[ 7]}} & ib_h0_vl[7:0]) | 
                                         ({8{ibuf_create_pointer1[ 7]}} & ib_h1_vl[7:0]) | 
                                         ({8{ibuf_create_pointer2[ 7]}} & ib_h2_vl[7:0]) | 
                                         ({8{ibuf_create_pointer3[ 7]}} & ib_h3_vl[7:0]) | 
                                         ({8{ibuf_create_pointer4[ 7]}} & ib_h4_vl[7:0]) | 
                                         ({8{ibuf_create_pointer5[ 7]}} & ib_h5_vl[7:0]) | 
                                         ({8{ibuf_create_pointer6[ 7]}} & ib_h6_vl[7:0]) | 
                                         ({8{ibuf_create_pointer7[ 7]}} & ib_h7_vl[7:0]) | 
                                         ({8{ibuf_create_pointer8[ 7]}} & ib_h8_vl[7:0]);

//entry_create_inst_data_n
assign entry_create_vl_8[7:0]          = ({8{ibuf_create_pointer0[ 8]}} & ib_h0_vl[7:0]) | 
                                         ({8{ibuf_create_pointer1[ 8]}} & ib_h1_vl[7:0]) | 
                                         ({8{ibuf_create_pointer2[ 8]}} & ib_h2_vl[7:0]) | 
                                         ({8{ibuf_create_pointer3[ 8]}} & ib_h3_vl[7:0]) | 
                                         ({8{ibuf_create_pointer4[ 8]}} & ib_h4_vl[7:0]) | 
                                         ({8{ibuf_create_pointer5[ 8]}} & ib_h5_vl[7:0]) | 
                                         ({8{ibuf_create_pointer6[ 8]}} & ib_h6_vl[7:0]) | 
                                         ({8{ibuf_create_pointer7[ 8]}} & ib_h7_vl[7:0]) | 
                                         ({8{ibuf_create_pointer8[ 8]}} & ib_h8_vl[7:0]);

//entry_create_inst_data_n
assign entry_create_vl_9[7:0]          = ({8{ibuf_create_pointer0[ 9]}} & ib_h0_vl[7:0]) | 
                                         ({8{ibuf_create_pointer1[ 9]}} & ib_h1_vl[7:0]) | 
                                         ({8{ibuf_create_pointer2[ 9]}} & ib_h2_vl[7:0]) | 
                                         ({8{ibuf_create_pointer3[ 9]}} & ib_h3_vl[7:0]) | 
                                         ({8{ibuf_create_pointer4[ 9]}} & ib_h4_vl[7:0]) | 
                                         ({8{ibuf_create_pointer5[ 9]}} & ib_h5_vl[7:0]) | 
                                         ({8{ibuf_create_pointer6[ 9]}} & ib_h6_vl[7:0]) | 
                                         ({8{ibuf_create_pointer7[ 9]}} & ib_h7_vl[7:0]) | 
                                         ({8{ibuf_create_pointer8[ 9]}} & ib_h8_vl[7:0]);

//entry_create_inst_data_n
assign entry_create_vl_10[7:0]         = ({8{ibuf_create_pointer0[10]}} & ib_h0_vl[7:0]) | 
                                         ({8{ibuf_create_pointer1[10]}} & ib_h1_vl[7:0]) | 
                                         ({8{ibuf_create_pointer2[10]}} & ib_h2_vl[7:0]) | 
                                         ({8{ibuf_create_pointer3[10]}} & ib_h3_vl[7:0]) | 
                                         ({8{ibuf_create_pointer4[10]}} & ib_h4_vl[7:0]) | 
                                         ({8{ibuf_create_pointer5[10]}} & ib_h5_vl[7:0]) | 
                                         ({8{ibuf_create_pointer6[10]}} & ib_h6_vl[7:0]) | 
                                         ({8{ibuf_create_pointer7[10]}} & ib_h7_vl[7:0]) | 
                                         ({8{ibuf_create_pointer8[10]}} & ib_h8_vl[7:0]);

//entry_create_inst_data_n
assign entry_create_vl_11[7:0]         = ({8{ibuf_create_pointer0[11]}} & ib_h0_vl[7:0]) | 
                                         ({8{ibuf_create_pointer1[11]}} & ib_h1_vl[7:0]) | 
                                         ({8{ibuf_create_pointer2[11]}} & ib_h2_vl[7:0]) | 
                                         ({8{ibuf_create_pointer3[11]}} & ib_h3_vl[7:0]) | 
                                         ({8{ibuf_create_pointer4[11]}} & ib_h4_vl[7:0]) | 
                                         ({8{ibuf_create_pointer5[11]}} & ib_h5_vl[7:0]) | 
                                         ({8{ibuf_create_pointer6[11]}} & ib_h6_vl[7:0]) | 
                                         ({8{ibuf_create_pointer7[11]}} & ib_h7_vl[7:0]) | 
                                         ({8{ibuf_create_pointer8[11]}} & ib_h8_vl[7:0]);

//entry_create_inst_data_n
assign entry_create_vl_12[7:0]         = ({8{ibuf_create_pointer0[12]}} & ib_h0_vl[7:0]) | 
                                         ({8{ibuf_create_pointer1[12]}} & ib_h1_vl[7:0]) | 
                                         ({8{ibuf_create_pointer2[12]}} & ib_h2_vl[7:0]) | 
                                         ({8{ibuf_create_pointer3[12]}} & ib_h3_vl[7:0]) | 
                                         ({8{ibuf_create_pointer4[12]}} & ib_h4_vl[7:0]) | 
                                         ({8{ibuf_create_pointer5[12]}} & ib_h5_vl[7:0]) | 
                                         ({8{ibuf_create_pointer6[12]}} & ib_h6_vl[7:0]) | 
                                         ({8{ibuf_create_pointer7[12]}} & ib_h7_vl[7:0]) | 
                                         ({8{ibuf_create_pointer8[12]}} & ib_h8_vl[7:0]);

//entry_create_inst_data_n
assign entry_create_vl_13[7:0]         = ({8{ibuf_create_pointer0[13]}} & ib_h0_vl[7:0]) | 
                                         ({8{ibuf_create_pointer1[13]}} & ib_h1_vl[7:0]) | 
                                         ({8{ibuf_create_pointer2[13]}} & ib_h2_vl[7:0]) | 
                                         ({8{ibuf_create_pointer3[13]}} & ib_h3_vl[7:0]) | 
                                         ({8{ibuf_create_pointer4[13]}} & ib_h4_vl[7:0]) | 
                                         ({8{ibuf_create_pointer5[13]}} & ib_h5_vl[7:0]) | 
                                         ({8{ibuf_create_pointer6[13]}} & ib_h6_vl[7:0]) | 
                                         ({8{ibuf_create_pointer7[13]}} & ib_h7_vl[7:0]) | 
                                         ({8{ibuf_create_pointer8[13]}} & ib_h8_vl[7:0]);

//entry_create_inst_data_n
assign entry_create_vl_14[7:0]         = ({8{ibuf_create_pointer0[14]}} & ib_h0_vl[7:0]) | 
                                         ({8{ibuf_create_pointer1[14]}} & ib_h1_vl[7:0]) | 
                                         ({8{ibuf_create_pointer2[14]}} & ib_h2_vl[7:0]) | 
                                         ({8{ibuf_create_pointer3[14]}} & ib_h3_vl[7:0]) | 
                                         ({8{ibuf_create_pointer4[14]}} & ib_h4_vl[7:0]) | 
                                         ({8{ibuf_create_pointer5[14]}} & ib_h5_vl[7:0]) | 
                                         ({8{ibuf_create_pointer6[14]}} & ib_h6_vl[7:0]) | 
                                         ({8{ibuf_create_pointer7[14]}} & ib_h7_vl[7:0]) | 
                                         ({8{ibuf_create_pointer8[14]}} & ib_h8_vl[7:0]);

//entry_create_inst_data_n
assign entry_create_vl_15[7:0]         = ({8{ibuf_create_pointer0[15]}} & ib_h0_vl[7:0]) | 
                                         ({8{ibuf_create_pointer1[15]}} & ib_h1_vl[7:0]) | 
                                         ({8{ibuf_create_pointer2[15]}} & ib_h2_vl[7:0]) | 
                                         ({8{ibuf_create_pointer3[15]}} & ib_h3_vl[7:0]) | 
                                         ({8{ibuf_create_pointer4[15]}} & ib_h4_vl[7:0]) | 
                                         ({8{ibuf_create_pointer5[15]}} & ib_h5_vl[7:0]) | 
                                         ({8{ibuf_create_pointer6[15]}} & ib_h6_vl[7:0]) | 
                                         ({8{ibuf_create_pointer7[15]}} & ib_h7_vl[7:0]) | 
                                         ({8{ibuf_create_pointer8[15]}} & ib_h8_vl[7:0]);

//entry_create_inst_data_n
assign entry_create_vl_16[7:0]         = ({8{ibuf_create_pointer0[16]}} & ib_h0_vl[7:0]) | 
                                         ({8{ibuf_create_pointer1[16]}} & ib_h1_vl[7:0]) | 
                                         ({8{ibuf_create_pointer2[16]}} & ib_h2_vl[7:0]) | 
                                         ({8{ibuf_create_pointer3[16]}} & ib_h3_vl[7:0]) | 
                                         ({8{ibuf_create_pointer4[16]}} & ib_h4_vl[7:0]) | 
                                         ({8{ibuf_create_pointer5[16]}} & ib_h5_vl[7:0]) | 
                                         ({8{ibuf_create_pointer6[16]}} & ib_h6_vl[7:0]) | 
                                         ({8{ibuf_create_pointer7[16]}} & ib_h7_vl[7:0]) | 
                                         ({8{ibuf_create_pointer8[16]}} & ib_h8_vl[7:0]);

//entry_create_inst_data_n
assign entry_create_vl_17[7:0]         = ({8{ibuf_create_pointer0[17]}} & ib_h0_vl[7:0]) | 
                                         ({8{ibuf_create_pointer1[17]}} & ib_h1_vl[7:0]) | 
                                         ({8{ibuf_create_pointer2[17]}} & ib_h2_vl[7:0]) | 
                                         ({8{ibuf_create_pointer3[17]}} & ib_h3_vl[7:0]) | 
                                         ({8{ibuf_create_pointer4[17]}} & ib_h4_vl[7:0]) | 
                                         ({8{ibuf_create_pointer5[17]}} & ib_h5_vl[7:0]) | 
                                         ({8{ibuf_create_pointer6[17]}} & ib_h6_vl[7:0]) | 
                                         ({8{ibuf_create_pointer7[17]}} & ib_h7_vl[7:0]) | 
                                         ({8{ibuf_create_pointer8[17]}} & ib_h8_vl[7:0]);

//entry_create_inst_data_n
assign entry_create_vl_18[7:0]         = ({8{ibuf_create_pointer0[18]}} & ib_h0_vl[7:0]) | 
                                         ({8{ibuf_create_pointer1[18]}} & ib_h1_vl[7:0]) | 
                                         ({8{ibuf_create_pointer2[18]}} & ib_h2_vl[7:0]) | 
                                         ({8{ibuf_create_pointer3[18]}} & ib_h3_vl[7:0]) | 
                                         ({8{ibuf_create_pointer4[18]}} & ib_h4_vl[7:0]) | 
                                         ({8{ibuf_create_pointer5[18]}} & ib_h5_vl[7:0]) | 
                                         ({8{ibuf_create_pointer6[18]}} & ib_h6_vl[7:0]) | 
                                         ({8{ibuf_create_pointer7[18]}} & ib_h7_vl[7:0]) | 
                                         ({8{ibuf_create_pointer8[18]}} & ib_h8_vl[7:0]);

//entry_create_inst_data_n
assign entry_create_vl_19[7:0]         = ({8{ibuf_create_pointer0[19]}} & ib_h0_vl[7:0]) | 
                                         ({8{ibuf_create_pointer1[19]}} & ib_h1_vl[7:0]) | 
                                         ({8{ibuf_create_pointer2[19]}} & ib_h2_vl[7:0]) | 
                                         ({8{ibuf_create_pointer3[19]}} & ib_h3_vl[7:0]) | 
                                         ({8{ibuf_create_pointer4[19]}} & ib_h4_vl[7:0]) | 
                                         ({8{ibuf_create_pointer5[19]}} & ib_h5_vl[7:0]) | 
                                         ({8{ibuf_create_pointer6[19]}} & ib_h6_vl[7:0]) | 
                                         ({8{ibuf_create_pointer7[19]}} & ib_h7_vl[7:0]) | 
                                         ({8{ibuf_create_pointer8[19]}} & ib_h8_vl[7:0]);

//entry_create_inst_data_n
assign entry_create_vl_20[7:0]         = ({8{ibuf_create_pointer0[20]}} & ib_h0_vl[7:0]) | 
                                         ({8{ibuf_create_pointer1[20]}} & ib_h1_vl[7:0]) | 
                                         ({8{ibuf_create_pointer2[20]}} & ib_h2_vl[7:0]) | 
                                         ({8{ibuf_create_pointer3[20]}} & ib_h3_vl[7:0]) | 
                                         ({8{ibuf_create_pointer4[20]}} & ib_h4_vl[7:0]) | 
                                         ({8{ibuf_create_pointer5[20]}} & ib_h5_vl[7:0]) | 
                                         ({8{ibuf_create_pointer6[20]}} & ib_h6_vl[7:0]) | 
                                         ({8{ibuf_create_pointer7[20]}} & ib_h7_vl[7:0]) | 
                                         ({8{ibuf_create_pointer8[20]}} & ib_h8_vl[7:0]);

//entry_create_inst_data_n
assign entry_create_vl_21[7:0]         = ({8{ibuf_create_pointer0[21]}} & ib_h0_vl[7:0]) | 
                                         ({8{ibuf_create_pointer1[21]}} & ib_h1_vl[7:0]) | 
                                         ({8{ibuf_create_pointer2[21]}} & ib_h2_vl[7:0]) | 
                                         ({8{ibuf_create_pointer3[21]}} & ib_h3_vl[7:0]) | 
                                         ({8{ibuf_create_pointer4[21]}} & ib_h4_vl[7:0]) | 
                                         ({8{ibuf_create_pointer5[21]}} & ib_h5_vl[7:0]) | 
                                         ({8{ibuf_create_pointer6[21]}} & ib_h6_vl[7:0]) | 
                                         ({8{ibuf_create_pointer7[21]}} & ib_h7_vl[7:0]) | 
                                         ({8{ibuf_create_pointer8[21]}} & ib_h8_vl[7:0]);

//entry_create_inst_data_n
assign entry_create_vl_22[7:0]         = ({8{ibuf_create_pointer0[22]}} & ib_h0_vl[7:0]) | 
                                         ({8{ibuf_create_pointer1[22]}} & ib_h1_vl[7:0]) | 
                                         ({8{ibuf_create_pointer2[22]}} & ib_h2_vl[7:0]) | 
                                         ({8{ibuf_create_pointer3[22]}} & ib_h3_vl[7:0]) | 
                                         ({8{ibuf_create_pointer4[22]}} & ib_h4_vl[7:0]) | 
                                         ({8{ibuf_create_pointer5[22]}} & ib_h5_vl[7:0]) | 
                                         ({8{ibuf_create_pointer6[22]}} & ib_h6_vl[7:0]) | 
                                         ({8{ibuf_create_pointer7[22]}} & ib_h7_vl[7:0]) | 
                                         ({8{ibuf_create_pointer8[22]}} & ib_h8_vl[7:0]);

//entry_create_inst_data_n
assign entry_create_vl_23[7:0]         = ({8{ibuf_create_pointer0[23]}} & ib_h0_vl[7:0]) | 
                                         ({8{ibuf_create_pointer1[23]}} & ib_h1_vl[7:0]) | 
                                         ({8{ibuf_create_pointer2[23]}} & ib_h2_vl[7:0]) | 
                                         ({8{ibuf_create_pointer3[23]}} & ib_h3_vl[7:0]) | 
                                         ({8{ibuf_create_pointer4[23]}} & ib_h4_vl[7:0]) | 
                                         ({8{ibuf_create_pointer5[23]}} & ib_h5_vl[7:0]) | 
                                         ({8{ibuf_create_pointer6[23]}} & ib_h6_vl[7:0]) | 
                                         ({8{ibuf_create_pointer7[23]}} & ib_h7_vl[7:0]) | 
                                         ({8{ibuf_create_pointer8[23]}} & ib_h8_vl[7:0]);

//entry_create_inst_data_n
assign entry_create_vl_24[7:0]         = ({8{ibuf_create_pointer0[24]}} & ib_h0_vl[7:0]) | 
                                         ({8{ibuf_create_pointer1[24]}} & ib_h1_vl[7:0]) | 
                                         ({8{ibuf_create_pointer2[24]}} & ib_h2_vl[7:0]) | 
                                         ({8{ibuf_create_pointer3[24]}} & ib_h3_vl[7:0]) | 
                                         ({8{ibuf_create_pointer4[24]}} & ib_h4_vl[7:0]) | 
                                         ({8{ibuf_create_pointer5[24]}} & ib_h5_vl[7:0]) | 
                                         ({8{ibuf_create_pointer6[24]}} & ib_h6_vl[7:0]) | 
                                         ({8{ibuf_create_pointer7[24]}} & ib_h7_vl[7:0]) | 
                                         ({8{ibuf_create_pointer8[24]}} & ib_h8_vl[7:0]);

//entry_create_inst_data_n
assign entry_create_vl_25[7:0]         = ({8{ibuf_create_pointer0[25]}} & ib_h0_vl[7:0]) | 
                                         ({8{ibuf_create_pointer1[25]}} & ib_h1_vl[7:0]) | 
                                         ({8{ibuf_create_pointer2[25]}} & ib_h2_vl[7:0]) | 
                                         ({8{ibuf_create_pointer3[25]}} & ib_h3_vl[7:0]) | 
                                         ({8{ibuf_create_pointer4[25]}} & ib_h4_vl[7:0]) | 
                                         ({8{ibuf_create_pointer5[25]}} & ib_h5_vl[7:0]) | 
                                         ({8{ibuf_create_pointer6[25]}} & ib_h6_vl[7:0]) | 
                                         ({8{ibuf_create_pointer7[25]}} & ib_h7_vl[7:0]) | 
                                         ({8{ibuf_create_pointer8[25]}} & ib_h8_vl[7:0]);

//entry_create_inst_data_n
assign entry_create_vl_26[7:0]         = ({8{ibuf_create_pointer0[26]}} & ib_h0_vl[7:0]) | 
                                         ({8{ibuf_create_pointer1[26]}} & ib_h1_vl[7:0]) | 
                                         ({8{ibuf_create_pointer2[26]}} & ib_h2_vl[7:0]) | 
                                         ({8{ibuf_create_pointer3[26]}} & ib_h3_vl[7:0]) | 
                                         ({8{ibuf_create_pointer4[26]}} & ib_h4_vl[7:0]) | 
                                         ({8{ibuf_create_pointer5[26]}} & ib_h5_vl[7:0]) | 
                                         ({8{ibuf_create_pointer6[26]}} & ib_h6_vl[7:0]) | 
                                         ({8{ibuf_create_pointer7[26]}} & ib_h7_vl[7:0]) | 
                                         ({8{ibuf_create_pointer8[26]}} & ib_h8_vl[7:0]);

//entry_create_inst_data_n
assign entry_create_vl_27[7:0]         = ({8{ibuf_create_pointer0[27]}} & ib_h0_vl[7:0]) | 
                                         ({8{ibuf_create_pointer1[27]}} & ib_h1_vl[7:0]) | 
                                         ({8{ibuf_create_pointer2[27]}} & ib_h2_vl[7:0]) | 
                                         ({8{ibuf_create_pointer3[27]}} & ib_h3_vl[7:0]) | 
                                         ({8{ibuf_create_pointer4[27]}} & ib_h4_vl[7:0]) | 
                                         ({8{ibuf_create_pointer5[27]}} & ib_h5_vl[7:0]) | 
                                         ({8{ibuf_create_pointer6[27]}} & ib_h6_vl[7:0]) | 
                                         ({8{ibuf_create_pointer7[27]}} & ib_h7_vl[7:0]) | 
                                         ({8{ibuf_create_pointer8[27]}} & ib_h8_vl[7:0]);

//entry_create_inst_data_n
assign entry_create_vl_28[7:0]         = ({8{ibuf_create_pointer0[28]}} & ib_h0_vl[7:0]) | 
                                         ({8{ibuf_create_pointer1[28]}} & ib_h1_vl[7:0]) | 
                                         ({8{ibuf_create_pointer2[28]}} & ib_h2_vl[7:0]) | 
                                         ({8{ibuf_create_pointer3[28]}} & ib_h3_vl[7:0]) | 
                                         ({8{ibuf_create_pointer4[28]}} & ib_h4_vl[7:0]) | 
                                         ({8{ibuf_create_pointer5[28]}} & ib_h5_vl[7:0]) | 
                                         ({8{ibuf_create_pointer6[28]}} & ib_h6_vl[7:0]) | 
                                         ({8{ibuf_create_pointer7[28]}} & ib_h7_vl[7:0]) | 
                                         ({8{ibuf_create_pointer8[28]}} & ib_h8_vl[7:0]);

//entry_create_inst_data_n
assign entry_create_vl_29[7:0]         = ({8{ibuf_create_pointer0[29]}} & ib_h0_vl[7:0]) | 
                                         ({8{ibuf_create_pointer1[29]}} & ib_h1_vl[7:0]) | 
                                         ({8{ibuf_create_pointer2[29]}} & ib_h2_vl[7:0]) | 
                                         ({8{ibuf_create_pointer3[29]}} & ib_h3_vl[7:0]) | 
                                         ({8{ibuf_create_pointer4[29]}} & ib_h4_vl[7:0]) | 
                                         ({8{ibuf_create_pointer5[29]}} & ib_h5_vl[7:0]) | 
                                         ({8{ibuf_create_pointer6[29]}} & ib_h6_vl[7:0]) | 
                                         ({8{ibuf_create_pointer7[29]}} & ib_h7_vl[7:0]) | 
                                         ({8{ibuf_create_pointer8[29]}} & ib_h8_vl[7:0]);

//entry_create_inst_data_n
assign entry_create_vl_30[7:0]         = ({8{ibuf_create_pointer0[30]}} & ib_h0_vl[7:0]) | 
                                         ({8{ibuf_create_pointer1[30]}} & ib_h1_vl[7:0]) | 
                                         ({8{ibuf_create_pointer2[30]}} & ib_h2_vl[7:0]) | 
                                         ({8{ibuf_create_pointer3[30]}} & ib_h3_vl[7:0]) | 
                                         ({8{ibuf_create_pointer4[30]}} & ib_h4_vl[7:0]) | 
                                         ({8{ibuf_create_pointer5[30]}} & ib_h5_vl[7:0]) | 
                                         ({8{ibuf_create_pointer6[30]}} & ib_h6_vl[7:0]) | 
                                         ({8{ibuf_create_pointer7[30]}} & ib_h7_vl[7:0]) | 
                                         ({8{ibuf_create_pointer8[30]}} & ib_h8_vl[7:0]);

//entry_create_inst_data_n
assign entry_create_vl_31[7:0]         = ({8{ibuf_create_pointer0[31]}} & ib_h0_vl[7:0]) | 
                                         ({8{ibuf_create_pointer1[31]}} & ib_h1_vl[7:0]) | 
                                         ({8{ibuf_create_pointer2[31]}} & ib_h2_vl[7:0]) | 
                                         ({8{ibuf_create_pointer3[31]}} & ib_h3_vl[7:0]) | 
                                         ({8{ibuf_create_pointer4[31]}} & ib_h4_vl[7:0]) | 
                                         ({8{ibuf_create_pointer5[31]}} & ib_h5_vl[7:0]) | 
                                         ({8{ibuf_create_pointer6[31]}} & ib_h6_vl[7:0]) | 
                                         ({8{ibuf_create_pointer7[31]}} & ib_h7_vl[7:0]) | 
                                         ({8{ibuf_create_pointer8[31]}} & ib_h8_vl[7:0]);


//==========================================================
//                 IBUF Retire Logic
//==========================================================
//including ibuf pop data will come from following interface  
//entry_vld[n]
//entry_acc_err[n]
//entry_pgflt[n]
//entry_tinv[n]
//entry_tfatal[n]
//entry_high_expt[n]
//entry_inst_32_start[n]
//entry_inst_data_n
//entry_split0[n]
//entry_split1[n]
//entry_fence[n]
                                    
//entry_retire[n]
assign entry_retire[31:0] = (ibuf_retire_pointer0[31:0] & {32{retire_vld_0}}) | 
                            (ibuf_retire_pointer1[31:0] & {32{retire_vld_1}}) |  
                            (ibuf_retire_pointer2[31:0] & {32{retire_vld_2}}) |  
                            (ibuf_retire_pointer3[31:0] & {32{retire_vld_3}}) |  
                            (ibuf_retire_pointer4[31:0] & {32{retire_vld_4}}) |  
                            (ibuf_retire_pointer5[31:0] & {32{retire_vld_5}});
assign entry_vld_retire_clk_en[31:0]  = ibuf_retire_pointer0[31:0] | 
                                        ibuf_retire_pointer1[31:0] | 
                                        ibuf_retire_pointer2[31:0] | 
                                        ibuf_retire_pointer3[31:0] | 
                                        ibuf_retire_pointer4[31:0] | 
                                        ibuf_retire_pointer5[31:0]; 
//Generate retire_vld_n
assign ibuf_pop_retire_vld[5:0] = ibuf_pop3_retire_vld[5:0];

assign retire_vld_0       = ibuf_pop_retire_vld[5] && ibuf_retire_vld;
assign retire_vld_1       = ibuf_pop_retire_vld[4] && ibuf_retire_vld;
assign retire_vld_2       = ibuf_pop_retire_vld[3] && ibuf_retire_vld;
assign retire_vld_3       = ibuf_pop_retire_vld[2] && ibuf_retire_vld;
assign retire_vld_4       = ibuf_pop_retire_vld[1] && ibuf_retire_vld;
assign retire_vld_5       = ibuf_pop_retire_vld[0] && ibuf_retire_vld;

//pop_hn_vld
assign pop_h0_vld         = |(ibuf_retire_pointer0[31:0] & entry_vld[31:0]);                                         
assign pop_h1_vld         = |(ibuf_retire_pointer1[31:0] & entry_vld[31:0]);                                         
assign pop_h2_vld         = |(ibuf_retire_pointer2[31:0] & entry_vld[31:0]);                                         
assign pop_h3_vld         = |(ibuf_retire_pointer3[31:0] & entry_vld[31:0]);                                         
assign pop_h4_vld         = |(ibuf_retire_pointer4[31:0] & entry_vld[31:0]);                                         
//assign pop_h5_vld         = |(ibuf_retire_pointer5[31:0] & entry_vld[31:0]);
//pop_hn_acc_err
assign pop_h0_acc_err     = |(ibuf_retire_pointer0[31:0] & entry_acc_err[31:0]);                                         
assign pop_h1_acc_err     = |(ibuf_retire_pointer1[31:0] & entry_acc_err[31:0]);                                         
assign pop_h2_acc_err     = |(ibuf_retire_pointer2[31:0] & entry_acc_err[31:0]);                                         
assign pop_h3_acc_err     = |(ibuf_retire_pointer3[31:0] & entry_acc_err[31:0]);                                         
assign pop_h4_acc_err     = |(ibuf_retire_pointer4[31:0] & entry_acc_err[31:0]);             

assign pop_h0_ecc_err     = 1'b0;                                         
assign pop_h1_ecc_err     = 1'b0;                                         
assign pop_h2_ecc_err     = 1'b0;                                         
assign pop_h3_ecc_err     = 1'b0;                                         
assign pop_h4_ecc_err     = 1'b0;    

//pop_hn_pgflt
assign pop_h0_pgflt       = |(ibuf_retire_pointer0[31:0] & entry_pgflt[31:0]);                                         
assign pop_h1_pgflt       = |(ibuf_retire_pointer1[31:0] & entry_pgflt[31:0]);                                         
assign pop_h2_pgflt       = |(ibuf_retire_pointer2[31:0] & entry_pgflt[31:0]);                                         
assign pop_h3_pgflt       = |(ibuf_retire_pointer3[31:0] & entry_pgflt[31:0]);                                         
assign pop_h4_pgflt       = |(ibuf_retire_pointer4[31:0] & entry_pgflt[31:0]);                                         
                                       
//pop_hn_high_expt
assign pop_h0_high_expt   = |(ibuf_retire_pointer0[31:0] & entry_high_expt[31:0]);                                         
assign pop_h1_high_expt   = |(ibuf_retire_pointer1[31:0] & entry_high_expt[31:0]);                                         
assign pop_h2_high_expt   = |(ibuf_retire_pointer2[31:0] & entry_high_expt[31:0]);                                         
assign pop_h3_high_expt   = |(ibuf_retire_pointer3[31:0] & entry_high_expt[31:0]);                                         
assign pop_h4_high_expt   = |(ibuf_retire_pointer4[31:0] & entry_high_expt[31:0]);                                         
//pop_hn_split1
assign pop_h0_split1      = |(ibuf_retire_pointer0[31:0] & entry_split1[31:0]);                                         
assign pop_h1_split1      = |(ibuf_retire_pointer1[31:0] & entry_split1[31:0]);                                         
assign pop_h2_split1      = |(ibuf_retire_pointer2[31:0] & entry_split1[31:0]);                                         
assign pop_h3_split1      = |(ibuf_retire_pointer3[31:0] & entry_split1[31:0]);                                         
assign pop_h4_split1      = |(ibuf_retire_pointer4[31:0] & entry_split1[31:0]);                                         
//assign pop_h5_split1      = |(ibuf_retire_pointer5[31:0] & entry_split1[31:0]);
//pop_hn_split0
assign pop_h0_split0      = |(ibuf_retire_pointer0[31:0] & entry_split0[31:0]);                                         
assign pop_h1_split0      = |(ibuf_retire_pointer1[31:0] & entry_split0[31:0]);                                         
assign pop_h2_split0      = |(ibuf_retire_pointer2[31:0] & entry_split0[31:0]);                                         
assign pop_h3_split0      = |(ibuf_retire_pointer3[31:0] & entry_split0[31:0]);                                         
assign pop_h4_split0      = |(ibuf_retire_pointer4[31:0] & entry_split0[31:0]);                                         
//assign pop_h5_split0      = |(ibuf_retire_pointer5[31:0] & entry_split0[31:0]);
//pop_hn_fence
assign pop_h0_fence      = |(ibuf_retire_pointer0[31:0] & entry_fence[31:0]);                                         
assign pop_h1_fence      = |(ibuf_retire_pointer1[31:0] & entry_fence[31:0]);                                         
assign pop_h2_fence      = |(ibuf_retire_pointer2[31:0] & entry_fence[31:0]);                                         
assign pop_h3_fence      = |(ibuf_retire_pointer3[31:0] & entry_fence[31:0]);                                         
assign pop_h4_fence      = |(ibuf_retire_pointer4[31:0] & entry_fence[31:0]);                                         
//assign pop_h5_fence      = |(ibuf_retire_pointer5[31:0] & entry_fence[31:0]);
//pop_hn_bkpta
assign pop_h0_bkpta      = |(ibuf_retire_pointer0[31:0] & entry_bkpta[31:0]);                                         
assign pop_h1_bkpta      = |(ibuf_retire_pointer1[31:0] & entry_bkpta[31:0]);                                         
assign pop_h2_bkpta      = |(ibuf_retire_pointer2[31:0] & entry_bkpta[31:0]);                                         
assign pop_h3_bkpta      = |(ibuf_retire_pointer3[31:0] & entry_bkpta[31:0]);                                         
assign pop_h4_bkpta      = |(ibuf_retire_pointer4[31:0] & entry_bkpta[31:0]);                                         
//assign pop_h5_bkpta      = |(ibuf_retire_pointer5[31:0] & entry_bkpta[31:0]);
//pop_hn_bkptb
assign pop_h0_bkptb      = |(ibuf_retire_pointer0[31:0] & entry_bkptb[31:0]);                                         
assign pop_h1_bkptb      = |(ibuf_retire_pointer1[31:0] & entry_bkptb[31:0]);                                         
assign pop_h2_bkptb      = |(ibuf_retire_pointer2[31:0] & entry_bkptb[31:0]);                                         
assign pop_h3_bkptb      = |(ibuf_retire_pointer3[31:0] & entry_bkptb[31:0]);                                         
assign pop_h4_bkptb      = |(ibuf_retire_pointer4[31:0] & entry_bkptb[31:0]);                                         
//assign pop_h5_bkptb      = |(ibuf_retire_pointer5[31:0] & entry_bkptb[31:0]);
//pop_hn_no_spec
assign pop_h0_no_spec    = |(ibuf_retire_pointer0[31:0] & entry_no_spec[31:0]);                                         
assign pop_h1_no_spec    = |(ibuf_retire_pointer1[31:0] & entry_no_spec[31:0]);                                         
assign pop_h2_no_spec    = |(ibuf_retire_pointer2[31:0] & entry_no_spec[31:0]);                                         
assign pop_h3_no_spec    = |(ibuf_retire_pointer3[31:0] & entry_no_spec[31:0]);                                         
assign pop_h4_no_spec    = |(ibuf_retire_pointer4[31:0] & entry_no_spec[31:0]);  
//pop_hn_vl_pred
assign pop_h0_vl_pred    = |(ibuf_retire_pointer0[31:0] & entry_vl_pred[31:0]);                                         
assign pop_h1_vl_pred    = |(ibuf_retire_pointer1[31:0] & entry_vl_pred[31:0]);                                         
assign pop_h2_vl_pred    = |(ibuf_retire_pointer2[31:0] & entry_vl_pred[31:0]);                                         
assign pop_h3_vl_pred    = |(ibuf_retire_pointer3[31:0] & entry_vl_pred[31:0]);                                         
assign pop_h4_vl_pred    = |(ibuf_retire_pointer4[31:0] & entry_vl_pred[31:0]);  
//pop_hn_32_start
assign pop_h0_32_start   = |(ibuf_retire_pointer0[31:0] & entry_32_start[31:0]);                                         
assign pop_h1_32_start   = |(ibuf_retire_pointer1[31:0] & entry_32_start[31:0]);                                         
assign pop_h2_32_start   = |(ibuf_retire_pointer2[31:0] & entry_32_start[31:0]);                                         
assign pop_h3_32_start   = |(ibuf_retire_pointer3[31:0] & entry_32_start[31:0]);                                         
assign pop_h4_32_start   = |(ibuf_retire_pointer4[31:0] & entry_32_start[31:0]);                                         
//assign pop_h5_32_start   = |(ibuf_retire_pointer5[31:0] & entry_32_start[31:0]);

//pop_hn_data[15:0]
// &CombBeg; @2570
always @( entry_inst_data_12[15:0]
       or entry_inst_data_8[15:0]
       or entry_inst_data_17[15:0]
       or entry_inst_data_10[15:0]
       or entry_inst_data_19[15:0]
       or entry_inst_data_27[15:0]
       or entry_inst_data_20[15:0]
       or entry_inst_data_6[15:0]
       or entry_inst_data_7[15:0]
       or entry_inst_data_31[15:0]
       or entry_inst_data_3[15:0]
       or entry_inst_data_21[15:0]
       or entry_inst_data_24[15:0]
       or entry_inst_data_15[15:0]
       or entry_inst_data_22[15:0]
       or ibuf_retire_pointer0[31:0]
       or entry_inst_data_5[15:0]
       or entry_inst_data_11[15:0]
       or entry_inst_data_30[15:0]
       or entry_inst_data_25[15:0]
       or entry_inst_data_14[15:0]
       or entry_inst_data_18[15:0]
       or entry_inst_data_9[15:0]
       or entry_inst_data_1[15:0]
       or entry_inst_data_26[15:0]
       or entry_inst_data_2[15:0]
       or entry_inst_data_4[15:0]
       or entry_inst_data_13[15:0]
       or entry_inst_data_16[15:0]
       or entry_inst_data_23[15:0]
       or entry_inst_data_28[15:0]
       or entry_inst_data_0[15:0]
       or entry_inst_data_29[15:0])
begin
case(ibuf_retire_pointer0[31:0])
  32'h00000001 : pop_h0_data[15:0] = entry_inst_data_0[15:0];
  32'h00000002 : pop_h0_data[15:0] = entry_inst_data_1[15:0];
  32'h00000004 : pop_h0_data[15:0] = entry_inst_data_2[15:0];
  32'h00000008 : pop_h0_data[15:0] = entry_inst_data_3[15:0];
  32'h00000010 : pop_h0_data[15:0] = entry_inst_data_4[15:0];
  32'h00000020 : pop_h0_data[15:0] = entry_inst_data_5[15:0];
  32'h00000040 : pop_h0_data[15:0] = entry_inst_data_6[15:0];
  32'h00000080 : pop_h0_data[15:0] = entry_inst_data_7[15:0];
  32'h00000100 : pop_h0_data[15:0] = entry_inst_data_8[15:0];
  32'h00000200 : pop_h0_data[15:0] = entry_inst_data_9[15:0];
  32'h00000400 : pop_h0_data[15:0] = entry_inst_data_10[15:0];
  32'h00000800 : pop_h0_data[15:0] = entry_inst_data_11[15:0];
  32'h00001000 : pop_h0_data[15:0] = entry_inst_data_12[15:0];
  32'h00002000 : pop_h0_data[15:0] = entry_inst_data_13[15:0];
  32'h00004000 : pop_h0_data[15:0] = entry_inst_data_14[15:0];
  32'h00008000 : pop_h0_data[15:0] = entry_inst_data_15[15:0];
  32'h00010000 : pop_h0_data[15:0] = entry_inst_data_16[15:0];
  32'h00020000 : pop_h0_data[15:0] = entry_inst_data_17[15:0];
  32'h00040000 : pop_h0_data[15:0] = entry_inst_data_18[15:0];
  32'h00080000 : pop_h0_data[15:0] = entry_inst_data_19[15:0];
  32'h00100000 : pop_h0_data[15:0] = entry_inst_data_20[15:0];
  32'h00200000 : pop_h0_data[15:0] = entry_inst_data_21[15:0];
  32'h00400000 : pop_h0_data[15:0] = entry_inst_data_22[15:0];
  32'h00800000 : pop_h0_data[15:0] = entry_inst_data_23[15:0];
  32'h01000000 : pop_h0_data[15:0] = entry_inst_data_24[15:0];
  32'h02000000 : pop_h0_data[15:0] = entry_inst_data_25[15:0];
  32'h04000000 : pop_h0_data[15:0] = entry_inst_data_26[15:0];
  32'h08000000 : pop_h0_data[15:0] = entry_inst_data_27[15:0];
  32'h10000000 : pop_h0_data[15:0] = entry_inst_data_28[15:0];
  32'h20000000 : pop_h0_data[15:0] = entry_inst_data_29[15:0];
  32'h40000000 : pop_h0_data[15:0] = entry_inst_data_30[15:0];
  32'h80000000 : pop_h0_data[15:0] = entry_inst_data_31[15:0];
  default      : pop_h0_data[15:0] = {16{1'bx}};
endcase
// &CombEnd; @2606
end

// &CombBeg; @2608
always @( entry_inst_data_12[15:0]
       or entry_inst_data_8[15:0]
       or entry_inst_data_17[15:0]
       or entry_inst_data_10[15:0]
       or entry_inst_data_19[15:0]
       or entry_inst_data_27[15:0]
       or entry_inst_data_20[15:0]
       or entry_inst_data_6[15:0]
       or entry_inst_data_7[15:0]
       or entry_inst_data_31[15:0]
       or entry_inst_data_3[15:0]
       or entry_inst_data_21[15:0]
       or entry_inst_data_15[15:0]
       or entry_inst_data_24[15:0]
       or entry_inst_data_22[15:0]
       or entry_inst_data_5[15:0]
       or entry_inst_data_11[15:0]
       or ibuf_retire_pointer1[31:0]
       or entry_inst_data_30[15:0]
       or entry_inst_data_14[15:0]
       or entry_inst_data_25[15:0]
       or entry_inst_data_18[15:0]
       or entry_inst_data_9[15:0]
       or entry_inst_data_1[15:0]
       or entry_inst_data_26[15:0]
       or entry_inst_data_4[15:0]
       or entry_inst_data_2[15:0]
       or entry_inst_data_13[15:0]
       or entry_inst_data_16[15:0]
       or entry_inst_data_23[15:0]
       or entry_inst_data_28[15:0]
       or entry_inst_data_0[15:0]
       or entry_inst_data_29[15:0])
begin
case(ibuf_retire_pointer1[31:0])
  32'h00000001 : pop_h1_data[15:0] = entry_inst_data_0[15:0];
  32'h00000002 : pop_h1_data[15:0] = entry_inst_data_1[15:0];
  32'h00000004 : pop_h1_data[15:0] = entry_inst_data_2[15:0];
  32'h00000008 : pop_h1_data[15:0] = entry_inst_data_3[15:0];
  32'h00000010 : pop_h1_data[15:0] = entry_inst_data_4[15:0];
  32'h00000020 : pop_h1_data[15:0] = entry_inst_data_5[15:0];
  32'h00000040 : pop_h1_data[15:0] = entry_inst_data_6[15:0];
  32'h00000080 : pop_h1_data[15:0] = entry_inst_data_7[15:0];
  32'h00000100 : pop_h1_data[15:0] = entry_inst_data_8[15:0];
  32'h00000200 : pop_h1_data[15:0] = entry_inst_data_9[15:0];
  32'h00000400 : pop_h1_data[15:0] = entry_inst_data_10[15:0];
  32'h00000800 : pop_h1_data[15:0] = entry_inst_data_11[15:0];
  32'h00001000 : pop_h1_data[15:0] = entry_inst_data_12[15:0];
  32'h00002000 : pop_h1_data[15:0] = entry_inst_data_13[15:0];
  32'h00004000 : pop_h1_data[15:0] = entry_inst_data_14[15:0];
  32'h00008000 : pop_h1_data[15:0] = entry_inst_data_15[15:0];
  32'h00010000 : pop_h1_data[15:0] = entry_inst_data_16[15:0];
  32'h00020000 : pop_h1_data[15:0] = entry_inst_data_17[15:0];
  32'h00040000 : pop_h1_data[15:0] = entry_inst_data_18[15:0];
  32'h00080000 : pop_h1_data[15:0] = entry_inst_data_19[15:0];
  32'h00100000 : pop_h1_data[15:0] = entry_inst_data_20[15:0];
  32'h00200000 : pop_h1_data[15:0] = entry_inst_data_21[15:0];
  32'h00400000 : pop_h1_data[15:0] = entry_inst_data_22[15:0];
  32'h00800000 : pop_h1_data[15:0] = entry_inst_data_23[15:0];
  32'h01000000 : pop_h1_data[15:0] = entry_inst_data_24[15:0];
  32'h02000000 : pop_h1_data[15:0] = entry_inst_data_25[15:0];
  32'h04000000 : pop_h1_data[15:0] = entry_inst_data_26[15:0];
  32'h08000000 : pop_h1_data[15:0] = entry_inst_data_27[15:0];
  32'h10000000 : pop_h1_data[15:0] = entry_inst_data_28[15:0];
  32'h20000000 : pop_h1_data[15:0] = entry_inst_data_29[15:0];
  32'h40000000 : pop_h1_data[15:0] = entry_inst_data_30[15:0];
  32'h80000000 : pop_h1_data[15:0] = entry_inst_data_31[15:0];
  default      : pop_h1_data[15:0] = {16{1'bx}};
endcase
// &CombEnd; @2644
end

// &CombBeg; @2646
always @( entry_inst_data_12[15:0]
       or entry_inst_data_8[15:0]
       or entry_inst_data_17[15:0]
       or entry_inst_data_10[15:0]
       or entry_inst_data_19[15:0]
       or entry_inst_data_27[15:0]
       or entry_inst_data_20[15:0]
       or entry_inst_data_6[15:0]
       or entry_inst_data_7[15:0]
       or entry_inst_data_31[15:0]
       or entry_inst_data_3[15:0]
       or entry_inst_data_21[15:0]
       or entry_inst_data_15[15:0]
       or entry_inst_data_24[15:0]
       or entry_inst_data_22[15:0]
       or entry_inst_data_5[15:0]
       or entry_inst_data_11[15:0]
       or entry_inst_data_30[15:0]
       or entry_inst_data_14[15:0]
       or entry_inst_data_25[15:0]
       or entry_inst_data_18[15:0]
       or entry_inst_data_9[15:0]
       or entry_inst_data_1[15:0]
       or entry_inst_data_26[15:0]
       or entry_inst_data_4[15:0]
       or entry_inst_data_2[15:0]
       or entry_inst_data_13[15:0]
       or ibuf_retire_pointer2[31:0]
       or entry_inst_data_16[15:0]
       or entry_inst_data_23[15:0]
       or entry_inst_data_28[15:0]
       or entry_inst_data_0[15:0]
       or entry_inst_data_29[15:0])
begin
case(ibuf_retire_pointer2[31:0])
  32'h00000001 : pop_h2_data[15:0] = entry_inst_data_0[15:0];
  32'h00000002 : pop_h2_data[15:0] = entry_inst_data_1[15:0];
  32'h00000004 : pop_h2_data[15:0] = entry_inst_data_2[15:0];
  32'h00000008 : pop_h2_data[15:0] = entry_inst_data_3[15:0];
  32'h00000010 : pop_h2_data[15:0] = entry_inst_data_4[15:0];
  32'h00000020 : pop_h2_data[15:0] = entry_inst_data_5[15:0];
  32'h00000040 : pop_h2_data[15:0] = entry_inst_data_6[15:0];
  32'h00000080 : pop_h2_data[15:0] = entry_inst_data_7[15:0];
  32'h00000100 : pop_h2_data[15:0] = entry_inst_data_8[15:0];
  32'h00000200 : pop_h2_data[15:0] = entry_inst_data_9[15:0];
  32'h00000400 : pop_h2_data[15:0] = entry_inst_data_10[15:0];
  32'h00000800 : pop_h2_data[15:0] = entry_inst_data_11[15:0];
  32'h00001000 : pop_h2_data[15:0] = entry_inst_data_12[15:0];
  32'h00002000 : pop_h2_data[15:0] = entry_inst_data_13[15:0];
  32'h00004000 : pop_h2_data[15:0] = entry_inst_data_14[15:0];
  32'h00008000 : pop_h2_data[15:0] = entry_inst_data_15[15:0];
  32'h00010000 : pop_h2_data[15:0] = entry_inst_data_16[15:0];
  32'h00020000 : pop_h2_data[15:0] = entry_inst_data_17[15:0];
  32'h00040000 : pop_h2_data[15:0] = entry_inst_data_18[15:0];
  32'h00080000 : pop_h2_data[15:0] = entry_inst_data_19[15:0];
  32'h00100000 : pop_h2_data[15:0] = entry_inst_data_20[15:0];
  32'h00200000 : pop_h2_data[15:0] = entry_inst_data_21[15:0];
  32'h00400000 : pop_h2_data[15:0] = entry_inst_data_22[15:0];
  32'h00800000 : pop_h2_data[15:0] = entry_inst_data_23[15:0];
  32'h01000000 : pop_h2_data[15:0] = entry_inst_data_24[15:0];
  32'h02000000 : pop_h2_data[15:0] = entry_inst_data_25[15:0];
  32'h04000000 : pop_h2_data[15:0] = entry_inst_data_26[15:0];
  32'h08000000 : pop_h2_data[15:0] = entry_inst_data_27[15:0];
  32'h10000000 : pop_h2_data[15:0] = entry_inst_data_28[15:0];
  32'h20000000 : pop_h2_data[15:0] = entry_inst_data_29[15:0];
  32'h40000000 : pop_h2_data[15:0] = entry_inst_data_30[15:0];
  32'h80000000 : pop_h2_data[15:0] = entry_inst_data_31[15:0];
  default      : pop_h2_data[15:0] = {16{1'bx}};
endcase
// &CombEnd; @2682
end

// &CombBeg; @2684
always @( entry_inst_data_12[15:0]
       or entry_inst_data_8[15:0]
       or entry_inst_data_17[15:0]
       or entry_inst_data_10[15:0]
       or entry_inst_data_19[15:0]
       or entry_inst_data_27[15:0]
       or entry_inst_data_20[15:0]
       or entry_inst_data_6[15:0]
       or entry_inst_data_7[15:0]
       or entry_inst_data_31[15:0]
       or entry_inst_data_3[15:0]
       or entry_inst_data_21[15:0]
       or entry_inst_data_15[15:0]
       or entry_inst_data_24[15:0]
       or entry_inst_data_22[15:0]
       or entry_inst_data_5[15:0]
       or entry_inst_data_11[15:0]
       or entry_inst_data_30[15:0]
       or entry_inst_data_14[15:0]
       or entry_inst_data_25[15:0]
       or entry_inst_data_18[15:0]
       or entry_inst_data_9[15:0]
       or ibuf_retire_pointer3[31:0]
       or entry_inst_data_1[15:0]
       or entry_inst_data_26[15:0]
       or entry_inst_data_4[15:0]
       or entry_inst_data_2[15:0]
       or entry_inst_data_13[15:0]
       or entry_inst_data_16[15:0]
       or entry_inst_data_23[15:0]
       or entry_inst_data_28[15:0]
       or entry_inst_data_0[15:0]
       or entry_inst_data_29[15:0])
begin
case(ibuf_retire_pointer3[31:0])
  32'h00000001 : pop_h3_data[15:0] = entry_inst_data_0[15:0];
  32'h00000002 : pop_h3_data[15:0] = entry_inst_data_1[15:0];
  32'h00000004 : pop_h3_data[15:0] = entry_inst_data_2[15:0];
  32'h00000008 : pop_h3_data[15:0] = entry_inst_data_3[15:0];
  32'h00000010 : pop_h3_data[15:0] = entry_inst_data_4[15:0];
  32'h00000020 : pop_h3_data[15:0] = entry_inst_data_5[15:0];
  32'h00000040 : pop_h3_data[15:0] = entry_inst_data_6[15:0];
  32'h00000080 : pop_h3_data[15:0] = entry_inst_data_7[15:0];
  32'h00000100 : pop_h3_data[15:0] = entry_inst_data_8[15:0];
  32'h00000200 : pop_h3_data[15:0] = entry_inst_data_9[15:0];
  32'h00000400 : pop_h3_data[15:0] = entry_inst_data_10[15:0];
  32'h00000800 : pop_h3_data[15:0] = entry_inst_data_11[15:0];
  32'h00001000 : pop_h3_data[15:0] = entry_inst_data_12[15:0];
  32'h00002000 : pop_h3_data[15:0] = entry_inst_data_13[15:0];
  32'h00004000 : pop_h3_data[15:0] = entry_inst_data_14[15:0];
  32'h00008000 : pop_h3_data[15:0] = entry_inst_data_15[15:0];
  32'h00010000 : pop_h3_data[15:0] = entry_inst_data_16[15:0];
  32'h00020000 : pop_h3_data[15:0] = entry_inst_data_17[15:0];
  32'h00040000 : pop_h3_data[15:0] = entry_inst_data_18[15:0];
  32'h00080000 : pop_h3_data[15:0] = entry_inst_data_19[15:0];
  32'h00100000 : pop_h3_data[15:0] = entry_inst_data_20[15:0];
  32'h00200000 : pop_h3_data[15:0] = entry_inst_data_21[15:0];
  32'h00400000 : pop_h3_data[15:0] = entry_inst_data_22[15:0];
  32'h00800000 : pop_h3_data[15:0] = entry_inst_data_23[15:0];
  32'h01000000 : pop_h3_data[15:0] = entry_inst_data_24[15:0];
  32'h02000000 : pop_h3_data[15:0] = entry_inst_data_25[15:0];
  32'h04000000 : pop_h3_data[15:0] = entry_inst_data_26[15:0];
  32'h08000000 : pop_h3_data[15:0] = entry_inst_data_27[15:0];
  32'h10000000 : pop_h3_data[15:0] = entry_inst_data_28[15:0];
  32'h20000000 : pop_h3_data[15:0] = entry_inst_data_29[15:0];
  32'h40000000 : pop_h3_data[15:0] = entry_inst_data_30[15:0];
  32'h80000000 : pop_h3_data[15:0] = entry_inst_data_31[15:0];
  default      : pop_h3_data[15:0] = {16{1'bx}};
endcase
// &CombEnd; @2720
end

// &CombBeg; @2722
always @( entry_inst_data_12[15:0]
       or entry_inst_data_8[15:0]
       or entry_inst_data_17[15:0]
       or entry_inst_data_10[15:0]
       or entry_inst_data_19[15:0]
       or entry_inst_data_27[15:0]
       or ibuf_retire_pointer4[31:0]
       or entry_inst_data_20[15:0]
       or entry_inst_data_6[15:0]
       or entry_inst_data_7[15:0]
       or entry_inst_data_31[15:0]
       or entry_inst_data_3[15:0]
       or entry_inst_data_21[15:0]
       or entry_inst_data_15[15:0]
       or entry_inst_data_24[15:0]
       or entry_inst_data_22[15:0]
       or entry_inst_data_5[15:0]
       or entry_inst_data_11[15:0]
       or entry_inst_data_30[15:0]
       or entry_inst_data_14[15:0]
       or entry_inst_data_25[15:0]
       or entry_inst_data_18[15:0]
       or entry_inst_data_9[15:0]
       or entry_inst_data_1[15:0]
       or entry_inst_data_26[15:0]
       or entry_inst_data_4[15:0]
       or entry_inst_data_2[15:0]
       or entry_inst_data_13[15:0]
       or entry_inst_data_16[15:0]
       or entry_inst_data_23[15:0]
       or entry_inst_data_28[15:0]
       or entry_inst_data_0[15:0]
       or entry_inst_data_29[15:0])
begin
case(ibuf_retire_pointer4[31:0])
  32'h00000001 : pop_h4_data[15:0] = entry_inst_data_0[15:0];
  32'h00000002 : pop_h4_data[15:0] = entry_inst_data_1[15:0];
  32'h00000004 : pop_h4_data[15:0] = entry_inst_data_2[15:0];
  32'h00000008 : pop_h4_data[15:0] = entry_inst_data_3[15:0];
  32'h00000010 : pop_h4_data[15:0] = entry_inst_data_4[15:0];
  32'h00000020 : pop_h4_data[15:0] = entry_inst_data_5[15:0];
  32'h00000040 : pop_h4_data[15:0] = entry_inst_data_6[15:0];
  32'h00000080 : pop_h4_data[15:0] = entry_inst_data_7[15:0];
  32'h00000100 : pop_h4_data[15:0] = entry_inst_data_8[15:0];
  32'h00000200 : pop_h4_data[15:0] = entry_inst_data_9[15:0];
  32'h00000400 : pop_h4_data[15:0] = entry_inst_data_10[15:0];
  32'h00000800 : pop_h4_data[15:0] = entry_inst_data_11[15:0];
  32'h00001000 : pop_h4_data[15:0] = entry_inst_data_12[15:0];
  32'h00002000 : pop_h4_data[15:0] = entry_inst_data_13[15:0];
  32'h00004000 : pop_h4_data[15:0] = entry_inst_data_14[15:0];
  32'h00008000 : pop_h4_data[15:0] = entry_inst_data_15[15:0];
  32'h00010000 : pop_h4_data[15:0] = entry_inst_data_16[15:0];
  32'h00020000 : pop_h4_data[15:0] = entry_inst_data_17[15:0];
  32'h00040000 : pop_h4_data[15:0] = entry_inst_data_18[15:0];
  32'h00080000 : pop_h4_data[15:0] = entry_inst_data_19[15:0];
  32'h00100000 : pop_h4_data[15:0] = entry_inst_data_20[15:0];
  32'h00200000 : pop_h4_data[15:0] = entry_inst_data_21[15:0];
  32'h00400000 : pop_h4_data[15:0] = entry_inst_data_22[15:0];
  32'h00800000 : pop_h4_data[15:0] = entry_inst_data_23[15:0];
  32'h01000000 : pop_h4_data[15:0] = entry_inst_data_24[15:0];
  32'h02000000 : pop_h4_data[15:0] = entry_inst_data_25[15:0];
  32'h04000000 : pop_h4_data[15:0] = entry_inst_data_26[15:0];
  32'h08000000 : pop_h4_data[15:0] = entry_inst_data_27[15:0];
  32'h10000000 : pop_h4_data[15:0] = entry_inst_data_28[15:0];
  32'h20000000 : pop_h4_data[15:0] = entry_inst_data_29[15:0];
  32'h40000000 : pop_h4_data[15:0] = entry_inst_data_30[15:0];
  32'h80000000 : pop_h4_data[15:0] = entry_inst_data_31[15:0];
  default      : pop_h4_data[15:0] = {16{1'bx}};
endcase
// &CombEnd; @2758
end

// &CombBeg; @2760
always @( entry_inst_data_12[15:0]
       or entry_inst_data_8[15:0]
       or entry_inst_data_17[15:0]
       or entry_inst_data_10[15:0]
       or entry_inst_data_19[15:0]
       or entry_inst_data_27[15:0]
       or entry_inst_data_20[15:0]
       or entry_inst_data_6[15:0]
       or entry_inst_data_7[15:0]
       or entry_inst_data_31[15:0]
       or entry_inst_data_3[15:0]
       or entry_inst_data_21[15:0]
       or entry_inst_data_15[15:0]
       or entry_inst_data_24[15:0]
       or entry_inst_data_22[15:0]
       or entry_inst_data_5[15:0]
       or entry_inst_data_11[15:0]
       or entry_inst_data_30[15:0]
       or entry_inst_data_14[15:0]
       or entry_inst_data_25[15:0]
       or entry_inst_data_18[15:0]
       or entry_inst_data_9[15:0]
       or entry_inst_data_1[15:0]
       or entry_inst_data_26[15:0]
       or entry_inst_data_4[15:0]
       or entry_inst_data_2[15:0]
       or ibuf_retire_pointer5[31:0]
       or entry_inst_data_13[15:0]
       or entry_inst_data_16[15:0]
       or entry_inst_data_23[15:0]
       or entry_inst_data_28[15:0]
       or entry_inst_data_0[15:0]
       or entry_inst_data_29[15:0])
begin
case(ibuf_retire_pointer5[31:0])
  32'h00000001 : pop_h5_data[15:0] = entry_inst_data_0[15:0];
  32'h00000002 : pop_h5_data[15:0] = entry_inst_data_1[15:0];
  32'h00000004 : pop_h5_data[15:0] = entry_inst_data_2[15:0];
  32'h00000008 : pop_h5_data[15:0] = entry_inst_data_3[15:0];
  32'h00000010 : pop_h5_data[15:0] = entry_inst_data_4[15:0];
  32'h00000020 : pop_h5_data[15:0] = entry_inst_data_5[15:0];
  32'h00000040 : pop_h5_data[15:0] = entry_inst_data_6[15:0];
  32'h00000080 : pop_h5_data[15:0] = entry_inst_data_7[15:0];
  32'h00000100 : pop_h5_data[15:0] = entry_inst_data_8[15:0];
  32'h00000200 : pop_h5_data[15:0] = entry_inst_data_9[15:0];
  32'h00000400 : pop_h5_data[15:0] = entry_inst_data_10[15:0];
  32'h00000800 : pop_h5_data[15:0] = entry_inst_data_11[15:0];
  32'h00001000 : pop_h5_data[15:0] = entry_inst_data_12[15:0];
  32'h00002000 : pop_h5_data[15:0] = entry_inst_data_13[15:0];
  32'h00004000 : pop_h5_data[15:0] = entry_inst_data_14[15:0];
  32'h00008000 : pop_h5_data[15:0] = entry_inst_data_15[15:0];
  32'h00010000 : pop_h5_data[15:0] = entry_inst_data_16[15:0];
  32'h00020000 : pop_h5_data[15:0] = entry_inst_data_17[15:0];
  32'h00040000 : pop_h5_data[15:0] = entry_inst_data_18[15:0];
  32'h00080000 : pop_h5_data[15:0] = entry_inst_data_19[15:0];
  32'h00100000 : pop_h5_data[15:0] = entry_inst_data_20[15:0];
  32'h00200000 : pop_h5_data[15:0] = entry_inst_data_21[15:0];
  32'h00400000 : pop_h5_data[15:0] = entry_inst_data_22[15:0];
  32'h00800000 : pop_h5_data[15:0] = entry_inst_data_23[15:0];
  32'h01000000 : pop_h5_data[15:0] = entry_inst_data_24[15:0];
  32'h02000000 : pop_h5_data[15:0] = entry_inst_data_25[15:0];
  32'h04000000 : pop_h5_data[15:0] = entry_inst_data_26[15:0];
  32'h08000000 : pop_h5_data[15:0] = entry_inst_data_27[15:0];
  32'h10000000 : pop_h5_data[15:0] = entry_inst_data_28[15:0];
  32'h20000000 : pop_h5_data[15:0] = entry_inst_data_29[15:0];
  32'h40000000 : pop_h5_data[15:0] = entry_inst_data_30[15:0];
  32'h80000000 : pop_h5_data[15:0] = entry_inst_data_31[15:0];
  default      : pop_h5_data[15:0] = {16{1'bx}};
endcase
// &CombEnd; @2796
end

// &CombBeg; @2798
always @( entry_pc_10[14:0]
       or entry_pc_1[14:0]
       or entry_pc_27[14:0]
       or entry_pc_26[14:0]
       or entry_pc_11[14:0]
       or entry_pc_28[14:0]
       or entry_pc_13[14:0]
       or entry_pc_7[14:0]
       or entry_pc_5[14:0]
       or entry_pc_29[14:0]
       or entry_pc_20[14:0]
       or entry_pc_0[14:0]
       or entry_pc_18[14:0]
       or entry_pc_2[14:0]
       or entry_pc_31[14:0]
       or entry_pc_4[14:0]
       or entry_pc_12[14:0]
       or entry_pc_22[14:0]
       or entry_pc_21[14:0]
       or entry_pc_8[14:0]
       or entry_pc_17[14:0]
       or entry_pc_6[14:0]
       or entry_pc_23[14:0]
       or ibuf_retire_pointer0[31:0]
       or entry_pc_25[14:0]
       or entry_pc_16[14:0]
       or entry_pc_9[14:0]
       or entry_pc_24[14:0]
       or entry_pc_14[14:0]
       or entry_pc_3[14:0]
       or entry_pc_30[14:0]
       or entry_pc_19[14:0]
       or entry_pc_15[14:0])
begin
case(ibuf_retire_pointer0[31:0])
  32'h00000001 : pop_h0_pc[14:0] = entry_pc_0[14:0];
  32'h00000002 : pop_h0_pc[14:0] = entry_pc_1[14:0];
  32'h00000004 : pop_h0_pc[14:0] = entry_pc_2[14:0];
  32'h00000008 : pop_h0_pc[14:0] = entry_pc_3[14:0];
  32'h00000010 : pop_h0_pc[14:0] = entry_pc_4[14:0];
  32'h00000020 : pop_h0_pc[14:0] = entry_pc_5[14:0];
  32'h00000040 : pop_h0_pc[14:0] = entry_pc_6[14:0];
  32'h00000080 : pop_h0_pc[14:0] = entry_pc_7[14:0];
  32'h00000100 : pop_h0_pc[14:0] = entry_pc_8[14:0];
  32'h00000200 : pop_h0_pc[14:0] = entry_pc_9[14:0];
  32'h00000400 : pop_h0_pc[14:0] = entry_pc_10[14:0];
  32'h00000800 : pop_h0_pc[14:0] = entry_pc_11[14:0];
  32'h00001000 : pop_h0_pc[14:0] = entry_pc_12[14:0];
  32'h00002000 : pop_h0_pc[14:0] = entry_pc_13[14:0];
  32'h00004000 : pop_h0_pc[14:0] = entry_pc_14[14:0];
  32'h00008000 : pop_h0_pc[14:0] = entry_pc_15[14:0];
  32'h00010000 : pop_h0_pc[14:0] = entry_pc_16[14:0];
  32'h00020000 : pop_h0_pc[14:0] = entry_pc_17[14:0];
  32'h00040000 : pop_h0_pc[14:0] = entry_pc_18[14:0];
  32'h00080000 : pop_h0_pc[14:0] = entry_pc_19[14:0];
  32'h00100000 : pop_h0_pc[14:0] = entry_pc_20[14:0];
  32'h00200000 : pop_h0_pc[14:0] = entry_pc_21[14:0];
  32'h00400000 : pop_h0_pc[14:0] = entry_pc_22[14:0];
  32'h00800000 : pop_h0_pc[14:0] = entry_pc_23[14:0];
  32'h01000000 : pop_h0_pc[14:0] = entry_pc_24[14:0];
  32'h02000000 : pop_h0_pc[14:0] = entry_pc_25[14:0];
  32'h04000000 : pop_h0_pc[14:0] = entry_pc_26[14:0];
  32'h08000000 : pop_h0_pc[14:0] = entry_pc_27[14:0];
  32'h10000000 : pop_h0_pc[14:0] = entry_pc_28[14:0];
  32'h20000000 : pop_h0_pc[14:0] = entry_pc_29[14:0];
  32'h40000000 : pop_h0_pc[14:0] = entry_pc_30[14:0];
  32'h80000000 : pop_h0_pc[14:0] = entry_pc_31[14:0];
  default      : pop_h0_pc[14:0] = {15{1'bx}};
endcase
// &CombEnd; @2834
end

// &CombBeg; @2836
always @( entry_pc_10[14:0]
       or entry_pc_1[14:0]
       or entry_pc_27[14:0]
       or entry_pc_26[14:0]
       or entry_pc_11[14:0]
       or entry_pc_28[14:0]
       or entry_pc_13[14:0]
       or entry_pc_7[14:0]
       or entry_pc_5[14:0]
       or entry_pc_29[14:0]
       or entry_pc_20[14:0]
       or entry_pc_0[14:0]
       or entry_pc_18[14:0]
       or entry_pc_2[14:0]
       or entry_pc_31[14:0]
       or entry_pc_4[14:0]
       or entry_pc_12[14:0]
       or entry_pc_22[14:0]
       or entry_pc_21[14:0]
       or entry_pc_8[14:0]
       or entry_pc_17[14:0]
       or entry_pc_6[14:0]
       or entry_pc_23[14:0]
       or entry_pc_25[14:0]
       or ibuf_retire_pointer1[31:0]
       or entry_pc_16[14:0]
       or entry_pc_9[14:0]
       or entry_pc_24[14:0]
       or entry_pc_14[14:0]
       or entry_pc_3[14:0]
       or entry_pc_30[14:0]
       or entry_pc_19[14:0]
       or entry_pc_15[14:0])
begin
case(ibuf_retire_pointer1[31:0])
  32'h00000001 : pop_h1_pc[14:0] = entry_pc_0[14:0];
  32'h00000002 : pop_h1_pc[14:0] = entry_pc_1[14:0];
  32'h00000004 : pop_h1_pc[14:0] = entry_pc_2[14:0];
  32'h00000008 : pop_h1_pc[14:0] = entry_pc_3[14:0];
  32'h00000010 : pop_h1_pc[14:0] = entry_pc_4[14:0];
  32'h00000020 : pop_h1_pc[14:0] = entry_pc_5[14:0];
  32'h00000040 : pop_h1_pc[14:0] = entry_pc_6[14:0];
  32'h00000080 : pop_h1_pc[14:0] = entry_pc_7[14:0];
  32'h00000100 : pop_h1_pc[14:0] = entry_pc_8[14:0];
  32'h00000200 : pop_h1_pc[14:0] = entry_pc_9[14:0];
  32'h00000400 : pop_h1_pc[14:0] = entry_pc_10[14:0];
  32'h00000800 : pop_h1_pc[14:0] = entry_pc_11[14:0];
  32'h00001000 : pop_h1_pc[14:0] = entry_pc_12[14:0];
  32'h00002000 : pop_h1_pc[14:0] = entry_pc_13[14:0];
  32'h00004000 : pop_h1_pc[14:0] = entry_pc_14[14:0];
  32'h00008000 : pop_h1_pc[14:0] = entry_pc_15[14:0];
  32'h00010000 : pop_h1_pc[14:0] = entry_pc_16[14:0];
  32'h00020000 : pop_h1_pc[14:0] = entry_pc_17[14:0];
  32'h00040000 : pop_h1_pc[14:0] = entry_pc_18[14:0];
  32'h00080000 : pop_h1_pc[14:0] = entry_pc_19[14:0];
  32'h00100000 : pop_h1_pc[14:0] = entry_pc_20[14:0];
  32'h00200000 : pop_h1_pc[14:0] = entry_pc_21[14:0];
  32'h00400000 : pop_h1_pc[14:0] = entry_pc_22[14:0];
  32'h00800000 : pop_h1_pc[14:0] = entry_pc_23[14:0];
  32'h01000000 : pop_h1_pc[14:0] = entry_pc_24[14:0];
  32'h02000000 : pop_h1_pc[14:0] = entry_pc_25[14:0];
  32'h04000000 : pop_h1_pc[14:0] = entry_pc_26[14:0];
  32'h08000000 : pop_h1_pc[14:0] = entry_pc_27[14:0];
  32'h10000000 : pop_h1_pc[14:0] = entry_pc_28[14:0];
  32'h20000000 : pop_h1_pc[14:0] = entry_pc_29[14:0];
  32'h40000000 : pop_h1_pc[14:0] = entry_pc_30[14:0];
  32'h80000000 : pop_h1_pc[14:0] = entry_pc_31[14:0];
  default      : pop_h1_pc[14:0] = {15{1'bx}};
endcase
// &CombEnd; @2872
end

// &CombBeg; @2874
always @( entry_pc_10[14:0]
       or entry_pc_1[14:0]
       or entry_pc_27[14:0]
       or entry_pc_26[14:0]
       or entry_pc_11[14:0]
       or entry_pc_28[14:0]
       or entry_pc_13[14:0]
       or entry_pc_7[14:0]
       or entry_pc_5[14:0]
       or entry_pc_29[14:0]
       or entry_pc_20[14:0]
       or entry_pc_0[14:0]
       or entry_pc_18[14:0]
       or entry_pc_2[14:0]
       or entry_pc_31[14:0]
       or entry_pc_4[14:0]
       or entry_pc_12[14:0]
       or entry_pc_22[14:0]
       or entry_pc_21[14:0]
       or entry_pc_8[14:0]
       or entry_pc_17[14:0]
       or entry_pc_6[14:0]
       or entry_pc_23[14:0]
       or entry_pc_25[14:0]
       or entry_pc_16[14:0]
       or entry_pc_9[14:0]
       or entry_pc_24[14:0]
       or entry_pc_14[14:0]
       or entry_pc_3[14:0]
       or entry_pc_30[14:0]
       or ibuf_retire_pointer2[31:0]
       or entry_pc_19[14:0]
       or entry_pc_15[14:0])
begin
case(ibuf_retire_pointer2[31:0])
  32'h00000001 : pop_h2_pc[14:0] = entry_pc_0[14:0];
  32'h00000002 : pop_h2_pc[14:0] = entry_pc_1[14:0];
  32'h00000004 : pop_h2_pc[14:0] = entry_pc_2[14:0];
  32'h00000008 : pop_h2_pc[14:0] = entry_pc_3[14:0];
  32'h00000010 : pop_h2_pc[14:0] = entry_pc_4[14:0];
  32'h00000020 : pop_h2_pc[14:0] = entry_pc_5[14:0];
  32'h00000040 : pop_h2_pc[14:0] = entry_pc_6[14:0];
  32'h00000080 : pop_h2_pc[14:0] = entry_pc_7[14:0];
  32'h00000100 : pop_h2_pc[14:0] = entry_pc_8[14:0];
  32'h00000200 : pop_h2_pc[14:0] = entry_pc_9[14:0];
  32'h00000400 : pop_h2_pc[14:0] = entry_pc_10[14:0];
  32'h00000800 : pop_h2_pc[14:0] = entry_pc_11[14:0];
  32'h00001000 : pop_h2_pc[14:0] = entry_pc_12[14:0];
  32'h00002000 : pop_h2_pc[14:0] = entry_pc_13[14:0];
  32'h00004000 : pop_h2_pc[14:0] = entry_pc_14[14:0];
  32'h00008000 : pop_h2_pc[14:0] = entry_pc_15[14:0];
  32'h00010000 : pop_h2_pc[14:0] = entry_pc_16[14:0];
  32'h00020000 : pop_h2_pc[14:0] = entry_pc_17[14:0];
  32'h00040000 : pop_h2_pc[14:0] = entry_pc_18[14:0];
  32'h00080000 : pop_h2_pc[14:0] = entry_pc_19[14:0];
  32'h00100000 : pop_h2_pc[14:0] = entry_pc_20[14:0];
  32'h00200000 : pop_h2_pc[14:0] = entry_pc_21[14:0];
  32'h00400000 : pop_h2_pc[14:0] = entry_pc_22[14:0];
  32'h00800000 : pop_h2_pc[14:0] = entry_pc_23[14:0];
  32'h01000000 : pop_h2_pc[14:0] = entry_pc_24[14:0];
  32'h02000000 : pop_h2_pc[14:0] = entry_pc_25[14:0];
  32'h04000000 : pop_h2_pc[14:0] = entry_pc_26[14:0];
  32'h08000000 : pop_h2_pc[14:0] = entry_pc_27[14:0];
  32'h10000000 : pop_h2_pc[14:0] = entry_pc_28[14:0];
  32'h20000000 : pop_h2_pc[14:0] = entry_pc_29[14:0];
  32'h40000000 : pop_h2_pc[14:0] = entry_pc_30[14:0];
  32'h80000000 : pop_h2_pc[14:0] = entry_pc_31[14:0];
  default      : pop_h2_pc[14:0] = {15{1'bx}};
endcase
// &CombEnd; @2910
end

// &CombBeg; @2912
always @( entry_pc_10[14:0]
       or entry_pc_1[14:0]
       or entry_pc_27[14:0]
       or entry_pc_26[14:0]
       or entry_pc_11[14:0]
       or entry_pc_28[14:0]
       or entry_pc_13[14:0]
       or entry_pc_7[14:0]
       or entry_pc_5[14:0]
       or entry_pc_29[14:0]
       or entry_pc_20[14:0]
       or entry_pc_0[14:0]
       or entry_pc_18[14:0]
       or entry_pc_2[14:0]
       or entry_pc_31[14:0]
       or entry_pc_4[14:0]
       or entry_pc_12[14:0]
       or entry_pc_22[14:0]
       or entry_pc_21[14:0]
       or entry_pc_8[14:0]
       or entry_pc_17[14:0]
       or entry_pc_6[14:0]
       or entry_pc_23[14:0]
       or entry_pc_25[14:0]
       or entry_pc_16[14:0]
       or ibuf_retire_pointer3[31:0]
       or entry_pc_9[14:0]
       or entry_pc_24[14:0]
       or entry_pc_14[14:0]
       or entry_pc_3[14:0]
       or entry_pc_30[14:0]
       or entry_pc_19[14:0]
       or entry_pc_15[14:0])
begin
case(ibuf_retire_pointer3[31:0])
  32'h00000001 : pop_h3_pc[14:0] = entry_pc_0[14:0];
  32'h00000002 : pop_h3_pc[14:0] = entry_pc_1[14:0];
  32'h00000004 : pop_h3_pc[14:0] = entry_pc_2[14:0];
  32'h00000008 : pop_h3_pc[14:0] = entry_pc_3[14:0];
  32'h00000010 : pop_h3_pc[14:0] = entry_pc_4[14:0];
  32'h00000020 : pop_h3_pc[14:0] = entry_pc_5[14:0];
  32'h00000040 : pop_h3_pc[14:0] = entry_pc_6[14:0];
  32'h00000080 : pop_h3_pc[14:0] = entry_pc_7[14:0];
  32'h00000100 : pop_h3_pc[14:0] = entry_pc_8[14:0];
  32'h00000200 : pop_h3_pc[14:0] = entry_pc_9[14:0];
  32'h00000400 : pop_h3_pc[14:0] = entry_pc_10[14:0];
  32'h00000800 : pop_h3_pc[14:0] = entry_pc_11[14:0];
  32'h00001000 : pop_h3_pc[14:0] = entry_pc_12[14:0];
  32'h00002000 : pop_h3_pc[14:0] = entry_pc_13[14:0];
  32'h00004000 : pop_h3_pc[14:0] = entry_pc_14[14:0];
  32'h00008000 : pop_h3_pc[14:0] = entry_pc_15[14:0];
  32'h00010000 : pop_h3_pc[14:0] = entry_pc_16[14:0];
  32'h00020000 : pop_h3_pc[14:0] = entry_pc_17[14:0];
  32'h00040000 : pop_h3_pc[14:0] = entry_pc_18[14:0];
  32'h00080000 : pop_h3_pc[14:0] = entry_pc_19[14:0];
  32'h00100000 : pop_h3_pc[14:0] = entry_pc_20[14:0];
  32'h00200000 : pop_h3_pc[14:0] = entry_pc_21[14:0];
  32'h00400000 : pop_h3_pc[14:0] = entry_pc_22[14:0];
  32'h00800000 : pop_h3_pc[14:0] = entry_pc_23[14:0];
  32'h01000000 : pop_h3_pc[14:0] = entry_pc_24[14:0];
  32'h02000000 : pop_h3_pc[14:0] = entry_pc_25[14:0];
  32'h04000000 : pop_h3_pc[14:0] = entry_pc_26[14:0];
  32'h08000000 : pop_h3_pc[14:0] = entry_pc_27[14:0];
  32'h10000000 : pop_h3_pc[14:0] = entry_pc_28[14:0];
  32'h20000000 : pop_h3_pc[14:0] = entry_pc_29[14:0];
  32'h40000000 : pop_h3_pc[14:0] = entry_pc_30[14:0];
  32'h80000000 : pop_h3_pc[14:0] = entry_pc_31[14:0];
  default      : pop_h3_pc[14:0] = {15{1'bx}};
endcase
// &CombEnd; @2948
end

// &CombBeg; @2950
always @( entry_pc_10[14:0]
       or entry_pc_1[14:0]
       or entry_pc_27[14:0]
       or entry_pc_26[14:0]
       or entry_pc_11[14:0]
       or entry_pc_28[14:0]
       or entry_pc_13[14:0]
       or entry_pc_7[14:0]
       or entry_pc_5[14:0]
       or entry_pc_29[14:0]
       or entry_pc_20[14:0]
       or entry_pc_0[14:0]
       or entry_pc_18[14:0]
       or entry_pc_2[14:0]
       or entry_pc_31[14:0]
       or entry_pc_4[14:0]
       or ibuf_retire_pointer4[31:0]
       or entry_pc_12[14:0]
       or entry_pc_22[14:0]
       or entry_pc_21[14:0]
       or entry_pc_8[14:0]
       or entry_pc_17[14:0]
       or entry_pc_6[14:0]
       or entry_pc_23[14:0]
       or entry_pc_25[14:0]
       or entry_pc_16[14:0]
       or entry_pc_9[14:0]
       or entry_pc_24[14:0]
       or entry_pc_14[14:0]
       or entry_pc_3[14:0]
       or entry_pc_30[14:0]
       or entry_pc_19[14:0]
       or entry_pc_15[14:0])
begin
case(ibuf_retire_pointer4[31:0])
  32'h00000001 : pop_h4_pc[14:0] = entry_pc_0[14:0];
  32'h00000002 : pop_h4_pc[14:0] = entry_pc_1[14:0];
  32'h00000004 : pop_h4_pc[14:0] = entry_pc_2[14:0];
  32'h00000008 : pop_h4_pc[14:0] = entry_pc_3[14:0];
  32'h00000010 : pop_h4_pc[14:0] = entry_pc_4[14:0];
  32'h00000020 : pop_h4_pc[14:0] = entry_pc_5[14:0];
  32'h00000040 : pop_h4_pc[14:0] = entry_pc_6[14:0];
  32'h00000080 : pop_h4_pc[14:0] = entry_pc_7[14:0];
  32'h00000100 : pop_h4_pc[14:0] = entry_pc_8[14:0];
  32'h00000200 : pop_h4_pc[14:0] = entry_pc_9[14:0];
  32'h00000400 : pop_h4_pc[14:0] = entry_pc_10[14:0];
  32'h00000800 : pop_h4_pc[14:0] = entry_pc_11[14:0];
  32'h00001000 : pop_h4_pc[14:0] = entry_pc_12[14:0];
  32'h00002000 : pop_h4_pc[14:0] = entry_pc_13[14:0];
  32'h00004000 : pop_h4_pc[14:0] = entry_pc_14[14:0];
  32'h00008000 : pop_h4_pc[14:0] = entry_pc_15[14:0];
  32'h00010000 : pop_h4_pc[14:0] = entry_pc_16[14:0];
  32'h00020000 : pop_h4_pc[14:0] = entry_pc_17[14:0];
  32'h00040000 : pop_h4_pc[14:0] = entry_pc_18[14:0];
  32'h00080000 : pop_h4_pc[14:0] = entry_pc_19[14:0];
  32'h00100000 : pop_h4_pc[14:0] = entry_pc_20[14:0];
  32'h00200000 : pop_h4_pc[14:0] = entry_pc_21[14:0];
  32'h00400000 : pop_h4_pc[14:0] = entry_pc_22[14:0];
  32'h00800000 : pop_h4_pc[14:0] = entry_pc_23[14:0];
  32'h01000000 : pop_h4_pc[14:0] = entry_pc_24[14:0];
  32'h02000000 : pop_h4_pc[14:0] = entry_pc_25[14:0];
  32'h04000000 : pop_h4_pc[14:0] = entry_pc_26[14:0];
  32'h08000000 : pop_h4_pc[14:0] = entry_pc_27[14:0];
  32'h10000000 : pop_h4_pc[14:0] = entry_pc_28[14:0];
  32'h20000000 : pop_h4_pc[14:0] = entry_pc_29[14:0];
  32'h40000000 : pop_h4_pc[14:0] = entry_pc_30[14:0];
  32'h80000000 : pop_h4_pc[14:0] = entry_pc_31[14:0];
  default      : pop_h4_pc[14:0] = {15{1'bx}};
endcase
// &CombEnd; @2986
end

//pop_hn_vlmul[1:0]
// &CombBeg; @2989
always @( entry_vlmul_23[1:0]
       or entry_vlmul_17[1:0]
       or entry_vlmul_21[1:0]
       or entry_vlmul_13[1:0]
       or entry_vlmul_12[1:0]
       or entry_vlmul_28[1:0]
       or entry_vlmul_3[1:0]
       or entry_vlmul_2[1:0]
       or entry_vlmul_20[1:0]
       or entry_vlmul_24[1:0]
       or entry_vlmul_1[1:0]
       or entry_vlmul_10[1:0]
       or entry_vlmul_31[1:0]
       or entry_vlmul_8[1:0]
       or entry_vlmul_11[1:0]
       or entry_vlmul_18[1:0]
       or entry_vlmul_0[1:0]
       or entry_vlmul_7[1:0]
       or entry_vlmul_4[1:0]
       or entry_vlmul_6[1:0]
       or entry_vlmul_30[1:0]
       or entry_vlmul_16[1:0]
       or entry_vlmul_5[1:0]
       or ibuf_retire_pointer0[31:0]
       or entry_vlmul_25[1:0]
       or entry_vlmul_19[1:0]
       or entry_vlmul_26[1:0]
       or entry_vlmul_29[1:0]
       or entry_vlmul_14[1:0]
       or entry_vlmul_9[1:0]
       or entry_vlmul_15[1:0]
       or entry_vlmul_27[1:0]
       or entry_vlmul_22[1:0])
begin
case(ibuf_retire_pointer0[31:0])
  32'h00000001 : pop_h0_vlmul[1:0] = entry_vlmul_0[1:0];
  32'h00000002 : pop_h0_vlmul[1:0] = entry_vlmul_1[1:0];
  32'h00000004 : pop_h0_vlmul[1:0] = entry_vlmul_2[1:0];
  32'h00000008 : pop_h0_vlmul[1:0] = entry_vlmul_3[1:0];
  32'h00000010 : pop_h0_vlmul[1:0] = entry_vlmul_4[1:0];
  32'h00000020 : pop_h0_vlmul[1:0] = entry_vlmul_5[1:0];
  32'h00000040 : pop_h0_vlmul[1:0] = entry_vlmul_6[1:0];
  32'h00000080 : pop_h0_vlmul[1:0] = entry_vlmul_7[1:0];
  32'h00000100 : pop_h0_vlmul[1:0] = entry_vlmul_8[1:0];
  32'h00000200 : pop_h0_vlmul[1:0] = entry_vlmul_9[1:0];
  32'h00000400 : pop_h0_vlmul[1:0] = entry_vlmul_10[1:0];
  32'h00000800 : pop_h0_vlmul[1:0] = entry_vlmul_11[1:0];
  32'h00001000 : pop_h0_vlmul[1:0] = entry_vlmul_12[1:0];
  32'h00002000 : pop_h0_vlmul[1:0] = entry_vlmul_13[1:0];
  32'h00004000 : pop_h0_vlmul[1:0] = entry_vlmul_14[1:0];
  32'h00008000 : pop_h0_vlmul[1:0] = entry_vlmul_15[1:0];
  32'h00010000 : pop_h0_vlmul[1:0] = entry_vlmul_16[1:0];
  32'h00020000 : pop_h0_vlmul[1:0] = entry_vlmul_17[1:0];
  32'h00040000 : pop_h0_vlmul[1:0] = entry_vlmul_18[1:0];
  32'h00080000 : pop_h0_vlmul[1:0] = entry_vlmul_19[1:0];
  32'h00100000 : pop_h0_vlmul[1:0] = entry_vlmul_20[1:0];
  32'h00200000 : pop_h0_vlmul[1:0] = entry_vlmul_21[1:0];
  32'h00400000 : pop_h0_vlmul[1:0] = entry_vlmul_22[1:0];
  32'h00800000 : pop_h0_vlmul[1:0] = entry_vlmul_23[1:0];
  32'h01000000 : pop_h0_vlmul[1:0] = entry_vlmul_24[1:0];
  32'h02000000 : pop_h0_vlmul[1:0] = entry_vlmul_25[1:0];
  32'h04000000 : pop_h0_vlmul[1:0] = entry_vlmul_26[1:0];
  32'h08000000 : pop_h0_vlmul[1:0] = entry_vlmul_27[1:0];
  32'h10000000 : pop_h0_vlmul[1:0] = entry_vlmul_28[1:0];
  32'h20000000 : pop_h0_vlmul[1:0] = entry_vlmul_29[1:0];
  32'h40000000 : pop_h0_vlmul[1:0] = entry_vlmul_30[1:0];
  32'h80000000 : pop_h0_vlmul[1:0] = entry_vlmul_31[1:0];
  default      : pop_h0_vlmul[1:0] = {2{1'bx}};
endcase
// &CombEnd; @3025
end

// &CombBeg; @3027
always @( entry_vlmul_23[1:0]
       or entry_vlmul_17[1:0]
       or entry_vlmul_21[1:0]
       or entry_vlmul_13[1:0]
       or entry_vlmul_12[1:0]
       or entry_vlmul_28[1:0]
       or entry_vlmul_3[1:0]
       or entry_vlmul_2[1:0]
       or entry_vlmul_20[1:0]
       or entry_vlmul_24[1:0]
       or entry_vlmul_1[1:0]
       or entry_vlmul_10[1:0]
       or entry_vlmul_31[1:0]
       or entry_vlmul_8[1:0]
       or entry_vlmul_11[1:0]
       or entry_vlmul_18[1:0]
       or entry_vlmul_0[1:0]
       or entry_vlmul_7[1:0]
       or entry_vlmul_4[1:0]
       or entry_vlmul_6[1:0]
       or entry_vlmul_30[1:0]
       or entry_vlmul_16[1:0]
       or entry_vlmul_5[1:0]
       or entry_vlmul_25[1:0]
       or entry_vlmul_19[1:0]
       or entry_vlmul_26[1:0]
       or entry_vlmul_29[1:0]
       or ibuf_retire_pointer1[31:0]
       or entry_vlmul_14[1:0]
       or entry_vlmul_9[1:0]
       or entry_vlmul_15[1:0]
       or entry_vlmul_27[1:0]
       or entry_vlmul_22[1:0])
begin
case(ibuf_retire_pointer1[31:0])
  32'h00000001 : pop_h1_vlmul[1:0] = entry_vlmul_0[1:0];
  32'h00000002 : pop_h1_vlmul[1:0] = entry_vlmul_1[1:0];
  32'h00000004 : pop_h1_vlmul[1:0] = entry_vlmul_2[1:0];
  32'h00000008 : pop_h1_vlmul[1:0] = entry_vlmul_3[1:0];
  32'h00000010 : pop_h1_vlmul[1:0] = entry_vlmul_4[1:0];
  32'h00000020 : pop_h1_vlmul[1:0] = entry_vlmul_5[1:0];
  32'h00000040 : pop_h1_vlmul[1:0] = entry_vlmul_6[1:0];
  32'h00000080 : pop_h1_vlmul[1:0] = entry_vlmul_7[1:0];
  32'h00000100 : pop_h1_vlmul[1:0] = entry_vlmul_8[1:0];
  32'h00000200 : pop_h1_vlmul[1:0] = entry_vlmul_9[1:0];
  32'h00000400 : pop_h1_vlmul[1:0] = entry_vlmul_10[1:0];
  32'h00000800 : pop_h1_vlmul[1:0] = entry_vlmul_11[1:0];
  32'h00001000 : pop_h1_vlmul[1:0] = entry_vlmul_12[1:0];
  32'h00002000 : pop_h1_vlmul[1:0] = entry_vlmul_13[1:0];
  32'h00004000 : pop_h1_vlmul[1:0] = entry_vlmul_14[1:0];
  32'h00008000 : pop_h1_vlmul[1:0] = entry_vlmul_15[1:0];
  32'h00010000 : pop_h1_vlmul[1:0] = entry_vlmul_16[1:0];
  32'h00020000 : pop_h1_vlmul[1:0] = entry_vlmul_17[1:0];
  32'h00040000 : pop_h1_vlmul[1:0] = entry_vlmul_18[1:0];
  32'h00080000 : pop_h1_vlmul[1:0] = entry_vlmul_19[1:0];
  32'h00100000 : pop_h1_vlmul[1:0] = entry_vlmul_20[1:0];
  32'h00200000 : pop_h1_vlmul[1:0] = entry_vlmul_21[1:0];
  32'h00400000 : pop_h1_vlmul[1:0] = entry_vlmul_22[1:0];
  32'h00800000 : pop_h1_vlmul[1:0] = entry_vlmul_23[1:0];
  32'h01000000 : pop_h1_vlmul[1:0] = entry_vlmul_24[1:0];
  32'h02000000 : pop_h1_vlmul[1:0] = entry_vlmul_25[1:0];
  32'h04000000 : pop_h1_vlmul[1:0] = entry_vlmul_26[1:0];
  32'h08000000 : pop_h1_vlmul[1:0] = entry_vlmul_27[1:0];
  32'h10000000 : pop_h1_vlmul[1:0] = entry_vlmul_28[1:0];
  32'h20000000 : pop_h1_vlmul[1:0] = entry_vlmul_29[1:0];
  32'h40000000 : pop_h1_vlmul[1:0] = entry_vlmul_30[1:0];
  32'h80000000 : pop_h1_vlmul[1:0] = entry_vlmul_31[1:0];
  default      : pop_h1_vlmul[1:0] = {2{1'bx}};
endcase
// &CombEnd; @3063
end

// &CombBeg; @3065
always @( entry_vlmul_23[1:0]
       or entry_vlmul_17[1:0]
       or entry_vlmul_21[1:0]
       or entry_vlmul_13[1:0]
       or entry_vlmul_12[1:0]
       or entry_vlmul_28[1:0]
       or entry_vlmul_3[1:0]
       or entry_vlmul_2[1:0]
       or entry_vlmul_20[1:0]
       or entry_vlmul_24[1:0]
       or entry_vlmul_1[1:0]
       or entry_vlmul_10[1:0]
       or entry_vlmul_31[1:0]
       or entry_vlmul_8[1:0]
       or entry_vlmul_11[1:0]
       or entry_vlmul_18[1:0]
       or entry_vlmul_0[1:0]
       or entry_vlmul_7[1:0]
       or entry_vlmul_4[1:0]
       or entry_vlmul_6[1:0]
       or entry_vlmul_30[1:0]
       or entry_vlmul_16[1:0]
       or entry_vlmul_5[1:0]
       or entry_vlmul_25[1:0]
       or entry_vlmul_19[1:0]
       or entry_vlmul_26[1:0]
       or entry_vlmul_29[1:0]
       or entry_vlmul_14[1:0]
       or entry_vlmul_9[1:0]
       or entry_vlmul_15[1:0]
       or entry_vlmul_27[1:0]
       or ibuf_retire_pointer2[31:0]
       or entry_vlmul_22[1:0])
begin
case(ibuf_retire_pointer2[31:0])
  32'h00000001 : pop_h2_vlmul[1:0] = entry_vlmul_0[1:0];
  32'h00000002 : pop_h2_vlmul[1:0] = entry_vlmul_1[1:0];
  32'h00000004 : pop_h2_vlmul[1:0] = entry_vlmul_2[1:0];
  32'h00000008 : pop_h2_vlmul[1:0] = entry_vlmul_3[1:0];
  32'h00000010 : pop_h2_vlmul[1:0] = entry_vlmul_4[1:0];
  32'h00000020 : pop_h2_vlmul[1:0] = entry_vlmul_5[1:0];
  32'h00000040 : pop_h2_vlmul[1:0] = entry_vlmul_6[1:0];
  32'h00000080 : pop_h2_vlmul[1:0] = entry_vlmul_7[1:0];
  32'h00000100 : pop_h2_vlmul[1:0] = entry_vlmul_8[1:0];
  32'h00000200 : pop_h2_vlmul[1:0] = entry_vlmul_9[1:0];
  32'h00000400 : pop_h2_vlmul[1:0] = entry_vlmul_10[1:0];
  32'h00000800 : pop_h2_vlmul[1:0] = entry_vlmul_11[1:0];
  32'h00001000 : pop_h2_vlmul[1:0] = entry_vlmul_12[1:0];
  32'h00002000 : pop_h2_vlmul[1:0] = entry_vlmul_13[1:0];
  32'h00004000 : pop_h2_vlmul[1:0] = entry_vlmul_14[1:0];
  32'h00008000 : pop_h2_vlmul[1:0] = entry_vlmul_15[1:0];
  32'h00010000 : pop_h2_vlmul[1:0] = entry_vlmul_16[1:0];
  32'h00020000 : pop_h2_vlmul[1:0] = entry_vlmul_17[1:0];
  32'h00040000 : pop_h2_vlmul[1:0] = entry_vlmul_18[1:0];
  32'h00080000 : pop_h2_vlmul[1:0] = entry_vlmul_19[1:0];
  32'h00100000 : pop_h2_vlmul[1:0] = entry_vlmul_20[1:0];
  32'h00200000 : pop_h2_vlmul[1:0] = entry_vlmul_21[1:0];
  32'h00400000 : pop_h2_vlmul[1:0] = entry_vlmul_22[1:0];
  32'h00800000 : pop_h2_vlmul[1:0] = entry_vlmul_23[1:0];
  32'h01000000 : pop_h2_vlmul[1:0] = entry_vlmul_24[1:0];
  32'h02000000 : pop_h2_vlmul[1:0] = entry_vlmul_25[1:0];
  32'h04000000 : pop_h2_vlmul[1:0] = entry_vlmul_26[1:0];
  32'h08000000 : pop_h2_vlmul[1:0] = entry_vlmul_27[1:0];
  32'h10000000 : pop_h2_vlmul[1:0] = entry_vlmul_28[1:0];
  32'h20000000 : pop_h2_vlmul[1:0] = entry_vlmul_29[1:0];
  32'h40000000 : pop_h2_vlmul[1:0] = entry_vlmul_30[1:0];
  32'h80000000 : pop_h2_vlmul[1:0] = entry_vlmul_31[1:0];
  default      : pop_h2_vlmul[1:0] = {2{1'bx}};
endcase
// &CombEnd; @3101
end

// &CombBeg; @3103
always @( entry_vlmul_23[1:0]
       or entry_vlmul_17[1:0]
       or entry_vlmul_21[1:0]
       or entry_vlmul_13[1:0]
       or entry_vlmul_12[1:0]
       or entry_vlmul_28[1:0]
       or entry_vlmul_3[1:0]
       or entry_vlmul_2[1:0]
       or entry_vlmul_20[1:0]
       or entry_vlmul_24[1:0]
       or entry_vlmul_1[1:0]
       or entry_vlmul_10[1:0]
       or entry_vlmul_31[1:0]
       or entry_vlmul_8[1:0]
       or entry_vlmul_11[1:0]
       or entry_vlmul_18[1:0]
       or entry_vlmul_0[1:0]
       or entry_vlmul_7[1:0]
       or entry_vlmul_4[1:0]
       or entry_vlmul_6[1:0]
       or entry_vlmul_30[1:0]
       or entry_vlmul_16[1:0]
       or entry_vlmul_5[1:0]
       or entry_vlmul_25[1:0]
       or entry_vlmul_19[1:0]
       or entry_vlmul_26[1:0]
       or entry_vlmul_29[1:0]
       or entry_vlmul_14[1:0]
       or ibuf_retire_pointer3[31:0]
       or entry_vlmul_9[1:0]
       or entry_vlmul_15[1:0]
       or entry_vlmul_27[1:0]
       or entry_vlmul_22[1:0])
begin
case(ibuf_retire_pointer3[31:0])
  32'h00000001 : pop_h3_vlmul[1:0] = entry_vlmul_0[1:0];
  32'h00000002 : pop_h3_vlmul[1:0] = entry_vlmul_1[1:0];
  32'h00000004 : pop_h3_vlmul[1:0] = entry_vlmul_2[1:0];
  32'h00000008 : pop_h3_vlmul[1:0] = entry_vlmul_3[1:0];
  32'h00000010 : pop_h3_vlmul[1:0] = entry_vlmul_4[1:0];
  32'h00000020 : pop_h3_vlmul[1:0] = entry_vlmul_5[1:0];
  32'h00000040 : pop_h3_vlmul[1:0] = entry_vlmul_6[1:0];
  32'h00000080 : pop_h3_vlmul[1:0] = entry_vlmul_7[1:0];
  32'h00000100 : pop_h3_vlmul[1:0] = entry_vlmul_8[1:0];
  32'h00000200 : pop_h3_vlmul[1:0] = entry_vlmul_9[1:0];
  32'h00000400 : pop_h3_vlmul[1:0] = entry_vlmul_10[1:0];
  32'h00000800 : pop_h3_vlmul[1:0] = entry_vlmul_11[1:0];
  32'h00001000 : pop_h3_vlmul[1:0] = entry_vlmul_12[1:0];
  32'h00002000 : pop_h3_vlmul[1:0] = entry_vlmul_13[1:0];
  32'h00004000 : pop_h3_vlmul[1:0] = entry_vlmul_14[1:0];
  32'h00008000 : pop_h3_vlmul[1:0] = entry_vlmul_15[1:0];
  32'h00010000 : pop_h3_vlmul[1:0] = entry_vlmul_16[1:0];
  32'h00020000 : pop_h3_vlmul[1:0] = entry_vlmul_17[1:0];
  32'h00040000 : pop_h3_vlmul[1:0] = entry_vlmul_18[1:0];
  32'h00080000 : pop_h3_vlmul[1:0] = entry_vlmul_19[1:0];
  32'h00100000 : pop_h3_vlmul[1:0] = entry_vlmul_20[1:0];
  32'h00200000 : pop_h3_vlmul[1:0] = entry_vlmul_21[1:0];
  32'h00400000 : pop_h3_vlmul[1:0] = entry_vlmul_22[1:0];
  32'h00800000 : pop_h3_vlmul[1:0] = entry_vlmul_23[1:0];
  32'h01000000 : pop_h3_vlmul[1:0] = entry_vlmul_24[1:0];
  32'h02000000 : pop_h3_vlmul[1:0] = entry_vlmul_25[1:0];
  32'h04000000 : pop_h3_vlmul[1:0] = entry_vlmul_26[1:0];
  32'h08000000 : pop_h3_vlmul[1:0] = entry_vlmul_27[1:0];
  32'h10000000 : pop_h3_vlmul[1:0] = entry_vlmul_28[1:0];
  32'h20000000 : pop_h3_vlmul[1:0] = entry_vlmul_29[1:0];
  32'h40000000 : pop_h3_vlmul[1:0] = entry_vlmul_30[1:0];
  32'h80000000 : pop_h3_vlmul[1:0] = entry_vlmul_31[1:0];
  default      : pop_h3_vlmul[1:0] = {2{1'bx}};
endcase
// &CombEnd; @3139
end

// &CombBeg; @3141
always @( entry_vlmul_23[1:0]
       or entry_vlmul_17[1:0]
       or entry_vlmul_21[1:0]
       or entry_vlmul_13[1:0]
       or entry_vlmul_12[1:0]
       or entry_vlmul_28[1:0]
       or entry_vlmul_3[1:0]
       or entry_vlmul_2[1:0]
       or entry_vlmul_20[1:0]
       or entry_vlmul_24[1:0]
       or entry_vlmul_1[1:0]
       or entry_vlmul_10[1:0]
       or entry_vlmul_31[1:0]
       or ibuf_retire_pointer4[31:0]
       or entry_vlmul_8[1:0]
       or entry_vlmul_11[1:0]
       or entry_vlmul_18[1:0]
       or entry_vlmul_0[1:0]
       or entry_vlmul_7[1:0]
       or entry_vlmul_4[1:0]
       or entry_vlmul_6[1:0]
       or entry_vlmul_30[1:0]
       or entry_vlmul_16[1:0]
       or entry_vlmul_5[1:0]
       or entry_vlmul_25[1:0]
       or entry_vlmul_19[1:0]
       or entry_vlmul_26[1:0]
       or entry_vlmul_29[1:0]
       or entry_vlmul_14[1:0]
       or entry_vlmul_9[1:0]
       or entry_vlmul_15[1:0]
       or entry_vlmul_27[1:0]
       or entry_vlmul_22[1:0])
begin
case(ibuf_retire_pointer4[31:0])
  32'h00000001 : pop_h4_vlmul[1:0] = entry_vlmul_0[1:0];
  32'h00000002 : pop_h4_vlmul[1:0] = entry_vlmul_1[1:0];
  32'h00000004 : pop_h4_vlmul[1:0] = entry_vlmul_2[1:0];
  32'h00000008 : pop_h4_vlmul[1:0] = entry_vlmul_3[1:0];
  32'h00000010 : pop_h4_vlmul[1:0] = entry_vlmul_4[1:0];
  32'h00000020 : pop_h4_vlmul[1:0] = entry_vlmul_5[1:0];
  32'h00000040 : pop_h4_vlmul[1:0] = entry_vlmul_6[1:0];
  32'h00000080 : pop_h4_vlmul[1:0] = entry_vlmul_7[1:0];
  32'h00000100 : pop_h4_vlmul[1:0] = entry_vlmul_8[1:0];
  32'h00000200 : pop_h4_vlmul[1:0] = entry_vlmul_9[1:0];
  32'h00000400 : pop_h4_vlmul[1:0] = entry_vlmul_10[1:0];
  32'h00000800 : pop_h4_vlmul[1:0] = entry_vlmul_11[1:0];
  32'h00001000 : pop_h4_vlmul[1:0] = entry_vlmul_12[1:0];
  32'h00002000 : pop_h4_vlmul[1:0] = entry_vlmul_13[1:0];
  32'h00004000 : pop_h4_vlmul[1:0] = entry_vlmul_14[1:0];
  32'h00008000 : pop_h4_vlmul[1:0] = entry_vlmul_15[1:0];
  32'h00010000 : pop_h4_vlmul[1:0] = entry_vlmul_16[1:0];
  32'h00020000 : pop_h4_vlmul[1:0] = entry_vlmul_17[1:0];
  32'h00040000 : pop_h4_vlmul[1:0] = entry_vlmul_18[1:0];
  32'h00080000 : pop_h4_vlmul[1:0] = entry_vlmul_19[1:0];
  32'h00100000 : pop_h4_vlmul[1:0] = entry_vlmul_20[1:0];
  32'h00200000 : pop_h4_vlmul[1:0] = entry_vlmul_21[1:0];
  32'h00400000 : pop_h4_vlmul[1:0] = entry_vlmul_22[1:0];
  32'h00800000 : pop_h4_vlmul[1:0] = entry_vlmul_23[1:0];
  32'h01000000 : pop_h4_vlmul[1:0] = entry_vlmul_24[1:0];
  32'h02000000 : pop_h4_vlmul[1:0] = entry_vlmul_25[1:0];
  32'h04000000 : pop_h4_vlmul[1:0] = entry_vlmul_26[1:0];
  32'h08000000 : pop_h4_vlmul[1:0] = entry_vlmul_27[1:0];
  32'h10000000 : pop_h4_vlmul[1:0] = entry_vlmul_28[1:0];
  32'h20000000 : pop_h4_vlmul[1:0] = entry_vlmul_29[1:0];
  32'h40000000 : pop_h4_vlmul[1:0] = entry_vlmul_30[1:0];
  32'h80000000 : pop_h4_vlmul[1:0] = entry_vlmul_31[1:0];
  default      : pop_h4_vlmul[1:0] = {2{1'bx}};
endcase
// &CombEnd; @3177
end

//pop_hn_vsew[2:0]
// &CombBeg; @3180
always @( entry_vsew_27[2:0]
       or entry_vsew_24[2:0]
       or entry_vsew_9[2:0]
       or entry_vsew_0[2:0]
       or entry_vsew_14[2:0]
       or entry_vsew_28[2:0]
       or entry_vsew_11[2:0]
       or entry_vsew_6[2:0]
       or entry_vsew_25[2:0]
       or entry_vsew_31[2:0]
       or entry_vsew_18[2:0]
       or entry_vsew_13[2:0]
       or entry_vsew_2[2:0]
       or entry_vsew_22[2:0]
       or entry_vsew_16[2:0]
       or entry_vsew_19[2:0]
       or entry_vsew_12[2:0]
       or entry_vsew_17[2:0]
       or entry_vsew_26[2:0]
       or ibuf_retire_pointer0[31:0]
       or entry_vsew_3[2:0]
       or entry_vsew_5[2:0]
       or entry_vsew_4[2:0]
       or entry_vsew_23[2:0]
       or entry_vsew_29[2:0]
       or entry_vsew_20[2:0]
       or entry_vsew_7[2:0]
       or entry_vsew_8[2:0]
       or entry_vsew_15[2:0]
       or entry_vsew_10[2:0]
       or entry_vsew_30[2:0]
       or entry_vsew_1[2:0]
       or entry_vsew_21[2:0])
begin
case(ibuf_retire_pointer0[31:0])
  32'h00000001 : pop_h0_vsew[2:0] = entry_vsew_0[2:0];
  32'h00000002 : pop_h0_vsew[2:0] = entry_vsew_1[2:0];
  32'h00000004 : pop_h0_vsew[2:0] = entry_vsew_2[2:0];
  32'h00000008 : pop_h0_vsew[2:0] = entry_vsew_3[2:0];
  32'h00000010 : pop_h0_vsew[2:0] = entry_vsew_4[2:0];
  32'h00000020 : pop_h0_vsew[2:0] = entry_vsew_5[2:0];
  32'h00000040 : pop_h0_vsew[2:0] = entry_vsew_6[2:0];
  32'h00000080 : pop_h0_vsew[2:0] = entry_vsew_7[2:0];
  32'h00000100 : pop_h0_vsew[2:0] = entry_vsew_8[2:0];
  32'h00000200 : pop_h0_vsew[2:0] = entry_vsew_9[2:0];
  32'h00000400 : pop_h0_vsew[2:0] = entry_vsew_10[2:0];
  32'h00000800 : pop_h0_vsew[2:0] = entry_vsew_11[2:0];
  32'h00001000 : pop_h0_vsew[2:0] = entry_vsew_12[2:0];
  32'h00002000 : pop_h0_vsew[2:0] = entry_vsew_13[2:0];
  32'h00004000 : pop_h0_vsew[2:0] = entry_vsew_14[2:0];
  32'h00008000 : pop_h0_vsew[2:0] = entry_vsew_15[2:0];
  32'h00010000 : pop_h0_vsew[2:0] = entry_vsew_16[2:0];
  32'h00020000 : pop_h0_vsew[2:0] = entry_vsew_17[2:0];
  32'h00040000 : pop_h0_vsew[2:0] = entry_vsew_18[2:0];
  32'h00080000 : pop_h0_vsew[2:0] = entry_vsew_19[2:0];
  32'h00100000 : pop_h0_vsew[2:0] = entry_vsew_20[2:0];
  32'h00200000 : pop_h0_vsew[2:0] = entry_vsew_21[2:0];
  32'h00400000 : pop_h0_vsew[2:0] = entry_vsew_22[2:0];
  32'h00800000 : pop_h0_vsew[2:0] = entry_vsew_23[2:0];
  32'h01000000 : pop_h0_vsew[2:0] = entry_vsew_24[2:0];
  32'h02000000 : pop_h0_vsew[2:0] = entry_vsew_25[2:0];
  32'h04000000 : pop_h0_vsew[2:0] = entry_vsew_26[2:0];
  32'h08000000 : pop_h0_vsew[2:0] = entry_vsew_27[2:0];
  32'h10000000 : pop_h0_vsew[2:0] = entry_vsew_28[2:0];
  32'h20000000 : pop_h0_vsew[2:0] = entry_vsew_29[2:0];
  32'h40000000 : pop_h0_vsew[2:0] = entry_vsew_30[2:0];
  32'h80000000 : pop_h0_vsew[2:0] = entry_vsew_31[2:0];
  default      : pop_h0_vsew[2:0] = {3{1'bx}};
endcase
// &CombEnd; @3216
end

// &CombBeg; @3218
always @( entry_vsew_27[2:0]
       or entry_vsew_24[2:0]
       or entry_vsew_9[2:0]
       or entry_vsew_0[2:0]
       or entry_vsew_14[2:0]
       or entry_vsew_28[2:0]
       or entry_vsew_11[2:0]
       or entry_vsew_6[2:0]
       or entry_vsew_25[2:0]
       or entry_vsew_31[2:0]
       or entry_vsew_18[2:0]
       or entry_vsew_13[2:0]
       or entry_vsew_2[2:0]
       or entry_vsew_22[2:0]
       or entry_vsew_16[2:0]
       or entry_vsew_19[2:0]
       or entry_vsew_12[2:0]
       or entry_vsew_17[2:0]
       or entry_vsew_26[2:0]
       or entry_vsew_3[2:0]
       or entry_vsew_5[2:0]
       or entry_vsew_4[2:0]
       or entry_vsew_23[2:0]
       or ibuf_retire_pointer1[31:0]
       or entry_vsew_29[2:0]
       or entry_vsew_20[2:0]
       or entry_vsew_7[2:0]
       or entry_vsew_8[2:0]
       or entry_vsew_15[2:0]
       or entry_vsew_10[2:0]
       or entry_vsew_30[2:0]
       or entry_vsew_1[2:0]
       or entry_vsew_21[2:0])
begin
case(ibuf_retire_pointer1[31:0])
  32'h00000001 : pop_h1_vsew[2:0] = entry_vsew_0[2:0];
  32'h00000002 : pop_h1_vsew[2:0] = entry_vsew_1[2:0];
  32'h00000004 : pop_h1_vsew[2:0] = entry_vsew_2[2:0];
  32'h00000008 : pop_h1_vsew[2:0] = entry_vsew_3[2:0];
  32'h00000010 : pop_h1_vsew[2:0] = entry_vsew_4[2:0];
  32'h00000020 : pop_h1_vsew[2:0] = entry_vsew_5[2:0];
  32'h00000040 : pop_h1_vsew[2:0] = entry_vsew_6[2:0];
  32'h00000080 : pop_h1_vsew[2:0] = entry_vsew_7[2:0];
  32'h00000100 : pop_h1_vsew[2:0] = entry_vsew_8[2:0];
  32'h00000200 : pop_h1_vsew[2:0] = entry_vsew_9[2:0];
  32'h00000400 : pop_h1_vsew[2:0] = entry_vsew_10[2:0];
  32'h00000800 : pop_h1_vsew[2:0] = entry_vsew_11[2:0];
  32'h00001000 : pop_h1_vsew[2:0] = entry_vsew_12[2:0];
  32'h00002000 : pop_h1_vsew[2:0] = entry_vsew_13[2:0];
  32'h00004000 : pop_h1_vsew[2:0] = entry_vsew_14[2:0];
  32'h00008000 : pop_h1_vsew[2:0] = entry_vsew_15[2:0];
  32'h00010000 : pop_h1_vsew[2:0] = entry_vsew_16[2:0];
  32'h00020000 : pop_h1_vsew[2:0] = entry_vsew_17[2:0];
  32'h00040000 : pop_h1_vsew[2:0] = entry_vsew_18[2:0];
  32'h00080000 : pop_h1_vsew[2:0] = entry_vsew_19[2:0];
  32'h00100000 : pop_h1_vsew[2:0] = entry_vsew_20[2:0];
  32'h00200000 : pop_h1_vsew[2:0] = entry_vsew_21[2:0];
  32'h00400000 : pop_h1_vsew[2:0] = entry_vsew_22[2:0];
  32'h00800000 : pop_h1_vsew[2:0] = entry_vsew_23[2:0];
  32'h01000000 : pop_h1_vsew[2:0] = entry_vsew_24[2:0];
  32'h02000000 : pop_h1_vsew[2:0] = entry_vsew_25[2:0];
  32'h04000000 : pop_h1_vsew[2:0] = entry_vsew_26[2:0];
  32'h08000000 : pop_h1_vsew[2:0] = entry_vsew_27[2:0];
  32'h10000000 : pop_h1_vsew[2:0] = entry_vsew_28[2:0];
  32'h20000000 : pop_h1_vsew[2:0] = entry_vsew_29[2:0];
  32'h40000000 : pop_h1_vsew[2:0] = entry_vsew_30[2:0];
  32'h80000000 : pop_h1_vsew[2:0] = entry_vsew_31[2:0];
  default      : pop_h1_vsew[2:0] = {3{1'bx}};
endcase
// &CombEnd; @3254
end

// &CombBeg; @3256
always @( entry_vsew_27[2:0]
       or entry_vsew_24[2:0]
       or entry_vsew_9[2:0]
       or entry_vsew_0[2:0]
       or entry_vsew_14[2:0]
       or entry_vsew_28[2:0]
       or entry_vsew_11[2:0]
       or entry_vsew_6[2:0]
       or entry_vsew_25[2:0]
       or entry_vsew_31[2:0]
       or entry_vsew_18[2:0]
       or entry_vsew_13[2:0]
       or entry_vsew_2[2:0]
       or entry_vsew_22[2:0]
       or entry_vsew_16[2:0]
       or entry_vsew_19[2:0]
       or entry_vsew_12[2:0]
       or entry_vsew_17[2:0]
       or entry_vsew_26[2:0]
       or entry_vsew_3[2:0]
       or entry_vsew_5[2:0]
       or entry_vsew_4[2:0]
       or entry_vsew_23[2:0]
       or entry_vsew_29[2:0]
       or entry_vsew_20[2:0]
       or entry_vsew_7[2:0]
       or entry_vsew_8[2:0]
       or entry_vsew_15[2:0]
       or entry_vsew_10[2:0]
       or ibuf_retire_pointer2[31:0]
       or entry_vsew_30[2:0]
       or entry_vsew_1[2:0]
       or entry_vsew_21[2:0])
begin
case(ibuf_retire_pointer2[31:0])
  32'h00000001 : pop_h2_vsew[2:0] = entry_vsew_0[2:0];
  32'h00000002 : pop_h2_vsew[2:0] = entry_vsew_1[2:0];
  32'h00000004 : pop_h2_vsew[2:0] = entry_vsew_2[2:0];
  32'h00000008 : pop_h2_vsew[2:0] = entry_vsew_3[2:0];
  32'h00000010 : pop_h2_vsew[2:0] = entry_vsew_4[2:0];
  32'h00000020 : pop_h2_vsew[2:0] = entry_vsew_5[2:0];
  32'h00000040 : pop_h2_vsew[2:0] = entry_vsew_6[2:0];
  32'h00000080 : pop_h2_vsew[2:0] = entry_vsew_7[2:0];
  32'h00000100 : pop_h2_vsew[2:0] = entry_vsew_8[2:0];
  32'h00000200 : pop_h2_vsew[2:0] = entry_vsew_9[2:0];
  32'h00000400 : pop_h2_vsew[2:0] = entry_vsew_10[2:0];
  32'h00000800 : pop_h2_vsew[2:0] = entry_vsew_11[2:0];
  32'h00001000 : pop_h2_vsew[2:0] = entry_vsew_12[2:0];
  32'h00002000 : pop_h2_vsew[2:0] = entry_vsew_13[2:0];
  32'h00004000 : pop_h2_vsew[2:0] = entry_vsew_14[2:0];
  32'h00008000 : pop_h2_vsew[2:0] = entry_vsew_15[2:0];
  32'h00010000 : pop_h2_vsew[2:0] = entry_vsew_16[2:0];
  32'h00020000 : pop_h2_vsew[2:0] = entry_vsew_17[2:0];
  32'h00040000 : pop_h2_vsew[2:0] = entry_vsew_18[2:0];
  32'h00080000 : pop_h2_vsew[2:0] = entry_vsew_19[2:0];
  32'h00100000 : pop_h2_vsew[2:0] = entry_vsew_20[2:0];
  32'h00200000 : pop_h2_vsew[2:0] = entry_vsew_21[2:0];
  32'h00400000 : pop_h2_vsew[2:0] = entry_vsew_22[2:0];
  32'h00800000 : pop_h2_vsew[2:0] = entry_vsew_23[2:0];
  32'h01000000 : pop_h2_vsew[2:0] = entry_vsew_24[2:0];
  32'h02000000 : pop_h2_vsew[2:0] = entry_vsew_25[2:0];
  32'h04000000 : pop_h2_vsew[2:0] = entry_vsew_26[2:0];
  32'h08000000 : pop_h2_vsew[2:0] = entry_vsew_27[2:0];
  32'h10000000 : pop_h2_vsew[2:0] = entry_vsew_28[2:0];
  32'h20000000 : pop_h2_vsew[2:0] = entry_vsew_29[2:0];
  32'h40000000 : pop_h2_vsew[2:0] = entry_vsew_30[2:0];
  32'h80000000 : pop_h2_vsew[2:0] = entry_vsew_31[2:0];
  default      : pop_h2_vsew[2:0] = {3{1'bx}};
endcase
// &CombEnd; @3292
end

// &CombBeg; @3294
always @( entry_vsew_27[2:0]
       or entry_vsew_24[2:0]
       or entry_vsew_9[2:0]
       or entry_vsew_0[2:0]
       or entry_vsew_14[2:0]
       or entry_vsew_28[2:0]
       or entry_vsew_11[2:0]
       or entry_vsew_6[2:0]
       or entry_vsew_25[2:0]
       or entry_vsew_31[2:0]
       or entry_vsew_18[2:0]
       or entry_vsew_13[2:0]
       or entry_vsew_2[2:0]
       or entry_vsew_22[2:0]
       or entry_vsew_16[2:0]
       or entry_vsew_19[2:0]
       or entry_vsew_12[2:0]
       or entry_vsew_17[2:0]
       or entry_vsew_26[2:0]
       or entry_vsew_3[2:0]
       or entry_vsew_5[2:0]
       or entry_vsew_4[2:0]
       or entry_vsew_23[2:0]
       or entry_vsew_29[2:0]
       or entry_vsew_20[2:0]
       or entry_vsew_7[2:0]
       or ibuf_retire_pointer3[31:0]
       or entry_vsew_8[2:0]
       or entry_vsew_15[2:0]
       or entry_vsew_10[2:0]
       or entry_vsew_30[2:0]
       or entry_vsew_1[2:0]
       or entry_vsew_21[2:0])
begin
case(ibuf_retire_pointer3[31:0])
  32'h00000001 : pop_h3_vsew[2:0] = entry_vsew_0[2:0];
  32'h00000002 : pop_h3_vsew[2:0] = entry_vsew_1[2:0];
  32'h00000004 : pop_h3_vsew[2:0] = entry_vsew_2[2:0];
  32'h00000008 : pop_h3_vsew[2:0] = entry_vsew_3[2:0];
  32'h00000010 : pop_h3_vsew[2:0] = entry_vsew_4[2:0];
  32'h00000020 : pop_h3_vsew[2:0] = entry_vsew_5[2:0];
  32'h00000040 : pop_h3_vsew[2:0] = entry_vsew_6[2:0];
  32'h00000080 : pop_h3_vsew[2:0] = entry_vsew_7[2:0];
  32'h00000100 : pop_h3_vsew[2:0] = entry_vsew_8[2:0];
  32'h00000200 : pop_h3_vsew[2:0] = entry_vsew_9[2:0];
  32'h00000400 : pop_h3_vsew[2:0] = entry_vsew_10[2:0];
  32'h00000800 : pop_h3_vsew[2:0] = entry_vsew_11[2:0];
  32'h00001000 : pop_h3_vsew[2:0] = entry_vsew_12[2:0];
  32'h00002000 : pop_h3_vsew[2:0] = entry_vsew_13[2:0];
  32'h00004000 : pop_h3_vsew[2:0] = entry_vsew_14[2:0];
  32'h00008000 : pop_h3_vsew[2:0] = entry_vsew_15[2:0];
  32'h00010000 : pop_h3_vsew[2:0] = entry_vsew_16[2:0];
  32'h00020000 : pop_h3_vsew[2:0] = entry_vsew_17[2:0];
  32'h00040000 : pop_h3_vsew[2:0] = entry_vsew_18[2:0];
  32'h00080000 : pop_h3_vsew[2:0] = entry_vsew_19[2:0];
  32'h00100000 : pop_h3_vsew[2:0] = entry_vsew_20[2:0];
  32'h00200000 : pop_h3_vsew[2:0] = entry_vsew_21[2:0];
  32'h00400000 : pop_h3_vsew[2:0] = entry_vsew_22[2:0];
  32'h00800000 : pop_h3_vsew[2:0] = entry_vsew_23[2:0];
  32'h01000000 : pop_h3_vsew[2:0] = entry_vsew_24[2:0];
  32'h02000000 : pop_h3_vsew[2:0] = entry_vsew_25[2:0];
  32'h04000000 : pop_h3_vsew[2:0] = entry_vsew_26[2:0];
  32'h08000000 : pop_h3_vsew[2:0] = entry_vsew_27[2:0];
  32'h10000000 : pop_h3_vsew[2:0] = entry_vsew_28[2:0];
  32'h20000000 : pop_h3_vsew[2:0] = entry_vsew_29[2:0];
  32'h40000000 : pop_h3_vsew[2:0] = entry_vsew_30[2:0];
  32'h80000000 : pop_h3_vsew[2:0] = entry_vsew_31[2:0];
  default      : pop_h3_vsew[2:0] = {3{1'bx}};
endcase
// &CombEnd; @3330
end

// &CombBeg; @3332
always @( entry_vsew_27[2:0]
       or entry_vsew_24[2:0]
       or entry_vsew_9[2:0]
       or entry_vsew_0[2:0]
       or entry_vsew_14[2:0]
       or entry_vsew_28[2:0]
       or entry_vsew_11[2:0]
       or entry_vsew_6[2:0]
       or entry_vsew_25[2:0]
       or entry_vsew_31[2:0]
       or entry_vsew_18[2:0]
       or entry_vsew_13[2:0]
       or ibuf_retire_pointer4[31:0]
       or entry_vsew_2[2:0]
       or entry_vsew_22[2:0]
       or entry_vsew_16[2:0]
       or entry_vsew_19[2:0]
       or entry_vsew_12[2:0]
       or entry_vsew_17[2:0]
       or entry_vsew_26[2:0]
       or entry_vsew_3[2:0]
       or entry_vsew_5[2:0]
       or entry_vsew_4[2:0]
       or entry_vsew_23[2:0]
       or entry_vsew_29[2:0]
       or entry_vsew_20[2:0]
       or entry_vsew_7[2:0]
       or entry_vsew_8[2:0]
       or entry_vsew_15[2:0]
       or entry_vsew_10[2:0]
       or entry_vsew_30[2:0]
       or entry_vsew_1[2:0]
       or entry_vsew_21[2:0])
begin
case(ibuf_retire_pointer4[31:0])
  32'h00000001 : pop_h4_vsew[2:0] = entry_vsew_0[2:0];
  32'h00000002 : pop_h4_vsew[2:0] = entry_vsew_1[2:0];
  32'h00000004 : pop_h4_vsew[2:0] = entry_vsew_2[2:0];
  32'h00000008 : pop_h4_vsew[2:0] = entry_vsew_3[2:0];
  32'h00000010 : pop_h4_vsew[2:0] = entry_vsew_4[2:0];
  32'h00000020 : pop_h4_vsew[2:0] = entry_vsew_5[2:0];
  32'h00000040 : pop_h4_vsew[2:0] = entry_vsew_6[2:0];
  32'h00000080 : pop_h4_vsew[2:0] = entry_vsew_7[2:0];
  32'h00000100 : pop_h4_vsew[2:0] = entry_vsew_8[2:0];
  32'h00000200 : pop_h4_vsew[2:0] = entry_vsew_9[2:0];
  32'h00000400 : pop_h4_vsew[2:0] = entry_vsew_10[2:0];
  32'h00000800 : pop_h4_vsew[2:0] = entry_vsew_11[2:0];
  32'h00001000 : pop_h4_vsew[2:0] = entry_vsew_12[2:0];
  32'h00002000 : pop_h4_vsew[2:0] = entry_vsew_13[2:0];
  32'h00004000 : pop_h4_vsew[2:0] = entry_vsew_14[2:0];
  32'h00008000 : pop_h4_vsew[2:0] = entry_vsew_15[2:0];
  32'h00010000 : pop_h4_vsew[2:0] = entry_vsew_16[2:0];
  32'h00020000 : pop_h4_vsew[2:0] = entry_vsew_17[2:0];
  32'h00040000 : pop_h4_vsew[2:0] = entry_vsew_18[2:0];
  32'h00080000 : pop_h4_vsew[2:0] = entry_vsew_19[2:0];
  32'h00100000 : pop_h4_vsew[2:0] = entry_vsew_20[2:0];
  32'h00200000 : pop_h4_vsew[2:0] = entry_vsew_21[2:0];
  32'h00400000 : pop_h4_vsew[2:0] = entry_vsew_22[2:0];
  32'h00800000 : pop_h4_vsew[2:0] = entry_vsew_23[2:0];
  32'h01000000 : pop_h4_vsew[2:0] = entry_vsew_24[2:0];
  32'h02000000 : pop_h4_vsew[2:0] = entry_vsew_25[2:0];
  32'h04000000 : pop_h4_vsew[2:0] = entry_vsew_26[2:0];
  32'h08000000 : pop_h4_vsew[2:0] = entry_vsew_27[2:0];
  32'h10000000 : pop_h4_vsew[2:0] = entry_vsew_28[2:0];
  32'h20000000 : pop_h4_vsew[2:0] = entry_vsew_29[2:0];
  32'h40000000 : pop_h4_vsew[2:0] = entry_vsew_30[2:0];
  32'h80000000 : pop_h4_vsew[2:0] = entry_vsew_31[2:0];
  default      : pop_h4_vsew[2:0] = {3{1'bx}};
endcase
// &CombEnd; @3368
end


//pop_hn_vl[7:0]
// &CombBeg; @3372
always @( entry_vl_31[7:0]
       or entry_vl_18[7:0]
       or entry_vl_29[7:0]
       or entry_vl_8[7:0]
       or entry_vl_11[7:0]
       or entry_vl_28[7:0]
       or entry_vl_21[7:0]
       or entry_vl_5[7:0]
       or entry_vl_10[7:0]
       or entry_vl_6[7:0]
       or entry_vl_14[7:0]
       or entry_vl_3[7:0]
       or entry_vl_1[7:0]
       or entry_vl_15[7:0]
       or entry_vl_12[7:0]
       or entry_vl_24[7:0]
       or entry_vl_22[7:0]
       or entry_vl_4[7:0]
       or entry_vl_30[7:0]
       or entry_vl_23[7:0]
       or entry_vl_0[7:0]
       or ibuf_retire_pointer0[31:0]
       or entry_vl_17[7:0]
       or entry_vl_20[7:0]
       or entry_vl_26[7:0]
       or entry_vl_27[7:0]
       or entry_vl_13[7:0]
       or entry_vl_7[7:0]
       or entry_vl_9[7:0]
       or entry_vl_19[7:0]
       or entry_vl_25[7:0]
       or entry_vl_2[7:0]
       or entry_vl_16[7:0])
begin
case(ibuf_retire_pointer0[31:0])
  32'h00000001 : pop_h0_vl[7:0] = entry_vl_0[7:0];
  32'h00000002 : pop_h0_vl[7:0] = entry_vl_1[7:0];
  32'h00000004 : pop_h0_vl[7:0] = entry_vl_2[7:0];
  32'h00000008 : pop_h0_vl[7:0] = entry_vl_3[7:0];
  32'h00000010 : pop_h0_vl[7:0] = entry_vl_4[7:0];
  32'h00000020 : pop_h0_vl[7:0] = entry_vl_5[7:0];
  32'h00000040 : pop_h0_vl[7:0] = entry_vl_6[7:0];
  32'h00000080 : pop_h0_vl[7:0] = entry_vl_7[7:0];
  32'h00000100 : pop_h0_vl[7:0] = entry_vl_8[7:0];
  32'h00000200 : pop_h0_vl[7:0] = entry_vl_9[7:0];
  32'h00000400 : pop_h0_vl[7:0] = entry_vl_10[7:0];
  32'h00000800 : pop_h0_vl[7:0] = entry_vl_11[7:0];
  32'h00001000 : pop_h0_vl[7:0] = entry_vl_12[7:0];
  32'h00002000 : pop_h0_vl[7:0] = entry_vl_13[7:0];
  32'h00004000 : pop_h0_vl[7:0] = entry_vl_14[7:0];
  32'h00008000 : pop_h0_vl[7:0] = entry_vl_15[7:0];
  32'h00010000 : pop_h0_vl[7:0] = entry_vl_16[7:0];
  32'h00020000 : pop_h0_vl[7:0] = entry_vl_17[7:0];
  32'h00040000 : pop_h0_vl[7:0] = entry_vl_18[7:0];
  32'h00080000 : pop_h0_vl[7:0] = entry_vl_19[7:0];
  32'h00100000 : pop_h0_vl[7:0] = entry_vl_20[7:0];
  32'h00200000 : pop_h0_vl[7:0] = entry_vl_21[7:0];
  32'h00400000 : pop_h0_vl[7:0] = entry_vl_22[7:0];
  32'h00800000 : pop_h0_vl[7:0] = entry_vl_23[7:0];
  32'h01000000 : pop_h0_vl[7:0] = entry_vl_24[7:0];
  32'h02000000 : pop_h0_vl[7:0] = entry_vl_25[7:0];
  32'h04000000 : pop_h0_vl[7:0] = entry_vl_26[7:0];
  32'h08000000 : pop_h0_vl[7:0] = entry_vl_27[7:0];
  32'h10000000 : pop_h0_vl[7:0] = entry_vl_28[7:0];
  32'h20000000 : pop_h0_vl[7:0] = entry_vl_29[7:0];
  32'h40000000 : pop_h0_vl[7:0] = entry_vl_30[7:0];
  32'h80000000 : pop_h0_vl[7:0] = entry_vl_31[7:0];
  default      : pop_h0_vl[7:0] = {8{1'bx}};
endcase
// &CombEnd; @3408
end

// &CombBeg; @3410
always @( entry_vl_31[7:0]
       or entry_vl_18[7:0]
       or entry_vl_29[7:0]
       or entry_vl_8[7:0]
       or entry_vl_11[7:0]
       or entry_vl_28[7:0]
       or entry_vl_21[7:0]
       or entry_vl_5[7:0]
       or entry_vl_10[7:0]
       or entry_vl_6[7:0]
       or entry_vl_14[7:0]
       or entry_vl_3[7:0]
       or entry_vl_1[7:0]
       or entry_vl_15[7:0]
       or entry_vl_12[7:0]
       or entry_vl_24[7:0]
       or entry_vl_22[7:0]
       or entry_vl_4[7:0]
       or entry_vl_30[7:0]
       or entry_vl_23[7:0]
       or entry_vl_0[7:0]
       or entry_vl_17[7:0]
       or ibuf_retire_pointer1[31:0]
       or entry_vl_20[7:0]
       or entry_vl_26[7:0]
       or entry_vl_27[7:0]
       or entry_vl_13[7:0]
       or entry_vl_7[7:0]
       or entry_vl_9[7:0]
       or entry_vl_19[7:0]
       or entry_vl_25[7:0]
       or entry_vl_2[7:0]
       or entry_vl_16[7:0])
begin
case(ibuf_retire_pointer1[31:0])
  32'h00000001 : pop_h1_vl[7:0] = entry_vl_0[7:0];
  32'h00000002 : pop_h1_vl[7:0] = entry_vl_1[7:0];
  32'h00000004 : pop_h1_vl[7:0] = entry_vl_2[7:0];
  32'h00000008 : pop_h1_vl[7:0] = entry_vl_3[7:0];
  32'h00000010 : pop_h1_vl[7:0] = entry_vl_4[7:0];
  32'h00000020 : pop_h1_vl[7:0] = entry_vl_5[7:0];
  32'h00000040 : pop_h1_vl[7:0] = entry_vl_6[7:0];
  32'h00000080 : pop_h1_vl[7:0] = entry_vl_7[7:0];
  32'h00000100 : pop_h1_vl[7:0] = entry_vl_8[7:0];
  32'h00000200 : pop_h1_vl[7:0] = entry_vl_9[7:0];
  32'h00000400 : pop_h1_vl[7:0] = entry_vl_10[7:0];
  32'h00000800 : pop_h1_vl[7:0] = entry_vl_11[7:0];
  32'h00001000 : pop_h1_vl[7:0] = entry_vl_12[7:0];
  32'h00002000 : pop_h1_vl[7:0] = entry_vl_13[7:0];
  32'h00004000 : pop_h1_vl[7:0] = entry_vl_14[7:0];
  32'h00008000 : pop_h1_vl[7:0] = entry_vl_15[7:0];
  32'h00010000 : pop_h1_vl[7:0] = entry_vl_16[7:0];
  32'h00020000 : pop_h1_vl[7:0] = entry_vl_17[7:0];
  32'h00040000 : pop_h1_vl[7:0] = entry_vl_18[7:0];
  32'h00080000 : pop_h1_vl[7:0] = entry_vl_19[7:0];
  32'h00100000 : pop_h1_vl[7:0] = entry_vl_20[7:0];
  32'h00200000 : pop_h1_vl[7:0] = entry_vl_21[7:0];
  32'h00400000 : pop_h1_vl[7:0] = entry_vl_22[7:0];
  32'h00800000 : pop_h1_vl[7:0] = entry_vl_23[7:0];
  32'h01000000 : pop_h1_vl[7:0] = entry_vl_24[7:0];
  32'h02000000 : pop_h1_vl[7:0] = entry_vl_25[7:0];
  32'h04000000 : pop_h1_vl[7:0] = entry_vl_26[7:0];
  32'h08000000 : pop_h1_vl[7:0] = entry_vl_27[7:0];
  32'h10000000 : pop_h1_vl[7:0] = entry_vl_28[7:0];
  32'h20000000 : pop_h1_vl[7:0] = entry_vl_29[7:0];
  32'h40000000 : pop_h1_vl[7:0] = entry_vl_30[7:0];
  32'h80000000 : pop_h1_vl[7:0] = entry_vl_31[7:0];
  default      : pop_h1_vl[7:0] = {8{1'bx}};
endcase
// &CombEnd; @3446
end

// &CombBeg; @3448
always @( entry_vl_31[7:0]
       or entry_vl_18[7:0]
       or entry_vl_29[7:0]
       or entry_vl_8[7:0]
       or entry_vl_11[7:0]
       or entry_vl_28[7:0]
       or entry_vl_21[7:0]
       or entry_vl_5[7:0]
       or entry_vl_10[7:0]
       or entry_vl_6[7:0]
       or entry_vl_14[7:0]
       or entry_vl_3[7:0]
       or entry_vl_1[7:0]
       or entry_vl_15[7:0]
       or entry_vl_12[7:0]
       or entry_vl_24[7:0]
       or entry_vl_22[7:0]
       or entry_vl_4[7:0]
       or entry_vl_30[7:0]
       or entry_vl_23[7:0]
       or entry_vl_0[7:0]
       or entry_vl_17[7:0]
       or entry_vl_20[7:0]
       or entry_vl_26[7:0]
       or entry_vl_27[7:0]
       or entry_vl_13[7:0]
       or entry_vl_7[7:0]
       or ibuf_retire_pointer2[31:0]
       or entry_vl_9[7:0]
       or entry_vl_19[7:0]
       or entry_vl_25[7:0]
       or entry_vl_2[7:0]
       or entry_vl_16[7:0])
begin
case(ibuf_retire_pointer2[31:0])
  32'h00000001 : pop_h2_vl[7:0] = entry_vl_0[7:0];
  32'h00000002 : pop_h2_vl[7:0] = entry_vl_1[7:0];
  32'h00000004 : pop_h2_vl[7:0] = entry_vl_2[7:0];
  32'h00000008 : pop_h2_vl[7:0] = entry_vl_3[7:0];
  32'h00000010 : pop_h2_vl[7:0] = entry_vl_4[7:0];
  32'h00000020 : pop_h2_vl[7:0] = entry_vl_5[7:0];
  32'h00000040 : pop_h2_vl[7:0] = entry_vl_6[7:0];
  32'h00000080 : pop_h2_vl[7:0] = entry_vl_7[7:0];
  32'h00000100 : pop_h2_vl[7:0] = entry_vl_8[7:0];
  32'h00000200 : pop_h2_vl[7:0] = entry_vl_9[7:0];
  32'h00000400 : pop_h2_vl[7:0] = entry_vl_10[7:0];
  32'h00000800 : pop_h2_vl[7:0] = entry_vl_11[7:0];
  32'h00001000 : pop_h2_vl[7:0] = entry_vl_12[7:0];
  32'h00002000 : pop_h2_vl[7:0] = entry_vl_13[7:0];
  32'h00004000 : pop_h2_vl[7:0] = entry_vl_14[7:0];
  32'h00008000 : pop_h2_vl[7:0] = entry_vl_15[7:0];
  32'h00010000 : pop_h2_vl[7:0] = entry_vl_16[7:0];
  32'h00020000 : pop_h2_vl[7:0] = entry_vl_17[7:0];
  32'h00040000 : pop_h2_vl[7:0] = entry_vl_18[7:0];
  32'h00080000 : pop_h2_vl[7:0] = entry_vl_19[7:0];
  32'h00100000 : pop_h2_vl[7:0] = entry_vl_20[7:0];
  32'h00200000 : pop_h2_vl[7:0] = entry_vl_21[7:0];
  32'h00400000 : pop_h2_vl[7:0] = entry_vl_22[7:0];
  32'h00800000 : pop_h2_vl[7:0] = entry_vl_23[7:0];
  32'h01000000 : pop_h2_vl[7:0] = entry_vl_24[7:0];
  32'h02000000 : pop_h2_vl[7:0] = entry_vl_25[7:0];
  32'h04000000 : pop_h2_vl[7:0] = entry_vl_26[7:0];
  32'h08000000 : pop_h2_vl[7:0] = entry_vl_27[7:0];
  32'h10000000 : pop_h2_vl[7:0] = entry_vl_28[7:0];
  32'h20000000 : pop_h2_vl[7:0] = entry_vl_29[7:0];
  32'h40000000 : pop_h2_vl[7:0] = entry_vl_30[7:0];
  32'h80000000 : pop_h2_vl[7:0] = entry_vl_31[7:0];
  default      : pop_h2_vl[7:0] = {8{1'bx}};
endcase
// &CombEnd; @3484
end

// &CombBeg; @3486
always @( entry_vl_31[7:0]
       or entry_vl_18[7:0]
       or entry_vl_29[7:0]
       or entry_vl_8[7:0]
       or entry_vl_11[7:0]
       or entry_vl_28[7:0]
       or entry_vl_21[7:0]
       or entry_vl_5[7:0]
       or entry_vl_10[7:0]
       or entry_vl_6[7:0]
       or entry_vl_14[7:0]
       or entry_vl_3[7:0]
       or entry_vl_1[7:0]
       or entry_vl_15[7:0]
       or entry_vl_12[7:0]
       or entry_vl_24[7:0]
       or entry_vl_22[7:0]
       or entry_vl_4[7:0]
       or entry_vl_30[7:0]
       or entry_vl_23[7:0]
       or entry_vl_0[7:0]
       or entry_vl_17[7:0]
       or ibuf_retire_pointer3[31:0]
       or entry_vl_20[7:0]
       or entry_vl_26[7:0]
       or entry_vl_27[7:0]
       or entry_vl_13[7:0]
       or entry_vl_7[7:0]
       or entry_vl_9[7:0]
       or entry_vl_19[7:0]
       or entry_vl_25[7:0]
       or entry_vl_2[7:0]
       or entry_vl_16[7:0])
begin
case(ibuf_retire_pointer3[31:0])
  32'h00000001 : pop_h3_vl[7:0] = entry_vl_0[7:0];
  32'h00000002 : pop_h3_vl[7:0] = entry_vl_1[7:0];
  32'h00000004 : pop_h3_vl[7:0] = entry_vl_2[7:0];
  32'h00000008 : pop_h3_vl[7:0] = entry_vl_3[7:0];
  32'h00000010 : pop_h3_vl[7:0] = entry_vl_4[7:0];
  32'h00000020 : pop_h3_vl[7:0] = entry_vl_5[7:0];
  32'h00000040 : pop_h3_vl[7:0] = entry_vl_6[7:0];
  32'h00000080 : pop_h3_vl[7:0] = entry_vl_7[7:0];
  32'h00000100 : pop_h3_vl[7:0] = entry_vl_8[7:0];
  32'h00000200 : pop_h3_vl[7:0] = entry_vl_9[7:0];
  32'h00000400 : pop_h3_vl[7:0] = entry_vl_10[7:0];
  32'h00000800 : pop_h3_vl[7:0] = entry_vl_11[7:0];
  32'h00001000 : pop_h3_vl[7:0] = entry_vl_12[7:0];
  32'h00002000 : pop_h3_vl[7:0] = entry_vl_13[7:0];
  32'h00004000 : pop_h3_vl[7:0] = entry_vl_14[7:0];
  32'h00008000 : pop_h3_vl[7:0] = entry_vl_15[7:0];
  32'h00010000 : pop_h3_vl[7:0] = entry_vl_16[7:0];
  32'h00020000 : pop_h3_vl[7:0] = entry_vl_17[7:0];
  32'h00040000 : pop_h3_vl[7:0] = entry_vl_18[7:0];
  32'h00080000 : pop_h3_vl[7:0] = entry_vl_19[7:0];
  32'h00100000 : pop_h3_vl[7:0] = entry_vl_20[7:0];
  32'h00200000 : pop_h3_vl[7:0] = entry_vl_21[7:0];
  32'h00400000 : pop_h3_vl[7:0] = entry_vl_22[7:0];
  32'h00800000 : pop_h3_vl[7:0] = entry_vl_23[7:0];
  32'h01000000 : pop_h3_vl[7:0] = entry_vl_24[7:0];
  32'h02000000 : pop_h3_vl[7:0] = entry_vl_25[7:0];
  32'h04000000 : pop_h3_vl[7:0] = entry_vl_26[7:0];
  32'h08000000 : pop_h3_vl[7:0] = entry_vl_27[7:0];
  32'h10000000 : pop_h3_vl[7:0] = entry_vl_28[7:0];
  32'h20000000 : pop_h3_vl[7:0] = entry_vl_29[7:0];
  32'h40000000 : pop_h3_vl[7:0] = entry_vl_30[7:0];
  32'h80000000 : pop_h3_vl[7:0] = entry_vl_31[7:0];
  default      : pop_h3_vl[7:0] = {8{1'bx}};
endcase
// &CombEnd; @3522
end

// &CombBeg; @3524
always @( entry_vl_31[7:0]
       or entry_vl_18[7:0]
       or entry_vl_29[7:0]
       or entry_vl_8[7:0]
       or entry_vl_11[7:0]
       or entry_vl_28[7:0]
       or entry_vl_21[7:0]
       or entry_vl_5[7:0]
       or entry_vl_10[7:0]
       or entry_vl_6[7:0]
       or entry_vl_14[7:0]
       or entry_vl_3[7:0]
       or entry_vl_1[7:0]
       or entry_vl_15[7:0]
       or ibuf_retire_pointer4[31:0]
       or entry_vl_12[7:0]
       or entry_vl_24[7:0]
       or entry_vl_22[7:0]
       or entry_vl_4[7:0]
       or entry_vl_30[7:0]
       or entry_vl_23[7:0]
       or entry_vl_0[7:0]
       or entry_vl_17[7:0]
       or entry_vl_20[7:0]
       or entry_vl_26[7:0]
       or entry_vl_27[7:0]
       or entry_vl_13[7:0]
       or entry_vl_7[7:0]
       or entry_vl_9[7:0]
       or entry_vl_19[7:0]
       or entry_vl_25[7:0]
       or entry_vl_2[7:0]
       or entry_vl_16[7:0])
begin
case(ibuf_retire_pointer4[31:0])
  32'h00000001 : pop_h4_vl[7:0] = entry_vl_0[7:0];
  32'h00000002 : pop_h4_vl[7:0] = entry_vl_1[7:0];
  32'h00000004 : pop_h4_vl[7:0] = entry_vl_2[7:0];
  32'h00000008 : pop_h4_vl[7:0] = entry_vl_3[7:0];
  32'h00000010 : pop_h4_vl[7:0] = entry_vl_4[7:0];
  32'h00000020 : pop_h4_vl[7:0] = entry_vl_5[7:0];
  32'h00000040 : pop_h4_vl[7:0] = entry_vl_6[7:0];
  32'h00000080 : pop_h4_vl[7:0] = entry_vl_7[7:0];
  32'h00000100 : pop_h4_vl[7:0] = entry_vl_8[7:0];
  32'h00000200 : pop_h4_vl[7:0] = entry_vl_9[7:0];
  32'h00000400 : pop_h4_vl[7:0] = entry_vl_10[7:0];
  32'h00000800 : pop_h4_vl[7:0] = entry_vl_11[7:0];
  32'h00001000 : pop_h4_vl[7:0] = entry_vl_12[7:0];
  32'h00002000 : pop_h4_vl[7:0] = entry_vl_13[7:0];
  32'h00004000 : pop_h4_vl[7:0] = entry_vl_14[7:0];
  32'h00008000 : pop_h4_vl[7:0] = entry_vl_15[7:0];
  32'h00010000 : pop_h4_vl[7:0] = entry_vl_16[7:0];
  32'h00020000 : pop_h4_vl[7:0] = entry_vl_17[7:0];
  32'h00040000 : pop_h4_vl[7:0] = entry_vl_18[7:0];
  32'h00080000 : pop_h4_vl[7:0] = entry_vl_19[7:0];
  32'h00100000 : pop_h4_vl[7:0] = entry_vl_20[7:0];
  32'h00200000 : pop_h4_vl[7:0] = entry_vl_21[7:0];
  32'h00400000 : pop_h4_vl[7:0] = entry_vl_22[7:0];
  32'h00800000 : pop_h4_vl[7:0] = entry_vl_23[7:0];
  32'h01000000 : pop_h4_vl[7:0] = entry_vl_24[7:0];
  32'h02000000 : pop_h4_vl[7:0] = entry_vl_25[7:0];
  32'h04000000 : pop_h4_vl[7:0] = entry_vl_26[7:0];
  32'h08000000 : pop_h4_vl[7:0] = entry_vl_27[7:0];
  32'h10000000 : pop_h4_vl[7:0] = entry_vl_28[7:0];
  32'h20000000 : pop_h4_vl[7:0] = entry_vl_29[7:0];
  32'h40000000 : pop_h4_vl[7:0] = entry_vl_30[7:0];
  32'h80000000 : pop_h4_vl[7:0] = entry_vl_31[7:0];
  default      : pop_h4_vl[7:0] = {8{1'bx}};
endcase
// &CombEnd; @3560
end



//==========================================================
//             Create Input Data Generate 
//==========================================================
//-------------------Hn_create_vld--------------------------
//ib_hn_create_vld
assign ib_hn_create_vld[8:0] = (ibdp_ibuf_h0_vld) 
                             ? ({ibdp_ibuf_h0_vld, ibdp_ibuf_hn_vld[7:0]}) 
                             : ({ibdp_ibuf_hn_vld[7:0], 1'b0});
//--------------------Hn_acc_err----------------------------
//ib_hn_acc_err
assign ib_hn_acc_err[8:0]  = (ibdp_ibuf_h0_vld) 
                           ? ({ibdp_ibuf_hn_acc_err[7], ibdp_ibuf_hn_acc_err[7:0]} |
                              {ibdp_ibuf_hn_mmu_acc_deny[7], ibdp_ibuf_hn_mmu_acc_deny[7:0]})
                           : ({ibdp_ibuf_hn_acc_err[7:0],1'b0} |
                              {ibdp_ibuf_hn_mmu_acc_deny[7:0],1'b0});

//--------------------Hn_pgflt------------------------------
//ib_hn_pgflt
assign ib_hn_pgflt[8:0] = (ibdp_ibuf_h0_vld) 
                        ? {ibdp_ibuf_hn_pgflt[7],ibdp_ibuf_hn_pgflt[7:0]}
                        : {ibdp_ibuf_hn_pgflt[7:0],1'b0};

//--------------------Hn_high_expt---------------------------
//ib_hn_high_expt
assign ib_hn_high_expt[8:0] = (ibdp_ibuf_h0_vld) 
                           ? {ibdp_ibuf_h0_high_expt, ibdp_ibuf_hn_high_expt[7:0]} 
                           : {ibdp_ibuf_hn_high_expt[7:0],1'b0};
//--------------------Hn_split1---------------------------
//ib_hn_split1
assign ib_hn_split1[8:0] = (ibdp_ibuf_h0_vld) 
                         ? {ibdp_ibuf_h0_split1, ibdp_ibuf_hn_split1[7:0]} 
                         : {ibdp_ibuf_hn_split1[7:0],1'b0};
//--------------------Hn_split0---------------------------
//ib_hn_split0
assign ib_hn_split0[8:0] = (ibdp_ibuf_h0_vld) 
                         ? {ibdp_ibuf_h0_split0, ibdp_ibuf_hn_split0[7:0]} 
                         : {ibdp_ibuf_hn_split0[7:0],1'b0};
//--------------------Hn_fence----------------------------
//ib_hn_fence
assign ib_hn_fence[8:0]  = (ibdp_ibuf_h0_vld) 
                         ? {ibdp_ibuf_h0_fence, ibdp_ibuf_hn_fence[7:0]} 
                         : {ibdp_ibuf_hn_fence[7:0],1'b0};
//--------------------Hn_bkpta----------------------------
//ib_hn_bkpta
assign ib_hn_bkpta[8:0]  = (ibdp_ibuf_h0_vld) 
                         ? {ibdp_ibuf_h0_bkpta, ibdp_ibuf_hn_bkpta[7:0]} 
                         : {ibdp_ibuf_hn_bkpta[7:0],1'b0};
//--------------------Hn_bkptb----------------------------
//ib_hn_bkptb
assign ib_hn_bkptb[8:0]  = (ibdp_ibuf_h0_vld) 
                         ? {ibdp_ibuf_h0_bkptb, ibdp_ibuf_hn_bkptb[7:0]} 
                         : {ibdp_ibuf_hn_bkptb[7:0],1'b0};
//--------------------Hn_no spec---------------------------
//ib_hn_no_spec
assign ib_hn_no_spec[8:0] = (ibdp_ibuf_h0_vld) 
                          ? {ibdp_ibuf_h0_no_spec, ibdp_ibuf_hn_no_spec[7:0]} 
                          : {ibdp_ibuf_hn_no_spec[7:0],1'b0};

//--------------------Hn vl modify---------------------------
//ib_hn_vl_pred
assign ib_hn_vl_pred[8:0] = (ibdp_ibuf_h0_vld) 
                          ? {ibdp_ibuf_h0_vl_pred, ibdp_ibuf_hn_vl_pred[7:0]} 
                          : {ibdp_ibuf_hn_vl_pred[7:0],1'b0};

//----------------------Hn_ldst ---------------------------
//ib_hn_ldst
assign ib_hn_ldst[8:0]    = (ibdp_ibuf_h0_vld) 
                          ? {ibdp_ibuf_h0_ldst, ibdp_ibuf_hn_ldst[7:0]} 
                          : {ibdp_ibuf_hn_ldst[7:0],1'b0};

//--------------------Hn_32_start---------------------------
//ib_hn_inst_32
assign ib_hn_32_start[8:0] = (ibdp_ibuf_h0_vld) 
                           ? {ibdp_ibuf_h0_32_start, ibdp_ibuf_hn_32_start[7:0]} 
                           : {ibdp_ibuf_hn_32_start[7:0],1'b0};
//--------------------Hn_inst_data--------------------------
//ib_hn_data[15:0]
assign ib_h0_data[15:0] = (ibdp_ibuf_h0_vld) 
                        ? ibdp_ibuf_h0_data[15:0] 
                        : ibdp_ibuf_h1_data[15:0];
assign ib_h1_data[15:0] = (ibdp_ibuf_h0_vld) 
                        ? ibdp_ibuf_h1_data[15:0] 
                        : ibdp_ibuf_h2_data[15:0];
assign ib_h2_data[15:0] = (ibdp_ibuf_h0_vld) 
                        ? ibdp_ibuf_h2_data[15:0] 
                        : ibdp_ibuf_h3_data[15:0];
assign ib_h3_data[15:0] = (ibdp_ibuf_h0_vld) 
                        ? ibdp_ibuf_h3_data[15:0] 
                        : ibdp_ibuf_h4_data[15:0];
assign ib_h4_data[15:0] = (ibdp_ibuf_h0_vld) 
                        ? ibdp_ibuf_h4_data[15:0] 
                        : ibdp_ibuf_h5_data[15:0];
assign ib_h5_data[15:0] = (ibdp_ibuf_h0_vld) 
                        ? ibdp_ibuf_h5_data[15:0] 
                        : ibdp_ibuf_h6_data[15:0];
assign ib_h6_data[15:0] = (ibdp_ibuf_h0_vld) 
                        ? ibdp_ibuf_h6_data[15:0] 
                        : ibdp_ibuf_h7_data[15:0];
assign ib_h7_data[15:0] = (ibdp_ibuf_h0_vld) 
                        ? ibdp_ibuf_h7_data[15:0] 
                        : ibdp_ibuf_h8_data[15:0];
assign ib_h8_data[15:0] = (ibdp_ibuf_h0_vld) 
                        ? ibdp_ibuf_h8_data[15:0] 
                        : 16'b0;
//assign ib_h5_data_bypass[15:0] = 16'b0;
//assign ib_h6_data_bypass[15:0] = 16'b0;
//assign ib_h7_data_bypass[15:0] = 16'b0;
//assign ib_h8_data_bypass[15:0] = 16'b0;

//--------------------Hn_pc--------------------------
//ib_hn_pc[14:0]
assign ib_h0_pc[14:0] = (ibdp_ibuf_h0_vld) 
                        ? ibdp_ibuf_h0_pc[14:0] 
                        : ibdp_ibuf_h1_pc[14:0];
assign ib_h1_pc[14:0] = (ibdp_ibuf_h0_vld) 
                        ? ibdp_ibuf_h1_pc[14:0] 
                        : ibdp_ibuf_h2_pc[14:0];
assign ib_h2_pc[14:0] = (ibdp_ibuf_h0_vld) 
                        ? ibdp_ibuf_h2_pc[14:0] 
                        : ibdp_ibuf_h3_pc[14:0];
assign ib_h3_pc[14:0] = (ibdp_ibuf_h0_vld) 
                        ? ibdp_ibuf_h3_pc[14:0] 
                        : ibdp_ibuf_h4_pc[14:0];
assign ib_h4_pc[14:0] = (ibdp_ibuf_h0_vld) 
                        ? ibdp_ibuf_h4_pc[14:0] 
                        : ibdp_ibuf_h5_pc[14:0];
assign ib_h5_pc[14:0] = (ibdp_ibuf_h0_vld) 
                        ? ibdp_ibuf_h5_pc[14:0] 
                        : ibdp_ibuf_h6_pc[14:0];
assign ib_h6_pc[14:0] = (ibdp_ibuf_h0_vld) 
                        ? ibdp_ibuf_h6_pc[14:0] 
                        : ibdp_ibuf_h7_pc[14:0];
assign ib_h7_pc[14:0] = (ibdp_ibuf_h0_vld) 
                        ? ibdp_ibuf_h7_pc[14:0] 
                        : ibdp_ibuf_h8_pc[14:0];
assign ib_h8_pc[14:0] = (ibdp_ibuf_h0_vld) 
                        ? ibdp_ibuf_h8_pc[14:0] 
                        : 15'b0;
//assign ib_h5_pc_bypass[14:0] = 15'b0;
//assign ib_h6_pc_bypass[14:0] = 15'b0;
//assign ib_h7_pc_bypass[14:0] = 15'b0;
//assign ib_h8_pc_bypass[14:0] = 15'b0;


//--------------------Hn_inst_vlmul--------------------------
assign ib_h0_vlmul[1:0] = (ibdp_ibuf_h0_vld) 
                        ? ibdp_ibuf_h0_vlmul[1:0] 
                        : ibdp_ibuf_h1_vlmul[1:0];
assign ib_h1_vlmul[1:0] = (ibdp_ibuf_h0_vld) 
                        ? ibdp_ibuf_h1_vlmul[1:0] 
                        : ibdp_ibuf_h2_vlmul[1:0];
assign ib_h2_vlmul[1:0] = (ibdp_ibuf_h0_vld) 
                        ? ibdp_ibuf_h2_vlmul[1:0] 
                        : ibdp_ibuf_h3_vlmul[1:0];
assign ib_h3_vlmul[1:0] = (ibdp_ibuf_h0_vld) 
                        ? ibdp_ibuf_h3_vlmul[1:0] 
                        : ibdp_ibuf_h4_vlmul[1:0];
assign ib_h4_vlmul[1:0] = (ibdp_ibuf_h0_vld) 
                        ? ibdp_ibuf_h4_vlmul[1:0] 
                        : ibdp_ibuf_h5_vlmul[1:0];
assign ib_h5_vlmul[1:0] = (ibdp_ibuf_h0_vld) 
                        ? ibdp_ibuf_h5_vlmul[1:0] 
                        : ibdp_ibuf_h6_vlmul[1:0];
assign ib_h6_vlmul[1:0] = (ibdp_ibuf_h0_vld) 
                        ? ibdp_ibuf_h6_vlmul[1:0] 
                        : ibdp_ibuf_h7_vlmul[1:0];
assign ib_h7_vlmul[1:0] = (ibdp_ibuf_h0_vld) 
                        ? ibdp_ibuf_h7_vlmul[1:0] 
                        : ibdp_ibuf_h8_vlmul[1:0];
assign ib_h8_vlmul[1:0] = (ibdp_ibuf_h0_vld) 
                        ? ibdp_ibuf_h8_vlmul[1:0] 
                        : 2'b0;
//assign ib_h5_vlmul_bypass[1:0] = 2'b0;
//assign ib_h6_vlmul_bypass[1:0] = 2'b0;
//assign ib_h7_vlmul_bypass[1:0] = 2'b0;
//assign ib_h8_vlmul_bypass[1:0] = 2'b0;

//--------------------Hn_inst_vsew--------------------------
assign ib_h0_vsew[2:0] = (ibdp_ibuf_h0_vld) 
                        ? ibdp_ibuf_h0_vsew[2:0] 
                        : ibdp_ibuf_h1_vsew[2:0];
assign ib_h1_vsew[2:0] = (ibdp_ibuf_h0_vld) 
                        ? ibdp_ibuf_h1_vsew[2:0] 
                        : ibdp_ibuf_h2_vsew[2:0];
assign ib_h2_vsew[2:0] = (ibdp_ibuf_h0_vld) 
                        ? ibdp_ibuf_h2_vsew[2:0] 
                        : ibdp_ibuf_h3_vsew[2:0];
assign ib_h3_vsew[2:0] = (ibdp_ibuf_h0_vld) 
                        ? ibdp_ibuf_h3_vsew[2:0] 
                        : ibdp_ibuf_h4_vsew[2:0];
assign ib_h4_vsew[2:0] = (ibdp_ibuf_h0_vld) 
                        ? ibdp_ibuf_h4_vsew[2:0] 
                        : ibdp_ibuf_h5_vsew[2:0];
assign ib_h5_vsew[2:0] = (ibdp_ibuf_h0_vld) 
                        ? ibdp_ibuf_h5_vsew[2:0] 
                        : ibdp_ibuf_h6_vsew[2:0];
assign ib_h6_vsew[2:0] = (ibdp_ibuf_h0_vld) 
                        ? ibdp_ibuf_h6_vsew[2:0] 
                        : ibdp_ibuf_h7_vsew[2:0];
assign ib_h7_vsew[2:0] = (ibdp_ibuf_h0_vld) 
                        ? ibdp_ibuf_h7_vsew[2:0] 
                        : ibdp_ibuf_h8_vsew[2:0];
assign ib_h8_vsew[2:0] = (ibdp_ibuf_h0_vld) 
                        ? ibdp_ibuf_h8_vsew[2:0] 
                        : 3'b0;
//assign ib_h5_vsew_bypass[2:0] = 3'b0;
//assign ib_h6_vsew_bypass[2:0] = 3'b0;
//assign ib_h7_vsew_bypass[2:0] = 3'b0;
//assign ib_h8_vsew_bypass[2:0] = 3'b0;
//--------------------Hn_inst_vl--------------------------
assign ib_h0_vl[7:0] = (ibdp_ibuf_h0_vld) 
                        ? ibdp_ibuf_h0_vl[7:0] 
                        : ibdp_ibuf_h1_vl[7:0];
assign ib_h1_vl[7:0] = (ibdp_ibuf_h0_vld) 
                        ? ibdp_ibuf_h1_vl[7:0] 
                        : ibdp_ibuf_h2_vl[7:0];
assign ib_h2_vl[7:0] = (ibdp_ibuf_h0_vld) 
                        ? ibdp_ibuf_h2_vl[7:0] 
                        : ibdp_ibuf_h3_vl[7:0];
assign ib_h3_vl[7:0] = (ibdp_ibuf_h0_vld) 
                        ? ibdp_ibuf_h3_vl[7:0] 
                        : ibdp_ibuf_h4_vl[7:0];
assign ib_h4_vl[7:0] = (ibdp_ibuf_h0_vld) 
                        ? ibdp_ibuf_h4_vl[7:0] 
                        : ibdp_ibuf_h5_vl[7:0];
assign ib_h5_vl[7:0] = (ibdp_ibuf_h0_vld) 
                        ? ibdp_ibuf_h5_vl[7:0] 
                        : ibdp_ibuf_h6_vl[7:0];
assign ib_h6_vl[7:0] = (ibdp_ibuf_h0_vld) 
                        ? ibdp_ibuf_h6_vl[7:0] 
                        : ibdp_ibuf_h7_vl[7:0];
assign ib_h7_vl[7:0] = (ibdp_ibuf_h0_vld) 
                        ? ibdp_ibuf_h7_vl[7:0] 
                        : ibdp_ibuf_h8_vl[7:0];
assign ib_h8_vl[7:0] = (ibdp_ibuf_h0_vld) 
                        ? ibdp_ibuf_h8_vl[7:0] 
                        : 8'b0;




//==========================================================
//             IBUF POP Data trans into inst 
//==========================================================
//Prepare expt Information
assign pop_h0_expt = (pop_h0_acc_err | 
                      pop_h0_pgflt   ); 
assign pop_h1_expt = (pop_h1_acc_err | 
                      pop_h1_pgflt   ); 
assign pop_h2_expt = (pop_h2_acc_err | 
                      pop_h2_pgflt   ); 
assign pop_h3_expt = (pop_h3_acc_err | 
                      pop_h3_pgflt   );
assign pop_h4_expt = (pop_h4_acc_err | 
                      pop_h4_pgflt   );


//Prepare expt vec num Information
assign pop_h0_vec[3:0] = ({4{pop_h0_pgflt}}   & 4'b1100) | 
                         ({4{pop_h0_acc_err}} & 4'b0001); 
assign pop_h1_vec[3:0] = ({4{pop_h1_pgflt}}   & 4'b1100) | 
                         ({4{pop_h1_acc_err}} & 4'b0001); 
assign pop_h2_vec[3:0] = ({4{pop_h2_pgflt}}   & 4'b1100) | 
                         ({4{pop_h2_acc_err}} & 4'b0001); 
assign pop_h3_vec[3:0] = ({4{pop_h3_pgflt}}   & 4'b1100) | 
                         ({4{pop_h3_acc_err}} & 4'b0001); 
assign pop_h4_vec[3:0] = ({4{pop_h4_pgflt}}   & 4'b1100) | 
                         ({4{pop_h4_acc_err}} & 4'b0001); 

//IBUF Generate three inst if IDU only need three
// &CombBeg; @3839
always @( pop_h1_vsew[2:0]
       or pop_h1_split0
       or pop_h2_expt
       or pop_h4_high_expt
       or pop_h0_pc[14:0]
       or pop_h1_vec[3:0]
       or pop_h2_fence
       or pop_h0_bkptb
       or pop_h1_bkptb
       or pop_h4_vl_pred
       or pop_h3_vec[3:0]
       or pop_h3_pc[14:0]
       or pop_h1_32_start
       or pop_h2_ecc_err
       or pop_h4_vld
       or pop_h4_bkpta
       or pop_h2_pc[14:0]
       or pop_h1_high_expt
       or pop_h1_no_spec
       or pop_h2_vld
       or pop_h4_vlmul[1:0]
       or pop_h2_vec[3:0]
       or pop_h1_vlmul[1:0]
       or pop_h4_ecc_err
       or pop_h4_vec[3:0]
       or pop_h2_split1
       or pop_h4_vl[7:0]
       or pop_h1_vl[7:0]
       or pop_h2_split0
       or pop_h0_vlmul[1:0]
       or pop_h0_bkpta
       or pop_h4_data[15:0]
       or pop_h4_split0
       or pop_h1_vld
       or pop_h2_bkptb
       or pop_h3_high_expt
       or pop_h0_32_start
       or pop_h4_split1
       or pop_h3_32_start
       or pop_h0_vsew[2:0]
       or pop_h2_vl[7:0]
       or pop_h0_split0
       or pop_h2_bkpta
       or pop_h3_vld
       or pop_h4_32_start
       or pop_h0_split1
       or pop_h0_high_expt
       or pop_h0_data[15:0]
       or pop_h0_no_spec
       or pop_h1_pc[14:0]
       or pop_h3_split0
       or pop_h3_expt
       or pop_h1_ecc_err
       or pop_h3_no_spec
       or pop_h2_no_spec
       or pop_h2_vl_pred
       or pop_h0_vec[3:0]
       or pop_h2_vsew[2:0]
       or pop_h4_bkptb
       or pop_h0_fence
       or pop_h0_vl[7:0]
       or pop_h3_bkpta
       or pop_h2_high_expt
       or pop_h3_vl_pred
       or pop_h4_fence
       or pop_h3_bkptb
       or pop_h2_vlmul[1:0]
       or pop_h3_vl[7:0]
       or pop_h3_ecc_err
       or pop_h3_vsew[2:0]
       or pop_h4_no_spec
       or pop_h0_vld
       or pop_h5_data[15:0]
       or pop_h1_expt
       or pop_h0_vl_pred
       or pop_h4_pc[14:0]
       or pop_h1_vl_pred
       or pop_h3_data[15:0]
       or pop_h3_fence
       or pop_h2_data[15:0]
       or pop_h1_fence
       or pop_h0_expt
       or pop_h1_data[15:0]
       or pop_h3_split1
       or pop_h1_bkpta
       or pop_h0_ecc_err
       or pop_h2_32_start
       or pop_h4_vsew[2:0]
       or pop_h3_vlmul[1:0]
       or pop_h1_split1
       or pop_h4_expt)
begin
casez({pop_h0_32_start,pop_h1_32_start,pop_h2_32_start,
       pop_h3_32_start,pop_h4_32_start})
       5'b000?? : begin
                  ibuf_pop_inst0_valid      = pop_h0_vld;
                  ibuf_pop_inst0_data[31:0] = {16'b0,pop_h0_data[15:0]};
                  ibuf_pop_inst0_pc[14:0]   = pop_h0_pc[14:0];                  
                  ibuf_pop_inst0_expt       = pop_h0_expt;
                  ibuf_pop_inst0_vec[3:0]   = pop_h0_vec[3:0];
                  ibuf_pop_inst0_high_expt  = pop_h0_high_expt;
                  ibuf_pop_inst0_ecc_err    = pop_h0_ecc_err;
                  ibuf_pop_inst0_split1     = pop_h0_split1;
                  ibuf_pop_inst0_split0     = pop_h0_split0;
                  ibuf_pop_inst0_fence      = pop_h0_fence;
                  ibuf_pop_inst0_bkpta      = pop_h0_bkpta;
                  ibuf_pop_inst0_bkptb      = pop_h0_bkptb;
                  ibuf_pop_inst0_no_spec    = pop_h0_no_spec;
                  ibuf_pop_inst0_vl_pred    = pop_h0_vl_pred;
                  ibuf_pop_inst0_vlmul[1:0] = pop_h0_vlmul[1:0];
                  ibuf_pop_inst0_vsew[2:0]  = pop_h0_vsew[2:0];
                  ibuf_pop_inst0_vl[7:0]    = pop_h0_vl[7:0];
                  ibuf_pop_inst1_valid      = pop_h1_vld;
                  ibuf_pop_inst1_data[31:0] = {16'b0,pop_h1_data[15:0]};
                  ibuf_pop_inst1_pc[14:0]   = pop_h1_pc[14:0];
                  ibuf_pop_inst1_expt       = pop_h1_expt;
                  ibuf_pop_inst1_vec[3:0]   = pop_h1_vec[3:0];
                  ibuf_pop_inst1_high_expt  = pop_h1_high_expt;
                  ibuf_pop_inst1_ecc_err    = pop_h1_ecc_err;
                  ibuf_pop_inst1_split1     = pop_h1_split1;
                  ibuf_pop_inst1_split0     = pop_h1_split0;
                  ibuf_pop_inst1_fence      = pop_h1_fence;
                  ibuf_pop_inst1_bkpta      = pop_h1_bkpta;
                  ibuf_pop_inst1_bkptb      = pop_h1_bkptb;
                  ibuf_pop_inst1_no_spec    = pop_h1_no_spec;
                  ibuf_pop_inst1_vl_pred    = pop_h1_vl_pred;
                  ibuf_pop_inst1_vlmul[1:0] = pop_h1_vlmul[1:0];
                  ibuf_pop_inst1_vsew[2:0]  = pop_h1_vsew[2:0];
                  ibuf_pop_inst1_vl[7:0]    = pop_h1_vl[7:0];
                  ibuf_pop_inst2_valid      = pop_h2_vld;
                  ibuf_pop_inst2_data[31:0] = {16'b0,pop_h2_data[15:0]};
                  ibuf_pop_inst2_pc[14:0]   = pop_h2_pc[14:0];
                  ibuf_pop_inst2_expt       = pop_h2_expt;
                  ibuf_pop_inst2_vec[3:0]   = pop_h2_vec[3:0];
                  ibuf_pop_inst2_high_expt  = pop_h2_high_expt;
                  ibuf_pop_inst2_ecc_err    = pop_h2_ecc_err;
                  ibuf_pop_inst2_split1     = pop_h2_split1;
                  ibuf_pop_inst2_split0     = pop_h2_split0;
                  ibuf_pop_inst2_fence      = pop_h2_fence;
                  ibuf_pop_inst2_bkpta      = pop_h2_bkpta;
                  ibuf_pop_inst2_bkptb      = pop_h2_bkptb;
                  ibuf_pop_inst2_no_spec    = pop_h2_no_spec;
                  ibuf_pop_inst2_vl_pred    = pop_h2_vl_pred;
                  ibuf_pop_inst2_vlmul[1:0] = pop_h2_vlmul[1:0];
                  ibuf_pop_inst2_vsew[2:0]  = pop_h2_vsew[2:0];
                  ibuf_pop_inst2_vl[7:0]    = pop_h2_vl[7:0];
                  ibuf_pop3_half_num[2:0]   = 3'b011;
                  ibuf_pop3_retire_vld[5:0] = 6'b111000;
                  end
       5'b001?? : begin
                  ibuf_pop_inst0_valid      = pop_h0_vld;
                  ibuf_pop_inst0_data[31:0] = {16'b0,pop_h0_data[15:0]};
                  ibuf_pop_inst0_pc[14:0]   = pop_h0_pc[14:0];                  
                  ibuf_pop_inst0_expt       = pop_h0_expt;
                  ibuf_pop_inst0_vec[3:0]   = pop_h0_vec[3:0];
                  ibuf_pop_inst0_high_expt  = pop_h0_high_expt;
                  ibuf_pop_inst0_ecc_err    = pop_h0_ecc_err;
                  ibuf_pop_inst0_split1     = pop_h0_split1;
                  ibuf_pop_inst0_split0     = pop_h0_split0;
                  ibuf_pop_inst0_fence      = pop_h0_fence;
                  ibuf_pop_inst0_bkpta      = pop_h0_bkpta;
                  ibuf_pop_inst0_bkptb      = pop_h0_bkptb;
                  ibuf_pop_inst0_no_spec    = pop_h0_no_spec;
                  ibuf_pop_inst0_vl_pred    = pop_h0_vl_pred;
                  ibuf_pop_inst0_vlmul[1:0] = pop_h0_vlmul[1:0];
                  ibuf_pop_inst0_vsew[2:0]  = pop_h0_vsew[2:0];
                  ibuf_pop_inst0_vl[7:0]    = pop_h0_vl[7:0];
                  ibuf_pop_inst1_valid      = pop_h1_vld;
                  ibuf_pop_inst1_data[31:0] = {16'b0,pop_h1_data[15:0]};
                  ibuf_pop_inst1_pc[14:0]   = pop_h1_pc[14:0];
                  ibuf_pop_inst1_expt       = pop_h1_expt;
                  ibuf_pop_inst1_vec[3:0]   = pop_h1_vec[3:0];
                  ibuf_pop_inst1_high_expt  = pop_h1_high_expt;
                  ibuf_pop_inst1_ecc_err    = pop_h1_ecc_err;
                  ibuf_pop_inst1_split1     = pop_h1_split1;
                  ibuf_pop_inst1_split0     = pop_h1_split0;
                  ibuf_pop_inst1_fence      = pop_h1_fence;
                  ibuf_pop_inst1_bkpta      = pop_h1_bkpta;
                  ibuf_pop_inst1_bkptb      = pop_h1_bkptb;
                  ibuf_pop_inst1_no_spec    = pop_h1_no_spec;
                  ibuf_pop_inst1_vl_pred    = pop_h1_vl_pred;
                  ibuf_pop_inst1_vlmul[1:0] = pop_h1_vlmul[1:0];
                  ibuf_pop_inst1_vsew[2:0]  = pop_h1_vsew[2:0];
                  ibuf_pop_inst1_vl[7:0]    = pop_h1_vl[7:0];
                  ibuf_pop_inst2_valid      = pop_h2_vld;
                  ibuf_pop_inst2_data[31:0] = {pop_h3_data[15:0],pop_h2_data[15:0]};
                  ibuf_pop_inst2_pc[14:0]   = pop_h2_pc[14:0];
                  ibuf_pop_inst2_expt       = pop_h2_expt;
                  ibuf_pop_inst2_vec[3:0]   = pop_h2_vec[3:0];
                  ibuf_pop_inst2_high_expt  = pop_h2_high_expt;
                  ibuf_pop_inst2_ecc_err    = pop_h2_ecc_err;
                  ibuf_pop_inst2_split1     = pop_h2_split1;
                  ibuf_pop_inst2_split0     = pop_h2_split0;
                  ibuf_pop_inst2_fence      = pop_h2_fence;
                  ibuf_pop_inst2_bkpta      = pop_h2_bkpta;
                  ibuf_pop_inst2_bkptb      = pop_h2_bkptb;
                  ibuf_pop_inst2_no_spec    = pop_h2_no_spec;
                  ibuf_pop_inst2_vl_pred    = pop_h2_vl_pred;
                  ibuf_pop_inst2_vlmul[1:0] = pop_h2_vlmul[1:0];
                  ibuf_pop_inst2_vsew[2:0]  = pop_h2_vsew[2:0];
                  ibuf_pop_inst2_vl[7:0]    = pop_h2_vl[7:0];
                  ibuf_pop3_half_num[2:0]   = 3'b100;
                  ibuf_pop3_retire_vld[5:0] = 6'b111100;
                  end
       5'b01?0? : begin
                  ibuf_pop_inst0_valid      = pop_h0_vld;
                  ibuf_pop_inst0_data[31:0] = {16'b0,pop_h0_data[15:0]};
                  ibuf_pop_inst0_pc[14:0]   = pop_h0_pc[14:0];                  
                  ibuf_pop_inst0_expt       = pop_h0_expt;
                  ibuf_pop_inst0_vec[3:0]   = pop_h0_vec[3:0];
                  ibuf_pop_inst0_high_expt  = pop_h0_high_expt;
                  ibuf_pop_inst0_ecc_err    = pop_h0_ecc_err;
                  ibuf_pop_inst0_split1     = pop_h0_split1;
                  ibuf_pop_inst0_split0     = pop_h0_split0;
                  ibuf_pop_inst0_fence      = pop_h0_fence;
                  ibuf_pop_inst0_bkpta      = pop_h0_bkpta;
                  ibuf_pop_inst0_bkptb      = pop_h0_bkptb;
                  ibuf_pop_inst0_no_spec    = pop_h0_no_spec;
                  ibuf_pop_inst0_vl_pred    = pop_h0_vl_pred;
                  ibuf_pop_inst0_vlmul[1:0] = pop_h0_vlmul[1:0];
                  ibuf_pop_inst0_vsew[2:0]  = pop_h0_vsew[2:0];
                  ibuf_pop_inst0_vl[7:0]    = pop_h0_vl[7:0];
                  ibuf_pop_inst1_valid      = pop_h1_vld;
                  ibuf_pop_inst1_data[31:0] = {pop_h2_data[15:0],pop_h1_data[15:0]};
                  ibuf_pop_inst1_pc[14:0]   = pop_h1_pc[14:0];
                  ibuf_pop_inst1_expt       = pop_h1_expt;
                  ibuf_pop_inst1_vec[3:0]   = pop_h1_vec[3:0];
                  ibuf_pop_inst1_high_expt  = pop_h1_high_expt;
                  ibuf_pop_inst1_ecc_err    = pop_h1_ecc_err;
                  ibuf_pop_inst1_split1     = pop_h1_split1;
                  ibuf_pop_inst1_split0     = pop_h1_split0;
                  ibuf_pop_inst1_fence      = pop_h1_fence;
                  ibuf_pop_inst1_bkpta      = pop_h1_bkpta;
                  ibuf_pop_inst1_bkptb      = pop_h1_bkptb;
                  ibuf_pop_inst1_no_spec    = pop_h1_no_spec;
                  ibuf_pop_inst1_vl_pred    = pop_h1_vl_pred;
                  ibuf_pop_inst1_vlmul[1:0] = pop_h1_vlmul[1:0];
                  ibuf_pop_inst1_vsew[2:0]  = pop_h1_vsew[2:0];
                  ibuf_pop_inst1_vl[7:0]    = pop_h1_vl[7:0];
                  ibuf_pop_inst2_valid      = pop_h3_vld;
                  ibuf_pop_inst2_data[31:0] = {16'b0,pop_h3_data[15:0]};
                  ibuf_pop_inst2_pc[14:0]   = pop_h3_pc[14:0];
                  ibuf_pop_inst2_expt       = pop_h3_expt;
                  ibuf_pop_inst2_vec[3:0]   = pop_h3_vec[3:0];
                  ibuf_pop_inst2_high_expt  = pop_h3_high_expt;
                  ibuf_pop_inst2_ecc_err    = pop_h3_ecc_err;
                  ibuf_pop_inst2_split1     = pop_h3_split1;
                  ibuf_pop_inst2_split0     = pop_h3_split0;
                  ibuf_pop_inst2_fence      = pop_h3_fence;
                  ibuf_pop_inst2_bkpta      = pop_h3_bkpta;
                  ibuf_pop_inst2_bkptb      = pop_h3_bkptb;
                  ibuf_pop_inst2_no_spec    = pop_h3_no_spec;
                  ibuf_pop_inst2_vl_pred    = pop_h3_vl_pred;
                  ibuf_pop_inst2_vlmul[1:0] = pop_h3_vlmul[1:0];
                  ibuf_pop_inst2_vsew[2:0]  = pop_h3_vsew[2:0];
                  ibuf_pop_inst2_vl[7:0]    = pop_h3_vl[7:0];
                  ibuf_pop3_half_num[2:0]   = 3'b100;
                  ibuf_pop3_retire_vld[5:0] = 6'b111100;
                  end
       5'b01?1? : begin
                  ibuf_pop_inst0_valid      = pop_h0_vld;
                  ibuf_pop_inst0_data[31:0] = {16'b0,pop_h0_data[15:0]};
                  ibuf_pop_inst0_pc[14:0]   = pop_h0_pc[14:0];                  
                  ibuf_pop_inst0_expt       = pop_h0_expt;
                  ibuf_pop_inst0_vec[3:0]   = pop_h0_vec[3:0];
                  ibuf_pop_inst0_high_expt  = pop_h0_high_expt;
                  ibuf_pop_inst0_ecc_err    = pop_h0_ecc_err;
                  ibuf_pop_inst0_split1     = pop_h0_split1;
                  ibuf_pop_inst0_split0     = pop_h0_split0;
                  ibuf_pop_inst0_fence      = pop_h0_fence;
                  ibuf_pop_inst0_bkpta      = pop_h0_bkpta;
                  ibuf_pop_inst0_bkptb      = pop_h0_bkptb;
                  ibuf_pop_inst0_no_spec    = pop_h0_no_spec;
                  ibuf_pop_inst0_vl_pred    = pop_h0_vl_pred;
                  ibuf_pop_inst0_vlmul[1:0] = pop_h0_vlmul[1:0];
                  ibuf_pop_inst0_vsew[2:0]  = pop_h0_vsew[2:0];
                  ibuf_pop_inst0_vl[7:0]    = pop_h0_vl[7:0];
                  ibuf_pop_inst1_valid      = pop_h1_vld;
                  ibuf_pop_inst1_data[31:0] = {pop_h2_data[15:0],pop_h1_data[15:0]};
                  ibuf_pop_inst1_pc[14:0]   = pop_h1_pc[14:0];
                  ibuf_pop_inst1_expt       = pop_h1_expt;
                  ibuf_pop_inst1_vec[3:0]   = pop_h1_vec[3:0];
                  ibuf_pop_inst1_high_expt  = pop_h1_high_expt;
                  ibuf_pop_inst1_ecc_err    = pop_h1_ecc_err;
                  ibuf_pop_inst1_split1     = pop_h1_split1;
                  ibuf_pop_inst1_split0     = pop_h1_split0;
                  ibuf_pop_inst1_fence      = pop_h1_fence;
                  ibuf_pop_inst1_bkpta      = pop_h1_bkpta;
                  ibuf_pop_inst1_bkptb      = pop_h1_bkptb;
                  ibuf_pop_inst1_no_spec    = pop_h1_no_spec;
                  ibuf_pop_inst1_vl_pred    = pop_h1_vl_pred;
                  ibuf_pop_inst1_vlmul[1:0] = pop_h1_vlmul[1:0];
                  ibuf_pop_inst1_vsew[2:0]  = pop_h1_vsew[2:0];
                  ibuf_pop_inst1_vl[7:0]    = pop_h1_vl[7:0];
                  ibuf_pop_inst2_valid      = pop_h3_vld;
                  ibuf_pop_inst2_data[31:0] = {pop_h4_data[15:0],pop_h3_data[15:0]};
                  ibuf_pop_inst2_pc[14:0]   = pop_h3_pc[14:0];
                  ibuf_pop_inst2_expt       = pop_h3_expt;
                  ibuf_pop_inst2_vec[3:0]   = pop_h3_vec[3:0];
                  ibuf_pop_inst2_high_expt  = pop_h3_high_expt;
                  ibuf_pop_inst2_ecc_err    = pop_h3_ecc_err;
                  ibuf_pop_inst2_split1     = pop_h3_split1;
                  ibuf_pop_inst2_split0     = pop_h3_split0;
                  ibuf_pop_inst2_fence      = pop_h3_fence;
                  ibuf_pop_inst2_bkpta      = pop_h3_bkpta;
                  ibuf_pop_inst2_bkptb      = pop_h3_bkptb;
                  ibuf_pop_inst2_no_spec    = pop_h3_no_spec;
                  ibuf_pop_inst2_vl_pred    = pop_h3_vl_pred;
                  ibuf_pop_inst2_vlmul[1:0] = pop_h3_vlmul[1:0];
                  ibuf_pop_inst2_vsew[2:0]  = pop_h3_vsew[2:0];
                  ibuf_pop_inst2_vl[7:0]    = pop_h3_vl[7:0];
                  ibuf_pop3_half_num[2:0]   = 3'b101;
                  ibuf_pop3_retire_vld[5:0] = 6'b111110;
                  end
       5'b1?00? : begin
                  ibuf_pop_inst0_valid      = pop_h0_vld;
                  ibuf_pop_inst0_data[31:0] = {pop_h1_data[15:0],pop_h0_data[15:0]};
                  ibuf_pop_inst0_pc[14:0]   = pop_h0_pc[14:0];                  
                  ibuf_pop_inst0_expt       = pop_h0_expt;
                  ibuf_pop_inst0_vec[3:0]   = pop_h0_vec[3:0];
                  ibuf_pop_inst0_high_expt  = pop_h0_high_expt;
                  ibuf_pop_inst0_ecc_err    = pop_h0_ecc_err;
                  ibuf_pop_inst0_split1     = pop_h0_split1;
                  ibuf_pop_inst0_split0     = pop_h0_split0;
                  ibuf_pop_inst0_fence      = pop_h0_fence;
                  ibuf_pop_inst0_bkpta      = pop_h0_bkpta;
                  ibuf_pop_inst0_bkptb      = pop_h0_bkptb;
                  ibuf_pop_inst0_no_spec    = pop_h0_no_spec;
                  ibuf_pop_inst0_vl_pred    = pop_h0_vl_pred;
                  ibuf_pop_inst0_vlmul[1:0] = pop_h0_vlmul[1:0];
                  ibuf_pop_inst0_vsew[2:0]  = pop_h0_vsew[2:0];
                  ibuf_pop_inst0_vl[7:0]    = pop_h0_vl[7:0];
                  ibuf_pop_inst1_valid      = pop_h2_vld;
                  ibuf_pop_inst1_data[31:0] = {16'b0,pop_h2_data[15:0]};
                  ibuf_pop_inst1_pc[14:0]   = pop_h2_pc[14:0];
                  ibuf_pop_inst1_expt       = pop_h2_expt;
                  ibuf_pop_inst1_vec[3:0]   = pop_h2_vec[3:0];
                  ibuf_pop_inst1_high_expt  = pop_h2_high_expt;
                  ibuf_pop_inst1_ecc_err    = pop_h2_ecc_err;
                  ibuf_pop_inst1_split1     = pop_h2_split1;
                  ibuf_pop_inst1_split0     = pop_h2_split0;
                  ibuf_pop_inst1_fence      = pop_h2_fence;
                  ibuf_pop_inst1_bkpta      = pop_h2_bkpta;
                  ibuf_pop_inst1_bkptb      = pop_h2_bkptb;
                  ibuf_pop_inst1_no_spec    = pop_h2_no_spec;
                  ibuf_pop_inst1_vl_pred    = pop_h2_vl_pred;
                  ibuf_pop_inst1_vlmul[1:0] = pop_h2_vlmul[1:0];
                  ibuf_pop_inst1_vsew[2:0]  = pop_h2_vsew[2:0];
                  ibuf_pop_inst1_vl[7:0]    = pop_h2_vl[7:0];
                  ibuf_pop_inst2_valid      = pop_h3_vld;
                  ibuf_pop_inst2_data[31:0] = {16'b0,pop_h3_data[15:0]};
                  ibuf_pop_inst2_pc[14:0]   = pop_h3_pc[14:0];
                  ibuf_pop_inst2_expt       = pop_h3_expt;
                  ibuf_pop_inst2_vec[3:0]   = pop_h3_vec[3:0];
                  ibuf_pop_inst2_high_expt  = pop_h3_high_expt;
                  ibuf_pop_inst2_ecc_err    = pop_h3_ecc_err;
                  ibuf_pop_inst2_split1     = pop_h3_split1;
                  ibuf_pop_inst2_split0     = pop_h3_split0;
                  ibuf_pop_inst2_fence      = pop_h3_fence;
                  ibuf_pop_inst2_bkpta      = pop_h3_bkpta;
                  ibuf_pop_inst2_bkptb      = pop_h3_bkptb;
                  ibuf_pop_inst2_no_spec    = pop_h3_no_spec;
                  ibuf_pop_inst2_vl_pred    = pop_h3_vl_pred;
                  ibuf_pop_inst2_vlmul[1:0] = pop_h3_vlmul[1:0];
                  ibuf_pop_inst2_vsew[2:0]  = pop_h3_vsew[2:0];
                  ibuf_pop_inst2_vl[7:0]    = pop_h3_vl[7:0];
                  ibuf_pop3_half_num[2:0]   = 3'b100;
                  ibuf_pop3_retire_vld[5:0] = 6'b111100;
                  end
       5'b1?01? : begin
                  ibuf_pop_inst0_valid      = pop_h0_vld;
                  ibuf_pop_inst0_data[31:0] = {pop_h1_data[15:0],pop_h0_data[15:0]};
                  ibuf_pop_inst0_pc[14:0]   = pop_h0_pc[14:0];                  
                  ibuf_pop_inst0_expt       = pop_h0_expt;
                  ibuf_pop_inst0_vec[3:0]   = pop_h0_vec[3:0];
                  ibuf_pop_inst0_high_expt  = pop_h0_high_expt;
                  ibuf_pop_inst0_ecc_err    = pop_h0_ecc_err;
                  ibuf_pop_inst0_split1     = pop_h0_split1;
                  ibuf_pop_inst0_split0     = pop_h0_split0;
                  ibuf_pop_inst0_fence      = pop_h0_fence;
                  ibuf_pop_inst0_bkpta      = pop_h0_bkpta;
                  ibuf_pop_inst0_bkptb      = pop_h0_bkptb;
                  ibuf_pop_inst0_no_spec    = pop_h0_no_spec;
                  ibuf_pop_inst0_vl_pred    = pop_h0_vl_pred;
                  ibuf_pop_inst0_vlmul[1:0] = pop_h0_vlmul[1:0];
                  ibuf_pop_inst0_vsew[2:0]  = pop_h0_vsew[2:0];
                  ibuf_pop_inst0_vl[7:0]    = pop_h0_vl[7:0];
                  ibuf_pop_inst1_valid      = pop_h2_vld;
                  ibuf_pop_inst1_data[31:0] = {16'b0,pop_h2_data[15:0]};
                  ibuf_pop_inst1_pc[14:0]   = pop_h2_pc[14:0];
                  ibuf_pop_inst1_expt       = pop_h2_expt;
                  ibuf_pop_inst1_vec[3:0]   = pop_h2_vec[3:0];
                  ibuf_pop_inst1_high_expt  = pop_h2_high_expt;
                  ibuf_pop_inst1_ecc_err    = pop_h2_ecc_err;
                  ibuf_pop_inst1_split1     = pop_h2_split1;
                  ibuf_pop_inst1_split0     = pop_h2_split0;
                  ibuf_pop_inst1_fence      = pop_h2_fence;
                  ibuf_pop_inst1_bkpta      = pop_h2_bkpta;
                  ibuf_pop_inst1_bkptb      = pop_h2_bkptb;
                  ibuf_pop_inst1_no_spec    = pop_h2_no_spec;
                  ibuf_pop_inst1_vl_pred    = pop_h2_vl_pred;
                  ibuf_pop_inst1_vlmul[1:0] = pop_h2_vlmul[1:0];
                  ibuf_pop_inst1_vsew[2:0]  = pop_h2_vsew[2:0];
                  ibuf_pop_inst1_vl[7:0]    = pop_h2_vl[7:0];
                  ibuf_pop_inst2_valid      = pop_h3_vld;
                  ibuf_pop_inst2_data[31:0] = {pop_h4_data[15:0],pop_h3_data[15:0]};
                  ibuf_pop_inst2_pc[14:0]   = pop_h3_pc[14:0];
                  ibuf_pop_inst2_expt       = pop_h3_expt;
                  ibuf_pop_inst2_vec[3:0]   = pop_h3_vec[3:0];
                  ibuf_pop_inst2_high_expt  = pop_h3_high_expt;
                  ibuf_pop_inst2_ecc_err    = pop_h3_ecc_err;
                  ibuf_pop_inst2_split1     = pop_h3_split1;
                  ibuf_pop_inst2_split0     = pop_h3_split0;
                  ibuf_pop_inst2_fence      = pop_h3_fence;
                  ibuf_pop_inst2_bkpta      = pop_h3_bkpta;
                  ibuf_pop_inst2_bkptb      = pop_h3_bkptb;
                  ibuf_pop_inst2_no_spec    = pop_h3_no_spec;
                  ibuf_pop_inst2_vl_pred    = pop_h3_vl_pred;
                  ibuf_pop_inst2_vlmul[1:0] = pop_h3_vlmul[1:0];
                  ibuf_pop_inst2_vsew[2:0]  = pop_h3_vsew[2:0];
                  ibuf_pop_inst2_vl[7:0]    = pop_h3_vl[7:0];
                  ibuf_pop3_half_num[2:0]   = 3'b101;
                  ibuf_pop3_retire_vld[5:0] = 6'b111110;
                  end
       5'b1?1?0 : begin
                  ibuf_pop_inst0_valid      = pop_h0_vld;
                  ibuf_pop_inst0_data[31:0] = {pop_h1_data[15:0],pop_h0_data[15:0]};
                  ibuf_pop_inst0_pc[14:0]   = pop_h0_pc[14:0];                  
                  ibuf_pop_inst0_expt       = pop_h0_expt;
                  ibuf_pop_inst0_vec[3:0]   = pop_h0_vec[3:0];
                  ibuf_pop_inst0_high_expt  = pop_h0_high_expt;
                  ibuf_pop_inst0_ecc_err    = pop_h0_ecc_err;
                  ibuf_pop_inst0_split1     = pop_h0_split1;
                  ibuf_pop_inst0_split0     = pop_h0_split0;
                  ibuf_pop_inst0_fence      = pop_h0_fence;
                  ibuf_pop_inst0_bkpta      = pop_h0_bkpta;
                  ibuf_pop_inst0_bkptb      = pop_h0_bkptb;
                  ibuf_pop_inst0_no_spec    = pop_h0_no_spec;
                  ibuf_pop_inst0_vl_pred    = pop_h0_vl_pred;
                  ibuf_pop_inst0_vlmul[1:0] = pop_h0_vlmul[1:0];
                  ibuf_pop_inst0_vsew[2:0]  = pop_h0_vsew[2:0];
                  ibuf_pop_inst0_vl[7:0]    = pop_h0_vl[7:0];
                  ibuf_pop_inst1_valid      = pop_h2_vld;
                  ibuf_pop_inst1_data[31:0] = {pop_h3_data[15:0],pop_h2_data[15:0]};
                  ibuf_pop_inst1_pc[14:0]   = pop_h2_pc[14:0];
                  ibuf_pop_inst1_expt       = pop_h2_expt;
                  ibuf_pop_inst1_vec[3:0]   = pop_h2_vec[3:0];
                  ibuf_pop_inst1_high_expt  = pop_h2_high_expt;
                  ibuf_pop_inst1_ecc_err    = pop_h2_ecc_err;
                  ibuf_pop_inst1_split1     = pop_h2_split1;
                  ibuf_pop_inst1_split0     = pop_h2_split0;
                  ibuf_pop_inst1_fence      = pop_h2_fence;
                  ibuf_pop_inst1_bkpta      = pop_h2_bkpta;
                  ibuf_pop_inst1_bkptb      = pop_h2_bkptb;
                  ibuf_pop_inst1_no_spec    = pop_h2_no_spec;
                  ibuf_pop_inst1_vl_pred    = pop_h2_vl_pred;
                  ibuf_pop_inst1_vlmul[1:0] = pop_h2_vlmul[1:0];
                  ibuf_pop_inst1_vsew[2:0]  = pop_h2_vsew[2:0];
                  ibuf_pop_inst1_vl[7:0]    = pop_h2_vl[7:0];
                  ibuf_pop_inst2_valid      = pop_h4_vld;
                  ibuf_pop_inst2_data[31:0] = {16'b0,pop_h4_data[15:0]};
                  ibuf_pop_inst2_pc[14:0]   = pop_h4_pc[14:0];
                  ibuf_pop_inst2_expt       = pop_h4_expt;
                  ibuf_pop_inst2_vec[3:0]   = pop_h4_vec[3:0];
                  ibuf_pop_inst2_high_expt  = pop_h4_high_expt;
                  ibuf_pop_inst2_ecc_err    = pop_h4_ecc_err;
                  ibuf_pop_inst2_split1     = pop_h4_split1;
                  ibuf_pop_inst2_split0     = pop_h4_split0;
                  ibuf_pop_inst2_fence      = pop_h4_fence;
                  ibuf_pop_inst2_bkpta      = pop_h4_bkpta;
                  ibuf_pop_inst2_bkptb      = pop_h4_bkptb;
                  ibuf_pop_inst2_no_spec    = pop_h4_no_spec;
                  ibuf_pop_inst2_vl_pred    = pop_h4_vl_pred;
                  ibuf_pop_inst2_vlmul[1:0] = pop_h4_vlmul[1:0];
                  ibuf_pop_inst2_vsew[2:0]  = pop_h4_vsew[2:0];
                  ibuf_pop_inst2_vl[7:0]    = pop_h4_vl[7:0];
                  ibuf_pop3_half_num[2:0]   = 3'b101;
                  ibuf_pop3_retire_vld[5:0] = 6'b111110;
                  end
       5'b1?1?1 : begin
                  ibuf_pop_inst0_valid      = pop_h0_vld;
                  ibuf_pop_inst0_data[31:0] = {pop_h1_data[15:0],pop_h0_data[15:0]};
                  ibuf_pop_inst0_pc[14:0]   = pop_h0_pc[14:0];                  
                  ibuf_pop_inst0_expt       = pop_h0_expt;
                  ibuf_pop_inst0_vec[3:0]   = pop_h0_vec[3:0];
                  ibuf_pop_inst0_high_expt  = pop_h0_high_expt;
                  ibuf_pop_inst0_ecc_err    = pop_h0_ecc_err;
                  ibuf_pop_inst0_split1     = pop_h0_split1;
                  ibuf_pop_inst0_split0     = pop_h0_split0;
                  ibuf_pop_inst0_fence      = pop_h0_fence;
                  ibuf_pop_inst0_bkpta      = pop_h0_bkpta;
                  ibuf_pop_inst0_bkptb      = pop_h0_bkptb;
                  ibuf_pop_inst0_no_spec    = pop_h0_no_spec;
                  ibuf_pop_inst0_vl_pred    = pop_h0_vl_pred;
                  ibuf_pop_inst0_vlmul[1:0] = pop_h0_vlmul[1:0];
                  ibuf_pop_inst0_vsew[2:0]  = pop_h0_vsew[2:0];
                  ibuf_pop_inst0_vl[7:0]    = pop_h0_vl[7:0];
                  ibuf_pop_inst1_valid      = pop_h2_vld;
                  ibuf_pop_inst1_data[31:0] = {pop_h3_data[15:0],pop_h2_data[15:0]};
                  ibuf_pop_inst1_pc[14:0]   = pop_h2_pc[14:0];
                  ibuf_pop_inst1_expt       = pop_h2_expt;
                  ibuf_pop_inst1_vec[3:0]   = pop_h2_vec[3:0];
                  ibuf_pop_inst1_high_expt  = pop_h2_high_expt;
                  ibuf_pop_inst1_ecc_err    = pop_h2_ecc_err;
                  ibuf_pop_inst1_split1     = pop_h2_split1;
                  ibuf_pop_inst1_split0     = pop_h2_split0;
                  ibuf_pop_inst1_fence      = pop_h2_fence;
                  ibuf_pop_inst1_bkpta      = pop_h2_bkpta;
                  ibuf_pop_inst1_bkptb      = pop_h2_bkptb;
                  ibuf_pop_inst1_no_spec    = pop_h2_no_spec;
                  ibuf_pop_inst1_vl_pred    = pop_h2_vl_pred;
                  ibuf_pop_inst1_vlmul[1:0] = pop_h2_vlmul[1:0];
                  ibuf_pop_inst1_vsew[2:0]  = pop_h2_vsew[2:0];
                  ibuf_pop_inst1_vl[7:0]    = pop_h2_vl[7:0];
                  ibuf_pop_inst2_valid      = pop_h4_vld;
                  ibuf_pop_inst2_data[31:0] = {pop_h5_data[15:0],pop_h4_data[15:0]};
                  ibuf_pop_inst2_pc[14:0]   = pop_h4_pc[14:0];
                  ibuf_pop_inst2_expt       = pop_h4_expt;
                  ibuf_pop_inst2_vec[3:0]   = pop_h4_vec[3:0];
                  ibuf_pop_inst2_high_expt  = pop_h4_high_expt;
                  ibuf_pop_inst2_ecc_err    = pop_h4_ecc_err;
                  ibuf_pop_inst2_split1     = pop_h4_split1;
                  ibuf_pop_inst2_split0     = pop_h4_split0;
                  ibuf_pop_inst2_fence      = pop_h4_fence;
                  ibuf_pop_inst2_bkpta      = pop_h4_bkpta;
                  ibuf_pop_inst2_bkptb      = pop_h4_bkptb;
                  ibuf_pop_inst2_no_spec    = pop_h4_no_spec;
                  ibuf_pop_inst2_vl_pred    = pop_h4_vl_pred;
                  ibuf_pop_inst2_vlmul[1:0] = pop_h4_vlmul[1:0];
                  ibuf_pop_inst2_vsew[2:0]  = pop_h4_vsew[2:0];
                  ibuf_pop_inst2_vl[7:0]    = pop_h4_vl[7:0];
                  ibuf_pop3_half_num[2:0]   = 3'b110;
                  ibuf_pop3_retire_vld[5:0] = 6'b111111;
                  end
       default  : begin
                  ibuf_pop_inst0_valid      =  1'b0;
                  ibuf_pop_inst0_data[31:0] = 32'b0;
                  ibuf_pop_inst0_pc[14:0]   = 15'b0;                  
                  ibuf_pop_inst0_expt       =  1'b0; 
                  ibuf_pop_inst0_vec[3:0]   =  4'b0; 
                  ibuf_pop_inst0_high_expt  =  1'b0; 
                  ibuf_pop_inst0_ecc_err    =  1'b0;
                  ibuf_pop_inst0_split1     =  1'b0; 
                  ibuf_pop_inst0_split0     =  1'b0; 
                  ibuf_pop_inst0_fence      =  1'b0; 
                  ibuf_pop_inst0_bkpta      =  1'b0; 
                  ibuf_pop_inst0_bkptb      =  1'b0; 
                  ibuf_pop_inst0_no_spec    =  1'b0;
                  ibuf_pop_inst0_vl_pred    =  1'b0;
                  ibuf_pop_inst0_vlmul[1:0] =  2'b0;
                  ibuf_pop_inst0_vsew[2:0]  =  3'b0;
                  ibuf_pop_inst0_vl[7:0]    =  8'b0;
                  ibuf_pop_inst1_valid      =  1'b0; 
                  ibuf_pop_inst1_data[31:0] = 32'b0; 
                  ibuf_pop_inst1_pc[14:0]   = 15'b0;
                  ibuf_pop_inst1_expt       =  1'b0; 
                  ibuf_pop_inst1_vec[3:0]   =  4'b0; 
                  ibuf_pop_inst1_high_expt  =  1'b0; 
                  ibuf_pop_inst1_ecc_err    =  1'b0;
                  ibuf_pop_inst1_split1     =  1'b0; 
                  ibuf_pop_inst1_split0     =  1'b0; 
                  ibuf_pop_inst1_fence      =  1'b0; 
                  ibuf_pop_inst1_bkpta      =  1'b0; 
                  ibuf_pop_inst1_bkptb      =  1'b0; 
                  ibuf_pop_inst1_no_spec    =  1'b0;
                  ibuf_pop_inst1_vl_pred    =  1'b0;
                  ibuf_pop_inst1_vlmul[1:0] =  2'b0; 
                  ibuf_pop_inst1_vsew[2:0]  =  3'b0;
                  ibuf_pop_inst1_vl[7:0]    =  8'b0;
                  ibuf_pop_inst2_valid      =  1'b0; 
                  ibuf_pop_inst2_data[31:0] = 32'b0; 
                  ibuf_pop_inst2_pc[14:0]   = 15'b0;
                  ibuf_pop_inst2_expt       =  1'b0; 
                  ibuf_pop_inst2_vec[3:0]   =  4'b0; 
                  ibuf_pop_inst2_high_expt  =  1'b0; 
                  ibuf_pop_inst2_ecc_err    =  1'b0;
                  ibuf_pop_inst2_split1     =  1'b0; 
                  ibuf_pop_inst2_split0     =  1'b0; 
                  ibuf_pop_inst2_fence      =  1'b0; 
                  ibuf_pop_inst2_bkpta      =  1'b0; 
                  ibuf_pop_inst2_bkptb      =  1'b0; 
                  ibuf_pop_inst2_no_spec    =  1'b0;
                  ibuf_pop_inst2_vl_pred    =  1'b0;
                  ibuf_pop_inst2_vlmul[1:0] =  2'b0; 
                  ibuf_pop_inst2_vsew[2:0]  =  3'b0;
                  ibuf_pop_inst2_vl[7:0]    =  8'b0;
                  ibuf_pop3_half_num[2:0]   =  3'b0; 
                  ibuf_pop3_retire_vld[5:0] = 6'b000000;
                  end
endcase
// &CombEnd; @4338
end

//==========================================================
//               IB_ID Bypass Inst Logic
//==========================================================
//-------------------bypass_way_signal----------------------
//bypass_way_hn_vld 
//ibctrl_ibuf_hn_bypass_create_en = ipctri_ibctrl_vld
assign bypass_way_h0_vld = (ibdp_ibuf_h0_vld)
                         ? ibdp_ibuf_h0_vld
                         : ibdp_ibuf_hn_vld[7];
assign bypass_way_h1_vld = (ibdp_ibuf_h0_vld)
                         ? ibdp_ibuf_hn_vld[7]
                         : ibdp_ibuf_hn_vld[6];
assign bypass_way_h2_vld = (ibdp_ibuf_h0_vld)
                         ? ibdp_ibuf_hn_vld[6]
                         : ibdp_ibuf_hn_vld[5];
assign bypass_way_h3_vld = (ibdp_ibuf_h0_vld)
                         ? ibdp_ibuf_hn_vld[5]
                         : ibdp_ibuf_hn_vld[4];
assign bypass_way_h4_vld = (ibdp_ibuf_h0_vld)
                         ? ibdp_ibuf_hn_vld[4]
                         : ibdp_ibuf_hn_vld[3];
//bypass_way_hn_32_start
assign bypass_way_h0_32_start = ib_hn_32_start[8]; 
assign bypass_way_h1_32_start = ib_hn_32_start[7]; 
assign bypass_way_h2_32_start = ib_hn_32_start[6]; 
assign bypass_way_h3_32_start = ib_hn_32_start[5]; 
assign bypass_way_h4_32_start = ib_hn_32_start[4]; 
//bypass_way_hn_acc_err
assign bypass_way_h0_acc_err = ib_hn_acc_err[8]; 
assign bypass_way_h1_acc_err = ib_hn_acc_err[7]; 
assign bypass_way_h2_acc_err = ib_hn_acc_err[6]; 
assign bypass_way_h3_acc_err = ib_hn_acc_err[5]; 
assign bypass_way_h4_acc_err = ib_hn_acc_err[4]; 
assign bypass_way_h0_ecc_err = 1'b0; 
assign bypass_way_h1_ecc_err = 1'b0; 
assign bypass_way_h2_ecc_err = 1'b0; 
assign bypass_way_h3_ecc_err = 1'b0; 
assign bypass_way_h4_ecc_err = 1'b0; 
//bypass_way_hn_pgflt
assign bypass_way_h0_pgflt = ib_hn_pgflt[8]; 
assign bypass_way_h1_pgflt = ib_hn_pgflt[7]; 
assign bypass_way_h2_pgflt = ib_hn_pgflt[6]; 
assign bypass_way_h3_pgflt = ib_hn_pgflt[5]; 
assign bypass_way_h4_pgflt = ib_hn_pgflt[4]; 
//bypass_way_hn_high_expt
assign bypass_way_h0_high_expt = ib_hn_high_expt[8]; 
assign bypass_way_h1_high_expt = ib_hn_high_expt[7]; 
assign bypass_way_h2_high_expt = ib_hn_high_expt[6]; 
assign bypass_way_h3_high_expt = ib_hn_high_expt[5]; 
assign bypass_way_h4_high_expt = ib_hn_high_expt[4]; 
//bypass_way_hn_split1
assign bypass_way_h0_split1 = ib_hn_split1[8]; 
assign bypass_way_h1_split1 = ib_hn_split1[7]; 
assign bypass_way_h2_split1 = ib_hn_split1[6]; 
assign bypass_way_h3_split1 = ib_hn_split1[5]; 
assign bypass_way_h4_split1 = ib_hn_split1[4]; 
//bypass_way_hn_split0
assign bypass_way_h0_split0 = ib_hn_split0[8]; 
assign bypass_way_h1_split0 = ib_hn_split0[7]; 
assign bypass_way_h2_split0 = ib_hn_split0[6]; 
assign bypass_way_h3_split0 = ib_hn_split0[5]; 
assign bypass_way_h4_split0 = ib_hn_split0[4]; 
//bypass_way_hn_fence
assign bypass_way_h0_fence = ib_hn_fence[8]; 
assign bypass_way_h1_fence = ib_hn_fence[7]; 
assign bypass_way_h2_fence = ib_hn_fence[6]; 
assign bypass_way_h3_fence = ib_hn_fence[5]; 
assign bypass_way_h4_fence = ib_hn_fence[4]; 
//bypass_way_hn_bkpta
assign bypass_way_h0_bkpta = ib_hn_bkpta[8]; 
assign bypass_way_h1_bkpta = ib_hn_bkpta[7]; 
assign bypass_way_h2_bkpta = ib_hn_bkpta[6]; 
assign bypass_way_h3_bkpta = ib_hn_bkpta[5]; 
assign bypass_way_h4_bkpta = ib_hn_bkpta[4]; 
//bypass_way_hn_bkptb
assign bypass_way_h0_bkptb = ib_hn_bkptb[8]; 
assign bypass_way_h1_bkptb = ib_hn_bkptb[7]; 
assign bypass_way_h2_bkptb = ib_hn_bkptb[6]; 
assign bypass_way_h3_bkptb = ib_hn_bkptb[5]; 
assign bypass_way_h4_bkptb = ib_hn_bkptb[4]; 
//bypass_way_hn_no_spec
assign bypass_way_h0_no_spec = ib_hn_no_spec[8]; 
assign bypass_way_h1_no_spec = ib_hn_no_spec[7]; 
assign bypass_way_h2_no_spec = ib_hn_no_spec[6]; 
assign bypass_way_h3_no_spec = ib_hn_no_spec[5]; 
assign bypass_way_h4_no_spec = ib_hn_no_spec[4];
//bypass_way_hn_vl_pred
assign bypass_way_h0_vl_pred = ib_hn_vl_pred[8]; 
assign bypass_way_h1_vl_pred = ib_hn_vl_pred[7]; 
assign bypass_way_h2_vl_pred = ib_hn_vl_pred[6]; 
assign bypass_way_h3_vl_pred = ib_hn_vl_pred[5]; 
assign bypass_way_h4_vl_pred = ib_hn_vl_pred[4];
//bypass_way_hn_data
assign bypass_way_h0_data[15:0] = ib_h0_data[15:0]; 
assign bypass_way_h1_data[15:0] = ib_h1_data[15:0]; 
assign bypass_way_h2_data[15:0] = ib_h2_data[15:0]; 
assign bypass_way_h3_data[15:0] = ib_h3_data[15:0]; 
assign bypass_way_h4_data[15:0] = ib_h4_data[15:0]; 
assign bypass_way_h5_data[15:0] = ib_h5_data[15:0]; 
//bypass_way_hn_data
assign bypass_way_h0_pc[14:0] = ib_h0_pc[14:0]; 
assign bypass_way_h1_pc[14:0] = ib_h1_pc[14:0]; 
assign bypass_way_h2_pc[14:0] = ib_h2_pc[14:0]; 
assign bypass_way_h3_pc[14:0] = ib_h3_pc[14:0]; 
assign bypass_way_h4_pc[14:0] = ib_h4_pc[14:0];
//bypass_way_hn_vlmul
assign bypass_way_h0_vlmul[1:0] = ib_h0_vlmul[1:0]; 
assign bypass_way_h1_vlmul[1:0] = ib_h1_vlmul[1:0]; 
assign bypass_way_h2_vlmul[1:0] = ib_h2_vlmul[1:0]; 
assign bypass_way_h3_vlmul[1:0] = ib_h3_vlmul[1:0]; 
assign bypass_way_h4_vlmul[1:0] = ib_h4_vlmul[1:0]; 
//bypass_way_hn_vsew
assign bypass_way_h0_vsew[2:0] = ib_h0_vsew[2:0]; 
assign bypass_way_h1_vsew[2:0] = ib_h1_vsew[2:0]; 
assign bypass_way_h2_vsew[2:0] = ib_h2_vsew[2:0]; 
assign bypass_way_h3_vsew[2:0] = ib_h3_vsew[2:0]; 
assign bypass_way_h4_vsew[2:0] = ib_h4_vsew[2:0]; 

//bypass_way_hn_vl
assign bypass_way_h0_vl[7:0]   = ib_h0_vl[7:0];
assign bypass_way_h1_vl[7:0]   = ib_h1_vl[7:0];
assign bypass_way_h2_vl[7:0]   = ib_h2_vl[7:0];
assign bypass_way_h3_vl[7:0]   = ib_h3_vl[7:0];
assign bypass_way_h4_vl[7:0]   = ib_h4_vl[7:0];

//Prepare expt Information
assign bypass_way_h0_expt = (bypass_way_h0_acc_err | 
                             bypass_way_h0_pgflt   ); 
assign bypass_way_h1_expt = (bypass_way_h1_acc_err | 
                             bypass_way_h1_pgflt   );
assign bypass_way_h2_expt = (bypass_way_h2_acc_err | 
                             bypass_way_h2_pgflt   );
assign bypass_way_h3_expt = (bypass_way_h3_acc_err | 
                             bypass_way_h3_pgflt   );
assign bypass_way_h4_expt = (bypass_way_h4_acc_err | 
                             bypass_way_h4_pgflt   );

//Prepare expt vec num Information
assign bypass_way_h0_vec[3:0] = ({4{bypass_way_h0_pgflt}}   & 4'b1100) | 
                                ({4{bypass_way_h0_acc_err}} & 4'b0001); 
assign bypass_way_h1_vec[3:0] = ({4{bypass_way_h1_pgflt}}   & 4'b1100) | 
                                ({4{bypass_way_h1_acc_err}} & 4'b0001); 
assign bypass_way_h2_vec[3:0] = ({4{bypass_way_h2_pgflt}}   & 4'b1100) | 
                                ({4{bypass_way_h2_acc_err}} & 4'b0001); 
assign bypass_way_h3_vec[3:0] = ({4{bypass_way_h3_pgflt}}   & 4'b1100) | 
                                ({4{bypass_way_h3_acc_err}} & 4'b0001); 
assign bypass_way_h4_vec[3:0] = ({4{bypass_way_h4_pgflt}}   & 4'b1100) | 
                                ({4{bypass_way_h4_acc_err}} & 4'b0001); 

//IBUF Generate three inst if IDU only need three
// &CombBeg; @4499
always @( bypass_way_h4_split1
       or bypass_way_h3_bkptb
       or bypass_way_h1_data[15:0]
       or bypass_way_h1_split1
       or bypass_way_h4_vl_pred
       or bypass_way_h0_split0
       or bypass_way_h4_expt
       or bypass_way_h3_bkpta
       or bypass_way_h4_ecc_err
       or bypass_way_h5_data[15:0]
       or bypass_way_h1_vsew[2:0]
       or bypass_way_h4_32_start
       or bypass_way_h1_high_expt
       or bypass_way_h3_high_expt
       or bypass_way_h2_pc[14:0]
       or ib_hn_create_vld[5:0]
       or bypass_way_h3_ecc_err
       or bypass_way_h1_split0
       or bypass_way_h3_vec[3:0]
       or bypass_way_h2_vlmul[1:0]
       or bypass_way_h1_vl[7:0]
       or bypass_way_h3_expt
       or bypass_way_h0_vld
       or bypass_way_h3_vlmul[1:0]
       or bypass_way_h0_data[15:0]
       or bypass_way_h3_fence
       or bypass_way_h0_bkptb
       or bypass_way_h0_pc[14:0]
       or bypass_way_h0_vlmul[1:0]
       or bypass_way_h2_high_expt
       or bypass_way_h2_vsew[2:0]
       or bypass_way_h1_vlmul[1:0]
       or bypass_way_h0_fence
       or bypass_way_h2_vl[7:0]
       or bypass_way_h2_vec[3:0]
       or bypass_way_h2_vld
       or bypass_way_h3_data[15:0]
       or bypass_way_h1_fence
       or bypass_way_h0_bkpta
       or bypass_way_h3_vl_pred
       or bypass_way_h1_vec[3:0]
       or bypass_way_h1_vld
       or bypass_way_h1_vl_pred
       or bypass_way_h3_pc[14:0]
       or bypass_way_h2_ecc_err
       or bypass_way_h3_no_spec
       or bypass_way_h1_32_start
       or bypass_way_h4_vlmul[1:0]
       or bypass_way_h2_vl_pred
       or bypass_way_h0_vec[3:0]
       or bypass_way_h0_vl[7:0]
       or bypass_way_h0_expt
       or bypass_way_h4_vec[3:0]
       or bypass_way_h4_pc[14:0]
       or bypass_way_h2_bkptb
       or bypass_way_h1_no_spec
       or bypass_way_h2_expt
       or bypass_way_h0_32_start
       or bypass_way_h0_vsew[2:0]
       or bypass_way_h2_no_spec
       or bypass_way_h4_no_spec
       or bypass_way_h3_32_start
       or bypass_way_h4_split0
       or bypass_way_h4_bkptb
       or bypass_way_h3_split0
       or bypass_way_h4_fence
       or bypass_way_h4_bkpta
       or bypass_way_h2_split0
       or bypass_way_h0_split1
       or bypass_way_h2_32_start
       or bypass_way_h1_bkpta
       or bypass_way_h1_bkptb
       or bypass_way_h0_vl_pred
       or bypass_way_h0_ecc_err
       or bypass_way_h4_vsew[2:0]
       or bypass_way_h2_fence
       or bypass_way_h2_data[15:0]
       or bypass_way_h0_high_expt
       or bypass_way_h4_high_expt
       or bypass_way_h3_vl[7:0]
       or bypass_way_h0_no_spec
       or bypass_way_h4_vl[7:0]
       or bypass_way_h3_vsew[2:0]
       or bypass_way_h4_vld
       or bypass_way_h1_ecc_err
       or bypass_way_h3_vld
       or bypass_way_h1_expt
       or bypass_way_h2_split1
       or bypass_way_h2_bkpta
       or bypass_way_h1_pc[14:0]
       or bypass_way_h4_data[15:0]
       or bypass_way_h3_split1)
begin
casez({bypass_way_h0_32_start,bypass_way_h1_32_start,bypass_way_h2_32_start,
       bypass_way_h3_32_start,bypass_way_h4_32_start})
       5'b000?? : begin
                  bypass_way_inst0_valid       = bypass_way_h0_vld;
                  bypass_way_inst0_data[31:0]  = {16'b0,bypass_way_h0_data[15:0]};
                  bypass_way_inst0_pc[14:0]    = bypass_way_h0_pc[14:0];                  
                  bypass_way_inst0_expt        = bypass_way_h0_expt;
                  bypass_way_inst0_vec[3:0]    = bypass_way_h0_vec[3:0];
                  bypass_way_inst0_high_expt   = bypass_way_h0_high_expt;
                  bypass_way_inst0_ecc_err     = bypass_way_h0_ecc_err;
                  bypass_way_inst0_split1      = bypass_way_h0_split1;
                  bypass_way_inst0_split0      = bypass_way_h0_split0;
                  bypass_way_inst0_fence       = bypass_way_h0_fence;
                  bypass_way_inst0_bkpta       = bypass_way_h0_bkpta;
                  bypass_way_inst0_bkptb       = bypass_way_h0_bkptb;
                  bypass_way_inst0_no_spec     = bypass_way_h0_no_spec;
                  bypass_way_inst0_vl_pred     = bypass_way_h0_vl_pred;
                  bypass_way_inst0_32_start    = bypass_way_h0_32_start;
                  bypass_way_inst0_vlmul[1:0]  = bypass_way_h0_vlmul[1:0];
                  bypass_way_inst0_vsew[2:0]   = bypass_way_h0_vsew[2:0];
                  bypass_way_inst0_vl[7:0]     = bypass_way_h0_vl[7:0];
                  bypass_way_inst1_valid       = bypass_way_h1_vld;
                  bypass_way_inst1_data[31:0]  = {16'b0,bypass_way_h1_data[15:0]};
                  bypass_way_inst1_pc[14:0]    = bypass_way_h1_pc[14:0];                  
                  bypass_way_inst1_expt        = bypass_way_h1_expt;
                  bypass_way_inst1_vec[3:0]    = bypass_way_h1_vec[3:0];
                  bypass_way_inst1_high_expt   = bypass_way_h1_high_expt;
                  bypass_way_inst1_ecc_err     = bypass_way_h1_ecc_err;
                  bypass_way_inst1_split1      = bypass_way_h1_split1;
                  bypass_way_inst1_split0      = bypass_way_h1_split0;
                  bypass_way_inst1_fence       = bypass_way_h1_fence;
                  bypass_way_inst1_bkpta       = bypass_way_h1_bkpta;
                  bypass_way_inst1_bkptb       = bypass_way_h1_bkptb;
                  bypass_way_inst1_no_spec     = bypass_way_h1_no_spec;
                  bypass_way_inst1_vl_pred     = bypass_way_h1_vl_pred;
                  bypass_way_inst1_32_start    = bypass_way_h1_32_start;
                  bypass_way_inst1_vlmul[1:0]  = bypass_way_h1_vlmul[1:0];
                  bypass_way_inst1_vsew[2:0]   = bypass_way_h1_vsew[2:0];
                  bypass_way_inst1_vl[7:0]     = bypass_way_h1_vl[7:0];
                  bypass_way_inst2_valid       = bypass_way_h2_vld;
                  bypass_way_inst2_data[31:0]  = {16'b0,bypass_way_h2_data[15:0]};
                  bypass_way_inst2_pc[14:0]    = bypass_way_h2_pc[14:0];                  
                  bypass_way_inst2_expt        = bypass_way_h2_expt;
                  bypass_way_inst2_vec[3:0]    = bypass_way_h2_vec[3:0];
                  bypass_way_inst2_high_expt   = bypass_way_h2_high_expt;
                  bypass_way_inst2_ecc_err     = bypass_way_h2_ecc_err;
                  bypass_way_inst2_split1      = bypass_way_h2_split1;
                  bypass_way_inst2_split0      = bypass_way_h2_split0;
                  bypass_way_inst2_fence       = bypass_way_h2_fence;
                  bypass_way_inst2_bkpta       = bypass_way_h2_bkpta;
                  bypass_way_inst2_bkptb       = bypass_way_h2_bkptb;
                  bypass_way_inst2_no_spec     = bypass_way_h2_no_spec;
                  bypass_way_inst2_vl_pred     = bypass_way_h2_vl_pred;
                  bypass_way_inst2_vlmul[1:0]  = bypass_way_h2_vlmul[1:0];
                  bypass_way_inst2_vsew[2:0]   = bypass_way_h2_vsew[2:0];
                  bypass_way_inst2_vl[7:0]     = bypass_way_h2_vl[7:0];
                  bypass_way_half_num[2:0]     = 3'b011;
                  ib_hn_create_vld_bypass[8:0] = {3'b0,ib_hn_create_vld[5:0]};
//                  ib_hn_ldst_bypass[8:0]       = {ib_hn_ldst[5:0],3'b0};                  
//                  ib_hn_acc_err_bypass[8:0]    = {ib_hn_acc_err[5:0],3'b0};
//                  ib_hn_pgflt_bypass[8:0]      = {ib_hn_pgflt[5:0],3'b0};
//                  ib_hn_high_expt_bypass[8:0]  = {ib_hn_high_expt[5:0],3'b0};
//                  ib_hn_ecc_err_bypass[8:0]    = {ib_hn_ecc_err[5:0],3'b0};
//                  ib_hn_split1_bypass[8:0]     = {ib_hn_split1[5:0],3'b0};
//                  ib_hn_split0_bypass[8:0]     = {ib_hn_split0[5:0],3'b0};
//                  ib_hn_fence_bypass[8:0]      = {ib_hn_fence[5:0],3'b0};
//                  ib_hn_bkpta_bypass[8:0]      = {ib_hn_bkpta[5:0],3'b0};
//                  ib_hn_bkptb_bypass[8:0]      = {ib_hn_bkptb[5:0],3'b0};
//                  ib_hn_no_spec_bypass[8:0]    = {ib_hn_no_spec[5:0],3'b0};
//                  ib_hn_32_start_bypass[8:0]   = {ib_hn_32_start[5:0],3'b0};
//                  ib_h0_data_bypass[15:0]      = ib_h3_data[15:0];
//                  ib_h1_data_bypass[15:0]      = ib_h4_data[15:0];
//                  ib_h2_data_bypass[15:0]      = ib_h5_data[15:0];
//                  ib_h3_data_bypass[15:0]      = ib_h6_data[15:0];
//                  ib_h4_data_bypass[15:0]      = ib_h7_data[15:0];
//                  ib_h0_pc_bypass[14:0]        = ib_h3_pc[14:0];
//                  ib_h1_pc_bypass[14:0]        = ib_h4_pc[14:0];
//                  ib_h2_pc_bypass[14:0]        = ib_h5_pc[14:0];
//                  ib_h3_pc_bypass[14:0]        = ib_h6_pc[14:0];
//                  ib_h4_pc_bypass[14:0]        = ib_h7_pc[14:0];
//                  ib_h0_vlmul_bypass[1:0]      = ib_h3_vlmul[1:0];
//                  ib_h1_vlmul_bypass[1:0]      = ib_h4_vlmul[1:0];
//                  ib_h2_vlmul_bypass[1:0]      = ib_h5_vlmul[1:0];
//                  ib_h3_vlmul_bypass[1:0]      = ib_h6_vlmul[1:0];
//                  ib_h4_vlmul_bypass[1:0]      = ib_h7_vlmul[1:0];
//                  ib_h0_vsew_bypass[2:0]       = ib_h3_vsew[2:0];
//                  ib_h1_vsew_bypass[2:0]       = ib_h4_vsew[2:0];
//                  ib_h2_vsew_bypass[2:0]       = ib_h5_vsew[2:0];
//                  ib_h3_vsew_bypass[2:0]       = ib_h6_vsew[2:0];
//                  ib_h4_vsew_bypass[2:0]       = ib_h7_vsew[2:0];
                  end
       5'b001?? : begin
                  bypass_way_inst0_valid       = bypass_way_h0_vld;
                  bypass_way_inst0_data[31:0]  = {16'b0,bypass_way_h0_data[15:0]};
                  bypass_way_inst0_pc[14:0]    = bypass_way_h0_pc[14:0];                  
                  bypass_way_inst0_expt        = bypass_way_h0_expt;
                  bypass_way_inst0_vec[3:0]    = bypass_way_h0_vec[3:0];
                  bypass_way_inst0_high_expt   = bypass_way_h0_high_expt;
                  bypass_way_inst0_ecc_err     = bypass_way_h0_ecc_err;
                  bypass_way_inst0_split1      = bypass_way_h0_split1;
                  bypass_way_inst0_split0      = bypass_way_h0_split0;
                  bypass_way_inst0_fence       = bypass_way_h0_fence;
                  bypass_way_inst0_bkpta       = bypass_way_h0_bkpta;
                  bypass_way_inst0_bkptb       = bypass_way_h0_bkptb;
                  bypass_way_inst0_no_spec     = bypass_way_h0_no_spec;
                  bypass_way_inst0_vl_pred     = bypass_way_h0_vl_pred;
                  bypass_way_inst0_vlmul[1:0]  = bypass_way_h0_vlmul[1:0];
                  bypass_way_inst0_vsew[2:0]   = bypass_way_h0_vsew[2:0];
                  bypass_way_inst0_vl[7:0]     = bypass_way_h0_vl[7:0];
                  bypass_way_inst0_32_start    = bypass_way_h0_32_start;
                  bypass_way_inst1_valid       = bypass_way_h1_vld;
                  bypass_way_inst1_data[31:0]  = {16'b0,bypass_way_h1_data[15:0]};
                  bypass_way_inst1_pc[14:0]    = bypass_way_h1_pc[14:0];                  
                  bypass_way_inst1_expt        = bypass_way_h1_expt;
                  bypass_way_inst1_vec[3:0]    = bypass_way_h1_vec[3:0];
                  bypass_way_inst1_high_expt   = bypass_way_h1_high_expt;
                  bypass_way_inst1_ecc_err     = bypass_way_h1_ecc_err;
                  bypass_way_inst1_split1      = bypass_way_h1_split1;
                  bypass_way_inst1_split0      = bypass_way_h1_split0;
                  bypass_way_inst1_fence       = bypass_way_h1_fence;
                  bypass_way_inst1_bkpta       = bypass_way_h1_bkpta;
                  bypass_way_inst1_bkptb       = bypass_way_h1_bkptb;
                  bypass_way_inst1_no_spec     = bypass_way_h1_no_spec;
                  bypass_way_inst1_vl_pred     = bypass_way_h1_vl_pred;
                  bypass_way_inst1_32_start    = bypass_way_h1_32_start;
                  bypass_way_inst1_vlmul[1:0]  = bypass_way_h1_vlmul[1:0];
                  bypass_way_inst1_vsew[2:0]   = bypass_way_h1_vsew[2:0];
                  bypass_way_inst1_vl[7:0]     = bypass_way_h1_vl[7:0];
                  bypass_way_inst2_valid       = bypass_way_h2_vld;
                  bypass_way_inst2_data[31:0]  = {bypass_way_h3_data[15:0],bypass_way_h2_data[15:0]};
                  bypass_way_inst2_pc[14:0]    = bypass_way_h2_pc[14:0];                  
                  bypass_way_inst2_expt        = bypass_way_h2_expt;
                  bypass_way_inst2_vec[3:0]    = bypass_way_h2_vec[3:0];
                  bypass_way_inst2_high_expt   = bypass_way_h2_high_expt;
                  bypass_way_inst2_ecc_err     = bypass_way_h2_ecc_err;
                  bypass_way_inst2_split1      = bypass_way_h2_split1;
                  bypass_way_inst2_split0      = bypass_way_h2_split0;
                  bypass_way_inst2_fence       = bypass_way_h2_fence;
                  bypass_way_inst2_bkpta       = bypass_way_h2_bkpta;
                  bypass_way_inst2_bkptb       = bypass_way_h2_bkptb;
                  bypass_way_inst2_no_spec     = bypass_way_h2_no_spec;
                  bypass_way_inst2_vl_pred     = bypass_way_h2_vl_pred;
                  bypass_way_inst2_vlmul[1:0]  = bypass_way_h2_vlmul[1:0];
                  bypass_way_inst2_vsew[2:0]   = bypass_way_h2_vsew[2:0];
                  bypass_way_inst2_vl[7:0]     = bypass_way_h2_vl[7:0];
                  bypass_way_half_num[2:0]     = 3'b100;
                  ib_hn_create_vld_bypass[8:0] = {4'b0,ib_hn_create_vld[4:0]};
//                  ib_hn_create_vld_bypass[8:0] = {ib_hn_create_vld[4:0],4'b0};
//                  ib_hn_ldst_bypass[8:0]       = {ib_hn_ldst[4:0],4'b0};                  
//                  ib_hn_acc_err_bypass[8:0]    = {ib_hn_acc_err[4:0],4'b0};
//                  ib_hn_ecc_err_bypass[8:0]    = {ib_hn_ecc_err[4:0],4'b0};
//                  ib_hn_pgflt_bypass[8:0]      = {ib_hn_pgflt[4:0],4'b0};
//                  ib_hn_high_expt_bypass[8:0]  = {ib_hn_high_expt[4:0],4'b0};
//                  ib_hn_split1_bypass[8:0]     = {ib_hn_split1[4:0],4'b0};
//                  ib_hn_split0_bypass[8:0]     = {ib_hn_split0[4:0],4'b0};
//                  ib_hn_fence_bypass[8:0]      = {ib_hn_fence[4:0],4'b0};
//                  ib_hn_bkpta_bypass[8:0]      = {ib_hn_bkpta[4:0],4'b0};
//                  ib_hn_bkptb_bypass[8:0]      = {ib_hn_bkptb[4:0],4'b0};
//                  ib_hn_no_spec_bypass[8:0]    = {ib_hn_no_spec[4:0],4'b0};
//                  ib_hn_32_start_bypass[8:0]   = {ib_hn_32_start[4:0],4'b0};
//                  ib_h0_data_bypass[15:0]      = ib_h4_data[15:0];
//                  ib_h1_data_bypass[15:0]      = ib_h5_data[15:0];
//                  ib_h2_data_bypass[15:0]      = ib_h6_data[15:0];
//                  ib_h3_data_bypass[15:0]      = ib_h7_data[15:0];
//                  ib_h4_data_bypass[15:0]      = ib_h8_data[15:0];
//                  ib_h0_pc_bypass[14:0]        = ib_h4_pc[14:0];
//                  ib_h1_pc_bypass[14:0]        = ib_h5_pc[14:0];
//                  ib_h2_pc_bypass[14:0]        = ib_h6_pc[14:0];
//                  ib_h3_pc_bypass[14:0]        = ib_h7_pc[14:0];
//                  ib_h4_pc_bypass[14:0]        = ib_h8_pc[14:0];
//                  ib_h0_vlmul_bypass[1:0]      = ib_h4_vlmul[1:0];
//                  ib_h1_vlmul_bypass[1:0]      = ib_h5_vlmul[1:0];
//                  ib_h2_vlmul_bypass[1:0]      = ib_h6_vlmul[1:0];
//                  ib_h3_vlmul_bypass[1:0]      = ib_h7_vlmul[1:0];
//                  ib_h4_vlmul_bypass[1:0]      = ib_h8_vlmul[1:0];
//                  ib_h0_vsew_bypass[2:0]       = ib_h4_vsew[2:0];
//                  ib_h1_vsew_bypass[2:0]       = ib_h5_vsew[2:0];
//                  ib_h2_vsew_bypass[2:0]       = ib_h6_vsew[2:0];
//                  ib_h3_vsew_bypass[2:0]       = ib_h7_vsew[2:0];
//                  ib_h4_vsew_bypass[2:0]       = ib_h8_vsew[2:0];
                  end
       5'b01?0? : begin
                  bypass_way_inst0_valid       = bypass_way_h0_vld;
                  bypass_way_inst0_data[31:0]  = {16'b0,bypass_way_h0_data[15:0]};
                  bypass_way_inst0_pc[14:0]    = bypass_way_h0_pc[14:0];                  
                  bypass_way_inst0_expt        = bypass_way_h0_expt;
                  bypass_way_inst0_vec[3:0]    = bypass_way_h0_vec[3:0];
                  bypass_way_inst0_high_expt   = bypass_way_h0_high_expt;
                  bypass_way_inst0_ecc_err     = bypass_way_h0_ecc_err;
                  bypass_way_inst0_split1      = bypass_way_h0_split1;
                  bypass_way_inst0_split0      = bypass_way_h0_split0;
                  bypass_way_inst0_fence       = bypass_way_h0_fence;
                  bypass_way_inst0_bkpta       = bypass_way_h0_bkpta;
                  bypass_way_inst0_bkptb       = bypass_way_h0_bkptb;
                  bypass_way_inst0_no_spec     = bypass_way_h0_no_spec;
                  bypass_way_inst0_vl_pred     = bypass_way_h0_vl_pred;
                  bypass_way_inst0_32_start    = bypass_way_h0_32_start;
                  bypass_way_inst0_vlmul[1:0]  = bypass_way_h0_vlmul[1:0];
                  bypass_way_inst0_vsew[2:0]   = bypass_way_h0_vsew[2:0];
                  bypass_way_inst0_vl[7:0]     = bypass_way_h0_vl[7:0];
                  bypass_way_inst1_valid       = bypass_way_h1_vld;
                  bypass_way_inst1_data[31:0]  = {bypass_way_h2_data[15:0],bypass_way_h1_data[15:0]};
                  bypass_way_inst1_pc[14:0]    = bypass_way_h1_pc[14:0];                  
                  bypass_way_inst1_expt        = bypass_way_h1_expt;
                  bypass_way_inst1_vec[3:0]    = bypass_way_h1_vec[3:0];
                  bypass_way_inst1_high_expt   = bypass_way_h1_high_expt;
                  bypass_way_inst1_ecc_err     = bypass_way_h1_ecc_err;
                  bypass_way_inst1_split1      = bypass_way_h1_split1;
                  bypass_way_inst1_split0      = bypass_way_h1_split0;
                  bypass_way_inst1_fence       = bypass_way_h1_fence;
                  bypass_way_inst1_bkpta       = bypass_way_h1_bkpta;
                  bypass_way_inst1_bkptb       = bypass_way_h1_bkptb;
                  bypass_way_inst1_no_spec     = bypass_way_h1_no_spec;
                  bypass_way_inst1_vl_pred     = bypass_way_h1_vl_pred;
                  bypass_way_inst1_32_start    = bypass_way_h1_32_start;
                  bypass_way_inst1_vlmul[1:0]  = bypass_way_h1_vlmul[1:0];
                  bypass_way_inst1_vsew[2:0]   = bypass_way_h1_vsew[2:0];
                  bypass_way_inst1_vl[7:0]     = bypass_way_h1_vl[7:0];
                  bypass_way_inst2_valid       = bypass_way_h3_vld;
                  bypass_way_inst2_data[31:0]  = {16'b0,bypass_way_h3_data[15:0]};
                  bypass_way_inst2_pc[14:0]    = bypass_way_h3_pc[14:0];                  
                  bypass_way_inst2_expt        = bypass_way_h3_expt;
                  bypass_way_inst2_vec[3:0]    = bypass_way_h3_vec[3:0];
                  bypass_way_inst2_high_expt   = bypass_way_h3_high_expt;
                  bypass_way_inst2_ecc_err     = bypass_way_h3_ecc_err;
                  bypass_way_inst2_split1      = bypass_way_h3_split1;
                  bypass_way_inst2_split0      = bypass_way_h3_split0;
                  bypass_way_inst2_fence       = bypass_way_h3_fence;
                  bypass_way_inst2_bkpta       = bypass_way_h3_bkpta;
                  bypass_way_inst2_bkptb       = bypass_way_h3_bkptb;
                  bypass_way_inst2_no_spec     = bypass_way_h3_no_spec;
                  bypass_way_inst2_vl_pred     = bypass_way_h3_vl_pred;
                  bypass_way_inst2_vlmul[1:0]  = bypass_way_h3_vlmul[1:0];
                  bypass_way_inst2_vsew[2:0]   = bypass_way_h3_vsew[2:0];
                  bypass_way_inst2_vl[7:0]     = bypass_way_h3_vl[7:0];
                  bypass_way_half_num[2:0]     = 3'b100;
                  ib_hn_create_vld_bypass[8:0] = {4'b0,ib_hn_create_vld[4:0]};
//                  ib_hn_create_vld_bypass[8:0] = {ib_hn_create_vld[4:0],4'b0};
//                  ib_hn_ldst_bypass[8:0]       = {ib_hn_ldst[4:0],4'b0};                  
//                  ib_hn_acc_err_bypass[8:0]    = {ib_hn_acc_err[4:0],4'b0};
//                  ib_hn_pgflt_bypass[8:0]      = {ib_hn_pgflt[4:0],4'b0};
//                  ib_hn_high_expt_bypass[8:0]  = {ib_hn_high_expt[4:0],4'b0};
//                  ib_hn_ecc_err_bypass[8:0]    = {ib_hn_ecc_err[4:0],4'b0};
//                  ib_hn_split1_bypass[8:0]     = {ib_hn_split1[4:0],4'b0};
//                  ib_hn_split0_bypass[8:0]     = {ib_hn_split0[4:0],4'b0};
//                  ib_hn_fence_bypass[8:0]      = {ib_hn_fence[4:0],4'b0};
//                  ib_hn_bkpta_bypass[8:0]      = {ib_hn_bkpta[4:0],4'b0};
//                  ib_hn_bkptb_bypass[8:0]      = {ib_hn_bkptb[4:0],4'b0};
//                  ib_hn_no_spec_bypass[8:0]    = {ib_hn_no_spec[4:0],4'b0};
//                  ib_hn_32_start_bypass[8:0]   = {ib_hn_32_start[4:0],4'b0};
//                  ib_h0_data_bypass[15:0]      = ib_h4_data[15:0];
//                  ib_h1_data_bypass[15:0]      = ib_h5_data[15:0];
//                  ib_h2_data_bypass[15:0]      = ib_h6_data[15:0];
//                  ib_h3_data_bypass[15:0]      = ib_h7_data[15:0];
//                  ib_h4_data_bypass[15:0]      = ib_h8_data[15:0];
//                  ib_h0_pc_bypass[14:0]        = ib_h4_pc[14:0];
//                  ib_h1_pc_bypass[14:0]        = ib_h5_pc[14:0];
//                  ib_h2_pc_bypass[14:0]        = ib_h6_pc[14:0];
//                  ib_h3_pc_bypass[14:0]        = ib_h7_pc[14:0];
//                  ib_h4_pc_bypass[14:0]        = ib_h8_pc[14:0];
//                  ib_h0_vlmul_bypass[1:0]      = ib_h4_vlmul[1:0];
//                  ib_h1_vlmul_bypass[1:0]      = ib_h5_vlmul[1:0];
//                  ib_h2_vlmul_bypass[1:0]      = ib_h6_vlmul[1:0];
//                  ib_h3_vlmul_bypass[1:0]      = ib_h7_vlmul[1:0];
//                  ib_h4_vlmul_bypass[1:0]      = ib_h8_vlmul[1:0];
//                  ib_h0_vsew_bypass[2:0]       = ib_h4_vsew[2:0];
//                  ib_h1_vsew_bypass[2:0]       = ib_h5_vsew[2:0];
//                  ib_h2_vsew_bypass[2:0]       = ib_h6_vsew[2:0];
//                  ib_h3_vsew_bypass[2:0]       = ib_h7_vsew[2:0];
//                  ib_h4_vsew_bypass[2:0]       = ib_h8_vsew[2:0];
                  end
       5'b01?1? : begin
                  bypass_way_inst0_valid       = bypass_way_h0_vld;
                  bypass_way_inst0_data[31:0]  = {16'b0,bypass_way_h0_data[15:0]};
                  bypass_way_inst0_pc[14:0]    = bypass_way_h0_pc[14:0];                  
                  bypass_way_inst0_expt        = bypass_way_h0_expt;
                  bypass_way_inst0_vec[3:0]    = bypass_way_h0_vec[3:0];
                  bypass_way_inst0_high_expt   = bypass_way_h0_high_expt;
                  bypass_way_inst0_ecc_err     = bypass_way_h0_ecc_err;
                  bypass_way_inst0_split1      = bypass_way_h0_split1;
                  bypass_way_inst0_split0      = bypass_way_h0_split0;
                  bypass_way_inst0_fence       = bypass_way_h0_fence;
                  bypass_way_inst0_bkpta       = bypass_way_h0_bkpta;
                  bypass_way_inst0_bkptb       = bypass_way_h0_bkptb;
                  bypass_way_inst0_no_spec     = bypass_way_h0_no_spec;
                  bypass_way_inst0_vl_pred     = bypass_way_h0_vl_pred;
                  bypass_way_inst0_32_start    = bypass_way_h0_32_start;
                  bypass_way_inst0_vlmul[1:0]  = bypass_way_h0_vlmul[1:0];
                  bypass_way_inst0_vsew[2:0]   = bypass_way_h0_vsew[2:0];
                  bypass_way_inst0_vl[7:0]     = bypass_way_h0_vl[7:0];
                  bypass_way_inst1_valid       = bypass_way_h1_vld;
                  bypass_way_inst1_data[31:0]  = {bypass_way_h2_data[15:0],bypass_way_h1_data[15:0]};
                  bypass_way_inst1_pc[14:0]    = bypass_way_h1_pc[14:0];                  
                  bypass_way_inst1_expt        = bypass_way_h1_expt;
                  bypass_way_inst1_vec[3:0]    = bypass_way_h1_vec[3:0];
                  bypass_way_inst1_high_expt   = bypass_way_h1_high_expt;
                  bypass_way_inst1_ecc_err     = bypass_way_h1_ecc_err;
                  bypass_way_inst1_split1      = bypass_way_h1_split1;
                  bypass_way_inst1_split0      = bypass_way_h1_split0;
                  bypass_way_inst1_fence       = bypass_way_h1_fence;
                  bypass_way_inst1_bkpta       = bypass_way_h1_bkpta;
                  bypass_way_inst1_bkptb       = bypass_way_h1_bkptb;
                  bypass_way_inst1_no_spec     = bypass_way_h1_no_spec;
                  bypass_way_inst1_vl_pred     = bypass_way_h1_vl_pred;
                  bypass_way_inst1_32_start    = bypass_way_h1_32_start;
                  bypass_way_inst1_vlmul[1:0]  = bypass_way_h1_vlmul[1:0];
                  bypass_way_inst1_vsew[2:0]   = bypass_way_h1_vsew[2:0];
                  bypass_way_inst1_vl[7:0]     = bypass_way_h1_vl[7:0];
                  bypass_way_inst2_valid       = bypass_way_h3_vld;
                  bypass_way_inst2_data[31:0]  = {bypass_way_h4_data[15:0],bypass_way_h3_data[15:0]};
                  bypass_way_inst2_pc[14:0]    = bypass_way_h3_pc[14:0];                  
                  bypass_way_inst2_expt        = bypass_way_h3_expt;
                  bypass_way_inst2_vec[3:0]    = bypass_way_h3_vec[3:0];
                  bypass_way_inst2_high_expt   = bypass_way_h3_high_expt;
                  bypass_way_inst2_ecc_err     = bypass_way_h3_ecc_err;
                  bypass_way_inst2_split1      = bypass_way_h3_split1;
                  bypass_way_inst2_split0      = bypass_way_h3_split0;
                  bypass_way_inst2_fence       = bypass_way_h3_fence;
                  bypass_way_inst2_bkpta       = bypass_way_h3_bkpta;
                  bypass_way_inst2_bkptb       = bypass_way_h3_bkptb;
                  bypass_way_inst2_no_spec     = bypass_way_h3_no_spec;
                  bypass_way_inst2_vl_pred     = bypass_way_h3_vl_pred;
                  bypass_way_inst2_vlmul[1:0]  = bypass_way_h3_vlmul[1:0];
                  bypass_way_inst2_vsew[2:0]   = bypass_way_h3_vsew[2:0];
                  bypass_way_inst2_vl[7:0]     = bypass_way_h3_vl[7:0];
                  bypass_way_half_num[2:0]     = 3'b101;
                  ib_hn_create_vld_bypass[8:0] = {5'b0,ib_hn_create_vld[3:0]};
//                  ib_hn_create_vld_bypass[8:0] = {ib_hn_create_vld[3:0],5'b0};
//                  ib_hn_ldst_bypass[8:0]       = {ib_hn_ldst[3:0],5'b0};                  
//                  ib_hn_acc_err_bypass[8:0]    = {ib_hn_acc_err[3:0],5'b0};
//                  ib_hn_pgflt_bypass[8:0]      = {ib_hn_pgflt[3:0],5'b0};
//                  ib_hn_high_expt_bypass[8:0]  = {ib_hn_high_expt[3:0],5'b0};
//                  ib_hn_ecc_err_bypass[8:0]    = {ib_hn_ecc_err[3:0],5'b0};
//                  ib_hn_split1_bypass[8:0]     = {ib_hn_split1[3:0],5'b0};
//                  ib_hn_split0_bypass[8:0]     = {ib_hn_split0[3:0],5'b0};
//                  ib_hn_fence_bypass[8:0]      = {ib_hn_fence[3:0],5'b0};
//                  ib_hn_bkpta_bypass[8:0]      = {ib_hn_bkpta[3:0],5'b0};
//                  ib_hn_bkptb_bypass[8:0]      = {ib_hn_bkptb[3:0],5'b0};
//                  ib_hn_no_spec_bypass[8:0]    = {ib_hn_no_spec[3:0],5'b0};
//                  ib_hn_32_start_bypass[8:0]   = {ib_hn_32_start[3:0],5'b0};
//                  ib_h0_data_bypass[15:0]      = ib_h5_data[15:0];
//                  ib_h1_data_bypass[15:0]      = ib_h6_data[15:0];
//                  ib_h2_data_bypass[15:0]      = ib_h7_data[15:0];
//                  ib_h3_data_bypass[15:0]      = ib_h8_data[15:0];
//                  ib_h4_data_bypass[15:0]      = 16'b0;
//                  ib_h0_pc_bypass[14:0]        = ib_h5_pc[14:0];
//                  ib_h1_pc_bypass[14:0]        = ib_h6_pc[14:0];
//                  ib_h2_pc_bypass[14:0]        = ib_h7_pc[14:0];
//                  ib_h3_pc_bypass[14:0]        = ib_h8_pc[14:0];
//                  ib_h4_pc_bypass[14:0]        = 15'b0;
//                  ib_h0_vlmul_bypass[1:0]      = ib_h5_vlmul[1:0];
//                  ib_h1_vlmul_bypass[1:0]      = ib_h6_vlmul[1:0];
//                  ib_h2_vlmul_bypass[1:0]      = ib_h7_vlmul[1:0];
//                  ib_h3_vlmul_bypass[1:0]      = ib_h8_vlmul[1:0];
//                  ib_h4_vlmul_bypass[1:0]      = 2'b0;
//                  ib_h0_vsew_bypass[2:0]       = ib_h5_vsew[2:0];
//                  ib_h1_vsew_bypass[2:0]       = ib_h6_vsew[2:0];
//                  ib_h2_vsew_bypass[2:0]       = ib_h7_vsew[2:0];
//                  ib_h3_vsew_bypass[2:0]       = ib_h8_vsew[2:0];
//                  ib_h4_vsew_bypass[2:0]       = 3'b0;
                  end
       5'b1?00? : begin
                  bypass_way_inst0_valid       = bypass_way_h0_vld;
                  bypass_way_inst0_data[31:0]  = {bypass_way_h1_data[15:0],bypass_way_h0_data[15:0]};
                  bypass_way_inst0_pc[14:0]    = bypass_way_h0_pc[14:0];                  
                  bypass_way_inst0_expt        = bypass_way_h0_expt;
                  bypass_way_inst0_vec[3:0]    = bypass_way_h0_vec[3:0];
                  bypass_way_inst0_high_expt   = bypass_way_h0_high_expt;
                  bypass_way_inst0_ecc_err     = bypass_way_h0_ecc_err;
                  bypass_way_inst0_split1      = bypass_way_h0_split1;
                  bypass_way_inst0_split0      = bypass_way_h0_split0;
                  bypass_way_inst0_fence       = bypass_way_h0_fence;
                  bypass_way_inst0_bkpta       = bypass_way_h0_bkpta;
                  bypass_way_inst0_bkptb       = bypass_way_h0_bkptb;
                  bypass_way_inst0_no_spec     = bypass_way_h0_no_spec;
                  bypass_way_inst0_vl_pred     = bypass_way_h0_vl_pred;
                  bypass_way_inst0_32_start    = bypass_way_h0_32_start;
                  bypass_way_inst0_vlmul[1:0]  = bypass_way_h0_vlmul[1:0];
                  bypass_way_inst0_vsew[2:0]   = bypass_way_h0_vsew[2:0];
                  bypass_way_inst0_vl[7:0]     = bypass_way_h0_vl[7:0];
                  bypass_way_inst1_valid       = bypass_way_h2_vld;
                  bypass_way_inst1_data[31:0]  = {16'b0,bypass_way_h2_data[15:0]};
                  bypass_way_inst1_pc[14:0]    = bypass_way_h2_pc[14:0];                  
                  bypass_way_inst1_expt        = bypass_way_h2_expt;
                  bypass_way_inst1_vec[3:0]    = bypass_way_h2_vec[3:0];
                  bypass_way_inst1_high_expt   = bypass_way_h2_high_expt;
                  bypass_way_inst1_ecc_err     = bypass_way_h2_ecc_err;
                  bypass_way_inst1_split1      = bypass_way_h2_split1;
                  bypass_way_inst1_split0      = bypass_way_h2_split0;
                  bypass_way_inst1_fence       = bypass_way_h2_fence;
                  bypass_way_inst1_bkpta       = bypass_way_h2_bkpta;
                  bypass_way_inst1_bkptb       = bypass_way_h2_bkptb;
                  bypass_way_inst1_no_spec     = bypass_way_h2_no_spec;
                  bypass_way_inst1_vl_pred     = bypass_way_h2_vl_pred;
                  bypass_way_inst1_32_start    = bypass_way_h2_32_start;
                  bypass_way_inst1_vlmul[1:0]  = bypass_way_h2_vlmul[1:0];
                  bypass_way_inst1_vsew[2:0]   = bypass_way_h2_vsew[2:0];
                  bypass_way_inst1_vl[7:0]     = bypass_way_h2_vl[7:0];
                  bypass_way_inst2_valid       = bypass_way_h3_vld;
                  bypass_way_inst2_data[31:0]  = {16'b0,bypass_way_h3_data[15:0]};
                  bypass_way_inst2_pc[14:0]    = bypass_way_h3_pc[14:0];                  
                  bypass_way_inst2_expt        = bypass_way_h3_expt;
                  bypass_way_inst2_vec[3:0]    = bypass_way_h3_vec[3:0];
                  bypass_way_inst2_high_expt   = bypass_way_h3_high_expt;
                  bypass_way_inst2_ecc_err     = bypass_way_h3_ecc_err;
                  bypass_way_inst2_split1      = bypass_way_h3_split1;
                  bypass_way_inst2_split0      = bypass_way_h3_split0;
                  bypass_way_inst2_fence       = bypass_way_h3_fence;
                  bypass_way_inst2_bkpta       = bypass_way_h3_bkpta;
                  bypass_way_inst2_bkptb       = bypass_way_h3_bkptb;
                  bypass_way_inst2_no_spec     = bypass_way_h3_no_spec;
                  bypass_way_inst2_vl_pred     = bypass_way_h3_vl_pred;
                  bypass_way_inst2_vlmul[1:0]  = bypass_way_h3_vlmul[1:0];
                  bypass_way_inst2_vsew[2:0]   = bypass_way_h3_vsew[2:0];
                  bypass_way_inst2_vl[7:0]     = bypass_way_h3_vl[7:0];
                  bypass_way_half_num[2:0]     = 3'b100;
                  ib_hn_create_vld_bypass[8:0] = {4'b0,ib_hn_create_vld[4:0]};
//                  ib_hn_create_vld_bypass[8:0] = {ib_hn_create_vld[4:0],4'b0};                
//                  ib_hn_ldst_bypass[8:0]       = {ib_hn_ldst[4:0],4'b0};                  
//                  ib_hn_acc_err_bypass[8:0]    = {ib_hn_acc_err[4:0],4'b0};
//                  ib_hn_pgflt_bypass[8:0]      = {ib_hn_pgflt[4:0],4'b0};
//                  ib_hn_high_expt_bypass[8:0]  = {ib_hn_high_expt[4:0],4'b0};
//                  ib_hn_ecc_err_bypass[8:0]    = {ib_hn_ecc_err[4:0],4'b0};
//                  ib_hn_split1_bypass[8:0]     = {ib_hn_split1[4:0],4'b0};
//                  ib_hn_split0_bypass[8:0]     = {ib_hn_split0[4:0],4'b0};
//                  ib_hn_fence_bypass[8:0]      = {ib_hn_fence[4:0],4'b0};
//                  ib_hn_bkpta_bypass[8:0]      = {ib_hn_bkpta[4:0],4'b0};
//                  ib_hn_bkptb_bypass[8:0]      = {ib_hn_bkptb[4:0],4'b0};
//                  ib_hn_no_spec_bypass[8:0]    = {ib_hn_no_spec[4:0],4'b0};
//                  ib_hn_32_start_bypass[8:0]   = {ib_hn_32_start[4:0],4'b0};
//                  ib_h0_data_bypass[15:0]      = ib_h4_data[15:0];
//                  ib_h1_data_bypass[15:0]      = ib_h5_data[15:0];
//                  ib_h2_data_bypass[15:0]      = ib_h6_data[15:0];
//                  ib_h3_data_bypass[15:0]      = ib_h7_data[15:0];
//                  ib_h4_data_bypass[15:0]      = ib_h8_data[15:0];
//                  ib_h0_pc_bypass[14:0]        = ib_h4_pc[14:0];
//                  ib_h1_pc_bypass[14:0]        = ib_h5_pc[14:0];
//                  ib_h2_pc_bypass[14:0]        = ib_h6_pc[14:0];
//                  ib_h3_pc_bypass[14:0]        = ib_h7_pc[14:0];
//                  ib_h4_pc_bypass[14:0]        = ib_h8_pc[14:0];
//                  ib_h0_vlmul_bypass[1:0]      = ib_h4_vlmul[1:0];
//                  ib_h1_vlmul_bypass[1:0]      = ib_h5_vlmul[1:0];
//                  ib_h2_vlmul_bypass[1:0]      = ib_h6_vlmul[1:0];
//                  ib_h3_vlmul_bypass[1:0]      = ib_h7_vlmul[1:0];
//                  ib_h4_vlmul_bypass[1:0]      = ib_h8_vlmul[1:0];
//                  ib_h0_vsew_bypass[2:0]       = ib_h4_vsew[2:0];
//                  ib_h1_vsew_bypass[2:0]       = ib_h5_vsew[2:0];
//                  ib_h2_vsew_bypass[2:0]       = ib_h6_vsew[2:0];
//                  ib_h3_vsew_bypass[2:0]       = ib_h7_vsew[2:0];
//                  ib_h4_vsew_bypass[2:0]       = ib_h8_vsew[2:0];
                  end
       5'b1?01? : begin
                  bypass_way_inst0_valid       = bypass_way_h0_vld;
                  bypass_way_inst0_data[31:0]  = {bypass_way_h1_data[15:0],bypass_way_h0_data[15:0]};
                  bypass_way_inst0_pc[14:0]    = bypass_way_h0_pc[14:0];                  
                  bypass_way_inst0_expt        = bypass_way_h0_expt;
                  bypass_way_inst0_vec[3:0]    = bypass_way_h0_vec[3:0];
                  bypass_way_inst0_high_expt   = bypass_way_h0_high_expt;
                  bypass_way_inst0_ecc_err     = bypass_way_h0_ecc_err;
                  bypass_way_inst0_split1      = bypass_way_h0_split1;
                  bypass_way_inst0_split0      = bypass_way_h0_split0;
                  bypass_way_inst0_fence       = bypass_way_h0_fence;
                  bypass_way_inst0_bkpta       = bypass_way_h0_bkpta;
                  bypass_way_inst0_bkptb       = bypass_way_h0_bkptb;
                  bypass_way_inst0_no_spec     = bypass_way_h0_no_spec;
                  bypass_way_inst0_vl_pred     = bypass_way_h0_vl_pred;
                  bypass_way_inst0_32_start    = bypass_way_h0_32_start;
                  bypass_way_inst0_vlmul[1:0]  = bypass_way_h0_vlmul[1:0];
                  bypass_way_inst0_vsew[2:0]   = bypass_way_h0_vsew[2:0];
                  bypass_way_inst0_vl[7:0]     = bypass_way_h0_vl[7:0];
                  bypass_way_inst1_valid       = bypass_way_h2_vld;
                  bypass_way_inst1_data[31:0]  = {16'b0,bypass_way_h2_data[15:0]};
                  bypass_way_inst1_pc[14:0]    = bypass_way_h2_pc[14:0];                  
                  bypass_way_inst1_expt        = bypass_way_h2_expt;
                  bypass_way_inst1_vec[3:0]    = bypass_way_h2_vec[3:0];
                  bypass_way_inst1_high_expt   = bypass_way_h2_high_expt;
                  bypass_way_inst1_ecc_err     = bypass_way_h2_ecc_err;
                  bypass_way_inst1_split1      = bypass_way_h2_split1;
                  bypass_way_inst1_split0      = bypass_way_h2_split0;
                  bypass_way_inst1_fence       = bypass_way_h2_fence;
                  bypass_way_inst1_bkpta       = bypass_way_h2_bkpta;
                  bypass_way_inst1_bkptb       = bypass_way_h2_bkptb;
                  bypass_way_inst1_no_spec     = bypass_way_h2_no_spec;
                  bypass_way_inst1_vl_pred     = bypass_way_h2_vl_pred;
                  bypass_way_inst1_32_start    = bypass_way_h2_32_start;
                  bypass_way_inst1_vlmul[1:0]  = bypass_way_h2_vlmul[1:0];
                  bypass_way_inst1_vsew[2:0]   = bypass_way_h2_vsew[2:0];
                  bypass_way_inst1_vl[7:0]     = bypass_way_h2_vl[7:0];
                  bypass_way_inst2_valid       = bypass_way_h3_vld;
                  bypass_way_inst2_data[31:0]  = {bypass_way_h4_data[15:0],bypass_way_h3_data[15:0]};
                  bypass_way_inst2_pc[14:0]    = bypass_way_h3_pc[14:0];                  
                  bypass_way_inst2_expt        = bypass_way_h3_expt;
                  bypass_way_inst2_vec[3:0]    = bypass_way_h3_vec[3:0];
                  bypass_way_inst2_high_expt   = bypass_way_h3_high_expt;
                  bypass_way_inst2_ecc_err     = bypass_way_h3_ecc_err;
                  bypass_way_inst2_split1      = bypass_way_h3_split1;
                  bypass_way_inst2_split0      = bypass_way_h3_split0;
                  bypass_way_inst2_fence       = bypass_way_h3_fence;
                  bypass_way_inst2_bkpta       = bypass_way_h3_bkpta;
                  bypass_way_inst2_bkptb       = bypass_way_h3_bkptb;
                  bypass_way_inst2_no_spec     = bypass_way_h3_no_spec;
                  bypass_way_inst2_vl_pred     = bypass_way_h3_vl_pred;
                  bypass_way_inst2_vlmul[1:0]  = bypass_way_h3_vlmul[1:0];
                  bypass_way_inst2_vsew[2:0]   = bypass_way_h3_vsew[2:0];
                  bypass_way_inst2_vl[7:0]     = bypass_way_h3_vl[7:0];
                  bypass_way_half_num[2:0]     = 3'b101;
                  ib_hn_create_vld_bypass[8:0] = {5'b0,ib_hn_create_vld[3:0]};
//                  ib_hn_create_vld_bypass[8:0] = {ib_hn_create_vld[3:0],5'b0};
//                  ib_hn_ldst_bypass[8:0]       = {ib_hn_ldst[3:0],5'b0};                  
//                  ib_hn_acc_err_bypass[8:0]    = {ib_hn_acc_err[3:0],5'b0};
//                  ib_hn_pgflt_bypass[8:0]      = {ib_hn_pgflt[3:0],5'b0};
//                  ib_hn_high_expt_bypass[8:0]  = {ib_hn_high_expt[3:0],5'b0};
//                  ib_hn_ecc_err_bypass[8:0]    = {ib_hn_ecc_err[3:0],5'b0};
//                  ib_hn_split1_bypass[8:0]     = {ib_hn_split1[3:0],5'b0};
//                  ib_hn_split0_bypass[8:0]     = {ib_hn_split0[3:0],5'b0};
//                  ib_hn_fence_bypass[8:0]      = {ib_hn_fence[3:0],5'b0};
//                  ib_hn_bkpta_bypass[8:0]      = {ib_hn_bkpta[3:0],5'b0};
//                  ib_hn_bkptb_bypass[8:0]      = {ib_hn_bkptb[3:0],5'b0};
//                  ib_hn_no_spec_bypass[8:0]    = {ib_hn_no_spec[3:0],5'b0};
//                  ib_hn_32_start_bypass[8:0]   = {ib_hn_32_start[3:0],5'b0};
//                  ib_h0_data_bypass[15:0]      = ib_h5_data[15:0];
//                  ib_h1_data_bypass[15:0]      = ib_h6_data[15:0];
//                  ib_h2_data_bypass[15:0]      = ib_h7_data[15:0];
//                  ib_h3_data_bypass[15:0]      = ib_h8_data[15:0];
//                  ib_h4_data_bypass[15:0]      = 16'b0;
//                  ib_h0_pc_bypass[14:0]        = ib_h5_pc[14:0];
//                  ib_h1_pc_bypass[14:0]        = ib_h6_pc[14:0];
//                  ib_h2_pc_bypass[14:0]        = ib_h7_pc[14:0];
//                  ib_h3_pc_bypass[14:0]        = ib_h8_pc[14:0];
//                  ib_h4_pc_bypass[14:0]        = 15'b0;
//                  ib_h0_vlmul_bypass[1:0]      = ib_h5_vlmul[1:0];
//                  ib_h1_vlmul_bypass[1:0]      = ib_h6_vlmul[1:0];
//                  ib_h2_vlmul_bypass[1:0]      = ib_h7_vlmul[1:0];
//                  ib_h3_vlmul_bypass[1:0]      = ib_h8_vlmul[1:0];
//                  ib_h4_vlmul_bypass[1:0]      = 2'b0;
//                  ib_h0_vsew_bypass[2:0]       = ib_h5_vsew[2:0];
//                  ib_h1_vsew_bypass[2:0]       = ib_h6_vsew[2:0];
//                  ib_h2_vsew_bypass[2:0]       = ib_h7_vsew[2:0];
//                  ib_h3_vsew_bypass[2:0]       = ib_h8_vsew[2:0];
//                  ib_h4_vsew_bypass[2:0]       = 3'b0;
                  end
       5'b1?1?0 : begin
                  bypass_way_inst0_valid       = bypass_way_h0_vld;
                  bypass_way_inst0_data[31:0]  = {bypass_way_h1_data[15:0],bypass_way_h0_data[15:0]};
                  bypass_way_inst0_pc[14:0]    = bypass_way_h0_pc[14:0];                  
                  bypass_way_inst0_expt        = bypass_way_h0_expt;
                  bypass_way_inst0_vec[3:0]    = bypass_way_h0_vec[3:0];
                  bypass_way_inst0_high_expt   = bypass_way_h0_high_expt;
                  bypass_way_inst0_ecc_err     = bypass_way_h0_ecc_err;
                  bypass_way_inst0_split1      = bypass_way_h0_split1;
                  bypass_way_inst0_split0      = bypass_way_h0_split0;
                  bypass_way_inst0_fence       = bypass_way_h0_fence;
                  bypass_way_inst0_bkpta       = bypass_way_h0_bkpta;
                  bypass_way_inst0_bkptb       = bypass_way_h0_bkptb;
                  bypass_way_inst0_no_spec     = bypass_way_h0_no_spec;
                  bypass_way_inst0_vl_pred     = bypass_way_h0_vl_pred;
                  bypass_way_inst0_32_start    = bypass_way_h0_32_start;
                  bypass_way_inst0_vlmul[1:0]  = bypass_way_h0_vlmul[1:0];
                  bypass_way_inst0_vsew[2:0]   = bypass_way_h0_vsew[2:0];
                  bypass_way_inst0_vl[7:0]     = bypass_way_h0_vl[7:0];
                  bypass_way_inst1_valid       = bypass_way_h2_vld;
                  bypass_way_inst1_data[31:0]  = {bypass_way_h3_data[15:0],bypass_way_h2_data[15:0]};
                  bypass_way_inst1_pc[14:0]    = bypass_way_h2_pc[14:0];                  
                  bypass_way_inst1_expt        = bypass_way_h2_expt;
                  bypass_way_inst1_vec[3:0]    = bypass_way_h2_vec[3:0];
                  bypass_way_inst1_high_expt   = bypass_way_h2_high_expt;
                  bypass_way_inst1_ecc_err     = bypass_way_h2_ecc_err;
                  bypass_way_inst1_split1      = bypass_way_h2_split1;
                  bypass_way_inst1_split0      = bypass_way_h2_split0;
                  bypass_way_inst1_fence       = bypass_way_h2_fence;
                  bypass_way_inst1_bkpta       = bypass_way_h2_bkpta;
                  bypass_way_inst1_bkptb       = bypass_way_h2_bkptb;
                  bypass_way_inst1_no_spec     = bypass_way_h2_no_spec;
                  bypass_way_inst1_vl_pred     = bypass_way_h2_vl_pred;
                  bypass_way_inst1_32_start    = bypass_way_h2_32_start;
                  bypass_way_inst1_vlmul[1:0]  = bypass_way_h2_vlmul[1:0];
                  bypass_way_inst1_vsew[2:0]   = bypass_way_h2_vsew[2:0];
                  bypass_way_inst1_vl[7:0]     = bypass_way_h2_vl[7:0];
                  bypass_way_inst2_valid       = bypass_way_h4_vld;
                  bypass_way_inst2_data[31:0]  = {16'b0,bypass_way_h4_data[15:0]};
                  bypass_way_inst2_pc[14:0]    = bypass_way_h4_pc[14:0];                  
                  bypass_way_inst2_expt        = bypass_way_h4_expt;
                  bypass_way_inst2_vec[3:0]    = bypass_way_h4_vec[3:0];
                  bypass_way_inst2_high_expt   = bypass_way_h4_high_expt;
                  bypass_way_inst2_ecc_err     = bypass_way_h4_ecc_err;
                  bypass_way_inst2_split1      = bypass_way_h4_split1;
                  bypass_way_inst2_split0      = bypass_way_h4_split0;
                  bypass_way_inst2_fence       = bypass_way_h4_fence;
                  bypass_way_inst2_bkpta       = bypass_way_h4_bkpta;
                  bypass_way_inst2_bkptb       = bypass_way_h4_bkptb;
                  bypass_way_inst2_no_spec     = bypass_way_h4_no_spec;
                  bypass_way_inst2_vl_pred     = bypass_way_h4_vl_pred;
                  bypass_way_inst2_vlmul[1:0]  = bypass_way_h4_vlmul[1:0];
                  bypass_way_inst2_vsew[2:0]   = bypass_way_h4_vsew[2:0];
                  bypass_way_inst2_vl[7:0]     = bypass_way_h4_vl[7:0];
                  bypass_way_half_num[2:0]     = 3'b101;
                  ib_hn_create_vld_bypass[8:0] = {5'b0,ib_hn_create_vld[3:0]};
//                  ib_hn_create_vld_bypass[8:0] = {ib_hn_create_vld[3:0],5'b0};
//                  ib_hn_ldst_bypass[8:0]       = {ib_hn_ldst[3:0],5'b0};                  
//                  ib_hn_acc_err_bypass[8:0]    = {ib_hn_acc_err[3:0],5'b0};
//                  ib_hn_pgflt_bypass[8:0]      = {ib_hn_pgflt[3:0],5'b0};
//                  ib_hn_high_expt_bypass[8:0]  = {ib_hn_high_expt[3:0],5'b0};
//                  ib_hn_ecc_err_bypass[8:0]    = {ib_hn_ecc_err[3:0],5'b0};
//                  ib_hn_split1_bypass[8:0]     = {ib_hn_split1[3:0],5'b0};
//                  ib_hn_split0_bypass[8:0]     = {ib_hn_split0[3:0],5'b0};
//                  ib_hn_fence_bypass[8:0]      = {ib_hn_fence[3:0],5'b0};
//                  ib_hn_bkpta_bypass[8:0]      = {ib_hn_bkpta[3:0],5'b0};
//                  ib_hn_bkptb_bypass[8:0]      = {ib_hn_bkptb[3:0],5'b0};
//                  ib_hn_no_spec_bypass[8:0]    = {ib_hn_no_spec[3:0],5'b0};
//                  ib_hn_32_start_bypass[8:0]   = {ib_hn_32_start[3:0],5'b0};
//                  ib_h0_data_bypass[15:0]      = ib_h5_data[15:0];
//                  ib_h1_data_bypass[15:0]      = ib_h6_data[15:0];
//                  ib_h2_data_bypass[15:0]      = ib_h7_data[15:0];
//                  ib_h3_data_bypass[15:0]      = ib_h8_data[15:0];
//                  ib_h4_data_bypass[15:0]      = 16'b0;
//                  ib_h0_pc_bypass[14:0]        = ib_h5_pc[14:0];
//                  ib_h1_pc_bypass[14:0]        = ib_h6_pc[14:0];
//                  ib_h2_pc_bypass[14:0]        = ib_h7_pc[14:0];
//                  ib_h3_pc_bypass[14:0]        = ib_h8_pc[14:0];
//                  ib_h4_pc_bypass[14:0]        = 15'b0;
//                  ib_h0_vlmul_bypass[1:0]      = ib_h5_vlmul[1:0];
//                  ib_h1_vlmul_bypass[1:0]      = ib_h6_vlmul[1:0];
//                  ib_h2_vlmul_bypass[1:0]      = ib_h7_vlmul[1:0];
//                  ib_h3_vlmul_bypass[1:0]      = ib_h8_vlmul[1:0];
//                  ib_h4_vlmul_bypass[1:0]      = 2'b0;
//                  ib_h0_vsew_bypass[2:0]       = ib_h5_vsew[2:0];
//                  ib_h1_vsew_bypass[2:0]       = ib_h6_vsew[2:0];
//                  ib_h2_vsew_bypass[2:0]       = ib_h7_vsew[2:0];
//                  ib_h3_vsew_bypass[2:0]       = ib_h8_vsew[2:0];
//                  ib_h4_vsew_bypass[2:0]       = 3'b0;
                  end
       default  : begin //1?1?1
                  bypass_way_inst0_valid       = bypass_way_h0_vld;
                  bypass_way_inst0_data[31:0]  = {bypass_way_h1_data[15:0],bypass_way_h0_data[15:0]};
                  bypass_way_inst0_pc[14:0]    = bypass_way_h0_pc[14:0];                  
                  bypass_way_inst0_expt        = bypass_way_h0_expt;
                  bypass_way_inst0_vec[3:0]    = bypass_way_h0_vec[3:0];
                  bypass_way_inst0_high_expt   = bypass_way_h0_high_expt;
                  bypass_way_inst0_ecc_err     = bypass_way_h0_ecc_err;
                  bypass_way_inst0_split1      = bypass_way_h0_split1;
                  bypass_way_inst0_split0      = bypass_way_h0_split0;
                  bypass_way_inst0_fence       = bypass_way_h0_fence;
                  bypass_way_inst0_bkpta       = bypass_way_h0_bkpta;
                  bypass_way_inst0_bkptb       = bypass_way_h0_bkptb;
                  bypass_way_inst0_no_spec     = bypass_way_h0_no_spec;
                  bypass_way_inst0_vl_pred     = bypass_way_h0_vl_pred;
                  bypass_way_inst0_32_start    = bypass_way_h0_32_start;
                  bypass_way_inst0_vlmul[1:0]  = bypass_way_h0_vlmul[1:0];
                  bypass_way_inst0_vsew[2:0]   = bypass_way_h0_vsew[2:0];
                  bypass_way_inst0_vl[7:0]     = bypass_way_h0_vl[7:0];
                  bypass_way_inst1_valid       = bypass_way_h2_vld;
                  bypass_way_inst1_data[31:0]  = {bypass_way_h3_data[15:0],bypass_way_h2_data[15:0]};
                  bypass_way_inst1_pc[14:0]    = bypass_way_h2_pc[14:0];                  
                  bypass_way_inst1_expt        = bypass_way_h2_expt;
                  bypass_way_inst1_vec[3:0]    = bypass_way_h2_vec[3:0];
                  bypass_way_inst1_high_expt   = bypass_way_h2_high_expt;
                  bypass_way_inst1_ecc_err     = bypass_way_h2_ecc_err;
                  bypass_way_inst1_split1      = bypass_way_h2_split1;
                  bypass_way_inst1_split0      = bypass_way_h2_split0;
                  bypass_way_inst1_fence       = bypass_way_h2_fence;
                  bypass_way_inst1_bkpta       = bypass_way_h2_bkpta;
                  bypass_way_inst1_bkptb       = bypass_way_h2_bkptb;
                  bypass_way_inst1_no_spec     = bypass_way_h2_no_spec;
                  bypass_way_inst1_vl_pred     = bypass_way_h2_vl_pred;
                  bypass_way_inst1_32_start    = bypass_way_h2_32_start;
                  bypass_way_inst1_vlmul[1:0]  = bypass_way_h2_vlmul[1:0];
                  bypass_way_inst1_vsew[2:0]   = bypass_way_h2_vsew[2:0];
                  bypass_way_inst1_vl[7:0]     = bypass_way_h2_vl[7:0];
                  bypass_way_inst2_valid       = bypass_way_h4_vld;
                  bypass_way_inst2_data[31:0]  = {bypass_way_h5_data[15:0],bypass_way_h4_data[15:0]};
                  bypass_way_inst2_pc[14:0]    = bypass_way_h4_pc[14:0];                  
                  bypass_way_inst2_expt        = bypass_way_h4_expt;
                  bypass_way_inst2_vec[3:0]    = bypass_way_h4_vec[3:0];
                  bypass_way_inst2_high_expt   = bypass_way_h4_high_expt;
                  bypass_way_inst2_ecc_err     = bypass_way_h4_ecc_err;
                  bypass_way_inst2_split1      = bypass_way_h4_split1;
                  bypass_way_inst2_split0      = bypass_way_h4_split0;
                  bypass_way_inst2_fence       = bypass_way_h4_fence;
                  bypass_way_inst2_bkpta       = bypass_way_h4_bkpta;
                  bypass_way_inst2_bkptb       = bypass_way_h4_bkptb;
                  bypass_way_inst2_no_spec     = bypass_way_h4_no_spec;
                  bypass_way_inst2_vl_pred     = bypass_way_h4_vl_pred;
                  bypass_way_inst2_vlmul[1:0]  = bypass_way_h4_vlmul[1:0];
                  bypass_way_inst2_vsew[2:0]   = bypass_way_h4_vsew[2:0];
                  bypass_way_inst2_vl[7:0]     = bypass_way_h4_vl[7:0];
                  bypass_way_half_num[2:0]     = 3'b110;
                  ib_hn_create_vld_bypass[8:0] = {6'b0,ib_hn_create_vld[2:0]};
//                  ib_hn_create_vld_bypass[8:0] = {ib_hn_create_vld[2:0],6'b0};
//                  ib_hn_ldst_bypass[8:0]       = {ib_hn_ldst[2:0],6'b0};                  
//                  ib_hn_acc_err_bypass[8:0]    = {ib_hn_acc_err[2:0],6'b0};
//                  ib_hn_pgflt_bypass[8:0]      = {ib_hn_pgflt[2:0],6'b0};
//                  ib_hn_high_expt_bypass[8:0]  = {ib_hn_high_expt[2:0],6'b0};
//                  ib_hn_ecc_err_bypass[8:0]    = {ib_hn_ecc_err[2:0],6'b0};
//                  ib_hn_split1_bypass[8:0]     = {ib_hn_split1[2:0],6'b0};
//                  ib_hn_split0_bypass[8:0]     = {ib_hn_split0[2:0],6'b0};
//                  ib_hn_fence_bypass[8:0]      = {ib_hn_fence[2:0],6'b0};
//                  ib_hn_bkpta_bypass[8:0]      = {ib_hn_bkpta[2:0],6'b0};
//                  ib_hn_bkptb_bypass[8:0]      = {ib_hn_bkptb[2:0],6'b0};
//                  ib_hn_no_spec_bypass[8:0]    = {ib_hn_no_spec[2:0],6'b0};
//                  ib_hn_32_start_bypass[8:0]   = {ib_hn_32_start[2:0],6'b0};
//                  ib_h0_data_bypass[15:0]      = ib_h6_data[15:0];
//                  ib_h1_data_bypass[15:0]      = ib_h7_data[15:0];
//                  ib_h2_data_bypass[15:0]      = ib_h8_data[15:0];
//                  ib_h3_data_bypass[15:0]      = 16'b0;
//                  ib_h4_data_bypass[15:0]      = 16'b0;
//                  ib_h0_pc_bypass[14:0]        = ib_h6_pc[14:0];
//                  ib_h1_pc_bypass[14:0]        = ib_h7_pc[14:0];
//                  ib_h2_pc_bypass[14:0]        = ib_h8_pc[14:0];
//                  ib_h3_pc_bypass[14:0]        = 15'b0;
//                  ib_h4_pc_bypass[14:0]        = 15'b0;
//                  ib_h0_vlmul_bypass[1:0]      = ib_h6_vlmul[1:0];
//                  ib_h1_vlmul_bypass[1:0]      = ib_h7_vlmul[1:0];
//                  ib_h2_vlmul_bypass[1:0]      = ib_h8_vlmul[1:0];
//                  ib_h3_vlmul_bypass[1:0]      = 2'b0;
//                  ib_h4_vlmul_bypass[1:0]      = 2'b0;
//                  ib_h0_vsew_bypass[2:0]       = ib_h6_vsew[2:0];
//                  ib_h1_vsew_bypass[2:0]       = ib_h7_vsew[2:0];
//                  ib_h2_vsew_bypass[2:0]       = ib_h8_vsew[2:0];
//                  ib_h3_vsew_bypass[2:0]       = 3'b0;
//                  ib_h4_vsew_bypass[2:0]       = 3'b0;
                  end
endcase
// &CombEnd; @5222
end

//==========================================================
//               IB_ID Merge Inst Logic
//==========================================================
assign merge_way_inst0_sel        = !ibuf_pop_inst1_valid;
assign merge_way_inst0_valid      = bypass_way_inst0_valid && ibctrl_ibuf_merge_vld;
assign merge_way_inst0[31:0]      = bypass_way_inst0_data[31:0];
assign merge_way_inst0_pc[14:0]   = bypass_way_inst0_pc[14:0];
assign merge_way_inst0_expt       = bypass_way_inst0_expt;
assign merge_way_inst0_vec[3:0]   = bypass_way_inst0_vec[3:0];
assign merge_way_inst0_high_expt  = bypass_way_inst0_high_expt;
assign merge_way_inst0_ecc_err    = bypass_way_inst0_ecc_err;
assign merge_way_inst0_split1     = bypass_way_inst0_split1;
assign merge_way_inst0_split0     = bypass_way_inst0_split0;
assign merge_way_inst0_fence      = bypass_way_inst0_fence;
assign merge_way_inst0_bkpta      = bypass_way_inst0_bkpta;
assign merge_way_inst0_bkptb      = bypass_way_inst0_bkptb;
assign merge_way_inst0_no_spec    = bypass_way_inst0_no_spec;
assign merge_way_inst0_vl_pred    = bypass_way_inst0_vl_pred;
assign merge_way_inst0_vlmul[1:0] = bypass_way_inst0_vlmul[1:0];
assign merge_way_inst0_vsew[2:0]  = bypass_way_inst0_vsew[2:0];
assign merge_way_inst0_vl[7:0]    = bypass_way_inst0_vl[7:0];

assign merge_way_inst1_sel        = !ibuf_pop_inst1_valid || !ibuf_pop_inst2_valid;
assign merge_way_inst1_valid      = (ibuf_pop_inst1_valid) ? bypass_way_inst0_valid && ibctrl_ibuf_merge_vld
                                                           : bypass_way_inst1_valid && ibctrl_ibuf_merge_vld;
assign merge_way_inst1[31:0]      = (ibuf_pop_inst1_valid) ? bypass_way_inst0_data[31:0]: bypass_way_inst1_data[31:0];
assign merge_way_inst1_pc[14:0]   = (ibuf_pop_inst1_valid) ? bypass_way_inst0_pc[14:0]  : bypass_way_inst1_pc[14:0];
assign merge_way_inst1_expt       = (ibuf_pop_inst1_valid) ? bypass_way_inst0_expt      : bypass_way_inst1_expt;
assign merge_way_inst1_vec[3:0]   = (ibuf_pop_inst1_valid) ? bypass_way_inst0_vec[3:0]  : bypass_way_inst1_vec[3:0];
assign merge_way_inst1_high_expt  = (ibuf_pop_inst1_valid) ? bypass_way_inst0_high_expt : bypass_way_inst1_high_expt;
assign merge_way_inst1_ecc_err    = (ibuf_pop_inst1_valid) ? bypass_way_inst0_ecc_err   : bypass_way_inst1_ecc_err;
assign merge_way_inst1_split1     = (ibuf_pop_inst1_valid) ? bypass_way_inst0_split1    : bypass_way_inst1_split1;
assign merge_way_inst1_split0     = (ibuf_pop_inst1_valid) ? bypass_way_inst0_split0    : bypass_way_inst1_split0;
assign merge_way_inst1_fence      = (ibuf_pop_inst1_valid) ? bypass_way_inst0_fence     : bypass_way_inst1_fence;
assign merge_way_inst1_bkpta      = (ibuf_pop_inst1_valid) ? bypass_way_inst0_bkpta     : bypass_way_inst1_bkpta;
assign merge_way_inst1_bkptb      = (ibuf_pop_inst1_valid) ? bypass_way_inst0_bkptb     : bypass_way_inst1_bkptb;
assign merge_way_inst1_no_spec    = (ibuf_pop_inst1_valid) ? bypass_way_inst0_no_spec   : bypass_way_inst1_no_spec;
assign merge_way_inst1_vl_pred    = (ibuf_pop_inst1_valid) ? bypass_way_inst0_vl_pred : bypass_way_inst1_vl_pred;
assign merge_way_inst1_vlmul[1:0] = (ibuf_pop_inst1_valid) ? bypass_way_inst0_vlmul[1:0]: bypass_way_inst1_vlmul[1:0];
assign merge_way_inst1_vsew[2:0]  = (ibuf_pop_inst1_valid) ? bypass_way_inst0_vsew[2:0] : bypass_way_inst1_vsew[2:0];
assign merge_way_inst1_vl[7:0]    = (ibuf_pop_inst1_valid) ? bypass_way_inst0_vl[7:0]   : bypass_way_inst1_vl[7:0];

// &CombBeg; @5266
always @( bypass_way_inst1_32_start
       or bypass_way_inst1_valid
       or bypass_way_inst0_32_start
       or ibuf_pop_inst1_valid)
begin
casez({ibuf_pop_inst1_valid,bypass_way_inst0_32_start,bypass_way_inst1_valid,bypass_way_inst1_32_start})
   4'b10?? : merge_way_inst1_num[4:0] = 5'b00001;
   4'b11?? : merge_way_inst1_num[4:0] = 5'b00010;
   4'b000? : merge_way_inst1_num[4:0] = 5'b00001;
   4'b0010 : merge_way_inst1_num[4:0] = 5'b00010;
   4'b0011 : merge_way_inst1_num[4:0] = 5'b00011;
   4'b010? : merge_way_inst1_num[4:0] = 5'b00010;
   4'b0110 : merge_way_inst1_num[4:0] = 5'b00011;
   4'b0111 : merge_way_inst1_num[4:0] = 5'b00100;
   default : merge_way_inst1_num[4:0] = 5'b00000;
 endcase
// &CombEnd; @5278
end

// &CombBeg; @5280
always @( bypass_way_inst1_32_start
       or ibuf_create_pointer2[31:0]
       or bypass_way_inst1_valid
       or ibuf_create_pointer0[31:0]
       or ibuf_create_pointer4[31:0]
       or bypass_way_inst0_32_start
       or ibuf_pop_inst1_valid
       or ibuf_create_pointer3[31:0]
       or ibuf_create_pointer1[31:0])
begin
casez({ibuf_pop_inst1_valid,bypass_way_inst0_32_start,bypass_way_inst1_valid,bypass_way_inst1_32_start})
   4'b10?? : merge_way_retire_pointer[ENTRY_NUM-1:0] = ibuf_create_pointer1[ENTRY_NUM-1:0];
   4'b11?? : merge_way_retire_pointer[ENTRY_NUM-1:0] = ibuf_create_pointer2[ENTRY_NUM-1:0]; 
   4'b000? : merge_way_retire_pointer[ENTRY_NUM-1:0] = ibuf_create_pointer1[ENTRY_NUM-1:0];
   4'b0010 : merge_way_retire_pointer[ENTRY_NUM-1:0] = ibuf_create_pointer2[ENTRY_NUM-1:0];
   4'b0011 : merge_way_retire_pointer[ENTRY_NUM-1:0] = ibuf_create_pointer3[ENTRY_NUM-1:0];
   4'b010? : merge_way_retire_pointer[ENTRY_NUM-1:0] = ibuf_create_pointer2[ENTRY_NUM-1:0];
   4'b0110 : merge_way_retire_pointer[ENTRY_NUM-1:0] = ibuf_create_pointer3[ENTRY_NUM-1:0];
   4'b0111 : merge_way_retire_pointer[ENTRY_NUM-1:0] = ibuf_create_pointer4[ENTRY_NUM-1:0];
   default : merge_way_retire_pointer[ENTRY_NUM-1:0] = ibuf_create_pointer0[ENTRY_NUM-1:0];
 endcase
// &CombEnd; @5292
end

// &CombBeg; @5294
always @( bypass_way_inst1_32_start
       or bypass_way_inst0_32_start
       or ibuf_pop_inst1_valid)
begin
casez({ibuf_pop_inst1_valid,bypass_way_inst0_32_start,bypass_way_inst1_32_start})
   3'b10? : merge_way_inst_mask[8:0] = 9'b011111111;
   3'b11? : merge_way_inst_mask[8:0] = 9'b001111111;
   3'b000 : merge_way_inst_mask[8:0] = 9'b001111111;
   3'b001 : merge_way_inst_mask[8:0] = 9'b000111111;
   3'b010 : merge_way_inst_mask[8:0] = 9'b000111111;
   3'b011 : merge_way_inst_mask[8:0] = 9'b000011111;
   default: merge_way_inst_mask[8:0] = 9'b111111111;
 endcase
// &CombEnd; @5304
end

assign ibuf_nopass_merge_mask[8:0] = (ibctrl_ibuf_merge_vld && !ibuf_pop_inst2_valid && bypass_way_inst0_valid)
                                   ? merge_way_inst_mask[8:0]
                                   : 9'b111111111;  
//merge num selet
assign merge_half_num[4:0]       = (merge_way_inst1_sel && ibctrl_ibuf_merge_vld && bypass_way_inst0_valid)
                                 ? merge_way_inst1_num[4:0]
                                 : 5'b0;
assign ibuf_merge_retire_pointer[ENTRY_NUM-1:0] = (merge_way_inst1_sel && ibctrl_ibuf_merge_vld && bypass_way_inst0_valid)
                                                ? merge_way_retire_pointer[ENTRY_NUM-1:0]
                                                : ibuf_create_pointer[ENTRY_NUM-1:0];

//==========================================================
//            ibuf inst infor send to ibdp
//==========================================================
//for ibuf pop,when there are not 3 valid inst,we can merge ip_ib_flop inst
//with ibuf
assign ibuf_ibdp_inst0_valid      = ibuf_pop_inst0_valid;
assign ibuf_ibdp_inst0[31:0]      = ibuf_pop_inst0_data[31:0];
assign ibuf_ibdp_inst0_pc[14:0]   = ibuf_pop_inst0_pc[14:0];
assign ibuf_ibdp_inst0_expt_vld   = ibuf_pop_inst0_expt;
assign ibuf_ibdp_inst0_vec[3:0]   = ibuf_pop_inst0_vec[3:0];
assign ibuf_ibdp_inst0_high_expt  = ibuf_pop_inst0_high_expt;
assign ibuf_ibdp_inst0_ecc_err    = ibuf_pop_inst0_ecc_err;
assign ibuf_ibdp_inst0_split1     = ibuf_pop_inst0_split1;
assign ibuf_ibdp_inst0_split0     = ibuf_pop_inst0_split0;
assign ibuf_ibdp_inst0_fence      = ibuf_pop_inst0_fence;
assign ibuf_ibdp_inst0_bkpta      = ibuf_pop_inst0_bkpta;
assign ibuf_ibdp_inst0_bkptb      = ibuf_pop_inst0_bkptb;
assign ibuf_ibdp_inst0_no_spec    = ibuf_pop_inst0_no_spec;
assign ibuf_ibdp_inst0_vl_pred    = ibuf_pop_inst0_vl_pred;
assign ibuf_ibdp_inst0_vlmul[1:0] = ibuf_pop_inst0_vlmul[1:0];
assign ibuf_ibdp_inst0_vsew[2:0]  = ibuf_pop_inst0_vsew[2:0];
assign ibuf_ibdp_inst0_vl[7:0]    = ibuf_pop_inst0_vl[7:0];

assign ibuf_ibdp_inst1_valid      = (merge_way_inst0_sel) ? merge_way_inst0_valid     :  ibuf_pop_inst1_valid;
assign ibuf_ibdp_inst1[31:0]      = (merge_way_inst0_sel) ? merge_way_inst0[31:0]     :  ibuf_pop_inst1_data[31:0]; 
assign ibuf_ibdp_inst1_pc[14:0]  = (merge_way_inst0_sel) ? merge_way_inst0_pc[14:0]  :  ibuf_pop_inst1_pc[14:0]; 
assign ibuf_ibdp_inst1_expt_vld   = (merge_way_inst0_sel) ? merge_way_inst0_expt      :  ibuf_pop_inst1_expt;       
assign ibuf_ibdp_inst1_vec[3:0]   = (merge_way_inst0_sel) ? merge_way_inst0_vec[3:0]  :  ibuf_pop_inst1_vec[3:0];   
assign ibuf_ibdp_inst1_high_expt  = (merge_way_inst0_sel) ? merge_way_inst0_high_expt :  ibuf_pop_inst1_high_expt;  
assign ibuf_ibdp_inst1_ecc_err    = (merge_way_inst0_sel) ? merge_way_inst0_ecc_err   :  ibuf_pop_inst1_ecc_err;  
assign ibuf_ibdp_inst1_split1     = (merge_way_inst0_sel) ? merge_way_inst0_split1    :  ibuf_pop_inst1_split1;     
assign ibuf_ibdp_inst1_split0     = (merge_way_inst0_sel) ? merge_way_inst0_split0    :  ibuf_pop_inst1_split0;     
assign ibuf_ibdp_inst1_fence      = (merge_way_inst0_sel) ? merge_way_inst0_fence     :  ibuf_pop_inst1_fence;      
assign ibuf_ibdp_inst1_bkpta      = (merge_way_inst0_sel) ? merge_way_inst0_bkpta     :  ibuf_pop_inst1_bkpta;      
assign ibuf_ibdp_inst1_bkptb      = (merge_way_inst0_sel) ? merge_way_inst0_bkptb     :  ibuf_pop_inst1_bkptb;      
assign ibuf_ibdp_inst1_no_spec    = (merge_way_inst0_sel) ? merge_way_inst0_no_spec   :  ibuf_pop_inst1_no_spec;    
assign ibuf_ibdp_inst1_vl_pred    = (merge_way_inst0_sel) ? merge_way_inst0_vl_pred :  ibuf_pop_inst1_vl_pred;
assign ibuf_ibdp_inst1_vlmul[1:0] = (merge_way_inst0_sel) ? merge_way_inst0_vlmul[1:0]:  ibuf_pop_inst1_vlmul[1:0];      
assign ibuf_ibdp_inst1_vsew[2:0]  = (merge_way_inst0_sel) ? merge_way_inst0_vsew[2:0] :  ibuf_pop_inst1_vsew[2:0];
assign ibuf_ibdp_inst1_vl[7:0]    = (merge_way_inst0_sel) ? merge_way_inst0_vl[7:0]   :  ibuf_pop_inst1_vl[7:0];

//bypass merge valid inst
assign ibuf_ibdp_inst2_valid      = (merge_way_inst1_sel) ? merge_way_inst1_valid     :  ibuf_pop_inst2_valid;
assign ibuf_ibdp_inst2[31:0]      = (merge_way_inst1_sel) ? merge_way_inst1[31:0]     :  ibuf_pop_inst2_data[31:0]; 
assign ibuf_ibdp_inst2_pc[14:0]  = (merge_way_inst1_sel) ? merge_way_inst1_pc[14:0]  :  ibuf_pop_inst2_pc[14:0]; 
assign ibuf_ibdp_inst2_expt_vld   = (merge_way_inst1_sel) ? merge_way_inst1_expt      :  ibuf_pop_inst2_expt;       
assign ibuf_ibdp_inst2_vec[3:0]   = (merge_way_inst1_sel) ? merge_way_inst1_vec[3:0]  :  ibuf_pop_inst2_vec[3:0];   
assign ibuf_ibdp_inst2_high_expt  = (merge_way_inst1_sel) ? merge_way_inst1_high_expt :  ibuf_pop_inst2_high_expt;  
assign ibuf_ibdp_inst2_ecc_err    = (merge_way_inst1_sel) ? merge_way_inst1_ecc_err   :  ibuf_pop_inst2_ecc_err;  
assign ibuf_ibdp_inst2_split1     = (merge_way_inst1_sel) ? merge_way_inst1_split1    :  ibuf_pop_inst2_split1;     
assign ibuf_ibdp_inst2_split0     = (merge_way_inst1_sel) ? merge_way_inst1_split0    :  ibuf_pop_inst2_split0;     
assign ibuf_ibdp_inst2_fence      = (merge_way_inst1_sel) ? merge_way_inst1_fence     :  ibuf_pop_inst2_fence;      
assign ibuf_ibdp_inst2_bkpta      = (merge_way_inst1_sel) ? merge_way_inst1_bkpta     :  ibuf_pop_inst2_bkpta;      
assign ibuf_ibdp_inst2_bkptb      = (merge_way_inst1_sel) ? merge_way_inst1_bkptb     :  ibuf_pop_inst2_bkptb;      
assign ibuf_ibdp_inst2_no_spec    = (merge_way_inst1_sel) ? merge_way_inst1_no_spec   :  ibuf_pop_inst2_no_spec;
assign ibuf_ibdp_inst2_vl_pred    = (merge_way_inst1_sel) ? merge_way_inst1_vl_pred :  ibuf_pop_inst2_vl_pred;
assign ibuf_ibdp_inst2_vlmul[1:0] = (merge_way_inst1_sel) ? merge_way_inst1_vlmul[1:0]:  ibuf_pop_inst2_vlmul[1:0];      
assign ibuf_ibdp_inst2_vsew[2:0]  = (merge_way_inst1_sel) ? merge_way_inst1_vsew[2:0] :  ibuf_pop_inst2_vsew[2:0];
assign ibuf_ibdp_inst2_vl[7:0]    = (merge_way_inst1_sel) ? merge_way_inst1_vl[7:0]   :  ibuf_pop_inst2_vl[7:0];

//==========================================================
//           bypass inst infor send to ibdp
//==========================================================
assign ibuf_ibdp_bypass_inst0_valid      = bypass_way_inst0_valid;
assign ibuf_ibdp_bypass_inst0[31:0]      = bypass_way_inst0_data[31:0];
assign ibuf_ibdp_bypass_inst0_pc[14:0]   = bypass_way_inst0_pc[14:0];
assign ibuf_ibdp_bypass_inst0_expt       = bypass_way_inst0_expt;
assign ibuf_ibdp_bypass_inst0_vec[3:0]   = bypass_way_inst0_vec[3:0];
assign ibuf_ibdp_bypass_inst0_high_expt  = bypass_way_inst0_high_expt;
assign ibuf_ibdp_bypass_inst0_ecc_err    = bypass_way_inst0_ecc_err;
assign ibuf_ibdp_bypass_inst0_split1     = bypass_way_inst0_split1;
assign ibuf_ibdp_bypass_inst0_split0     = bypass_way_inst0_split0;
assign ibuf_ibdp_bypass_inst0_fence      = bypass_way_inst0_fence;
assign ibuf_ibdp_bypass_inst0_bkpta      = bypass_way_inst0_bkpta;
assign ibuf_ibdp_bypass_inst0_bkptb      = bypass_way_inst0_bkptb;
assign ibuf_ibdp_bypass_inst0_no_spec    = bypass_way_inst0_no_spec;
assign ibuf_ibdp_bypass_inst0_vl_pred    = bypass_way_inst0_vl_pred;
assign ibuf_ibdp_bypass_inst0_vlmul[1:0] = bypass_way_inst0_vlmul[1:0];
assign ibuf_ibdp_bypass_inst0_vsew[2:0]  = bypass_way_inst0_vsew[2:0];
assign ibuf_ibdp_bypass_inst0_vl[7:0]    = bypass_way_inst0_vl[7:0];
 
assign ibuf_ibdp_bypass_inst1_valid      = bypass_way_inst1_valid;
assign ibuf_ibdp_bypass_inst1[31:0]      = bypass_way_inst1_data[31:0];
assign ibuf_ibdp_bypass_inst1_pc[14:0]   = bypass_way_inst1_pc[14:0];
assign ibuf_ibdp_bypass_inst1_expt       = bypass_way_inst1_expt;
assign ibuf_ibdp_bypass_inst1_vec[3:0]   = bypass_way_inst1_vec[3:0];
assign ibuf_ibdp_bypass_inst1_high_expt  = bypass_way_inst1_high_expt;
assign ibuf_ibdp_bypass_inst1_ecc_err    = bypass_way_inst1_ecc_err;
assign ibuf_ibdp_bypass_inst1_split1     = bypass_way_inst1_split1;
assign ibuf_ibdp_bypass_inst1_split0     = bypass_way_inst1_split0;
assign ibuf_ibdp_bypass_inst1_fence      = bypass_way_inst1_fence;
assign ibuf_ibdp_bypass_inst1_bkpta      = bypass_way_inst1_bkpta;
assign ibuf_ibdp_bypass_inst1_bkptb      = bypass_way_inst1_bkptb;
assign ibuf_ibdp_bypass_inst1_no_spec    = bypass_way_inst1_no_spec;
assign ibuf_ibdp_bypass_inst1_vl_pred    = bypass_way_inst1_vl_pred;
assign ibuf_ibdp_bypass_inst1_vlmul[1:0] = bypass_way_inst1_vlmul[1:0];
assign ibuf_ibdp_bypass_inst1_vsew[2:0]  = bypass_way_inst1_vsew[2:0];
assign ibuf_ibdp_bypass_inst1_vl[7:0]    = bypass_way_inst1_vl[7:0];

assign ibuf_ibdp_bypass_inst2_valid      = bypass_way_inst2_valid;
assign ibuf_ibdp_bypass_inst2[31:0]      = bypass_way_inst2_data[31:0];
assign ibuf_ibdp_bypass_inst2_pc[14:0]   = bypass_way_inst2_pc[14:0];
assign ibuf_ibdp_bypass_inst2_expt       = bypass_way_inst2_expt;
assign ibuf_ibdp_bypass_inst2_vec[3:0]   = bypass_way_inst2_vec[3:0];
assign ibuf_ibdp_bypass_inst2_high_expt  = bypass_way_inst2_high_expt;
assign ibuf_ibdp_bypass_inst2_ecc_err    = bypass_way_inst2_ecc_err;
assign ibuf_ibdp_bypass_inst2_split1     = bypass_way_inst2_split1;
assign ibuf_ibdp_bypass_inst2_split0     = bypass_way_inst2_split0;
assign ibuf_ibdp_bypass_inst2_fence      = bypass_way_inst2_fence;
assign ibuf_ibdp_bypass_inst2_bkpta      = bypass_way_inst2_bkpta;
assign ibuf_ibdp_bypass_inst2_bkptb      = bypass_way_inst2_bkptb;
assign ibuf_ibdp_bypass_inst2_no_spec    = bypass_way_inst2_no_spec;
assign ibuf_ibdp_bypass_inst2_vl_pred    = bypass_way_inst2_vl_pred;
assign ibuf_ibdp_bypass_inst2_vlmul[1:0] = bypass_way_inst2_vlmul[1:0];
assign ibuf_ibdp_bypass_inst2_vsew[2:0]  = bypass_way_inst2_vsew[2:0];
assign ibuf_ibdp_bypass_inst2_vl[7:0]    = bypass_way_inst2_vl[7:0];

// &ModuleEnd; @5434
endmodule


