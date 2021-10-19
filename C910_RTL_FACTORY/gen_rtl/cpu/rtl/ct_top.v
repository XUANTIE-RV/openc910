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

// &Depend("cpu_cfig.h"); @24
// &Depend("top_golden_port.vp"); @25

// &ModuleBeg; @27
module ct_top(
  biu_pad_acready,
  biu_pad_araddr,
  biu_pad_arbar,
  biu_pad_arburst,
  biu_pad_arcache,
  biu_pad_ardomain,
  biu_pad_arid,
  biu_pad_arlen,
  biu_pad_arlock,
  biu_pad_arprot,
  biu_pad_arsize,
  biu_pad_arsnoop,
  biu_pad_aruser,
  biu_pad_arvalid,
  biu_pad_awaddr,
  biu_pad_awbar,
  biu_pad_awburst,
  biu_pad_awcache,
  biu_pad_awdomain,
  biu_pad_awid,
  biu_pad_awlen,
  biu_pad_awlock,
  biu_pad_awprot,
  biu_pad_awsize,
  biu_pad_awsnoop,
  biu_pad_awunique,
  biu_pad_awuser,
  biu_pad_awvalid,
  biu_pad_back,
  biu_pad_bready,
  biu_pad_cddata,
  biu_pad_cderr,
  biu_pad_cdlast,
  biu_pad_cdvalid,
  biu_pad_cnt_en,
  biu_pad_crresp,
  biu_pad_crvalid,
  biu_pad_csr_sel,
  biu_pad_csr_wdata,
  biu_pad_jdb_pm,
  biu_pad_lpmd_b,
  biu_pad_rack,
  biu_pad_rready,
  biu_pad_wdata,
  biu_pad_werr,
  biu_pad_wlast,
  biu_pad_wns,
  biu_pad_wstrb,
  biu_pad_wvalid,
  cp0_pad_mstatus,
  ir_corex_wdata,
  pad_biu_acaddr,
  pad_biu_acprot,
  pad_biu_acsnoop,
  pad_biu_acvalid,
  pad_biu_arready,
  pad_biu_awready,
  pad_biu_bid,
  pad_biu_bresp,
  pad_biu_bvalid,
  pad_biu_cdready,
  pad_biu_crready,
  pad_biu_csr_cmplt,
  pad_biu_csr_rdata,
  pad_biu_dbgrq_b,
  pad_biu_hpcp_l2of_int,
  pad_biu_me_int,
  pad_biu_ms_int,
  pad_biu_mt_int,
  pad_biu_rdata,
  pad_biu_rid,
  pad_biu_rlast,
  pad_biu_rresp,
  pad_biu_rvalid,
  pad_biu_se_int,
  pad_biu_ss_int,
  pad_biu_st_int,
  pad_biu_wns_awready,
  pad_biu_wns_wready,
  pad_biu_wready,
  pad_biu_ws_awready,
  pad_biu_ws_wready,
  pad_core_hartid,
  pad_core_rst_b,
  pad_core_rvba,
  pad_cpu_rst_b,
  pad_xx_apb_base,
  pad_xx_time,
  pad_yy_icg_scan_en,
  pad_yy_mbist_mode,
  pad_yy_scan_mode,
  pad_yy_scan_rst_b,
  pll_core_clk,
  rtu_cpu_no_retire,
  rtu_pad_retire0,
  rtu_pad_retire0_pc,
  rtu_pad_retire1,
  rtu_pad_retire1_pc,
  rtu_pad_retire2,
  rtu_pad_retire2_pc,
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

// &Ports("compare", "../../../gen_rtl/cpu/rtl/top_golden_port.v"); @28
input   [63 :0]  ir_corex_wdata;                      
input   [39 :0]  pad_biu_acaddr;                      
input   [2  :0]  pad_biu_acprot;                      
input   [3  :0]  pad_biu_acsnoop;                     
input            pad_biu_acvalid;                     
input            pad_biu_arready;                     
input            pad_biu_awready;                     
input   [4  :0]  pad_biu_bid;                         
input   [1  :0]  pad_biu_bresp;                       
input            pad_biu_bvalid;                      
input            pad_biu_cdready;                     
input            pad_biu_crready;                     
input            pad_biu_csr_cmplt;                   
input   [127:0]  pad_biu_csr_rdata;                   
input            pad_biu_dbgrq_b;                     
input   [3  :0]  pad_biu_hpcp_l2of_int;               
input            pad_biu_me_int;                      
input            pad_biu_ms_int;                      
input            pad_biu_mt_int;                      
input   [127:0]  pad_biu_rdata;                       
input   [4  :0]  pad_biu_rid;                         
input            pad_biu_rlast;                       
input   [3  :0]  pad_biu_rresp;                       
input            pad_biu_rvalid;                      
input            pad_biu_se_int;                      
input            pad_biu_ss_int;                      
input            pad_biu_st_int;                      
input            pad_biu_wns_awready;                 
input            pad_biu_wns_wready;                  
input            pad_biu_wready;                      
input            pad_biu_ws_awready;                  
input            pad_biu_ws_wready;                   
input   [2  :0]  pad_core_hartid;                     
input            pad_core_rst_b;                      
input   [39 :0]  pad_core_rvba;                       
input            pad_cpu_rst_b;                       
input   [39 :0]  pad_xx_apb_base;                     
input   [63 :0]  pad_xx_time;                         
input            pad_yy_icg_scan_en;                  
input            pad_yy_mbist_mode;                   
input            pad_yy_scan_mode;                    
input            pad_yy_scan_rst_b;                   
input            pll_core_clk;                        
input            sm_update_dr;                        
input            sm_update_ir;                        
input            x_enter_dbg_req_i;                   
input            x_exit_dbg_req_i;                    
input            x_had_dbg_mask;                      
output           biu_pad_acready;                     
output  [39 :0]  biu_pad_araddr;                      
output  [1  :0]  biu_pad_arbar;                       
output  [1  :0]  biu_pad_arburst;                     
output  [3  :0]  biu_pad_arcache;                     
output  [1  :0]  biu_pad_ardomain;                    
output  [4  :0]  biu_pad_arid;                        
output  [1  :0]  biu_pad_arlen;                       
output           biu_pad_arlock;                      
output  [2  :0]  biu_pad_arprot;                      
output  [2  :0]  biu_pad_arsize;                      
output  [3  :0]  biu_pad_arsnoop;                     
output  [2  :0]  biu_pad_aruser;                      
output           biu_pad_arvalid;                     
output  [39 :0]  biu_pad_awaddr;                      
output  [1  :0]  biu_pad_awbar;                       
output  [1  :0]  biu_pad_awburst;                     
output  [3  :0]  biu_pad_awcache;                     
output  [1  :0]  biu_pad_awdomain;                    
output  [4  :0]  biu_pad_awid;                        
output  [1  :0]  biu_pad_awlen;                       
output           biu_pad_awlock;                      
output  [2  :0]  biu_pad_awprot;                      
output  [2  :0]  biu_pad_awsize;                      
output  [2  :0]  biu_pad_awsnoop;                     
output           biu_pad_awunique;                    
output           biu_pad_awuser;                      
output           biu_pad_awvalid;                     
output           biu_pad_back;                        
output           biu_pad_bready;                      
output  [127:0]  biu_pad_cddata;                      
output           biu_pad_cderr;                       
output           biu_pad_cdlast;                      
output           biu_pad_cdvalid;                     
output  [3  :0]  biu_pad_cnt_en;                      
output  [4  :0]  biu_pad_crresp;                      
output           biu_pad_crvalid;                     
output           biu_pad_csr_sel;                     
output  [79 :0]  biu_pad_csr_wdata;                   
output           biu_pad_jdb_pm;                      
output           biu_pad_lpmd_b;                      
output           biu_pad_rack;                        
output           biu_pad_rready;                      
output  [127:0]  biu_pad_wdata;                       
output           biu_pad_werr;                        
output           biu_pad_wlast;                       
output           biu_pad_wns;                         
output  [15 :0]  biu_pad_wstrb;                       
output           biu_pad_wvalid;                      
output  [63 :0]  cp0_pad_mstatus;                     
output           rtu_cpu_no_retire;                   
output           rtu_pad_retire0;                     
output  [39 :0]  rtu_pad_retire0_pc;                  
output           rtu_pad_retire1;                     
output  [39 :0]  rtu_pad_retire1_pc;                  
output           rtu_pad_retire2;                     
output  [39 :0]  rtu_pad_retire2_pc;                  
output           x_dbg_ack_pc;                        
output           x_enter_dbg_req_o;                   
output           x_exit_dbg_req_o;                    
output  [63 :0]  x_regs_serial_data;                  

//&Ports;
// &Regs; @30

// &Wires; @31
wire    [39 :0]  biu_cp0_apb_base;                    
wire             biu_cp0_cmplt;                       
wire    [2  :0]  biu_cp0_coreid;                      
wire             biu_cp0_me_int;                      
wire             biu_cp0_ms_int;                      
wire             biu_cp0_mt_int;                      
wire    [127:0]  biu_cp0_rdata;                       
wire    [39 :0]  biu_cp0_rvba;                        
wire             biu_cp0_se_int;                      
wire             biu_cp0_ss_int;                      
wire             biu_cp0_st_int;                      
wire    [1  :0]  biu_had_coreid;                      
wire             biu_had_sdb_req_b;                   
wire             biu_hpcp_cmplt;                      
wire    [3  :0]  biu_hpcp_l2of_int;                   
wire    [127:0]  biu_hpcp_rdata;                      
wire    [63 :0]  biu_hpcp_time;                       
wire    [127:0]  biu_ifu_rd_data;                     
wire             biu_ifu_rd_data_vld;                 
wire             biu_ifu_rd_grnt;                     
wire             biu_ifu_rd_id;                       
wire             biu_ifu_rd_last;                     
wire    [1  :0]  biu_ifu_rd_resp;                     
wire    [39 :0]  biu_lsu_ac_addr;                     
wire    [2  :0]  biu_lsu_ac_prot;                     
wire             biu_lsu_ac_req;                      
wire    [3  :0]  biu_lsu_ac_snoop;                    
wire             biu_lsu_ar_ready;                    
wire             biu_lsu_aw_vb_grnt;                  
wire             biu_lsu_aw_wmb_grnt;                 
wire    [4  :0]  biu_lsu_b_id;                        
wire    [1  :0]  biu_lsu_b_resp;                      
wire             biu_lsu_b_vld;                       
wire             biu_lsu_cd_ready;                    
wire             biu_lsu_cr_ready;                    
wire    [127:0]  biu_lsu_r_data;                      
wire    [4  :0]  biu_lsu_r_id;                        
wire             biu_lsu_r_last;                      
wire    [3  :0]  biu_lsu_r_resp;                      
wire             biu_lsu_r_vld;                       
wire             biu_lsu_w_vb_grnt;                   
wire             biu_lsu_w_wmb_grnt;                  
wire             biu_mmu_smp_disable;                 
wire             biu_pad_acready;                     
wire    [39 :0]  biu_pad_araddr;                      
wire    [1  :0]  biu_pad_arbar;                       
wire    [1  :0]  biu_pad_arburst;                     
wire    [3  :0]  biu_pad_arcache;                     
wire    [1  :0]  biu_pad_ardomain;                    
wire    [4  :0]  biu_pad_arid;                        
wire    [1  :0]  biu_pad_arlen;                       
wire             biu_pad_arlock;                      
wire    [2  :0]  biu_pad_arprot;                      
wire    [2  :0]  biu_pad_arsize;                      
wire    [3  :0]  biu_pad_arsnoop;                     
wire    [2  :0]  biu_pad_aruser;                      
wire             biu_pad_arvalid;                     
wire    [39 :0]  biu_pad_awaddr;                      
wire    [1  :0]  biu_pad_awbar;                       
wire    [1  :0]  biu_pad_awburst;                     
wire    [3  :0]  biu_pad_awcache;                     
wire    [1  :0]  biu_pad_awdomain;                    
wire    [4  :0]  biu_pad_awid;                        
wire    [1  :0]  biu_pad_awlen;                       
wire             biu_pad_awlock;                      
wire    [2  :0]  biu_pad_awprot;                      
wire    [2  :0]  biu_pad_awsize;                      
wire    [2  :0]  biu_pad_awsnoop;                     
wire             biu_pad_awunique;                    
wire             biu_pad_awuser;                      
wire             biu_pad_awvalid;                     
wire             biu_pad_back;                        
wire             biu_pad_bready;                      
wire    [127:0]  biu_pad_cddata;                      
wire             biu_pad_cderr;                       
wire             biu_pad_cdlast;                      
wire             biu_pad_cdvalid;                     
wire    [3  :0]  biu_pad_cnt_en;                      
wire    [4  :0]  biu_pad_crresp;                      
wire             biu_pad_crvalid;                     
wire             biu_pad_csr_sel;                     
wire    [79 :0]  biu_pad_csr_wdata;                   
wire             biu_pad_jdb_pm;                      
wire             biu_pad_lpmd_b;                      
wire             biu_pad_rack;                        
wire             biu_pad_rready;                      
wire    [127:0]  biu_pad_wdata;                       
wire             biu_pad_werr;                        
wire             biu_pad_wlast;                       
wire             biu_pad_wns;                         
wire    [15 :0]  biu_pad_wstrb;                       
wire             biu_pad_wvalid;                      
wire             biu_xx_dbg_wakeup;                   
wire             biu_xx_int_wakeup;                   
wire             biu_xx_normal_work;                  
wire             biu_xx_pmp_sel;                      
wire             biu_xx_snoop_vld;                    
wire             biu_yy_xx_no_op;                     
wire             coreclk;                             
wire             cp0_biu_icg_en;                      
wire    [1  :0]  cp0_biu_lpmd_b;                      
wire    [15 :0]  cp0_biu_op;                          
wire             cp0_biu_sel;                         
wire    [63 :0]  cp0_biu_wdata;                       
wire    [31 :0]  cp0_had_cpuid_0;                     
wire    [3  :0]  cp0_had_debug_info;                  
wire    [1  :0]  cp0_had_lpmd_b;                      
wire    [1  :0]  cp0_had_trace_pm_wdata;              
wire             cp0_had_trace_pm_wen;                
wire             cp0_hpcp_icg_en;                     
wire    [11 :0]  cp0_hpcp_index;                      
wire             cp0_hpcp_int_disable;                
wire    [31 :0]  cp0_hpcp_mcntwen;                    
wire    [3  :0]  cp0_hpcp_op;                         
wire             cp0_hpcp_pmdm;                       
wire             cp0_hpcp_pmds;                       
wire             cp0_hpcp_pmdu;                       
wire             cp0_hpcp_sel;                        
wire    [63 :0]  cp0_hpcp_src0;                       
wire    [63 :0]  cp0_hpcp_wdata;                      
wire             cp0_mmu_cskyee;                      
wire             cp0_mmu_icg_en;                      
wire             cp0_mmu_maee;                        
wire    [1  :0]  cp0_mmu_mpp;                         
wire             cp0_mmu_mprv;                        
wire             cp0_mmu_mxr;                         
wire             cp0_mmu_no_op_req;                   
wire             cp0_mmu_ptw_en;                      
wire    [1  :0]  cp0_mmu_reg_num;                     
wire             cp0_mmu_satp_sel;                    
wire             cp0_mmu_sum;                         
wire             cp0_mmu_tlb_all_inv;                 
wire    [63 :0]  cp0_mmu_wdata;                       
wire             cp0_mmu_wreg;                        
wire    [63 :0]  cp0_pad_mstatus;                     
wire             cp0_pmp_icg_en;                      
wire    [1  :0]  cp0_pmp_mpp;                         
wire             cp0_pmp_mprv;                        
wire    [4  :0]  cp0_pmp_reg_num;                     
wire    [63 :0]  cp0_pmp_wdata;                       
wire             cp0_pmp_wreg;                        
wire             cp0_xx_core_icg_en;                  
wire    [1  :0]  cp0_yy_priv_mode;                    
wire             forever_coreclk;                     
wire             fpu_rst_b;                           
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
wire             had_rst_b;                           
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
wire    [3  :0]  hpcp_biu_cnt_en;                     
wire    [15 :0]  hpcp_biu_op;                         
wire             hpcp_biu_sel;                        
wire    [63 :0]  hpcp_biu_wdata;                      
wire             hpcp_cp0_cmplt;                      
wire    [63 :0]  hpcp_cp0_data;                       
wire             hpcp_cp0_int_vld;                    
wire             hpcp_cp0_sce;                        
wire             hpcp_idu_cnt_en;                     
wire             hpcp_ifu_cnt_en;                     
wire             hpcp_lsu_cnt_en;                     
wire             hpcp_mmu_cnt_en;                     
wire             hpcp_rtu_cnt_en;                     
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
wire             idu_hpcp_backend_stall;              
wire             idu_hpcp_fence_sync_vld;             
wire    [6  :0]  idu_hpcp_ir_inst0_type;              
wire             idu_hpcp_ir_inst0_vld;               
wire    [6  :0]  idu_hpcp_ir_inst1_type;              
wire             idu_hpcp_ir_inst1_vld;               
wire    [6  :0]  idu_hpcp_ir_inst2_type;              
wire             idu_hpcp_ir_inst2_vld;               
wire    [6  :0]  idu_hpcp_ir_inst3_type;              
wire             idu_hpcp_ir_inst3_vld;               
wire             idu_hpcp_rf_inst_vld;                
wire             idu_hpcp_rf_pipe0_inst_vld;          
wire             idu_hpcp_rf_pipe0_lch_fail_vld;      
wire             idu_hpcp_rf_pipe1_inst_vld;          
wire             idu_hpcp_rf_pipe1_lch_fail_vld;      
wire             idu_hpcp_rf_pipe2_inst_vld;          
wire             idu_hpcp_rf_pipe2_lch_fail_vld;      
wire             idu_hpcp_rf_pipe3_inst_vld;          
wire             idu_hpcp_rf_pipe3_lch_fail_vld;      
wire             idu_hpcp_rf_pipe3_reg_lch_fail_vld;  
wire             idu_hpcp_rf_pipe4_inst_vld;          
wire             idu_hpcp_rf_pipe4_lch_fail_vld;      
wire             idu_hpcp_rf_pipe4_reg_lch_fail_vld;  
wire             idu_hpcp_rf_pipe5_inst_vld;          
wire             idu_hpcp_rf_pipe5_lch_fail_vld;      
wire             idu_hpcp_rf_pipe5_reg_lch_fail_vld;  
wire             idu_hpcp_rf_pipe6_inst_vld;          
wire             idu_hpcp_rf_pipe6_lch_fail_vld;      
wire             idu_hpcp_rf_pipe7_inst_vld;          
wire             idu_hpcp_rf_pipe7_lch_fail_vld;      
wire             idu_rst_b;                           
wire             ifu_biu_r_ready;                     
wire    [39 :0]  ifu_biu_rd_addr;                     
wire    [1  :0]  ifu_biu_rd_burst;                    
wire    [3  :0]  ifu_biu_rd_cache;                    
wire    [1  :0]  ifu_biu_rd_domain;                   
wire             ifu_biu_rd_id;                       
wire    [1  :0]  ifu_biu_rd_len;                      
wire    [2  :0]  ifu_biu_rd_prot;                     
wire             ifu_biu_rd_req;                      
wire             ifu_biu_rd_req_gate;                 
wire    [2  :0]  ifu_biu_rd_size;                     
wire    [3  :0]  ifu_biu_rd_snoop;                    
wire    [1  :0]  ifu_biu_rd_user;                     
wire    [82 :0]  ifu_had_debug_info;                  
wire             ifu_had_no_inst;                     
wire             ifu_had_no_op;                       
wire             ifu_had_reset_on;                    
wire             ifu_hpcp_btb_inst;                   
wire             ifu_hpcp_btb_mispred;                
wire             ifu_hpcp_frontend_stall;             
wire             ifu_hpcp_icache_access;              
wire             ifu_hpcp_icache_miss;                
wire             ifu_mmu_abort;                       
wire    [62 :0]  ifu_mmu_va;                          
wire             ifu_mmu_va_vld;                      
wire             ifu_rst_b;                           
wire    [63 :0]  ir_corex_wdata;                      
wire    [9  :0]  iu_had_debug_info;                   
wire             lsu_biu_ac_empty;                    
wire             lsu_biu_ac_ready;                    
wire    [39 :0]  lsu_biu_ar_addr;                     
wire    [1  :0]  lsu_biu_ar_bar;                      
wire    [1  :0]  lsu_biu_ar_burst;                    
wire    [3  :0]  lsu_biu_ar_cache;                    
wire    [1  :0]  lsu_biu_ar_domain;                   
wire             lsu_biu_ar_dp_req;                   
wire    [4  :0]  lsu_biu_ar_id;                       
wire    [1  :0]  lsu_biu_ar_len;                      
wire             lsu_biu_ar_lock;                     
wire    [2  :0]  lsu_biu_ar_prot;                     
wire             lsu_biu_ar_req;                      
wire             lsu_biu_ar_req_gate;                 
wire    [2  :0]  lsu_biu_ar_size;                     
wire    [3  :0]  lsu_biu_ar_snoop;                    
wire    [2  :0]  lsu_biu_ar_user;                     
wire             lsu_biu_aw_req_gate;                 
wire    [39 :0]  lsu_biu_aw_st_addr;                  
wire    [1  :0]  lsu_biu_aw_st_bar;                   
wire    [1  :0]  lsu_biu_aw_st_burst;                 
wire    [3  :0]  lsu_biu_aw_st_cache;                 
wire    [1  :0]  lsu_biu_aw_st_domain;                
wire             lsu_biu_aw_st_dp_req;                
wire    [4  :0]  lsu_biu_aw_st_id;                    
wire    [1  :0]  lsu_biu_aw_st_len;                   
wire             lsu_biu_aw_st_lock;                  
wire    [2  :0]  lsu_biu_aw_st_prot;                  
wire             lsu_biu_aw_st_req;                   
wire    [2  :0]  lsu_biu_aw_st_size;                  
wire    [2  :0]  lsu_biu_aw_st_snoop;                 
wire             lsu_biu_aw_st_unique;                
wire             lsu_biu_aw_st_user;                  
wire    [39 :0]  lsu_biu_aw_vict_addr;                
wire    [1  :0]  lsu_biu_aw_vict_bar;                 
wire    [1  :0]  lsu_biu_aw_vict_burst;               
wire    [3  :0]  lsu_biu_aw_vict_cache;               
wire    [1  :0]  lsu_biu_aw_vict_domain;              
wire             lsu_biu_aw_vict_dp_req;              
wire    [4  :0]  lsu_biu_aw_vict_id;                  
wire    [1  :0]  lsu_biu_aw_vict_len;                 
wire             lsu_biu_aw_vict_lock;                
wire    [2  :0]  lsu_biu_aw_vict_prot;                
wire             lsu_biu_aw_vict_req;                 
wire    [2  :0]  lsu_biu_aw_vict_size;                
wire    [2  :0]  lsu_biu_aw_vict_snoop;               
wire             lsu_biu_aw_vict_unique;              
wire             lsu_biu_aw_vict_user;                
wire    [127:0]  lsu_biu_cd_data;                     
wire             lsu_biu_cd_last;                     
wire             lsu_biu_cd_valid;                    
wire    [4  :0]  lsu_biu_cr_resp;                     
wire             lsu_biu_cr_valid;                    
wire             lsu_biu_r_linefill_ready;            
wire    [127:0]  lsu_biu_w_st_data;                   
wire             lsu_biu_w_st_last;                   
wire    [15 :0]  lsu_biu_w_st_strb;                   
wire             lsu_biu_w_st_vld;                    
wire             lsu_biu_w_st_wns;                    
wire    [127:0]  lsu_biu_w_vict_data;                 
wire             lsu_biu_w_vict_last;                 
wire    [15 :0]  lsu_biu_w_vict_strb;                 
wire             lsu_biu_w_vict_vld;                  
wire             lsu_biu_w_vict_wns;                  
wire    [183:0]  lsu_had_debug_info;                  
wire    [39 :0]  lsu_had_ld_addr;                     
wire    [63 :0]  lsu_had_ld_data;                     
wire    [6  :0]  lsu_had_ld_iid;                      
wire             lsu_had_ld_req;                      
wire    [3  :0]  lsu_had_ld_type;                     
wire             lsu_had_no_op;                       
wire    [39 :0]  lsu_had_st_addr;                     
wire    [63 :0]  lsu_had_st_data;                     
wire    [6  :0]  lsu_had_st_iid;                      
wire             lsu_had_st_req;                      
wire    [3  :0]  lsu_had_st_type;                     
wire             lsu_hpcp_cache_read_access;          
wire             lsu_hpcp_cache_read_miss;            
wire             lsu_hpcp_cache_write_access;         
wire             lsu_hpcp_cache_write_miss;           
wire             lsu_hpcp_fence_stall;                
wire             lsu_hpcp_ld_stall_cross_4k;          
wire             lsu_hpcp_ld_stall_other;             
wire             lsu_hpcp_replay_data_discard;        
wire             lsu_hpcp_replay_discard_sq;          
wire             lsu_hpcp_st_stall_cross_4k;          
wire             lsu_hpcp_st_stall_other;             
wire    [1  :0]  lsu_hpcp_unalign_inst;               
wire             lsu_mmu_abort0;                      
wire             lsu_mmu_abort1;                      
wire             lsu_mmu_bus_error;                   
wire    [63 :0]  lsu_mmu_data;                        
wire             lsu_mmu_data_vld;                    
wire    [6  :0]  lsu_mmu_id0;                         
wire    [6  :0]  lsu_mmu_id1;                         
wire             lsu_mmu_st_inst0;                    
wire             lsu_mmu_st_inst1;                    
wire    [27 :0]  lsu_mmu_stamo_pa;                    
wire             lsu_mmu_stamo_vld;                   
wire             lsu_mmu_tlb_all_inv;                 
wire    [15 :0]  lsu_mmu_tlb_asid;                    
wire             lsu_mmu_tlb_asid_all_inv;            
wire    [26 :0]  lsu_mmu_tlb_va;                      
wire             lsu_mmu_tlb_va_all_inv;              
wire             lsu_mmu_tlb_va_asid_inv;             
wire    [63 :0]  lsu_mmu_va0;                         
wire             lsu_mmu_va0_vld;                     
wire    [63 :0]  lsu_mmu_va1;                         
wire             lsu_mmu_va1_vld;                     
wire    [27 :0]  lsu_mmu_va2;                         
wire             lsu_mmu_va2_vld;                     
wire    [27 :0]  lsu_mmu_vabuf0;                      
wire    [27 :0]  lsu_mmu_vabuf1;                      
wire             lsu_rst_b;                           
wire             mmu_cp0_cmplt;                       
wire    [63 :0]  mmu_cp0_data;                        
wire    [63 :0]  mmu_cp0_satp_data;                   
wire             mmu_cp0_tlb_done;                    
wire    [33 :0]  mmu_had_debug_info;                  
wire             mmu_hpcp_dutlb_miss;                 
wire             mmu_hpcp_iutlb_miss;                 
wire             mmu_hpcp_jtlb_miss;                  
wire             mmu_ifu_buf;                         
wire             mmu_ifu_ca;                          
wire             mmu_ifu_deny;                        
wire    [27 :0]  mmu_ifu_pa;                          
wire             mmu_ifu_pavld;                       
wire             mmu_ifu_pgflt;                       
wire             mmu_ifu_sec;                         
wire             mmu_lsu_access_fault0;               
wire             mmu_lsu_access_fault1;               
wire             mmu_lsu_buf0;                        
wire             mmu_lsu_buf1;                        
wire             mmu_lsu_ca0;                         
wire             mmu_lsu_ca1;                         
wire             mmu_lsu_data_req;                    
wire    [39 :0]  mmu_lsu_data_req_addr;               
wire             mmu_lsu_data_req_size;               
wire             mmu_lsu_mmu_en;                      
wire    [27 :0]  mmu_lsu_pa0;                         
wire             mmu_lsu_pa0_vld;                     
wire    [27 :0]  mmu_lsu_pa1;                         
wire             mmu_lsu_pa1_vld;                     
wire    [27 :0]  mmu_lsu_pa2;                         
wire             mmu_lsu_pa2_err;                     
wire             mmu_lsu_pa2_vld;                     
wire             mmu_lsu_page_fault0;                 
wire             mmu_lsu_page_fault1;                 
wire             mmu_lsu_sec0;                        
wire             mmu_lsu_sec1;                        
wire             mmu_lsu_sec2;                        
wire             mmu_lsu_sh0;                         
wire             mmu_lsu_sh1;                         
wire             mmu_lsu_share2;                      
wire             mmu_lsu_so0;                         
wire             mmu_lsu_so1;                         
wire             mmu_lsu_stall0;                      
wire             mmu_lsu_stall1;                      
wire             mmu_lsu_tlb_busy;                    
wire             mmu_lsu_tlb_inv_done;                
wire    [11 :0]  mmu_lsu_tlb_wakeup;                  
wire             mmu_pmp_fetch3;                      
wire    [27 :0]  mmu_pmp_pa0;                         
wire    [27 :0]  mmu_pmp_pa1;                         
wire    [27 :0]  mmu_pmp_pa2;                         
wire    [27 :0]  mmu_pmp_pa3;                         
wire    [27 :0]  mmu_pmp_pa4;                         
wire             mmu_rst_b;                           
wire             mmu_xx_mmu_en;                       
wire             mmu_yy_xx_no_op;                     
wire    [39 :0]  pad_biu_acaddr;                      
wire    [2  :0]  pad_biu_acprot;                      
wire    [3  :0]  pad_biu_acsnoop;                     
wire             pad_biu_acvalid;                     
wire             pad_biu_arready;                     
wire             pad_biu_awready;                     
wire    [4  :0]  pad_biu_bid;                         
wire    [1  :0]  pad_biu_bresp;                       
wire             pad_biu_bvalid;                      
wire             pad_biu_cdready;                     
wire             pad_biu_crready;                     
wire             pad_biu_csr_cmplt;                   
wire    [127:0]  pad_biu_csr_rdata;                   
wire             pad_biu_dbgrq_b;                     
wire    [3  :0]  pad_biu_hpcp_l2of_int;               
wire             pad_biu_me_int;                      
wire             pad_biu_ms_int;                      
wire             pad_biu_mt_int;                      
wire    [127:0]  pad_biu_rdata;                       
wire    [4  :0]  pad_biu_rid;                         
wire             pad_biu_rlast;                       
wire    [3  :0]  pad_biu_rresp;                       
wire             pad_biu_rvalid;                      
wire             pad_biu_se_int;                      
wire             pad_biu_ss_int;                      
wire             pad_biu_st_int;                      
wire             pad_biu_wns_awready;                 
wire             pad_biu_wns_wready;                  
wire             pad_biu_wready;                      
wire             pad_biu_ws_awready;                  
wire             pad_biu_ws_wready;                   
wire    [2  :0]  pad_core_hartid;                     
wire             pad_core_rst_b;                      
wire    [39 :0]  pad_core_rvba;                       
wire             pad_cpu_rst_b;                       
wire    [39 :0]  pad_xx_apb_base;                     
wire    [63 :0]  pad_xx_time;                         
wire             pad_yy_icg_scan_en;                  
wire             pad_yy_mbist_mode;                   
wire             pad_yy_scan_mode;                    
wire             pad_yy_scan_rst_b;                   
wire             pll_core_clk;                        
wire    [63 :0]  pmp_cp0_data;                        
wire    [3  :0]  pmp_mmu_flg0;                        
wire    [3  :0]  pmp_mmu_flg1;                        
wire    [3  :0]  pmp_mmu_flg2;                        
wire    [3  :0]  pmp_mmu_flg3;                        
wire    [3  :0]  pmp_mmu_flg4;                        
wire             rtu_cpu_no_retire;                   
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
wire             rtu_had_xx_pcfifo_inst0_condbr;      
wire             rtu_had_xx_pcfifo_inst0_condbr_taken; 
wire    [6  :0]  rtu_had_xx_pcfifo_inst0_iid;         
wire             rtu_had_xx_pcfifo_inst0_jmp;         
wire    [38 :0]  rtu_had_xx_pcfifo_inst0_next_pc;     
wire             rtu_had_xx_pcfifo_inst0_pcall;       
wire             rtu_had_xx_pcfifo_inst0_preturn;     
wire             rtu_had_xx_pcfifo_inst1_chgflow;     
wire             rtu_had_xx_pcfifo_inst1_condbr;      
wire             rtu_had_xx_pcfifo_inst1_condbr_taken; 
wire             rtu_had_xx_pcfifo_inst1_jmp;         
wire    [38 :0]  rtu_had_xx_pcfifo_inst1_next_pc;     
wire             rtu_had_xx_pcfifo_inst1_pcall;       
wire             rtu_had_xx_pcfifo_inst1_preturn;     
wire             rtu_had_xx_pcfifo_inst2_chgflow;     
wire             rtu_had_xx_pcfifo_inst2_condbr;      
wire             rtu_had_xx_pcfifo_inst2_condbr_taken; 
wire             rtu_had_xx_pcfifo_inst2_jmp;         
wire    [38 :0]  rtu_had_xx_pcfifo_inst2_next_pc;     
wire             rtu_had_xx_pcfifo_inst2_pcall;       
wire             rtu_had_xx_pcfifo_inst2_preturn;     
wire             rtu_had_xx_split_inst;               
wire             rtu_hpcp_inst0_ack_int;              
wire             rtu_hpcp_inst0_bht_mispred;          
wire             rtu_hpcp_inst0_condbr;               
wire    [39 :0]  rtu_hpcp_inst0_cur_pc;               
wire             rtu_hpcp_inst0_jmp;                  
wire             rtu_hpcp_inst0_jmp_mispred;          
wire             rtu_hpcp_inst0_jmp_pc_offset_8m;     
wire    [1  :0]  rtu_hpcp_inst0_num;                  
wire    [2  :0]  rtu_hpcp_inst0_pc_offset;            
wire             rtu_hpcp_inst0_spec_fail;            
wire             rtu_hpcp_inst0_split;                
wire             rtu_hpcp_inst0_store;                
wire             rtu_hpcp_inst0_vld;                  
wire             rtu_hpcp_inst1_condbr;               
wire    [39 :0]  rtu_hpcp_inst1_cur_pc;               
wire             rtu_hpcp_inst1_jmp;                  
wire             rtu_hpcp_inst1_jmp_pc_offset_8m;     
wire    [1  :0]  rtu_hpcp_inst1_num;                  
wire    [2  :0]  rtu_hpcp_inst1_pc_offset;            
wire             rtu_hpcp_inst1_split;                
wire             rtu_hpcp_inst1_store;                
wire             rtu_hpcp_inst1_vld;                  
wire             rtu_hpcp_inst2_condbr;               
wire    [39 :0]  rtu_hpcp_inst2_cur_pc;               
wire             rtu_hpcp_inst2_jmp;                  
wire             rtu_hpcp_inst2_jmp_pc_offset_8m;     
wire    [1  :0]  rtu_hpcp_inst2_num;                  
wire    [2  :0]  rtu_hpcp_inst2_pc_offset;            
wire             rtu_hpcp_inst2_split;                
wire             rtu_hpcp_inst2_store;                
wire             rtu_hpcp_inst2_vld;                  
wire             rtu_hpcp_trace_inst0_chgflow;        
wire    [38 :0]  rtu_hpcp_trace_inst0_next_pc;        
wire             rtu_hpcp_trace_inst1_chgflow;        
wire    [38 :0]  rtu_hpcp_trace_inst1_next_pc;        
wire             rtu_hpcp_trace_inst2_chgflow;        
wire    [38 :0]  rtu_hpcp_trace_inst2_next_pc;        
wire    [26 :0]  rtu_mmu_bad_vpn;                     
wire             rtu_mmu_expt_vld;                    
wire             rtu_pad_retire0;                     
wire    [39 :0]  rtu_pad_retire0_pc;                  
wire             rtu_pad_retire1;                     
wire    [39 :0]  rtu_pad_retire1_pc;                  
wire             rtu_pad_retire2;                     
wire    [39 :0]  rtu_pad_retire2_pc;                  
wire             rtu_yy_xx_dbgon;                     
wire             rtu_yy_xx_flush;                     
wire             rtu_yy_xx_retire0;                   
wire             rtu_yy_xx_retire0_normal;            
wire             rtu_yy_xx_retire1;                   
wire             rtu_yy_xx_retire2;                   
wire             sm_update_dr;                        
wire             sm_update_ir;                        
wire             x_dbg_ack_pc;                        
wire             x_enter_dbg_req_i;                   
wire             x_enter_dbg_req_o;                   
wire             x_exit_dbg_req_i;                    
wire             x_exit_dbg_req_o;                    
wire             x_had_dbg_mask;                      
wire    [63 :0]  x_regs_serial_data;                  


// &Force("input", "pad_core_sleep_in"); @34
// &Force("output","core_pad_sleep_out"); @35
//==========================================================
//  Instance core module
//==========================================================
// &Instance("ct_core"); @40
ct_core  x_ct_core (
  .biu_cp0_apb_base                     (biu_cp0_apb_base                    ),
  .biu_cp0_cmplt                        (biu_cp0_cmplt                       ),
  .biu_cp0_coreid                       (biu_cp0_coreid                      ),
  .biu_cp0_me_int                       (biu_cp0_me_int                      ),
  .biu_cp0_ms_int                       (biu_cp0_ms_int                      ),
  .biu_cp0_mt_int                       (biu_cp0_mt_int                      ),
  .biu_cp0_rdata                        (biu_cp0_rdata                       ),
  .biu_cp0_rvba                         (biu_cp0_rvba                        ),
  .biu_cp0_se_int                       (biu_cp0_se_int                      ),
  .biu_cp0_ss_int                       (biu_cp0_ss_int                      ),
  .biu_cp0_st_int                       (biu_cp0_st_int                      ),
  .biu_ifu_rd_data                      (biu_ifu_rd_data                     ),
  .biu_ifu_rd_data_vld                  (biu_ifu_rd_data_vld                 ),
  .biu_ifu_rd_grnt                      (biu_ifu_rd_grnt                     ),
  .biu_ifu_rd_id                        (biu_ifu_rd_id                       ),
  .biu_ifu_rd_last                      (biu_ifu_rd_last                     ),
  .biu_ifu_rd_resp                      (biu_ifu_rd_resp                     ),
  .biu_lsu_ac_addr                      (biu_lsu_ac_addr                     ),
  .biu_lsu_ac_prot                      (biu_lsu_ac_prot                     ),
  .biu_lsu_ac_req                       (biu_lsu_ac_req                      ),
  .biu_lsu_ac_snoop                     (biu_lsu_ac_snoop                    ),
  .biu_lsu_ar_ready                     (biu_lsu_ar_ready                    ),
  .biu_lsu_aw_vb_grnt                   (biu_lsu_aw_vb_grnt                  ),
  .biu_lsu_aw_wmb_grnt                  (biu_lsu_aw_wmb_grnt                 ),
  .biu_lsu_b_id                         (biu_lsu_b_id                        ),
  .biu_lsu_b_resp                       (biu_lsu_b_resp                      ),
  .biu_lsu_b_vld                        (biu_lsu_b_vld                       ),
  .biu_lsu_cd_ready                     (biu_lsu_cd_ready                    ),
  .biu_lsu_cr_ready                     (biu_lsu_cr_ready                    ),
  .biu_lsu_r_data                       (biu_lsu_r_data                      ),
  .biu_lsu_r_id                         (biu_lsu_r_id                        ),
  .biu_lsu_r_last                       (biu_lsu_r_last                      ),
  .biu_lsu_r_resp                       (biu_lsu_r_resp                      ),
  .biu_lsu_r_vld                        (biu_lsu_r_vld                       ),
  .biu_lsu_w_vb_grnt                    (biu_lsu_w_vb_grnt                   ),
  .biu_lsu_w_wmb_grnt                   (biu_lsu_w_wmb_grnt                  ),
  .biu_yy_xx_no_op                      (biu_yy_xx_no_op                     ),
  .cp0_biu_icg_en                       (cp0_biu_icg_en                      ),
  .cp0_biu_lpmd_b                       (cp0_biu_lpmd_b                      ),
  .cp0_biu_op                           (cp0_biu_op                          ),
  .cp0_biu_sel                          (cp0_biu_sel                         ),
  .cp0_biu_wdata                        (cp0_biu_wdata                       ),
  .cp0_had_cpuid_0                      (cp0_had_cpuid_0                     ),
  .cp0_had_debug_info                   (cp0_had_debug_info                  ),
  .cp0_had_lpmd_b                       (cp0_had_lpmd_b                      ),
  .cp0_had_trace_pm_wdata               (cp0_had_trace_pm_wdata              ),
  .cp0_had_trace_pm_wen                 (cp0_had_trace_pm_wen                ),
  .cp0_hpcp_icg_en                      (cp0_hpcp_icg_en                     ),
  .cp0_hpcp_index                       (cp0_hpcp_index                      ),
  .cp0_hpcp_int_disable                 (cp0_hpcp_int_disable                ),
  .cp0_hpcp_mcntwen                     (cp0_hpcp_mcntwen                    ),
  .cp0_hpcp_op                          (cp0_hpcp_op                         ),
  .cp0_hpcp_pmdm                        (cp0_hpcp_pmdm                       ),
  .cp0_hpcp_pmds                        (cp0_hpcp_pmds                       ),
  .cp0_hpcp_pmdu                        (cp0_hpcp_pmdu                       ),
  .cp0_hpcp_sel                         (cp0_hpcp_sel                        ),
  .cp0_hpcp_src0                        (cp0_hpcp_src0                       ),
  .cp0_hpcp_wdata                       (cp0_hpcp_wdata                      ),
  .cp0_mmu_cskyee                       (cp0_mmu_cskyee                      ),
  .cp0_mmu_icg_en                       (cp0_mmu_icg_en                      ),
  .cp0_mmu_maee                         (cp0_mmu_maee                        ),
  .cp0_mmu_mpp                          (cp0_mmu_mpp                         ),
  .cp0_mmu_mprv                         (cp0_mmu_mprv                        ),
  .cp0_mmu_mxr                          (cp0_mmu_mxr                         ),
  .cp0_mmu_no_op_req                    (cp0_mmu_no_op_req                   ),
  .cp0_mmu_ptw_en                       (cp0_mmu_ptw_en                      ),
  .cp0_mmu_reg_num                      (cp0_mmu_reg_num                     ),
  .cp0_mmu_satp_sel                     (cp0_mmu_satp_sel                    ),
  .cp0_mmu_sum                          (cp0_mmu_sum                         ),
  .cp0_mmu_tlb_all_inv                  (cp0_mmu_tlb_all_inv                 ),
  .cp0_mmu_wdata                        (cp0_mmu_wdata                       ),
  .cp0_mmu_wreg                         (cp0_mmu_wreg                        ),
  .cp0_pad_mstatus                      (cp0_pad_mstatus                     ),
  .cp0_pmp_icg_en                       (cp0_pmp_icg_en                      ),
  .cp0_pmp_mpp                          (cp0_pmp_mpp                         ),
  .cp0_pmp_mprv                         (cp0_pmp_mprv                        ),
  .cp0_pmp_reg_num                      (cp0_pmp_reg_num                     ),
  .cp0_pmp_wdata                        (cp0_pmp_wdata                       ),
  .cp0_pmp_wreg                         (cp0_pmp_wreg                        ),
  .cp0_xx_core_icg_en                   (cp0_xx_core_icg_en                  ),
  .cp0_yy_priv_mode                     (cp0_yy_priv_mode                    ),
  .forever_cpuclk                       (coreclk                             ),
  .fpu_rst_b                            (fpu_rst_b                           ),
  .had_cp0_xx_dbg                       (had_cp0_xx_dbg                      ),
  .had_idu_debug_id_inst_en             (had_idu_debug_id_inst_en            ),
  .had_idu_wbbr_data                    (had_idu_wbbr_data                   ),
  .had_idu_wbbr_vld                     (had_idu_wbbr_vld                    ),
  .had_ifu_ir                           (had_ifu_ir                          ),
  .had_ifu_ir_vld                       (had_ifu_ir_vld                      ),
  .had_ifu_pc                           (had_ifu_pc                          ),
  .had_ifu_pcload                       (had_ifu_pcload                      ),
  .had_lsu_bus_trace_en                 (had_lsu_bus_trace_en                ),
  .had_lsu_dbg_en                       (had_lsu_dbg_en                      ),
  .had_rtu_data_bkpt_dbgreq             (had_rtu_data_bkpt_dbgreq            ),
  .had_rtu_dbg_disable                  (had_rtu_dbg_disable                 ),
  .had_rtu_dbg_req_en                   (had_rtu_dbg_req_en                  ),
  .had_rtu_debug_retire_info_en         (had_rtu_debug_retire_info_en        ),
  .had_rtu_event_dbgreq                 (had_rtu_event_dbgreq                ),
  .had_rtu_fdb                          (had_rtu_fdb                         ),
  .had_rtu_hw_dbgreq                    (had_rtu_hw_dbgreq                   ),
  .had_rtu_hw_dbgreq_gateclk            (had_rtu_hw_dbgreq_gateclk           ),
  .had_rtu_inst_bkpt_dbgreq             (had_rtu_inst_bkpt_dbgreq            ),
  .had_rtu_non_irv_bkpt_dbgreq          (had_rtu_non_irv_bkpt_dbgreq         ),
  .had_rtu_pop1_disa                    (had_rtu_pop1_disa                   ),
  .had_rtu_trace_dbgreq                 (had_rtu_trace_dbgreq                ),
  .had_rtu_trace_en                     (had_rtu_trace_en                    ),
  .had_rtu_xx_jdbreq                    (had_rtu_xx_jdbreq                   ),
  .had_rtu_xx_tme                       (had_rtu_xx_tme                      ),
  .had_yy_xx_bkpta_base                 (had_yy_xx_bkpta_base                ),
  .had_yy_xx_bkpta_mask                 (had_yy_xx_bkpta_mask                ),
  .had_yy_xx_bkpta_rc                   (had_yy_xx_bkpta_rc                  ),
  .had_yy_xx_bkptb_base                 (had_yy_xx_bkptb_base                ),
  .had_yy_xx_bkptb_mask                 (had_yy_xx_bkptb_mask                ),
  .had_yy_xx_bkptb_rc                   (had_yy_xx_bkptb_rc                  ),
  .had_yy_xx_exit_dbg                   (had_yy_xx_exit_dbg                  ),
  .hpcp_cp0_cmplt                       (hpcp_cp0_cmplt                      ),
  .hpcp_cp0_data                        (hpcp_cp0_data                       ),
  .hpcp_cp0_int_vld                     (hpcp_cp0_int_vld                    ),
  .hpcp_cp0_sce                         (hpcp_cp0_sce                        ),
  .hpcp_idu_cnt_en                      (hpcp_idu_cnt_en                     ),
  .hpcp_ifu_cnt_en                      (hpcp_ifu_cnt_en                     ),
  .hpcp_lsu_cnt_en                      (hpcp_lsu_cnt_en                     ),
  .hpcp_rtu_cnt_en                      (hpcp_rtu_cnt_en                     ),
  .idu_had_debug_info                   (idu_had_debug_info                  ),
  .idu_had_id_inst0_info                (idu_had_id_inst0_info               ),
  .idu_had_id_inst0_vld                 (idu_had_id_inst0_vld                ),
  .idu_had_id_inst1_info                (idu_had_id_inst1_info               ),
  .idu_had_id_inst1_vld                 (idu_had_id_inst1_vld                ),
  .idu_had_id_inst2_info                (idu_had_id_inst2_info               ),
  .idu_had_id_inst2_vld                 (idu_had_id_inst2_vld                ),
  .idu_had_iq_empty                     (idu_had_iq_empty                    ),
  .idu_had_pipe_stall                   (idu_had_pipe_stall                  ),
  .idu_had_pipeline_empty               (idu_had_pipeline_empty              ),
  .idu_had_wb_data                      (idu_had_wb_data                     ),
  .idu_had_wb_vld                       (idu_had_wb_vld                      ),
  .idu_hpcp_backend_stall               (idu_hpcp_backend_stall              ),
  .idu_hpcp_fence_sync_vld              (idu_hpcp_fence_sync_vld             ),
  .idu_hpcp_ir_inst0_type               (idu_hpcp_ir_inst0_type              ),
  .idu_hpcp_ir_inst0_vld                (idu_hpcp_ir_inst0_vld               ),
  .idu_hpcp_ir_inst1_type               (idu_hpcp_ir_inst1_type              ),
  .idu_hpcp_ir_inst1_vld                (idu_hpcp_ir_inst1_vld               ),
  .idu_hpcp_ir_inst2_type               (idu_hpcp_ir_inst2_type              ),
  .idu_hpcp_ir_inst2_vld                (idu_hpcp_ir_inst2_vld               ),
  .idu_hpcp_ir_inst3_type               (idu_hpcp_ir_inst3_type              ),
  .idu_hpcp_ir_inst3_vld                (idu_hpcp_ir_inst3_vld               ),
  .idu_hpcp_rf_inst_vld                 (idu_hpcp_rf_inst_vld                ),
  .idu_hpcp_rf_pipe0_inst_vld           (idu_hpcp_rf_pipe0_inst_vld          ),
  .idu_hpcp_rf_pipe0_lch_fail_vld       (idu_hpcp_rf_pipe0_lch_fail_vld      ),
  .idu_hpcp_rf_pipe1_inst_vld           (idu_hpcp_rf_pipe1_inst_vld          ),
  .idu_hpcp_rf_pipe1_lch_fail_vld       (idu_hpcp_rf_pipe1_lch_fail_vld      ),
  .idu_hpcp_rf_pipe2_inst_vld           (idu_hpcp_rf_pipe2_inst_vld          ),
  .idu_hpcp_rf_pipe2_lch_fail_vld       (idu_hpcp_rf_pipe2_lch_fail_vld      ),
  .idu_hpcp_rf_pipe3_inst_vld           (idu_hpcp_rf_pipe3_inst_vld          ),
  .idu_hpcp_rf_pipe3_lch_fail_vld       (idu_hpcp_rf_pipe3_lch_fail_vld      ),
  .idu_hpcp_rf_pipe3_reg_lch_fail_vld   (idu_hpcp_rf_pipe3_reg_lch_fail_vld  ),
  .idu_hpcp_rf_pipe4_inst_vld           (idu_hpcp_rf_pipe4_inst_vld          ),
  .idu_hpcp_rf_pipe4_lch_fail_vld       (idu_hpcp_rf_pipe4_lch_fail_vld      ),
  .idu_hpcp_rf_pipe4_reg_lch_fail_vld   (idu_hpcp_rf_pipe4_reg_lch_fail_vld  ),
  .idu_hpcp_rf_pipe5_inst_vld           (idu_hpcp_rf_pipe5_inst_vld          ),
  .idu_hpcp_rf_pipe5_lch_fail_vld       (idu_hpcp_rf_pipe5_lch_fail_vld      ),
  .idu_hpcp_rf_pipe5_reg_lch_fail_vld   (idu_hpcp_rf_pipe5_reg_lch_fail_vld  ),
  .idu_hpcp_rf_pipe6_inst_vld           (idu_hpcp_rf_pipe6_inst_vld          ),
  .idu_hpcp_rf_pipe6_lch_fail_vld       (idu_hpcp_rf_pipe6_lch_fail_vld      ),
  .idu_hpcp_rf_pipe7_inst_vld           (idu_hpcp_rf_pipe7_inst_vld          ),
  .idu_hpcp_rf_pipe7_lch_fail_vld       (idu_hpcp_rf_pipe7_lch_fail_vld      ),
  .idu_rst_b                            (idu_rst_b                           ),
  .ifu_biu_r_ready                      (ifu_biu_r_ready                     ),
  .ifu_biu_rd_addr                      (ifu_biu_rd_addr                     ),
  .ifu_biu_rd_burst                     (ifu_biu_rd_burst                    ),
  .ifu_biu_rd_cache                     (ifu_biu_rd_cache                    ),
  .ifu_biu_rd_domain                    (ifu_biu_rd_domain                   ),
  .ifu_biu_rd_id                        (ifu_biu_rd_id                       ),
  .ifu_biu_rd_len                       (ifu_biu_rd_len                      ),
  .ifu_biu_rd_prot                      (ifu_biu_rd_prot                     ),
  .ifu_biu_rd_req                       (ifu_biu_rd_req                      ),
  .ifu_biu_rd_req_gate                  (ifu_biu_rd_req_gate                 ),
  .ifu_biu_rd_size                      (ifu_biu_rd_size                     ),
  .ifu_biu_rd_snoop                     (ifu_biu_rd_snoop                    ),
  .ifu_biu_rd_user                      (ifu_biu_rd_user                     ),
  .ifu_had_debug_info                   (ifu_had_debug_info                  ),
  .ifu_had_no_inst                      (ifu_had_no_inst                     ),
  .ifu_had_no_op                        (ifu_had_no_op                       ),
  .ifu_had_reset_on                     (ifu_had_reset_on                    ),
  .ifu_hpcp_btb_inst                    (ifu_hpcp_btb_inst                   ),
  .ifu_hpcp_btb_mispred                 (ifu_hpcp_btb_mispred                ),
  .ifu_hpcp_frontend_stall              (ifu_hpcp_frontend_stall             ),
  .ifu_hpcp_icache_access               (ifu_hpcp_icache_access              ),
  .ifu_hpcp_icache_miss                 (ifu_hpcp_icache_miss                ),
  .ifu_mmu_abort                        (ifu_mmu_abort                       ),
  .ifu_mmu_va                           (ifu_mmu_va                          ),
  .ifu_mmu_va_vld                       (ifu_mmu_va_vld                      ),
  .ifu_rst_b                            (ifu_rst_b                           ),
  .iu_had_debug_info                    (iu_had_debug_info                   ),
  .lsu_biu_ac_empty                     (lsu_biu_ac_empty                    ),
  .lsu_biu_ac_ready                     (lsu_biu_ac_ready                    ),
  .lsu_biu_ar_addr                      (lsu_biu_ar_addr                     ),
  .lsu_biu_ar_bar                       (lsu_biu_ar_bar                      ),
  .lsu_biu_ar_burst                     (lsu_biu_ar_burst                    ),
  .lsu_biu_ar_cache                     (lsu_biu_ar_cache                    ),
  .lsu_biu_ar_domain                    (lsu_biu_ar_domain                   ),
  .lsu_biu_ar_dp_req                    (lsu_biu_ar_dp_req                   ),
  .lsu_biu_ar_id                        (lsu_biu_ar_id                       ),
  .lsu_biu_ar_len                       (lsu_biu_ar_len                      ),
  .lsu_biu_ar_lock                      (lsu_biu_ar_lock                     ),
  .lsu_biu_ar_prot                      (lsu_biu_ar_prot                     ),
  .lsu_biu_ar_req                       (lsu_biu_ar_req                      ),
  .lsu_biu_ar_req_gate                  (lsu_biu_ar_req_gate                 ),
  .lsu_biu_ar_size                      (lsu_biu_ar_size                     ),
  .lsu_biu_ar_snoop                     (lsu_biu_ar_snoop                    ),
  .lsu_biu_ar_user                      (lsu_biu_ar_user                     ),
  .lsu_biu_aw_req_gate                  (lsu_biu_aw_req_gate                 ),
  .lsu_biu_aw_st_addr                   (lsu_biu_aw_st_addr                  ),
  .lsu_biu_aw_st_bar                    (lsu_biu_aw_st_bar                   ),
  .lsu_biu_aw_st_burst                  (lsu_biu_aw_st_burst                 ),
  .lsu_biu_aw_st_cache                  (lsu_biu_aw_st_cache                 ),
  .lsu_biu_aw_st_domain                 (lsu_biu_aw_st_domain                ),
  .lsu_biu_aw_st_dp_req                 (lsu_biu_aw_st_dp_req                ),
  .lsu_biu_aw_st_id                     (lsu_biu_aw_st_id                    ),
  .lsu_biu_aw_st_len                    (lsu_biu_aw_st_len                   ),
  .lsu_biu_aw_st_lock                   (lsu_biu_aw_st_lock                  ),
  .lsu_biu_aw_st_prot                   (lsu_biu_aw_st_prot                  ),
  .lsu_biu_aw_st_req                    (lsu_biu_aw_st_req                   ),
  .lsu_biu_aw_st_size                   (lsu_biu_aw_st_size                  ),
  .lsu_biu_aw_st_snoop                  (lsu_biu_aw_st_snoop                 ),
  .lsu_biu_aw_st_unique                 (lsu_biu_aw_st_unique                ),
  .lsu_biu_aw_st_user                   (lsu_biu_aw_st_user                  ),
  .lsu_biu_aw_vict_addr                 (lsu_biu_aw_vict_addr                ),
  .lsu_biu_aw_vict_bar                  (lsu_biu_aw_vict_bar                 ),
  .lsu_biu_aw_vict_burst                (lsu_biu_aw_vict_burst               ),
  .lsu_biu_aw_vict_cache                (lsu_biu_aw_vict_cache               ),
  .lsu_biu_aw_vict_domain               (lsu_biu_aw_vict_domain              ),
  .lsu_biu_aw_vict_dp_req               (lsu_biu_aw_vict_dp_req              ),
  .lsu_biu_aw_vict_id                   (lsu_biu_aw_vict_id                  ),
  .lsu_biu_aw_vict_len                  (lsu_biu_aw_vict_len                 ),
  .lsu_biu_aw_vict_lock                 (lsu_biu_aw_vict_lock                ),
  .lsu_biu_aw_vict_prot                 (lsu_biu_aw_vict_prot                ),
  .lsu_biu_aw_vict_req                  (lsu_biu_aw_vict_req                 ),
  .lsu_biu_aw_vict_size                 (lsu_biu_aw_vict_size                ),
  .lsu_biu_aw_vict_snoop                (lsu_biu_aw_vict_snoop               ),
  .lsu_biu_aw_vict_unique               (lsu_biu_aw_vict_unique              ),
  .lsu_biu_aw_vict_user                 (lsu_biu_aw_vict_user                ),
  .lsu_biu_cd_data                      (lsu_biu_cd_data                     ),
  .lsu_biu_cd_last                      (lsu_biu_cd_last                     ),
  .lsu_biu_cd_valid                     (lsu_biu_cd_valid                    ),
  .lsu_biu_cr_resp                      (lsu_biu_cr_resp                     ),
  .lsu_biu_cr_valid                     (lsu_biu_cr_valid                    ),
  .lsu_biu_r_linefill_ready             (lsu_biu_r_linefill_ready            ),
  .lsu_biu_w_st_data                    (lsu_biu_w_st_data                   ),
  .lsu_biu_w_st_last                    (lsu_biu_w_st_last                   ),
  .lsu_biu_w_st_strb                    (lsu_biu_w_st_strb                   ),
  .lsu_biu_w_st_vld                     (lsu_biu_w_st_vld                    ),
  .lsu_biu_w_st_wns                     (lsu_biu_w_st_wns                    ),
  .lsu_biu_w_vict_data                  (lsu_biu_w_vict_data                 ),
  .lsu_biu_w_vict_last                  (lsu_biu_w_vict_last                 ),
  .lsu_biu_w_vict_strb                  (lsu_biu_w_vict_strb                 ),
  .lsu_biu_w_vict_vld                   (lsu_biu_w_vict_vld                  ),
  .lsu_biu_w_vict_wns                   (lsu_biu_w_vict_wns                  ),
  .lsu_had_debug_info                   (lsu_had_debug_info                  ),
  .lsu_had_ld_addr                      (lsu_had_ld_addr                     ),
  .lsu_had_ld_data                      (lsu_had_ld_data                     ),
  .lsu_had_ld_iid                       (lsu_had_ld_iid                      ),
  .lsu_had_ld_req                       (lsu_had_ld_req                      ),
  .lsu_had_ld_type                      (lsu_had_ld_type                     ),
  .lsu_had_no_op                        (lsu_had_no_op                       ),
  .lsu_had_st_addr                      (lsu_had_st_addr                     ),
  .lsu_had_st_data                      (lsu_had_st_data                     ),
  .lsu_had_st_iid                       (lsu_had_st_iid                      ),
  .lsu_had_st_req                       (lsu_had_st_req                      ),
  .lsu_had_st_type                      (lsu_had_st_type                     ),
  .lsu_hpcp_cache_read_access           (lsu_hpcp_cache_read_access          ),
  .lsu_hpcp_cache_read_miss             (lsu_hpcp_cache_read_miss            ),
  .lsu_hpcp_cache_write_access          (lsu_hpcp_cache_write_access         ),
  .lsu_hpcp_cache_write_miss            (lsu_hpcp_cache_write_miss           ),
  .lsu_hpcp_fence_stall                 (lsu_hpcp_fence_stall                ),
  .lsu_hpcp_ld_stall_cross_4k           (lsu_hpcp_ld_stall_cross_4k          ),
  .lsu_hpcp_ld_stall_other              (lsu_hpcp_ld_stall_other             ),
  .lsu_hpcp_replay_data_discard         (lsu_hpcp_replay_data_discard        ),
  .lsu_hpcp_replay_discard_sq           (lsu_hpcp_replay_discard_sq          ),
  .lsu_hpcp_st_stall_cross_4k           (lsu_hpcp_st_stall_cross_4k          ),
  .lsu_hpcp_st_stall_other              (lsu_hpcp_st_stall_other             ),
  .lsu_hpcp_unalign_inst                (lsu_hpcp_unalign_inst               ),
  .lsu_mmu_abort0                       (lsu_mmu_abort0                      ),
  .lsu_mmu_abort1                       (lsu_mmu_abort1                      ),
  .lsu_mmu_bus_error                    (lsu_mmu_bus_error                   ),
  .lsu_mmu_data                         (lsu_mmu_data                        ),
  .lsu_mmu_data_vld                     (lsu_mmu_data_vld                    ),
  .lsu_mmu_id0                          (lsu_mmu_id0                         ),
  .lsu_mmu_id1                          (lsu_mmu_id1                         ),
  .lsu_mmu_st_inst0                     (lsu_mmu_st_inst0                    ),
  .lsu_mmu_st_inst1                     (lsu_mmu_st_inst1                    ),
  .lsu_mmu_stamo_pa                     (lsu_mmu_stamo_pa                    ),
  .lsu_mmu_stamo_vld                    (lsu_mmu_stamo_vld                   ),
  .lsu_mmu_tlb_all_inv                  (lsu_mmu_tlb_all_inv                 ),
  .lsu_mmu_tlb_asid                     (lsu_mmu_tlb_asid                    ),
  .lsu_mmu_tlb_asid_all_inv             (lsu_mmu_tlb_asid_all_inv            ),
  .lsu_mmu_tlb_va                       (lsu_mmu_tlb_va                      ),
  .lsu_mmu_tlb_va_all_inv               (lsu_mmu_tlb_va_all_inv              ),
  .lsu_mmu_tlb_va_asid_inv              (lsu_mmu_tlb_va_asid_inv             ),
  .lsu_mmu_va0                          (lsu_mmu_va0                         ),
  .lsu_mmu_va0_vld                      (lsu_mmu_va0_vld                     ),
  .lsu_mmu_va1                          (lsu_mmu_va1                         ),
  .lsu_mmu_va1_vld                      (lsu_mmu_va1_vld                     ),
  .lsu_mmu_va2                          (lsu_mmu_va2                         ),
  .lsu_mmu_va2_vld                      (lsu_mmu_va2_vld                     ),
  .lsu_mmu_vabuf0                       (lsu_mmu_vabuf0                      ),
  .lsu_mmu_vabuf1                       (lsu_mmu_vabuf1                      ),
  .lsu_rst_b                            (lsu_rst_b                           ),
  .mmu_cp0_cmplt                        (mmu_cp0_cmplt                       ),
  .mmu_cp0_data                         (mmu_cp0_data                        ),
  .mmu_cp0_satp_data                    (mmu_cp0_satp_data                   ),
  .mmu_cp0_tlb_done                     (mmu_cp0_tlb_done                    ),
  .mmu_ifu_buf                          (mmu_ifu_buf                         ),
  .mmu_ifu_ca                           (mmu_ifu_ca                          ),
  .mmu_ifu_deny                         (mmu_ifu_deny                        ),
  .mmu_ifu_pa                           (mmu_ifu_pa                          ),
  .mmu_ifu_pavld                        (mmu_ifu_pavld                       ),
  .mmu_ifu_pgflt                        (mmu_ifu_pgflt                       ),
  .mmu_ifu_sec                          (mmu_ifu_sec                         ),
  .mmu_lsu_access_fault0                (mmu_lsu_access_fault0               ),
  .mmu_lsu_access_fault1                (mmu_lsu_access_fault1               ),
  .mmu_lsu_buf0                         (mmu_lsu_buf0                        ),
  .mmu_lsu_buf1                         (mmu_lsu_buf1                        ),
  .mmu_lsu_ca0                          (mmu_lsu_ca0                         ),
  .mmu_lsu_ca1                          (mmu_lsu_ca1                         ),
  .mmu_lsu_data_req                     (mmu_lsu_data_req                    ),
  .mmu_lsu_data_req_addr                (mmu_lsu_data_req_addr               ),
  .mmu_lsu_data_req_size                (mmu_lsu_data_req_size               ),
  .mmu_lsu_mmu_en                       (mmu_lsu_mmu_en                      ),
  .mmu_lsu_pa0                          (mmu_lsu_pa0                         ),
  .mmu_lsu_pa0_vld                      (mmu_lsu_pa0_vld                     ),
  .mmu_lsu_pa1                          (mmu_lsu_pa1                         ),
  .mmu_lsu_pa1_vld                      (mmu_lsu_pa1_vld                     ),
  .mmu_lsu_pa2                          (mmu_lsu_pa2                         ),
  .mmu_lsu_pa2_err                      (mmu_lsu_pa2_err                     ),
  .mmu_lsu_pa2_vld                      (mmu_lsu_pa2_vld                     ),
  .mmu_lsu_page_fault0                  (mmu_lsu_page_fault0                 ),
  .mmu_lsu_page_fault1                  (mmu_lsu_page_fault1                 ),
  .mmu_lsu_sec0                         (mmu_lsu_sec0                        ),
  .mmu_lsu_sec1                         (mmu_lsu_sec1                        ),
  .mmu_lsu_sec2                         (mmu_lsu_sec2                        ),
  .mmu_lsu_sh0                          (mmu_lsu_sh0                         ),
  .mmu_lsu_sh1                          (mmu_lsu_sh1                         ),
  .mmu_lsu_share2                       (mmu_lsu_share2                      ),
  .mmu_lsu_so0                          (mmu_lsu_so0                         ),
  .mmu_lsu_so1                          (mmu_lsu_so1                         ),
  .mmu_lsu_stall0                       (mmu_lsu_stall0                      ),
  .mmu_lsu_stall1                       (mmu_lsu_stall1                      ),
  .mmu_lsu_tlb_busy                     (mmu_lsu_tlb_busy                    ),
  .mmu_lsu_tlb_inv_done                 (mmu_lsu_tlb_inv_done                ),
  .mmu_lsu_tlb_wakeup                   (mmu_lsu_tlb_wakeup                  ),
  .mmu_xx_mmu_en                        (mmu_xx_mmu_en                       ),
  .mmu_yy_xx_no_op                      (mmu_yy_xx_no_op                     ),
  .pad_yy_icg_scan_en                   (pad_yy_icg_scan_en                  ),
  .pad_yy_scan_mode                     (pad_yy_scan_mode                    ),
  .pmp_cp0_data                         (pmp_cp0_data                        ),
  .rtu_cpu_no_retire                    (rtu_cpu_no_retire                   ),
  .rtu_had_bkpt_data_st                 (rtu_had_bkpt_data_st                ),
  .rtu_had_data_bkpta_vld               (rtu_had_data_bkpta_vld              ),
  .rtu_had_data_bkptb_vld               (rtu_had_data_bkptb_vld              ),
  .rtu_had_dbg_ack_info                 (rtu_had_dbg_ack_info                ),
  .rtu_had_dbgreq_ack                   (rtu_had_dbgreq_ack                  ),
  .rtu_had_debug_info                   (rtu_had_debug_info                  ),
  .rtu_had_inst0_bkpt_inst              (rtu_had_inst0_bkpt_inst             ),
  .rtu_had_inst0_non_irv_bkpt           (rtu_had_inst0_non_irv_bkpt          ),
  .rtu_had_inst1_non_irv_bkpt           (rtu_had_inst1_non_irv_bkpt          ),
  .rtu_had_inst2_non_irv_bkpt           (rtu_had_inst2_non_irv_bkpt          ),
  .rtu_had_inst_bkpt_inst_vld           (rtu_had_inst_bkpt_inst_vld          ),
  .rtu_had_inst_bkpta_vld               (rtu_had_inst_bkpta_vld              ),
  .rtu_had_inst_bkptb_vld               (rtu_had_inst_bkptb_vld              ),
  .rtu_had_inst_exe_dead                (rtu_had_inst_exe_dead               ),
  .rtu_had_inst_not_wb                  (rtu_had_inst_not_wb                 ),
  .rtu_had_inst_split                   (rtu_had_inst_split                  ),
  .rtu_had_retire_inst0_info            (rtu_had_retire_inst0_info           ),
  .rtu_had_retire_inst0_vld             (rtu_had_retire_inst0_vld            ),
  .rtu_had_retire_inst1_info            (rtu_had_retire_inst1_info           ),
  .rtu_had_retire_inst1_vld             (rtu_had_retire_inst1_vld            ),
  .rtu_had_retire_inst2_info            (rtu_had_retire_inst2_info           ),
  .rtu_had_retire_inst2_vld             (rtu_had_retire_inst2_vld            ),
  .rtu_had_rob_empty                    (rtu_had_rob_empty                   ),
  .rtu_had_xx_dbg_ack_pc                (rtu_had_xx_dbg_ack_pc               ),
  .rtu_had_xx_mbkpt_chgflow             (rtu_had_xx_mbkpt_chgflow            ),
  .rtu_had_xx_mbkpt_data_ack            (rtu_had_xx_mbkpt_data_ack           ),
  .rtu_had_xx_mbkpt_inst_ack            (rtu_had_xx_mbkpt_inst_ack           ),
  .rtu_had_xx_pc                        (rtu_had_xx_pc                       ),
  .rtu_had_xx_pcfifo_inst0_chgflow      (rtu_had_xx_pcfifo_inst0_chgflow     ),
  .rtu_had_xx_pcfifo_inst0_condbr       (rtu_had_xx_pcfifo_inst0_condbr      ),
  .rtu_had_xx_pcfifo_inst0_condbr_taken (rtu_had_xx_pcfifo_inst0_condbr_taken),
  .rtu_had_xx_pcfifo_inst0_iid          (rtu_had_xx_pcfifo_inst0_iid         ),
  .rtu_had_xx_pcfifo_inst0_jmp          (rtu_had_xx_pcfifo_inst0_jmp         ),
  .rtu_had_xx_pcfifo_inst0_next_pc      (rtu_had_xx_pcfifo_inst0_next_pc     ),
  .rtu_had_xx_pcfifo_inst0_pcall        (rtu_had_xx_pcfifo_inst0_pcall       ),
  .rtu_had_xx_pcfifo_inst0_preturn      (rtu_had_xx_pcfifo_inst0_preturn     ),
  .rtu_had_xx_pcfifo_inst1_chgflow      (rtu_had_xx_pcfifo_inst1_chgflow     ),
  .rtu_had_xx_pcfifo_inst1_condbr       (rtu_had_xx_pcfifo_inst1_condbr      ),
  .rtu_had_xx_pcfifo_inst1_condbr_taken (rtu_had_xx_pcfifo_inst1_condbr_taken),
  .rtu_had_xx_pcfifo_inst1_jmp          (rtu_had_xx_pcfifo_inst1_jmp         ),
  .rtu_had_xx_pcfifo_inst1_next_pc      (rtu_had_xx_pcfifo_inst1_next_pc     ),
  .rtu_had_xx_pcfifo_inst1_pcall        (rtu_had_xx_pcfifo_inst1_pcall       ),
  .rtu_had_xx_pcfifo_inst1_preturn      (rtu_had_xx_pcfifo_inst1_preturn     ),
  .rtu_had_xx_pcfifo_inst2_chgflow      (rtu_had_xx_pcfifo_inst2_chgflow     ),
  .rtu_had_xx_pcfifo_inst2_condbr       (rtu_had_xx_pcfifo_inst2_condbr      ),
  .rtu_had_xx_pcfifo_inst2_condbr_taken (rtu_had_xx_pcfifo_inst2_condbr_taken),
  .rtu_had_xx_pcfifo_inst2_jmp          (rtu_had_xx_pcfifo_inst2_jmp         ),
  .rtu_had_xx_pcfifo_inst2_next_pc      (rtu_had_xx_pcfifo_inst2_next_pc     ),
  .rtu_had_xx_pcfifo_inst2_pcall        (rtu_had_xx_pcfifo_inst2_pcall       ),
  .rtu_had_xx_pcfifo_inst2_preturn      (rtu_had_xx_pcfifo_inst2_preturn     ),
  .rtu_had_xx_split_inst                (rtu_had_xx_split_inst               ),
  .rtu_hpcp_inst0_ack_int               (rtu_hpcp_inst0_ack_int              ),
  .rtu_hpcp_inst0_bht_mispred           (rtu_hpcp_inst0_bht_mispred          ),
  .rtu_hpcp_inst0_condbr                (rtu_hpcp_inst0_condbr               ),
  .rtu_hpcp_inst0_cur_pc                (rtu_hpcp_inst0_cur_pc               ),
  .rtu_hpcp_inst0_jmp                   (rtu_hpcp_inst0_jmp                  ),
  .rtu_hpcp_inst0_jmp_mispred           (rtu_hpcp_inst0_jmp_mispred          ),
  .rtu_hpcp_inst0_jmp_pc_offset_8m      (rtu_hpcp_inst0_jmp_pc_offset_8m     ),
  .rtu_hpcp_inst0_num                   (rtu_hpcp_inst0_num                  ),
  .rtu_hpcp_inst0_pc_offset             (rtu_hpcp_inst0_pc_offset            ),
  .rtu_hpcp_inst0_spec_fail             (rtu_hpcp_inst0_spec_fail            ),
  .rtu_hpcp_inst0_split                 (rtu_hpcp_inst0_split                ),
  .rtu_hpcp_inst0_store                 (rtu_hpcp_inst0_store                ),
  .rtu_hpcp_inst0_vld                   (rtu_hpcp_inst0_vld                  ),
  .rtu_hpcp_inst1_condbr                (rtu_hpcp_inst1_condbr               ),
  .rtu_hpcp_inst1_cur_pc                (rtu_hpcp_inst1_cur_pc               ),
  .rtu_hpcp_inst1_jmp                   (rtu_hpcp_inst1_jmp                  ),
  .rtu_hpcp_inst1_jmp_pc_offset_8m      (rtu_hpcp_inst1_jmp_pc_offset_8m     ),
  .rtu_hpcp_inst1_num                   (rtu_hpcp_inst1_num                  ),
  .rtu_hpcp_inst1_pc_offset             (rtu_hpcp_inst1_pc_offset            ),
  .rtu_hpcp_inst1_split                 (rtu_hpcp_inst1_split                ),
  .rtu_hpcp_inst1_store                 (rtu_hpcp_inst1_store                ),
  .rtu_hpcp_inst1_vld                   (rtu_hpcp_inst1_vld                  ),
  .rtu_hpcp_inst2_condbr                (rtu_hpcp_inst2_condbr               ),
  .rtu_hpcp_inst2_cur_pc                (rtu_hpcp_inst2_cur_pc               ),
  .rtu_hpcp_inst2_jmp                   (rtu_hpcp_inst2_jmp                  ),
  .rtu_hpcp_inst2_jmp_pc_offset_8m      (rtu_hpcp_inst2_jmp_pc_offset_8m     ),
  .rtu_hpcp_inst2_num                   (rtu_hpcp_inst2_num                  ),
  .rtu_hpcp_inst2_pc_offset             (rtu_hpcp_inst2_pc_offset            ),
  .rtu_hpcp_inst2_split                 (rtu_hpcp_inst2_split                ),
  .rtu_hpcp_inst2_store                 (rtu_hpcp_inst2_store                ),
  .rtu_hpcp_inst2_vld                   (rtu_hpcp_inst2_vld                  ),
  .rtu_hpcp_trace_inst0_chgflow         (rtu_hpcp_trace_inst0_chgflow        ),
  .rtu_hpcp_trace_inst0_next_pc         (rtu_hpcp_trace_inst0_next_pc        ),
  .rtu_hpcp_trace_inst1_chgflow         (rtu_hpcp_trace_inst1_chgflow        ),
  .rtu_hpcp_trace_inst1_next_pc         (rtu_hpcp_trace_inst1_next_pc        ),
  .rtu_hpcp_trace_inst2_chgflow         (rtu_hpcp_trace_inst2_chgflow        ),
  .rtu_hpcp_trace_inst2_next_pc         (rtu_hpcp_trace_inst2_next_pc        ),
  .rtu_mmu_bad_vpn                      (rtu_mmu_bad_vpn                     ),
  .rtu_mmu_expt_vld                     (rtu_mmu_expt_vld                    ),
  .rtu_pad_retire0                      (rtu_pad_retire0                     ),
  .rtu_pad_retire0_pc                   (rtu_pad_retire0_pc                  ),
  .rtu_pad_retire1                      (rtu_pad_retire1                     ),
  .rtu_pad_retire1_pc                   (rtu_pad_retire1_pc                  ),
  .rtu_pad_retire2                      (rtu_pad_retire2                     ),
  .rtu_pad_retire2_pc                   (rtu_pad_retire2_pc                  ),
  .rtu_yy_xx_dbgon                      (rtu_yy_xx_dbgon                     ),
  .rtu_yy_xx_flush                      (rtu_yy_xx_flush                     ),
  .rtu_yy_xx_retire0                    (rtu_yy_xx_retire0                   ),
  .rtu_yy_xx_retire0_normal             (rtu_yy_xx_retire0_normal            ),
  .rtu_yy_xx_retire1                    (rtu_yy_xx_retire1                   ),
  .rtu_yy_xx_retire2                    (rtu_yy_xx_retire2                   )
);

// &Connect(.forever_cpuclk    (coreclk)); @41
// &Connect(.ifu_rst_b         (ifu_rst_b)); @42
// &Connect(.idu_rst_b         (idu_rst_b)); @43
// &Connect(.lsu_rst_b         (lsu_rst_b)); @44
// &Connect(.fpu_rst_b         (fpu_rst_b)); @45

//==========================================================
//  Instance ct_mmu_top sub module 
//==========================================================
// &Instance("ct_mmu_top"); @50
ct_mmu_top  x_ct_mmu_top (
  .biu_mmu_smp_disable      (biu_mmu_smp_disable     ),
  .cp0_mmu_cskyee           (cp0_mmu_cskyee          ),
  .cp0_mmu_icg_en           (cp0_mmu_icg_en          ),
  .cp0_mmu_maee             (cp0_mmu_maee            ),
  .cp0_mmu_mpp              (cp0_mmu_mpp             ),
  .cp0_mmu_mprv             (cp0_mmu_mprv            ),
  .cp0_mmu_mxr              (cp0_mmu_mxr             ),
  .cp0_mmu_no_op_req        (cp0_mmu_no_op_req       ),
  .cp0_mmu_ptw_en           (cp0_mmu_ptw_en          ),
  .cp0_mmu_reg_num          (cp0_mmu_reg_num         ),
  .cp0_mmu_satp_sel         (cp0_mmu_satp_sel        ),
  .cp0_mmu_sum              (cp0_mmu_sum             ),
  .cp0_mmu_tlb_all_inv      (cp0_mmu_tlb_all_inv     ),
  .cp0_mmu_wdata            (cp0_mmu_wdata           ),
  .cp0_mmu_wreg             (cp0_mmu_wreg            ),
  .cp0_yy_priv_mode         (cp0_yy_priv_mode        ),
  .cpurst_b                 (mmu_rst_b               ),
  .forever_cpuclk           (coreclk                 ),
  .hpcp_mmu_cnt_en          (hpcp_mmu_cnt_en         ),
  .ifu_mmu_abort            (ifu_mmu_abort           ),
  .ifu_mmu_va               (ifu_mmu_va              ),
  .ifu_mmu_va_vld           (ifu_mmu_va_vld          ),
  .lsu_mmu_abort0           (lsu_mmu_abort0          ),
  .lsu_mmu_abort1           (lsu_mmu_abort1          ),
  .lsu_mmu_bus_error        (lsu_mmu_bus_error       ),
  .lsu_mmu_data             (lsu_mmu_data            ),
  .lsu_mmu_data_vld         (lsu_mmu_data_vld        ),
  .lsu_mmu_id0              (lsu_mmu_id0             ),
  .lsu_mmu_id1              (lsu_mmu_id1             ),
  .lsu_mmu_st_inst0         (lsu_mmu_st_inst0        ),
  .lsu_mmu_st_inst1         (lsu_mmu_st_inst1        ),
  .lsu_mmu_stamo_pa         (lsu_mmu_stamo_pa        ),
  .lsu_mmu_stamo_vld        (lsu_mmu_stamo_vld       ),
  .lsu_mmu_tlb_all_inv      (lsu_mmu_tlb_all_inv     ),
  .lsu_mmu_tlb_asid         (lsu_mmu_tlb_asid        ),
  .lsu_mmu_tlb_asid_all_inv (lsu_mmu_tlb_asid_all_inv),
  .lsu_mmu_tlb_va           (lsu_mmu_tlb_va          ),
  .lsu_mmu_tlb_va_all_inv   (lsu_mmu_tlb_va_all_inv  ),
  .lsu_mmu_tlb_va_asid_inv  (lsu_mmu_tlb_va_asid_inv ),
  .lsu_mmu_va0              (lsu_mmu_va0             ),
  .lsu_mmu_va0_vld          (lsu_mmu_va0_vld         ),
  .lsu_mmu_va1              (lsu_mmu_va1             ),
  .lsu_mmu_va1_vld          (lsu_mmu_va1_vld         ),
  .lsu_mmu_va2              (lsu_mmu_va2             ),
  .lsu_mmu_va2_vld          (lsu_mmu_va2_vld         ),
  .lsu_mmu_vabuf0           (lsu_mmu_vabuf0          ),
  .lsu_mmu_vabuf1           (lsu_mmu_vabuf1          ),
  .mmu_cp0_cmplt            (mmu_cp0_cmplt           ),
  .mmu_cp0_data             (mmu_cp0_data            ),
  .mmu_cp0_satp_data        (mmu_cp0_satp_data       ),
  .mmu_cp0_tlb_done         (mmu_cp0_tlb_done        ),
  .mmu_had_debug_info       (mmu_had_debug_info      ),
  .mmu_hpcp_dutlb_miss      (mmu_hpcp_dutlb_miss     ),
  .mmu_hpcp_iutlb_miss      (mmu_hpcp_iutlb_miss     ),
  .mmu_hpcp_jtlb_miss       (mmu_hpcp_jtlb_miss      ),
  .mmu_ifu_buf              (mmu_ifu_buf             ),
  .mmu_ifu_ca               (mmu_ifu_ca              ),
  .mmu_ifu_deny             (mmu_ifu_deny            ),
  .mmu_ifu_pa               (mmu_ifu_pa              ),
  .mmu_ifu_pavld            (mmu_ifu_pavld           ),
  .mmu_ifu_pgflt            (mmu_ifu_pgflt           ),
  .mmu_ifu_sec              (mmu_ifu_sec             ),
  .mmu_lsu_access_fault0    (mmu_lsu_access_fault0   ),
  .mmu_lsu_access_fault1    (mmu_lsu_access_fault1   ),
  .mmu_lsu_buf0             (mmu_lsu_buf0            ),
  .mmu_lsu_buf1             (mmu_lsu_buf1            ),
  .mmu_lsu_ca0              (mmu_lsu_ca0             ),
  .mmu_lsu_ca1              (mmu_lsu_ca1             ),
  .mmu_lsu_data_req         (mmu_lsu_data_req        ),
  .mmu_lsu_data_req_addr    (mmu_lsu_data_req_addr   ),
  .mmu_lsu_data_req_size    (mmu_lsu_data_req_size   ),
  .mmu_lsu_mmu_en           (mmu_lsu_mmu_en          ),
  .mmu_lsu_pa0              (mmu_lsu_pa0             ),
  .mmu_lsu_pa0_vld          (mmu_lsu_pa0_vld         ),
  .mmu_lsu_pa1              (mmu_lsu_pa1             ),
  .mmu_lsu_pa1_vld          (mmu_lsu_pa1_vld         ),
  .mmu_lsu_pa2              (mmu_lsu_pa2             ),
  .mmu_lsu_pa2_err          (mmu_lsu_pa2_err         ),
  .mmu_lsu_pa2_vld          (mmu_lsu_pa2_vld         ),
  .mmu_lsu_page_fault0      (mmu_lsu_page_fault0     ),
  .mmu_lsu_page_fault1      (mmu_lsu_page_fault1     ),
  .mmu_lsu_sec0             (mmu_lsu_sec0            ),
  .mmu_lsu_sec1             (mmu_lsu_sec1            ),
  .mmu_lsu_sec2             (mmu_lsu_sec2            ),
  .mmu_lsu_sh0              (mmu_lsu_sh0             ),
  .mmu_lsu_sh1              (mmu_lsu_sh1             ),
  .mmu_lsu_share2           (mmu_lsu_share2          ),
  .mmu_lsu_so0              (mmu_lsu_so0             ),
  .mmu_lsu_so1              (mmu_lsu_so1             ),
  .mmu_lsu_stall0           (mmu_lsu_stall0          ),
  .mmu_lsu_stall1           (mmu_lsu_stall1          ),
  .mmu_lsu_tlb_busy         (mmu_lsu_tlb_busy        ),
  .mmu_lsu_tlb_inv_done     (mmu_lsu_tlb_inv_done    ),
  .mmu_lsu_tlb_wakeup       (mmu_lsu_tlb_wakeup      ),
  .mmu_pmp_fetch3           (mmu_pmp_fetch3          ),
  .mmu_pmp_pa0              (mmu_pmp_pa0             ),
  .mmu_pmp_pa1              (mmu_pmp_pa1             ),
  .mmu_pmp_pa2              (mmu_pmp_pa2             ),
  .mmu_pmp_pa3              (mmu_pmp_pa3             ),
  .mmu_pmp_pa4              (mmu_pmp_pa4             ),
  .mmu_xx_mmu_en            (mmu_xx_mmu_en           ),
  .mmu_yy_xx_no_op          (mmu_yy_xx_no_op         ),
  .pad_yy_icg_scan_en       (pad_yy_icg_scan_en      ),
  .pmp_mmu_flg0             (pmp_mmu_flg0            ),
  .pmp_mmu_flg1             (pmp_mmu_flg1            ),
  .pmp_mmu_flg2             (pmp_mmu_flg2            ),
  .pmp_mmu_flg3             (pmp_mmu_flg3            ),
  .pmp_mmu_flg4             (pmp_mmu_flg4            ),
  .rtu_mmu_bad_vpn          (rtu_mmu_bad_vpn         ),
  .rtu_mmu_expt_vld         (rtu_mmu_expt_vld        ),
  .rtu_yy_xx_flush          (rtu_yy_xx_flush         )
);

// &Connect(.forever_cpuclk    (coreclk)); @51
// &Connect(.cpurst_b          (mmu_rst_b)); @52

//==========================================================
//  Instance ct_pmp_top sub module 
//==========================================================
// &Instance("ct_pmp_top_dummy"); @58
// &Connect(.forever_cpuclk    (coreclk)); @59
// &Connect(.cpurst_b          (mmu_rst_b)); @60
// &Instance("ct_pmp_top"); @62
ct_pmp_top  x_ct_pmp_top (
  .cp0_pmp_icg_en     (cp0_pmp_icg_en    ),
  .cp0_pmp_mpp        (cp0_pmp_mpp       ),
  .cp0_pmp_mprv       (cp0_pmp_mprv      ),
  .cp0_pmp_reg_num    (cp0_pmp_reg_num   ),
  .cp0_pmp_wdata      (cp0_pmp_wdata     ),
  .cp0_pmp_wreg       (cp0_pmp_wreg      ),
  .cp0_yy_priv_mode   (cp0_yy_priv_mode  ),
  .cpurst_b           (mmu_rst_b         ),
  .forever_cpuclk     (coreclk           ),
  .mmu_pmp_fetch3     (mmu_pmp_fetch3    ),
  .mmu_pmp_pa0        (mmu_pmp_pa0       ),
  .mmu_pmp_pa1        (mmu_pmp_pa1       ),
  .mmu_pmp_pa2        (mmu_pmp_pa2       ),
  .mmu_pmp_pa3        (mmu_pmp_pa3       ),
  .mmu_pmp_pa4        (mmu_pmp_pa4       ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en),
  .pmp_cp0_data       (pmp_cp0_data      ),
  .pmp_mmu_flg0       (pmp_mmu_flg0      ),
  .pmp_mmu_flg1       (pmp_mmu_flg1      ),
  .pmp_mmu_flg2       (pmp_mmu_flg2      ),
  .pmp_mmu_flg3       (pmp_mmu_flg3      ),
  .pmp_mmu_flg4       (pmp_mmu_flg4      )
);

// &Connect(.forever_cpuclk    (coreclk)); @63
// &Connect(.cpurst_b          (mmu_rst_b)); @64

//==========================================================
//  Instance ct_biu_top sub module 
//==========================================================
// &Instance("ct_biu_top","x_ct_biu_top"); @70
ct_biu_top  x_ct_biu_top (
  .biu_cp0_apb_base         (biu_cp0_apb_base        ),
  .biu_cp0_cmplt            (biu_cp0_cmplt           ),
  .biu_cp0_coreid           (biu_cp0_coreid          ),
  .biu_cp0_me_int           (biu_cp0_me_int          ),
  .biu_cp0_ms_int           (biu_cp0_ms_int          ),
  .biu_cp0_mt_int           (biu_cp0_mt_int          ),
  .biu_cp0_rdata            (biu_cp0_rdata           ),
  .biu_cp0_rvba             (biu_cp0_rvba            ),
  .biu_cp0_se_int           (biu_cp0_se_int          ),
  .biu_cp0_ss_int           (biu_cp0_ss_int          ),
  .biu_cp0_st_int           (biu_cp0_st_int          ),
  .biu_had_coreid           (biu_had_coreid          ),
  .biu_had_sdb_req_b        (biu_had_sdb_req_b       ),
  .biu_hpcp_cmplt           (biu_hpcp_cmplt          ),
  .biu_hpcp_l2of_int        (biu_hpcp_l2of_int       ),
  .biu_hpcp_rdata           (biu_hpcp_rdata          ),
  .biu_hpcp_time            (biu_hpcp_time           ),
  .biu_ifu_rd_data          (biu_ifu_rd_data         ),
  .biu_ifu_rd_data_vld      (biu_ifu_rd_data_vld     ),
  .biu_ifu_rd_grnt          (biu_ifu_rd_grnt         ),
  .biu_ifu_rd_id            (biu_ifu_rd_id           ),
  .biu_ifu_rd_last          (biu_ifu_rd_last         ),
  .biu_ifu_rd_resp          (biu_ifu_rd_resp         ),
  .biu_lsu_ac_addr          (biu_lsu_ac_addr         ),
  .biu_lsu_ac_prot          (biu_lsu_ac_prot         ),
  .biu_lsu_ac_req           (biu_lsu_ac_req          ),
  .biu_lsu_ac_snoop         (biu_lsu_ac_snoop        ),
  .biu_lsu_ar_ready         (biu_lsu_ar_ready        ),
  .biu_lsu_aw_vb_grnt       (biu_lsu_aw_vb_grnt      ),
  .biu_lsu_aw_wmb_grnt      (biu_lsu_aw_wmb_grnt     ),
  .biu_lsu_b_id             (biu_lsu_b_id            ),
  .biu_lsu_b_resp           (biu_lsu_b_resp          ),
  .biu_lsu_b_vld            (biu_lsu_b_vld           ),
  .biu_lsu_cd_ready         (biu_lsu_cd_ready        ),
  .biu_lsu_cr_ready         (biu_lsu_cr_ready        ),
  .biu_lsu_r_data           (biu_lsu_r_data          ),
  .biu_lsu_r_id             (biu_lsu_r_id            ),
  .biu_lsu_r_last           (biu_lsu_r_last          ),
  .biu_lsu_r_resp           (biu_lsu_r_resp          ),
  .biu_lsu_r_vld            (biu_lsu_r_vld           ),
  .biu_lsu_w_vb_grnt        (biu_lsu_w_vb_grnt       ),
  .biu_lsu_w_wmb_grnt       (biu_lsu_w_wmb_grnt      ),
  .biu_mmu_smp_disable      (biu_mmu_smp_disable     ),
  .biu_pad_acready          (biu_pad_acready         ),
  .biu_pad_araddr           (biu_pad_araddr          ),
  .biu_pad_arbar            (biu_pad_arbar           ),
  .biu_pad_arburst          (biu_pad_arburst         ),
  .biu_pad_arcache          (biu_pad_arcache         ),
  .biu_pad_ardomain         (biu_pad_ardomain        ),
  .biu_pad_arid             (biu_pad_arid            ),
  .biu_pad_arlen            (biu_pad_arlen           ),
  .biu_pad_arlock           (biu_pad_arlock          ),
  .biu_pad_arprot           (biu_pad_arprot          ),
  .biu_pad_arsize           (biu_pad_arsize          ),
  .biu_pad_arsnoop          (biu_pad_arsnoop         ),
  .biu_pad_aruser           (biu_pad_aruser          ),
  .biu_pad_arvalid          (biu_pad_arvalid         ),
  .biu_pad_awaddr           (biu_pad_awaddr          ),
  .biu_pad_awbar            (biu_pad_awbar           ),
  .biu_pad_awburst          (biu_pad_awburst         ),
  .biu_pad_awcache          (biu_pad_awcache         ),
  .biu_pad_awdomain         (biu_pad_awdomain        ),
  .biu_pad_awid             (biu_pad_awid            ),
  .biu_pad_awlen            (biu_pad_awlen           ),
  .biu_pad_awlock           (biu_pad_awlock          ),
  .biu_pad_awprot           (biu_pad_awprot          ),
  .biu_pad_awsize           (biu_pad_awsize          ),
  .biu_pad_awsnoop          (biu_pad_awsnoop         ),
  .biu_pad_awunique         (biu_pad_awunique        ),
  .biu_pad_awuser           (biu_pad_awuser          ),
  .biu_pad_awvalid          (biu_pad_awvalid         ),
  .biu_pad_back             (biu_pad_back            ),
  .biu_pad_bready           (biu_pad_bready          ),
  .biu_pad_cddata           (biu_pad_cddata          ),
  .biu_pad_cderr            (biu_pad_cderr           ),
  .biu_pad_cdlast           (biu_pad_cdlast          ),
  .biu_pad_cdvalid          (biu_pad_cdvalid         ),
  .biu_pad_cnt_en           (biu_pad_cnt_en          ),
  .biu_pad_crresp           (biu_pad_crresp          ),
  .biu_pad_crvalid          (biu_pad_crvalid         ),
  .biu_pad_csr_sel          (biu_pad_csr_sel         ),
  .biu_pad_csr_wdata        (biu_pad_csr_wdata       ),
  .biu_pad_jdb_pm           (biu_pad_jdb_pm          ),
  .biu_pad_lpmd_b           (biu_pad_lpmd_b          ),
  .biu_pad_rack             (biu_pad_rack            ),
  .biu_pad_rready           (biu_pad_rready          ),
  .biu_pad_wdata            (biu_pad_wdata           ),
  .biu_pad_werr             (biu_pad_werr            ),
  .biu_pad_wlast            (biu_pad_wlast           ),
  .biu_pad_wns              (biu_pad_wns             ),
  .biu_pad_wstrb            (biu_pad_wstrb           ),
  .biu_pad_wvalid           (biu_pad_wvalid          ),
  .biu_xx_dbg_wakeup        (biu_xx_dbg_wakeup       ),
  .biu_xx_int_wakeup        (biu_xx_int_wakeup       ),
  .biu_xx_normal_work       (biu_xx_normal_work      ),
  .biu_xx_pmp_sel           (biu_xx_pmp_sel          ),
  .biu_xx_snoop_vld         (biu_xx_snoop_vld        ),
  .biu_yy_xx_no_op          (biu_yy_xx_no_op         ),
  .coreclk                  (coreclk                 ),
  .cp0_biu_icg_en           (cp0_biu_icg_en          ),
  .cp0_biu_lpmd_b           (cp0_biu_lpmd_b          ),
  .cp0_biu_op               (cp0_biu_op              ),
  .cp0_biu_sel              (cp0_biu_sel             ),
  .cp0_biu_wdata            (cp0_biu_wdata           ),
  .cpurst_b                 (mmu_rst_b               ),
  .forever_coreclk          (forever_coreclk         ),
  .had_biu_jdb_pm           (had_biu_jdb_pm          ),
  .hpcp_biu_cnt_en          (hpcp_biu_cnt_en         ),
  .hpcp_biu_op              (hpcp_biu_op             ),
  .hpcp_biu_sel             (hpcp_biu_sel            ),
  .hpcp_biu_wdata           (hpcp_biu_wdata          ),
  .ifu_biu_r_ready          (ifu_biu_r_ready         ),
  .ifu_biu_rd_addr          (ifu_biu_rd_addr         ),
  .ifu_biu_rd_burst         (ifu_biu_rd_burst        ),
  .ifu_biu_rd_cache         (ifu_biu_rd_cache        ),
  .ifu_biu_rd_domain        (ifu_biu_rd_domain       ),
  .ifu_biu_rd_id            (ifu_biu_rd_id           ),
  .ifu_biu_rd_len           (ifu_biu_rd_len          ),
  .ifu_biu_rd_prot          (ifu_biu_rd_prot         ),
  .ifu_biu_rd_req           (ifu_biu_rd_req          ),
  .ifu_biu_rd_req_gate      (ifu_biu_rd_req_gate     ),
  .ifu_biu_rd_size          (ifu_biu_rd_size         ),
  .ifu_biu_rd_snoop         (ifu_biu_rd_snoop        ),
  .ifu_biu_rd_user          (ifu_biu_rd_user         ),
  .lsu_biu_ac_empty         (lsu_biu_ac_empty        ),
  .lsu_biu_ac_ready         (lsu_biu_ac_ready        ),
  .lsu_biu_ar_addr          (lsu_biu_ar_addr         ),
  .lsu_biu_ar_bar           (lsu_biu_ar_bar          ),
  .lsu_biu_ar_burst         (lsu_biu_ar_burst        ),
  .lsu_biu_ar_cache         (lsu_biu_ar_cache        ),
  .lsu_biu_ar_domain        (lsu_biu_ar_domain       ),
  .lsu_biu_ar_dp_req        (lsu_biu_ar_dp_req       ),
  .lsu_biu_ar_id            (lsu_biu_ar_id           ),
  .lsu_biu_ar_len           (lsu_biu_ar_len          ),
  .lsu_biu_ar_lock          (lsu_biu_ar_lock         ),
  .lsu_biu_ar_prot          (lsu_biu_ar_prot         ),
  .lsu_biu_ar_req           (lsu_biu_ar_req          ),
  .lsu_biu_ar_req_gate      (lsu_biu_ar_req_gate     ),
  .lsu_biu_ar_size          (lsu_biu_ar_size         ),
  .lsu_biu_ar_snoop         (lsu_biu_ar_snoop        ),
  .lsu_biu_ar_user          (lsu_biu_ar_user         ),
  .lsu_biu_aw_req_gate      (lsu_biu_aw_req_gate     ),
  .lsu_biu_aw_st_addr       (lsu_biu_aw_st_addr      ),
  .lsu_biu_aw_st_bar        (lsu_biu_aw_st_bar       ),
  .lsu_biu_aw_st_burst      (lsu_biu_aw_st_burst     ),
  .lsu_biu_aw_st_cache      (lsu_biu_aw_st_cache     ),
  .lsu_biu_aw_st_domain     (lsu_biu_aw_st_domain    ),
  .lsu_biu_aw_st_dp_req     (lsu_biu_aw_st_dp_req    ),
  .lsu_biu_aw_st_id         (lsu_biu_aw_st_id        ),
  .lsu_biu_aw_st_len        (lsu_biu_aw_st_len       ),
  .lsu_biu_aw_st_lock       (lsu_biu_aw_st_lock      ),
  .lsu_biu_aw_st_prot       (lsu_biu_aw_st_prot      ),
  .lsu_biu_aw_st_req        (lsu_biu_aw_st_req       ),
  .lsu_biu_aw_st_size       (lsu_biu_aw_st_size      ),
  .lsu_biu_aw_st_snoop      (lsu_biu_aw_st_snoop     ),
  .lsu_biu_aw_st_unique     (lsu_biu_aw_st_unique    ),
  .lsu_biu_aw_st_user       (lsu_biu_aw_st_user      ),
  .lsu_biu_aw_vict_addr     (lsu_biu_aw_vict_addr    ),
  .lsu_biu_aw_vict_bar      (lsu_biu_aw_vict_bar     ),
  .lsu_biu_aw_vict_burst    (lsu_biu_aw_vict_burst   ),
  .lsu_biu_aw_vict_cache    (lsu_biu_aw_vict_cache   ),
  .lsu_biu_aw_vict_domain   (lsu_biu_aw_vict_domain  ),
  .lsu_biu_aw_vict_dp_req   (lsu_biu_aw_vict_dp_req  ),
  .lsu_biu_aw_vict_id       (lsu_biu_aw_vict_id      ),
  .lsu_biu_aw_vict_len      (lsu_biu_aw_vict_len     ),
  .lsu_biu_aw_vict_lock     (lsu_biu_aw_vict_lock    ),
  .lsu_biu_aw_vict_prot     (lsu_biu_aw_vict_prot    ),
  .lsu_biu_aw_vict_req      (lsu_biu_aw_vict_req     ),
  .lsu_biu_aw_vict_size     (lsu_biu_aw_vict_size    ),
  .lsu_biu_aw_vict_snoop    (lsu_biu_aw_vict_snoop   ),
  .lsu_biu_aw_vict_unique   (lsu_biu_aw_vict_unique  ),
  .lsu_biu_aw_vict_user     (lsu_biu_aw_vict_user    ),
  .lsu_biu_cd_data          (lsu_biu_cd_data         ),
  .lsu_biu_cd_last          (lsu_biu_cd_last         ),
  .lsu_biu_cd_valid         (lsu_biu_cd_valid        ),
  .lsu_biu_cr_resp          (lsu_biu_cr_resp         ),
  .lsu_biu_cr_valid         (lsu_biu_cr_valid        ),
  .lsu_biu_r_linefill_ready (lsu_biu_r_linefill_ready),
  .lsu_biu_w_st_data        (lsu_biu_w_st_data       ),
  .lsu_biu_w_st_last        (lsu_biu_w_st_last       ),
  .lsu_biu_w_st_strb        (lsu_biu_w_st_strb       ),
  .lsu_biu_w_st_vld         (lsu_biu_w_st_vld        ),
  .lsu_biu_w_st_wns         (lsu_biu_w_st_wns        ),
  .lsu_biu_w_vict_data      (lsu_biu_w_vict_data     ),
  .lsu_biu_w_vict_last      (lsu_biu_w_vict_last     ),
  .lsu_biu_w_vict_strb      (lsu_biu_w_vict_strb     ),
  .lsu_biu_w_vict_vld       (lsu_biu_w_vict_vld      ),
  .lsu_biu_w_vict_wns       (lsu_biu_w_vict_wns      ),
  .pad_biu_acaddr           (pad_biu_acaddr          ),
  .pad_biu_acprot           (pad_biu_acprot          ),
  .pad_biu_acsnoop          (pad_biu_acsnoop         ),
  .pad_biu_acvalid          (pad_biu_acvalid         ),
  .pad_biu_arready          (pad_biu_arready         ),
  .pad_biu_awready          (pad_biu_awready         ),
  .pad_biu_bid              (pad_biu_bid             ),
  .pad_biu_bresp            (pad_biu_bresp           ),
  .pad_biu_bvalid           (pad_biu_bvalid          ),
  .pad_biu_cdready          (pad_biu_cdready         ),
  .pad_biu_crready          (pad_biu_crready         ),
  .pad_biu_csr_cmplt        (pad_biu_csr_cmplt       ),
  .pad_biu_csr_rdata        (pad_biu_csr_rdata       ),
  .pad_biu_dbgrq_b          (pad_biu_dbgrq_b         ),
  .pad_biu_hpcp_l2of_int    (pad_biu_hpcp_l2of_int   ),
  .pad_biu_me_int           (pad_biu_me_int          ),
  .pad_biu_ms_int           (pad_biu_ms_int          ),
  .pad_biu_mt_int           (pad_biu_mt_int          ),
  .pad_biu_rdata            (pad_biu_rdata           ),
  .pad_biu_rid              (pad_biu_rid             ),
  .pad_biu_rlast            (pad_biu_rlast           ),
  .pad_biu_rresp            (pad_biu_rresp           ),
  .pad_biu_rvalid           (pad_biu_rvalid          ),
  .pad_biu_se_int           (pad_biu_se_int          ),
  .pad_biu_ss_int           (pad_biu_ss_int          ),
  .pad_biu_st_int           (pad_biu_st_int          ),
  .pad_biu_wns_awready      (pad_biu_wns_awready     ),
  .pad_biu_wns_wready       (pad_biu_wns_wready      ),
  .pad_biu_wready           (pad_biu_wready          ),
  .pad_biu_ws_awready       (pad_biu_ws_awready      ),
  .pad_biu_ws_wready        (pad_biu_ws_wready       ),
  .pad_core_hartid          (pad_core_hartid         ),
  .pad_core_rvba            (pad_core_rvba           ),
  .pad_xx_apb_base          (pad_xx_apb_base         ),
  .pad_xx_time              (pad_xx_time             ),
  .pad_yy_icg_scan_en       (pad_yy_icg_scan_en      )
);

// &Connect(.cpurst_b          (mmu_rst_b)); @71

//==========================================================
//  Instance ct_had_private top sub module 
//==========================================================
// &Instance("ct_had_private_top"); @76
ct_had_private_top  x_ct_had_private_top (
  .biu_had_coreid                       (biu_had_coreid                      ),
  .biu_had_sdb_req_b                    (biu_had_sdb_req_b                   ),
  .cp0_had_cpuid_0                      (cp0_had_cpuid_0                     ),
  .cp0_had_debug_info                   (cp0_had_debug_info                  ),
  .cp0_had_lpmd_b                       (cp0_had_lpmd_b                      ),
  .cp0_had_trace_pm_wdata               (cp0_had_trace_pm_wdata              ),
  .cp0_had_trace_pm_wen                 (cp0_had_trace_pm_wen                ),
  .cp0_yy_priv_mode                     (cp0_yy_priv_mode                    ),
  .cpuclk                               (forever_coreclk                     ),
  .cpurst_b                             (had_rst_b                           ),
  .forever_coreclk                      (forever_coreclk                     ),
  .had_biu_jdb_pm                       (had_biu_jdb_pm                      ),
  .had_cp0_xx_dbg                       (had_cp0_xx_dbg                      ),
  .had_idu_debug_id_inst_en             (had_idu_debug_id_inst_en            ),
  .had_idu_wbbr_data                    (had_idu_wbbr_data                   ),
  .had_idu_wbbr_vld                     (had_idu_wbbr_vld                    ),
  .had_ifu_ir                           (had_ifu_ir                          ),
  .had_ifu_ir_vld                       (had_ifu_ir_vld                      ),
  .had_ifu_pc                           (had_ifu_pc                          ),
  .had_ifu_pcload                       (had_ifu_pcload                      ),
  .had_lsu_bus_trace_en                 (had_lsu_bus_trace_en                ),
  .had_lsu_dbg_en                       (had_lsu_dbg_en                      ),
  .had_rtu_data_bkpt_dbgreq             (had_rtu_data_bkpt_dbgreq            ),
  .had_rtu_dbg_disable                  (had_rtu_dbg_disable                 ),
  .had_rtu_dbg_req_en                   (had_rtu_dbg_req_en                  ),
  .had_rtu_debug_retire_info_en         (had_rtu_debug_retire_info_en        ),
  .had_rtu_event_dbgreq                 (had_rtu_event_dbgreq                ),
  .had_rtu_fdb                          (had_rtu_fdb                         ),
  .had_rtu_hw_dbgreq                    (had_rtu_hw_dbgreq                   ),
  .had_rtu_hw_dbgreq_gateclk            (had_rtu_hw_dbgreq_gateclk           ),
  .had_rtu_inst_bkpt_dbgreq             (had_rtu_inst_bkpt_dbgreq            ),
  .had_rtu_non_irv_bkpt_dbgreq          (had_rtu_non_irv_bkpt_dbgreq         ),
  .had_rtu_pop1_disa                    (had_rtu_pop1_disa                   ),
  .had_rtu_trace_dbgreq                 (had_rtu_trace_dbgreq                ),
  .had_rtu_trace_en                     (had_rtu_trace_en                    ),
  .had_rtu_xx_jdbreq                    (had_rtu_xx_jdbreq                   ),
  .had_rtu_xx_tme                       (had_rtu_xx_tme                      ),
  .had_xx_clk_en                        (had_xx_clk_en                       ),
  .had_yy_xx_bkpta_base                 (had_yy_xx_bkpta_base                ),
  .had_yy_xx_bkpta_mask                 (had_yy_xx_bkpta_mask                ),
  .had_yy_xx_bkpta_rc                   (had_yy_xx_bkpta_rc                  ),
  .had_yy_xx_bkptb_base                 (had_yy_xx_bkptb_base                ),
  .had_yy_xx_bkptb_mask                 (had_yy_xx_bkptb_mask                ),
  .had_yy_xx_bkptb_rc                   (had_yy_xx_bkptb_rc                  ),
  .had_yy_xx_exit_dbg                   (had_yy_xx_exit_dbg                  ),
  .idu_had_debug_info                   (idu_had_debug_info                  ),
  .idu_had_id_inst0_info                (idu_had_id_inst0_info               ),
  .idu_had_id_inst0_vld                 (idu_had_id_inst0_vld                ),
  .idu_had_id_inst1_info                (idu_had_id_inst1_info               ),
  .idu_had_id_inst1_vld                 (idu_had_id_inst1_vld                ),
  .idu_had_id_inst2_info                (idu_had_id_inst2_info               ),
  .idu_had_id_inst2_vld                 (idu_had_id_inst2_vld                ),
  .idu_had_iq_empty                     (idu_had_iq_empty                    ),
  .idu_had_pipe_stall                   (idu_had_pipe_stall                  ),
  .idu_had_pipeline_empty               (idu_had_pipeline_empty              ),
  .idu_had_wb_data                      (idu_had_wb_data                     ),
  .idu_had_wb_vld                       (idu_had_wb_vld                      ),
  .ifu_had_debug_info                   (ifu_had_debug_info                  ),
  .ifu_had_no_inst                      (ifu_had_no_inst                     ),
  .ifu_had_no_op                        (ifu_had_no_op                       ),
  .ifu_had_reset_on                     (ifu_had_reset_on                    ),
  .ir_corex_wdata                       (ir_corex_wdata                      ),
  .iu_had_debug_info                    (iu_had_debug_info                   ),
  .lsu_had_debug_info                   (lsu_had_debug_info                  ),
  .lsu_had_ld_addr                      (lsu_had_ld_addr                     ),
  .lsu_had_ld_data                      (lsu_had_ld_data                     ),
  .lsu_had_ld_iid                       (lsu_had_ld_iid                      ),
  .lsu_had_ld_req                       (lsu_had_ld_req                      ),
  .lsu_had_ld_type                      (lsu_had_ld_type                     ),
  .lsu_had_no_op                        (lsu_had_no_op                       ),
  .lsu_had_st_addr                      (lsu_had_st_addr                     ),
  .lsu_had_st_data                      (lsu_had_st_data                     ),
  .lsu_had_st_iid                       (lsu_had_st_iid                      ),
  .lsu_had_st_req                       (lsu_had_st_req                      ),
  .lsu_had_st_type                      (lsu_had_st_type                     ),
  .mmu_had_debug_info                   (mmu_had_debug_info                  ),
  .mmu_xx_mmu_en                        (mmu_xx_mmu_en                       ),
  .rtu_had_bkpt_data_st                 (rtu_had_bkpt_data_st                ),
  .rtu_had_data_bkpta_vld               (rtu_had_data_bkpta_vld              ),
  .rtu_had_data_bkptb_vld               (rtu_had_data_bkptb_vld              ),
  .rtu_had_dbg_ack_info                 (rtu_had_dbg_ack_info                ),
  .rtu_had_dbgreq_ack                   (rtu_had_dbgreq_ack                  ),
  .rtu_had_debug_info                   (rtu_had_debug_info                  ),
  .rtu_had_inst0_bkpt_inst              (rtu_had_inst0_bkpt_inst             ),
  .rtu_had_inst0_non_irv_bkpt           (rtu_had_inst0_non_irv_bkpt          ),
  .rtu_had_inst1_non_irv_bkpt           (rtu_had_inst1_non_irv_bkpt          ),
  .rtu_had_inst2_non_irv_bkpt           (rtu_had_inst2_non_irv_bkpt          ),
  .rtu_had_inst_bkpt_inst_vld           (rtu_had_inst_bkpt_inst_vld          ),
  .rtu_had_inst_bkpta_vld               (rtu_had_inst_bkpta_vld              ),
  .rtu_had_inst_bkptb_vld               (rtu_had_inst_bkptb_vld              ),
  .rtu_had_inst_exe_dead                (rtu_had_inst_exe_dead               ),
  .rtu_had_inst_not_wb                  (rtu_had_inst_not_wb                 ),
  .rtu_had_inst_split                   (rtu_had_inst_split                  ),
  .rtu_had_retire_inst0_info            (rtu_had_retire_inst0_info           ),
  .rtu_had_retire_inst0_vld             (rtu_had_retire_inst0_vld            ),
  .rtu_had_retire_inst1_info            (rtu_had_retire_inst1_info           ),
  .rtu_had_retire_inst1_vld             (rtu_had_retire_inst1_vld            ),
  .rtu_had_retire_inst2_info            (rtu_had_retire_inst2_info           ),
  .rtu_had_retire_inst2_vld             (rtu_had_retire_inst2_vld            ),
  .rtu_had_rob_empty                    (rtu_had_rob_empty                   ),
  .rtu_had_xx_dbg_ack_pc                (rtu_had_xx_dbg_ack_pc               ),
  .rtu_had_xx_mbkpt_chgflow             (rtu_had_xx_mbkpt_chgflow            ),
  .rtu_had_xx_mbkpt_data_ack            (rtu_had_xx_mbkpt_data_ack           ),
  .rtu_had_xx_mbkpt_inst_ack            (rtu_had_xx_mbkpt_inst_ack           ),
  .rtu_had_xx_pc                        (rtu_had_xx_pc                       ),
  .rtu_had_xx_pcfifo_inst0_chgflow      (rtu_had_xx_pcfifo_inst0_chgflow     ),
  .rtu_had_xx_pcfifo_inst0_condbr       (rtu_had_xx_pcfifo_inst0_condbr      ),
  .rtu_had_xx_pcfifo_inst0_condbr_taken (rtu_had_xx_pcfifo_inst0_condbr_taken),
  .rtu_had_xx_pcfifo_inst0_iid          (rtu_had_xx_pcfifo_inst0_iid         ),
  .rtu_had_xx_pcfifo_inst0_jmp          (rtu_had_xx_pcfifo_inst0_jmp         ),
  .rtu_had_xx_pcfifo_inst0_next_pc      (rtu_had_xx_pcfifo_inst0_next_pc     ),
  .rtu_had_xx_pcfifo_inst0_pcall        (rtu_had_xx_pcfifo_inst0_pcall       ),
  .rtu_had_xx_pcfifo_inst0_preturn      (rtu_had_xx_pcfifo_inst0_preturn     ),
  .rtu_had_xx_pcfifo_inst1_chgflow      (rtu_had_xx_pcfifo_inst1_chgflow     ),
  .rtu_had_xx_pcfifo_inst1_condbr       (rtu_had_xx_pcfifo_inst1_condbr      ),
  .rtu_had_xx_pcfifo_inst1_condbr_taken (rtu_had_xx_pcfifo_inst1_condbr_taken),
  .rtu_had_xx_pcfifo_inst1_jmp          (rtu_had_xx_pcfifo_inst1_jmp         ),
  .rtu_had_xx_pcfifo_inst1_next_pc      (rtu_had_xx_pcfifo_inst1_next_pc     ),
  .rtu_had_xx_pcfifo_inst1_pcall        (rtu_had_xx_pcfifo_inst1_pcall       ),
  .rtu_had_xx_pcfifo_inst1_preturn      (rtu_had_xx_pcfifo_inst1_preturn     ),
  .rtu_had_xx_pcfifo_inst2_chgflow      (rtu_had_xx_pcfifo_inst2_chgflow     ),
  .rtu_had_xx_pcfifo_inst2_condbr       (rtu_had_xx_pcfifo_inst2_condbr      ),
  .rtu_had_xx_pcfifo_inst2_condbr_taken (rtu_had_xx_pcfifo_inst2_condbr_taken),
  .rtu_had_xx_pcfifo_inst2_jmp          (rtu_had_xx_pcfifo_inst2_jmp         ),
  .rtu_had_xx_pcfifo_inst2_next_pc      (rtu_had_xx_pcfifo_inst2_next_pc     ),
  .rtu_had_xx_pcfifo_inst2_pcall        (rtu_had_xx_pcfifo_inst2_pcall       ),
  .rtu_had_xx_pcfifo_inst2_preturn      (rtu_had_xx_pcfifo_inst2_preturn     ),
  .rtu_had_xx_split_inst                (rtu_had_xx_split_inst               ),
  .rtu_yy_xx_dbgon                      (rtu_yy_xx_dbgon                     ),
  .rtu_yy_xx_flush                      (rtu_yy_xx_flush                     ),
  .rtu_yy_xx_retire0                    (rtu_yy_xx_retire0                   ),
  .rtu_yy_xx_retire0_normal             (rtu_yy_xx_retire0_normal            ),
  .rtu_yy_xx_retire1                    (rtu_yy_xx_retire1                   ),
  .rtu_yy_xx_retire2                    (rtu_yy_xx_retire2                   ),
  .sm_update_dr                         (sm_update_dr                        ),
  .sm_update_ir                         (sm_update_ir                        ),
  .x_dbg_ack_pc                         (x_dbg_ack_pc                        ),
  .x_enter_dbg_req_i                    (x_enter_dbg_req_i                   ),
  .x_enter_dbg_req_o                    (x_enter_dbg_req_o                   ),
  .x_exit_dbg_req_i                     (x_exit_dbg_req_i                    ),
  .x_exit_dbg_req_o                     (x_exit_dbg_req_o                    ),
  .x_had_dbg_mask                       (x_had_dbg_mask                      ),
  .x_regs_serial_data                   (x_regs_serial_data                  )
);

// &Connect(.cpurst_b    (had_rst_b), @77
//          .cpuclk      (forever_coreclk)); @78

//==========================================================
//   Instance ct_hpcp_top
//==========================================================
// &Instance("ct_hpcp_top"); @84
ct_hpcp_top  x_ct_hpcp_top (
  .biu_hpcp_cmplt                     (biu_hpcp_cmplt                    ),
  .biu_hpcp_l2of_int                  (biu_hpcp_l2of_int                 ),
  .biu_hpcp_rdata                     (biu_hpcp_rdata                    ),
  .biu_hpcp_time                      (biu_hpcp_time                     ),
  .cp0_hpcp_icg_en                    (cp0_hpcp_icg_en                   ),
  .cp0_hpcp_index                     (cp0_hpcp_index                    ),
  .cp0_hpcp_int_disable               (cp0_hpcp_int_disable              ),
  .cp0_hpcp_mcntwen                   (cp0_hpcp_mcntwen                  ),
  .cp0_hpcp_op                        (cp0_hpcp_op                       ),
  .cp0_hpcp_pmdm                      (cp0_hpcp_pmdm                     ),
  .cp0_hpcp_pmds                      (cp0_hpcp_pmds                     ),
  .cp0_hpcp_pmdu                      (cp0_hpcp_pmdu                     ),
  .cp0_hpcp_sel                       (cp0_hpcp_sel                      ),
  .cp0_hpcp_src0                      (cp0_hpcp_src0                     ),
  .cp0_hpcp_wdata                     (cp0_hpcp_wdata                    ),
  .cp0_yy_priv_mode                   (cp0_yy_priv_mode                  ),
  .cpurst_b                           (mmu_rst_b                         ),
  .forever_cpuclk                     (coreclk                           ),
  .hpcp_biu_cnt_en                    (hpcp_biu_cnt_en                   ),
  .hpcp_biu_op                        (hpcp_biu_op                       ),
  .hpcp_biu_sel                       (hpcp_biu_sel                      ),
  .hpcp_biu_wdata                     (hpcp_biu_wdata                    ),
  .hpcp_cp0_cmplt                     (hpcp_cp0_cmplt                    ),
  .hpcp_cp0_data                      (hpcp_cp0_data                     ),
  .hpcp_cp0_int_vld                   (hpcp_cp0_int_vld                  ),
  .hpcp_cp0_sce                       (hpcp_cp0_sce                      ),
  .hpcp_idu_cnt_en                    (hpcp_idu_cnt_en                   ),
  .hpcp_ifu_cnt_en                    (hpcp_ifu_cnt_en                   ),
  .hpcp_lsu_cnt_en                    (hpcp_lsu_cnt_en                   ),
  .hpcp_mmu_cnt_en                    (hpcp_mmu_cnt_en                   ),
  .hpcp_rtu_cnt_en                    (hpcp_rtu_cnt_en                   ),
  .idu_hpcp_backend_stall             (idu_hpcp_backend_stall            ),
  .idu_hpcp_fence_sync_vld            (idu_hpcp_fence_sync_vld           ),
  .idu_hpcp_ir_inst0_type             (idu_hpcp_ir_inst0_type            ),
  .idu_hpcp_ir_inst0_vld              (idu_hpcp_ir_inst0_vld             ),
  .idu_hpcp_ir_inst1_type             (idu_hpcp_ir_inst1_type            ),
  .idu_hpcp_ir_inst1_vld              (idu_hpcp_ir_inst1_vld             ),
  .idu_hpcp_ir_inst2_type             (idu_hpcp_ir_inst2_type            ),
  .idu_hpcp_ir_inst2_vld              (idu_hpcp_ir_inst2_vld             ),
  .idu_hpcp_ir_inst3_type             (idu_hpcp_ir_inst3_type            ),
  .idu_hpcp_ir_inst3_vld              (idu_hpcp_ir_inst3_vld             ),
  .idu_hpcp_rf_inst_vld               (idu_hpcp_rf_inst_vld              ),
  .idu_hpcp_rf_pipe0_inst_vld         (idu_hpcp_rf_pipe0_inst_vld        ),
  .idu_hpcp_rf_pipe0_lch_fail_vld     (idu_hpcp_rf_pipe0_lch_fail_vld    ),
  .idu_hpcp_rf_pipe1_inst_vld         (idu_hpcp_rf_pipe1_inst_vld        ),
  .idu_hpcp_rf_pipe1_lch_fail_vld     (idu_hpcp_rf_pipe1_lch_fail_vld    ),
  .idu_hpcp_rf_pipe2_inst_vld         (idu_hpcp_rf_pipe2_inst_vld        ),
  .idu_hpcp_rf_pipe2_lch_fail_vld     (idu_hpcp_rf_pipe2_lch_fail_vld    ),
  .idu_hpcp_rf_pipe3_inst_vld         (idu_hpcp_rf_pipe3_inst_vld        ),
  .idu_hpcp_rf_pipe3_lch_fail_vld     (idu_hpcp_rf_pipe3_lch_fail_vld    ),
  .idu_hpcp_rf_pipe3_reg_lch_fail_vld (idu_hpcp_rf_pipe3_reg_lch_fail_vld),
  .idu_hpcp_rf_pipe4_inst_vld         (idu_hpcp_rf_pipe4_inst_vld        ),
  .idu_hpcp_rf_pipe4_lch_fail_vld     (idu_hpcp_rf_pipe4_lch_fail_vld    ),
  .idu_hpcp_rf_pipe4_reg_lch_fail_vld (idu_hpcp_rf_pipe4_reg_lch_fail_vld),
  .idu_hpcp_rf_pipe5_inst_vld         (idu_hpcp_rf_pipe5_inst_vld        ),
  .idu_hpcp_rf_pipe5_lch_fail_vld     (idu_hpcp_rf_pipe5_lch_fail_vld    ),
  .idu_hpcp_rf_pipe5_reg_lch_fail_vld (idu_hpcp_rf_pipe5_reg_lch_fail_vld),
  .idu_hpcp_rf_pipe6_inst_vld         (idu_hpcp_rf_pipe6_inst_vld        ),
  .idu_hpcp_rf_pipe6_lch_fail_vld     (idu_hpcp_rf_pipe6_lch_fail_vld    ),
  .idu_hpcp_rf_pipe7_inst_vld         (idu_hpcp_rf_pipe7_inst_vld        ),
  .idu_hpcp_rf_pipe7_lch_fail_vld     (idu_hpcp_rf_pipe7_lch_fail_vld    ),
  .ifu_hpcp_btb_inst                  (ifu_hpcp_btb_inst                 ),
  .ifu_hpcp_btb_mispred               (ifu_hpcp_btb_mispred              ),
  .ifu_hpcp_frontend_stall            (ifu_hpcp_frontend_stall           ),
  .ifu_hpcp_icache_access             (ifu_hpcp_icache_access            ),
  .ifu_hpcp_icache_miss               (ifu_hpcp_icache_miss              ),
  .lsu_hpcp_cache_read_access         (lsu_hpcp_cache_read_access        ),
  .lsu_hpcp_cache_read_miss           (lsu_hpcp_cache_read_miss          ),
  .lsu_hpcp_cache_write_access        (lsu_hpcp_cache_write_access       ),
  .lsu_hpcp_cache_write_miss          (lsu_hpcp_cache_write_miss         ),
  .lsu_hpcp_fence_stall               (lsu_hpcp_fence_stall              ),
  .lsu_hpcp_ld_stall_cross_4k         (lsu_hpcp_ld_stall_cross_4k        ),
  .lsu_hpcp_ld_stall_other            (lsu_hpcp_ld_stall_other           ),
  .lsu_hpcp_replay_data_discard       (lsu_hpcp_replay_data_discard      ),
  .lsu_hpcp_replay_discard_sq         (lsu_hpcp_replay_discard_sq        ),
  .lsu_hpcp_st_stall_cross_4k         (lsu_hpcp_st_stall_cross_4k        ),
  .lsu_hpcp_st_stall_other            (lsu_hpcp_st_stall_other           ),
  .lsu_hpcp_unalign_inst              (lsu_hpcp_unalign_inst             ),
  .mmu_hpcp_dutlb_miss                (mmu_hpcp_dutlb_miss               ),
  .mmu_hpcp_iutlb_miss                (mmu_hpcp_iutlb_miss               ),
  .mmu_hpcp_jtlb_miss                 (mmu_hpcp_jtlb_miss                ),
  .pad_yy_icg_scan_en                 (pad_yy_icg_scan_en                ),
  .rtu_hpcp_inst0_ack_int             (rtu_hpcp_inst0_ack_int            ),
  .rtu_hpcp_inst0_bht_mispred         (rtu_hpcp_inst0_bht_mispred        ),
  .rtu_hpcp_inst0_condbr              (rtu_hpcp_inst0_condbr             ),
  .rtu_hpcp_inst0_cur_pc              (rtu_hpcp_inst0_cur_pc             ),
  .rtu_hpcp_inst0_jmp                 (rtu_hpcp_inst0_jmp                ),
  .rtu_hpcp_inst0_jmp_mispred         (rtu_hpcp_inst0_jmp_mispred        ),
  .rtu_hpcp_inst0_jmp_pc_offset_8m    (rtu_hpcp_inst0_jmp_pc_offset_8m   ),
  .rtu_hpcp_inst0_num                 (rtu_hpcp_inst0_num                ),
  .rtu_hpcp_inst0_pc_offset           (rtu_hpcp_inst0_pc_offset          ),
  .rtu_hpcp_inst0_spec_fail           (rtu_hpcp_inst0_spec_fail          ),
  .rtu_hpcp_inst0_split               (rtu_hpcp_inst0_split              ),
  .rtu_hpcp_inst0_store               (rtu_hpcp_inst0_store              ),
  .rtu_hpcp_inst0_vld                 (rtu_hpcp_inst0_vld                ),
  .rtu_hpcp_inst1_condbr              (rtu_hpcp_inst1_condbr             ),
  .rtu_hpcp_inst1_cur_pc              (rtu_hpcp_inst1_cur_pc             ),
  .rtu_hpcp_inst1_jmp                 (rtu_hpcp_inst1_jmp                ),
  .rtu_hpcp_inst1_jmp_pc_offset_8m    (rtu_hpcp_inst1_jmp_pc_offset_8m   ),
  .rtu_hpcp_inst1_num                 (rtu_hpcp_inst1_num                ),
  .rtu_hpcp_inst1_pc_offset           (rtu_hpcp_inst1_pc_offset          ),
  .rtu_hpcp_inst1_split               (rtu_hpcp_inst1_split              ),
  .rtu_hpcp_inst1_store               (rtu_hpcp_inst1_store              ),
  .rtu_hpcp_inst1_vld                 (rtu_hpcp_inst1_vld                ),
  .rtu_hpcp_inst2_condbr              (rtu_hpcp_inst2_condbr             ),
  .rtu_hpcp_inst2_cur_pc              (rtu_hpcp_inst2_cur_pc             ),
  .rtu_hpcp_inst2_jmp                 (rtu_hpcp_inst2_jmp                ),
  .rtu_hpcp_inst2_jmp_pc_offset_8m    (rtu_hpcp_inst2_jmp_pc_offset_8m   ),
  .rtu_hpcp_inst2_num                 (rtu_hpcp_inst2_num                ),
  .rtu_hpcp_inst2_pc_offset           (rtu_hpcp_inst2_pc_offset          ),
  .rtu_hpcp_inst2_split               (rtu_hpcp_inst2_split              ),
  .rtu_hpcp_inst2_store               (rtu_hpcp_inst2_store              ),
  .rtu_hpcp_inst2_vld                 (rtu_hpcp_inst2_vld                ),
  .rtu_hpcp_trace_inst0_chgflow       (rtu_hpcp_trace_inst0_chgflow      ),
  .rtu_hpcp_trace_inst0_next_pc       (rtu_hpcp_trace_inst0_next_pc      ),
  .rtu_hpcp_trace_inst1_chgflow       (rtu_hpcp_trace_inst1_chgflow      ),
  .rtu_hpcp_trace_inst1_next_pc       (rtu_hpcp_trace_inst1_next_pc      ),
  .rtu_hpcp_trace_inst2_chgflow       (rtu_hpcp_trace_inst2_chgflow      ),
  .rtu_hpcp_trace_inst2_next_pc       (rtu_hpcp_trace_inst2_next_pc      ),
  .rtu_yy_xx_dbgon                    (rtu_yy_xx_dbgon                   ),
  .rtu_yy_xx_flush                    (rtu_yy_xx_flush                   )
);

// &Connect(.forever_cpuclk    (coreclk)); @85
// &Connect(.cpurst_b          (mmu_rst_b)); @86

//==========================================================
//  Instance ct_reset_top sub module 
//==========================================================
// &Instance("ct_rst_top"); @92
ct_rst_top  x_ct_rst_top (
  .forever_coreclk   (forever_coreclk  ),
  .fpu_rst_b         (fpu_rst_b        ),
  .had_rst_b         (had_rst_b        ),
  .idu_rst_b         (idu_rst_b        ),
  .ifu_rst_b         (ifu_rst_b        ),
  .lsu_rst_b         (lsu_rst_b        ),
  .mmu_rst_b         (mmu_rst_b        ),
  .pad_core_rst_b    (pad_core_rst_b   ),
  .pad_cpu_rst_b     (pad_cpu_rst_b    ),
  .pad_yy_mbist_mode (pad_yy_mbist_mode),
  .pad_yy_scan_mode  (pad_yy_scan_mode ),
  .pad_yy_scan_rst_b (pad_yy_scan_rst_b)
);


//==========================================================
//  Instance ct_clk_top sub module 
//==========================================================
// &Instance("ct_clk_top"); @97
ct_clk_top  x_ct_clk_top (
  .biu_xx_dbg_wakeup  (biu_xx_dbg_wakeup ),
  .biu_xx_int_wakeup  (biu_xx_int_wakeup ),
  .biu_xx_normal_work (biu_xx_normal_work),
  .biu_xx_pmp_sel     (biu_xx_pmp_sel    ),
  .biu_xx_snoop_vld   (biu_xx_snoop_vld  ),
  .coreclk            (coreclk           ),
  .cp0_xx_core_icg_en (cp0_xx_core_icg_en),
  .forever_coreclk    (forever_coreclk   ),
  .had_xx_clk_en      (had_xx_clk_en     ),
  .pll_core_clk       (pll_core_clk      )
);



// &ModuleEnd; @100
endmodule



