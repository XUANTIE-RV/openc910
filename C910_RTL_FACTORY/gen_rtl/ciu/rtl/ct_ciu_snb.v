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

// &ModuleBeg; @18
module ct_ciu_snb(
  bmbif_snb_bar_req,
  bmbif_snb_mid,
  bmbif_snb_req_bus,
  ciu_chr2_bar_dis,
  ciu_chr2_sf_dis,
  ciu_icg_en,
  ciu_xx_smpen,
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
  snb1,
  snb_bmbif_bar_grant,
  snb_dbg_info,
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
  vb_snb_aw_grant,
  vb_snb_w_grant,
  vb_yy_grant_id
);

// &Ports; @19
input            bmbif_snb_bar_req;       
input   [2  :0]  bmbif_snb_mid;           
input   [8  :0]  bmbif_snb_req_bus;       
input            ciu_chr2_bar_dis;        
input            ciu_chr2_sf_dis;         
input            ciu_icg_en;              
input   [3  :0]  ciu_xx_smpen;            
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
input            snb1;                    
input            snb_snpext_depd_ebiu;    
input            snb_snpext_depd_vb;      
input            vb_snb_aw_grant;         
input            vb_snb_w_grant;          
input   [1  :0]  vb_yy_grant_id;          
output           snb_bmbif_bar_grant;     
output  [95 :0]  snb_dbg_info;            
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

// &Regs; @20

// &Wires; @21
wire    [6  :0]  ar_crt_entry_index;      
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
wire    [6  :0]  aw_crt_entry_index;      
wire             bmbif_snb_bar_req;       
wire    [2  :0]  bmbif_snb_mid;           
wire    [8  :0]  bmbif_snb_req_bus;       
wire             ciu_chr2_bar_dis;        
wire             ciu_chr2_sf_dis;         
wire             ciu_icg_en;              
wire    [3  :0]  ciu_xx_smpen;            
wire             cpurst_b;                
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
wire    [70 :0]  sab_ar_create_bus;       
wire             sab_ar_create_en;        
wire    [2  :0]  sab_ar_create_mid;       
wire    [15 :0]  sab_ar_create_sel;       
wire    [4  :0]  sab_ar_create_snpl2_isid; 
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
wire    [70 :0]  sab_aw_create_bus;       
wire             sab_aw_create_en;        
wire    [2  :0]  sab_aw_create_mid;       
wire    [7  :0]  sab_aw_create_sel;       
wire    [23 :0]  sab_back_sel;            
wire    [4  :0]  sab_crresp_piu0;         
wire    [4  :0]  sab_crresp_piu1;         
wire    [4  :0]  sab_crresp_piu2;         
wire    [4  :0]  sab_crresp_piu3;         
wire    [23 :0]  sab_crvld_piu0;          
wire    [23 :0]  sab_crvld_piu1;          
wire    [23 :0]  sab_crvld_piu2;          
wire    [23 :0]  sab_crvld_piu3;          
wire    [23 :0]  sab_entry_busy;          
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
wire    [23 :0]  sab_rack_sel;            
wire    [3  :0]  sab_snp_bar_cmplt;       
wire             sab_snpext_depd_vld;     
wire    [3  :0]  sab_wcd_create_cdsel;    
wire    [511:0]  sab_wcd_create_data;     
wire    [23 :0]  sab_wcd_create_en;       
wire             sab_wcd_create_err;      
wire    [15 :0]  sab_wcd_create_wstrb;    
wire    [534:0]  sdb_arb_ebiu_w_bus;      
wire    [511:0]  sdb_arb_l2c_data_bus;    
wire    [511:0]  sdb_arb_rresp_data;      
wire             snb1;                    
wire             snb_bmbif_bar_grant;     
wire    [95 :0]  snb_dbg_info;            
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
wire    [6  :0]  snpext_index;            
wire             snpext_vld;              
wire             vb_snb_aw_grant;         
wire             vb_snb_w_grant;          
wire    [1  :0]  vb_yy_grant_id;          


// &Force("output","snb_bmbif_bar_grant"); @23
// &Instance("ct_ciu_snb_arb", "x_ct_ciu_snb_arb"); @24
ct_ciu_snb_arb  x_ct_ciu_snb_arb (
  .ar_crt_entry_index       (ar_crt_entry_index      ),
  .arb_sab_bresp_grant      (arb_sab_bresp_grant     ),
  .arb_sab_bresp_grant_sid  (arb_sab_bresp_grant_sid ),
  .arb_sab_l2c_cmplt        (arb_sab_l2c_cmplt       ),
  .arb_sab_l2c_cmplt_sid    (arb_sab_l2c_cmplt_sid   ),
  .arb_sab_l2c_cp           (arb_sab_l2c_cp          ),
  .arb_sab_l2c_data         (arb_sab_l2c_data        ),
  .arb_sab_l2c_grant        (arb_sab_l2c_grant       ),
  .arb_sab_l2c_resp         (arb_sab_l2c_resp        ),
  .arb_sab_no_l2c_req       (arb_sab_no_l2c_req      ),
  .arb_sab_rresp_grant      (arb_sab_rresp_grant     ),
  .arb_sab_rresp_grant_sid  (arb_sab_rresp_grant_sid ),
  .arb_sdb_ebiu_sel         (arb_sdb_ebiu_sel        ),
  .arb_sdb_l2c_sel          (arb_sdb_l2c_sel         ),
  .aw_crt_entry_index       (aw_crt_entry_index      ),
  .bmbif_snb_bar_req        (bmbif_snb_bar_req       ),
  .bmbif_snb_mid            (bmbif_snb_mid           ),
  .bmbif_snb_req_bus        (bmbif_snb_req_bus       ),
  .ciu_icg_en               (ciu_icg_en              ),
  .cpurst_b                 (cpurst_b                ),
  .ebiuif_snb_acvalid       (ebiuif_snb_acvalid      ),
  .ebiuif_snb_ar_grant      (ebiuif_snb_ar_grant     ),
  .ebiuif_snb_ar_grant_gate (ebiuif_snb_ar_grant_gate),
  .ebiuif_snb_rvalid        (ebiuif_snb_rvalid       ),
  .ebiuif_snbx_acbus        (ebiuif_snbx_acbus       ),
  .ebiuif_xx_entry_sel      (ebiuif_xx_entry_sel     ),
  .ebiuif_xx_rdata          (ebiuif_xx_rdata         ),
  .ebiuif_xx_rlast          (ebiuif_xx_rlast         ),
  .ebiuif_xx_rresp          (ebiuif_xx_rresp         ),
  .forever_cpuclk           (forever_cpuclk          ),
  .l2c_snb_addr_grant       (l2c_snb_addr_grant      ),
  .l2c_snb_cmplt            (l2c_snb_cmplt           ),
  .l2c_snb_cmplt_sid        (l2c_snb_cmplt_sid       ),
  .l2c_snb_cp               (l2c_snb_cp              ),
  .l2c_snb_data             (l2c_snb_data            ),
  .l2c_snb_data_grant       (l2c_snb_data_grant      ),
  .l2c_snb_data_grant_gate  (l2c_snb_data_grant_gate ),
  .l2c_snb_prf_bus          (l2c_snb_prf_bus         ),
  .l2c_snb_prf_req          (l2c_snb_prf_req         ),
  .l2c_snb_resp             (l2c_snb_resp            ),
  .l2c_snb_snpl2_bus        (l2c_snb_snpl2_bus       ),
  .l2c_snb_snpl2_ini_sid    (l2c_snb_snpl2_ini_sid   ),
  .l2c_snb_snpl2_req        (l2c_snb_snpl2_req       ),
  .pad_yy_icg_scan_en       (pad_yy_icg_scan_en      ),
  .piu0_snb_ac_grant        (piu0_snb_ac_grant       ),
  .piu0_snb_ar_bus          (piu0_snb_ar_bus         ),
  .piu0_snb_ar_req          (piu0_snb_ar_req         ),
  .piu0_snb_aw_req          (piu0_snb_aw_req         ),
  .piu0_snb_b_grant         (piu0_snb_b_grant        ),
  .piu0_snb_back            (piu0_snb_back           ),
  .piu0_snb_cr_bus          (piu0_snb_cr_bus         ),
  .piu0_snb_cr_req          (piu0_snb_cr_req         ),
  .piu0_snb_r_grant         (piu0_snb_r_grant        ),
  .piu0_snb_rack            (piu0_snb_rack           ),
  .piu0_snb_wcd_req         (piu0_snb_wcd_req        ),
  .piu0_snbx_back_sid       (piu0_snbx_back_sid      ),
  .piu0_snbx_rack_sid       (piu0_snbx_rack_sid      ),
  .piu0_xx_aw_bus           (piu0_xx_aw_bus          ),
  .piu0_xx_wcd_bus          (piu0_xx_wcd_bus         ),
  .piu1_snb_ac_grant        (piu1_snb_ac_grant       ),
  .piu1_snb_ar_bus          (piu1_snb_ar_bus         ),
  .piu1_snb_ar_req          (piu1_snb_ar_req         ),
  .piu1_snb_aw_req          (piu1_snb_aw_req         ),
  .piu1_snb_b_grant         (piu1_snb_b_grant        ),
  .piu1_snb_back            (piu1_snb_back           ),
  .piu1_snb_cr_bus          (piu1_snb_cr_bus         ),
  .piu1_snb_cr_req          (piu1_snb_cr_req         ),
  .piu1_snb_r_grant         (piu1_snb_r_grant        ),
  .piu1_snb_rack            (piu1_snb_rack           ),
  .piu1_snb_wcd_req         (piu1_snb_wcd_req        ),
  .piu1_snbx_back_sid       (piu1_snbx_back_sid      ),
  .piu1_snbx_rack_sid       (piu1_snbx_rack_sid      ),
  .piu1_xx_aw_bus           (piu1_xx_aw_bus          ),
  .piu1_xx_wcd_bus          (piu1_xx_wcd_bus         ),
  .piu2_snb_ac_grant        (piu2_snb_ac_grant       ),
  .piu2_snb_ar_bus          (piu2_snb_ar_bus         ),
  .piu2_snb_ar_req          (piu2_snb_ar_req         ),
  .piu2_snb_aw_req          (piu2_snb_aw_req         ),
  .piu2_snb_b_grant         (piu2_snb_b_grant        ),
  .piu2_snb_back            (piu2_snb_back           ),
  .piu2_snb_cr_bus          (piu2_snb_cr_bus         ),
  .piu2_snb_cr_req          (piu2_snb_cr_req         ),
  .piu2_snb_r_grant         (piu2_snb_r_grant        ),
  .piu2_snb_rack            (piu2_snb_rack           ),
  .piu2_snb_wcd_req         (piu2_snb_wcd_req        ),
  .piu2_snbx_back_sid       (piu2_snbx_back_sid      ),
  .piu2_snbx_rack_sid       (piu2_snbx_rack_sid      ),
  .piu2_xx_aw_bus           (piu2_xx_aw_bus          ),
  .piu2_xx_wcd_bus          (piu2_xx_wcd_bus         ),
  .piu3_snb_ac_grant        (piu3_snb_ac_grant       ),
  .piu3_snb_ar_bus          (piu3_snb_ar_bus         ),
  .piu3_snb_ar_req          (piu3_snb_ar_req         ),
  .piu3_snb_aw_req          (piu3_snb_aw_req         ),
  .piu3_snb_b_grant         (piu3_snb_b_grant        ),
  .piu3_snb_back            (piu3_snb_back           ),
  .piu3_snb_cr_bus          (piu3_snb_cr_bus         ),
  .piu3_snb_cr_req          (piu3_snb_cr_req         ),
  .piu3_snb_r_grant         (piu3_snb_r_grant        ),
  .piu3_snb_rack            (piu3_snb_rack           ),
  .piu3_snb_wcd_req         (piu3_snb_wcd_req        ),
  .piu3_snbx_back_sid       (piu3_snbx_back_sid      ),
  .piu3_snbx_rack_sid       (piu3_snbx_rack_sid      ),
  .piu3_xx_aw_bus           (piu3_xx_aw_bus          ),
  .piu3_xx_wcd_bus          (piu3_xx_wcd_bus         ),
  .piu4_snb_ar_bus          (piu4_snb_ar_bus         ),
  .piu4_snb_ar_req          (piu4_snb_ar_req         ),
  .piu4_snb_aw_req          (piu4_snb_aw_req         ),
  .piu4_snb_b_grant         (piu4_snb_b_grant        ),
  .piu4_snb_back            (piu4_snb_back           ),
  .piu4_snb_r_grant         (piu4_snb_r_grant        ),
  .piu4_snb_rack            (piu4_snb_rack           ),
  .piu4_snb_wcd_req         (piu4_snb_wcd_req        ),
  .piu4_snbx_back_sid       (piu4_snbx_back_sid      ),
  .piu4_snbx_rack_sid       (piu4_snbx_rack_sid      ),
  .piu4_xx_aw_bus           (piu4_xx_aw_bus          ),
  .piu4_xx_wcd_bus          (piu4_xx_wcd_bus         ),
  .sab_ar_create_bus        (sab_ar_create_bus       ),
  .sab_ar_create_en         (sab_ar_create_en        ),
  .sab_ar_create_mid        (sab_ar_create_mid       ),
  .sab_ar_create_sel        (sab_ar_create_sel       ),
  .sab_ar_create_snpl2_isid (sab_ar_create_snpl2_isid),
  .sab_arb_bresp_bus        (sab_arb_bresp_bus       ),
  .sab_arb_bresp_req        (sab_arb_bresp_req       ),
  .sab_arb_ebiu_ar_bus      (sab_arb_ebiu_ar_bus     ),
  .sab_arb_ebiu_ar_req      (sab_arb_ebiu_ar_req     ),
  .sab_arb_ebiu_aw_bus      (sab_arb_ebiu_aw_bus     ),
  .sab_arb_ebiu_aw_mid      (sab_arb_ebiu_aw_mid     ),
  .sab_arb_ebiu_aw_req      (sab_arb_ebiu_aw_req     ),
  .sab_arb_ebiu_aw_sel      (sab_arb_ebiu_aw_sel     ),
  .sab_arb_l2c_addr_bus     (sab_arb_l2c_addr_bus    ),
  .sab_arb_l2c_hpcp_bus     (sab_arb_l2c_hpcp_bus    ),
  .sab_arb_l2c_req          (sab_arb_l2c_req         ),
  .sab_arb_l2c_sel          (sab_arb_l2c_sel         ),
  .sab_arb_rresp_ctrl       (sab_arb_rresp_ctrl      ),
  .sab_arb_rresp_req        (sab_arb_rresp_req       ),
  .sab_aw_create_bus        (sab_aw_create_bus       ),
  .sab_aw_create_en         (sab_aw_create_en        ),
  .sab_aw_create_mid        (sab_aw_create_mid       ),
  .sab_aw_create_sel        (sab_aw_create_sel       ),
  .sab_back_sel             (sab_back_sel            ),
  .sab_crresp_piu0          (sab_crresp_piu0         ),
  .sab_crresp_piu1          (sab_crresp_piu1         ),
  .sab_crresp_piu2          (sab_crresp_piu2         ),
  .sab_crresp_piu3          (sab_crresp_piu3         ),
  .sab_crvld_piu0           (sab_crvld_piu0          ),
  .sab_crvld_piu1           (sab_crvld_piu1          ),
  .sab_crvld_piu2           (sab_crvld_piu2          ),
  .sab_crvld_piu3           (sab_crvld_piu3          ),
  .sab_entry_busy           (sab_entry_busy          ),
  .sab_memr_data            (sab_memr_data           ),
  .sab_memr_grant           (sab_memr_grant          ),
  .sab_memr_last            (sab_memr_last           ),
  .sab_memr_resp            (sab_memr_resp           ),
  .sab_memr_sel             (sab_memr_sel            ),
  .sab_memr_vld             (sab_memr_vld            ),
  .sab_memw_aw_grant        (sab_memw_aw_grant       ),
  .sab_memw_cmplt           (sab_memw_cmplt          ),
  .sab_memw_cmplt_sel       (sab_memw_cmplt_sel      ),
  .sab_piu0_ac_bus          (sab_piu0_ac_bus         ),
  .sab_piu0_ac_grant        (sab_piu0_ac_grant       ),
  .sab_piu0_ac_vld          (sab_piu0_ac_vld         ),
  .sab_piu1_ac_bus          (sab_piu1_ac_bus         ),
  .sab_piu1_ac_grant        (sab_piu1_ac_grant       ),
  .sab_piu1_ac_vld          (sab_piu1_ac_vld         ),
  .sab_piu2_ac_bus          (sab_piu2_ac_bus         ),
  .sab_piu2_ac_grant        (sab_piu2_ac_grant       ),
  .sab_piu2_ac_vld          (sab_piu2_ac_vld         ),
  .sab_piu3_ac_bus          (sab_piu3_ac_bus         ),
  .sab_piu3_ac_grant        (sab_piu3_ac_grant       ),
  .sab_piu3_ac_vld          (sab_piu3_ac_vld         ),
  .sab_rack_sel             (sab_rack_sel            ),
  .sab_snp_bar_cmplt        (sab_snp_bar_cmplt       ),
  .sab_snpext_depd_vld      (sab_snpext_depd_vld     ),
  .sab_wcd_create_cdsel     (sab_wcd_create_cdsel    ),
  .sab_wcd_create_data      (sab_wcd_create_data     ),
  .sab_wcd_create_en        (sab_wcd_create_en       ),
  .sab_wcd_create_err       (sab_wcd_create_err      ),
  .sab_wcd_create_wstrb     (sab_wcd_create_wstrb    ),
  .sdb_arb_ebiu_w_bus       (sdb_arb_ebiu_w_bus      ),
  .sdb_arb_l2c_data_bus     (sdb_arb_l2c_data_bus    ),
  .sdb_arb_rresp_data       (sdb_arb_rresp_data      ),
  .snb1                     (snb1                    ),
  .snb_bmbif_bar_grant      (snb_bmbif_bar_grant     ),
  .snb_ebiuif_ac_grant      (snb_ebiuif_ac_grant     ),
  .snb_ebiuif_arbus         (snb_ebiuif_arbus        ),
  .snb_ebiuif_arvalid       (snb_ebiuif_arvalid      ),
  .snb_l2c_addr_bus         (snb_l2c_addr_bus        ),
  .snb_l2c_addr_req         (snb_l2c_addr_req        ),
  .snb_l2c_data_bus         (snb_l2c_data_bus        ),
  .snb_l2c_data_req         (snb_l2c_data_req        ),
  .snb_l2c_hpcp_bus         (snb_l2c_hpcp_bus        ),
  .snb_l2c_prf_grant        (snb_l2c_prf_grant       ),
  .snb_l2c_snpl2_grant      (snb_l2c_snpl2_grant     ),
  .snb_piu0_acbus           (snb_piu0_acbus          ),
  .snb_piu0_acvalid         (snb_piu0_acvalid        ),
  .snb_piu0_ar_grant        (snb_piu0_ar_grant       ),
  .snb_piu0_aw_grant        (snb_piu0_aw_grant       ),
  .snb_piu0_bar_cmplt       (snb_piu0_bar_cmplt      ),
  .snb_piu0_bvalid          (snb_piu0_bvalid         ),
  .snb_piu0_cr_grant        (snb_piu0_cr_grant       ),
  .snb_piu0_rvalid          (snb_piu0_rvalid         ),
  .snb_piu0_wcd_grant       (snb_piu0_wcd_grant      ),
  .snb_piu1_acbus           (snb_piu1_acbus          ),
  .snb_piu1_acvalid         (snb_piu1_acvalid        ),
  .snb_piu1_ar_grant        (snb_piu1_ar_grant       ),
  .snb_piu1_aw_grant        (snb_piu1_aw_grant       ),
  .snb_piu1_bar_cmplt       (snb_piu1_bar_cmplt      ),
  .snb_piu1_bvalid          (snb_piu1_bvalid         ),
  .snb_piu1_cr_grant        (snb_piu1_cr_grant       ),
  .snb_piu1_rvalid          (snb_piu1_rvalid         ),
  .snb_piu1_wcd_grant       (snb_piu1_wcd_grant      ),
  .snb_piu2_acbus           (snb_piu2_acbus          ),
  .snb_piu2_acvalid         (snb_piu2_acvalid        ),
  .snb_piu2_ar_grant        (snb_piu2_ar_grant       ),
  .snb_piu2_aw_grant        (snb_piu2_aw_grant       ),
  .snb_piu2_bar_cmplt       (snb_piu2_bar_cmplt      ),
  .snb_piu2_bvalid          (snb_piu2_bvalid         ),
  .snb_piu2_cr_grant        (snb_piu2_cr_grant       ),
  .snb_piu2_rvalid          (snb_piu2_rvalid         ),
  .snb_piu2_wcd_grant       (snb_piu2_wcd_grant      ),
  .snb_piu3_acbus           (snb_piu3_acbus          ),
  .snb_piu3_acvalid         (snb_piu3_acvalid        ),
  .snb_piu3_ar_grant        (snb_piu3_ar_grant       ),
  .snb_piu3_aw_grant        (snb_piu3_aw_grant       ),
  .snb_piu3_bar_cmplt       (snb_piu3_bar_cmplt      ),
  .snb_piu3_bvalid          (snb_piu3_bvalid         ),
  .snb_piu3_cr_grant        (snb_piu3_cr_grant       ),
  .snb_piu3_rvalid          (snb_piu3_rvalid         ),
  .snb_piu3_wcd_grant       (snb_piu3_wcd_grant      ),
  .snb_piu4_ar_grant        (snb_piu4_ar_grant       ),
  .snb_piu4_aw_grant        (snb_piu4_aw_grant       ),
  .snb_piu4_bvalid          (snb_piu4_bvalid         ),
  .snb_piu4_rvalid          (snb_piu4_rvalid         ),
  .snb_piu4_wcd_grant       (snb_piu4_wcd_grant      ),
  .snb_piux_aw_sid          (snb_piux_aw_sid         ),
  .snb_piux_bbus            (snb_piux_bbus           ),
  .snb_piux_rbus            (snb_piux_rbus           ),
  .snb_snpext_depd_ebiu     (snb_snpext_depd_ebiu    ),
  .snb_snpext_depd_vb       (snb_snpext_depd_vb      ),
  .snb_vb_awbus             (snb_vb_awbus            ),
  .snb_vb_awvalid           (snb_vb_awvalid          ),
  .snb_vb_mid               (snb_vb_mid              ),
  .snb_vb_vid               (snb_vb_vid              ),
  .snb_vb_wbus              (snb_vb_wbus             ),
  .snb_vb_wvalid            (snb_vb_wvalid           ),
  .snb_xx_no_op             (snb_xx_no_op            ),
  .snb_yy_snpext_index      (snb_yy_snpext_index     ),
  .snpext_cen0_raw          (snpext_cen0_raw         ),
  .snpext_index             (snpext_index            ),
  .snpext_vld               (snpext_vld              ),
  .vb_snb_aw_grant          (vb_snb_aw_grant         ),
  .vb_snb_w_grant           (vb_snb_w_grant          ),
  .vb_yy_grant_id           (vb_yy_grant_id          )
);


// &Instance("ct_ciu_snb_sab", "x_ct_ciu_snb_sab"); @26
ct_ciu_snb_sab  x_ct_ciu_snb_sab (
  .ar_crt_entry_index       (ar_crt_entry_index      ),
  .arb_sab_bresp_grant      (arb_sab_bresp_grant     ),
  .arb_sab_bresp_grant_sid  (arb_sab_bresp_grant_sid ),
  .arb_sab_l2c_cmplt        (arb_sab_l2c_cmplt       ),
  .arb_sab_l2c_cmplt_sid    (arb_sab_l2c_cmplt_sid   ),
  .arb_sab_l2c_cp           (arb_sab_l2c_cp          ),
  .arb_sab_l2c_data         (arb_sab_l2c_data        ),
  .arb_sab_l2c_grant        (arb_sab_l2c_grant       ),
  .arb_sab_l2c_resp         (arb_sab_l2c_resp        ),
  .arb_sab_no_l2c_req       (arb_sab_no_l2c_req      ),
  .arb_sab_rresp_grant      (arb_sab_rresp_grant     ),
  .arb_sab_rresp_grant_sid  (arb_sab_rresp_grant_sid ),
  .arb_sdb_ebiu_sel         (arb_sdb_ebiu_sel        ),
  .arb_sdb_l2c_sel          (arb_sdb_l2c_sel         ),
  .aw_crt_entry_index       (aw_crt_entry_index      ),
  .ciu_chr2_bar_dis         (ciu_chr2_bar_dis        ),
  .ciu_chr2_sf_dis          (ciu_chr2_sf_dis         ),
  .ciu_icg_en               (ciu_icg_en              ),
  .ciu_xx_smpen             (ciu_xx_smpen            ),
  .cpurst_b                 (cpurst_b                ),
  .forever_cpuclk           (forever_cpuclk          ),
  .pad_yy_icg_scan_en       (pad_yy_icg_scan_en      ),
  .sab_ar_create_bus        (sab_ar_create_bus       ),
  .sab_ar_create_en         (sab_ar_create_en        ),
  .sab_ar_create_mid        (sab_ar_create_mid       ),
  .sab_ar_create_sel        (sab_ar_create_sel       ),
  .sab_ar_create_snpl2_isid (sab_ar_create_snpl2_isid),
  .sab_arb_bresp_bus        (sab_arb_bresp_bus       ),
  .sab_arb_bresp_req        (sab_arb_bresp_req       ),
  .sab_arb_ebiu_ar_bus      (sab_arb_ebiu_ar_bus     ),
  .sab_arb_ebiu_ar_req      (sab_arb_ebiu_ar_req     ),
  .sab_arb_ebiu_aw_bus      (sab_arb_ebiu_aw_bus     ),
  .sab_arb_ebiu_aw_mid      (sab_arb_ebiu_aw_mid     ),
  .sab_arb_ebiu_aw_req      (sab_arb_ebiu_aw_req     ),
  .sab_arb_ebiu_aw_sel      (sab_arb_ebiu_aw_sel     ),
  .sab_arb_l2c_addr_bus     (sab_arb_l2c_addr_bus    ),
  .sab_arb_l2c_hpcp_bus     (sab_arb_l2c_hpcp_bus    ),
  .sab_arb_l2c_req          (sab_arb_l2c_req         ),
  .sab_arb_l2c_sel          (sab_arb_l2c_sel         ),
  .sab_arb_rresp_ctrl       (sab_arb_rresp_ctrl      ),
  .sab_arb_rresp_req        (sab_arb_rresp_req       ),
  .sab_aw_create_bus        (sab_aw_create_bus       ),
  .sab_aw_create_en         (sab_aw_create_en        ),
  .sab_aw_create_mid        (sab_aw_create_mid       ),
  .sab_aw_create_sel        (sab_aw_create_sel       ),
  .sab_back_sel             (sab_back_sel            ),
  .sab_crresp_piu0          (sab_crresp_piu0         ),
  .sab_crresp_piu1          (sab_crresp_piu1         ),
  .sab_crresp_piu2          (sab_crresp_piu2         ),
  .sab_crresp_piu3          (sab_crresp_piu3         ),
  .sab_crvld_piu0           (sab_crvld_piu0          ),
  .sab_crvld_piu1           (sab_crvld_piu1          ),
  .sab_crvld_piu2           (sab_crvld_piu2          ),
  .sab_crvld_piu3           (sab_crvld_piu3          ),
  .sab_entry_busy           (sab_entry_busy          ),
  .sab_memr_data            (sab_memr_data           ),
  .sab_memr_grant           (sab_memr_grant          ),
  .sab_memr_last            (sab_memr_last           ),
  .sab_memr_resp            (sab_memr_resp           ),
  .sab_memr_sel             (sab_memr_sel            ),
  .sab_memr_vld             (sab_memr_vld            ),
  .sab_memw_aw_grant        (sab_memw_aw_grant       ),
  .sab_memw_cmplt           (sab_memw_cmplt          ),
  .sab_memw_cmplt_sel       (sab_memw_cmplt_sel      ),
  .sab_piu0_ac_bus          (sab_piu0_ac_bus         ),
  .sab_piu0_ac_grant        (sab_piu0_ac_grant       ),
  .sab_piu0_ac_vld          (sab_piu0_ac_vld         ),
  .sab_piu1_ac_bus          (sab_piu1_ac_bus         ),
  .sab_piu1_ac_grant        (sab_piu1_ac_grant       ),
  .sab_piu1_ac_vld          (sab_piu1_ac_vld         ),
  .sab_piu2_ac_bus          (sab_piu2_ac_bus         ),
  .sab_piu2_ac_grant        (sab_piu2_ac_grant       ),
  .sab_piu2_ac_vld          (sab_piu2_ac_vld         ),
  .sab_piu3_ac_bus          (sab_piu3_ac_bus         ),
  .sab_piu3_ac_grant        (sab_piu3_ac_grant       ),
  .sab_piu3_ac_vld          (sab_piu3_ac_vld         ),
  .sab_rack_sel             (sab_rack_sel            ),
  .sab_snp_bar_cmplt        (sab_snp_bar_cmplt       ),
  .sab_snpext_depd_vld      (sab_snpext_depd_vld     ),
  .sab_wcd_create_cdsel     (sab_wcd_create_cdsel    ),
  .sab_wcd_create_data      (sab_wcd_create_data     ),
  .sab_wcd_create_en        (sab_wcd_create_en       ),
  .sab_wcd_create_err       (sab_wcd_create_err      ),
  .sab_wcd_create_wstrb     (sab_wcd_create_wstrb    ),
  .sdb_arb_ebiu_w_bus       (sdb_arb_ebiu_w_bus      ),
  .sdb_arb_l2c_data_bus     (sdb_arb_l2c_data_bus    ),
  .sdb_arb_rresp_data       (sdb_arb_rresp_data      ),
  .snb1                     (snb1                    ),
  .snb_dbg_info             (snb_dbg_info            ),
  .snpext_cen0_raw          (snpext_cen0_raw         ),
  .snpext_index             (snpext_index            ),
  .snpext_vld               (snpext_vld              )
);



// &ModuleEnd; @29
endmodule



