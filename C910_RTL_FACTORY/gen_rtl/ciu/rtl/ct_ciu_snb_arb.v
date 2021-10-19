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

// &Depend("ct_fifo.v"); @18

// &ModuleBeg; @20
module ct_ciu_snb_arb(
  ar_crt_entry_index,
  arb_sab_bresp_grant,
  arb_sab_bresp_grant_sid,
  arb_sab_l2c_cmplt,
  arb_sab_l2c_cmplt_sid,
  arb_sab_l2c_cp,
  arb_sab_l2c_data,
  arb_sab_l2c_grant,
  arb_sab_l2c_resp,
  arb_sab_no_l2c_req,
  arb_sab_rresp_grant,
  arb_sab_rresp_grant_sid,
  arb_sdb_ebiu_sel,
  arb_sdb_l2c_sel,
  aw_crt_entry_index,
  bmbif_snb_bar_req,
  bmbif_snb_mid,
  bmbif_snb_req_bus,
  ciu_icg_en,
  cpurst_b,
  ebiuif_snb_acvalid,
  ebiuif_snb_ar_grant,
  ebiuif_snb_ar_grant_gate,
  ebiuif_snb_rvalid,
  ebiuif_snbx_acbus,
  ebiuif_xx_entry_sel,
  ebiuif_xx_rdata,
  ebiuif_xx_rlast,
  ebiuif_xx_rresp,
  forever_cpuclk,
  l2c_snb_addr_grant,
  l2c_snb_cmplt,
  l2c_snb_cmplt_sid,
  l2c_snb_cp,
  l2c_snb_data,
  l2c_snb_data_grant,
  l2c_snb_data_grant_gate,
  l2c_snb_prf_bus,
  l2c_snb_prf_req,
  l2c_snb_resp,
  l2c_snb_snpl2_bus,
  l2c_snb_snpl2_ini_sid,
  l2c_snb_snpl2_req,
  pad_yy_icg_scan_en,
  piu0_snb_ac_grant,
  piu0_snb_ar_bus,
  piu0_snb_ar_req,
  piu0_snb_aw_req,
  piu0_snb_b_grant,
  piu0_snb_back,
  piu0_snb_cr_bus,
  piu0_snb_cr_req,
  piu0_snb_r_grant,
  piu0_snb_rack,
  piu0_snb_wcd_req,
  piu0_snbx_back_sid,
  piu0_snbx_rack_sid,
  piu0_xx_aw_bus,
  piu0_xx_wcd_bus,
  piu1_snb_ac_grant,
  piu1_snb_ar_bus,
  piu1_snb_ar_req,
  piu1_snb_aw_req,
  piu1_snb_b_grant,
  piu1_snb_back,
  piu1_snb_cr_bus,
  piu1_snb_cr_req,
  piu1_snb_r_grant,
  piu1_snb_rack,
  piu1_snb_wcd_req,
  piu1_snbx_back_sid,
  piu1_snbx_rack_sid,
  piu1_xx_aw_bus,
  piu1_xx_wcd_bus,
  piu2_snb_ac_grant,
  piu2_snb_ar_bus,
  piu2_snb_ar_req,
  piu2_snb_aw_req,
  piu2_snb_b_grant,
  piu2_snb_back,
  piu2_snb_cr_bus,
  piu2_snb_cr_req,
  piu2_snb_r_grant,
  piu2_snb_rack,
  piu2_snb_wcd_req,
  piu2_snbx_back_sid,
  piu2_snbx_rack_sid,
  piu2_xx_aw_bus,
  piu2_xx_wcd_bus,
  piu3_snb_ac_grant,
  piu3_snb_ar_bus,
  piu3_snb_ar_req,
  piu3_snb_aw_req,
  piu3_snb_b_grant,
  piu3_snb_back,
  piu3_snb_cr_bus,
  piu3_snb_cr_req,
  piu3_snb_r_grant,
  piu3_snb_rack,
  piu3_snb_wcd_req,
  piu3_snbx_back_sid,
  piu3_snbx_rack_sid,
  piu3_xx_aw_bus,
  piu3_xx_wcd_bus,
  piu4_snb_ar_bus,
  piu4_snb_ar_req,
  piu4_snb_aw_req,
  piu4_snb_b_grant,
  piu4_snb_back,
  piu4_snb_r_grant,
  piu4_snb_rack,
  piu4_snb_wcd_req,
  piu4_snbx_back_sid,
  piu4_snbx_rack_sid,
  piu4_xx_aw_bus,
  piu4_xx_wcd_bus,
  sab_ar_create_bus,
  sab_ar_create_en,
  sab_ar_create_mid,
  sab_ar_create_sel,
  sab_ar_create_snpl2_isid,
  sab_arb_bresp_bus,
  sab_arb_bresp_req,
  sab_arb_ebiu_ar_bus,
  sab_arb_ebiu_ar_req,
  sab_arb_ebiu_aw_bus,
  sab_arb_ebiu_aw_mid,
  sab_arb_ebiu_aw_req,
  sab_arb_ebiu_aw_sel,
  sab_arb_l2c_addr_bus,
  sab_arb_l2c_hpcp_bus,
  sab_arb_l2c_req,
  sab_arb_l2c_sel,
  sab_arb_rresp_ctrl,
  sab_arb_rresp_req,
  sab_aw_create_bus,
  sab_aw_create_en,
  sab_aw_create_mid,
  sab_aw_create_sel,
  sab_back_sel,
  sab_crresp_piu0,
  sab_crresp_piu1,
  sab_crresp_piu2,
  sab_crresp_piu3,
  sab_crvld_piu0,
  sab_crvld_piu1,
  sab_crvld_piu2,
  sab_crvld_piu3,
  sab_entry_busy,
  sab_memr_data,
  sab_memr_grant,
  sab_memr_last,
  sab_memr_resp,
  sab_memr_sel,
  sab_memr_vld,
  sab_memw_aw_grant,
  sab_memw_cmplt,
  sab_memw_cmplt_sel,
  sab_piu0_ac_bus,
  sab_piu0_ac_grant,
  sab_piu0_ac_vld,
  sab_piu1_ac_bus,
  sab_piu1_ac_grant,
  sab_piu1_ac_vld,
  sab_piu2_ac_bus,
  sab_piu2_ac_grant,
  sab_piu2_ac_vld,
  sab_piu3_ac_bus,
  sab_piu3_ac_grant,
  sab_piu3_ac_vld,
  sab_rack_sel,
  sab_snp_bar_cmplt,
  sab_snpext_depd_vld,
  sab_wcd_create_cdsel,
  sab_wcd_create_data,
  sab_wcd_create_en,
  sab_wcd_create_err,
  sab_wcd_create_wstrb,
  sdb_arb_ebiu_w_bus,
  sdb_arb_l2c_data_bus,
  sdb_arb_rresp_data,
  snb1,
  snb_bmbif_bar_grant,
  snb_ebiuif_ac_grant,
  snb_ebiuif_arbus,
  snb_ebiuif_arvalid,
  snb_l2c_addr_bus,
  snb_l2c_addr_req,
  snb_l2c_data_bus,
  snb_l2c_data_req,
  snb_l2c_hpcp_bus,
  snb_l2c_prf_grant,
  snb_l2c_snpl2_grant,
  snb_piu0_acbus,
  snb_piu0_acvalid,
  snb_piu0_ar_grant,
  snb_piu0_aw_grant,
  snb_piu0_bar_cmplt,
  snb_piu0_bvalid,
  snb_piu0_cr_grant,
  snb_piu0_rvalid,
  snb_piu0_wcd_grant,
  snb_piu1_acbus,
  snb_piu1_acvalid,
  snb_piu1_ar_grant,
  snb_piu1_aw_grant,
  snb_piu1_bar_cmplt,
  snb_piu1_bvalid,
  snb_piu1_cr_grant,
  snb_piu1_rvalid,
  snb_piu1_wcd_grant,
  snb_piu2_acbus,
  snb_piu2_acvalid,
  snb_piu2_ar_grant,
  snb_piu2_aw_grant,
  snb_piu2_bar_cmplt,
  snb_piu2_bvalid,
  snb_piu2_cr_grant,
  snb_piu2_rvalid,
  snb_piu2_wcd_grant,
  snb_piu3_acbus,
  snb_piu3_acvalid,
  snb_piu3_ar_grant,
  snb_piu3_aw_grant,
  snb_piu3_bar_cmplt,
  snb_piu3_bvalid,
  snb_piu3_cr_grant,
  snb_piu3_rvalid,
  snb_piu3_wcd_grant,
  snb_piu4_ar_grant,
  snb_piu4_aw_grant,
  snb_piu4_bvalid,
  snb_piu4_rvalid,
  snb_piu4_wcd_grant,
  snb_piux_aw_sid,
  snb_piux_bbus,
  snb_piux_rbus,
  snb_snpext_depd_ebiu,
  snb_snpext_depd_vb,
  snb_vb_awbus,
  snb_vb_awvalid,
  snb_vb_mid,
  snb_vb_vid,
  snb_vb_wbus,
  snb_vb_wvalid,
  snb_xx_no_op,
  snb_yy_snpext_index,
  snpext_cen0_raw,
  snpext_index,
  snpext_vld,
  vb_snb_aw_grant,
  vb_snb_w_grant,
  vb_yy_grant_id
);

// &Ports; @21
input            bmbif_snb_bar_req;          
input   [2  :0]  bmbif_snb_mid;              
input   [8  :0]  bmbif_snb_req_bus;          
input            ciu_icg_en;                 
input            cpurst_b;                   
input            ebiuif_snb_acvalid;         
input            ebiuif_snb_ar_grant;        
input            ebiuif_snb_ar_grant_gate;   
input            ebiuif_snb_rvalid;          
input   [70 :0]  ebiuif_snbx_acbus;          
input   [23 :0]  ebiuif_xx_entry_sel;        
input   [127:0]  ebiuif_xx_rdata;            
input            ebiuif_xx_rlast;            
input   [3  :0]  ebiuif_xx_rresp;            
input            forever_cpuclk;             
input            l2c_snb_addr_grant;         
input            l2c_snb_cmplt;              
input   [4  :0]  l2c_snb_cmplt_sid;          
input   [3  :0]  l2c_snb_cp;                 
input   [511:0]  l2c_snb_data;               
input            l2c_snb_data_grant;         
input            l2c_snb_data_grant_gate;    
input   [70 :0]  l2c_snb_prf_bus;            
input            l2c_snb_prf_req;            
input   [4  :0]  l2c_snb_resp;               
input   [70 :0]  l2c_snb_snpl2_bus;          
input   [4  :0]  l2c_snb_snpl2_ini_sid;      
input            l2c_snb_snpl2_req;          
input            pad_yy_icg_scan_en;         
input            piu0_snb_ac_grant;          
input   [70 :0]  piu0_snb_ar_bus;            
input            piu0_snb_ar_req;            
input            piu0_snb_aw_req;            
input            piu0_snb_b_grant;           
input            piu0_snb_back;              
input   [9  :0]  piu0_snb_cr_bus;            
input            piu0_snb_cr_req;            
input            piu0_snb_r_grant;           
input            piu0_snb_rack;              
input            piu0_snb_wcd_req;           
input   [4  :0]  piu0_snbx_back_sid;         
input   [4  :0]  piu0_snbx_rack_sid;         
input   [70 :0]  piu0_xx_aw_bus;             
input   [534:0]  piu0_xx_wcd_bus;            
input            piu1_snb_ac_grant;          
input   [70 :0]  piu1_snb_ar_bus;            
input            piu1_snb_ar_req;            
input            piu1_snb_aw_req;            
input            piu1_snb_b_grant;           
input            piu1_snb_back;              
input   [9  :0]  piu1_snb_cr_bus;            
input            piu1_snb_cr_req;            
input            piu1_snb_r_grant;           
input            piu1_snb_rack;              
input            piu1_snb_wcd_req;           
input   [4  :0]  piu1_snbx_back_sid;         
input   [4  :0]  piu1_snbx_rack_sid;         
input   [70 :0]  piu1_xx_aw_bus;             
input   [534:0]  piu1_xx_wcd_bus;            
input            piu2_snb_ac_grant;          
input   [70 :0]  piu2_snb_ar_bus;            
input            piu2_snb_ar_req;            
input            piu2_snb_aw_req;            
input            piu2_snb_b_grant;           
input            piu2_snb_back;              
input   [9  :0]  piu2_snb_cr_bus;            
input            piu2_snb_cr_req;            
input            piu2_snb_r_grant;           
input            piu2_snb_rack;              
input            piu2_snb_wcd_req;           
input   [4  :0]  piu2_snbx_back_sid;         
input   [4  :0]  piu2_snbx_rack_sid;         
input   [70 :0]  piu2_xx_aw_bus;             
input   [534:0]  piu2_xx_wcd_bus;            
input            piu3_snb_ac_grant;          
input   [70 :0]  piu3_snb_ar_bus;            
input            piu3_snb_ar_req;            
input            piu3_snb_aw_req;            
input            piu3_snb_b_grant;           
input            piu3_snb_back;              
input   [9  :0]  piu3_snb_cr_bus;            
input            piu3_snb_cr_req;            
input            piu3_snb_r_grant;           
input            piu3_snb_rack;              
input            piu3_snb_wcd_req;           
input   [4  :0]  piu3_snbx_back_sid;         
input   [4  :0]  piu3_snbx_rack_sid;         
input   [70 :0]  piu3_xx_aw_bus;             
input   [534:0]  piu3_xx_wcd_bus;            
input   [70 :0]  piu4_snb_ar_bus;            
input            piu4_snb_ar_req;            
input            piu4_snb_aw_req;            
input            piu4_snb_b_grant;           
input            piu4_snb_back;              
input            piu4_snb_r_grant;           
input            piu4_snb_rack;              
input            piu4_snb_wcd_req;           
input   [4  :0]  piu4_snbx_back_sid;         
input   [4  :0]  piu4_snbx_rack_sid;         
input   [70 :0]  piu4_xx_aw_bus;             
input   [534:0]  piu4_xx_wcd_bus;            
input   [14 :0]  sab_arb_bresp_bus;          
input            sab_arb_bresp_req;          
input   [68 :0]  sab_arb_ebiu_ar_bus;        
input            sab_arb_ebiu_ar_req;        
input   [67 :0]  sab_arb_ebiu_aw_bus;        
input   [2  :0]  sab_arb_ebiu_aw_mid;        
input            sab_arb_ebiu_aw_req;        
input   [23 :0]  sab_arb_ebiu_aw_sel;        
input   [63 :0]  sab_arb_l2c_addr_bus;       
input   [2  :0]  sab_arb_l2c_hpcp_bus;       
input            sab_arb_l2c_req;            
input   [23 :0]  sab_arb_l2c_sel;            
input   [23 :0]  sab_arb_rresp_ctrl;         
input            sab_arb_rresp_req;          
input   [23 :0]  sab_entry_busy;             
input   [54 :0]  sab_piu0_ac_bus;            
input            sab_piu0_ac_vld;            
input   [54 :0]  sab_piu1_ac_bus;            
input            sab_piu1_ac_vld;            
input   [54 :0]  sab_piu2_ac_bus;            
input            sab_piu2_ac_vld;            
input   [54 :0]  sab_piu3_ac_bus;            
input            sab_piu3_ac_vld;            
input   [3  :0]  sab_snp_bar_cmplt;          
input            sab_snpext_depd_vld;        
input   [534:0]  sdb_arb_ebiu_w_bus;         
input   [511:0]  sdb_arb_l2c_data_bus;       
input   [511:0]  sdb_arb_rresp_data;         
input            snb1;                       
input            snb_snpext_depd_ebiu;       
input            snb_snpext_depd_vb;         
input            vb_snb_aw_grant;            
input            vb_snb_w_grant;             
input   [1  :0]  vb_yy_grant_id;             
output  [6  :0]  ar_crt_entry_index;         
output           arb_sab_bresp_grant;        
output  [4  :0]  arb_sab_bresp_grant_sid;    
output           arb_sab_l2c_cmplt;          
output  [4  :0]  arb_sab_l2c_cmplt_sid;      
output  [3  :0]  arb_sab_l2c_cp;             
output  [511:0]  arb_sab_l2c_data;           
output           arb_sab_l2c_grant;          
output  [4  :0]  arb_sab_l2c_resp;           
output           arb_sab_no_l2c_req;         
output           arb_sab_rresp_grant;        
output  [4  :0]  arb_sab_rresp_grant_sid;    
output  [23 :0]  arb_sdb_ebiu_sel;           
output  [23 :0]  arb_sdb_l2c_sel;            
output  [6  :0]  aw_crt_entry_index;         
output  [70 :0]  sab_ar_create_bus;          
output           sab_ar_create_en;           
output  [2  :0]  sab_ar_create_mid;          
output  [15 :0]  sab_ar_create_sel;          
output  [4  :0]  sab_ar_create_snpl2_isid;   
output  [70 :0]  sab_aw_create_bus;          
output           sab_aw_create_en;           
output  [2  :0]  sab_aw_create_mid;          
output  [7  :0]  sab_aw_create_sel;          
output  [23 :0]  sab_back_sel;               
output  [4  :0]  sab_crresp_piu0;            
output  [4  :0]  sab_crresp_piu1;            
output  [4  :0]  sab_crresp_piu2;            
output  [4  :0]  sab_crresp_piu3;            
output  [23 :0]  sab_crvld_piu0;             
output  [23 :0]  sab_crvld_piu1;             
output  [23 :0]  sab_crvld_piu2;             
output  [23 :0]  sab_crvld_piu3;             
output  [127:0]  sab_memr_data;              
output           sab_memr_grant;             
output           sab_memr_last;              
output  [3  :0]  sab_memr_resp;              
output  [23 :0]  sab_memr_sel;               
output           sab_memr_vld;               
output           sab_memw_aw_grant;          
output           sab_memw_cmplt;             
output  [23 :0]  sab_memw_cmplt_sel;         
output           sab_piu0_ac_grant;          
output           sab_piu1_ac_grant;          
output           sab_piu2_ac_grant;          
output           sab_piu3_ac_grant;          
output  [23 :0]  sab_rack_sel;               
output  [3  :0]  sab_wcd_create_cdsel;       
output  [511:0]  sab_wcd_create_data;        
output  [23 :0]  sab_wcd_create_en;          
output           sab_wcd_create_err;         
output  [15 :0]  sab_wcd_create_wstrb;       
output           snb_bmbif_bar_grant;        
output           snb_ebiuif_ac_grant;        
output  [68 :0]  snb_ebiuif_arbus;           
output           snb_ebiuif_arvalid;         
output  [63 :0]  snb_l2c_addr_bus;           
output           snb_l2c_addr_req;           
output  [511:0]  snb_l2c_data_bus;           
output           snb_l2c_data_req;           
output  [2  :0]  snb_l2c_hpcp_bus;           
output           snb_l2c_prf_grant;          
output           snb_l2c_snpl2_grant;        
output  [54 :0]  snb_piu0_acbus;             
output           snb_piu0_acvalid;           
output           snb_piu0_ar_grant;          
output           snb_piu0_aw_grant;          
output           snb_piu0_bar_cmplt;         
output           snb_piu0_bvalid;            
output           snb_piu0_cr_grant;          
output           snb_piu0_rvalid;            
output           snb_piu0_wcd_grant;         
output  [54 :0]  snb_piu1_acbus;             
output           snb_piu1_acvalid;           
output           snb_piu1_ar_grant;          
output           snb_piu1_aw_grant;          
output           snb_piu1_bar_cmplt;         
output           snb_piu1_bvalid;            
output           snb_piu1_cr_grant;          
output           snb_piu1_rvalid;            
output           snb_piu1_wcd_grant;         
output  [54 :0]  snb_piu2_acbus;             
output           snb_piu2_acvalid;           
output           snb_piu2_ar_grant;          
output           snb_piu2_aw_grant;          
output           snb_piu2_bar_cmplt;         
output           snb_piu2_bvalid;            
output           snb_piu2_cr_grant;          
output           snb_piu2_rvalid;            
output           snb_piu2_wcd_grant;         
output  [54 :0]  snb_piu3_acbus;             
output           snb_piu3_acvalid;           
output           snb_piu3_ar_grant;          
output           snb_piu3_aw_grant;          
output           snb_piu3_bar_cmplt;         
output           snb_piu3_bvalid;            
output           snb_piu3_cr_grant;          
output           snb_piu3_rvalid;            
output           snb_piu3_wcd_grant;         
output           snb_piu4_ar_grant;          
output           snb_piu4_aw_grant;          
output           snb_piu4_bvalid;            
output           snb_piu4_rvalid;            
output           snb_piu4_wcd_grant;         
output  [4  :0]  snb_piux_aw_sid;            
output  [13 :0]  snb_piux_bbus;              
output  [534:0]  snb_piux_rbus;              
output  [67 :0]  snb_vb_awbus;               
output           snb_vb_awvalid;             
output  [2  :0]  snb_vb_mid;                 
output  [1  :0]  snb_vb_vid;                 
output  [534:0]  snb_vb_wbus;                
output           snb_vb_wvalid;              
output           snb_xx_no_op;               
output  [7  :0]  snb_yy_snpext_index;        
output  [15 :0]  snpext_cen0_raw;            
output  [6  :0]  snpext_index;               
output           snpext_vld;                 

// &Regs; @22
reg     [70 :0]  ar_create_bus;              
reg     [2  :0]  ar_create_mid;              
reg     [68 :0]  ebiu_ar_buf_cont;           
reg              ebiu_ar_buf_vld;            
reg     [67 :0]  ebiu_aw_buf_cont;           
reg     [2  :0]  ebiu_aw_buf_mid;            
reg     [23 :0]  ebiu_aw_buf_sdb_sel;        
reg              ebiu_aw_buf_vld;            
reg     [534:0]  ebiu_w_buf_cont;            
reg     [23 :0]  ebiu_w_buf_sel;             
reg     [1  :0]  ebiu_w_buf_vid;             
reg              ebiu_w_buf_vld;             
reg     [511:0]  l2c_data_buf_cont;          
reg              l2c_data_buf_vld;           
reg     [63 :0]  l2c_pop_entry_addr_bus;     
reg     [2  :0]  l2c_pop_entry_hpcp_bus;     
reg     [23 :0]  l2c_pop_entry_sel;          
reg              l2c_pop_entry_vld;          
reg     [54 :0]  piu0_ac_buf_cont;           
reg              piu0_ac_buf_vld;            
reg     [54 :0]  piu1_ac_buf_cont;           
reg              piu1_ac_buf_vld;            
reg     [54 :0]  piu2_ac_buf_cont;           
reg              piu2_ac_buf_vld;            
reg     [54 :0]  piu3_ac_buf_cont;           
reg              piu3_ac_buf_vld;            
reg     [23 :0]  rresp_buf_sab_cont;         
reg     [511:0]  rresp_buf_sdb_cont;         
reg              rresp_buf_vld;              
reg     [70 :0]  sab_ar_crt_entry_bus;       
reg     [4  :0]  sab_ar_crt_entry_ini_sid;   
reg     [2  :0]  sab_ar_crt_entry_mid;       
reg     [15 :0]  sab_ar_crt_entry_sid_sel;   
reg              sab_ar_crt_entry_vld;       
reg     [70 :0]  sab_aw_crt_entry_bus;       
reg     [2  :0]  sab_aw_crt_entry_mid;       
reg     [7  :0]  sab_aw_crt_entry_sid_sel;   
reg              sab_aw_crt_entry_vld;       
reg     [15 :0]  sab_create0_sel;            
reg     [7  :0]  sab_create1_sel;            
reg     [534:0]  sab_wcd_crt_entry_bus;      
reg     [23 :0]  sab_wcd_crt_entry_sid_sel;  
reg              sab_wcd_crt_entry_vld;      
reg     [3  :0]  sab_wcd_crt_piu_sel;        

// &Wires; @23
wire             ac_ctrl_clk;                
wire             ac_ctrl_clk_en;             
wire             ar_create_en;               
wire             ar_create_en_dp;            
wire    [6  :0]  ar_crt_entry_index;         
wire             ar_prio_clk;                
wire             ar_prio_clk_en;             
wire             arb_sab_bresp_grant;        
wire    [4  :0]  arb_sab_bresp_grant_sid;    
wire             arb_sab_l2c_cmplt;          
wire    [4  :0]  arb_sab_l2c_cmplt_sid;      
wire    [3  :0]  arb_sab_l2c_cp;             
wire    [511:0]  arb_sab_l2c_data;           
wire             arb_sab_l2c_grant;          
wire    [4  :0]  arb_sab_l2c_resp;           
wire             arb_sab_no_l2c_req;         
wire             arb_sab_rresp_grant;        
wire    [4  :0]  arb_sab_rresp_grant_sid;    
wire    [23 :0]  arb_sdb_ebiu_sel;           
wire    [23 :0]  arb_sdb_l2c_sel;            
wire    [70 :0]  aw_bar_bus;                 
wire             aw_bar_clr;                 
wire             aw_bar_create_en;           
wire    [2  :0]  aw_bar_mid;                 
wire    [5  :0]  aw_bar_req;                 
wire    [5  :0]  aw_bar_sel;                 
wire             aw_bar_vld;                 
wire             aw_bar_wns;                 
wire             aw_crt_entry_bar;           
wire    [6  :0]  aw_crt_entry_index;         
wire             aw_prio_clk;                
wire             aw_prio_clk_en;             
wire    [1  :0]  bar_domain;                 
wire    [4  :0]  bar_id;                     
wire    [1  :0]  bar_type;                   
wire    [70 :0]  bmbif_req_bus;              
wire             bmbif_snb_bar_req;          
wire    [2  :0]  bmbif_snb_mid;              
wire    [8  :0]  bmbif_snb_req_bus;          
wire             bresp_req_vld;              
wire             cd_prio_clk;                
wire             cd_prio_clk_en;             
wire             ciu_icg_en;                 
wire             cpurst_b;                   
wire             ebiu_ar_buf_clk;            
wire             ebiu_ar_buf_clk_en;         
wire             ebiu_ar_buf_create_en;      
wire             ebiu_ar_buf_create_en_gate; 
wire             ebiu_ar_buf_idle;           
wire             ebiu_ar_buf_pop_en;         
wire             ebiu_aw_buf_clk;            
wire             ebiu_aw_buf_clk_en;         
wire             ebiu_aw_buf_create_en;      
wire             ebiu_aw_buf_idle;           
wire             ebiu_aw_buf_pop_en;         
wire    [23 :0]  ebiu_aw_buf_sdb_sel_after;  
wire    [25 :0]  ebiu_sel_fifo_create_bus;   
wire             ebiu_sel_fifo_create_en;    
wire             ebiu_sel_fifo_full;         
wire    [25 :0]  ebiu_sel_fifo_pop_bus;      
wire             ebiu_sel_fifo_pop_bus_vld;  
wire             ebiu_sel_fifo_pop_en;       
wire             ebiu_w_buf_clk;             
wire             ebiu_w_buf_clk_en;          
wire             ebiu_w_buf_create_en;       
wire             ebiu_w_buf_idle;            
wire             ebiu_w_buf_pop_en;          
wire             ebiuif_snb_acvalid;         
wire             ebiuif_snb_ar_grant;        
wire             ebiuif_snb_ar_grant_gate;   
wire             ebiuif_snb_rvalid;          
wire    [70 :0]  ebiuif_snbx_acbus;          
wire    [23 :0]  ebiuif_xx_entry_sel;        
wire    [127:0]  ebiuif_xx_rdata;            
wire             ebiuif_xx_rlast;            
wire    [3  :0]  ebiuif_xx_rresp;            
wire             forever_cpuclk;             
wire             l2c_buf_clk;                
wire             l2c_buf_clk_en;             
wire             l2c_data_buf_create_en;     
wire             l2c_data_buf_create_en_gate; 
wire             l2c_data_buf_idle;          
wire             l2c_data_buf_pop_en;        
wire             l2c_pop_clk;                
wire             l2c_pop_clk_en;             
wire             l2c_pop_entry_clr;          
wire             l2c_pop_entry_idle;         
wire             l2c_pop_entry_wen;          
wire             l2c_sel_fifo_create_en;     
wire    [23 :0]  l2c_sel_fifo_pop_bus;       
wire             l2c_sel_fifo_pop_bus_vld;   
wire             l2c_sel_fifo_pop_en;        
wire             l2c_snb_addr_grant;         
wire             l2c_snb_cmplt;              
wire    [4  :0]  l2c_snb_cmplt_sid;          
wire    [3  :0]  l2c_snb_cp;                 
wire    [511:0]  l2c_snb_data;               
wire             l2c_snb_data_grant;         
wire             l2c_snb_data_grant_gate;    
wire    [70 :0]  l2c_snb_prf_bus;            
wire             l2c_snb_prf_req;            
wire    [4  :0]  l2c_snb_resp;               
wire    [70 :0]  l2c_snb_snpl2_bus;          
wire    [4  :0]  l2c_snb_snpl2_ini_sid;      
wire             l2c_snb_snpl2_req;          
wire             pad_yy_icg_scan_en;         
wire             piu0_ac_buf_clk;            
wire             piu0_ac_buf_clk_en;         
wire             piu0_ac_buf_create_en;      
wire             piu0_ac_buf_pop_en;         
wire             piu0_cd_req;                
wire             piu0_snb_ac_grant;          
wire    [70 :0]  piu0_snb_ar_bus;            
wire             piu0_snb_ar_req;            
wire             piu0_snb_aw_req;            
wire             piu0_snb_b_grant;           
wire             piu0_snb_back;              
wire    [9  :0]  piu0_snb_cr_bus;            
wire             piu0_snb_cr_req;            
wire             piu0_snb_r_grant;           
wire             piu0_snb_rack;              
wire             piu0_snb_wcd_req;           
wire    [4  :0]  piu0_snbx_back_sid;         
wire    [4  :0]  piu0_snbx_rack_sid;         
wire    [70 :0]  piu0_xx_aw_bus;             
wire    [534:0]  piu0_xx_wcd_bus;            
wire             piu1_ac_buf_clk;            
wire             piu1_ac_buf_clk_en;         
wire             piu1_ac_buf_create_en;      
wire             piu1_ac_buf_pop_en;         
wire             piu1_cd_req;                
wire             piu1_snb_ac_grant;          
wire    [70 :0]  piu1_snb_ar_bus;            
wire             piu1_snb_ar_req;            
wire             piu1_snb_aw_req;            
wire             piu1_snb_b_grant;           
wire             piu1_snb_back;              
wire    [9  :0]  piu1_snb_cr_bus;            
wire             piu1_snb_cr_req;            
wire             piu1_snb_r_grant;           
wire             piu1_snb_rack;              
wire             piu1_snb_wcd_req;           
wire    [4  :0]  piu1_snbx_back_sid;         
wire    [4  :0]  piu1_snbx_rack_sid;         
wire    [70 :0]  piu1_xx_aw_bus;             
wire    [534:0]  piu1_xx_wcd_bus;            
wire             piu2_ac_buf_clk;            
wire             piu2_ac_buf_clk_en;         
wire             piu2_ac_buf_create_en;      
wire             piu2_ac_buf_pop_en;         
wire             piu2_cd_req;                
wire             piu2_snb_ac_grant;          
wire    [70 :0]  piu2_snb_ar_bus;            
wire             piu2_snb_ar_req;            
wire             piu2_snb_aw_req;            
wire             piu2_snb_b_grant;           
wire             piu2_snb_back;              
wire    [9  :0]  piu2_snb_cr_bus;            
wire             piu2_snb_cr_req;            
wire             piu2_snb_r_grant;           
wire             piu2_snb_rack;              
wire             piu2_snb_wcd_req;           
wire    [4  :0]  piu2_snbx_back_sid;         
wire    [4  :0]  piu2_snbx_rack_sid;         
wire    [70 :0]  piu2_xx_aw_bus;             
wire    [534:0]  piu2_xx_wcd_bus;            
wire             piu3_ac_buf_clk;            
wire             piu3_ac_buf_clk_en;         
wire             piu3_ac_buf_create_en;      
wire             piu3_ac_buf_pop_en;         
wire             piu3_cd_req;                
wire             piu3_snb_ac_grant;          
wire    [70 :0]  piu3_snb_ar_bus;            
wire             piu3_snb_ar_req;            
wire             piu3_snb_aw_req;            
wire             piu3_snb_b_grant;           
wire             piu3_snb_back;              
wire    [9  :0]  piu3_snb_cr_bus;            
wire             piu3_snb_cr_req;            
wire             piu3_snb_r_grant;           
wire             piu3_snb_rack;              
wire             piu3_snb_wcd_req;           
wire    [4  :0]  piu3_snbx_back_sid;         
wire    [4  :0]  piu3_snbx_rack_sid;         
wire    [70 :0]  piu3_xx_aw_bus;             
wire    [534:0]  piu3_xx_wcd_bus;            
wire             piu4_cd_req;                
wire    [70 :0]  piu4_snb_ar_bus;            
wire             piu4_snb_ar_req;            
wire             piu4_snb_aw_req;            
wire             piu4_snb_b_grant;           
wire             piu4_snb_back;              
wire             piu4_snb_r_grant;           
wire             piu4_snb_rack;              
wire             piu4_snb_wcd_req;           
wire    [4  :0]  piu4_snbx_back_sid;         
wire    [4  :0]  piu4_snbx_rack_sid;         
wire    [70 :0]  piu4_xx_aw_bus;             
wire    [534:0]  piu4_xx_wcd_bus;            
wire    [70 :0]  piu_ar_bus;                 
wire             piu_ar_create_en;           
wire    [2  :0]  piu_ar_mid;                 
wire             piu_ar_req;                 
wire             piu_ar_req_vld;             
wire    [5  :0]  piu_ar_valid;               
wire    [2  :0]  piu_aw_mid;                 
wire    [4  :0]  piu_cd_req;                 
wire             piu_r_grant;                
wire    [4  :0]  piu_sab_ar_req;             
wire    [4  :0]  piu_sab_b_grant;            
wire    [4  :0]  piu_sab_r_grant;            
wire             rresp_buf_clk;              
wire             rresp_buf_clk_en;           
wire             rresp_buf_idle;             
wire             rresp_buf_pop;              
wire             rresp_buf_wen;              
wire             rresp_req_vld;              
wire             sab_ar_clr;                 
wire    [70 :0]  sab_ar_create_bus;          
wire             sab_ar_create_en;           
wire    [2  :0]  sab_ar_create_mid;          
wire    [15 :0]  sab_ar_create_sel;          
wire    [4  :0]  sab_ar_create_snpl2_isid;   
wire    [5  :0]  sab_ar_sel;                 
wire    [2  :0]  sab_ar_valid;               
wire    [14 :0]  sab_arb_bresp_bus;          
wire             sab_arb_bresp_req;          
wire    [68 :0]  sab_arb_ebiu_ar_bus;        
wire             sab_arb_ebiu_ar_req;        
wire    [67 :0]  sab_arb_ebiu_aw_bus;        
wire    [2  :0]  sab_arb_ebiu_aw_mid;        
wire             sab_arb_ebiu_aw_req;        
wire    [23 :0]  sab_arb_ebiu_aw_sel;        
wire    [63 :0]  sab_arb_l2c_addr_bus;       
wire    [2  :0]  sab_arb_l2c_hpcp_bus;       
wire             sab_arb_l2c_req;            
wire    [23 :0]  sab_arb_l2c_sel;            
wire    [23 :0]  sab_arb_rresp_ctrl;         
wire             sab_arb_rresp_req;          
wire             sab_aw_create_bar;          
wire    [70 :0]  sab_aw_create_bus;          
wire             sab_aw_create_en;           
wire             sab_aw_create_evict;        
wire    [2  :0]  sab_aw_create_mid;          
wire    [7  :0]  sab_aw_create_sel;          
wire    [23 :0]  sab_back_sel;               
wire    [23 :0]  sab_back_sel0;              
wire    [23 :0]  sab_back_sel1;              
wire    [23 :0]  sab_back_sel2;              
wire    [23 :0]  sab_back_sel3;              
wire    [23 :0]  sab_back_sel4;              
wire             sab_cd_clr;                 
wire    [4  :0]  sab_cd_sel;                 
wire             sab_cd_vld;                 
wire    [23 :0]  sab_cr_sel0;                
wire    [23 :0]  sab_cr_sel1;                
wire    [23 :0]  sab_cr_sel2;                
wire    [23 :0]  sab_cr_sel3;                
wire    [2  :0]  sab_create1_ptr;            
wire    [4  :0]  sab_crresp_piu0;            
wire    [4  :0]  sab_crresp_piu1;            
wire    [4  :0]  sab_crresp_piu2;            
wire    [4  :0]  sab_crresp_piu3;            
wire    [23 :0]  sab_crvld_piu0;             
wire    [23 :0]  sab_crvld_piu1;             
wire    [23 :0]  sab_crvld_piu2;             
wire    [23 :0]  sab_crvld_piu3;             
wire    [23 :0]  sab_entry_busy;             
wire             sab_l2c_req_vld;            
wire    [127:0]  sab_memr_data;              
wire             sab_memr_grant;             
wire             sab_memr_last;              
wire    [3  :0]  sab_memr_resp;              
wire    [23 :0]  sab_memr_sel;               
wire             sab_memr_vld;               
wire             sab_memw_aw_grant;          
wire             sab_memw_cmplt;             
wire    [23 :0]  sab_memw_cmplt_sel;         
wire    [54 :0]  sab_piu0_ac_bus;            
wire             sab_piu0_ac_grant;          
wire             sab_piu0_ac_vld;            
wire    [54 :0]  sab_piu1_ac_bus;            
wire             sab_piu1_ac_grant;          
wire             sab_piu1_ac_vld;            
wire    [54 :0]  sab_piu2_ac_bus;            
wire             sab_piu2_ac_grant;          
wire             sab_piu2_ac_vld;            
wire    [54 :0]  sab_piu3_ac_bus;            
wire             sab_piu3_ac_grant;          
wire             sab_piu3_ac_vld;            
wire             sab_piu_ar_grant;           
wire    [23 :0]  sab_rack_sel;               
wire    [23 :0]  sab_rack_sel0;              
wire    [23 :0]  sab_rack_sel1;              
wire    [23 :0]  sab_rack_sel2;              
wire    [23 :0]  sab_rack_sel3;              
wire    [23 :0]  sab_rack_sel4;              
wire    [15 :0]  sab_rentry_vld;             
wire    [3  :0]  sab_snp_bar_cmplt;          
wire             sab_snpext_depd_vld;        
wire    [534:0]  sab_wcd_create_bus_pre;     
wire    [3  :0]  sab_wcd_create_cdsel;       
wire    [511:0]  sab_wcd_create_data;        
wire    [23 :0]  sab_wcd_create_en;          
wire             sab_wcd_create_en_pre;      
wire             sab_wcd_create_err;         
wire    [15 :0]  sab_wcd_create_wstrb;       
wire    [4  :0]  sab_wcd_sel;                
wire    [4  :0]  sab_wd_sel;                 
wire             sab_wentry_full;            
wire    [7  :0]  sab_wentry_vld;             
wire    [534:0]  sdb_arb_ebiu_w_bus;         
wire    [511:0]  sdb_arb_l2c_data_bus;       
wire    [511:0]  sdb_arb_rresp_data;         
wire             snb1;                       
wire             snb_bmbif_bar_grant;        
wire             snb_ebiuif_ac_grant;        
wire    [68 :0]  snb_ebiuif_arbus;           
wire             snb_ebiuif_arvalid;         
wire    [63 :0]  snb_l2c_addr_bus;           
wire             snb_l2c_addr_req;           
wire    [511:0]  snb_l2c_data_bus;           
wire             snb_l2c_data_req;           
wire    [2  :0]  snb_l2c_hpcp_bus;           
wire             snb_l2c_prf_grant;          
wire             snb_l2c_snpl2_grant;        
wire    [54 :0]  snb_piu0_acbus;             
wire             snb_piu0_acvalid;           
wire             snb_piu0_ar_grant;          
wire             snb_piu0_aw_grant;          
wire             snb_piu0_bar_cmplt;         
wire             snb_piu0_bvalid;            
wire             snb_piu0_cr_grant;          
wire             snb_piu0_rvalid;            
wire             snb_piu0_wcd_grant;         
wire    [54 :0]  snb_piu1_acbus;             
wire             snb_piu1_acvalid;           
wire             snb_piu1_ar_grant;          
wire             snb_piu1_aw_grant;          
wire             snb_piu1_bar_cmplt;         
wire             snb_piu1_bvalid;            
wire             snb_piu1_cr_grant;          
wire             snb_piu1_rvalid;            
wire             snb_piu1_wcd_grant;         
wire    [54 :0]  snb_piu2_acbus;             
wire             snb_piu2_acvalid;           
wire             snb_piu2_ar_grant;          
wire             snb_piu2_aw_grant;          
wire             snb_piu2_bar_cmplt;         
wire             snb_piu2_bvalid;            
wire             snb_piu2_cr_grant;          
wire             snb_piu2_rvalid;            
wire             snb_piu2_wcd_grant;         
wire    [54 :0]  snb_piu3_acbus;             
wire             snb_piu3_acvalid;           
wire             snb_piu3_ar_grant;          
wire             snb_piu3_aw_grant;          
wire             snb_piu3_bar_cmplt;         
wire             snb_piu3_bvalid;            
wire             snb_piu3_cr_grant;          
wire             snb_piu3_rvalid;            
wire             snb_piu3_wcd_grant;         
wire             snb_piu4_ar_grant;          
wire             snb_piu4_aw_grant;          
wire             snb_piu4_bvalid;            
wire             snb_piu4_rvalid;            
wire             snb_piu4_wcd_grant;         
wire    [4  :0]  snb_piux_aw_sid;            
wire    [13 :0]  snb_piux_bbus;              
wire    [534:0]  snb_piux_rbus;              
wire             snb_snpext_depd_ebiu;       
wire             snb_snpext_depd_vb;         
wire    [67 :0]  snb_vb_awbus;               
wire             snb_vb_awvalid;             
wire    [2  :0]  snb_vb_mid;                 
wire    [1  :0]  snb_vb_vid;                 
wire    [534:0]  snb_vb_wbus;                
wire             snb_vb_wvalid;              
wire             snb_xx_no_op;               
wire    [7  :0]  snb_yy_snpext_index;        
wire    [15 :0]  snpext_cen0_raw;            
wire             snpext_create_en;           
wire             snpext_depd_ar_crt_entry;   
wire             snpext_depd_aw_crt_entry;   
wire    [6  :0]  snpext_index;               
wire             snpext_req_vld;             
wire             snpext_vld;                 
wire             snpl2_create_en;            
wire             snpl2_req_vld;              
wire             vb_snb_aw_grant;            
wire             vb_snb_w_grant;             
wire    [1  :0]  vb_yy_grant_id;             
wire             wcd_clk;                    
wire             wcd_clk_en;                 
wire             wcd_dp_clk;                 
wire             wd_sel_fifo_create_en;      
wire             wd_sel_fifo_full;           
wire    [2  :0]  wd_sel_fifo_pop_bus;        
wire             wd_sel_fifo_pop_bus_vld;    
wire             wd_sel_fifo_pop_en;         


parameter DEPTH      = `SAB_DEPTH;
parameter RDEPTH     = `SAB_RDEPTH;
parameter WDEPTH     = `SAB_WDEPTH;
parameter ADDRW      = `PA_WIDTH;
parameter PTR_EXTENT = {{(DEPTH-1){1'b0}},1'b1};
parameter CORE_NUM   = 5;

// &Force("nonport", "aw_prio_clk"); @32
// &Force("nonport", "ar_prio_clk"); @33
// &Force("nonport", "cd_prio_clk"); @34

assign ar_prio_clk_en = sab_ar_clr && |piu_ar_valid[5:0];
assign aw_prio_clk_en = aw_bar_vld;
assign cd_prio_clk_en = sab_cd_clr && |piu_cd_req[4:0];

// &Instance("gated_clk_cell", "x_ar_prio_gated_clk"); @40
gated_clk_cell  x_ar_prio_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (ar_prio_clk       ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (ar_prio_clk_en    ),
  .module_en          (ciu_icg_en        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @41
//          .external_en (1'b0), @42
//          .global_en   (1'b1), @43
//          .module_en (ciu_icg_en       ), @44
//          .local_en    (ar_prio_clk_en), @45
//          .clk_out     (ar_prio_clk)); @46

// &Instance("gated_clk_cell", "x_aw_prio_gated_clk"); @48
gated_clk_cell  x_aw_prio_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (aw_prio_clk       ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (aw_prio_clk_en    ),
  .module_en          (ciu_icg_en        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @49
//          .external_en (1'b0), @50
//          .global_en   (1'b1), @51
//          .module_en (ciu_icg_en       ), @52
//          .local_en    (aw_prio_clk_en), @53
//          .clk_out     (aw_prio_clk)); @54

// &Instance("gated_clk_cell", "x_wcd_prio_gated_clk"); @56
gated_clk_cell  x_wcd_prio_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (cd_prio_clk       ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (cd_prio_clk_en    ),
  .module_en          (ciu_icg_en        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @57
//          .external_en (1'b0), @58
//          .global_en   (1'b1), @59
//          .module_en (ciu_icg_en       ), @60
//          .local_en    (cd_prio_clk_en), @61
//          .clk_out     (cd_prio_clk)); @62

//================================================
//                 SAB AR
//================================================
parameter AR_PROT_0   = 0;
parameter AR_USER_0   = 11;
parameter AR_USER_1   = 12;
parameter AR_USER_2   = 13;
parameter AR_ID_0     = 14;
parameter AR_ID_4     = 18;
parameter AR_LEN_0    = 19;
parameter AR_SOOP_3   = 26;
parameter AR_DOMAIN_0 = 27;
parameter AR_DOMAIN_1 = 28;
parameter AR_BAR_0    = 29;
parameter AR_BAR_1    = 30;
parameter AR_ADDR_0   = 31;
parameter AR_ADDR_7   = 38;
parameter AR_ADDR_13  = 44;
parameter AR_ADDR_H   = 70; //ADDRW-1+AR_ADDR_0;
parameter AR_WIDTH    = 71; //ADDRW + AR_ADDR_0;

// &Force("nonport", "sab_ar_sel"); @85

assign piu_sab_ar_req[4:0] = {piu4_snb_ar_req,
                              piu3_snb_ar_req,
                              piu2_snb_ar_req,
                              piu1_snb_ar_req,
                              piu0_snb_ar_req};

assign piu_ar_valid[5:0] = {l2c_snb_prf_req,
                            piu_sab_ar_req[4:0]};

assign sab_ar_clr = sab_piu_ar_grant;

ct_prio #(.NUM(6)) x_ct_ciu_sab_ar_prio(
  .clk                 (ar_prio_clk       ),
  .rst_b               (cpurst_b          ),
  .valid               (piu_ar_valid      ),
  .clr                 (sab_ar_clr        ),
  .sel                 (sab_ar_sel        )
);

assign snb_piu0_ar_grant = sab_ar_clr & sab_ar_sel[0];
assign snb_piu1_ar_grant = sab_ar_clr & sab_ar_sel[1];
assign snb_piu2_ar_grant = sab_ar_clr & sab_ar_sel[2];
assign snb_piu3_ar_grant = sab_ar_clr & sab_ar_sel[3];
assign snb_piu4_ar_grant = sab_ar_clr & sab_ar_sel[4];
assign snb_l2c_prf_grant = sab_ar_clr & sab_ar_sel[5];

assign piu_ar_req = |piu_ar_valid[5:0];

assign piu_ar_bus[AR_WIDTH-1:0] = 
       {(AR_WIDTH){sab_ar_sel[5]}} & l2c_snb_prf_bus[AR_WIDTH-1:0] |
       {(AR_WIDTH){sab_ar_sel[4]}} & piu4_snb_ar_bus[AR_WIDTH-1:0] |
       {(AR_WIDTH){sab_ar_sel[3]}} & piu3_snb_ar_bus[AR_WIDTH-1:0] |
       {(AR_WIDTH){sab_ar_sel[2]}} & piu2_snb_ar_bus[AR_WIDTH-1:0] |
       {(AR_WIDTH){sab_ar_sel[1]}} & piu1_snb_ar_bus[AR_WIDTH-1:0] |
       {(AR_WIDTH){sab_ar_sel[0]}} & piu0_snb_ar_bus[AR_WIDTH-1:0];

//000:piu0; 001:piu1, 010:piu2, 011:piu3, 100:piu4, 101:l2c_prf, 110: ebiu_ac, 111: l2c_snpl2
assign piu_ar_mid[2] = |sab_ar_sel[5:4];
assign piu_ar_mid[1] = |sab_ar_sel[3:2];
assign piu_ar_mid[0] = sab_ar_sel[1] || sab_ar_sel[3] || sab_ar_sel[5];

assign snpl2_req_vld  = l2c_snb_snpl2_req  & snpl2_create_en;
assign snpext_req_vld = ebiuif_snb_acvalid & snpext_create_en;
assign piu_ar_req_vld = piu_ar_req         & piu_ar_create_en;

assign sab_ar_valid[2:0] = {snpl2_req_vld,piu_ar_req_vld,snpext_req_vld};

// &CombBeg; @134
always @( piu_ar_bus[70:0]
       or sab_ar_valid[2:0]
       or ebiuif_snbx_acbus[70:0]
       or piu_ar_mid[2:0]
       or l2c_snb_snpl2_bus[70:0])
begin
casez(sab_ar_valid[2:0])
  3'b1?? : begin ar_create_mid[2:0] = 3'b111;          ar_create_bus[AR_WIDTH-1:0] = l2c_snb_snpl2_bus[AR_WIDTH-1:0];end
  3'b01? : begin ar_create_mid[2:0] = piu_ar_mid[2:0]; ar_create_bus[AR_WIDTH-1:0] = piu_ar_bus[AR_WIDTH-1:0];       end
  3'b001 : begin ar_create_mid[2:0] = 3'b110;          ar_create_bus[AR_WIDTH-1:0] = ebiuif_snbx_acbus[AR_WIDTH-1:0];end
  default: begin ar_create_mid[2:0] = 3'b0;            ar_create_bus[AR_WIDTH-1:0] = {AR_WIDTH{1'b0}};               end
endcase
// &CombEnd; @141
end

assign snb_l2c_snpl2_grant =  snpl2_create_en;
assign sab_piu_ar_grant    = !snpl2_req_vld &  piu_ar_req_vld;
assign snb_ebiuif_ac_grant = !snpl2_req_vld & !piu_ar_req_vld & snpext_req_vld & 
                             !sab_snpext_depd_vld & !snpext_depd_aw_crt_entry & !snpext_depd_ar_crt_entry & 
                             !snb_snpext_depd_ebiu & !snb_snpext_depd_vb;

assign ar_create_en = snpl2_req_vld | sab_piu_ar_grant | snb_ebiuif_ac_grant;
assign ar_create_en_dp = |sab_ar_valid[2:0];

//address to SAB check dependency
// &Force("output", "snpext_index"); @153
// &Force("output", "ar_crt_entry_index"); @154
assign snpext_index[6:0] = ebiuif_snbx_acbus[AR_ADDR_13:AR_ADDR_7];
assign snb_yy_snpext_index[7:0] = {snpext_index[6:0],snb1};
assign snpext_vld        = snpext_req_vld & ~piu_ar_req_vld & ~snpl2_req_vld;
assign ar_crt_entry_index[6:0] = sab_ar_crt_entry_bus[AR_ADDR_13:AR_ADDR_7];
assign snpext_cen0_raw[RDEPTH-1:0] = {RDEPTH{snb_ebiuif_ac_grant}} & sab_create0_sel[RDEPTH-1:0];

assign snpext_depd_ar_crt_entry = sab_ar_crt_entry_vld & (snpext_index[6:0] == ar_crt_entry_index[6:0]);

//grant
// &Force("output", "snb_l2c_snpl2_grant"); @164
// &Force("output", "snb_ebiuif_ac_grant"); @165

always@(posedge forever_cpuclk or negedge cpurst_b)
begin
  if (!cpurst_b)
    sab_ar_crt_entry_vld <= 1'b0;
  else if (ar_create_en)
    sab_ar_crt_entry_vld <= 1'b1;
  else
    sab_ar_crt_entry_vld <= 1'b0;
end

always@(posedge forever_cpuclk or negedge cpurst_b)
begin
  if (!cpurst_b)
  begin
    sab_ar_crt_entry_bus[AR_WIDTH-1:0]   <= {AR_WIDTH{1'b0}};
    sab_ar_crt_entry_mid[2:0]            <= 3'b0;
    sab_ar_crt_entry_sid_sel[RDEPTH-1:0] <= {RDEPTH{1'b0}};
    sab_ar_crt_entry_ini_sid[4:0]        <= 5'b0;
  end
  else if (ar_create_en_dp)
  begin
    sab_ar_crt_entry_bus[AR_WIDTH-1:0]   <= ar_create_bus[AR_WIDTH-1:0];
    sab_ar_crt_entry_mid[2:0]            <= ar_create_mid[2:0];
    sab_ar_crt_entry_sid_sel[RDEPTH-1:0] <= sab_create0_sel[RDEPTH-1:0];
    sab_ar_crt_entry_ini_sid[4:0]        <= l2c_snb_snpl2_ini_sid[4:0];
  end
end

assign sab_ar_create_en                = sab_ar_crt_entry_vld;
assign sab_ar_create_mid[2:0]          = sab_ar_crt_entry_mid[2:0];
assign sab_ar_create_snpl2_isid[4:0]   = sab_ar_crt_entry_ini_sid[4:0];
assign sab_ar_create_sel[RDEPTH-1:0]   = sab_ar_crt_entry_sid_sel[RDEPTH-1:0];
assign sab_ar_create_bus[AR_WIDTH-1:0] = sab_ar_crt_entry_bus[AR_WIDTH-1:0];

assign sab_rentry_vld[RDEPTH-1:0] = sab_entry_busy[RDEPTH-1:0] | 
                                    sab_ar_crt_entry_sid_sel[RDEPTH-1:0] & {RDEPTH{sab_ar_crt_entry_vld}};

// &CombBeg; @205
// &CombEnd; @216
// &CombBeg; @218
always @( sab_rentry_vld[15:0])
begin
sab_create0_sel[RDEPTH-1:0] = {RDEPTH{1'b0}};
casez(sab_rentry_vld[RDEPTH-1:0])
  16'b???????????????0 : sab_create0_sel[0]  = 1'b1;  
  16'b??????????????01 : sab_create0_sel[1]  = 1'b1;  
  16'b?????????????011 : sab_create0_sel[2]  = 1'b1;  
  16'b????????????0111 : sab_create0_sel[3]  = 1'b1;  
  16'b???????????01111 : sab_create0_sel[4]  = 1'b1;  
  16'b??????????011111 : sab_create0_sel[5]  = 1'b1;  
  16'b?????????0111111 : sab_create0_sel[6]  = 1'b1;  
  16'b????????01111111 : sab_create0_sel[7]  = 1'b1;  
  16'b???????011111111 : sab_create0_sel[8]  = 1'b1;  
  16'b??????0111111111 : sab_create0_sel[9]  = 1'b1;  
  16'b?????01111111111 : sab_create0_sel[10] = 1'b1;  
  16'b????011111111111 : sab_create0_sel[11] = 1'b1;  
  16'b???0111111111111 : sab_create0_sel[12] = 1'b1;  
  16'b??01111111111111 : sab_create0_sel[13] = 1'b1;  
  16'b?011111111111111 : sab_create0_sel[14] = 1'b1;  
  16'b0111111111111111 : sab_create0_sel[15] = 1'b1;  
  default              : sab_create0_sel[RDEPTH-1:0] = {RDEPTH{1'b0}}; 
endcase
// &CombEnd; @239
end

assign snpl2_create_en  = ~(&sab_rentry_vld[RDEPTH-1:0]);
assign snpext_create_en = ~(&sab_rentry_vld[RDEPTH-2:0]);
assign piu_ar_create_en = ~(&sab_rentry_vld[RDEPTH-3:0]);


//================================================
//                 SAB AW
//================================================
parameter AW_PROT_0   = 0;
parameter AW_USER_0   = 11;
parameter AW_USER_1   = 12;
parameter AW_USER_2   = 13;
parameter AW_ID_0     = 14;
parameter AW_ID_4     = 18;
parameter AW_LEN_0    = 19;
parameter AW_SOOP_0   = 23;
parameter AW_SOOP_2   = 25;
parameter AW_SOOP_3   = 26;
parameter AW_DOMAIN_0 = 27;
parameter AW_DOMAIN_1 = 28;
parameter AW_BAR_0    = 29;
parameter AW_BAR_1    = 30;
parameter AW_ADDR_0   = 31;
parameter AW_ADDR_7   = 38;
parameter AW_ADDR_13  = 44;
parameter AW_ADDR_H   = 70; //ADDRW-1+AR_ADDR_0;
parameter AW_WIDTH    = 71; //ADDRW + AR_ADDR_0;
parameter WNS = 3'b000;
parameter WC  = 3'b010;
parameter WB  = 3'b011;
parameter EVICT= 3'b100;

// &Force("nonport", "aw_bar_sel"); @274
assign snb_piu0_aw_grant   = aw_bar_clr & aw_bar_sel[0];
assign snb_piu1_aw_grant   = aw_bar_clr & aw_bar_sel[1];
assign snb_piu2_aw_grant   = aw_bar_clr & aw_bar_sel[2];
assign snb_piu3_aw_grant   = aw_bar_clr & aw_bar_sel[3];
assign snb_piu4_aw_grant   = aw_bar_clr & aw_bar_sel[4];
assign snb_bmbif_bar_grant = aw_bar_clr & aw_bar_sel[5];
assign snb_piux_aw_sid[4:0] = {2'b10,sab_create1_ptr[2:0]};
assign bar_type[1:0]   = bmbif_snb_req_bus[8:7];
assign bar_id[4:0]     = bmbif_snb_req_bus[6:2];
assign bar_domain[1:0] = bmbif_snb_req_bus[1:0];

assign bmbif_req_bus[AW_WIDTH-1:0] = {{ADDRW{1'b0}},
                                      bar_type[1:0],
                                      bar_domain[1:0],
                                      8'b0,    // snoop + len
                                      bar_id[4:0],
                                      14'b0};  // user + prot

assign aw_bar_req[5:0] = {bmbif_snb_bar_req,
                          piu4_snb_aw_req,
                          piu3_snb_aw_req,
                          piu2_snb_aw_req,
                          piu1_snb_aw_req,
                          piu0_snb_aw_req};

assign aw_bar_vld = |aw_bar_req[5:0];
assign aw_bar_clr = !sab_wentry_full & !wd_sel_fifo_full;

ct_prio #(.NUM(6)) x_ct_ciu_sab_aw_prio (
  .clk                 (aw_prio_clk       ),
  .rst_b               (cpurst_b          ),
  .valid               (aw_bar_req        ),
  .clr                 (aw_bar_vld        ),
  .sel                 (aw_bar_sel        )
);

assign aw_bar_bus[AW_WIDTH-1:0] =
       {AW_WIDTH{aw_bar_sel[5]}} & bmbif_req_bus[AW_WIDTH-1:0] |
       {AW_WIDTH{aw_bar_sel[4]}} & piu4_xx_aw_bus[AW_WIDTH-1:0] |
       {AW_WIDTH{aw_bar_sel[3]}} & piu3_xx_aw_bus[AW_WIDTH-1:0] |
       {AW_WIDTH{aw_bar_sel[2]}} & piu2_xx_aw_bus[AW_WIDTH-1:0] |
       {AW_WIDTH{aw_bar_sel[1]}} & piu1_xx_aw_bus[AW_WIDTH-1:0] |
       {AW_WIDTH{aw_bar_sel[0]}} & piu0_xx_aw_bus[AW_WIDTH-1:0];

assign piu_aw_mid[2] = aw_bar_sel[4];
assign piu_aw_mid[1] = |aw_bar_sel[3:2];
assign piu_aw_mid[0] = aw_bar_sel[1] || aw_bar_sel[3];

assign aw_bar_mid[2:0] = aw_bar_sel[5] ? bmbif_snb_mid[2:0] : piu_aw_mid[2:0];
assign aw_bar_wns      = (aw_bar_bus[AW_SOOP_2:AW_SOOP_0] == WNS) & (aw_bar_bus[AW_DOMAIN_1:AW_DOMAIN_0] != 2'b01) |
                         (aw_bar_bus[AW_SOOP_2:AW_SOOP_0] == WB) |
                         (aw_bar_bus[AW_SOOP_2:AW_SOOP_0] == WC) |
                         (aw_bar_bus[AW_SOOP_2:AW_SOOP_0] == EVICT);

//flop one-cycle to cut down timing
assign aw_bar_create_en = aw_bar_vld & aw_bar_clr;

always@(posedge forever_cpuclk or negedge cpurst_b)
begin
  if (!cpurst_b)
    sab_aw_crt_entry_vld <= 1'b0;
  else if (aw_bar_create_en)
    sab_aw_crt_entry_vld <= 1'b1;
  else 
    sab_aw_crt_entry_vld <= 1'b0;
end

always@(posedge forever_cpuclk or negedge cpurst_b)
begin
  if (!cpurst_b)
  begin
    sab_aw_crt_entry_bus[AW_WIDTH-1:0]   <= {AW_WIDTH{1'b0}};
    sab_aw_crt_entry_mid[2:0]            <= 3'b0;
    sab_aw_crt_entry_sid_sel[WDEPTH-1:0] <= {WDEPTH{1'b0}};
  end
  else if (aw_bar_create_en)
  begin
    sab_aw_crt_entry_bus[AW_WIDTH-1:0]   <= aw_bar_bus[AW_WIDTH-1:0];
    sab_aw_crt_entry_mid[2:0]            <= aw_bar_mid[2:0];
    sab_aw_crt_entry_sid_sel[WDEPTH-1:0] <= sab_create1_sel[WDEPTH-1:0];
  end
end

assign sab_aw_create_en                = sab_aw_crt_entry_vld;
assign sab_aw_create_bus[AW_WIDTH-1:0] = sab_aw_crt_entry_bus[AW_WIDTH-1:0];
assign sab_aw_create_mid[2:0]          = sab_aw_crt_entry_mid[2:0];
assign sab_aw_create_sel[WDEPTH-1:0]   = sab_aw_crt_entry_sid_sel[WDEPTH-1:0];
assign sab_aw_create_bar               = sab_aw_crt_entry_bus[AW_BAR_0];
assign sab_aw_create_evict             = sab_aw_crt_entry_bus[AW_SOOP_2:AW_SOOP_0] == EVICT;

//piu_aw address 
assign aw_crt_entry_index[6:0] = sab_aw_crt_entry_bus[AW_ADDR_13:AW_ADDR_7];
assign aw_crt_entry_bar        = sab_aw_crt_entry_bus[AW_BAR_0];

// &Force("output", "aw_crt_entry_index"); @373
assign snpext_depd_aw_crt_entry = sab_aw_crt_entry_vld & !aw_crt_entry_bar & (snpext_index[6:0] == aw_crt_entry_index[6:0]) |
                                  aw_bar_create_en & !aw_bar_sel[5] & (snpext_index[6:0] == aw_bar_bus[AW_ADDR_13:AW_ADDR_7]);

//sab_create1_sel
assign sab_wentry_vld[WDEPTH-1:0] = sab_entry_busy[DEPTH-1:RDEPTH] |
                                    sab_aw_crt_entry_sid_sel[WDEPTH-1:0] & {WDEPTH{sab_aw_crt_entry_vld}};

// &CombBeg; @382
// &CombEnd; @389
// &CombBeg; @391
always @( sab_wentry_vld[7:0])
begin
sab_create1_sel[WDEPTH-1:0] = {WDEPTH{1'b0}};
casez(sab_wentry_vld[WDEPTH-1:0])
  8'b???????0 : sab_create1_sel[0]  = 1'b1;
  8'b??????01 : sab_create1_sel[1]  = 1'b1;
  8'b?????011 : sab_create1_sel[2]  = 1'b1;
  8'b????0111 : sab_create1_sel[3]  = 1'b1;
  8'b???01111 : sab_create1_sel[4]  = 1'b1;
  8'b??011111 : sab_create1_sel[5]  = 1'b1;
  8'b?0111111 : sab_create1_sel[6]  = 1'b1;
  8'b01111111 : sab_create1_sel[7]  = 1'b1;
  default     : sab_create1_sel[WDEPTH-1:0] = {WDEPTH{1'b0}};
endcase
// &CombEnd; @404
end

assign sab_wentry_full = (aw_bar_wns & ~aw_bar_sel[5]) 
                       ? (&sab_wentry_vld[WDEPTH-1:0]) 
                       : (&sab_wentry_vld[WDEPTH-2:0]);

assign sab_create1_ptr[2] = |sab_create1_sel[7:4];
assign sab_create1_ptr[1] = |sab_create1_sel[7:6] | (|sab_create1_sel[3:2]);
assign sab_create1_ptr[0] = sab_create1_sel[7] | sab_create1_sel[5] | sab_create1_sel[3] | sab_create1_sel[1];
//================================================
//                 SDB WDCD
//================================================
parameter WCD_DATA_0   = 0;
parameter WCD_DATA_511 = 511;
parameter WCD_WSTRB_0  = 512;
parameter WCD_WSTRB_15 = 527;
parameter WCD_SID_0    = 528;
parameter WCD_SID_4    = 532;
parameter WCD_CD_SEL   = 533;
parameter WCD_ERR      = 534;
parameter WCD_WIDTH    = 535;

//------------------------------------------------
//          CD select
//------------------------------------------------
// &Force("nonport", "sab_cd_sel"); @434

assign piu0_cd_req = piu0_snb_wcd_req & piu0_xx_wcd_bus[WCD_CD_SEL];
assign piu1_cd_req = piu1_snb_wcd_req & piu1_xx_wcd_bus[WCD_CD_SEL];
assign piu2_cd_req = piu2_snb_wcd_req & piu2_xx_wcd_bus[WCD_CD_SEL];
assign piu3_cd_req = piu3_snb_wcd_req & piu3_xx_wcd_bus[WCD_CD_SEL];
assign piu4_cd_req = piu4_snb_wcd_req & piu4_xx_wcd_bus[WCD_CD_SEL];

assign piu_cd_req[CORE_NUM-1:0] = {piu4_cd_req,
                                   piu3_cd_req,
                                   piu2_cd_req,
                                   piu1_cd_req,
                                   piu0_cd_req};

assign sab_cd_vld = |piu_cd_req[CORE_NUM-1:0];
assign sab_cd_clr = 1'b1;

ct_prio #(.NUM(5)) x_ct_ciu_sab_cd_prio(
  .clk                 (cd_prio_clk      ),
  .rst_b               (cpurst_b         ),
  .valid               (piu_cd_req       ),
  .clr                 (sab_cd_clr       ),
  .sel                 (sab_cd_sel       )
);

//------------------------------------------------
//             WCD_sel
//------------------------------------------------
// &Force("nonport", "wd_sel_fifo_create_en"); @462
// &Force("nonport", "wd_sel_fifo_pop_bus"); @463
// &Force("nonport", "wd_sel_fifo_pop_bus_vld"); @464
// &Force("nonport", "wd_sel_fifo_pop_en"); @465
// &Force("nonport", "wd_sel_fifo_full"); @466

assign wd_sel_fifo_create_en = sab_aw_crt_entry_vld & !sab_aw_create_bar & !sab_aw_create_evict;

assign wd_sel_fifo_pop_en    = sab_wcd_create_en_pre & 
                              !sab_cd_vld & 
                               wd_sel_fifo_pop_bus_vld;

ct_fifo #(.WIDTH(3), .DEPTH(8), .PTR_W(3)) x_ct_ciu_wd_sel_fifo(
  .clk                   (forever_cpuclk          ),
  .rst_b                 (cpurst_b                ),
  .fifo_create_en        (wd_sel_fifo_create_en   ),
  .fifo_create_en_dp     (wd_sel_fifo_create_en   ),
  .fifo_pop_en           (wd_sel_fifo_pop_en      ),
  .fifo_create_data      (sab_aw_crt_entry_mid    ),
  .fifo_pop_data         (wd_sel_fifo_pop_bus     ),
  .fifo_pop_data_vld     (wd_sel_fifo_pop_bus_vld ),
  .fifo_full             (wd_sel_fifo_full        ),
  .fifo_empty            (wd_sel_fifo_empty       ),
  .pad_yy_icg_scan_en  (pad_yy_icg_scan_en   ),
  .fifo_icg_en           (ciu_icg_en)
);

assign sab_wd_sel[4:0]  = {5{wd_sel_fifo_pop_bus_vld}} & (5'b1 << wd_sel_fifo_pop_bus[2:0]);
assign sab_wcd_sel[4:0] = sab_cd_vld ? sab_cd_sel[4:0] : sab_wd_sel[4:0];

assign snb_piu0_wcd_grant = piu0_snb_wcd_req & sab_wcd_sel[0];
assign snb_piu1_wcd_grant = piu1_snb_wcd_req & sab_wcd_sel[1];
assign snb_piu2_wcd_grant = piu2_snb_wcd_req & sab_wcd_sel[2];
assign snb_piu3_wcd_grant = piu3_snb_wcd_req & sab_wcd_sel[3];
assign snb_piu4_wcd_grant = piu4_snb_wcd_req & sab_wcd_sel[4];

assign sab_wcd_create_bus_pre[WCD_WIDTH-1:0] =
       {WCD_WIDTH{sab_wcd_sel[4]}} & piu4_xx_wcd_bus[WCD_WIDTH-1:0] |
       {WCD_WIDTH{sab_wcd_sel[3]}} & piu3_xx_wcd_bus[WCD_WIDTH-1:0] |
       {WCD_WIDTH{sab_wcd_sel[2]}} & piu2_xx_wcd_bus[WCD_WIDTH-1:0] |
       {WCD_WIDTH{sab_wcd_sel[1]}} & piu1_xx_wcd_bus[WCD_WIDTH-1:0] |
       {WCD_WIDTH{sab_wcd_sel[0]}} & piu0_xx_wcd_bus[WCD_WIDTH-1:0];

assign wcd_clk_en = sab_wcd_create_en_pre || sab_wcd_crt_entry_vld;
// &Instance("gated_clk_cell", "x_sab_wcd_ctrl_gated_clk"); @506
gated_clk_cell  x_sab_wcd_ctrl_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (wcd_clk           ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (wcd_clk_en        ),
  .module_en          (ciu_icg_en        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @507
//          .external_en (1'b0), @508
//          .global_en   (1'b1), @509
//          .module_en (ciu_icg_en       ), @510
//          .local_en    (wcd_clk_en), @511
//          .clk_out     (wcd_clk)); @512

// &Instance("gated_clk_cell", "x_wcd_dp_gated_clk"); @514
gated_clk_cell  x_wcd_dp_gated_clk (
  .clk_in                (forever_cpuclk       ),
  .clk_out               (wcd_dp_clk           ),
  .external_en           (1'b0                 ),
  .global_en             (1'b1                 ),
  .local_en              (sab_wcd_create_en_pre),
  .module_en             (ciu_icg_en           ),
  .pad_yy_icg_scan_en    (pad_yy_icg_scan_en   )
);

// &Connect(.clk_in      (forever_cpuclk), @515
//          .external_en (1'b0), @516
//          .global_en   (1'b1), @517
//          .module_en (ciu_icg_en       ), @518
//          .local_en    (sab_wcd_create_en_pre), @519
//          .clk_out     (wcd_dp_clk)); @520

assign sab_wcd_create_en_pre = sab_wcd_sel[4] & piu4_snb_wcd_req |
                               sab_wcd_sel[3] & piu3_snb_wcd_req |
                               sab_wcd_sel[2] & piu2_snb_wcd_req |
                               sab_wcd_sel[1] & piu1_snb_wcd_req |
                               sab_wcd_sel[0] & piu0_snb_wcd_req;

always@(posedge wcd_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    sab_wcd_crt_entry_vld <= 1'b0;
  else if (sab_wcd_create_en_pre)
    sab_wcd_crt_entry_vld <= 1'b1;
  else 
    sab_wcd_crt_entry_vld <= 1'b0;
end

always@(posedge wcd_dp_clk)
begin
  if (sab_wcd_create_en_pre) begin
    sab_wcd_crt_entry_bus[WCD_WIDTH-1:0] <= sab_wcd_create_bus_pre[WCD_WIDTH-1:0];
    sab_wcd_crt_piu_sel[3:0]             <= sab_wcd_sel[3:0];
    sab_wcd_crt_entry_sid_sel[DEPTH-1:0] <= PTR_EXTENT <<  sab_wcd_create_bus_pre[WCD_SID_4:WCD_SID_0];
  end
end

assign sab_wcd_create_en[DEPTH-1:0] = {DEPTH{sab_wcd_crt_entry_vld}} & sab_wcd_crt_entry_sid_sel[DEPTH-1:0];
assign sab_wcd_create_cdsel[3:0]    = sab_wcd_crt_piu_sel[3:0] & {4{sab_wcd_crt_entry_bus[WCD_CD_SEL]}};
assign sab_wcd_create_data[511:0]   = sab_wcd_crt_entry_bus[WCD_DATA_511:WCD_DATA_0];
assign sab_wcd_create_wstrb[15:0]   = sab_wcd_crt_entry_bus[WCD_WSTRB_15:WCD_WSTRB_0];
assign sab_wcd_create_err           = sab_wcd_crt_entry_bus[WCD_ERR];

//================================================
//                 AC_DP
//================================================
parameter AC_WIDTH  = 55;
assign ac_ctrl_clk_en = piu0_ac_buf_create_en | piu0_ac_buf_pop_en |
                        piu1_ac_buf_create_en | piu1_ac_buf_pop_en |
                        piu2_ac_buf_create_en | piu2_ac_buf_pop_en |
                        piu3_ac_buf_create_en | piu3_ac_buf_pop_en;

// &Instance("gated_clk_cell", "x_ac_ctrl_gated_clk"); @562
gated_clk_cell  x_ac_ctrl_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (ac_ctrl_clk       ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (ac_ctrl_clk_en    ),
  .module_en          (ciu_icg_en        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @563
//          .external_en (1'b0), @564
//          .global_en   (1'b1), @565
//          .module_en (ciu_icg_en       ), @566
//          .local_en    (ac_ctrl_clk_en), @567
//          .clk_out     (ac_ctrl_clk)); @568

assign piu0_ac_buf_clk_en = piu0_ac_buf_create_en;
// &Instance("gated_clk_cell", "x_piu0_ac_buf_gated_clk"); @571
gated_clk_cell  x_piu0_ac_buf_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (piu0_ac_buf_clk   ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (piu0_ac_buf_clk_en),
  .module_en          (ciu_icg_en        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @572
//          .external_en (1'b0), @573
//          .global_en   (1'b1), @574
//          .module_en (ciu_icg_en       ), @575
//          .local_en    (piu0_ac_buf_clk_en), @576
//          .clk_out     (piu0_ac_buf_clk)); @577

assign piu1_ac_buf_clk_en = piu1_ac_buf_create_en;
// &Instance("gated_clk_cell", "x_piu1_ac_buf_gated_clk"); @580
gated_clk_cell  x_piu1_ac_buf_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (piu1_ac_buf_clk   ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (piu1_ac_buf_clk_en),
  .module_en          (ciu_icg_en        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @581
//          .external_en (1'b0), @582
//          .global_en   (1'b1), @583
//          .module_en (ciu_icg_en       ), @584
//          .local_en    (piu1_ac_buf_clk_en), @585
//          .clk_out     (piu1_ac_buf_clk)); @586

assign piu2_ac_buf_clk_en = piu2_ac_buf_create_en;
// &Instance("gated_clk_cell", "x_piu2_ac_buf_gated_clk"); @589
gated_clk_cell  x_piu2_ac_buf_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (piu2_ac_buf_clk   ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (piu2_ac_buf_clk_en),
  .module_en          (ciu_icg_en        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @590
//          .external_en (1'b0), @591
//          .global_en   (1'b1), @592
//          .module_en (ciu_icg_en       ), @593
//          .local_en    (piu2_ac_buf_clk_en), @594
//          .clk_out     (piu2_ac_buf_clk)); @595

assign piu3_ac_buf_clk_en = piu3_ac_buf_create_en;
// &Instance("gated_clk_cell", "x_piu3_ac_buf_gated_clk"); @598
gated_clk_cell  x_piu3_ac_buf_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (piu3_ac_buf_clk   ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (piu3_ac_buf_clk_en),
  .module_en          (ciu_icg_en        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @599
//          .external_en (1'b0), @600
//          .global_en   (1'b1), @601
//          .module_en (ciu_icg_en       ), @602
//          .local_en    (piu3_ac_buf_clk_en), @603
//          .clk_out     (piu3_ac_buf_clk)); @604
//--------------------------------------
//   PIU0 AC BUF 
//--------------------------------------
assign sab_piu0_ac_grant     = !piu0_ac_buf_vld | piu0_ac_buf_pop_en;
assign piu0_ac_buf_create_en = sab_piu0_ac_vld & (!piu0_ac_buf_vld | piu0_ac_buf_pop_en);
assign piu0_ac_buf_pop_en    = piu0_snb_ac_grant;

always@(posedge ac_ctrl_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    piu0_ac_buf_vld <= 1'b0;
  else if (piu0_ac_buf_create_en)
    piu0_ac_buf_vld <= 1'b1;
  else if (piu0_ac_buf_pop_en)
    piu0_ac_buf_vld <= 1'b0;
end

always@(posedge piu0_ac_buf_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    piu0_ac_buf_cont[AC_WIDTH-1:0] <= {AC_WIDTH{1'b0}};
  else if (piu0_ac_buf_create_en)
    piu0_ac_buf_cont[AC_WIDTH-1:0] <= sab_piu0_ac_bus[AC_WIDTH-1:0];
end

assign snb_piu0_acvalid = piu0_ac_buf_vld;
assign snb_piu0_acbus[AC_WIDTH-1:0] = piu0_ac_buf_cont[AC_WIDTH-1:0];

//--------------------------------------
//   PIU1 AC BUF 
//--------------------------------------
assign sab_piu1_ac_grant     = !piu1_ac_buf_vld | piu1_ac_buf_pop_en;
assign piu1_ac_buf_create_en = sab_piu1_ac_vld & (!piu1_ac_buf_vld | piu1_ac_buf_pop_en);
assign piu1_ac_buf_pop_en    = piu1_snb_ac_grant;

always@(posedge ac_ctrl_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    piu1_ac_buf_vld <= 1'b0;
  else if (piu1_ac_buf_create_en)
    piu1_ac_buf_vld <= 1'b1;
  else if (piu1_ac_buf_pop_en)
    piu1_ac_buf_vld <= 1'b0;
end

always@(posedge piu1_ac_buf_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    piu1_ac_buf_cont[AC_WIDTH-1:0] <= {AC_WIDTH{1'b0}};
  else if (piu1_ac_buf_create_en)
    piu1_ac_buf_cont[AC_WIDTH-1:0] <= sab_piu1_ac_bus[AC_WIDTH-1:0];
end

assign snb_piu1_acvalid = piu1_ac_buf_vld;
assign snb_piu1_acbus[AC_WIDTH-1:0] = piu1_ac_buf_cont[AC_WIDTH-1:0];

//--------------------------------------
//   PIU2 AC BUF 
//--------------------------------------
assign sab_piu2_ac_grant     = !piu2_ac_buf_vld | piu2_ac_buf_pop_en;
assign piu2_ac_buf_create_en = sab_piu2_ac_vld & (!piu2_ac_buf_vld | piu2_ac_buf_pop_en);
assign piu2_ac_buf_pop_en    = piu2_snb_ac_grant;

always@(posedge ac_ctrl_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    piu2_ac_buf_vld <= 1'b0;
  else if (piu2_ac_buf_create_en)
    piu2_ac_buf_vld <= 1'b1;
  else if (piu2_ac_buf_pop_en)
    piu2_ac_buf_vld <= 1'b0;
end

always@(posedge piu2_ac_buf_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    piu2_ac_buf_cont[AC_WIDTH-1:0] <= {AC_WIDTH{1'b0}};
  else if (piu2_ac_buf_create_en)
    piu2_ac_buf_cont[AC_WIDTH-1:0] <= sab_piu2_ac_bus[AC_WIDTH-1:0];
end

assign snb_piu2_acvalid = piu2_ac_buf_vld;
assign snb_piu2_acbus[AC_WIDTH-1:0] = piu2_ac_buf_cont[AC_WIDTH-1:0];

//--------------------------------------
//   PIU3 AC BUF 
//--------------------------------------
assign sab_piu3_ac_grant     = !piu3_ac_buf_vld | piu3_ac_buf_pop_en;
assign piu3_ac_buf_create_en = sab_piu3_ac_vld & (!piu3_ac_buf_vld | piu3_ac_buf_pop_en);
assign piu3_ac_buf_pop_en    = piu3_snb_ac_grant;

always@(posedge ac_ctrl_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    piu3_ac_buf_vld <= 1'b0;
  else if (piu3_ac_buf_create_en)
    piu3_ac_buf_vld <= 1'b1;
  else if (piu3_ac_buf_pop_en)
    piu3_ac_buf_vld <= 1'b0;
end

always@(posedge piu3_ac_buf_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    piu3_ac_buf_cont[AC_WIDTH-1:0] <= {AC_WIDTH{1'b0}};
  else if (piu3_ac_buf_create_en)
    piu3_ac_buf_cont[AC_WIDTH-1:0] <= sab_piu3_ac_bus[AC_WIDTH-1:0];
end

assign snb_piu3_acvalid = piu3_ac_buf_vld;
assign snb_piu3_acbus[AC_WIDTH-1:0] = piu3_ac_buf_cont[AC_WIDTH-1:0];

//================================================
//                 SAB CR
//================================================
parameter CRR_SID_4  = 9;
parameter CRR_SID_0  = 5;
parameter CRR_RESP_4 = 4;
parameter CRR_RESP_0 = 0;

assign sab_cr_sel0[DEPTH-1:0] = (PTR_EXTENT << piu0_snb_cr_bus[CRR_SID_4:CRR_SID_0]) & {DEPTH{piu0_snb_cr_req}};
assign sab_cr_sel1[DEPTH-1:0] = (PTR_EXTENT << piu1_snb_cr_bus[CRR_SID_4:CRR_SID_0]) & {DEPTH{piu1_snb_cr_req}};
assign sab_cr_sel2[DEPTH-1:0] = (PTR_EXTENT << piu2_snb_cr_bus[CRR_SID_4:CRR_SID_0]) & {DEPTH{piu2_snb_cr_req}};
assign sab_cr_sel3[DEPTH-1:0] = (PTR_EXTENT << piu3_snb_cr_bus[CRR_SID_4:CRR_SID_0]) & {DEPTH{piu3_snb_cr_req}};

assign sab_crvld_piu0[DEPTH-1:0] = sab_cr_sel0[DEPTH-1:0];
assign sab_crvld_piu1[DEPTH-1:0] = sab_cr_sel1[DEPTH-1:0];
assign sab_crvld_piu2[DEPTH-1:0] = sab_cr_sel2[DEPTH-1:0];
assign sab_crvld_piu3[DEPTH-1:0] = sab_cr_sel3[DEPTH-1:0];

assign sab_crresp_piu0[4:0] = piu0_snb_cr_bus[CRR_RESP_4:CRR_RESP_0];
assign sab_crresp_piu1[4:0] = piu1_snb_cr_bus[CRR_RESP_4:CRR_RESP_0];
assign sab_crresp_piu2[4:0] = piu2_snb_cr_bus[CRR_RESP_4:CRR_RESP_0];
assign sab_crresp_piu3[4:0] = piu3_snb_cr_bus[CRR_RESP_4:CRR_RESP_0];

assign snb_piu0_cr_grant = piu0_snb_cr_req;
assign snb_piu1_cr_grant = piu1_snb_cr_req;
assign snb_piu2_cr_grant = piu2_snb_cr_req;
assign snb_piu3_cr_grant = piu3_snb_cr_req;

//================================================
//                 SAB RACK
//================================================

assign sab_rack_sel0[DEPTH-1:0] = {DEPTH{piu0_snb_rack}} & (PTR_EXTENT << piu0_snbx_rack_sid[4:0]);
assign sab_rack_sel1[DEPTH-1:0] = {DEPTH{piu1_snb_rack}} & (PTR_EXTENT << piu1_snbx_rack_sid[4:0]);
assign sab_rack_sel2[DEPTH-1:0] = {DEPTH{piu2_snb_rack}} & (PTR_EXTENT << piu2_snbx_rack_sid[4:0]);
assign sab_rack_sel3[DEPTH-1:0] = {DEPTH{piu3_snb_rack}} & (PTR_EXTENT << piu3_snbx_rack_sid[4:0]);
assign sab_rack_sel4[DEPTH-1:0] = {DEPTH{piu4_snb_rack}} & (PTR_EXTENT << piu4_snbx_rack_sid[4:0]);

assign sab_rack_sel[DEPTH-1:0]  = sab_rack_sel0[DEPTH-1:0] |
                                  sab_rack_sel1[DEPTH-1:0] |
                                  sab_rack_sel2[DEPTH-1:0] |
                                  sab_rack_sel3[DEPTH-1:0] |
                                  sab_rack_sel4[DEPTH-1:0];

//================================================
//                 SAB BACK
//================================================

assign sab_back_sel0[DEPTH-1:0] = {DEPTH{piu0_snb_back}} & (PTR_EXTENT << piu0_snbx_back_sid[4:0]);
assign sab_back_sel1[DEPTH-1:0] = {DEPTH{piu1_snb_back}} & (PTR_EXTENT << piu1_snbx_back_sid[4:0]);
assign sab_back_sel2[DEPTH-1:0] = {DEPTH{piu2_snb_back}} & (PTR_EXTENT << piu2_snbx_back_sid[4:0]);
assign sab_back_sel3[DEPTH-1:0] = {DEPTH{piu3_snb_back}} & (PTR_EXTENT << piu3_snbx_back_sid[4:0]);
assign sab_back_sel4[DEPTH-1:0] = {DEPTH{piu4_snb_back}} & (PTR_EXTENT << piu4_snbx_back_sid[4:0]);

assign sab_back_sel[DEPTH-1:0]  = sab_back_sel0[DEPTH-1:0] |
                                  sab_back_sel1[DEPTH-1:0] |
                                  sab_back_sel2[DEPTH-1:0] |
                                  sab_back_sel3[DEPTH-1:0] |
                                  sab_back_sel4[DEPTH-1:0];

//================================================
//  L2C ADDR POP entry
//================================================
parameter L2C_ADDR_WIDTH  = 64;
assign arb_sab_no_l2c_req = !sab_arb_l2c_req;

assign sab_l2c_req_vld    = sab_arb_l2c_req;
assign l2c_pop_entry_wen  = sab_l2c_req_vld & l2c_pop_entry_idle;
assign l2c_pop_entry_clr  = l2c_pop_entry_vld & l2c_snb_addr_grant;
assign l2c_pop_entry_idle = !l2c_pop_entry_vld | l2c_snb_addr_grant;

always@(posedge forever_cpuclk or negedge cpurst_b)
begin
  if (!cpurst_b)
    l2c_pop_entry_vld <= 1'b0;
  else if (l2c_pop_entry_wen)
    l2c_pop_entry_vld <= 1'b1;
  else if (l2c_pop_entry_clr)
    l2c_pop_entry_vld <= 1'b0;
end

always@(posedge l2c_pop_clk or negedge cpurst_b)
begin
  if (!cpurst_b)begin
    l2c_pop_entry_sel[DEPTH-1:0]               <= {DEPTH{1'b0}};
    l2c_pop_entry_addr_bus[L2C_ADDR_WIDTH-1:0] <= {L2C_ADDR_WIDTH{1'b0}};
    l2c_pop_entry_hpcp_bus[2:0]                <= 3'b0;
  end
  else if (l2c_pop_entry_wen) begin
    l2c_pop_entry_sel[DEPTH-1:0]               <= sab_arb_l2c_sel[DEPTH-1:0];
    l2c_pop_entry_addr_bus[L2C_ADDR_WIDTH-1:0] <= sab_arb_l2c_addr_bus[L2C_ADDR_WIDTH-1:0];
    l2c_pop_entry_hpcp_bus[2:0]                <= sab_arb_l2c_hpcp_bus[2:0];
  end
  else begin
    l2c_pop_entry_sel[DEPTH-1:0]               <= l2c_pop_entry_sel[DEPTH-1:0];
    l2c_pop_entry_addr_bus[L2C_ADDR_WIDTH-1:0] <= l2c_pop_entry_addr_bus[L2C_ADDR_WIDTH-1:0];
    l2c_pop_entry_hpcp_bus[2:0]                <= l2c_pop_entry_hpcp_bus[2:0];
  end
end

//--------------------------------------
//        output to L2C
//--------------------------------------

assign snb_l2c_addr_req      = l2c_pop_entry_vld;
assign snb_l2c_addr_bus[L2C_ADDR_WIDTH-1:0] 
                             = l2c_pop_entry_addr_bus[L2C_ADDR_WIDTH-1:0];

assign snb_l2c_hpcp_bus[2:0] = l2c_pop_entry_hpcp_bus[2:0];

//--------------------------------------
//      l2c req sel fifo
//--------------------------------------
// &Force("nonport", "l2c_sel_fifo_create_en"); @830
// &Force("nonport", "l2c_sel_fifo_pop_bus"); @831
// &Force("nonport", "l2c_sel_fifo_pop_bus_vld"); @832
// &Force("nonport", "l2c_sel_fifo_pop_en"); @833
parameter L2C_ADDR_WT_0 = 18;
parameter L2C_ADDR_WT_3 = 21;

assign l2c_sel_fifo_create_en = l2c_pop_entry_vld & 
                                (|l2c_pop_entry_addr_bus[L2C_ADDR_WT_3:L2C_ADDR_WT_0]) &
                                l2c_snb_addr_grant;
assign l2c_sel_fifo_pop_en    = l2c_data_buf_idle & 
                                l2c_sel_fifo_pop_bus_vld;

ct_fifo #(.WIDTH(DEPTH), .DEPTH(2), .PTR_W(1)) x_ct_ciu_l2c_sel_fifo(
  .clk                   (forever_cpuclk           ),
  .rst_b                 (cpurst_b                 ),
  .fifo_create_en        (l2c_sel_fifo_create_en   ),
  .fifo_create_en_dp     (l2c_sel_fifo_create_en   ),
  .fifo_pop_en           (l2c_sel_fifo_pop_en      ),
  .fifo_create_data      (l2c_pop_entry_sel        ),
  .fifo_pop_data         (l2c_sel_fifo_pop_bus     ),
  .fifo_pop_data_vld     (l2c_sel_fifo_pop_bus_vld ),
  .fifo_full             (l2c_sel_fifo_full        ),
  .fifo_empty            (l2c_sel_fifo_empty       ),
  .pad_yy_icg_scan_en  (pad_yy_icg_scan_en   ),
  .fifo_icg_en           (ciu_icg_en)
);

assign arb_sdb_l2c_sel[DEPTH-1:0] = l2c_sel_fifo_pop_bus[DEPTH-1:0];

//--------------------------------------
//            L2C DATA BUF
//--------------------------------------
parameter L2C_DATA_WIDTH = 512;

assign l2c_data_buf_create_en = l2c_sel_fifo_pop_bus_vld & l2c_data_buf_idle;
assign l2c_data_buf_create_en_gate = l2c_sel_fifo_pop_bus_vld & (!l2c_data_buf_vld | l2c_snb_data_grant_gate);
assign l2c_data_buf_idle      = !l2c_data_buf_vld | l2c_snb_data_grant;
assign l2c_data_buf_pop_en    = l2c_data_buf_vld & l2c_snb_data_grant;

always@(posedge forever_cpuclk or negedge cpurst_b)
begin
  if (!cpurst_b)
    l2c_data_buf_vld <= 1'b0;
  else if (l2c_data_buf_create_en) 
    l2c_data_buf_vld <= 1'b1;
  else if (l2c_data_buf_pop_en)
    l2c_data_buf_vld <= 1'b0;
end

assign l2c_buf_clk_en = l2c_data_buf_create_en_gate;
// &Instance("gated_clk_cell", "x_l2c_buf_gated_clk"); @891
gated_clk_cell  x_l2c_buf_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (l2c_buf_clk       ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (l2c_buf_clk_en    ),
  .module_en          (ciu_icg_en        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @892
//          .external_en (1'b0), @893
//          .global_en   (1'b1), @894
//          .module_en (ciu_icg_en       ), @895
//          .local_en    (l2c_buf_clk_en), @896
//          .clk_out     (l2c_buf_clk)); @897

always@(posedge l2c_buf_clk or negedge cpurst_b)
begin
  if(~cpurst_b)
    l2c_data_buf_cont[L2C_DATA_WIDTH-1:0] <= {L2C_DATA_WIDTH{1'b0}};
  else if (l2c_data_buf_create_en)
    l2c_data_buf_cont[L2C_DATA_WIDTH-1:0] <= sdb_arb_l2c_data_bus[L2C_DATA_WIDTH-1:0];
end

assign snb_l2c_data_req        = l2c_data_buf_vld;
assign snb_l2c_data_bus[L2C_DATA_WIDTH-1:0] 
                               = l2c_data_buf_cont[L2C_DATA_WIDTH-1:0];

//--------------------------------------
//      l2c grant and cmplt
//--------------------------------------
assign arb_sab_l2c_grant = l2c_pop_entry_idle;

assign arb_sab_l2c_cmplt          = l2c_snb_cmplt;
assign arb_sab_l2c_cmplt_sid[4:0] = l2c_snb_cmplt_sid[4:0];
assign arb_sab_l2c_data[511:0]    = l2c_snb_data[511:0];
assign arb_sab_l2c_resp[4:0]      = l2c_snb_resp[4:0];
assign arb_sab_l2c_cp[3:0]        = l2c_snb_cp[3:0];

//==========================================================
//           ebiu aw and w
//==========================================================
//--------------------------------------
//      ebiu w buf
//--------------------------------------
parameter EBIU_AW_WIDTH = 68;

assign ebiu_aw_buf_create_en =  sab_arb_ebiu_aw_req & ebiu_aw_buf_idle;
assign ebiu_aw_buf_idle      = !ebiu_aw_buf_vld | vb_snb_aw_grant & !ebiu_sel_fifo_full;
assign ebiu_aw_buf_pop_en    =  ebiu_aw_buf_vld & vb_snb_aw_grant & !ebiu_sel_fifo_full;

always@(posedge forever_cpuclk or negedge cpurst_b)
begin
  if (!cpurst_b)
    ebiu_aw_buf_vld <= 1'b0;
  else if (ebiu_aw_buf_create_en) 
    ebiu_aw_buf_vld <= 1'b1;
  else if (ebiu_aw_buf_pop_en)
    ebiu_aw_buf_vld <= 1'b0;
end

always@(posedge ebiu_aw_buf_clk or negedge cpurst_b)
begin
  if(~cpurst_b)begin
    ebiu_aw_buf_cont[EBIU_AW_WIDTH-1:0] <= {EBIU_AW_WIDTH{1'b0}};
    ebiu_aw_buf_sdb_sel[DEPTH-1:0] <= {DEPTH{1'b0}};
    ebiu_aw_buf_mid[2:0]           <= 3'b0;
  end
  else if (ebiu_aw_buf_create_en)begin
    ebiu_aw_buf_cont[EBIU_AW_WIDTH-1:0] <= sab_arb_ebiu_aw_bus[EBIU_AW_WIDTH-1:0];
    ebiu_aw_buf_sdb_sel[DEPTH-1:0] <= sab_arb_ebiu_aw_sel[DEPTH-1:0];
    ebiu_aw_buf_mid[2:0]           <= sab_arb_ebiu_aw_mid[2:0];
  end
end

assign snb_vb_awvalid = ebiu_aw_buf_vld;
assign snb_vb_awbus[EBIU_AW_WIDTH-1:0] = ebiu_aw_buf_cont[EBIU_AW_WIDTH-1:0];
assign snb_vb_mid[2:0] = ebiu_aw_buf_mid[2:0];

//--------------------------------------
//      ebiu aw sel fifo
//--------------------------------------
parameter VBSEL_WIDTH = 26;
// &Force("nonport", "ebiu_sel_fifo_create_en"); @967
// &Force("nonport", "ebiu_sel_fifo_pop_bus"); @968
// &Force("nonport", "ebiu_sel_fifo_pop_bus_vld"); @969
// &Force("nonport", "ebiu_sel_fifo_pop_en"); @970
// &Force("nonport", "ebiu_sel_fifo_full"); @971
// &Force("nonport", "ebiu_sel_fifo_create_bus"); @972

assign ebiu_sel_fifo_create_en = vb_snb_aw_grant & !ebiu_sel_fifo_full;
assign ebiu_sel_fifo_create_bus[VBSEL_WIDTH-1:0] = {vb_yy_grant_id[1:0], ebiu_aw_buf_sdb_sel_after[23:0]};

assign ebiu_sel_fifo_pop_en    = ebiu_w_buf_create_en;
assign ebiu_aw_buf_sdb_sel_after[23:0] = ebiu_aw_buf_sdb_sel[DEPTH-1:0];

ct_fifo #(.WIDTH(VBSEL_WIDTH), .DEPTH(2), .PTR_W(1)) x_ct_ciu_ebiu_sel_fifo(
  .clk                   (forever_cpuclk            ),
  .rst_b                 (cpurst_b                  ),
  .fifo_create_en        (ebiu_sel_fifo_create_en   ),
  .fifo_create_en_dp     (ebiu_sel_fifo_create_en   ),
  .fifo_pop_en           (ebiu_sel_fifo_pop_en      ),
  .fifo_create_data      (ebiu_sel_fifo_create_bus  ),
  .fifo_pop_data         (ebiu_sel_fifo_pop_bus     ),
  .fifo_pop_data_vld     (ebiu_sel_fifo_pop_bus_vld ),
  .fifo_full             (ebiu_sel_fifo_full        ),
  .fifo_empty            (ebiu_sel_fifo_empty       ),
  .pad_yy_icg_scan_en  (pad_yy_icg_scan_en   ),
  .fifo_icg_en           (ciu_icg_en)
);

assign arb_sdb_ebiu_sel[DEPTH-1:0] = ebiu_sel_fifo_pop_bus[DEPTH-1:0];

//--------------------------------------
//      ebiu w buf
//--------------------------------------
parameter EBIU_D_WIDTH  = 535;

assign ebiu_w_buf_create_en =  ebiu_sel_fifo_pop_bus_vld & ebiu_w_buf_idle;
assign ebiu_w_buf_idle      = !ebiu_w_buf_vld | vb_snb_w_grant;
assign ebiu_w_buf_pop_en    =  ebiu_w_buf_vld & vb_snb_w_grant;

always@(posedge forever_cpuclk or negedge cpurst_b)
begin
  if (!cpurst_b)
    ebiu_w_buf_vld <= 1'b0;
  else if (ebiu_w_buf_create_en) 
    ebiu_w_buf_vld <= 1'b1;
  else if (ebiu_w_buf_pop_en)
    ebiu_w_buf_vld <= 1'b0;
end

assign ebiu_w_buf_clk_en = ebiu_w_buf_create_en;
// &Instance("gated_clk_cell", "x_ebiu_w_buf_gated_clk"); @1027
gated_clk_cell  x_ebiu_w_buf_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (ebiu_w_buf_clk    ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (ebiu_w_buf_clk_en ),
  .module_en          (ciu_icg_en        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @1028
//          .external_en (1'b0), @1029
//          .global_en   (1'b1), @1030
//          .module_en (ciu_icg_en       ), @1031
//          .local_en    (ebiu_w_buf_clk_en), @1032
//          .clk_out     (ebiu_w_buf_clk)); @1033

always@(posedge ebiu_w_buf_clk or negedge cpurst_b)
begin
  if(~cpurst_b)begin
    ebiu_w_buf_cont[EBIU_D_WIDTH-1:0] <= {EBIU_D_WIDTH{1'b0}};
    ebiu_w_buf_sel[DEPTH-1:0]         <= {DEPTH{1'b0}};
    ebiu_w_buf_vid[1:0]               <= 2'b0; 
  end
  else if (ebiu_w_buf_create_en) begin
    ebiu_w_buf_cont[EBIU_D_WIDTH-1:0] <= sdb_arb_ebiu_w_bus[EBIU_D_WIDTH-1:0];
    ebiu_w_buf_sel[DEPTH-1:0]         <= ebiu_sel_fifo_pop_bus[DEPTH-1:0];
    ebiu_w_buf_vid[1:0]               <= ebiu_sel_fifo_pop_bus[VBSEL_WIDTH-1:DEPTH];
  end
end

assign snb_vb_wvalid   = ebiu_w_buf_vld;
assign snb_vb_vid[1:0] = ebiu_w_buf_vid[1:0];
assign snb_vb_wbus[EBIU_D_WIDTH-1:0] = ebiu_w_buf_cont[EBIU_D_WIDTH-1:0];

//--------------------------------------
//      ebiu aw\w grant and cmplt
//--------------------------------------

assign sab_memw_aw_grant     = ebiu_aw_buf_idle;

assign sab_memw_cmplt        = vb_snb_w_grant;

assign sab_memw_cmplt_sel[DEPTH-1:0] 
                             = ebiu_w_buf_sel[DEPTH-1:0];

//================================================
//  ebiu rd DP
//================================================
//--------------------------------------
//            EBIU RD BUF
//--------------------------------------
parameter EBIU_AR_WIDTH = 69;

assign ebiu_ar_buf_create_en =  sab_arb_ebiu_ar_req & ebiu_ar_buf_idle;
assign ebiu_ar_buf_create_en_gate = sab_arb_ebiu_ar_req & (!ebiu_ar_buf_vld | ebiuif_snb_ar_grant_gate);
assign ebiu_ar_buf_idle      = !ebiu_ar_buf_vld | ebiuif_snb_ar_grant;
assign ebiu_ar_buf_pop_en    =  ebiu_ar_buf_vld & ebiuif_snb_ar_grant;

always@(posedge forever_cpuclk or negedge cpurst_b)
begin
  if (!cpurst_b)
    ebiu_ar_buf_vld <= 1'b0;
  else if (ebiu_ar_buf_create_en) 
    ebiu_ar_buf_vld <= 1'b1;
  else if (ebiu_ar_buf_pop_en)
    ebiu_ar_buf_vld <= 1'b0;
end

always@(posedge ebiu_ar_buf_clk or negedge cpurst_b)
begin
  if(~cpurst_b)
    ebiu_ar_buf_cont[EBIU_AR_WIDTH-1:0] <= {EBIU_AR_WIDTH{1'b0}};
  else if (ebiu_ar_buf_create_en)
    ebiu_ar_buf_cont[EBIU_AR_WIDTH-1:0] <= sab_arb_ebiu_ar_bus[EBIU_AR_WIDTH-1:0];
end

assign snb_ebiuif_arvalid = ebiu_ar_buf_vld;
assign snb_ebiuif_arbus[EBIU_AR_WIDTH-1:0] 
                          = ebiu_ar_buf_cont[EBIU_AR_WIDTH-1:0];


//--------------------------------------
//      ebiu ar grant and cmplt
//--------------------------------------
assign sab_memr_grant          = ebiu_ar_buf_idle;

assign sab_memr_vld            = ebiuif_snb_rvalid;
assign sab_memr_last           = ebiuif_xx_rlast;
assign sab_memr_resp[3:0]      = ebiuif_xx_rresp[3:0];
assign sab_memr_data[127:0]    = ebiuif_xx_rdata[127:0];
assign sab_memr_sel[DEPTH-1:0] = ebiuif_xx_entry_sel[DEPTH-1:0];

// &Force("mem","cr_sel",RDEPTH-1,0,SEL_DEPTH-1,0); @1172
// &CombBeg; @1192
// &CombEnd; @1213
// &Instance("gated_clk_cell", "x_ebiu_cr_buf_gated_clk"); @1238
// &Connect(.clk_in      (forever_cpuclk), @1239
//          .external_en (1'b0), @1240
//          .global_en   (1'b1), @1241
//          .module_en (ciu_icg_en       ), @1242
//          .local_en    (ebiu_cr_buf_clk_en), @1243
//          .clk_out     (ebiu_cr_buf_clk)); @1244
// &Force("mem","cd_sel",RDEPTH-1,0,SEL_DEPTH-1,0); @1304
// &Instance("gated_clk_cell", "x_ebiu_cd_buf_gated_clk"); @1349
// &Connect(.clk_in      (forever_cpuclk), @1350
//          .external_en (1'b0), @1351
//          .global_en   (1'b1), @1352
//          .module_en (ciu_icg_en       ), @1353
//          .local_en    (ebiu_cd_buf_clk_en), @1354
//          .clk_out     (ebiu_cd_buf_clk)); @1355
//================================================
//  Rresp DP
//================================================
//--------------------------------------
//   R BUF
//--------------------------------------
parameter R_DATA_WIDTH = 512;
parameter UPKB_WIDTH   = 535;
parameter R_RESP_0 = 0;
parameter R_RESP_6 = 6;
parameter R_RID_0  = 7;
parameter R_RID_4  = 11;
parameter R_RID_5  = 12;
parameter R_RID_7  = 14;
parameter R_SID_0  = 15;
parameter R_SID_4  = 19;
parameter R_ADDR_4 = 20;
parameter R_ADDR_5 = 21;
parameter R_LEN_0  = 22;
parameter R_LEN_1  = 23;
parameter R_RESP_WIDTH = 24;

assign piu_sab_r_grant[CORE_NUM-1:0] = {piu4_snb_r_grant,
                                        piu3_snb_r_grant,
                                        piu2_snb_r_grant,
                                        piu1_snb_r_grant,
                                        piu0_snb_r_grant};
              
assign piu_r_grant    = |piu_sab_r_grant[CORE_NUM-1:0];
assign rresp_req_vld  = sab_arb_rresp_req;

assign rresp_buf_wen  = rresp_req_vld & rresp_buf_idle;
assign rresp_buf_idle = !rresp_buf_vld | rresp_buf_pop;
assign rresp_buf_pop  = rresp_buf_vld & piu_r_grant; 

always@(posedge forever_cpuclk or negedge cpurst_b)
begin
  if (!cpurst_b)
    rresp_buf_vld <= 1'b0;
  else if (rresp_buf_wen)
    rresp_buf_vld <= 1'b1;
  else if (rresp_buf_pop)
    rresp_buf_vld <= 1'b0;
end


always@(posedge rresp_buf_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
  begin
    rresp_buf_sab_cont[R_RESP_WIDTH-1:0] <= {R_RESP_WIDTH{1'b0}};
    rresp_buf_sdb_cont[R_DATA_WIDTH-1:0] <= {R_DATA_WIDTH{1'b0}};
  end
  else if (rresp_buf_wen)
  begin
    rresp_buf_sab_cont[R_RESP_WIDTH-1:0] <= sab_arb_rresp_ctrl[R_RESP_WIDTH-1:0];
    rresp_buf_sdb_cont[R_DATA_WIDTH-1:0] <= sdb_arb_rresp_data[R_DATA_WIDTH-1:0];
  end
end

assign arb_sab_rresp_grant = rresp_buf_wen;
assign arb_sab_rresp_grant_sid[4:0] = sab_arb_rresp_ctrl[R_SID_4:R_SID_0];

assign snb_piu0_rvalid = rresp_buf_vld & (rresp_buf_sab_cont[R_RID_7:R_RID_5] == 3'b000);
assign snb_piu1_rvalid = rresp_buf_vld & (rresp_buf_sab_cont[R_RID_7:R_RID_5] == 3'b001);
assign snb_piu2_rvalid = rresp_buf_vld & (rresp_buf_sab_cont[R_RID_7:R_RID_5] == 3'b010);
assign snb_piu3_rvalid = rresp_buf_vld & (rresp_buf_sab_cont[R_RID_7:R_RID_5] == 3'b011); 
assign snb_piu4_rvalid = rresp_buf_vld & (rresp_buf_sab_cont[R_RID_7:R_RID_5] == 3'b100);

assign snb_piux_rbus[UPKB_WIDTH-1:0] = {rresp_buf_sab_cont[R_LEN_1:R_LEN_0],
                                        rresp_buf_sab_cont[R_ADDR_5:R_ADDR_4],
                                        1'b0, snb1,
                                        rresp_buf_sab_cont[R_SID_4:R_SID_0],
                                        rresp_buf_sab_cont[R_RID_4:R_RID_0],
                                        rresp_buf_sab_cont[R_RESP_6:R_RESP_0],
                                        rresp_buf_sdb_cont[R_DATA_WIDTH-1:0]};

//================================================
//  Bresp DP
//================================================
parameter B_WIDTH  = 14;
parameter B_RESP_0 = 0;
parameter B_RESP_1 = 1;
parameter B_BID_0  = 2;
parameter B_BID_4  = 6;
parameter B_BID_5  = 7;
parameter B_BID_7  = 9;
parameter B_SID_0  = 10;
parameter B_SID_4  = 14;

assign bresp_req_vld = sab_arb_bresp_req;

assign snb_piu0_bvalid = bresp_req_vld && (sab_arb_bresp_bus[B_BID_7:B_BID_5] == 3'b000);
assign snb_piu1_bvalid = bresp_req_vld && (sab_arb_bresp_bus[B_BID_7:B_BID_5] == 3'b001);
assign snb_piu2_bvalid = bresp_req_vld && (sab_arb_bresp_bus[B_BID_7:B_BID_5] == 3'b010);
assign snb_piu3_bvalid = bresp_req_vld && (sab_arb_bresp_bus[B_BID_7:B_BID_5] == 3'b011);
assign snb_piu4_bvalid = bresp_req_vld && (sab_arb_bresp_bus[B_BID_7:B_BID_5] == 3'b100);

assign snb_piux_bbus[B_WIDTH-1:0] = {1'b0, snb1,
                                     sab_arb_bresp_bus[B_SID_4:B_SID_0],
                                     sab_arb_bresp_bus[B_BID_4:B_BID_0],
                                     sab_arb_bresp_bus[B_RESP_1:B_RESP_0]};

assign piu_sab_b_grant[CORE_NUM-1:0] = {piu4_snb_b_grant,
                                        piu3_snb_b_grant,
                                        piu2_snb_b_grant,
                                        piu1_snb_b_grant,
                                        piu0_snb_b_grant};

assign arb_sab_bresp_grant = |piu_sab_b_grant[CORE_NUM-1:0];
assign arb_sab_bresp_grant_sid[4:0] = sab_arb_bresp_bus[B_SID_4:B_SID_0];

//================================================
//  Bar cmplt
//================================================

assign snb_piu0_bar_cmplt = sab_snp_bar_cmplt[0];
assign snb_piu1_bar_cmplt = sab_snp_bar_cmplt[1];
assign snb_piu2_bar_cmplt = sab_snp_bar_cmplt[2];
assign snb_piu3_bar_cmplt = sab_snp_bar_cmplt[3];

//================================================
// no op
//================================================

assign snb_xx_no_op = ~((|sab_entry_busy[DEPTH-1:0]) | sab_ar_crt_entry_vld | sab_aw_crt_entry_vld);

//==========================================================
//                     gated cell
//==========================================================

assign l2c_pop_clk_en  = sab_l2c_req_vld;
// &Instance("gated_clk_cell", "x_l2c_pop_entry_gated_clk"); @1508
gated_clk_cell  x_l2c_pop_entry_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (l2c_pop_clk       ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (l2c_pop_clk_en    ),
  .module_en          (ciu_icg_en        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @1509
//          .external_en (1'b0), @1510
//          .global_en   (1'b1), @1511
//          .module_en (ciu_icg_en       ), @1512
//          .local_en    (l2c_pop_clk_en), @1513
//          .clk_out     (l2c_pop_clk)); @1514

assign ebiu_ar_buf_clk_en = ebiu_ar_buf_create_en_gate;
// &Instance("gated_clk_cell", "x_ebiu_ar_buf_gated_clk"); @1517
gated_clk_cell  x_ebiu_ar_buf_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (ebiu_ar_buf_clk   ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (ebiu_ar_buf_clk_en),
  .module_en          (ciu_icg_en        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @1518
//          .external_en (1'b0), @1519
//          .global_en   (1'b1), @1520
//          .module_en (ciu_icg_en       ), @1521
//          .local_en    (ebiu_ar_buf_clk_en), @1522
//          .clk_out     (ebiu_ar_buf_clk)); @1523

assign ebiu_aw_buf_clk_en = ebiu_aw_buf_create_en;
// &Instance("gated_clk_cell", "x_ebiu_aw_buf_gated_clk"); @1526
gated_clk_cell  x_ebiu_aw_buf_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (ebiu_aw_buf_clk   ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (ebiu_aw_buf_clk_en),
  .module_en          (ciu_icg_en        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @1527
//          .external_en (1'b0), @1528
//          .global_en   (1'b1), @1529
//          .module_en (ciu_icg_en       ), @1530
//          .local_en    (ebiu_aw_buf_clk_en), @1531
//          .clk_out     (ebiu_aw_buf_clk)); @1532


assign rresp_buf_clk_en = rresp_buf_wen;
// &Instance("gated_clk_cell", "x_rresp_buf_gated_clk"); @1536
gated_clk_cell  x_rresp_buf_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (rresp_buf_clk     ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (rresp_buf_clk_en  ),
  .module_en          (ciu_icg_en        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @1537
//          .external_en (1'b0), @1538
//          .global_en   (1'b1), @1539
//          .module_en (ciu_icg_en       ), @1540
//          .local_en    (rresp_buf_clk_en), @1541
//          .clk_out     (rresp_buf_clk)); @1542



// &ModuleEnd; @1598
endmodule



