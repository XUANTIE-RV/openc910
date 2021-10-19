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
module ct_lsu_ld_wb(
  cp0_lsu_icg_en,
  cp0_yy_clk_en,
  cpurst_b,
  ctrl_ld_clk,
  forever_cpuclk,
  had_lsu_bus_trace_en,
  had_lsu_dbg_en,
  ld_da_addr,
  ld_da_bkpta_data,
  ld_da_bkptb_data,
  ld_da_iid,
  ld_da_inst_vfls,
  ld_da_inst_vld,
  ld_da_preg,
  ld_da_preg_sign_sel,
  ld_da_vreg,
  ld_da_wb_cmplt_req,
  ld_da_wb_data,
  ld_da_wb_data_req,
  ld_da_wb_data_req_gateclk_en,
  ld_da_wb_expt_vec,
  ld_da_wb_expt_vld,
  ld_da_wb_mt_value,
  ld_da_wb_no_spec_hit,
  ld_da_wb_no_spec_mispred,
  ld_da_wb_no_spec_miss,
  ld_da_wb_spec_fail,
  ld_da_wb_vreg_sign_sel,
  ld_wb_data_vld,
  ld_wb_inst_vld,
  ld_wb_rb_cmplt_grnt,
  ld_wb_rb_data_grnt,
  ld_wb_wmb_data_grnt,
  lsu_had_ld_addr,
  lsu_had_ld_data,
  lsu_had_ld_iid,
  lsu_had_ld_req,
  lsu_had_ld_type,
  lsu_idu_wb_pipe3_fwd_vreg,
  lsu_idu_wb_pipe3_fwd_vreg_vld,
  lsu_idu_wb_pipe3_wb_preg,
  lsu_idu_wb_pipe3_wb_preg_data,
  lsu_idu_wb_pipe3_wb_preg_dup0,
  lsu_idu_wb_pipe3_wb_preg_dup1,
  lsu_idu_wb_pipe3_wb_preg_dup2,
  lsu_idu_wb_pipe3_wb_preg_dup3,
  lsu_idu_wb_pipe3_wb_preg_dup4,
  lsu_idu_wb_pipe3_wb_preg_expand,
  lsu_idu_wb_pipe3_wb_preg_vld,
  lsu_idu_wb_pipe3_wb_preg_vld_dup0,
  lsu_idu_wb_pipe3_wb_preg_vld_dup1,
  lsu_idu_wb_pipe3_wb_preg_vld_dup2,
  lsu_idu_wb_pipe3_wb_preg_vld_dup3,
  lsu_idu_wb_pipe3_wb_preg_vld_dup4,
  lsu_idu_wb_pipe3_wb_vreg_dup0,
  lsu_idu_wb_pipe3_wb_vreg_dup1,
  lsu_idu_wb_pipe3_wb_vreg_dup2,
  lsu_idu_wb_pipe3_wb_vreg_dup3,
  lsu_idu_wb_pipe3_wb_vreg_fr_data,
  lsu_idu_wb_pipe3_wb_vreg_fr_expand,
  lsu_idu_wb_pipe3_wb_vreg_fr_vld,
  lsu_idu_wb_pipe3_wb_vreg_vld_dup0,
  lsu_idu_wb_pipe3_wb_vreg_vld_dup1,
  lsu_idu_wb_pipe3_wb_vreg_vld_dup2,
  lsu_idu_wb_pipe3_wb_vreg_vld_dup3,
  lsu_idu_wb_pipe3_wb_vreg_vr0_data,
  lsu_idu_wb_pipe3_wb_vreg_vr0_expand,
  lsu_idu_wb_pipe3_wb_vreg_vr0_vld,
  lsu_idu_wb_pipe3_wb_vreg_vr1_data,
  lsu_idu_wb_pipe3_wb_vreg_vr1_expand,
  lsu_idu_wb_pipe3_wb_vreg_vr1_vld,
  lsu_rtu_async_expt_addr,
  lsu_rtu_async_expt_vld,
  lsu_rtu_wb_pipe3_abnormal,
  lsu_rtu_wb_pipe3_bkpta_data,
  lsu_rtu_wb_pipe3_bkptb_data,
  lsu_rtu_wb_pipe3_cmplt,
  lsu_rtu_wb_pipe3_expt_vec,
  lsu_rtu_wb_pipe3_expt_vld,
  lsu_rtu_wb_pipe3_flush,
  lsu_rtu_wb_pipe3_iid,
  lsu_rtu_wb_pipe3_mtval,
  lsu_rtu_wb_pipe3_no_spec_hit,
  lsu_rtu_wb_pipe3_no_spec_mispred,
  lsu_rtu_wb_pipe3_no_spec_miss,
  lsu_rtu_wb_pipe3_spec_fail,
  lsu_rtu_wb_pipe3_wb_preg_expand,
  lsu_rtu_wb_pipe3_wb_preg_vld,
  lsu_rtu_wb_pipe3_wb_vreg_expand,
  lsu_rtu_wb_pipe3_wb_vreg_fr_vld,
  lsu_rtu_wb_pipe3_wb_vreg_vr_vld,
  pad_yy_icg_scan_en,
  rb_ld_wb_bkpta_data,
  rb_ld_wb_bkptb_data,
  rb_ld_wb_bus_err,
  rb_ld_wb_bus_err_addr,
  rb_ld_wb_cmplt_req,
  rb_ld_wb_data,
  rb_ld_wb_data_iid,
  rb_ld_wb_data_req,
  rb_ld_wb_expt_gateclk,
  rb_ld_wb_expt_vld,
  rb_ld_wb_iid,
  rb_ld_wb_inst_vfls,
  rb_ld_wb_preg,
  rb_ld_wb_preg_sign_sel,
  rb_ld_wb_vreg,
  rb_ld_wb_vreg_sign_sel,
  rtu_yy_xx_flush,
  vmb_ld_wb_data_req,
  wmb_ld_wb_data,
  wmb_ld_wb_data_addr,
  wmb_ld_wb_data_iid,
  wmb_ld_wb_data_req,
  wmb_ld_wb_inst_vfls,
  wmb_ld_wb_preg,
  wmb_ld_wb_preg_sign_sel,
  wmb_ld_wb_vreg,
  wmb_ld_wb_vreg_sign_sel
);

// &Ports; @28
input           cp0_lsu_icg_en;                     
input           cp0_yy_clk_en;                      
input           cpurst_b;                           
input           ctrl_ld_clk;                        
input           forever_cpuclk;                     
input           had_lsu_bus_trace_en;               
input           had_lsu_dbg_en;                     
input   [39:0]  ld_da_addr;                         
input           ld_da_bkpta_data;                   
input           ld_da_bkptb_data;                   
input   [6 :0]  ld_da_iid;                          
input           ld_da_inst_vfls;                    
input           ld_da_inst_vld;                     
input   [6 :0]  ld_da_preg;                         
input   [3 :0]  ld_da_preg_sign_sel;                
input   [5 :0]  ld_da_vreg;                         
input           ld_da_wb_cmplt_req;                 
input   [63:0]  ld_da_wb_data;                      
input           ld_da_wb_data_req;                  
input           ld_da_wb_data_req_gateclk_en;       
input   [4 :0]  ld_da_wb_expt_vec;                  
input           ld_da_wb_expt_vld;                  
input   [39:0]  ld_da_wb_mt_value;                  
input           ld_da_wb_no_spec_hit;               
input           ld_da_wb_no_spec_mispred;           
input           ld_da_wb_no_spec_miss;              
input           ld_da_wb_spec_fail;                 
input   [1 :0]  ld_da_wb_vreg_sign_sel;             
input           pad_yy_icg_scan_en;                 
input           rb_ld_wb_bkpta_data;                
input           rb_ld_wb_bkptb_data;                
input           rb_ld_wb_bus_err;                   
input   [39:0]  rb_ld_wb_bus_err_addr;              
input           rb_ld_wb_cmplt_req;                 
input   [63:0]  rb_ld_wb_data;                      
input   [6 :0]  rb_ld_wb_data_iid;                  
input           rb_ld_wb_data_req;                  
input           rb_ld_wb_expt_gateclk;              
input           rb_ld_wb_expt_vld;                  
input   [6 :0]  rb_ld_wb_iid;                       
input           rb_ld_wb_inst_vfls;                 
input   [6 :0]  rb_ld_wb_preg;                      
input   [3 :0]  rb_ld_wb_preg_sign_sel;             
input   [5 :0]  rb_ld_wb_vreg;                      
input   [1 :0]  rb_ld_wb_vreg_sign_sel;             
input           rtu_yy_xx_flush;                    
input           vmb_ld_wb_data_req;                 
input   [63:0]  wmb_ld_wb_data;                     
input   [39:0]  wmb_ld_wb_data_addr;                
input   [6 :0]  wmb_ld_wb_data_iid;                 
input           wmb_ld_wb_data_req;                 
input           wmb_ld_wb_inst_vfls;                
input   [6 :0]  wmb_ld_wb_preg;                     
input   [3 :0]  wmb_ld_wb_preg_sign_sel;            
input   [5 :0]  wmb_ld_wb_vreg;                     
input   [1 :0]  wmb_ld_wb_vreg_sign_sel;            
output          ld_wb_data_vld;                     
output          ld_wb_inst_vld;                     
output          ld_wb_rb_cmplt_grnt;                
output          ld_wb_rb_data_grnt;                 
output          ld_wb_wmb_data_grnt;                
output  [39:0]  lsu_had_ld_addr;                    
output  [63:0]  lsu_had_ld_data;                    
output  [6 :0]  lsu_had_ld_iid;                     
output          lsu_had_ld_req;                     
output  [3 :0]  lsu_had_ld_type;                    
output  [6 :0]  lsu_idu_wb_pipe3_fwd_vreg;          
output          lsu_idu_wb_pipe3_fwd_vreg_vld;      
output  [6 :0]  lsu_idu_wb_pipe3_wb_preg;           
output  [63:0]  lsu_idu_wb_pipe3_wb_preg_data;      
output  [6 :0]  lsu_idu_wb_pipe3_wb_preg_dup0;      
output  [6 :0]  lsu_idu_wb_pipe3_wb_preg_dup1;      
output  [6 :0]  lsu_idu_wb_pipe3_wb_preg_dup2;      
output  [6 :0]  lsu_idu_wb_pipe3_wb_preg_dup3;      
output  [6 :0]  lsu_idu_wb_pipe3_wb_preg_dup4;      
output  [95:0]  lsu_idu_wb_pipe3_wb_preg_expand;    
output          lsu_idu_wb_pipe3_wb_preg_vld;       
output          lsu_idu_wb_pipe3_wb_preg_vld_dup0;  
output          lsu_idu_wb_pipe3_wb_preg_vld_dup1;  
output          lsu_idu_wb_pipe3_wb_preg_vld_dup2;  
output          lsu_idu_wb_pipe3_wb_preg_vld_dup3;  
output          lsu_idu_wb_pipe3_wb_preg_vld_dup4;  
output  [6 :0]  lsu_idu_wb_pipe3_wb_vreg_dup0;      
output  [6 :0]  lsu_idu_wb_pipe3_wb_vreg_dup1;      
output  [6 :0]  lsu_idu_wb_pipe3_wb_vreg_dup2;      
output  [6 :0]  lsu_idu_wb_pipe3_wb_vreg_dup3;      
output  [63:0]  lsu_idu_wb_pipe3_wb_vreg_fr_data;   
output  [63:0]  lsu_idu_wb_pipe3_wb_vreg_fr_expand; 
output          lsu_idu_wb_pipe3_wb_vreg_fr_vld;    
output          lsu_idu_wb_pipe3_wb_vreg_vld_dup0;  
output          lsu_idu_wb_pipe3_wb_vreg_vld_dup1;  
output          lsu_idu_wb_pipe3_wb_vreg_vld_dup2;  
output          lsu_idu_wb_pipe3_wb_vreg_vld_dup3;  
output  [63:0]  lsu_idu_wb_pipe3_wb_vreg_vr0_data;  
output  [63:0]  lsu_idu_wb_pipe3_wb_vreg_vr0_expand; 
output          lsu_idu_wb_pipe3_wb_vreg_vr0_vld;   
output  [63:0]  lsu_idu_wb_pipe3_wb_vreg_vr1_data;  
output  [63:0]  lsu_idu_wb_pipe3_wb_vreg_vr1_expand; 
output          lsu_idu_wb_pipe3_wb_vreg_vr1_vld;   
output  [39:0]  lsu_rtu_async_expt_addr;            
output          lsu_rtu_async_expt_vld;             
output          lsu_rtu_wb_pipe3_abnormal;          
output          lsu_rtu_wb_pipe3_bkpta_data;        
output          lsu_rtu_wb_pipe3_bkptb_data;        
output          lsu_rtu_wb_pipe3_cmplt;             
output  [4 :0]  lsu_rtu_wb_pipe3_expt_vec;          
output          lsu_rtu_wb_pipe3_expt_vld;          
output          lsu_rtu_wb_pipe3_flush;             
output  [6 :0]  lsu_rtu_wb_pipe3_iid;               
output  [39:0]  lsu_rtu_wb_pipe3_mtval;             
output          lsu_rtu_wb_pipe3_no_spec_hit;       
output          lsu_rtu_wb_pipe3_no_spec_mispred;   
output          lsu_rtu_wb_pipe3_no_spec_miss;      
output          lsu_rtu_wb_pipe3_spec_fail;         
output  [95:0]  lsu_rtu_wb_pipe3_wb_preg_expand;    
output          lsu_rtu_wb_pipe3_wb_preg_vld;       
output  [63:0]  lsu_rtu_wb_pipe3_wb_vreg_expand;    
output          lsu_rtu_wb_pipe3_wb_vreg_fr_vld;    
output          lsu_rtu_wb_pipe3_wb_vreg_vr_vld;    

// &Regs; @29
reg             ld_wb_bkpta_data;                   
reg             ld_wb_bkptb_data;                   
reg             ld_wb_bus_err;                      
reg     [63:0]  ld_wb_data;                         
reg     [39:0]  ld_wb_data_addr;                    
reg     [6 :0]  ld_wb_data_iid;                     
reg     [6 :0]  ld_wb_data_preg;                    
reg     [6 :0]  ld_wb_data_preg_dup0;               
reg     [6 :0]  ld_wb_data_preg_dup1;               
reg     [6 :0]  ld_wb_data_preg_dup2;               
reg     [6 :0]  ld_wb_data_preg_dup3;               
reg     [6 :0]  ld_wb_data_preg_dup4;               
reg     [95:0]  ld_wb_data_preg_expand;             
reg             ld_wb_data_vld;                     
reg     [5 :0]  ld_wb_data_vreg;                    
reg     [5 :0]  ld_wb_data_vreg_dup0;               
reg     [5 :0]  ld_wb_data_vreg_dup1;               
reg     [5 :0]  ld_wb_data_vreg_dup2;               
reg     [5 :0]  ld_wb_data_vreg_dup3;               
reg     [63:0]  ld_wb_data_vreg_expand;             
reg     [4 :0]  ld_wb_expt_vec;                     
reg             ld_wb_expt_vld;                     
reg             ld_wb_flush;                        
reg     [6 :0]  ld_wb_iid;                          
reg             ld_wb_inst_vld;                     
reg     [39:0]  ld_wb_mt_value;                     
reg             ld_wb_no_spec_hit;                  
reg             ld_wb_no_spec_mispred;              
reg             ld_wb_no_spec_miss;                 
reg     [3 :0]  ld_wb_preg_sign_sel;                
reg             ld_wb_preg_wb_vld;                  
reg             ld_wb_preg_wb_vld_dup0;             
reg             ld_wb_preg_wb_vld_dup1;             
reg             ld_wb_preg_wb_vld_dup2;             
reg             ld_wb_preg_wb_vld_dup3;             
reg             ld_wb_preg_wb_vld_dup4;             
reg             ld_wb_spec_fail;                    
reg     [63:0]  ld_wb_vreg_data_sign_extend;        
reg     [1 :0]  ld_wb_vreg_sign_sel;                
reg             ld_wb_vreg_wb_vld;                  
reg             ld_wb_vreg_wb_vld_dup0;             
reg             ld_wb_vreg_wb_vld_dup1;             
reg             ld_wb_vreg_wb_vld_dup2;             
reg             ld_wb_vreg_wb_vld_dup3;             
reg     [39:0]  wb_dbg_ld_addr_ff;                  
reg     [63:0]  wb_dbg_ld_data_ff;                  
reg     [6 :0]  wb_dbg_ld_iid_ff;                   
reg             wb_dbg_ld_req_ff;                   

// &Wires; @30
wire            cp0_lsu_icg_en;                     
wire            cp0_yy_clk_en;                      
wire            cpurst_b;                           
wire            ctrl_ld_clk;                        
wire            forever_cpuclk;                     
wire            had_lsu_bus_trace_en;               
wire            had_lsu_dbg_en;                     
wire    [39:0]  ld_da_addr;                         
wire            ld_da_bkpta_data;                   
wire            ld_da_bkptb_data;                   
wire    [6 :0]  ld_da_iid;                          
wire            ld_da_inst_vfls;                    
wire            ld_da_inst_vld;                     
wire    [6 :0]  ld_da_preg;                         
wire    [95:0]  ld_da_preg_expand;                  
wire    [3 :0]  ld_da_preg_sign_sel;                
wire    [5 :0]  ld_da_vreg;                         
wire    [63:0]  ld_da_vreg_expand;                  
wire            ld_da_wb_cmplt_req;                 
wire    [63:0]  ld_da_wb_data;                      
wire            ld_da_wb_data_req;                  
wire            ld_da_wb_data_req_gateclk_en;       
wire    [4 :0]  ld_da_wb_expt_vec;                  
wire            ld_da_wb_expt_vld;                  
wire    [39:0]  ld_da_wb_mt_value;                  
wire            ld_da_wb_no_spec_hit;               
wire            ld_da_wb_no_spec_mispred;           
wire            ld_da_wb_no_spec_miss;              
wire            ld_da_wb_spec_fail;                 
wire    [1 :0]  ld_da_wb_vreg_sign_sel;             
wire            ld_da_wb_vsetvl;                    
wire            ld_wb_cmplt_clk;                    
wire            ld_wb_cmplt_clk_en;                 
wire            ld_wb_da_cmplt_grnt;                
wire            ld_wb_da_data_grnt;                 
wire            ld_wb_data_clk;                     
wire            ld_wb_data_clk_en;                  
wire            ld_wb_data_pre_vmb_merge_vld;       
wire    [63:0]  ld_wb_data_sign0;                   
wire    [63:0]  ld_wb_data_sign1;                   
wire    [63:0]  ld_wb_data_sign2;                   
wire    [63:0]  ld_wb_data_sign3;                   
wire            ld_wb_expt_clk;                     
wire            ld_wb_expt_clk_en;                  
wire            ld_wb_pre_bkpta_data;               
wire            ld_wb_pre_bkptb_data;               
wire            ld_wb_pre_bus_err;                  
wire    [63:0]  ld_wb_pre_data;                     
wire    [39:0]  ld_wb_pre_data_addr;                
wire    [6 :0]  ld_wb_pre_data_iid;                 
wire    [63:0]  ld_wb_pre_data_no_da;               
wire            ld_wb_pre_data_vld;                 
wire            ld_wb_pre_expt_gateclk;             
wire    [4 :0]  ld_wb_pre_expt_vec;                 
wire            ld_wb_pre_expt_vld;                 
wire            ld_wb_pre_flush;                    
wire    [6 :0]  ld_wb_pre_iid;                      
wire            ld_wb_pre_inst_vfls;                
wire            ld_wb_pre_inst_vld;                 
wire    [39:0]  ld_wb_pre_mt_value;                 
wire            ld_wb_pre_no_spec_hit;              
wire            ld_wb_pre_no_spec_mispred;          
wire            ld_wb_pre_no_spec_miss;             
wire    [6 :0]  ld_wb_pre_preg;                     
wire    [95:0]  ld_wb_pre_preg_expand;              
wire    [3 :0]  ld_wb_pre_preg_sign_sel;            
wire            ld_wb_pre_preg_wb_vld;              
wire            ld_wb_pre_spec_fail;                
wire    [5 :0]  ld_wb_pre_vreg;                     
wire    [63:0]  ld_wb_pre_vreg_expand;              
wire    [1 :0]  ld_wb_pre_vreg_sign_sel;            
wire            ld_wb_pre_vreg_wb_vld;              
wire            ld_wb_pre_vsetvl;                   
wire            ld_wb_pre_vstart_vld;               
wire            ld_wb_preg_clk;                     
wire            ld_wb_preg_clk_en;                  
wire    [63:0]  ld_wb_preg_data_sign_extend;        
wire            ld_wb_rb_cmplt_grnt;                
wire            ld_wb_rb_data_grnt;                 
wire            ld_wb_vreg_clk;                     
wire            ld_wb_vreg_clk_en;                  
wire            ld_wb_wmb_data_grnt;                
wire    [39:0]  lsu_had_ld_addr;                    
wire    [63:0]  lsu_had_ld_data;                    
wire    [6 :0]  lsu_had_ld_iid;                     
wire            lsu_had_ld_req;                     
wire    [3 :0]  lsu_had_ld_type;                    
wire    [6 :0]  lsu_idu_wb_pipe3_fwd_vreg;          
wire            lsu_idu_wb_pipe3_fwd_vreg_vld;      
wire    [6 :0]  lsu_idu_wb_pipe3_wb_preg;           
wire    [63:0]  lsu_idu_wb_pipe3_wb_preg_data;      
wire    [6 :0]  lsu_idu_wb_pipe3_wb_preg_dup0;      
wire    [6 :0]  lsu_idu_wb_pipe3_wb_preg_dup1;      
wire    [6 :0]  lsu_idu_wb_pipe3_wb_preg_dup2;      
wire    [6 :0]  lsu_idu_wb_pipe3_wb_preg_dup3;      
wire    [6 :0]  lsu_idu_wb_pipe3_wb_preg_dup4;      
wire    [95:0]  lsu_idu_wb_pipe3_wb_preg_expand;    
wire            lsu_idu_wb_pipe3_wb_preg_vld;       
wire            lsu_idu_wb_pipe3_wb_preg_vld_dup0;  
wire            lsu_idu_wb_pipe3_wb_preg_vld_dup1;  
wire            lsu_idu_wb_pipe3_wb_preg_vld_dup2;  
wire            lsu_idu_wb_pipe3_wb_preg_vld_dup3;  
wire            lsu_idu_wb_pipe3_wb_preg_vld_dup4;  
wire    [6 :0]  lsu_idu_wb_pipe3_wb_vreg_dup0;      
wire    [6 :0]  lsu_idu_wb_pipe3_wb_vreg_dup1;      
wire    [6 :0]  lsu_idu_wb_pipe3_wb_vreg_dup2;      
wire    [6 :0]  lsu_idu_wb_pipe3_wb_vreg_dup3;      
wire    [63:0]  lsu_idu_wb_pipe3_wb_vreg_fr_data;   
wire    [63:0]  lsu_idu_wb_pipe3_wb_vreg_fr_expand; 
wire            lsu_idu_wb_pipe3_wb_vreg_fr_vld;    
wire            lsu_idu_wb_pipe3_wb_vreg_vld_dup0;  
wire            lsu_idu_wb_pipe3_wb_vreg_vld_dup1;  
wire            lsu_idu_wb_pipe3_wb_vreg_vld_dup2;  
wire            lsu_idu_wb_pipe3_wb_vreg_vld_dup3;  
wire    [63:0]  lsu_idu_wb_pipe3_wb_vreg_vr0_data;  
wire    [63:0]  lsu_idu_wb_pipe3_wb_vreg_vr0_expand; 
wire            lsu_idu_wb_pipe3_wb_vreg_vr0_vld;   
wire    [63:0]  lsu_idu_wb_pipe3_wb_vreg_vr1_data;  
wire    [63:0]  lsu_idu_wb_pipe3_wb_vreg_vr1_expand; 
wire            lsu_idu_wb_pipe3_wb_vreg_vr1_vld;   
wire    [39:0]  lsu_rtu_async_expt_addr;            
wire            lsu_rtu_async_expt_vld;             
wire            lsu_rtu_wb_pipe3_abnormal;          
wire            lsu_rtu_wb_pipe3_bkpta_data;        
wire            lsu_rtu_wb_pipe3_bkptb_data;        
wire            lsu_rtu_wb_pipe3_cmplt;             
wire    [4 :0]  lsu_rtu_wb_pipe3_expt_vec;          
wire            lsu_rtu_wb_pipe3_expt_vld;          
wire            lsu_rtu_wb_pipe3_flush;             
wire    [6 :0]  lsu_rtu_wb_pipe3_iid;               
wire    [39:0]  lsu_rtu_wb_pipe3_mtval;             
wire            lsu_rtu_wb_pipe3_no_spec_hit;       
wire            lsu_rtu_wb_pipe3_no_spec_mispred;   
wire            lsu_rtu_wb_pipe3_no_spec_miss;      
wire            lsu_rtu_wb_pipe3_spec_fail;         
wire    [95:0]  lsu_rtu_wb_pipe3_wb_preg_expand;    
wire            lsu_rtu_wb_pipe3_wb_preg_vld;       
wire    [63:0]  lsu_rtu_wb_pipe3_wb_vreg_expand;    
wire            lsu_rtu_wb_pipe3_wb_vreg_fr_vld;    
wire            lsu_rtu_wb_pipe3_wb_vreg_vr_vld;    
wire            pad_yy_icg_scan_en;                 
wire            rb_ld_wb_bkpta_data;                
wire            rb_ld_wb_bkptb_data;                
wire            rb_ld_wb_bus_err;                   
wire    [39:0]  rb_ld_wb_bus_err_addr;              
wire            rb_ld_wb_cmplt_req;                 
wire    [63:0]  rb_ld_wb_data;                      
wire    [6 :0]  rb_ld_wb_data_iid;                  
wire            rb_ld_wb_data_req;                  
wire            rb_ld_wb_expt_gateclk;              
wire            rb_ld_wb_expt_vld;                  
wire    [6 :0]  rb_ld_wb_iid;                       
wire            rb_ld_wb_inst_vfls;                 
wire    [6 :0]  rb_ld_wb_preg;                      
wire    [95:0]  rb_ld_wb_preg_expand;               
wire    [3 :0]  rb_ld_wb_preg_sign_sel;             
wire    [5 :0]  rb_ld_wb_vreg;                      
wire    [63:0]  rb_ld_wb_vreg_expand;               
wire    [1 :0]  rb_ld_wb_vreg_sign_sel;             
wire            rtu_yy_xx_flush;                    
wire            vmb_ld_wb_data_req;                 
wire    [39:0]  wb_dbg_ar_addr;                     
wire    [1 :0]  wb_dbg_ar_bar;                      
wire    [1 :0]  wb_dbg_ar_burst;                    
wire    [3 :0]  wb_dbg_ar_cache;                    
wire    [1 :0]  wb_dbg_ar_domain;                   
wire    [7 :0]  wb_dbg_ar_id;                       
wire    [7 :0]  wb_dbg_ar_len;                      
wire            wb_dbg_ar_lock;                     
wire    [2 :0]  wb_dbg_ar_prot;                     
wire            wb_dbg_ar_req_ff;                   
wire    [2 :0]  wb_dbg_ar_size;                     
wire    [3 :0]  wb_dbg_ar_snoop;                    
wire            wb_dbg_clk;                         
wire            wb_dbg_clk_en;                      
wire            wb_dbg_ld_req;                      
wire    [63:0]  wmb_ld_wb_data;                     
wire    [39:0]  wmb_ld_wb_data_addr;                
wire    [6 :0]  wmb_ld_wb_data_iid;                 
wire            wmb_ld_wb_data_req;                 
wire            wmb_ld_wb_inst_vfls;                
wire    [6 :0]  wmb_ld_wb_preg;                     
wire    [95:0]  wmb_ld_wb_preg_expand;              
wire    [3 :0]  wmb_ld_wb_preg_sign_sel;            
wire    [5 :0]  wmb_ld_wb_vreg;                     
wire    [63:0]  wmb_ld_wb_vreg_expand;              
wire    [1 :0]  wmb_ld_wb_vreg_sign_sel;            


parameter BYTE  = 2'b00,
          HALF  = 2'b01,
          WORD  = 2'b10,
          DWORD = 2'b11;

parameter VMB_ENTRY          = 8;
//==========================================================
//                 arbitrate WB stage request
//==========================================================
//------------------complete part---------------------------
//-----------grant signal---------------
assign ld_wb_da_cmplt_grnt      = ld_da_wb_cmplt_req;
// &Force("output","ld_wb_rb_cmplt_grnt"); @44
assign ld_wb_rb_cmplt_grnt      = !ld_da_wb_cmplt_req
                                  &&  rb_ld_wb_cmplt_req;
//-----------signal select--------------
assign ld_wb_pre_inst_vld       = ld_da_wb_cmplt_req
                                  ||  rb_ld_wb_cmplt_req;

assign ld_wb_pre_spec_fail      = ld_wb_da_cmplt_grnt &&  ld_da_wb_spec_fail;

assign ld_wb_pre_bkpta_data     = ld_wb_da_cmplt_grnt &&  ld_da_bkpta_data
                                  ||  ld_wb_rb_cmplt_grnt &&  rb_ld_wb_bkpta_data;

assign ld_wb_pre_bkptb_data     = ld_wb_da_cmplt_grnt &&  ld_da_bkptb_data
                                  ||  ld_wb_rb_cmplt_grnt &&  rb_ld_wb_bkptb_data;

assign ld_wb_pre_flush          = ld_wb_pre_spec_fail
                                  || ld_wb_pre_vstart_vld
                                     && !ld_wb_pre_expt_vld
                                  || ld_wb_pre_vsetvl;

assign ld_wb_pre_expt_vld       = ld_wb_da_cmplt_grnt &&  ld_da_wb_expt_vld
                                  || ld_wb_rb_cmplt_grnt &&  rb_ld_wb_expt_vld;

assign ld_wb_pre_expt_gateclk   = ld_wb_da_cmplt_grnt &&  (ld_da_wb_expt_vld || ld_da_wb_vsetvl)
                                  || ld_wb_rb_cmplt_grnt &&  rb_ld_wb_expt_gateclk;

assign ld_wb_pre_expt_vec[4:0]   = {5{ld_wb_da_cmplt_grnt}} &  ld_da_wb_expt_vec[4:0]
                                   | {5{ld_wb_rb_cmplt_grnt}} &  5'd5;

assign ld_wb_pre_iid[6:0]       = {7{ld_wb_da_cmplt_grnt}}  & ld_da_iid[6:0]
                                  | {7{ld_wb_rb_cmplt_grnt}}  & rb_ld_wb_iid[6:0];

assign ld_wb_pre_mt_value[`PA_WIDTH-1:0]    = ld_da_wb_mt_value[`PA_WIDTH-1:0];
assign ld_wb_pre_vstart_vld                 = 1'b0;
assign ld_wb_pre_vsetvl                     = 1'b0;
assign ld_da_wb_vsetvl                      = 1'b0;

//------------------data part-------------------------------
//-----------grant signal---------------
assign ld_wb_da_data_grnt    = ld_da_wb_data_req;
// &Force("output","ld_wb_wmb_data_grnt"); @100
assign ld_wb_wmb_data_grnt      = !ld_da_wb_data_req
                                  &&  wmb_ld_wb_data_req;
// &Force("output","ld_wb_rb_data_grnt"); @103
// &Force("output","ld_wb_vmb_data_grnt"); @105
assign ld_wb_rb_data_grnt       = !ld_da_wb_data_req
                                  &&  !wmb_ld_wb_data_req
                                  &&  !vmb_ld_wb_data_req
                                  &&  rb_ld_wb_data_req;
//-----------signal select--------------
assign ld_wb_pre_data_vld       = ld_da_wb_data_req
                                  ||  wmb_ld_wb_data_req
                                  ||  vmb_ld_wb_data_req
                                  ||  rb_ld_wb_data_req;

assign ld_wb_pre_bus_err        = ld_wb_rb_data_grnt &&  rb_ld_wb_bus_err;

assign ld_wb_pre_data_addr[`PA_WIDTH-1:0]= {`PA_WIDTH{ld_wb_da_data_grnt}} & ld_da_addr[`PA_WIDTH-1:0]
                                           | {`PA_WIDTH{ld_wb_wmb_data_grnt}}  & wmb_ld_wb_data_addr[`PA_WIDTH-1:0]
                                           | {`PA_WIDTH{ld_wb_rb_data_grnt}} & rb_ld_wb_bus_err_addr[`PA_WIDTH-1:0];

//for had debug
assign ld_wb_pre_data_iid[6:0]  = {7{ld_wb_da_data_grnt}} & ld_da_iid[6:0]
                                  | {7{ld_wb_wmb_data_grnt}}  & wmb_ld_wb_data_iid[6:0]
                                  | {7{ld_wb_rb_data_grnt}} & rb_ld_wb_data_iid[6:0];

assign ld_wb_pre_preg[6:0]      = {7{ld_wb_da_data_grnt}} & ld_da_preg[6:0]
                                  | {7{ld_wb_wmb_data_grnt}}  & wmb_ld_wb_preg[6:0]
                                  | {7{ld_wb_rb_data_grnt}} & rb_ld_wb_preg[6:0];

assign ld_wb_pre_vreg[5:0]      = {6{ld_wb_da_data_grnt}} & ld_da_vreg[5:0]
                                  | {6{ld_wb_wmb_data_grnt}}  & wmb_ld_wb_vreg[5:0]
                                  | {6{ld_wb_rb_data_grnt}} & rb_ld_wb_vreg[5:0];
//preg expand to 96 bits
//do 3 times for timing
//&Instance("ct_rtu_expand_96","x_lsu_ld_wb_pre_preg_expand");
// //&Connect( .x_num          (ld_wb_pre_preg[6:0]          ), @148
// //          .x_num_expand   (ld_wb_pre_preg_expand[95:0]  )); @149

assign ld_wb_pre_preg_expand[95:0]  = {96{ld_wb_da_data_grnt}} & ld_da_preg_expand[95:0]
                                      | {96{ld_wb_wmb_data_grnt}}  & wmb_ld_wb_preg_expand[95:0]
                                      | {96{ld_wb_rb_data_grnt}} & rb_ld_wb_preg_expand[95:0];

assign ld_wb_pre_vreg_expand[63:0]  = {64{ld_wb_da_data_grnt}} & ld_da_vreg_expand[63:0]
                                      | {64{ld_wb_wmb_data_grnt}}  & wmb_ld_wb_vreg_expand[63:0]
                                      | {64{ld_wb_rb_data_grnt}} & rb_ld_wb_vreg_expand[63:0];

// &Instance("ct_rtu_expand_96","x_lsu_ld_da_preg_expand"); @166
ct_rtu_expand_96  x_lsu_ld_da_preg_expand (
  .x_num                   (ld_da_preg[6:0]        ),
  .x_num_expand            (ld_da_preg_expand[95:0])
);

// &Connect( .x_num          (ld_da_preg[6:0]          ), @167
//           .x_num_expand   (ld_da_preg_expand[95:0]  )); @168

// &Instance("ct_rtu_expand_96","x_lsu_wmb_ld_wb_preg_expand"); @170
ct_rtu_expand_96  x_lsu_wmb_ld_wb_preg_expand (
  .x_num                       (wmb_ld_wb_preg[6:0]        ),
  .x_num_expand                (wmb_ld_wb_preg_expand[95:0])
);

// &Connect( .x_num          (wmb_ld_wb_preg[6:0]          ), @171
//           .x_num_expand   (wmb_ld_wb_preg_expand[95:0]  )); @172

// &Instance("ct_rtu_expand_96","x_lsu_rb_ld_wb_preg_expand"); @174
ct_rtu_expand_96  x_lsu_rb_ld_wb_preg_expand (
  .x_num                      (rb_ld_wb_preg[6:0]        ),
  .x_num_expand               (rb_ld_wb_preg_expand[95:0])
);

// &Connect( .x_num          (rb_ld_wb_preg[6:0]          ), @175
//           .x_num_expand   (rb_ld_wb_preg_expand[95:0]  )); @176

// &Instance("ct_rtu_expand_64","x_lsu_ld_da_vreg_expand"); @178
ct_rtu_expand_64  x_lsu_ld_da_vreg_expand (
  .x_num                   (ld_da_vreg[5:0]        ),
  .x_num_expand            (ld_da_vreg_expand[63:0])
);

// &Connect( .x_num          (ld_da_vreg[5:0]          ), @179
//           .x_num_expand   (ld_da_vreg_expand[63:0]  )); @180

// &Instance("ct_rtu_expand_64","x_lsu_wmb_ld_wb_vreg_expand"); @182
ct_rtu_expand_64  x_lsu_wmb_ld_wb_vreg_expand (
  .x_num                       (wmb_ld_wb_vreg[5:0]        ),
  .x_num_expand                (wmb_ld_wb_vreg_expand[63:0])
);

// &Connect( .x_num          (wmb_ld_wb_vreg[5:0]          ), @183
//           .x_num_expand   (wmb_ld_wb_vreg_expand[63:0]  )); @184

// &Instance("ct_rtu_expand_64","x_lsu_rb_ld_wb_vreg_expand"); @186
ct_rtu_expand_64  x_lsu_rb_ld_wb_vreg_expand (
  .x_num                      (rb_ld_wb_vreg[5:0]        ),
  .x_num_expand               (rb_ld_wb_vreg_expand[63:0])
);

// &Connect( .x_num          (rb_ld_wb_vreg[5:0]          ), @187
//           .x_num_expand   (rb_ld_wb_vreg_expand[63:0]  )); @188

// &Instance("ct_rtu_expand_64","x_lsu_vmb_ld_wb_vreg_expand"); @191
// &Connect( .x_num          (vmb_ld_wb_vreg[5:0]          ), @192
//           .x_num_expand   (vmb_ld_wb_vreg_expand[63:0]  )); @193
assign ld_wb_pre_data_no_da[63:0] = wmb_ld_wb_data_req 
                                    ? wmb_ld_wb_data[63:0]
                                    : rb_ld_wb_data[63:0];

assign ld_wb_pre_data[63:0]       = ld_da_wb_data_req
                                    ? ld_da_wb_data[63:0]
                                    : ld_wb_pre_data_no_da[63:0];

assign ld_wb_pre_inst_vfls    = ld_wb_da_data_grnt  & ld_da_inst_vfls
                                | ld_wb_wmb_data_grnt  & wmb_ld_wb_inst_vfls
                                | ld_wb_rb_data_grnt  & rb_ld_wb_inst_vfls;

assign ld_wb_pre_preg_wb_vld  = ld_wb_pre_data_vld
                                && !ld_wb_pre_inst_vfls;

assign ld_wb_pre_vreg_wb_vld   = ld_wb_pre_data_vld
                                 && ld_wb_pre_inst_vfls; 
//because the timing in ld_da is not enough, so some of the sign extend
//precedure is done in wb stage
assign ld_wb_pre_preg_sign_sel[3:0] = {4{ld_wb_da_data_grnt}} & ld_da_preg_sign_sel[3:0]
                                      | {4{ld_wb_wmb_data_grnt}}  & wmb_ld_wb_preg_sign_sel[3:0]
                                      | {4{ld_wb_rb_data_grnt}} & rb_ld_wb_preg_sign_sel[3:0];

assign ld_wb_pre_vreg_sign_sel[1:0]= {2{ld_wb_da_data_grnt}}  & ld_da_wb_vreg_sign_sel[1:0]
                                     | {2{ld_wb_wmb_data_grnt}}  & wmb_ld_wb_vreg_sign_sel[1:0]
                                     | {2{ld_wb_rb_data_grnt}}  & rb_ld_wb_vreg_sign_sel[1:0];

assign ld_wb_data_pre_vmb_merge_vld = 1'b0;

//for spec fail prediction
assign ld_wb_pre_no_spec_miss    = ld_wb_da_cmplt_grnt &&  ld_da_wb_no_spec_miss; 
assign ld_wb_pre_no_spec_hit     = ld_wb_da_cmplt_grnt &&  ld_da_wb_no_spec_hit; 
assign ld_wb_pre_no_spec_mispred = ld_wb_da_cmplt_grnt &&  ld_da_wb_no_spec_mispred;
//==========================================================
//                 Instance of Gated Cell  
//==========================================================
//------------------cmplt part gateclk----------------------
assign ld_wb_cmplt_clk_en =   ld_da_inst_vld
                              ||  rb_ld_wb_cmplt_req;
// &Instance("gated_clk_cell", "x_lsu_ld_wb_cmplt_gated_clk"); @281
gated_clk_cell  x_lsu_ld_wb_cmplt_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (ld_wb_cmplt_clk   ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (ld_wb_cmplt_clk_en),
  .module_en          (cp0_lsu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in        (forever_cpuclk     ), @282
//          .external_en   (1'b0               ), @283
//          .global_en     (cp0_yy_clk_en      ), @284
//          .module_en     (cp0_lsu_icg_en     ), @285
//          .local_en      (ld_wb_cmplt_clk_en ), @286
//          .clk_out       (ld_wb_cmplt_clk    )); @287

assign ld_wb_expt_clk_en  =   ld_wb_pre_expt_gateclk;
// &Instance("gated_clk_cell", "x_lsu_ld_wb_expt_gated_clk"); @290
gated_clk_cell  x_lsu_ld_wb_expt_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (ld_wb_expt_clk    ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (ld_wb_expt_clk_en ),
  .module_en          (cp0_lsu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in        (forever_cpuclk     ), @291
//          .external_en   (1'b0               ), @292
//          .global_en     (cp0_yy_clk_en      ), @293
//          .module_en     (cp0_lsu_icg_en     ), @294
//          .local_en      (ld_wb_expt_clk_en  ), @295
//          .clk_out       (ld_wb_expt_clk     )); @296

//------------------data part gateclk-----------------------

assign ld_wb_data_clk_en =  ld_wb_pre_data_vld;
// &Instance("gated_clk_cell", "x_lsu_ld_wb_data_gated_clk"); @301
gated_clk_cell  x_lsu_ld_wb_data_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (ld_wb_data_clk    ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (ld_wb_data_clk_en ),
  .module_en          (cp0_lsu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in        (forever_cpuclk     ), @302
//          .external_en   (1'b0               ), @303
//          .global_en     (cp0_yy_clk_en      ), @304
//          .module_en     (cp0_lsu_icg_en     ), @305
//          .local_en      (ld_wb_data_clk_en  ), @306
//          .clk_out       (ld_wb_data_clk     )); @307

assign ld_wb_preg_clk_en =  ld_da_wb_data_req_gateclk_en
                                &&  !ld_da_inst_vfls
                            ||  rb_ld_wb_data_req
                                &&  !rb_ld_wb_inst_vfls
                            ||  wmb_ld_wb_data_req
                                &&  !wmb_ld_wb_inst_vfls;
// &Instance("gated_clk_cell", "x_lsu_ld_wb_preg_gated_clk"); @315
gated_clk_cell  x_lsu_ld_wb_preg_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (ld_wb_preg_clk    ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (ld_wb_preg_clk_en ),
  .module_en          (cp0_lsu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in        (forever_cpuclk     ), @316
//          .external_en   (1'b0               ), @317
//          .global_en     (cp0_yy_clk_en      ), @318
//          .module_en     (cp0_lsu_icg_en     ), @319
//          .local_en      (ld_wb_preg_clk_en  ), @320
//          .clk_out       (ld_wb_preg_clk     )); @321

assign ld_wb_vreg_clk_en =  ld_da_wb_data_req_gateclk_en
                                &&  ld_da_inst_vfls
                            ||  rb_ld_wb_data_req
                                &&  rb_ld_wb_inst_vfls
                            ||  wmb_ld_wb_data_req
                                &&  wmb_ld_wb_inst_vfls;

// &Instance("gated_clk_cell", "x_lsu_ld_wb_vreg_gated_clk"); @341
gated_clk_cell  x_lsu_ld_wb_vreg_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (ld_wb_vreg_clk    ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (ld_wb_vreg_clk_en ),
  .module_en          (cp0_lsu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in        (forever_cpuclk     ), @342
//          .external_en   (1'b0               ), @343
//          .global_en     (cp0_yy_clk_en      ), @344
//          .module_en     (cp0_lsu_icg_en     ), @345
//          .local_en      (ld_wb_vreg_clk_en  ), @346
//          .clk_out       (ld_wb_vreg_clk     )); @347

//assign ld_wb_bus_err_info_clk_en  = rb_ld_wb_data_req
//                                    &&  rb_ld_wb_bus_err;
//&Instance("gated_clk_cell", "x_lsu_ld_wb_bus_err_info_gated_clk");
// //&Connect(.clk_in        (forever_cpuclk     ), @352
// //         .external_en   (1'b0               ), @353
// //         .global_en     (cp0_yy_clk_en      ), @354
// //         .module_en     (cp0_lsu_icg_en     ), @355
// //         .local_en      (ld_wb_bus_err_info_clk_en), @356
// //         .clk_out       (ld_wb_bus_err_info_clk)); @357

//==========================================================
//                 Pipeline Register
//==========================================================
//------------------complete part---------------------------
//+----------+----------+
//| inst_vld | expt_vld |
//+----------+----------+
// &Force("output","ld_wb_inst_vld"); @366
always @(posedge ctrl_ld_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    ld_wb_inst_vld      <=  1'b0;
  else if(rtu_yy_xx_flush)
    ld_wb_inst_vld      <=  1'b0;
  else if(ld_wb_pre_inst_vld)
    ld_wb_inst_vld      <=  1'b1;
  else
    ld_wb_inst_vld      <=  1'b0;
end

//+-----+---------------+-------+-------+
//| iid | rar_spec_fail | bkpta | bkptb |
//+-----+---------------+-------+-------+
always @(posedge ld_wb_cmplt_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
  begin
    ld_wb_expt_vld        <=  1'b0;
    ld_wb_iid[6:0]        <=  7'b0;
    ld_wb_spec_fail       <=  1'b0;
    ld_wb_flush           <=  1'b0;
    ld_wb_bkpta_data      <=  1'b0;
    ld_wb_bkptb_data      <=  1'b0;
    ld_wb_no_spec_miss    <=  1'b0;
    ld_wb_no_spec_hit     <=  1'b0;
    ld_wb_no_spec_mispred <=  1'b0;
  end
  else if(ld_wb_pre_inst_vld)
  begin
    ld_wb_expt_vld        <=  ld_wb_pre_expt_vld;
    ld_wb_iid[6:0]        <=  ld_wb_pre_iid[6:0];
    ld_wb_spec_fail       <=  ld_wb_pre_spec_fail;
    ld_wb_flush           <=  ld_wb_pre_flush;
    ld_wb_bkpta_data      <=  ld_wb_pre_bkpta_data;
    ld_wb_bkptb_data      <=  ld_wb_pre_bkptb_data;
    ld_wb_no_spec_miss    <=  ld_wb_pre_no_spec_miss;
    ld_wb_no_spec_hit     <=  ld_wb_pre_no_spec_hit;
    ld_wb_no_spec_mispred <=  ld_wb_pre_no_spec_mispred;
  end
end

//+----------+---------+-----------+
//| expt_vec | bad_vpn | dmmu_expt |
//+----------+---------+-----------+
always @(posedge ld_wb_expt_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
  begin
    ld_wb_expt_vec[4:0]           <=  5'b0;
    ld_wb_mt_value[`PA_WIDTH-1:0] <=  {`PA_WIDTH{1'b0}};
  end
  else if(ld_wb_pre_expt_vld || ld_wb_pre_vsetvl)
  begin
    ld_wb_expt_vec[4:0]           <=  ld_wb_pre_expt_vec[4:0];
    ld_wb_mt_value[`PA_WIDTH-1:0] <=  ld_wb_pre_mt_value[`PA_WIDTH-1:0];
  end
end

//------------------data part-------------------------------
//+----------+---------+
//| data_vld | bus_err |
//+----------+---------+
// &Force("output","ld_wb_data_vld"); @445
always @(posedge ctrl_ld_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
  begin
    ld_wb_data_vld          <=  1'b0;
    ld_wb_preg_wb_vld       <=  1'b0;
    ld_wb_preg_wb_vld_dup0  <=  1'b0;
    ld_wb_preg_wb_vld_dup1  <=  1'b0;
    ld_wb_preg_wb_vld_dup2  <=  1'b0;
    ld_wb_preg_wb_vld_dup3  <=  1'b0;
    ld_wb_preg_wb_vld_dup4  <=  1'b0;
    ld_wb_vreg_wb_vld       <=  1'b0;
    ld_wb_vreg_wb_vld_dup0  <=  1'b0;
    ld_wb_vreg_wb_vld_dup1  <=  1'b0;
    ld_wb_vreg_wb_vld_dup2  <=  1'b0;
    ld_wb_vreg_wb_vld_dup3  <=  1'b0;
  end
  else if(rtu_yy_xx_flush)
  begin
    ld_wb_data_vld          <=  1'b0;
    ld_wb_preg_wb_vld       <=  1'b0;
    ld_wb_preg_wb_vld_dup0  <=  1'b0;
    ld_wb_preg_wb_vld_dup1  <=  1'b0;
    ld_wb_preg_wb_vld_dup2  <=  1'b0;
    ld_wb_preg_wb_vld_dup3  <=  1'b0;
    ld_wb_preg_wb_vld_dup4  <=  1'b0;
    ld_wb_vreg_wb_vld       <=  1'b0;
    ld_wb_vreg_wb_vld_dup0  <=  1'b0;
    ld_wb_vreg_wb_vld_dup1  <=  1'b0;
    ld_wb_vreg_wb_vld_dup2  <=  1'b0;
    ld_wb_vreg_wb_vld_dup3  <=  1'b0;
  end
  else if(ld_wb_pre_data_vld)
  begin
    ld_wb_data_vld          <=  1'b1;
    ld_wb_preg_wb_vld       <=  ld_wb_pre_preg_wb_vld;
    ld_wb_preg_wb_vld_dup0  <=  ld_wb_pre_preg_wb_vld;
    ld_wb_preg_wb_vld_dup1  <=  ld_wb_pre_preg_wb_vld;
    ld_wb_preg_wb_vld_dup2  <=  ld_wb_pre_preg_wb_vld;
    ld_wb_preg_wb_vld_dup3  <=  ld_wb_pre_preg_wb_vld;
    ld_wb_preg_wb_vld_dup4  <=  ld_wb_pre_preg_wb_vld;
    ld_wb_vreg_wb_vld       <=  ld_wb_pre_vreg_wb_vld && !ld_wb_data_pre_vmb_merge_vld;
    ld_wb_vreg_wb_vld_dup0  <=  ld_wb_pre_vreg_wb_vld && !ld_wb_data_pre_vmb_merge_vld;
    ld_wb_vreg_wb_vld_dup1  <=  ld_wb_pre_vreg_wb_vld && !ld_wb_data_pre_vmb_merge_vld;
    ld_wb_vreg_wb_vld_dup2  <=  ld_wb_pre_vreg_wb_vld && !ld_wb_data_pre_vmb_merge_vld;
    ld_wb_vreg_wb_vld_dup3  <=  ld_wb_pre_vreg_wb_vld && !ld_wb_data_pre_vmb_merge_vld;
  end
  else
  begin
    ld_wb_data_vld          <=  1'b0;
    ld_wb_preg_wb_vld       <=  1'b0;
    ld_wb_preg_wb_vld_dup0  <=  1'b0;
    ld_wb_preg_wb_vld_dup1  <=  1'b0;
    ld_wb_preg_wb_vld_dup2  <=  1'b0;
    ld_wb_preg_wb_vld_dup3  <=  1'b0;
    ld_wb_preg_wb_vld_dup4  <=  1'b0;
    ld_wb_vreg_wb_vld       <=  1'b0;
    ld_wb_vreg_wb_vld_dup0  <=  1'b0;
    ld_wb_vreg_wb_vld_dup1  <=  1'b0;
    ld_wb_vreg_wb_vld_dup2  <=  1'b0;
    ld_wb_vreg_wb_vld_dup3  <=  1'b0;
  end
end


always @(posedge ctrl_ld_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    ld_wb_bus_err       <=  1'b0;
  else if(rtu_yy_xx_flush)
    ld_wb_bus_err       <=  1'b0;
  else if(ld_wb_pre_data_vld)
    ld_wb_bus_err       <=  ld_wb_pre_bus_err;
  else
    ld_wb_bus_err       <=  1'b0;
end

always @(posedge ld_wb_data_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
  begin
    ld_wb_data_addr[`PA_WIDTH-1:0] <=  {`PA_WIDTH{1'b0}};
    ld_wb_data_iid[6:0]            <=  7'b0;
  end
  else if(ld_wb_pre_data_vld)
  begin
    ld_wb_data_addr[`PA_WIDTH-1:0] <=  ld_wb_pre_data_addr[`PA_WIDTH-1:0];
    ld_wb_data_iid[6:0]            <=  ld_wb_pre_data_iid[6:0];
  end
end

//+------+----------+------+
//| data | sign_sel | sign |
//+------+----------+------+
always @(posedge ld_wb_data_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
  begin
    ld_wb_data[63:0]              <=  64'b0;
  end
  else if(ld_wb_pre_data_vld)
  begin
    ld_wb_data[63:0]              <=  ld_wb_pre_data[63:0];
  end
end



//+------+
//| preg |
//+------+
always @(posedge ld_wb_preg_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
  begin
    ld_wb_data_preg[6:0]          <=  7'b0;
    ld_wb_data_preg_dup0[6:0]     <=  7'b0;
    ld_wb_data_preg_dup1[6:0]     <=  7'b0;
    ld_wb_data_preg_dup2[6:0]     <=  7'b0;
    ld_wb_data_preg_dup3[6:0]     <=  7'b0;
    ld_wb_data_preg_dup4[6:0]     <=  7'b0;
    ld_wb_data_preg_expand[95:0]  <=  96'b0;
    ld_wb_preg_sign_sel[3:0]      <=  4'b0;
  end
  else if(ld_wb_pre_preg_wb_vld)
  begin
    ld_wb_data_preg[6:0]          <=  ld_wb_pre_preg[6:0];
    ld_wb_data_preg_dup0[6:0]     <=  ld_wb_pre_preg[6:0];
    ld_wb_data_preg_dup1[6:0]     <=  ld_wb_pre_preg[6:0];
    ld_wb_data_preg_dup2[6:0]     <=  ld_wb_pre_preg[6:0];
    ld_wb_data_preg_dup3[6:0]     <=  ld_wb_pre_preg[6:0];
    ld_wb_data_preg_dup4[6:0]     <=  ld_wb_pre_preg[6:0];
    ld_wb_data_preg_expand[95:0]  <=  ld_wb_pre_preg_expand[95:0];
    ld_wb_preg_sign_sel[3:0]      <=  ld_wb_pre_preg_sign_sel[3:0];
  end
end

//+------+
//| vreg |
//+------+
always @(posedge ld_wb_vreg_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
  begin
    ld_wb_data_vreg[5:0]          <=  6'b0;
    ld_wb_data_vreg_dup0[5:0]     <=  6'b0;
    ld_wb_data_vreg_dup1[5:0]     <=  6'b0;
    ld_wb_data_vreg_dup2[5:0]     <=  6'b0;
    ld_wb_data_vreg_dup3[5:0]     <=  6'b0;
    ld_wb_data_vreg_expand[63:0]  <=  64'b0;
    ld_wb_vreg_sign_sel[1:0]      <=  2'b0;
  end
  else if(ld_wb_pre_vreg_wb_vld)
  begin
    ld_wb_data_vreg[5:0]          <=  ld_wb_pre_vreg[5:0];
    ld_wb_data_vreg_dup0[5:0]     <=  ld_wb_pre_vreg[5:0];
    ld_wb_data_vreg_dup1[5:0]     <=  ld_wb_pre_vreg[5:0];
    ld_wb_data_vreg_dup2[5:0]     <=  ld_wb_pre_vreg[5:0];
    ld_wb_data_vreg_dup3[5:0]     <=  ld_wb_pre_vreg[5:0];
    ld_wb_data_vreg_expand[63:0]  <=  ld_wb_pre_vreg_expand[63:0];
    ld_wb_vreg_sign_sel[1:0]      <=  ld_wb_pre_vreg_sign_sel[1:0];
  end
end

//==========================================================
//            Data settle and Sign extend
//==========================================================
//sign extend
assign ld_wb_data_sign0[63:0]       = ld_wb_data[63:0];
assign ld_wb_data_sign1[63:0]       = {{56{ld_wb_data[7]}},ld_wb_data[7:0]};
assign ld_wb_data_sign2[63:0]       = {{48{ld_wb_data[15]}},ld_wb_data[15:0]};
assign ld_wb_data_sign3[63:0]       = {{32{ld_wb_data[31]}},ld_wb_data[31:0]};

assign ld_wb_preg_data_sign_extend[63:0]  = {64{ld_wb_preg_sign_sel[3]}} & ld_wb_data_sign3[63:0]
                                            | {64{ld_wb_preg_sign_sel[2]}} & ld_wb_data_sign2[63:0]
                                            | {64{ld_wb_preg_sign_sel[1]}} & ld_wb_data_sign1[63:0]
                                            | {64{ld_wb_preg_sign_sel[0]}} & ld_wb_data_sign0[63:0];

//vector data
// &CombBeg; @680
// &CombEnd; @731
// &CombBeg; @733
always @( ld_wb_vreg_sign_sel[1:0]
       or ld_wb_data[63:0])
begin
case(ld_wb_vreg_sign_sel[1:0])
  2'b01:ld_wb_vreg_data_sign_extend[63:0] = {{48{1'b1}},ld_wb_data[15:0]};
  2'b10:ld_wb_vreg_data_sign_extend[63:0] = {{32{1'b1}},ld_wb_data[31:0]};
  default:ld_wb_vreg_data_sign_extend[63:0] = ld_wb_data[63:0];
endcase
// &CombEnd; @739
end
//==========================================================
//                 Generate interface to rtu
//==========================================================
//------------------complete part---------------------------
assign lsu_rtu_wb_pipe3_cmplt         = ld_wb_inst_vld;
assign lsu_rtu_wb_pipe3_iid[6:0]      = ld_wb_iid[6:0]; 
assign lsu_rtu_wb_pipe3_expt_vld      = ld_wb_expt_vld;
assign lsu_rtu_wb_pipe3_expt_vec[4:0] = ld_wb_expt_vec[4:0];
assign lsu_rtu_wb_pipe3_mtval[`PA_WIDTH-1:0]  = ld_wb_mt_value[`PA_WIDTH-1:0];
assign lsu_rtu_wb_pipe3_spec_fail     = ld_wb_spec_fail;
assign lsu_rtu_wb_pipe3_bkpta_data    = ld_wb_bkpta_data;
assign lsu_rtu_wb_pipe3_bkptb_data    = ld_wb_bkptb_data;
assign lsu_rtu_wb_pipe3_flush         = ld_wb_flush;
assign lsu_rtu_wb_pipe3_abnormal      = ld_wb_expt_vld
                                        ||  ld_wb_flush;

assign lsu_rtu_wb_pipe3_no_spec_miss    = ld_wb_no_spec_miss;
assign lsu_rtu_wb_pipe3_no_spec_hit     = ld_wb_no_spec_hit;
assign lsu_rtu_wb_pipe3_no_spec_mispred = ld_wb_no_spec_mispred;

//------------------data part-------------------------------
assign lsu_rtu_wb_pipe3_wb_preg_vld           = ld_wb_preg_wb_vld;
assign lsu_rtu_wb_pipe3_wb_preg_expand[95:0]  = ld_wb_data_preg_expand[95:0];

assign lsu_rtu_async_expt_vld                 = ld_wb_data_vld
                                                    &&  ld_wb_bus_err;

assign lsu_rtu_async_expt_addr[`PA_WIDTH-1:0] = (ld_wb_data_vld  &&  ld_wb_bus_err)
                                                ? ld_wb_data_addr[`PA_WIDTH-1:0]
                                                : {`PA_WIDTH{1'b0}};

assign lsu_idu_wb_pipe3_wb_preg_vld           = ld_wb_preg_wb_vld;
assign lsu_idu_wb_pipe3_wb_preg_vld_dup0      = ld_wb_preg_wb_vld_dup0;
assign lsu_idu_wb_pipe3_wb_preg_vld_dup1      = ld_wb_preg_wb_vld_dup1;
assign lsu_idu_wb_pipe3_wb_preg_vld_dup2      = ld_wb_preg_wb_vld_dup2;
assign lsu_idu_wb_pipe3_wb_preg_vld_dup3      = ld_wb_preg_wb_vld_dup3;
assign lsu_idu_wb_pipe3_wb_preg_vld_dup4      = ld_wb_preg_wb_vld_dup4;
assign lsu_idu_wb_pipe3_wb_preg[6:0]          = ld_wb_data_preg[6:0];
assign lsu_idu_wb_pipe3_wb_preg_dup0[6:0]     = ld_wb_data_preg_dup0[6:0];
assign lsu_idu_wb_pipe3_wb_preg_dup1[6:0]     = ld_wb_data_preg_dup1[6:0];
assign lsu_idu_wb_pipe3_wb_preg_dup2[6:0]     = ld_wb_data_preg_dup2[6:0];
assign lsu_idu_wb_pipe3_wb_preg_dup3[6:0]     = ld_wb_data_preg_dup3[6:0];
assign lsu_idu_wb_pipe3_wb_preg_dup4[6:0]     = ld_wb_data_preg_dup4[6:0];
assign lsu_idu_wb_pipe3_wb_preg_expand[95:0]  = ld_wb_data_preg_expand[95:0];
assign lsu_idu_wb_pipe3_wb_preg_data[63:0]    = ld_wb_preg_data_sign_extend[63:0];

//------------------for vector------------------------
assign lsu_rtu_wb_pipe3_wb_vreg_fr_vld          = ld_wb_vreg_wb_vld;
assign lsu_rtu_wb_pipe3_wb_vreg_vr_vld          = 1'b0;
assign lsu_rtu_wb_pipe3_wb_vreg_expand[63:0]    = ld_wb_data_vreg_expand[63:0];

assign lsu_idu_wb_pipe3_wb_vreg_fr_vld          = ld_wb_vreg_wb_vld;
assign lsu_idu_wb_pipe3_wb_vreg_fr_expand[63:0] = ld_wb_data_vreg_expand[63:0];
assign lsu_idu_wb_pipe3_wb_vreg_fr_data[63:0]   = ld_wb_vreg_data_sign_extend[63:0];

assign lsu_idu_wb_pipe3_wb_vreg_vr0_vld = 1'b0;
assign lsu_idu_wb_pipe3_wb_vreg_vr0_expand[63:0] = 64'b0;
assign lsu_idu_wb_pipe3_wb_vreg_vr0_data[63:0] = 64'b0;
assign lsu_idu_wb_pipe3_wb_vreg_vr1_vld = 1'b0;
assign lsu_idu_wb_pipe3_wb_vreg_vr1_expand[63:0] = 64'b0;
assign lsu_idu_wb_pipe3_wb_vreg_vr1_data[63:0] = 64'b0;

assign lsu_idu_wb_pipe3_fwd_vreg_vld  = ld_wb_vreg_wb_vld;
assign lsu_idu_wb_pipe3_fwd_vreg[6:0] = {1'b0,ld_wb_data_vreg[5:0]};

assign lsu_idu_wb_pipe3_wb_vreg_vld_dup0         = ld_wb_vreg_wb_vld_dup0;
assign lsu_idu_wb_pipe3_wb_vreg_vld_dup1         = ld_wb_vreg_wb_vld_dup1;
assign lsu_idu_wb_pipe3_wb_vreg_vld_dup2         = ld_wb_vreg_wb_vld_dup2;
assign lsu_idu_wb_pipe3_wb_vreg_vld_dup3         = ld_wb_vreg_wb_vld_dup3;
assign lsu_idu_wb_pipe3_wb_vreg_dup0[6:0]        = {1'b0,ld_wb_data_vreg_dup0[5:0]};
assign lsu_idu_wb_pipe3_wb_vreg_dup1[6:0]        = {1'b0,ld_wb_data_vreg_dup1[5:0]};
assign lsu_idu_wb_pipe3_wb_vreg_dup2[6:0]        = {1'b0,ld_wb_data_vreg_dup2[5:0]};
assign lsu_idu_wb_pipe3_wb_vreg_dup3[6:0]        = {1'b0,ld_wb_data_vreg_dup3[5:0]};
//assign lsu_idu_wb_pipe3_wb_vreg_data[63:0]   = ld_wb_vreg_data_sign_extend[63:0];
//assign lsu_idu_wb_pipe3_wb_vreg_expand[63:0] = ld_wb_data_vreg_expand[63:0];


//==========================================================
//                 Generate interface to rtu
//==========================================================
assign wb_dbg_ld_req  = ld_wb_preg_wb_vld;


assign wb_dbg_clk_en  = had_lsu_dbg_en
                        &&  (wb_dbg_ld_req
                            ||  wb_dbg_ld_req_ff);

// &Instance("gated_clk_cell", "x_lsu_wb_dbg_gated_clk"); @923
gated_clk_cell  x_lsu_wb_dbg_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (wb_dbg_clk        ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (wb_dbg_clk_en     ),
  .module_en          (cp0_lsu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in        (forever_cpuclk     ), @924
//          .external_en   (1'b0               ), @925
//          .global_en     (cp0_yy_clk_en      ), @926
//          .module_en     (cp0_lsu_icg_en     ), @927
//          .local_en      (wb_dbg_clk_en      ), @928
//          .clk_out       (wb_dbg_clk         )); @929
 
always @(posedge wb_dbg_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    wb_dbg_ld_req_ff  <=  1'b0;
  else if(wb_dbg_ld_req)
    wb_dbg_ld_req_ff  <=  1'b1;
  else
    wb_dbg_ld_req_ff  <=  1'b0;
end

always @(posedge wb_dbg_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
  begin
    wb_dbg_ld_addr_ff[`PA_WIDTH-1:0] <=  {`PA_WIDTH{1'b0}};
    wb_dbg_ld_data_ff[63:0] <=  64'b0;
    wb_dbg_ld_iid_ff[6:0]   <=  7'b0;
  end
  else if(wb_dbg_ld_req)
  begin
    wb_dbg_ld_addr_ff[`PA_WIDTH-1:0] <=  ld_wb_data_addr[`PA_WIDTH-1:0];
    wb_dbg_ld_data_ff[63:0] <=  ld_wb_preg_data_sign_extend[63:0];
    wb_dbg_ld_iid_ff[6:0]   <=  ld_wb_data_iid[6:0];
  end
end

//ebiu ar channel
// &Instance("gated_clk_cell", "x_lsu_wb_dbg_ar_gated_clk"); @965
// &Connect(.clk_in        (forever_cpuclk     ), @966
//          .external_en   (1'b0               ), @967
//          .global_en     (cp0_yy_clk_en      ), @968
//          .module_en     (cp0_lsu_icg_en     ), @969
//          .local_en      (wb_dbg_ar_clk_en      ), @970
//          .clk_out       (wb_dbg_ar_clk         )); @971
assign wb_dbg_ar_req_ff              =  1'b0;
assign wb_dbg_ar_addr[`PA_WIDTH-1:0] =  {`PA_WIDTH{1'b0}};
assign wb_dbg_ar_id[7:0]             =  8'b0;
assign wb_dbg_ar_len[7:0]            =  8'b0;
assign wb_dbg_ar_size[2:0]           =  3'b0;
assign wb_dbg_ar_burst[1:0]          =  2'b0;
assign wb_dbg_ar_lock                =  1'b0;
assign wb_dbg_ar_cache[3:0]          =  4'b0;
assign wb_dbg_ar_prot[2:0]           =  3'b0;
assign wb_dbg_ar_snoop[3:0]          =  4'b0;
assign wb_dbg_ar_domain[1:0]         =  2'b0;
assign wb_dbg_ar_bar[1:0]            =  2'b0;

assign lsu_had_ld_req         = had_lsu_bus_trace_en
                                ? wb_dbg_ar_req_ff
                                : wb_dbg_ld_req_ff;
assign lsu_had_ld_addr[`PA_WIDTH-1:0]  = had_lsu_bus_trace_en
                                         ? wb_dbg_ar_addr[`PA_WIDTH-1:0]
                                         : wb_dbg_ld_addr_ff[`PA_WIDTH-1:0];
assign lsu_had_ld_data[63:0]  = had_lsu_bus_trace_en
                                ? {27'b0,
                                   wb_dbg_ar_bar[1:0],
                                   wb_dbg_ar_domain[1:0],
                                   wb_dbg_ar_snoop[3:0],
                                   wb_dbg_ar_prot[2:0],
                                   wb_dbg_ar_cache[3:0],
                                   wb_dbg_ar_lock,
                                   wb_dbg_ar_burst[1:0],
                                   wb_dbg_ar_size[2:0],
                                   wb_dbg_ar_len[7:0],
                                   wb_dbg_ar_id[7:0]}
                                : wb_dbg_ld_data_ff[63:0];
assign lsu_had_ld_iid[6:0]    = had_lsu_bus_trace_en
                                ? 7'b0
                                : wb_dbg_ld_iid_ff[6:0];

assign lsu_had_ld_type[3:0]   = had_lsu_bus_trace_en
                                ? 4'd4
                                : 4'd2;

// &ModuleEnd; @1056
endmodule


