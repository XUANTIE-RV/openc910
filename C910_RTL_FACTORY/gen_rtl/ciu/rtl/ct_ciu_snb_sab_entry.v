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

// &ModuleBeg; @21
module ct_ciu_snb_sab_entry(
  agevec_clr,
  ar_crt_entry_index,
  arb_sab_no_l2c_req,
  aw_crt_entry_index,
  aw_mid,
  aw_sh,
  ciu_chr2_bar_dis,
  ciu_chr2_sf_dis,
  ciu_icg_en,
  ciu_xx_smpen,
  cpurst_b,
  create_age,
  create_bus,
  create_depd,
  depd_clr,
  forever_cpuclk,
  l1_data,
  l1_wcd_err,
  l1_wen_x,
  l1_wstrb,
  l2c_cmplt_x,
  l2c_cp,
  l2c_data,
  l2c_grant_x,
  l2c_resp,
  memr_ar_grant_x,
  memr_cmplt_x,
  memr_data,
  memr_data_vld_x,
  memr_resp,
  memr_resp_err,
  memw_aw_grant_x,
  memw_cmplt_x,
  pad_yy_icg_scan_en,
  piu0_ac_grant_x,
  piu0_cdvld_x,
  piu0_crresp,
  piu0_crvld_x,
  piu1_ac_grant_x,
  piu1_cdvld_x,
  piu1_crresp,
  piu1_crvld_x,
  piu2_ac_grant_x,
  piu2_cdvld_x,
  piu2_crresp,
  piu2_crvld_x,
  piu3_ac_grant_x,
  piu3_cdvld_x,
  piu3_crresp,
  piu3_crvld_x,
  sab_ar_depd_snb_x,
  sab_aw_depd_snb_x,
  sab_b_grant_x,
  sab_back_mark_by_wns_x,
  sab_back_x,
  sab_bar_depd_snb_x,
  sab_bresp_req_x,
  sab_busy_x,
  sab_cen_x,
  sab_depd_set_by_wns_x,
  sab_ebiur_req_x,
  sab_ebiuw_req_x,
  sab_in_process_x,
  sab_l2c_req_x,
  sab_piu0_ac_req_x,
  sab_piu0_bar_cmplt_x,
  sab_piu1_ac_req_x,
  sab_piu1_bar_cmplt_x,
  sab_piu2_ac_req_x,
  sab_piu2_bar_cmplt_x,
  sab_piu3_ac_req_x,
  sab_piu3_bar_cmplt_x,
  sab_pop_en_x,
  sab_r_grant_x,
  sab_rack_x,
  sab_rresp_req_x,
  sab_snpext_depd_snb_x,
  sab_snpl2_cmplt_x,
  sab_snpl2_ini_sid,
  sab_vld_x,
  sab_wns_x,
  snb1,
  snpext_index,
  x_bresp_bus,
  x_dbg_info,
  x_depd_set,
  x_ebiu_arbus,
  x_ebiu_awbus,
  x_ebiu_dbus,
  x_ebiu_mid,
  x_l2c_addr_bus,
  x_l2c_data_bus,
  x_l2c_hpcp_bus,
  x_piux_ac_bus,
  x_rresp_bus,
  x_sab_agevec,
  x_sab_snpl2_cmplt,
  x_sid
);

// &Ports; @22
input   [23 :0]  agevec_clr;            
input   [6  :0]  ar_crt_entry_index;    
input            arb_sab_no_l2c_req;    
input   [6  :0]  aw_crt_entry_index;    
input   [2  :0]  aw_mid;                
input            aw_sh;                 
input            ciu_chr2_bar_dis;      
input            ciu_chr2_sf_dis;       
input            ciu_icg_en;            
input   [3  :0]  ciu_xx_smpen;          
input            cpurst_b;              
input   [23 :0]  create_age;            
input   [74 :0]  create_bus;            
input   [23 :0]  create_depd;           
input   [23 :0]  depd_clr;              
input            forever_cpuclk;        
input   [511:0]  l1_data;               
input            l1_wcd_err;            
input            l1_wen_x;              
input   [15 :0]  l1_wstrb;              
input            l2c_cmplt_x;           
input   [3  :0]  l2c_cp;                
input   [511:0]  l2c_data;              
input            l2c_grant_x;           
input   [4  :0]  l2c_resp;              
input            memr_ar_grant_x;       
input            memr_cmplt_x;          
input   [127:0]  memr_data;             
input            memr_data_vld_x;       
input   [3  :0]  memr_resp;             
input            memr_resp_err;         
input            memw_aw_grant_x;       
input            memw_cmplt_x;          
input            pad_yy_icg_scan_en;    
input            piu0_ac_grant_x;       
input            piu0_cdvld_x;          
input   [4  :0]  piu0_crresp;           
input            piu0_crvld_x;          
input            piu1_ac_grant_x;       
input            piu1_cdvld_x;          
input   [4  :0]  piu1_crresp;           
input            piu1_crvld_x;          
input            piu2_ac_grant_x;       
input            piu2_cdvld_x;          
input   [4  :0]  piu2_crresp;           
input            piu2_crvld_x;          
input            piu3_ac_grant_x;       
input            piu3_cdvld_x;          
input   [4  :0]  piu3_crresp;           
input            piu3_crvld_x;          
input            sab_b_grant_x;         
input            sab_back_x;            
input            sab_cen_x;             
input            sab_depd_set_by_wns_x; 
input            sab_r_grant_x;         
input            sab_rack_x;            
input            sab_snpl2_cmplt_x;     
input   [4  :0]  sab_snpl2_ini_sid;     
input            snb1;                  
input   [6  :0]  snpext_index;          
input   [23 :0]  x_depd_set;            
input   [4  :0]  x_sid;                 
output           sab_ar_depd_snb_x;     
output           sab_aw_depd_snb_x;     
output           sab_back_mark_by_wns_x; 
output           sab_bar_depd_snb_x;    
output           sab_bresp_req_x;       
output           sab_busy_x;            
output           sab_ebiur_req_x;       
output           sab_ebiuw_req_x;       
output           sab_in_process_x;      
output           sab_l2c_req_x;         
output           sab_piu0_ac_req_x;     
output           sab_piu0_bar_cmplt_x;  
output           sab_piu1_ac_req_x;     
output           sab_piu1_bar_cmplt_x;  
output           sab_piu2_ac_req_x;     
output           sab_piu2_bar_cmplt_x;  
output           sab_piu3_ac_req_x;     
output           sab_piu3_bar_cmplt_x;  
output           sab_pop_en_x;          
output           sab_rresp_req_x;       
output           sab_snpext_depd_snb_x; 
output           sab_vld_x;             
output           sab_wns_x;             
output  [14 :0]  x_bresp_bus;           
output  [3  :0]  x_dbg_info;            
output  [68 :0]  x_ebiu_arbus;          
output  [67 :0]  x_ebiu_awbus;          
output  [534:0]  x_ebiu_dbus;           
output  [2  :0]  x_ebiu_mid;            
output  [63 :0]  x_l2c_addr_bus;        
output  [511:0]  x_l2c_data_bus;        
output  [2  :0]  x_l2c_hpcp_bus;        
output  [54 :0]  x_piux_ac_bus;         
output  [535:0]  x_rresp_bus;           
output  [23 :0]  x_sab_agevec;          
output  [23 :0]  x_sab_snpl2_cmplt;     

// &Regs; @23
reg     [23 :0]  agevec;                
reg              alct_cnt;              
reg              back_f;                
reg              bresp_already_rdy;     
reg              bresp_rdy_f;           
reg     [15 :0]  byte_sel_0;            
reg     [15 :0]  byte_sel_1;            
reg     [15 :0]  byte_sel_2;            
reg     [15 :0]  byte_sel_3;            
reg     [3  :0]  cp;                    
reg     [4  :0]  crresp;                
reg     [127:0]  data0;                 
reg     [127:0]  data0_din;             
reg     [127:0]  data1;                 
reg     [127:0]  data1_din;             
reg     [127:0]  data2;                 
reg     [127:0]  data2_din;             
reg     [127:0]  data3;                 
reg     [127:0]  data3_din;             
reg     [2  :0]  data_sel;              
reg     [23 :0]  depd_val;              
reg     [4  :0]  l2_resp;               
reg     [1  :0]  l2c_cur_state;         
reg     [1  :0]  l2c_nxt_state;         
reg     [3  :0]  main_cur_state;        
reg     [3  :0]  main_next_state;       
reg     [3  :0]  mem_quad_sel;          
reg              memr_cmplt_f;          
reg     [1  :0]  memr_cur_state;        
reg     [1  :0]  memr_nxt_state;        
reg     [1  :0]  memr_resp_f_3_2;       
reg     [3  :0]  memr_resp_f_err;       
reg     [1  :0]  memw_cur_state;        
reg     [1  :0]  memw_nxt_state;        
reg              _process;               
reg              rack_f;                
reg              rresp_rdy_f;           
reg              ru_miss_by_snpext;     
reg     [74 :0]  sab_cont;              
reg              set_alct;              
reg     [3  :0]  smpen;                 
reg     [1  :0]  snp0_cur_state;        
reg     [1  :0]  snp0_next_state;       
reg     [1  :0]  snp1_cur_state;        
reg     [1  :0]  snp1_next_state;       
reg     [1  :0]  snp2_cur_state;        
reg     [1  :0]  snp2_next_state;       
reg     [1  :0]  snp3_cur_state;        
reg     [1  :0]  snp3_next_state;       
reg              snpl2_done;            
reg     [4  :0]  snpl2_ini_sid;         
reg              wns_pend;              
reg     [15 :0]  wstrb;                 
reg              wt_data_vld;           
reg              wt_err;                

// &Wires; @24
wire             ace_cfig;              
wire    [3  :0]  acsnoop;               
wire    [1  :0]  addr_5_4;              
wire    [23 :0]  agevec_clr;            
wire             alct_cmplt;            
wire             alct_done;             
wire             alct_ecc_err;          
wire             alct_req_en;           
wire    [6  :0]  ar_crt_entry_index;    
wire    [5  :0]  araddr_5_0;            
wire             arb_sab_no_l2c_req;    
wire    [6  :0]  aw_crt_entry_index;    
wire    [2  :0]  aw_mid;                
wire             aw_sh;                 
wire    [5  :0]  awaddr_5_0;            
wire             back;                  
wire             back_mark;             
wire             bar_cmplt;             
wire             bar_raw;               
wire    [1  :0]  bar_val;               
wire             bresp_rdy;             
wire    [3  :0]  cd_sel;                
wire             ci;                    
wire             ciu_chr2_bar_dis;      
wire             ciu_chr2_sf_dis;       
wire             ciu_icg_en;            
wire    [3  :0]  ciu_xx_smpen;          
wire    [3  :0]  clr_cp;                
wire    [3  :0]  clr_cp_sel;            
wire             clr_cp_vld;            
wire             clr_process;           
wire             cml2;                  
wire             cmop;                  
wire    [3  :0]  cp_after_mask;         
wire    [3  :0]  cp_after_sf;           
wire    [3  :0]  cp_mask;               
wire             cp_vld;                
wire             cpurst_b;              
wire    [23 :0]  create_age;            
wire    [74 :0]  create_bus;            
wire    [23 :0]  create_depd;           
wire             cs;                    
wire             csl1;                  
wire             csl2;                  
wire             cu;                    
wire    [511:0]  data;                  
wire             data0_clk;             
wire             data0_clk_en;          
wire             data0_wen;             
wire             data1_clk;             
wire             data1_clk_en;          
wire             data1_wen;             
wire             data2_clk;             
wire             data2_clk_en;          
wire             data2_wen;             
wire             data3_clk;             
wire             data3_clk_en;          
wire             data3_wen;             
wire             data_sel_l1c;          
wire             data_sel_l2c;          
wire             data_sel_mem;          
wire    [23 :0]  depd_clr;              
wire             depd_vld;              
wire             depd_vld_raw;          
wire    [39 :0]  ebiu_araddr;           
wire    [68 :0]  ebiu_arbus;            
wire    [1  :0]  ebiu_arlen;            
wire             ebiu_arlen_4;          
wire    [3  :0]  ebiu_arsnoop;          
wire    [39 :0]  ebiu_awaddr;           
wire    [67 :0]  ebiu_awbus;            
wire    [1  :0]  ebiu_awlen;            
wire             ebiu_awlen_1;          
wire             ebiu_awlen_4;          
wire    [2  :0]  ebiu_awsnoop;          
wire    [1  :0]  ebiu_bar;              
wire    [1  :0]  ebiu_burst;            
wire    [3  :0]  ebiu_cache;            
wire             ebiu_cr_done;          
wire    [1  :0]  ebiu_domain;           
wire    [2  :0]  ebiu_prot;             
wire    [2  :0]  ebiu_size;             
wire    [511:0]  ebiu_wdata;            
wire    [15 :0]  ebiu_wstrb;            
wire             evict;                 
wire             evict_raw;             
wire             forever_cpuclk;        
wire             fsm_busy;              
wire             fsm_clk;               
wire             fsm_clk_en;            
wire             inst;                  
wire    [511:0]  l1_data;               
wire    [127:0]  l1_data_0;             
wire    [127:0]  l1_data_1;             
wire    [127:0]  l1_data_2;             
wire    [127:0]  l1_data_3;             
wire             l1_dt;                 
wire             l1_err;                
wire             l1_err_t;              
wire             l1_pd;                 
wire    [3  :0]  l1_quad_sel;           
wire    [3  :0]  l1_quad_wen;           
wire             l1_sh;                 
wire             l1_wcd_err;            
wire             l1_wdata_err;          
wire             l1_wdata_vld;          
wire             l1_wen_x;              
wire    [15 :0]  l1_wstrb;              
wire    [127:0]  l1c_data0;             
wire    [127:0]  l1c_data1;             
wire    [127:0]  l1c_data2;             
wire    [127:0]  l1c_data3;             
wire             l1orl2_dirty;          
wire             l2_err;                
wire             l2_hit;                
wire             l2_pd;                 
wire             l2_prf;                
wire             l2_prf_from_l2c;       
wire             l2_prf_from_l2c_raw;   
wire             l2_prf_raw;            
wire    [3  :0]  l2_quad_sel;           
wire    [3  :0]  l2_quad_sel_rd;        
wire    [3  :0]  l2_quad_wen;           
wire             l2_sh;                 
wire             l2_wen;                
wire             l2c_cmplt;             
wire             l2c_cmplt_x;           
wire    [3  :0]  l2c_cp;                
wire    [511:0]  l2c_data;              
wire    [127:0]  l2c_data0;             
wire    [127:0]  l2c_data1;             
wire    [127:0]  l2c_data2;             
wire    [127:0]  l2c_data3;             
wire    [127:0]  l2c_data_0;            
wire    [127:0]  l2c_data_1;            
wire    [127:0]  l2c_data_2;            
wire    [127:0]  l2c_data_3;            
wire             l2c_grant_x;           
wire             l2c_req_mask;          
wire             l2c_req_vld;           
wire    [4  :0]  l2c_resp;              
wire             l2c_resp_wen;          
wire    [1  :0]  len;                   
wire             mem_data_vld;          
wire    [3  :0]  mem_quad_wen;          
wire    [127:0]  mem_rdata;             
wire             memr_ar_grant_x;       
wire             memr_cmplt;            
wire             memr_cmplt_x;          
wire    [127:0]  memr_data;             
wire             memr_data_vld_x;       
wire             memr_err;              
wire             memr_pd;               
wire             memr_req_vld;          
wire    [3  :0]  memr_resp;             
wire             memr_resp_err;         
wire    [3  :0]  memr_resp_f_err_next;  
wire             memr_resp_wen;         
wire             memr_sc;               
wire             memr_sd;               
wire             memr_sh;               
wire             memr_uc;               
wire             memr_ud;               
wire             memw_aw_grant_x;       
wire             memw_cmplt;            
wire             memw_cmplt_x;          
wire             memw_req_vld;          
wire             mi;                    
wire    [2  :0]  mid;                   
wire             mu;                    
wire             pad_yy_icg_scan_en;    
wire             part_req;              
wire             piu0_ac_grant_x;       
wire             piu0_cdvld_x;          
wire    [4  :0]  piu0_crresp;           
wire             piu0_crvld_x;          
wire             piu1_ac_grant_x;       
wire             piu1_cdvld_x;          
wire    [4  :0]  piu1_crresp;           
wire             piu1_crvld_x;          
wire             piu2_ac_grant_x;       
wire             piu2_cdvld_x;          
wire    [4  :0]  piu2_crresp;           
wire             piu2_crvld_x;          
wire             piu3_ac_grant_x;       
wire             piu3_cdvld_x;          
wire    [4  :0]  piu3_crresp;           
wire             piu3_crvld_x;          
wire    [4  :0]  piu_crresp;            
wire    [3  :0]  piu_crvld;             
wire    [3  :0]  piu_sel;               
wire             pop_en;                
wire    [3  :0]  quad_sel_wt;           
wire             rack;                  
wire             rd;                    
wire             rd_alct;               
wire             rd_first;              
wire             reply;                 
wire    [39 :0]  req_addr;              
wire             req_alct;              
wire             req_atag;              
wire             req_cln;               
wire             req_icln;              
wire    [7  :0]  req_id;                
wire             req_inv;               
wire             req_read;              
wire             req_rls;               
wire             req_sh;                
wire    [12 :0]  req_type;              
wire             req_uni;               
wire             req_vld;               
wire             req_wtsc;              
wire             req_wtsd;              
wire             req_wtuc;              
wire             req_wtud;              
wire    [4  :0]  rid;                   
wire             rns;                   
wire             ro;                    
wire    [6  :0]  rresp;                 
wire             rresp_ecc_err;         
wire    [3  :0]  rresp_err;             
wire             rresp_is;              
wire             rresp_rdy;             
wire             rs;                    
wire             ru;                    
wire             sab_ar_depd_snb_x;     
wire             sab_aw_depd_snb_x;     
wire             sab_b_grant_x;         
wire             sab_back_mark_by_wns_x; 
wire             sab_back_x;            
wire             sab_bar_depd_snb_x;    
wire             sab_bresp_req_x;       
wire             sab_busy_x;            
wire             sab_cen_x;             
wire             sab_clk;               
wire             sab_clk_en;            
wire             sab_depd_set_by_wns_x; 
wire             sab_ebiur_req_x;       
wire             sab_ebiuw_req_x;       
wire             sab_in_process_x;      
wire             sab_l2c_req_x;         
wire             sab_piu0_ac_req_x;     
wire             sab_piu0_bar_cmplt_x;  
wire             sab_piu1_ac_req_x;     
wire             sab_piu1_bar_cmplt_x;  
wire             sab_piu2_ac_req_x;     
wire             sab_piu2_bar_cmplt_x;  
wire             sab_piu3_ac_req_x;     
wire             sab_piu3_bar_cmplt_x;  
wire             sab_pop_en_x;          
wire             sab_r_grant_x;         
wire             sab_rack_x;            
wire             sab_rresp_req_x;       
wire             sab_snpext_depd_snb_x; 
wire             sab_snpl2_cmplt_x;     
wire    [4  :0]  sab_snpl2_ini_sid;     
wire             sab_vld_x;             
wire             sab_wns_x;             
wire    [3  :0]  set_cp;                
wire    [3  :0]  set_cp_sel;            
wire             set_cp_vld;            
wire             set_process;           
wire             snb1;                  
wire             snp0_cmplt;            
wire             snp0_fsm_busy;         
wire             snp0_req_vld;          
wire             snp1_cmplt;            
wire             snp1_fsm_busy;         
wire             snp1_req_vld;          
wire             snp2_cmplt;            
wire             snp2_fsm_busy;         
wire             snp2_req_vld;          
wire             snp3_cmplt;            
wire             snp3_fsm_busy;         
wire             snp3_req_vld;          
wire             snp_clk;               
wire             snp_clk_en;            
wire             snp_cmplt;             
wire             snp_fsm_busy;          
wire    [3  :0]  snp_req_en;            
wire             snp_req_vld;           
wire             snpext;                
wire    [6  :0]  snpext_index;          
wire             snpl2;                 
wire             snpl2_cmplt;           
wire             tlb;                   
wire             uni_op;                
wire             vld;                   
wire             wb;                    
wire             wc;                    
wire    [3  :0]  wd_sel;                
wire             wd_wen;                
wire             wd_wen_err;            
wire    [3  :0]  wen_sel;               
wire             wlu;                   
wire             wns;                   
wire             wns_i;                 
wire             wns_raw;               
wire             wr_first;              
wire             ws;                    
wire             wstrb_all_one;         
wire             wstrb_clk;             
wire             wstrb_clk_en;          
wire             wt_part;               
wire             wt_raw;                
wire             wt_val;                
wire             wu;                    
wire             x_bar_cmplt;           
wire    [14 :0]  x_bresp_bus;           
wire    [74 :0]  x_cbus;                
wire             x_cen;                 
wire    [3  :0]  x_dbg_info;            
wire    [23 :0]  x_depd_set;            
wire    [68 :0]  x_ebiu_arbus;          
wire    [67 :0]  x_ebiu_awbus;          
wire    [534:0]  x_ebiu_dbus;           
wire    [2  :0]  x_ebiu_mid;            
wire    [63 :0]  x_l2c_addr_bus;        
wire    [511:0]  x_l2c_data_bus;        
wire    [2  :0]  x_l2c_hpcp_bus;        
wire    [2  :0]  x_mid;                 
wire    [54 :0]  x_piux_ac_bus;         
wire    [535:0]  x_rresp_bus;           
wire    [23 :0]  x_sab_agevec;          
wire    [23 :0]  x_sab_snpl2_cmplt;     
wire    [4  :0]  x_sid;                 


parameter DEPTH = `SAB_DEPTH;
parameter ADDRW = `PA_WIDTH;
parameter PROT_0 = 0;
parameter PROT_2 = 2;
parameter CACHE_0 = 3;
parameter CACHE_2 = 5;
parameter CACHE_3 = 6;
parameter SIZE_0  = 7;
parameter SIZE_2  = 9;
parameter LOCK    = 10;
parameter USER_0  = 11;
parameter USER_1  = 12;
parameter USER_2  = 13;
parameter ID_0    = 14;
parameter ID_4    = 18;
parameter LEN_0   = 19;
parameter LEN_1   = 20;
parameter BURST_0 = 21;
parameter BURST_1 = 22;
parameter SNOOP_0 = 23;
parameter SNOOP_2 = 25;
parameter SNOOP_3 = 26;
parameter DOMAIN_0= 27;
parameter DOMAIN_1= 28;
parameter BAR_0   = 29;
parameter BAR_1   = 30;
parameter ADDR_0  = 31;
parameter ADDR_4  = 35;
parameter ADDR_5  = 36;
parameter ADDR_6  = 37;
parameter ADDR_7  = 38;
parameter ADDR_13 = 44;
parameter ADDR_H  = 70; //ADDR_0 + ADDRW -1;
parameter WT      = 71; //ADDR_H + 1;
parameter MID_0   = 72; //ADDR_H + 2;
parameter MID_2   = 74; //ADDR_H + 4;
//parameter AGE_0   = 75; //ADDR_H + 5;
//parameter AGE_H   = 82; //AGE_0 + DEPTH -1;
//parameter DEPD_0  = 83; //AGE_H + 1;
//parameter DEPD_H  = 90; //DEPD_0 + DEPTH -1;
parameter SAB_WIDTH = 75;

parameter D_WIDTH  = 528;
parameter DATA_0   = 0;
parameter DATA_511 = 511;
parameter WSTRB_0  = 512;
parameter WSTRB_15 = 528;

//==============================================================================
//                         FSM
//==============================================================================
assign fsm_clk_en = x_cen | fsm_busy;
// &Instance("gated_clk_cell", "x_fsm_gated_clk"); @78
gated_clk_cell  x_fsm_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (fsm_clk           ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (fsm_clk_en        ),
  .module_en          (ciu_icg_en        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @79
//          .external_en (1'b0), @80
//          .global_en   (1'b1), @81
//          .module_en (ciu_icg_en       ), @82
//          .local_en    (fsm_clk_en), @83
//          .clk_out     (fsm_clk)); @84

//================================================
//    main fsm 
//================================================
parameter IDLE = 4'b0000; 
parameter DEPD = 4'b0001;
parameter L2C  = 4'b0010; 
parameter SNOP = 4'b0011; 
parameter L2CR = 4'b0100; 
parameter L2CW = 4'b0101; 
parameter L2CA = 4'b0110; 
parameter MEMR = 4'b0111;
parameter L2CT = 4'b1000; 
parameter MEMW = 4'b1001; 
parameter BAR  = 4'b1010; 
parameter POP  = 4'b1011; 
parameter CR   = 4'b1100;
parameter ECC_ERR = 4'b1101;

always@(posedge fsm_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    main_cur_state[3:0] <= IDLE;
  else
    main_cur_state[3:0] <= main_next_state[3:0];
end

// &CombBeg; @112
always @( l1_wdata_vld
       or snpl2_done
       or rns
       or alct_cmplt
       or ru_miss_by_snpext
       or alct_ecc_err
       or snpl2
       or wns
       or ru
       or csl1
       or memr_cmplt_f
       or ro
       or l2_err
       or wt_val
       or cml2
       or l2_hit
       or l1_wdata_err
       or wt_raw
       or depd_vld_raw
       or rack
       or uni_op
       or bar_cmplt
       or l1_err_t
       or l2_sh
       or memr_cmplt
       or ace_cfig
       or l1_pd
       or ws
       or main_cur_state
       or evict
       or rd_alct
       or cu
       or snpext
       or cp_vld
       or mi
       or memw_cmplt
       or l2c_cmplt
       or back
       or reply
       or snp_cmplt
       or depd_vld
       or bar_raw
       or req_vld
       or l2c_req_mask
       or l1orl2_dirty
       or ebiu_cr_done)
begin
  case(main_cur_state)
  IDLE: begin
    if (req_vld && !bar_raw) begin
      if (depd_vld_raw | wt_raw)
        main_next_state = DEPD;
      else
        main_next_state = L2C;
    end
    else if (req_vld && bar_raw)
      main_next_state = BAR;
    else
      main_next_state = IDLE;
  end
  DEPD: begin
    if (!depd_vld & (!wt_val | evict | l1_wdata_vld))
      main_next_state = L2C;
    else if (!depd_vld & l1_wdata_err)
      main_next_state = ECC_ERR;
    else
      main_next_state = DEPD;
  end
  L2C: begin
    if (l2c_cmplt & !l2_err) begin
      if (cp_vld) 
        main_next_state = SNOP;
      else if (evict | csl1) 
        main_next_state = POP;  //csl1 + evict
      else if (!depd_vld & (cml2 | snpl2))
        main_next_state = L2CW; //csl2 + ci + mi + snpl2
      else if (cml2 | snpl2)
        main_next_state = L2C;
      else if (l2_hit) begin //l2 hit
        if (uni_op & l2_sh & !snpext)
          main_next_state = MEMR;   // ru + cu + wu + wlu
        else if (ws)
          main_next_state = L2CR;   //wu + wlu
        else 
          main_next_state = L2CW;   //rns + ro + rs + ru + cu + wns + ro_ext + l2_prf
      end
      else if (snpext)
        main_next_state = CR;
      else if (rd_alct)          
        main_next_state = L2CA;  //rns_line + rs + ru + l2_prf 
      else if (wns)
        main_next_state = MEMW;  //wns
      else 
        main_next_state = (ace_cfig | ro | rns) ? MEMR : (cu ? L2CW : L2CR);  //ro + rns_part + cu + wu + wlu
    end
    else if (l2c_cmplt & l2_err)
      main_next_state = ECC_ERR;
    else
      main_next_state = L2C;
  end
  SNOP: begin
    if (snp_cmplt & !depd_vld & !l1_err_t) begin
      if (reply | ws & !l2_sh)   //rd + wu + wlu
        main_next_state = L2CR;
      else if (csl1 & !l1_pd)
        main_next_state = POP;   //csl1
      else if (uni_op & l2_sh & !snpext)   //ru + cu + wu + wlu
        main_next_state = MEMR;
      else
        main_next_state = L2CW;  //ro + rs + ru + cu + csl1 + csl2 + ci + mi + snpl2
    end
    else if (snp_cmplt & !depd_vld & l1_err_t)
      main_next_state = ECC_ERR;
    else
      main_next_state = SNOP;
  end 
  L2CR: begin
    if (l2c_cmplt & !l2_err)
      main_next_state = (!ws | l2_hit) ? L2CW : MEMW;
    else if (l2c_cmplt & l2_err)
      main_next_state = ECC_ERR;
    else
      main_next_state = L2CR;
  end
  L2CA: begin
    if (alct_cmplt)
      main_next_state = MEMR;
    else if (alct_ecc_err)
      main_next_state = ECC_ERR;
    else
      main_next_state = L2CA;
  end
  MEMR: begin
    if ((memr_cmplt_f | memr_cmplt) & snpl2_done)begin
      if (cml2)
         main_next_state = POP;
      else if (ru)
         main_next_state = L2CT;   //ru
      else if (ws)
         main_next_state = L2CR;   //wu + wlu
      else
         main_next_state =  L2CW;  // rns + ro + rs + cu
    end
    else 
      main_next_state = MEMR;
  end
  L2CT: begin
    if (l2c_cmplt & !l2_err)
      main_next_state = ru_miss_by_snpext ? L2CA : L2CW;
    else if (l2c_cmplt & l2_err)
      main_next_state = ECC_ERR;
    else
      main_next_state = L2CT;
  end
  L2CW: begin
    if (l2c_cmplt & !l2_err | l2c_req_mask) begin
      if (snpext)
        main_next_state = CR;
      else if (snpl2)
        main_next_state = (ace_cfig | l1orl2_dirty) ? MEMW : POP;
      else if (cml2)
        main_next_state = (l1orl2_dirty & !mi) ? MEMW : (ace_cfig ? MEMR : POP);
      else 
        main_next_state = POP; //rns + ro + rs + ru + cu + wu + wlu + csl1 + wns
    end
    else if (l2c_cmplt & l2_err)
      main_next_state = ECC_ERR;
    else
      main_next_state = L2CW;
  end
  MEMW: begin
    if (memw_cmplt)
      main_next_state = (cml2 & ace_cfig) ? MEMR : POP;
    else
      main_next_state = MEMW;
  end
  CR: begin
    if (ebiu_cr_done)
      main_next_state = IDLE;
    else 
      main_next_state = CR;
  end
  POP: begin
    if (rack | back | snpl2)
      main_next_state = IDLE;
    else
      main_next_state = POP;
  end
  BAR: begin
    if (bar_cmplt)
      main_next_state = IDLE;
    else
      main_next_state = BAR;
  end
  ECC_ERR: begin
    if (snpext) begin
      if (ebiu_cr_done)
        main_next_state = IDLE;
      else
        main_next_state = ECC_ERR;
    end
    else begin
      if (rack | back | snpl2)
        main_next_state = IDLE;
      else
        main_next_state = ECC_ERR;
    end
  end
  default:
    main_next_state = IDLE;
  endcase
// &CombEnd; @277
end

//main fsm input signal
assign req_vld      = x_cen;
//cp_vld: indicate that snoop should be trigger.
assign cp_vld       = |cp_after_mask[3:0] & !(rns | wns | evict | l2_prf);
assign uni_op       = ru | cu | ws;
assign wns          = wns_i | wc | wb;
assign ws           = wu | wlu;
assign rd           = rns | ro | rs | ru;
assign rd_alct      = rns & !part_req | rs | ru | l2_prf;
assign l1orl2_dirty = l1_pd | l2_pd;
assign cml2         = csl2 | ci & !snpl2 | mi;
assign cmop         = cml2 | csl1;
assign reply        = wns_pend & rd & !(l1_dt | l2_sh);

//main fsm output
assign l2c_req_mask = rns & part_req | ro | l2_prf & l2_hit;// | rs & !snpext & l2_hit & !l1_pd;
assign l2c_req_vld  = (main_cur_state == IDLE) & req_vld & !bar_raw & !depd_vld_raw & !wt_raw | 
                      (main_cur_state == DEPD)  & !depd_vld & (!wt_val | evict | l1_wdata_vld) |  //all request should first request L2C
                      (main_cur_state != L2CR) & (main_next_state == L2CR) |    //L2CR, for rd reply and ws
                      (main_cur_state == L2CA) & alct_req_en |    //& arb_sab_no_l2c_req |    //L2CA, for rd_alct
                      (main_cur_state != L2CW) & (main_next_state == L2CW) & !l2c_req_mask |    //L2CW, RO need not updt l2 or l1 states
                      (main_cur_state != L2CT) & (main_next_state == L2CT);      //L2CT
assign rresp_rdy    = !wt_val & !snpext & !snpl2 & !l2_prf_from_l2c &
                           (
                            (!l2_prf & (rns | ro | rs | cu | ru)) & (main_cur_state != L2CW) & (main_next_state == L2CW) | 
                            csl1 & ((main_next_state == POP)  & (main_cur_state != L2CW) & (main_cur_state != POP) | 
                                    (main_cur_state != L2CW) & (main_next_state == L2CW)) |
                            cml2 & (main_next_state == POP) & (main_cur_state != POP) |
                            (main_cur_state != ECC_ERR) & (main_next_state == ECC_ERR)
                           );

assign snp_req_vld  = (main_cur_state == L2C) & l2c_cmplt & !l2_err & cp_vld;
assign memr_req_vld = (main_cur_state != MEMR) & (main_next_state == MEMR); 
assign memw_req_vld = (main_cur_state != MEMW) & (main_next_state == MEMW);
assign set_process  = req_vld & wns_raw | 
                      (main_cur_state != L2C) & (main_next_state == L2C) | 
                      (main_cur_state == MEMR) & (memr_cmplt_f | memr_cmplt) & snpl2_done;
assign clr_process  = (main_cur_state != MEMR) & (main_next_state == MEMR) | 
                      (main_cur_state != IDLE) & (main_next_state == IDLE);
assign data_sel_l1c = (main_cur_state == SNOP) | wt_val & (main_cur_state == DEPD);
assign data_sel_l2c = (main_cur_state == L2C) | (main_cur_state == L2CR) | (main_cur_state == L2CW);
assign data_sel_mem = (main_cur_state == MEMR);
assign snpl2_cmplt  = ((main_cur_state == POP) | (main_cur_state == ECC_ERR)) & snpl2;

assign fsm_busy     = !(main_cur_state == IDLE);
assign vld          = !((main_cur_state == IDLE) | pop_en);
assign pop_en       = (main_cur_state == CR) & ebiu_cr_done |
                      (main_cur_state == POP) & (rack | back | snpl2) |
                      (main_cur_state == BAR) & bar_cmplt |
                      (main_cur_state == ECC_ERR) & (snpext & ebiu_cr_done | !snpext & (rack | back | snpl2));

assign sab_pop_en_x = pop_en;

assign ace_cfig = 1'b0;
//------------------------------------------------
//               WNS Pending
//------------------------------------------------
always@(posedge fsm_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    wns_pend <= 1'b0;
  else if (x_cen)
    wns_pend <= 1'b0;
  else if (sab_depd_set_by_wns_x)
    wns_pend <= 1'b1;
end

//------------------------------------------------
//       read allocate
//------------------------------------------------
always@(posedge fsm_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    set_alct <= 1'b0;
  else if (x_cen)
    set_alct <= 1'b0;
  else if ((main_cur_state == L2CA) & alct_cmplt)
    set_alct <= 1'b1;
end

//------------------------------------------------
//               SNPL2_DONE
//------------------------------------------------
//when created, snpl2_done is set; for rd need alct, snpl2_done is cleared when l2ca;
always@(posedge fsm_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    snpl2_done <= 1'b0;
  else if (x_cen)
    snpl2_done <= 1'b1;
  else if ((main_cur_state != L2CA) & (main_next_state == L2CA))
    snpl2_done <= 1'b0;
  else if (sab_snpl2_cmplt_x | alct_done)
    snpl2_done <= 1'b1;
end

//------------------------------------------------
//            In Processing Flag
//------------------------------------------------
//for wns, set process when creating
//for other transaction, ws and rns\rs, set process when dependency is resolved and begin to access L2C.

always@(posedge fsm_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    _process <= 1'b0;
  else if (x_cen & !set_process)
    _process <= wns_raw | evict_raw;
  else if (!_process & set_process)
    _process <= 1'b1;
  else if (_process & clr_process)
    _process <= 1'b0;
end

assign sab_in_process_x = _process | set_process;

//==========================================================
//               L2C REQ FSM
//==========================================================
parameter L2C_IDLE = 2'b00;
parameter L2C_REQ  = 2'b01;
parameter L2C_WAIT = 2'b10;

always@(posedge fsm_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    l2c_cur_state[1:0] <= L2C_IDLE;
  else 
    l2c_cur_state[1:0] <= l2c_nxt_state[1:0];
end

// &CombBeg; @417
always @( l2c_req_vld
       or l2c_cmplt_x
       or l2c_cur_state
       or l2c_grant_x)
begin
  case (l2c_cur_state)
  L2C_IDLE: begin
    if (l2c_req_vld)
      l2c_nxt_state = L2C_REQ;
    else 
      l2c_nxt_state = L2C_IDLE;
  end
  L2C_REQ: begin
    if(l2c_grant_x)
      l2c_nxt_state = L2C_WAIT;
    else 
      l2c_nxt_state = L2C_REQ;
  end
  L2C_WAIT: begin
    if (l2c_cmplt_x)
      l2c_nxt_state = L2C_IDLE;
    else
      l2c_nxt_state= L2C_WAIT;
  end
  default: l2c_nxt_state = L2C_IDLE;
  endcase
// &CombEnd; @439
end

always@(posedge fsm_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    alct_cnt <= 1'b0;
  else if (x_cen)
    alct_cnt <= 1'b0;
  else if ((main_cur_state != L2CA) & (main_next_state == L2CA))
    alct_cnt <= 1'b0;
  else if ((main_cur_state == L2CA) & (l2c_cur_state == L2C_IDLE) & l2c_req_vld)
    alct_cnt <= 1'b1;
end

assign alct_req_en = !alct_cnt | arb_sab_no_l2c_req;

assign l2c_cmplt = (l2c_cur_state == L2C_IDLE);

//------------------------------------------------
//        L2C REQ
//------------------------------------------------
parameter L2C_ADDR_WIDTH = 64;

assign req_addr[ADDRW-1:0] = sab_cont[ADDR_H:ADDR_0];

assign sab_l2c_req_x = (l2c_cur_state == L2C_REQ);

assign x_l2c_addr_bus[L2C_ADDR_WIDTH-1:0] = {req_addr[ADDRW-1:7],
                                             mid[2:0],
                                             tlb,inst,
                                             req_type[12:0],
                                             clr_cp_sel[3:0],
                                             set_cp_sel[3:0],
                                             x_sid[4:0]};

assign x_l2c_data_bus[511:0] = data[511:0];


assign rd_first = rd & (main_cur_state == L2C);
assign wr_first = wt_val & (main_cur_state == L2C);
assign x_l2c_hpcp_bus[2:0] = {1'b0,wr_first,rd_first};

//================================================
//          SNP0_FSM
//================================================
//------------------------------------------------
//         SNP0 REQ FSM
//------------------------------------------------
parameter SNP0_IDLE = 2'b00;
parameter SNP0_REQ  = 2'b10;
parameter SNP0_WAIT = 2'b01;
parameter SNP0_CD   = 2'b11;
parameter DT = 0;
always@(posedge snp_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    snp0_cur_state[1:0] <= SNP0_IDLE;
  else
    snp0_cur_state[1:0] <= snp0_next_state[1:0];
end

// &CombBeg; @500
always @( piu0_crresp[0]
       or snp0_cur_state
       or snp0_req_vld
       or piu0_ac_grant_x
       or piu0_cdvld_x
       or piu0_crvld_x)
begin
  case (snp0_cur_state)
  SNP0_IDLE: begin
    if (snp0_req_vld)
      snp0_next_state = SNP0_REQ;
    else
      snp0_next_state = SNP0_IDLE;
  end
  SNP0_REQ: begin
    if (piu0_ac_grant_x)
      snp0_next_state = SNP0_WAIT;
    else
      snp0_next_state = SNP0_REQ;
  end
  SNP0_WAIT: begin
    if (piu0_crvld_x & piu0_crresp[DT])
      snp0_next_state = SNP0_CD;
    else if (piu0_crvld_x)
      snp0_next_state = SNP0_IDLE;
    else
      snp0_next_state = SNP0_WAIT;
  end      
  SNP0_CD: begin
    if (piu0_cdvld_x)
      snp0_next_state = SNP0_IDLE;
    else
      snp0_next_state = SNP0_CD;
  end
  default: snp0_next_state = SNP0_IDLE;
  endcase
// &CombEnd; @530
end

assign snp0_cmplt = (snp0_cur_state == SNP0_WAIT) & piu0_crvld_x & !piu0_crresp[DT] | 
                    (snp0_cur_state == SNP0_CD)   & piu0_cdvld_x |
                    (snp0_cur_state == SNP0_IDLE);

//SNP0_REQ
assign sab_piu0_ac_req_x = (snp0_cur_state == SNP0_REQ);

//------------------------------------------------
//         SNP1 REQ FSM
//------------------------------------------------
parameter SNP1_IDLE = 2'b00;
parameter SNP1_REQ  = 2'b10;
parameter SNP1_WAIT = 2'b01;
parameter SNP1_CD   = 2'b11;

always@(posedge snp_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    snp1_cur_state[1:0] <= SNP1_IDLE;
  else
    snp1_cur_state[1:0] <= snp1_next_state[1:0];
end

// &CombBeg; @555
always @( piu1_cdvld_x
       or piu1_crresp[0]
       or snp1_cur_state
       or snp1_req_vld
       or piu1_ac_grant_x
       or piu1_crvld_x)
begin
  case (snp1_cur_state)
  SNP1_IDLE: begin
    if (snp1_req_vld)
      snp1_next_state = SNP1_REQ;
    else
      snp1_next_state = SNP1_IDLE;
  end
  SNP1_REQ: begin
    if (piu1_ac_grant_x)
      snp1_next_state = SNP1_WAIT;
    else
      snp1_next_state = SNP1_REQ;
  end
  SNP1_WAIT: begin
    if (piu1_crvld_x & piu1_crresp[DT])
      snp1_next_state = SNP1_CD;
    else if (piu1_crvld_x)
      snp1_next_state = SNP1_IDLE;
    else
      snp1_next_state = SNP1_WAIT;
  end      
  SNP1_CD: begin
    if (piu1_cdvld_x)
      snp1_next_state = SNP1_IDLE;
    else
      snp1_next_state = SNP1_CD;
  end
  default: snp1_next_state = SNP1_IDLE;
  endcase
// &CombEnd; @585
end

assign sab_piu1_ac_req_x = (snp1_cur_state == SNP1_REQ);
assign snp1_cmplt = (snp1_cur_state == SNP0_WAIT) & piu1_crvld_x & !piu1_crresp[DT] | 
                    (snp1_cur_state == SNP0_CD)   & piu1_cdvld_x |
                    (snp1_cur_state == SNP0_IDLE);

//------------------------------------------------
//         SNP2 REQ FSM
//------------------------------------------------
parameter SNP2_IDLE = 2'b00;
parameter SNP2_REQ  = 2'b10;
parameter SNP2_WAIT = 2'b01;
parameter SNP2_CD   = 2'b11;

always@(posedge snp_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    snp2_cur_state[1:0] <= SNP2_IDLE;
  else
    snp2_cur_state[1:0] <= snp2_next_state[1:0];
end

// &CombBeg; @608
always @( piu2_cdvld_x
       or piu2_crresp[0]
       or snp2_cur_state
       or piu2_crvld_x
       or snp2_req_vld
       or piu2_ac_grant_x)
begin
  case (snp2_cur_state)
  SNP2_IDLE: begin
    if (snp2_req_vld)
      snp2_next_state = SNP2_REQ;
    else
      snp2_next_state = SNP2_IDLE;
  end
  SNP2_REQ: begin
    if (piu2_ac_grant_x)
      snp2_next_state = SNP2_WAIT;
    else
      snp2_next_state = SNP2_REQ;
  end
  SNP2_WAIT: begin
    if (piu2_crvld_x & piu2_crresp[DT])
      snp2_next_state = SNP2_CD;
    else if (piu2_crvld_x)
      snp2_next_state = SNP2_IDLE;
    else
      snp2_next_state = SNP2_WAIT;
  end      
  SNP2_CD: begin
    if (piu2_cdvld_x)
      snp2_next_state = SNP2_IDLE;
    else
      snp2_next_state = SNP2_CD;
  end
  default: snp2_next_state = SNP2_IDLE;
  endcase
// &CombEnd; @638
end

assign sab_piu2_ac_req_x = (snp2_cur_state == SNP2_REQ);
assign snp2_cmplt = (snp2_cur_state == SNP0_WAIT) & piu2_crvld_x & !piu2_crresp[DT] | 
                    (snp2_cur_state == SNP0_CD)   & piu2_cdvld_x |
                    (snp2_cur_state == SNP0_IDLE);

//------------------------------------------------
//         SNP3 REQ FSM
//------------------------------------------------
parameter SNP3_IDLE = 2'b00;
parameter SNP3_REQ  = 2'b10;
parameter SNP3_WAIT = 2'b01;
parameter SNP3_CD   = 2'b11;

always@(posedge snp_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    snp3_cur_state[1:0] <= SNP3_IDLE;
  else
    snp3_cur_state[1:0] <= snp3_next_state[1:0];
end

// &CombBeg; @661
always @( snp3_cur_state
       or piu3_crresp[0]
       or piu3_cdvld_x
       or piu3_ac_grant_x
       or snp3_req_vld
       or piu3_crvld_x)
begin
  case (snp3_cur_state)
  SNP3_IDLE: begin
    if (snp3_req_vld)
      snp3_next_state = SNP3_REQ;
    else
      snp3_next_state = SNP3_IDLE;
  end
  SNP3_REQ: begin
    if (piu3_ac_grant_x)
      snp3_next_state = SNP3_WAIT;
    else
      snp3_next_state = SNP3_REQ;
  end
  SNP3_WAIT: begin
    if (piu3_crvld_x & piu3_crresp[DT])
      snp3_next_state = SNP3_CD;
    else if (piu3_crvld_x)
      snp3_next_state = SNP3_IDLE;
    else
      snp3_next_state = SNP3_WAIT;
  end      
  SNP3_CD: begin
    if (piu3_cdvld_x)
      snp3_next_state = SNP3_IDLE;
    else
      snp3_next_state = SNP3_CD;
  end
  default: snp3_next_state = SNP3_IDLE;
  endcase
// &CombEnd; @691
end

assign sab_piu3_ac_req_x = (snp3_cur_state == SNP3_REQ);
assign snp3_cmplt = (snp3_cur_state == SNP0_WAIT) & piu3_crvld_x & !piu3_crresp[DT] | 
                    (snp3_cur_state == SNP0_CD)   & piu3_cdvld_x |
                    (snp3_cur_state == SNP0_IDLE);

//================================================
//         AC data path
//================================================
parameter AC_WIDTH = 55;

assign snp_clk_en = snp_req_vld || snp_fsm_busy;
// &Instance("gated_clk_cell", "x_snp_fsm_gated_clk"); @704
gated_clk_cell  x_snp_fsm_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (snp_clk           ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (snp_clk_en        ),
  .module_en          (ciu_icg_en        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @705
//          .external_en (1'b0), @706
//          .global_en   (1'b1), @707
//          .module_en (ciu_icg_en       ), @708
//          .local_en    (snp_clk_en), @709
//          .clk_out     (snp_clk)); @710

assign snp_req_en[3:0] = {4{snp_req_vld}} & cp_after_mask[3:0];

assign snp0_req_vld = snp_req_en[0];
assign snp1_req_vld = snp_req_en[1];
assign snp2_req_vld = snp_req_en[2];
assign snp3_req_vld = snp_req_en[3];

assign snp0_fsm_busy = !(snp0_cur_state == SNP0_IDLE);
assign snp1_fsm_busy = !(snp1_cur_state == SNP1_IDLE);
assign snp2_fsm_busy = !(snp2_cur_state == SNP2_IDLE);
assign snp3_fsm_busy = !(snp3_cur_state == SNP3_IDLE);

assign snp_fsm_busy  = snp0_fsm_busy | snp1_fsm_busy | snp2_fsm_busy | snp3_fsm_busy;

assign snp_cmplt = snp0_cmplt & snp1_cmplt & snp2_cmplt & snp3_cmplt;

assign acsnoop[3:0] = (cu | snpl2 | ru | wu) 
                    ? 4'b1001                       //CI
                    : ((mu | wlu) ? 4'b1101         //MI
                                  : (rs ? 4'b1000   //CS
                                        : sab_cont[SNOOP_3:SNOOP_0]));

assign x_piux_ac_bus[AC_WIDTH-1:0] = {req_addr[ADDRW-1:0],
                                      4'b0001, snb1,
                                      x_sid[4:0],
                                      inst,
                     //                 req_id[7:0],
                                      acsnoop[3:0]};

//================================================
//          MEMR_FSM
//================================================
parameter MEMR_IDLE = 2'b00;
parameter MEMR_REQ  = 2'b01;
parameter MEMR_WFD  = 2'b10;

always@(posedge fsm_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    memr_cur_state[1:0] <= MEMR_IDLE;
  else
    memr_cur_state[1:0] <= memr_nxt_state[1:0];
end
// &CombBeg; @755
always @( memr_req_vld
       or memr_cmplt_x
       or memr_ar_grant_x
       or memr_cur_state)
begin
  case(memr_cur_state)
  MEMR_IDLE: begin
    if (memr_req_vld)
      memr_nxt_state = MEMR_REQ;
    else
      memr_nxt_state = MEMR_IDLE;
  end
  MEMR_REQ: begin
    if (memr_ar_grant_x)
      memr_nxt_state = MEMR_WFD;
    else 
      memr_nxt_state = MEMR_REQ;
  end
  MEMR_WFD: begin
    if (memr_cmplt_x)
      memr_nxt_state = MEMR_IDLE;
    else
      memr_nxt_state = MEMR_WFD;
  end
  default: memr_nxt_state = MEMR_IDLE;
  endcase
// &CombEnd; @777
end

assign memr_cmplt = (memr_cur_state == MEMR_WFD) & memr_cmplt_x;
always@(posedge fsm_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    memr_cmplt_f <= 1'b0;
  else if (x_cen)
    memr_cmplt_f <= 1'b0;
  else if ((memr_cur_state == MEMR_IDLE) & memr_req_vld)
    memr_cmplt_f <= 1'b0;
  else if (memr_cmplt)
    memr_cmplt_f <= 1'b1;
end

// &Force("output", "sab_ebiur_req_x"); @792
assign sab_ebiur_req_x = (memr_cur_state == MEMR_REQ);

//================================================
//          MEMW_FSM
//================================================
parameter MEMW_IDLE = 2'b00;
parameter MEMW_REQ  = 2'b01;
parameter MEMW_WFC  = 2'b10;

always@(posedge fsm_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    memw_cur_state[1:0] <= MEMW_IDLE;
  else
    memw_cur_state[1:0] <= memw_nxt_state[1:0];
end
// &CombBeg; @809
always @( memw_req_vld
       or memw_cmplt_x
       or memw_aw_grant_x
       or memw_cur_state)
begin
  case(memw_cur_state)
  MEMW_IDLE: begin
    if (memw_req_vld)
      memw_nxt_state = MEMW_REQ;
    else
      memw_nxt_state = MEMW_IDLE;
  end
  MEMW_REQ: begin
    if (memw_aw_grant_x)
      memw_nxt_state = MEMW_WFC;
    else 
      memw_nxt_state = MEMW_REQ;
  end
  MEMW_WFC: begin
    if (memw_cmplt_x)
      memw_nxt_state = MEMW_IDLE;
    else
      memw_nxt_state = MEMW_WFC;
  end
  default: memw_nxt_state = MEMW_IDLE;
  endcase
// &CombEnd; @831
end

assign memw_cmplt = (memw_cur_state == MEMW_WFC) & memw_cmplt_x;

assign sab_ebiuw_req_x = (memw_cur_state == MEMW_REQ);

//------------------------------------------------
//         MEM REQ
//------------------------------------------------
parameter EBIU_AR_WIDTH = 69;
parameter EBIU_AW_WIDTH = 68;
parameter EBIU_D_WIDTH  = 535;

assign ebiu_burst[1:0] = sab_cont[BURST_1:BURST_0];
assign ebiu_cache[3:0] = sab_cont[CACHE_3:CACHE_0];
assign ebiu_prot[2:0]  = sab_cont[PROT_2:PROT_0];
assign ebiu_size[2:0]  = sab_cont[SIZE_2:SIZE_0];
assign ebiu_bar[1:0]     = sab_cont[BAR_1:BAR_0];
assign ebiu_domain[1:0]  = sab_cont[DOMAIN_1:DOMAIN_0];
assign ebiu_arlen[1:0]   = wu ? 2'b11 : sab_cont[LEN_1:LEN_0];
assign ebiu_awlen[1:0]   = sab_cont[LEN_1:LEN_0];
assign araddr_5_0[5:0]   = ebiu_arlen_4 ? 6'b0 : sab_cont[ADDR_5:ADDR_0];
assign awaddr_5_0[5:0]   = ebiu_awlen_4 ? 6'b0 : sab_cont[ADDR_5:ADDR_0];
assign ebiu_araddr[ADDRW-1:0] = {sab_cont[ADDR_H:ADDR_6], araddr_5_0[5:0]};
assign ebiu_awaddr[ADDRW-1:0] = {sab_cont[ADDR_H:ADDR_6], awaddr_5_0[5:0]};
assign ebiu_arsnoop[3:0] = (wu | ru & l2_sh) ? 4'b1011                //CU
                                             : (wlu ? 4'b1100         //MU
                                                    : sab_cont[SNOOP_3:SNOOP_0]);
assign ebiu_awsnoop[2:0] = wns_i ? 3'b000 
                                 : (cs ? 3'b010 
                                       : ((snpl2 & !l1orl2_dirty) ? 3'b100       //EVICT to L3
                                                                  : 3'b011));

assign ebiu_arlen_4      = &ebiu_arlen[1:0];
assign ebiu_awlen_4      = &ebiu_awlen[1:0];
assign ebiu_awlen_1      = ~(|ebiu_awlen[1:0]);
assign ebiu_wstrb[15:0]  = wstrb[15:0];
assign ebiu_wdata[511:0] = data[511:0];

assign ebiu_arbus[EBIU_AR_WIDTH-1:0] = {ebiu_arsnoop[3:0],
                                        snb1, x_sid[4:0],
                                        ebiu_bar[1:0],
                                        ebiu_domain[1:0],
                                        ebiu_burst[1:0],
                                        ebiu_cache[3:0],
                                        ebiu_arlen[1:0],
                                        1'b0,      //lock
                                        ebiu_prot[2:0],
                                        ebiu_size[2:0],
                                        ebiu_araddr[ADDRW-1:0]};

assign ebiu_awbus[EBIU_AW_WIDTH-1:0] = {ebiu_awsnoop[2:0],
                                        snb1, x_sid[4:0],
                                        ebiu_bar[1:0],
                                        ebiu_domain[1:0],
                                        ebiu_burst[1:0],
                                        ebiu_cache[3:0],
                                        ebiu_awlen[1:0],
                                        1'b0,      //lock
                                        ebiu_prot[2:0],
                                        ebiu_size[2:0],
                                        ebiu_awaddr[ADDRW-1:0]};

assign x_ebiu_arbus[EBIU_AR_WIDTH-1:0] = ebiu_arbus[EBIU_AR_WIDTH-1:0];
assign x_ebiu_awbus[EBIU_AW_WIDTH-1:0] = ebiu_awbus[EBIU_AW_WIDTH-1:0];

assign x_ebiu_dbus[EBIU_D_WIDTH-1:0] = {ebiu_awlen_1,
                                        snb1,x_sid[4:0],
                                        ebiu_wstrb[15:0],
                                        ebiu_wdata[511:0]};
assign x_ebiu_mid[2:0] = mid[2:0];


//================================================
//               EBIU CR
//================================================
assign ebiu_cr_done = 1'b0;
//================================================
//              Rresp
//================================================
parameter R_WIDTH = 536;

always@(posedge fsm_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    rresp_rdy_f <= 1'b0;
  else if (x_cen)
    rresp_rdy_f <= 1'b0;
  else if (rresp_rdy)
    rresp_rdy_f <= 1'b1;
  else if (sab_r_grant_x)
    rresp_rdy_f <= 1'b0;
end

assign sab_rresp_req_x = rresp_rdy_f;

assign rresp_is      = l1_sh | l2_sh | memr_sh;
assign rresp_err[3:0]   = memr_resp_f_err[3:0] |
                          {4{l1_err | l2_err}};
assign rresp_ecc_err = l1_err | l2_err;
assign rresp[6:0]    = {rresp_is, 1'b0, rresp_err[3:0], rresp_ecc_err};
assign addr_5_4[1:0] = sab_cont[ADDR_5:ADDR_4];
assign len[1:0]      = sab_cont[SNOOP_3] 
                     ? 2'b00 
                     : sab_cont[LEN_1:LEN_0]; //len of CU\CS\CI\MI is transferred from 3 to 0.

assign x_rresp_bus[R_WIDTH-1:0] = {data[511:0],
                                   len[1:0],
                                   addr_5_4[1:0],
                                   x_sid[4:0],
                                   req_id[7:0],
                                   rresp[6:0]};

//================================================
//              Bresp
//================================================
parameter B_WIDTH = 15;

always@(posedge fsm_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    bresp_already_rdy <=  1'b0;
  else if (x_cen)
    bresp_already_rdy <=  1'b0;
  else if (bresp_rdy)
    bresp_already_rdy <=  1'b1;
end

always@(posedge fsm_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    bresp_rdy_f <= 1'b0;
  else if (x_cen)
    bresp_rdy_f <= 1'b0;
  else if (bresp_rdy)
    bresp_rdy_f <= 1'b1;
  else if (sab_b_grant_x)
    bresp_rdy_f <= 1'b0;
end

assign bresp_rdy = wt_val & (l1_wen_x | evict) & (main_cur_state == DEPD) & ~bresp_already_rdy;

assign sab_bresp_req_x = bresp_rdy_f;
assign x_bresp_bus[B_WIDTH-1:0] = {x_sid[4:0], 
                                   req_id[7:0],
                                   2'b0};

//==============================================================================
//                           sab entry content
//==============================================================================

assign x_cen    = sab_cen_x;
assign x_cbus[SAB_WIDTH-1:0] = create_bus[SAB_WIDTH-1:0];

assign sab_clk_en = x_cen;
// &Instance("gated_clk_cell", "x_sab_gated_clk"); @1046
gated_clk_cell  x_sab_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (sab_clk           ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (sab_clk_en        ),
  .module_en          (ciu_icg_en        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @1047
//          .external_en (1'b0), @1048
//          .global_en   (1'b1), @1049
//          .module_en (ciu_icg_en       ), @1050
//          .local_en    (sab_clk_en), @1051
//          .clk_out     (sab_clk)); @1052

always@(posedge sab_clk or negedge cpurst_b)
begin
  if(~cpurst_b)
    sab_cont[SAB_WIDTH-1:0] <= {SAB_WIDTH{1'b0}};
  else if (x_cen)
    sab_cont[SAB_WIDTH-1:0] <= x_cbus[SAB_WIDTH-1:0];
end

assign bar_raw = x_cbus[BAR_0];
assign wt_raw  = x_cbus[WT];
assign l2_prf_raw = x_cbus[USER_2] & !wt_raw;
assign wns_raw = wt_raw & 
                ((x_cbus[SNOOP_2:SNOOP_0] == 3'b000) & (x_cbus[DOMAIN_1:DOMAIN_0] != 2'b01) | //WriteNoSnoop
                 (x_cbus[SNOOP_2:SNOOP_0] == 3'b011) | //WriteBack
                 (x_cbus[SNOOP_2:SNOOP_0] == 3'b010)); //writeclean

assign evict_raw = wt_raw & (x_cbus[SNOOP_2:SNOOP_0] == 3'b100); //EVICT

assign x_mid[2:0]  = x_cbus[MID_2:MID_0];
assign mid[2:0]    = sab_cont[MID_2:MID_0];
assign rid[4:0]    = sab_cont[ID_4:ID_0];
assign req_id[7:0] = {mid[2:0], rid[4:0]};

assign piu_sel[0] = (mid[2:0] == 3'b000);
assign piu_sel[1] = (mid[2:0] == 3'b001);
assign piu_sel[2] = (mid[2:0] == 3'b010);
assign piu_sel[3] = (mid[2:0] == 3'b011);

assign wt_val  = sab_cont[WT];
assign rs  = !wt_val & (sab_cont[SNOOP_3:SNOOP_0] == 4'b0001);//ReadShared
assign ru  = !wt_val & (sab_cont[SNOOP_3:SNOOP_0] == 4'b0111);//ReadUnique
assign rns = !wt_val & (sab_cont[SNOOP_3:SNOOP_0] == 4'b0) &  //ReadNoSnoop && NonShareable(lsu)
                   (sab_cont[DOMAIN_1:DOMAIN_0] == 2'b00);
assign ro  = !wt_val & (sab_cont[SNOOP_3:SNOOP_0] == 4'b0) &  //ReadOnce
                   (sab_cont[DOMAIN_1:DOMAIN_0] == 2'b01);
assign cu  = !wt_val & (sab_cont[SNOOP_3:SNOOP_0] == 4'b1011);//CleanUnique
assign ci  = !wt_val & (sab_cont[SNOOP_3:SNOOP_0] == 4'b1001);//CleanInvalid
assign cs  = !wt_val & (sab_cont[SNOOP_3:SNOOP_0] == 4'b1000);//ClaenShared
assign mi  = !wt_val & (sab_cont[SNOOP_3:SNOOP_0] == 4'b1101);//MakeInvalid
assign mu  = !wt_val & (sab_cont[SNOOP_3:SNOOP_0] == 4'b1100);//MakeUnique

assign csl1 = cs & (sab_cont[CACHE_3:CACHE_2] == 2'b00);
assign csl2 = cs & (sab_cont[CACHE_3:CACHE_2] != 2'b00);

assign wu    = wt_val & (sab_cont[SNOOP_2:SNOOP_0] == 3'b000) & !bar_val[0] &
                    (sab_cont[DOMAIN_1:DOMAIN_0] == 2'b01);
assign wlu   = wt_val & (sab_cont[SNOOP_2:SNOOP_0] == 3'b001);
assign wns_i = wt_val & (sab_cont[SNOOP_2:SNOOP_0] == 3'b000) & !bar_val[0] &
                    (sab_cont[DOMAIN_1:DOMAIN_0] == 2'b00);//WriteNoSnoop
assign wb    = wt_val & (sab_cont[SNOOP_2:SNOOP_0] == 3'b011);//WriteBack
assign wc    = wt_val & (sab_cont[SNOOP_2:SNOOP_0] == 3'b010);//WriteClean
assign evict = wt_val & (sab_cont[SNOOP_2:SNOOP_0] == 3'b100);//evict

assign inst   = (sab_cont[PROT_2]);
assign snpl2  = !wt_val & (mid[2:0] == 3'b111);
assign snpext = !wt_val & (mid[2:0] == 3'b110);
assign tlb    = sab_cont[USER_0];
assign l2_prf = ((mid[2:0] == 3'b101) || sab_cont[USER_2]) && !wt_val;
assign l2_prf_from_l2c = (mid[2:0] == 3'b101) & !wt_val;

assign l2_prf_from_l2c_raw = (x_mid[2:0] == 3'b101) & ~wt_raw;
assign part_req = !(&sab_cont[LEN_1:LEN_0]);

//------------------------------------------------
//        l2c request type
//------------------------------------------------
//read:     0000, read a cache line
//allocate: 0001, fine an entry and request SAB if the replaced line is valid
//clean:    0010, read dirty cache line, clr dirty bit of L2C
//clean&inv:0011, read dirty cache line, clr dirty bit of L2C, clr vld bit of L2C
//write SD: 0111, write a cache line, set shared and dirty bit of L2C
//write UC: 0100, write a cache line, set unique and clean bit of L2C
//write UD: 0101, wirte a cache line, set unique and dirty bit of L2C
//write SC: 0110, wirte a cache line, set shared and clean bit of L2C
//acc_tag:  1000, read L2C tag, return CP and L2C states
//invalid:  1100, clr vld bit of L2C
////release:  1101, clr pending bit of L2C
//unique:   1110, set unique bit of L2C
//shared:   1111, set shared bit of L2C

assign req_read = (main_cur_state == L2C) & (rd & !l2_prf | wns & part_req) |
                  (main_cur_state == L2CR) & !wlu;

assign req_alct = (main_cur_state == L2CA);

assign req_cln  = (main_cur_state == L2CW) & csl2 & !l1_pd;
assign req_icln = (main_cur_state == L2CW) & ci & !l1_pd;
assign req_wtsd = (main_cur_state == L2CW) & (
                     rs & !snpext & memr_sd & !l2_hit |
                     rs & snpext & l1_pd
                  );
assign req_wtuc = (main_cur_state == L2CW) & (
                     (rns & !part_req | rs | ru ) & !snpext & memr_uc & !l2_hit | 
                     (csl2 & l1_pd)
                  );
assign req_wtud = (main_cur_state == L2CW) & (
                      ((rs | ru) & !snpext | cu | csl1) & l1_pd | 
                      (rs | ru) & !snpext & memr_ud & !l2_hit  |
                       wu | wlu | wns 
                   );
assign req_wtsc = (main_cur_state == L2CW) & 
                     rs & !snpext & memr_sc & !l2_hit;
assign req_atag = (main_cur_state == L2C) & (cu | snpl2 | cmop | wu | wlu | wns & !part_req | evict | l2_prf) |
                  (main_cur_state == L2CR) & wlu |
                  (main_cur_state == L2CT);
assign req_inv  = (main_cur_state == L2CW) & (ci & l1_pd | mi | ru & snpext);
assign req_rls  = ((main_cur_state == L2CW) & memr_err | (main_cur_state == L2CT) & l2_err) & set_alct;  // L2CT: l2_hit it also can reach this state, so release is wrong.
assign req_uni  = (main_cur_state == L2CW) & (ru & !snpext & l2_hit | cu) & !l1_pd;
assign req_sh   = (main_cur_state == L2CW) & rs & snpext & l2_hit & !l1_pd;

//rs:!snpext & l2_hit &!l1_pd 
//rns:l2_hit
//it should setcp, but req_type is 0.
assign req_type[12:0] = {req_read,req_alct,req_cln, req_icln,
                         req_wtsd,req_wtuc,req_wtud,req_wtsc,
                         req_atag,req_inv, req_rls, req_uni, req_sh};

////lock
//assign req_lock = (main_cur_state == L2C) & wns;
//clr_cp
assign clr_cp_vld  = (main_cur_state == L2C) & (ru | cu | ws | wb | ci | mi | evict);
assign clr_cp[3:0] = (wb | evict) ? piu_sel[3:0] : ~piu_sel[3:0];
assign clr_cp_sel[3:0] = {4{clr_cp_vld}} & clr_cp[3:0];

//set_cp 
assign set_cp_vld  = (main_cur_state == L2CW) & rd_alct & !l2_prf;
assign set_cp[3:0] = piu_sel[3:0];
assign set_cp_sel[3:0] = {4{set_cp_vld}} & set_cp[3:0];

//------------------------------------------------
//        back mark for WNS
//------------------------------------------------
assign back_mark = rns & (main_cur_state == DEPD) |
                  !rns & !wns & !evict & ((main_cur_state == DEPD) | 
                                          (main_cur_state == L2C) | 
                                          (main_cur_state == SNOP) & !snp_cmplt);

assign sab_back_mark_by_wns_x = back_mark;

//--------------------------------------
// initial snpl2 sid
//--------------------------------------
parameter PTR_EXTENT = {{(DEPTH-1){1'b0}},1'b1};

always@(posedge sab_clk)
begin
  if (x_cen)
    snpl2_ini_sid[4:0] <= sab_snpl2_ini_sid[4:0];
end

assign x_sab_snpl2_cmplt[DEPTH-1:0] = (PTR_EXTENT << snpl2_ini_sid[4:0]) & {DEPTH{snpl2_cmplt}};
//--------------------------------------
//           depd_val
//x_depd_set : back mark for write req
//--------------------------------------

always@(posedge fsm_clk or negedge cpurst_b)
begin
  if(~cpurst_b)
    depd_val[DEPTH-1:0] <= {DEPTH{1'b0}};
  else if (x_cen)
    depd_val[DEPTH-1:0] <= create_depd[DEPTH-1:0];
  else if (vld)
    depd_val[DEPTH-1:0] <= depd_val[DEPTH-1:0] & (~depd_clr[DEPTH-1:0]) | x_depd_set[DEPTH-1:0];
  else
    depd_val[DEPTH-1:0] <= depd_val[DEPTH-1:0];
end

assign depd_vld = |depd_val[DEPTH-1:0];
assign depd_vld_raw = |create_depd[DEPTH-1:0];


//================================================
//                 L1 response
//================================================
parameter ERR = 1;
parameter PD  = 2;
parameter IS  = 3;

assign piu_crvld[3:0] = {piu3_crvld_x,piu2_crvld_x,piu1_crvld_x,piu0_crvld_x};
assign piu_crresp[4:0] = {5{piu3_crvld_x}} & piu3_crresp[4:0] |
                         {5{piu2_crvld_x}} & piu2_crresp[4:0] |
                         {5{piu1_crvld_x}} & piu1_crresp[4:0] |
                         {5{piu0_crvld_x}} & piu0_crresp[4:0];

always@(posedge fsm_clk or negedge cpurst_b)
begin
  if(~cpurst_b)
    crresp[4:0] <= 5'b0;
  else if (x_cen)
    crresp[4:0] <= 5'b0;
  else if (|piu_crvld[3:0])
    crresp[4:0] <= crresp[4:0] | piu_crresp[4:0];
  else
    crresp[4:0] <= crresp[4:0];
end

assign l1_dt  = crresp[DT];
assign l1_err = crresp[ERR] | wt_err;
assign l1_pd  = crresp[PD];
assign l1_sh  = crresp[IS];
assign l1_err_t = crresp[ERR] | (|piu_crvld[3:0] & piu_crresp[ERR]) | l1_wdata_err;

//-------------------------------------
//       l1 wdata vld
//-------------------------------------
always@(posedge fsm_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    wt_data_vld <= 1'b0;
  else if (x_cen)
    wt_data_vld <= 1'b0;
  else if (wd_wen)
    wt_data_vld <= 1'b1;
end
assign l1_wdata_vld = wt_data_vld | wd_wen;

assign wd_wen_err = l1_wen_x & l1_wcd_err;
always@(posedge fsm_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    wt_err <= 1'b0;
  else if (x_cen)
    wt_err <= 1'b0;
  else if (wd_wen_err)
    wt_err <= 1'b1;
end
assign l1_wdata_err = wt_err | wd_wen_err;

//================================================
//               L2 response
//================================================
parameter HIT = 4;
//-------------------------------------
//  l2c RESPONSE
//-------------------------------------

assign l2c_resp_wen = ((main_cur_state == L2C)  |
                       (main_cur_state == L2CR) |
                       (main_cur_state == L2CT) |
                       (main_cur_state == L2CW) & (cml2 | snpl2)) & l2c_cmplt_x;

always@(posedge fsm_clk or negedge cpurst_b)
begin
  if(~cpurst_b)
  begin
    l2_resp[4:0] <= 5'b0;
    cp[3:0]      <= 4'b0;
  end
  else if (x_cen)
  begin
    l2_resp[4:0] <= 5'b0;
    cp[3:0]      <= 4'b0;
  end
  else if (l2c_resp_wen)
  begin
    l2_resp[4:0] <= l2c_resp[4:0];
    cp[3:0]      <= l2c_cp[3:0];
  end
end

always@(posedge fsm_clk or negedge cpurst_b)
begin
  if(~cpurst_b)
    smpen[3:0] <= 4'b0;
  else if (x_cen)
    smpen[3:0] <= ciu_xx_smpen[3:0];
end

assign cp_after_sf[3:0]   = (ciu_chr2_sf_dis & l2_hit) ? 4'b1111 : cp[3:0];
assign cp_mask[3:0]       = inst ? 4'b0 : piu_sel[3:0]; //piu_sel of snpl2 and snpext is 4'b0.
assign cp_after_mask[3:0] = cp_after_sf[3:0] & (~cp_mask[3:0]) & smpen[3:0];

assign l2_hit = l2_resp[HIT];
assign l2_err = l2_resp[ERR];
assign l2_pd  = l2_resp[PD];
assign l2_sh  = l2_resp[IS];

assign alct_cmplt = l2c_cmplt_x & l2c_resp[HIT] & !l2c_resp[ERR];  //alct_success reuse the HIT bit.
assign alct_ecc_err = l2c_cmplt_x & l2c_resp[ERR];
assign alct_done  = l2c_cmplt_x & (main_cur_state == L2CA) & l2c_resp[IS]; // alct_done reuse IS

//-------------------------------------
//     ru_miss_by_snpext
//-------------------------------------
always@(posedge fsm_clk or negedge cpurst_b)
begin
  if(~cpurst_b)
    ru_miss_by_snpext <= 1'b0;
  else if (x_cen)
    ru_miss_by_snpext <= 1'b0;
  else if ((main_cur_state == L2CT) & l2c_cmplt_x)
    ru_miss_by_snpext <= l2_hit & !l2c_resp[HIT];
end

//================================================
//             ebiu_rd response
//================================================

assign memr_resp_wen = (main_cur_state == MEMR) & memr_data_vld_x;

assign memr_resp_f_err_next[3:0]  = ({4{memr_resp_err}}
                                      & mem_quad_sel[3:0])
                                    | memr_resp_f_err[3:0];
always@(posedge fsm_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    memr_resp_f_err[3:0]  <=  4'b0;
  else if(x_cen)
    memr_resp_f_err[3:0]  <=  4'b0;
  else if(memr_resp_wen)
    memr_resp_f_err[3:0]  <=   memr_resp_f_err_next[3:0];
end

// &Force("bus", "memr_resp", 3, 0); @1368
always@(posedge fsm_clk or negedge cpurst_b)
begin
  if (~cpurst_b)
    memr_resp_f_3_2[1:0] <= 2'b0;
  else if (x_cen)
    memr_resp_f_3_2[1:0] <= 2'b0;
  else if (memr_resp_wen)
    memr_resp_f_3_2[1:0] <= memr_resp[3:2];
end
assign memr_err = |memr_resp_f_err[3:0];   
assign memr_sh  = memr_resp_f_3_2[IS-2];
assign memr_pd  = memr_resp_f_3_2[PD-2];

assign memr_sd  =  memr_sh &  memr_pd & !memr_err;
assign memr_sc  =  memr_sh & !memr_pd & !memr_err;
assign memr_ud  = !memr_sh &  memr_pd & !memr_err;
assign memr_uc  = !memr_sh & !memr_pd & !memr_err;

//================================================
//                 ack
//================================================
//rack
always@(posedge fsm_clk or negedge cpurst_b)
begin
  if(~cpurst_b)
    rack_f <= 1'b0;
  else if (x_cen)
    rack_f <= l2_prf_from_l2c_raw | l2_prf_raw;
  else if (sab_rack_x)
    rack_f <= 1'b1;
end

assign rack = rack_f;

//back
always@(posedge fsm_clk or negedge cpurst_b)
begin
  if(~cpurst_b)
    back_f <= 1'b0;
  else if (x_cen)
    back_f <= 1'b0;
  else if (sab_back_x)
    back_f <= 1'b1;
end

assign back = back_f;

//================================================
//                   sdb
//================================================
//--------------------------------------
//           data
//--------------------------------------
//l1
assign quad_sel_wt[3:0] = ~wen_sel[3:0] | {4{!wstrb_all_one}};
assign wen_sel[3:0]     = (4'b1 << sab_cont[ADDR_5:ADDR_4]);
assign wt_part          = part_req && wt_val;

assign wd_sel[3:0]      = wt_part ? wen_sel[3:0] : 4'b1111;
assign cd_sel[3:0]      = wt_part ? quad_sel_wt[3:0] : 4'b1111;
assign l1_quad_sel[3:0] = (main_cur_state == DEPD) ? wd_sel[3:0] : cd_sel[3:0];
assign l1_quad_wen[3:0] = {4{l1_wen_x & !l1_wcd_err}} & l1_quad_sel[3:0];

assign l1c_data0[127:0] = l1_data[127:0];
assign l1c_data1[127:0] = l1_data[255:128];
assign l1c_data2[127:0] = l1_data[383:256];
assign l1c_data3[127:0] = l1_data[511:384];

assign l1_data_0[7:0]     = byte_sel_0[0]  ? l1c_data0[7:0]     : data0[7:0];
assign l1_data_0[15:8]    = byte_sel_0[1]  ? l1c_data0[15:8]    : data0[15:8];
assign l1_data_0[23:16]   = byte_sel_0[2]  ? l1c_data0[23:16]   : data0[23:16];
assign l1_data_0[31:24]   = byte_sel_0[3]  ? l1c_data0[31:24]   : data0[31:24];
assign l1_data_0[39:32]   = byte_sel_0[4]  ? l1c_data0[39:32]   : data0[39:32];
assign l1_data_0[47:40]   = byte_sel_0[5]  ? l1c_data0[47:40]   : data0[47:40];
assign l1_data_0[55:48]   = byte_sel_0[6]  ? l1c_data0[55:48]   : data0[55:48];
assign l1_data_0[63:56]   = byte_sel_0[7]  ? l1c_data0[63:56]   : data0[63:56];
assign l1_data_0[71:64]   = byte_sel_0[8]  ? l1c_data0[71:64]   : data0[71:64];
assign l1_data_0[79:72]   = byte_sel_0[9]  ? l1c_data0[79:72]   : data0[79:72];
assign l1_data_0[87:80]   = byte_sel_0[10] ? l1c_data0[87:80]   : data0[87:80];
assign l1_data_0[95:88]   = byte_sel_0[11] ? l1c_data0[95:88]   : data0[95:88];
assign l1_data_0[103:96]  = byte_sel_0[12] ? l1c_data0[103:96]  : data0[103:96];
assign l1_data_0[111:104] = byte_sel_0[13] ? l1c_data0[111:104] : data0[111:104];
assign l1_data_0[119:112] = byte_sel_0[14] ? l1c_data0[119:112] : data0[119:112];
assign l1_data_0[127:120] = byte_sel_0[15] ? l1c_data0[127:120] : data0[127:120];

assign l1_data_1[7:0]     = byte_sel_1[0]  ? l1c_data1[7:0]     : data1[7:0];
assign l1_data_1[15:8]    = byte_sel_1[1]  ? l1c_data1[15:8]    : data1[15:8];
assign l1_data_1[23:16]   = byte_sel_1[2]  ? l1c_data1[23:16]   : data1[23:16];
assign l1_data_1[31:24]   = byte_sel_1[3]  ? l1c_data1[31:24]   : data1[31:24];
assign l1_data_1[39:32]   = byte_sel_1[4]  ? l1c_data1[39:32]   : data1[39:32];
assign l1_data_1[47:40]   = byte_sel_1[5]  ? l1c_data1[47:40]   : data1[47:40];
assign l1_data_1[55:48]   = byte_sel_1[6]  ? l1c_data1[55:48]   : data1[55:48];
assign l1_data_1[63:56]   = byte_sel_1[7]  ? l1c_data1[63:56]   : data1[63:56];
assign l1_data_1[71:64]   = byte_sel_1[8]  ? l1c_data1[71:64]   : data1[71:64];
assign l1_data_1[79:72]   = byte_sel_1[9]  ? l1c_data1[79:72]   : data1[79:72];
assign l1_data_1[87:80]   = byte_sel_1[10] ? l1c_data1[87:80]   : data1[87:80];
assign l1_data_1[95:88]   = byte_sel_1[11] ? l1c_data1[95:88]   : data1[95:88];
assign l1_data_1[103:96]  = byte_sel_1[12] ? l1c_data1[103:96]  : data1[103:96];
assign l1_data_1[111:104] = byte_sel_1[13] ? l1c_data1[111:104] : data1[111:104];
assign l1_data_1[119:112] = byte_sel_1[14] ? l1c_data1[119:112] : data1[119:112];
assign l1_data_1[127:120] = byte_sel_1[15] ? l1c_data1[127:120] : data1[127:120];

assign l1_data_2[7:0]     = byte_sel_2[0]  ? l1c_data2[7:0]     : data2[7:0];
assign l1_data_2[15:8]    = byte_sel_2[1]  ? l1c_data2[15:8]    : data2[15:8];
assign l1_data_2[23:16]   = byte_sel_2[2]  ? l1c_data2[23:16]   : data2[23:16];
assign l1_data_2[31:24]   = byte_sel_2[3]  ? l1c_data2[31:24]   : data2[31:24];
assign l1_data_2[39:32]   = byte_sel_2[4]  ? l1c_data2[39:32]   : data2[39:32];
assign l1_data_2[47:40]   = byte_sel_2[5]  ? l1c_data2[47:40]   : data2[47:40];
assign l1_data_2[55:48]   = byte_sel_2[6]  ? l1c_data2[55:48]   : data2[55:48];
assign l1_data_2[63:56]   = byte_sel_2[7]  ? l1c_data2[63:56]   : data2[63:56];
assign l1_data_2[71:64]   = byte_sel_2[8]  ? l1c_data2[71:64]   : data2[71:64];
assign l1_data_2[79:72]   = byte_sel_2[9]  ? l1c_data2[79:72]   : data2[79:72];
assign l1_data_2[87:80]   = byte_sel_2[10] ? l1c_data2[87:80]   : data2[87:80];
assign l1_data_2[95:88]   = byte_sel_2[11] ? l1c_data2[95:88]   : data2[95:88];
assign l1_data_2[103:96]  = byte_sel_2[12] ? l1c_data2[103:96]  : data2[103:96];
assign l1_data_2[111:104] = byte_sel_2[13] ? l1c_data2[111:104] : data2[111:104];
assign l1_data_2[119:112] = byte_sel_2[14] ? l1c_data2[119:112] : data2[119:112];
assign l1_data_2[127:120] = byte_sel_2[15] ? l1c_data2[127:120] : data2[127:120];

assign l1_data_3[7:0]     = byte_sel_3[0]  ? l1c_data3[7:0]     : data3[7:0];
assign l1_data_3[15:8]    = byte_sel_3[1]  ? l1c_data3[15:8]    : data3[15:8];
assign l1_data_3[23:16]   = byte_sel_3[2]  ? l1c_data3[23:16]   : data3[23:16];
assign l1_data_3[31:24]   = byte_sel_3[3]  ? l1c_data3[31:24]   : data3[31:24];
assign l1_data_3[39:32]   = byte_sel_3[4]  ? l1c_data3[39:32]   : data3[39:32];
assign l1_data_3[47:40]   = byte_sel_3[5]  ? l1c_data3[47:40]   : data3[47:40];
assign l1_data_3[55:48]   = byte_sel_3[6]  ? l1c_data3[55:48]   : data3[55:48];
assign l1_data_3[63:56]   = byte_sel_3[7]  ? l1c_data3[63:56]   : data3[63:56];
assign l1_data_3[71:64]   = byte_sel_3[8]  ? l1c_data3[71:64]   : data3[71:64];
assign l1_data_3[79:72]   = byte_sel_3[9]  ? l1c_data3[79:72]   : data3[79:72];
assign l1_data_3[87:80]   = byte_sel_3[10] ? l1c_data3[87:80]   : data3[87:80];
assign l1_data_3[95:88]   = byte_sel_3[11] ? l1c_data3[95:88]   : data3[95:88];
assign l1_data_3[103:96]  = byte_sel_3[12] ? l1c_data3[103:96]  : data3[103:96];
assign l1_data_3[111:104] = byte_sel_3[13] ? l1c_data3[111:104] : data3[111:104];
assign l1_data_3[119:112] = byte_sel_3[14] ? l1c_data3[119:112] : data3[119:112];
assign l1_data_3[127:120] = byte_sel_3[15] ? l1c_data3[127:120] : data3[127:120];
//mem
always@(posedge fsm_clk or negedge cpurst_b)
begin
  if(~cpurst_b)
    mem_quad_sel[3:0] <= 4'b0;
  else if(sab_ebiur_req_x)
    mem_quad_sel[3:0] <= part_req ? wen_sel[3:0] : 4'b1;
  else if(memr_data_vld_x)
    mem_quad_sel[3:0] <= {mem_quad_sel[2:0],mem_quad_sel[3]};
  else
    mem_quad_sel[3:0] <= mem_quad_sel[3:0];
end

assign mem_data_vld      = memr_data_vld_x & !memr_resp_err & rd & !l2_hit;
assign mem_quad_wen[3:0] = {4{mem_data_vld}} & mem_quad_sel[3:0];

assign mem_rdata[127:0]  = memr_data[127:0];

//l2c
assign l2_wen      = l2c_cmplt_x & l2c_resp[DT] & !l1_pd;

assign wstrb_all_one       = &wstrb[15:0];
assign l2_quad_sel_rd[3:0] = part_req ? wen_sel[3:0] : 4'b1111;
assign l2_quad_sel[3:0]    = wt_part ? quad_sel_wt[3:0] : l2_quad_sel_rd[3:0];
assign l2_quad_wen[3:0]    = {4{l2_wen}} & l2_quad_sel[3:0];

assign l2c_data0[127:0]    = l2c_data[127:0];
assign l2c_data1[127:0]    = l2c_data[255:128];
assign l2c_data2[127:0]    = l2c_data[383:256];
assign l2c_data3[127:0]    = l2c_data[511:384];

assign l2c_data_0[7:0]     = byte_sel_0[0]  ? l2c_data0[7:0]     : data0[7:0];
assign l2c_data_0[15:8]    = byte_sel_0[1]  ? l2c_data0[15:8]    : data0[15:8];
assign l2c_data_0[23:16]   = byte_sel_0[2]  ? l2c_data0[23:16]   : data0[23:16];
assign l2c_data_0[31:24]   = byte_sel_0[3]  ? l2c_data0[31:24]   : data0[31:24];
assign l2c_data_0[39:32]   = byte_sel_0[4]  ? l2c_data0[39:32]   : data0[39:32];
assign l2c_data_0[47:40]   = byte_sel_0[5]  ? l2c_data0[47:40]   : data0[47:40];
assign l2c_data_0[55:48]   = byte_sel_0[6]  ? l2c_data0[55:48]   : data0[55:48];
assign l2c_data_0[63:56]   = byte_sel_0[7]  ? l2c_data0[63:56]   : data0[63:56];
assign l2c_data_0[71:64]   = byte_sel_0[8]  ? l2c_data0[71:64]   : data0[71:64];
assign l2c_data_0[79:72]   = byte_sel_0[9]  ? l2c_data0[79:72]   : data0[79:72];
assign l2c_data_0[87:80]   = byte_sel_0[10] ? l2c_data0[87:80]   : data0[87:80];
assign l2c_data_0[95:88]   = byte_sel_0[11] ? l2c_data0[95:88]   : data0[95:88];
assign l2c_data_0[103:96]  = byte_sel_0[12] ? l2c_data0[103:96]  : data0[103:96];
assign l2c_data_0[111:104] = byte_sel_0[13] ? l2c_data0[111:104] : data0[111:104];
assign l2c_data_0[119:112] = byte_sel_0[14] ? l2c_data0[119:112] : data0[119:112];
assign l2c_data_0[127:120] = byte_sel_0[15] ? l2c_data0[127:120] : data0[127:120];

assign l2c_data_1[7:0]     = byte_sel_1[0]  ? l2c_data1[7:0]     : data1[7:0];
assign l2c_data_1[15:8]    = byte_sel_1[1]  ? l2c_data1[15:8]    : data1[15:8];
assign l2c_data_1[23:16]   = byte_sel_1[2]  ? l2c_data1[23:16]   : data1[23:16];
assign l2c_data_1[31:24]   = byte_sel_1[3]  ? l2c_data1[31:24]   : data1[31:24];
assign l2c_data_1[39:32]   = byte_sel_1[4]  ? l2c_data1[39:32]   : data1[39:32];
assign l2c_data_1[47:40]   = byte_sel_1[5]  ? l2c_data1[47:40]   : data1[47:40];
assign l2c_data_1[55:48]   = byte_sel_1[6]  ? l2c_data1[55:48]   : data1[55:48];
assign l2c_data_1[63:56]   = byte_sel_1[7]  ? l2c_data1[63:56]   : data1[63:56];
assign l2c_data_1[71:64]   = byte_sel_1[8]  ? l2c_data1[71:64]   : data1[71:64];
assign l2c_data_1[79:72]   = byte_sel_1[9]  ? l2c_data1[79:72]   : data1[79:72];
assign l2c_data_1[87:80]   = byte_sel_1[10] ? l2c_data1[87:80]   : data1[87:80];
assign l2c_data_1[95:88]   = byte_sel_1[11] ? l2c_data1[95:88]   : data1[95:88];
assign l2c_data_1[103:96]  = byte_sel_1[12] ? l2c_data1[103:96]  : data1[103:96];
assign l2c_data_1[111:104] = byte_sel_1[13] ? l2c_data1[111:104] : data1[111:104];
assign l2c_data_1[119:112] = byte_sel_1[14] ? l2c_data1[119:112] : data1[119:112];
assign l2c_data_1[127:120] = byte_sel_1[15] ? l2c_data1[127:120] : data1[127:120];

assign l2c_data_2[7:0]     = byte_sel_2[0]  ? l2c_data2[7:0]     : data2[7:0];
assign l2c_data_2[15:8]    = byte_sel_2[1]  ? l2c_data2[15:8]    : data2[15:8];
assign l2c_data_2[23:16]   = byte_sel_2[2]  ? l2c_data2[23:16]   : data2[23:16];
assign l2c_data_2[31:24]   = byte_sel_2[3]  ? l2c_data2[31:24]   : data2[31:24];
assign l2c_data_2[39:32]   = byte_sel_2[4]  ? l2c_data2[39:32]   : data2[39:32];
assign l2c_data_2[47:40]   = byte_sel_2[5]  ? l2c_data2[47:40]   : data2[47:40];
assign l2c_data_2[55:48]   = byte_sel_2[6]  ? l2c_data2[55:48]   : data2[55:48];
assign l2c_data_2[63:56]   = byte_sel_2[7]  ? l2c_data2[63:56]   : data2[63:56];
assign l2c_data_2[71:64]   = byte_sel_2[8]  ? l2c_data2[71:64]   : data2[71:64];
assign l2c_data_2[79:72]   = byte_sel_2[9]  ? l2c_data2[79:72]   : data2[79:72];
assign l2c_data_2[87:80]   = byte_sel_2[10] ? l2c_data2[87:80]   : data2[87:80];
assign l2c_data_2[95:88]   = byte_sel_2[11] ? l2c_data2[95:88]   : data2[95:88];
assign l2c_data_2[103:96]  = byte_sel_2[12] ? l2c_data2[103:96]  : data2[103:96];
assign l2c_data_2[111:104] = byte_sel_2[13] ? l2c_data2[111:104] : data2[111:104];
assign l2c_data_2[119:112] = byte_sel_2[14] ? l2c_data2[119:112] : data2[119:112];
assign l2c_data_2[127:120] = byte_sel_2[15] ? l2c_data2[127:120] : data2[127:120];

assign l2c_data_3[7:0]     = byte_sel_3[0]  ? l2c_data3[7:0]     : data3[7:0];
assign l2c_data_3[15:8]    = byte_sel_3[1]  ? l2c_data3[15:8]    : data3[15:8];
assign l2c_data_3[23:16]   = byte_sel_3[2]  ? l2c_data3[23:16]   : data3[23:16];
assign l2c_data_3[31:24]   = byte_sel_3[3]  ? l2c_data3[31:24]   : data3[31:24];
assign l2c_data_3[39:32]   = byte_sel_3[4]  ? l2c_data3[39:32]   : data3[39:32];
assign l2c_data_3[47:40]   = byte_sel_3[5]  ? l2c_data3[47:40]   : data3[47:40];
assign l2c_data_3[55:48]   = byte_sel_3[6]  ? l2c_data3[55:48]   : data3[55:48];
assign l2c_data_3[63:56]   = byte_sel_3[7]  ? l2c_data3[63:56]   : data3[63:56];
assign l2c_data_3[71:64]   = byte_sel_3[8]  ? l2c_data3[71:64]   : data3[71:64];
assign l2c_data_3[79:72]   = byte_sel_3[9]  ? l2c_data3[79:72]   : data3[79:72];
assign l2c_data_3[87:80]   = byte_sel_3[10] ? l2c_data3[87:80]   : data3[87:80];
assign l2c_data_3[95:88]   = byte_sel_3[11] ? l2c_data3[95:88]   : data3[95:88];
assign l2c_data_3[103:96]  = byte_sel_3[12] ? l2c_data3[103:96]  : data3[103:96];
assign l2c_data_3[111:104] = byte_sel_3[13] ? l2c_data3[111:104] : data3[111:104];
assign l2c_data_3[119:112] = byte_sel_3[14] ? l2c_data3[119:112] : data3[119:112];
assign l2c_data_3[127:120] = byte_sel_3[15] ? l2c_data3[127:120] : data3[127:120];

//------------------------------------------------
//             data
//------------------------------------------------

always@(posedge fsm_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    data_sel[2:0] <= 3'b0;
  else if (data_sel_l1c)
    data_sel[2:0] <= 3'b100;   //l1 sel
  else if (data_sel_mem)
    data_sel[2:0] <= 3'b001;   //mem sel
  else if (x_cen | data_sel_l2c)
    data_sel[2:0] <= 3'b010;   //l2_sel
  else 
    data_sel[2:0] <= data_sel[2:0];
end

assign data0_clk_en = l1_quad_wen[0] | l2_wen | mem_quad_wen[0];
// &Instance("gated_clk_cell", "x_sdb0_gated_clk"); @1622
gated_clk_cell  x_sdb0_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (data0_clk         ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (data0_clk_en      ),
  .module_en          (ciu_icg_en        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @1623
//          .external_en (1'b0), @1624
//          .global_en   (1'b1), @1625
//          .module_en (ciu_icg_en       ), @1626
//          .local_en    (data0_clk_en), @1627
//          .clk_out     (data0_clk)); @1628

assign data0_wen = l1_quad_wen[0] || l2_quad_wen[0] || mem_quad_wen[0];

// &CombBeg; @1632
always @( l2c_data_0[127:0]
       or l1_data_0[127:0]
       or mem_rdata[127:0]
       or data_sel[2:0])
begin
  case(data_sel[2:0])
  3'b100 : data0_din[127:0] = l1_data_0[127:0];
  3'b010 : data0_din[127:0] = l2c_data_0[127:0];
  3'b001 : data0_din[127:0] = mem_rdata[127:0];
  default: data0_din[127:0] = {128{1'bx}};
  endcase
// &CombEnd; @1639
end

always@(posedge data0_clk or negedge cpurst_b)
begin
  if(~cpurst_b)
    data0[127:0] <= 128'b0;
  else if (data0_wen)
    data0[127:0] <= data0_din[127:0];
end

assign data1_clk_en = l1_quad_wen[1] | l2_wen | mem_quad_wen[1];
// &Instance("gated_clk_cell", "x_sdb1_gated_clk"); @1650
gated_clk_cell  x_sdb1_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (data1_clk         ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (data1_clk_en      ),
  .module_en          (ciu_icg_en        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @1651
//          .external_en (1'b0), @1652
//          .global_en   (1'b1), @1653
//          .module_en (ciu_icg_en       ), @1654
//          .local_en    (data1_clk_en), @1655
//          .clk_out     (data1_clk)); @1656

assign data1_wen = l1_quad_wen[1] || l2_quad_wen[1] || mem_quad_wen[1];

// &CombBeg; @1660
always @( l1_data_1[127:0]
       or mem_rdata[127:0]
       or l2c_data_1[127:0]
       or data_sel[2:0])
begin
  case(data_sel[2:0])
  3'b100 : data1_din[127:0] = l1_data_1[127:0];
  3'b010 : data1_din[127:0] = l2c_data_1[127:0];
  3'b001 : data1_din[127:0] = mem_rdata[127:0];
  default: data1_din[127:0] = {128{1'bx}};
  endcase
// &CombEnd; @1667
end

always@(posedge data1_clk or negedge cpurst_b)
begin
  if(~cpurst_b)
    data1[127:0] <= 128'b0;
  else if (data1_wen)
    data1[127:0] <= data1_din[127:0];
end

assign data2_clk_en = l1_quad_wen[2] | l2_wen | mem_quad_wen[2];
// &Instance("gated_clk_cell", "x_sdb2_gated_clk"); @1678
gated_clk_cell  x_sdb2_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (data2_clk         ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (data2_clk_en      ),
  .module_en          (ciu_icg_en        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @1679
//          .external_en (1'b0), @1680
//          .global_en   (1'b1), @1681
//          .module_en (ciu_icg_en       ), @1682
//          .local_en    (data2_clk_en), @1683
//          .clk_out     (data2_clk)); @1684

assign data2_wen = l1_quad_wen[2] | l2_quad_wen[2] | mem_quad_wen[2];

// &CombBeg; @1688
always @( l2c_data_2[127:0]
       or mem_rdata[127:0]
       or l1_data_2[127:0]
       or data_sel[2:0])
begin
  case(data_sel[2:0])
  3'b100 : data2_din[127:0] = l1_data_2[127:0];
  3'b010 : data2_din[127:0] = l2c_data_2[127:0];
  3'b001 : data2_din[127:0] = mem_rdata[127:0];
  default: data2_din[127:0] = {128{1'bx}};
  endcase
// &CombEnd; @1695
end

always@(posedge data2_clk or negedge cpurst_b)
begin
  if(~cpurst_b)
    data2[127:0] <= 128'b0;
  else if (data2_wen)
    data2[127:0] <= data2_din[127:0];
end

assign data3_clk_en = l1_quad_wen[3] | l2_wen | mem_quad_wen[3];
// &Instance("gated_clk_cell", "x_sdb3_gated_clk"); @1706
gated_clk_cell  x_sdb3_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (data3_clk         ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (data3_clk_en      ),
  .module_en          (ciu_icg_en        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @1707
//          .external_en (1'b0), @1708
//          .global_en   (1'b1), @1709
//          .module_en (ciu_icg_en       ), @1710
//          .local_en    (data3_clk_en), @1711
//          .clk_out     (data3_clk)); @1712

assign data3_wen = l1_quad_wen[3] | l2_quad_wen[3] | mem_quad_wen[3];

// &CombBeg; @1716
always @( l1_data_3[127:0]
       or l2c_data_3[127:0]
       or mem_rdata[127:0]
       or data_sel[2:0])
begin
  case(data_sel[2:0])
  3'b100 : data3_din[127:0] = l1_data_3[127:0];
  3'b010 : data3_din[127:0] = l2c_data_3[127:0];
  3'b001 : data3_din[127:0] = mem_rdata[127:0];
  default: data3_din[127:0] = {128{1'bx}};
  endcase
// &CombEnd; @1723
end

always@(posedge data3_clk or negedge cpurst_b)
begin
  if(~cpurst_b)
    data3[127:0] <= 128'b0;
  else if (data3_wen)
    data3[127:0] <= data3_din[127:0];
end

assign data[511:0] = {data3[127:0], data2[127:0], data1[127:0], data0[127:0]};

//--------------------------------------
//           wstrb
//--------------------------------------
assign wd_wen = l1_wen_x & !l1_wcd_err & (main_cur_state == DEPD);

assign wstrb_clk_en = x_cen | wd_wen;
// &Instance("gated_clk_cell", "x_wstrb_gated_clk"); @1741
gated_clk_cell  x_wstrb_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (wstrb_clk         ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (wstrb_clk_en      ),
  .module_en          (ciu_icg_en        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @1742
//          .external_en (1'b0), @1743
//          .global_en   (1'b1), @1744
//          .module_en (ciu_icg_en       ), @1745
//          .local_en    (wstrb_clk_en), @1746
//          .clk_out     (wstrb_clk)); @1747


always@(posedge wstrb_clk or negedge cpurst_b)
begin
  if(~cpurst_b)
    wstrb[15:0] <= 16'b0;
  else if (x_cen)
    wstrb[15:0] <= {16{1'b1}};
  else if (wd_wen)
    wstrb[15:0] <= l1_wstrb[15:0];
end

always@(posedge wstrb_clk or negedge cpurst_b)
begin
  if(~cpurst_b)
    byte_sel_0[15:0] <= 16'b0;
  else if (x_cen)
    byte_sel_0[15:0] <= {16{1'b1}};
  else if (wd_wen && wt_part && wen_sel[0])
    byte_sel_0[15:0] <= ~l1_wstrb[15:0];
end

always@(posedge wstrb_clk or negedge cpurst_b)
begin
  if(~cpurst_b)
    byte_sel_1[15:0] <= 16'b0;
  else if (x_cen)
    byte_sel_1[15:0] <= {16{1'b1}};
  else if (wd_wen && wt_part && wen_sel[1])
    byte_sel_1[15:0] <= ~l1_wstrb[15:0];
end

always@(posedge wstrb_clk or negedge cpurst_b)
begin
  if(~cpurst_b)
    byte_sel_2[15:0] <= 16'b0;
  else if (x_cen)
    byte_sel_2[15:0] <= {16{1'b1}};
  else if (wd_wen && wt_part && wen_sel[2])
    byte_sel_2[15:0] <= ~l1_wstrb[15:0];
end

always@(posedge wstrb_clk or negedge cpurst_b)
begin
  if(~cpurst_b)
    byte_sel_3[15:0] <= 16'b0;
  else if (x_cen)
    byte_sel_3[15:0] <= {16{1'b1}};
  else if (wd_wen && wt_part && wen_sel[3])
    byte_sel_3[15:0] <= ~l1_wstrb[15:0];
end

//--------------------------------------
//           agevec
//--------------------------------------

always@(posedge fsm_clk or negedge cpurst_b)
begin
  if(~cpurst_b)
    agevec[DEPTH-1:0] <= {DEPTH{1'b0}};
  else if (x_cen)
    agevec[DEPTH-1:0] <= create_age[DEPTH-1:0];
  else if (|agevec_clr[DEPTH-1:0])
    agevec[DEPTH-1:0] <= agevec[DEPTH-1:0] & (~agevec_clr[DEPTH-1:0]);
  else
    agevec[DEPTH-1:0] <= agevec[DEPTH-1:0];
end

//--------------------------------------
//        sab_cont/sdb_cont
//--------------------------------------
 
assign bar_val[1:0] = sab_cont[BAR_1:BAR_0];

assign sab_vld_x   = vld;
assign sab_busy_x  = !(main_cur_state == IDLE);
assign sab_wns_x   = wns | evict;

assign sab_ar_depd_snb_x     = (ar_crt_entry_index[6:0] == sab_cont[ADDR_13:ADDR_7]) & vld & !bar_val[0];
assign sab_aw_depd_snb_x     = (aw_crt_entry_index[6:0] == sab_cont[ADDR_13:ADDR_7]) & vld & !bar_val[0];
assign sab_bar_depd_snb_x    = (aw_sh || (aw_mid[2:0] == mid[2:0])) & vld & !bar_val[1];

assign sab_snpext_depd_snb_x = (snpext_index[6:0] == sab_cont[ADDR_13:ADDR_7]) & vld & !bar_val[0];

assign x_sab_agevec[DEPTH-1:0] = agevec[DEPTH-1:0];

//================================================
//                 bar_val cmplt
//================================================

assign bar_cmplt = ~depd_vld | ciu_chr2_bar_dis;

assign x_bar_cmplt = bar_cmplt & (main_cur_state == BAR);

assign sab_piu0_bar_cmplt_x = x_bar_cmplt && (mid[2:0] == 3'b000);
assign sab_piu1_bar_cmplt_x = x_bar_cmplt && (mid[2:0] == 3'b001);
assign sab_piu2_bar_cmplt_x = x_bar_cmplt && (mid[2:0] == 3'b010);
assign sab_piu3_bar_cmplt_x = x_bar_cmplt && (mid[2:0] == 3'b011);

//================================================
//      DEBUG INFORMATION
//================================================

assign x_dbg_info[3:0] = main_cur_state[3:0];


// &ModuleEnd; @2092
endmodule



