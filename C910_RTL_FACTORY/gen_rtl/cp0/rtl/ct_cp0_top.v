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
module ct_cp0_top(
  biu_cp0_apb_base,
  biu_cp0_cmplt,
  biu_cp0_coreid,
  biu_cp0_me_int,
  biu_cp0_ms_int,
  biu_cp0_mt_int,
  biu_cp0_rdata,
  biu_cp0_rvba,
  biu_cp0_se_int,
  biu_cp0_ss_int,
  biu_cp0_st_int,
  biu_yy_xx_no_op,
  cp0_biu_icg_en,
  cp0_biu_lpmd_b,
  cp0_biu_op,
  cp0_biu_sel,
  cp0_biu_wdata,
  cp0_had_cpuid_0,
  cp0_had_debug_info,
  cp0_had_lpmd_b,
  cp0_had_trace_pm_wdata,
  cp0_had_trace_pm_wen,
  cp0_hpcp_icg_en,
  cp0_hpcp_index,
  cp0_hpcp_int_disable,
  cp0_hpcp_mcntwen,
  cp0_hpcp_op,
  cp0_hpcp_pmdm,
  cp0_hpcp_pmds,
  cp0_hpcp_pmdu,
  cp0_hpcp_sel,
  cp0_hpcp_src0,
  cp0_hpcp_wdata,
  cp0_idu_cskyee,
  cp0_idu_dlb_disable,
  cp0_idu_frm,
  cp0_idu_fs,
  cp0_idu_icg_en,
  cp0_idu_iq_bypass_disable,
  cp0_idu_rob_fold_disable,
  cp0_idu_src2_fwd_disable,
  cp0_idu_srcv2_fwd_disable,
  cp0_idu_vill,
  cp0_idu_vs,
  cp0_idu_vstart,
  cp0_idu_zero_delay_move_disable,
  cp0_ifu_bht_en,
  cp0_ifu_bht_inv,
  cp0_ifu_btb_en,
  cp0_ifu_btb_inv,
  cp0_ifu_icache_en,
  cp0_ifu_icache_inv,
  cp0_ifu_icache_pref_en,
  cp0_ifu_icache_read_index,
  cp0_ifu_icache_read_req,
  cp0_ifu_icache_read_tag,
  cp0_ifu_icache_read_way,
  cp0_ifu_icg_en,
  cp0_ifu_ind_btb_en,
  cp0_ifu_ind_btb_inv,
  cp0_ifu_insde,
  cp0_ifu_iwpe,
  cp0_ifu_l0btb_en,
  cp0_ifu_lbuf_en,
  cp0_ifu_no_op_req,
  cp0_ifu_nsfe,
  cp0_ifu_ras_en,
  cp0_ifu_rst_inv_done,
  cp0_ifu_rvbr,
  cp0_ifu_vbr,
  cp0_ifu_vl,
  cp0_ifu_vlmul,
  cp0_ifu_vsetvli_pred_disable,
  cp0_ifu_vsetvli_pred_mode,
  cp0_ifu_vsew,
  cp0_iu_div_entry_disable,
  cp0_iu_div_entry_disable_clr,
  cp0_iu_ex3_abnormal,
  cp0_iu_ex3_efpc,
  cp0_iu_ex3_efpc_vld,
  cp0_iu_ex3_expt_vec,
  cp0_iu_ex3_expt_vld,
  cp0_iu_ex3_flush,
  cp0_iu_ex3_iid,
  cp0_iu_ex3_inst_vld,
  cp0_iu_ex3_mtval,
  cp0_iu_ex3_rslt_data,
  cp0_iu_ex3_rslt_preg,
  cp0_iu_ex3_rslt_vld,
  cp0_iu_icg_en,
  cp0_iu_vill,
  cp0_iu_vl,
  cp0_iu_vsetvli_pre_decd_disable,
  cp0_iu_vstart,
  cp0_lsu_amr,
  cp0_lsu_amr2,
  cp0_lsu_cb_aclr_dis,
  cp0_lsu_corr_dis,
  cp0_lsu_ctc_flush_dis,
  cp0_lsu_da_fwd_dis,
  cp0_lsu_dcache_clr,
  cp0_lsu_dcache_en,
  cp0_lsu_dcache_inv,
  cp0_lsu_dcache_pref_dist,
  cp0_lsu_dcache_pref_en,
  cp0_lsu_dcache_read_index,
  cp0_lsu_dcache_read_ld_tag,
  cp0_lsu_dcache_read_req,
  cp0_lsu_dcache_read_st_tag,
  cp0_lsu_dcache_read_way,
  cp0_lsu_fencei_broad_dis,
  cp0_lsu_fencerw_broad_dis,
  cp0_lsu_icg_en,
  cp0_lsu_l2_pref_dist,
  cp0_lsu_l2_pref_en,
  cp0_lsu_l2_st_pref_en,
  cp0_lsu_mm,
  cp0_lsu_no_op_req,
  cp0_lsu_nsfe,
  cp0_lsu_pfu_mmu_dis,
  cp0_lsu_timeout_cnt,
  cp0_lsu_tlb_broad_dis,
  cp0_lsu_tvm,
  cp0_lsu_ucme,
  cp0_lsu_vstart,
  cp0_lsu_wa,
  cp0_lsu_wr_burst_dis,
  cp0_mmu_cskyee,
  cp0_mmu_icg_en,
  cp0_mmu_maee,
  cp0_mmu_mpp,
  cp0_mmu_mprv,
  cp0_mmu_mxr,
  cp0_mmu_no_op_req,
  cp0_mmu_ptw_en,
  cp0_mmu_reg_num,
  cp0_mmu_satp_sel,
  cp0_mmu_sum,
  cp0_mmu_tlb_all_inv,
  cp0_mmu_wdata,
  cp0_mmu_wreg,
  cp0_pad_mstatus,
  cp0_pmp_icg_en,
  cp0_pmp_mpp,
  cp0_pmp_mprv,
  cp0_pmp_reg_num,
  cp0_pmp_wdata,
  cp0_pmp_wreg,
  cp0_rtu_icg_en,
  cp0_rtu_srt_en,
  cp0_rtu_xx_int_b,
  cp0_rtu_xx_vec,
  cp0_vfpu_fcsr,
  cp0_vfpu_fxcr,
  cp0_vfpu_icg_en,
  cp0_vfpu_vl,
  cp0_xx_core_icg_en,
  cp0_yy_clk_en,
  cp0_yy_dcache_pref_en,
  cp0_yy_hyper,
  cp0_yy_priv_mode,
  cp0_yy_virtual_mode,
  cpurst_b,
  forever_cpuclk,
  had_cp0_xx_dbg,
  hpcp_cp0_cmplt,
  hpcp_cp0_data,
  hpcp_cp0_int_vld,
  hpcp_cp0_sce,
  idu_cp0_fesr_acc_updt_val,
  idu_cp0_fesr_acc_updt_vld,
  idu_cp0_rf_func,
  idu_cp0_rf_gateclk_sel,
  idu_cp0_rf_iid,
  idu_cp0_rf_opcode,
  idu_cp0_rf_preg,
  idu_cp0_rf_sel,
  idu_cp0_rf_src0,
  ifu_cp0_bht_inv_done,
  ifu_cp0_btb_inv_done,
  ifu_cp0_icache_inv_done,
  ifu_cp0_icache_read_data,
  ifu_cp0_icache_read_data_vld,
  ifu_cp0_ind_btb_inv_done,
  ifu_cp0_rst_inv_req,
  ifu_yy_xx_no_op,
  lsu_cp0_dcache_done,
  lsu_cp0_dcache_read_data,
  lsu_cp0_dcache_read_data_vld,
  lsu_yy_xx_no_op,
  mmu_cp0_cmplt,
  mmu_cp0_data,
  mmu_cp0_satp_data,
  mmu_cp0_tlb_done,
  mmu_yy_xx_no_op,
  pad_yy_icg_scan_en,
  pmp_cp0_data,
  rtu_cp0_epc,
  rtu_cp0_expt_gateclk_vld,
  rtu_cp0_expt_mtval,
  rtu_cp0_expt_vld,
  rtu_cp0_fp_dirty_vld,
  rtu_cp0_int_ack,
  rtu_cp0_vec_dirty_vld,
  rtu_cp0_vsetvl_vill,
  rtu_cp0_vsetvl_vl,
  rtu_cp0_vsetvl_vl_vld,
  rtu_cp0_vsetvl_vlmul,
  rtu_cp0_vsetvl_vsew,
  rtu_cp0_vsetvl_vtype_vld,
  rtu_cp0_vstart,
  rtu_cp0_vstart_vld,
  rtu_yy_xx_commit0,
  rtu_yy_xx_commit0_iid,
  rtu_yy_xx_dbgon,
  rtu_yy_xx_expt_vec,
  rtu_yy_xx_flush
);

// &Ports; @25
input   [39 :0]  biu_cp0_apb_base;               
input            biu_cp0_cmplt;                  
input   [2  :0]  biu_cp0_coreid;                 
input            biu_cp0_me_int;                 
input            biu_cp0_ms_int;                 
input            biu_cp0_mt_int;                 
input   [127:0]  biu_cp0_rdata;                  
input   [39 :0]  biu_cp0_rvba;                   
input            biu_cp0_se_int;                 
input            biu_cp0_ss_int;                 
input            biu_cp0_st_int;                 
input            biu_yy_xx_no_op;                
input            cpurst_b;                       
input            forever_cpuclk;                 
input            had_cp0_xx_dbg;                 
input            hpcp_cp0_cmplt;                 
input   [63 :0]  hpcp_cp0_data;                  
input            hpcp_cp0_int_vld;               
input            hpcp_cp0_sce;                   
input   [6  :0]  idu_cp0_fesr_acc_updt_val;      
input            idu_cp0_fesr_acc_updt_vld;      
input   [4  :0]  idu_cp0_rf_func;                
input            idu_cp0_rf_gateclk_sel;         
input   [6  :0]  idu_cp0_rf_iid;                 
input   [31 :0]  idu_cp0_rf_opcode;              
input   [6  :0]  idu_cp0_rf_preg;                
input            idu_cp0_rf_sel;                 
input   [63 :0]  idu_cp0_rf_src0;                
input            ifu_cp0_bht_inv_done;           
input            ifu_cp0_btb_inv_done;           
input            ifu_cp0_icache_inv_done;        
input   [127:0]  ifu_cp0_icache_read_data;       
input            ifu_cp0_icache_read_data_vld;   
input            ifu_cp0_ind_btb_inv_done;       
input            ifu_cp0_rst_inv_req;            
input            ifu_yy_xx_no_op;                
input            lsu_cp0_dcache_done;            
input   [127:0]  lsu_cp0_dcache_read_data;       
input            lsu_cp0_dcache_read_data_vld;   
input            lsu_yy_xx_no_op;                
input            mmu_cp0_cmplt;                  
input   [63 :0]  mmu_cp0_data;                   
input   [63 :0]  mmu_cp0_satp_data;              
input            mmu_cp0_tlb_done;               
input            mmu_yy_xx_no_op;                
input            pad_yy_icg_scan_en;             
input   [63 :0]  pmp_cp0_data;                   
input   [63 :0]  rtu_cp0_epc;                    
input            rtu_cp0_expt_gateclk_vld;       
input   [63 :0]  rtu_cp0_expt_mtval;             
input            rtu_cp0_expt_vld;               
input            rtu_cp0_fp_dirty_vld;           
input            rtu_cp0_int_ack;                
input            rtu_cp0_vec_dirty_vld;          
input            rtu_cp0_vsetvl_vill;            
input   [7  :0]  rtu_cp0_vsetvl_vl;              
input            rtu_cp0_vsetvl_vl_vld;          
input   [1  :0]  rtu_cp0_vsetvl_vlmul;           
input   [2  :0]  rtu_cp0_vsetvl_vsew;            
input            rtu_cp0_vsetvl_vtype_vld;       
input   [6  :0]  rtu_cp0_vstart;                 
input            rtu_cp0_vstart_vld;             
input            rtu_yy_xx_commit0;              
input   [6  :0]  rtu_yy_xx_commit0_iid;          
input            rtu_yy_xx_dbgon;                
input   [5  :0]  rtu_yy_xx_expt_vec;             
input            rtu_yy_xx_flush;                
output           cp0_biu_icg_en;                 
output  [1  :0]  cp0_biu_lpmd_b;                 
output  [15 :0]  cp0_biu_op;                     
output           cp0_biu_sel;                    
output  [63 :0]  cp0_biu_wdata;                  
output  [31 :0]  cp0_had_cpuid_0;                
output  [3  :0]  cp0_had_debug_info;             
output  [1  :0]  cp0_had_lpmd_b;                 
output  [1  :0]  cp0_had_trace_pm_wdata;         
output           cp0_had_trace_pm_wen;           
output           cp0_hpcp_icg_en;                
output  [11 :0]  cp0_hpcp_index;                 
output           cp0_hpcp_int_disable;           
output  [31 :0]  cp0_hpcp_mcntwen;               
output  [3  :0]  cp0_hpcp_op;                    
output           cp0_hpcp_pmdm;                  
output           cp0_hpcp_pmds;                  
output           cp0_hpcp_pmdu;                  
output           cp0_hpcp_sel;                   
output  [63 :0]  cp0_hpcp_src0;                  
output  [63 :0]  cp0_hpcp_wdata;                 
output           cp0_idu_cskyee;                 
output           cp0_idu_dlb_disable;            
output  [2  :0]  cp0_idu_frm;                    
output  [1  :0]  cp0_idu_fs;                     
output           cp0_idu_icg_en;                 
output           cp0_idu_iq_bypass_disable;      
output           cp0_idu_rob_fold_disable;       
output           cp0_idu_src2_fwd_disable;       
output           cp0_idu_srcv2_fwd_disable;      
output           cp0_idu_vill;                   
output  [1  :0]  cp0_idu_vs;                     
output  [6  :0]  cp0_idu_vstart;                 
output           cp0_idu_zero_delay_move_disable; 
output           cp0_ifu_bht_en;                 
output           cp0_ifu_bht_inv;                
output           cp0_ifu_btb_en;                 
output           cp0_ifu_btb_inv;                
output           cp0_ifu_icache_en;              
output           cp0_ifu_icache_inv;             
output           cp0_ifu_icache_pref_en;         
output  [16 :0]  cp0_ifu_icache_read_index;      
output           cp0_ifu_icache_read_req;        
output           cp0_ifu_icache_read_tag;        
output           cp0_ifu_icache_read_way;        
output           cp0_ifu_icg_en;                 
output           cp0_ifu_ind_btb_en;             
output           cp0_ifu_ind_btb_inv;            
output           cp0_ifu_insde;                  
output           cp0_ifu_iwpe;                   
output           cp0_ifu_l0btb_en;               
output           cp0_ifu_lbuf_en;                
output           cp0_ifu_no_op_req;              
output           cp0_ifu_nsfe;                   
output           cp0_ifu_ras_en;                 
output           cp0_ifu_rst_inv_done;           
output  [39 :0]  cp0_ifu_rvbr;                   
output  [39 :0]  cp0_ifu_vbr;                    
output  [7  :0]  cp0_ifu_vl;                     
output  [1  :0]  cp0_ifu_vlmul;                  
output           cp0_ifu_vsetvli_pred_disable;   
output           cp0_ifu_vsetvli_pred_mode;      
output  [2  :0]  cp0_ifu_vsew;                   
output           cp0_iu_div_entry_disable;       
output           cp0_iu_div_entry_disable_clr;   
output           cp0_iu_ex3_abnormal;            
output  [38 :0]  cp0_iu_ex3_efpc;                
output           cp0_iu_ex3_efpc_vld;            
output  [4  :0]  cp0_iu_ex3_expt_vec;            
output           cp0_iu_ex3_expt_vld;            
output           cp0_iu_ex3_flush;               
output  [6  :0]  cp0_iu_ex3_iid;                 
output           cp0_iu_ex3_inst_vld;            
output  [31 :0]  cp0_iu_ex3_mtval;               
output  [63 :0]  cp0_iu_ex3_rslt_data;           
output  [6  :0]  cp0_iu_ex3_rslt_preg;           
output           cp0_iu_ex3_rslt_vld;            
output           cp0_iu_icg_en;                  
output           cp0_iu_vill;                    
output  [7  :0]  cp0_iu_vl;                      
output           cp0_iu_vsetvli_pre_decd_disable; 
output  [6  :0]  cp0_iu_vstart;                  
output           cp0_lsu_amr;                    
output           cp0_lsu_amr2;                   
output           cp0_lsu_cb_aclr_dis;            
output           cp0_lsu_corr_dis;               
output           cp0_lsu_ctc_flush_dis;          
output           cp0_lsu_da_fwd_dis;             
output           cp0_lsu_dcache_clr;             
output           cp0_lsu_dcache_en;              
output           cp0_lsu_dcache_inv;             
output  [1  :0]  cp0_lsu_dcache_pref_dist;       
output           cp0_lsu_dcache_pref_en;         
output  [16 :0]  cp0_lsu_dcache_read_index;      
output           cp0_lsu_dcache_read_ld_tag;     
output           cp0_lsu_dcache_read_req;        
output           cp0_lsu_dcache_read_st_tag;     
output           cp0_lsu_dcache_read_way;        
output           cp0_lsu_fencei_broad_dis;       
output           cp0_lsu_fencerw_broad_dis;      
output           cp0_lsu_icg_en;                 
output  [1  :0]  cp0_lsu_l2_pref_dist;           
output           cp0_lsu_l2_pref_en;             
output           cp0_lsu_l2_st_pref_en;          
output           cp0_lsu_mm;                     
output           cp0_lsu_no_op_req;              
output           cp0_lsu_nsfe;                   
output           cp0_lsu_pfu_mmu_dis;            
output  [29 :0]  cp0_lsu_timeout_cnt;            
output           cp0_lsu_tlb_broad_dis;          
output           cp0_lsu_tvm;                    
output           cp0_lsu_ucme;                   
output  [6  :0]  cp0_lsu_vstart;                 
output           cp0_lsu_wa;                     
output           cp0_lsu_wr_burst_dis;           
output           cp0_mmu_cskyee;                 
output           cp0_mmu_icg_en;                 
output           cp0_mmu_maee;                   
output  [1  :0]  cp0_mmu_mpp;                    
output           cp0_mmu_mprv;                   
output           cp0_mmu_mxr;                    
output           cp0_mmu_no_op_req;              
output           cp0_mmu_ptw_en;                 
output  [1  :0]  cp0_mmu_reg_num;                
output           cp0_mmu_satp_sel;               
output           cp0_mmu_sum;                    
output           cp0_mmu_tlb_all_inv;            
output  [63 :0]  cp0_mmu_wdata;                  
output           cp0_mmu_wreg;                   
output  [63 :0]  cp0_pad_mstatus;                
output           cp0_pmp_icg_en;                 
output  [1  :0]  cp0_pmp_mpp;                    
output           cp0_pmp_mprv;                   
output  [4  :0]  cp0_pmp_reg_num;                
output  [63 :0]  cp0_pmp_wdata;                  
output           cp0_pmp_wreg;                   
output           cp0_rtu_icg_en;                 
output           cp0_rtu_srt_en;                 
output           cp0_rtu_xx_int_b;               
output  [4  :0]  cp0_rtu_xx_vec;                 
output  [63 :0]  cp0_vfpu_fcsr;                  
output  [31 :0]  cp0_vfpu_fxcr;                  
output           cp0_vfpu_icg_en;                
output  [7  :0]  cp0_vfpu_vl;                    
output           cp0_xx_core_icg_en;             
output           cp0_yy_clk_en;                  
output           cp0_yy_dcache_pref_en;          
output           cp0_yy_hyper;                   
output  [1  :0]  cp0_yy_priv_mode;               
output           cp0_yy_virtual_mode;            

// &Regs; @26

// &Wires; @27
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
wire             biu_yy_xx_no_op;                
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
wire             cp0_idu_cskyee;                 
wire             cp0_idu_dlb_disable;            
wire    [2  :0]  cp0_idu_frm;                    
wire    [1  :0]  cp0_idu_fs;                     
wire             cp0_idu_icg_en;                 
wire             cp0_idu_iq_bypass_disable;      
wire             cp0_idu_rob_fold_disable;       
wire             cp0_idu_src2_fwd_disable;       
wire             cp0_idu_srcv2_fwd_disable;      
wire             cp0_idu_vill;                   
wire    [1  :0]  cp0_idu_vs;                     
wire    [6  :0]  cp0_idu_vstart;                 
wire             cp0_idu_zero_delay_move_disable; 
wire             cp0_ifu_bht_en;                 
wire             cp0_ifu_bht_inv;                
wire             cp0_ifu_btb_en;                 
wire             cp0_ifu_btb_inv;                
wire             cp0_ifu_icache_en;              
wire             cp0_ifu_icache_inv;             
wire             cp0_ifu_icache_pref_en;         
wire    [16 :0]  cp0_ifu_icache_read_index;      
wire             cp0_ifu_icache_read_req;        
wire             cp0_ifu_icache_read_tag;        
wire             cp0_ifu_icache_read_way;        
wire             cp0_ifu_icg_en;                 
wire             cp0_ifu_ind_btb_en;             
wire             cp0_ifu_ind_btb_inv;            
wire             cp0_ifu_insde;                  
wire             cp0_ifu_iwpe;                   
wire             cp0_ifu_l0btb_en;               
wire             cp0_ifu_lbuf_en;                
wire             cp0_ifu_no_op_req;              
wire             cp0_ifu_nsfe;                   
wire             cp0_ifu_ras_en;                 
wire             cp0_ifu_rst_inv_done;           
wire    [39 :0]  cp0_ifu_rvbr;                   
wire    [39 :0]  cp0_ifu_vbr;                    
wire    [7  :0]  cp0_ifu_vl;                     
wire    [1  :0]  cp0_ifu_vlmul;                  
wire             cp0_ifu_vsetvli_pred_disable;   
wire             cp0_ifu_vsetvli_pred_mode;      
wire    [2  :0]  cp0_ifu_vsew;                   
wire             cp0_iu_div_entry_disable;       
wire             cp0_iu_div_entry_disable_clr;   
wire             cp0_iu_ex3_abnormal;            
wire    [38 :0]  cp0_iu_ex3_efpc;                
wire             cp0_iu_ex3_efpc_vld;            
wire    [4  :0]  cp0_iu_ex3_expt_vec;            
wire             cp0_iu_ex3_expt_vld;            
wire             cp0_iu_ex3_flush;               
wire    [6  :0]  cp0_iu_ex3_iid;                 
wire             cp0_iu_ex3_inst_vld;            
wire    [31 :0]  cp0_iu_ex3_mtval;               
wire    [63 :0]  cp0_iu_ex3_rslt_data;           
wire    [6  :0]  cp0_iu_ex3_rslt_preg;           
wire             cp0_iu_ex3_rslt_vld;            
wire             cp0_iu_icg_en;                  
wire             cp0_iu_vill;                    
wire    [7  :0]  cp0_iu_vl;                      
wire             cp0_iu_vsetvli_pre_decd_disable; 
wire    [6  :0]  cp0_iu_vstart;                  
wire             cp0_lsu_amr;                    
wire             cp0_lsu_amr2;                   
wire             cp0_lsu_cb_aclr_dis;            
wire             cp0_lsu_corr_dis;               
wire             cp0_lsu_ctc_flush_dis;          
wire             cp0_lsu_da_fwd_dis;             
wire             cp0_lsu_dcache_clr;             
wire             cp0_lsu_dcache_en;              
wire             cp0_lsu_dcache_inv;             
wire    [1  :0]  cp0_lsu_dcache_pref_dist;       
wire             cp0_lsu_dcache_pref_en;         
wire    [16 :0]  cp0_lsu_dcache_read_index;      
wire             cp0_lsu_dcache_read_ld_tag;     
wire             cp0_lsu_dcache_read_req;        
wire             cp0_lsu_dcache_read_st_tag;     
wire             cp0_lsu_dcache_read_way;        
wire             cp0_lsu_fencei_broad_dis;       
wire             cp0_lsu_fencerw_broad_dis;      
wire             cp0_lsu_icg_en;                 
wire    [1  :0]  cp0_lsu_l2_pref_dist;           
wire             cp0_lsu_l2_pref_en;             
wire             cp0_lsu_l2_st_pref_en;          
wire             cp0_lsu_mm;                     
wire             cp0_lsu_no_op_req;              
wire             cp0_lsu_nsfe;                   
wire             cp0_lsu_pfu_mmu_dis;            
wire    [29 :0]  cp0_lsu_timeout_cnt;            
wire             cp0_lsu_tlb_broad_dis;          
wire             cp0_lsu_tvm;                    
wire             cp0_lsu_ucme;                   
wire    [6  :0]  cp0_lsu_vstart;                 
wire             cp0_lsu_wa;                     
wire             cp0_lsu_wr_burst_dis;           
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
wire             cp0_mret;                       
wire    [63 :0]  cp0_pad_mstatus;                
wire             cp0_pmp_icg_en;                 
wire    [1  :0]  cp0_pmp_mpp;                    
wire             cp0_pmp_mprv;                   
wire    [4  :0]  cp0_pmp_reg_num;                
wire    [63 :0]  cp0_pmp_wdata;                  
wire             cp0_pmp_wreg;                   
wire             cp0_rtu_icg_en;                 
wire             cp0_rtu_srt_en;                 
wire             cp0_rtu_xx_int_b;               
wire    [4  :0]  cp0_rtu_xx_vec;                 
wire             cp0_sret;                       
wire    [63 :0]  cp0_vfpu_fcsr;                  
wire    [31 :0]  cp0_vfpu_fxcr;                  
wire             cp0_vfpu_icg_en;                
wire    [7  :0]  cp0_vfpu_vl;                    
wire             cp0_xx_core_icg_en;             
wire             cp0_yy_clk_en;                  
wire             cp0_yy_dcache_pref_en;          
wire             cp0_yy_hyper;                   
wire    [1  :0]  cp0_yy_priv_mode;               
wire             cp0_yy_virtual_mode;            
wire             cpurst_b;                       
wire             forever_cpuclk;                 
wire             had_cp0_xx_dbg;                 
wire             hpcp_cp0_cmplt;                 
wire    [63 :0]  hpcp_cp0_data;                  
wire             hpcp_cp0_int_vld;               
wire             hpcp_cp0_sce;                   
wire    [6  :0]  idu_cp0_fesr_acc_updt_val;      
wire             idu_cp0_fesr_acc_updt_vld;      
wire    [4  :0]  idu_cp0_rf_func;                
wire             idu_cp0_rf_gateclk_sel;         
wire    [6  :0]  idu_cp0_rf_iid;                 
wire    [31 :0]  idu_cp0_rf_opcode;              
wire    [6  :0]  idu_cp0_rf_preg;                
wire             idu_cp0_rf_sel;                 
wire    [63 :0]  idu_cp0_rf_src0;                
wire             ifu_cp0_bht_inv_done;           
wire             ifu_cp0_btb_inv_done;           
wire             ifu_cp0_icache_inv_done;        
wire    [127:0]  ifu_cp0_icache_read_data;       
wire             ifu_cp0_icache_read_data_vld;   
wire             ifu_cp0_ind_btb_inv_done;       
wire             ifu_cp0_rst_inv_req;            
wire             ifu_yy_xx_no_op;                
wire             inst_lpmd_ex1_ex2;              
wire    [11 :0]  iui_regs_addr;                  
wire             iui_regs_csr_wr;                
wire             iui_regs_csrw;                  
wire             iui_regs_ex3_inst_csr;          
wire             iui_regs_inst_mret;             
wire             iui_regs_inst_sret;             
wire             iui_regs_inv_expt;              
wire    [31 :0]  iui_regs_opcode;                
wire    [63 :0]  iui_regs_ori_src0;              
wire             iui_regs_rst_inv_d;             
wire             iui_regs_rst_inv_i;             
wire             iui_regs_sel;                   
wire    [63 :0]  iui_regs_src0;                  
wire    [1  :0]  iui_top_cur_state;              
wire             lpmd_cmplt;                     
wire    [1  :0]  lpmd_top_cur_state;             
wire             lsu_cp0_dcache_done;            
wire    [127:0]  lsu_cp0_dcache_read_data;       
wire             lsu_cp0_dcache_read_data_vld;   
wire             lsu_yy_xx_no_op;                
wire             mmu_cp0_cmplt;                  
wire    [63 :0]  mmu_cp0_data;                   
wire    [63 :0]  mmu_cp0_satp_data;              
wire             mmu_cp0_tlb_done;               
wire             mmu_yy_xx_no_op;                
wire             pad_yy_icg_scan_en;             
wire    [63 :0]  pmp_cp0_data;                   
wire             regs_iui_cfr_no_op;             
wire             regs_iui_chk_vld;               
wire             regs_iui_cindex_l2;             
wire             regs_iui_cins_no_op;            
wire             regs_iui_cskyee;                
wire    [63 :0]  regs_iui_data_out;              
wire             regs_iui_dca_sel;               
wire             regs_iui_fs_off;                
wire             regs_iui_hpcp_regs_sel;         
wire             regs_iui_hpcp_scr_inv;          
wire    [14 :0]  regs_iui_int_sel;               
wire             regs_iui_l2_regs_sel;           
wire    [1  :0]  regs_iui_pm;                    
wire    [3  :0]  regs_iui_reg_idx;               
wire             regs_iui_scnt_inv;              
wire             regs_iui_tee_ff;                
wire             regs_iui_tee_vld;               
wire             regs_iui_tsr;                   
wire             regs_iui_tvm;                   
wire             regs_iui_tw;                    
wire             regs_iui_ucnt_inv;              
wire             regs_iui_v;                     
wire             regs_iui_vs_off;                
wire    [63 :0]  regs_iui_wdata;                 
wire             regs_lpmd_int_vld;              
wire             regs_xx_icg_en;                 
wire    [63 :0]  rtu_cp0_epc;                    
wire             rtu_cp0_expt_gateclk_vld;       
wire    [63 :0]  rtu_cp0_expt_mtval;             
wire             rtu_cp0_expt_vld;               
wire             rtu_cp0_fp_dirty_vld;           
wire             rtu_cp0_int_ack;                
wire             rtu_cp0_vec_dirty_vld;          
wire             rtu_cp0_vsetvl_vill;            
wire    [7  :0]  rtu_cp0_vsetvl_vl;              
wire             rtu_cp0_vsetvl_vl_vld;          
wire    [1  :0]  rtu_cp0_vsetvl_vlmul;           
wire    [2  :0]  rtu_cp0_vsetvl_vsew;            
wire             rtu_cp0_vsetvl_vtype_vld;       
wire    [6  :0]  rtu_cp0_vstart;                 
wire             rtu_cp0_vstart_vld;             
wire             rtu_yy_xx_commit0;              
wire    [6  :0]  rtu_yy_xx_commit0_iid;          
wire             rtu_yy_xx_dbgon;                
wire    [5  :0]  rtu_yy_xx_expt_vec;             
wire             rtu_yy_xx_flush;                



// &Force ("output","cp0_yy_clk_en"); @30

// &Instance("ct_cp0_iui", "x_ct_cp0_iui"); @32
ct_cp0_iui  x_ct_cp0_iui (
  .biu_cp0_cmplt           (biu_cp0_cmplt          ),
  .biu_cp0_rdata           (biu_cp0_rdata          ),
  .cp0_biu_op              (cp0_biu_op             ),
  .cp0_biu_sel             (cp0_biu_sel            ),
  .cp0_biu_wdata           (cp0_biu_wdata          ),
  .cp0_hpcp_op             (cp0_hpcp_op            ),
  .cp0_hpcp_sel            (cp0_hpcp_sel           ),
  .cp0_hpcp_src0           (cp0_hpcp_src0          ),
  .cp0_ifu_rst_inv_done    (cp0_ifu_rst_inv_done   ),
  .cp0_iu_ex3_abnormal     (cp0_iu_ex3_abnormal    ),
  .cp0_iu_ex3_expt_vec     (cp0_iu_ex3_expt_vec    ),
  .cp0_iu_ex3_expt_vld     (cp0_iu_ex3_expt_vld    ),
  .cp0_iu_ex3_flush        (cp0_iu_ex3_flush       ),
  .cp0_iu_ex3_iid          (cp0_iu_ex3_iid         ),
  .cp0_iu_ex3_inst_vld     (cp0_iu_ex3_inst_vld    ),
  .cp0_iu_ex3_mtval        (cp0_iu_ex3_mtval       ),
  .cp0_iu_ex3_rslt_data    (cp0_iu_ex3_rslt_data   ),
  .cp0_iu_ex3_rslt_preg    (cp0_iu_ex3_rslt_preg   ),
  .cp0_iu_ex3_rslt_vld     (cp0_iu_ex3_rslt_vld    ),
  .cp0_mmu_tlb_all_inv     (cp0_mmu_tlb_all_inv    ),
  .cp0_mret                (cp0_mret               ),
  .cp0_rtu_xx_int_b        (cp0_rtu_xx_int_b       ),
  .cp0_rtu_xx_vec          (cp0_rtu_xx_vec         ),
  .cp0_sret                (cp0_sret               ),
  .cp0_yy_clk_en           (cp0_yy_clk_en          ),
  .cpurst_b                (cpurst_b               ),
  .forever_cpuclk          (forever_cpuclk         ),
  .hpcp_cp0_cmplt          (hpcp_cp0_cmplt         ),
  .hpcp_cp0_data           (hpcp_cp0_data          ),
  .idu_cp0_rf_func         (idu_cp0_rf_func        ),
  .idu_cp0_rf_gateclk_sel  (idu_cp0_rf_gateclk_sel ),
  .idu_cp0_rf_iid          (idu_cp0_rf_iid         ),
  .idu_cp0_rf_opcode       (idu_cp0_rf_opcode      ),
  .idu_cp0_rf_preg         (idu_cp0_rf_preg        ),
  .idu_cp0_rf_sel          (idu_cp0_rf_sel         ),
  .idu_cp0_rf_src0         (idu_cp0_rf_src0        ),
  .ifu_cp0_icache_inv_done (ifu_cp0_icache_inv_done),
  .ifu_cp0_rst_inv_req     (ifu_cp0_rst_inv_req    ),
  .inst_lpmd_ex1_ex2       (inst_lpmd_ex1_ex2      ),
  .iui_regs_addr           (iui_regs_addr          ),
  .iui_regs_csr_wr         (iui_regs_csr_wr        ),
  .iui_regs_csrw           (iui_regs_csrw          ),
  .iui_regs_ex3_inst_csr   (iui_regs_ex3_inst_csr  ),
  .iui_regs_inst_mret      (iui_regs_inst_mret     ),
  .iui_regs_inst_sret      (iui_regs_inst_sret     ),
  .iui_regs_inv_expt       (iui_regs_inv_expt      ),
  .iui_regs_opcode         (iui_regs_opcode        ),
  .iui_regs_ori_src0       (iui_regs_ori_src0      ),
  .iui_regs_rst_inv_d      (iui_regs_rst_inv_d     ),
  .iui_regs_rst_inv_i      (iui_regs_rst_inv_i     ),
  .iui_regs_sel            (iui_regs_sel           ),
  .iui_regs_src0           (iui_regs_src0          ),
  .iui_top_cur_state       (iui_top_cur_state      ),
  .lpmd_cmplt              (lpmd_cmplt             ),
  .lsu_cp0_dcache_done     (lsu_cp0_dcache_done    ),
  .mmu_cp0_cmplt           (mmu_cp0_cmplt          ),
  .mmu_cp0_tlb_done        (mmu_cp0_tlb_done       ),
  .pad_yy_icg_scan_en      (pad_yy_icg_scan_en     ),
  .regs_iui_cfr_no_op      (regs_iui_cfr_no_op     ),
  .regs_iui_chk_vld        (regs_iui_chk_vld       ),
  .regs_iui_cindex_l2      (regs_iui_cindex_l2     ),
  .regs_iui_cins_no_op     (regs_iui_cins_no_op    ),
  .regs_iui_cskyee         (regs_iui_cskyee        ),
  .regs_iui_data_out       (regs_iui_data_out      ),
  .regs_iui_dca_sel        (regs_iui_dca_sel       ),
  .regs_iui_fs_off         (regs_iui_fs_off        ),
  .regs_iui_hpcp_regs_sel  (regs_iui_hpcp_regs_sel ),
  .regs_iui_hpcp_scr_inv   (regs_iui_hpcp_scr_inv  ),
  .regs_iui_int_sel        (regs_iui_int_sel       ),
  .regs_iui_l2_regs_sel    (regs_iui_l2_regs_sel   ),
  .regs_iui_pm             (regs_iui_pm            ),
  .regs_iui_reg_idx        (regs_iui_reg_idx       ),
  .regs_iui_scnt_inv       (regs_iui_scnt_inv      ),
  .regs_iui_tee_ff         (regs_iui_tee_ff        ),
  .regs_iui_tee_vld        (regs_iui_tee_vld       ),
  .regs_iui_tsr            (regs_iui_tsr           ),
  .regs_iui_tvm            (regs_iui_tvm           ),
  .regs_iui_tw             (regs_iui_tw            ),
  .regs_iui_ucnt_inv       (regs_iui_ucnt_inv      ),
  .regs_iui_v              (regs_iui_v             ),
  .regs_iui_vs_off         (regs_iui_vs_off        ),
  .regs_iui_wdata          (regs_iui_wdata         ),
  .regs_xx_icg_en          (regs_xx_icg_en         ),
  .rtu_yy_xx_commit0       (rtu_yy_xx_commit0      ),
  .rtu_yy_xx_commit0_iid   (rtu_yy_xx_commit0_iid  ),
  .rtu_yy_xx_dbgon         (rtu_yy_xx_dbgon        ),
  .rtu_yy_xx_flush         (rtu_yy_xx_flush        )
);


// &Instance("ct_cp0_regs", "x_ct_cp0_regs"); @34
ct_cp0_regs  x_ct_cp0_regs (
  .biu_cp0_apb_base                (biu_cp0_apb_base               ),
  .biu_cp0_cmplt                   (biu_cp0_cmplt                  ),
  .biu_cp0_coreid                  (biu_cp0_coreid                 ),
  .biu_cp0_me_int                  (biu_cp0_me_int                 ),
  .biu_cp0_ms_int                  (biu_cp0_ms_int                 ),
  .biu_cp0_mt_int                  (biu_cp0_mt_int                 ),
  .biu_cp0_rdata                   (biu_cp0_rdata                  ),
  .biu_cp0_rvba                    (biu_cp0_rvba                   ),
  .biu_cp0_se_int                  (biu_cp0_se_int                 ),
  .biu_cp0_ss_int                  (biu_cp0_ss_int                 ),
  .biu_cp0_st_int                  (biu_cp0_st_int                 ),
  .cp0_biu_icg_en                  (cp0_biu_icg_en                 ),
  .cp0_had_cpuid_0                 (cp0_had_cpuid_0                ),
  .cp0_had_trace_pm_wdata          (cp0_had_trace_pm_wdata         ),
  .cp0_had_trace_pm_wen            (cp0_had_trace_pm_wen           ),
  .cp0_hpcp_icg_en                 (cp0_hpcp_icg_en                ),
  .cp0_hpcp_index                  (cp0_hpcp_index                 ),
  .cp0_hpcp_int_disable            (cp0_hpcp_int_disable           ),
  .cp0_hpcp_mcntwen                (cp0_hpcp_mcntwen               ),
  .cp0_hpcp_pmdm                   (cp0_hpcp_pmdm                  ),
  .cp0_hpcp_pmds                   (cp0_hpcp_pmds                  ),
  .cp0_hpcp_pmdu                   (cp0_hpcp_pmdu                  ),
  .cp0_hpcp_wdata                  (cp0_hpcp_wdata                 ),
  .cp0_idu_cskyee                  (cp0_idu_cskyee                 ),
  .cp0_idu_dlb_disable             (cp0_idu_dlb_disable            ),
  .cp0_idu_frm                     (cp0_idu_frm                    ),
  .cp0_idu_fs                      (cp0_idu_fs                     ),
  .cp0_idu_icg_en                  (cp0_idu_icg_en                 ),
  .cp0_idu_iq_bypass_disable       (cp0_idu_iq_bypass_disable      ),
  .cp0_idu_rob_fold_disable        (cp0_idu_rob_fold_disable       ),
  .cp0_idu_src2_fwd_disable        (cp0_idu_src2_fwd_disable       ),
  .cp0_idu_srcv2_fwd_disable       (cp0_idu_srcv2_fwd_disable      ),
  .cp0_idu_vill                    (cp0_idu_vill                   ),
  .cp0_idu_vs                      (cp0_idu_vs                     ),
  .cp0_idu_vstart                  (cp0_idu_vstart                 ),
  .cp0_idu_zero_delay_move_disable (cp0_idu_zero_delay_move_disable),
  .cp0_ifu_bht_en                  (cp0_ifu_bht_en                 ),
  .cp0_ifu_bht_inv                 (cp0_ifu_bht_inv                ),
  .cp0_ifu_btb_en                  (cp0_ifu_btb_en                 ),
  .cp0_ifu_btb_inv                 (cp0_ifu_btb_inv                ),
  .cp0_ifu_icache_en               (cp0_ifu_icache_en              ),
  .cp0_ifu_icache_inv              (cp0_ifu_icache_inv             ),
  .cp0_ifu_icache_pref_en          (cp0_ifu_icache_pref_en         ),
  .cp0_ifu_icache_read_index       (cp0_ifu_icache_read_index      ),
  .cp0_ifu_icache_read_req         (cp0_ifu_icache_read_req        ),
  .cp0_ifu_icache_read_tag         (cp0_ifu_icache_read_tag        ),
  .cp0_ifu_icache_read_way         (cp0_ifu_icache_read_way        ),
  .cp0_ifu_icg_en                  (cp0_ifu_icg_en                 ),
  .cp0_ifu_ind_btb_en              (cp0_ifu_ind_btb_en             ),
  .cp0_ifu_ind_btb_inv             (cp0_ifu_ind_btb_inv            ),
  .cp0_ifu_insde                   (cp0_ifu_insde                  ),
  .cp0_ifu_iwpe                    (cp0_ifu_iwpe                   ),
  .cp0_ifu_l0btb_en                (cp0_ifu_l0btb_en               ),
  .cp0_ifu_lbuf_en                 (cp0_ifu_lbuf_en                ),
  .cp0_ifu_nsfe                    (cp0_ifu_nsfe                   ),
  .cp0_ifu_ras_en                  (cp0_ifu_ras_en                 ),
  .cp0_ifu_rvbr                    (cp0_ifu_rvbr                   ),
  .cp0_ifu_vbr                     (cp0_ifu_vbr                    ),
  .cp0_ifu_vl                      (cp0_ifu_vl                     ),
  .cp0_ifu_vlmul                   (cp0_ifu_vlmul                  ),
  .cp0_ifu_vsetvli_pred_disable    (cp0_ifu_vsetvli_pred_disable   ),
  .cp0_ifu_vsetvli_pred_mode       (cp0_ifu_vsetvli_pred_mode      ),
  .cp0_ifu_vsew                    (cp0_ifu_vsew                   ),
  .cp0_iu_div_entry_disable        (cp0_iu_div_entry_disable       ),
  .cp0_iu_div_entry_disable_clr    (cp0_iu_div_entry_disable_clr   ),
  .cp0_iu_ex3_efpc                 (cp0_iu_ex3_efpc                ),
  .cp0_iu_ex3_efpc_vld             (cp0_iu_ex3_efpc_vld            ),
  .cp0_iu_icg_en                   (cp0_iu_icg_en                  ),
  .cp0_iu_vill                     (cp0_iu_vill                    ),
  .cp0_iu_vl                       (cp0_iu_vl                      ),
  .cp0_iu_vsetvli_pre_decd_disable (cp0_iu_vsetvli_pre_decd_disable),
  .cp0_iu_vstart                   (cp0_iu_vstart                  ),
  .cp0_lsu_amr                     (cp0_lsu_amr                    ),
  .cp0_lsu_amr2                    (cp0_lsu_amr2                   ),
  .cp0_lsu_cb_aclr_dis             (cp0_lsu_cb_aclr_dis            ),
  .cp0_lsu_corr_dis                (cp0_lsu_corr_dis               ),
  .cp0_lsu_ctc_flush_dis           (cp0_lsu_ctc_flush_dis          ),
  .cp0_lsu_da_fwd_dis              (cp0_lsu_da_fwd_dis             ),
  .cp0_lsu_dcache_clr              (cp0_lsu_dcache_clr             ),
  .cp0_lsu_dcache_en               (cp0_lsu_dcache_en              ),
  .cp0_lsu_dcache_inv              (cp0_lsu_dcache_inv             ),
  .cp0_lsu_dcache_pref_dist        (cp0_lsu_dcache_pref_dist       ),
  .cp0_lsu_dcache_pref_en          (cp0_lsu_dcache_pref_en         ),
  .cp0_lsu_dcache_read_index       (cp0_lsu_dcache_read_index      ),
  .cp0_lsu_dcache_read_ld_tag      (cp0_lsu_dcache_read_ld_tag     ),
  .cp0_lsu_dcache_read_req         (cp0_lsu_dcache_read_req        ),
  .cp0_lsu_dcache_read_st_tag      (cp0_lsu_dcache_read_st_tag     ),
  .cp0_lsu_dcache_read_way         (cp0_lsu_dcache_read_way        ),
  .cp0_lsu_fencei_broad_dis        (cp0_lsu_fencei_broad_dis       ),
  .cp0_lsu_fencerw_broad_dis       (cp0_lsu_fencerw_broad_dis      ),
  .cp0_lsu_icg_en                  (cp0_lsu_icg_en                 ),
  .cp0_lsu_l2_pref_dist            (cp0_lsu_l2_pref_dist           ),
  .cp0_lsu_l2_pref_en              (cp0_lsu_l2_pref_en             ),
  .cp0_lsu_l2_st_pref_en           (cp0_lsu_l2_st_pref_en          ),
  .cp0_lsu_mm                      (cp0_lsu_mm                     ),
  .cp0_lsu_nsfe                    (cp0_lsu_nsfe                   ),
  .cp0_lsu_pfu_mmu_dis             (cp0_lsu_pfu_mmu_dis            ),
  .cp0_lsu_timeout_cnt             (cp0_lsu_timeout_cnt            ),
  .cp0_lsu_tlb_broad_dis           (cp0_lsu_tlb_broad_dis          ),
  .cp0_lsu_tvm                     (cp0_lsu_tvm                    ),
  .cp0_lsu_ucme                    (cp0_lsu_ucme                   ),
  .cp0_lsu_vstart                  (cp0_lsu_vstart                 ),
  .cp0_lsu_wa                      (cp0_lsu_wa                     ),
  .cp0_lsu_wr_burst_dis            (cp0_lsu_wr_burst_dis           ),
  .cp0_mmu_cskyee                  (cp0_mmu_cskyee                 ),
  .cp0_mmu_icg_en                  (cp0_mmu_icg_en                 ),
  .cp0_mmu_maee                    (cp0_mmu_maee                   ),
  .cp0_mmu_mpp                     (cp0_mmu_mpp                    ),
  .cp0_mmu_mprv                    (cp0_mmu_mprv                   ),
  .cp0_mmu_mxr                     (cp0_mmu_mxr                    ),
  .cp0_mmu_ptw_en                  (cp0_mmu_ptw_en                 ),
  .cp0_mmu_reg_num                 (cp0_mmu_reg_num                ),
  .cp0_mmu_satp_sel                (cp0_mmu_satp_sel               ),
  .cp0_mmu_sum                     (cp0_mmu_sum                    ),
  .cp0_mmu_wdata                   (cp0_mmu_wdata                  ),
  .cp0_mmu_wreg                    (cp0_mmu_wreg                   ),
  .cp0_mret                        (cp0_mret                       ),
  .cp0_pad_mstatus                 (cp0_pad_mstatus                ),
  .cp0_pmp_icg_en                  (cp0_pmp_icg_en                 ),
  .cp0_pmp_mpp                     (cp0_pmp_mpp                    ),
  .cp0_pmp_mprv                    (cp0_pmp_mprv                   ),
  .cp0_pmp_reg_num                 (cp0_pmp_reg_num                ),
  .cp0_pmp_wdata                   (cp0_pmp_wdata                  ),
  .cp0_pmp_wreg                    (cp0_pmp_wreg                   ),
  .cp0_rtu_icg_en                  (cp0_rtu_icg_en                 ),
  .cp0_rtu_srt_en                  (cp0_rtu_srt_en                 ),
  .cp0_sret                        (cp0_sret                       ),
  .cp0_vfpu_fcsr                   (cp0_vfpu_fcsr                  ),
  .cp0_vfpu_fxcr                   (cp0_vfpu_fxcr                  ),
  .cp0_vfpu_icg_en                 (cp0_vfpu_icg_en                ),
  .cp0_vfpu_vl                     (cp0_vfpu_vl                    ),
  .cp0_xx_core_icg_en              (cp0_xx_core_icg_en             ),
  .cp0_yy_clk_en                   (cp0_yy_clk_en                  ),
  .cp0_yy_dcache_pref_en           (cp0_yy_dcache_pref_en          ),
  .cp0_yy_hyper                    (cp0_yy_hyper                   ),
  .cp0_yy_priv_mode                (cp0_yy_priv_mode               ),
  .cp0_yy_virtual_mode             (cp0_yy_virtual_mode            ),
  .cpurst_b                        (cpurst_b                       ),
  .forever_cpuclk                  (forever_cpuclk                 ),
  .hpcp_cp0_data                   (hpcp_cp0_data                  ),
  .hpcp_cp0_int_vld                (hpcp_cp0_int_vld               ),
  .hpcp_cp0_sce                    (hpcp_cp0_sce                   ),
  .idu_cp0_fesr_acc_updt_val       (idu_cp0_fesr_acc_updt_val      ),
  .idu_cp0_fesr_acc_updt_vld       (idu_cp0_fesr_acc_updt_vld      ),
  .ifu_cp0_bht_inv_done            (ifu_cp0_bht_inv_done           ),
  .ifu_cp0_btb_inv_done            (ifu_cp0_btb_inv_done           ),
  .ifu_cp0_icache_inv_done         (ifu_cp0_icache_inv_done        ),
  .ifu_cp0_icache_read_data        (ifu_cp0_icache_read_data       ),
  .ifu_cp0_icache_read_data_vld    (ifu_cp0_icache_read_data_vld   ),
  .ifu_cp0_ind_btb_inv_done        (ifu_cp0_ind_btb_inv_done       ),
  .ifu_cp0_rst_inv_req             (ifu_cp0_rst_inv_req            ),
  .iui_regs_addr                   (iui_regs_addr                  ),
  .iui_regs_csr_wr                 (iui_regs_csr_wr                ),
  .iui_regs_csrw                   (iui_regs_csrw                  ),
  .iui_regs_ex3_inst_csr           (iui_regs_ex3_inst_csr          ),
  .iui_regs_inst_mret              (iui_regs_inst_mret             ),
  .iui_regs_inst_sret              (iui_regs_inst_sret             ),
  .iui_regs_inv_expt               (iui_regs_inv_expt              ),
  .iui_regs_opcode                 (iui_regs_opcode                ),
  .iui_regs_ori_src0               (iui_regs_ori_src0              ),
  .iui_regs_rst_inv_d              (iui_regs_rst_inv_d             ),
  .iui_regs_rst_inv_i              (iui_regs_rst_inv_i             ),
  .iui_regs_sel                    (iui_regs_sel                   ),
  .iui_regs_src0                   (iui_regs_src0                  ),
  .lsu_cp0_dcache_done             (lsu_cp0_dcache_done            ),
  .lsu_cp0_dcache_read_data        (lsu_cp0_dcache_read_data       ),
  .lsu_cp0_dcache_read_data_vld    (lsu_cp0_dcache_read_data_vld   ),
  .mmu_cp0_data                    (mmu_cp0_data                   ),
  .mmu_cp0_satp_data               (mmu_cp0_satp_data              ),
  .pad_yy_icg_scan_en              (pad_yy_icg_scan_en             ),
  .pmp_cp0_data                    (pmp_cp0_data                   ),
  .regs_iui_cfr_no_op              (regs_iui_cfr_no_op             ),
  .regs_iui_chk_vld                (regs_iui_chk_vld               ),
  .regs_iui_cindex_l2              (regs_iui_cindex_l2             ),
  .regs_iui_cins_no_op             (regs_iui_cins_no_op            ),
  .regs_iui_cskyee                 (regs_iui_cskyee                ),
  .regs_iui_data_out               (regs_iui_data_out              ),
  .regs_iui_dca_sel                (regs_iui_dca_sel               ),
  .regs_iui_fs_off                 (regs_iui_fs_off                ),
  .regs_iui_hpcp_regs_sel          (regs_iui_hpcp_regs_sel         ),
  .regs_iui_hpcp_scr_inv           (regs_iui_hpcp_scr_inv          ),
  .regs_iui_int_sel                (regs_iui_int_sel               ),
  .regs_iui_l2_regs_sel            (regs_iui_l2_regs_sel           ),
  .regs_iui_pm                     (regs_iui_pm                    ),
  .regs_iui_reg_idx                (regs_iui_reg_idx               ),
  .regs_iui_scnt_inv               (regs_iui_scnt_inv              ),
  .regs_iui_tee_ff                 (regs_iui_tee_ff                ),
  .regs_iui_tee_vld                (regs_iui_tee_vld               ),
  .regs_iui_tsr                    (regs_iui_tsr                   ),
  .regs_iui_tvm                    (regs_iui_tvm                   ),
  .regs_iui_tw                     (regs_iui_tw                    ),
  .regs_iui_ucnt_inv               (regs_iui_ucnt_inv              ),
  .regs_iui_v                      (regs_iui_v                     ),
  .regs_iui_vs_off                 (regs_iui_vs_off                ),
  .regs_iui_wdata                  (regs_iui_wdata                 ),
  .regs_lpmd_int_vld               (regs_lpmd_int_vld              ),
  .regs_xx_icg_en                  (regs_xx_icg_en                 ),
  .rtu_cp0_epc                     (rtu_cp0_epc                    ),
  .rtu_cp0_expt_gateclk_vld        (rtu_cp0_expt_gateclk_vld       ),
  .rtu_cp0_expt_mtval              (rtu_cp0_expt_mtval             ),
  .rtu_cp0_expt_vld                (rtu_cp0_expt_vld               ),
  .rtu_cp0_fp_dirty_vld            (rtu_cp0_fp_dirty_vld           ),
  .rtu_cp0_int_ack                 (rtu_cp0_int_ack                ),
  .rtu_cp0_vec_dirty_vld           (rtu_cp0_vec_dirty_vld          ),
  .rtu_cp0_vsetvl_vill             (rtu_cp0_vsetvl_vill            ),
  .rtu_cp0_vsetvl_vl               (rtu_cp0_vsetvl_vl              ),
  .rtu_cp0_vsetvl_vl_vld           (rtu_cp0_vsetvl_vl_vld          ),
  .rtu_cp0_vsetvl_vlmul            (rtu_cp0_vsetvl_vlmul           ),
  .rtu_cp0_vsetvl_vsew             (rtu_cp0_vsetvl_vsew            ),
  .rtu_cp0_vsetvl_vtype_vld        (rtu_cp0_vsetvl_vtype_vld       ),
  .rtu_cp0_vstart                  (rtu_cp0_vstart                 ),
  .rtu_cp0_vstart_vld              (rtu_cp0_vstart_vld             ),
  .rtu_yy_xx_expt_vec              (rtu_yy_xx_expt_vec             ),
  .rtu_yy_xx_flush                 (rtu_yy_xx_flush                )
);


// &Instance("ct_cp0_lpmd", "x_ct_cp0_lpmd"); @36
ct_cp0_lpmd  x_ct_cp0_lpmd (
  .biu_yy_xx_no_op    (biu_yy_xx_no_op   ),
  .cp0_biu_lpmd_b     (cp0_biu_lpmd_b    ),
  .cp0_had_lpmd_b     (cp0_had_lpmd_b    ),
  .cp0_ifu_no_op_req  (cp0_ifu_no_op_req ),
  .cp0_lsu_no_op_req  (cp0_lsu_no_op_req ),
  .cp0_mmu_no_op_req  (cp0_mmu_no_op_req ),
  .cp0_yy_clk_en      (cp0_yy_clk_en     ),
  .cpurst_b           (cpurst_b          ),
  .forever_cpuclk     (forever_cpuclk    ),
  .had_cp0_xx_dbg     (had_cp0_xx_dbg    ),
  .ifu_yy_xx_no_op    (ifu_yy_xx_no_op   ),
  .inst_lpmd_ex1_ex2  (inst_lpmd_ex1_ex2 ),
  .lpmd_cmplt         (lpmd_cmplt        ),
  .lpmd_top_cur_state (lpmd_top_cur_state),
  .lsu_yy_xx_no_op    (lsu_yy_xx_no_op   ),
  .mmu_yy_xx_no_op    (mmu_yy_xx_no_op   ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en),
  .regs_lpmd_int_vld  (regs_lpmd_int_vld ),
  .regs_xx_icg_en     (regs_xx_icg_en    ),
  .rtu_yy_xx_dbgon    (rtu_yy_xx_dbgon   ),
  .rtu_yy_xx_flush    (rtu_yy_xx_flush   )
);


assign cp0_had_debug_info[1:0] = iui_top_cur_state[1:0];
assign cp0_had_debug_info[3:2] = lpmd_top_cur_state[1:0];

// //&Force("nonport","mp_lpmd"); @143
// //&Force("nonport","mp_rst_b"); @144
// //&Force("nonport","mp_wakeup"); @145

// &ModuleEnd; @178
endmodule



