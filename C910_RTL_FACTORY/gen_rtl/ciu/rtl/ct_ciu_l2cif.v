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
module ct_ciu_l2cif(
  ciu_icg_en,
  ciu_l2c_addr_bank_0,
  ciu_l2c_addr_bank_1,
  ciu_l2c_addr_vld_bank_0,
  ciu_l2c_addr_vld_bank_1,
  ciu_l2c_clr_cp_bank_0,
  ciu_l2c_clr_cp_bank_1,
  ciu_l2c_ctcq_req_bank_0,
  ciu_l2c_ctcq_req_bank_1,
  ciu_l2c_data_vld_bank_0,
  ciu_l2c_data_vld_bank_1,
  ciu_l2c_dca_addr_bank_0,
  ciu_l2c_dca_addr_bank_1,
  ciu_l2c_dca_req_bank_0,
  ciu_l2c_dca_req_bank_1,
  ciu_l2c_hpcp_bus_bank_0,
  ciu_l2c_hpcp_bus_bank_1,
  ciu_l2c_icc_mid_bank_0,
  ciu_l2c_icc_mid_bank_1,
  ciu_l2c_icc_type_bank_0,
  ciu_l2c_icc_type_bank_1,
  ciu_l2c_mid_bank_0,
  ciu_l2c_mid_bank_1,
  ciu_l2c_prf_ready,
  ciu_l2c_rdl_ready_bank_0,
  ciu_l2c_rdl_ready_bank_1,
  ciu_l2c_set_cp_bank_0,
  ciu_l2c_set_cp_bank_1,
  ciu_l2c_sid_bank_0,
  ciu_l2c_sid_bank_1,
  ciu_l2c_snpl2_ready_bank_0,
  ciu_l2c_snpl2_ready_bank_1,
  ciu_l2c_src_bank_0,
  ciu_l2c_src_bank_1,
  ciu_l2c_type_bank_0,
  ciu_l2c_type_bank_1,
  ciu_l2c_wdata_bank_0,
  ciu_l2c_wdata_bank_1,
  cpurst_b,
  ctcq_l2c_addr_req,
  ctcq_l2c_req_type,
  forever_cpuclk,
  l2c0_vb_awbus,
  l2c0_vb_awvalid,
  l2c0_vb_mid,
  l2c0_vb_vid,
  l2c0_vb_wbus,
  l2c0_vb_wvalid,
  l2c1_vb_awbus,
  l2c1_vb_awvalid,
  l2c1_vb_mid,
  l2c1_vb_vid,
  l2c1_vb_wbus,
  l2c1_vb_wvalid,
  l2c_ciu_addr_ready_bank_0,
  l2c_ciu_addr_ready_bank_1,
  l2c_ciu_cmplt_bank_0,
  l2c_ciu_cmplt_bank_1,
  l2c_ciu_cp_bank_0,
  l2c_ciu_cp_bank_1,
  l2c_ciu_ctcq_cmplt_bank_0,
  l2c_ciu_ctcq_cmplt_bank_1,
  l2c_ciu_ctcq_ready_bank_0,
  l2c_ciu_ctcq_ready_bank_1,
  l2c_ciu_data_bank_0,
  l2c_ciu_data_bank_1,
  l2c_ciu_data_ready_bank_0,
  l2c_ciu_data_ready_bank_1,
  l2c_ciu_data_ready_gate_bank_0,
  l2c_ciu_data_ready_gate_bank_1,
  l2c_ciu_dca_cmplt_bank_0,
  l2c_ciu_dca_cmplt_bank_1,
  l2c_ciu_dca_data_bank_0,
  l2c_ciu_dca_data_bank_1,
  l2c_ciu_dca_ready_bank_0,
  l2c_ciu_dca_ready_bank_1,
  l2c_ciu_hpcp_acc_inc_bank_0,
  l2c_ciu_hpcp_acc_inc_bank_1,
  l2c_ciu_hpcp_mid_bank_0,
  l2c_ciu_hpcp_mid_bank_1,
  l2c_ciu_hpcp_miss_inc_bank_0,
  l2c_ciu_hpcp_miss_inc_bank_1,
  l2c_ciu_prf_addr,
  l2c_ciu_prf_prot,
  l2c_ciu_prf_vld,
  l2c_ciu_rdl_addr_bank_0,
  l2c_ciu_rdl_addr_bank_1,
  l2c_ciu_rdl_dvld_bank_0,
  l2c_ciu_rdl_dvld_bank_1,
  l2c_ciu_rdl_mid_bank_0,
  l2c_ciu_rdl_mid_bank_1,
  l2c_ciu_rdl_prot_bank_0,
  l2c_ciu_rdl_prot_bank_1,
  l2c_ciu_rdl_rvld_bank_0,
  l2c_ciu_rdl_rvld_bank_1,
  l2c_ciu_resp_bank_0,
  l2c_ciu_resp_bank_1,
  l2c_ciu_sid_bank_0,
  l2c_ciu_sid_bank_1,
  l2c_ciu_snpl2_addr_bank_0,
  l2c_ciu_snpl2_addr_bank_1,
  l2c_ciu_snpl2_ini_sid_bank_0,
  l2c_ciu_snpl2_ini_sid_bank_1,
  l2c_ciu_snpl2_vld_bank_0,
  l2c_ciu_snpl2_vld_bank_1,
  l2c_ctcq_cmplt,
  l2c_snb0_addr_grant,
  l2c_snb0_cmplt,
  l2c_snb0_cmplt_sid,
  l2c_snb0_cp,
  l2c_snb0_data,
  l2c_snb0_data_grant,
  l2c_snb0_data_grant_gate,
  l2c_snb0_prf_bus,
  l2c_snb0_prf_req,
  l2c_snb0_resp,
  l2c_snb0_snpl2_bus,
  l2c_snb0_snpl2_ini_sid,
  l2c_snb0_snpl2_req,
  l2c_snb1_addr_grant,
  l2c_snb1_cmplt,
  l2c_snb1_cmplt_sid,
  l2c_snb1_cp,
  l2c_snb1_data,
  l2c_snb1_data_grant,
  l2c_snb1_data_grant_gate,
  l2c_snb1_prf_bus,
  l2c_snb1_prf_req,
  l2c_snb1_resp,
  l2c_snb1_snpl2_bus,
  l2c_snb1_snpl2_ini_sid,
  l2c_snb1_snpl2_req,
  l2cif0_regs_read_acc_inc,
  l2cif0_regs_read_miss_inc,
  l2cif0_regs_write_acc_inc,
  l2cif0_regs_write_miss_inc,
  l2cif1_regs_read_acc_inc,
  l2cif1_regs_read_miss_inc,
  l2cif1_regs_write_acc_inc,
  l2cif1_regs_write_miss_inc,
  l2cif_piu0_read_data_vld,
  l2cif_piu1_read_data_vld,
  l2cif_piu2_read_data_vld,
  l2cif_piu3_read_data_vld,
  l2cif_piux_read_data,
  pad_yy_icg_scan_en,
  piu0_l2cif_read_data,
  piu0_l2cif_read_data_ecc,
  piu0_l2cif_read_index,
  piu0_l2cif_read_req,
  piu0_l2cif_read_tag,
  piu0_l2cif_read_tag_ecc,
  piu0_l2cif_read_way,
  piu1_l2cif_read_data,
  piu1_l2cif_read_data_ecc,
  piu1_l2cif_read_index,
  piu1_l2cif_read_req,
  piu1_l2cif_read_tag,
  piu1_l2cif_read_tag_ecc,
  piu1_l2cif_read_way,
  piu2_l2cif_read_data,
  piu2_l2cif_read_data_ecc,
  piu2_l2cif_read_index,
  piu2_l2cif_read_req,
  piu2_l2cif_read_tag,
  piu2_l2cif_read_tag_ecc,
  piu2_l2cif_read_way,
  piu3_l2cif_read_data,
  piu3_l2cif_read_data_ecc,
  piu3_l2cif_read_index,
  piu3_l2cif_read_req,
  piu3_l2cif_read_tag,
  piu3_l2cif_read_tag_ecc,
  piu3_l2cif_read_way,
  snb0_l2c_addr_bus,
  snb0_l2c_addr_req,
  snb0_l2c_data_bus,
  snb0_l2c_data_req,
  snb0_l2c_hpcp_bus,
  snb0_l2c_prf_grant,
  snb0_l2c_snpl2_grant,
  snb1_l2c_addr_bus,
  snb1_l2c_addr_req,
  snb1_l2c_data_bus,
  snb1_l2c_data_req,
  snb1_l2c_hpcp_bus,
  snb1_l2c_prf_grant,
  snb1_l2c_snpl2_grant,
  vb_l2c0_vctm_grant,
  vb_l2c1_vctm_grant,
  vb_yy_grant_id
);

// &Ports; @19
input            ciu_icg_en;                    
input            cpurst_b;                      
input            ctcq_l2c_addr_req;             
input   [1  :0]  ctcq_l2c_req_type;             
input            forever_cpuclk;                
input            l2c_ciu_addr_ready_bank_0;     
input            l2c_ciu_addr_ready_bank_1;     
input            l2c_ciu_cmplt_bank_0;          
input            l2c_ciu_cmplt_bank_1;          
input   [3  :0]  l2c_ciu_cp_bank_0;             
input   [3  :0]  l2c_ciu_cp_bank_1;             
input            l2c_ciu_ctcq_cmplt_bank_0;     
input            l2c_ciu_ctcq_cmplt_bank_1;     
input            l2c_ciu_ctcq_ready_bank_0;     
input            l2c_ciu_ctcq_ready_bank_1;     
input   [511:0]  l2c_ciu_data_bank_0;           
input   [511:0]  l2c_ciu_data_bank_1;           
input            l2c_ciu_data_ready_bank_0;     
input            l2c_ciu_data_ready_bank_1;     
input            l2c_ciu_data_ready_gate_bank_0; 
input            l2c_ciu_data_ready_gate_bank_1; 
input            l2c_ciu_dca_cmplt_bank_0;      
input            l2c_ciu_dca_cmplt_bank_1;      
input   [127:0]  l2c_ciu_dca_data_bank_0;       
input   [127:0]  l2c_ciu_dca_data_bank_1;       
input            l2c_ciu_dca_ready_bank_0;      
input            l2c_ciu_dca_ready_bank_1;      
input   [1  :0]  l2c_ciu_hpcp_acc_inc_bank_0;   
input   [1  :0]  l2c_ciu_hpcp_acc_inc_bank_1;   
input   [2  :0]  l2c_ciu_hpcp_mid_bank_0;       
input   [2  :0]  l2c_ciu_hpcp_mid_bank_1;       
input   [1  :0]  l2c_ciu_hpcp_miss_inc_bank_0;  
input   [1  :0]  l2c_ciu_hpcp_miss_inc_bank_1;  
input   [33 :0]  l2c_ciu_prf_addr;              
input   [2  :0]  l2c_ciu_prf_prot;              
input            l2c_ciu_prf_vld;               
input   [32 :0]  l2c_ciu_rdl_addr_bank_0;       
input   [32 :0]  l2c_ciu_rdl_addr_bank_1;       
input            l2c_ciu_rdl_dvld_bank_0;       
input            l2c_ciu_rdl_dvld_bank_1;       
input   [2  :0]  l2c_ciu_rdl_mid_bank_0;        
input   [2  :0]  l2c_ciu_rdl_mid_bank_1;        
input   [2  :0]  l2c_ciu_rdl_prot_bank_0;       
input   [2  :0]  l2c_ciu_rdl_prot_bank_1;       
input            l2c_ciu_rdl_rvld_bank_0;       
input            l2c_ciu_rdl_rvld_bank_1;       
input   [4  :0]  l2c_ciu_resp_bank_0;           
input   [4  :0]  l2c_ciu_resp_bank_1;           
input   [4  :0]  l2c_ciu_sid_bank_0;            
input   [4  :0]  l2c_ciu_sid_bank_1;            
input   [32 :0]  l2c_ciu_snpl2_addr_bank_0;     
input   [32 :0]  l2c_ciu_snpl2_addr_bank_1;     
input   [4  :0]  l2c_ciu_snpl2_ini_sid_bank_0;  
input   [4  :0]  l2c_ciu_snpl2_ini_sid_bank_1;  
input            l2c_ciu_snpl2_vld_bank_0;      
input            l2c_ciu_snpl2_vld_bank_1;      
input            pad_yy_icg_scan_en;            
input            piu0_l2cif_read_data;          
input            piu0_l2cif_read_data_ecc;      
input   [20 :0]  piu0_l2cif_read_index;         
input            piu0_l2cif_read_req;           
input            piu0_l2cif_read_tag;           
input            piu0_l2cif_read_tag_ecc;       
input   [3  :0]  piu0_l2cif_read_way;           
input            piu1_l2cif_read_data;          
input            piu1_l2cif_read_data_ecc;      
input   [20 :0]  piu1_l2cif_read_index;         
input            piu1_l2cif_read_req;           
input            piu1_l2cif_read_tag;           
input            piu1_l2cif_read_tag_ecc;       
input   [3  :0]  piu1_l2cif_read_way;           
input            piu2_l2cif_read_data;          
input            piu2_l2cif_read_data_ecc;      
input   [20 :0]  piu2_l2cif_read_index;         
input            piu2_l2cif_read_req;           
input            piu2_l2cif_read_tag;           
input            piu2_l2cif_read_tag_ecc;       
input   [3  :0]  piu2_l2cif_read_way;           
input            piu3_l2cif_read_data;          
input            piu3_l2cif_read_data_ecc;      
input   [20 :0]  piu3_l2cif_read_index;         
input            piu3_l2cif_read_req;           
input            piu3_l2cif_read_tag;           
input            piu3_l2cif_read_tag_ecc;       
input   [3  :0]  piu3_l2cif_read_way;           
input   [63 :0]  snb0_l2c_addr_bus;             
input            snb0_l2c_addr_req;             
input   [511:0]  snb0_l2c_data_bus;             
input            snb0_l2c_data_req;             
input   [2  :0]  snb0_l2c_hpcp_bus;             
input            snb0_l2c_prf_grant;            
input            snb0_l2c_snpl2_grant;          
input   [63 :0]  snb1_l2c_addr_bus;             
input            snb1_l2c_addr_req;             
input   [511:0]  snb1_l2c_data_bus;             
input            snb1_l2c_data_req;             
input   [2  :0]  snb1_l2c_hpcp_bus;             
input            snb1_l2c_prf_grant;            
input            snb1_l2c_snpl2_grant;          
input            vb_l2c0_vctm_grant;            
input            vb_l2c1_vctm_grant;            
input   [1  :0]  vb_yy_grant_id;                
output  [32 :0]  ciu_l2c_addr_bank_0;           
output  [32 :0]  ciu_l2c_addr_bank_1;           
output           ciu_l2c_addr_vld_bank_0;       
output           ciu_l2c_addr_vld_bank_1;       
output  [3  :0]  ciu_l2c_clr_cp_bank_0;         
output  [3  :0]  ciu_l2c_clr_cp_bank_1;         
output           ciu_l2c_ctcq_req_bank_0;       
output           ciu_l2c_ctcq_req_bank_1;       
output           ciu_l2c_data_vld_bank_0;       
output           ciu_l2c_data_vld_bank_1;       
output  [32 :0]  ciu_l2c_dca_addr_bank_0;       
output  [32 :0]  ciu_l2c_dca_addr_bank_1;       
output           ciu_l2c_dca_req_bank_0;        
output           ciu_l2c_dca_req_bank_1;        
output  [2  :0]  ciu_l2c_hpcp_bus_bank_0;       
output  [2  :0]  ciu_l2c_hpcp_bus_bank_1;       
output  [2  :0]  ciu_l2c_icc_mid_bank_0;        
output  [2  :0]  ciu_l2c_icc_mid_bank_1;        
output  [1  :0]  ciu_l2c_icc_type_bank_0;       
output  [1  :0]  ciu_l2c_icc_type_bank_1;       
output  [2  :0]  ciu_l2c_mid_bank_0;            
output  [2  :0]  ciu_l2c_mid_bank_1;            
output           ciu_l2c_prf_ready;             
output           ciu_l2c_rdl_ready_bank_0;      
output           ciu_l2c_rdl_ready_bank_1;      
output  [3  :0]  ciu_l2c_set_cp_bank_0;         
output  [3  :0]  ciu_l2c_set_cp_bank_1;         
output  [4  :0]  ciu_l2c_sid_bank_0;            
output  [4  :0]  ciu_l2c_sid_bank_1;            
output           ciu_l2c_snpl2_ready_bank_0;    
output           ciu_l2c_snpl2_ready_bank_1;    
output  [1  :0]  ciu_l2c_src_bank_0;            
output  [1  :0]  ciu_l2c_src_bank_1;            
output  [12 :0]  ciu_l2c_type_bank_0;           
output  [12 :0]  ciu_l2c_type_bank_1;           
output  [511:0]  ciu_l2c_wdata_bank_0;          
output  [511:0]  ciu_l2c_wdata_bank_1;          
output  [67 :0]  l2c0_vb_awbus;                 
output           l2c0_vb_awvalid;               
output  [2  :0]  l2c0_vb_mid;                   
output  [1  :0]  l2c0_vb_vid;                   
output  [534:0]  l2c0_vb_wbus;                  
output           l2c0_vb_wvalid;                
output  [67 :0]  l2c1_vb_awbus;                 
output           l2c1_vb_awvalid;               
output  [2  :0]  l2c1_vb_mid;                   
output  [1  :0]  l2c1_vb_vid;                   
output  [534:0]  l2c1_vb_wbus;                  
output           l2c1_vb_wvalid;                
output           l2c_ctcq_cmplt;                
output           l2c_snb0_addr_grant;           
output           l2c_snb0_cmplt;                
output  [4  :0]  l2c_snb0_cmplt_sid;            
output  [3  :0]  l2c_snb0_cp;                   
output  [511:0]  l2c_snb0_data;                 
output           l2c_snb0_data_grant;           
output           l2c_snb0_data_grant_gate;      
output  [70 :0]  l2c_snb0_prf_bus;              
output           l2c_snb0_prf_req;              
output  [4  :0]  l2c_snb0_resp;                 
output  [70 :0]  l2c_snb0_snpl2_bus;            
output  [4  :0]  l2c_snb0_snpl2_ini_sid;        
output           l2c_snb0_snpl2_req;            
output           l2c_snb1_addr_grant;           
output           l2c_snb1_cmplt;                
output  [4  :0]  l2c_snb1_cmplt_sid;            
output  [3  :0]  l2c_snb1_cp;                   
output  [511:0]  l2c_snb1_data;                 
output           l2c_snb1_data_grant;           
output           l2c_snb1_data_grant_gate;      
output  [70 :0]  l2c_snb1_prf_bus;              
output           l2c_snb1_prf_req;              
output  [4  :0]  l2c_snb1_resp;                 
output  [70 :0]  l2c_snb1_snpl2_bus;            
output  [4  :0]  l2c_snb1_snpl2_ini_sid;        
output           l2c_snb1_snpl2_req;            
output  [3  :0]  l2cif0_regs_read_acc_inc;      
output  [3  :0]  l2cif0_regs_read_miss_inc;     
output  [3  :0]  l2cif0_regs_write_acc_inc;     
output  [3  :0]  l2cif0_regs_write_miss_inc;    
output  [3  :0]  l2cif1_regs_read_acc_inc;      
output  [3  :0]  l2cif1_regs_read_miss_inc;     
output  [3  :0]  l2cif1_regs_write_acc_inc;     
output  [3  :0]  l2cif1_regs_write_miss_inc;    
output           l2cif_piu0_read_data_vld;      
output           l2cif_piu1_read_data_vld;      
output           l2cif_piu2_read_data_vld;      
output           l2cif_piu3_read_data_vld;      
output  [127:0]  l2cif_piux_read_data;          

// &Regs;  @20
reg     [1  :0]  ctcq_cmplt;                    
reg     [1  :0]  ctcq_cur_state;                
reg     [1  :0]  ctcq_next_state;               
reg     [1  :0]  ctcq_rdy;                      
reg     [1  :0]  dca_cur_state;                 
reg     [32 :0]  dca_l2c_req_bus;               
reg     [1  :0]  dca_next_state;                
reg     [32 :0]  dca_req_buf_bus;               

// &Wires; @21
wire             ciu_icg_en;                    
wire    [32 :0]  ciu_l2c_addr_bank_0;           
wire    [32 :0]  ciu_l2c_addr_bank_1;           
wire             ciu_l2c_addr_vld_bank_0;       
wire             ciu_l2c_addr_vld_bank_1;       
wire    [3  :0]  ciu_l2c_clr_cp_bank_0;         
wire    [3  :0]  ciu_l2c_clr_cp_bank_1;         
wire             ciu_l2c_ctcq_req_bank_0;       
wire             ciu_l2c_ctcq_req_bank_1;       
wire             ciu_l2c_data_vld_bank_0;       
wire             ciu_l2c_data_vld_bank_1;       
wire    [32 :0]  ciu_l2c_dca_addr_bank_0;       
wire    [32 :0]  ciu_l2c_dca_addr_bank_1;       
wire             ciu_l2c_dca_req_bank_0;        
wire             ciu_l2c_dca_req_bank_1;        
wire    [2  :0]  ciu_l2c_hpcp_bus_bank_0;       
wire    [2  :0]  ciu_l2c_hpcp_bus_bank_1;       
wire    [2  :0]  ciu_l2c_icc_mid_bank_0;        
wire    [2  :0]  ciu_l2c_icc_mid_bank_1;        
wire    [1  :0]  ciu_l2c_icc_type_bank_0;       
wire    [1  :0]  ciu_l2c_icc_type_bank_1;       
wire    [2  :0]  ciu_l2c_mid_bank_0;            
wire    [2  :0]  ciu_l2c_mid_bank_1;            
wire             ciu_l2c_prf_ready;             
wire             ciu_l2c_rdl_ready_bank_0;      
wire             ciu_l2c_rdl_ready_bank_1;      
wire    [3  :0]  ciu_l2c_set_cp_bank_0;         
wire    [3  :0]  ciu_l2c_set_cp_bank_1;         
wire    [4  :0]  ciu_l2c_sid_bank_0;            
wire    [4  :0]  ciu_l2c_sid_bank_1;            
wire             ciu_l2c_snpl2_ready_bank_0;    
wire             ciu_l2c_snpl2_ready_bank_1;    
wire    [1  :0]  ciu_l2c_src_bank_0;            
wire    [1  :0]  ciu_l2c_src_bank_1;            
wire    [12 :0]  ciu_l2c_type_bank_0;           
wire    [12 :0]  ciu_l2c_type_bank_1;           
wire    [511:0]  ciu_l2c_wdata_bank_0;          
wire    [511:0]  ciu_l2c_wdata_bank_1;          
wire             cpurst_b;                      
wire             ctcq_fsm_clk;                  
wire             ctcq_fsm_clk_en;               
wire             ctcq_idle;                     
wire             ctcq_l2c_addr_req;             
wire             ctcq_l2c_addr_req_0;           
wire             ctcq_l2c_addr_req_1;           
wire    [1  :0]  ctcq_l2c_req_type;             
wire             ctcq_req_en_0;                 
wire             ctcq_req_en_1;                 
wire             dca_clk;                       
wire             dca_clk_en;                    
wire             dca_dp_clk;                    
wire             dca_dp_clk_en;                 
wire             dca_idle;                      
wire    [32 :0]  dca_l2c_addr;                  
wire             dca_l2c_addr_req;              
wire             dca_l2c_addr_req_0;            
wire             dca_l2c_addr_req_1;            
wire    [3  :0]  dca_l2c_req;                   
wire    [1  :0]  dca_l2c_req_type;              
wire             dca_l2c_req_vld;               
wire             dca_req_buf_wen;               
wire             forever_cpuclk;                
wire    [67 :0]  l2c0_vb_awbus;                 
wire             l2c0_vb_awvalid;               
wire    [2  :0]  l2c0_vb_mid;                   
wire    [1  :0]  l2c0_vb_vid;                   
wire    [534:0]  l2c0_vb_wbus;                  
wire             l2c0_vb_wvalid;                
wire    [67 :0]  l2c1_vb_awbus;                 
wire             l2c1_vb_awvalid;               
wire    [2  :0]  l2c1_vb_mid;                   
wire    [1  :0]  l2c1_vb_vid;                   
wire    [534:0]  l2c1_vb_wbus;                  
wire             l2c1_vb_wvalid;                
wire             l2c_ciu_addr_ready_bank_0;     
wire             l2c_ciu_addr_ready_bank_1;     
wire             l2c_ciu_cmplt_bank_0;          
wire             l2c_ciu_cmplt_bank_1;          
wire    [3  :0]  l2c_ciu_cp_bank_0;             
wire    [3  :0]  l2c_ciu_cp_bank_1;             
wire             l2c_ciu_ctcq_cmplt_bank_0;     
wire             l2c_ciu_ctcq_cmplt_bank_1;     
wire             l2c_ciu_ctcq_ready_bank_0;     
wire             l2c_ciu_ctcq_ready_bank_1;     
wire    [511:0]  l2c_ciu_data_bank_0;           
wire    [511:0]  l2c_ciu_data_bank_1;           
wire             l2c_ciu_data_ready_bank_0;     
wire             l2c_ciu_data_ready_bank_1;     
wire             l2c_ciu_data_ready_gate_bank_0; 
wire             l2c_ciu_data_ready_gate_bank_1; 
wire             l2c_ciu_dca_cmplt_bank_0;      
wire             l2c_ciu_dca_cmplt_bank_1;      
wire    [127:0]  l2c_ciu_dca_data_bank_0;       
wire    [127:0]  l2c_ciu_dca_data_bank_1;       
wire             l2c_ciu_dca_ready_bank_0;      
wire             l2c_ciu_dca_ready_bank_1;      
wire    [1  :0]  l2c_ciu_hpcp_acc_inc_bank_0;   
wire    [1  :0]  l2c_ciu_hpcp_acc_inc_bank_1;   
wire    [2  :0]  l2c_ciu_hpcp_mid_bank_0;       
wire    [2  :0]  l2c_ciu_hpcp_mid_bank_1;       
wire    [1  :0]  l2c_ciu_hpcp_miss_inc_bank_0;  
wire    [1  :0]  l2c_ciu_hpcp_miss_inc_bank_1;  
wire    [33 :0]  l2c_ciu_prf_addr;              
wire    [2  :0]  l2c_ciu_prf_prot;              
wire             l2c_ciu_prf_vld;               
wire    [32 :0]  l2c_ciu_rdl_addr_bank_0;       
wire    [32 :0]  l2c_ciu_rdl_addr_bank_1;       
wire             l2c_ciu_rdl_dvld_bank_0;       
wire             l2c_ciu_rdl_dvld_bank_1;       
wire    [2  :0]  l2c_ciu_rdl_mid_bank_0;        
wire    [2  :0]  l2c_ciu_rdl_mid_bank_1;        
wire    [2  :0]  l2c_ciu_rdl_prot_bank_0;       
wire    [2  :0]  l2c_ciu_rdl_prot_bank_1;       
wire             l2c_ciu_rdl_rvld_bank_0;       
wire             l2c_ciu_rdl_rvld_bank_1;       
wire    [4  :0]  l2c_ciu_resp_bank_0;           
wire    [4  :0]  l2c_ciu_resp_bank_1;           
wire    [4  :0]  l2c_ciu_sid_bank_0;            
wire    [4  :0]  l2c_ciu_sid_bank_1;            
wire    [32 :0]  l2c_ciu_snpl2_addr_bank_0;     
wire    [32 :0]  l2c_ciu_snpl2_addr_bank_1;     
wire    [4  :0]  l2c_ciu_snpl2_ini_sid_bank_0;  
wire    [4  :0]  l2c_ciu_snpl2_ini_sid_bank_1;  
wire             l2c_ciu_snpl2_vld_bank_0;      
wire             l2c_ciu_snpl2_vld_bank_1;      
wire             l2c_ctcq_addr_ready_0;         
wire             l2c_ctcq_addr_ready_1;         
wire             l2c_ctcq_cmplt;                
wire             l2c_ctcq_cmplt_0;              
wire             l2c_ctcq_cmplt_1;              
wire             l2c_ctcq_done;                 
wire             l2c_ctcq_rdy;                  
wire             l2c_dca_cmplt;                 
wire    [127:0]  l2c_dca_data;                  
wire             l2c_dca_ready;                 
wire             l2c_snb0_addr_grant;           
wire             l2c_snb0_cmplt;                
wire    [4  :0]  l2c_snb0_cmplt_sid;            
wire    [3  :0]  l2c_snb0_cp;                   
wire    [511:0]  l2c_snb0_data;                 
wire             l2c_snb0_data_grant;           
wire             l2c_snb0_data_grant_gate;      
wire    [70 :0]  l2c_snb0_prf_bus;              
wire             l2c_snb0_prf_req;              
wire    [4  :0]  l2c_snb0_resp;                 
wire    [70 :0]  l2c_snb0_snpl2_bus;            
wire    [4  :0]  l2c_snb0_snpl2_ini_sid;        
wire             l2c_snb0_snpl2_req;            
wire             l2c_snb1_addr_grant;           
wire             l2c_snb1_cmplt;                
wire    [4  :0]  l2c_snb1_cmplt_sid;            
wire    [3  :0]  l2c_snb1_cp;                   
wire    [511:0]  l2c_snb1_data;                 
wire             l2c_snb1_data_grant;           
wire             l2c_snb1_data_grant_gate;      
wire    [70 :0]  l2c_snb1_prf_bus;              
wire             l2c_snb1_prf_req;              
wire    [4  :0]  l2c_snb1_resp;                 
wire    [70 :0]  l2c_snb1_snpl2_bus;            
wire    [4  :0]  l2c_snb1_snpl2_ini_sid;        
wire             l2c_snb1_snpl2_req;            
wire    [3  :0]  l2cif0_regs_read_acc_inc;      
wire    [3  :0]  l2cif0_regs_read_miss_inc;     
wire    [3  :0]  l2cif0_regs_write_acc_inc;     
wire    [3  :0]  l2cif0_regs_write_miss_inc;    
wire    [3  :0]  l2cif1_regs_read_acc_inc;      
wire    [3  :0]  l2cif1_regs_read_miss_inc;     
wire    [3  :0]  l2cif1_regs_write_acc_inc;     
wire    [3  :0]  l2cif1_regs_write_miss_inc;    
wire             l2cif_piu0_read_data_vld;      
wire             l2cif_piu1_read_data_vld;      
wire             l2cif_piu2_read_data_vld;      
wire             l2cif_piu3_read_data_vld;      
wire    [127:0]  l2cif_piux_read_data;          
wire             pad_yy_icg_scan_en;            
wire    [32 :0]  piu0_l2c_req_bus;              
wire             piu0_l2cif_read_data;          
wire             piu0_l2cif_read_data_ecc;      
wire    [20 :0]  piu0_l2cif_read_index;         
wire             piu0_l2cif_read_req;           
wire             piu0_l2cif_read_tag;           
wire             piu0_l2cif_read_tag_ecc;       
wire    [3  :0]  piu0_l2cif_read_way;           
wire    [32 :0]  piu1_l2c_req_bus;              
wire             piu1_l2cif_read_data;          
wire             piu1_l2cif_read_data_ecc;      
wire    [20 :0]  piu1_l2cif_read_index;         
wire             piu1_l2cif_read_req;           
wire             piu1_l2cif_read_tag;           
wire             piu1_l2cif_read_tag_ecc;       
wire    [3  :0]  piu1_l2cif_read_way;           
wire    [32 :0]  piu2_l2c_req_bus;              
wire             piu2_l2cif_read_data;          
wire             piu2_l2cif_read_data_ecc;      
wire    [20 :0]  piu2_l2cif_read_index;         
wire             piu2_l2cif_read_req;           
wire             piu2_l2cif_read_tag;           
wire             piu2_l2cif_read_tag_ecc;       
wire    [3  :0]  piu2_l2cif_read_way;           
wire    [32 :0]  piu3_l2c_req_bus;              
wire             piu3_l2cif_read_data;          
wire             piu3_l2cif_read_data_ecc;      
wire    [20 :0]  piu3_l2cif_read_index;         
wire             piu3_l2cif_read_req;           
wire             piu3_l2cif_read_tag;           
wire             piu3_l2cif_read_tag_ecc;       
wire    [3  :0]  piu3_l2cif_read_way;           
wire    [3  :0]  piu_sel_0;                     
wire    [3  :0]  piu_sel_1;                     
wire    [4  :0]  prf_arid;                      
wire    [70 :0]  prf_bus;                       
wire    [63 :0]  snb0_l2c_addr_bus;             
wire             snb0_l2c_addr_req;             
wire    [511:0]  snb0_l2c_data_bus;             
wire             snb0_l2c_data_req;             
wire    [2  :0]  snb0_l2c_hpcp_bus;             
wire             snb0_l2c_prf_grant;            
wire             snb0_l2c_snpl2_grant;          
wire    [63 :0]  snb1_l2c_addr_bus;             
wire             snb1_l2c_addr_req;             
wire    [511:0]  snb1_l2c_data_bus;             
wire             snb1_l2c_data_req;             
wire    [2  :0]  snb1_l2c_hpcp_bus;             
wire             snb1_l2c_prf_grant;            
wire             snb1_l2c_snpl2_grant;          
wire             vb_l2c0_vctm_grant;            
wire             vb_l2c1_vctm_grant;            
wire    [1  :0]  vb_yy_grant_id;                
wire    [4  :0]  vctm_awid_0;                   
wire    [4  :0]  vctm_awid_1;                   
wire    [67 :0]  vctm_bus_0;                    
wire    [67 :0]  vctm_bus_1;                    

parameter L2C_ADDRW = 33; //`PA_WIDTH -7;
parameter ADDR_H  = 63;
parameter ADDR_7  = 31;
parameter MID_2   = 30;
parameter MID_0   = 28;
parameter SRC_1   = 27;
parameter SRC_0   = 26;
parameter TYPE_12 = 25;
parameter TYPE_0  = 13;
parameter CLRCP_3 = 12;
parameter CLRCP_0 = 9;
parameter SETCP_3 = 8;
parameter SETCP_0 = 5;
parameter SID_4   = 4;
parameter SID_0   = 0; 

// &Force("bus","snb0_l2c_addr_bus",ADDR_H,0); @38
// &Force("bus","snb1_l2c_addr_bus",ADDR_H,0); @39

//================================================
//           l2c_req_bank_0
//================================================
assign ciu_l2c_addr_vld_bank_0    = snb0_l2c_addr_req & !ctcq_l2c_addr_req_0 & !dca_l2c_addr_req_0;
assign ciu_l2c_type_bank_0[12:0]  = snb0_l2c_addr_bus[TYPE_12:TYPE_0];
assign ciu_l2c_clr_cp_bank_0[3:0] = snb0_l2c_addr_bus[CLRCP_3:CLRCP_0];
assign ciu_l2c_set_cp_bank_0[3:0] = snb0_l2c_addr_bus[SETCP_3:SETCP_0];
assign ciu_l2c_src_bank_0[1:0]    = snb0_l2c_addr_bus[SRC_1:SRC_0];
assign ciu_l2c_sid_bank_0[4:0]    = snb0_l2c_addr_bus[SID_4:SID_0];
assign ciu_l2c_addr_bank_0[L2C_ADDRW-1:0] 
                                  = snb0_l2c_addr_bus[ADDR_H:ADDR_7];

assign ciu_l2c_ctcq_req_bank_0    = ctcq_l2c_addr_req_0;
assign ciu_l2c_dca_req_bank_0     = dca_l2c_addr_req_0 & !ctcq_l2c_addr_req_0;
assign ciu_l2c_icc_type_bank_0[1:0] = ctcq_l2c_addr_req_0 ? ctcq_l2c_req_type[1:0] : dca_l2c_req_type[1:0];
assign ciu_l2c_dca_addr_bank_0[L2C_ADDRW-1:0] = dca_l2c_addr[L2C_ADDRW-1:0];

assign ciu_l2c_hpcp_bus_bank_0[2:0]= snb0_l2c_hpcp_bus[2:0];
assign ciu_l2c_mid_bank_0[2:0]     = snb0_l2c_addr_bus[MID_2:MID_0];
assign ciu_l2c_icc_mid_bank_0[2:0] = 3'b111;

assign ciu_l2c_data_vld_bank_0     = snb0_l2c_data_req;
assign ciu_l2c_wdata_bank_0[511:0] = snb0_l2c_data_bus[511:0];

//================================================
//           l2c_req_bank_1
//================================================
assign ciu_l2c_addr_vld_bank_1    = snb1_l2c_addr_req & !ctcq_l2c_addr_req_1 & !dca_l2c_addr_req_1;
assign ciu_l2c_type_bank_1[12:0]  = snb1_l2c_addr_bus[TYPE_12:TYPE_0];
assign ciu_l2c_clr_cp_bank_1[3:0] = snb1_l2c_addr_bus[CLRCP_3:CLRCP_0];
assign ciu_l2c_set_cp_bank_1[3:0] = snb1_l2c_addr_bus[SETCP_3:SETCP_0];
assign ciu_l2c_src_bank_1[1:0]    = snb1_l2c_addr_bus[SRC_1:SRC_0];
assign ciu_l2c_sid_bank_1[4:0]    = snb1_l2c_addr_bus[SID_4:SID_0];
assign ciu_l2c_addr_bank_1[L2C_ADDRW-1:0] 
                                  = snb1_l2c_addr_bus[ADDR_H:ADDR_7];

assign ciu_l2c_ctcq_req_bank_1    = ctcq_l2c_addr_req_1;
assign ciu_l2c_dca_req_bank_1     = dca_l2c_addr_req_1 & !ctcq_l2c_addr_req_1;
assign ciu_l2c_icc_type_bank_1[1:0] = ctcq_l2c_addr_req_1 ? ctcq_l2c_req_type[1:0] : dca_l2c_req_type[1:0];
assign ciu_l2c_dca_addr_bank_1[L2C_ADDRW-1:0] = dca_l2c_addr[L2C_ADDRW-1:0];

assign ciu_l2c_hpcp_bus_bank_1[2:0]= snb1_l2c_hpcp_bus[2:0];
assign ciu_l2c_mid_bank_1[2:0]     = snb1_l2c_addr_bus[MID_2:MID_0];
assign ciu_l2c_icc_mid_bank_1[2:0] = 3'b111;

assign ciu_l2c_data_vld_bank_1     = snb1_l2c_data_req;
assign ciu_l2c_wdata_bank_1[511:0] = snb1_l2c_data_bus[511:0];

//================================================
//         snb0_response
//================================================
// &Force("input","l2c_ciu_data_ready_gate_bank_0"); @98
assign l2c_snb0_addr_grant         = l2c_ciu_addr_ready_bank_0;
assign l2c_snb0_data_grant         = l2c_ciu_data_ready_bank_0;
assign l2c_snb0_data_grant_gate    = l2c_ciu_data_ready_gate_bank_0;
assign l2c_snb0_cmplt              = l2c_ciu_cmplt_bank_0;
assign l2c_snb0_cmplt_sid[4:0]     = l2c_ciu_sid_bank_0[4:0];
assign l2c_snb0_resp[4:0]          = l2c_ciu_resp_bank_0[4:0];
assign l2c_snb0_cp[3:0]            = l2c_ciu_cp_bank_0[3:0];
assign l2c_snb0_data[511:0]        = l2c_ciu_data_bank_0[511:0];

//================================================
//         snb1_response
//================================================
// &Force("input","l2c_ciu_data_ready_gate_bank_1"); @114
assign l2c_snb1_addr_grant         = l2c_ciu_addr_ready_bank_1;
assign l2c_snb1_data_grant         = l2c_ciu_data_ready_bank_1;
assign l2c_snb1_data_grant_gate    = l2c_ciu_data_ready_gate_bank_1;
assign l2c_snb1_cmplt              = l2c_ciu_cmplt_bank_1;
assign l2c_snb1_cmplt_sid[4:0]     = l2c_ciu_sid_bank_1[4:0];
assign l2c_snb1_resp[4:0]          = l2c_ciu_resp_bank_1[4:0];
assign l2c_snb1_cp[3:0]            = l2c_ciu_cp_bank_1[3:0];
assign l2c_snb1_data[511:0]        = l2c_ciu_data_bank_1[511:0];



//================================================
//         dca_response
//================================================
assign l2c_dca_ready        = l2c_ciu_dca_ready_bank_0 || l2c_ciu_dca_ready_bank_1;
assign l2c_dca_cmplt        = l2c_ciu_dca_cmplt_bank_0 || l2c_ciu_dca_cmplt_bank_1;
assign l2c_dca_data[127:0]  = l2c_ciu_dca_cmplt_bank_0 ? l2c_ciu_dca_data_bank_0[127:0] : l2c_ciu_dca_data_bank_1[127:0];

//================================================
//         ctcq_response
//================================================
assign l2c_ctcq_addr_ready_0 = l2c_ciu_ctcq_ready_bank_0;
assign l2c_ctcq_addr_ready_1 = l2c_ciu_ctcq_ready_bank_1;
assign l2c_ctcq_cmplt_0      = l2c_ciu_ctcq_cmplt_bank_0;
assign l2c_ctcq_cmplt_1      = l2c_ciu_ctcq_cmplt_bank_1;

//==========================================================
//     ECC ERROR to REGS
//==========================================================

//==========================================================
//              CTCQ REQ
//==========================================================
parameter CTC_IDLE = 2'b00;
parameter CTC_REQ  = 2'b01;
parameter CTC_WFC  = 2'b11;

assign ctcq_fsm_clk_en = ctcq_l2c_addr_req | !ctcq_idle;

// &Instance("gated_clk_cell", "x_ctcq_fsm_gated_clk"); @204
gated_clk_cell  x_ctcq_fsm_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (ctcq_fsm_clk      ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (ctcq_fsm_clk_en   ),
  .module_en          (ciu_icg_en        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @205
//          .external_en (1'b0), @206
//          .global_en   (1'b1), @207
//          .module_en (ciu_icg_en       ), @208
//          .local_en    (ctcq_fsm_clk_en), @209
//          .clk_out     (ctcq_fsm_clk)); @210

always @(posedge ctcq_fsm_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ctcq_cur_state[1:0] <= CTC_IDLE;
  else
    ctcq_cur_state[1:0] <= ctcq_next_state[1:0];
end

// &CombBeg; @220
always @( l2c_ctcq_done
       or l2c_ctcq_rdy
       or ctcq_l2c_addr_req
       or ctcq_cur_state)
begin
  case(ctcq_cur_state)
  CTC_IDLE: begin
    if (ctcq_l2c_addr_req)
      ctcq_next_state = CTC_REQ;
    else 
      ctcq_next_state = CTC_IDLE;
  end
  CTC_REQ: begin
    if (l2c_ctcq_rdy)
      ctcq_next_state = CTC_WFC;
    else
      ctcq_next_state = CTC_REQ;
  end
  CTC_WFC: begin
    if (l2c_ctcq_done)
      ctcq_next_state = CTC_IDLE;
    else
      ctcq_next_state = CTC_WFC;
  end
  default: ctcq_next_state = CTC_IDLE;
  endcase
// &CombEnd; @242
end

assign ctcq_idle = !ctcq_cur_state[0];

//ctcq_rdy
always @(posedge ctcq_fsm_clk or negedge cpurst_b)
begin
  if (!cpurst_b) 
    ctcq_rdy[0] <= 1'b0;
  else if (l2c_ctcq_addr_ready_0)
    ctcq_rdy[0] <= 1'b1;
  else if (ctcq_idle && ctcq_l2c_addr_req)
    ctcq_rdy[0] <= 1'b0;
end

always @(posedge ctcq_fsm_clk or negedge cpurst_b)
begin
  if (!cpurst_b) 
    ctcq_rdy[1] <= 1'b0;
  else if (l2c_ctcq_addr_ready_1)
    ctcq_rdy[1] <= 1'b1;
  else if (ctcq_idle && ctcq_l2c_addr_req)
    ctcq_rdy[1] <= 1'b0;
end

assign l2c_ctcq_rdy = &ctcq_rdy[1:0];

//ctcq_cmplt
always @(posedge ctcq_fsm_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    ctcq_cmplt[1:0] <= 2'b00;
  else if (ctcq_idle && ctcq_l2c_addr_req)
    ctcq_cmplt[1:0] <= 2'b00;
  else if (l2c_ctcq_cmplt_0 || l2c_ctcq_cmplt_1)
    ctcq_cmplt[1:0] <= ctcq_cmplt[1:0] | {l2c_ctcq_cmplt_1, l2c_ctcq_cmplt_0};
end

assign l2c_ctcq_done = &ctcq_cmplt[1:0];

assign l2c_ctcq_cmplt = (ctcq_cur_state == CTC_WFC) && l2c_ctcq_done;

assign ctcq_req_en_0 = !ctcq_rdy[0] || ctcq_idle;
assign ctcq_req_en_1 = !ctcq_rdy[1] || ctcq_idle;

assign ctcq_l2c_addr_req_0 = ctcq_l2c_addr_req && ctcq_req_en_0;
assign ctcq_l2c_addr_req_1 = ctcq_l2c_addr_req && ctcq_req_en_1;

//==============================================================================
//            DCA: direct cache access 
//==============================================================================
//================================================
//  DCA FSM
//================================================
assign dca_clk_en = dca_req_buf_wen || l2c_dca_ready || l2c_dca_cmplt;

// &Instance("gated_clk_cell", "x_dca_gated_clk"); @298
gated_clk_cell  x_dca_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (dca_clk           ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (dca_clk_en        ),
  .module_en          (ciu_icg_en        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @299
//          .external_en (1'b0), @300
//          .global_en   (1'b1), @301
//          .module_en (ciu_icg_en       ), @302
//          .local_en    (dca_clk_en), @303
//          .clk_out     (dca_clk)); @304

assign dca_dp_clk_en = dca_req_buf_wen;

// &Instance("gated_clk_cell", "x_dca_dp_gated_clk"); @308
gated_clk_cell  x_dca_dp_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (dca_dp_clk        ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (dca_dp_clk_en     ),
  .module_en          (ciu_icg_en        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @309
//          .external_en (1'b0), @310
//          .global_en   (1'b1), @311
//          .module_en (ciu_icg_en       ), @312
//          .local_en    (dca_dp_clk_en), @313
//          .clk_out     (dca_dp_clk)); @314

parameter RD_IDLE  = 2'b00;
parameter RD_REQ   = 2'b01;
parameter RD_CMPLT = 2'b10;

assign dca_l2c_req[3:0] = {piu3_l2cif_read_req,
                           piu2_l2cif_read_req,
                           piu1_l2cif_read_req,
                           piu0_l2cif_read_req};

assign dca_l2c_req_vld = |dca_l2c_req[3:0];

always @(posedge dca_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    dca_cur_state[1:0] <= RD_IDLE;
  else
    dca_cur_state[1:0] <= dca_next_state[1:0];
end

// &CombBeg; @335
always @( dca_cur_state
       or l2c_dca_ready
       or l2c_dca_cmplt
       or dca_l2c_req_vld)
begin
  case(dca_cur_state)
  RD_IDLE: begin
    if (dca_l2c_req_vld)
      dca_next_state = RD_REQ;
    else 
      dca_next_state = RD_IDLE;
  end
  RD_REQ: begin
    if (l2c_dca_ready)
      dca_next_state = RD_CMPLT;
    else
      dca_next_state = RD_REQ;
  end
  RD_CMPLT: begin
    if (l2c_dca_cmplt)
      dca_next_state = RD_IDLE;
    else 
      dca_next_state = RD_CMPLT;
  end
  default: dca_next_state = RD_IDLE;
  endcase
// &CombEnd; @357
end

assign dca_idle         = (dca_cur_state == RD_IDLE);
assign dca_req_buf_wen  = dca_l2c_req_vld && dca_idle;
assign dca_l2c_addr_req = dca_cur_state[0];  //RD_REQ

//==========================================================
//         req buffer
//==========================================================
parameter REQ_WIDTH = 33;
parameter INDEX_0   = 0;
parameter INDEX_6   = 6;
parameter INDEX_20  = 20;
parameter WAY_0     = 21;
parameter WAY_3     = 24;
parameter TAG_REQ   = 25;
parameter DATA_REQ  = 26;
parameter TAG_ECC_REQ  = 27;
parameter DATA_ECC_REQ = 28;
parameter PIU0_SEL  = 29;
parameter PIU1_SEL  = 30;
parameter PIU2_SEL  = 31;
parameter PIU3_SEL  = 32;

assign piu0_l2c_req_bus[REQ_WIDTH-1:0] = {4'b0001,
                                          piu0_l2cif_read_data_ecc,
                                          piu0_l2cif_read_tag_ecc,
                                          piu0_l2cif_read_data,
                                          piu0_l2cif_read_tag,
                                          piu0_l2cif_read_way[3:0],
                                          piu0_l2cif_read_index[20:0]};
assign piu1_l2c_req_bus[REQ_WIDTH-1:0] = {4'b0010,
                                          piu1_l2cif_read_data_ecc,
                                          piu1_l2cif_read_tag_ecc,
                                          piu1_l2cif_read_data,
                                          piu1_l2cif_read_tag,
                                          piu1_l2cif_read_way[3:0],
                                          piu1_l2cif_read_index[20:0]};
assign piu2_l2c_req_bus[REQ_WIDTH-1:0] = {4'b0100,
                                          piu2_l2cif_read_data_ecc,
                                          piu2_l2cif_read_tag_ecc,
                                          piu2_l2cif_read_data,
                                          piu2_l2cif_read_tag,
                                          piu2_l2cif_read_way[3:0],
                                          piu2_l2cif_read_index[20:0]};
assign piu3_l2c_req_bus[REQ_WIDTH-1:0] = {4'b1000,
                                          piu3_l2cif_read_data_ecc,
                                          piu3_l2cif_read_tag_ecc,
                                          piu3_l2cif_read_data,
                                          piu3_l2cif_read_tag,
                                          piu3_l2cif_read_way[3:0],
                                          piu3_l2cif_read_index[20:0]};
// &CombBeg; @409
always @( piu0_l2c_req_bus[32:0]
       or piu3_l2c_req_bus[32:0]
       or piu2_l2c_req_bus[32:0]
       or piu1_l2c_req_bus[32:0]
       or dca_l2c_req[3:0])
begin
  casez(dca_l2c_req[3:0])
  4'b???1: dca_l2c_req_bus[REQ_WIDTH-1:0] = piu0_l2c_req_bus[REQ_WIDTH-1:0];
  4'b??10: dca_l2c_req_bus[REQ_WIDTH-1:0] = piu1_l2c_req_bus[REQ_WIDTH-1:0];
  4'b?100: dca_l2c_req_bus[REQ_WIDTH-1:0] = piu2_l2c_req_bus[REQ_WIDTH-1:0];
  4'b1000: dca_l2c_req_bus[REQ_WIDTH-1:0] = piu3_l2c_req_bus[REQ_WIDTH-1:0];
  default: dca_l2c_req_bus[REQ_WIDTH-1:0] = {REQ_WIDTH{1'b0}};
  endcase
// &CombEnd; @417
end

always @(posedge dca_dp_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    dca_req_buf_bus[REQ_WIDTH-1:0] <= {REQ_WIDTH{1'b0}};
  else if (dca_req_buf_wen)
    dca_req_buf_bus[REQ_WIDTH-1:0] <= dca_l2c_req_bus[REQ_WIDTH-1:0];
end

assign dca_l2c_req_type[1]   = dca_req_buf_bus[DATA_ECC_REQ] || dca_req_buf_bus[TAG_ECC_REQ];
assign dca_l2c_req_type[0]   = dca_req_buf_bus[DATA_ECC_REQ] || dca_req_buf_bus[DATA_REQ]; //[3:2]: 01->TAG; 10->DATA; 11->ECC;
assign dca_l2c_addr[L2C_ADDRW-1:0] = {8'b0, dca_req_buf_bus[WAY_3:WAY_0], dca_req_buf_bus[INDEX_20:INDEX_0]};

assign dca_l2c_addr_req_0    = dca_l2c_addr_req && !dca_l2c_addr[INDEX_6];
assign dca_l2c_addr_req_1    = dca_l2c_addr_req && dca_l2c_addr[INDEX_6];

assign l2cif_piu0_read_data_vld = dca_req_buf_bus[PIU0_SEL] && l2c_dca_cmplt;
assign l2cif_piu1_read_data_vld = dca_req_buf_bus[PIU1_SEL] && l2c_dca_cmplt;
assign l2cif_piu2_read_data_vld = dca_req_buf_bus[PIU2_SEL] && l2c_dca_cmplt;
assign l2cif_piu3_read_data_vld = dca_req_buf_bus[PIU3_SEL] && l2c_dca_cmplt;
assign l2cif_piux_read_data[127:0] = l2c_dca_data[127:0];


//================================================
//       l2c request to ciu
//================================================
//----------------------------
// l2 prf to SNB
//----------------------------
parameter P_WIDTH = 71;

// &Force("output","ciu_l2c_prf_ready"); @450
assign prf_arid[4:0] = 5'b0;

assign prf_bus[P_WIDTH-1:0] = {l2c_ciu_prf_addr[L2C_ADDRW:0], 6'b0,
                               2'b0,   //bar
                               2'b01,  //domain
                               4'b1,   //snoop  Readshared
                               2'b10,  //burst:wrap 4
                               2'b11,  //len
                               prf_arid[4:0], //rid
                               3'b0,  //user
                               1'b0,   //lock
                               3'b100, //size
                               4'b1111,//cache
                               l2c_ciu_prf_prot[2:0]}; //prot

assign l2c_snb0_prf_req = l2c_ciu_prf_vld && !l2c_ciu_prf_addr[0];
assign l2c_snb0_prf_bus[P_WIDTH-1:0] = prf_bus[P_WIDTH-1:0];
assign l2c_snb1_prf_req= l2c_ciu_prf_vld && l2c_ciu_prf_addr[0];
assign l2c_snb1_prf_bus[P_WIDTH-1:0] = prf_bus[P_WIDTH-1:0];

assign ciu_l2c_prf_ready = snb0_l2c_prf_grant || snb1_l2c_prf_grant;

//----------------------------
// snpl2c to SNB
//----------------------------
assign ciu_l2c_snpl2_ready_bank_0      = snb0_l2c_snpl2_grant;

assign l2c_snb0_snpl2_req              = l2c_ciu_snpl2_vld_bank_0;
assign l2c_snb0_snpl2_ini_sid[4:0]     = l2c_ciu_snpl2_ini_sid_bank_0[4:0];
assign l2c_snb0_snpl2_bus[P_WIDTH-1:0] = {l2c_ciu_snpl2_addr_bank_0[L2C_ADDRW-1:0],1'b0, 6'b0,
                                          2'b0,   //bar
                                          2'b01,  //domain
                                          4'b1001,//snoop  CleanInvalid
                                          2'b10,  //burst:wrap 4
                                          2'b11,  //len
                                          l2c_ciu_snpl2_ini_sid_bank_0[4:0],   //rid
                                          3'b0,   //user
                                          1'b0,   //lock
                                          3'b100, //size
                                          4'b1111,//cache
                                          3'b000}; //prot:unprivilege + secure + data 

assign ciu_l2c_snpl2_ready_bank_1      = snb1_l2c_snpl2_grant;

assign l2c_snb1_snpl2_req              = l2c_ciu_snpl2_vld_bank_1;
assign l2c_snb1_snpl2_ini_sid[4:0]     = l2c_ciu_snpl2_ini_sid_bank_1[4:0];
assign l2c_snb1_snpl2_bus[P_WIDTH-1:0] = {l2c_ciu_snpl2_addr_bank_1[L2C_ADDRW-1:0],1'b1, 6'b0,
                                          2'b0,   //bar
                                          2'b01,  //domain
                                          4'b1001,//snoop  CleanInvalid
                                          2'b10,  //burst:wrap 4
                                          2'b11,  //len
                                          l2c_ciu_snpl2_ini_sid_bank_1[4:0],   //rid
                                          3'b0,   //user
                                          1'b0,   //lock
                                          3'b100, //size
                                          4'b1111,//cache
                                          3'b000}; //prot:unprivilege + secure + data 

//----------------------------
// vctm To VB
//----------------------------
parameter A_WIDTH = 68;
parameter D_WIDTH = 535;

assign vctm_awid_0[4:0] = 5'b11000;
assign vctm_awid_1[4:0] = 5'b11000;

assign vctm_bus_0[A_WIDTH-1:0] = {3'b011,  //WB
                                  1'b0, vctm_awid_0[4:0],
                                  2'b00,
                                  2'b01,
                                  2'b01,
                                  4'b1111, //cache
                                  2'b11,   //len
                                  1'b0,    //lock
                                  l2c_ciu_rdl_prot_bank_0[2:0],
                                  3'b100,  //size
                                  l2c_ciu_rdl_addr_bank_0[L2C_ADDRW-1:0],1'b0,6'b0};

assign vctm_bus_1[A_WIDTH-1:0] = {3'b011,        //WB
                                  1'b1,vctm_awid_1[4:0], //sid
                                  2'b00,   //bar
                                  2'b01,   //domian
                                  2'b01,   //burst
                                  4'b1111, //cache
                                  2'b11,   //len
                                  1'b0,    //lock
                                  l2c_ciu_rdl_prot_bank_1[2:0],
                                  3'b100,  //size
                                  l2c_ciu_rdl_addr_bank_1[L2C_ADDRW-1:0],1'b1,6'b0};

assign l2c0_vb_awvalid = l2c_ciu_rdl_rvld_bank_0;
assign l2c1_vb_awvalid = l2c_ciu_rdl_rvld_bank_1;
assign l2c0_vb_awbus[A_WIDTH-1:0] = vctm_bus_0[A_WIDTH-1:0];
assign l2c1_vb_awbus[A_WIDTH-1:0] = vctm_bus_1[A_WIDTH-1:0];

assign l2c0_vb_mid[2:0] = l2c_ciu_rdl_mid_bank_0[2:0];
assign l2c1_vb_mid[2:0] = l2c_ciu_rdl_mid_bank_1[2:0];

assign l2c0_vb_wvalid = l2c_ciu_rdl_dvld_bank_0 & vb_l2c0_vctm_grant;
assign l2c1_vb_wvalid = l2c_ciu_rdl_dvld_bank_1 & vb_l2c1_vctm_grant;

assign l2c0_vb_vid[1:0] = vb_yy_grant_id[1:0];
assign l2c1_vb_vid[1:0] = vb_yy_grant_id[1:0];
//assign l2c0_vb_vid[1:0] = bank0_vid_fifo_pop_bus[1:0];
//assign l2c1_vb_vid[1:0] = bank1_vid_fifo_pop_bus[1:0];

assign l2c0_vb_wbus[D_WIDTH-1:0] = {1'b0,    //len0
                                    1'b0,vctm_awid_0[4:0], //snb0+sid[4:0] 
                                    {16{1'b1}},     //wstrb
                                    l2c_ciu_data_bank_0[511:0]};//data
assign l2c1_vb_wbus[D_WIDTH-1:0] = {1'b0, 
                                    1'b1,vctm_awid_1[4:0], 
                                    {16{1'b1}},
                                    l2c_ciu_data_bank_1[511:0]};

assign ciu_l2c_rdl_ready_bank_0    = vb_l2c0_vctm_grant;
assign ciu_l2c_rdl_ready_bank_1    = vb_l2c1_vctm_grant;

//==============================================================================
//     for hpcp
//==============================================================================

assign piu_sel_0[3:0] = (4'b1 << l2c_ciu_hpcp_mid_bank_0[1:0]) & {4{!l2c_ciu_hpcp_mid_bank_0[2]}};
assign piu_sel_1[3:0] = (4'b1 << l2c_ciu_hpcp_mid_bank_1[1:0]) & {4{!l2c_ciu_hpcp_mid_bank_1[2]}};

assign l2cif0_regs_read_acc_inc[3:0]   = {4{l2c_ciu_hpcp_acc_inc_bank_0[1]}}  & piu_sel_0[3:0];
assign l2cif0_regs_read_miss_inc[3:0]  = {4{l2c_ciu_hpcp_miss_inc_bank_0[1]}} & piu_sel_0[3:0];
assign l2cif0_regs_write_acc_inc[3:0]  = {4{l2c_ciu_hpcp_acc_inc_bank_0[0]}}  & piu_sel_0[3:0];
assign l2cif0_regs_write_miss_inc[3:0] = {4{l2c_ciu_hpcp_miss_inc_bank_0[0]}} & piu_sel_0[3:0];

assign l2cif1_regs_read_acc_inc[3:0]   = {4{l2c_ciu_hpcp_acc_inc_bank_1[1]}}  & piu_sel_1[3:0];
assign l2cif1_regs_read_miss_inc[3:0]  = {4{l2c_ciu_hpcp_miss_inc_bank_1[1]}} & piu_sel_1[3:0];
assign l2cif1_regs_write_acc_inc[3:0]  = {4{l2c_ciu_hpcp_acc_inc_bank_1[0]}}  & piu_sel_1[3:0];
assign l2cif1_regs_write_miss_inc[3:0] = {4{l2c_ciu_hpcp_miss_inc_bank_1[0]}} & piu_sel_1[3:0];

//==============================================================================
//  ASSERTION
//==============================================================================
// &Force("output", "ciu_l2c_addr_vld_bank_0"); @639

// &ModuleEnd; @642
endmodule



