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
module ct_ciu_ctcq(
  bmbif_ctcq_bar_req,
  bmbif_ctcq_mid,
  bmbif_ctcq_req_bus,
  ciu_chr2_dvm_dis,
  ciu_icg_en,
  ciu_xx_smpen,
  cpurst_b,
  ctcq_bmbif_bar_grant,
  ctcq_dbg_info,
  ctcq_ebiu_araddr,
  ctcq_ebiu_arbar,
  ctcq_ebiu_arburst,
  ctcq_ebiu_arcache,
  ctcq_ebiu_ardomain,
  ctcq_ebiu_arid,
  ctcq_ebiu_arlen,
  ctcq_ebiu_arlock,
  ctcq_ebiu_arprot,
  ctcq_ebiu_arsize,
  ctcq_ebiu_arsnoop,
  ctcq_ebiu_arvalid,
  ctcq_ebiu_r_grant,
  ctcq_ebiuif_ac_grant,
  ctcq_ebiuif_crresp,
  ctcq_ebiuif_crvalid,
  ctcq_l2c_addr_req,
  ctcq_l2c_req_type,
  ctcq_piu0_acbus,
  ctcq_piu0_acvalid,
  ctcq_piu0_ar_grant,
  ctcq_piu0_bar_cmplt,
  ctcq_piu0_cr_grant,
  ctcq_piu0_rvalid,
  ctcq_piu1_acbus,
  ctcq_piu1_acvalid,
  ctcq_piu1_ar_grant,
  ctcq_piu1_bar_cmplt,
  ctcq_piu1_cr_grant,
  ctcq_piu1_rvalid,
  ctcq_piu2_acbus,
  ctcq_piu2_acvalid,
  ctcq_piu2_ar_grant,
  ctcq_piu2_bar_cmplt,
  ctcq_piu2_cr_grant,
  ctcq_piu2_rvalid,
  ctcq_piu3_acbus,
  ctcq_piu3_acvalid,
  ctcq_piu3_ar_grant,
  ctcq_piu3_bar_cmplt,
  ctcq_piu3_cr_grant,
  ctcq_piu3_rvalid,
  ctcq_piux_rbus,
  ctcq_xx_no_op,
  ebiu_ctcq_ar_grant,
  ebiu_ctcq_rid,
  ebiu_ctcq_rvalid,
  ebiuif_ctcq_acaddr,
  ebiuif_ctcq_acid,
  ebiuif_ctcq_acsnoop,
  ebiuif_ctcq_acvalid,
  ebiuif_ctcq_cr_grant,
  forever_cpuclk,
  l2c_ctcq_cmplt,
  pad_yy_icg_scan_en,
  piu0_ctcq_ac_grant,
  piu0_ctcq_ar_bus,
  piu0_ctcq_ar_req,
  piu0_ctcq_cr_bus,
  piu0_ctcq_cr_req,
  piu0_ctcq_r_grant,
  piu1_ctcq_ac_grant,
  piu1_ctcq_ar_bus,
  piu1_ctcq_ar_req,
  piu1_ctcq_cr_bus,
  piu1_ctcq_cr_req,
  piu1_ctcq_r_grant,
  piu2_ctcq_ac_grant,
  piu2_ctcq_ar_bus,
  piu2_ctcq_ar_req,
  piu2_ctcq_cr_bus,
  piu2_ctcq_cr_req,
  piu2_ctcq_r_grant,
  piu3_ctcq_ac_grant,
  piu3_ctcq_ar_bus,
  piu3_ctcq_ar_req,
  piu3_ctcq_cr_bus,
  piu3_ctcq_cr_req,
  piu3_ctcq_r_grant
);

// &Ports; @24
input            bmbif_ctcq_bar_req;        
input   [2  :0]  bmbif_ctcq_mid;            
input   [8  :0]  bmbif_ctcq_req_bus;        
input            ciu_chr2_dvm_dis;          
input            ciu_icg_en;                
input   [3  :0]  ciu_xx_smpen;              
input            cpurst_b;                  
input            ebiu_ctcq_ar_grant;        
input   [5  :0]  ebiu_ctcq_rid;             
input            ebiu_ctcq_rvalid;          
input   [39 :0]  ebiuif_ctcq_acaddr;        
input   [4  :0]  ebiuif_ctcq_acid;          
input   [3  :0]  ebiuif_ctcq_acsnoop;       
input            ebiuif_ctcq_acvalid;       
input            ebiuif_ctcq_cr_grant;      
input            forever_cpuclk;            
input            l2c_ctcq_cmplt;            
input            pad_yy_icg_scan_en;        
input            piu0_ctcq_ac_grant;        
input   [70 :0]  piu0_ctcq_ar_bus;          
input            piu0_ctcq_ar_req;          
input   [9  :0]  piu0_ctcq_cr_bus;          
input            piu0_ctcq_cr_req;          
input            piu0_ctcq_r_grant;         
input            piu1_ctcq_ac_grant;        
input   [70 :0]  piu1_ctcq_ar_bus;          
input            piu1_ctcq_ar_req;          
input   [9  :0]  piu1_ctcq_cr_bus;          
input            piu1_ctcq_cr_req;          
input            piu1_ctcq_r_grant;         
input            piu2_ctcq_ac_grant;        
input   [70 :0]  piu2_ctcq_ar_bus;          
input            piu2_ctcq_ar_req;          
input   [9  :0]  piu2_ctcq_cr_bus;          
input            piu2_ctcq_cr_req;          
input            piu2_ctcq_r_grant;         
input            piu3_ctcq_ac_grant;        
input   [70 :0]  piu3_ctcq_ar_bus;          
input            piu3_ctcq_ar_req;          
input   [9  :0]  piu3_ctcq_cr_bus;          
input            piu3_ctcq_cr_req;          
input            piu3_ctcq_r_grant;         
output           ctcq_bmbif_bar_grant;      
output  [55 :0]  ctcq_dbg_info;             
output  [39 :0]  ctcq_ebiu_araddr;          
output  [1  :0]  ctcq_ebiu_arbar;           
output  [1  :0]  ctcq_ebiu_arburst;         
output  [3  :0]  ctcq_ebiu_arcache;         
output  [1  :0]  ctcq_ebiu_ardomain;        
output  [5  :0]  ctcq_ebiu_arid;            
output  [7  :0]  ctcq_ebiu_arlen;           
output           ctcq_ebiu_arlock;          
output  [2  :0]  ctcq_ebiu_arprot;          
output  [2  :0]  ctcq_ebiu_arsize;          
output  [3  :0]  ctcq_ebiu_arsnoop;         
output           ctcq_ebiu_arvalid;         
output           ctcq_ebiu_r_grant;         
output           ctcq_ebiuif_ac_grant;      
output  [4  :0]  ctcq_ebiuif_crresp;        
output           ctcq_ebiuif_crvalid;       
output           ctcq_l2c_addr_req;         
output  [1  :0]  ctcq_l2c_req_type;         
output  [54 :0]  ctcq_piu0_acbus;           
output           ctcq_piu0_acvalid;         
output           ctcq_piu0_ar_grant;        
output           ctcq_piu0_bar_cmplt;       
output           ctcq_piu0_cr_grant;        
output           ctcq_piu0_rvalid;          
output  [54 :0]  ctcq_piu1_acbus;           
output           ctcq_piu1_acvalid;         
output           ctcq_piu1_ar_grant;        
output           ctcq_piu1_bar_cmplt;       
output           ctcq_piu1_cr_grant;        
output           ctcq_piu1_rvalid;          
output  [54 :0]  ctcq_piu2_acbus;           
output           ctcq_piu2_acvalid;         
output           ctcq_piu2_ar_grant;        
output           ctcq_piu2_bar_cmplt;       
output           ctcq_piu2_cr_grant;        
output           ctcq_piu2_rvalid;          
output  [54 :0]  ctcq_piu3_acbus;           
output           ctcq_piu3_acvalid;         
output           ctcq_piu3_ar_grant;        
output           ctcq_piu3_bar_cmplt;       
output           ctcq_piu3_cr_grant;        
output           ctcq_piu3_rvalid;          
output  [534:0]  ctcq_piux_rbus;            
output           ctcq_xx_no_op;             

// &Regs; @25
reg              aim_ebiu_f;                
reg     [4  :0]  aim_last;                  
reg              arbuf_vld;                 
reg     [1  :0]  bar_mid;                   
reg     [2  :0]  comp_cur_state;            
reg     [2  :0]  comp_next_state;           
reg     [39 :0]  ctcq_araddr;               
reg     [5  :0]  ctcq_arid;                 
reg     [3  :0]  ctcq_arsnoop;              
reg     [39 :0]  ctcq_ebiu_araddr;          
reg     [5  :0]  ctcq_ebiu_arid;            
reg     [3  :0]  ctcq_ebiu_arsnoop;         
reg     [4  :0]  last_req_sel;              
reg     [7  :0]  reqq_create_ptr;           
reg     [7  :0]  reqq_pop0_ptr;             
reg     [7  :0]  reqq_pop1_ptr;             
reg     [7  :0]  reqq_pop2_ptr;             
reg     [7  :0]  reqq_pop3_ptr;             
reg     [7  :0]  reqq_pop_ebiu_ptr;         
reg     [7  :0]  reqq_popl2c_ptr;           
reg     [7  :0]  reqq_resp_ptr;             
reg     [3  :0]  respq_create_ptr;          
reg     [2  :0]  sync_cur_state;            
reg     [2  :0]  sync_next_state;           
reg              two_trans_need;            

// &Wires; @26
wire             aim_ebiu;                  
wire             aim_ebiu_final;            
wire    [4  :0]  aim_piu;                   
wire             aim_piu0;                  
wire             aim_piu0_final;            
wire             aim_piu1;                  
wire             aim_piu1_final;            
wire             aim_piu2;                  
wire             aim_piu2_final;            
wire             aim_piu3;                  
wire             aim_piu3_final;            
wire             arbuf_clk;                 
wire             arbuf_clk_en;              
wire             arbuf_create_en;           
wire             arbuf_idle;                
wire             arbuf_pop_en;              
wire             bar_cmplt;                 
wire             bar_grant;                 
wire             bar_req_vld;               
wire             bmbif_ctcq_bar_req;        
wire    [2  :0]  bmbif_ctcq_mid;            
wire             ciu_icg_en;                
wire    [3  :0]  ciu_xx_smpen;              
wire             comp_fsm_idle;             
wire             comp_fsm_stall;            
wire    [3  :0]  cp_mode;                   
wire             cpurst_b;                  
wire    [53 :0]  ctc0_bus;                  
wire             ctc0_op;                   
wire    [53 :0]  ctc1_bus;                  
wire             ctc1_op;                   
wire    [53 :0]  ctc2_bus;                  
wire             ctc2_op;                   
wire    [53 :0]  ctc3_bus;                  
wire             ctc3_op;                   
wire    [39 :0]  ctc_dvm_addr;              
wire    [5  :0]  ctc_dvm_aim;               
wire    [53 :0]  ctc_dvm_bus;               
wire             ctc_dvm_clr;               
wire             ctc_dvm_create_en;         
wire    [1  :0]  ctc_dvm_domain;            
wire    [4  :0]  ctc_dvm_id;                
wire    [2  :0]  ctc_dvm_mid;               
wire    [4  :0]  ctc_dvm_req;               
wire    [4  :0]  ctc_dvm_req_after_mask;    
wire             ctc_dvm_req_vld;           
wire             ctc_dvm_resp_grant;        
wire    [3  :0]  ctc_dvm_respq_id;          
wire    [4  :0]  ctc_dvm_sel;               
wire    [3  :0]  ctc_dvm_snoop;             
wire             ctc_req_vld;               
wire             ctc_respq_full;            
wire             ctc_sh;                    
wire    [2  :0]  ctcq_arvalid;              
wire             ctcq_bmbif_bar_grant;      
wire             ctcq_clk;                  
wire             ctcq_clk_en;               
wire             ctcq_create_clk;           
wire             ctcq_create_clk_en;        
wire    [55 :0]  ctcq_dbg_info;             
wire    [1  :0]  ctcq_ebiu_arbar;           
wire    [1  :0]  ctcq_ebiu_arburst;         
wire    [3  :0]  ctcq_ebiu_arcache;         
wire    [1  :0]  ctcq_ebiu_ardomain;        
wire    [7  :0]  ctcq_ebiu_arlen;           
wire             ctcq_ebiu_arlock;          
wire    [2  :0]  ctcq_ebiu_arprot;          
wire    [2  :0]  ctcq_ebiu_arsize;          
wire             ctcq_ebiu_arvalid;         
wire             ctcq_ebiu_r_grant;         
wire             ctcq_ebiu_real_req;        
wire             ctcq_ebiu_void_req;        
wire             ctcq_ebiuif_ac_grant;      
wire    [4  :0]  ctcq_ebiuif_crresp;        
wire             ctcq_ebiuif_crvalid;       
wire             ctcq_l2c_addr_req;         
wire             ctcq_l2c_real_req;         
wire    [1  :0]  ctcq_l2c_req_type;         
wire    [3  :0]  ctcq_l2c_respq_id;         
wire             ctcq_l2c_void_req;         
wire    [39 :0]  ctcq_piu0_ac_addr;         
wire    [3  :0]  ctcq_piu0_ac_respq_id;     
wire    [54 :0]  ctcq_piu0_acbus;           
wire             ctcq_piu0_acvalid;         
wire             ctcq_piu0_ar_grant;        
wire             ctcq_piu0_bar_cmplt;       
wire             ctcq_piu0_cr_grant;        
wire             ctcq_piu0_real_req;        
wire             ctcq_piu0_rvalid;          
wire             ctcq_piu0_void_req;        
wire    [39 :0]  ctcq_piu1_ac_addr;         
wire    [3  :0]  ctcq_piu1_ac_respq_id;     
wire    [54 :0]  ctcq_piu1_acbus;           
wire             ctcq_piu1_acvalid;         
wire             ctcq_piu1_ar_grant;        
wire             ctcq_piu1_bar_cmplt;       
wire             ctcq_piu1_cr_grant;        
wire             ctcq_piu1_real_req;        
wire             ctcq_piu1_rvalid;          
wire             ctcq_piu1_void_req;        
wire    [39 :0]  ctcq_piu2_ac_addr;         
wire    [3  :0]  ctcq_piu2_ac_respq_id;     
wire    [54 :0]  ctcq_piu2_acbus;           
wire             ctcq_piu2_acvalid;         
wire             ctcq_piu2_ar_grant;        
wire             ctcq_piu2_bar_cmplt;       
wire             ctcq_piu2_cr_grant;        
wire             ctcq_piu2_real_req;        
wire             ctcq_piu2_rvalid;          
wire             ctcq_piu2_void_req;        
wire    [39 :0]  ctcq_piu3_ac_addr;         
wire    [3  :0]  ctcq_piu3_ac_respq_id;     
wire    [54 :0]  ctcq_piu3_acbus;           
wire             ctcq_piu3_acvalid;         
wire             ctcq_piu3_ar_grant;        
wire             ctcq_piu3_bar_cmplt;       
wire             ctcq_piu3_cr_grant;        
wire             ctcq_piu3_real_req;        
wire             ctcq_piu3_rvalid;          
wire             ctcq_piu3_void_req;        
wire    [534:0]  ctcq_piux_rbus;            
wire             ctcq_req_pop0_en;          
wire             ctcq_req_pop1_en;          
wire             ctcq_req_pop2_en;          
wire             ctcq_req_pop3_en;          
wire             ctcq_req_pop_ebiu_en;      
wire             ctcq_req_popl2c_en;        
wire             ctcq_xx_no_op;             
wire    [53 :0]  dvm_bus;                   
wire             dvm_comp;                  
wire    [39 :0]  dvm_comp_araddr;           
wire             dvm_comp_arvalid;          
wire             dvm_comp_cmplt;            
wire             dvm_comp_grant;            
wire             dvm_op;                    
wire    [39 :0]  dvm_op_araddr;             
wire    [3  :0]  dvm_op_arid;               
wire             dvm_op_arvalid;            
wire             dvm_op_cmplt;              
wire             dvm_op_grant;              
wire    [3  :0]  dvm_op_rid;                
wire             dvm_respq_full;            
wire    [3  :0]  dvm_rfifo_create_bus;      
wire             dvm_rfifo_create_en;       
wire    [3  :0]  dvm_rfifo_pop_bus;         
wire             dvm_rfifo_pop_en;          
wire             dvm_sync;                  
wire    [39 :0]  dvm_sync_araddr;           
wire             dvm_sync_arvalid;          
wire             dvm_sync_cmplt;            
wire             dvm_sync_grant;            
wire             dvm_sync_pop;              
wire             ebiu_ctcq_ar_grant;        
wire    [5  :0]  ebiu_ctcq_rid;             
wire             ebiu_ctcq_rvalid;          
wire             ebiu_dvm_req;              
wire    [39 :0]  ebiuif_ctcq_acaddr;        
wire    [4  :0]  ebiuif_ctcq_acid;          
wire    [3  :0]  ebiuif_ctcq_acsnoop;       
wire             ebiuif_ctcq_acvalid;       
wire             ebiuif_ctcq_cr_grant;      
wire             forever_cpuclk;            
wire             icachei;                   
wire             l2c_aim;                   
wire             l2c_ctcq_cmplt;            
wire             l2cicc;                    
wire             op_sync;                   
wire             pad_yy_icg_scan_en;        
wire             piu0_ctcq_ac_grant;        
wire    [70 :0]  piu0_ctcq_ar_bus;          
wire             piu0_ctcq_ar_req;          
wire    [9  :0]  piu0_ctcq_cr_bus;          
wire             piu0_ctcq_cr_req;          
wire             piu0_ctcq_r_grant;         
wire             piu1_ctcq_ac_grant;        
wire    [70 :0]  piu1_ctcq_ar_bus;          
wire             piu1_ctcq_ar_req;          
wire    [9  :0]  piu1_ctcq_cr_bus;          
wire             piu1_ctcq_cr_req;          
wire             piu1_ctcq_r_grant;         
wire             piu2_ctcq_ac_grant;        
wire    [70 :0]  piu2_ctcq_ar_bus;          
wire             piu2_ctcq_ar_req;          
wire    [9  :0]  piu2_ctcq_cr_bus;          
wire             piu2_ctcq_cr_req;          
wire             piu2_ctcq_r_grant;         
wire             piu3_ctcq_ac_grant;        
wire    [70 :0]  piu3_ctcq_ar_bus;          
wire             piu3_ctcq_ar_req;          
wire    [9  :0]  piu3_ctcq_cr_bus;          
wire             piu3_ctcq_cr_req;          
wire             piu3_ctcq_r_grant;         
wire    [3  :0]  piu_ctc_req;               
wire             prio_clk;                  
wire             prio_clk_en;               
wire    [7  :0]  reqq_create_en;            
wire    [7  :0]  reqq_ctc;                  
wire             reqq_ctc_empty;            
wire    [7  :0]  reqq_ebiu_aim;             
wire    [7  :0]  reqq_ebiu_vld;             
wire             reqq_empty;                
wire    [39 :0]  reqq_entry0_addr;          
wire    [1  :0]  reqq_entry0_l2ctype;       
wire    [2  :0]  reqq_entry0_mid;           
wire    [3  :0]  reqq_entry0_respq_id;      
wire    [4  :0]  reqq_entry0_rid;           
wire    [39 :0]  reqq_entry1_addr;          
wire    [1  :0]  reqq_entry1_l2ctype;       
wire    [2  :0]  reqq_entry1_mid;           
wire    [3  :0]  reqq_entry1_respq_id;      
wire    [4  :0]  reqq_entry1_rid;           
wire    [39 :0]  reqq_entry2_addr;          
wire    [1  :0]  reqq_entry2_l2ctype;       
wire    [2  :0]  reqq_entry2_mid;           
wire    [3  :0]  reqq_entry2_respq_id;      
wire    [4  :0]  reqq_entry2_rid;           
wire    [39 :0]  reqq_entry3_addr;          
wire    [1  :0]  reqq_entry3_l2ctype;       
wire    [2  :0]  reqq_entry3_mid;           
wire    [3  :0]  reqq_entry3_respq_id;      
wire    [4  :0]  reqq_entry3_rid;           
wire    [39 :0]  reqq_entry4_addr;          
wire    [1  :0]  reqq_entry4_l2ctype;       
wire    [2  :0]  reqq_entry4_mid;           
wire    [3  :0]  reqq_entry4_respq_id;      
wire    [4  :0]  reqq_entry4_rid;           
wire    [39 :0]  reqq_entry5_addr;          
wire    [1  :0]  reqq_entry5_l2ctype;       
wire    [2  :0]  reqq_entry5_mid;           
wire    [3  :0]  reqq_entry5_respq_id;      
wire    [4  :0]  reqq_entry5_rid;           
wire    [39 :0]  reqq_entry6_addr;          
wire    [1  :0]  reqq_entry6_l2ctype;       
wire    [2  :0]  reqq_entry6_mid;           
wire    [3  :0]  reqq_entry6_respq_id;      
wire    [4  :0]  reqq_entry6_rid;           
wire    [39 :0]  reqq_entry7_addr;          
wire    [1  :0]  reqq_entry7_l2ctype;       
wire    [2  :0]  reqq_entry7_mid;           
wire    [3  :0]  reqq_entry7_respq_id;      
wire    [4  :0]  reqq_entry7_rid;           
wire             reqq_full;                 
wire    [7  :0]  reqq_l2c_aim;              
wire    [7  :0]  reqq_l2c_vld;              
wire    [7  :0]  reqq_piu0_aim;             
wire    [7  :0]  reqq_piu0_vld;             
wire    [7  :0]  reqq_piu1_aim;             
wire    [7  :0]  reqq_piu1_vld;             
wire    [7  :0]  reqq_piu2_aim;             
wire    [7  :0]  reqq_piu2_vld;             
wire    [7  :0]  reqq_piu3_aim;             
wire    [7  :0]  reqq_piu3_vld;             
wire    [7  :0]  reqq_pop0_en;              
wire    [7  :0]  reqq_pop1_en;              
wire    [7  :0]  reqq_pop2_en;              
wire    [7  :0]  reqq_pop3_en;              
wire             reqq_pop_clk;              
wire             reqq_pop_clk_en;           
wire    [7  :0]  reqq_pop_ebiu_en;          
wire    [7  :0]  reqq_popl2c_en;            
wire    [7  :0]  reqq_resp_done;            
wire    [2  :0]  reqq_resp_mid;             
wire    [4  :0]  reqq_resp_rid;             
wire             reqq_resp_valid;           
wire    [7  :0]  reqq_resp_vld;             
wire    [7  :0]  reqq_vld;                  
wire             resp_clk;                  
wire             resp_clk_en;               
wire    [5  :0]  respq_create_cmplt_init;   
wire             respq_create_dvm;          
wire    [15 :0]  respq_create_en;           
wire    [15 :0]  respq_create_sel;          
wire             respq_ctc_empty;           
wire    [15 :0]  respq_dvm;                 
wire             respq_dvm_empty;           
wire    [15 :0]  respq_ebiu_resp_create_en; 
wire    [15 :0]  respq_ebiu_resp_create_ptr; 
wire             respq_empty;               
wire    [15 :0]  respq_l2c_resp_create_en;  
wire    [15 :0]  respq_l2c_resp_create_ptr; 
wire    [15 :0]  respq_piu0_resp_create_en; 
wire    [15 :0]  respq_piu0_resp_create_ptr; 
wire    [15 :0]  respq_piu1_resp_create_en; 
wire    [15 :0]  respq_piu1_resp_create_ptr; 
wire    [15 :0]  respq_piu2_resp_create_en; 
wire    [15 :0]  respq_piu2_resp_create_ptr; 
wire    [15 :0]  respq_piu3_resp_create_en; 
wire    [15 :0]  respq_piu3_resp_create_ptr; 
wire    [15 :0]  respq_vld;                 
wire             sync_fsm_idle;             
wire             sync_fsm_stall;            
wire             tlbi;                      


parameter ADDRW = `PA_WIDTH;

//==========================================================
//                   SYNC FSM
// send DVM sync to AR channel and wait DVM complete from AC
// to finish barrier
//==========================================================
parameter S_IDLE = 3'b000;
parameter S_WFB  = 3'b001;
parameter S_WFE  = 3'b010;
parameter S_REQ  = 3'b011;
parameter S_RESP = 3'b100;
parameter S_WFC  = 3'b101;
parameter S_WFR  = 3'b110;
parameter S_CMPLT= 3'b111;

always@(posedge ctcq_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    sync_cur_state[2:0] <= S_IDLE;
  else 
    sync_cur_state[2:0] <= sync_next_state[2:0];
end

assign bar_req_vld = !two_trans_need & bmbif_ctcq_bar_req;

// &CombBeg; @54
always @( ctc_dvm_create_en
       or comp_fsm_idle
       or dvm_sync_cmplt
       or ctc_req_vld
       or aim_ebiu_f
       or dvm_comp
       or respq_ctc_empty
       or sync_cur_state
       or dvm_sync_grant
       or reqq_ctc_empty
       or bar_req_vld)
begin
  case (sync_cur_state)
  S_IDLE: begin
    if (bar_req_vld)
      sync_next_state = S_CMPLT;
    else if (ctc_dvm_create_en & ctc_req_vld)
      sync_next_state = S_WFB;
    else 
      sync_next_state = S_IDLE;
  end
  S_WFB: begin
    if (bar_req_vld) 
      sync_next_state = S_WFE;
    else 
      sync_next_state = S_WFB;
  end
  S_WFE: begin
    if (reqq_ctc_empty & respq_ctc_empty & comp_fsm_idle)
      sync_next_state = aim_ebiu_f ? S_REQ : S_CMPLT;
    else 
      sync_next_state = S_WFE;
  end
  S_REQ: begin
    if (dvm_sync_grant)
      sync_next_state = S_RESP;
    else
      sync_next_state = S_REQ;
  end
  S_RESP: begin
    if (dvm_sync_cmplt & ctc_dvm_create_en & dvm_comp)
      sync_next_state = S_CMPLT;
    else if (dvm_sync_cmplt)
      sync_next_state = S_WFC;
    else if (ctc_dvm_create_en & dvm_comp)
      sync_next_state = S_WFR;
    else
      sync_next_state = S_RESP;
  end
  S_WFC: begin
    if (ctc_dvm_create_en & dvm_comp)
      sync_next_state = S_CMPLT;
    else
      sync_next_state = S_WFC;
  end
  S_WFR: begin
    if (dvm_sync_cmplt)
      sync_next_state = S_CMPLT;
    else 
      sync_next_state = S_WFR;
  end
  S_CMPLT: begin
    sync_next_state = S_IDLE;
  end
  default: sync_next_state = S_IDLE;
  endcase
// &CombEnd; @109
end

assign dvm_sync_arvalid = (sync_cur_state == S_REQ);
assign dvm_sync_araddr[ADDRW-1:0] = {24'b0, 4'b1100, 12'b0};

assign bar_grant = bar_req_vld & 
                   ((sync_cur_state == S_IDLE) | (sync_cur_state == S_WFB));
assign bar_cmplt = (sync_cur_state == S_CMPLT);

assign sync_fsm_idle  = (sync_cur_state == S_IDLE);
assign sync_fsm_stall = bar_grant |
                        (|sync_cur_state[2:1]);

always@(posedge ctcq_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    aim_ebiu_f <= 1'b0;
  else if (ctc_dvm_create_en & aim_ebiu)
    aim_ebiu_f <= 1'b1;
  else if (bar_cmplt)
    aim_ebiu_f <= 1'b0;
end

//output for bar
// &Force("input", "bmbif_ctcq_req_bus"); @133
// &Force("bus", "bmbif_ctcq_req_bus",8,0); @134
// &Force("bus", "bmbif_ctcq_mid",2,0); @135

always@(posedge ctcq_clk)
begin
  if (bar_grant)
    bar_mid[1:0] <= bmbif_ctcq_mid[1:0];
end

assign ctcq_bmbif_bar_grant = bar_grant;

assign ctcq_piu0_bar_cmplt = bar_cmplt & (bar_mid[1:0] == 2'b00);
assign ctcq_piu1_bar_cmplt = bar_cmplt & (bar_mid[1:0] == 2'b01);
assign ctcq_piu2_bar_cmplt = bar_cmplt & (bar_mid[1:0] == 2'b10);
assign ctcq_piu3_bar_cmplt = bar_cmplt & (bar_mid[1:0] == 2'b11);

//==========================================================
//                   COMPLETE FSM
// recieve DVM SYNC from AC, generate DVM complete to AR 
//==========================================================
parameter C_IDLE = 3'b000;
parameter C_POP  = 3'b001;
parameter C_WFE  = 3'b010;
parameter C_REQ  = 3'b011;
parameter C_RESP = 3'b100;

always@(posedge ctcq_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    comp_cur_state[2:0] <= C_IDLE;
  else 
    comp_cur_state[2:0] <= comp_next_state[2:0];
end

// &CombBeg; @168
always @( comp_cur_state
       or ctc_dvm_create_en
       or dvm_comp_grant
       or dvm_sync_pop
       or dvm_comp_cmplt
       or dvm_sync
       or respq_dvm_empty)
begin
  case (comp_cur_state)
  C_IDLE : begin
    if (ctc_dvm_create_en & dvm_sync)
      comp_next_state = C_POP;
    else 
      comp_next_state = C_IDLE;
  end
  C_POP : begin
    if (dvm_sync_pop & respq_dvm_empty)
      comp_next_state = C_REQ;
    else if (dvm_sync_pop)
      comp_next_state = C_WFE;
    else
      comp_next_state = C_POP;
  end
  C_WFE: begin
    if (respq_dvm_empty)
      comp_next_state = C_REQ;
    else 
      comp_next_state = C_WFE;
  end
  C_REQ : begin
    if (dvm_comp_grant)
      comp_next_state = C_RESP;
    else 
      comp_next_state = C_REQ;
  end
  C_RESP : begin
    if (dvm_comp_cmplt)
      comp_next_state = C_IDLE;
    else 
      comp_next_state = C_RESP;
  end
  default: comp_next_state = C_IDLE;
  endcase
// &CombEnd; @204
end
assign dvm_comp_arvalid = 1'b0;
assign dvm_comp_araddr[ADDRW-1:0] = 40'b0;

assign comp_fsm_stall = (comp_cur_state != C_IDLE);
assign comp_fsm_idle  = (comp_cur_state == C_IDLE);

//==========================================================
//                  req source select(master0~3)
//note:       req source select(according ciu)
//            if two_trans_1st set, then fix source
//                   
//==========================================================
//reqq create  ; bar req create
assign piu_ctc_req[3:0] = {piu3_ctcq_ar_req,
                           piu2_ctcq_ar_req,
                           piu1_ctcq_ar_req,
                           piu0_ctcq_ar_req} 
                        & {4{!sync_fsm_stall & !ctc_respq_full}};

assign ebiu_dvm_req     = ebiuif_ctcq_acvalid & !comp_fsm_stall & !dvm_respq_full;

assign ctc_dvm_req[4:0] = {ebiu_dvm_req,piu_ctc_req[3:0]};

assign ctc_dvm_req_after_mask[4:0] = ctc_dvm_req[4:0] & last_req_sel[4:0];
assign ctc_dvm_clr = !reqq_full & !two_trans_need;

// &Instance('#(.NUM(5))',"ct_prio"); @235
ct_prio #(.NUM(5)) x_ct_prio (
  .clk                    (prio_clk              ),
  .clr                    (ctc_dvm_clr           ),
  .rst_b                  (cpurst_b              ),
  .sel                    (ctc_dvm_sel           ),
  .valid                  (ctc_dvm_req_after_mask)
);

// &Connect( @236
//   .clk    (prio_clk               ), @237
//   .rst_b  (cpurst_b               ), @238
//   .valid  (ctc_dvm_req_after_mask ), @239
//   .clr    (ctc_dvm_clr            ), @240
//   .sel    (ctc_dvm_sel            ) @241
// ); @242

always @(posedge ctcq_create_clk or negedge cpurst_b)
begin
  if(~cpurst_b)
    last_req_sel[4:0] <= {5{1'b1}};
  else if (ctc_dvm_create_en)
    last_req_sel[4:0] <= ctc_dvm_addr[0] ? ctc_dvm_sel[4:0] : {5{1'b1}};
  else
    last_req_sel[4:0] <= last_req_sel[4:0];
end

always @(posedge ctcq_create_clk or negedge cpurst_b)
begin
  if(~cpurst_b)
    two_trans_need <= 1'b0;
  else if (ctc_dvm_create_en)
    two_trans_need <= ctc_dvm_addr[0];
end

//--------------------------------------
//    request select
//--------------------------------------
parameter ARID_0     = 14;
parameter ARID_4     = 18;
parameter ARDOMAIN_0 = 27;
parameter ARDOMAIN_1 = 28;
parameter ARADDR_0   = 31;
parameter ARADDR_H   = 70;
parameter ARWIDTH    = 71;

// &Force("bus","piu0_ctcq_ar_bus", ARWIDTH-1,0); @273
// &Force("bus","piu1_ctcq_ar_bus", ARWIDTH-1,0); @274
// &Force("bus","piu2_ctcq_ar_bus", ARWIDTH-1,0); @275
// &Force("bus","piu3_ctcq_ar_bus", ARWIDTH-1,0); @276

assign ctcq_piu0_ar_grant   = !reqq_full & ctc_dvm_sel[0];
assign ctcq_piu1_ar_grant   = !reqq_full & ctc_dvm_sel[1];
assign ctcq_piu2_ar_grant   = !reqq_full & ctc_dvm_sel[2];
assign ctcq_piu3_ar_grant   = !reqq_full & ctc_dvm_sel[3];
assign ctcq_ebiuif_ac_grant = !reqq_full & ctc_dvm_sel[4];

assign ctc_req_vld       = |ctc_dvm_sel[3:0];

assign ctc_dvm_req_vld   = |ctc_dvm_req_after_mask[4:0];

assign ctc_dvm_create_en = ctc_dvm_req_vld & 
                           !reqq_full;

parameter REQQ_WIDTH = 54;

assign ctc0_bus[REQQ_WIDTH-1:0] = {3'b000, 4'b1111, piu0_ctcq_ar_bus[ARDOMAIN_1:ARDOMAIN_0], piu0_ctcq_ar_bus[ARID_4:ARID_0], piu0_ctcq_ar_bus[ARADDR_H:ARADDR_0]};
assign ctc1_bus[REQQ_WIDTH-1:0] = {3'b001, 4'b1111, piu1_ctcq_ar_bus[ARDOMAIN_1:ARDOMAIN_0], piu1_ctcq_ar_bus[ARID_4:ARID_0], piu1_ctcq_ar_bus[ARADDR_H:ARADDR_0]};
assign ctc2_bus[REQQ_WIDTH-1:0] = {3'b010, 4'b1111, piu2_ctcq_ar_bus[ARDOMAIN_1:ARDOMAIN_0], piu2_ctcq_ar_bus[ARID_4:ARID_0], piu2_ctcq_ar_bus[ARADDR_H:ARADDR_0]};
assign ctc3_bus[REQQ_WIDTH-1:0] = {3'b011, 4'b1111, piu3_ctcq_ar_bus[ARDOMAIN_1:ARDOMAIN_0], piu3_ctcq_ar_bus[ARID_4:ARID_0], piu3_ctcq_ar_bus[ARADDR_H:ARADDR_0]};
assign dvm_bus[REQQ_WIDTH-1:0]  = {3'b110, ebiuif_ctcq_acsnoop[3:0], 2'b01, ebiuif_ctcq_acid[4:0], ebiuif_ctcq_acaddr[ADDRW-1:0]};

assign ctc_dvm_bus[REQQ_WIDTH-1:0] = 
            {REQQ_WIDTH{ctc_dvm_sel[0]}} & ctc0_bus[REQQ_WIDTH-1:0] | 
            {REQQ_WIDTH{ctc_dvm_sel[1]}} & ctc1_bus[REQQ_WIDTH-1:0] | 
            {REQQ_WIDTH{ctc_dvm_sel[2]}} & ctc2_bus[REQQ_WIDTH-1:0] | 
            {REQQ_WIDTH{ctc_dvm_sel[3]}} & ctc3_bus[REQQ_WIDTH-1:0] | 
            {REQQ_WIDTH{ctc_dvm_sel[4]}} &  dvm_bus[REQQ_WIDTH-1:0];

parameter ADDR_0   = 0;
parameter ADDR_H   = 39;
parameter ID_0     = 40;
parameter ID_4     = 44;
parameter DOMAIN_0 = 45;
parameter DOMAIN_1 = 46;
parameter SNOOP_0  = 47;
parameter SNOOP_3  = 50;
parameter MID_0    = 51;
parameter MID_2    = 53;

assign ctc_dvm_domain[1:0]     = ctc_dvm_bus[DOMAIN_1:DOMAIN_0];
assign ctc_dvm_snoop[3:0]      = ctc_dvm_bus[SNOOP_3:SNOOP_0];
assign ctc_dvm_addr[ADDRW-1:0] = ctc_dvm_bus[ADDR_H:ADDR_0];
assign ctc_dvm_id[4:0]         = ctc_dvm_bus[ID_4:ID_0];
assign ctc_dvm_mid[2:0]        = ctc_dvm_bus[MID_2:MID_0];
assign ctc_dvm_respq_id[3:0]   = respq_create_ptr[3:0];

//--------------------------------------
//  request aim
//--------------------------------------
assign tlbi     = ctc_dvm_addr[14:12] == 3'b000;
assign icachei  = ctc_dvm_addr[14:12] == 3'b010;
assign l2cicc   = ctc_dvm_addr[14:12] == 3'b111;
assign ctc_sh   = ctc_dvm_domain[1:0] == 2'b01;
assign op_sync  = ctc_dvm_snoop[3:0] == 4'b1111;
assign dvm_sync = ctc_dvm_sel[4] & op_sync & (ctc_dvm_addr[14:12] == 3'b100) & !two_trans_need;
assign dvm_comp = ctc_dvm_sel[4] & (ctc_dvm_snoop[3:0] == 4'b1110);

assign cp_mode[3:0]    = 4'b1111;

assign dvm_op  =  ctc_dvm_sel[4] & ctc_sh  & (tlbi | icachei) & op_sync;
assign ctc3_op = (ctc_dvm_sel[3] | ctc_sh & ciu_xx_smpen[3] & cp_mode[3]) & (tlbi | icachei) & op_sync;
assign ctc2_op = (ctc_dvm_sel[2] | ctc_sh & ciu_xx_smpen[2] & cp_mode[2]) & (tlbi | icachei) & op_sync;
assign ctc1_op = (ctc_dvm_sel[1] | ctc_sh & ciu_xx_smpen[1] & cp_mode[1]) & (tlbi | icachei) & op_sync;
assign ctc0_op = (ctc_dvm_sel[0] | ctc_sh & ciu_xx_smpen[0] & cp_mode[0]) & (tlbi | icachei) & op_sync;

// &Force("input","ciu_chr2_dvm_dis"); @352
assign aim_ebiu = 1'b0;

assign aim_piu3 = dvm_op & ciu_xx_smpen[3] | ctc3_op;
assign aim_piu2 = dvm_op & ciu_xx_smpen[2] | ctc2_op;
assign aim_piu1 = dvm_op & ciu_xx_smpen[1] | ctc1_op;
assign aim_piu0 = dvm_op & ciu_xx_smpen[0] | ctc0_op;

assign aim_piu[4:0] = {aim_ebiu,aim_piu3,aim_piu2,aim_piu1,aim_piu0};

//record last time aim,for two_trans req
always @(posedge ctcq_create_clk or negedge cpurst_b)
begin
  if(~cpurst_b)
    aim_last[4:0] <= 5'b0;
  else if(ctc_dvm_create_en & ctc_dvm_addr[0])
    aim_last[4:0] <= aim_piu[4:0];
  else
    aim_last[4:0] <= aim_last[4:0];
end

assign aim_ebiu_final = two_trans_need ? aim_last[4] : aim_ebiu;
assign aim_piu3_final = two_trans_need ? aim_last[3] : aim_piu3;
assign aim_piu2_final = two_trans_need ? aim_last[2] : aim_piu2;
assign aim_piu1_final = two_trans_need ? aim_last[1] : aim_piu1;
assign aim_piu0_final = two_trans_need ? aim_last[0] : aim_piu0;

assign l2c_aim  = two_trans_need ? 1'b0 : (ctc_req_vld & l2cicc);

assign ctc_dvm_aim[5:0] = {l2c_aim,aim_ebiu_final,aim_piu3_final,aim_piu2_final,aim_piu1_final,aim_piu0_final};

//==========================================================
//            REQQ maintaince(8 entry)
//==========================================================
//--------------------------------------
//    create pointer: one hot
//--------------------------------------

always @(posedge ctcq_create_clk or negedge cpurst_b)
begin
  if(~cpurst_b)
    reqq_create_ptr[7:0] <= 8'b1;
  else if(ctc_dvm_create_en)
    reqq_create_ptr[7:0] <= {reqq_create_ptr[6:0],reqq_create_ptr[7]};
  else
    reqq_create_ptr[7:0] <= reqq_create_ptr[7:0];
end

assign reqq_create_en[7:0] = {8{ctc_dvm_create_en}} & reqq_create_ptr[7:0];

assign reqq_full  = |(reqq_vld[7:0] & reqq_create_ptr[7:0]);
assign reqq_empty = ~(|reqq_vld[7:0]);
assign reqq_ctc_empty = ~(|(reqq_vld[7:0] & reqq_ctc[7:0]));

//--------------------------------------
//   R or CR response
//--------------------------------------
assign ctc_dvm_resp_grant = piu0_ctcq_r_grant |
                            piu1_ctcq_r_grant |
                            piu2_ctcq_r_grant |
                            piu3_ctcq_r_grant |
                            ebiuif_ctcq_cr_grant;

always @(posedge resp_clk or negedge cpurst_b)
begin
  if(~cpurst_b)
    reqq_resp_ptr[7:0] <= 8'b1;
  else if (ctc_dvm_resp_grant)
    reqq_resp_ptr[7:0] <= {reqq_resp_ptr[6:0],reqq_resp_ptr[7]};
  else
    reqq_resp_ptr[7:0] <= reqq_resp_ptr[7:0];
end

assign reqq_resp_done[7:0] = {8{ctc_dvm_resp_grant}} & reqq_resp_ptr[7:0];

assign reqq_resp_valid = |(reqq_resp_ptr[7:0] & reqq_resp_vld[7:0]);

assign reqq_resp_mid[2:0] = 
                    {3{reqq_resp_ptr[0]}} & reqq_entry0_mid[2:0] |
                    {3{reqq_resp_ptr[1]}} & reqq_entry1_mid[2:0] |
                    {3{reqq_resp_ptr[2]}} & reqq_entry2_mid[2:0] |
                    {3{reqq_resp_ptr[3]}} & reqq_entry3_mid[2:0] |
                    {3{reqq_resp_ptr[4]}} & reqq_entry4_mid[2:0] |
                    {3{reqq_resp_ptr[5]}} & reqq_entry5_mid[2:0] |
                    {3{reqq_resp_ptr[6]}} & reqq_entry6_mid[2:0] |
                    {3{reqq_resp_ptr[7]}} & reqq_entry7_mid[2:0];

assign reqq_resp_rid[4:0] = 
                    {5{reqq_resp_ptr[0]}} & reqq_entry0_rid[4:0] |
                    {5{reqq_resp_ptr[1]}} & reqq_entry1_rid[4:0] |
                    {5{reqq_resp_ptr[2]}} & reqq_entry2_rid[4:0] |
                    {5{reqq_resp_ptr[3]}} & reqq_entry3_rid[4:0] |
                    {5{reqq_resp_ptr[4]}} & reqq_entry4_rid[4:0] |
                    {5{reqq_resp_ptr[5]}} & reqq_entry5_rid[4:0] |
                    {5{reqq_resp_ptr[6]}} & reqq_entry6_rid[4:0] |
                    {5{reqq_resp_ptr[7]}} & reqq_entry7_rid[4:0];

parameter UPKB_WIDTH = 535;
assign ctcq_piu0_rvalid = reqq_resp_valid & (reqq_resp_mid[2:0] == 3'b000);
assign ctcq_piu1_rvalid = reqq_resp_valid & (reqq_resp_mid[2:0] == 3'b001);
assign ctcq_piu2_rvalid = reqq_resp_valid & (reqq_resp_mid[2:0] == 3'b010);
assign ctcq_piu3_rvalid = reqq_resp_valid & (reqq_resp_mid[2:0] == 3'b011);

assign ctcq_piux_rbus[UPKB_WIDTH-1:0] = {2'b00,2'b0,2'b10,5'b0,reqq_resp_rid[4:0],519'b0};

assign ctcq_ebiuif_crvalid = dvm_sync_pop;
assign ctcq_ebiuif_crresp[4:0] = 5'b0;  

assign dvm_sync_pop = reqq_resp_valid & (reqq_resp_mid[2:0] == 3'b110);
//--------------------------------------
//pop to piu0
//pop0 pointer: one hot
//--------------------------------------
always @(posedge reqq_pop_clk or negedge cpurst_b)
begin
  if(~cpurst_b)
    reqq_pop0_ptr[7:0] <= 8'b1;
  else if(ctcq_req_pop0_en)
    reqq_pop0_ptr[7:0] <= {reqq_pop0_ptr[6:0],reqq_pop0_ptr[7]};
  else
    reqq_pop0_ptr[7:0] <= reqq_pop0_ptr[7:0];
end

assign reqq_pop0_en[7:0] = {8{ctcq_req_pop0_en}} & reqq_pop0_ptr[7:0];
assign ctcq_req_pop0_en =  piu0_ctcq_ac_grant //real req
                         | ctcq_piu0_void_req;//void req

parameter AC_WIDTH = 55;
assign ctcq_piu0_real_req = |(  reqq_piu0_vld[7:0] 
                              & reqq_piu0_aim[7:0]
                              & reqq_pop0_ptr[7:0]);
assign ctcq_piu0_void_req = |(  reqq_piu0_vld[7:0] 
                              & ~reqq_piu0_aim[7:0]
                              & reqq_pop0_ptr[7:0]);
assign ctcq_piu0_acvalid = ctcq_piu0_real_req;

assign ctcq_piu0_ac_respq_id[3:0] = (reqq_entry0_respq_id[3:0] & {4{reqq_pop0_ptr[0]}})
                                  | (reqq_entry1_respq_id[3:0] & {4{reqq_pop0_ptr[1]}})
                                  | (reqq_entry2_respq_id[3:0] & {4{reqq_pop0_ptr[2]}})
                                  | (reqq_entry3_respq_id[3:0] & {4{reqq_pop0_ptr[3]}})
                                  | (reqq_entry4_respq_id[3:0] & {4{reqq_pop0_ptr[4]}})
                                  | (reqq_entry5_respq_id[3:0] & {4{reqq_pop0_ptr[5]}})
                                  | (reqq_entry6_respq_id[3:0] & {4{reqq_pop0_ptr[6]}})
                                  | (reqq_entry7_respq_id[3:0] & {4{reqq_pop0_ptr[7]}});

assign ctcq_piu0_ac_addr[ADDRW-1:0] 
                               = (reqq_entry0_addr[ADDRW-1:0] & {ADDRW{reqq_pop0_ptr[0]}})
                               | (reqq_entry1_addr[ADDRW-1:0] & {ADDRW{reqq_pop0_ptr[1]}})
                               | (reqq_entry2_addr[ADDRW-1:0] & {ADDRW{reqq_pop0_ptr[2]}})
                               | (reqq_entry3_addr[ADDRW-1:0] & {ADDRW{reqq_pop0_ptr[3]}})
                               | (reqq_entry4_addr[ADDRW-1:0] & {ADDRW{reqq_pop0_ptr[4]}})
                               | (reqq_entry5_addr[ADDRW-1:0] & {ADDRW{reqq_pop0_ptr[5]}})
                               | (reqq_entry6_addr[ADDRW-1:0] & {ADDRW{reqq_pop0_ptr[6]}})
                               | (reqq_entry7_addr[ADDRW-1:0] & {ADDRW{reqq_pop0_ptr[7]}});

assign ctcq_piu0_acbus[AC_WIDTH-1:0] = {ctcq_piu0_ac_addr[ADDRW-1:0],
                                        4'b1000,  1'b0, //ctcq req xid=4'b1000
                                        1'b0,ctcq_piu0_ac_respq_id[3:0],
                                        1'b0,
                                        4'b1111}; //ctc snoop

//--------------------------------------
//pop to piu1
//pop1 pointer: one hot
//--------------------------------------

always @(posedge reqq_pop_clk or negedge cpurst_b)
begin
  if(~cpurst_b)
    reqq_pop1_ptr[7:0] <= 8'b1;
  else if(ctcq_req_pop1_en)
    reqq_pop1_ptr[7:0] <= {reqq_pop1_ptr[6:0],reqq_pop1_ptr[7]};
  else
    reqq_pop1_ptr[7:0] <= reqq_pop1_ptr[7:0];
end

assign reqq_pop1_en[7:0] = {8{ctcq_req_pop1_en}} & reqq_pop1_ptr[7:0];

assign ctcq_req_pop1_en =  piu1_ctcq_ac_grant //real req
                        || ctcq_piu1_void_req;//void req
// dispatch req to piu1
assign ctcq_piu1_real_req = |(  reqq_piu1_vld[7:0] 
                              & reqq_piu1_aim[7:0]
                              & reqq_pop1_ptr[7:0]);
assign ctcq_piu1_void_req = |(  reqq_piu1_vld[7:0] 
                              & ~reqq_piu1_aim[7:0]
                              & reqq_pop1_ptr[7:0]);

assign ctcq_piu1_acvalid = ctcq_piu1_real_req;

assign ctcq_piu1_ac_respq_id[3:0] = (reqq_entry0_respq_id[3:0] & {4{reqq_pop1_ptr[0]}})
                                  | (reqq_entry1_respq_id[3:0] & {4{reqq_pop1_ptr[1]}})
                                  | (reqq_entry2_respq_id[3:0] & {4{reqq_pop1_ptr[2]}})
                                  | (reqq_entry3_respq_id[3:0] & {4{reqq_pop1_ptr[3]}})
                                  | (reqq_entry4_respq_id[3:0] & {4{reqq_pop1_ptr[4]}})
                                  | (reqq_entry5_respq_id[3:0] & {4{reqq_pop1_ptr[5]}})
                                  | (reqq_entry6_respq_id[3:0] & {4{reqq_pop1_ptr[6]}})
                                  | (reqq_entry7_respq_id[3:0] & {4{reqq_pop1_ptr[7]}});

assign ctcq_piu1_ac_addr[ADDRW-1:0] 
                               = (reqq_entry0_addr[ADDRW-1:0] & {ADDRW{reqq_pop1_ptr[0]}})
                               | (reqq_entry1_addr[ADDRW-1:0] & {ADDRW{reqq_pop1_ptr[1]}})
                               | (reqq_entry2_addr[ADDRW-1:0] & {ADDRW{reqq_pop1_ptr[2]}})
                               | (reqq_entry3_addr[ADDRW-1:0] & {ADDRW{reqq_pop1_ptr[3]}})
                               | (reqq_entry4_addr[ADDRW-1:0] & {ADDRW{reqq_pop1_ptr[4]}})
                               | (reqq_entry5_addr[ADDRW-1:0] & {ADDRW{reqq_pop1_ptr[5]}})
                               | (reqq_entry6_addr[ADDRW-1:0] & {ADDRW{reqq_pop1_ptr[6]}})
                               | (reqq_entry7_addr[ADDRW-1:0] & {ADDRW{reqq_pop1_ptr[7]}});

assign ctcq_piu1_acbus[AC_WIDTH-1:0] = {ctcq_piu1_ac_addr[ADDRW-1:0],
                                        4'b1000, 1'b0, //ctcq req xid=4'b1000
                                        1'b0,ctcq_piu1_ac_respq_id[3:0],
                                        1'b0,
                                        4'b1111}; //ctc snoop

//--------------------------------------
//pop to piu2
//pop2 pointer: one hot
//--------------------------------------

always @(posedge reqq_pop_clk or negedge cpurst_b)
begin
  if(~cpurst_b)
    reqq_pop2_ptr[7:0] <= 8'b1;
  else if(ctcq_req_pop2_en)
    reqq_pop2_ptr[7:0] <= {reqq_pop2_ptr[6:0],reqq_pop2_ptr[7]};
  else
    reqq_pop2_ptr[7:0] <= reqq_pop2_ptr[7:0];
end

assign reqq_pop2_en[7:0] = {8{ctcq_req_pop2_en}} & reqq_pop2_ptr[7:0];

assign ctcq_req_pop2_en =  piu2_ctcq_ac_grant //real req
                        || ctcq_piu2_void_req;//void req

assign ctcq_piu2_real_req = |(  reqq_piu2_vld[7:0] 
                              & reqq_piu2_aim[7:0]
                              & reqq_pop2_ptr[7:0]);
assign ctcq_piu2_void_req = |(  reqq_piu2_vld[7:0] 
                              & ~reqq_piu2_aim[7:0]
                              & reqq_pop2_ptr[7:0]);

assign ctcq_piu2_acvalid = ctcq_piu2_real_req;

assign ctcq_piu2_ac_respq_id[3:0] = (reqq_entry0_respq_id[3:0] & {4{reqq_pop2_ptr[0]}})
                                  | (reqq_entry1_respq_id[3:0] & {4{reqq_pop2_ptr[1]}})
                                  | (reqq_entry2_respq_id[3:0] & {4{reqq_pop2_ptr[2]}})
                                  | (reqq_entry3_respq_id[3:0] & {4{reqq_pop2_ptr[3]}})
                                  | (reqq_entry4_respq_id[3:0] & {4{reqq_pop2_ptr[4]}})
                                  | (reqq_entry5_respq_id[3:0] & {4{reqq_pop2_ptr[5]}})
                                  | (reqq_entry6_respq_id[3:0] & {4{reqq_pop2_ptr[6]}})
                                  | (reqq_entry7_respq_id[3:0] & {4{reqq_pop2_ptr[7]}});

assign ctcq_piu2_ac_addr[ADDRW-1:0] 
                               = (reqq_entry0_addr[ADDRW-1:0] & {ADDRW{reqq_pop2_ptr[0]}})
                               | (reqq_entry1_addr[ADDRW-1:0] & {ADDRW{reqq_pop2_ptr[1]}})
                               | (reqq_entry2_addr[ADDRW-1:0] & {ADDRW{reqq_pop2_ptr[2]}})
                               | (reqq_entry3_addr[ADDRW-1:0] & {ADDRW{reqq_pop2_ptr[3]}})
                               | (reqq_entry4_addr[ADDRW-1:0] & {ADDRW{reqq_pop2_ptr[4]}})
                               | (reqq_entry5_addr[ADDRW-1:0] & {ADDRW{reqq_pop2_ptr[5]}})
                               | (reqq_entry6_addr[ADDRW-1:0] & {ADDRW{reqq_pop2_ptr[6]}})
                               | (reqq_entry7_addr[ADDRW-1:0] & {ADDRW{reqq_pop2_ptr[7]}});

assign ctcq_piu2_acbus[AC_WIDTH-1:0] = {ctcq_piu2_ac_addr[ADDRW-1:0],
                                        4'b1000, 1'b0, //ctcq req xid=4'b1000
                                        1'b0,ctcq_piu2_ac_respq_id[3:0],
                                        1'b0,  // inst+id
                                        4'b1111}; //ctc snoop

//--------------------------------------
//pop to piu3
//pop3 pointer: one hot
//--------------------------------------

always @(posedge reqq_pop_clk or negedge cpurst_b)
begin
  if(~cpurst_b)
    reqq_pop3_ptr[7:0] <= 8'b1;
  else if(ctcq_req_pop3_en)
    reqq_pop3_ptr[7:0] <= {reqq_pop3_ptr[6:0],reqq_pop3_ptr[7]};
  else
    reqq_pop3_ptr[7:0] <= reqq_pop3_ptr[7:0];
end

assign reqq_pop3_en[7:0] = {8{ctcq_req_pop3_en}} & reqq_pop3_ptr[7:0];

assign ctcq_req_pop3_en =  piu3_ctcq_ac_grant //real req
                        || ctcq_piu3_void_req;//void req

assign ctcq_piu3_real_req = |(  reqq_piu3_vld[7:0] 
                              & reqq_piu3_aim[7:0]
                              & reqq_pop3_ptr[7:0]);
assign ctcq_piu3_void_req = |(  reqq_piu3_vld[7:0] 
                              & ~reqq_piu3_aim[7:0]
                              & reqq_pop3_ptr[7:0]);

assign ctcq_piu3_acvalid = ctcq_piu3_real_req;

assign ctcq_piu3_ac_respq_id[3:0] = (reqq_entry0_respq_id[3:0] & {4{reqq_pop3_ptr[0]}})
                                  | (reqq_entry1_respq_id[3:0] & {4{reqq_pop3_ptr[1]}})
                                  | (reqq_entry2_respq_id[3:0] & {4{reqq_pop3_ptr[2]}})
                                  | (reqq_entry3_respq_id[3:0] & {4{reqq_pop3_ptr[3]}})
                                  | (reqq_entry4_respq_id[3:0] & {4{reqq_pop3_ptr[4]}})
                                  | (reqq_entry5_respq_id[3:0] & {4{reqq_pop3_ptr[5]}})
                                  | (reqq_entry6_respq_id[3:0] & {4{reqq_pop3_ptr[6]}})
                                  | (reqq_entry7_respq_id[3:0] & {4{reqq_pop3_ptr[7]}});

assign ctcq_piu3_ac_addr[ADDRW-1:0] 
                               = (reqq_entry0_addr[ADDRW-1:0] & {ADDRW{reqq_pop3_ptr[0]}})
                               | (reqq_entry1_addr[ADDRW-1:0] & {ADDRW{reqq_pop3_ptr[1]}})
                               | (reqq_entry2_addr[ADDRW-1:0] & {ADDRW{reqq_pop3_ptr[2]}})
                               | (reqq_entry3_addr[ADDRW-1:0] & {ADDRW{reqq_pop3_ptr[3]}})
                               | (reqq_entry4_addr[ADDRW-1:0] & {ADDRW{reqq_pop3_ptr[4]}})
                               | (reqq_entry5_addr[ADDRW-1:0] & {ADDRW{reqq_pop3_ptr[5]}})
                               | (reqq_entry6_addr[ADDRW-1:0] & {ADDRW{reqq_pop3_ptr[6]}})
                               | (reqq_entry7_addr[ADDRW-1:0] & {ADDRW{reqq_pop3_ptr[7]}});

assign ctcq_piu3_acbus[AC_WIDTH-1:0] = {ctcq_piu3_ac_addr[ADDRW-1:0],
                                        4'b1000, 1'b0, //ctcq req xid=4'b1000
                                        1'b0,ctcq_piu3_ac_respq_id[3:0],
                                        1'b0,
                                        4'b1111}; //ctc snoop

//--------------------------------------
// req to ebiu
// ebiu pointer: one hot
//--------------------------------------
assign ctcq_req_pop_ebiu_en = dvm_op_grant | ctcq_ebiu_void_req;

always @(posedge reqq_pop_clk or negedge cpurst_b)
begin
  if(~cpurst_b)
    reqq_pop_ebiu_ptr[7:0] <= 8'b1;
  else if(ctcq_req_pop_ebiu_en)
    reqq_pop_ebiu_ptr[7:0] <= {reqq_pop_ebiu_ptr[6:0],reqq_pop_ebiu_ptr[7]};
  else
    reqq_pop_ebiu_ptr[7:0] <= reqq_pop_ebiu_ptr[7:0];
end

assign reqq_pop_ebiu_en[7:0] = {8{ctcq_req_pop_ebiu_en}} & reqq_pop_ebiu_ptr[7:0];

assign ctcq_ebiu_real_req = |(reqq_ebiu_vld[7:0] &  reqq_ebiu_aim[7:0] & reqq_pop_ebiu_ptr[7:0]);
assign ctcq_ebiu_void_req = |(reqq_ebiu_vld[7:0] & ~reqq_ebiu_aim[7:0] & reqq_pop_ebiu_ptr[7:0]);

assign dvm_op_arvalid = ctcq_ebiu_real_req;

assign dvm_op_araddr[ADDRW-1:0] =
                   {ADDRW{reqq_pop_ebiu_ptr[0]}} & reqq_entry0_addr[ADDRW-1:0] |
                   {ADDRW{reqq_pop_ebiu_ptr[1]}} & reqq_entry1_addr[ADDRW-1:0] |
                   {ADDRW{reqq_pop_ebiu_ptr[2]}} & reqq_entry2_addr[ADDRW-1:0] |
                   {ADDRW{reqq_pop_ebiu_ptr[3]}} & reqq_entry3_addr[ADDRW-1:0] |
                   {ADDRW{reqq_pop_ebiu_ptr[4]}} & reqq_entry4_addr[ADDRW-1:0] |
                   {ADDRW{reqq_pop_ebiu_ptr[5]}} & reqq_entry5_addr[ADDRW-1:0] |
                   {ADDRW{reqq_pop_ebiu_ptr[6]}} & reqq_entry6_addr[ADDRW-1:0] |
                   {ADDRW{reqq_pop_ebiu_ptr[7]}} & reqq_entry7_addr[ADDRW-1:0];

assign dvm_op_arid[3:0] = (reqq_entry0_respq_id[3:0] & {4{reqq_pop_ebiu_ptr[0]}})
                        | (reqq_entry1_respq_id[3:0] & {4{reqq_pop_ebiu_ptr[1]}})
                        | (reqq_entry2_respq_id[3:0] & {4{reqq_pop_ebiu_ptr[2]}})
                        | (reqq_entry3_respq_id[3:0] & {4{reqq_pop_ebiu_ptr[3]}})
                        | (reqq_entry4_respq_id[3:0] & {4{reqq_pop_ebiu_ptr[4]}})
                        | (reqq_entry5_respq_id[3:0] & {4{reqq_pop_ebiu_ptr[5]}})
                        | (reqq_entry6_respq_id[3:0] & {4{reqq_pop_ebiu_ptr[6]}})
                        | (reqq_entry7_respq_id[3:0] & {4{reqq_pop_ebiu_ptr[7]}});

// &Force("nonport","dvm_rfifo_create_en"); @718
// &Force("nonport","dvm_rfifo_create_bus"); @719
// &Force("nonport","dvm_rfifo_pop_en"); @720
// &Force("nonport","dvm_rfifo_pop_bus"); @721
// &Force("nonport","dvm_rfifo_pop_bus_vld"); @722

assign dvm_rfifo_create_en = dvm_op_grant;
assign dvm_rfifo_create_bus[3:0] = dvm_op_arid[3:0];
assign dvm_rfifo_pop_en = dvm_op_cmplt;

ct_fifo #(.WIDTH(4), .DEPTH(16), .PTR_W(4)) x_ct_dvm_op_rid_rfifo(
  .clk                 (forever_cpuclk       ),
  .rst_b               (cpurst_b             ),
  .fifo_create_en      (dvm_rfifo_create_en  ),
  .fifo_create_en_dp   (dvm_rfifo_create_en  ),
  .fifo_pop_en         (dvm_rfifo_pop_en     ),
  .fifo_create_data    (dvm_rfifo_create_bus ),
  .fifo_pop_data       (dvm_rfifo_pop_bus    ),
  .fifo_pop_data_vld   (dvm_rfifo_pop_bus_vld),
  .fifo_full           (dvm_rfifo_full       ),
  .fifo_empty          (dvm_rfifo_empty      ),
  .pad_yy_icg_scan_en(pad_yy_icg_scan_en ),
  .fifo_icg_en         (ciu_icg_en)
);
assign dvm_op_rid[3:0] = dvm_rfifo_pop_bus[3:0];

//--------------------------------------
//req to L2
//popl2 pointer: one hot
//--------------------------------------
always @(posedge reqq_pop_clk or negedge cpurst_b)
begin
  if(~cpurst_b)
    reqq_popl2c_ptr[7:0] <= 8'b1;
  else if(ctcq_req_popl2c_en)
    reqq_popl2c_ptr[7:0] <= {reqq_popl2c_ptr[6:0],reqq_popl2c_ptr[7]};
  else
    reqq_popl2c_ptr[7:0] <= reqq_popl2c_ptr[7:0];
end

assign reqq_popl2c_en[7:0] = {8{ctcq_req_popl2c_en}} & reqq_popl2c_ptr[7:0];
assign ctcq_req_popl2c_en =  l2c_ctcq_cmplt | ctcq_l2c_void_req;

assign ctcq_l2c_real_req = |(  reqq_l2c_vld[7:0] 
                              & reqq_l2c_aim[7:0]
                              & reqq_popl2c_ptr[7:0]);

assign ctcq_l2c_void_req = |(   reqq_l2c_vld[7:0] 
                              & ~reqq_l2c_aim[7:0]
                              & reqq_popl2c_ptr[7:0]);

assign ctcq_l2c_addr_req = ctcq_l2c_real_req;

assign ctcq_l2c_respq_id[3:0] = (reqq_entry0_respq_id[3:0] & {4{reqq_popl2c_ptr[0]}})
                              | (reqq_entry1_respq_id[3:0] & {4{reqq_popl2c_ptr[1]}})
                              | (reqq_entry2_respq_id[3:0] & {4{reqq_popl2c_ptr[2]}})
                              | (reqq_entry3_respq_id[3:0] & {4{reqq_popl2c_ptr[3]}})
                              | (reqq_entry4_respq_id[3:0] & {4{reqq_popl2c_ptr[4]}})
                              | (reqq_entry5_respq_id[3:0] & {4{reqq_popl2c_ptr[5]}})
                              | (reqq_entry6_respq_id[3:0] & {4{reqq_popl2c_ptr[6]}})
                              | (reqq_entry7_respq_id[3:0] & {4{reqq_popl2c_ptr[7]}});

assign ctcq_l2c_req_type[1:0] = (reqq_entry0_l2ctype[1:0] & {2{reqq_popl2c_ptr[0]}})
                              | (reqq_entry1_l2ctype[1:0] & {2{reqq_popl2c_ptr[1]}})
                              | (reqq_entry2_l2ctype[1:0] & {2{reqq_popl2c_ptr[2]}})
                              | (reqq_entry3_l2ctype[1:0] & {2{reqq_popl2c_ptr[3]}})
                              | (reqq_entry4_l2ctype[1:0] & {2{reqq_popl2c_ptr[4]}})
                              | (reqq_entry5_l2ctype[1:0] & {2{reqq_popl2c_ptr[5]}})
                              | (reqq_entry6_l2ctype[1:0] & {2{reqq_popl2c_ptr[6]}})
                              | (reqq_entry7_l2ctype[1:0] & {2{reqq_popl2c_ptr[7]}});


//==================================================================
//        TO EBIUIF AR
//==================================================================
assign ctcq_arvalid[2:0] = {dvm_comp_arvalid, dvm_sync_arvalid, dvm_op_arvalid};
// &CombBeg; @794
always @( dvm_sync_araddr[39:0]
       or dvm_op_araddr[39:0]
       or ctcq_arvalid[2:0]
       or dvm_comp_araddr[39:0])
begin
  casez(ctcq_arvalid[2:0])
  3'b1??: begin ctcq_araddr[ADDRW-1:0] = dvm_comp_araddr[ADDRW-1:0]; ctcq_arsnoop[3:0] = 4'b1110; ctcq_arid[5:0] = {2'b10, 4'b0}; end
  3'b01?: begin ctcq_araddr[ADDRW-1:0] = dvm_sync_araddr[ADDRW-1:0]; ctcq_arsnoop[3:0] = 4'b1111; ctcq_arid[5:0] = {2'b01, 4'b0}; end
  3'b001: begin ctcq_araddr[ADDRW-1:0] = dvm_op_araddr[ADDRW-1:0];   ctcq_arsnoop[3:0] = 4'b1111; ctcq_arid[5:0] = {2'b00, 4'b0}; end
  default:begin ctcq_araddr[ADDRW-1:0] = {ADDRW{1'b0}};              ctcq_arsnoop[3:0] = 4'b0;    ctcq_arid[5:0] = 6'b0; end
  endcase
// &CombEnd; @801
end

assign arbuf_idle = !arbuf_vld | ebiu_ctcq_ar_grant;
assign arbuf_create_en = |ctcq_arvalid[2:0] & arbuf_idle;
assign arbuf_pop_en    = arbuf_vld & ebiu_ctcq_ar_grant;

always@(posedge arbuf_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    arbuf_vld <= 1'b0;
  else if (arbuf_create_en)
    arbuf_vld <= 1'b1;
  else if (arbuf_pop_en)        
    arbuf_vld <= 1'b0;
end

assign ctcq_ebiu_arvalid = arbuf_vld;

always@(posedge arbuf_clk)
begin
  if (arbuf_create_en)
  begin
    ctcq_ebiu_araddr[ADDRW-1:0] <= ctcq_araddr[ADDRW-1:0];
    ctcq_ebiu_arsnoop[3:0]      <= ctcq_arsnoop[3:0];
    ctcq_ebiu_arid[5:0]         <= ctcq_arid[5:0];
  end
end

assign ctcq_ebiu_arburst[1:0]  = 2'b01;
assign ctcq_ebiu_arlen[7:0]    = 8'b0;
assign ctcq_ebiu_arsize[2:0]   = 3'b100;
assign ctcq_ebiu_arcache[3:0]  = 4'b0010;
assign ctcq_ebiu_arprot[2:0]   = 3'b0;
assign ctcq_ebiu_ardomain[1:0] = 2'b01;
assign ctcq_ebiu_arbar[1:0]    = 2'b0;
assign ctcq_ebiu_arlock        = 1'b0;

assign dvm_comp_grant = arbuf_idle; 
assign dvm_sync_grant = arbuf_idle & !dvm_comp_arvalid;
assign dvm_op_grant   = arbuf_idle & !dvm_comp_arvalid & !dvm_sync_arvalid & dvm_op_arvalid;

assign dvm_comp_cmplt = ebiu_ctcq_rvalid & (ebiu_ctcq_rid[5:4] == 2'b10);
assign dvm_sync_cmplt = ebiu_ctcq_rvalid & (ebiu_ctcq_rid[5:4] == 2'b01);

//==========================================================
//      RESPQ maintance(16 entry)
//==========================================================
//--------------------------------------
//respq create pointer: one hot
//--------------------------------------
assign ctc_respq_full = &respq_vld[14:0];
assign dvm_respq_full = &respq_vld[15:0];

// &CombBeg; @854
always @( respq_vld[15:0])
begin
  casez(respq_vld[15:0])
  16'b???????????????0 : respq_create_ptr[3:0] = 4'b0000; 
  16'b??????????????01 : respq_create_ptr[3:0] = 4'b0001; 
  16'b?????????????011 : respq_create_ptr[3:0] = 4'b0010; 
  16'b????????????0111 : respq_create_ptr[3:0] = 4'b0011; 
  16'b???????????01111 : respq_create_ptr[3:0] = 4'b0100; 
  16'b??????????011111 : respq_create_ptr[3:0] = 4'b0101; 
  16'b?????????0111111 : respq_create_ptr[3:0] = 4'b0110; 
  16'b????????01111111 : respq_create_ptr[3:0] = 4'b0111; 
  16'b???????011111111 : respq_create_ptr[3:0] = 4'b1000; 
  16'b??????0111111111 : respq_create_ptr[3:0] = 4'b1001; 
  16'b?????01111111111 : respq_create_ptr[3:0] = 4'b1010; 
  16'b????011111111111 : respq_create_ptr[3:0] = 4'b1011; 
  16'b???0111111111111 : respq_create_ptr[3:0] = 4'b1100; 
  16'b??01111111111111 : respq_create_ptr[3:0] = 4'b1101; 
  16'b?011111111111111 : respq_create_ptr[3:0] = 4'b1110; 
  16'b0111111111111111 : respq_create_ptr[3:0] = 4'b1111; 
  default              : respq_create_ptr[3:0] = 4'b0;
  endcase
// &CombEnd; @874
end

assign respq_create_sel[15:0] = 16'b1 << respq_create_ptr[3:0];

assign respq_create_en[15:0] = {16{ctc_dvm_create_en & !dvm_sync & !dvm_comp}} & respq_create_sel[15:0];
assign respq_create_cmplt_init[5:0] = ~ctc_dvm_aim[5:0];
assign respq_create_dvm             = dvm_op;

assign respq_empty = ~(|respq_vld[15:0]);
assign respq_dvm_empty = ~(|(respq_vld[15:0] & respq_dvm[15:0]));
assign respq_ctc_empty = ~(|(respq_vld[15:0] & ~respq_dvm[15:0]));

//--------------------------------------
//respq piu0 resp  create pointer: one hot
//--------------------------------------
// &Force("bus","piu0_ctcq_cr_bus",9,0); @889

assign respq_piu0_resp_create_ptr[15:0] = 16'b1 << piu0_ctcq_cr_bus[8:5];

assign respq_piu0_resp_create_en[15:0] = {16{piu0_ctcq_cr_req}} & respq_piu0_resp_create_ptr[15:0];

assign ctcq_piu0_cr_grant = piu0_ctcq_cr_req;

//--------------------------------------
//respq piu1 resp  create pointer: one hot
//--------------------------------------
// &Force("bus","piu1_ctcq_cr_bus",9,0); @900

assign respq_piu1_resp_create_ptr[15:0] = 16'b1 << piu1_ctcq_cr_bus[8:5];

assign respq_piu1_resp_create_en[15:0] = {16{piu1_ctcq_cr_req}} & respq_piu1_resp_create_ptr[15:0];

assign ctcq_piu1_cr_grant = piu1_ctcq_cr_req;

//--------------------------------------
//respq piu2 resp  create pointer: one hot
//--------------------------------------
// &Force("bus","piu2_ctcq_cr_bus",9,0); @911

assign respq_piu2_resp_create_ptr[15:0] = 16'b1 << piu2_ctcq_cr_bus[8:5];

assign respq_piu2_resp_create_en[15:0] = {16{piu2_ctcq_cr_req}} & respq_piu2_resp_create_ptr[15:0];

assign ctcq_piu2_cr_grant = piu2_ctcq_cr_req;

//--------------------------------------
//respq piu3 resp  create pointer: one hot
//--------------------------------------
// &Force("bus","piu3_ctcq_cr_bus",9,0); @922

assign respq_piu3_resp_create_ptr[15:0] = 16'b1 << piu3_ctcq_cr_bus[8:5];

assign respq_piu3_resp_create_en[15:0] = {16{piu3_ctcq_cr_req}} & respq_piu3_resp_create_ptr[15:0];

assign ctcq_piu3_cr_grant = piu3_ctcq_cr_req;

//--------------------------------------
//respq ebiu R resp  create pointer: one hot
//--------------------------------------
// &Force("bus","ebiu_ctcq_rid",5,0); @933
assign dvm_op_cmplt = ebiu_ctcq_rvalid & (ebiu_ctcq_rid[5:4] == 2'b00);

assign respq_ebiu_resp_create_ptr[15:0] = 16'b1 << dvm_op_rid[3:0];

assign respq_ebiu_resp_create_en[15:0] = {16{dvm_op_cmplt}} & respq_ebiu_resp_create_ptr[15:0];

assign ctcq_ebiu_r_grant = ebiu_ctcq_rvalid;

//--------------------------------------
//respq l2 resp  create pointer: one hot
//--------------------------------------

assign respq_l2c_resp_create_ptr[15:0] = 16'b1<< ctcq_l2c_respq_id[3:0];

assign respq_l2c_resp_create_en[15:0] = {16{l2c_ctcq_cmplt}} & respq_l2c_resp_create_ptr[15:0];

//==========================================================
//                NO OP
//==========================================================
assign ctcq_xx_no_op = sync_fsm_idle & comp_fsm_idle & reqq_empty & respq_empty;

//==========================================================
//                ICG
//==========================================================

assign ctcq_clk_en = bar_req_vld | ctc_dvm_create_en | !sync_fsm_idle | !comp_fsm_idle;
// &Instance("gated_clk_cell","x_ctcq_gated_cell"    ); @960
gated_clk_cell  x_ctcq_gated_cell (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (ctcq_clk          ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (ctcq_clk_en       ),
  .module_en          (ciu_icg_en        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect( .clk_in           (forever_cpuclk       ), @961
//           .clk_out          (ctcq_clk             ), @962
//           .external_en      (1'b0                 ), @963
//           .global_en        (1'b1                 ), @964
//           .local_en         (ctcq_clk_en          ), @965
//           .module_en (ciu_icg_en       ) @966
//         ); @967

assign ctcq_create_clk_en = ctc_dvm_create_en;
// &Instance("gated_clk_cell","x_ctcq_create_gated_cell"    ); @970
gated_clk_cell  x_ctcq_create_gated_cell (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (ctcq_create_clk   ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (ctcq_create_clk_en),
  .module_en          (ciu_icg_en        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect( .clk_in           (forever_cpuclk       ), @971
//           .clk_out          (ctcq_create_clk      ), @972
//           .external_en      (1'b0                 ), @973
//           .global_en        (1'b1                 ), @974
//           .local_en         (ctcq_create_clk_en   ), @975
//           .module_en (ciu_icg_en       ) @976
//         ); @977

assign prio_clk_en = ctc_dvm_clr;
// &Instance("gated_clk_cell","x_ctcq_prio_gated_cell"    ); @980
gated_clk_cell  x_ctcq_prio_gated_cell (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (prio_clk          ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (prio_clk_en       ),
  .module_en          (ciu_icg_en        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect( .clk_in           (forever_cpuclk       ), @981
//           .clk_out          (prio_clk             ), @982
//           .external_en      (1'b0                 ), @983
//           .global_en        (1'b1                 ), @984
//           .local_en         (prio_clk_en          ), @985
//           .module_en (ciu_icg_en       ) @986
//         ); @987

assign resp_clk_en = ctc_dvm_resp_grant;
// &Instance("gated_clk_cell","x_ctcq_resp_gated_cell"    ); @990
gated_clk_cell  x_ctcq_resp_gated_cell (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (resp_clk          ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (resp_clk_en       ),
  .module_en          (ciu_icg_en        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect( .clk_in           (forever_cpuclk       ), @991
//           .clk_out          (resp_clk             ), @992
//           .external_en      (1'b0                 ), @993
//           .global_en        (1'b1                 ), @994
//           .local_en         (resp_clk_en          ), @995
//           .module_en (ciu_icg_en       ) @996
//         ); @997

assign reqq_pop_clk_en = ctcq_req_popl2c_en | 
                         ctcq_req_pop_ebiu_en |
                         ctcq_req_pop3_en |
                         ctcq_req_pop2_en |
                         ctcq_req_pop1_en |
                         ctcq_req_pop0_en;
// &Instance("gated_clk_cell","x_ctcq_reqq_pop_gated_cell"    ); @1005
gated_clk_cell  x_ctcq_reqq_pop_gated_cell (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (reqq_pop_clk      ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (reqq_pop_clk_en   ),
  .module_en          (ciu_icg_en        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect( .clk_in           (forever_cpuclk       ), @1006
//           .clk_out          (reqq_pop_clk         ), @1007
//           .external_en      (1'b0                 ), @1008
//           .global_en        (1'b1                 ), @1009
//           .local_en         (reqq_pop_clk_en      ), @1010
//           .module_en (ciu_icg_en       ) @1011
//         ); @1012

assign arbuf_clk_en = arbuf_create_en | arbuf_pop_en;
// &Instance("gated_clk_cell","x_ctcq_arbuf_gated_cell"    ); @1015
gated_clk_cell  x_ctcq_arbuf_gated_cell (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (arbuf_clk         ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (arbuf_clk_en      ),
  .module_en          (ciu_icg_en        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect( .clk_in           (forever_cpuclk       ), @1016
//           .clk_out          (arbuf_clk            ), @1017
//           .external_en      (1'b0                 ), @1018
//           .global_en        (1'b1                 ), @1019
//           .local_en         (arbuf_clk_en         ), @1020
//           .module_en (ciu_icg_en       ) @1021
//         ); @1022

//==========================================================
//      REQQ RESPQ instance
//==========================================================
//--------------------------------------
//reqq entry
// &ConnRule(s/entryx/entry0/); @1029
// &ConnRule(s/_x$/[0]/); @1030
// &Instance("ct_ciu_ctcq_reqq_entry","x_ct_ciu_ctcq_reqq_entry_0"); @1031
ct_ciu_ctcq_reqq_entry  x_ct_ciu_ctcq_reqq_entry_0 (
  .ciu_icg_en           (ciu_icg_en          ),
  .cpurst_b             (cpurst_b            ),
  .ctc_dvm_addr         (ctc_dvm_addr        ),
  .ctc_dvm_aim          (ctc_dvm_aim         ),
  .ctc_dvm_id           (ctc_dvm_id          ),
  .ctc_dvm_mid          (ctc_dvm_mid         ),
  .ctc_dvm_respq_id     (ctc_dvm_respq_id    ),
  .forever_cpuclk       (forever_cpuclk      ),
  .pad_yy_icg_scan_en   (pad_yy_icg_scan_en  ),
  .reqq_create_en_x     (reqq_create_en[0]   ),
  .reqq_ctc_x           (reqq_ctc[0]         ),
  .reqq_ebiu_aim_x      (reqq_ebiu_aim[0]    ),
  .reqq_ebiu_vld_x      (reqq_ebiu_vld[0]    ),
  .reqq_entryx_addr     (reqq_entry0_addr    ),
  .reqq_entryx_l2ctype  (reqq_entry0_l2ctype ),
  .reqq_entryx_mid      (reqq_entry0_mid     ),
  .reqq_entryx_respq_id (reqq_entry0_respq_id),
  .reqq_entryx_rid      (reqq_entry0_rid     ),
  .reqq_l2c_aim_x       (reqq_l2c_aim[0]     ),
  .reqq_l2c_vld_x       (reqq_l2c_vld[0]     ),
  .reqq_piu0_aim_x      (reqq_piu0_aim[0]    ),
  .reqq_piu0_vld_x      (reqq_piu0_vld[0]    ),
  .reqq_piu1_aim_x      (reqq_piu1_aim[0]    ),
  .reqq_piu1_vld_x      (reqq_piu1_vld[0]    ),
  .reqq_piu2_aim_x      (reqq_piu2_aim[0]    ),
  .reqq_piu2_vld_x      (reqq_piu2_vld[0]    ),
  .reqq_piu3_aim_x      (reqq_piu3_aim[0]    ),
  .reqq_piu3_vld_x      (reqq_piu3_vld[0]    ),
  .reqq_pop0_en_x       (reqq_pop0_en[0]     ),
  .reqq_pop1_en_x       (reqq_pop1_en[0]     ),
  .reqq_pop2_en_x       (reqq_pop2_en[0]     ),
  .reqq_pop3_en_x       (reqq_pop3_en[0]     ),
  .reqq_pop_ebiu_en_x   (reqq_pop_ebiu_en[0] ),
  .reqq_popl2c_en_x     (reqq_popl2c_en[0]   ),
  .reqq_resp_done_x     (reqq_resp_done[0]   ),
  .reqq_resp_vld_x      (reqq_resp_vld[0]    ),
  .reqq_vld_x           (reqq_vld[0]         )
);


// &ConnRule(s/entryx/entry1/); @1033
// &ConnRule(s/_x$/[1]/); @1034
// &Instance("ct_ciu_ctcq_reqq_entry","x_ct_ciu_ctcq_reqq_entry_1"); @1035
ct_ciu_ctcq_reqq_entry  x_ct_ciu_ctcq_reqq_entry_1 (
  .ciu_icg_en           (ciu_icg_en          ),
  .cpurst_b             (cpurst_b            ),
  .ctc_dvm_addr         (ctc_dvm_addr        ),
  .ctc_dvm_aim          (ctc_dvm_aim         ),
  .ctc_dvm_id           (ctc_dvm_id          ),
  .ctc_dvm_mid          (ctc_dvm_mid         ),
  .ctc_dvm_respq_id     (ctc_dvm_respq_id    ),
  .forever_cpuclk       (forever_cpuclk      ),
  .pad_yy_icg_scan_en   (pad_yy_icg_scan_en  ),
  .reqq_create_en_x     (reqq_create_en[1]   ),
  .reqq_ctc_x           (reqq_ctc[1]         ),
  .reqq_ebiu_aim_x      (reqq_ebiu_aim[1]    ),
  .reqq_ebiu_vld_x      (reqq_ebiu_vld[1]    ),
  .reqq_entryx_addr     (reqq_entry1_addr    ),
  .reqq_entryx_l2ctype  (reqq_entry1_l2ctype ),
  .reqq_entryx_mid      (reqq_entry1_mid     ),
  .reqq_entryx_respq_id (reqq_entry1_respq_id),
  .reqq_entryx_rid      (reqq_entry1_rid     ),
  .reqq_l2c_aim_x       (reqq_l2c_aim[1]     ),
  .reqq_l2c_vld_x       (reqq_l2c_vld[1]     ),
  .reqq_piu0_aim_x      (reqq_piu0_aim[1]    ),
  .reqq_piu0_vld_x      (reqq_piu0_vld[1]    ),
  .reqq_piu1_aim_x      (reqq_piu1_aim[1]    ),
  .reqq_piu1_vld_x      (reqq_piu1_vld[1]    ),
  .reqq_piu2_aim_x      (reqq_piu2_aim[1]    ),
  .reqq_piu2_vld_x      (reqq_piu2_vld[1]    ),
  .reqq_piu3_aim_x      (reqq_piu3_aim[1]    ),
  .reqq_piu3_vld_x      (reqq_piu3_vld[1]    ),
  .reqq_pop0_en_x       (reqq_pop0_en[1]     ),
  .reqq_pop1_en_x       (reqq_pop1_en[1]     ),
  .reqq_pop2_en_x       (reqq_pop2_en[1]     ),
  .reqq_pop3_en_x       (reqq_pop3_en[1]     ),
  .reqq_pop_ebiu_en_x   (reqq_pop_ebiu_en[1] ),
  .reqq_popl2c_en_x     (reqq_popl2c_en[1]   ),
  .reqq_resp_done_x     (reqq_resp_done[1]   ),
  .reqq_resp_vld_x      (reqq_resp_vld[1]    ),
  .reqq_vld_x           (reqq_vld[1]         )
);


// &ConnRule(s/entryx/entry2/); @1037
// &ConnRule(s/_x$/[2]/); @1038
// &Instance("ct_ciu_ctcq_reqq_entry","x_ct_ciu_ctcq_reqq_entry_2"); @1039
ct_ciu_ctcq_reqq_entry  x_ct_ciu_ctcq_reqq_entry_2 (
  .ciu_icg_en           (ciu_icg_en          ),
  .cpurst_b             (cpurst_b            ),
  .ctc_dvm_addr         (ctc_dvm_addr        ),
  .ctc_dvm_aim          (ctc_dvm_aim         ),
  .ctc_dvm_id           (ctc_dvm_id          ),
  .ctc_dvm_mid          (ctc_dvm_mid         ),
  .ctc_dvm_respq_id     (ctc_dvm_respq_id    ),
  .forever_cpuclk       (forever_cpuclk      ),
  .pad_yy_icg_scan_en   (pad_yy_icg_scan_en  ),
  .reqq_create_en_x     (reqq_create_en[2]   ),
  .reqq_ctc_x           (reqq_ctc[2]         ),
  .reqq_ebiu_aim_x      (reqq_ebiu_aim[2]    ),
  .reqq_ebiu_vld_x      (reqq_ebiu_vld[2]    ),
  .reqq_entryx_addr     (reqq_entry2_addr    ),
  .reqq_entryx_l2ctype  (reqq_entry2_l2ctype ),
  .reqq_entryx_mid      (reqq_entry2_mid     ),
  .reqq_entryx_respq_id (reqq_entry2_respq_id),
  .reqq_entryx_rid      (reqq_entry2_rid     ),
  .reqq_l2c_aim_x       (reqq_l2c_aim[2]     ),
  .reqq_l2c_vld_x       (reqq_l2c_vld[2]     ),
  .reqq_piu0_aim_x      (reqq_piu0_aim[2]    ),
  .reqq_piu0_vld_x      (reqq_piu0_vld[2]    ),
  .reqq_piu1_aim_x      (reqq_piu1_aim[2]    ),
  .reqq_piu1_vld_x      (reqq_piu1_vld[2]    ),
  .reqq_piu2_aim_x      (reqq_piu2_aim[2]    ),
  .reqq_piu2_vld_x      (reqq_piu2_vld[2]    ),
  .reqq_piu3_aim_x      (reqq_piu3_aim[2]    ),
  .reqq_piu3_vld_x      (reqq_piu3_vld[2]    ),
  .reqq_pop0_en_x       (reqq_pop0_en[2]     ),
  .reqq_pop1_en_x       (reqq_pop1_en[2]     ),
  .reqq_pop2_en_x       (reqq_pop2_en[2]     ),
  .reqq_pop3_en_x       (reqq_pop3_en[2]     ),
  .reqq_pop_ebiu_en_x   (reqq_pop_ebiu_en[2] ),
  .reqq_popl2c_en_x     (reqq_popl2c_en[2]   ),
  .reqq_resp_done_x     (reqq_resp_done[2]   ),
  .reqq_resp_vld_x      (reqq_resp_vld[2]    ),
  .reqq_vld_x           (reqq_vld[2]         )
);


// &ConnRule(s/entryx/entry3/); @1041
// &ConnRule(s/_x$/[3]/); @1042
// &Instance("ct_ciu_ctcq_reqq_entry","x_ct_ciu_ctcq_reqq_entry_3"); @1043
ct_ciu_ctcq_reqq_entry  x_ct_ciu_ctcq_reqq_entry_3 (
  .ciu_icg_en           (ciu_icg_en          ),
  .cpurst_b             (cpurst_b            ),
  .ctc_dvm_addr         (ctc_dvm_addr        ),
  .ctc_dvm_aim          (ctc_dvm_aim         ),
  .ctc_dvm_id           (ctc_dvm_id          ),
  .ctc_dvm_mid          (ctc_dvm_mid         ),
  .ctc_dvm_respq_id     (ctc_dvm_respq_id    ),
  .forever_cpuclk       (forever_cpuclk      ),
  .pad_yy_icg_scan_en   (pad_yy_icg_scan_en  ),
  .reqq_create_en_x     (reqq_create_en[3]   ),
  .reqq_ctc_x           (reqq_ctc[3]         ),
  .reqq_ebiu_aim_x      (reqq_ebiu_aim[3]    ),
  .reqq_ebiu_vld_x      (reqq_ebiu_vld[3]    ),
  .reqq_entryx_addr     (reqq_entry3_addr    ),
  .reqq_entryx_l2ctype  (reqq_entry3_l2ctype ),
  .reqq_entryx_mid      (reqq_entry3_mid     ),
  .reqq_entryx_respq_id (reqq_entry3_respq_id),
  .reqq_entryx_rid      (reqq_entry3_rid     ),
  .reqq_l2c_aim_x       (reqq_l2c_aim[3]     ),
  .reqq_l2c_vld_x       (reqq_l2c_vld[3]     ),
  .reqq_piu0_aim_x      (reqq_piu0_aim[3]    ),
  .reqq_piu0_vld_x      (reqq_piu0_vld[3]    ),
  .reqq_piu1_aim_x      (reqq_piu1_aim[3]    ),
  .reqq_piu1_vld_x      (reqq_piu1_vld[3]    ),
  .reqq_piu2_aim_x      (reqq_piu2_aim[3]    ),
  .reqq_piu2_vld_x      (reqq_piu2_vld[3]    ),
  .reqq_piu3_aim_x      (reqq_piu3_aim[3]    ),
  .reqq_piu3_vld_x      (reqq_piu3_vld[3]    ),
  .reqq_pop0_en_x       (reqq_pop0_en[3]     ),
  .reqq_pop1_en_x       (reqq_pop1_en[3]     ),
  .reqq_pop2_en_x       (reqq_pop2_en[3]     ),
  .reqq_pop3_en_x       (reqq_pop3_en[3]     ),
  .reqq_pop_ebiu_en_x   (reqq_pop_ebiu_en[3] ),
  .reqq_popl2c_en_x     (reqq_popl2c_en[3]   ),
  .reqq_resp_done_x     (reqq_resp_done[3]   ),
  .reqq_resp_vld_x      (reqq_resp_vld[3]    ),
  .reqq_vld_x           (reqq_vld[3]         )
);


// &ConnRule(s/entryx/entry4/); @1045
// &ConnRule(s/_x$/[4]/); @1046
// &Instance("ct_ciu_ctcq_reqq_entry","x_ct_ciu_ctcq_reqq_entry_4"); @1047
ct_ciu_ctcq_reqq_entry  x_ct_ciu_ctcq_reqq_entry_4 (
  .ciu_icg_en           (ciu_icg_en          ),
  .cpurst_b             (cpurst_b            ),
  .ctc_dvm_addr         (ctc_dvm_addr        ),
  .ctc_dvm_aim          (ctc_dvm_aim         ),
  .ctc_dvm_id           (ctc_dvm_id          ),
  .ctc_dvm_mid          (ctc_dvm_mid         ),
  .ctc_dvm_respq_id     (ctc_dvm_respq_id    ),
  .forever_cpuclk       (forever_cpuclk      ),
  .pad_yy_icg_scan_en   (pad_yy_icg_scan_en  ),
  .reqq_create_en_x     (reqq_create_en[4]   ),
  .reqq_ctc_x           (reqq_ctc[4]         ),
  .reqq_ebiu_aim_x      (reqq_ebiu_aim[4]    ),
  .reqq_ebiu_vld_x      (reqq_ebiu_vld[4]    ),
  .reqq_entryx_addr     (reqq_entry4_addr    ),
  .reqq_entryx_l2ctype  (reqq_entry4_l2ctype ),
  .reqq_entryx_mid      (reqq_entry4_mid     ),
  .reqq_entryx_respq_id (reqq_entry4_respq_id),
  .reqq_entryx_rid      (reqq_entry4_rid     ),
  .reqq_l2c_aim_x       (reqq_l2c_aim[4]     ),
  .reqq_l2c_vld_x       (reqq_l2c_vld[4]     ),
  .reqq_piu0_aim_x      (reqq_piu0_aim[4]    ),
  .reqq_piu0_vld_x      (reqq_piu0_vld[4]    ),
  .reqq_piu1_aim_x      (reqq_piu1_aim[4]    ),
  .reqq_piu1_vld_x      (reqq_piu1_vld[4]    ),
  .reqq_piu2_aim_x      (reqq_piu2_aim[4]    ),
  .reqq_piu2_vld_x      (reqq_piu2_vld[4]    ),
  .reqq_piu3_aim_x      (reqq_piu3_aim[4]    ),
  .reqq_piu3_vld_x      (reqq_piu3_vld[4]    ),
  .reqq_pop0_en_x       (reqq_pop0_en[4]     ),
  .reqq_pop1_en_x       (reqq_pop1_en[4]     ),
  .reqq_pop2_en_x       (reqq_pop2_en[4]     ),
  .reqq_pop3_en_x       (reqq_pop3_en[4]     ),
  .reqq_pop_ebiu_en_x   (reqq_pop_ebiu_en[4] ),
  .reqq_popl2c_en_x     (reqq_popl2c_en[4]   ),
  .reqq_resp_done_x     (reqq_resp_done[4]   ),
  .reqq_resp_vld_x      (reqq_resp_vld[4]    ),
  .reqq_vld_x           (reqq_vld[4]         )
);


// &ConnRule(s/entryx/entry5/); @1049
// &ConnRule(s/_x$/[5]/); @1050
// &Instance("ct_ciu_ctcq_reqq_entry","x_ct_ciu_ctcq_reqq_entry_5"); @1051
ct_ciu_ctcq_reqq_entry  x_ct_ciu_ctcq_reqq_entry_5 (
  .ciu_icg_en           (ciu_icg_en          ),
  .cpurst_b             (cpurst_b            ),
  .ctc_dvm_addr         (ctc_dvm_addr        ),
  .ctc_dvm_aim          (ctc_dvm_aim         ),
  .ctc_dvm_id           (ctc_dvm_id          ),
  .ctc_dvm_mid          (ctc_dvm_mid         ),
  .ctc_dvm_respq_id     (ctc_dvm_respq_id    ),
  .forever_cpuclk       (forever_cpuclk      ),
  .pad_yy_icg_scan_en   (pad_yy_icg_scan_en  ),
  .reqq_create_en_x     (reqq_create_en[5]   ),
  .reqq_ctc_x           (reqq_ctc[5]         ),
  .reqq_ebiu_aim_x      (reqq_ebiu_aim[5]    ),
  .reqq_ebiu_vld_x      (reqq_ebiu_vld[5]    ),
  .reqq_entryx_addr     (reqq_entry5_addr    ),
  .reqq_entryx_l2ctype  (reqq_entry5_l2ctype ),
  .reqq_entryx_mid      (reqq_entry5_mid     ),
  .reqq_entryx_respq_id (reqq_entry5_respq_id),
  .reqq_entryx_rid      (reqq_entry5_rid     ),
  .reqq_l2c_aim_x       (reqq_l2c_aim[5]     ),
  .reqq_l2c_vld_x       (reqq_l2c_vld[5]     ),
  .reqq_piu0_aim_x      (reqq_piu0_aim[5]    ),
  .reqq_piu0_vld_x      (reqq_piu0_vld[5]    ),
  .reqq_piu1_aim_x      (reqq_piu1_aim[5]    ),
  .reqq_piu1_vld_x      (reqq_piu1_vld[5]    ),
  .reqq_piu2_aim_x      (reqq_piu2_aim[5]    ),
  .reqq_piu2_vld_x      (reqq_piu2_vld[5]    ),
  .reqq_piu3_aim_x      (reqq_piu3_aim[5]    ),
  .reqq_piu3_vld_x      (reqq_piu3_vld[5]    ),
  .reqq_pop0_en_x       (reqq_pop0_en[5]     ),
  .reqq_pop1_en_x       (reqq_pop1_en[5]     ),
  .reqq_pop2_en_x       (reqq_pop2_en[5]     ),
  .reqq_pop3_en_x       (reqq_pop3_en[5]     ),
  .reqq_pop_ebiu_en_x   (reqq_pop_ebiu_en[5] ),
  .reqq_popl2c_en_x     (reqq_popl2c_en[5]   ),
  .reqq_resp_done_x     (reqq_resp_done[5]   ),
  .reqq_resp_vld_x      (reqq_resp_vld[5]    ),
  .reqq_vld_x           (reqq_vld[5]         )
);


// &ConnRule(s/entryx/entry6/); @1053
// &ConnRule(s/_x$/[6]/); @1054
// &Instance("ct_ciu_ctcq_reqq_entry","x_ct_ciu_ctcq_reqq_entry_6"); @1055
ct_ciu_ctcq_reqq_entry  x_ct_ciu_ctcq_reqq_entry_6 (
  .ciu_icg_en           (ciu_icg_en          ),
  .cpurst_b             (cpurst_b            ),
  .ctc_dvm_addr         (ctc_dvm_addr        ),
  .ctc_dvm_aim          (ctc_dvm_aim         ),
  .ctc_dvm_id           (ctc_dvm_id          ),
  .ctc_dvm_mid          (ctc_dvm_mid         ),
  .ctc_dvm_respq_id     (ctc_dvm_respq_id    ),
  .forever_cpuclk       (forever_cpuclk      ),
  .pad_yy_icg_scan_en   (pad_yy_icg_scan_en  ),
  .reqq_create_en_x     (reqq_create_en[6]   ),
  .reqq_ctc_x           (reqq_ctc[6]         ),
  .reqq_ebiu_aim_x      (reqq_ebiu_aim[6]    ),
  .reqq_ebiu_vld_x      (reqq_ebiu_vld[6]    ),
  .reqq_entryx_addr     (reqq_entry6_addr    ),
  .reqq_entryx_l2ctype  (reqq_entry6_l2ctype ),
  .reqq_entryx_mid      (reqq_entry6_mid     ),
  .reqq_entryx_respq_id (reqq_entry6_respq_id),
  .reqq_entryx_rid      (reqq_entry6_rid     ),
  .reqq_l2c_aim_x       (reqq_l2c_aim[6]     ),
  .reqq_l2c_vld_x       (reqq_l2c_vld[6]     ),
  .reqq_piu0_aim_x      (reqq_piu0_aim[6]    ),
  .reqq_piu0_vld_x      (reqq_piu0_vld[6]    ),
  .reqq_piu1_aim_x      (reqq_piu1_aim[6]    ),
  .reqq_piu1_vld_x      (reqq_piu1_vld[6]    ),
  .reqq_piu2_aim_x      (reqq_piu2_aim[6]    ),
  .reqq_piu2_vld_x      (reqq_piu2_vld[6]    ),
  .reqq_piu3_aim_x      (reqq_piu3_aim[6]    ),
  .reqq_piu3_vld_x      (reqq_piu3_vld[6]    ),
  .reqq_pop0_en_x       (reqq_pop0_en[6]     ),
  .reqq_pop1_en_x       (reqq_pop1_en[6]     ),
  .reqq_pop2_en_x       (reqq_pop2_en[6]     ),
  .reqq_pop3_en_x       (reqq_pop3_en[6]     ),
  .reqq_pop_ebiu_en_x   (reqq_pop_ebiu_en[6] ),
  .reqq_popl2c_en_x     (reqq_popl2c_en[6]   ),
  .reqq_resp_done_x     (reqq_resp_done[6]   ),
  .reqq_resp_vld_x      (reqq_resp_vld[6]    ),
  .reqq_vld_x           (reqq_vld[6]         )
);


// &ConnRule(s/entryx/entry7/); @1057
// &ConnRule(s/_x$/[7]/); @1058
// &Instance("ct_ciu_ctcq_reqq_entry","x_ct_ciu_ctcq_reqq_entry_7"); @1059
ct_ciu_ctcq_reqq_entry  x_ct_ciu_ctcq_reqq_entry_7 (
  .ciu_icg_en           (ciu_icg_en          ),
  .cpurst_b             (cpurst_b            ),
  .ctc_dvm_addr         (ctc_dvm_addr        ),
  .ctc_dvm_aim          (ctc_dvm_aim         ),
  .ctc_dvm_id           (ctc_dvm_id          ),
  .ctc_dvm_mid          (ctc_dvm_mid         ),
  .ctc_dvm_respq_id     (ctc_dvm_respq_id    ),
  .forever_cpuclk       (forever_cpuclk      ),
  .pad_yy_icg_scan_en   (pad_yy_icg_scan_en  ),
  .reqq_create_en_x     (reqq_create_en[7]   ),
  .reqq_ctc_x           (reqq_ctc[7]         ),
  .reqq_ebiu_aim_x      (reqq_ebiu_aim[7]    ),
  .reqq_ebiu_vld_x      (reqq_ebiu_vld[7]    ),
  .reqq_entryx_addr     (reqq_entry7_addr    ),
  .reqq_entryx_l2ctype  (reqq_entry7_l2ctype ),
  .reqq_entryx_mid      (reqq_entry7_mid     ),
  .reqq_entryx_respq_id (reqq_entry7_respq_id),
  .reqq_entryx_rid      (reqq_entry7_rid     ),
  .reqq_l2c_aim_x       (reqq_l2c_aim[7]     ),
  .reqq_l2c_vld_x       (reqq_l2c_vld[7]     ),
  .reqq_piu0_aim_x      (reqq_piu0_aim[7]    ),
  .reqq_piu0_vld_x      (reqq_piu0_vld[7]    ),
  .reqq_piu1_aim_x      (reqq_piu1_aim[7]    ),
  .reqq_piu1_vld_x      (reqq_piu1_vld[7]    ),
  .reqq_piu2_aim_x      (reqq_piu2_aim[7]    ),
  .reqq_piu2_vld_x      (reqq_piu2_vld[7]    ),
  .reqq_piu3_aim_x      (reqq_piu3_aim[7]    ),
  .reqq_piu3_vld_x      (reqq_piu3_vld[7]    ),
  .reqq_pop0_en_x       (reqq_pop0_en[7]     ),
  .reqq_pop1_en_x       (reqq_pop1_en[7]     ),
  .reqq_pop2_en_x       (reqq_pop2_en[7]     ),
  .reqq_pop3_en_x       (reqq_pop3_en[7]     ),
  .reqq_pop_ebiu_en_x   (reqq_pop_ebiu_en[7] ),
  .reqq_popl2c_en_x     (reqq_popl2c_en[7]   ),
  .reqq_resp_done_x     (reqq_resp_done[7]   ),
  .reqq_resp_vld_x      (reqq_resp_vld[7]    ),
  .reqq_vld_x           (reqq_vld[7]         )
);


//--------------------------------------
//respq entry
// &ConnRule(s/entryx/entry0/); @1063
// &ConnRule(s/_x$/[0]/); @1064
// &Instance("ct_ciu_ctcq_respq_entry","x_ct_ciu_ctcq_respq_entry_0"); @1065
ct_ciu_ctcq_respq_entry  x_ct_ciu_ctcq_respq_entry_0 (
  .ciu_icg_en                   (ciu_icg_en                  ),
  .cpurst_b                     (cpurst_b                    ),
  .forever_cpuclk               (forever_cpuclk              ),
  .pad_yy_icg_scan_en           (pad_yy_icg_scan_en          ),
  .respq_create_cmplt_init      (respq_create_cmplt_init     ),
  .respq_create_dvm             (respq_create_dvm            ),
  .respq_create_en_x            (respq_create_en[0]          ),
  .respq_dvm_x                  (respq_dvm[0]                ),
  .respq_ebiu_resp_create_en_x  (respq_ebiu_resp_create_en[0]),
  .respq_l2c_resp_create_en_x   (respq_l2c_resp_create_en[0] ),
  .respq_piu0_resp_create_en_x  (respq_piu0_resp_create_en[0]),
  .respq_piu1_resp_create_en_x  (respq_piu1_resp_create_en[0]),
  .respq_piu2_resp_create_en_x  (respq_piu2_resp_create_en[0]),
  .respq_piu3_resp_create_en_x  (respq_piu3_resp_create_en[0]),
  .respq_vld_x                  (respq_vld[0]                )
);


// &ConnRule(s/_x$/[1]/); @1067
// &ConnRule(s/entryx/entry1/); @1068
// &Instance("ct_ciu_ctcq_respq_entry","x_ct_ciu_ctcq_respq_entry_1"); @1069
ct_ciu_ctcq_respq_entry  x_ct_ciu_ctcq_respq_entry_1 (
  .ciu_icg_en                   (ciu_icg_en                  ),
  .cpurst_b                     (cpurst_b                    ),
  .forever_cpuclk               (forever_cpuclk              ),
  .pad_yy_icg_scan_en           (pad_yy_icg_scan_en          ),
  .respq_create_cmplt_init      (respq_create_cmplt_init     ),
  .respq_create_dvm             (respq_create_dvm            ),
  .respq_create_en_x            (respq_create_en[1]          ),
  .respq_dvm_x                  (respq_dvm[1]                ),
  .respq_ebiu_resp_create_en_x  (respq_ebiu_resp_create_en[1]),
  .respq_l2c_resp_create_en_x   (respq_l2c_resp_create_en[1] ),
  .respq_piu0_resp_create_en_x  (respq_piu0_resp_create_en[1]),
  .respq_piu1_resp_create_en_x  (respq_piu1_resp_create_en[1]),
  .respq_piu2_resp_create_en_x  (respq_piu2_resp_create_en[1]),
  .respq_piu3_resp_create_en_x  (respq_piu3_resp_create_en[1]),
  .respq_vld_x                  (respq_vld[1]                )
);


// &ConnRule(s/_x$/[2]/); @1071
// &ConnRule(s/entryx/entry2/); @1072
// &Instance("ct_ciu_ctcq_respq_entry","x_ct_ciu_ctcq_respq_entry_2"); @1073
ct_ciu_ctcq_respq_entry  x_ct_ciu_ctcq_respq_entry_2 (
  .ciu_icg_en                   (ciu_icg_en                  ),
  .cpurst_b                     (cpurst_b                    ),
  .forever_cpuclk               (forever_cpuclk              ),
  .pad_yy_icg_scan_en           (pad_yy_icg_scan_en          ),
  .respq_create_cmplt_init      (respq_create_cmplt_init     ),
  .respq_create_dvm             (respq_create_dvm            ),
  .respq_create_en_x            (respq_create_en[2]          ),
  .respq_dvm_x                  (respq_dvm[2]                ),
  .respq_ebiu_resp_create_en_x  (respq_ebiu_resp_create_en[2]),
  .respq_l2c_resp_create_en_x   (respq_l2c_resp_create_en[2] ),
  .respq_piu0_resp_create_en_x  (respq_piu0_resp_create_en[2]),
  .respq_piu1_resp_create_en_x  (respq_piu1_resp_create_en[2]),
  .respq_piu2_resp_create_en_x  (respq_piu2_resp_create_en[2]),
  .respq_piu3_resp_create_en_x  (respq_piu3_resp_create_en[2]),
  .respq_vld_x                  (respq_vld[2]                )
);


// &ConnRule(s/_x$/[3]/); @1075
// &ConnRule(s/entryx/entry3/); @1076
// &Instance("ct_ciu_ctcq_respq_entry","x_ct_ciu_ctcq_respq_entry_3"); @1077
ct_ciu_ctcq_respq_entry  x_ct_ciu_ctcq_respq_entry_3 (
  .ciu_icg_en                   (ciu_icg_en                  ),
  .cpurst_b                     (cpurst_b                    ),
  .forever_cpuclk               (forever_cpuclk              ),
  .pad_yy_icg_scan_en           (pad_yy_icg_scan_en          ),
  .respq_create_cmplt_init      (respq_create_cmplt_init     ),
  .respq_create_dvm             (respq_create_dvm            ),
  .respq_create_en_x            (respq_create_en[3]          ),
  .respq_dvm_x                  (respq_dvm[3]                ),
  .respq_ebiu_resp_create_en_x  (respq_ebiu_resp_create_en[3]),
  .respq_l2c_resp_create_en_x   (respq_l2c_resp_create_en[3] ),
  .respq_piu0_resp_create_en_x  (respq_piu0_resp_create_en[3]),
  .respq_piu1_resp_create_en_x  (respq_piu1_resp_create_en[3]),
  .respq_piu2_resp_create_en_x  (respq_piu2_resp_create_en[3]),
  .respq_piu3_resp_create_en_x  (respq_piu3_resp_create_en[3]),
  .respq_vld_x                  (respq_vld[3]                )
);


// &ConnRule(s/_x$/[4]/); @1079
// &ConnRule(s/entryx/entry4/); @1080
// &Instance("ct_ciu_ctcq_respq_entry","x_ct_ciu_ctcq_respq_entry_4"); @1081
ct_ciu_ctcq_respq_entry  x_ct_ciu_ctcq_respq_entry_4 (
  .ciu_icg_en                   (ciu_icg_en                  ),
  .cpurst_b                     (cpurst_b                    ),
  .forever_cpuclk               (forever_cpuclk              ),
  .pad_yy_icg_scan_en           (pad_yy_icg_scan_en          ),
  .respq_create_cmplt_init      (respq_create_cmplt_init     ),
  .respq_create_dvm             (respq_create_dvm            ),
  .respq_create_en_x            (respq_create_en[4]          ),
  .respq_dvm_x                  (respq_dvm[4]                ),
  .respq_ebiu_resp_create_en_x  (respq_ebiu_resp_create_en[4]),
  .respq_l2c_resp_create_en_x   (respq_l2c_resp_create_en[4] ),
  .respq_piu0_resp_create_en_x  (respq_piu0_resp_create_en[4]),
  .respq_piu1_resp_create_en_x  (respq_piu1_resp_create_en[4]),
  .respq_piu2_resp_create_en_x  (respq_piu2_resp_create_en[4]),
  .respq_piu3_resp_create_en_x  (respq_piu3_resp_create_en[4]),
  .respq_vld_x                  (respq_vld[4]                )
);


// &ConnRule(s/_x$/[5]/); @1083
// &ConnRule(s/entryx/entry5/); @1084
// &Instance("ct_ciu_ctcq_respq_entry","x_ct_ciu_ctcq_respq_entry_5"); @1085
ct_ciu_ctcq_respq_entry  x_ct_ciu_ctcq_respq_entry_5 (
  .ciu_icg_en                   (ciu_icg_en                  ),
  .cpurst_b                     (cpurst_b                    ),
  .forever_cpuclk               (forever_cpuclk              ),
  .pad_yy_icg_scan_en           (pad_yy_icg_scan_en          ),
  .respq_create_cmplt_init      (respq_create_cmplt_init     ),
  .respq_create_dvm             (respq_create_dvm            ),
  .respq_create_en_x            (respq_create_en[5]          ),
  .respq_dvm_x                  (respq_dvm[5]                ),
  .respq_ebiu_resp_create_en_x  (respq_ebiu_resp_create_en[5]),
  .respq_l2c_resp_create_en_x   (respq_l2c_resp_create_en[5] ),
  .respq_piu0_resp_create_en_x  (respq_piu0_resp_create_en[5]),
  .respq_piu1_resp_create_en_x  (respq_piu1_resp_create_en[5]),
  .respq_piu2_resp_create_en_x  (respq_piu2_resp_create_en[5]),
  .respq_piu3_resp_create_en_x  (respq_piu3_resp_create_en[5]),
  .respq_vld_x                  (respq_vld[5]                )
);


// &ConnRule(s/_x$/[6]/); @1087
// &ConnRule(s/entryx/entry6/); @1088
// &Instance("ct_ciu_ctcq_respq_entry","x_ct_ciu_ctcq_respq_entry_6"); @1089
ct_ciu_ctcq_respq_entry  x_ct_ciu_ctcq_respq_entry_6 (
  .ciu_icg_en                   (ciu_icg_en                  ),
  .cpurst_b                     (cpurst_b                    ),
  .forever_cpuclk               (forever_cpuclk              ),
  .pad_yy_icg_scan_en           (pad_yy_icg_scan_en          ),
  .respq_create_cmplt_init      (respq_create_cmplt_init     ),
  .respq_create_dvm             (respq_create_dvm            ),
  .respq_create_en_x            (respq_create_en[6]          ),
  .respq_dvm_x                  (respq_dvm[6]                ),
  .respq_ebiu_resp_create_en_x  (respq_ebiu_resp_create_en[6]),
  .respq_l2c_resp_create_en_x   (respq_l2c_resp_create_en[6] ),
  .respq_piu0_resp_create_en_x  (respq_piu0_resp_create_en[6]),
  .respq_piu1_resp_create_en_x  (respq_piu1_resp_create_en[6]),
  .respq_piu2_resp_create_en_x  (respq_piu2_resp_create_en[6]),
  .respq_piu3_resp_create_en_x  (respq_piu3_resp_create_en[6]),
  .respq_vld_x                  (respq_vld[6]                )
);


// &ConnRule(s/_x$/[7]/); @1091
// &ConnRule(s/entryx/entry7/); @1092
// &Instance("ct_ciu_ctcq_respq_entry","x_ct_ciu_ctcq_respq_entry_7"); @1093
ct_ciu_ctcq_respq_entry  x_ct_ciu_ctcq_respq_entry_7 (
  .ciu_icg_en                   (ciu_icg_en                  ),
  .cpurst_b                     (cpurst_b                    ),
  .forever_cpuclk               (forever_cpuclk              ),
  .pad_yy_icg_scan_en           (pad_yy_icg_scan_en          ),
  .respq_create_cmplt_init      (respq_create_cmplt_init     ),
  .respq_create_dvm             (respq_create_dvm            ),
  .respq_create_en_x            (respq_create_en[7]          ),
  .respq_dvm_x                  (respq_dvm[7]                ),
  .respq_ebiu_resp_create_en_x  (respq_ebiu_resp_create_en[7]),
  .respq_l2c_resp_create_en_x   (respq_l2c_resp_create_en[7] ),
  .respq_piu0_resp_create_en_x  (respq_piu0_resp_create_en[7]),
  .respq_piu1_resp_create_en_x  (respq_piu1_resp_create_en[7]),
  .respq_piu2_resp_create_en_x  (respq_piu2_resp_create_en[7]),
  .respq_piu3_resp_create_en_x  (respq_piu3_resp_create_en[7]),
  .respq_vld_x                  (respq_vld[7]                )
);


// &ConnRule(s/_x$/[8]/); @1095
// &ConnRule(s/entryx/entry8/); @1096
// &Instance("ct_ciu_ctcq_respq_entry","x_ct_ciu_ctcq_respq_entry_8"); @1097
ct_ciu_ctcq_respq_entry  x_ct_ciu_ctcq_respq_entry_8 (
  .ciu_icg_en                   (ciu_icg_en                  ),
  .cpurst_b                     (cpurst_b                    ),
  .forever_cpuclk               (forever_cpuclk              ),
  .pad_yy_icg_scan_en           (pad_yy_icg_scan_en          ),
  .respq_create_cmplt_init      (respq_create_cmplt_init     ),
  .respq_create_dvm             (respq_create_dvm            ),
  .respq_create_en_x            (respq_create_en[8]          ),
  .respq_dvm_x                  (respq_dvm[8]                ),
  .respq_ebiu_resp_create_en_x  (respq_ebiu_resp_create_en[8]),
  .respq_l2c_resp_create_en_x   (respq_l2c_resp_create_en[8] ),
  .respq_piu0_resp_create_en_x  (respq_piu0_resp_create_en[8]),
  .respq_piu1_resp_create_en_x  (respq_piu1_resp_create_en[8]),
  .respq_piu2_resp_create_en_x  (respq_piu2_resp_create_en[8]),
  .respq_piu3_resp_create_en_x  (respq_piu3_resp_create_en[8]),
  .respq_vld_x                  (respq_vld[8]                )
);


// &ConnRule(s/_x$/[9]/); @1099
// &ConnRule(s/entryx/entry9/); @1100
// &Instance("ct_ciu_ctcq_respq_entry","x_ct_ciu_ctcq_respq_entry_9"); @1101
ct_ciu_ctcq_respq_entry  x_ct_ciu_ctcq_respq_entry_9 (
  .ciu_icg_en                   (ciu_icg_en                  ),
  .cpurst_b                     (cpurst_b                    ),
  .forever_cpuclk               (forever_cpuclk              ),
  .pad_yy_icg_scan_en           (pad_yy_icg_scan_en          ),
  .respq_create_cmplt_init      (respq_create_cmplt_init     ),
  .respq_create_dvm             (respq_create_dvm            ),
  .respq_create_en_x            (respq_create_en[9]          ),
  .respq_dvm_x                  (respq_dvm[9]                ),
  .respq_ebiu_resp_create_en_x  (respq_ebiu_resp_create_en[9]),
  .respq_l2c_resp_create_en_x   (respq_l2c_resp_create_en[9] ),
  .respq_piu0_resp_create_en_x  (respq_piu0_resp_create_en[9]),
  .respq_piu1_resp_create_en_x  (respq_piu1_resp_create_en[9]),
  .respq_piu2_resp_create_en_x  (respq_piu2_resp_create_en[9]),
  .respq_piu3_resp_create_en_x  (respq_piu3_resp_create_en[9]),
  .respq_vld_x                  (respq_vld[9]                )
);


// &ConnRule(s/_x$/[10]/); @1103
// &ConnRule(s/entryx/entry10/); @1104
// &Instance("ct_ciu_ctcq_respq_entry","x_ct_ciu_ctcq_respq_entry_10"); @1105
ct_ciu_ctcq_respq_entry  x_ct_ciu_ctcq_respq_entry_10 (
  .ciu_icg_en                    (ciu_icg_en                   ),
  .cpurst_b                      (cpurst_b                     ),
  .forever_cpuclk                (forever_cpuclk               ),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .respq_create_cmplt_init       (respq_create_cmplt_init      ),
  .respq_create_dvm              (respq_create_dvm             ),
  .respq_create_en_x             (respq_create_en[10]          ),
  .respq_dvm_x                   (respq_dvm[10]                ),
  .respq_ebiu_resp_create_en_x   (respq_ebiu_resp_create_en[10]),
  .respq_l2c_resp_create_en_x    (respq_l2c_resp_create_en[10] ),
  .respq_piu0_resp_create_en_x   (respq_piu0_resp_create_en[10]),
  .respq_piu1_resp_create_en_x   (respq_piu1_resp_create_en[10]),
  .respq_piu2_resp_create_en_x   (respq_piu2_resp_create_en[10]),
  .respq_piu3_resp_create_en_x   (respq_piu3_resp_create_en[10]),
  .respq_vld_x                   (respq_vld[10]                )
);


// &ConnRule(s/_x$/[11]/); @1107
// &ConnRule(s/entryx/entry11/); @1108
// &Instance("ct_ciu_ctcq_respq_entry","x_ct_ciu_ctcq_respq_entry_11"); @1109
ct_ciu_ctcq_respq_entry  x_ct_ciu_ctcq_respq_entry_11 (
  .ciu_icg_en                    (ciu_icg_en                   ),
  .cpurst_b                      (cpurst_b                     ),
  .forever_cpuclk                (forever_cpuclk               ),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .respq_create_cmplt_init       (respq_create_cmplt_init      ),
  .respq_create_dvm              (respq_create_dvm             ),
  .respq_create_en_x             (respq_create_en[11]          ),
  .respq_dvm_x                   (respq_dvm[11]                ),
  .respq_ebiu_resp_create_en_x   (respq_ebiu_resp_create_en[11]),
  .respq_l2c_resp_create_en_x    (respq_l2c_resp_create_en[11] ),
  .respq_piu0_resp_create_en_x   (respq_piu0_resp_create_en[11]),
  .respq_piu1_resp_create_en_x   (respq_piu1_resp_create_en[11]),
  .respq_piu2_resp_create_en_x   (respq_piu2_resp_create_en[11]),
  .respq_piu3_resp_create_en_x   (respq_piu3_resp_create_en[11]),
  .respq_vld_x                   (respq_vld[11]                )
);


// &ConnRule(s/_x$/[12]/); @1111
// &ConnRule(s/entryx/entry12/); @1112
// &Instance("ct_ciu_ctcq_respq_entry","x_ct_ciu_ctcq_respq_entry_12"); @1113
ct_ciu_ctcq_respq_entry  x_ct_ciu_ctcq_respq_entry_12 (
  .ciu_icg_en                    (ciu_icg_en                   ),
  .cpurst_b                      (cpurst_b                     ),
  .forever_cpuclk                (forever_cpuclk               ),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .respq_create_cmplt_init       (respq_create_cmplt_init      ),
  .respq_create_dvm              (respq_create_dvm             ),
  .respq_create_en_x             (respq_create_en[12]          ),
  .respq_dvm_x                   (respq_dvm[12]                ),
  .respq_ebiu_resp_create_en_x   (respq_ebiu_resp_create_en[12]),
  .respq_l2c_resp_create_en_x    (respq_l2c_resp_create_en[12] ),
  .respq_piu0_resp_create_en_x   (respq_piu0_resp_create_en[12]),
  .respq_piu1_resp_create_en_x   (respq_piu1_resp_create_en[12]),
  .respq_piu2_resp_create_en_x   (respq_piu2_resp_create_en[12]),
  .respq_piu3_resp_create_en_x   (respq_piu3_resp_create_en[12]),
  .respq_vld_x                   (respq_vld[12]                )
);


// &ConnRule(s/_x$/[13]/); @1115
// &ConnRule(s/entryx/entry13/); @1116
// &Instance("ct_ciu_ctcq_respq_entry","x_ct_ciu_ctcq_respq_entry_13"); @1117
ct_ciu_ctcq_respq_entry  x_ct_ciu_ctcq_respq_entry_13 (
  .ciu_icg_en                    (ciu_icg_en                   ),
  .cpurst_b                      (cpurst_b                     ),
  .forever_cpuclk                (forever_cpuclk               ),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .respq_create_cmplt_init       (respq_create_cmplt_init      ),
  .respq_create_dvm              (respq_create_dvm             ),
  .respq_create_en_x             (respq_create_en[13]          ),
  .respq_dvm_x                   (respq_dvm[13]                ),
  .respq_ebiu_resp_create_en_x   (respq_ebiu_resp_create_en[13]),
  .respq_l2c_resp_create_en_x    (respq_l2c_resp_create_en[13] ),
  .respq_piu0_resp_create_en_x   (respq_piu0_resp_create_en[13]),
  .respq_piu1_resp_create_en_x   (respq_piu1_resp_create_en[13]),
  .respq_piu2_resp_create_en_x   (respq_piu2_resp_create_en[13]),
  .respq_piu3_resp_create_en_x   (respq_piu3_resp_create_en[13]),
  .respq_vld_x                   (respq_vld[13]                )
);


// &ConnRule(s/_x$/[14]/); @1119
// &ConnRule(s/entryx/entry14/); @1120
// &Instance("ct_ciu_ctcq_respq_entry","x_ct_ciu_ctcq_respq_entry_14"); @1121
ct_ciu_ctcq_respq_entry  x_ct_ciu_ctcq_respq_entry_14 (
  .ciu_icg_en                    (ciu_icg_en                   ),
  .cpurst_b                      (cpurst_b                     ),
  .forever_cpuclk                (forever_cpuclk               ),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .respq_create_cmplt_init       (respq_create_cmplt_init      ),
  .respq_create_dvm              (respq_create_dvm             ),
  .respq_create_en_x             (respq_create_en[14]          ),
  .respq_dvm_x                   (respq_dvm[14]                ),
  .respq_ebiu_resp_create_en_x   (respq_ebiu_resp_create_en[14]),
  .respq_l2c_resp_create_en_x    (respq_l2c_resp_create_en[14] ),
  .respq_piu0_resp_create_en_x   (respq_piu0_resp_create_en[14]),
  .respq_piu1_resp_create_en_x   (respq_piu1_resp_create_en[14]),
  .respq_piu2_resp_create_en_x   (respq_piu2_resp_create_en[14]),
  .respq_piu3_resp_create_en_x   (respq_piu3_resp_create_en[14]),
  .respq_vld_x                   (respq_vld[14]                )
);


// &ConnRule(s/_x$/[15]/); @1123
// &ConnRule(s/entryx/entry15/); @1124
// &Instance("ct_ciu_ctcq_respq_entry","x_ct_ciu_ctcq_respq_entry_15"); @1125
ct_ciu_ctcq_respq_entry  x_ct_ciu_ctcq_respq_entry_15 (
  .ciu_icg_en                    (ciu_icg_en                   ),
  .cpurst_b                      (cpurst_b                     ),
  .forever_cpuclk                (forever_cpuclk               ),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .respq_create_cmplt_init       (respq_create_cmplt_init      ),
  .respq_create_dvm              (respq_create_dvm             ),
  .respq_create_en_x             (respq_create_en[15]          ),
  .respq_dvm_x                   (respq_dvm[15]                ),
  .respq_ebiu_resp_create_en_x   (respq_ebiu_resp_create_en[15]),
  .respq_l2c_resp_create_en_x    (respq_l2c_resp_create_en[15] ),
  .respq_piu0_resp_create_en_x   (respq_piu0_resp_create_en[15]),
  .respq_piu1_resp_create_en_x   (respq_piu1_resp_create_en[15]),
  .respq_piu2_resp_create_en_x   (respq_piu2_resp_create_en[15]),
  .respq_piu3_resp_create_en_x   (respq_piu3_resp_create_en[15]),
  .respq_vld_x                   (respq_vld[15]                )
);


//==========================================================
//      Debug information
//==========================================================

assign ctcq_dbg_info[55:0] = {reqq_create_ptr[7:0],reqq_pop1_ptr[7:0],reqq_pop0_ptr[7:0],
                              reqq_pop_ebiu_ptr[7:0],reqq_vld[7:0],respq_vld[15:0]};

// &CombBeg; @1144
// &CombEnd; @1151

// &Force("nonport","req_first_vld"); @1202
// &Force("nonport","req_mid"); @1203
// &ModuleEnd; @1227
endmodule







