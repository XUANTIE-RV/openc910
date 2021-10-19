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
module ct_ciu_snb_sab(
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
  ciu_chr2_bar_dis,
  ciu_chr2_sf_dis,
  ciu_icg_en,
  ciu_xx_smpen,
  cpurst_b,
  forever_cpuclk,
  pad_yy_icg_scan_en,
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
  snb_dbg_info,
  snpext_cen0_raw,
  snpext_index,
  snpext_vld
);

// &Ports; @23
input   [6  :0]  ar_crt_entry_index;      
input            arb_sab_bresp_grant;     
input   [4  :0]  arb_sab_bresp_grant_sid; 
input            arb_sab_l2c_cmplt;       
input   [4  :0]  arb_sab_l2c_cmplt_sid;   
input   [3  :0]  arb_sab_l2c_cp;          
input   [511:0]  arb_sab_l2c_data;        
input            arb_sab_l2c_grant;       
input   [4  :0]  arb_sab_l2c_resp;        
input            arb_sab_no_l2c_req;      
input            arb_sab_rresp_grant;     
input   [4  :0]  arb_sab_rresp_grant_sid; 
input   [23 :0]  arb_sdb_ebiu_sel;        
input   [23 :0]  arb_sdb_l2c_sel;         
input   [6  :0]  aw_crt_entry_index;      
input            ciu_chr2_bar_dis;        
input            ciu_chr2_sf_dis;         
input            ciu_icg_en;              
input   [3  :0]  ciu_xx_smpen;            
input            cpurst_b;                
input            forever_cpuclk;          
input            pad_yy_icg_scan_en;      
input   [70 :0]  sab_ar_create_bus;       
input            sab_ar_create_en;        
input   [2  :0]  sab_ar_create_mid;       
input   [15 :0]  sab_ar_create_sel;       
input   [4  :0]  sab_ar_create_snpl2_isid; 
input   [70 :0]  sab_aw_create_bus;       
input            sab_aw_create_en;        
input   [2  :0]  sab_aw_create_mid;       
input   [7  :0]  sab_aw_create_sel;       
input   [23 :0]  sab_back_sel;            
input   [4  :0]  sab_crresp_piu0;         
input   [4  :0]  sab_crresp_piu1;         
input   [4  :0]  sab_crresp_piu2;         
input   [4  :0]  sab_crresp_piu3;         
input   [23 :0]  sab_crvld_piu0;          
input   [23 :0]  sab_crvld_piu1;          
input   [23 :0]  sab_crvld_piu2;          
input   [23 :0]  sab_crvld_piu3;          
input   [127:0]  sab_memr_data;           
input            sab_memr_grant;          
input            sab_memr_last;           
input   [3  :0]  sab_memr_resp;           
input   [23 :0]  sab_memr_sel;            
input            sab_memr_vld;            
input            sab_memw_aw_grant;       
input            sab_memw_cmplt;          
input   [23 :0]  sab_memw_cmplt_sel;      
input            sab_piu0_ac_grant;       
input            sab_piu1_ac_grant;       
input            sab_piu2_ac_grant;       
input            sab_piu3_ac_grant;       
input   [23 :0]  sab_rack_sel;            
input   [3  :0]  sab_wcd_create_cdsel;    
input   [511:0]  sab_wcd_create_data;     
input   [23 :0]  sab_wcd_create_en;       
input            sab_wcd_create_err;      
input   [15 :0]  sab_wcd_create_wstrb;    
input            snb1;                    
input   [15 :0]  snpext_cen0_raw;         
input   [6  :0]  snpext_index;            
input            snpext_vld;              
output  [14 :0]  sab_arb_bresp_bus;       
output           sab_arb_bresp_req;       
output  [68 :0]  sab_arb_ebiu_ar_bus;     
output           sab_arb_ebiu_ar_req;     
output  [67 :0]  sab_arb_ebiu_aw_bus;     
output  [2  :0]  sab_arb_ebiu_aw_mid;     
output           sab_arb_ebiu_aw_req;     
output  [23 :0]  sab_arb_ebiu_aw_sel;     
output  [63 :0]  sab_arb_l2c_addr_bus;    
output  [2  :0]  sab_arb_l2c_hpcp_bus;    
output           sab_arb_l2c_req;         
output  [23 :0]  sab_arb_l2c_sel;         
output  [23 :0]  sab_arb_rresp_ctrl;      
output           sab_arb_rresp_req;       
output  [23 :0]  sab_entry_busy;          
output  [54 :0]  sab_piu0_ac_bus;         
output           sab_piu0_ac_vld;         
output  [54 :0]  sab_piu1_ac_bus;         
output           sab_piu1_ac_vld;         
output  [54 :0]  sab_piu2_ac_bus;         
output           sab_piu2_ac_vld;         
output  [54 :0]  sab_piu3_ac_bus;         
output           sab_piu3_ac_vld;         
output  [3  :0]  sab_snp_bar_cmplt;       
output           sab_snpext_depd_vld;     
output  [534:0]  sdb_arb_ebiu_w_bus;      
output  [511:0]  sdb_arb_l2c_data_bus;    
output  [511:0]  sdb_arb_rresp_data;      
output  [95 :0]  snb_dbg_info;            

// &Regs; @24
reg     [14 :0]  sab_arb_bresp_bus;       
reg     [68 :0]  sab_arb_ebiu_ar_bus;     
reg     [67 :0]  sab_arb_ebiu_aw_bus;     
reg     [2  :0]  sab_arb_ebiu_aw_mid;     
reg     [63 :0]  sab_arb_l2c_addr_bus;    
reg     [2  :0]  sab_arb_l2c_hpcp_bus;    
reg     [54 :0]  sab_piu0_ac_bus;         
reg     [54 :0]  sab_piu1_ac_bus;         
reg     [54 :0]  sab_piu2_ac_bus;         
reg     [54 :0]  sab_piu3_ac_bus;         
reg     [535:0]  sab_rresp_bus_pre;       
reg     [534:0]  sdb_arb_ebiu_w_bus;      
reg     [511:0]  sdb_arb_l2c_data_bus;    

// &Wires; @25
wire    [23 :0]  agevec_clr;              
wire    [6  :0]  ar_crt_entry_index;      
wire             ar_piu;                  
wire             ar_snpext;               
wire             ar_snpl2;                
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
wire             aw_bar;                  
wire    [6  :0]  aw_crt_entry_index;      
wire    [2  :0]  aw_mid;                  
wire             aw_sh;                   
wire             aw_wns;                  
wire    [23 :0]  back_mark_by_wns;        
wire    [23 :0]  bresp_grant;             
wire    [23 :0]  bresp_grant_sel;         
wire             ciu_chr2_bar_dis;        
wire             ciu_chr2_sf_dis;         
wire             ciu_icg_en;              
wire    [3  :0]  ciu_xx_smpen;            
wire             cpurst_b;                
wire    [23 :0]  create0_age;             
wire    [74 :0]  create0_bus;             
wire    [23 :0]  create0_depd;            
wire    [23 :0]  create1_age;             
wire    [74 :0]  create1_bus;             
wire    [23 :0]  create1_depd;            
wire    [23 :0]  depd_clr;                
wire    [23 :0]  entry0_age_vect;         
wire    [14 :0]  entry0_bresp_bus;        
wire    [3  :0]  entry0_dbg_info;         
wire    [23 :0]  entry0_depd_set;         
wire    [68 :0]  entry0_ebiu_arbus;       
wire    [67 :0]  entry0_ebiu_awbus;       
wire    [534:0]  entry0_ebiu_dbus;        
wire    [2  :0]  entry0_ebiu_mid;         
wire    [63 :0]  entry0_l2c_addr_bus;     
wire    [511:0]  entry0_l2c_data_bus;     
wire    [2  :0]  entry0_l2c_hpcp_bus;     
wire    [54 :0]  entry0_piux_ac_bus;      
wire    [535:0]  entry0_rresp_bus;        
wire    [23 :0]  entry0_sab_agevec;       
wire    [23 :0]  entry0_sab_snpl2_cmplt;  
wire    [4  :0]  entry0_sid;              
wire    [23 :0]  entry10_age_vect;        
wire    [14 :0]  entry10_bresp_bus;       
wire    [3  :0]  entry10_dbg_info;        
wire    [23 :0]  entry10_depd_set;        
wire    [68 :0]  entry10_ebiu_arbus;      
wire    [67 :0]  entry10_ebiu_awbus;      
wire    [534:0]  entry10_ebiu_dbus;       
wire    [2  :0]  entry10_ebiu_mid;        
wire    [63 :0]  entry10_l2c_addr_bus;    
wire    [511:0]  entry10_l2c_data_bus;    
wire    [2  :0]  entry10_l2c_hpcp_bus;    
wire    [54 :0]  entry10_piux_ac_bus;     
wire    [535:0]  entry10_rresp_bus;       
wire    [23 :0]  entry10_sab_agevec;      
wire    [23 :0]  entry10_sab_snpl2_cmplt; 
wire    [4  :0]  entry10_sid;             
wire    [23 :0]  entry11_age_vect;        
wire    [14 :0]  entry11_bresp_bus;       
wire    [3  :0]  entry11_dbg_info;        
wire    [23 :0]  entry11_depd_set;        
wire    [68 :0]  entry11_ebiu_arbus;      
wire    [67 :0]  entry11_ebiu_awbus;      
wire    [534:0]  entry11_ebiu_dbus;       
wire    [2  :0]  entry11_ebiu_mid;        
wire    [63 :0]  entry11_l2c_addr_bus;    
wire    [511:0]  entry11_l2c_data_bus;    
wire    [2  :0]  entry11_l2c_hpcp_bus;    
wire    [54 :0]  entry11_piux_ac_bus;     
wire    [535:0]  entry11_rresp_bus;       
wire    [23 :0]  entry11_sab_agevec;      
wire    [23 :0]  entry11_sab_snpl2_cmplt; 
wire    [4  :0]  entry11_sid;             
wire    [23 :0]  entry12_age_vect;        
wire    [14 :0]  entry12_bresp_bus;       
wire    [3  :0]  entry12_dbg_info;        
wire    [23 :0]  entry12_depd_set;        
wire    [68 :0]  entry12_ebiu_arbus;      
wire    [67 :0]  entry12_ebiu_awbus;      
wire    [534:0]  entry12_ebiu_dbus;       
wire    [2  :0]  entry12_ebiu_mid;        
wire    [63 :0]  entry12_l2c_addr_bus;    
wire    [511:0]  entry12_l2c_data_bus;    
wire    [2  :0]  entry12_l2c_hpcp_bus;    
wire    [54 :0]  entry12_piux_ac_bus;     
wire    [535:0]  entry12_rresp_bus;       
wire    [23 :0]  entry12_sab_agevec;      
wire    [23 :0]  entry12_sab_snpl2_cmplt; 
wire    [4  :0]  entry12_sid;             
wire    [23 :0]  entry13_age_vect;        
wire    [14 :0]  entry13_bresp_bus;       
wire    [3  :0]  entry13_dbg_info;        
wire    [23 :0]  entry13_depd_set;        
wire    [68 :0]  entry13_ebiu_arbus;      
wire    [67 :0]  entry13_ebiu_awbus;      
wire    [534:0]  entry13_ebiu_dbus;       
wire    [2  :0]  entry13_ebiu_mid;        
wire    [63 :0]  entry13_l2c_addr_bus;    
wire    [511:0]  entry13_l2c_data_bus;    
wire    [2  :0]  entry13_l2c_hpcp_bus;    
wire    [54 :0]  entry13_piux_ac_bus;     
wire    [535:0]  entry13_rresp_bus;       
wire    [23 :0]  entry13_sab_agevec;      
wire    [23 :0]  entry13_sab_snpl2_cmplt; 
wire    [4  :0]  entry13_sid;             
wire    [23 :0]  entry14_age_vect;        
wire    [14 :0]  entry14_bresp_bus;       
wire    [3  :0]  entry14_dbg_info;        
wire    [23 :0]  entry14_depd_set;        
wire    [68 :0]  entry14_ebiu_arbus;      
wire    [67 :0]  entry14_ebiu_awbus;      
wire    [534:0]  entry14_ebiu_dbus;       
wire    [2  :0]  entry14_ebiu_mid;        
wire    [63 :0]  entry14_l2c_addr_bus;    
wire    [511:0]  entry14_l2c_data_bus;    
wire    [2  :0]  entry14_l2c_hpcp_bus;    
wire    [54 :0]  entry14_piux_ac_bus;     
wire    [535:0]  entry14_rresp_bus;       
wire    [23 :0]  entry14_sab_agevec;      
wire    [23 :0]  entry14_sab_snpl2_cmplt; 
wire    [4  :0]  entry14_sid;             
wire    [23 :0]  entry15_age_vect;        
wire    [14 :0]  entry15_bresp_bus;       
wire    [3  :0]  entry15_dbg_info;        
wire    [23 :0]  entry15_depd_set;        
wire    [68 :0]  entry15_ebiu_arbus;      
wire    [67 :0]  entry15_ebiu_awbus;      
wire    [534:0]  entry15_ebiu_dbus;       
wire    [2  :0]  entry15_ebiu_mid;        
wire    [63 :0]  entry15_l2c_addr_bus;    
wire    [511:0]  entry15_l2c_data_bus;    
wire    [2  :0]  entry15_l2c_hpcp_bus;    
wire    [54 :0]  entry15_piux_ac_bus;     
wire    [535:0]  entry15_rresp_bus;       
wire    [23 :0]  entry15_sab_agevec;      
wire    [23 :0]  entry15_sab_snpl2_cmplt; 
wire    [4  :0]  entry15_sid;             
wire    [23 :0]  entry16_age_vect;        
wire    [14 :0]  entry16_bresp_bus;       
wire    [3  :0]  entry16_dbg_info;        
wire    [23 :0]  entry16_depd_set;        
wire    [68 :0]  entry16_ebiu_arbus;      
wire    [67 :0]  entry16_ebiu_awbus;      
wire    [534:0]  entry16_ebiu_dbus;       
wire    [2  :0]  entry16_ebiu_mid;        
wire    [63 :0]  entry16_l2c_addr_bus;    
wire    [511:0]  entry16_l2c_data_bus;    
wire    [2  :0]  entry16_l2c_hpcp_bus;    
wire    [54 :0]  entry16_piux_ac_bus;     
wire    [535:0]  entry16_rresp_bus;       
wire    [23 :0]  entry16_sab_agevec;      
wire    [23 :0]  entry16_sab_snpl2_cmplt; 
wire    [4  :0]  entry16_sid;             
wire    [23 :0]  entry17_age_vect;        
wire    [14 :0]  entry17_bresp_bus;       
wire    [3  :0]  entry17_dbg_info;        
wire    [23 :0]  entry17_depd_set;        
wire    [68 :0]  entry17_ebiu_arbus;      
wire    [67 :0]  entry17_ebiu_awbus;      
wire    [534:0]  entry17_ebiu_dbus;       
wire    [2  :0]  entry17_ebiu_mid;        
wire    [63 :0]  entry17_l2c_addr_bus;    
wire    [511:0]  entry17_l2c_data_bus;    
wire    [2  :0]  entry17_l2c_hpcp_bus;    
wire    [54 :0]  entry17_piux_ac_bus;     
wire    [535:0]  entry17_rresp_bus;       
wire    [23 :0]  entry17_sab_agevec;      
wire    [23 :0]  entry17_sab_snpl2_cmplt; 
wire    [4  :0]  entry17_sid;             
wire    [23 :0]  entry18_age_vect;        
wire    [14 :0]  entry18_bresp_bus;       
wire    [3  :0]  entry18_dbg_info;        
wire    [23 :0]  entry18_depd_set;        
wire    [68 :0]  entry18_ebiu_arbus;      
wire    [67 :0]  entry18_ebiu_awbus;      
wire    [534:0]  entry18_ebiu_dbus;       
wire    [2  :0]  entry18_ebiu_mid;        
wire    [63 :0]  entry18_l2c_addr_bus;    
wire    [511:0]  entry18_l2c_data_bus;    
wire    [2  :0]  entry18_l2c_hpcp_bus;    
wire    [54 :0]  entry18_piux_ac_bus;     
wire    [535:0]  entry18_rresp_bus;       
wire    [23 :0]  entry18_sab_agevec;      
wire    [23 :0]  entry18_sab_snpl2_cmplt; 
wire    [4  :0]  entry18_sid;             
wire    [23 :0]  entry19_age_vect;        
wire    [14 :0]  entry19_bresp_bus;       
wire    [3  :0]  entry19_dbg_info;        
wire    [23 :0]  entry19_depd_set;        
wire    [68 :0]  entry19_ebiu_arbus;      
wire    [67 :0]  entry19_ebiu_awbus;      
wire    [534:0]  entry19_ebiu_dbus;       
wire    [2  :0]  entry19_ebiu_mid;        
wire    [63 :0]  entry19_l2c_addr_bus;    
wire    [511:0]  entry19_l2c_data_bus;    
wire    [2  :0]  entry19_l2c_hpcp_bus;    
wire    [54 :0]  entry19_piux_ac_bus;     
wire    [535:0]  entry19_rresp_bus;       
wire    [23 :0]  entry19_sab_agevec;      
wire    [23 :0]  entry19_sab_snpl2_cmplt; 
wire    [4  :0]  entry19_sid;             
wire    [23 :0]  entry1_age_vect;         
wire    [14 :0]  entry1_bresp_bus;        
wire    [3  :0]  entry1_dbg_info;         
wire    [23 :0]  entry1_depd_set;         
wire    [68 :0]  entry1_ebiu_arbus;       
wire    [67 :0]  entry1_ebiu_awbus;       
wire    [534:0]  entry1_ebiu_dbus;        
wire    [2  :0]  entry1_ebiu_mid;         
wire    [63 :0]  entry1_l2c_addr_bus;     
wire    [511:0]  entry1_l2c_data_bus;     
wire    [2  :0]  entry1_l2c_hpcp_bus;     
wire    [54 :0]  entry1_piux_ac_bus;      
wire    [535:0]  entry1_rresp_bus;        
wire    [23 :0]  entry1_sab_agevec;       
wire    [23 :0]  entry1_sab_snpl2_cmplt;  
wire    [4  :0]  entry1_sid;              
wire    [23 :0]  entry20_age_vect;        
wire    [14 :0]  entry20_bresp_bus;       
wire    [3  :0]  entry20_dbg_info;        
wire    [23 :0]  entry20_depd_set;        
wire    [68 :0]  entry20_ebiu_arbus;      
wire    [67 :0]  entry20_ebiu_awbus;      
wire    [534:0]  entry20_ebiu_dbus;       
wire    [2  :0]  entry20_ebiu_mid;        
wire    [63 :0]  entry20_l2c_addr_bus;    
wire    [511:0]  entry20_l2c_data_bus;    
wire    [2  :0]  entry20_l2c_hpcp_bus;    
wire    [54 :0]  entry20_piux_ac_bus;     
wire    [535:0]  entry20_rresp_bus;       
wire    [23 :0]  entry20_sab_agevec;      
wire    [23 :0]  entry20_sab_snpl2_cmplt; 
wire    [4  :0]  entry20_sid;             
wire    [23 :0]  entry21_age_vect;        
wire    [14 :0]  entry21_bresp_bus;       
wire    [3  :0]  entry21_dbg_info;        
wire    [23 :0]  entry21_depd_set;        
wire    [68 :0]  entry21_ebiu_arbus;      
wire    [67 :0]  entry21_ebiu_awbus;      
wire    [534:0]  entry21_ebiu_dbus;       
wire    [2  :0]  entry21_ebiu_mid;        
wire    [63 :0]  entry21_l2c_addr_bus;    
wire    [511:0]  entry21_l2c_data_bus;    
wire    [2  :0]  entry21_l2c_hpcp_bus;    
wire    [54 :0]  entry21_piux_ac_bus;     
wire    [535:0]  entry21_rresp_bus;       
wire    [23 :0]  entry21_sab_agevec;      
wire    [23 :0]  entry21_sab_snpl2_cmplt; 
wire    [4  :0]  entry21_sid;             
wire    [23 :0]  entry22_age_vect;        
wire    [14 :0]  entry22_bresp_bus;       
wire    [3  :0]  entry22_dbg_info;        
wire    [23 :0]  entry22_depd_set;        
wire    [68 :0]  entry22_ebiu_arbus;      
wire    [67 :0]  entry22_ebiu_awbus;      
wire    [534:0]  entry22_ebiu_dbus;       
wire    [2  :0]  entry22_ebiu_mid;        
wire    [63 :0]  entry22_l2c_addr_bus;    
wire    [511:0]  entry22_l2c_data_bus;    
wire    [2  :0]  entry22_l2c_hpcp_bus;    
wire    [54 :0]  entry22_piux_ac_bus;     
wire    [535:0]  entry22_rresp_bus;       
wire    [23 :0]  entry22_sab_agevec;      
wire    [23 :0]  entry22_sab_snpl2_cmplt; 
wire    [4  :0]  entry22_sid;             
wire    [23 :0]  entry23_age_vect;        
wire    [14 :0]  entry23_bresp_bus;       
wire    [3  :0]  entry23_dbg_info;        
wire    [23 :0]  entry23_depd_set;        
wire    [68 :0]  entry23_ebiu_arbus;      
wire    [67 :0]  entry23_ebiu_awbus;      
wire    [534:0]  entry23_ebiu_dbus;       
wire    [2  :0]  entry23_ebiu_mid;        
wire    [63 :0]  entry23_l2c_addr_bus;    
wire    [511:0]  entry23_l2c_data_bus;    
wire    [2  :0]  entry23_l2c_hpcp_bus;    
wire    [54 :0]  entry23_piux_ac_bus;     
wire    [535:0]  entry23_rresp_bus;       
wire    [23 :0]  entry23_sab_agevec;      
wire    [23 :0]  entry23_sab_snpl2_cmplt; 
wire    [4  :0]  entry23_sid;             
wire    [23 :0]  entry2_age_vect;         
wire    [14 :0]  entry2_bresp_bus;        
wire    [3  :0]  entry2_dbg_info;         
wire    [23 :0]  entry2_depd_set;         
wire    [68 :0]  entry2_ebiu_arbus;       
wire    [67 :0]  entry2_ebiu_awbus;       
wire    [534:0]  entry2_ebiu_dbus;        
wire    [2  :0]  entry2_ebiu_mid;         
wire    [63 :0]  entry2_l2c_addr_bus;     
wire    [511:0]  entry2_l2c_data_bus;     
wire    [2  :0]  entry2_l2c_hpcp_bus;     
wire    [54 :0]  entry2_piux_ac_bus;      
wire    [535:0]  entry2_rresp_bus;        
wire    [23 :0]  entry2_sab_agevec;       
wire    [23 :0]  entry2_sab_snpl2_cmplt;  
wire    [4  :0]  entry2_sid;              
wire    [23 :0]  entry3_age_vect;         
wire    [14 :0]  entry3_bresp_bus;        
wire    [3  :0]  entry3_dbg_info;         
wire    [23 :0]  entry3_depd_set;         
wire    [68 :0]  entry3_ebiu_arbus;       
wire    [67 :0]  entry3_ebiu_awbus;       
wire    [534:0]  entry3_ebiu_dbus;        
wire    [2  :0]  entry3_ebiu_mid;         
wire    [63 :0]  entry3_l2c_addr_bus;     
wire    [511:0]  entry3_l2c_data_bus;     
wire    [2  :0]  entry3_l2c_hpcp_bus;     
wire    [54 :0]  entry3_piux_ac_bus;      
wire    [535:0]  entry3_rresp_bus;        
wire    [23 :0]  entry3_sab_agevec;       
wire    [23 :0]  entry3_sab_snpl2_cmplt;  
wire    [4  :0]  entry3_sid;              
wire    [23 :0]  entry4_age_vect;         
wire    [14 :0]  entry4_bresp_bus;        
wire    [3  :0]  entry4_dbg_info;         
wire    [23 :0]  entry4_depd_set;         
wire    [68 :0]  entry4_ebiu_arbus;       
wire    [67 :0]  entry4_ebiu_awbus;       
wire    [534:0]  entry4_ebiu_dbus;        
wire    [2  :0]  entry4_ebiu_mid;         
wire    [63 :0]  entry4_l2c_addr_bus;     
wire    [511:0]  entry4_l2c_data_bus;     
wire    [2  :0]  entry4_l2c_hpcp_bus;     
wire    [54 :0]  entry4_piux_ac_bus;      
wire    [535:0]  entry4_rresp_bus;        
wire    [23 :0]  entry4_sab_agevec;       
wire    [23 :0]  entry4_sab_snpl2_cmplt;  
wire    [4  :0]  entry4_sid;              
wire    [23 :0]  entry5_age_vect;         
wire    [14 :0]  entry5_bresp_bus;        
wire    [3  :0]  entry5_dbg_info;         
wire    [23 :0]  entry5_depd_set;         
wire    [68 :0]  entry5_ebiu_arbus;       
wire    [67 :0]  entry5_ebiu_awbus;       
wire    [534:0]  entry5_ebiu_dbus;        
wire    [2  :0]  entry5_ebiu_mid;         
wire    [63 :0]  entry5_l2c_addr_bus;     
wire    [511:0]  entry5_l2c_data_bus;     
wire    [2  :0]  entry5_l2c_hpcp_bus;     
wire    [54 :0]  entry5_piux_ac_bus;      
wire    [535:0]  entry5_rresp_bus;        
wire    [23 :0]  entry5_sab_agevec;       
wire    [23 :0]  entry5_sab_snpl2_cmplt;  
wire    [4  :0]  entry5_sid;              
wire    [23 :0]  entry6_age_vect;         
wire    [14 :0]  entry6_bresp_bus;        
wire    [3  :0]  entry6_dbg_info;         
wire    [23 :0]  entry6_depd_set;         
wire    [68 :0]  entry6_ebiu_arbus;       
wire    [67 :0]  entry6_ebiu_awbus;       
wire    [534:0]  entry6_ebiu_dbus;        
wire    [2  :0]  entry6_ebiu_mid;         
wire    [63 :0]  entry6_l2c_addr_bus;     
wire    [511:0]  entry6_l2c_data_bus;     
wire    [2  :0]  entry6_l2c_hpcp_bus;     
wire    [54 :0]  entry6_piux_ac_bus;      
wire    [535:0]  entry6_rresp_bus;        
wire    [23 :0]  entry6_sab_agevec;       
wire    [23 :0]  entry6_sab_snpl2_cmplt;  
wire    [4  :0]  entry6_sid;              
wire    [23 :0]  entry7_age_vect;         
wire    [14 :0]  entry7_bresp_bus;        
wire    [3  :0]  entry7_dbg_info;         
wire    [23 :0]  entry7_depd_set;         
wire    [68 :0]  entry7_ebiu_arbus;       
wire    [67 :0]  entry7_ebiu_awbus;       
wire    [534:0]  entry7_ebiu_dbus;        
wire    [2  :0]  entry7_ebiu_mid;         
wire    [63 :0]  entry7_l2c_addr_bus;     
wire    [511:0]  entry7_l2c_data_bus;     
wire    [2  :0]  entry7_l2c_hpcp_bus;     
wire    [54 :0]  entry7_piux_ac_bus;      
wire    [535:0]  entry7_rresp_bus;        
wire    [23 :0]  entry7_sab_agevec;       
wire    [23 :0]  entry7_sab_snpl2_cmplt;  
wire    [4  :0]  entry7_sid;              
wire    [23 :0]  entry8_age_vect;         
wire    [14 :0]  entry8_bresp_bus;        
wire    [3  :0]  entry8_dbg_info;         
wire    [23 :0]  entry8_depd_set;         
wire    [68 :0]  entry8_ebiu_arbus;       
wire    [67 :0]  entry8_ebiu_awbus;       
wire    [534:0]  entry8_ebiu_dbus;        
wire    [2  :0]  entry8_ebiu_mid;         
wire    [63 :0]  entry8_l2c_addr_bus;     
wire    [511:0]  entry8_l2c_data_bus;     
wire    [2  :0]  entry8_l2c_hpcp_bus;     
wire    [54 :0]  entry8_piux_ac_bus;      
wire    [535:0]  entry8_rresp_bus;        
wire    [23 :0]  entry8_sab_agevec;       
wire    [23 :0]  entry8_sab_snpl2_cmplt;  
wire    [4  :0]  entry8_sid;              
wire    [23 :0]  entry9_age_vect;         
wire    [14 :0]  entry9_bresp_bus;        
wire    [3  :0]  entry9_dbg_info;         
wire    [23 :0]  entry9_depd_set;         
wire    [68 :0]  entry9_ebiu_arbus;       
wire    [67 :0]  entry9_ebiu_awbus;       
wire    [534:0]  entry9_ebiu_dbus;        
wire    [2  :0]  entry9_ebiu_mid;         
wire    [63 :0]  entry9_l2c_addr_bus;     
wire    [511:0]  entry9_l2c_data_bus;     
wire    [2  :0]  entry9_l2c_hpcp_bus;     
wire    [54 :0]  entry9_piux_ac_bus;      
wire    [535:0]  entry9_rresp_bus;        
wire    [23 :0]  entry9_sab_agevec;       
wire    [23 :0]  entry9_sab_snpl2_cmplt;  
wire    [4  :0]  entry9_sid;              
wire             forever_cpuclk;          
wire    [511:0]  l1_data;                 
wire             l1_wcd_err;              
wire    [23 :0]  l1_wen;                  
wire    [15 :0]  l1_wstrb;                
wire    [23 :0]  l2c_cmplt;               
wire    [3  :0]  l2c_cp;                  
wire    [511:0]  l2c_data;                
wire    [23 :0]  l2c_grant;               
wire    [4  :0]  l2c_resp;                
wire    [23 :0]  memr_ar_grant;           
wire    [23 :0]  memr_cmplt;              
wire    [127:0]  memr_data;               
wire    [23 :0]  memr_data_vld;           
wire    [3  :0]  memr_resp;               
wire             memr_resp_err;           
wire    [23 :0]  memw_aw_grant;           
wire    [23 :0]  memw_cmplt;              
wire             pad_yy_icg_scan_en;      
wire    [23 :0]  piu0_ac_grant;           
wire             piu0_bar_cmplt;          
wire    [23 :0]  piu0_cdvld;              
wire    [4  :0]  piu0_crresp;             
wire    [23 :0]  piu0_crvld;              
wire    [23 :0]  piu1_ac_grant;           
wire             piu1_bar_cmplt;          
wire    [23 :0]  piu1_cdvld;              
wire    [4  :0]  piu1_crresp;             
wire    [23 :0]  piu1_crvld;              
wire    [23 :0]  piu2_ac_grant;           
wire             piu2_bar_cmplt;          
wire    [23 :0]  piu2_cdvld;              
wire    [4  :0]  piu2_crresp;             
wire    [23 :0]  piu2_crvld;              
wire    [23 :0]  piu3_ac_grant;           
wire             piu3_bar_cmplt;          
wire    [23 :0]  piu3_cdvld;              
wire    [4  :0]  piu3_crresp;             
wire    [23 :0]  piu3_crvld;              
wire    [70 :0]  sab_ar_create_bus;       
wire             sab_ar_create_en;        
wire    [2  :0]  sab_ar_create_mid;       
wire    [15 :0]  sab_ar_create_sel;       
wire    [4  :0]  sab_ar_create_snpl2_isid; 
wire    [23 :0]  sab_ar_depd_aw;          
wire    [23 :0]  sab_ar_depd_snb;         
wire    [23 :0]  sab_ar_depd_vld;         
wire             sab_arb_bresp_req;       
wire             sab_arb_ebiu_ar_req;     
wire             sab_arb_ebiu_aw_req;     
wire    [23 :0]  sab_arb_ebiu_aw_sel;     
wire             sab_arb_l2c_req;         
wire    [23 :0]  sab_arb_l2c_sel;         
wire    [23 :0]  sab_arb_rresp_ctrl;      
wire             sab_arb_rresp_req;       
wire    [70 :0]  sab_aw_create_bus;       
wire             sab_aw_create_en;        
wire    [2  :0]  sab_aw_create_mid;       
wire    [7  :0]  sab_aw_create_sel;       
wire    [23 :0]  sab_aw_depd;             
wire    [23 :0]  sab_aw_depd_snb;         
wire    [23 :0]  sab_aw_depd_vld;         
wire    [23 :0]  sab_b_grant;             
wire    [23 :0]  sab_back;                
wire    [23 :0]  sab_back_mark_by_wns;    
wire    [23 :0]  sab_back_sel;            
wire    [23 :0]  sab_bar_depd;            
wire    [23 :0]  sab_bar_depd_snb;        
wire    [23 :0]  sab_bresp_req;           
wire    [7  :0]  sab_bresp_req_vld;       
wire    [7  :0]  sab_bresp_sel;           
wire    [23 :0]  sab_busy;                
wire    [23 :0]  sab_cen;                 
wire    [15 :0]  sab_cen0;                
wire    [7  :0]  sab_cen1;                
wire    [4  :0]  sab_crresp_piu0;         
wire    [4  :0]  sab_crresp_piu1;         
wire    [4  :0]  sab_crresp_piu2;         
wire    [4  :0]  sab_crresp_piu3;         
wire    [23 :0]  sab_crvld_piu0;          
wire    [23 :0]  sab_crvld_piu1;          
wire    [23 :0]  sab_crvld_piu2;          
wire    [23 :0]  sab_crvld_piu3;          
wire    [23 :0]  sab_depd_set_by_snpext;  
wire    [23 :0]  sab_depd_set_by_wns;     
wire    [23 :0]  sab_ebiu_rd_sel;         
wire    [23 :0]  sab_ebiu_wt_sel;         
wire    [23 :0]  sab_ebiur_req;           
wire    [23 :0]  sab_ebiur_req_vld;       
wire    [23 :0]  sab_ebiuw_req;           
wire    [23 :0]  sab_ebiuw_req_vld;       
wire    [23 :0]  sab_entry_busy;          
wire    [23 :0]  sab_entry_vld;           
wire    [23 :0]  sab_in_process;          
wire    [23 :0]  sab_l2c_req;             
wire    [23 :0]  sab_l2c_sel;             
wire    [127:0]  sab_memr_data;           
wire             sab_memr_grant;          
wire             sab_memr_last;           
wire    [3  :0]  sab_memr_resp;           
wire    [23 :0]  sab_memr_sel;            
wire             sab_memr_vld;            
wire             sab_memw_aw_grant;       
wire             sab_memw_cmplt;          
wire    [23 :0]  sab_memw_cmplt_sel;      
wire             sab_piu0_ac_grant;       
wire    [23 :0]  sab_piu0_ac_req;         
wire    [23 :0]  sab_piu0_ac_req_vld;     
wire    [23 :0]  sab_piu0_ac_sel;         
wire             sab_piu0_ac_vld;         
wire    [23 :0]  sab_piu0_bar_cmplt;      
wire             sab_piu1_ac_grant;       
wire    [23 :0]  sab_piu1_ac_req;         
wire    [23 :0]  sab_piu1_ac_req_vld;     
wire    [23 :0]  sab_piu1_ac_sel;         
wire             sab_piu1_ac_vld;         
wire    [23 :0]  sab_piu1_bar_cmplt;      
wire             sab_piu2_ac_grant;       
wire    [23 :0]  sab_piu2_ac_req;         
wire    [23 :0]  sab_piu2_ac_req_vld;     
wire    [23 :0]  sab_piu2_ac_sel;         
wire             sab_piu2_ac_vld;         
wire    [23 :0]  sab_piu2_bar_cmplt;      
wire             sab_piu3_ac_grant;       
wire    [23 :0]  sab_piu3_ac_req;         
wire    [23 :0]  sab_piu3_ac_req_vld;     
wire    [23 :0]  sab_piu3_ac_sel;         
wire             sab_piu3_ac_vld;         
wire    [23 :0]  sab_piu3_bar_cmplt;      
wire    [23 :0]  sab_pop_en;              
wire    [23 :0]  sab_r_grant;             
wire    [23 :0]  sab_rack;                
wire    [23 :0]  sab_rack_sel;            
wire    [23 :0]  sab_rresp_req;           
wire    [15 :0]  sab_rresp_req_vld;       
wire    [15 :0]  sab_rresp_sel;           
wire    [3  :0]  sab_snp_bar_cmplt;       
wire    [23 :0]  sab_snpext_depd_snb;     
wire             sab_snpext_depd_vld;     
wire    [23 :0]  sab_snpl2_cmplt;         
wire    [4  :0]  sab_snpl2_ini_sid;       
wire    [23 :0]  sab_vld;                 
wire    [3  :0]  sab_wcd_create_cdsel;    
wire    [511:0]  sab_wcd_create_data;     
wire    [23 :0]  sab_wcd_create_en;       
wire             sab_wcd_create_err;      
wire    [15 :0]  sab_wcd_create_wstrb;    
wire    [23 :0]  sab_wns;                 
wire    [511:0]  sdb_arb_rresp_data;      
wire             snb1;                    
wire    [95 :0]  snb_dbg_info;            
wire    [15 :0]  snpext_cen0_raw;         
wire    [6  :0]  snpext_index;            
wire             snpext_vld;              


parameter DEPTH  = `SAB_DEPTH;
parameter RDEPTH = `SAB_RDEPTH;
parameter WDEPTH = `SAB_WDEPTH;
parameter PTR_EXTENT = {{(DEPTH-1){1'b0}},1'b1};

//==========================================================
//                   SAB Entry Instance
//==========================================================
// &ConnRule(s/^x_/entry0_/); @36
// &ConnRule(s/_x$/[0]/); @37
// &Instance("ct_ciu_snb_sab_entry", "x_ct_ciu_snb_sab_entry0"); @38
// &Connect(.create_bus  (create0_bus)); @39
// &Connect(.create_age  (create0_age)); @40
// &Connect(.create_depd (create0_depd)); @41
// &ConnRule(s/^x_/entry1_/); @43
// &ConnRule(s/_x$/[1]/); @44
// &Instance("ct_ciu_snb_sab_entry", "x_ct_ciu_snb_sab_entry1"); @45
// &Connect(.create_bus  (create0_bus)); @46
// &Connect(.create_age  (create0_age)); @47
// &Connect(.create_depd (create0_depd)); @48
// &ConnRule(s/^x_/entry2_/); @50
// &ConnRule(s/_x$/[2]/); @51
// &Instance("ct_ciu_snb_sab_entry", "x_ct_ciu_snb_sab_entry2"); @52
// &Connect(.create_bus  (create0_bus)); @53
// &Connect(.create_age  (create0_age)); @54
// &Connect(.create_depd (create0_depd)); @55
// &ConnRule(s/^x_/entry3_/); @57
// &ConnRule(s/_x$/[3]/); @58
// &Instance("ct_ciu_snb_sab_entry", "x_ct_ciu_snb_sab_entry3"); @59
// &Connect(.create_bus  (create0_bus)); @60
// &Connect(.create_age  (create0_age)); @61
// &Connect(.create_depd (create0_depd)); @62
// &ConnRule(s/^x_/entry4_/); @64
// &ConnRule(s/_x$/[4]/); @65
// &Instance("ct_ciu_snb_sab_entry", "x_ct_ciu_snb_sab_entry4"); @66
// &Connect(.create_bus  (create0_bus)); @67
// &Connect(.create_age  (create0_age)); @68
// &Connect(.create_depd (create0_depd)); @69
// &ConnRule(s/^x_/entry5_/); @71
// &ConnRule(s/_x$/[5]/); @72
// &Instance("ct_ciu_snb_sab_entry", "x_ct_ciu_snb_sab_entry5"); @73
// &Connect(.create_bus  (create0_bus)); @74
// &Connect(.create_age  (create0_age)); @75
// &Connect(.create_depd (create0_depd)); @76
// &ConnRule(s/^x_/entry6_/); @78
// &ConnRule(s/_x$/[6]/); @79
// &Instance("ct_ciu_snb_sab_entry", "x_ct_ciu_snb_sab_entry6"); @80
// &Connect(.create_bus  (create1_bus)); @81
// &Connect(.create_age  (create1_age)); @82
// &Connect(.create_depd (create1_depd)); @83
// &ConnRule(s/^x_/entry7_/); @84
// &ConnRule(s/_x$/[7]/); @85
// &Instance("ct_ciu_snb_sab_entry", "x_ct_ciu_snb_sab_entry7"); @86
// &Connect(.create_bus  (create1_bus)); @87
// &Connect(.create_age  (create1_age)); @88
// &Connect(.create_depd (create1_depd)); @89
// &ConnRule(s/^x_/entry0_/); @92
// &ConnRule(s/_x$/[0]/); @93
// &Instance("ct_ciu_snb_sab_entry", "x_ct_ciu_snb_sab_entry0"); @94
ct_ciu_snb_sab_entry  x_ct_ciu_snb_sab_entry0 (
  .agevec_clr              (agevec_clr             ),
  .ar_crt_entry_index      (ar_crt_entry_index     ),
  .arb_sab_no_l2c_req      (arb_sab_no_l2c_req     ),
  .aw_crt_entry_index      (aw_crt_entry_index     ),
  .aw_mid                  (aw_mid                 ),
  .aw_sh                   (aw_sh                  ),
  .ciu_chr2_bar_dis        (ciu_chr2_bar_dis       ),
  .ciu_chr2_sf_dis         (ciu_chr2_sf_dis        ),
  .ciu_icg_en              (ciu_icg_en             ),
  .ciu_xx_smpen            (ciu_xx_smpen           ),
  .cpurst_b                (cpurst_b               ),
  .create_age              (create0_age            ),
  .create_bus              (create0_bus            ),
  .create_depd             (create0_depd           ),
  .depd_clr                (depd_clr               ),
  .forever_cpuclk          (forever_cpuclk         ),
  .l1_data                 (l1_data                ),
  .l1_wcd_err              (l1_wcd_err             ),
  .l1_wen_x                (l1_wen[0]              ),
  .l1_wstrb                (l1_wstrb               ),
  .l2c_cmplt_x             (l2c_cmplt[0]           ),
  .l2c_cp                  (l2c_cp                 ),
  .l2c_data                (l2c_data               ),
  .l2c_grant_x             (l2c_grant[0]           ),
  .l2c_resp                (l2c_resp               ),
  .memr_ar_grant_x         (memr_ar_grant[0]       ),
  .memr_cmplt_x            (memr_cmplt[0]          ),
  .memr_data               (memr_data              ),
  .memr_data_vld_x         (memr_data_vld[0]       ),
  .memr_resp               (memr_resp              ),
  .memr_resp_err           (memr_resp_err          ),
  .memw_aw_grant_x         (memw_aw_grant[0]       ),
  .memw_cmplt_x            (memw_cmplt[0]          ),
  .pad_yy_icg_scan_en      (pad_yy_icg_scan_en     ),
  .piu0_ac_grant_x         (piu0_ac_grant[0]       ),
  .piu0_cdvld_x            (piu0_cdvld[0]          ),
  .piu0_crresp             (piu0_crresp            ),
  .piu0_crvld_x            (piu0_crvld[0]          ),
  .piu1_ac_grant_x         (piu1_ac_grant[0]       ),
  .piu1_cdvld_x            (piu1_cdvld[0]          ),
  .piu1_crresp             (piu1_crresp            ),
  .piu1_crvld_x            (piu1_crvld[0]          ),
  .piu2_ac_grant_x         (piu2_ac_grant[0]       ),
  .piu2_cdvld_x            (piu2_cdvld[0]          ),
  .piu2_crresp             (piu2_crresp            ),
  .piu2_crvld_x            (piu2_crvld[0]          ),
  .piu3_ac_grant_x         (piu3_ac_grant[0]       ),
  .piu3_cdvld_x            (piu3_cdvld[0]          ),
  .piu3_crresp             (piu3_crresp            ),
  .piu3_crvld_x            (piu3_crvld[0]          ),
  .sab_ar_depd_snb_x       (sab_ar_depd_snb[0]     ),
  .sab_aw_depd_snb_x       (sab_aw_depd_snb[0]     ),
  .sab_b_grant_x           (sab_b_grant[0]         ),
  .sab_back_mark_by_wns_x  (sab_back_mark_by_wns[0]),
  .sab_back_x              (sab_back[0]            ),
  .sab_bar_depd_snb_x      (sab_bar_depd_snb[0]    ),
  .sab_bresp_req_x         (sab_bresp_req[0]       ),
  .sab_busy_x              (sab_busy[0]            ),
  .sab_cen_x               (sab_cen[0]             ),
  .sab_depd_set_by_wns_x   (sab_depd_set_by_wns[0] ),
  .sab_ebiur_req_x         (sab_ebiur_req[0]       ),
  .sab_ebiuw_req_x         (sab_ebiuw_req[0]       ),
  .sab_in_process_x        (sab_in_process[0]      ),
  .sab_l2c_req_x           (sab_l2c_req[0]         ),
  .sab_piu0_ac_req_x       (sab_piu0_ac_req[0]     ),
  .sab_piu0_bar_cmplt_x    (sab_piu0_bar_cmplt[0]  ),
  .sab_piu1_ac_req_x       (sab_piu1_ac_req[0]     ),
  .sab_piu1_bar_cmplt_x    (sab_piu1_bar_cmplt[0]  ),
  .sab_piu2_ac_req_x       (sab_piu2_ac_req[0]     ),
  .sab_piu2_bar_cmplt_x    (sab_piu2_bar_cmplt[0]  ),
  .sab_piu3_ac_req_x       (sab_piu3_ac_req[0]     ),
  .sab_piu3_bar_cmplt_x    (sab_piu3_bar_cmplt[0]  ),
  .sab_pop_en_x            (sab_pop_en[0]          ),
  .sab_r_grant_x           (sab_r_grant[0]         ),
  .sab_rack_x              (sab_rack[0]            ),
  .sab_rresp_req_x         (sab_rresp_req[0]       ),
  .sab_snpext_depd_snb_x   (sab_snpext_depd_snb[0] ),
  .sab_snpl2_cmplt_x       (sab_snpl2_cmplt[0]     ),
  .sab_snpl2_ini_sid       (sab_snpl2_ini_sid      ),
  .sab_vld_x               (sab_vld[0]             ),
  .sab_wns_x               (sab_wns[0]             ),
  .snb1                    (snb1                   ),
  .snpext_index            (snpext_index           ),
  .x_bresp_bus             (entry0_bresp_bus       ),
  .x_dbg_info              (entry0_dbg_info        ),
  .x_depd_set              (entry0_depd_set        ),
  .x_ebiu_arbus            (entry0_ebiu_arbus      ),
  .x_ebiu_awbus            (entry0_ebiu_awbus      ),
  .x_ebiu_dbus             (entry0_ebiu_dbus       ),
  .x_ebiu_mid              (entry0_ebiu_mid        ),
  .x_l2c_addr_bus          (entry0_l2c_addr_bus    ),
  .x_l2c_data_bus          (entry0_l2c_data_bus    ),
  .x_l2c_hpcp_bus          (entry0_l2c_hpcp_bus    ),
  .x_piux_ac_bus           (entry0_piux_ac_bus     ),
  .x_rresp_bus             (entry0_rresp_bus       ),
  .x_sab_agevec            (entry0_sab_agevec      ),
  .x_sab_snpl2_cmplt       (entry0_sab_snpl2_cmplt ),
  .x_sid                   (entry0_sid             )
);

// &Connect(.create_bus  (create0_bus)); @95
// &Connect(.create_age  (create0_age)); @96
// &Connect(.create_depd (create0_depd)); @97

// &ConnRule(s/^x_/entry1_/); @99
// &ConnRule(s/_x$/[1]/); @100
// &Instance("ct_ciu_snb_sab_entry", "x_ct_ciu_snb_sab_entry1"); @101
ct_ciu_snb_sab_entry  x_ct_ciu_snb_sab_entry1 (
  .agevec_clr              (agevec_clr             ),
  .ar_crt_entry_index      (ar_crt_entry_index     ),
  .arb_sab_no_l2c_req      (arb_sab_no_l2c_req     ),
  .aw_crt_entry_index      (aw_crt_entry_index     ),
  .aw_mid                  (aw_mid                 ),
  .aw_sh                   (aw_sh                  ),
  .ciu_chr2_bar_dis        (ciu_chr2_bar_dis       ),
  .ciu_chr2_sf_dis         (ciu_chr2_sf_dis        ),
  .ciu_icg_en              (ciu_icg_en             ),
  .ciu_xx_smpen            (ciu_xx_smpen           ),
  .cpurst_b                (cpurst_b               ),
  .create_age              (create0_age            ),
  .create_bus              (create0_bus            ),
  .create_depd             (create0_depd           ),
  .depd_clr                (depd_clr               ),
  .forever_cpuclk          (forever_cpuclk         ),
  .l1_data                 (l1_data                ),
  .l1_wcd_err              (l1_wcd_err             ),
  .l1_wen_x                (l1_wen[1]              ),
  .l1_wstrb                (l1_wstrb               ),
  .l2c_cmplt_x             (l2c_cmplt[1]           ),
  .l2c_cp                  (l2c_cp                 ),
  .l2c_data                (l2c_data               ),
  .l2c_grant_x             (l2c_grant[1]           ),
  .l2c_resp                (l2c_resp               ),
  .memr_ar_grant_x         (memr_ar_grant[1]       ),
  .memr_cmplt_x            (memr_cmplt[1]          ),
  .memr_data               (memr_data              ),
  .memr_data_vld_x         (memr_data_vld[1]       ),
  .memr_resp               (memr_resp              ),
  .memr_resp_err           (memr_resp_err          ),
  .memw_aw_grant_x         (memw_aw_grant[1]       ),
  .memw_cmplt_x            (memw_cmplt[1]          ),
  .pad_yy_icg_scan_en      (pad_yy_icg_scan_en     ),
  .piu0_ac_grant_x         (piu0_ac_grant[1]       ),
  .piu0_cdvld_x            (piu0_cdvld[1]          ),
  .piu0_crresp             (piu0_crresp            ),
  .piu0_crvld_x            (piu0_crvld[1]          ),
  .piu1_ac_grant_x         (piu1_ac_grant[1]       ),
  .piu1_cdvld_x            (piu1_cdvld[1]          ),
  .piu1_crresp             (piu1_crresp            ),
  .piu1_crvld_x            (piu1_crvld[1]          ),
  .piu2_ac_grant_x         (piu2_ac_grant[1]       ),
  .piu2_cdvld_x            (piu2_cdvld[1]          ),
  .piu2_crresp             (piu2_crresp            ),
  .piu2_crvld_x            (piu2_crvld[1]          ),
  .piu3_ac_grant_x         (piu3_ac_grant[1]       ),
  .piu3_cdvld_x            (piu3_cdvld[1]          ),
  .piu3_crresp             (piu3_crresp            ),
  .piu3_crvld_x            (piu3_crvld[1]          ),
  .sab_ar_depd_snb_x       (sab_ar_depd_snb[1]     ),
  .sab_aw_depd_snb_x       (sab_aw_depd_snb[1]     ),
  .sab_b_grant_x           (sab_b_grant[1]         ),
  .sab_back_mark_by_wns_x  (sab_back_mark_by_wns[1]),
  .sab_back_x              (sab_back[1]            ),
  .sab_bar_depd_snb_x      (sab_bar_depd_snb[1]    ),
  .sab_bresp_req_x         (sab_bresp_req[1]       ),
  .sab_busy_x              (sab_busy[1]            ),
  .sab_cen_x               (sab_cen[1]             ),
  .sab_depd_set_by_wns_x   (sab_depd_set_by_wns[1] ),
  .sab_ebiur_req_x         (sab_ebiur_req[1]       ),
  .sab_ebiuw_req_x         (sab_ebiuw_req[1]       ),
  .sab_in_process_x        (sab_in_process[1]      ),
  .sab_l2c_req_x           (sab_l2c_req[1]         ),
  .sab_piu0_ac_req_x       (sab_piu0_ac_req[1]     ),
  .sab_piu0_bar_cmplt_x    (sab_piu0_bar_cmplt[1]  ),
  .sab_piu1_ac_req_x       (sab_piu1_ac_req[1]     ),
  .sab_piu1_bar_cmplt_x    (sab_piu1_bar_cmplt[1]  ),
  .sab_piu2_ac_req_x       (sab_piu2_ac_req[1]     ),
  .sab_piu2_bar_cmplt_x    (sab_piu2_bar_cmplt[1]  ),
  .sab_piu3_ac_req_x       (sab_piu3_ac_req[1]     ),
  .sab_piu3_bar_cmplt_x    (sab_piu3_bar_cmplt[1]  ),
  .sab_pop_en_x            (sab_pop_en[1]          ),
  .sab_r_grant_x           (sab_r_grant[1]         ),
  .sab_rack_x              (sab_rack[1]            ),
  .sab_rresp_req_x         (sab_rresp_req[1]       ),
  .sab_snpext_depd_snb_x   (sab_snpext_depd_snb[1] ),
  .sab_snpl2_cmplt_x       (sab_snpl2_cmplt[1]     ),
  .sab_snpl2_ini_sid       (sab_snpl2_ini_sid      ),
  .sab_vld_x               (sab_vld[1]             ),
  .sab_wns_x               (sab_wns[1]             ),
  .snb1                    (snb1                   ),
  .snpext_index            (snpext_index           ),
  .x_bresp_bus             (entry1_bresp_bus       ),
  .x_dbg_info              (entry1_dbg_info        ),
  .x_depd_set              (entry1_depd_set        ),
  .x_ebiu_arbus            (entry1_ebiu_arbus      ),
  .x_ebiu_awbus            (entry1_ebiu_awbus      ),
  .x_ebiu_dbus             (entry1_ebiu_dbus       ),
  .x_ebiu_mid              (entry1_ebiu_mid        ),
  .x_l2c_addr_bus          (entry1_l2c_addr_bus    ),
  .x_l2c_data_bus          (entry1_l2c_data_bus    ),
  .x_l2c_hpcp_bus          (entry1_l2c_hpcp_bus    ),
  .x_piux_ac_bus           (entry1_piux_ac_bus     ),
  .x_rresp_bus             (entry1_rresp_bus       ),
  .x_sab_agevec            (entry1_sab_agevec      ),
  .x_sab_snpl2_cmplt       (entry1_sab_snpl2_cmplt ),
  .x_sid                   (entry1_sid             )
);

// &Connect(.create_bus  (create0_bus)); @102
// &Connect(.create_age  (create0_age)); @103
// &Connect(.create_depd (create0_depd)); @104

// &ConnRule(s/^x_/entry2_/); @106
// &ConnRule(s/_x$/[2]/); @107
// &Instance("ct_ciu_snb_sab_entry", "x_ct_ciu_snb_sab_entry2"); @108
ct_ciu_snb_sab_entry  x_ct_ciu_snb_sab_entry2 (
  .agevec_clr              (agevec_clr             ),
  .ar_crt_entry_index      (ar_crt_entry_index     ),
  .arb_sab_no_l2c_req      (arb_sab_no_l2c_req     ),
  .aw_crt_entry_index      (aw_crt_entry_index     ),
  .aw_mid                  (aw_mid                 ),
  .aw_sh                   (aw_sh                  ),
  .ciu_chr2_bar_dis        (ciu_chr2_bar_dis       ),
  .ciu_chr2_sf_dis         (ciu_chr2_sf_dis        ),
  .ciu_icg_en              (ciu_icg_en             ),
  .ciu_xx_smpen            (ciu_xx_smpen           ),
  .cpurst_b                (cpurst_b               ),
  .create_age              (create0_age            ),
  .create_bus              (create0_bus            ),
  .create_depd             (create0_depd           ),
  .depd_clr                (depd_clr               ),
  .forever_cpuclk          (forever_cpuclk         ),
  .l1_data                 (l1_data                ),
  .l1_wcd_err              (l1_wcd_err             ),
  .l1_wen_x                (l1_wen[2]              ),
  .l1_wstrb                (l1_wstrb               ),
  .l2c_cmplt_x             (l2c_cmplt[2]           ),
  .l2c_cp                  (l2c_cp                 ),
  .l2c_data                (l2c_data               ),
  .l2c_grant_x             (l2c_grant[2]           ),
  .l2c_resp                (l2c_resp               ),
  .memr_ar_grant_x         (memr_ar_grant[2]       ),
  .memr_cmplt_x            (memr_cmplt[2]          ),
  .memr_data               (memr_data              ),
  .memr_data_vld_x         (memr_data_vld[2]       ),
  .memr_resp               (memr_resp              ),
  .memr_resp_err           (memr_resp_err          ),
  .memw_aw_grant_x         (memw_aw_grant[2]       ),
  .memw_cmplt_x            (memw_cmplt[2]          ),
  .pad_yy_icg_scan_en      (pad_yy_icg_scan_en     ),
  .piu0_ac_grant_x         (piu0_ac_grant[2]       ),
  .piu0_cdvld_x            (piu0_cdvld[2]          ),
  .piu0_crresp             (piu0_crresp            ),
  .piu0_crvld_x            (piu0_crvld[2]          ),
  .piu1_ac_grant_x         (piu1_ac_grant[2]       ),
  .piu1_cdvld_x            (piu1_cdvld[2]          ),
  .piu1_crresp             (piu1_crresp            ),
  .piu1_crvld_x            (piu1_crvld[2]          ),
  .piu2_ac_grant_x         (piu2_ac_grant[2]       ),
  .piu2_cdvld_x            (piu2_cdvld[2]          ),
  .piu2_crresp             (piu2_crresp            ),
  .piu2_crvld_x            (piu2_crvld[2]          ),
  .piu3_ac_grant_x         (piu3_ac_grant[2]       ),
  .piu3_cdvld_x            (piu3_cdvld[2]          ),
  .piu3_crresp             (piu3_crresp            ),
  .piu3_crvld_x            (piu3_crvld[2]          ),
  .sab_ar_depd_snb_x       (sab_ar_depd_snb[2]     ),
  .sab_aw_depd_snb_x       (sab_aw_depd_snb[2]     ),
  .sab_b_grant_x           (sab_b_grant[2]         ),
  .sab_back_mark_by_wns_x  (sab_back_mark_by_wns[2]),
  .sab_back_x              (sab_back[2]            ),
  .sab_bar_depd_snb_x      (sab_bar_depd_snb[2]    ),
  .sab_bresp_req_x         (sab_bresp_req[2]       ),
  .sab_busy_x              (sab_busy[2]            ),
  .sab_cen_x               (sab_cen[2]             ),
  .sab_depd_set_by_wns_x   (sab_depd_set_by_wns[2] ),
  .sab_ebiur_req_x         (sab_ebiur_req[2]       ),
  .sab_ebiuw_req_x         (sab_ebiuw_req[2]       ),
  .sab_in_process_x        (sab_in_process[2]      ),
  .sab_l2c_req_x           (sab_l2c_req[2]         ),
  .sab_piu0_ac_req_x       (sab_piu0_ac_req[2]     ),
  .sab_piu0_bar_cmplt_x    (sab_piu0_bar_cmplt[2]  ),
  .sab_piu1_ac_req_x       (sab_piu1_ac_req[2]     ),
  .sab_piu1_bar_cmplt_x    (sab_piu1_bar_cmplt[2]  ),
  .sab_piu2_ac_req_x       (sab_piu2_ac_req[2]     ),
  .sab_piu2_bar_cmplt_x    (sab_piu2_bar_cmplt[2]  ),
  .sab_piu3_ac_req_x       (sab_piu3_ac_req[2]     ),
  .sab_piu3_bar_cmplt_x    (sab_piu3_bar_cmplt[2]  ),
  .sab_pop_en_x            (sab_pop_en[2]          ),
  .sab_r_grant_x           (sab_r_grant[2]         ),
  .sab_rack_x              (sab_rack[2]            ),
  .sab_rresp_req_x         (sab_rresp_req[2]       ),
  .sab_snpext_depd_snb_x   (sab_snpext_depd_snb[2] ),
  .sab_snpl2_cmplt_x       (sab_snpl2_cmplt[2]     ),
  .sab_snpl2_ini_sid       (sab_snpl2_ini_sid      ),
  .sab_vld_x               (sab_vld[2]             ),
  .sab_wns_x               (sab_wns[2]             ),
  .snb1                    (snb1                   ),
  .snpext_index            (snpext_index           ),
  .x_bresp_bus             (entry2_bresp_bus       ),
  .x_dbg_info              (entry2_dbg_info        ),
  .x_depd_set              (entry2_depd_set        ),
  .x_ebiu_arbus            (entry2_ebiu_arbus      ),
  .x_ebiu_awbus            (entry2_ebiu_awbus      ),
  .x_ebiu_dbus             (entry2_ebiu_dbus       ),
  .x_ebiu_mid              (entry2_ebiu_mid        ),
  .x_l2c_addr_bus          (entry2_l2c_addr_bus    ),
  .x_l2c_data_bus          (entry2_l2c_data_bus    ),
  .x_l2c_hpcp_bus          (entry2_l2c_hpcp_bus    ),
  .x_piux_ac_bus           (entry2_piux_ac_bus     ),
  .x_rresp_bus             (entry2_rresp_bus       ),
  .x_sab_agevec            (entry2_sab_agevec      ),
  .x_sab_snpl2_cmplt       (entry2_sab_snpl2_cmplt ),
  .x_sid                   (entry2_sid             )
);

// &Connect(.create_bus  (create0_bus)); @109
// &Connect(.create_age  (create0_age)); @110
// &Connect(.create_depd (create0_depd)); @111

// &ConnRule(s/^x_/entry3_/); @113
// &ConnRule(s/_x$/[3]/); @114
// &Instance("ct_ciu_snb_sab_entry", "x_ct_ciu_snb_sab_entry3"); @115
ct_ciu_snb_sab_entry  x_ct_ciu_snb_sab_entry3 (
  .agevec_clr              (agevec_clr             ),
  .ar_crt_entry_index      (ar_crt_entry_index     ),
  .arb_sab_no_l2c_req      (arb_sab_no_l2c_req     ),
  .aw_crt_entry_index      (aw_crt_entry_index     ),
  .aw_mid                  (aw_mid                 ),
  .aw_sh                   (aw_sh                  ),
  .ciu_chr2_bar_dis        (ciu_chr2_bar_dis       ),
  .ciu_chr2_sf_dis         (ciu_chr2_sf_dis        ),
  .ciu_icg_en              (ciu_icg_en             ),
  .ciu_xx_smpen            (ciu_xx_smpen           ),
  .cpurst_b                (cpurst_b               ),
  .create_age              (create0_age            ),
  .create_bus              (create0_bus            ),
  .create_depd             (create0_depd           ),
  .depd_clr                (depd_clr               ),
  .forever_cpuclk          (forever_cpuclk         ),
  .l1_data                 (l1_data                ),
  .l1_wcd_err              (l1_wcd_err             ),
  .l1_wen_x                (l1_wen[3]              ),
  .l1_wstrb                (l1_wstrb               ),
  .l2c_cmplt_x             (l2c_cmplt[3]           ),
  .l2c_cp                  (l2c_cp                 ),
  .l2c_data                (l2c_data               ),
  .l2c_grant_x             (l2c_grant[3]           ),
  .l2c_resp                (l2c_resp               ),
  .memr_ar_grant_x         (memr_ar_grant[3]       ),
  .memr_cmplt_x            (memr_cmplt[3]          ),
  .memr_data               (memr_data              ),
  .memr_data_vld_x         (memr_data_vld[3]       ),
  .memr_resp               (memr_resp              ),
  .memr_resp_err           (memr_resp_err          ),
  .memw_aw_grant_x         (memw_aw_grant[3]       ),
  .memw_cmplt_x            (memw_cmplt[3]          ),
  .pad_yy_icg_scan_en      (pad_yy_icg_scan_en     ),
  .piu0_ac_grant_x         (piu0_ac_grant[3]       ),
  .piu0_cdvld_x            (piu0_cdvld[3]          ),
  .piu0_crresp             (piu0_crresp            ),
  .piu0_crvld_x            (piu0_crvld[3]          ),
  .piu1_ac_grant_x         (piu1_ac_grant[3]       ),
  .piu1_cdvld_x            (piu1_cdvld[3]          ),
  .piu1_crresp             (piu1_crresp            ),
  .piu1_crvld_x            (piu1_crvld[3]          ),
  .piu2_ac_grant_x         (piu2_ac_grant[3]       ),
  .piu2_cdvld_x            (piu2_cdvld[3]          ),
  .piu2_crresp             (piu2_crresp            ),
  .piu2_crvld_x            (piu2_crvld[3]          ),
  .piu3_ac_grant_x         (piu3_ac_grant[3]       ),
  .piu3_cdvld_x            (piu3_cdvld[3]          ),
  .piu3_crresp             (piu3_crresp            ),
  .piu3_crvld_x            (piu3_crvld[3]          ),
  .sab_ar_depd_snb_x       (sab_ar_depd_snb[3]     ),
  .sab_aw_depd_snb_x       (sab_aw_depd_snb[3]     ),
  .sab_b_grant_x           (sab_b_grant[3]         ),
  .sab_back_mark_by_wns_x  (sab_back_mark_by_wns[3]),
  .sab_back_x              (sab_back[3]            ),
  .sab_bar_depd_snb_x      (sab_bar_depd_snb[3]    ),
  .sab_bresp_req_x         (sab_bresp_req[3]       ),
  .sab_busy_x              (sab_busy[3]            ),
  .sab_cen_x               (sab_cen[3]             ),
  .sab_depd_set_by_wns_x   (sab_depd_set_by_wns[3] ),
  .sab_ebiur_req_x         (sab_ebiur_req[3]       ),
  .sab_ebiuw_req_x         (sab_ebiuw_req[3]       ),
  .sab_in_process_x        (sab_in_process[3]      ),
  .sab_l2c_req_x           (sab_l2c_req[3]         ),
  .sab_piu0_ac_req_x       (sab_piu0_ac_req[3]     ),
  .sab_piu0_bar_cmplt_x    (sab_piu0_bar_cmplt[3]  ),
  .sab_piu1_ac_req_x       (sab_piu1_ac_req[3]     ),
  .sab_piu1_bar_cmplt_x    (sab_piu1_bar_cmplt[3]  ),
  .sab_piu2_ac_req_x       (sab_piu2_ac_req[3]     ),
  .sab_piu2_bar_cmplt_x    (sab_piu2_bar_cmplt[3]  ),
  .sab_piu3_ac_req_x       (sab_piu3_ac_req[3]     ),
  .sab_piu3_bar_cmplt_x    (sab_piu3_bar_cmplt[3]  ),
  .sab_pop_en_x            (sab_pop_en[3]          ),
  .sab_r_grant_x           (sab_r_grant[3]         ),
  .sab_rack_x              (sab_rack[3]            ),
  .sab_rresp_req_x         (sab_rresp_req[3]       ),
  .sab_snpext_depd_snb_x   (sab_snpext_depd_snb[3] ),
  .sab_snpl2_cmplt_x       (sab_snpl2_cmplt[3]     ),
  .sab_snpl2_ini_sid       (sab_snpl2_ini_sid      ),
  .sab_vld_x               (sab_vld[3]             ),
  .sab_wns_x               (sab_wns[3]             ),
  .snb1                    (snb1                   ),
  .snpext_index            (snpext_index           ),
  .x_bresp_bus             (entry3_bresp_bus       ),
  .x_dbg_info              (entry3_dbg_info        ),
  .x_depd_set              (entry3_depd_set        ),
  .x_ebiu_arbus            (entry3_ebiu_arbus      ),
  .x_ebiu_awbus            (entry3_ebiu_awbus      ),
  .x_ebiu_dbus             (entry3_ebiu_dbus       ),
  .x_ebiu_mid              (entry3_ebiu_mid        ),
  .x_l2c_addr_bus          (entry3_l2c_addr_bus    ),
  .x_l2c_data_bus          (entry3_l2c_data_bus    ),
  .x_l2c_hpcp_bus          (entry3_l2c_hpcp_bus    ),
  .x_piux_ac_bus           (entry3_piux_ac_bus     ),
  .x_rresp_bus             (entry3_rresp_bus       ),
  .x_sab_agevec            (entry3_sab_agevec      ),
  .x_sab_snpl2_cmplt       (entry3_sab_snpl2_cmplt ),
  .x_sid                   (entry3_sid             )
);

// &Connect(.create_bus  (create0_bus)); @116
// &Connect(.create_age  (create0_age)); @117
// &Connect(.create_depd (create0_depd)); @118

// &ConnRule(s/^x_/entry4_/); @120
// &ConnRule(s/_x$/[4]/); @121
// &Instance("ct_ciu_snb_sab_entry", "x_ct_ciu_snb_sab_entry4"); @122
ct_ciu_snb_sab_entry  x_ct_ciu_snb_sab_entry4 (
  .agevec_clr              (agevec_clr             ),
  .ar_crt_entry_index      (ar_crt_entry_index     ),
  .arb_sab_no_l2c_req      (arb_sab_no_l2c_req     ),
  .aw_crt_entry_index      (aw_crt_entry_index     ),
  .aw_mid                  (aw_mid                 ),
  .aw_sh                   (aw_sh                  ),
  .ciu_chr2_bar_dis        (ciu_chr2_bar_dis       ),
  .ciu_chr2_sf_dis         (ciu_chr2_sf_dis        ),
  .ciu_icg_en              (ciu_icg_en             ),
  .ciu_xx_smpen            (ciu_xx_smpen           ),
  .cpurst_b                (cpurst_b               ),
  .create_age              (create0_age            ),
  .create_bus              (create0_bus            ),
  .create_depd             (create0_depd           ),
  .depd_clr                (depd_clr               ),
  .forever_cpuclk          (forever_cpuclk         ),
  .l1_data                 (l1_data                ),
  .l1_wcd_err              (l1_wcd_err             ),
  .l1_wen_x                (l1_wen[4]              ),
  .l1_wstrb                (l1_wstrb               ),
  .l2c_cmplt_x             (l2c_cmplt[4]           ),
  .l2c_cp                  (l2c_cp                 ),
  .l2c_data                (l2c_data               ),
  .l2c_grant_x             (l2c_grant[4]           ),
  .l2c_resp                (l2c_resp               ),
  .memr_ar_grant_x         (memr_ar_grant[4]       ),
  .memr_cmplt_x            (memr_cmplt[4]          ),
  .memr_data               (memr_data              ),
  .memr_data_vld_x         (memr_data_vld[4]       ),
  .memr_resp               (memr_resp              ),
  .memr_resp_err           (memr_resp_err          ),
  .memw_aw_grant_x         (memw_aw_grant[4]       ),
  .memw_cmplt_x            (memw_cmplt[4]          ),
  .pad_yy_icg_scan_en      (pad_yy_icg_scan_en     ),
  .piu0_ac_grant_x         (piu0_ac_grant[4]       ),
  .piu0_cdvld_x            (piu0_cdvld[4]          ),
  .piu0_crresp             (piu0_crresp            ),
  .piu0_crvld_x            (piu0_crvld[4]          ),
  .piu1_ac_grant_x         (piu1_ac_grant[4]       ),
  .piu1_cdvld_x            (piu1_cdvld[4]          ),
  .piu1_crresp             (piu1_crresp            ),
  .piu1_crvld_x            (piu1_crvld[4]          ),
  .piu2_ac_grant_x         (piu2_ac_grant[4]       ),
  .piu2_cdvld_x            (piu2_cdvld[4]          ),
  .piu2_crresp             (piu2_crresp            ),
  .piu2_crvld_x            (piu2_crvld[4]          ),
  .piu3_ac_grant_x         (piu3_ac_grant[4]       ),
  .piu3_cdvld_x            (piu3_cdvld[4]          ),
  .piu3_crresp             (piu3_crresp            ),
  .piu3_crvld_x            (piu3_crvld[4]          ),
  .sab_ar_depd_snb_x       (sab_ar_depd_snb[4]     ),
  .sab_aw_depd_snb_x       (sab_aw_depd_snb[4]     ),
  .sab_b_grant_x           (sab_b_grant[4]         ),
  .sab_back_mark_by_wns_x  (sab_back_mark_by_wns[4]),
  .sab_back_x              (sab_back[4]            ),
  .sab_bar_depd_snb_x      (sab_bar_depd_snb[4]    ),
  .sab_bresp_req_x         (sab_bresp_req[4]       ),
  .sab_busy_x              (sab_busy[4]            ),
  .sab_cen_x               (sab_cen[4]             ),
  .sab_depd_set_by_wns_x   (sab_depd_set_by_wns[4] ),
  .sab_ebiur_req_x         (sab_ebiur_req[4]       ),
  .sab_ebiuw_req_x         (sab_ebiuw_req[4]       ),
  .sab_in_process_x        (sab_in_process[4]      ),
  .sab_l2c_req_x           (sab_l2c_req[4]         ),
  .sab_piu0_ac_req_x       (sab_piu0_ac_req[4]     ),
  .sab_piu0_bar_cmplt_x    (sab_piu0_bar_cmplt[4]  ),
  .sab_piu1_ac_req_x       (sab_piu1_ac_req[4]     ),
  .sab_piu1_bar_cmplt_x    (sab_piu1_bar_cmplt[4]  ),
  .sab_piu2_ac_req_x       (sab_piu2_ac_req[4]     ),
  .sab_piu2_bar_cmplt_x    (sab_piu2_bar_cmplt[4]  ),
  .sab_piu3_ac_req_x       (sab_piu3_ac_req[4]     ),
  .sab_piu3_bar_cmplt_x    (sab_piu3_bar_cmplt[4]  ),
  .sab_pop_en_x            (sab_pop_en[4]          ),
  .sab_r_grant_x           (sab_r_grant[4]         ),
  .sab_rack_x              (sab_rack[4]            ),
  .sab_rresp_req_x         (sab_rresp_req[4]       ),
  .sab_snpext_depd_snb_x   (sab_snpext_depd_snb[4] ),
  .sab_snpl2_cmplt_x       (sab_snpl2_cmplt[4]     ),
  .sab_snpl2_ini_sid       (sab_snpl2_ini_sid      ),
  .sab_vld_x               (sab_vld[4]             ),
  .sab_wns_x               (sab_wns[4]             ),
  .snb1                    (snb1                   ),
  .snpext_index            (snpext_index           ),
  .x_bresp_bus             (entry4_bresp_bus       ),
  .x_dbg_info              (entry4_dbg_info        ),
  .x_depd_set              (entry4_depd_set        ),
  .x_ebiu_arbus            (entry4_ebiu_arbus      ),
  .x_ebiu_awbus            (entry4_ebiu_awbus      ),
  .x_ebiu_dbus             (entry4_ebiu_dbus       ),
  .x_ebiu_mid              (entry4_ebiu_mid        ),
  .x_l2c_addr_bus          (entry4_l2c_addr_bus    ),
  .x_l2c_data_bus          (entry4_l2c_data_bus    ),
  .x_l2c_hpcp_bus          (entry4_l2c_hpcp_bus    ),
  .x_piux_ac_bus           (entry4_piux_ac_bus     ),
  .x_rresp_bus             (entry4_rresp_bus       ),
  .x_sab_agevec            (entry4_sab_agevec      ),
  .x_sab_snpl2_cmplt       (entry4_sab_snpl2_cmplt ),
  .x_sid                   (entry4_sid             )
);

// &Connect(.create_bus  (create0_bus)); @123
// &Connect(.create_age  (create0_age)); @124
// &Connect(.create_depd (create0_depd)); @125

// &ConnRule(s/^x_/entry5_/); @127
// &ConnRule(s/_x$/[5]/); @128
// &Instance("ct_ciu_snb_sab_entry", "x_ct_ciu_snb_sab_entry5"); @129
ct_ciu_snb_sab_entry  x_ct_ciu_snb_sab_entry5 (
  .agevec_clr              (agevec_clr             ),
  .ar_crt_entry_index      (ar_crt_entry_index     ),
  .arb_sab_no_l2c_req      (arb_sab_no_l2c_req     ),
  .aw_crt_entry_index      (aw_crt_entry_index     ),
  .aw_mid                  (aw_mid                 ),
  .aw_sh                   (aw_sh                  ),
  .ciu_chr2_bar_dis        (ciu_chr2_bar_dis       ),
  .ciu_chr2_sf_dis         (ciu_chr2_sf_dis        ),
  .ciu_icg_en              (ciu_icg_en             ),
  .ciu_xx_smpen            (ciu_xx_smpen           ),
  .cpurst_b                (cpurst_b               ),
  .create_age              (create0_age            ),
  .create_bus              (create0_bus            ),
  .create_depd             (create0_depd           ),
  .depd_clr                (depd_clr               ),
  .forever_cpuclk          (forever_cpuclk         ),
  .l1_data                 (l1_data                ),
  .l1_wcd_err              (l1_wcd_err             ),
  .l1_wen_x                (l1_wen[5]              ),
  .l1_wstrb                (l1_wstrb               ),
  .l2c_cmplt_x             (l2c_cmplt[5]           ),
  .l2c_cp                  (l2c_cp                 ),
  .l2c_data                (l2c_data               ),
  .l2c_grant_x             (l2c_grant[5]           ),
  .l2c_resp                (l2c_resp               ),
  .memr_ar_grant_x         (memr_ar_grant[5]       ),
  .memr_cmplt_x            (memr_cmplt[5]          ),
  .memr_data               (memr_data              ),
  .memr_data_vld_x         (memr_data_vld[5]       ),
  .memr_resp               (memr_resp              ),
  .memr_resp_err           (memr_resp_err          ),
  .memw_aw_grant_x         (memw_aw_grant[5]       ),
  .memw_cmplt_x            (memw_cmplt[5]          ),
  .pad_yy_icg_scan_en      (pad_yy_icg_scan_en     ),
  .piu0_ac_grant_x         (piu0_ac_grant[5]       ),
  .piu0_cdvld_x            (piu0_cdvld[5]          ),
  .piu0_crresp             (piu0_crresp            ),
  .piu0_crvld_x            (piu0_crvld[5]          ),
  .piu1_ac_grant_x         (piu1_ac_grant[5]       ),
  .piu1_cdvld_x            (piu1_cdvld[5]          ),
  .piu1_crresp             (piu1_crresp            ),
  .piu1_crvld_x            (piu1_crvld[5]          ),
  .piu2_ac_grant_x         (piu2_ac_grant[5]       ),
  .piu2_cdvld_x            (piu2_cdvld[5]          ),
  .piu2_crresp             (piu2_crresp            ),
  .piu2_crvld_x            (piu2_crvld[5]          ),
  .piu3_ac_grant_x         (piu3_ac_grant[5]       ),
  .piu3_cdvld_x            (piu3_cdvld[5]          ),
  .piu3_crresp             (piu3_crresp            ),
  .piu3_crvld_x            (piu3_crvld[5]          ),
  .sab_ar_depd_snb_x       (sab_ar_depd_snb[5]     ),
  .sab_aw_depd_snb_x       (sab_aw_depd_snb[5]     ),
  .sab_b_grant_x           (sab_b_grant[5]         ),
  .sab_back_mark_by_wns_x  (sab_back_mark_by_wns[5]),
  .sab_back_x              (sab_back[5]            ),
  .sab_bar_depd_snb_x      (sab_bar_depd_snb[5]    ),
  .sab_bresp_req_x         (sab_bresp_req[5]       ),
  .sab_busy_x              (sab_busy[5]            ),
  .sab_cen_x               (sab_cen[5]             ),
  .sab_depd_set_by_wns_x   (sab_depd_set_by_wns[5] ),
  .sab_ebiur_req_x         (sab_ebiur_req[5]       ),
  .sab_ebiuw_req_x         (sab_ebiuw_req[5]       ),
  .sab_in_process_x        (sab_in_process[5]      ),
  .sab_l2c_req_x           (sab_l2c_req[5]         ),
  .sab_piu0_ac_req_x       (sab_piu0_ac_req[5]     ),
  .sab_piu0_bar_cmplt_x    (sab_piu0_bar_cmplt[5]  ),
  .sab_piu1_ac_req_x       (sab_piu1_ac_req[5]     ),
  .sab_piu1_bar_cmplt_x    (sab_piu1_bar_cmplt[5]  ),
  .sab_piu2_ac_req_x       (sab_piu2_ac_req[5]     ),
  .sab_piu2_bar_cmplt_x    (sab_piu2_bar_cmplt[5]  ),
  .sab_piu3_ac_req_x       (sab_piu3_ac_req[5]     ),
  .sab_piu3_bar_cmplt_x    (sab_piu3_bar_cmplt[5]  ),
  .sab_pop_en_x            (sab_pop_en[5]          ),
  .sab_r_grant_x           (sab_r_grant[5]         ),
  .sab_rack_x              (sab_rack[5]            ),
  .sab_rresp_req_x         (sab_rresp_req[5]       ),
  .sab_snpext_depd_snb_x   (sab_snpext_depd_snb[5] ),
  .sab_snpl2_cmplt_x       (sab_snpl2_cmplt[5]     ),
  .sab_snpl2_ini_sid       (sab_snpl2_ini_sid      ),
  .sab_vld_x               (sab_vld[5]             ),
  .sab_wns_x               (sab_wns[5]             ),
  .snb1                    (snb1                   ),
  .snpext_index            (snpext_index           ),
  .x_bresp_bus             (entry5_bresp_bus       ),
  .x_dbg_info              (entry5_dbg_info        ),
  .x_depd_set              (entry5_depd_set        ),
  .x_ebiu_arbus            (entry5_ebiu_arbus      ),
  .x_ebiu_awbus            (entry5_ebiu_awbus      ),
  .x_ebiu_dbus             (entry5_ebiu_dbus       ),
  .x_ebiu_mid              (entry5_ebiu_mid        ),
  .x_l2c_addr_bus          (entry5_l2c_addr_bus    ),
  .x_l2c_data_bus          (entry5_l2c_data_bus    ),
  .x_l2c_hpcp_bus          (entry5_l2c_hpcp_bus    ),
  .x_piux_ac_bus           (entry5_piux_ac_bus     ),
  .x_rresp_bus             (entry5_rresp_bus       ),
  .x_sab_agevec            (entry5_sab_agevec      ),
  .x_sab_snpl2_cmplt       (entry5_sab_snpl2_cmplt ),
  .x_sid                   (entry5_sid             )
);

// &Connect(.create_bus  (create0_bus)); @130
// &Connect(.create_age  (create0_age)); @131
// &Connect(.create_depd (create0_depd)); @132

// &ConnRule(s/^x_/entry6_/); @134
// &ConnRule(s/_x$/[6]/); @135
// &Instance("ct_ciu_snb_sab_entry", "x_ct_ciu_snb_sab_entry6"); @136
ct_ciu_snb_sab_entry  x_ct_ciu_snb_sab_entry6 (
  .agevec_clr              (agevec_clr             ),
  .ar_crt_entry_index      (ar_crt_entry_index     ),
  .arb_sab_no_l2c_req      (arb_sab_no_l2c_req     ),
  .aw_crt_entry_index      (aw_crt_entry_index     ),
  .aw_mid                  (aw_mid                 ),
  .aw_sh                   (aw_sh                  ),
  .ciu_chr2_bar_dis        (ciu_chr2_bar_dis       ),
  .ciu_chr2_sf_dis         (ciu_chr2_sf_dis        ),
  .ciu_icg_en              (ciu_icg_en             ),
  .ciu_xx_smpen            (ciu_xx_smpen           ),
  .cpurst_b                (cpurst_b               ),
  .create_age              (create0_age            ),
  .create_bus              (create0_bus            ),
  .create_depd             (create0_depd           ),
  .depd_clr                (depd_clr               ),
  .forever_cpuclk          (forever_cpuclk         ),
  .l1_data                 (l1_data                ),
  .l1_wcd_err              (l1_wcd_err             ),
  .l1_wen_x                (l1_wen[6]              ),
  .l1_wstrb                (l1_wstrb               ),
  .l2c_cmplt_x             (l2c_cmplt[6]           ),
  .l2c_cp                  (l2c_cp                 ),
  .l2c_data                (l2c_data               ),
  .l2c_grant_x             (l2c_grant[6]           ),
  .l2c_resp                (l2c_resp               ),
  .memr_ar_grant_x         (memr_ar_grant[6]       ),
  .memr_cmplt_x            (memr_cmplt[6]          ),
  .memr_data               (memr_data              ),
  .memr_data_vld_x         (memr_data_vld[6]       ),
  .memr_resp               (memr_resp              ),
  .memr_resp_err           (memr_resp_err          ),
  .memw_aw_grant_x         (memw_aw_grant[6]       ),
  .memw_cmplt_x            (memw_cmplt[6]          ),
  .pad_yy_icg_scan_en      (pad_yy_icg_scan_en     ),
  .piu0_ac_grant_x         (piu0_ac_grant[6]       ),
  .piu0_cdvld_x            (piu0_cdvld[6]          ),
  .piu0_crresp             (piu0_crresp            ),
  .piu0_crvld_x            (piu0_crvld[6]          ),
  .piu1_ac_grant_x         (piu1_ac_grant[6]       ),
  .piu1_cdvld_x            (piu1_cdvld[6]          ),
  .piu1_crresp             (piu1_crresp            ),
  .piu1_crvld_x            (piu1_crvld[6]          ),
  .piu2_ac_grant_x         (piu2_ac_grant[6]       ),
  .piu2_cdvld_x            (piu2_cdvld[6]          ),
  .piu2_crresp             (piu2_crresp            ),
  .piu2_crvld_x            (piu2_crvld[6]          ),
  .piu3_ac_grant_x         (piu3_ac_grant[6]       ),
  .piu3_cdvld_x            (piu3_cdvld[6]          ),
  .piu3_crresp             (piu3_crresp            ),
  .piu3_crvld_x            (piu3_crvld[6]          ),
  .sab_ar_depd_snb_x       (sab_ar_depd_snb[6]     ),
  .sab_aw_depd_snb_x       (sab_aw_depd_snb[6]     ),
  .sab_b_grant_x           (sab_b_grant[6]         ),
  .sab_back_mark_by_wns_x  (sab_back_mark_by_wns[6]),
  .sab_back_x              (sab_back[6]            ),
  .sab_bar_depd_snb_x      (sab_bar_depd_snb[6]    ),
  .sab_bresp_req_x         (sab_bresp_req[6]       ),
  .sab_busy_x              (sab_busy[6]            ),
  .sab_cen_x               (sab_cen[6]             ),
  .sab_depd_set_by_wns_x   (sab_depd_set_by_wns[6] ),
  .sab_ebiur_req_x         (sab_ebiur_req[6]       ),
  .sab_ebiuw_req_x         (sab_ebiuw_req[6]       ),
  .sab_in_process_x        (sab_in_process[6]      ),
  .sab_l2c_req_x           (sab_l2c_req[6]         ),
  .sab_piu0_ac_req_x       (sab_piu0_ac_req[6]     ),
  .sab_piu0_bar_cmplt_x    (sab_piu0_bar_cmplt[6]  ),
  .sab_piu1_ac_req_x       (sab_piu1_ac_req[6]     ),
  .sab_piu1_bar_cmplt_x    (sab_piu1_bar_cmplt[6]  ),
  .sab_piu2_ac_req_x       (sab_piu2_ac_req[6]     ),
  .sab_piu2_bar_cmplt_x    (sab_piu2_bar_cmplt[6]  ),
  .sab_piu3_ac_req_x       (sab_piu3_ac_req[6]     ),
  .sab_piu3_bar_cmplt_x    (sab_piu3_bar_cmplt[6]  ),
  .sab_pop_en_x            (sab_pop_en[6]          ),
  .sab_r_grant_x           (sab_r_grant[6]         ),
  .sab_rack_x              (sab_rack[6]            ),
  .sab_rresp_req_x         (sab_rresp_req[6]       ),
  .sab_snpext_depd_snb_x   (sab_snpext_depd_snb[6] ),
  .sab_snpl2_cmplt_x       (sab_snpl2_cmplt[6]     ),
  .sab_snpl2_ini_sid       (sab_snpl2_ini_sid      ),
  .sab_vld_x               (sab_vld[6]             ),
  .sab_wns_x               (sab_wns[6]             ),
  .snb1                    (snb1                   ),
  .snpext_index            (snpext_index           ),
  .x_bresp_bus             (entry6_bresp_bus       ),
  .x_dbg_info              (entry6_dbg_info        ),
  .x_depd_set              (entry6_depd_set        ),
  .x_ebiu_arbus            (entry6_ebiu_arbus      ),
  .x_ebiu_awbus            (entry6_ebiu_awbus      ),
  .x_ebiu_dbus             (entry6_ebiu_dbus       ),
  .x_ebiu_mid              (entry6_ebiu_mid        ),
  .x_l2c_addr_bus          (entry6_l2c_addr_bus    ),
  .x_l2c_data_bus          (entry6_l2c_data_bus    ),
  .x_l2c_hpcp_bus          (entry6_l2c_hpcp_bus    ),
  .x_piux_ac_bus           (entry6_piux_ac_bus     ),
  .x_rresp_bus             (entry6_rresp_bus       ),
  .x_sab_agevec            (entry6_sab_agevec      ),
  .x_sab_snpl2_cmplt       (entry6_sab_snpl2_cmplt ),
  .x_sid                   (entry6_sid             )
);

// &Connect(.create_bus  (create0_bus)); @137
// &Connect(.create_age  (create0_age)); @138
// &Connect(.create_depd (create0_depd)); @139
// &ConnRule(s/^x_/entry7_/); @140
// &ConnRule(s/_x$/[7]/); @141
// &Instance("ct_ciu_snb_sab_entry", "x_ct_ciu_snb_sab_entry7"); @142
ct_ciu_snb_sab_entry  x_ct_ciu_snb_sab_entry7 (
  .agevec_clr              (agevec_clr             ),
  .ar_crt_entry_index      (ar_crt_entry_index     ),
  .arb_sab_no_l2c_req      (arb_sab_no_l2c_req     ),
  .aw_crt_entry_index      (aw_crt_entry_index     ),
  .aw_mid                  (aw_mid                 ),
  .aw_sh                   (aw_sh                  ),
  .ciu_chr2_bar_dis        (ciu_chr2_bar_dis       ),
  .ciu_chr2_sf_dis         (ciu_chr2_sf_dis        ),
  .ciu_icg_en              (ciu_icg_en             ),
  .ciu_xx_smpen            (ciu_xx_smpen           ),
  .cpurst_b                (cpurst_b               ),
  .create_age              (create0_age            ),
  .create_bus              (create0_bus            ),
  .create_depd             (create0_depd           ),
  .depd_clr                (depd_clr               ),
  .forever_cpuclk          (forever_cpuclk         ),
  .l1_data                 (l1_data                ),
  .l1_wcd_err              (l1_wcd_err             ),
  .l1_wen_x                (l1_wen[7]              ),
  .l1_wstrb                (l1_wstrb               ),
  .l2c_cmplt_x             (l2c_cmplt[7]           ),
  .l2c_cp                  (l2c_cp                 ),
  .l2c_data                (l2c_data               ),
  .l2c_grant_x             (l2c_grant[7]           ),
  .l2c_resp                (l2c_resp               ),
  .memr_ar_grant_x         (memr_ar_grant[7]       ),
  .memr_cmplt_x            (memr_cmplt[7]          ),
  .memr_data               (memr_data              ),
  .memr_data_vld_x         (memr_data_vld[7]       ),
  .memr_resp               (memr_resp              ),
  .memr_resp_err           (memr_resp_err          ),
  .memw_aw_grant_x         (memw_aw_grant[7]       ),
  .memw_cmplt_x            (memw_cmplt[7]          ),
  .pad_yy_icg_scan_en      (pad_yy_icg_scan_en     ),
  .piu0_ac_grant_x         (piu0_ac_grant[7]       ),
  .piu0_cdvld_x            (piu0_cdvld[7]          ),
  .piu0_crresp             (piu0_crresp            ),
  .piu0_crvld_x            (piu0_crvld[7]          ),
  .piu1_ac_grant_x         (piu1_ac_grant[7]       ),
  .piu1_cdvld_x            (piu1_cdvld[7]          ),
  .piu1_crresp             (piu1_crresp            ),
  .piu1_crvld_x            (piu1_crvld[7]          ),
  .piu2_ac_grant_x         (piu2_ac_grant[7]       ),
  .piu2_cdvld_x            (piu2_cdvld[7]          ),
  .piu2_crresp             (piu2_crresp            ),
  .piu2_crvld_x            (piu2_crvld[7]          ),
  .piu3_ac_grant_x         (piu3_ac_grant[7]       ),
  .piu3_cdvld_x            (piu3_cdvld[7]          ),
  .piu3_crresp             (piu3_crresp            ),
  .piu3_crvld_x            (piu3_crvld[7]          ),
  .sab_ar_depd_snb_x       (sab_ar_depd_snb[7]     ),
  .sab_aw_depd_snb_x       (sab_aw_depd_snb[7]     ),
  .sab_b_grant_x           (sab_b_grant[7]         ),
  .sab_back_mark_by_wns_x  (sab_back_mark_by_wns[7]),
  .sab_back_x              (sab_back[7]            ),
  .sab_bar_depd_snb_x      (sab_bar_depd_snb[7]    ),
  .sab_bresp_req_x         (sab_bresp_req[7]       ),
  .sab_busy_x              (sab_busy[7]            ),
  .sab_cen_x               (sab_cen[7]             ),
  .sab_depd_set_by_wns_x   (sab_depd_set_by_wns[7] ),
  .sab_ebiur_req_x         (sab_ebiur_req[7]       ),
  .sab_ebiuw_req_x         (sab_ebiuw_req[7]       ),
  .sab_in_process_x        (sab_in_process[7]      ),
  .sab_l2c_req_x           (sab_l2c_req[7]         ),
  .sab_piu0_ac_req_x       (sab_piu0_ac_req[7]     ),
  .sab_piu0_bar_cmplt_x    (sab_piu0_bar_cmplt[7]  ),
  .sab_piu1_ac_req_x       (sab_piu1_ac_req[7]     ),
  .sab_piu1_bar_cmplt_x    (sab_piu1_bar_cmplt[7]  ),
  .sab_piu2_ac_req_x       (sab_piu2_ac_req[7]     ),
  .sab_piu2_bar_cmplt_x    (sab_piu2_bar_cmplt[7]  ),
  .sab_piu3_ac_req_x       (sab_piu3_ac_req[7]     ),
  .sab_piu3_bar_cmplt_x    (sab_piu3_bar_cmplt[7]  ),
  .sab_pop_en_x            (sab_pop_en[7]          ),
  .sab_r_grant_x           (sab_r_grant[7]         ),
  .sab_rack_x              (sab_rack[7]            ),
  .sab_rresp_req_x         (sab_rresp_req[7]       ),
  .sab_snpext_depd_snb_x   (sab_snpext_depd_snb[7] ),
  .sab_snpl2_cmplt_x       (sab_snpl2_cmplt[7]     ),
  .sab_snpl2_ini_sid       (sab_snpl2_ini_sid      ),
  .sab_vld_x               (sab_vld[7]             ),
  .sab_wns_x               (sab_wns[7]             ),
  .snb1                    (snb1                   ),
  .snpext_index            (snpext_index           ),
  .x_bresp_bus             (entry7_bresp_bus       ),
  .x_dbg_info              (entry7_dbg_info        ),
  .x_depd_set              (entry7_depd_set        ),
  .x_ebiu_arbus            (entry7_ebiu_arbus      ),
  .x_ebiu_awbus            (entry7_ebiu_awbus      ),
  .x_ebiu_dbus             (entry7_ebiu_dbus       ),
  .x_ebiu_mid              (entry7_ebiu_mid        ),
  .x_l2c_addr_bus          (entry7_l2c_addr_bus    ),
  .x_l2c_data_bus          (entry7_l2c_data_bus    ),
  .x_l2c_hpcp_bus          (entry7_l2c_hpcp_bus    ),
  .x_piux_ac_bus           (entry7_piux_ac_bus     ),
  .x_rresp_bus             (entry7_rresp_bus       ),
  .x_sab_agevec            (entry7_sab_agevec      ),
  .x_sab_snpl2_cmplt       (entry7_sab_snpl2_cmplt ),
  .x_sid                   (entry7_sid             )
);

// &Connect(.create_bus  (create0_bus)); @143
// &Connect(.create_age  (create0_age)); @144
// &Connect(.create_depd (create0_depd)); @145
// &ConnRule(s/^x_/entry8_/); @146
// &ConnRule(s/_x$/[8]/); @147
// &Instance("ct_ciu_snb_sab_entry", "x_ct_ciu_snb_sab_entry8"); @148
ct_ciu_snb_sab_entry  x_ct_ciu_snb_sab_entry8 (
  .agevec_clr              (agevec_clr             ),
  .ar_crt_entry_index      (ar_crt_entry_index     ),
  .arb_sab_no_l2c_req      (arb_sab_no_l2c_req     ),
  .aw_crt_entry_index      (aw_crt_entry_index     ),
  .aw_mid                  (aw_mid                 ),
  .aw_sh                   (aw_sh                  ),
  .ciu_chr2_bar_dis        (ciu_chr2_bar_dis       ),
  .ciu_chr2_sf_dis         (ciu_chr2_sf_dis        ),
  .ciu_icg_en              (ciu_icg_en             ),
  .ciu_xx_smpen            (ciu_xx_smpen           ),
  .cpurst_b                (cpurst_b               ),
  .create_age              (create0_age            ),
  .create_bus              (create0_bus            ),
  .create_depd             (create0_depd           ),
  .depd_clr                (depd_clr               ),
  .forever_cpuclk          (forever_cpuclk         ),
  .l1_data                 (l1_data                ),
  .l1_wcd_err              (l1_wcd_err             ),
  .l1_wen_x                (l1_wen[8]              ),
  .l1_wstrb                (l1_wstrb               ),
  .l2c_cmplt_x             (l2c_cmplt[8]           ),
  .l2c_cp                  (l2c_cp                 ),
  .l2c_data                (l2c_data               ),
  .l2c_grant_x             (l2c_grant[8]           ),
  .l2c_resp                (l2c_resp               ),
  .memr_ar_grant_x         (memr_ar_grant[8]       ),
  .memr_cmplt_x            (memr_cmplt[8]          ),
  .memr_data               (memr_data              ),
  .memr_data_vld_x         (memr_data_vld[8]       ),
  .memr_resp               (memr_resp              ),
  .memr_resp_err           (memr_resp_err          ),
  .memw_aw_grant_x         (memw_aw_grant[8]       ),
  .memw_cmplt_x            (memw_cmplt[8]          ),
  .pad_yy_icg_scan_en      (pad_yy_icg_scan_en     ),
  .piu0_ac_grant_x         (piu0_ac_grant[8]       ),
  .piu0_cdvld_x            (piu0_cdvld[8]          ),
  .piu0_crresp             (piu0_crresp            ),
  .piu0_crvld_x            (piu0_crvld[8]          ),
  .piu1_ac_grant_x         (piu1_ac_grant[8]       ),
  .piu1_cdvld_x            (piu1_cdvld[8]          ),
  .piu1_crresp             (piu1_crresp            ),
  .piu1_crvld_x            (piu1_crvld[8]          ),
  .piu2_ac_grant_x         (piu2_ac_grant[8]       ),
  .piu2_cdvld_x            (piu2_cdvld[8]          ),
  .piu2_crresp             (piu2_crresp            ),
  .piu2_crvld_x            (piu2_crvld[8]          ),
  .piu3_ac_grant_x         (piu3_ac_grant[8]       ),
  .piu3_cdvld_x            (piu3_cdvld[8]          ),
  .piu3_crresp             (piu3_crresp            ),
  .piu3_crvld_x            (piu3_crvld[8]          ),
  .sab_ar_depd_snb_x       (sab_ar_depd_snb[8]     ),
  .sab_aw_depd_snb_x       (sab_aw_depd_snb[8]     ),
  .sab_b_grant_x           (sab_b_grant[8]         ),
  .sab_back_mark_by_wns_x  (sab_back_mark_by_wns[8]),
  .sab_back_x              (sab_back[8]            ),
  .sab_bar_depd_snb_x      (sab_bar_depd_snb[8]    ),
  .sab_bresp_req_x         (sab_bresp_req[8]       ),
  .sab_busy_x              (sab_busy[8]            ),
  .sab_cen_x               (sab_cen[8]             ),
  .sab_depd_set_by_wns_x   (sab_depd_set_by_wns[8] ),
  .sab_ebiur_req_x         (sab_ebiur_req[8]       ),
  .sab_ebiuw_req_x         (sab_ebiuw_req[8]       ),
  .sab_in_process_x        (sab_in_process[8]      ),
  .sab_l2c_req_x           (sab_l2c_req[8]         ),
  .sab_piu0_ac_req_x       (sab_piu0_ac_req[8]     ),
  .sab_piu0_bar_cmplt_x    (sab_piu0_bar_cmplt[8]  ),
  .sab_piu1_ac_req_x       (sab_piu1_ac_req[8]     ),
  .sab_piu1_bar_cmplt_x    (sab_piu1_bar_cmplt[8]  ),
  .sab_piu2_ac_req_x       (sab_piu2_ac_req[8]     ),
  .sab_piu2_bar_cmplt_x    (sab_piu2_bar_cmplt[8]  ),
  .sab_piu3_ac_req_x       (sab_piu3_ac_req[8]     ),
  .sab_piu3_bar_cmplt_x    (sab_piu3_bar_cmplt[8]  ),
  .sab_pop_en_x            (sab_pop_en[8]          ),
  .sab_r_grant_x           (sab_r_grant[8]         ),
  .sab_rack_x              (sab_rack[8]            ),
  .sab_rresp_req_x         (sab_rresp_req[8]       ),
  .sab_snpext_depd_snb_x   (sab_snpext_depd_snb[8] ),
  .sab_snpl2_cmplt_x       (sab_snpl2_cmplt[8]     ),
  .sab_snpl2_ini_sid       (sab_snpl2_ini_sid      ),
  .sab_vld_x               (sab_vld[8]             ),
  .sab_wns_x               (sab_wns[8]             ),
  .snb1                    (snb1                   ),
  .snpext_index            (snpext_index           ),
  .x_bresp_bus             (entry8_bresp_bus       ),
  .x_dbg_info              (entry8_dbg_info        ),
  .x_depd_set              (entry8_depd_set        ),
  .x_ebiu_arbus            (entry8_ebiu_arbus      ),
  .x_ebiu_awbus            (entry8_ebiu_awbus      ),
  .x_ebiu_dbus             (entry8_ebiu_dbus       ),
  .x_ebiu_mid              (entry8_ebiu_mid        ),
  .x_l2c_addr_bus          (entry8_l2c_addr_bus    ),
  .x_l2c_data_bus          (entry8_l2c_data_bus    ),
  .x_l2c_hpcp_bus          (entry8_l2c_hpcp_bus    ),
  .x_piux_ac_bus           (entry8_piux_ac_bus     ),
  .x_rresp_bus             (entry8_rresp_bus       ),
  .x_sab_agevec            (entry8_sab_agevec      ),
  .x_sab_snpl2_cmplt       (entry8_sab_snpl2_cmplt ),
  .x_sid                   (entry8_sid             )
);

// &Connect(.create_bus  (create0_bus)); @149
// &Connect(.create_age  (create0_age)); @150
// &Connect(.create_depd (create0_depd)); @151
// &ConnRule(s/^x_/entry9_/); @152
// &ConnRule(s/_x$/[9]/); @153
// &Instance("ct_ciu_snb_sab_entry", "x_ct_ciu_snb_sab_entry9"); @154
ct_ciu_snb_sab_entry  x_ct_ciu_snb_sab_entry9 (
  .agevec_clr              (agevec_clr             ),
  .ar_crt_entry_index      (ar_crt_entry_index     ),
  .arb_sab_no_l2c_req      (arb_sab_no_l2c_req     ),
  .aw_crt_entry_index      (aw_crt_entry_index     ),
  .aw_mid                  (aw_mid                 ),
  .aw_sh                   (aw_sh                  ),
  .ciu_chr2_bar_dis        (ciu_chr2_bar_dis       ),
  .ciu_chr2_sf_dis         (ciu_chr2_sf_dis        ),
  .ciu_icg_en              (ciu_icg_en             ),
  .ciu_xx_smpen            (ciu_xx_smpen           ),
  .cpurst_b                (cpurst_b               ),
  .create_age              (create0_age            ),
  .create_bus              (create0_bus            ),
  .create_depd             (create0_depd           ),
  .depd_clr                (depd_clr               ),
  .forever_cpuclk          (forever_cpuclk         ),
  .l1_data                 (l1_data                ),
  .l1_wcd_err              (l1_wcd_err             ),
  .l1_wen_x                (l1_wen[9]              ),
  .l1_wstrb                (l1_wstrb               ),
  .l2c_cmplt_x             (l2c_cmplt[9]           ),
  .l2c_cp                  (l2c_cp                 ),
  .l2c_data                (l2c_data               ),
  .l2c_grant_x             (l2c_grant[9]           ),
  .l2c_resp                (l2c_resp               ),
  .memr_ar_grant_x         (memr_ar_grant[9]       ),
  .memr_cmplt_x            (memr_cmplt[9]          ),
  .memr_data               (memr_data              ),
  .memr_data_vld_x         (memr_data_vld[9]       ),
  .memr_resp               (memr_resp              ),
  .memr_resp_err           (memr_resp_err          ),
  .memw_aw_grant_x         (memw_aw_grant[9]       ),
  .memw_cmplt_x            (memw_cmplt[9]          ),
  .pad_yy_icg_scan_en      (pad_yy_icg_scan_en     ),
  .piu0_ac_grant_x         (piu0_ac_grant[9]       ),
  .piu0_cdvld_x            (piu0_cdvld[9]          ),
  .piu0_crresp             (piu0_crresp            ),
  .piu0_crvld_x            (piu0_crvld[9]          ),
  .piu1_ac_grant_x         (piu1_ac_grant[9]       ),
  .piu1_cdvld_x            (piu1_cdvld[9]          ),
  .piu1_crresp             (piu1_crresp            ),
  .piu1_crvld_x            (piu1_crvld[9]          ),
  .piu2_ac_grant_x         (piu2_ac_grant[9]       ),
  .piu2_cdvld_x            (piu2_cdvld[9]          ),
  .piu2_crresp             (piu2_crresp            ),
  .piu2_crvld_x            (piu2_crvld[9]          ),
  .piu3_ac_grant_x         (piu3_ac_grant[9]       ),
  .piu3_cdvld_x            (piu3_cdvld[9]          ),
  .piu3_crresp             (piu3_crresp            ),
  .piu3_crvld_x            (piu3_crvld[9]          ),
  .sab_ar_depd_snb_x       (sab_ar_depd_snb[9]     ),
  .sab_aw_depd_snb_x       (sab_aw_depd_snb[9]     ),
  .sab_b_grant_x           (sab_b_grant[9]         ),
  .sab_back_mark_by_wns_x  (sab_back_mark_by_wns[9]),
  .sab_back_x              (sab_back[9]            ),
  .sab_bar_depd_snb_x      (sab_bar_depd_snb[9]    ),
  .sab_bresp_req_x         (sab_bresp_req[9]       ),
  .sab_busy_x              (sab_busy[9]            ),
  .sab_cen_x               (sab_cen[9]             ),
  .sab_depd_set_by_wns_x   (sab_depd_set_by_wns[9] ),
  .sab_ebiur_req_x         (sab_ebiur_req[9]       ),
  .sab_ebiuw_req_x         (sab_ebiuw_req[9]       ),
  .sab_in_process_x        (sab_in_process[9]      ),
  .sab_l2c_req_x           (sab_l2c_req[9]         ),
  .sab_piu0_ac_req_x       (sab_piu0_ac_req[9]     ),
  .sab_piu0_bar_cmplt_x    (sab_piu0_bar_cmplt[9]  ),
  .sab_piu1_ac_req_x       (sab_piu1_ac_req[9]     ),
  .sab_piu1_bar_cmplt_x    (sab_piu1_bar_cmplt[9]  ),
  .sab_piu2_ac_req_x       (sab_piu2_ac_req[9]     ),
  .sab_piu2_bar_cmplt_x    (sab_piu2_bar_cmplt[9]  ),
  .sab_piu3_ac_req_x       (sab_piu3_ac_req[9]     ),
  .sab_piu3_bar_cmplt_x    (sab_piu3_bar_cmplt[9]  ),
  .sab_pop_en_x            (sab_pop_en[9]          ),
  .sab_r_grant_x           (sab_r_grant[9]         ),
  .sab_rack_x              (sab_rack[9]            ),
  .sab_rresp_req_x         (sab_rresp_req[9]       ),
  .sab_snpext_depd_snb_x   (sab_snpext_depd_snb[9] ),
  .sab_snpl2_cmplt_x       (sab_snpl2_cmplt[9]     ),
  .sab_snpl2_ini_sid       (sab_snpl2_ini_sid      ),
  .sab_vld_x               (sab_vld[9]             ),
  .sab_wns_x               (sab_wns[9]             ),
  .snb1                    (snb1                   ),
  .snpext_index            (snpext_index           ),
  .x_bresp_bus             (entry9_bresp_bus       ),
  .x_dbg_info              (entry9_dbg_info        ),
  .x_depd_set              (entry9_depd_set        ),
  .x_ebiu_arbus            (entry9_ebiu_arbus      ),
  .x_ebiu_awbus            (entry9_ebiu_awbus      ),
  .x_ebiu_dbus             (entry9_ebiu_dbus       ),
  .x_ebiu_mid              (entry9_ebiu_mid        ),
  .x_l2c_addr_bus          (entry9_l2c_addr_bus    ),
  .x_l2c_data_bus          (entry9_l2c_data_bus    ),
  .x_l2c_hpcp_bus          (entry9_l2c_hpcp_bus    ),
  .x_piux_ac_bus           (entry9_piux_ac_bus     ),
  .x_rresp_bus             (entry9_rresp_bus       ),
  .x_sab_agevec            (entry9_sab_agevec      ),
  .x_sab_snpl2_cmplt       (entry9_sab_snpl2_cmplt ),
  .x_sid                   (entry9_sid             )
);

// &Connect(.create_bus  (create0_bus)); @155
// &Connect(.create_age  (create0_age)); @156
// &Connect(.create_depd (create0_depd)); @157
// &ConnRule(s/^x_/entry10_/); @158
// &ConnRule(s/_x$/[10]/); @159
// &Instance("ct_ciu_snb_sab_entry", "x_ct_ciu_snb_sab_entry10"); @160
ct_ciu_snb_sab_entry  x_ct_ciu_snb_sab_entry10 (
  .agevec_clr               (agevec_clr              ),
  .ar_crt_entry_index       (ar_crt_entry_index      ),
  .arb_sab_no_l2c_req       (arb_sab_no_l2c_req      ),
  .aw_crt_entry_index       (aw_crt_entry_index      ),
  .aw_mid                   (aw_mid                  ),
  .aw_sh                    (aw_sh                   ),
  .ciu_chr2_bar_dis         (ciu_chr2_bar_dis        ),
  .ciu_chr2_sf_dis          (ciu_chr2_sf_dis         ),
  .ciu_icg_en               (ciu_icg_en              ),
  .ciu_xx_smpen             (ciu_xx_smpen            ),
  .cpurst_b                 (cpurst_b                ),
  .create_age               (create0_age             ),
  .create_bus               (create0_bus             ),
  .create_depd              (create0_depd            ),
  .depd_clr                 (depd_clr                ),
  .forever_cpuclk           (forever_cpuclk          ),
  .l1_data                  (l1_data                 ),
  .l1_wcd_err               (l1_wcd_err              ),
  .l1_wen_x                 (l1_wen[10]              ),
  .l1_wstrb                 (l1_wstrb                ),
  .l2c_cmplt_x              (l2c_cmplt[10]           ),
  .l2c_cp                   (l2c_cp                  ),
  .l2c_data                 (l2c_data                ),
  .l2c_grant_x              (l2c_grant[10]           ),
  .l2c_resp                 (l2c_resp                ),
  .memr_ar_grant_x          (memr_ar_grant[10]       ),
  .memr_cmplt_x             (memr_cmplt[10]          ),
  .memr_data                (memr_data               ),
  .memr_data_vld_x          (memr_data_vld[10]       ),
  .memr_resp                (memr_resp               ),
  .memr_resp_err            (memr_resp_err           ),
  .memw_aw_grant_x          (memw_aw_grant[10]       ),
  .memw_cmplt_x             (memw_cmplt[10]          ),
  .pad_yy_icg_scan_en       (pad_yy_icg_scan_en      ),
  .piu0_ac_grant_x          (piu0_ac_grant[10]       ),
  .piu0_cdvld_x             (piu0_cdvld[10]          ),
  .piu0_crresp              (piu0_crresp             ),
  .piu0_crvld_x             (piu0_crvld[10]          ),
  .piu1_ac_grant_x          (piu1_ac_grant[10]       ),
  .piu1_cdvld_x             (piu1_cdvld[10]          ),
  .piu1_crresp              (piu1_crresp             ),
  .piu1_crvld_x             (piu1_crvld[10]          ),
  .piu2_ac_grant_x          (piu2_ac_grant[10]       ),
  .piu2_cdvld_x             (piu2_cdvld[10]          ),
  .piu2_crresp              (piu2_crresp             ),
  .piu2_crvld_x             (piu2_crvld[10]          ),
  .piu3_ac_grant_x          (piu3_ac_grant[10]       ),
  .piu3_cdvld_x             (piu3_cdvld[10]          ),
  .piu3_crresp              (piu3_crresp             ),
  .piu3_crvld_x             (piu3_crvld[10]          ),
  .sab_ar_depd_snb_x        (sab_ar_depd_snb[10]     ),
  .sab_aw_depd_snb_x        (sab_aw_depd_snb[10]     ),
  .sab_b_grant_x            (sab_b_grant[10]         ),
  .sab_back_mark_by_wns_x   (sab_back_mark_by_wns[10]),
  .sab_back_x               (sab_back[10]            ),
  .sab_bar_depd_snb_x       (sab_bar_depd_snb[10]    ),
  .sab_bresp_req_x          (sab_bresp_req[10]       ),
  .sab_busy_x               (sab_busy[10]            ),
  .sab_cen_x                (sab_cen[10]             ),
  .sab_depd_set_by_wns_x    (sab_depd_set_by_wns[10] ),
  .sab_ebiur_req_x          (sab_ebiur_req[10]       ),
  .sab_ebiuw_req_x          (sab_ebiuw_req[10]       ),
  .sab_in_process_x         (sab_in_process[10]      ),
  .sab_l2c_req_x            (sab_l2c_req[10]         ),
  .sab_piu0_ac_req_x        (sab_piu0_ac_req[10]     ),
  .sab_piu0_bar_cmplt_x     (sab_piu0_bar_cmplt[10]  ),
  .sab_piu1_ac_req_x        (sab_piu1_ac_req[10]     ),
  .sab_piu1_bar_cmplt_x     (sab_piu1_bar_cmplt[10]  ),
  .sab_piu2_ac_req_x        (sab_piu2_ac_req[10]     ),
  .sab_piu2_bar_cmplt_x     (sab_piu2_bar_cmplt[10]  ),
  .sab_piu3_ac_req_x        (sab_piu3_ac_req[10]     ),
  .sab_piu3_bar_cmplt_x     (sab_piu3_bar_cmplt[10]  ),
  .sab_pop_en_x             (sab_pop_en[10]          ),
  .sab_r_grant_x            (sab_r_grant[10]         ),
  .sab_rack_x               (sab_rack[10]            ),
  .sab_rresp_req_x          (sab_rresp_req[10]       ),
  .sab_snpext_depd_snb_x    (sab_snpext_depd_snb[10] ),
  .sab_snpl2_cmplt_x        (sab_snpl2_cmplt[10]     ),
  .sab_snpl2_ini_sid        (sab_snpl2_ini_sid       ),
  .sab_vld_x                (sab_vld[10]             ),
  .sab_wns_x                (sab_wns[10]             ),
  .snb1                     (snb1                    ),
  .snpext_index             (snpext_index            ),
  .x_bresp_bus              (entry10_bresp_bus       ),
  .x_dbg_info               (entry10_dbg_info        ),
  .x_depd_set               (entry10_depd_set        ),
  .x_ebiu_arbus             (entry10_ebiu_arbus      ),
  .x_ebiu_awbus             (entry10_ebiu_awbus      ),
  .x_ebiu_dbus              (entry10_ebiu_dbus       ),
  .x_ebiu_mid               (entry10_ebiu_mid        ),
  .x_l2c_addr_bus           (entry10_l2c_addr_bus    ),
  .x_l2c_data_bus           (entry10_l2c_data_bus    ),
  .x_l2c_hpcp_bus           (entry10_l2c_hpcp_bus    ),
  .x_piux_ac_bus            (entry10_piux_ac_bus     ),
  .x_rresp_bus              (entry10_rresp_bus       ),
  .x_sab_agevec             (entry10_sab_agevec      ),
  .x_sab_snpl2_cmplt        (entry10_sab_snpl2_cmplt ),
  .x_sid                    (entry10_sid             )
);

// &Connect(.create_bus  (create0_bus)); @161
// &Connect(.create_age  (create0_age)); @162
// &Connect(.create_depd (create0_depd)); @163
// &ConnRule(s/^x_/entry11_/); @164
// &ConnRule(s/_x$/[11]/); @165
// &Instance("ct_ciu_snb_sab_entry", "x_ct_ciu_snb_sab_entry11"); @166
ct_ciu_snb_sab_entry  x_ct_ciu_snb_sab_entry11 (
  .agevec_clr               (agevec_clr              ),
  .ar_crt_entry_index       (ar_crt_entry_index      ),
  .arb_sab_no_l2c_req       (arb_sab_no_l2c_req      ),
  .aw_crt_entry_index       (aw_crt_entry_index      ),
  .aw_mid                   (aw_mid                  ),
  .aw_sh                    (aw_sh                   ),
  .ciu_chr2_bar_dis         (ciu_chr2_bar_dis        ),
  .ciu_chr2_sf_dis          (ciu_chr2_sf_dis         ),
  .ciu_icg_en               (ciu_icg_en              ),
  .ciu_xx_smpen             (ciu_xx_smpen            ),
  .cpurst_b                 (cpurst_b                ),
  .create_age               (create0_age             ),
  .create_bus               (create0_bus             ),
  .create_depd              (create0_depd            ),
  .depd_clr                 (depd_clr                ),
  .forever_cpuclk           (forever_cpuclk          ),
  .l1_data                  (l1_data                 ),
  .l1_wcd_err               (l1_wcd_err              ),
  .l1_wen_x                 (l1_wen[11]              ),
  .l1_wstrb                 (l1_wstrb                ),
  .l2c_cmplt_x              (l2c_cmplt[11]           ),
  .l2c_cp                   (l2c_cp                  ),
  .l2c_data                 (l2c_data                ),
  .l2c_grant_x              (l2c_grant[11]           ),
  .l2c_resp                 (l2c_resp                ),
  .memr_ar_grant_x          (memr_ar_grant[11]       ),
  .memr_cmplt_x             (memr_cmplt[11]          ),
  .memr_data                (memr_data               ),
  .memr_data_vld_x          (memr_data_vld[11]       ),
  .memr_resp                (memr_resp               ),
  .memr_resp_err            (memr_resp_err           ),
  .memw_aw_grant_x          (memw_aw_grant[11]       ),
  .memw_cmplt_x             (memw_cmplt[11]          ),
  .pad_yy_icg_scan_en       (pad_yy_icg_scan_en      ),
  .piu0_ac_grant_x          (piu0_ac_grant[11]       ),
  .piu0_cdvld_x             (piu0_cdvld[11]          ),
  .piu0_crresp              (piu0_crresp             ),
  .piu0_crvld_x             (piu0_crvld[11]          ),
  .piu1_ac_grant_x          (piu1_ac_grant[11]       ),
  .piu1_cdvld_x             (piu1_cdvld[11]          ),
  .piu1_crresp              (piu1_crresp             ),
  .piu1_crvld_x             (piu1_crvld[11]          ),
  .piu2_ac_grant_x          (piu2_ac_grant[11]       ),
  .piu2_cdvld_x             (piu2_cdvld[11]          ),
  .piu2_crresp              (piu2_crresp             ),
  .piu2_crvld_x             (piu2_crvld[11]          ),
  .piu3_ac_grant_x          (piu3_ac_grant[11]       ),
  .piu3_cdvld_x             (piu3_cdvld[11]          ),
  .piu3_crresp              (piu3_crresp             ),
  .piu3_crvld_x             (piu3_crvld[11]          ),
  .sab_ar_depd_snb_x        (sab_ar_depd_snb[11]     ),
  .sab_aw_depd_snb_x        (sab_aw_depd_snb[11]     ),
  .sab_b_grant_x            (sab_b_grant[11]         ),
  .sab_back_mark_by_wns_x   (sab_back_mark_by_wns[11]),
  .sab_back_x               (sab_back[11]            ),
  .sab_bar_depd_snb_x       (sab_bar_depd_snb[11]    ),
  .sab_bresp_req_x          (sab_bresp_req[11]       ),
  .sab_busy_x               (sab_busy[11]            ),
  .sab_cen_x                (sab_cen[11]             ),
  .sab_depd_set_by_wns_x    (sab_depd_set_by_wns[11] ),
  .sab_ebiur_req_x          (sab_ebiur_req[11]       ),
  .sab_ebiuw_req_x          (sab_ebiuw_req[11]       ),
  .sab_in_process_x         (sab_in_process[11]      ),
  .sab_l2c_req_x            (sab_l2c_req[11]         ),
  .sab_piu0_ac_req_x        (sab_piu0_ac_req[11]     ),
  .sab_piu0_bar_cmplt_x     (sab_piu0_bar_cmplt[11]  ),
  .sab_piu1_ac_req_x        (sab_piu1_ac_req[11]     ),
  .sab_piu1_bar_cmplt_x     (sab_piu1_bar_cmplt[11]  ),
  .sab_piu2_ac_req_x        (sab_piu2_ac_req[11]     ),
  .sab_piu2_bar_cmplt_x     (sab_piu2_bar_cmplt[11]  ),
  .sab_piu3_ac_req_x        (sab_piu3_ac_req[11]     ),
  .sab_piu3_bar_cmplt_x     (sab_piu3_bar_cmplt[11]  ),
  .sab_pop_en_x             (sab_pop_en[11]          ),
  .sab_r_grant_x            (sab_r_grant[11]         ),
  .sab_rack_x               (sab_rack[11]            ),
  .sab_rresp_req_x          (sab_rresp_req[11]       ),
  .sab_snpext_depd_snb_x    (sab_snpext_depd_snb[11] ),
  .sab_snpl2_cmplt_x        (sab_snpl2_cmplt[11]     ),
  .sab_snpl2_ini_sid        (sab_snpl2_ini_sid       ),
  .sab_vld_x                (sab_vld[11]             ),
  .sab_wns_x                (sab_wns[11]             ),
  .snb1                     (snb1                    ),
  .snpext_index             (snpext_index            ),
  .x_bresp_bus              (entry11_bresp_bus       ),
  .x_dbg_info               (entry11_dbg_info        ),
  .x_depd_set               (entry11_depd_set        ),
  .x_ebiu_arbus             (entry11_ebiu_arbus      ),
  .x_ebiu_awbus             (entry11_ebiu_awbus      ),
  .x_ebiu_dbus              (entry11_ebiu_dbus       ),
  .x_ebiu_mid               (entry11_ebiu_mid        ),
  .x_l2c_addr_bus           (entry11_l2c_addr_bus    ),
  .x_l2c_data_bus           (entry11_l2c_data_bus    ),
  .x_l2c_hpcp_bus           (entry11_l2c_hpcp_bus    ),
  .x_piux_ac_bus            (entry11_piux_ac_bus     ),
  .x_rresp_bus              (entry11_rresp_bus       ),
  .x_sab_agevec             (entry11_sab_agevec      ),
  .x_sab_snpl2_cmplt        (entry11_sab_snpl2_cmplt ),
  .x_sid                    (entry11_sid             )
);

// &Connect(.create_bus  (create0_bus)); @167
// &Connect(.create_age  (create0_age)); @168
// &Connect(.create_depd (create0_depd)); @169
// &ConnRule(s/^x_/entry12_/); @170
// &ConnRule(s/_x$/[12]/); @171
// &Instance("ct_ciu_snb_sab_entry", "x_ct_ciu_snb_sab_entry12"); @172
ct_ciu_snb_sab_entry  x_ct_ciu_snb_sab_entry12 (
  .agevec_clr               (agevec_clr              ),
  .ar_crt_entry_index       (ar_crt_entry_index      ),
  .arb_sab_no_l2c_req       (arb_sab_no_l2c_req      ),
  .aw_crt_entry_index       (aw_crt_entry_index      ),
  .aw_mid                   (aw_mid                  ),
  .aw_sh                    (aw_sh                   ),
  .ciu_chr2_bar_dis         (ciu_chr2_bar_dis        ),
  .ciu_chr2_sf_dis          (ciu_chr2_sf_dis         ),
  .ciu_icg_en               (ciu_icg_en              ),
  .ciu_xx_smpen             (ciu_xx_smpen            ),
  .cpurst_b                 (cpurst_b                ),
  .create_age               (create0_age             ),
  .create_bus               (create0_bus             ),
  .create_depd              (create0_depd            ),
  .depd_clr                 (depd_clr                ),
  .forever_cpuclk           (forever_cpuclk          ),
  .l1_data                  (l1_data                 ),
  .l1_wcd_err               (l1_wcd_err              ),
  .l1_wen_x                 (l1_wen[12]              ),
  .l1_wstrb                 (l1_wstrb                ),
  .l2c_cmplt_x              (l2c_cmplt[12]           ),
  .l2c_cp                   (l2c_cp                  ),
  .l2c_data                 (l2c_data                ),
  .l2c_grant_x              (l2c_grant[12]           ),
  .l2c_resp                 (l2c_resp                ),
  .memr_ar_grant_x          (memr_ar_grant[12]       ),
  .memr_cmplt_x             (memr_cmplt[12]          ),
  .memr_data                (memr_data               ),
  .memr_data_vld_x          (memr_data_vld[12]       ),
  .memr_resp                (memr_resp               ),
  .memr_resp_err            (memr_resp_err           ),
  .memw_aw_grant_x          (memw_aw_grant[12]       ),
  .memw_cmplt_x             (memw_cmplt[12]          ),
  .pad_yy_icg_scan_en       (pad_yy_icg_scan_en      ),
  .piu0_ac_grant_x          (piu0_ac_grant[12]       ),
  .piu0_cdvld_x             (piu0_cdvld[12]          ),
  .piu0_crresp              (piu0_crresp             ),
  .piu0_crvld_x             (piu0_crvld[12]          ),
  .piu1_ac_grant_x          (piu1_ac_grant[12]       ),
  .piu1_cdvld_x             (piu1_cdvld[12]          ),
  .piu1_crresp              (piu1_crresp             ),
  .piu1_crvld_x             (piu1_crvld[12]          ),
  .piu2_ac_grant_x          (piu2_ac_grant[12]       ),
  .piu2_cdvld_x             (piu2_cdvld[12]          ),
  .piu2_crresp              (piu2_crresp             ),
  .piu2_crvld_x             (piu2_crvld[12]          ),
  .piu3_ac_grant_x          (piu3_ac_grant[12]       ),
  .piu3_cdvld_x             (piu3_cdvld[12]          ),
  .piu3_crresp              (piu3_crresp             ),
  .piu3_crvld_x             (piu3_crvld[12]          ),
  .sab_ar_depd_snb_x        (sab_ar_depd_snb[12]     ),
  .sab_aw_depd_snb_x        (sab_aw_depd_snb[12]     ),
  .sab_b_grant_x            (sab_b_grant[12]         ),
  .sab_back_mark_by_wns_x   (sab_back_mark_by_wns[12]),
  .sab_back_x               (sab_back[12]            ),
  .sab_bar_depd_snb_x       (sab_bar_depd_snb[12]    ),
  .sab_bresp_req_x          (sab_bresp_req[12]       ),
  .sab_busy_x               (sab_busy[12]            ),
  .sab_cen_x                (sab_cen[12]             ),
  .sab_depd_set_by_wns_x    (sab_depd_set_by_wns[12] ),
  .sab_ebiur_req_x          (sab_ebiur_req[12]       ),
  .sab_ebiuw_req_x          (sab_ebiuw_req[12]       ),
  .sab_in_process_x         (sab_in_process[12]      ),
  .sab_l2c_req_x            (sab_l2c_req[12]         ),
  .sab_piu0_ac_req_x        (sab_piu0_ac_req[12]     ),
  .sab_piu0_bar_cmplt_x     (sab_piu0_bar_cmplt[12]  ),
  .sab_piu1_ac_req_x        (sab_piu1_ac_req[12]     ),
  .sab_piu1_bar_cmplt_x     (sab_piu1_bar_cmplt[12]  ),
  .sab_piu2_ac_req_x        (sab_piu2_ac_req[12]     ),
  .sab_piu2_bar_cmplt_x     (sab_piu2_bar_cmplt[12]  ),
  .sab_piu3_ac_req_x        (sab_piu3_ac_req[12]     ),
  .sab_piu3_bar_cmplt_x     (sab_piu3_bar_cmplt[12]  ),
  .sab_pop_en_x             (sab_pop_en[12]          ),
  .sab_r_grant_x            (sab_r_grant[12]         ),
  .sab_rack_x               (sab_rack[12]            ),
  .sab_rresp_req_x          (sab_rresp_req[12]       ),
  .sab_snpext_depd_snb_x    (sab_snpext_depd_snb[12] ),
  .sab_snpl2_cmplt_x        (sab_snpl2_cmplt[12]     ),
  .sab_snpl2_ini_sid        (sab_snpl2_ini_sid       ),
  .sab_vld_x                (sab_vld[12]             ),
  .sab_wns_x                (sab_wns[12]             ),
  .snb1                     (snb1                    ),
  .snpext_index             (snpext_index            ),
  .x_bresp_bus              (entry12_bresp_bus       ),
  .x_dbg_info               (entry12_dbg_info        ),
  .x_depd_set               (entry12_depd_set        ),
  .x_ebiu_arbus             (entry12_ebiu_arbus      ),
  .x_ebiu_awbus             (entry12_ebiu_awbus      ),
  .x_ebiu_dbus              (entry12_ebiu_dbus       ),
  .x_ebiu_mid               (entry12_ebiu_mid        ),
  .x_l2c_addr_bus           (entry12_l2c_addr_bus    ),
  .x_l2c_data_bus           (entry12_l2c_data_bus    ),
  .x_l2c_hpcp_bus           (entry12_l2c_hpcp_bus    ),
  .x_piux_ac_bus            (entry12_piux_ac_bus     ),
  .x_rresp_bus              (entry12_rresp_bus       ),
  .x_sab_agevec             (entry12_sab_agevec      ),
  .x_sab_snpl2_cmplt        (entry12_sab_snpl2_cmplt ),
  .x_sid                    (entry12_sid             )
);

// &Connect(.create_bus  (create0_bus)); @173
// &Connect(.create_age  (create0_age)); @174
// &Connect(.create_depd (create0_depd)); @175
// &ConnRule(s/^x_/entry13_/); @176
// &ConnRule(s/_x$/[13]/); @177
// &Instance("ct_ciu_snb_sab_entry", "x_ct_ciu_snb_sab_entry13"); @178
ct_ciu_snb_sab_entry  x_ct_ciu_snb_sab_entry13 (
  .agevec_clr               (agevec_clr              ),
  .ar_crt_entry_index       (ar_crt_entry_index      ),
  .arb_sab_no_l2c_req       (arb_sab_no_l2c_req      ),
  .aw_crt_entry_index       (aw_crt_entry_index      ),
  .aw_mid                   (aw_mid                  ),
  .aw_sh                    (aw_sh                   ),
  .ciu_chr2_bar_dis         (ciu_chr2_bar_dis        ),
  .ciu_chr2_sf_dis          (ciu_chr2_sf_dis         ),
  .ciu_icg_en               (ciu_icg_en              ),
  .ciu_xx_smpen             (ciu_xx_smpen            ),
  .cpurst_b                 (cpurst_b                ),
  .create_age               (create0_age             ),
  .create_bus               (create0_bus             ),
  .create_depd              (create0_depd            ),
  .depd_clr                 (depd_clr                ),
  .forever_cpuclk           (forever_cpuclk          ),
  .l1_data                  (l1_data                 ),
  .l1_wcd_err               (l1_wcd_err              ),
  .l1_wen_x                 (l1_wen[13]              ),
  .l1_wstrb                 (l1_wstrb                ),
  .l2c_cmplt_x              (l2c_cmplt[13]           ),
  .l2c_cp                   (l2c_cp                  ),
  .l2c_data                 (l2c_data                ),
  .l2c_grant_x              (l2c_grant[13]           ),
  .l2c_resp                 (l2c_resp                ),
  .memr_ar_grant_x          (memr_ar_grant[13]       ),
  .memr_cmplt_x             (memr_cmplt[13]          ),
  .memr_data                (memr_data               ),
  .memr_data_vld_x          (memr_data_vld[13]       ),
  .memr_resp                (memr_resp               ),
  .memr_resp_err            (memr_resp_err           ),
  .memw_aw_grant_x          (memw_aw_grant[13]       ),
  .memw_cmplt_x             (memw_cmplt[13]          ),
  .pad_yy_icg_scan_en       (pad_yy_icg_scan_en      ),
  .piu0_ac_grant_x          (piu0_ac_grant[13]       ),
  .piu0_cdvld_x             (piu0_cdvld[13]          ),
  .piu0_crresp              (piu0_crresp             ),
  .piu0_crvld_x             (piu0_crvld[13]          ),
  .piu1_ac_grant_x          (piu1_ac_grant[13]       ),
  .piu1_cdvld_x             (piu1_cdvld[13]          ),
  .piu1_crresp              (piu1_crresp             ),
  .piu1_crvld_x             (piu1_crvld[13]          ),
  .piu2_ac_grant_x          (piu2_ac_grant[13]       ),
  .piu2_cdvld_x             (piu2_cdvld[13]          ),
  .piu2_crresp              (piu2_crresp             ),
  .piu2_crvld_x             (piu2_crvld[13]          ),
  .piu3_ac_grant_x          (piu3_ac_grant[13]       ),
  .piu3_cdvld_x             (piu3_cdvld[13]          ),
  .piu3_crresp              (piu3_crresp             ),
  .piu3_crvld_x             (piu3_crvld[13]          ),
  .sab_ar_depd_snb_x        (sab_ar_depd_snb[13]     ),
  .sab_aw_depd_snb_x        (sab_aw_depd_snb[13]     ),
  .sab_b_grant_x            (sab_b_grant[13]         ),
  .sab_back_mark_by_wns_x   (sab_back_mark_by_wns[13]),
  .sab_back_x               (sab_back[13]            ),
  .sab_bar_depd_snb_x       (sab_bar_depd_snb[13]    ),
  .sab_bresp_req_x          (sab_bresp_req[13]       ),
  .sab_busy_x               (sab_busy[13]            ),
  .sab_cen_x                (sab_cen[13]             ),
  .sab_depd_set_by_wns_x    (sab_depd_set_by_wns[13] ),
  .sab_ebiur_req_x          (sab_ebiur_req[13]       ),
  .sab_ebiuw_req_x          (sab_ebiuw_req[13]       ),
  .sab_in_process_x         (sab_in_process[13]      ),
  .sab_l2c_req_x            (sab_l2c_req[13]         ),
  .sab_piu0_ac_req_x        (sab_piu0_ac_req[13]     ),
  .sab_piu0_bar_cmplt_x     (sab_piu0_bar_cmplt[13]  ),
  .sab_piu1_ac_req_x        (sab_piu1_ac_req[13]     ),
  .sab_piu1_bar_cmplt_x     (sab_piu1_bar_cmplt[13]  ),
  .sab_piu2_ac_req_x        (sab_piu2_ac_req[13]     ),
  .sab_piu2_bar_cmplt_x     (sab_piu2_bar_cmplt[13]  ),
  .sab_piu3_ac_req_x        (sab_piu3_ac_req[13]     ),
  .sab_piu3_bar_cmplt_x     (sab_piu3_bar_cmplt[13]  ),
  .sab_pop_en_x             (sab_pop_en[13]          ),
  .sab_r_grant_x            (sab_r_grant[13]         ),
  .sab_rack_x               (sab_rack[13]            ),
  .sab_rresp_req_x          (sab_rresp_req[13]       ),
  .sab_snpext_depd_snb_x    (sab_snpext_depd_snb[13] ),
  .sab_snpl2_cmplt_x        (sab_snpl2_cmplt[13]     ),
  .sab_snpl2_ini_sid        (sab_snpl2_ini_sid       ),
  .sab_vld_x                (sab_vld[13]             ),
  .sab_wns_x                (sab_wns[13]             ),
  .snb1                     (snb1                    ),
  .snpext_index             (snpext_index            ),
  .x_bresp_bus              (entry13_bresp_bus       ),
  .x_dbg_info               (entry13_dbg_info        ),
  .x_depd_set               (entry13_depd_set        ),
  .x_ebiu_arbus             (entry13_ebiu_arbus      ),
  .x_ebiu_awbus             (entry13_ebiu_awbus      ),
  .x_ebiu_dbus              (entry13_ebiu_dbus       ),
  .x_ebiu_mid               (entry13_ebiu_mid        ),
  .x_l2c_addr_bus           (entry13_l2c_addr_bus    ),
  .x_l2c_data_bus           (entry13_l2c_data_bus    ),
  .x_l2c_hpcp_bus           (entry13_l2c_hpcp_bus    ),
  .x_piux_ac_bus            (entry13_piux_ac_bus     ),
  .x_rresp_bus              (entry13_rresp_bus       ),
  .x_sab_agevec             (entry13_sab_agevec      ),
  .x_sab_snpl2_cmplt        (entry13_sab_snpl2_cmplt ),
  .x_sid                    (entry13_sid             )
);

// &Connect(.create_bus  (create0_bus)); @179
// &Connect(.create_age  (create0_age)); @180
// &Connect(.create_depd (create0_depd)); @181
// &ConnRule(s/^x_/entry14_/); @182
// &ConnRule(s/_x$/[14]/); @183
// &Instance("ct_ciu_snb_sab_entry", "x_ct_ciu_snb_sab_entry14"); @184
ct_ciu_snb_sab_entry  x_ct_ciu_snb_sab_entry14 (
  .agevec_clr               (agevec_clr              ),
  .ar_crt_entry_index       (ar_crt_entry_index      ),
  .arb_sab_no_l2c_req       (arb_sab_no_l2c_req      ),
  .aw_crt_entry_index       (aw_crt_entry_index      ),
  .aw_mid                   (aw_mid                  ),
  .aw_sh                    (aw_sh                   ),
  .ciu_chr2_bar_dis         (ciu_chr2_bar_dis        ),
  .ciu_chr2_sf_dis          (ciu_chr2_sf_dis         ),
  .ciu_icg_en               (ciu_icg_en              ),
  .ciu_xx_smpen             (ciu_xx_smpen            ),
  .cpurst_b                 (cpurst_b                ),
  .create_age               (create0_age             ),
  .create_bus               (create0_bus             ),
  .create_depd              (create0_depd            ),
  .depd_clr                 (depd_clr                ),
  .forever_cpuclk           (forever_cpuclk          ),
  .l1_data                  (l1_data                 ),
  .l1_wcd_err               (l1_wcd_err              ),
  .l1_wen_x                 (l1_wen[14]              ),
  .l1_wstrb                 (l1_wstrb                ),
  .l2c_cmplt_x              (l2c_cmplt[14]           ),
  .l2c_cp                   (l2c_cp                  ),
  .l2c_data                 (l2c_data                ),
  .l2c_grant_x              (l2c_grant[14]           ),
  .l2c_resp                 (l2c_resp                ),
  .memr_ar_grant_x          (memr_ar_grant[14]       ),
  .memr_cmplt_x             (memr_cmplt[14]          ),
  .memr_data                (memr_data               ),
  .memr_data_vld_x          (memr_data_vld[14]       ),
  .memr_resp                (memr_resp               ),
  .memr_resp_err            (memr_resp_err           ),
  .memw_aw_grant_x          (memw_aw_grant[14]       ),
  .memw_cmplt_x             (memw_cmplt[14]          ),
  .pad_yy_icg_scan_en       (pad_yy_icg_scan_en      ),
  .piu0_ac_grant_x          (piu0_ac_grant[14]       ),
  .piu0_cdvld_x             (piu0_cdvld[14]          ),
  .piu0_crresp              (piu0_crresp             ),
  .piu0_crvld_x             (piu0_crvld[14]          ),
  .piu1_ac_grant_x          (piu1_ac_grant[14]       ),
  .piu1_cdvld_x             (piu1_cdvld[14]          ),
  .piu1_crresp              (piu1_crresp             ),
  .piu1_crvld_x             (piu1_crvld[14]          ),
  .piu2_ac_grant_x          (piu2_ac_grant[14]       ),
  .piu2_cdvld_x             (piu2_cdvld[14]          ),
  .piu2_crresp              (piu2_crresp             ),
  .piu2_crvld_x             (piu2_crvld[14]          ),
  .piu3_ac_grant_x          (piu3_ac_grant[14]       ),
  .piu3_cdvld_x             (piu3_cdvld[14]          ),
  .piu3_crresp              (piu3_crresp             ),
  .piu3_crvld_x             (piu3_crvld[14]          ),
  .sab_ar_depd_snb_x        (sab_ar_depd_snb[14]     ),
  .sab_aw_depd_snb_x        (sab_aw_depd_snb[14]     ),
  .sab_b_grant_x            (sab_b_grant[14]         ),
  .sab_back_mark_by_wns_x   (sab_back_mark_by_wns[14]),
  .sab_back_x               (sab_back[14]            ),
  .sab_bar_depd_snb_x       (sab_bar_depd_snb[14]    ),
  .sab_bresp_req_x          (sab_bresp_req[14]       ),
  .sab_busy_x               (sab_busy[14]            ),
  .sab_cen_x                (sab_cen[14]             ),
  .sab_depd_set_by_wns_x    (sab_depd_set_by_wns[14] ),
  .sab_ebiur_req_x          (sab_ebiur_req[14]       ),
  .sab_ebiuw_req_x          (sab_ebiuw_req[14]       ),
  .sab_in_process_x         (sab_in_process[14]      ),
  .sab_l2c_req_x            (sab_l2c_req[14]         ),
  .sab_piu0_ac_req_x        (sab_piu0_ac_req[14]     ),
  .sab_piu0_bar_cmplt_x     (sab_piu0_bar_cmplt[14]  ),
  .sab_piu1_ac_req_x        (sab_piu1_ac_req[14]     ),
  .sab_piu1_bar_cmplt_x     (sab_piu1_bar_cmplt[14]  ),
  .sab_piu2_ac_req_x        (sab_piu2_ac_req[14]     ),
  .sab_piu2_bar_cmplt_x     (sab_piu2_bar_cmplt[14]  ),
  .sab_piu3_ac_req_x        (sab_piu3_ac_req[14]     ),
  .sab_piu3_bar_cmplt_x     (sab_piu3_bar_cmplt[14]  ),
  .sab_pop_en_x             (sab_pop_en[14]          ),
  .sab_r_grant_x            (sab_r_grant[14]         ),
  .sab_rack_x               (sab_rack[14]            ),
  .sab_rresp_req_x          (sab_rresp_req[14]       ),
  .sab_snpext_depd_snb_x    (sab_snpext_depd_snb[14] ),
  .sab_snpl2_cmplt_x        (sab_snpl2_cmplt[14]     ),
  .sab_snpl2_ini_sid        (sab_snpl2_ini_sid       ),
  .sab_vld_x                (sab_vld[14]             ),
  .sab_wns_x                (sab_wns[14]             ),
  .snb1                     (snb1                    ),
  .snpext_index             (snpext_index            ),
  .x_bresp_bus              (entry14_bresp_bus       ),
  .x_dbg_info               (entry14_dbg_info        ),
  .x_depd_set               (entry14_depd_set        ),
  .x_ebiu_arbus             (entry14_ebiu_arbus      ),
  .x_ebiu_awbus             (entry14_ebiu_awbus      ),
  .x_ebiu_dbus              (entry14_ebiu_dbus       ),
  .x_ebiu_mid               (entry14_ebiu_mid        ),
  .x_l2c_addr_bus           (entry14_l2c_addr_bus    ),
  .x_l2c_data_bus           (entry14_l2c_data_bus    ),
  .x_l2c_hpcp_bus           (entry14_l2c_hpcp_bus    ),
  .x_piux_ac_bus            (entry14_piux_ac_bus     ),
  .x_rresp_bus              (entry14_rresp_bus       ),
  .x_sab_agevec             (entry14_sab_agevec      ),
  .x_sab_snpl2_cmplt        (entry14_sab_snpl2_cmplt ),
  .x_sid                    (entry14_sid             )
);

// &Connect(.create_bus  (create0_bus)); @185
// &Connect(.create_age  (create0_age)); @186
// &Connect(.create_depd (create0_depd)); @187
// &ConnRule(s/^x_/entry15_/); @188
// &ConnRule(s/_x$/[15]/); @189
// &Instance("ct_ciu_snb_sab_entry", "x_ct_ciu_snb_sab_entry15"); @190
ct_ciu_snb_sab_entry  x_ct_ciu_snb_sab_entry15 (
  .agevec_clr               (agevec_clr              ),
  .ar_crt_entry_index       (ar_crt_entry_index      ),
  .arb_sab_no_l2c_req       (arb_sab_no_l2c_req      ),
  .aw_crt_entry_index       (aw_crt_entry_index      ),
  .aw_mid                   (aw_mid                  ),
  .aw_sh                    (aw_sh                   ),
  .ciu_chr2_bar_dis         (ciu_chr2_bar_dis        ),
  .ciu_chr2_sf_dis          (ciu_chr2_sf_dis         ),
  .ciu_icg_en               (ciu_icg_en              ),
  .ciu_xx_smpen             (ciu_xx_smpen            ),
  .cpurst_b                 (cpurst_b                ),
  .create_age               (create0_age             ),
  .create_bus               (create0_bus             ),
  .create_depd              (create0_depd            ),
  .depd_clr                 (depd_clr                ),
  .forever_cpuclk           (forever_cpuclk          ),
  .l1_data                  (l1_data                 ),
  .l1_wcd_err               (l1_wcd_err              ),
  .l1_wen_x                 (l1_wen[15]              ),
  .l1_wstrb                 (l1_wstrb                ),
  .l2c_cmplt_x              (l2c_cmplt[15]           ),
  .l2c_cp                   (l2c_cp                  ),
  .l2c_data                 (l2c_data                ),
  .l2c_grant_x              (l2c_grant[15]           ),
  .l2c_resp                 (l2c_resp                ),
  .memr_ar_grant_x          (memr_ar_grant[15]       ),
  .memr_cmplt_x             (memr_cmplt[15]          ),
  .memr_data                (memr_data               ),
  .memr_data_vld_x          (memr_data_vld[15]       ),
  .memr_resp                (memr_resp               ),
  .memr_resp_err            (memr_resp_err           ),
  .memw_aw_grant_x          (memw_aw_grant[15]       ),
  .memw_cmplt_x             (memw_cmplt[15]          ),
  .pad_yy_icg_scan_en       (pad_yy_icg_scan_en      ),
  .piu0_ac_grant_x          (piu0_ac_grant[15]       ),
  .piu0_cdvld_x             (piu0_cdvld[15]          ),
  .piu0_crresp              (piu0_crresp             ),
  .piu0_crvld_x             (piu0_crvld[15]          ),
  .piu1_ac_grant_x          (piu1_ac_grant[15]       ),
  .piu1_cdvld_x             (piu1_cdvld[15]          ),
  .piu1_crresp              (piu1_crresp             ),
  .piu1_crvld_x             (piu1_crvld[15]          ),
  .piu2_ac_grant_x          (piu2_ac_grant[15]       ),
  .piu2_cdvld_x             (piu2_cdvld[15]          ),
  .piu2_crresp              (piu2_crresp             ),
  .piu2_crvld_x             (piu2_crvld[15]          ),
  .piu3_ac_grant_x          (piu3_ac_grant[15]       ),
  .piu3_cdvld_x             (piu3_cdvld[15]          ),
  .piu3_crresp              (piu3_crresp             ),
  .piu3_crvld_x             (piu3_crvld[15]          ),
  .sab_ar_depd_snb_x        (sab_ar_depd_snb[15]     ),
  .sab_aw_depd_snb_x        (sab_aw_depd_snb[15]     ),
  .sab_b_grant_x            (sab_b_grant[15]         ),
  .sab_back_mark_by_wns_x   (sab_back_mark_by_wns[15]),
  .sab_back_x               (sab_back[15]            ),
  .sab_bar_depd_snb_x       (sab_bar_depd_snb[15]    ),
  .sab_bresp_req_x          (sab_bresp_req[15]       ),
  .sab_busy_x               (sab_busy[15]            ),
  .sab_cen_x                (sab_cen[15]             ),
  .sab_depd_set_by_wns_x    (sab_depd_set_by_wns[15] ),
  .sab_ebiur_req_x          (sab_ebiur_req[15]       ),
  .sab_ebiuw_req_x          (sab_ebiuw_req[15]       ),
  .sab_in_process_x         (sab_in_process[15]      ),
  .sab_l2c_req_x            (sab_l2c_req[15]         ),
  .sab_piu0_ac_req_x        (sab_piu0_ac_req[15]     ),
  .sab_piu0_bar_cmplt_x     (sab_piu0_bar_cmplt[15]  ),
  .sab_piu1_ac_req_x        (sab_piu1_ac_req[15]     ),
  .sab_piu1_bar_cmplt_x     (sab_piu1_bar_cmplt[15]  ),
  .sab_piu2_ac_req_x        (sab_piu2_ac_req[15]     ),
  .sab_piu2_bar_cmplt_x     (sab_piu2_bar_cmplt[15]  ),
  .sab_piu3_ac_req_x        (sab_piu3_ac_req[15]     ),
  .sab_piu3_bar_cmplt_x     (sab_piu3_bar_cmplt[15]  ),
  .sab_pop_en_x             (sab_pop_en[15]          ),
  .sab_r_grant_x            (sab_r_grant[15]         ),
  .sab_rack_x               (sab_rack[15]            ),
  .sab_rresp_req_x          (sab_rresp_req[15]       ),
  .sab_snpext_depd_snb_x    (sab_snpext_depd_snb[15] ),
  .sab_snpl2_cmplt_x        (sab_snpl2_cmplt[15]     ),
  .sab_snpl2_ini_sid        (sab_snpl2_ini_sid       ),
  .sab_vld_x                (sab_vld[15]             ),
  .sab_wns_x                (sab_wns[15]             ),
  .snb1                     (snb1                    ),
  .snpext_index             (snpext_index            ),
  .x_bresp_bus              (entry15_bresp_bus       ),
  .x_dbg_info               (entry15_dbg_info        ),
  .x_depd_set               (entry15_depd_set        ),
  .x_ebiu_arbus             (entry15_ebiu_arbus      ),
  .x_ebiu_awbus             (entry15_ebiu_awbus      ),
  .x_ebiu_dbus              (entry15_ebiu_dbus       ),
  .x_ebiu_mid               (entry15_ebiu_mid        ),
  .x_l2c_addr_bus           (entry15_l2c_addr_bus    ),
  .x_l2c_data_bus           (entry15_l2c_data_bus    ),
  .x_l2c_hpcp_bus           (entry15_l2c_hpcp_bus    ),
  .x_piux_ac_bus            (entry15_piux_ac_bus     ),
  .x_rresp_bus              (entry15_rresp_bus       ),
  .x_sab_agevec             (entry15_sab_agevec      ),
  .x_sab_snpl2_cmplt        (entry15_sab_snpl2_cmplt ),
  .x_sid                    (entry15_sid             )
);

// &Connect(.create_bus  (create0_bus)); @191
// &Connect(.create_age  (create0_age)); @192
// &Connect(.create_depd (create0_depd)); @193

// &ConnRule(s/^x_/entry16_/); @195
// &ConnRule(s/_x$/[16]/); @196
// &Instance("ct_ciu_snb_sab_entry", "x_ct_ciu_snb_sab_entry16"); @197
ct_ciu_snb_sab_entry  x_ct_ciu_snb_sab_entry16 (
  .agevec_clr               (agevec_clr              ),
  .ar_crt_entry_index       (ar_crt_entry_index      ),
  .arb_sab_no_l2c_req       (arb_sab_no_l2c_req      ),
  .aw_crt_entry_index       (aw_crt_entry_index      ),
  .aw_mid                   (aw_mid                  ),
  .aw_sh                    (aw_sh                   ),
  .ciu_chr2_bar_dis         (ciu_chr2_bar_dis        ),
  .ciu_chr2_sf_dis          (ciu_chr2_sf_dis         ),
  .ciu_icg_en               (ciu_icg_en              ),
  .ciu_xx_smpen             (ciu_xx_smpen            ),
  .cpurst_b                 (cpurst_b                ),
  .create_age               (create1_age             ),
  .create_bus               (create1_bus             ),
  .create_depd              (create1_depd            ),
  .depd_clr                 (depd_clr                ),
  .forever_cpuclk           (forever_cpuclk          ),
  .l1_data                  (l1_data                 ),
  .l1_wcd_err               (l1_wcd_err              ),
  .l1_wen_x                 (l1_wen[16]              ),
  .l1_wstrb                 (l1_wstrb                ),
  .l2c_cmplt_x              (l2c_cmplt[16]           ),
  .l2c_cp                   (l2c_cp                  ),
  .l2c_data                 (l2c_data                ),
  .l2c_grant_x              (l2c_grant[16]           ),
  .l2c_resp                 (l2c_resp                ),
  .memr_ar_grant_x          (memr_ar_grant[16]       ),
  .memr_cmplt_x             (memr_cmplt[16]          ),
  .memr_data                (memr_data               ),
  .memr_data_vld_x          (memr_data_vld[16]       ),
  .memr_resp                (memr_resp               ),
  .memr_resp_err            (memr_resp_err           ),
  .memw_aw_grant_x          (memw_aw_grant[16]       ),
  .memw_cmplt_x             (memw_cmplt[16]          ),
  .pad_yy_icg_scan_en       (pad_yy_icg_scan_en      ),
  .piu0_ac_grant_x          (piu0_ac_grant[16]       ),
  .piu0_cdvld_x             (piu0_cdvld[16]          ),
  .piu0_crresp              (piu0_crresp             ),
  .piu0_crvld_x             (piu0_crvld[16]          ),
  .piu1_ac_grant_x          (piu1_ac_grant[16]       ),
  .piu1_cdvld_x             (piu1_cdvld[16]          ),
  .piu1_crresp              (piu1_crresp             ),
  .piu1_crvld_x             (piu1_crvld[16]          ),
  .piu2_ac_grant_x          (piu2_ac_grant[16]       ),
  .piu2_cdvld_x             (piu2_cdvld[16]          ),
  .piu2_crresp              (piu2_crresp             ),
  .piu2_crvld_x             (piu2_crvld[16]          ),
  .piu3_ac_grant_x          (piu3_ac_grant[16]       ),
  .piu3_cdvld_x             (piu3_cdvld[16]          ),
  .piu3_crresp              (piu3_crresp             ),
  .piu3_crvld_x             (piu3_crvld[16]          ),
  .sab_ar_depd_snb_x        (sab_ar_depd_snb[16]     ),
  .sab_aw_depd_snb_x        (sab_aw_depd_snb[16]     ),
  .sab_b_grant_x            (sab_b_grant[16]         ),
  .sab_back_mark_by_wns_x   (sab_back_mark_by_wns[16]),
  .sab_back_x               (sab_back[16]            ),
  .sab_bar_depd_snb_x       (sab_bar_depd_snb[16]    ),
  .sab_bresp_req_x          (sab_bresp_req[16]       ),
  .sab_busy_x               (sab_busy[16]            ),
  .sab_cen_x                (sab_cen[16]             ),
  .sab_depd_set_by_wns_x    (sab_depd_set_by_wns[16] ),
  .sab_ebiur_req_x          (sab_ebiur_req[16]       ),
  .sab_ebiuw_req_x          (sab_ebiuw_req[16]       ),
  .sab_in_process_x         (sab_in_process[16]      ),
  .sab_l2c_req_x            (sab_l2c_req[16]         ),
  .sab_piu0_ac_req_x        (sab_piu0_ac_req[16]     ),
  .sab_piu0_bar_cmplt_x     (sab_piu0_bar_cmplt[16]  ),
  .sab_piu1_ac_req_x        (sab_piu1_ac_req[16]     ),
  .sab_piu1_bar_cmplt_x     (sab_piu1_bar_cmplt[16]  ),
  .sab_piu2_ac_req_x        (sab_piu2_ac_req[16]     ),
  .sab_piu2_bar_cmplt_x     (sab_piu2_bar_cmplt[16]  ),
  .sab_piu3_ac_req_x        (sab_piu3_ac_req[16]     ),
  .sab_piu3_bar_cmplt_x     (sab_piu3_bar_cmplt[16]  ),
  .sab_pop_en_x             (sab_pop_en[16]          ),
  .sab_r_grant_x            (sab_r_grant[16]         ),
  .sab_rack_x               (sab_rack[16]            ),
  .sab_rresp_req_x          (sab_rresp_req[16]       ),
  .sab_snpext_depd_snb_x    (sab_snpext_depd_snb[16] ),
  .sab_snpl2_cmplt_x        (sab_snpl2_cmplt[16]     ),
  .sab_snpl2_ini_sid        (sab_snpl2_ini_sid       ),
  .sab_vld_x                (sab_vld[16]             ),
  .sab_wns_x                (sab_wns[16]             ),
  .snb1                     (snb1                    ),
  .snpext_index             (snpext_index            ),
  .x_bresp_bus              (entry16_bresp_bus       ),
  .x_dbg_info               (entry16_dbg_info        ),
  .x_depd_set               (entry16_depd_set        ),
  .x_ebiu_arbus             (entry16_ebiu_arbus      ),
  .x_ebiu_awbus             (entry16_ebiu_awbus      ),
  .x_ebiu_dbus              (entry16_ebiu_dbus       ),
  .x_ebiu_mid               (entry16_ebiu_mid        ),
  .x_l2c_addr_bus           (entry16_l2c_addr_bus    ),
  .x_l2c_data_bus           (entry16_l2c_data_bus    ),
  .x_l2c_hpcp_bus           (entry16_l2c_hpcp_bus    ),
  .x_piux_ac_bus            (entry16_piux_ac_bus     ),
  .x_rresp_bus              (entry16_rresp_bus       ),
  .x_sab_agevec             (entry16_sab_agevec      ),
  .x_sab_snpl2_cmplt        (entry16_sab_snpl2_cmplt ),
  .x_sid                    (entry16_sid             )
);

// &Connect(.create_bus  (create1_bus)); @198
// &Connect(.create_age  (create1_age)); @199
// &Connect(.create_depd (create1_depd)); @200
// &ConnRule(s/^x_/entry17_/); @201
// &ConnRule(s/_x$/[17]/); @202
// &Instance("ct_ciu_snb_sab_entry", "x_ct_ciu_snb_sab_entry17"); @203
ct_ciu_snb_sab_entry  x_ct_ciu_snb_sab_entry17 (
  .agevec_clr               (agevec_clr              ),
  .ar_crt_entry_index       (ar_crt_entry_index      ),
  .arb_sab_no_l2c_req       (arb_sab_no_l2c_req      ),
  .aw_crt_entry_index       (aw_crt_entry_index      ),
  .aw_mid                   (aw_mid                  ),
  .aw_sh                    (aw_sh                   ),
  .ciu_chr2_bar_dis         (ciu_chr2_bar_dis        ),
  .ciu_chr2_sf_dis          (ciu_chr2_sf_dis         ),
  .ciu_icg_en               (ciu_icg_en              ),
  .ciu_xx_smpen             (ciu_xx_smpen            ),
  .cpurst_b                 (cpurst_b                ),
  .create_age               (create1_age             ),
  .create_bus               (create1_bus             ),
  .create_depd              (create1_depd            ),
  .depd_clr                 (depd_clr                ),
  .forever_cpuclk           (forever_cpuclk          ),
  .l1_data                  (l1_data                 ),
  .l1_wcd_err               (l1_wcd_err              ),
  .l1_wen_x                 (l1_wen[17]              ),
  .l1_wstrb                 (l1_wstrb                ),
  .l2c_cmplt_x              (l2c_cmplt[17]           ),
  .l2c_cp                   (l2c_cp                  ),
  .l2c_data                 (l2c_data                ),
  .l2c_grant_x              (l2c_grant[17]           ),
  .l2c_resp                 (l2c_resp                ),
  .memr_ar_grant_x          (memr_ar_grant[17]       ),
  .memr_cmplt_x             (memr_cmplt[17]          ),
  .memr_data                (memr_data               ),
  .memr_data_vld_x          (memr_data_vld[17]       ),
  .memr_resp                (memr_resp               ),
  .memr_resp_err            (memr_resp_err           ),
  .memw_aw_grant_x          (memw_aw_grant[17]       ),
  .memw_cmplt_x             (memw_cmplt[17]          ),
  .pad_yy_icg_scan_en       (pad_yy_icg_scan_en      ),
  .piu0_ac_grant_x          (piu0_ac_grant[17]       ),
  .piu0_cdvld_x             (piu0_cdvld[17]          ),
  .piu0_crresp              (piu0_crresp             ),
  .piu0_crvld_x             (piu0_crvld[17]          ),
  .piu1_ac_grant_x          (piu1_ac_grant[17]       ),
  .piu1_cdvld_x             (piu1_cdvld[17]          ),
  .piu1_crresp              (piu1_crresp             ),
  .piu1_crvld_x             (piu1_crvld[17]          ),
  .piu2_ac_grant_x          (piu2_ac_grant[17]       ),
  .piu2_cdvld_x             (piu2_cdvld[17]          ),
  .piu2_crresp              (piu2_crresp             ),
  .piu2_crvld_x             (piu2_crvld[17]          ),
  .piu3_ac_grant_x          (piu3_ac_grant[17]       ),
  .piu3_cdvld_x             (piu3_cdvld[17]          ),
  .piu3_crresp              (piu3_crresp             ),
  .piu3_crvld_x             (piu3_crvld[17]          ),
  .sab_ar_depd_snb_x        (sab_ar_depd_snb[17]     ),
  .sab_aw_depd_snb_x        (sab_aw_depd_snb[17]     ),
  .sab_b_grant_x            (sab_b_grant[17]         ),
  .sab_back_mark_by_wns_x   (sab_back_mark_by_wns[17]),
  .sab_back_x               (sab_back[17]            ),
  .sab_bar_depd_snb_x       (sab_bar_depd_snb[17]    ),
  .sab_bresp_req_x          (sab_bresp_req[17]       ),
  .sab_busy_x               (sab_busy[17]            ),
  .sab_cen_x                (sab_cen[17]             ),
  .sab_depd_set_by_wns_x    (sab_depd_set_by_wns[17] ),
  .sab_ebiur_req_x          (sab_ebiur_req[17]       ),
  .sab_ebiuw_req_x          (sab_ebiuw_req[17]       ),
  .sab_in_process_x         (sab_in_process[17]      ),
  .sab_l2c_req_x            (sab_l2c_req[17]         ),
  .sab_piu0_ac_req_x        (sab_piu0_ac_req[17]     ),
  .sab_piu0_bar_cmplt_x     (sab_piu0_bar_cmplt[17]  ),
  .sab_piu1_ac_req_x        (sab_piu1_ac_req[17]     ),
  .sab_piu1_bar_cmplt_x     (sab_piu1_bar_cmplt[17]  ),
  .sab_piu2_ac_req_x        (sab_piu2_ac_req[17]     ),
  .sab_piu2_bar_cmplt_x     (sab_piu2_bar_cmplt[17]  ),
  .sab_piu3_ac_req_x        (sab_piu3_ac_req[17]     ),
  .sab_piu3_bar_cmplt_x     (sab_piu3_bar_cmplt[17]  ),
  .sab_pop_en_x             (sab_pop_en[17]          ),
  .sab_r_grant_x            (sab_r_grant[17]         ),
  .sab_rack_x               (sab_rack[17]            ),
  .sab_rresp_req_x          (sab_rresp_req[17]       ),
  .sab_snpext_depd_snb_x    (sab_snpext_depd_snb[17] ),
  .sab_snpl2_cmplt_x        (sab_snpl2_cmplt[17]     ),
  .sab_snpl2_ini_sid        (sab_snpl2_ini_sid       ),
  .sab_vld_x                (sab_vld[17]             ),
  .sab_wns_x                (sab_wns[17]             ),
  .snb1                     (snb1                    ),
  .snpext_index             (snpext_index            ),
  .x_bresp_bus              (entry17_bresp_bus       ),
  .x_dbg_info               (entry17_dbg_info        ),
  .x_depd_set               (entry17_depd_set        ),
  .x_ebiu_arbus             (entry17_ebiu_arbus      ),
  .x_ebiu_awbus             (entry17_ebiu_awbus      ),
  .x_ebiu_dbus              (entry17_ebiu_dbus       ),
  .x_ebiu_mid               (entry17_ebiu_mid        ),
  .x_l2c_addr_bus           (entry17_l2c_addr_bus    ),
  .x_l2c_data_bus           (entry17_l2c_data_bus    ),
  .x_l2c_hpcp_bus           (entry17_l2c_hpcp_bus    ),
  .x_piux_ac_bus            (entry17_piux_ac_bus     ),
  .x_rresp_bus              (entry17_rresp_bus       ),
  .x_sab_agevec             (entry17_sab_agevec      ),
  .x_sab_snpl2_cmplt        (entry17_sab_snpl2_cmplt ),
  .x_sid                    (entry17_sid             )
);

// &Connect(.create_bus  (create1_bus)); @204
// &Connect(.create_age  (create1_age)); @205
// &Connect(.create_depd (create1_depd)); @206
// &ConnRule(s/^x_/entry18_/); @207
// &ConnRule(s/_x$/[18]/); @208
// &Instance("ct_ciu_snb_sab_entry", "x_ct_ciu_snb_sab_entry18"); @209
ct_ciu_snb_sab_entry  x_ct_ciu_snb_sab_entry18 (
  .agevec_clr               (agevec_clr              ),
  .ar_crt_entry_index       (ar_crt_entry_index      ),
  .arb_sab_no_l2c_req       (arb_sab_no_l2c_req      ),
  .aw_crt_entry_index       (aw_crt_entry_index      ),
  .aw_mid                   (aw_mid                  ),
  .aw_sh                    (aw_sh                   ),
  .ciu_chr2_bar_dis         (ciu_chr2_bar_dis        ),
  .ciu_chr2_sf_dis          (ciu_chr2_sf_dis         ),
  .ciu_icg_en               (ciu_icg_en              ),
  .ciu_xx_smpen             (ciu_xx_smpen            ),
  .cpurst_b                 (cpurst_b                ),
  .create_age               (create1_age             ),
  .create_bus               (create1_bus             ),
  .create_depd              (create1_depd            ),
  .depd_clr                 (depd_clr                ),
  .forever_cpuclk           (forever_cpuclk          ),
  .l1_data                  (l1_data                 ),
  .l1_wcd_err               (l1_wcd_err              ),
  .l1_wen_x                 (l1_wen[18]              ),
  .l1_wstrb                 (l1_wstrb                ),
  .l2c_cmplt_x              (l2c_cmplt[18]           ),
  .l2c_cp                   (l2c_cp                  ),
  .l2c_data                 (l2c_data                ),
  .l2c_grant_x              (l2c_grant[18]           ),
  .l2c_resp                 (l2c_resp                ),
  .memr_ar_grant_x          (memr_ar_grant[18]       ),
  .memr_cmplt_x             (memr_cmplt[18]          ),
  .memr_data                (memr_data               ),
  .memr_data_vld_x          (memr_data_vld[18]       ),
  .memr_resp                (memr_resp               ),
  .memr_resp_err            (memr_resp_err           ),
  .memw_aw_grant_x          (memw_aw_grant[18]       ),
  .memw_cmplt_x             (memw_cmplt[18]          ),
  .pad_yy_icg_scan_en       (pad_yy_icg_scan_en      ),
  .piu0_ac_grant_x          (piu0_ac_grant[18]       ),
  .piu0_cdvld_x             (piu0_cdvld[18]          ),
  .piu0_crresp              (piu0_crresp             ),
  .piu0_crvld_x             (piu0_crvld[18]          ),
  .piu1_ac_grant_x          (piu1_ac_grant[18]       ),
  .piu1_cdvld_x             (piu1_cdvld[18]          ),
  .piu1_crresp              (piu1_crresp             ),
  .piu1_crvld_x             (piu1_crvld[18]          ),
  .piu2_ac_grant_x          (piu2_ac_grant[18]       ),
  .piu2_cdvld_x             (piu2_cdvld[18]          ),
  .piu2_crresp              (piu2_crresp             ),
  .piu2_crvld_x             (piu2_crvld[18]          ),
  .piu3_ac_grant_x          (piu3_ac_grant[18]       ),
  .piu3_cdvld_x             (piu3_cdvld[18]          ),
  .piu3_crresp              (piu3_crresp             ),
  .piu3_crvld_x             (piu3_crvld[18]          ),
  .sab_ar_depd_snb_x        (sab_ar_depd_snb[18]     ),
  .sab_aw_depd_snb_x        (sab_aw_depd_snb[18]     ),
  .sab_b_grant_x            (sab_b_grant[18]         ),
  .sab_back_mark_by_wns_x   (sab_back_mark_by_wns[18]),
  .sab_back_x               (sab_back[18]            ),
  .sab_bar_depd_snb_x       (sab_bar_depd_snb[18]    ),
  .sab_bresp_req_x          (sab_bresp_req[18]       ),
  .sab_busy_x               (sab_busy[18]            ),
  .sab_cen_x                (sab_cen[18]             ),
  .sab_depd_set_by_wns_x    (sab_depd_set_by_wns[18] ),
  .sab_ebiur_req_x          (sab_ebiur_req[18]       ),
  .sab_ebiuw_req_x          (sab_ebiuw_req[18]       ),
  .sab_in_process_x         (sab_in_process[18]      ),
  .sab_l2c_req_x            (sab_l2c_req[18]         ),
  .sab_piu0_ac_req_x        (sab_piu0_ac_req[18]     ),
  .sab_piu0_bar_cmplt_x     (sab_piu0_bar_cmplt[18]  ),
  .sab_piu1_ac_req_x        (sab_piu1_ac_req[18]     ),
  .sab_piu1_bar_cmplt_x     (sab_piu1_bar_cmplt[18]  ),
  .sab_piu2_ac_req_x        (sab_piu2_ac_req[18]     ),
  .sab_piu2_bar_cmplt_x     (sab_piu2_bar_cmplt[18]  ),
  .sab_piu3_ac_req_x        (sab_piu3_ac_req[18]     ),
  .sab_piu3_bar_cmplt_x     (sab_piu3_bar_cmplt[18]  ),
  .sab_pop_en_x             (sab_pop_en[18]          ),
  .sab_r_grant_x            (sab_r_grant[18]         ),
  .sab_rack_x               (sab_rack[18]            ),
  .sab_rresp_req_x          (sab_rresp_req[18]       ),
  .sab_snpext_depd_snb_x    (sab_snpext_depd_snb[18] ),
  .sab_snpl2_cmplt_x        (sab_snpl2_cmplt[18]     ),
  .sab_snpl2_ini_sid        (sab_snpl2_ini_sid       ),
  .sab_vld_x                (sab_vld[18]             ),
  .sab_wns_x                (sab_wns[18]             ),
  .snb1                     (snb1                    ),
  .snpext_index             (snpext_index            ),
  .x_bresp_bus              (entry18_bresp_bus       ),
  .x_dbg_info               (entry18_dbg_info        ),
  .x_depd_set               (entry18_depd_set        ),
  .x_ebiu_arbus             (entry18_ebiu_arbus      ),
  .x_ebiu_awbus             (entry18_ebiu_awbus      ),
  .x_ebiu_dbus              (entry18_ebiu_dbus       ),
  .x_ebiu_mid               (entry18_ebiu_mid        ),
  .x_l2c_addr_bus           (entry18_l2c_addr_bus    ),
  .x_l2c_data_bus           (entry18_l2c_data_bus    ),
  .x_l2c_hpcp_bus           (entry18_l2c_hpcp_bus    ),
  .x_piux_ac_bus            (entry18_piux_ac_bus     ),
  .x_rresp_bus              (entry18_rresp_bus       ),
  .x_sab_agevec             (entry18_sab_agevec      ),
  .x_sab_snpl2_cmplt        (entry18_sab_snpl2_cmplt ),
  .x_sid                    (entry18_sid             )
);

// &Connect(.create_bus  (create1_bus)); @210
// &Connect(.create_age  (create1_age)); @211
// &Connect(.create_depd (create1_depd)); @212
// &ConnRule(s/^x_/entry19_/); @213
// &ConnRule(s/_x$/[19]/); @214
// &Instance("ct_ciu_snb_sab_entry", "x_ct_ciu_snb_sab_entry19"); @215
ct_ciu_snb_sab_entry  x_ct_ciu_snb_sab_entry19 (
  .agevec_clr               (agevec_clr              ),
  .ar_crt_entry_index       (ar_crt_entry_index      ),
  .arb_sab_no_l2c_req       (arb_sab_no_l2c_req      ),
  .aw_crt_entry_index       (aw_crt_entry_index      ),
  .aw_mid                   (aw_mid                  ),
  .aw_sh                    (aw_sh                   ),
  .ciu_chr2_bar_dis         (ciu_chr2_bar_dis        ),
  .ciu_chr2_sf_dis          (ciu_chr2_sf_dis         ),
  .ciu_icg_en               (ciu_icg_en              ),
  .ciu_xx_smpen             (ciu_xx_smpen            ),
  .cpurst_b                 (cpurst_b                ),
  .create_age               (create1_age             ),
  .create_bus               (create1_bus             ),
  .create_depd              (create1_depd            ),
  .depd_clr                 (depd_clr                ),
  .forever_cpuclk           (forever_cpuclk          ),
  .l1_data                  (l1_data                 ),
  .l1_wcd_err               (l1_wcd_err              ),
  .l1_wen_x                 (l1_wen[19]              ),
  .l1_wstrb                 (l1_wstrb                ),
  .l2c_cmplt_x              (l2c_cmplt[19]           ),
  .l2c_cp                   (l2c_cp                  ),
  .l2c_data                 (l2c_data                ),
  .l2c_grant_x              (l2c_grant[19]           ),
  .l2c_resp                 (l2c_resp                ),
  .memr_ar_grant_x          (memr_ar_grant[19]       ),
  .memr_cmplt_x             (memr_cmplt[19]          ),
  .memr_data                (memr_data               ),
  .memr_data_vld_x          (memr_data_vld[19]       ),
  .memr_resp                (memr_resp               ),
  .memr_resp_err            (memr_resp_err           ),
  .memw_aw_grant_x          (memw_aw_grant[19]       ),
  .memw_cmplt_x             (memw_cmplt[19]          ),
  .pad_yy_icg_scan_en       (pad_yy_icg_scan_en      ),
  .piu0_ac_grant_x          (piu0_ac_grant[19]       ),
  .piu0_cdvld_x             (piu0_cdvld[19]          ),
  .piu0_crresp              (piu0_crresp             ),
  .piu0_crvld_x             (piu0_crvld[19]          ),
  .piu1_ac_grant_x          (piu1_ac_grant[19]       ),
  .piu1_cdvld_x             (piu1_cdvld[19]          ),
  .piu1_crresp              (piu1_crresp             ),
  .piu1_crvld_x             (piu1_crvld[19]          ),
  .piu2_ac_grant_x          (piu2_ac_grant[19]       ),
  .piu2_cdvld_x             (piu2_cdvld[19]          ),
  .piu2_crresp              (piu2_crresp             ),
  .piu2_crvld_x             (piu2_crvld[19]          ),
  .piu3_ac_grant_x          (piu3_ac_grant[19]       ),
  .piu3_cdvld_x             (piu3_cdvld[19]          ),
  .piu3_crresp              (piu3_crresp             ),
  .piu3_crvld_x             (piu3_crvld[19]          ),
  .sab_ar_depd_snb_x        (sab_ar_depd_snb[19]     ),
  .sab_aw_depd_snb_x        (sab_aw_depd_snb[19]     ),
  .sab_b_grant_x            (sab_b_grant[19]         ),
  .sab_back_mark_by_wns_x   (sab_back_mark_by_wns[19]),
  .sab_back_x               (sab_back[19]            ),
  .sab_bar_depd_snb_x       (sab_bar_depd_snb[19]    ),
  .sab_bresp_req_x          (sab_bresp_req[19]       ),
  .sab_busy_x               (sab_busy[19]            ),
  .sab_cen_x                (sab_cen[19]             ),
  .sab_depd_set_by_wns_x    (sab_depd_set_by_wns[19] ),
  .sab_ebiur_req_x          (sab_ebiur_req[19]       ),
  .sab_ebiuw_req_x          (sab_ebiuw_req[19]       ),
  .sab_in_process_x         (sab_in_process[19]      ),
  .sab_l2c_req_x            (sab_l2c_req[19]         ),
  .sab_piu0_ac_req_x        (sab_piu0_ac_req[19]     ),
  .sab_piu0_bar_cmplt_x     (sab_piu0_bar_cmplt[19]  ),
  .sab_piu1_ac_req_x        (sab_piu1_ac_req[19]     ),
  .sab_piu1_bar_cmplt_x     (sab_piu1_bar_cmplt[19]  ),
  .sab_piu2_ac_req_x        (sab_piu2_ac_req[19]     ),
  .sab_piu2_bar_cmplt_x     (sab_piu2_bar_cmplt[19]  ),
  .sab_piu3_ac_req_x        (sab_piu3_ac_req[19]     ),
  .sab_piu3_bar_cmplt_x     (sab_piu3_bar_cmplt[19]  ),
  .sab_pop_en_x             (sab_pop_en[19]          ),
  .sab_r_grant_x            (sab_r_grant[19]         ),
  .sab_rack_x               (sab_rack[19]            ),
  .sab_rresp_req_x          (sab_rresp_req[19]       ),
  .sab_snpext_depd_snb_x    (sab_snpext_depd_snb[19] ),
  .sab_snpl2_cmplt_x        (sab_snpl2_cmplt[19]     ),
  .sab_snpl2_ini_sid        (sab_snpl2_ini_sid       ),
  .sab_vld_x                (sab_vld[19]             ),
  .sab_wns_x                (sab_wns[19]             ),
  .snb1                     (snb1                    ),
  .snpext_index             (snpext_index            ),
  .x_bresp_bus              (entry19_bresp_bus       ),
  .x_dbg_info               (entry19_dbg_info        ),
  .x_depd_set               (entry19_depd_set        ),
  .x_ebiu_arbus             (entry19_ebiu_arbus      ),
  .x_ebiu_awbus             (entry19_ebiu_awbus      ),
  .x_ebiu_dbus              (entry19_ebiu_dbus       ),
  .x_ebiu_mid               (entry19_ebiu_mid        ),
  .x_l2c_addr_bus           (entry19_l2c_addr_bus    ),
  .x_l2c_data_bus           (entry19_l2c_data_bus    ),
  .x_l2c_hpcp_bus           (entry19_l2c_hpcp_bus    ),
  .x_piux_ac_bus            (entry19_piux_ac_bus     ),
  .x_rresp_bus              (entry19_rresp_bus       ),
  .x_sab_agevec             (entry19_sab_agevec      ),
  .x_sab_snpl2_cmplt        (entry19_sab_snpl2_cmplt ),
  .x_sid                    (entry19_sid             )
);

// &Connect(.create_bus  (create1_bus)); @216
// &Connect(.create_age  (create1_age)); @217
// &Connect(.create_depd (create1_depd)); @218
// &ConnRule(s/^x_/entry20_/); @219
// &ConnRule(s/_x$/[20]/); @220
// &Instance("ct_ciu_snb_sab_entry", "x_ct_ciu_snb_sab_entry20"); @221
ct_ciu_snb_sab_entry  x_ct_ciu_snb_sab_entry20 (
  .agevec_clr               (agevec_clr              ),
  .ar_crt_entry_index       (ar_crt_entry_index      ),
  .arb_sab_no_l2c_req       (arb_sab_no_l2c_req      ),
  .aw_crt_entry_index       (aw_crt_entry_index      ),
  .aw_mid                   (aw_mid                  ),
  .aw_sh                    (aw_sh                   ),
  .ciu_chr2_bar_dis         (ciu_chr2_bar_dis        ),
  .ciu_chr2_sf_dis          (ciu_chr2_sf_dis         ),
  .ciu_icg_en               (ciu_icg_en              ),
  .ciu_xx_smpen             (ciu_xx_smpen            ),
  .cpurst_b                 (cpurst_b                ),
  .create_age               (create1_age             ),
  .create_bus               (create1_bus             ),
  .create_depd              (create1_depd            ),
  .depd_clr                 (depd_clr                ),
  .forever_cpuclk           (forever_cpuclk          ),
  .l1_data                  (l1_data                 ),
  .l1_wcd_err               (l1_wcd_err              ),
  .l1_wen_x                 (l1_wen[20]              ),
  .l1_wstrb                 (l1_wstrb                ),
  .l2c_cmplt_x              (l2c_cmplt[20]           ),
  .l2c_cp                   (l2c_cp                  ),
  .l2c_data                 (l2c_data                ),
  .l2c_grant_x              (l2c_grant[20]           ),
  .l2c_resp                 (l2c_resp                ),
  .memr_ar_grant_x          (memr_ar_grant[20]       ),
  .memr_cmplt_x             (memr_cmplt[20]          ),
  .memr_data                (memr_data               ),
  .memr_data_vld_x          (memr_data_vld[20]       ),
  .memr_resp                (memr_resp               ),
  .memr_resp_err            (memr_resp_err           ),
  .memw_aw_grant_x          (memw_aw_grant[20]       ),
  .memw_cmplt_x             (memw_cmplt[20]          ),
  .pad_yy_icg_scan_en       (pad_yy_icg_scan_en      ),
  .piu0_ac_grant_x          (piu0_ac_grant[20]       ),
  .piu0_cdvld_x             (piu0_cdvld[20]          ),
  .piu0_crresp              (piu0_crresp             ),
  .piu0_crvld_x             (piu0_crvld[20]          ),
  .piu1_ac_grant_x          (piu1_ac_grant[20]       ),
  .piu1_cdvld_x             (piu1_cdvld[20]          ),
  .piu1_crresp              (piu1_crresp             ),
  .piu1_crvld_x             (piu1_crvld[20]          ),
  .piu2_ac_grant_x          (piu2_ac_grant[20]       ),
  .piu2_cdvld_x             (piu2_cdvld[20]          ),
  .piu2_crresp              (piu2_crresp             ),
  .piu2_crvld_x             (piu2_crvld[20]          ),
  .piu3_ac_grant_x          (piu3_ac_grant[20]       ),
  .piu3_cdvld_x             (piu3_cdvld[20]          ),
  .piu3_crresp              (piu3_crresp             ),
  .piu3_crvld_x             (piu3_crvld[20]          ),
  .sab_ar_depd_snb_x        (sab_ar_depd_snb[20]     ),
  .sab_aw_depd_snb_x        (sab_aw_depd_snb[20]     ),
  .sab_b_grant_x            (sab_b_grant[20]         ),
  .sab_back_mark_by_wns_x   (sab_back_mark_by_wns[20]),
  .sab_back_x               (sab_back[20]            ),
  .sab_bar_depd_snb_x       (sab_bar_depd_snb[20]    ),
  .sab_bresp_req_x          (sab_bresp_req[20]       ),
  .sab_busy_x               (sab_busy[20]            ),
  .sab_cen_x                (sab_cen[20]             ),
  .sab_depd_set_by_wns_x    (sab_depd_set_by_wns[20] ),
  .sab_ebiur_req_x          (sab_ebiur_req[20]       ),
  .sab_ebiuw_req_x          (sab_ebiuw_req[20]       ),
  .sab_in_process_x         (sab_in_process[20]      ),
  .sab_l2c_req_x            (sab_l2c_req[20]         ),
  .sab_piu0_ac_req_x        (sab_piu0_ac_req[20]     ),
  .sab_piu0_bar_cmplt_x     (sab_piu0_bar_cmplt[20]  ),
  .sab_piu1_ac_req_x        (sab_piu1_ac_req[20]     ),
  .sab_piu1_bar_cmplt_x     (sab_piu1_bar_cmplt[20]  ),
  .sab_piu2_ac_req_x        (sab_piu2_ac_req[20]     ),
  .sab_piu2_bar_cmplt_x     (sab_piu2_bar_cmplt[20]  ),
  .sab_piu3_ac_req_x        (sab_piu3_ac_req[20]     ),
  .sab_piu3_bar_cmplt_x     (sab_piu3_bar_cmplt[20]  ),
  .sab_pop_en_x             (sab_pop_en[20]          ),
  .sab_r_grant_x            (sab_r_grant[20]         ),
  .sab_rack_x               (sab_rack[20]            ),
  .sab_rresp_req_x          (sab_rresp_req[20]       ),
  .sab_snpext_depd_snb_x    (sab_snpext_depd_snb[20] ),
  .sab_snpl2_cmplt_x        (sab_snpl2_cmplt[20]     ),
  .sab_snpl2_ini_sid        (sab_snpl2_ini_sid       ),
  .sab_vld_x                (sab_vld[20]             ),
  .sab_wns_x                (sab_wns[20]             ),
  .snb1                     (snb1                    ),
  .snpext_index             (snpext_index            ),
  .x_bresp_bus              (entry20_bresp_bus       ),
  .x_dbg_info               (entry20_dbg_info        ),
  .x_depd_set               (entry20_depd_set        ),
  .x_ebiu_arbus             (entry20_ebiu_arbus      ),
  .x_ebiu_awbus             (entry20_ebiu_awbus      ),
  .x_ebiu_dbus              (entry20_ebiu_dbus       ),
  .x_ebiu_mid               (entry20_ebiu_mid        ),
  .x_l2c_addr_bus           (entry20_l2c_addr_bus    ),
  .x_l2c_data_bus           (entry20_l2c_data_bus    ),
  .x_l2c_hpcp_bus           (entry20_l2c_hpcp_bus    ),
  .x_piux_ac_bus            (entry20_piux_ac_bus     ),
  .x_rresp_bus              (entry20_rresp_bus       ),
  .x_sab_agevec             (entry20_sab_agevec      ),
  .x_sab_snpl2_cmplt        (entry20_sab_snpl2_cmplt ),
  .x_sid                    (entry20_sid             )
);

// &Connect(.create_bus  (create1_bus)); @222
// &Connect(.create_age  (create1_age)); @223
// &Connect(.create_depd (create1_depd)); @224
// &ConnRule(s/^x_/entry21_/); @225
// &ConnRule(s/_x$/[21]/); @226
// &Instance("ct_ciu_snb_sab_entry", "x_ct_ciu_snb_sab_entry21"); @227
ct_ciu_snb_sab_entry  x_ct_ciu_snb_sab_entry21 (
  .agevec_clr               (agevec_clr              ),
  .ar_crt_entry_index       (ar_crt_entry_index      ),
  .arb_sab_no_l2c_req       (arb_sab_no_l2c_req      ),
  .aw_crt_entry_index       (aw_crt_entry_index      ),
  .aw_mid                   (aw_mid                  ),
  .aw_sh                    (aw_sh                   ),
  .ciu_chr2_bar_dis         (ciu_chr2_bar_dis        ),
  .ciu_chr2_sf_dis          (ciu_chr2_sf_dis         ),
  .ciu_icg_en               (ciu_icg_en              ),
  .ciu_xx_smpen             (ciu_xx_smpen            ),
  .cpurst_b                 (cpurst_b                ),
  .create_age               (create1_age             ),
  .create_bus               (create1_bus             ),
  .create_depd              (create1_depd            ),
  .depd_clr                 (depd_clr                ),
  .forever_cpuclk           (forever_cpuclk          ),
  .l1_data                  (l1_data                 ),
  .l1_wcd_err               (l1_wcd_err              ),
  .l1_wen_x                 (l1_wen[21]              ),
  .l1_wstrb                 (l1_wstrb                ),
  .l2c_cmplt_x              (l2c_cmplt[21]           ),
  .l2c_cp                   (l2c_cp                  ),
  .l2c_data                 (l2c_data                ),
  .l2c_grant_x              (l2c_grant[21]           ),
  .l2c_resp                 (l2c_resp                ),
  .memr_ar_grant_x          (memr_ar_grant[21]       ),
  .memr_cmplt_x             (memr_cmplt[21]          ),
  .memr_data                (memr_data               ),
  .memr_data_vld_x          (memr_data_vld[21]       ),
  .memr_resp                (memr_resp               ),
  .memr_resp_err            (memr_resp_err           ),
  .memw_aw_grant_x          (memw_aw_grant[21]       ),
  .memw_cmplt_x             (memw_cmplt[21]          ),
  .pad_yy_icg_scan_en       (pad_yy_icg_scan_en      ),
  .piu0_ac_grant_x          (piu0_ac_grant[21]       ),
  .piu0_cdvld_x             (piu0_cdvld[21]          ),
  .piu0_crresp              (piu0_crresp             ),
  .piu0_crvld_x             (piu0_crvld[21]          ),
  .piu1_ac_grant_x          (piu1_ac_grant[21]       ),
  .piu1_cdvld_x             (piu1_cdvld[21]          ),
  .piu1_crresp              (piu1_crresp             ),
  .piu1_crvld_x             (piu1_crvld[21]          ),
  .piu2_ac_grant_x          (piu2_ac_grant[21]       ),
  .piu2_cdvld_x             (piu2_cdvld[21]          ),
  .piu2_crresp              (piu2_crresp             ),
  .piu2_crvld_x             (piu2_crvld[21]          ),
  .piu3_ac_grant_x          (piu3_ac_grant[21]       ),
  .piu3_cdvld_x             (piu3_cdvld[21]          ),
  .piu3_crresp              (piu3_crresp             ),
  .piu3_crvld_x             (piu3_crvld[21]          ),
  .sab_ar_depd_snb_x        (sab_ar_depd_snb[21]     ),
  .sab_aw_depd_snb_x        (sab_aw_depd_snb[21]     ),
  .sab_b_grant_x            (sab_b_grant[21]         ),
  .sab_back_mark_by_wns_x   (sab_back_mark_by_wns[21]),
  .sab_back_x               (sab_back[21]            ),
  .sab_bar_depd_snb_x       (sab_bar_depd_snb[21]    ),
  .sab_bresp_req_x          (sab_bresp_req[21]       ),
  .sab_busy_x               (sab_busy[21]            ),
  .sab_cen_x                (sab_cen[21]             ),
  .sab_depd_set_by_wns_x    (sab_depd_set_by_wns[21] ),
  .sab_ebiur_req_x          (sab_ebiur_req[21]       ),
  .sab_ebiuw_req_x          (sab_ebiuw_req[21]       ),
  .sab_in_process_x         (sab_in_process[21]      ),
  .sab_l2c_req_x            (sab_l2c_req[21]         ),
  .sab_piu0_ac_req_x        (sab_piu0_ac_req[21]     ),
  .sab_piu0_bar_cmplt_x     (sab_piu0_bar_cmplt[21]  ),
  .sab_piu1_ac_req_x        (sab_piu1_ac_req[21]     ),
  .sab_piu1_bar_cmplt_x     (sab_piu1_bar_cmplt[21]  ),
  .sab_piu2_ac_req_x        (sab_piu2_ac_req[21]     ),
  .sab_piu2_bar_cmplt_x     (sab_piu2_bar_cmplt[21]  ),
  .sab_piu3_ac_req_x        (sab_piu3_ac_req[21]     ),
  .sab_piu3_bar_cmplt_x     (sab_piu3_bar_cmplt[21]  ),
  .sab_pop_en_x             (sab_pop_en[21]          ),
  .sab_r_grant_x            (sab_r_grant[21]         ),
  .sab_rack_x               (sab_rack[21]            ),
  .sab_rresp_req_x          (sab_rresp_req[21]       ),
  .sab_snpext_depd_snb_x    (sab_snpext_depd_snb[21] ),
  .sab_snpl2_cmplt_x        (sab_snpl2_cmplt[21]     ),
  .sab_snpl2_ini_sid        (sab_snpl2_ini_sid       ),
  .sab_vld_x                (sab_vld[21]             ),
  .sab_wns_x                (sab_wns[21]             ),
  .snb1                     (snb1                    ),
  .snpext_index             (snpext_index            ),
  .x_bresp_bus              (entry21_bresp_bus       ),
  .x_dbg_info               (entry21_dbg_info        ),
  .x_depd_set               (entry21_depd_set        ),
  .x_ebiu_arbus             (entry21_ebiu_arbus      ),
  .x_ebiu_awbus             (entry21_ebiu_awbus      ),
  .x_ebiu_dbus              (entry21_ebiu_dbus       ),
  .x_ebiu_mid               (entry21_ebiu_mid        ),
  .x_l2c_addr_bus           (entry21_l2c_addr_bus    ),
  .x_l2c_data_bus           (entry21_l2c_data_bus    ),
  .x_l2c_hpcp_bus           (entry21_l2c_hpcp_bus    ),
  .x_piux_ac_bus            (entry21_piux_ac_bus     ),
  .x_rresp_bus              (entry21_rresp_bus       ),
  .x_sab_agevec             (entry21_sab_agevec      ),
  .x_sab_snpl2_cmplt        (entry21_sab_snpl2_cmplt ),
  .x_sid                    (entry21_sid             )
);

// &Connect(.create_bus  (create1_bus)); @228
// &Connect(.create_age  (create1_age)); @229
// &Connect(.create_depd (create1_depd)); @230
// &ConnRule(s/^x_/entry22_/); @231
// &ConnRule(s/_x$/[22]/); @232
// &Instance("ct_ciu_snb_sab_entry", "x_ct_ciu_snb_sab_entry22"); @233
ct_ciu_snb_sab_entry  x_ct_ciu_snb_sab_entry22 (
  .agevec_clr               (agevec_clr              ),
  .ar_crt_entry_index       (ar_crt_entry_index      ),
  .arb_sab_no_l2c_req       (arb_sab_no_l2c_req      ),
  .aw_crt_entry_index       (aw_crt_entry_index      ),
  .aw_mid                   (aw_mid                  ),
  .aw_sh                    (aw_sh                   ),
  .ciu_chr2_bar_dis         (ciu_chr2_bar_dis        ),
  .ciu_chr2_sf_dis          (ciu_chr2_sf_dis         ),
  .ciu_icg_en               (ciu_icg_en              ),
  .ciu_xx_smpen             (ciu_xx_smpen            ),
  .cpurst_b                 (cpurst_b                ),
  .create_age               (create1_age             ),
  .create_bus               (create1_bus             ),
  .create_depd              (create1_depd            ),
  .depd_clr                 (depd_clr                ),
  .forever_cpuclk           (forever_cpuclk          ),
  .l1_data                  (l1_data                 ),
  .l1_wcd_err               (l1_wcd_err              ),
  .l1_wen_x                 (l1_wen[22]              ),
  .l1_wstrb                 (l1_wstrb                ),
  .l2c_cmplt_x              (l2c_cmplt[22]           ),
  .l2c_cp                   (l2c_cp                  ),
  .l2c_data                 (l2c_data                ),
  .l2c_grant_x              (l2c_grant[22]           ),
  .l2c_resp                 (l2c_resp                ),
  .memr_ar_grant_x          (memr_ar_grant[22]       ),
  .memr_cmplt_x             (memr_cmplt[22]          ),
  .memr_data                (memr_data               ),
  .memr_data_vld_x          (memr_data_vld[22]       ),
  .memr_resp                (memr_resp               ),
  .memr_resp_err            (memr_resp_err           ),
  .memw_aw_grant_x          (memw_aw_grant[22]       ),
  .memw_cmplt_x             (memw_cmplt[22]          ),
  .pad_yy_icg_scan_en       (pad_yy_icg_scan_en      ),
  .piu0_ac_grant_x          (piu0_ac_grant[22]       ),
  .piu0_cdvld_x             (piu0_cdvld[22]          ),
  .piu0_crresp              (piu0_crresp             ),
  .piu0_crvld_x             (piu0_crvld[22]          ),
  .piu1_ac_grant_x          (piu1_ac_grant[22]       ),
  .piu1_cdvld_x             (piu1_cdvld[22]          ),
  .piu1_crresp              (piu1_crresp             ),
  .piu1_crvld_x             (piu1_crvld[22]          ),
  .piu2_ac_grant_x          (piu2_ac_grant[22]       ),
  .piu2_cdvld_x             (piu2_cdvld[22]          ),
  .piu2_crresp              (piu2_crresp             ),
  .piu2_crvld_x             (piu2_crvld[22]          ),
  .piu3_ac_grant_x          (piu3_ac_grant[22]       ),
  .piu3_cdvld_x             (piu3_cdvld[22]          ),
  .piu3_crresp              (piu3_crresp             ),
  .piu3_crvld_x             (piu3_crvld[22]          ),
  .sab_ar_depd_snb_x        (sab_ar_depd_snb[22]     ),
  .sab_aw_depd_snb_x        (sab_aw_depd_snb[22]     ),
  .sab_b_grant_x            (sab_b_grant[22]         ),
  .sab_back_mark_by_wns_x   (sab_back_mark_by_wns[22]),
  .sab_back_x               (sab_back[22]            ),
  .sab_bar_depd_snb_x       (sab_bar_depd_snb[22]    ),
  .sab_bresp_req_x          (sab_bresp_req[22]       ),
  .sab_busy_x               (sab_busy[22]            ),
  .sab_cen_x                (sab_cen[22]             ),
  .sab_depd_set_by_wns_x    (sab_depd_set_by_wns[22] ),
  .sab_ebiur_req_x          (sab_ebiur_req[22]       ),
  .sab_ebiuw_req_x          (sab_ebiuw_req[22]       ),
  .sab_in_process_x         (sab_in_process[22]      ),
  .sab_l2c_req_x            (sab_l2c_req[22]         ),
  .sab_piu0_ac_req_x        (sab_piu0_ac_req[22]     ),
  .sab_piu0_bar_cmplt_x     (sab_piu0_bar_cmplt[22]  ),
  .sab_piu1_ac_req_x        (sab_piu1_ac_req[22]     ),
  .sab_piu1_bar_cmplt_x     (sab_piu1_bar_cmplt[22]  ),
  .sab_piu2_ac_req_x        (sab_piu2_ac_req[22]     ),
  .sab_piu2_bar_cmplt_x     (sab_piu2_bar_cmplt[22]  ),
  .sab_piu3_ac_req_x        (sab_piu3_ac_req[22]     ),
  .sab_piu3_bar_cmplt_x     (sab_piu3_bar_cmplt[22]  ),
  .sab_pop_en_x             (sab_pop_en[22]          ),
  .sab_r_grant_x            (sab_r_grant[22]         ),
  .sab_rack_x               (sab_rack[22]            ),
  .sab_rresp_req_x          (sab_rresp_req[22]       ),
  .sab_snpext_depd_snb_x    (sab_snpext_depd_snb[22] ),
  .sab_snpl2_cmplt_x        (sab_snpl2_cmplt[22]     ),
  .sab_snpl2_ini_sid        (sab_snpl2_ini_sid       ),
  .sab_vld_x                (sab_vld[22]             ),
  .sab_wns_x                (sab_wns[22]             ),
  .snb1                     (snb1                    ),
  .snpext_index             (snpext_index            ),
  .x_bresp_bus              (entry22_bresp_bus       ),
  .x_dbg_info               (entry22_dbg_info        ),
  .x_depd_set               (entry22_depd_set        ),
  .x_ebiu_arbus             (entry22_ebiu_arbus      ),
  .x_ebiu_awbus             (entry22_ebiu_awbus      ),
  .x_ebiu_dbus              (entry22_ebiu_dbus       ),
  .x_ebiu_mid               (entry22_ebiu_mid        ),
  .x_l2c_addr_bus           (entry22_l2c_addr_bus    ),
  .x_l2c_data_bus           (entry22_l2c_data_bus    ),
  .x_l2c_hpcp_bus           (entry22_l2c_hpcp_bus    ),
  .x_piux_ac_bus            (entry22_piux_ac_bus     ),
  .x_rresp_bus              (entry22_rresp_bus       ),
  .x_sab_agevec             (entry22_sab_agevec      ),
  .x_sab_snpl2_cmplt        (entry22_sab_snpl2_cmplt ),
  .x_sid                    (entry22_sid             )
);

// &Connect(.create_bus  (create1_bus)); @234
// &Connect(.create_age  (create1_age)); @235
// &Connect(.create_depd (create1_depd)); @236
// &ConnRule(s/^x_/entry23_/); @237
// &ConnRule(s/_x$/[23]/); @238
// &Instance("ct_ciu_snb_sab_entry", "x_ct_ciu_snb_sab_entry23"); @239
ct_ciu_snb_sab_entry  x_ct_ciu_snb_sab_entry23 (
  .agevec_clr               (agevec_clr              ),
  .ar_crt_entry_index       (ar_crt_entry_index      ),
  .arb_sab_no_l2c_req       (arb_sab_no_l2c_req      ),
  .aw_crt_entry_index       (aw_crt_entry_index      ),
  .aw_mid                   (aw_mid                  ),
  .aw_sh                    (aw_sh                   ),
  .ciu_chr2_bar_dis         (ciu_chr2_bar_dis        ),
  .ciu_chr2_sf_dis          (ciu_chr2_sf_dis         ),
  .ciu_icg_en               (ciu_icg_en              ),
  .ciu_xx_smpen             (ciu_xx_smpen            ),
  .cpurst_b                 (cpurst_b                ),
  .create_age               (create1_age             ),
  .create_bus               (create1_bus             ),
  .create_depd              (create1_depd            ),
  .depd_clr                 (depd_clr                ),
  .forever_cpuclk           (forever_cpuclk          ),
  .l1_data                  (l1_data                 ),
  .l1_wcd_err               (l1_wcd_err              ),
  .l1_wen_x                 (l1_wen[23]              ),
  .l1_wstrb                 (l1_wstrb                ),
  .l2c_cmplt_x              (l2c_cmplt[23]           ),
  .l2c_cp                   (l2c_cp                  ),
  .l2c_data                 (l2c_data                ),
  .l2c_grant_x              (l2c_grant[23]           ),
  .l2c_resp                 (l2c_resp                ),
  .memr_ar_grant_x          (memr_ar_grant[23]       ),
  .memr_cmplt_x             (memr_cmplt[23]          ),
  .memr_data                (memr_data               ),
  .memr_data_vld_x          (memr_data_vld[23]       ),
  .memr_resp                (memr_resp               ),
  .memr_resp_err            (memr_resp_err           ),
  .memw_aw_grant_x          (memw_aw_grant[23]       ),
  .memw_cmplt_x             (memw_cmplt[23]          ),
  .pad_yy_icg_scan_en       (pad_yy_icg_scan_en      ),
  .piu0_ac_grant_x          (piu0_ac_grant[23]       ),
  .piu0_cdvld_x             (piu0_cdvld[23]          ),
  .piu0_crresp              (piu0_crresp             ),
  .piu0_crvld_x             (piu0_crvld[23]          ),
  .piu1_ac_grant_x          (piu1_ac_grant[23]       ),
  .piu1_cdvld_x             (piu1_cdvld[23]          ),
  .piu1_crresp              (piu1_crresp             ),
  .piu1_crvld_x             (piu1_crvld[23]          ),
  .piu2_ac_grant_x          (piu2_ac_grant[23]       ),
  .piu2_cdvld_x             (piu2_cdvld[23]          ),
  .piu2_crresp              (piu2_crresp             ),
  .piu2_crvld_x             (piu2_crvld[23]          ),
  .piu3_ac_grant_x          (piu3_ac_grant[23]       ),
  .piu3_cdvld_x             (piu3_cdvld[23]          ),
  .piu3_crresp              (piu3_crresp             ),
  .piu3_crvld_x             (piu3_crvld[23]          ),
  .sab_ar_depd_snb_x        (sab_ar_depd_snb[23]     ),
  .sab_aw_depd_snb_x        (sab_aw_depd_snb[23]     ),
  .sab_b_grant_x            (sab_b_grant[23]         ),
  .sab_back_mark_by_wns_x   (sab_back_mark_by_wns[23]),
  .sab_back_x               (sab_back[23]            ),
  .sab_bar_depd_snb_x       (sab_bar_depd_snb[23]    ),
  .sab_bresp_req_x          (sab_bresp_req[23]       ),
  .sab_busy_x               (sab_busy[23]            ),
  .sab_cen_x                (sab_cen[23]             ),
  .sab_depd_set_by_wns_x    (sab_depd_set_by_wns[23] ),
  .sab_ebiur_req_x          (sab_ebiur_req[23]       ),
  .sab_ebiuw_req_x          (sab_ebiuw_req[23]       ),
  .sab_in_process_x         (sab_in_process[23]      ),
  .sab_l2c_req_x            (sab_l2c_req[23]         ),
  .sab_piu0_ac_req_x        (sab_piu0_ac_req[23]     ),
  .sab_piu0_bar_cmplt_x     (sab_piu0_bar_cmplt[23]  ),
  .sab_piu1_ac_req_x        (sab_piu1_ac_req[23]     ),
  .sab_piu1_bar_cmplt_x     (sab_piu1_bar_cmplt[23]  ),
  .sab_piu2_ac_req_x        (sab_piu2_ac_req[23]     ),
  .sab_piu2_bar_cmplt_x     (sab_piu2_bar_cmplt[23]  ),
  .sab_piu3_ac_req_x        (sab_piu3_ac_req[23]     ),
  .sab_piu3_bar_cmplt_x     (sab_piu3_bar_cmplt[23]  ),
  .sab_pop_en_x             (sab_pop_en[23]          ),
  .sab_r_grant_x            (sab_r_grant[23]         ),
  .sab_rack_x               (sab_rack[23]            ),
  .sab_rresp_req_x          (sab_rresp_req[23]       ),
  .sab_snpext_depd_snb_x    (sab_snpext_depd_snb[23] ),
  .sab_snpl2_cmplt_x        (sab_snpl2_cmplt[23]     ),
  .sab_snpl2_ini_sid        (sab_snpl2_ini_sid       ),
  .sab_vld_x                (sab_vld[23]             ),
  .sab_wns_x                (sab_wns[23]             ),
  .snb1                     (snb1                    ),
  .snpext_index             (snpext_index            ),
  .x_bresp_bus              (entry23_bresp_bus       ),
  .x_dbg_info               (entry23_dbg_info        ),
  .x_depd_set               (entry23_depd_set        ),
  .x_ebiu_arbus             (entry23_ebiu_arbus      ),
  .x_ebiu_awbus             (entry23_ebiu_awbus      ),
  .x_ebiu_dbus              (entry23_ebiu_dbus       ),
  .x_ebiu_mid               (entry23_ebiu_mid        ),
  .x_l2c_addr_bus           (entry23_l2c_addr_bus    ),
  .x_l2c_data_bus           (entry23_l2c_data_bus    ),
  .x_l2c_hpcp_bus           (entry23_l2c_hpcp_bus    ),
  .x_piux_ac_bus            (entry23_piux_ac_bus     ),
  .x_rresp_bus              (entry23_rresp_bus       ),
  .x_sab_agevec             (entry23_sab_agevec      ),
  .x_sab_snpl2_cmplt        (entry23_sab_snpl2_cmplt ),
  .x_sid                    (entry23_sid             )
);

// &Connect(.create_bus  (create1_bus)); @240
// &Connect(.create_age  (create1_age)); @241
// &Connect(.create_depd (create1_depd)); @242

assign entry0_sid[4:0]  = 5'b00000;
assign entry1_sid[4:0]  = 5'b00001;
assign entry2_sid[4:0]  = 5'b00010;
assign entry3_sid[4:0]  = 5'b00011;
assign entry4_sid[4:0]  = 5'b00100;
assign entry5_sid[4:0]  = 5'b00101;
assign entry6_sid[4:0]  = 5'b00110;
assign entry7_sid[4:0]  = 5'b00111;
assign entry8_sid[4:0]  = 5'b01000;
assign entry9_sid[4:0]  = 5'b01001;
assign entry10_sid[4:0] = 5'b01010;
assign entry11_sid[4:0] = 5'b01011;
assign entry12_sid[4:0] = 5'b01100;
assign entry13_sid[4:0] = 5'b01101;
assign entry14_sid[4:0] = 5'b01110;
assign entry15_sid[4:0] = 5'b01111;

assign entry16_sid[4:0] = 5'b10000;
assign entry17_sid[4:0] = 5'b10001;
assign entry18_sid[4:0] = 5'b10010;
assign entry19_sid[4:0] = 5'b10011;
assign entry20_sid[4:0] = 5'b10100;
assign entry21_sid[4:0] = 5'b10101;
assign entry22_sid[4:0] = 5'b10110;
assign entry23_sid[4:0] = 5'b10111;
//================================================
//   create0 PTR
//================================================

assign sab_entry_vld[DEPTH-1:0]  = sab_vld[DEPTH-1:0];
assign sab_entry_busy[DEPTH-1:0] = sab_busy[DEPTH-1:0];

assign sab_cen0[RDEPTH-1:0]    = {RDEPTH{sab_ar_create_en}} & 
                                 sab_ar_create_sel[RDEPTH-1:0];

//================================================
//   create1 PTR
//================================================

assign sab_cen1[WDEPTH-1:0] = {WDEPTH{sab_aw_create_en}} &
                               sab_aw_create_sel[WDEPTH-1:0];


//==============================================================================
//                    dependency check
//==============================================================================
// 1.ar check sab
// 2.aw check sab
// 3.aw reorder with rd in sab by back marking

//==========================================================
//      ar check sab  
//==========================================================
// 1. ar is bar
// 2. ar is read or clean
parameter AR_WIDTH    = 71;
parameter AW_WIDTH    = 71;
parameter AW_BAR_0    = 29;
parameter AR_BAR_1    = 30;

parameter AW_DOMAIN_1 = 28;
parameter AW_DOMAIN_0 = 27;
parameter AW_SNOOP_2  = 25;
parameter AW_SNOOP_0  = 23;

parameter WNS = 3'b000;
parameter WC  = 3'b010;
parameter WB  = 3'b011;
parameter EVICT = 3'b100;
//------------------------------------------------
//        bar_depd
//------------------------------------------------
// 1. bar check all barrier respected request in SAB
// 2. bar check aw 
assign aw_bar      = sab_aw_create_bus[AW_BAR_0];
assign aw_mid[2:0] = sab_aw_create_mid[2:0];
assign aw_sh       = sab_aw_create_bus[AW_DOMAIN_0];

assign sab_bar_depd[DEPTH-1:0] = sab_bar_depd_snb[DEPTH-1:0];

 //------------------------------------------------
//       ar_depd
//------------------------------------------------
// 1.ar check all requests excluding bar in SAB
// 2.ar check aw
assign sab_ar_depd_aw[DEPTH-1:RDEPTH] 
             = {WDEPTH{(ar_crt_entry_index[6:0] == aw_crt_entry_index[6:0]) & !aw_bar}} & sab_cen1[WDEPTH-1:0];
assign sab_ar_depd_aw[RDEPTH-1:0] = {RDEPTH{1'b0}};
//------------------------------------------------
//   ar_depd_vld
//------------------------------------------------
// if ar is bar, choose bar_depd, otherwise choose ar_depd
assign ar_piu    = !ar_snpext & !ar_snpl2;
assign ar_snpext = sab_ar_create_mid[2:0] == 3'b110;
assign ar_snpl2  = sab_ar_create_mid[2:0] == 3'b111; 

assign aw_wns = (sab_aw_create_bus[AW_SNOOP_2:AW_SNOOP_0] == WNS) &
                (sab_aw_create_bus[AW_DOMAIN_1:AW_DOMAIN_0] != 2'b01) |
                (sab_aw_create_bus[AW_SNOOP_2:AW_SNOOP_0] == WB)  |
                (sab_aw_create_bus[AW_SNOOP_2:AW_SNOOP_0] == WC) |
                (sab_aw_create_bus[AW_SNOOP_2:AW_SNOOP_0] == EVICT);

assign sab_ar_depd_vld[DEPTH-1:0] = sab_ar_depd_snb[DEPTH-1:0] & 
                                       ({DEPTH{ar_piu}} | {DEPTH{ar_snpl2}} & sab_wns[DEPTH-1:0]) |
                                    sab_ar_depd_aw[DEPTH-1:0]  & 
                                       {DEPTH{(ar_piu | ar_snpl2 & aw_wns & !aw_bar)}};

//==========================================================
//      aw check sab
//==========================================================
// aw will generate depd_vld when 
// 1. aw depd wt in sab
// 2. aw depd rd in sab, when rd meet:
//   a) rns, not in W_DEPD;
//   b) rd has not graduated, and
//   c) rd has recieved l1_dt

assign sab_aw_depd[DEPTH-1:0] = sab_aw_depd_snb[DEPTH-1:0] &
                               (sab_wns[DEPTH-1:0] | {DEPTH{!aw_wns & !aw_bar}});

assign sab_aw_depd_vld[DEPTH-1:0] = aw_bar 
                                  ? sab_bar_depd[DEPTH-1:0]
                                  : sab_aw_depd[DEPTH-1:0];

//--------------------------------------
//   snpext_depd snb
//--------------------------------------

assign sab_snpext_depd_vld = | (sab_snpext_depd_snb[DEPTH-1:0] & sab_in_process[DEPTH-1:0]);
assign sab_depd_set_by_snpext[DEPTH-1:0] = sab_snpext_depd_snb[DEPTH-1:0] & ~sab_in_process[DEPTH-1:0] & {DEPTH{snpext_vld}};

//==========================================================
//      back mark
//==========================================================

assign back_mark_by_wns[DEPTH-1:0]    = sab_back_mark_by_wns[DEPTH-1:0];

//--------------------------------------
//  depd_set
//--------------------------------------
assign sab_depd_set_by_wns[DEPTH-1:0] = sab_aw_depd_snb[DEPTH-1:0] & back_mark_by_wns[DEPTH-1:0] & {DEPTH{aw_wns & !aw_bar}};

assign entry0_depd_set[DEPTH-1:RDEPTH]  = {WDEPTH{sab_depd_set_by_wns[0] }} & sab_cen1[WDEPTH-1:0];
assign entry1_depd_set[DEPTH-1:RDEPTH]  = {WDEPTH{sab_depd_set_by_wns[1] }} & sab_cen1[WDEPTH-1:0];
assign entry2_depd_set[DEPTH-1:RDEPTH]  = {WDEPTH{sab_depd_set_by_wns[2] }} & sab_cen1[WDEPTH-1:0];
assign entry3_depd_set[DEPTH-1:RDEPTH]  = {WDEPTH{sab_depd_set_by_wns[3] }} & sab_cen1[WDEPTH-1:0];
assign entry4_depd_set[DEPTH-1:RDEPTH]  = {WDEPTH{sab_depd_set_by_wns[4] }} & sab_cen1[WDEPTH-1:0];
assign entry5_depd_set[DEPTH-1:RDEPTH]  = {WDEPTH{sab_depd_set_by_wns[5] }} & sab_cen1[WDEPTH-1:0];
assign entry6_depd_set[DEPTH-1:RDEPTH]  = {WDEPTH{sab_depd_set_by_wns[6] }} & sab_cen1[WDEPTH-1:0];
assign entry7_depd_set[DEPTH-1:RDEPTH]  = {WDEPTH{sab_depd_set_by_wns[7] }} & sab_cen1[WDEPTH-1:0];
assign entry8_depd_set[DEPTH-1:RDEPTH]  = {WDEPTH{sab_depd_set_by_wns[8] }} & sab_cen1[WDEPTH-1:0];
assign entry9_depd_set[DEPTH-1:RDEPTH]  = {WDEPTH{sab_depd_set_by_wns[9] }} & sab_cen1[WDEPTH-1:0];
assign entry10_depd_set[DEPTH-1:RDEPTH] = {WDEPTH{sab_depd_set_by_wns[10]}} & sab_cen1[WDEPTH-1:0];
assign entry11_depd_set[DEPTH-1:RDEPTH] = {WDEPTH{sab_depd_set_by_wns[11]}} & sab_cen1[WDEPTH-1:0];
assign entry12_depd_set[DEPTH-1:RDEPTH] = {WDEPTH{sab_depd_set_by_wns[12]}} & sab_cen1[WDEPTH-1:0];
assign entry13_depd_set[DEPTH-1:RDEPTH] = {WDEPTH{sab_depd_set_by_wns[13]}} & sab_cen1[WDEPTH-1:0];
assign entry14_depd_set[DEPTH-1:RDEPTH] = {WDEPTH{sab_depd_set_by_wns[14]}} & sab_cen1[WDEPTH-1:0];
assign entry15_depd_set[DEPTH-1:RDEPTH] = {WDEPTH{sab_depd_set_by_wns[15]}} & sab_cen1[WDEPTH-1:0];
assign entry16_depd_set[DEPTH-1:RDEPTH] = {WDEPTH{sab_depd_set_by_wns[16]}} & sab_cen1[WDEPTH-1:0];
assign entry17_depd_set[DEPTH-1:RDEPTH] = {WDEPTH{sab_depd_set_by_wns[17]}} & sab_cen1[WDEPTH-1:0];
assign entry18_depd_set[DEPTH-1:RDEPTH] = {WDEPTH{sab_depd_set_by_wns[18]}} & sab_cen1[WDEPTH-1:0];
assign entry19_depd_set[DEPTH-1:RDEPTH] = {WDEPTH{sab_depd_set_by_wns[19]}} & sab_cen1[WDEPTH-1:0];
assign entry20_depd_set[DEPTH-1:RDEPTH] = {WDEPTH{sab_depd_set_by_wns[20]}} & sab_cen1[WDEPTH-1:0];
assign entry21_depd_set[DEPTH-1:RDEPTH] = {WDEPTH{sab_depd_set_by_wns[21]}} & sab_cen1[WDEPTH-1:0];
assign entry22_depd_set[DEPTH-1:RDEPTH] = {WDEPTH{sab_depd_set_by_wns[22]}} & sab_cen1[WDEPTH-1:0];
assign entry23_depd_set[DEPTH-1:RDEPTH] = {WDEPTH{sab_depd_set_by_wns[23]}} & sab_cen1[WDEPTH-1:0];

assign entry0_depd_set[RDEPTH-1:0]  = {RDEPTH{sab_depd_set_by_snpext[0] }} & snpext_cen0_raw[RDEPTH-1:0];
assign entry1_depd_set[RDEPTH-1:0]  = {RDEPTH{sab_depd_set_by_snpext[1] }} & snpext_cen0_raw[RDEPTH-1:0];
assign entry2_depd_set[RDEPTH-1:0]  = {RDEPTH{sab_depd_set_by_snpext[2] }} & snpext_cen0_raw[RDEPTH-1:0];
assign entry3_depd_set[RDEPTH-1:0]  = {RDEPTH{sab_depd_set_by_snpext[3] }} & snpext_cen0_raw[RDEPTH-1:0];
assign entry4_depd_set[RDEPTH-1:0]  = {RDEPTH{sab_depd_set_by_snpext[4] }} & snpext_cen0_raw[RDEPTH-1:0];
assign entry5_depd_set[RDEPTH-1:0]  = {RDEPTH{sab_depd_set_by_snpext[5] }} & snpext_cen0_raw[RDEPTH-1:0];
assign entry6_depd_set[RDEPTH-1:0]  = {RDEPTH{sab_depd_set_by_snpext[6] }} & snpext_cen0_raw[RDEPTH-1:0];
assign entry7_depd_set[RDEPTH-1:0]  = {RDEPTH{sab_depd_set_by_snpext[7] }} & snpext_cen0_raw[RDEPTH-1:0];
assign entry8_depd_set[RDEPTH-1:0]  = {RDEPTH{sab_depd_set_by_snpext[8] }} & snpext_cen0_raw[RDEPTH-1:0];
assign entry9_depd_set[RDEPTH-1:0]  = {RDEPTH{sab_depd_set_by_snpext[9] }} & snpext_cen0_raw[RDEPTH-1:0];
assign entry10_depd_set[RDEPTH-1:0] = {RDEPTH{sab_depd_set_by_snpext[10]}} & snpext_cen0_raw[RDEPTH-1:0];
assign entry11_depd_set[RDEPTH-1:0] = {RDEPTH{sab_depd_set_by_snpext[11]}} & snpext_cen0_raw[RDEPTH-1:0];
assign entry12_depd_set[RDEPTH-1:0] = {RDEPTH{sab_depd_set_by_snpext[12]}} & snpext_cen0_raw[RDEPTH-1:0];
assign entry13_depd_set[RDEPTH-1:0] = {RDEPTH{sab_depd_set_by_snpext[13]}} & snpext_cen0_raw[RDEPTH-1:0];
assign entry14_depd_set[RDEPTH-1:0] = {RDEPTH{sab_depd_set_by_snpext[14]}} & snpext_cen0_raw[RDEPTH-1:0];
assign entry15_depd_set[RDEPTH-1:0] = {RDEPTH{sab_depd_set_by_snpext[15]}} & snpext_cen0_raw[RDEPTH-1:0];
assign entry16_depd_set[RDEPTH-1:0] = {RDEPTH{sab_depd_set_by_snpext[16]}} & snpext_cen0_raw[RDEPTH-1:0];
assign entry17_depd_set[RDEPTH-1:0] = {RDEPTH{sab_depd_set_by_snpext[17]}} & snpext_cen0_raw[RDEPTH-1:0];
assign entry18_depd_set[RDEPTH-1:0] = {RDEPTH{sab_depd_set_by_snpext[18]}} & snpext_cen0_raw[RDEPTH-1:0];
assign entry19_depd_set[RDEPTH-1:0] = {RDEPTH{sab_depd_set_by_snpext[19]}} & snpext_cen0_raw[RDEPTH-1:0];
assign entry20_depd_set[RDEPTH-1:0] = {RDEPTH{sab_depd_set_by_snpext[20]}} & snpext_cen0_raw[RDEPTH-1:0];
assign entry21_depd_set[RDEPTH-1:0] = {RDEPTH{sab_depd_set_by_snpext[21]}} & snpext_cen0_raw[RDEPTH-1:0];
assign entry22_depd_set[RDEPTH-1:0] = {RDEPTH{sab_depd_set_by_snpext[22]}} & snpext_cen0_raw[RDEPTH-1:0];
assign entry23_depd_set[RDEPTH-1:0] = {RDEPTH{sab_depd_set_by_snpext[23]}} & snpext_cen0_raw[RDEPTH-1:0];
//--------------------------------------
//              depd_clr
//--------------------------------------
assign depd_clr[DEPTH-1:0]   = sab_pop_en[DEPTH-1:0]; 
assign agevec_clr[DEPTH-1:0] = sab_pop_en[DEPTH-1:0];

//--------------------------------------
//           age vect
//--------------------------------------
assign create0_age[DEPTH-1:0] = sab_entry_vld[DEPTH-1:0] | {sab_cen1[WDEPTH-1:0], {RDEPTH{1'b0}}};
assign create1_age[DEPTH-1:0] = sab_entry_vld[DEPTH-1:0];

//--------------------------------------
//   snpl2_cmplt
//--------------------------------------
// &Force("nonport", "entry6_sab_snpl2_cmplt"); @461
// &Force("nonport", "entry7_sab_snpl2_cmplt"); @462
// &Force("nonport", "entry16_sab_snpl2_cmplt"); @471
// &Force("nonport", "entry17_sab_snpl2_cmplt"); @472
// &Force("nonport", "entry18_sab_snpl2_cmplt"); @473
// &Force("nonport", "entry19_sab_snpl2_cmplt"); @474
// &Force("nonport", "entry20_sab_snpl2_cmplt"); @475
// &Force("nonport", "entry21_sab_snpl2_cmplt"); @476
// &Force("nonport", "entry22_sab_snpl2_cmplt"); @477
// &Force("nonport", "entry23_sab_snpl2_cmplt"); @478

assign sab_snpl2_cmplt[DEPTH-1:0] = entry0_sab_snpl2_cmplt[DEPTH-1:0] |
                                    entry1_sab_snpl2_cmplt[DEPTH-1:0] |
                                    entry2_sab_snpl2_cmplt[DEPTH-1:0] |
                                    entry3_sab_snpl2_cmplt[DEPTH-1:0] |
                                    entry4_sab_snpl2_cmplt[DEPTH-1:0] |
                                    entry5_sab_snpl2_cmplt[DEPTH-1:0] |
                                    entry6_sab_snpl2_cmplt[DEPTH-1:0] |
                                    entry7_sab_snpl2_cmplt[DEPTH-1:0] |
                                    entry8_sab_snpl2_cmplt[DEPTH-1:0] |
                                    entry9_sab_snpl2_cmplt[DEPTH-1:0] |
                                    entry10_sab_snpl2_cmplt[DEPTH-1:0] |
                                    entry11_sab_snpl2_cmplt[DEPTH-1:0] |
                                    entry12_sab_snpl2_cmplt[DEPTH-1:0] |
                                    entry13_sab_snpl2_cmplt[DEPTH-1:0] |
                                    entry14_sab_snpl2_cmplt[DEPTH-1:0] |
                                    entry15_sab_snpl2_cmplt[DEPTH-1:0];
//-------------------------------------- 
//           create bus
//-------------------------------------- 
parameter S_WIDTH = 75;
assign sab_cen[DEPTH-1:0]       = {sab_cen1[WDEPTH-1:0],sab_cen0[RDEPTH-1:0]};

assign sab_snpl2_ini_sid[4:0]   = sab_ar_create_snpl2_isid[4:0];

assign create0_bus[S_WIDTH-1:0] = {sab_ar_create_mid[2:0], 1'b0,
                                   sab_ar_create_bus[AR_WIDTH-1:0]};

assign create1_bus[S_WIDTH-1:0] = {sab_aw_create_mid[2:0], 1'b1,
                                   sab_aw_create_bus[AW_WIDTH-1:0]};

assign create0_depd[DEPTH-1:0] = sab_ar_depd_vld[DEPTH-1:0];
assign create1_depd[DEPTH-1:0] = sab_aw_depd_vld[DEPTH-1:0];

//--------------------------------------
//    CR
//--------------------------------------
assign piu0_crvld[DEPTH-1:0] = sab_crvld_piu0[DEPTH-1:0];
assign piu1_crvld[DEPTH-1:0] = sab_crvld_piu1[DEPTH-1:0];
assign piu2_crvld[DEPTH-1:0] = sab_crvld_piu2[DEPTH-1:0];
assign piu3_crvld[DEPTH-1:0] = sab_crvld_piu3[DEPTH-1:0];

assign piu0_crresp[4:0] = sab_crresp_piu0[4:0];
assign piu1_crresp[4:0] = sab_crresp_piu1[4:0];
assign piu2_crresp[4:0] = sab_crresp_piu2[4:0];
assign piu3_crresp[4:0] = sab_crresp_piu3[4:0];

assign piu0_cdvld[DEPTH-1:0] = sab_wcd_create_en[DEPTH-1:0] & {DEPTH{sab_wcd_create_cdsel[0]}};
assign piu1_cdvld[DEPTH-1:0] = sab_wcd_create_en[DEPTH-1:0] & {DEPTH{sab_wcd_create_cdsel[1]}};
assign piu2_cdvld[DEPTH-1:0] = sab_wcd_create_en[DEPTH-1:0] & {DEPTH{sab_wcd_create_cdsel[2]}};
assign piu3_cdvld[DEPTH-1:0] = sab_wcd_create_en[DEPTH-1:0] & {DEPTH{sab_wcd_create_cdsel[3]}};

//--------------------------------------
//       RACK
//--------------------------------------
assign sab_rack[DEPTH-1:0] = sab_rack_sel[DEPTH-1:0];

//--------------------------------------
//     BACK
//--------------------------------------
assign sab_back[DEPTH-1:0] = sab_back_sel[DEPTH-1:0];

//--------------------------------------
//    l1 wdcd data bus
//--------------------------------------
assign l1_wen[DEPTH-1:0] = sab_wcd_create_en[DEPTH-1:0];
assign l1_data[511:0]    = sab_wcd_create_data[511:0];
assign l1_wstrb[15:0]    = sab_wcd_create_wstrb[15:0];
assign l1_wcd_err        = sab_wcd_create_err;

//--------------------------------------
//      l2c data bus
//--------------------------------------

assign l2c_cmplt[DEPTH-1:0] = (PTR_EXTENT << arb_sab_l2c_cmplt_sid[4:0]) & {DEPTH{arb_sab_l2c_cmplt}};

assign l2c_data[511:0]  = arb_sab_l2c_data[511:0];
assign l2c_resp[4:0]    = arb_sab_l2c_resp[4:0];
assign l2c_cp[3:0]      = arb_sab_l2c_cp[3:0];

//--------------------------------------
//   mem data bus
//--------------------------------------
assign memr_ar_grant[DEPTH-1:0] = sab_ebiu_rd_sel[DEPTH-1:0] & {DEPTH{sab_memr_grant}};

assign memr_data_vld[DEPTH-1:0] = sab_memr_sel[DEPTH-1:0] & {DEPTH{sab_memr_vld}};

assign memr_cmplt[DEPTH-1:0]    = memr_data_vld[DEPTH-1:0] & {DEPTH{sab_memr_last}}; //last transfer
assign memr_resp[3:0]           = sab_memr_resp[3:0];
assign memr_resp_err            = memr_resp[1:0] != 2'b00;
assign memr_data[127:0]         = sab_memr_data[127:0];

//--------------------------------------
//   mem w cmplt
//--------------------------------------

assign memw_aw_grant[DEPTH-1:0] = sab_ebiu_wt_sel[DEPTH-1:0] & {DEPTH{sab_memw_aw_grant}};
//assign memw_w_grant[DEPTH-1:0]  = sab_memw_w_grant_sel[DEPTH-1:0]  & {DEPTH{sab_memw_w_grant}};
assign memw_cmplt[DEPTH-1:0]    = sab_memw_cmplt_sel[DEPTH-1:0]    & {DEPTH{sab_memw_cmplt}};

//==============================================================================
//            read ports
//==============================================================================
assign entry23_age_vect[DEPTH-1:0] = entry23_sab_agevec[DEPTH-1:0];
assign entry22_age_vect[DEPTH-1:0] = entry22_sab_agevec[DEPTH-1:0];
assign entry21_age_vect[DEPTH-1:0] = entry21_sab_agevec[DEPTH-1:0];
assign entry20_age_vect[DEPTH-1:0] = entry20_sab_agevec[DEPTH-1:0];
assign entry19_age_vect[DEPTH-1:0] = entry19_sab_agevec[DEPTH-1:0];
assign entry18_age_vect[DEPTH-1:0] = entry18_sab_agevec[DEPTH-1:0];
assign entry17_age_vect[DEPTH-1:0] = entry17_sab_agevec[DEPTH-1:0];
assign entry16_age_vect[DEPTH-1:0] = entry16_sab_agevec[DEPTH-1:0];
assign entry15_age_vect[DEPTH-1:0] = entry15_sab_agevec[DEPTH-1:0];
assign entry14_age_vect[DEPTH-1:0] = entry14_sab_agevec[DEPTH-1:0];
assign entry13_age_vect[DEPTH-1:0] = entry13_sab_agevec[DEPTH-1:0];
assign entry12_age_vect[DEPTH-1:0] = entry12_sab_agevec[DEPTH-1:0];
assign entry11_age_vect[DEPTH-1:0] = entry11_sab_agevec[DEPTH-1:0];
assign entry10_age_vect[DEPTH-1:0] = entry10_sab_agevec[DEPTH-1:0];
assign entry9_age_vect[DEPTH-1:0]  = entry9_sab_agevec[DEPTH-1:0];
assign entry8_age_vect[DEPTH-1:0]  = entry8_sab_agevec[DEPTH-1:0];
assign entry7_age_vect[DEPTH-1:0]  = entry7_sab_agevec[DEPTH-1:0];
assign entry6_age_vect[DEPTH-1:0]  = entry6_sab_agevec[DEPTH-1:0];
assign entry5_age_vect[DEPTH-1:0]  = entry5_sab_agevec[DEPTH-1:0];
assign entry4_age_vect[DEPTH-1:0]  = entry4_sab_agevec[DEPTH-1:0];
assign entry3_age_vect[DEPTH-1:0]  = entry3_sab_agevec[DEPTH-1:0];
assign entry2_age_vect[DEPTH-1:0]  = entry2_sab_agevec[DEPTH-1:0];
assign entry1_age_vect[DEPTH-1:0]  = entry1_sab_agevec[DEPTH-1:0];
assign entry0_age_vect[DEPTH-1:0]  = entry0_sab_agevec[DEPTH-1:0];

//================================================
//      AC read port
//================================================
//--------------------------------------
//       PIU0_AC
//--------------------------------------
parameter AC_WIDTH = 55;
// &Force("nonport", "sab_piu0_ac_sel"); @618

assign sab_piu0_ac_req_vld[DEPTH-1:0] = sab_piu0_ac_req[DEPTH-1:0];

// &Instance("ct_ciu_snb_dp_sel", "x_ct_ciu_piu0_ac_dp_sel"); @622
ct_ciu_snb_dp_sel  x_ct_ciu_piu0_ac_dp_sel (
  .entry0_age_vect     (entry0_age_vect    ),
  .entry10_age_vect    (entry10_age_vect   ),
  .entry11_age_vect    (entry11_age_vect   ),
  .entry12_age_vect    (entry12_age_vect   ),
  .entry13_age_vect    (entry13_age_vect   ),
  .entry14_age_vect    (entry14_age_vect   ),
  .entry15_age_vect    (entry15_age_vect   ),
  .entry16_age_vect    (entry16_age_vect   ),
  .entry17_age_vect    (entry17_age_vect   ),
  .entry18_age_vect    (entry18_age_vect   ),
  .entry19_age_vect    (entry19_age_vect   ),
  .entry1_age_vect     (entry1_age_vect    ),
  .entry20_age_vect    (entry20_age_vect   ),
  .entry21_age_vect    (entry21_age_vect   ),
  .entry22_age_vect    (entry22_age_vect   ),
  .entry23_age_vect    (entry23_age_vect   ),
  .entry2_age_vect     (entry2_age_vect    ),
  .entry3_age_vect     (entry3_age_vect    ),
  .entry4_age_vect     (entry4_age_vect    ),
  .entry5_age_vect     (entry5_age_vect    ),
  .entry6_age_vect     (entry6_age_vect    ),
  .entry7_age_vect     (entry7_age_vect    ),
  .entry8_age_vect     (entry8_age_vect    ),
  .entry9_age_vect     (entry9_age_vect    ),
  .req_vld             (sab_piu0_ac_req_vld),
  .sel                 (sab_piu0_ac_sel    )
);

// &Connect( @623
//   .req_vld           (sab_piu0_ac_req_vld        ), @624
//   .sel               (sab_piu0_ac_sel            ) @625
// ); @626
// &CombBeg; @628
// &CombEnd; @640
// &CombBeg; @642
always @( entry9_piux_ac_bus[54:0]
       or entry14_piux_ac_bus[54:0]
       or entry5_piux_ac_bus[54:0]
       or entry13_piux_ac_bus[54:0]
       or entry7_piux_ac_bus[54:0]
       or entry2_piux_ac_bus[54:0]
       or entry15_piux_ac_bus[54:0]
       or entry4_piux_ac_bus[54:0]
       or entry20_piux_ac_bus[54:0]
       or entry12_piux_ac_bus[54:0]
       or entry18_piux_ac_bus[54:0]
       or entry11_piux_ac_bus[54:0]
       or entry16_piux_ac_bus[54:0]
       or entry0_piux_ac_bus[54:0]
       or entry6_piux_ac_bus[54:0]
       or entry17_piux_ac_bus[54:0]
       or entry21_piux_ac_bus[54:0]
       or sab_piu0_ac_sel[23:0]
       or entry8_piux_ac_bus[54:0]
       or entry19_piux_ac_bus[54:0]
       or entry23_piux_ac_bus[54:0]
       or entry22_piux_ac_bus[54:0]
       or entry3_piux_ac_bus[54:0]
       or entry1_piux_ac_bus[54:0]
       or entry10_piux_ac_bus[54:0])
begin
  case(sab_piu0_ac_sel[DEPTH-1:0])
  24'b000000000000000000000001: sab_piu0_ac_bus[AC_WIDTH-1:0] = entry0_piux_ac_bus[AC_WIDTH-1:0];
  24'b000000000000000000000010: sab_piu0_ac_bus[AC_WIDTH-1:0] = entry1_piux_ac_bus[AC_WIDTH-1:0];
  24'b000000000000000000000100: sab_piu0_ac_bus[AC_WIDTH-1:0] = entry2_piux_ac_bus[AC_WIDTH-1:0];
  24'b000000000000000000001000: sab_piu0_ac_bus[AC_WIDTH-1:0] = entry3_piux_ac_bus[AC_WIDTH-1:0];
  24'b000000000000000000010000: sab_piu0_ac_bus[AC_WIDTH-1:0] = entry4_piux_ac_bus[AC_WIDTH-1:0];
  24'b000000000000000000100000: sab_piu0_ac_bus[AC_WIDTH-1:0] = entry5_piux_ac_bus[AC_WIDTH-1:0];
  24'b000000000000000001000000: sab_piu0_ac_bus[AC_WIDTH-1:0] = entry6_piux_ac_bus[AC_WIDTH-1:0];
  24'b000000000000000010000000: sab_piu0_ac_bus[AC_WIDTH-1:0] = entry7_piux_ac_bus[AC_WIDTH-1:0];
  24'b000000000000000100000000: sab_piu0_ac_bus[AC_WIDTH-1:0] = entry8_piux_ac_bus[AC_WIDTH-1:0];
  24'b000000000000001000000000: sab_piu0_ac_bus[AC_WIDTH-1:0] = entry9_piux_ac_bus[AC_WIDTH-1:0];
  24'b000000000000010000000000: sab_piu0_ac_bus[AC_WIDTH-1:0] = entry10_piux_ac_bus[AC_WIDTH-1:0];
  24'b000000000000100000000000: sab_piu0_ac_bus[AC_WIDTH-1:0] = entry11_piux_ac_bus[AC_WIDTH-1:0];
  24'b000000000001000000000000: sab_piu0_ac_bus[AC_WIDTH-1:0] = entry12_piux_ac_bus[AC_WIDTH-1:0];
  24'b000000000010000000000000: sab_piu0_ac_bus[AC_WIDTH-1:0] = entry13_piux_ac_bus[AC_WIDTH-1:0];
  24'b000000000100000000000000: sab_piu0_ac_bus[AC_WIDTH-1:0] = entry14_piux_ac_bus[AC_WIDTH-1:0];
  24'b000000001000000000000000: sab_piu0_ac_bus[AC_WIDTH-1:0] = entry15_piux_ac_bus[AC_WIDTH-1:0];
  24'b000000010000000000000000: sab_piu0_ac_bus[AC_WIDTH-1:0] = entry16_piux_ac_bus[AC_WIDTH-1:0];
  24'b000000100000000000000000: sab_piu0_ac_bus[AC_WIDTH-1:0] = entry17_piux_ac_bus[AC_WIDTH-1:0];
  24'b000001000000000000000000: sab_piu0_ac_bus[AC_WIDTH-1:0] = entry18_piux_ac_bus[AC_WIDTH-1:0];
  24'b000010000000000000000000: sab_piu0_ac_bus[AC_WIDTH-1:0] = entry19_piux_ac_bus[AC_WIDTH-1:0];
  24'b000100000000000000000000: sab_piu0_ac_bus[AC_WIDTH-1:0] = entry20_piux_ac_bus[AC_WIDTH-1:0];
  24'b001000000000000000000000: sab_piu0_ac_bus[AC_WIDTH-1:0] = entry21_piux_ac_bus[AC_WIDTH-1:0];
  24'b010000000000000000000000: sab_piu0_ac_bus[AC_WIDTH-1:0] = entry22_piux_ac_bus[AC_WIDTH-1:0];
  24'b100000000000000000000000: sab_piu0_ac_bus[AC_WIDTH-1:0] = entry23_piux_ac_bus[AC_WIDTH-1:0];
  default                     : sab_piu0_ac_bus[AC_WIDTH-1:0] = {AC_WIDTH{1'bx}};
  endcase
// &CombEnd; @670
end

assign sab_piu0_ac_vld = |sab_piu0_ac_req[DEPTH-1:0];

assign piu0_ac_grant[DEPTH-1:0] = {DEPTH{sab_piu0_ac_grant}} & sab_piu0_ac_sel[DEPTH-1:0];

//--------------------------------------
//       PIU1_AC
//--------------------------------------
// &Force("nonport", "sab_piu1_ac_sel"); @680

assign sab_piu1_ac_req_vld[DEPTH-1:0] = sab_piu1_ac_req[DEPTH-1:0];

// &Instance("ct_ciu_snb_dp_sel", "x_ct_ciu_piu1_ac_dp_sel"); @684
ct_ciu_snb_dp_sel  x_ct_ciu_piu1_ac_dp_sel (
  .entry0_age_vect     (entry0_age_vect    ),
  .entry10_age_vect    (entry10_age_vect   ),
  .entry11_age_vect    (entry11_age_vect   ),
  .entry12_age_vect    (entry12_age_vect   ),
  .entry13_age_vect    (entry13_age_vect   ),
  .entry14_age_vect    (entry14_age_vect   ),
  .entry15_age_vect    (entry15_age_vect   ),
  .entry16_age_vect    (entry16_age_vect   ),
  .entry17_age_vect    (entry17_age_vect   ),
  .entry18_age_vect    (entry18_age_vect   ),
  .entry19_age_vect    (entry19_age_vect   ),
  .entry1_age_vect     (entry1_age_vect    ),
  .entry20_age_vect    (entry20_age_vect   ),
  .entry21_age_vect    (entry21_age_vect   ),
  .entry22_age_vect    (entry22_age_vect   ),
  .entry23_age_vect    (entry23_age_vect   ),
  .entry2_age_vect     (entry2_age_vect    ),
  .entry3_age_vect     (entry3_age_vect    ),
  .entry4_age_vect     (entry4_age_vect    ),
  .entry5_age_vect     (entry5_age_vect    ),
  .entry6_age_vect     (entry6_age_vect    ),
  .entry7_age_vect     (entry7_age_vect    ),
  .entry8_age_vect     (entry8_age_vect    ),
  .entry9_age_vect     (entry9_age_vect    ),
  .req_vld             (sab_piu1_ac_req_vld),
  .sel                 (sab_piu1_ac_sel    )
);

// &Connect( @685
//   .req_vld           (sab_piu1_ac_req_vld        ), @686
//   .sel               (sab_piu1_ac_sel            ) @687
// ); @688

// &CombBeg; @691
// &CombEnd; @703
// &CombBeg; @705
always @( entry9_piux_ac_bus[54:0]
       or entry14_piux_ac_bus[54:0]
       or entry5_piux_ac_bus[54:0]
       or entry13_piux_ac_bus[54:0]
       or entry7_piux_ac_bus[54:0]
       or entry15_piux_ac_bus[54:0]
       or entry2_piux_ac_bus[54:0]
       or entry4_piux_ac_bus[54:0]
       or entry20_piux_ac_bus[54:0]
       or entry12_piux_ac_bus[54:0]
       or entry18_piux_ac_bus[54:0]
       or entry11_piux_ac_bus[54:0]
       or entry16_piux_ac_bus[54:0]
       or sab_piu1_ac_sel[23:0]
       or entry0_piux_ac_bus[54:0]
       or entry6_piux_ac_bus[54:0]
       or entry17_piux_ac_bus[54:0]
       or entry21_piux_ac_bus[54:0]
       or entry8_piux_ac_bus[54:0]
       or entry19_piux_ac_bus[54:0]
       or entry23_piux_ac_bus[54:0]
       or entry22_piux_ac_bus[54:0]
       or entry3_piux_ac_bus[54:0]
       or entry1_piux_ac_bus[54:0]
       or entry10_piux_ac_bus[54:0])
begin
  case(sab_piu1_ac_sel[DEPTH-1:0])
  24'b000000000000000000000001: sab_piu1_ac_bus[AC_WIDTH-1:0] = entry0_piux_ac_bus[AC_WIDTH-1:0];
  24'b000000000000000000000010: sab_piu1_ac_bus[AC_WIDTH-1:0] = entry1_piux_ac_bus[AC_WIDTH-1:0];
  24'b000000000000000000000100: sab_piu1_ac_bus[AC_WIDTH-1:0] = entry2_piux_ac_bus[AC_WIDTH-1:0];
  24'b000000000000000000001000: sab_piu1_ac_bus[AC_WIDTH-1:0] = entry3_piux_ac_bus[AC_WIDTH-1:0];
  24'b000000000000000000010000: sab_piu1_ac_bus[AC_WIDTH-1:0] = entry4_piux_ac_bus[AC_WIDTH-1:0];
  24'b000000000000000000100000: sab_piu1_ac_bus[AC_WIDTH-1:0] = entry5_piux_ac_bus[AC_WIDTH-1:0];
  24'b000000000000000001000000: sab_piu1_ac_bus[AC_WIDTH-1:0] = entry6_piux_ac_bus[AC_WIDTH-1:0];
  24'b000000000000000010000000: sab_piu1_ac_bus[AC_WIDTH-1:0] = entry7_piux_ac_bus[AC_WIDTH-1:0];
  24'b000000000000000100000000: sab_piu1_ac_bus[AC_WIDTH-1:0] = entry8_piux_ac_bus[AC_WIDTH-1:0];
  24'b000000000000001000000000: sab_piu1_ac_bus[AC_WIDTH-1:0] = entry9_piux_ac_bus[AC_WIDTH-1:0];
  24'b000000000000010000000000: sab_piu1_ac_bus[AC_WIDTH-1:0] = entry10_piux_ac_bus[AC_WIDTH-1:0];
  24'b000000000000100000000000: sab_piu1_ac_bus[AC_WIDTH-1:0] = entry11_piux_ac_bus[AC_WIDTH-1:0];
  24'b000000000001000000000000: sab_piu1_ac_bus[AC_WIDTH-1:0] = entry12_piux_ac_bus[AC_WIDTH-1:0];
  24'b000000000010000000000000: sab_piu1_ac_bus[AC_WIDTH-1:0] = entry13_piux_ac_bus[AC_WIDTH-1:0];
  24'b000000000100000000000000: sab_piu1_ac_bus[AC_WIDTH-1:0] = entry14_piux_ac_bus[AC_WIDTH-1:0];
  24'b000000001000000000000000: sab_piu1_ac_bus[AC_WIDTH-1:0] = entry15_piux_ac_bus[AC_WIDTH-1:0];
  24'b000000010000000000000000: sab_piu1_ac_bus[AC_WIDTH-1:0] = entry16_piux_ac_bus[AC_WIDTH-1:0];
  24'b000000100000000000000000: sab_piu1_ac_bus[AC_WIDTH-1:0] = entry17_piux_ac_bus[AC_WIDTH-1:0];
  24'b000001000000000000000000: sab_piu1_ac_bus[AC_WIDTH-1:0] = entry18_piux_ac_bus[AC_WIDTH-1:0];
  24'b000010000000000000000000: sab_piu1_ac_bus[AC_WIDTH-1:0] = entry19_piux_ac_bus[AC_WIDTH-1:0];
  24'b000100000000000000000000: sab_piu1_ac_bus[AC_WIDTH-1:0] = entry20_piux_ac_bus[AC_WIDTH-1:0];
  24'b001000000000000000000000: sab_piu1_ac_bus[AC_WIDTH-1:0] = entry21_piux_ac_bus[AC_WIDTH-1:0];
  24'b010000000000000000000000: sab_piu1_ac_bus[AC_WIDTH-1:0] = entry22_piux_ac_bus[AC_WIDTH-1:0];
  24'b100000000000000000000000: sab_piu1_ac_bus[AC_WIDTH-1:0] = entry23_piux_ac_bus[AC_WIDTH-1:0];
  default                     : sab_piu1_ac_bus[AC_WIDTH-1:0] = {AC_WIDTH{1'bx}};
  endcase
// &CombEnd; @733
end

assign sab_piu1_ac_vld = |sab_piu1_ac_req[DEPTH-1:0];

assign piu1_ac_grant[DEPTH-1:0] = {DEPTH{sab_piu1_ac_grant}} & sab_piu1_ac_sel[DEPTH-1:0];

//--------------------------------------
//       PIU2_AC
//--------------------------------------
// &Force("nonport", "sab_piu2_ac_sel"); @743

assign sab_piu2_ac_req_vld[DEPTH-1:0] = sab_piu2_ac_req[DEPTH-1:0];

// &Instance("ct_ciu_snb_dp_sel", "x_ct_ciu_piu2_ac_dp_sel"); @747
ct_ciu_snb_dp_sel  x_ct_ciu_piu2_ac_dp_sel (
  .entry0_age_vect     (entry0_age_vect    ),
  .entry10_age_vect    (entry10_age_vect   ),
  .entry11_age_vect    (entry11_age_vect   ),
  .entry12_age_vect    (entry12_age_vect   ),
  .entry13_age_vect    (entry13_age_vect   ),
  .entry14_age_vect    (entry14_age_vect   ),
  .entry15_age_vect    (entry15_age_vect   ),
  .entry16_age_vect    (entry16_age_vect   ),
  .entry17_age_vect    (entry17_age_vect   ),
  .entry18_age_vect    (entry18_age_vect   ),
  .entry19_age_vect    (entry19_age_vect   ),
  .entry1_age_vect     (entry1_age_vect    ),
  .entry20_age_vect    (entry20_age_vect   ),
  .entry21_age_vect    (entry21_age_vect   ),
  .entry22_age_vect    (entry22_age_vect   ),
  .entry23_age_vect    (entry23_age_vect   ),
  .entry2_age_vect     (entry2_age_vect    ),
  .entry3_age_vect     (entry3_age_vect    ),
  .entry4_age_vect     (entry4_age_vect    ),
  .entry5_age_vect     (entry5_age_vect    ),
  .entry6_age_vect     (entry6_age_vect    ),
  .entry7_age_vect     (entry7_age_vect    ),
  .entry8_age_vect     (entry8_age_vect    ),
  .entry9_age_vect     (entry9_age_vect    ),
  .req_vld             (sab_piu2_ac_req_vld),
  .sel                 (sab_piu2_ac_sel    )
);

// &Connect( @748
//   .req_vld           (sab_piu2_ac_req_vld        ), @749
//   .sel               (sab_piu2_ac_sel            ) @750
// ); @751

// &CombBeg; @754
// &CombEnd; @766
// &CombBeg; @768
always @( entry9_piux_ac_bus[54:0]
       or entry14_piux_ac_bus[54:0]
       or entry5_piux_ac_bus[54:0]
       or entry13_piux_ac_bus[54:0]
       or entry7_piux_ac_bus[54:0]
       or entry15_piux_ac_bus[54:0]
       or entry2_piux_ac_bus[54:0]
       or entry4_piux_ac_bus[54:0]
       or entry20_piux_ac_bus[54:0]
       or entry12_piux_ac_bus[54:0]
       or entry18_piux_ac_bus[54:0]
       or entry11_piux_ac_bus[54:0]
       or entry16_piux_ac_bus[54:0]
       or entry0_piux_ac_bus[54:0]
       or sab_piu2_ac_sel[23:0]
       or entry6_piux_ac_bus[54:0]
       or entry17_piux_ac_bus[54:0]
       or entry21_piux_ac_bus[54:0]
       or entry8_piux_ac_bus[54:0]
       or entry19_piux_ac_bus[54:0]
       or entry23_piux_ac_bus[54:0]
       or entry22_piux_ac_bus[54:0]
       or entry3_piux_ac_bus[54:0]
       or entry1_piux_ac_bus[54:0]
       or entry10_piux_ac_bus[54:0])
begin
  case(sab_piu2_ac_sel[DEPTH-1:0])
  24'b000000000000000000000001: sab_piu2_ac_bus[AC_WIDTH-1:0] = entry0_piux_ac_bus[AC_WIDTH-1:0];
  24'b000000000000000000000010: sab_piu2_ac_bus[AC_WIDTH-1:0] = entry1_piux_ac_bus[AC_WIDTH-1:0];
  24'b000000000000000000000100: sab_piu2_ac_bus[AC_WIDTH-1:0] = entry2_piux_ac_bus[AC_WIDTH-1:0];
  24'b000000000000000000001000: sab_piu2_ac_bus[AC_WIDTH-1:0] = entry3_piux_ac_bus[AC_WIDTH-1:0];
  24'b000000000000000000010000: sab_piu2_ac_bus[AC_WIDTH-1:0] = entry4_piux_ac_bus[AC_WIDTH-1:0];
  24'b000000000000000000100000: sab_piu2_ac_bus[AC_WIDTH-1:0] = entry5_piux_ac_bus[AC_WIDTH-1:0];
  24'b000000000000000001000000: sab_piu2_ac_bus[AC_WIDTH-1:0] = entry6_piux_ac_bus[AC_WIDTH-1:0];
  24'b000000000000000010000000: sab_piu2_ac_bus[AC_WIDTH-1:0] = entry7_piux_ac_bus[AC_WIDTH-1:0];
  24'b000000000000000100000000: sab_piu2_ac_bus[AC_WIDTH-1:0] = entry8_piux_ac_bus[AC_WIDTH-1:0];
  24'b000000000000001000000000: sab_piu2_ac_bus[AC_WIDTH-1:0] = entry9_piux_ac_bus[AC_WIDTH-1:0];
  24'b000000000000010000000000: sab_piu2_ac_bus[AC_WIDTH-1:0] = entry10_piux_ac_bus[AC_WIDTH-1:0];
  24'b000000000000100000000000: sab_piu2_ac_bus[AC_WIDTH-1:0] = entry11_piux_ac_bus[AC_WIDTH-1:0];
  24'b000000000001000000000000: sab_piu2_ac_bus[AC_WIDTH-1:0] = entry12_piux_ac_bus[AC_WIDTH-1:0];
  24'b000000000010000000000000: sab_piu2_ac_bus[AC_WIDTH-1:0] = entry13_piux_ac_bus[AC_WIDTH-1:0];
  24'b000000000100000000000000: sab_piu2_ac_bus[AC_WIDTH-1:0] = entry14_piux_ac_bus[AC_WIDTH-1:0];
  24'b000000001000000000000000: sab_piu2_ac_bus[AC_WIDTH-1:0] = entry15_piux_ac_bus[AC_WIDTH-1:0];
  24'b000000010000000000000000: sab_piu2_ac_bus[AC_WIDTH-1:0] = entry16_piux_ac_bus[AC_WIDTH-1:0];
  24'b000000100000000000000000: sab_piu2_ac_bus[AC_WIDTH-1:0] = entry17_piux_ac_bus[AC_WIDTH-1:0];
  24'b000001000000000000000000: sab_piu2_ac_bus[AC_WIDTH-1:0] = entry18_piux_ac_bus[AC_WIDTH-1:0];
  24'b000010000000000000000000: sab_piu2_ac_bus[AC_WIDTH-1:0] = entry19_piux_ac_bus[AC_WIDTH-1:0];
  24'b000100000000000000000000: sab_piu2_ac_bus[AC_WIDTH-1:0] = entry20_piux_ac_bus[AC_WIDTH-1:0];
  24'b001000000000000000000000: sab_piu2_ac_bus[AC_WIDTH-1:0] = entry21_piux_ac_bus[AC_WIDTH-1:0];
  24'b010000000000000000000000: sab_piu2_ac_bus[AC_WIDTH-1:0] = entry22_piux_ac_bus[AC_WIDTH-1:0];
  24'b100000000000000000000000: sab_piu2_ac_bus[AC_WIDTH-1:0] = entry23_piux_ac_bus[AC_WIDTH-1:0];
  default                     : sab_piu2_ac_bus[AC_WIDTH-1:0] = {AC_WIDTH{1'bx}};
  endcase
// &CombEnd; @796
end

assign sab_piu2_ac_vld = |sab_piu2_ac_req[DEPTH-1:0];

assign piu2_ac_grant[DEPTH-1:0] = {DEPTH{sab_piu2_ac_grant}} & sab_piu2_ac_sel[DEPTH-1:0];

//--------------------------------------
//       PIU3_AC
//--------------------------------------
// &Force("nonport", "sab_piu3_ac_sel"); @806

assign sab_piu3_ac_req_vld[DEPTH-1:0] = sab_piu3_ac_req[DEPTH-1:0];

// &Instance("ct_ciu_snb_dp_sel", "x_ct_ciu_piu3_ac_dp_sel"); @810
ct_ciu_snb_dp_sel  x_ct_ciu_piu3_ac_dp_sel (
  .entry0_age_vect     (entry0_age_vect    ),
  .entry10_age_vect    (entry10_age_vect   ),
  .entry11_age_vect    (entry11_age_vect   ),
  .entry12_age_vect    (entry12_age_vect   ),
  .entry13_age_vect    (entry13_age_vect   ),
  .entry14_age_vect    (entry14_age_vect   ),
  .entry15_age_vect    (entry15_age_vect   ),
  .entry16_age_vect    (entry16_age_vect   ),
  .entry17_age_vect    (entry17_age_vect   ),
  .entry18_age_vect    (entry18_age_vect   ),
  .entry19_age_vect    (entry19_age_vect   ),
  .entry1_age_vect     (entry1_age_vect    ),
  .entry20_age_vect    (entry20_age_vect   ),
  .entry21_age_vect    (entry21_age_vect   ),
  .entry22_age_vect    (entry22_age_vect   ),
  .entry23_age_vect    (entry23_age_vect   ),
  .entry2_age_vect     (entry2_age_vect    ),
  .entry3_age_vect     (entry3_age_vect    ),
  .entry4_age_vect     (entry4_age_vect    ),
  .entry5_age_vect     (entry5_age_vect    ),
  .entry6_age_vect     (entry6_age_vect    ),
  .entry7_age_vect     (entry7_age_vect    ),
  .entry8_age_vect     (entry8_age_vect    ),
  .entry9_age_vect     (entry9_age_vect    ),
  .req_vld             (sab_piu3_ac_req_vld),
  .sel                 (sab_piu3_ac_sel    )
);

// &Connect( @811
//   .req_vld           (sab_piu3_ac_req_vld        ), @812
//   .sel               (sab_piu3_ac_sel            ) @813
// ); @814

// &CombBeg; @817
// &CombEnd; @829
// &CombBeg; @831
always @( entry9_piux_ac_bus[54:0]
       or entry14_piux_ac_bus[54:0]
       or entry5_piux_ac_bus[54:0]
       or entry13_piux_ac_bus[54:0]
       or entry7_piux_ac_bus[54:0]
       or entry15_piux_ac_bus[54:0]
       or entry2_piux_ac_bus[54:0]
       or entry4_piux_ac_bus[54:0]
       or entry20_piux_ac_bus[54:0]
       or entry12_piux_ac_bus[54:0]
       or entry18_piux_ac_bus[54:0]
       or entry11_piux_ac_bus[54:0]
       or entry16_piux_ac_bus[54:0]
       or entry0_piux_ac_bus[54:0]
       or entry6_piux_ac_bus[54:0]
       or entry17_piux_ac_bus[54:0]
       or entry21_piux_ac_bus[54:0]
       or entry8_piux_ac_bus[54:0]
       or entry19_piux_ac_bus[54:0]
       or entry23_piux_ac_bus[54:0]
       or entry22_piux_ac_bus[54:0]
       or entry3_piux_ac_bus[54:0]
       or entry1_piux_ac_bus[54:0]
       or sab_piu3_ac_sel[23:0]
       or entry10_piux_ac_bus[54:0])
begin
  case(sab_piu3_ac_sel[DEPTH-1:0])
  24'b000000000000000000000001: sab_piu3_ac_bus[AC_WIDTH-1:0] = entry0_piux_ac_bus[AC_WIDTH-1:0];
  24'b000000000000000000000010: sab_piu3_ac_bus[AC_WIDTH-1:0] = entry1_piux_ac_bus[AC_WIDTH-1:0];
  24'b000000000000000000000100: sab_piu3_ac_bus[AC_WIDTH-1:0] = entry2_piux_ac_bus[AC_WIDTH-1:0];
  24'b000000000000000000001000: sab_piu3_ac_bus[AC_WIDTH-1:0] = entry3_piux_ac_bus[AC_WIDTH-1:0];
  24'b000000000000000000010000: sab_piu3_ac_bus[AC_WIDTH-1:0] = entry4_piux_ac_bus[AC_WIDTH-1:0];
  24'b000000000000000000100000: sab_piu3_ac_bus[AC_WIDTH-1:0] = entry5_piux_ac_bus[AC_WIDTH-1:0];
  24'b000000000000000001000000: sab_piu3_ac_bus[AC_WIDTH-1:0] = entry6_piux_ac_bus[AC_WIDTH-1:0];
  24'b000000000000000010000000: sab_piu3_ac_bus[AC_WIDTH-1:0] = entry7_piux_ac_bus[AC_WIDTH-1:0];
  24'b000000000000000100000000: sab_piu3_ac_bus[AC_WIDTH-1:0] = entry8_piux_ac_bus[AC_WIDTH-1:0];
  24'b000000000000001000000000: sab_piu3_ac_bus[AC_WIDTH-1:0] = entry9_piux_ac_bus[AC_WIDTH-1:0];
  24'b000000000000010000000000: sab_piu3_ac_bus[AC_WIDTH-1:0] = entry10_piux_ac_bus[AC_WIDTH-1:0];
  24'b000000000000100000000000: sab_piu3_ac_bus[AC_WIDTH-1:0] = entry11_piux_ac_bus[AC_WIDTH-1:0];
  24'b000000000001000000000000: sab_piu3_ac_bus[AC_WIDTH-1:0] = entry12_piux_ac_bus[AC_WIDTH-1:0];
  24'b000000000010000000000000: sab_piu3_ac_bus[AC_WIDTH-1:0] = entry13_piux_ac_bus[AC_WIDTH-1:0];
  24'b000000000100000000000000: sab_piu3_ac_bus[AC_WIDTH-1:0] = entry14_piux_ac_bus[AC_WIDTH-1:0];
  24'b000000001000000000000000: sab_piu3_ac_bus[AC_WIDTH-1:0] = entry15_piux_ac_bus[AC_WIDTH-1:0];
  24'b000000010000000000000000: sab_piu3_ac_bus[AC_WIDTH-1:0] = entry16_piux_ac_bus[AC_WIDTH-1:0];
  24'b000000100000000000000000: sab_piu3_ac_bus[AC_WIDTH-1:0] = entry17_piux_ac_bus[AC_WIDTH-1:0];
  24'b000001000000000000000000: sab_piu3_ac_bus[AC_WIDTH-1:0] = entry18_piux_ac_bus[AC_WIDTH-1:0];
  24'b000010000000000000000000: sab_piu3_ac_bus[AC_WIDTH-1:0] = entry19_piux_ac_bus[AC_WIDTH-1:0];
  24'b000100000000000000000000: sab_piu3_ac_bus[AC_WIDTH-1:0] = entry20_piux_ac_bus[AC_WIDTH-1:0];
  24'b001000000000000000000000: sab_piu3_ac_bus[AC_WIDTH-1:0] = entry21_piux_ac_bus[AC_WIDTH-1:0];
  24'b010000000000000000000000: sab_piu3_ac_bus[AC_WIDTH-1:0] = entry22_piux_ac_bus[AC_WIDTH-1:0];
  24'b100000000000000000000000: sab_piu3_ac_bus[AC_WIDTH-1:0] = entry23_piux_ac_bus[AC_WIDTH-1:0];
  default                     : sab_piu3_ac_bus[AC_WIDTH-1:0] = {AC_WIDTH{1'bx}};
  endcase
// &CombEnd; @859
end

assign sab_piu3_ac_vld = |sab_piu3_ac_req[DEPTH-1:0];

assign piu3_ac_grant[DEPTH-1:0] = {DEPTH{sab_piu3_ac_grant}} & sab_piu3_ac_sel[DEPTH-1:0];


//================================================
//          l2C read port
//================================================
// &Force("nonport", "sab_l2c_sel"); @870
parameter L2C_ADDR_WIDTH  = 64;
parameter L2C_DATA_WIDTH  = 512;

assign l2c_grant[DEPTH-1:0] = sab_l2c_sel[DEPTH-1:0] & {DEPTH{arb_sab_l2c_grant}};

// &Instance("ct_ciu_snb_dp_sel", "x_ct_ciu_l2c_dp_sel"); @876
ct_ciu_snb_dp_sel  x_ct_ciu_l2c_dp_sel (
  .entry0_age_vect  (entry0_age_vect ),
  .entry10_age_vect (entry10_age_vect),
  .entry11_age_vect (entry11_age_vect),
  .entry12_age_vect (entry12_age_vect),
  .entry13_age_vect (entry13_age_vect),
  .entry14_age_vect (entry14_age_vect),
  .entry15_age_vect (entry15_age_vect),
  .entry16_age_vect (entry16_age_vect),
  .entry17_age_vect (entry17_age_vect),
  .entry18_age_vect (entry18_age_vect),
  .entry19_age_vect (entry19_age_vect),
  .entry1_age_vect  (entry1_age_vect ),
  .entry20_age_vect (entry20_age_vect),
  .entry21_age_vect (entry21_age_vect),
  .entry22_age_vect (entry22_age_vect),
  .entry23_age_vect (entry23_age_vect),
  .entry2_age_vect  (entry2_age_vect ),
  .entry3_age_vect  (entry3_age_vect ),
  .entry4_age_vect  (entry4_age_vect ),
  .entry5_age_vect  (entry5_age_vect ),
  .entry6_age_vect  (entry6_age_vect ),
  .entry7_age_vect  (entry7_age_vect ),
  .entry8_age_vect  (entry8_age_vect ),
  .entry9_age_vect  (entry9_age_vect ),
  .req_vld          (sab_l2c_req     ),
  .sel              (sab_l2c_sel     )
);

// &Connect( @877
//   .req_vld           (sab_l2c_req           ), @878
//   .sel               (sab_l2c_sel           ) @879
// ); @880

assign sab_arb_l2c_req = |sab_l2c_req[DEPTH-1:0];
assign sab_arb_l2c_sel[DEPTH-1:0] = sab_l2c_sel[DEPTH-1:0];

// &CombBeg; @886
// &CombEnd; @898
// &CombBeg; @899
// &CombEnd; @911
// &CombBeg; @912
// &CombEnd; @924
// &CombBeg; @926
always @( entry13_l2c_addr_bus[63:0]
       or entry8_l2c_addr_bus[63:0]
       or entry9_l2c_addr_bus[63:0]
       or entry10_l2c_addr_bus[63:0]
       or entry3_l2c_addr_bus[63:0]
       or entry7_l2c_addr_bus[63:0]
       or entry11_l2c_addr_bus[63:0]
       or entry2_l2c_addr_bus[63:0]
       or entry4_l2c_addr_bus[63:0]
       or entry5_l2c_addr_bus[63:0]
       or entry15_l2c_addr_bus[63:0]
       or sab_l2c_sel[23:0]
       or entry20_l2c_addr_bus[63:0]
       or entry17_l2c_addr_bus[63:0]
       or entry23_l2c_addr_bus[63:0]
       or entry12_l2c_addr_bus[63:0]
       or entry1_l2c_addr_bus[63:0]
       or entry16_l2c_addr_bus[63:0]
       or entry19_l2c_addr_bus[63:0]
       or entry18_l2c_addr_bus[63:0]
       or entry6_l2c_addr_bus[63:0]
       or entry22_l2c_addr_bus[63:0]
       or entry14_l2c_addr_bus[63:0]
       or entry21_l2c_addr_bus[63:0]
       or entry0_l2c_addr_bus[63:0])
begin
  case(sab_l2c_sel[DEPTH-1:0])
  24'b000000000000000000000001: sab_arb_l2c_addr_bus[L2C_ADDR_WIDTH-1:0] = entry0_l2c_addr_bus[L2C_ADDR_WIDTH-1:0];
  24'b000000000000000000000010: sab_arb_l2c_addr_bus[L2C_ADDR_WIDTH-1:0] = entry1_l2c_addr_bus[L2C_ADDR_WIDTH-1:0];
  24'b000000000000000000000100: sab_arb_l2c_addr_bus[L2C_ADDR_WIDTH-1:0] = entry2_l2c_addr_bus[L2C_ADDR_WIDTH-1:0];
  24'b000000000000000000001000: sab_arb_l2c_addr_bus[L2C_ADDR_WIDTH-1:0] = entry3_l2c_addr_bus[L2C_ADDR_WIDTH-1:0];
  24'b000000000000000000010000: sab_arb_l2c_addr_bus[L2C_ADDR_WIDTH-1:0] = entry4_l2c_addr_bus[L2C_ADDR_WIDTH-1:0];
  24'b000000000000000000100000: sab_arb_l2c_addr_bus[L2C_ADDR_WIDTH-1:0] = entry5_l2c_addr_bus[L2C_ADDR_WIDTH-1:0];
  24'b000000000000000001000000: sab_arb_l2c_addr_bus[L2C_ADDR_WIDTH-1:0] = entry6_l2c_addr_bus[L2C_ADDR_WIDTH-1:0];
  24'b000000000000000010000000: sab_arb_l2c_addr_bus[L2C_ADDR_WIDTH-1:0] = entry7_l2c_addr_bus[L2C_ADDR_WIDTH-1:0];
  24'b000000000000000100000000: sab_arb_l2c_addr_bus[L2C_ADDR_WIDTH-1:0] = entry8_l2c_addr_bus[L2C_ADDR_WIDTH-1:0];
  24'b000000000000001000000000: sab_arb_l2c_addr_bus[L2C_ADDR_WIDTH-1:0] = entry9_l2c_addr_bus[L2C_ADDR_WIDTH-1:0];
  24'b000000000000010000000000: sab_arb_l2c_addr_bus[L2C_ADDR_WIDTH-1:0] = entry10_l2c_addr_bus[L2C_ADDR_WIDTH-1:0];
  24'b000000000000100000000000: sab_arb_l2c_addr_bus[L2C_ADDR_WIDTH-1:0] = entry11_l2c_addr_bus[L2C_ADDR_WIDTH-1:0];
  24'b000000000001000000000000: sab_arb_l2c_addr_bus[L2C_ADDR_WIDTH-1:0] = entry12_l2c_addr_bus[L2C_ADDR_WIDTH-1:0];
  24'b000000000010000000000000: sab_arb_l2c_addr_bus[L2C_ADDR_WIDTH-1:0] = entry13_l2c_addr_bus[L2C_ADDR_WIDTH-1:0];
  24'b000000000100000000000000: sab_arb_l2c_addr_bus[L2C_ADDR_WIDTH-1:0] = entry14_l2c_addr_bus[L2C_ADDR_WIDTH-1:0];
  24'b000000001000000000000000: sab_arb_l2c_addr_bus[L2C_ADDR_WIDTH-1:0] = entry15_l2c_addr_bus[L2C_ADDR_WIDTH-1:0];
  24'b000000010000000000000000: sab_arb_l2c_addr_bus[L2C_ADDR_WIDTH-1:0] = entry16_l2c_addr_bus[L2C_ADDR_WIDTH-1:0];
  24'b000000100000000000000000: sab_arb_l2c_addr_bus[L2C_ADDR_WIDTH-1:0] = entry17_l2c_addr_bus[L2C_ADDR_WIDTH-1:0];
  24'b000001000000000000000000: sab_arb_l2c_addr_bus[L2C_ADDR_WIDTH-1:0] = entry18_l2c_addr_bus[L2C_ADDR_WIDTH-1:0];
  24'b000010000000000000000000: sab_arb_l2c_addr_bus[L2C_ADDR_WIDTH-1:0] = entry19_l2c_addr_bus[L2C_ADDR_WIDTH-1:0];
  24'b000100000000000000000000: sab_arb_l2c_addr_bus[L2C_ADDR_WIDTH-1:0] = entry20_l2c_addr_bus[L2C_ADDR_WIDTH-1:0];
  24'b001000000000000000000000: sab_arb_l2c_addr_bus[L2C_ADDR_WIDTH-1:0] = entry21_l2c_addr_bus[L2C_ADDR_WIDTH-1:0];
  24'b010000000000000000000000: sab_arb_l2c_addr_bus[L2C_ADDR_WIDTH-1:0] = entry22_l2c_addr_bus[L2C_ADDR_WIDTH-1:0];
  24'b100000000000000000000000: sab_arb_l2c_addr_bus[L2C_ADDR_WIDTH-1:0] = entry23_l2c_addr_bus[L2C_ADDR_WIDTH-1:0];
  default                     : sab_arb_l2c_addr_bus[L2C_ADDR_WIDTH-1:0] = {L2C_ADDR_WIDTH{1'bx}};
  endcase
// &CombEnd; @954
end

// &CombBeg; @956
always @( entry14_l2c_hpcp_bus[2:0]
       or entry7_l2c_hpcp_bus[2:0]
       or entry18_l2c_hpcp_bus[2:0]
       or entry11_l2c_hpcp_bus[2:0]
       or entry0_l2c_hpcp_bus[2:0]
       or entry19_l2c_hpcp_bus[2:0]
       or entry9_l2c_hpcp_bus[2:0]
       or entry13_l2c_hpcp_bus[2:0]
       or sab_l2c_sel[23:0]
       or entry10_l2c_hpcp_bus[2:0]
       or entry23_l2c_hpcp_bus[2:0]
       or entry2_l2c_hpcp_bus[2:0]
       or entry17_l2c_hpcp_bus[2:0]
       or entry6_l2c_hpcp_bus[2:0]
       or entry20_l2c_hpcp_bus[2:0]
       or entry3_l2c_hpcp_bus[2:0]
       or entry5_l2c_hpcp_bus[2:0]
       or entry4_l2c_hpcp_bus[2:0]
       or entry1_l2c_hpcp_bus[2:0]
       or entry15_l2c_hpcp_bus[2:0]
       or entry16_l2c_hpcp_bus[2:0]
       or entry21_l2c_hpcp_bus[2:0]
       or entry12_l2c_hpcp_bus[2:0]
       or entry22_l2c_hpcp_bus[2:0]
       or entry8_l2c_hpcp_bus[2:0])
begin
  case(sab_l2c_sel[DEPTH-1:0])
  24'b000000000000000000000001: sab_arb_l2c_hpcp_bus[2:0] =  entry0_l2c_hpcp_bus[2:0];
  24'b000000000000000000000010: sab_arb_l2c_hpcp_bus[2:0] =  entry1_l2c_hpcp_bus[2:0];
  24'b000000000000000000000100: sab_arb_l2c_hpcp_bus[2:0] =  entry2_l2c_hpcp_bus[2:0];
  24'b000000000000000000001000: sab_arb_l2c_hpcp_bus[2:0] =  entry3_l2c_hpcp_bus[2:0];
  24'b000000000000000000010000: sab_arb_l2c_hpcp_bus[2:0] =  entry4_l2c_hpcp_bus[2:0];
  24'b000000000000000000100000: sab_arb_l2c_hpcp_bus[2:0] =  entry5_l2c_hpcp_bus[2:0];
  24'b000000000000000001000000: sab_arb_l2c_hpcp_bus[2:0] =  entry6_l2c_hpcp_bus[2:0];
  24'b000000000000000010000000: sab_arb_l2c_hpcp_bus[2:0] =  entry7_l2c_hpcp_bus[2:0];
  24'b000000000000000100000000: sab_arb_l2c_hpcp_bus[2:0] =  entry8_l2c_hpcp_bus[2:0];
  24'b000000000000001000000000: sab_arb_l2c_hpcp_bus[2:0] =  entry9_l2c_hpcp_bus[2:0];
  24'b000000000000010000000000: sab_arb_l2c_hpcp_bus[2:0] = entry10_l2c_hpcp_bus[2:0];
  24'b000000000000100000000000: sab_arb_l2c_hpcp_bus[2:0] = entry11_l2c_hpcp_bus[2:0];
  24'b000000000001000000000000: sab_arb_l2c_hpcp_bus[2:0] = entry12_l2c_hpcp_bus[2:0];
  24'b000000000010000000000000: sab_arb_l2c_hpcp_bus[2:0] = entry13_l2c_hpcp_bus[2:0];
  24'b000000000100000000000000: sab_arb_l2c_hpcp_bus[2:0] = entry14_l2c_hpcp_bus[2:0];
  24'b000000001000000000000000: sab_arb_l2c_hpcp_bus[2:0] = entry15_l2c_hpcp_bus[2:0];
  24'b000000010000000000000000: sab_arb_l2c_hpcp_bus[2:0] = entry16_l2c_hpcp_bus[2:0];
  24'b000000100000000000000000: sab_arb_l2c_hpcp_bus[2:0] = entry17_l2c_hpcp_bus[2:0];
  24'b000001000000000000000000: sab_arb_l2c_hpcp_bus[2:0] = entry18_l2c_hpcp_bus[2:0];
  24'b000010000000000000000000: sab_arb_l2c_hpcp_bus[2:0] = entry19_l2c_hpcp_bus[2:0];
  24'b000100000000000000000000: sab_arb_l2c_hpcp_bus[2:0] = entry20_l2c_hpcp_bus[2:0];
  24'b001000000000000000000000: sab_arb_l2c_hpcp_bus[2:0] = entry21_l2c_hpcp_bus[2:0];
  24'b010000000000000000000000: sab_arb_l2c_hpcp_bus[2:0] = entry22_l2c_hpcp_bus[2:0];
  24'b100000000000000000000000: sab_arb_l2c_hpcp_bus[2:0] = entry23_l2c_hpcp_bus[2:0];
  default                     : sab_arb_l2c_hpcp_bus[2:0] = {3{1'bx}};
  endcase
// &CombEnd; @984
end

// &CombBeg; @986
always @( entry10_l2c_data_bus[511:0]
       or entry11_l2c_data_bus[511:0]
       or entry21_l2c_data_bus[511:0]
       or entry2_l2c_data_bus[511:0]
       or entry16_l2c_data_bus[511:0]
       or entry20_l2c_data_bus[511:0]
       or entry17_l2c_data_bus[511:0]
       or entry14_l2c_data_bus[511:0]
       or entry8_l2c_data_bus[511:0]
       or entry15_l2c_data_bus[511:0]
       or entry18_l2c_data_bus[511:0]
       or entry5_l2c_data_bus[511:0]
       or entry6_l2c_data_bus[511:0]
       or entry23_l2c_data_bus[511:0]
       or entry19_l2c_data_bus[511:0]
       or entry0_l2c_data_bus[511:0]
       or entry22_l2c_data_bus[511:0]
       or entry4_l2c_data_bus[511:0]
       or entry12_l2c_data_bus[511:0]
       or arb_sdb_l2c_sel[23:0]
       or entry1_l2c_data_bus[511:0]
       or entry3_l2c_data_bus[511:0]
       or entry9_l2c_data_bus[511:0]
       or entry13_l2c_data_bus[511:0]
       or entry7_l2c_data_bus[511:0])
begin
  case(arb_sdb_l2c_sel[DEPTH-1:0])
  24'b000000000000000000000001: sdb_arb_l2c_data_bus[L2C_DATA_WIDTH-1:0] =  entry0_l2c_data_bus[L2C_DATA_WIDTH-1:0];
  24'b000000000000000000000010: sdb_arb_l2c_data_bus[L2C_DATA_WIDTH-1:0] =  entry1_l2c_data_bus[L2C_DATA_WIDTH-1:0];
  24'b000000000000000000000100: sdb_arb_l2c_data_bus[L2C_DATA_WIDTH-1:0] =  entry2_l2c_data_bus[L2C_DATA_WIDTH-1:0];
  24'b000000000000000000001000: sdb_arb_l2c_data_bus[L2C_DATA_WIDTH-1:0] =  entry3_l2c_data_bus[L2C_DATA_WIDTH-1:0];
  24'b000000000000000000010000: sdb_arb_l2c_data_bus[L2C_DATA_WIDTH-1:0] =  entry4_l2c_data_bus[L2C_DATA_WIDTH-1:0];
  24'b000000000000000000100000: sdb_arb_l2c_data_bus[L2C_DATA_WIDTH-1:0] =  entry5_l2c_data_bus[L2C_DATA_WIDTH-1:0];
  24'b000000000000000001000000: sdb_arb_l2c_data_bus[L2C_DATA_WIDTH-1:0] =  entry6_l2c_data_bus[L2C_DATA_WIDTH-1:0];
  24'b000000000000000010000000: sdb_arb_l2c_data_bus[L2C_DATA_WIDTH-1:0] =  entry7_l2c_data_bus[L2C_DATA_WIDTH-1:0];
  24'b000000000000000100000000: sdb_arb_l2c_data_bus[L2C_DATA_WIDTH-1:0] =  entry8_l2c_data_bus[L2C_DATA_WIDTH-1:0];
  24'b000000000000001000000000: sdb_arb_l2c_data_bus[L2C_DATA_WIDTH-1:0] =  entry9_l2c_data_bus[L2C_DATA_WIDTH-1:0];
  24'b000000000000010000000000: sdb_arb_l2c_data_bus[L2C_DATA_WIDTH-1:0] = entry10_l2c_data_bus[L2C_DATA_WIDTH-1:0];
  24'b000000000000100000000000: sdb_arb_l2c_data_bus[L2C_DATA_WIDTH-1:0] = entry11_l2c_data_bus[L2C_DATA_WIDTH-1:0];
  24'b000000000001000000000000: sdb_arb_l2c_data_bus[L2C_DATA_WIDTH-1:0] = entry12_l2c_data_bus[L2C_DATA_WIDTH-1:0];
  24'b000000000010000000000000: sdb_arb_l2c_data_bus[L2C_DATA_WIDTH-1:0] = entry13_l2c_data_bus[L2C_DATA_WIDTH-1:0];
  24'b000000000100000000000000: sdb_arb_l2c_data_bus[L2C_DATA_WIDTH-1:0] = entry14_l2c_data_bus[L2C_DATA_WIDTH-1:0];
  24'b000000001000000000000000: sdb_arb_l2c_data_bus[L2C_DATA_WIDTH-1:0] = entry15_l2c_data_bus[L2C_DATA_WIDTH-1:0];
  24'b000000010000000000000000: sdb_arb_l2c_data_bus[L2C_DATA_WIDTH-1:0] = entry16_l2c_data_bus[L2C_DATA_WIDTH-1:0];
  24'b000000100000000000000000: sdb_arb_l2c_data_bus[L2C_DATA_WIDTH-1:0] = entry17_l2c_data_bus[L2C_DATA_WIDTH-1:0];
  24'b000001000000000000000000: sdb_arb_l2c_data_bus[L2C_DATA_WIDTH-1:0] = entry18_l2c_data_bus[L2C_DATA_WIDTH-1:0];
  24'b000010000000000000000000: sdb_arb_l2c_data_bus[L2C_DATA_WIDTH-1:0] = entry19_l2c_data_bus[L2C_DATA_WIDTH-1:0];
  24'b000100000000000000000000: sdb_arb_l2c_data_bus[L2C_DATA_WIDTH-1:0] = entry20_l2c_data_bus[L2C_DATA_WIDTH-1:0];
  24'b001000000000000000000000: sdb_arb_l2c_data_bus[L2C_DATA_WIDTH-1:0] = entry21_l2c_data_bus[L2C_DATA_WIDTH-1:0];
  24'b010000000000000000000000: sdb_arb_l2c_data_bus[L2C_DATA_WIDTH-1:0] = entry22_l2c_data_bus[L2C_DATA_WIDTH-1:0];
  24'b100000000000000000000000: sdb_arb_l2c_data_bus[L2C_DATA_WIDTH-1:0] = entry23_l2c_data_bus[L2C_DATA_WIDTH-1:0];
  default                     : sdb_arb_l2c_data_bus[L2C_DATA_WIDTH-1:0] = {L2C_DATA_WIDTH{1'bx}};
  endcase
// &CombEnd; @1014
end
//================================================
//      ebiu w read port
//================================================
// &Force("nonport", "sab_ebiu_wt_sel"); @1019
parameter EBIU_AR_WIDTH = 69;
parameter EBIU_AW_WIDTH = 68;
parameter EBIU_D_WIDTH = 535;

assign sab_ebiuw_req_vld[DEPTH-1:0] = sab_ebiuw_req[DEPTH-1:0];

// &Instance("ct_ciu_snb_dp_sel", "x_ct_ciu_ebiu_wt_dp_sel"); @1026
ct_ciu_snb_dp_sel  x_ct_ciu_ebiu_wt_dp_sel (
  .entry0_age_vect   (entry0_age_vect  ),
  .entry10_age_vect  (entry10_age_vect ),
  .entry11_age_vect  (entry11_age_vect ),
  .entry12_age_vect  (entry12_age_vect ),
  .entry13_age_vect  (entry13_age_vect ),
  .entry14_age_vect  (entry14_age_vect ),
  .entry15_age_vect  (entry15_age_vect ),
  .entry16_age_vect  (entry16_age_vect ),
  .entry17_age_vect  (entry17_age_vect ),
  .entry18_age_vect  (entry18_age_vect ),
  .entry19_age_vect  (entry19_age_vect ),
  .entry1_age_vect   (entry1_age_vect  ),
  .entry20_age_vect  (entry20_age_vect ),
  .entry21_age_vect  (entry21_age_vect ),
  .entry22_age_vect  (entry22_age_vect ),
  .entry23_age_vect  (entry23_age_vect ),
  .entry2_age_vect   (entry2_age_vect  ),
  .entry3_age_vect   (entry3_age_vect  ),
  .entry4_age_vect   (entry4_age_vect  ),
  .entry5_age_vect   (entry5_age_vect  ),
  .entry6_age_vect   (entry6_age_vect  ),
  .entry7_age_vect   (entry7_age_vect  ),
  .entry8_age_vect   (entry8_age_vect  ),
  .entry9_age_vect   (entry9_age_vect  ),
  .req_vld           (sab_ebiuw_req_vld),
  .sel               (sab_ebiu_wt_sel  )
);

// &Connect( @1027
//   .req_vld           (sab_ebiuw_req_vld     ), @1028
//   .sel               (sab_ebiu_wt_sel       ) @1029
// ); @1030

// &CombBeg; @1033
// &CombEnd; @1045
// &CombBeg; @1047
// &CombEnd; @1059
// &CombBeg; @1061
always @( entry16_ebiu_awbus[67:0]
       or entry21_ebiu_awbus[67:0]
       or entry17_ebiu_awbus[67:0]
       or entry8_ebiu_awbus[67:0]
       or entry4_ebiu_awbus[67:0]
       or entry2_ebiu_awbus[67:0]
       or entry5_ebiu_awbus[67:0]
       or entry19_ebiu_awbus[67:0]
       or entry6_ebiu_awbus[67:0]
       or sab_ebiu_wt_sel[23:0]
       or entry10_ebiu_awbus[67:0]
       or entry18_ebiu_awbus[67:0]
       or entry3_ebiu_awbus[67:0]
       or entry13_ebiu_awbus[67:0]
       or entry7_ebiu_awbus[67:0]
       or entry9_ebiu_awbus[67:0]
       or entry22_ebiu_awbus[67:0]
       or entry20_ebiu_awbus[67:0]
       or entry23_ebiu_awbus[67:0]
       or entry1_ebiu_awbus[67:0]
       or entry11_ebiu_awbus[67:0]
       or entry15_ebiu_awbus[67:0]
       or entry0_ebiu_awbus[67:0]
       or entry12_ebiu_awbus[67:0]
       or entry14_ebiu_awbus[67:0])
begin
  case(sab_ebiu_wt_sel[DEPTH-1:0])
  24'b000000000000000000000001: sab_arb_ebiu_aw_bus[EBIU_AW_WIDTH-1:0] =  entry0_ebiu_awbus[EBIU_AW_WIDTH-1:0];
  24'b000000000000000000000010: sab_arb_ebiu_aw_bus[EBIU_AW_WIDTH-1:0] =  entry1_ebiu_awbus[EBIU_AW_WIDTH-1:0];
  24'b000000000000000000000100: sab_arb_ebiu_aw_bus[EBIU_AW_WIDTH-1:0] =  entry2_ebiu_awbus[EBIU_AW_WIDTH-1:0];
  24'b000000000000000000001000: sab_arb_ebiu_aw_bus[EBIU_AW_WIDTH-1:0] =  entry3_ebiu_awbus[EBIU_AW_WIDTH-1:0];
  24'b000000000000000000010000: sab_arb_ebiu_aw_bus[EBIU_AW_WIDTH-1:0] =  entry4_ebiu_awbus[EBIU_AW_WIDTH-1:0];
  24'b000000000000000000100000: sab_arb_ebiu_aw_bus[EBIU_AW_WIDTH-1:0] =  entry5_ebiu_awbus[EBIU_AW_WIDTH-1:0];
  24'b000000000000000001000000: sab_arb_ebiu_aw_bus[EBIU_AW_WIDTH-1:0] =  entry6_ebiu_awbus[EBIU_AW_WIDTH-1:0];
  24'b000000000000000010000000: sab_arb_ebiu_aw_bus[EBIU_AW_WIDTH-1:0] =  entry7_ebiu_awbus[EBIU_AW_WIDTH-1:0];
  24'b000000000000000100000000: sab_arb_ebiu_aw_bus[EBIU_AW_WIDTH-1:0] =  entry8_ebiu_awbus[EBIU_AW_WIDTH-1:0];
  24'b000000000000001000000000: sab_arb_ebiu_aw_bus[EBIU_AW_WIDTH-1:0] =  entry9_ebiu_awbus[EBIU_AW_WIDTH-1:0];
  24'b000000000000010000000000: sab_arb_ebiu_aw_bus[EBIU_AW_WIDTH-1:0] = entry10_ebiu_awbus[EBIU_AW_WIDTH-1:0];
  24'b000000000000100000000000: sab_arb_ebiu_aw_bus[EBIU_AW_WIDTH-1:0] = entry11_ebiu_awbus[EBIU_AW_WIDTH-1:0];
  24'b000000000001000000000000: sab_arb_ebiu_aw_bus[EBIU_AW_WIDTH-1:0] = entry12_ebiu_awbus[EBIU_AW_WIDTH-1:0];
  24'b000000000010000000000000: sab_arb_ebiu_aw_bus[EBIU_AW_WIDTH-1:0] = entry13_ebiu_awbus[EBIU_AW_WIDTH-1:0];
  24'b000000000100000000000000: sab_arb_ebiu_aw_bus[EBIU_AW_WIDTH-1:0] = entry14_ebiu_awbus[EBIU_AW_WIDTH-1:0];
  24'b000000001000000000000000: sab_arb_ebiu_aw_bus[EBIU_AW_WIDTH-1:0] = entry15_ebiu_awbus[EBIU_AW_WIDTH-1:0];
  24'b000000010000000000000000: sab_arb_ebiu_aw_bus[EBIU_AW_WIDTH-1:0] = entry16_ebiu_awbus[EBIU_AW_WIDTH-1:0];
  24'b000000100000000000000000: sab_arb_ebiu_aw_bus[EBIU_AW_WIDTH-1:0] = entry17_ebiu_awbus[EBIU_AW_WIDTH-1:0];
  24'b000001000000000000000000: sab_arb_ebiu_aw_bus[EBIU_AW_WIDTH-1:0] = entry18_ebiu_awbus[EBIU_AW_WIDTH-1:0];
  24'b000010000000000000000000: sab_arb_ebiu_aw_bus[EBIU_AW_WIDTH-1:0] = entry19_ebiu_awbus[EBIU_AW_WIDTH-1:0];
  24'b000100000000000000000000: sab_arb_ebiu_aw_bus[EBIU_AW_WIDTH-1:0] = entry20_ebiu_awbus[EBIU_AW_WIDTH-1:0];
  24'b001000000000000000000000: sab_arb_ebiu_aw_bus[EBIU_AW_WIDTH-1:0] = entry21_ebiu_awbus[EBIU_AW_WIDTH-1:0];
  24'b010000000000000000000000: sab_arb_ebiu_aw_bus[EBIU_AW_WIDTH-1:0] = entry22_ebiu_awbus[EBIU_AW_WIDTH-1:0];
  24'b100000000000000000000000: sab_arb_ebiu_aw_bus[EBIU_AW_WIDTH-1:0] = entry23_ebiu_awbus[EBIU_AW_WIDTH-1:0];
  default                     : sab_arb_ebiu_aw_bus[EBIU_AW_WIDTH-1:0] = {EBIU_AW_WIDTH{1'bx}};
  endcase
// &CombEnd; @1089
end

// &CombBeg; @1091
always @( entry6_ebiu_mid[2:0]
       or entry1_ebiu_mid[2:0]
       or entry14_ebiu_mid[2:0]
       or entry3_ebiu_mid[2:0]
       or sab_ebiu_wt_sel[23:0]
       or entry18_ebiu_mid[2:0]
       or entry5_ebiu_mid[2:0]
       or entry10_ebiu_mid[2:0]
       or entry16_ebiu_mid[2:0]
       or entry23_ebiu_mid[2:0]
       or entry17_ebiu_mid[2:0]
       or entry8_ebiu_mid[2:0]
       or entry12_ebiu_mid[2:0]
       or entry0_ebiu_mid[2:0]
       or entry4_ebiu_mid[2:0]
       or entry20_ebiu_mid[2:0]
       or entry19_ebiu_mid[2:0]
       or entry2_ebiu_mid[2:0]
       or entry9_ebiu_mid[2:0]
       or entry13_ebiu_mid[2:0]
       or entry11_ebiu_mid[2:0]
       or entry7_ebiu_mid[2:0]
       or entry22_ebiu_mid[2:0]
       or entry21_ebiu_mid[2:0]
       or entry15_ebiu_mid[2:0])
begin
  case(sab_ebiu_wt_sel[DEPTH-1:0])
  24'b000000000000000000000001: sab_arb_ebiu_aw_mid[2:0] =  entry0_ebiu_mid[2:0];
  24'b000000000000000000000010: sab_arb_ebiu_aw_mid[2:0] =  entry1_ebiu_mid[2:0];
  24'b000000000000000000000100: sab_arb_ebiu_aw_mid[2:0] =  entry2_ebiu_mid[2:0];
  24'b000000000000000000001000: sab_arb_ebiu_aw_mid[2:0] =  entry3_ebiu_mid[2:0];
  24'b000000000000000000010000: sab_arb_ebiu_aw_mid[2:0] =  entry4_ebiu_mid[2:0];
  24'b000000000000000000100000: sab_arb_ebiu_aw_mid[2:0] =  entry5_ebiu_mid[2:0];
  24'b000000000000000001000000: sab_arb_ebiu_aw_mid[2:0] =  entry6_ebiu_mid[2:0];
  24'b000000000000000010000000: sab_arb_ebiu_aw_mid[2:0] =  entry7_ebiu_mid[2:0];
  24'b000000000000000100000000: sab_arb_ebiu_aw_mid[2:0] =  entry8_ebiu_mid[2:0];
  24'b000000000000001000000000: sab_arb_ebiu_aw_mid[2:0] =  entry9_ebiu_mid[2:0];
  24'b000000000000010000000000: sab_arb_ebiu_aw_mid[2:0] = entry10_ebiu_mid[2:0];
  24'b000000000000100000000000: sab_arb_ebiu_aw_mid[2:0] = entry11_ebiu_mid[2:0];
  24'b000000000001000000000000: sab_arb_ebiu_aw_mid[2:0] = entry12_ebiu_mid[2:0];
  24'b000000000010000000000000: sab_arb_ebiu_aw_mid[2:0] = entry13_ebiu_mid[2:0];
  24'b000000000100000000000000: sab_arb_ebiu_aw_mid[2:0] = entry14_ebiu_mid[2:0];
  24'b000000001000000000000000: sab_arb_ebiu_aw_mid[2:0] = entry15_ebiu_mid[2:0];
  24'b000000010000000000000000: sab_arb_ebiu_aw_mid[2:0] = entry16_ebiu_mid[2:0];
  24'b000000100000000000000000: sab_arb_ebiu_aw_mid[2:0] = entry17_ebiu_mid[2:0];
  24'b000001000000000000000000: sab_arb_ebiu_aw_mid[2:0] = entry18_ebiu_mid[2:0];
  24'b000010000000000000000000: sab_arb_ebiu_aw_mid[2:0] = entry19_ebiu_mid[2:0];
  24'b000100000000000000000000: sab_arb_ebiu_aw_mid[2:0] = entry20_ebiu_mid[2:0];
  24'b001000000000000000000000: sab_arb_ebiu_aw_mid[2:0] = entry21_ebiu_mid[2:0];
  24'b010000000000000000000000: sab_arb_ebiu_aw_mid[2:0] = entry22_ebiu_mid[2:0];
  24'b100000000000000000000000: sab_arb_ebiu_aw_mid[2:0] = entry23_ebiu_mid[2:0];
  default                     : sab_arb_ebiu_aw_mid[2:0] = {3{1'bx}};
  endcase
// &CombEnd; @1119
end

assign sab_arb_ebiu_aw_req = |sab_ebiuw_req_vld[DEPTH-1:0];
assign sab_arb_ebiu_aw_sel[DEPTH-1:0] = sab_ebiu_wt_sel[DEPTH-1:0];

// &CombBeg; @1126
// &CombEnd; @1138
// &CombBeg; @1140
always @( entry23_ebiu_dbus[534:0]
       or entry10_ebiu_dbus[534:0]
       or entry7_ebiu_dbus[534:0]
       or entry15_ebiu_dbus[534:0]
       or entry8_ebiu_dbus[534:0]
       or arb_sdb_ebiu_sel[23:0]
       or entry20_ebiu_dbus[534:0]
       or entry1_ebiu_dbus[534:0]
       or entry3_ebiu_dbus[534:0]
       or entry18_ebiu_dbus[534:0]
       or entry12_ebiu_dbus[534:0]
       or entry16_ebiu_dbus[534:0]
       or entry14_ebiu_dbus[534:0]
       or entry21_ebiu_dbus[534:0]
       or entry17_ebiu_dbus[534:0]
       or entry9_ebiu_dbus[534:0]
       or entry5_ebiu_dbus[534:0]
       or entry0_ebiu_dbus[534:0]
       or entry19_ebiu_dbus[534:0]
       or entry2_ebiu_dbus[534:0]
       or entry22_ebiu_dbus[534:0]
       or entry6_ebiu_dbus[534:0]
       or entry11_ebiu_dbus[534:0]
       or entry4_ebiu_dbus[534:0]
       or entry13_ebiu_dbus[534:0])
begin
  case(arb_sdb_ebiu_sel[DEPTH-1:0])
  24'b000000000000000000000001: sdb_arb_ebiu_w_bus[EBIU_D_WIDTH-1:0] =  entry0_ebiu_dbus[EBIU_D_WIDTH-1:0];
  24'b000000000000000000000010: sdb_arb_ebiu_w_bus[EBIU_D_WIDTH-1:0] =  entry1_ebiu_dbus[EBIU_D_WIDTH-1:0];
  24'b000000000000000000000100: sdb_arb_ebiu_w_bus[EBIU_D_WIDTH-1:0] =  entry2_ebiu_dbus[EBIU_D_WIDTH-1:0];
  24'b000000000000000000001000: sdb_arb_ebiu_w_bus[EBIU_D_WIDTH-1:0] =  entry3_ebiu_dbus[EBIU_D_WIDTH-1:0];
  24'b000000000000000000010000: sdb_arb_ebiu_w_bus[EBIU_D_WIDTH-1:0] =  entry4_ebiu_dbus[EBIU_D_WIDTH-1:0];
  24'b000000000000000000100000: sdb_arb_ebiu_w_bus[EBIU_D_WIDTH-1:0] =  entry5_ebiu_dbus[EBIU_D_WIDTH-1:0];
  24'b000000000000000001000000: sdb_arb_ebiu_w_bus[EBIU_D_WIDTH-1:0] =  entry6_ebiu_dbus[EBIU_D_WIDTH-1:0];
  24'b000000000000000010000000: sdb_arb_ebiu_w_bus[EBIU_D_WIDTH-1:0] =  entry7_ebiu_dbus[EBIU_D_WIDTH-1:0];
  24'b000000000000000100000000: sdb_arb_ebiu_w_bus[EBIU_D_WIDTH-1:0] =  entry8_ebiu_dbus[EBIU_D_WIDTH-1:0];
  24'b000000000000001000000000: sdb_arb_ebiu_w_bus[EBIU_D_WIDTH-1:0] =  entry9_ebiu_dbus[EBIU_D_WIDTH-1:0];
  24'b000000000000010000000000: sdb_arb_ebiu_w_bus[EBIU_D_WIDTH-1:0] = entry10_ebiu_dbus[EBIU_D_WIDTH-1:0];
  24'b000000000000100000000000: sdb_arb_ebiu_w_bus[EBIU_D_WIDTH-1:0] = entry11_ebiu_dbus[EBIU_D_WIDTH-1:0];
  24'b000000000001000000000000: sdb_arb_ebiu_w_bus[EBIU_D_WIDTH-1:0] = entry12_ebiu_dbus[EBIU_D_WIDTH-1:0];
  24'b000000000010000000000000: sdb_arb_ebiu_w_bus[EBIU_D_WIDTH-1:0] = entry13_ebiu_dbus[EBIU_D_WIDTH-1:0];
  24'b000000000100000000000000: sdb_arb_ebiu_w_bus[EBIU_D_WIDTH-1:0] = entry14_ebiu_dbus[EBIU_D_WIDTH-1:0];
  24'b000000001000000000000000: sdb_arb_ebiu_w_bus[EBIU_D_WIDTH-1:0] = entry15_ebiu_dbus[EBIU_D_WIDTH-1:0];
  24'b000000010000000000000000: sdb_arb_ebiu_w_bus[EBIU_D_WIDTH-1:0] = entry16_ebiu_dbus[EBIU_D_WIDTH-1:0];
  24'b000000100000000000000000: sdb_arb_ebiu_w_bus[EBIU_D_WIDTH-1:0] = entry17_ebiu_dbus[EBIU_D_WIDTH-1:0];
  24'b000001000000000000000000: sdb_arb_ebiu_w_bus[EBIU_D_WIDTH-1:0] = entry18_ebiu_dbus[EBIU_D_WIDTH-1:0];
  24'b000010000000000000000000: sdb_arb_ebiu_w_bus[EBIU_D_WIDTH-1:0] = entry19_ebiu_dbus[EBIU_D_WIDTH-1:0];
  24'b000100000000000000000000: sdb_arb_ebiu_w_bus[EBIU_D_WIDTH-1:0] = entry20_ebiu_dbus[EBIU_D_WIDTH-1:0];
  24'b001000000000000000000000: sdb_arb_ebiu_w_bus[EBIU_D_WIDTH-1:0] = entry21_ebiu_dbus[EBIU_D_WIDTH-1:0];
  24'b010000000000000000000000: sdb_arb_ebiu_w_bus[EBIU_D_WIDTH-1:0] = entry22_ebiu_dbus[EBIU_D_WIDTH-1:0];
  24'b100000000000000000000000: sdb_arb_ebiu_w_bus[EBIU_D_WIDTH-1:0] = entry23_ebiu_dbus[EBIU_D_WIDTH-1:0];
  default                     : sdb_arb_ebiu_w_bus[EBIU_D_WIDTH-1:0] = {EBIU_D_WIDTH{1'bx}};
  endcase
// &CombEnd; @1168
end
//================================================
//      ebiu r read port
//================================================
// &Force("nonport", "sab_ebiu_rd_sel"); @1173

assign sab_ebiur_req_vld[DEPTH-1:0] = sab_ebiur_req[DEPTH-1:0];

// &Instance("ct_ciu_snb_dp_sel", "x_ct_ciu_ebiu_rd_dp_sel"); @1177
ct_ciu_snb_dp_sel  x_ct_ciu_ebiu_rd_dp_sel (
  .entry0_age_vect   (entry0_age_vect  ),
  .entry10_age_vect  (entry10_age_vect ),
  .entry11_age_vect  (entry11_age_vect ),
  .entry12_age_vect  (entry12_age_vect ),
  .entry13_age_vect  (entry13_age_vect ),
  .entry14_age_vect  (entry14_age_vect ),
  .entry15_age_vect  (entry15_age_vect ),
  .entry16_age_vect  (entry16_age_vect ),
  .entry17_age_vect  (entry17_age_vect ),
  .entry18_age_vect  (entry18_age_vect ),
  .entry19_age_vect  (entry19_age_vect ),
  .entry1_age_vect   (entry1_age_vect  ),
  .entry20_age_vect  (entry20_age_vect ),
  .entry21_age_vect  (entry21_age_vect ),
  .entry22_age_vect  (entry22_age_vect ),
  .entry23_age_vect  (entry23_age_vect ),
  .entry2_age_vect   (entry2_age_vect  ),
  .entry3_age_vect   (entry3_age_vect  ),
  .entry4_age_vect   (entry4_age_vect  ),
  .entry5_age_vect   (entry5_age_vect  ),
  .entry6_age_vect   (entry6_age_vect  ),
  .entry7_age_vect   (entry7_age_vect  ),
  .entry8_age_vect   (entry8_age_vect  ),
  .entry9_age_vect   (entry9_age_vect  ),
  .req_vld           (sab_ebiur_req_vld),
  .sel               (sab_ebiu_rd_sel  )
);

// &Connect( @1178
//   .req_vld           (sab_ebiur_req_vld     ), @1179
//   .sel               (sab_ebiu_rd_sel       ) @1180
// ); @1181

// &CombBeg; @1184
// &CombEnd; @1196
// &CombBeg; @1198
always @( sab_ebiu_rd_sel[23:0]
       or entry23_ebiu_arbus[68:0]
       or entry0_ebiu_arbus[68:0]
       or entry3_ebiu_arbus[68:0]
       or entry14_ebiu_arbus[68:0]
       or entry15_ebiu_arbus[68:0]
       or entry13_ebiu_arbus[68:0]
       or entry17_ebiu_arbus[68:0]
       or entry7_ebiu_arbus[68:0]
       or entry8_ebiu_arbus[68:0]
       or entry6_ebiu_arbus[68:0]
       or entry12_ebiu_arbus[68:0]
       or entry20_ebiu_arbus[68:0]
       or entry10_ebiu_arbus[68:0]
       or entry19_ebiu_arbus[68:0]
       or entry18_ebiu_arbus[68:0]
       or entry22_ebiu_arbus[68:0]
       or entry5_ebiu_arbus[68:0]
       or entry21_ebiu_arbus[68:0]
       or entry4_ebiu_arbus[68:0]
       or entry9_ebiu_arbus[68:0]
       or entry11_ebiu_arbus[68:0]
       or entry2_ebiu_arbus[68:0]
       or entry1_ebiu_arbus[68:0]
       or entry16_ebiu_arbus[68:0])
begin
  case(sab_ebiu_rd_sel[DEPTH-1:0])
  24'b000000000000000000000001: sab_arb_ebiu_ar_bus[EBIU_AR_WIDTH-1:0] =  entry0_ebiu_arbus[EBIU_AR_WIDTH-1:0];
  24'b000000000000000000000010: sab_arb_ebiu_ar_bus[EBIU_AR_WIDTH-1:0] =  entry1_ebiu_arbus[EBIU_AR_WIDTH-1:0];
  24'b000000000000000000000100: sab_arb_ebiu_ar_bus[EBIU_AR_WIDTH-1:0] =  entry2_ebiu_arbus[EBIU_AR_WIDTH-1:0];
  24'b000000000000000000001000: sab_arb_ebiu_ar_bus[EBIU_AR_WIDTH-1:0] =  entry3_ebiu_arbus[EBIU_AR_WIDTH-1:0];
  24'b000000000000000000010000: sab_arb_ebiu_ar_bus[EBIU_AR_WIDTH-1:0] =  entry4_ebiu_arbus[EBIU_AR_WIDTH-1:0];
  24'b000000000000000000100000: sab_arb_ebiu_ar_bus[EBIU_AR_WIDTH-1:0] =  entry5_ebiu_arbus[EBIU_AR_WIDTH-1:0];
  24'b000000000000000001000000: sab_arb_ebiu_ar_bus[EBIU_AR_WIDTH-1:0] =  entry6_ebiu_arbus[EBIU_AR_WIDTH-1:0];
  24'b000000000000000010000000: sab_arb_ebiu_ar_bus[EBIU_AR_WIDTH-1:0] =  entry7_ebiu_arbus[EBIU_AR_WIDTH-1:0];
  24'b000000000000000100000000: sab_arb_ebiu_ar_bus[EBIU_AR_WIDTH-1:0] =  entry8_ebiu_arbus[EBIU_AR_WIDTH-1:0];
  24'b000000000000001000000000: sab_arb_ebiu_ar_bus[EBIU_AR_WIDTH-1:0] =  entry9_ebiu_arbus[EBIU_AR_WIDTH-1:0];
  24'b000000000000010000000000: sab_arb_ebiu_ar_bus[EBIU_AR_WIDTH-1:0] = entry10_ebiu_arbus[EBIU_AR_WIDTH-1:0];
  24'b000000000000100000000000: sab_arb_ebiu_ar_bus[EBIU_AR_WIDTH-1:0] = entry11_ebiu_arbus[EBIU_AR_WIDTH-1:0];
  24'b000000000001000000000000: sab_arb_ebiu_ar_bus[EBIU_AR_WIDTH-1:0] = entry12_ebiu_arbus[EBIU_AR_WIDTH-1:0];
  24'b000000000010000000000000: sab_arb_ebiu_ar_bus[EBIU_AR_WIDTH-1:0] = entry13_ebiu_arbus[EBIU_AR_WIDTH-1:0];
  24'b000000000100000000000000: sab_arb_ebiu_ar_bus[EBIU_AR_WIDTH-1:0] = entry14_ebiu_arbus[EBIU_AR_WIDTH-1:0];
  24'b000000001000000000000000: sab_arb_ebiu_ar_bus[EBIU_AR_WIDTH-1:0] = entry15_ebiu_arbus[EBIU_AR_WIDTH-1:0];
  24'b000000010000000000000000: sab_arb_ebiu_ar_bus[EBIU_AR_WIDTH-1:0] = entry16_ebiu_arbus[EBIU_AR_WIDTH-1:0];
  24'b000000100000000000000000: sab_arb_ebiu_ar_bus[EBIU_AR_WIDTH-1:0] = entry17_ebiu_arbus[EBIU_AR_WIDTH-1:0];
  24'b000001000000000000000000: sab_arb_ebiu_ar_bus[EBIU_AR_WIDTH-1:0] = entry18_ebiu_arbus[EBIU_AR_WIDTH-1:0];
  24'b000010000000000000000000: sab_arb_ebiu_ar_bus[EBIU_AR_WIDTH-1:0] = entry19_ebiu_arbus[EBIU_AR_WIDTH-1:0];
  24'b000100000000000000000000: sab_arb_ebiu_ar_bus[EBIU_AR_WIDTH-1:0] = entry20_ebiu_arbus[EBIU_AR_WIDTH-1:0];
  24'b001000000000000000000000: sab_arb_ebiu_ar_bus[EBIU_AR_WIDTH-1:0] = entry21_ebiu_arbus[EBIU_AR_WIDTH-1:0];
  24'b010000000000000000000000: sab_arb_ebiu_ar_bus[EBIU_AR_WIDTH-1:0] = entry22_ebiu_arbus[EBIU_AR_WIDTH-1:0];
  24'b100000000000000000000000: sab_arb_ebiu_ar_bus[EBIU_AR_WIDTH-1:0] = entry23_ebiu_arbus[EBIU_AR_WIDTH-1:0];
  default                     : sab_arb_ebiu_ar_bus[EBIU_AR_WIDTH-1:0] = {EBIU_AR_WIDTH{1'bx}};
  endcase
// &CombEnd; @1226
end

assign sab_arb_ebiu_ar_req = |sab_ebiur_req_vld[DEPTH-1:0];

// &Force("bus","sab_cr_req",DEPTH-1,0); @1235
// &Force("bus","sab_cd_req",DEPTH-1,0); @1236
// &Force("nonport", "entry16_cr_bus"); @1237
// &Force("nonport", "entry17_cr_bus"); @1238
// &Force("nonport", "entry18_cr_bus"); @1239
// &Force("nonport", "entry19_cr_bus"); @1240
// &Force("nonport", "entry20_cr_bus"); @1241
// &Force("nonport", "entry21_cr_bus"); @1242
// &Force("nonport", "entry22_cr_bus"); @1243
// &Force("nonport", "entry23_cr_bus"); @1244
// &Force("nonport", "entry16_cd_bus"); @1245
// &Force("nonport", "entry17_cd_bus"); @1246
// &Force("nonport", "entry18_cd_bus"); @1247
// &Force("nonport", "entry19_cd_bus"); @1248
// &Force("nonport", "entry20_cd_bus"); @1249
// &Force("nonport", "entry21_cd_bus"); @1250
// &Force("nonport", "entry22_cd_bus"); @1251
// &Force("nonport", "entry23_cd_bus"); @1252
// &CombBeg; @1256
// &CombEnd; @1276
// &CombBeg; @1282
// &CombEnd; @1302
//================================================
//      rresp read port
//================================================
// &Force("nonport", "sab_rresp_sel"); @1314

// &Force("nonport", "entry6_rresp_bus"); @1317
// &Force("nonport", "entry7_rresp_bus"); @1318
// &Force("nonport", "entry16_rresp_bus"); @1320
// &Force("nonport", "entry17_rresp_bus"); @1321
// &Force("nonport", "entry18_rresp_bus"); @1322
// &Force("nonport", "entry19_rresp_bus"); @1323
// &Force("nonport", "entry20_rresp_bus"); @1324
// &Force("nonport", "entry21_rresp_bus"); @1325
// &Force("nonport", "entry22_rresp_bus"); @1326
// &Force("nonport", "entry23_rresp_bus"); @1327

parameter R_WIDTH      = 536;
parameter R_RESP_WIDTH = 24;
parameter R_DATA_0     = 24;
parameter R_DATA_511   = 535;

assign sab_rresp_req_vld[RDEPTH-1:0] = sab_rresp_req[RDEPTH-1:0];

// &Instance("ct_ciu_snb_dp_sel_6", "x_ct_ciu_rresp_dp_sel"); @1338
// &Connect( @1339
//   .req_vld           (sab_rresp_req_vld   ), @1340
//   .sel               (sab_rresp_sel       ) @1341
// ); @1342
// &CombBeg; @1343
// &CombEnd; @1353
// &Instance("ct_ciu_snb_dp_sel_16", "x_ct_ciu_rresp_dp_sel"); @1355
ct_ciu_snb_dp_sel_16  x_ct_ciu_rresp_dp_sel (
  .entry0_age_vect   (entry0_age_vect  ),
  .entry10_age_vect  (entry10_age_vect ),
  .entry11_age_vect  (entry11_age_vect ),
  .entry12_age_vect  (entry12_age_vect ),
  .entry13_age_vect  (entry13_age_vect ),
  .entry14_age_vect  (entry14_age_vect ),
  .entry15_age_vect  (entry15_age_vect ),
  .entry1_age_vect   (entry1_age_vect  ),
  .entry2_age_vect   (entry2_age_vect  ),
  .entry3_age_vect   (entry3_age_vect  ),
  .entry4_age_vect   (entry4_age_vect  ),
  .entry5_age_vect   (entry5_age_vect  ),
  .entry6_age_vect   (entry6_age_vect  ),
  .entry7_age_vect   (entry7_age_vect  ),
  .entry8_age_vect   (entry8_age_vect  ),
  .entry9_age_vect   (entry9_age_vect  ),
  .req_vld           (sab_rresp_req_vld),
  .sel               (sab_rresp_sel    )
);

// &Connect( @1356
//   .req_vld           (sab_rresp_req_vld   ), @1357
//   .sel               (sab_rresp_sel       ) @1358
// ); @1359
// &CombBeg; @1360
always @( entry11_rresp_bus[535:0]
       or entry4_rresp_bus[535:0]
       or entry13_rresp_bus[535:0]
       or entry3_rresp_bus[535:0]
       or entry14_rresp_bus[535:0]
       or entry8_rresp_bus[535:0]
       or sab_rresp_sel[15:0]
       or entry5_rresp_bus[535:0]
       or entry15_rresp_bus[535:0]
       or entry6_rresp_bus[535:0]
       or entry9_rresp_bus[535:0]
       or entry7_rresp_bus[535:0]
       or entry12_rresp_bus[535:0]
       or entry2_rresp_bus[535:0]
       or entry0_rresp_bus[535:0]
       or entry10_rresp_bus[535:0]
       or entry1_rresp_bus[535:0])
begin
  case(sab_rresp_sel[RDEPTH-1:0])
  16'b0000000000000001: sab_rresp_bus_pre[R_WIDTH-1:0] =  entry0_rresp_bus[R_WIDTH-1:0];
  16'b0000000000000010: sab_rresp_bus_pre[R_WIDTH-1:0] =  entry1_rresp_bus[R_WIDTH-1:0];
  16'b0000000000000100: sab_rresp_bus_pre[R_WIDTH-1:0] =  entry2_rresp_bus[R_WIDTH-1:0];
  16'b0000000000001000: sab_rresp_bus_pre[R_WIDTH-1:0] =  entry3_rresp_bus[R_WIDTH-1:0];
  16'b0000000000010000: sab_rresp_bus_pre[R_WIDTH-1:0] =  entry4_rresp_bus[R_WIDTH-1:0];
  16'b0000000000100000: sab_rresp_bus_pre[R_WIDTH-1:0] =  entry5_rresp_bus[R_WIDTH-1:0];
  16'b0000000001000000: sab_rresp_bus_pre[R_WIDTH-1:0] =  entry6_rresp_bus[R_WIDTH-1:0];
  16'b0000000010000000: sab_rresp_bus_pre[R_WIDTH-1:0] =  entry7_rresp_bus[R_WIDTH-1:0];
  16'b0000000100000000: sab_rresp_bus_pre[R_WIDTH-1:0] =  entry8_rresp_bus[R_WIDTH-1:0];
  16'b0000001000000000: sab_rresp_bus_pre[R_WIDTH-1:0] =  entry9_rresp_bus[R_WIDTH-1:0];
  16'b0000010000000000: sab_rresp_bus_pre[R_WIDTH-1:0] = entry10_rresp_bus[R_WIDTH-1:0];
  16'b0000100000000000: sab_rresp_bus_pre[R_WIDTH-1:0] = entry11_rresp_bus[R_WIDTH-1:0];
  16'b0001000000000000: sab_rresp_bus_pre[R_WIDTH-1:0] = entry12_rresp_bus[R_WIDTH-1:0];
  16'b0010000000000000: sab_rresp_bus_pre[R_WIDTH-1:0] = entry13_rresp_bus[R_WIDTH-1:0];
  16'b0100000000000000: sab_rresp_bus_pre[R_WIDTH-1:0] = entry14_rresp_bus[R_WIDTH-1:0];
  16'b1000000000000000: sab_rresp_bus_pre[R_WIDTH-1:0] = entry15_rresp_bus[R_WIDTH-1:0];
  default             : sab_rresp_bus_pre[R_WIDTH-1:0] = {R_WIDTH{1'bx}};
  endcase
// &CombEnd; @1380
end

assign sab_arb_rresp_req                    = |sab_rresp_req_vld[RDEPTH-1:0];
assign sab_arb_rresp_ctrl[R_RESP_WIDTH-1:0] = sab_rresp_bus_pre[R_RESP_WIDTH-1:0];
assign sdb_arb_rresp_data[511:0]            = sab_rresp_bus_pre[R_DATA_511:R_DATA_0];

assign sab_r_grant[DEPTH-1:0] = (PTR_EXTENT << arb_sab_rresp_grant_sid[4:0]) & {DEPTH{arb_sab_rresp_grant}};

//================================================
//      bresp read port
//================================================
// &Force("nonport", "sab_bresp_sel"); @1392
// &Force("nonport", "entry0_bresp_bus"); @1393
// &Force("nonport", "entry1_bresp_bus"); @1394
// &Force("nonport", "entry2_bresp_bus"); @1395
// &Force("nonport", "entry3_bresp_bus"); @1396
// &Force("nonport", "entry4_bresp_bus"); @1397
// &Force("nonport", "entry5_bresp_bus"); @1398
// &Force("nonport", "entry6_bresp_bus"); @1401
// &Force("nonport", "entry7_bresp_bus"); @1402
// &Force("nonport", "entry8_bresp_bus"); @1403
// &Force("nonport", "entry9_bresp_bus"); @1404
// &Force("nonport", "entry10_bresp_bus"); @1405
// &Force("nonport", "entry11_bresp_bus"); @1406
// &Force("nonport", "entry12_bresp_bus"); @1407
// &Force("nonport", "entry13_bresp_bus"); @1408
// &Force("nonport", "entry14_bresp_bus"); @1409
// &Force("nonport", "entry15_bresp_bus"); @1410

parameter B_WIDTH = 15;

assign sab_bresp_req_vld[WDEPTH-1:0] = sab_bresp_req[DEPTH-1:RDEPTH];

// &Instance("ct_ciu_snb_dp_sel_2", "x_ct_ciu_bresp_dp_sel"); @1418
// &Connect( @1419
//   .req_vld           (sab_bresp_req_vld   ), @1420
//   .sel               (sab_bresp_sel       ) @1421
// ); @1422
// &CombBeg; @1423
// &CombEnd; @1429
// &Instance("ct_ciu_snb_dp_sel_8", "x_ct_ciu_bresp_dp_sel"); @1431
ct_ciu_snb_dp_sel_8  x_ct_ciu_bresp_dp_sel (
  .entry16_age_vect  (entry16_age_vect ),
  .entry17_age_vect  (entry17_age_vect ),
  .entry18_age_vect  (entry18_age_vect ),
  .entry19_age_vect  (entry19_age_vect ),
  .entry20_age_vect  (entry20_age_vect ),
  .entry21_age_vect  (entry21_age_vect ),
  .entry22_age_vect  (entry22_age_vect ),
  .entry23_age_vect  (entry23_age_vect ),
  .req_vld           (sab_bresp_req_vld),
  .sel               (sab_bresp_sel    )
);

// &Connect( @1432
//   .req_vld           (sab_bresp_req_vld   ), @1433
//   .sel               (sab_bresp_sel       ) @1434
// ); @1435
// &CombBeg; @1436
always @( entry16_bresp_bus[14:0]
       or entry17_bresp_bus[14:0]
       or sab_bresp_sel[7:0]
       or entry18_bresp_bus[14:0]
       or entry22_bresp_bus[14:0]
       or entry21_bresp_bus[14:0]
       or entry23_bresp_bus[14:0]
       or entry20_bresp_bus[14:0]
       or entry19_bresp_bus[14:0])
begin
  case(sab_bresp_sel[WDEPTH-1:0])
  8'b00000001: sab_arb_bresp_bus[B_WIDTH-1:0] = entry16_bresp_bus[B_WIDTH-1:0];
  8'b00000010: sab_arb_bresp_bus[B_WIDTH-1:0] = entry17_bresp_bus[B_WIDTH-1:0];
  8'b00000100: sab_arb_bresp_bus[B_WIDTH-1:0] = entry18_bresp_bus[B_WIDTH-1:0];
  8'b00001000: sab_arb_bresp_bus[B_WIDTH-1:0] = entry19_bresp_bus[B_WIDTH-1:0];
  8'b00010000: sab_arb_bresp_bus[B_WIDTH-1:0] = entry20_bresp_bus[B_WIDTH-1:0];
  8'b00100000: sab_arb_bresp_bus[B_WIDTH-1:0] = entry21_bresp_bus[B_WIDTH-1:0];
  8'b01000000: sab_arb_bresp_bus[B_WIDTH-1:0] = entry22_bresp_bus[B_WIDTH-1:0];
  8'b10000000: sab_arb_bresp_bus[B_WIDTH-1:0] = entry23_bresp_bus[B_WIDTH-1:0];
  default    : sab_arb_bresp_bus[B_WIDTH-1:0] = {B_WIDTH{1'bx}};
  endcase
// &CombEnd; @1448
end

assign sab_arb_bresp_req = |sab_bresp_req_vld[WDEPTH-1:0];

assign bresp_grant_sel[DEPTH-1:0] = (PTR_EXTENT << arb_sab_bresp_grant_sid[4:0]);
assign bresp_grant[DEPTH-1:0] = bresp_grant_sel[DEPTH-1:0] & {DEPTH{arb_sab_bresp_grant}};

assign sab_b_grant[DEPTH-1:0] = bresp_grant[DEPTH-1:0];

//================================================
//      bar cmplt read port
//================================================
assign piu0_bar_cmplt = |sab_piu0_bar_cmplt[DEPTH-1:0];
assign piu1_bar_cmplt = |sab_piu1_bar_cmplt[DEPTH-1:0];
assign piu2_bar_cmplt = |sab_piu2_bar_cmplt[DEPTH-1:0];
assign piu3_bar_cmplt = |sab_piu3_bar_cmplt[DEPTH-1:0];

assign sab_snp_bar_cmplt[3:0] = {piu3_bar_cmplt,piu2_bar_cmplt,piu1_bar_cmplt,piu0_bar_cmplt};

//================================================
//     debug information
//================================================
assign snb_dbg_info[95:0] = {
                             entry23_dbg_info[3:0],
                             entry22_dbg_info[3:0],
                             entry21_dbg_info[3:0],
                             entry20_dbg_info[3:0],
                             entry19_dbg_info[3:0],
                             entry18_dbg_info[3:0],
                             entry17_dbg_info[3:0],
                             entry16_dbg_info[3:0],
                             entry15_dbg_info[3:0],
                             entry14_dbg_info[3:0],
                             entry13_dbg_info[3:0],
                             entry12_dbg_info[3:0],
                             entry11_dbg_info[3:0],
                             entry10_dbg_info[3:0],
                             entry9_dbg_info[3:0],
                             entry8_dbg_info[3:0],
                             entry7_dbg_info[3:0],
                             entry6_dbg_info[3:0],
                             entry5_dbg_info[3:0],
                             entry4_dbg_info[3:0],
                             entry3_dbg_info[3:0],
                             entry2_dbg_info[3:0],
                             entry1_dbg_info[3:0],
                             entry0_dbg_info[3:0]
                            };

// &CombBeg; @1513
// &CombEnd; @1525
// &CombBeg; @1526
// &CombEnd; @1538
// &CombBeg; @1539
// &CombEnd; @1551
// &CombBeg; @1552
// &CombEnd; @1564
// &CombBeg; @1602
// &CombEnd; @1630
// &CombBeg; @1631
// &CombEnd; @1659
// &CombBeg; @1661
// &CombEnd; @1689
// &CombBeg; @1690
// &CombEnd; @1718

// &Force("nonport","ar_crt_depd_sab"); @1826

// &ModuleEnd; @1940
endmodule



