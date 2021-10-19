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
module ct_had_private_top(
  biu_had_coreid,
  biu_had_sdb_req_b,
  cp0_had_cpuid_0,
  cp0_had_debug_info,
  cp0_had_lpmd_b,
  cp0_had_trace_pm_wdata,
  cp0_had_trace_pm_wen,
  cp0_yy_priv_mode,
  cpuclk,
  cpurst_b,
  forever_coreclk,
  had_biu_jdb_pm,
  had_cp0_xx_dbg,
  had_idu_debug_id_inst_en,
  had_idu_wbbr_data,
  had_idu_wbbr_vld,
  had_ifu_ir,
  had_ifu_ir_vld,
  had_ifu_pc,
  had_ifu_pcload,
  had_lsu_bus_trace_en,
  had_lsu_dbg_en,
  had_rtu_data_bkpt_dbgreq,
  had_rtu_dbg_disable,
  had_rtu_dbg_req_en,
  had_rtu_debug_retire_info_en,
  had_rtu_event_dbgreq,
  had_rtu_fdb,
  had_rtu_hw_dbgreq,
  had_rtu_hw_dbgreq_gateclk,
  had_rtu_inst_bkpt_dbgreq,
  had_rtu_non_irv_bkpt_dbgreq,
  had_rtu_pop1_disa,
  had_rtu_trace_dbgreq,
  had_rtu_trace_en,
  had_rtu_xx_jdbreq,
  had_rtu_xx_tme,
  had_xx_clk_en,
  had_yy_xx_bkpta_base,
  had_yy_xx_bkpta_mask,
  had_yy_xx_bkpta_rc,
  had_yy_xx_bkptb_base,
  had_yy_xx_bkptb_mask,
  had_yy_xx_bkptb_rc,
  had_yy_xx_exit_dbg,
  idu_had_debug_info,
  idu_had_id_inst0_info,
  idu_had_id_inst0_vld,
  idu_had_id_inst1_info,
  idu_had_id_inst1_vld,
  idu_had_id_inst2_info,
  idu_had_id_inst2_vld,
  idu_had_iq_empty,
  idu_had_pipe_stall,
  idu_had_pipeline_empty,
  idu_had_wb_data,
  idu_had_wb_vld,
  ifu_had_debug_info,
  ifu_had_no_inst,
  ifu_had_no_op,
  ifu_had_reset_on,
  ir_corex_wdata,
  iu_had_debug_info,
  lsu_had_debug_info,
  lsu_had_ld_addr,
  lsu_had_ld_data,
  lsu_had_ld_iid,
  lsu_had_ld_req,
  lsu_had_ld_type,
  lsu_had_no_op,
  lsu_had_st_addr,
  lsu_had_st_data,
  lsu_had_st_iid,
  lsu_had_st_req,
  lsu_had_st_type,
  mmu_had_debug_info,
  mmu_xx_mmu_en,
  rtu_had_bkpt_data_st,
  rtu_had_data_bkpta_vld,
  rtu_had_data_bkptb_vld,
  rtu_had_dbg_ack_info,
  rtu_had_dbgreq_ack,
  rtu_had_debug_info,
  rtu_had_inst0_bkpt_inst,
  rtu_had_inst0_non_irv_bkpt,
  rtu_had_inst1_non_irv_bkpt,
  rtu_had_inst2_non_irv_bkpt,
  rtu_had_inst_bkpt_inst_vld,
  rtu_had_inst_bkpta_vld,
  rtu_had_inst_bkptb_vld,
  rtu_had_inst_exe_dead,
  rtu_had_inst_not_wb,
  rtu_had_inst_split,
  rtu_had_retire_inst0_info,
  rtu_had_retire_inst0_vld,
  rtu_had_retire_inst1_info,
  rtu_had_retire_inst1_vld,
  rtu_had_retire_inst2_info,
  rtu_had_retire_inst2_vld,
  rtu_had_rob_empty,
  rtu_had_xx_dbg_ack_pc,
  rtu_had_xx_mbkpt_chgflow,
  rtu_had_xx_mbkpt_data_ack,
  rtu_had_xx_mbkpt_inst_ack,
  rtu_had_xx_pc,
  rtu_had_xx_pcfifo_inst0_chgflow,
  rtu_had_xx_pcfifo_inst0_condbr,
  rtu_had_xx_pcfifo_inst0_condbr_taken,
  rtu_had_xx_pcfifo_inst0_iid,
  rtu_had_xx_pcfifo_inst0_jmp,
  rtu_had_xx_pcfifo_inst0_next_pc,
  rtu_had_xx_pcfifo_inst0_pcall,
  rtu_had_xx_pcfifo_inst0_preturn,
  rtu_had_xx_pcfifo_inst1_chgflow,
  rtu_had_xx_pcfifo_inst1_condbr,
  rtu_had_xx_pcfifo_inst1_condbr_taken,
  rtu_had_xx_pcfifo_inst1_jmp,
  rtu_had_xx_pcfifo_inst1_next_pc,
  rtu_had_xx_pcfifo_inst1_pcall,
  rtu_had_xx_pcfifo_inst1_preturn,
  rtu_had_xx_pcfifo_inst2_chgflow,
  rtu_had_xx_pcfifo_inst2_condbr,
  rtu_had_xx_pcfifo_inst2_condbr_taken,
  rtu_had_xx_pcfifo_inst2_jmp,
  rtu_had_xx_pcfifo_inst2_next_pc,
  rtu_had_xx_pcfifo_inst2_pcall,
  rtu_had_xx_pcfifo_inst2_preturn,
  rtu_had_xx_split_inst,
  rtu_yy_xx_dbgon,
  rtu_yy_xx_flush,
  rtu_yy_xx_retire0,
  rtu_yy_xx_retire0_normal,
  rtu_yy_xx_retire1,
  rtu_yy_xx_retire2,
  sm_update_dr,
  sm_update_ir,
  x_dbg_ack_pc,
  x_enter_dbg_req_i,
  x_enter_dbg_req_o,
  x_exit_dbg_req_i,
  x_exit_dbg_req_o,
  x_had_dbg_mask,
  x_regs_serial_data
);

// &Ports; @24
input   [1  :0]  biu_had_coreid;                 
input            biu_had_sdb_req_b;              
input   [31 :0]  cp0_had_cpuid_0;                
input   [3  :0]  cp0_had_debug_info;             
input   [1  :0]  cp0_had_lpmd_b;                 
input   [1  :0]  cp0_had_trace_pm_wdata;         
input            cp0_had_trace_pm_wen;           
input   [1  :0]  cp0_yy_priv_mode;               
input            cpuclk;                         
input            cpurst_b;                       
input            forever_coreclk;                
input   [49 :0]  idu_had_debug_info;             
input   [39 :0]  idu_had_id_inst0_info;          
input            idu_had_id_inst0_vld;           
input   [39 :0]  idu_had_id_inst1_info;          
input            idu_had_id_inst1_vld;           
input   [39 :0]  idu_had_id_inst2_info;          
input            idu_had_id_inst2_vld;           
input            idu_had_iq_empty;               
input            idu_had_pipe_stall;             
input            idu_had_pipeline_empty;         
input   [63 :0]  idu_had_wb_data;                
input            idu_had_wb_vld;                 
input   [82 :0]  ifu_had_debug_info;             
input            ifu_had_no_inst;                
input            ifu_had_no_op;                  
input            ifu_had_reset_on;               
input   [63 :0]  ir_corex_wdata;                 
input   [9  :0]  iu_had_debug_info;              
input   [183:0]  lsu_had_debug_info;             
input   [39 :0]  lsu_had_ld_addr;                
input   [63 :0]  lsu_had_ld_data;                
input   [6  :0]  lsu_had_ld_iid;                 
input            lsu_had_ld_req;                 
input   [3  :0]  lsu_had_ld_type;                
input            lsu_had_no_op;                  
input   [39 :0]  lsu_had_st_addr;                
input   [63 :0]  lsu_had_st_data;                
input   [6  :0]  lsu_had_st_iid;                 
input            lsu_had_st_req;                 
input   [3  :0]  lsu_had_st_type;                
input   [33 :0]  mmu_had_debug_info;             
input            mmu_xx_mmu_en;                  
input            rtu_had_bkpt_data_st;           
input            rtu_had_data_bkpta_vld;         
input            rtu_had_data_bkptb_vld;         
input            rtu_had_dbg_ack_info;           
input            rtu_had_dbgreq_ack;             
input   [42 :0]  rtu_had_debug_info;             
input            rtu_had_inst0_bkpt_inst;        
input   [3  :0]  rtu_had_inst0_non_irv_bkpt;     
input   [3  :0]  rtu_had_inst1_non_irv_bkpt;     
input   [3  :0]  rtu_had_inst2_non_irv_bkpt;     
input            rtu_had_inst_bkpt_inst_vld;     
input            rtu_had_inst_bkpta_vld;         
input            rtu_had_inst_bkptb_vld;         
input            rtu_had_inst_exe_dead;          
input            rtu_had_inst_not_wb;            
input            rtu_had_inst_split;             
input   [63 :0]  rtu_had_retire_inst0_info;      
input            rtu_had_retire_inst0_vld;       
input   [63 :0]  rtu_had_retire_inst1_info;      
input            rtu_had_retire_inst1_vld;       
input   [63 :0]  rtu_had_retire_inst2_info;      
input            rtu_had_retire_inst2_vld;       
input            rtu_had_rob_empty;              
input            rtu_had_xx_dbg_ack_pc;          
input            rtu_had_xx_mbkpt_chgflow;       
input            rtu_had_xx_mbkpt_data_ack;      
input            rtu_had_xx_mbkpt_inst_ack;      
input   [38 :0]  rtu_had_xx_pc;                  
input            rtu_had_xx_pcfifo_inst0_chgflow; 
input            rtu_had_xx_pcfifo_inst0_condbr; 
input            rtu_had_xx_pcfifo_inst0_condbr_taken; 
input   [6  :0]  rtu_had_xx_pcfifo_inst0_iid;    
input            rtu_had_xx_pcfifo_inst0_jmp;    
input   [38 :0]  rtu_had_xx_pcfifo_inst0_next_pc; 
input            rtu_had_xx_pcfifo_inst0_pcall;  
input            rtu_had_xx_pcfifo_inst0_preturn; 
input            rtu_had_xx_pcfifo_inst1_chgflow; 
input            rtu_had_xx_pcfifo_inst1_condbr; 
input            rtu_had_xx_pcfifo_inst1_condbr_taken; 
input            rtu_had_xx_pcfifo_inst1_jmp;    
input   [38 :0]  rtu_had_xx_pcfifo_inst1_next_pc; 
input            rtu_had_xx_pcfifo_inst1_pcall;  
input            rtu_had_xx_pcfifo_inst1_preturn; 
input            rtu_had_xx_pcfifo_inst2_chgflow; 
input            rtu_had_xx_pcfifo_inst2_condbr; 
input            rtu_had_xx_pcfifo_inst2_condbr_taken; 
input            rtu_had_xx_pcfifo_inst2_jmp;    
input   [38 :0]  rtu_had_xx_pcfifo_inst2_next_pc; 
input            rtu_had_xx_pcfifo_inst2_pcall;  
input            rtu_had_xx_pcfifo_inst2_preturn; 
input            rtu_had_xx_split_inst;          
input            rtu_yy_xx_dbgon;                
input            rtu_yy_xx_flush;                
input            rtu_yy_xx_retire0;              
input            rtu_yy_xx_retire0_normal;       
input            rtu_yy_xx_retire1;              
input            rtu_yy_xx_retire2;              
input            sm_update_dr;                   
input            sm_update_ir;                   
input            x_enter_dbg_req_i;              
input            x_exit_dbg_req_i;               
input            x_had_dbg_mask;                 
output  [1  :0]  had_biu_jdb_pm;                 
output           had_cp0_xx_dbg;                 
output           had_idu_debug_id_inst_en;       
output  [63 :0]  had_idu_wbbr_data;              
output           had_idu_wbbr_vld;               
output  [31 :0]  had_ifu_ir;                     
output           had_ifu_ir_vld;                 
output  [38 :0]  had_ifu_pc;                     
output           had_ifu_pcload;                 
output           had_lsu_bus_trace_en;           
output           had_lsu_dbg_en;                 
output           had_rtu_data_bkpt_dbgreq;       
output           had_rtu_dbg_disable;            
output           had_rtu_dbg_req_en;             
output           had_rtu_debug_retire_info_en;   
output           had_rtu_event_dbgreq;           
output           had_rtu_fdb;                    
output           had_rtu_hw_dbgreq;              
output           had_rtu_hw_dbgreq_gateclk;      
output           had_rtu_inst_bkpt_dbgreq;       
output           had_rtu_non_irv_bkpt_dbgreq;    
output           had_rtu_pop1_disa;              
output           had_rtu_trace_dbgreq;           
output           had_rtu_trace_en;               
output           had_rtu_xx_jdbreq;              
output           had_rtu_xx_tme;                 
output           had_xx_clk_en;                  
output  [39 :0]  had_yy_xx_bkpta_base;           
output  [7  :0]  had_yy_xx_bkpta_mask;           
output           had_yy_xx_bkpta_rc;             
output  [39 :0]  had_yy_xx_bkptb_base;           
output  [7  :0]  had_yy_xx_bkptb_mask;           
output           had_yy_xx_bkptb_rc;             
output           had_yy_xx_exit_dbg;             
output           x_dbg_ack_pc;                   
output           x_enter_dbg_req_o;              
output           x_exit_dbg_req_o;               
output  [63 :0]  x_regs_serial_data;             

// &Regs;  @25

// &Wires; @26
wire    [1  :0]  biu_had_coreid;                 
wire             biu_had_sdb_req_b;              
wire    [7  :0]  bkpt_regs_mbca;                 
wire    [7  :0]  bkpt_regs_mbcb;                 
wire             bkpta_ctrl_data_req;            
wire             bkpta_ctrl_data_req_raw;        
wire             bkpta_ctrl_inst_req;            
wire             bkpta_ctrl_inst_req_raw;        
wire             bkpta_ctrl_xx_ack;              
wire             bkptb_ctrl_data_req;            
wire             bkptb_ctrl_data_req_raw;        
wire             bkptb_ctrl_inst_req;            
wire             bkptb_ctrl_inst_req_raw;        
wire             bkptb_ctrl_xx_ack;              
wire    [31 :0]  cp0_had_cpuid_0;                
wire    [3  :0]  cp0_had_debug_info;             
wire    [1  :0]  cp0_had_lpmd_b;                 
wire    [1  :0]  cp0_yy_priv_mode;               
wire             cpuclk;                         
wire             cpurst_b;                       
wire             ctrl_bkpta_en;                  
wire             ctrl_bkpta_en_raw;              
wire             ctrl_bkptb_en;                  
wire             ctrl_bkptb_en_raw;              
wire             ctrl_dbgfifo_ren;               
wire             ctrl_event_dbgenter;            
wire             ctrl_event_dbgexit;             
wire             ctrl_pcfifo_ren;                
wire             ctrl_pcfifo_wen;                
wire             ctrl_pipefifo_ren;              
wire             ctrl_pipefifo_wen;              
wire             ctrl_regs_bkpta_vld;            
wire             ctrl_regs_bkptb_vld;            
wire             ctrl_regs_exit_dbg;             
wire             ctrl_regs_freeze_pcfifo;        
wire             ctrl_regs_set_sqa;              
wire             ctrl_regs_set_sqb;              
wire             ctrl_regs_update_adro;          
wire             ctrl_regs_update_dro;           
wire             ctrl_regs_update_mbo;           
wire             ctrl_regs_update_pro;           
wire             ctrl_regs_update_swo;           
wire             ctrl_regs_update_to;            
wire             ctrl_trace_en;                  
wire             ctrl_xx_dbg_disable;            
wire    [63 :0]  dbgfifo_regs_data;              
wire             ddc_ctrl_dp_addr_gen;           
wire             ddc_ctrl_dp_addr_sel;           
wire             ddc_ctrl_dp_data_sel;           
wire    [63 :0]  ddc_regs_daddr;                 
wire    [63 :0]  ddc_regs_ddata;                 
wire             ddc_regs_ffy;                   
wire    [31 :0]  ddc_regs_ir;                    
wire             ddc_regs_update_csr;            
wire             ddc_regs_update_wbbr;           
wire    [63 :0]  ddc_regs_wbbr;                  
wire             ddc_xx_update_ir;               
wire             event_ctrl_enter_dbg;           
wire             event_ctrl_exit_dbg;            
wire             event_ctrl_had_clk_en;          
wire             forever_coreclk;                
wire    [1  :0]  had_biu_jdb_pm;                 
wire             had_cp0_xx_dbg;                 
wire             had_idu_debug_id_inst_en;       
wire    [63 :0]  had_idu_wbbr_data;              
wire             had_idu_wbbr_vld;               
wire    [31 :0]  had_ifu_ir;                     
wire             had_ifu_ir_vld;                 
wire    [38 :0]  had_ifu_pc;                     
wire             had_ifu_pcload;                 
wire             had_lsu_bus_trace_en;           
wire             had_lsu_dbg_en;                 
wire             had_lsu_dbg_info_en;            
wire             had_lsu_pctrace_en;             
wire             had_rtu_data_bkpt_dbgreq;       
wire             had_rtu_dbg_disable;            
wire             had_rtu_dbg_req_en;             
wire             had_rtu_debug_retire_info_en;   
wire             had_rtu_event_dbgreq;           
wire             had_rtu_fdb;                    
wire             had_rtu_hw_dbgreq;              
wire             had_rtu_hw_dbgreq_gateclk;      
wire             had_rtu_inst_bkpt_dbgreq;       
wire             had_rtu_non_irv_bkpt_dbgreq;    
wire             had_rtu_pop1_disa;              
wire             had_rtu_trace_dbgreq;           
wire             had_rtu_trace_en;               
wire             had_rtu_xx_jdbreq;              
wire             had_rtu_xx_tme;                 
wire             had_xx_clk_en;                  
wire    [39 :0]  had_yy_xx_bkpta_base;           
wire    [7  :0]  had_yy_xx_bkpta_mask;           
wire             had_yy_xx_bkpta_rc;             
wire    [39 :0]  had_yy_xx_bkptb_base;           
wire    [7  :0]  had_yy_xx_bkptb_mask;           
wire             had_yy_xx_bkptb_rc;             
wire             had_yy_xx_exit_dbg;             
wire    [49 :0]  idu_had_debug_info;             
wire    [39 :0]  idu_had_id_inst0_info;          
wire             idu_had_id_inst0_vld;           
wire    [39 :0]  idu_had_id_inst1_info;          
wire             idu_had_id_inst1_vld;           
wire    [39 :0]  idu_had_id_inst2_info;          
wire             idu_had_id_inst2_vld;           
wire             idu_had_iq_empty;               
wire             idu_had_pipe_stall;             
wire             idu_had_pipeline_empty;         
wire    [63 :0]  idu_had_wb_data;                
wire             idu_had_wb_vld;                 
wire    [82 :0]  ifu_had_debug_info;             
wire             ifu_had_no_inst;                
wire             ifu_had_no_op;                  
wire             ifu_had_reset_on;               
wire             inst_bkpt_dbgreq;               
wire    [63 :0]  ir_corex_wdata;                 
wire             ir_ctrl_exit_dbg_reg;           
wire             ir_ctrl_had_clk_en;             
wire             ir_xx_baba_reg_sel;             
wire             ir_xx_babb_reg_sel;             
wire             ir_xx_bama_reg_sel;             
wire             ir_xx_bamb_reg_sel;             
wire             ir_xx_csr_reg_sel;              
wire             ir_xx_daddr_reg_sel;            
wire             ir_xx_dbgfifo_reg_sel;          
wire             ir_xx_ddata_reg_sel;            
wire             ir_xx_eventie_reg_sel;          
wire             ir_xx_eventoe_reg_sel;          
wire             ir_xx_hcr_reg_sel;              
wire             ir_xx_hsr_reg_sel;              
wire             ir_xx_id_reg_sel;               
wire             ir_xx_ir_reg_sel;               
wire             ir_xx_mbca_reg_sel;             
wire             ir_xx_mbcb_reg_sel;             
wire             ir_xx_mbir_reg_sel;             
wire             ir_xx_otc_reg_sel;              
wire             ir_xx_pc_reg_sel;               
wire             ir_xx_pcfifo_reg_sel;           
wire             ir_xx_pipefifo_reg_sel;         
wire             ir_xx_pipesel_reg_sel;          
wire             ir_xx_wbbr_reg_sel;             
wire    [63 :0]  ir_xx_wdata;                    
wire    [9  :0]  iu_had_debug_info;              
wire    [183:0]  lsu_had_debug_info;             
wire             lsu_had_no_op;                  
wire    [39 :0]  lsu_had_st_addr;                
wire    [63 :0]  lsu_had_st_data;                
wire             lsu_had_st_req;                 
wire    [33 :0]  mmu_had_debug_info;             
wire             mmu_xx_mmu_en;                  
wire             nirv_bkpta;                     
wire             non_irv_bkpt_vld;               
wire    [63 :0]  pcfifo_regs_data;               
wire    [63 :0]  pipefifo_regs_data;             
wire    [31 :0]  pipesel_regs_data;              
wire             regs_ctrl_adr;                  
wire             regs_ctrl_dr;                   
wire             regs_ctrl_fdb;                  
wire             regs_ctrl_frzc;                 
wire             regs_ctrl_pcfifo_frozen;        
wire    [1  :0]  regs_ctrl_pm;                   
wire             regs_ctrl_sqa;                  
wire             regs_ctrl_sqb;                  
wire    [1  :0]  regs_ctrl_sqc;                  
wire             regs_ctrl_tme;                  
wire             regs_event_enter_ie;            
wire             regs_event_enter_oe;            
wire             regs_event_exit_ie;             
wire             regs_event_exit_oe;             
wire    [4  :0]  regs_xx_bca;                    
wire    [4  :0]  regs_xx_bcb;                    
wire             regs_xx_ddc_en;                 
wire             regs_xx_nirven;                 
wire             rtu_had_bkpt_data_st;           
wire             rtu_had_data_bkpta_vld;         
wire             rtu_had_data_bkptb_vld;         
wire             rtu_had_dbg_ack_info;           
wire             rtu_had_dbgreq_ack;             
wire    [42 :0]  rtu_had_debug_info;             
wire             rtu_had_inst0_bkpt_inst;        
wire    [3  :0]  rtu_had_inst0_non_irv_bkpt;     
wire    [3  :0]  rtu_had_inst1_non_irv_bkpt;     
wire    [3  :0]  rtu_had_inst2_non_irv_bkpt;     
wire             rtu_had_inst_bkpt_inst_vld;     
wire             rtu_had_inst_bkpta_vld;         
wire             rtu_had_inst_bkptb_vld;         
wire             rtu_had_inst_exe_dead;          
wire             rtu_had_inst_not_wb;            
wire             rtu_had_inst_split;             
wire    [63 :0]  rtu_had_retire_inst0_info;      
wire             rtu_had_retire_inst0_vld;       
wire    [63 :0]  rtu_had_retire_inst1_info;      
wire             rtu_had_retire_inst1_vld;       
wire    [63 :0]  rtu_had_retire_inst2_info;      
wire             rtu_had_retire_inst2_vld;       
wire             rtu_had_rob_empty;              
wire             rtu_had_xx_dbg_ack_pc;          
wire             rtu_had_xx_mbkpt_chgflow;       
wire             rtu_had_xx_mbkpt_data_ack;      
wire             rtu_had_xx_mbkpt_inst_ack;      
wire    [38 :0]  rtu_had_xx_pc;                  
wire             rtu_had_xx_pcfifo_inst0_chgflow; 
wire    [38 :0]  rtu_had_xx_pcfifo_inst0_next_pc; 
wire             rtu_had_xx_pcfifo_inst1_chgflow; 
wire    [38 :0]  rtu_had_xx_pcfifo_inst1_next_pc; 
wire             rtu_had_xx_pcfifo_inst2_chgflow; 
wire    [38 :0]  rtu_had_xx_pcfifo_inst2_next_pc; 
wire             rtu_had_xx_split_inst;          
wire             rtu_yy_xx_dbgon;                
wire             rtu_yy_xx_flush;                
wire             rtu_yy_xx_retire0;              
wire             rtu_yy_xx_retire0_normal;       
wire             rtu_yy_xx_retire1;              
wire             rtu_yy_xx_retire2;              
wire             sm_update_dr;                   
wire             sm_update_ir;                   
wire             trace_ctrl_req;                 
wire    [7  :0]  trace_regs_otc;                 
wire             x_dbg_ack_pc;                   
wire             x_enter_dbg_req_i;              
wire             x_enter_dbg_req_o;              
wire             x_exit_dbg_req_i;               
wire             x_exit_dbg_req_o;               
wire             x_had_dbg_mask;                 
wire             x_ir_ctrl_dbgfifo_read_pulse;   
wire             x_ir_ctrl_pcfifo_read_pulse;    
wire             x_ir_ctrl_pipefifo_read_pulse;  
wire             x_ir_xx_ex;                     
wire             x_ir_xx_go;                     
wire    [63 :0]  x_regs_serial_data;             
wire             x_sm_xx_update_dr_en;           


// &Instance("ct_had_bkpt", "x_ct_had_bkpta"); @28
ct_had_bkpt  x_ct_had_bkpta (
  .bkpt_ctrl_data_req         (bkpta_ctrl_data_req       ),
  .bkpt_ctrl_data_req_raw     (bkpta_ctrl_data_req_raw   ),
  .bkpt_ctrl_inst_req         (bkpta_ctrl_inst_req       ),
  .bkpt_ctrl_inst_req_raw     (bkpta_ctrl_inst_req_raw   ),
  .bkpt_ctrl_xx_ack           (bkpta_ctrl_xx_ack         ),
  .bkpt_regs_mbc              (bkpt_regs_mbca            ),
  .cp0_yy_priv_mode           (cp0_yy_priv_mode          ),
  .cpuclk                     (cpuclk                    ),
  .cpurst_b                   (cpurst_b                  ),
  .ctrl_bkpt_en               (ctrl_bkpta_en             ),
  .ctrl_bkpt_en_raw           (ctrl_bkpta_en_raw         ),
  .inst_bkpt_dbgreq           (inst_bkpt_dbgreq          ),
  .ir_xx_mbc_reg_sel          (ir_xx_mbca_reg_sel        ),
  .ir_xx_wdata                (ir_xx_wdata               ),
  .regs_xx_bc                 (regs_xx_bca               ),
  .regs_xx_nirven             (regs_xx_nirven            ),
  .rtu_had_bkpt_data_st       (rtu_had_bkpt_data_st      ),
  .rtu_had_data_bkpt_vld      (rtu_had_data_bkpta_vld    ),
  .rtu_had_inst_bkpt_inst_vld (rtu_had_inst_bkpt_inst_vld),
  .rtu_had_inst_bkpt_vld      (rtu_had_inst_bkpta_vld    ),
  .rtu_had_inst_split         (rtu_had_inst_split        ),
  .rtu_had_xx_mbkpt_chgflow   (rtu_had_xx_mbkpt_chgflow  ),
  .rtu_had_xx_mbkpt_data_ack  (rtu_had_xx_mbkpt_data_ack ),
  .rtu_had_xx_mbkpt_inst_ack  (rtu_had_xx_mbkpt_inst_ack ),
  .rtu_had_xx_split_inst      (rtu_had_xx_split_inst     ),
  .rtu_yy_xx_dbgon            (rtu_yy_xx_dbgon           ),
  .rtu_yy_xx_flush            (rtu_yy_xx_flush           ),
  .rtu_yy_xx_retire0_normal   (rtu_yy_xx_retire0_normal  ),
  .x_sm_xx_update_dr_en       (x_sm_xx_update_dr_en      )
);

// &Connect(.regs_xx_bc            (regs_xx_bca            ), @29
//          .rtu_had_inst_bkpt_vld (rtu_had_inst_bkpta_vld ), @30
//          .rtu_had_data_bkpt_vld (rtu_had_data_bkpta_vld ), @31
//          .ir_xx_mbc_reg_sel     (ir_xx_mbca_reg_sel     ), @32
//          .bkpt_regs_mbc         (bkpt_regs_mbca         ), @33
//          .bkpt_ctrl_xx_ack      (bkpta_ctrl_xx_ack      ), @34
//          .bkpt_ctrl_inst_req    (bkpta_ctrl_inst_req    ), @35
//          .bkpt_ctrl_data_req    (bkpta_ctrl_data_req    ), @36
//          .bkpt_ctrl_inst_req_raw(bkpta_ctrl_inst_req_raw), @37
//          .bkpt_ctrl_data_req_raw(bkpta_ctrl_data_req_raw), @38
//          .ctrl_bkpt_en          (ctrl_bkpta_en          ), @39
//          .ctrl_bkpt_en_raw      (ctrl_bkpta_en_raw      ) @40
//         ); @41

// &Instance("ct_had_bkpt", "x_ct_had_bkptb"); @43
ct_had_bkpt  x_ct_had_bkptb (
  .bkpt_ctrl_data_req         (bkptb_ctrl_data_req       ),
  .bkpt_ctrl_data_req_raw     (bkptb_ctrl_data_req_raw   ),
  .bkpt_ctrl_inst_req         (bkptb_ctrl_inst_req       ),
  .bkpt_ctrl_inst_req_raw     (bkptb_ctrl_inst_req_raw   ),
  .bkpt_ctrl_xx_ack           (bkptb_ctrl_xx_ack         ),
  .bkpt_regs_mbc              (bkpt_regs_mbcb            ),
  .cp0_yy_priv_mode           (cp0_yy_priv_mode          ),
  .cpuclk                     (cpuclk                    ),
  .cpurst_b                   (cpurst_b                  ),
  .ctrl_bkpt_en               (ctrl_bkptb_en             ),
  .ctrl_bkpt_en_raw           (ctrl_bkptb_en_raw         ),
  .inst_bkpt_dbgreq           (inst_bkpt_dbgreq          ),
  .ir_xx_mbc_reg_sel          (ir_xx_mbcb_reg_sel        ),
  .ir_xx_wdata                (ir_xx_wdata               ),
  .regs_xx_bc                 (regs_xx_bcb               ),
  .regs_xx_nirven             (regs_xx_nirven            ),
  .rtu_had_bkpt_data_st       (rtu_had_bkpt_data_st      ),
  .rtu_had_data_bkpt_vld      (rtu_had_data_bkptb_vld    ),
  .rtu_had_inst_bkpt_inst_vld (rtu_had_inst_bkpt_inst_vld),
  .rtu_had_inst_bkpt_vld      (rtu_had_inst_bkptb_vld    ),
  .rtu_had_inst_split         (rtu_had_inst_split        ),
  .rtu_had_xx_mbkpt_chgflow   (rtu_had_xx_mbkpt_chgflow  ),
  .rtu_had_xx_mbkpt_data_ack  (rtu_had_xx_mbkpt_data_ack ),
  .rtu_had_xx_mbkpt_inst_ack  (rtu_had_xx_mbkpt_inst_ack ),
  .rtu_had_xx_split_inst      (rtu_had_xx_split_inst     ),
  .rtu_yy_xx_dbgon            (rtu_yy_xx_dbgon           ),
  .rtu_yy_xx_flush            (rtu_yy_xx_flush           ),
  .rtu_yy_xx_retire0_normal   (rtu_yy_xx_retire0_normal  ),
  .x_sm_xx_update_dr_en       (x_sm_xx_update_dr_en      )
);

// &Connect(.regs_xx_bc            (regs_xx_bcb            ), @44
//          .rtu_had_inst_bkpt_vld (rtu_had_inst_bkptb_vld ), @45
//          .rtu_had_data_bkpt_vld (rtu_had_data_bkptb_vld ), @46
//          .ir_xx_mbc_reg_sel     (ir_xx_mbcb_reg_sel     ), @47
//          .bkpt_regs_mbc         (bkpt_regs_mbcb         ), @48
//          .bkpt_ctrl_xx_ack      (bkptb_ctrl_xx_ack      ), @49
//          .bkpt_ctrl_inst_req    (bkptb_ctrl_inst_req    ), @50
//          .bkpt_ctrl_data_req    (bkptb_ctrl_data_req    ), @51
//          .bkpt_ctrl_inst_req_raw(bkptb_ctrl_inst_req_raw), @52
//          .bkpt_ctrl_data_req_raw(bkptb_ctrl_data_req_raw), @53
//          .ctrl_bkpt_en          (ctrl_bkptb_en          ), @54
//          .ctrl_bkpt_en_raw      (ctrl_bkptb_en_raw      ) @55
//         ); @56

// &Instance("ct_had_ctrl"); @58
ct_had_ctrl  x_ct_had_ctrl (
  .biu_had_sdb_req_b             (biu_had_sdb_req_b            ),
  .bkpta_ctrl_data_req           (bkpta_ctrl_data_req          ),
  .bkpta_ctrl_data_req_raw       (bkpta_ctrl_data_req_raw      ),
  .bkpta_ctrl_inst_req           (bkpta_ctrl_inst_req          ),
  .bkpta_ctrl_inst_req_raw       (bkpta_ctrl_inst_req_raw      ),
  .bkpta_ctrl_xx_ack             (bkpta_ctrl_xx_ack            ),
  .bkptb_ctrl_data_req           (bkptb_ctrl_data_req          ),
  .bkptb_ctrl_data_req_raw       (bkptb_ctrl_data_req_raw      ),
  .bkptb_ctrl_inst_req           (bkptb_ctrl_inst_req          ),
  .bkptb_ctrl_inst_req_raw       (bkptb_ctrl_inst_req_raw      ),
  .bkptb_ctrl_xx_ack             (bkptb_ctrl_xx_ack            ),
  .cpuclk                        (cpuclk                       ),
  .cpurst_b                      (cpurst_b                     ),
  .ctrl_bkpta_en                 (ctrl_bkpta_en                ),
  .ctrl_bkpta_en_raw             (ctrl_bkpta_en_raw            ),
  .ctrl_bkptb_en                 (ctrl_bkptb_en                ),
  .ctrl_bkptb_en_raw             (ctrl_bkptb_en_raw            ),
  .ctrl_dbgfifo_ren              (ctrl_dbgfifo_ren             ),
  .ctrl_event_dbgenter           (ctrl_event_dbgenter          ),
  .ctrl_event_dbgexit            (ctrl_event_dbgexit           ),
  .ctrl_pcfifo_ren               (ctrl_pcfifo_ren              ),
  .ctrl_pcfifo_wen               (ctrl_pcfifo_wen              ),
  .ctrl_pipefifo_ren             (ctrl_pipefifo_ren            ),
  .ctrl_pipefifo_wen             (ctrl_pipefifo_wen            ),
  .ctrl_regs_bkpta_vld           (ctrl_regs_bkpta_vld          ),
  .ctrl_regs_bkptb_vld           (ctrl_regs_bkptb_vld          ),
  .ctrl_regs_exit_dbg            (ctrl_regs_exit_dbg           ),
  .ctrl_regs_freeze_pcfifo       (ctrl_regs_freeze_pcfifo      ),
  .ctrl_regs_set_sqa             (ctrl_regs_set_sqa            ),
  .ctrl_regs_set_sqb             (ctrl_regs_set_sqb            ),
  .ctrl_regs_update_adro         (ctrl_regs_update_adro        ),
  .ctrl_regs_update_dro          (ctrl_regs_update_dro         ),
  .ctrl_regs_update_mbo          (ctrl_regs_update_mbo         ),
  .ctrl_regs_update_pro          (ctrl_regs_update_pro         ),
  .ctrl_regs_update_swo          (ctrl_regs_update_swo         ),
  .ctrl_regs_update_to           (ctrl_regs_update_to          ),
  .ctrl_trace_en                 (ctrl_trace_en                ),
  .ctrl_xx_dbg_disable           (ctrl_xx_dbg_disable          ),
  .ddc_xx_update_ir              (ddc_xx_update_ir             ),
  .event_ctrl_enter_dbg          (event_ctrl_enter_dbg         ),
  .event_ctrl_exit_dbg           (event_ctrl_exit_dbg          ),
  .event_ctrl_had_clk_en         (event_ctrl_had_clk_en        ),
  .forever_coreclk               (forever_coreclk              ),
  .had_cp0_xx_dbg                (had_cp0_xx_dbg               ),
  .had_ifu_ir_vld                (had_ifu_ir_vld               ),
  .had_ifu_pcload                (had_ifu_pcload               ),
  .had_rtu_data_bkpt_dbgreq      (had_rtu_data_bkpt_dbgreq     ),
  .had_rtu_dbg_disable           (had_rtu_dbg_disable          ),
  .had_rtu_dbg_req_en            (had_rtu_dbg_req_en           ),
  .had_rtu_event_dbgreq          (had_rtu_event_dbgreq         ),
  .had_rtu_fdb                   (had_rtu_fdb                  ),
  .had_rtu_hw_dbgreq             (had_rtu_hw_dbgreq            ),
  .had_rtu_hw_dbgreq_gateclk     (had_rtu_hw_dbgreq_gateclk    ),
  .had_rtu_inst_bkpt_dbgreq      (had_rtu_inst_bkpt_dbgreq     ),
  .had_rtu_non_irv_bkpt_dbgreq   (had_rtu_non_irv_bkpt_dbgreq  ),
  .had_rtu_pop1_disa             (had_rtu_pop1_disa            ),
  .had_rtu_trace_dbgreq          (had_rtu_trace_dbgreq         ),
  .had_rtu_trace_en              (had_rtu_trace_en             ),
  .had_rtu_xx_jdbreq             (had_rtu_xx_jdbreq            ),
  .had_rtu_xx_tme                (had_rtu_xx_tme               ),
  .had_xx_clk_en                 (had_xx_clk_en                ),
  .had_yy_xx_exit_dbg            (had_yy_xx_exit_dbg           ),
  .inst_bkpt_dbgreq              (inst_bkpt_dbgreq             ),
  .ir_ctrl_exit_dbg_reg          (ir_ctrl_exit_dbg_reg         ),
  .ir_ctrl_had_clk_en            (ir_ctrl_had_clk_en           ),
  .ir_xx_ir_reg_sel              (ir_xx_ir_reg_sel             ),
  .nirv_bkpta                    (nirv_bkpta                   ),
  .non_irv_bkpt_vld              (non_irv_bkpt_vld             ),
  .regs_ctrl_adr                 (regs_ctrl_adr                ),
  .regs_ctrl_dr                  (regs_ctrl_dr                 ),
  .regs_ctrl_fdb                 (regs_ctrl_fdb                ),
  .regs_ctrl_frzc                (regs_ctrl_frzc               ),
  .regs_ctrl_pcfifo_frozen       (regs_ctrl_pcfifo_frozen      ),
  .regs_ctrl_pm                  (regs_ctrl_pm                 ),
  .regs_ctrl_sqa                 (regs_ctrl_sqa                ),
  .regs_ctrl_sqb                 (regs_ctrl_sqb                ),
  .regs_ctrl_sqc                 (regs_ctrl_sqc                ),
  .regs_ctrl_tme                 (regs_ctrl_tme                ),
  .regs_xx_bca                   (regs_xx_bca                  ),
  .regs_xx_bcb                   (regs_xx_bcb                  ),
  .regs_xx_ddc_en                (regs_xx_ddc_en               ),
  .regs_xx_nirven                (regs_xx_nirven               ),
  .rtu_had_dbgreq_ack            (rtu_had_dbgreq_ack           ),
  .rtu_had_inst0_bkpt_inst       (rtu_had_inst0_bkpt_inst      ),
  .rtu_yy_xx_dbgon               (rtu_yy_xx_dbgon              ),
  .rtu_yy_xx_retire0             (rtu_yy_xx_retire0            ),
  .rtu_yy_xx_retire0_normal      (rtu_yy_xx_retire0_normal     ),
  .trace_ctrl_req                (trace_ctrl_req               ),
  .x_had_dbg_mask                (x_had_dbg_mask               ),
  .x_ir_ctrl_dbgfifo_read_pulse  (x_ir_ctrl_dbgfifo_read_pulse ),
  .x_ir_ctrl_pcfifo_read_pulse   (x_ir_ctrl_pcfifo_read_pulse  ),
  .x_ir_ctrl_pipefifo_read_pulse (x_ir_ctrl_pipefifo_read_pulse),
  .x_ir_xx_ex                    (x_ir_xx_ex                   ),
  .x_ir_xx_go                    (x_ir_xx_go                   ),
  .x_sm_xx_update_dr_en          (x_sm_xx_update_dr_en         )
);

// &Instance("ct_had_ddc_ctrl"); @59
ct_had_ddc_ctrl  x_ct_had_ddc_ctrl (
  .cpuclk                   (cpuclk                  ),
  .cpurst_b                 (cpurst_b                ),
  .ddc_ctrl_dp_addr_gen     (ddc_ctrl_dp_addr_gen    ),
  .ddc_ctrl_dp_addr_sel     (ddc_ctrl_dp_addr_sel    ),
  .ddc_ctrl_dp_data_sel     (ddc_ctrl_dp_data_sel    ),
  .ddc_regs_update_csr      (ddc_regs_update_csr     ),
  .ddc_regs_update_wbbr     (ddc_regs_update_wbbr    ),
  .ddc_xx_update_ir         (ddc_xx_update_ir        ),
  .ir_xx_daddr_reg_sel      (ir_xx_daddr_reg_sel     ),
  .ir_xx_ddata_reg_sel      (ir_xx_ddata_reg_sel     ),
  .regs_xx_ddc_en           (regs_xx_ddc_en          ),
  .rtu_yy_xx_retire0_normal (rtu_yy_xx_retire0_normal),
  .x_sm_xx_update_dr_en     (x_sm_xx_update_dr_en    )
);

// &Instance("ct_had_ddc_dp"); @60
ct_had_ddc_dp  x_ct_had_ddc_dp (
  .cpuclk               (cpuclk              ),
  .ddc_ctrl_dp_addr_gen (ddc_ctrl_dp_addr_gen),
  .ddc_ctrl_dp_addr_sel (ddc_ctrl_dp_addr_sel),
  .ddc_ctrl_dp_data_sel (ddc_ctrl_dp_data_sel),
  .ddc_regs_daddr       (ddc_regs_daddr      ),
  .ddc_regs_ddata       (ddc_regs_ddata      ),
  .ddc_regs_ffy         (ddc_regs_ffy        ),
  .ddc_regs_ir          (ddc_regs_ir         ),
  .ddc_regs_wbbr        (ddc_regs_wbbr       ),
  .ir_xx_daddr_reg_sel  (ir_xx_daddr_reg_sel ),
  .ir_xx_ddata_reg_sel  (ir_xx_ddata_reg_sel ),
  .ir_xx_wdata          (ir_xx_wdata         ),
  .x_sm_xx_update_dr_en (x_sm_xx_update_dr_en)
);

// &Instance("ct_had_pcfifo"); @61
ct_had_pcfifo  x_ct_had_pcfifo (
  .cpuclk                          (cpuclk                         ),
  .cpurst_b                        (cpurst_b                       ),
  .ctrl_pcfifo_ren                 (ctrl_pcfifo_ren                ),
  .ctrl_pcfifo_wen                 (ctrl_pcfifo_wen                ),
  .mmu_xx_mmu_en                   (mmu_xx_mmu_en                  ),
  .pcfifo_regs_data                (pcfifo_regs_data               ),
  .rtu_had_xx_pcfifo_inst0_chgflow (rtu_had_xx_pcfifo_inst0_chgflow),
  .rtu_had_xx_pcfifo_inst0_next_pc (rtu_had_xx_pcfifo_inst0_next_pc),
  .rtu_had_xx_pcfifo_inst1_chgflow (rtu_had_xx_pcfifo_inst1_chgflow),
  .rtu_had_xx_pcfifo_inst1_next_pc (rtu_had_xx_pcfifo_inst1_next_pc),
  .rtu_had_xx_pcfifo_inst2_chgflow (rtu_had_xx_pcfifo_inst2_chgflow),
  .rtu_had_xx_pcfifo_inst2_next_pc (rtu_had_xx_pcfifo_inst2_next_pc)
);

// &Instance("ct_had_regs"); @62
ct_had_regs  x_ct_had_regs (
  .bkpt_regs_mbca          (bkpt_regs_mbca         ),
  .bkpt_regs_mbcb          (bkpt_regs_mbcb         ),
  .cp0_had_cpuid_0         (cp0_had_cpuid_0        ),
  .cp0_had_lpmd_b          (cp0_had_lpmd_b         ),
  .cpuclk                  (cpuclk                 ),
  .cpurst_b                (cpurst_b               ),
  .ctrl_regs_bkpta_vld     (ctrl_regs_bkpta_vld    ),
  .ctrl_regs_bkptb_vld     (ctrl_regs_bkptb_vld    ),
  .ctrl_regs_exit_dbg      (ctrl_regs_exit_dbg     ),
  .ctrl_regs_freeze_pcfifo (ctrl_regs_freeze_pcfifo),
  .ctrl_regs_set_sqa       (ctrl_regs_set_sqa      ),
  .ctrl_regs_set_sqb       (ctrl_regs_set_sqb      ),
  .ctrl_regs_update_adro   (ctrl_regs_update_adro  ),
  .ctrl_regs_update_dro    (ctrl_regs_update_dro   ),
  .ctrl_regs_update_mbo    (ctrl_regs_update_mbo   ),
  .ctrl_regs_update_pro    (ctrl_regs_update_pro   ),
  .ctrl_regs_update_swo    (ctrl_regs_update_swo   ),
  .ctrl_regs_update_to     (ctrl_regs_update_to    ),
  .dbgfifo_regs_data       (dbgfifo_regs_data      ),
  .ddc_regs_daddr          (ddc_regs_daddr         ),
  .ddc_regs_ddata          (ddc_regs_ddata         ),
  .ddc_regs_ffy            (ddc_regs_ffy           ),
  .ddc_regs_ir             (ddc_regs_ir            ),
  .ddc_regs_update_csr     (ddc_regs_update_csr    ),
  .ddc_regs_update_wbbr    (ddc_regs_update_wbbr   ),
  .ddc_regs_wbbr           (ddc_regs_wbbr          ),
  .ddc_xx_update_ir        (ddc_xx_update_ir       ),
  .had_biu_jdb_pm          (had_biu_jdb_pm         ),
  .had_idu_wbbr_data       (had_idu_wbbr_data      ),
  .had_idu_wbbr_vld        (had_idu_wbbr_vld       ),
  .had_ifu_ir              (had_ifu_ir             ),
  .had_ifu_pc              (had_ifu_pc             ),
  .had_yy_xx_bkpta_base    (had_yy_xx_bkpta_base   ),
  .had_yy_xx_bkpta_mask    (had_yy_xx_bkpta_mask   ),
  .had_yy_xx_bkpta_rc      (had_yy_xx_bkpta_rc     ),
  .had_yy_xx_bkptb_base    (had_yy_xx_bkptb_base   ),
  .had_yy_xx_bkptb_mask    (had_yy_xx_bkptb_mask   ),
  .had_yy_xx_bkptb_rc      (had_yy_xx_bkptb_rc     ),
  .idu_had_iq_empty        (idu_had_iq_empty       ),
  .idu_had_pipe_stall      (idu_had_pipe_stall     ),
  .idu_had_pipeline_empty  (idu_had_pipeline_empty ),
  .idu_had_wb_data         (idu_had_wb_data        ),
  .idu_had_wb_vld          (idu_had_wb_vld         ),
  .ifu_had_no_inst         (ifu_had_no_inst        ),
  .ifu_had_no_op           (ifu_had_no_op          ),
  .ifu_had_reset_on        (ifu_had_reset_on       ),
  .ir_xx_baba_reg_sel      (ir_xx_baba_reg_sel     ),
  .ir_xx_babb_reg_sel      (ir_xx_babb_reg_sel     ),
  .ir_xx_bama_reg_sel      (ir_xx_bama_reg_sel     ),
  .ir_xx_bamb_reg_sel      (ir_xx_bamb_reg_sel     ),
  .ir_xx_csr_reg_sel       (ir_xx_csr_reg_sel      ),
  .ir_xx_daddr_reg_sel     (ir_xx_daddr_reg_sel    ),
  .ir_xx_dbgfifo_reg_sel   (ir_xx_dbgfifo_reg_sel  ),
  .ir_xx_ddata_reg_sel     (ir_xx_ddata_reg_sel    ),
  .ir_xx_eventie_reg_sel   (ir_xx_eventie_reg_sel  ),
  .ir_xx_eventoe_reg_sel   (ir_xx_eventoe_reg_sel  ),
  .ir_xx_hcr_reg_sel       (ir_xx_hcr_reg_sel      ),
  .ir_xx_hsr_reg_sel       (ir_xx_hsr_reg_sel      ),
  .ir_xx_id_reg_sel        (ir_xx_id_reg_sel       ),
  .ir_xx_ir_reg_sel        (ir_xx_ir_reg_sel       ),
  .ir_xx_mbca_reg_sel      (ir_xx_mbca_reg_sel     ),
  .ir_xx_mbcb_reg_sel      (ir_xx_mbcb_reg_sel     ),
  .ir_xx_mbir_reg_sel      (ir_xx_mbir_reg_sel     ),
  .ir_xx_otc_reg_sel       (ir_xx_otc_reg_sel      ),
  .ir_xx_pc_reg_sel        (ir_xx_pc_reg_sel       ),
  .ir_xx_pcfifo_reg_sel    (ir_xx_pcfifo_reg_sel   ),
  .ir_xx_pipefifo_reg_sel  (ir_xx_pipefifo_reg_sel ),
  .ir_xx_pipesel_reg_sel   (ir_xx_pipesel_reg_sel  ),
  .ir_xx_wbbr_reg_sel      (ir_xx_wbbr_reg_sel     ),
  .ir_xx_wdata             (ir_xx_wdata            ),
  .lsu_had_no_op           (lsu_had_no_op          ),
  .mmu_xx_mmu_en           (mmu_xx_mmu_en          ),
  .pcfifo_regs_data        (pcfifo_regs_data       ),
  .pipefifo_regs_data      (pipefifo_regs_data     ),
  .pipesel_regs_data       (pipesel_regs_data      ),
  .regs_ctrl_adr           (regs_ctrl_adr          ),
  .regs_ctrl_dr            (regs_ctrl_dr           ),
  .regs_ctrl_fdb           (regs_ctrl_fdb          ),
  .regs_ctrl_frzc          (regs_ctrl_frzc         ),
  .regs_ctrl_pcfifo_frozen (regs_ctrl_pcfifo_frozen),
  .regs_ctrl_pm            (regs_ctrl_pm           ),
  .regs_ctrl_sqa           (regs_ctrl_sqa          ),
  .regs_ctrl_sqb           (regs_ctrl_sqb          ),
  .regs_ctrl_sqc           (regs_ctrl_sqc          ),
  .regs_ctrl_tme           (regs_ctrl_tme          ),
  .regs_event_enter_ie     (regs_event_enter_ie    ),
  .regs_event_enter_oe     (regs_event_enter_oe    ),
  .regs_event_exit_ie      (regs_event_exit_ie     ),
  .regs_event_exit_oe      (regs_event_exit_oe     ),
  .regs_xx_bca             (regs_xx_bca            ),
  .regs_xx_bcb             (regs_xx_bcb            ),
  .regs_xx_ddc_en          (regs_xx_ddc_en         ),
  .regs_xx_nirven          (regs_xx_nirven         ),
  .rtu_had_inst_exe_dead   (rtu_had_inst_exe_dead  ),
  .rtu_had_inst_not_wb     (rtu_had_inst_not_wb    ),
  .rtu_had_rob_empty       (rtu_had_rob_empty      ),
  .rtu_had_xx_dbg_ack_pc   (rtu_had_xx_dbg_ack_pc  ),
  .rtu_had_xx_pc           (rtu_had_xx_pc          ),
  .rtu_yy_xx_dbgon         (rtu_yy_xx_dbgon        ),
  .trace_regs_otc          (trace_regs_otc         ),
  .x_regs_serial_data      (x_regs_serial_data     ),
  .x_sm_xx_update_dr_en    (x_sm_xx_update_dr_en   )
);

// &Instance("ct_had_trace"); @63
ct_had_trace  x_ct_had_trace (
  .cpuclk                   (cpuclk                  ),
  .cpurst_b                 (cpurst_b                ),
  .ctrl_trace_en            (ctrl_trace_en           ),
  .inst_bkpt_dbgreq         (inst_bkpt_dbgreq        ),
  .ir_xx_otc_reg_sel        (ir_xx_otc_reg_sel       ),
  .ir_xx_wdata              (ir_xx_wdata             ),
  .rtu_had_xx_split_inst    (rtu_had_xx_split_inst   ),
  .rtu_yy_xx_dbgon          (rtu_yy_xx_dbgon         ),
  .rtu_yy_xx_retire0_normal (rtu_yy_xx_retire0_normal),
  .trace_ctrl_req           (trace_ctrl_req          ),
  .trace_regs_otc           (trace_regs_otc          ),
  .x_sm_xx_update_dr_en     (x_sm_xx_update_dr_en    )
);

// &Instance("ct_had_event"); @64
ct_had_event  x_ct_had_event (
  .cpuclk                (cpuclk               ),
  .cpurst_b              (cpurst_b             ),
  .ctrl_event_dbgenter   (ctrl_event_dbgenter  ),
  .ctrl_event_dbgexit    (ctrl_event_dbgexit   ),
  .event_ctrl_enter_dbg  (event_ctrl_enter_dbg ),
  .event_ctrl_exit_dbg   (event_ctrl_exit_dbg  ),
  .event_ctrl_had_clk_en (event_ctrl_had_clk_en),
  .forever_coreclk       (forever_coreclk      ),
  .regs_event_enter_ie   (regs_event_enter_ie  ),
  .regs_event_enter_oe   (regs_event_enter_oe  ),
  .regs_event_exit_ie    (regs_event_exit_ie   ),
  .regs_event_exit_oe    (regs_event_exit_oe   ),
  .rtu_yy_xx_dbgon       (rtu_yy_xx_dbgon      ),
  .x_enter_dbg_req_i     (x_enter_dbg_req_i    ),
  .x_enter_dbg_req_o     (x_enter_dbg_req_o    ),
  .x_exit_dbg_req_i      (x_exit_dbg_req_i     ),
  .x_exit_dbg_req_o      (x_exit_dbg_req_o     )
);

// &Instance("ct_had_dbg_info_dummy"); @66
// &Instance("ct_had_dbg_info"); @68
ct_had_dbg_info  x_ct_had_dbg_info (
  .cp0_had_debug_info           (cp0_had_debug_info          ),
  .cpuclk                       (cpuclk                      ),
  .cpurst_b                     (cpurst_b                    ),
  .ctrl_dbgfifo_ren             (ctrl_dbgfifo_ren            ),
  .ctrl_pipefifo_ren            (ctrl_pipefifo_ren           ),
  .ctrl_pipefifo_wen            (ctrl_pipefifo_wen           ),
  .dbgfifo_regs_data            (dbgfifo_regs_data           ),
  .had_idu_debug_id_inst_en     (had_idu_debug_id_inst_en    ),
  .had_lsu_dbg_info_en          (had_lsu_dbg_info_en         ),
  .had_rtu_debug_retire_info_en (had_rtu_debug_retire_info_en),
  .idu_had_debug_info           (idu_had_debug_info          ),
  .idu_had_id_inst0_info        (idu_had_id_inst0_info       ),
  .idu_had_id_inst0_vld         (idu_had_id_inst0_vld        ),
  .idu_had_id_inst1_info        (idu_had_id_inst1_info       ),
  .idu_had_id_inst1_vld         (idu_had_id_inst1_vld        ),
  .idu_had_id_inst2_info        (idu_had_id_inst2_info       ),
  .idu_had_id_inst2_vld         (idu_had_id_inst2_vld        ),
  .ifu_had_debug_info           (ifu_had_debug_info          ),
  .ir_xx_pipesel_reg_sel        (ir_xx_pipesel_reg_sel       ),
  .ir_xx_wdata                  (ir_xx_wdata                 ),
  .iu_had_debug_info            (iu_had_debug_info           ),
  .lsu_had_debug_info           (lsu_had_debug_info          ),
  .lsu_had_st_addr              (lsu_had_st_addr             ),
  .lsu_had_st_data              (lsu_had_st_data             ),
  .lsu_had_st_req               (lsu_had_st_req              ),
  .mmu_had_debug_info           (mmu_had_debug_info          ),
  .pipefifo_regs_data           (pipefifo_regs_data          ),
  .pipesel_regs_data            (pipesel_regs_data           ),
  .rtu_had_dbg_ack_info         (rtu_had_dbg_ack_info        ),
  .rtu_had_debug_info           (rtu_had_debug_info          ),
  .rtu_had_retire_inst0_info    (rtu_had_retire_inst0_info   ),
  .rtu_had_retire_inst0_vld     (rtu_had_retire_inst0_vld    ),
  .rtu_had_retire_inst1_info    (rtu_had_retire_inst1_info   ),
  .rtu_had_retire_inst1_vld     (rtu_had_retire_inst1_vld    ),
  .rtu_had_retire_inst2_info    (rtu_had_retire_inst2_info   ),
  .rtu_had_retire_inst2_vld     (rtu_had_retire_inst2_vld    ),
  .x_dbg_ack_pc                 (x_dbg_ack_pc                ),
  .x_sm_xx_update_dr_en         (x_sm_xx_update_dr_en        )
);

// &Instance("ct_had_nirv_bkpt"); @70
ct_had_nirv_bkpt  x_ct_had_nirv_bkpt (
  .cpuclk                     (cpuclk                    ),
  .cpurst_b                   (cpurst_b                  ),
  .ctrl_bkpta_en              (ctrl_bkpta_en             ),
  .ctrl_bkptb_en              (ctrl_bkptb_en             ),
  .nirv_bkpta                 (nirv_bkpta                ),
  .non_irv_bkpt_vld           (non_irv_bkpt_vld          ),
  .regs_xx_nirven             (regs_xx_nirven            ),
  .rtu_had_inst0_non_irv_bkpt (rtu_had_inst0_non_irv_bkpt),
  .rtu_had_inst1_non_irv_bkpt (rtu_had_inst1_non_irv_bkpt),
  .rtu_had_inst2_non_irv_bkpt (rtu_had_inst2_non_irv_bkpt),
  .rtu_had_xx_split_inst      (rtu_had_xx_split_inst     ),
  .rtu_yy_xx_dbgon            (rtu_yy_xx_dbgon           ),
  .rtu_yy_xx_flush            (rtu_yy_xx_flush           ),
  .rtu_yy_xx_retire0_normal   (rtu_yy_xx_retire0_normal  ),
  .rtu_yy_xx_retire1          (rtu_yy_xx_retire1         ),
  .rtu_yy_xx_retire2          (rtu_yy_xx_retire2         )
);

// &Instance("ct_had_private_ir"); @71
ct_had_private_ir  x_ct_had_private_ir (
  .biu_had_coreid                (biu_had_coreid               ),
  .cpuclk                        (cpuclk                       ),
  .cpurst_b                      (cpurst_b                     ),
  .ctrl_xx_dbg_disable           (ctrl_xx_dbg_disable          ),
  .forever_coreclk               (forever_coreclk              ),
  .ir_corex_wdata                (ir_corex_wdata               ),
  .ir_ctrl_exit_dbg_reg          (ir_ctrl_exit_dbg_reg         ),
  .ir_ctrl_had_clk_en            (ir_ctrl_had_clk_en           ),
  .ir_xx_baba_reg_sel            (ir_xx_baba_reg_sel           ),
  .ir_xx_babb_reg_sel            (ir_xx_babb_reg_sel           ),
  .ir_xx_bama_reg_sel            (ir_xx_bama_reg_sel           ),
  .ir_xx_bamb_reg_sel            (ir_xx_bamb_reg_sel           ),
  .ir_xx_csr_reg_sel             (ir_xx_csr_reg_sel            ),
  .ir_xx_daddr_reg_sel           (ir_xx_daddr_reg_sel          ),
  .ir_xx_dbgfifo_reg_sel         (ir_xx_dbgfifo_reg_sel        ),
  .ir_xx_ddata_reg_sel           (ir_xx_ddata_reg_sel          ),
  .ir_xx_eventie_reg_sel         (ir_xx_eventie_reg_sel        ),
  .ir_xx_eventoe_reg_sel         (ir_xx_eventoe_reg_sel        ),
  .ir_xx_hcr_reg_sel             (ir_xx_hcr_reg_sel            ),
  .ir_xx_hsr_reg_sel             (ir_xx_hsr_reg_sel            ),
  .ir_xx_id_reg_sel              (ir_xx_id_reg_sel             ),
  .ir_xx_ir_reg_sel              (ir_xx_ir_reg_sel             ),
  .ir_xx_mbca_reg_sel            (ir_xx_mbca_reg_sel           ),
  .ir_xx_mbcb_reg_sel            (ir_xx_mbcb_reg_sel           ),
  .ir_xx_mbir_reg_sel            (ir_xx_mbir_reg_sel           ),
  .ir_xx_otc_reg_sel             (ir_xx_otc_reg_sel            ),
  .ir_xx_pc_reg_sel              (ir_xx_pc_reg_sel             ),
  .ir_xx_pcfifo_reg_sel          (ir_xx_pcfifo_reg_sel         ),
  .ir_xx_pipefifo_reg_sel        (ir_xx_pipefifo_reg_sel       ),
  .ir_xx_pipesel_reg_sel         (ir_xx_pipesel_reg_sel        ),
  .ir_xx_wbbr_reg_sel            (ir_xx_wbbr_reg_sel           ),
  .ir_xx_wdata                   (ir_xx_wdata                  ),
  .sm_update_dr                  (sm_update_dr                 ),
  .sm_update_ir                  (sm_update_ir                 ),
  .x_ir_ctrl_dbgfifo_read_pulse  (x_ir_ctrl_dbgfifo_read_pulse ),
  .x_ir_ctrl_pcfifo_read_pulse   (x_ir_ctrl_pcfifo_read_pulse  ),
  .x_ir_ctrl_pipefifo_read_pulse (x_ir_ctrl_pipefifo_read_pulse),
  .x_ir_xx_ex                    (x_ir_xx_ex                   ),
  .x_ir_xx_go                    (x_ir_xx_go                   ),
  .x_sm_xx_update_dr_en          (x_sm_xx_update_dr_en         )
);


// &Instance("ct_had_pctrace_top"); @74
// &Force("input", "rtu_had_xx_pcfifo_inst0_condbr"); @76
// &Force("input", "rtu_had_xx_pcfifo_inst1_condbr"); @77
// &Force("input", "rtu_had_xx_pcfifo_inst2_condbr"); @78
// &Force("input", "rtu_had_xx_pcfifo_inst0_condbr_taken"); @79
// &Force("input", "rtu_had_xx_pcfifo_inst1_condbr_taken"); @80
// &Force("input", "rtu_had_xx_pcfifo_inst2_condbr_taken"); @81
// &Force("input", "rtu_had_xx_pcfifo_inst0_jmp"); @82
// &Force("input", "rtu_had_xx_pcfifo_inst1_jmp"); @83
// &Force("input", "rtu_had_xx_pcfifo_inst2_jmp"); @84
// &Force("input", "rtu_had_xx_pcfifo_inst0_pcall"); @85
// &Force("input", "rtu_had_xx_pcfifo_inst1_pcall"); @86
// &Force("input", "rtu_had_xx_pcfifo_inst2_pcall"); @87
// &Force("input", "rtu_had_xx_pcfifo_inst0_preturn"); @88
// &Force("input", "rtu_had_xx_pcfifo_inst1_preturn"); @89
// &Force("input", "rtu_had_xx_pcfifo_inst2_preturn"); @90
// &Force("input", "rtu_had_xx_pcfifo_inst0_iid"), &Force("bus", "rtu_had_xx_pcfifo_inst0_iid", 6, 0); @91

// &Force("input", "lsu_had_ld_req"); @93
// &Force("input", "lsu_had_ld_addr"), &Force("bus", "lsu_had_ld_addr", 39, 0); @94
// &Force("input", "lsu_had_ld_data"); &Force("bus", "lsu_had_ld_data", 63, 0); @95
// &Force("input", "lsu_had_ld_iid"), &Force("bus", "lsu_had_ld_iid", 6, 0); @96
// &Force("input", "lsu_had_st_iid"), &Force("bus", "lsu_had_st_iid", 6, 0); @97
// &Force("input", "lsu_had_ld_type"), &Force("bus", "lsu_had_ld_type", 3, 0); @98
// &Force("input", "lsu_had_st_type"), &Force("bus", "lsu_had_st_type", 3, 0); @99

// &Force("input", "cp0_had_trace_pm_wen"); @101
// &Force("input", "cp0_had_trace_pm_wdata"); @102

// &Force("bus", "cp0_had_trace_pm_wdata",1,0); @104

assign had_lsu_pctrace_en = 1'b0;
assign had_lsu_bus_trace_en = 1'b0;

assign had_lsu_dbg_en = had_lsu_dbg_info_en || had_lsu_pctrace_en;


// &ModuleEnd; @141
endmodule



