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

// &Depend("cpu_cfig.h"); @22
// &ModuleBeg; @23
module ct_l2c_top(
  ciu_l2c_addr_bank_0,
  ciu_l2c_addr_bank_1,
  ciu_l2c_addr_vld_bank_0,
  ciu_l2c_addr_vld_bank_1,
  ciu_l2c_clr_cp_bank_0,
  ciu_l2c_clr_cp_bank_1,
  ciu_l2c_ctcq_req_bank_0,
  ciu_l2c_ctcq_req_bank_1,
  ciu_l2c_data_latency,
  ciu_l2c_data_setup,
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
  ciu_l2c_iprf,
  ciu_l2c_mid_bank_0,
  ciu_l2c_mid_bank_1,
  ciu_l2c_prf_ready,
  ciu_l2c_rdl_ready_bank_0,
  ciu_l2c_rdl_ready_bank_1,
  ciu_l2c_rst_req,
  ciu_l2c_set_cp_bank_0,
  ciu_l2c_set_cp_bank_1,
  ciu_l2c_sid_bank_0,
  ciu_l2c_sid_bank_1,
  ciu_l2c_snpl2_ready_bank_0,
  ciu_l2c_snpl2_ready_bank_1,
  ciu_l2c_src_bank_0,
  ciu_l2c_src_bank_1,
  ciu_l2c_tag_latency,
  ciu_l2c_tag_setup,
  ciu_l2c_tprf,
  ciu_l2c_type_bank_0,
  ciu_l2c_type_bank_1,
  ciu_l2c_wdata_bank_0,
  ciu_l2c_wdata_bank_1,
  ciu_top_clk,
  ciu_xx_no_op,
  cpurst_b,
  forever_cpuclk,
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
  l2c_ciu_dbg_info,
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
  l2c_data_clk_bank_0,
  l2c_data_clk_bank_1,
  l2c_data_ram_clk_en_bank_0,
  l2c_data_ram_clk_en_bank_1,
  l2c_icg_en,
  l2c_sysio_flush_done,
  l2c_sysio_flush_idle,
  l2c_tag_clk_bank_0,
  l2c_tag_clk_bank_1,
  l2c_tag_ram_clk_en_bank_0,
  l2c_tag_ram_clk_en_bank_1,
  l2c_xx_no_op,
  pad_yy_icg_scan_en,
  sysio_l2c_flush_req
);

// &Ports @24
input   [32 :0]  ciu_l2c_addr_bank_0;           
input   [32 :0]  ciu_l2c_addr_bank_1;           
input            ciu_l2c_addr_vld_bank_0;       
input            ciu_l2c_addr_vld_bank_1;       
input   [3  :0]  ciu_l2c_clr_cp_bank_0;         
input   [3  :0]  ciu_l2c_clr_cp_bank_1;         
input            ciu_l2c_ctcq_req_bank_0;       
input            ciu_l2c_ctcq_req_bank_1;       
input   [2  :0]  ciu_l2c_data_latency;          
input            ciu_l2c_data_setup;            
input            ciu_l2c_data_vld_bank_0;       
input            ciu_l2c_data_vld_bank_1;       
input   [32 :0]  ciu_l2c_dca_addr_bank_0;       
input   [32 :0]  ciu_l2c_dca_addr_bank_1;       
input            ciu_l2c_dca_req_bank_0;        
input            ciu_l2c_dca_req_bank_1;        
input   [2  :0]  ciu_l2c_hpcp_bus_bank_0;       
input   [2  :0]  ciu_l2c_hpcp_bus_bank_1;       
input   [2  :0]  ciu_l2c_icc_mid_bank_0;        
input   [2  :0]  ciu_l2c_icc_mid_bank_1;        
input   [1  :0]  ciu_l2c_icc_type_bank_0;       
input   [1  :0]  ciu_l2c_icc_type_bank_1;       
input   [1  :0]  ciu_l2c_iprf;                  
input   [2  :0]  ciu_l2c_mid_bank_0;            
input   [2  :0]  ciu_l2c_mid_bank_1;            
input            ciu_l2c_prf_ready;             
input            ciu_l2c_rdl_ready_bank_0;      
input            ciu_l2c_rdl_ready_bank_1;      
input            ciu_l2c_rst_req;               
input   [3  :0]  ciu_l2c_set_cp_bank_0;         
input   [3  :0]  ciu_l2c_set_cp_bank_1;         
input   [4  :0]  ciu_l2c_sid_bank_0;            
input   [4  :0]  ciu_l2c_sid_bank_1;            
input            ciu_l2c_snpl2_ready_bank_0;    
input            ciu_l2c_snpl2_ready_bank_1;    
input   [1  :0]  ciu_l2c_src_bank_0;            
input   [1  :0]  ciu_l2c_src_bank_1;            
input   [2  :0]  ciu_l2c_tag_latency;           
input            ciu_l2c_tag_setup;             
input            ciu_l2c_tprf;                  
input   [12 :0]  ciu_l2c_type_bank_0;           
input   [12 :0]  ciu_l2c_type_bank_1;           
input   [511:0]  ciu_l2c_wdata_bank_0;          
input   [511:0]  ciu_l2c_wdata_bank_1;          
input            ciu_top_clk;                   
input            ciu_xx_no_op;                  
input            cpurst_b;                      
input            forever_cpuclk;                
input            l2c_data_clk_bank_0;           
input            l2c_data_clk_bank_1;           
input            l2c_icg_en;                    
input            l2c_tag_clk_bank_0;            
input            l2c_tag_clk_bank_1;            
input            pad_yy_icg_scan_en;            
input            sysio_l2c_flush_req;           
output           l2c_ciu_addr_ready_bank_0;     
output           l2c_ciu_addr_ready_bank_1;     
output           l2c_ciu_cmplt_bank_0;          
output           l2c_ciu_cmplt_bank_1;          
output  [3  :0]  l2c_ciu_cp_bank_0;             
output  [3  :0]  l2c_ciu_cp_bank_1;             
output           l2c_ciu_ctcq_cmplt_bank_0;     
output           l2c_ciu_ctcq_cmplt_bank_1;     
output           l2c_ciu_ctcq_ready_bank_0;     
output           l2c_ciu_ctcq_ready_bank_1;     
output  [511:0]  l2c_ciu_data_bank_0;           
output  [511:0]  l2c_ciu_data_bank_1;           
output           l2c_ciu_data_ready_bank_0;     
output           l2c_ciu_data_ready_bank_1;     
output           l2c_ciu_data_ready_gate_bank_0; 
output           l2c_ciu_data_ready_gate_bank_1; 
output  [43 :0]  l2c_ciu_dbg_info;              
output           l2c_ciu_dca_cmplt_bank_0;      
output           l2c_ciu_dca_cmplt_bank_1;      
output  [127:0]  l2c_ciu_dca_data_bank_0;       
output  [127:0]  l2c_ciu_dca_data_bank_1;       
output           l2c_ciu_dca_ready_bank_0;      
output           l2c_ciu_dca_ready_bank_1;      
output  [1  :0]  l2c_ciu_hpcp_acc_inc_bank_0;   
output  [1  :0]  l2c_ciu_hpcp_acc_inc_bank_1;   
output  [2  :0]  l2c_ciu_hpcp_mid_bank_0;       
output  [2  :0]  l2c_ciu_hpcp_mid_bank_1;       
output  [1  :0]  l2c_ciu_hpcp_miss_inc_bank_0;  
output  [1  :0]  l2c_ciu_hpcp_miss_inc_bank_1;  
output  [33 :0]  l2c_ciu_prf_addr;              
output  [2  :0]  l2c_ciu_prf_prot;              
output           l2c_ciu_prf_vld;               
output  [32 :0]  l2c_ciu_rdl_addr_bank_0;       
output  [32 :0]  l2c_ciu_rdl_addr_bank_1;       
output           l2c_ciu_rdl_dvld_bank_0;       
output           l2c_ciu_rdl_dvld_bank_1;       
output  [2  :0]  l2c_ciu_rdl_mid_bank_0;        
output  [2  :0]  l2c_ciu_rdl_mid_bank_1;        
output  [2  :0]  l2c_ciu_rdl_prot_bank_0;       
output  [2  :0]  l2c_ciu_rdl_prot_bank_1;       
output           l2c_ciu_rdl_rvld_bank_0;       
output           l2c_ciu_rdl_rvld_bank_1;       
output  [4  :0]  l2c_ciu_resp_bank_0;           
output  [4  :0]  l2c_ciu_resp_bank_1;           
output  [4  :0]  l2c_ciu_sid_bank_0;            
output  [4  :0]  l2c_ciu_sid_bank_1;            
output  [32 :0]  l2c_ciu_snpl2_addr_bank_0;     
output  [32 :0]  l2c_ciu_snpl2_addr_bank_1;     
output  [4  :0]  l2c_ciu_snpl2_ini_sid_bank_0;  
output  [4  :0]  l2c_ciu_snpl2_ini_sid_bank_1;  
output           l2c_ciu_snpl2_vld_bank_0;      
output           l2c_ciu_snpl2_vld_bank_1;      
output           l2c_data_ram_clk_en_bank_0;    
output           l2c_data_ram_clk_en_bank_1;    
output           l2c_sysio_flush_done;          
output           l2c_sysio_flush_idle;          
output           l2c_tag_ram_clk_en_bank_0;     
output           l2c_tag_ram_clk_en_bank_1;     
output           l2c_xx_no_op;                  

// &Regs; @25
reg     [3  :0]  ciu_l2c_data_acc_cycle;        
reg     [2  :0]  ciu_l2c_tag_acc_cycle;         
reg     [2  :0]  flush_cur_state;               
reg     [2  :0]  flush_next_state;              

// &Wires; @26
wire    [32 :0]  ciu_l2c_addr_bank_0;           
wire    [32 :0]  ciu_l2c_addr_bank_1;           
wire             ciu_l2c_addr_vld_bank_0;       
wire             ciu_l2c_addr_vld_bank_1;       
wire    [3  :0]  ciu_l2c_clr_cp_bank_0;         
wire    [3  :0]  ciu_l2c_clr_cp_bank_1;         
wire             ciu_l2c_ctcq_req_bank_0;       
wire             ciu_l2c_ctcq_req_bank_1;       
wire    [2  :0]  ciu_l2c_data_latency;          
wire             ciu_l2c_data_setup;            
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
wire    [1  :0]  ciu_l2c_iprf;                  
wire    [2  :0]  ciu_l2c_mid_bank_0;            
wire    [2  :0]  ciu_l2c_mid_bank_1;            
wire             ciu_l2c_prf_ready;             
wire             ciu_l2c_rdl_ready_bank_0;      
wire             ciu_l2c_rdl_ready_bank_1;      
wire             ciu_l2c_rst_req;               
wire    [3  :0]  ciu_l2c_set_cp_bank_0;         
wire    [3  :0]  ciu_l2c_set_cp_bank_1;         
wire    [4  :0]  ciu_l2c_sid_bank_0;            
wire    [4  :0]  ciu_l2c_sid_bank_1;            
wire             ciu_l2c_snpl2_ready_bank_0;    
wire             ciu_l2c_snpl2_ready_bank_1;    
wire    [1  :0]  ciu_l2c_src_bank_0;            
wire    [1  :0]  ciu_l2c_src_bank_1;            
wire    [2  :0]  ciu_l2c_tag_latency;           
wire             ciu_l2c_tag_setup;             
wire             ciu_l2c_tprf;                  
wire    [12 :0]  ciu_l2c_type_bank_0;           
wire    [12 :0]  ciu_l2c_type_bank_1;           
wire    [511:0]  ciu_l2c_wdata_bank_0;          
wire    [511:0]  ciu_l2c_wdata_bank_1;          
wire             ciu_top_clk;                   
wire             ciu_xx_no_op;                  
wire    [32 :0]  cmp_pref_addr_bank_0;          
wire    [32 :0]  cmp_pref_addr_bank_1;          
wire             cmp_pref_cache_miss_bank_0;    
wire             cmp_pref_cache_miss_bank_1;    
wire             cmp_pref_ifu_req_bank_0;       
wire             cmp_pref_ifu_req_bank_1;       
wire             cmp_pref_read_bank_0;          
wire             cmp_pref_read_bank_1;          
wire             cmp_pref_tlb_req_bank_0;       
wire             cmp_pref_tlb_req_bank_1;       
wire             cmp_pref_vld_bank_0;           
wire             cmp_pref_vld_bank_1;           
wire             cpurst_b;                      
wire    [3  :0]  data_acc_cycle;                
wire             forever_cpuclk;                
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
wire    [43 :0]  l2c_ciu_dbg_info;              
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
wire             l2c_data_clk_bank_0;           
wire             l2c_data_clk_bank_1;           
wire             l2c_data_ram_clk_en_bank_0;    
wire             l2c_data_ram_clk_en_bank_1;    
wire    [21 :0]  l2c_dbg_info_bank_0;           
wire    [21 :0]  l2c_dbg_info_bank_1;           
wire             l2c_flush_done_bank_0;         
wire             l2c_flush_done_bank_1;         
wire             l2c_flush_req_bank_0;          
wire             l2c_flush_req_bank_1;          
wire             l2c_icg_en;                    
wire             l2c_no_op_bank_0;              
wire             l2c_no_op_bank_1;              
wire             l2c_sysio_flush_done;          
wire             l2c_sysio_flush_idle;          
wire             l2c_tag_clk_bank_0;            
wire             l2c_tag_clk_bank_1;            
wire             l2c_tag_ram_clk_en_bank_0;     
wire             l2c_tag_ram_clk_en_bank_1;     
wire             l2c_xx_no_op;                  
wire             pad_yy_icg_scan_en;            
wire             prf_idle;                      
wire             sysio_l2c_flush_req;           
wire    [3  :0]  tag_acc_cycle;                 



assign tag_acc_cycle[3:0]  = {3'b0,ciu_l2c_tag_setup } + {1'b0,ciu_l2c_tag_latency[2:0] };
assign data_acc_cycle[3:0] = {3'b0,ciu_l2c_data_setup} + {1'b0,ciu_l2c_data_latency[2:0]};

// &CombBeg; @43
always @( tag_acc_cycle[3:0])
begin
 case(tag_acc_cycle[3:0])
   4'b0000:
     ciu_l2c_tag_acc_cycle[2:0] = 3'b000;
   4'b0001:
     ciu_l2c_tag_acc_cycle[2:0] = 3'b001;
   4'b0010:
     ciu_l2c_tag_acc_cycle[2:0] = 3'b010;
   4'b0011:
     ciu_l2c_tag_acc_cycle[2:0] = 3'b011;
   4'b0100:
     ciu_l2c_tag_acc_cycle[2:0] = 3'b100;
   default:
     ciu_l2c_tag_acc_cycle[2:0] = 3'b100;
 endcase
// &CombEnd; @58
end

// &CombBeg; @60
always @( data_acc_cycle[3:0])
begin
 case(data_acc_cycle[3:0])
   4'b0000:
     ciu_l2c_data_acc_cycle[3:0] = 4'b000;
   4'b0001:
     ciu_l2c_data_acc_cycle[3:0] = 4'b001;
   4'b0010:
     ciu_l2c_data_acc_cycle[3:0] = 4'b010;
   4'b0011:
     ciu_l2c_data_acc_cycle[3:0] = 4'b011;
   4'b0100:
     ciu_l2c_data_acc_cycle[3:0] = 4'b100;
   4'b0101:
     ciu_l2c_data_acc_cycle[3:0] = 4'b101;
   4'b0110:
     ciu_l2c_data_acc_cycle[3:0] = 4'b110;
   4'b0111:
     ciu_l2c_data_acc_cycle[3:0] = 4'b111;
   4'b1000:
     ciu_l2c_data_acc_cycle[3:0] = 4'b1000;
   default:
     ciu_l2c_data_acc_cycle[3:0] = 4'b1000;
 endcase
// &CombEnd; @83
end

assign l2c_xx_no_op = prf_idle && l2c_no_op_bank_0 && l2c_no_op_bank_1;

//==========================================================
// l2c_flush from soc
//==========================================================
parameter IDLE   = 3'b000;
parameter REQ    = 3'b001;
parameter WAIT_1 = 3'b010;
parameter WAIT_0 = 3'b011;
parameter DONE   = 3'b100;

always@(posedge forever_cpuclk or negedge cpurst_b)
begin
  if(!cpurst_b)
    flush_cur_state[2:0] <= IDLE;
  else
    flush_cur_state[2:0] <= flush_next_state[2:0];
end

// &CombBeg; @104
always @( l2c_flush_done_bank_1
       or sysio_l2c_flush_req
       or l2c_flush_done_bank_0
       or flush_cur_state
       or ciu_xx_no_op)
begin
  case(flush_cur_state)
  IDLE: begin
    if (sysio_l2c_flush_req & ciu_xx_no_op)
      flush_next_state = REQ;
    else 
      flush_next_state = IDLE;
  end
  REQ: begin
    if (l2c_flush_done_bank_0 & l2c_flush_done_bank_1)
      flush_next_state = DONE;
    else if (l2c_flush_done_bank_0)
      flush_next_state = WAIT_1;
    else if (l2c_flush_done_bank_1)
      flush_next_state = WAIT_0;
    else
      flush_next_state = REQ;
  end
  WAIT_1: begin
    if (l2c_flush_done_bank_1)
      flush_next_state = DONE;
    else
      flush_next_state = WAIT_1;
  end
  WAIT_0: begin
    if (l2c_flush_done_bank_0)
      flush_next_state = DONE;
    else
      flush_next_state = WAIT_0;
  end
  DONE: begin
    if (!sysio_l2c_flush_req)
      flush_next_state = IDLE;
    else
      flush_next_state = DONE;
  end
  default: flush_next_state = IDLE;
  endcase
// &CombEnd; @142
end

assign l2c_sysio_flush_done = flush_cur_state == DONE;
assign l2c_sysio_flush_idle = flush_cur_state == IDLE;
assign l2c_flush_req_bank_0 = flush_cur_state == REQ;
assign l2c_flush_req_bank_1 = flush_cur_state == REQ;

//==========================================================
// module instance
//==========================================================
// &ConnRule(s/_x$/_bank_0/); @152
// &Instance("ct_l2c_sub_bank","x_ct_l2c_sub_bank_0"); @153
ct_l2c_sub_bank  x_ct_l2c_sub_bank_0 (
  .ciu_l2c_addr_vld_x             (ciu_l2c_addr_vld_bank_0       ),
  .ciu_l2c_addr_x                 (ciu_l2c_addr_bank_0           ),
  .ciu_l2c_clr_cp_x               (ciu_l2c_clr_cp_bank_0         ),
  .ciu_l2c_ctcq_req_x             (ciu_l2c_ctcq_req_bank_0       ),
  .ciu_l2c_data_acc_cycle         (ciu_l2c_data_acc_cycle        ),
  .ciu_l2c_data_setup             (ciu_l2c_data_setup            ),
  .ciu_l2c_data_vld_x             (ciu_l2c_data_vld_bank_0       ),
  .ciu_l2c_dca_addr_x             (ciu_l2c_dca_addr_bank_0       ),
  .ciu_l2c_dca_req_x              (ciu_l2c_dca_req_bank_0        ),
  .ciu_l2c_hpcp_bus_x             (ciu_l2c_hpcp_bus_bank_0       ),
  .ciu_l2c_icc_mid_x              (ciu_l2c_icc_mid_bank_0        ),
  .ciu_l2c_icc_type_x             (ciu_l2c_icc_type_bank_0       ),
  .ciu_l2c_mid_x                  (ciu_l2c_mid_bank_0            ),
  .ciu_l2c_rdl_ready_x            (ciu_l2c_rdl_ready_bank_0      ),
  .ciu_l2c_rst_req                (ciu_l2c_rst_req               ),
  .ciu_l2c_set_cp_x               (ciu_l2c_set_cp_bank_0         ),
  .ciu_l2c_sid_x                  (ciu_l2c_sid_bank_0            ),
  .ciu_l2c_snpl2_ready_x          (ciu_l2c_snpl2_ready_bank_0    ),
  .ciu_l2c_src_x                  (ciu_l2c_src_bank_0            ),
  .ciu_l2c_tag_acc_cycle          (ciu_l2c_tag_acc_cycle         ),
  .ciu_l2c_tag_setup              (ciu_l2c_tag_setup             ),
  .ciu_l2c_type_x                 (ciu_l2c_type_bank_0           ),
  .ciu_l2c_wdata_x                (ciu_l2c_wdata_bank_0          ),
  .cmp_pref_addr_x                (cmp_pref_addr_bank_0          ),
  .cmp_pref_cache_miss_x          (cmp_pref_cache_miss_bank_0    ),
  .cmp_pref_ifu_req_x             (cmp_pref_ifu_req_bank_0       ),
  .cmp_pref_read_x                (cmp_pref_read_bank_0          ),
  .cmp_pref_tlb_req_x             (cmp_pref_tlb_req_bank_0       ),
  .cmp_pref_vld_x                 (cmp_pref_vld_bank_0           ),
  .cpurst_b                       (cpurst_b                      ),
  .forever_cpuclk                 (ciu_top_clk                   ),
  .l2c_ciu_addr_ready_x           (l2c_ciu_addr_ready_bank_0     ),
  .l2c_ciu_cmplt_x                (l2c_ciu_cmplt_bank_0          ),
  .l2c_ciu_cp_x                   (l2c_ciu_cp_bank_0             ),
  .l2c_ciu_ctcq_cmplt_x           (l2c_ciu_ctcq_cmplt_bank_0     ),
  .l2c_ciu_ctcq_ready_x           (l2c_ciu_ctcq_ready_bank_0     ),
  .l2c_ciu_data_ready_gate_x      (l2c_ciu_data_ready_gate_bank_0),
  .l2c_ciu_data_ready_x           (l2c_ciu_data_ready_bank_0     ),
  .l2c_ciu_data_x                 (l2c_ciu_data_bank_0           ),
  .l2c_ciu_dca_cmplt_x            (l2c_ciu_dca_cmplt_bank_0      ),
  .l2c_ciu_dca_data_x             (l2c_ciu_dca_data_bank_0       ),
  .l2c_ciu_dca_ready_x            (l2c_ciu_dca_ready_bank_0      ),
  .l2c_ciu_hpcp_acc_inc_x         (l2c_ciu_hpcp_acc_inc_bank_0   ),
  .l2c_ciu_hpcp_mid_x             (l2c_ciu_hpcp_mid_bank_0       ),
  .l2c_ciu_hpcp_miss_inc_x        (l2c_ciu_hpcp_miss_inc_bank_0  ),
  .l2c_ciu_rdl_addr_x             (l2c_ciu_rdl_addr_bank_0       ),
  .l2c_ciu_rdl_dvld_x             (l2c_ciu_rdl_dvld_bank_0       ),
  .l2c_ciu_rdl_mid_x              (l2c_ciu_rdl_mid_bank_0        ),
  .l2c_ciu_rdl_prot_x             (l2c_ciu_rdl_prot_bank_0       ),
  .l2c_ciu_rdl_rvld_x             (l2c_ciu_rdl_rvld_bank_0       ),
  .l2c_ciu_resp_x                 (l2c_ciu_resp_bank_0           ),
  .l2c_ciu_sid_x                  (l2c_ciu_sid_bank_0            ),
  .l2c_ciu_snpl2_addr_x           (l2c_ciu_snpl2_addr_bank_0     ),
  .l2c_ciu_snpl2_ini_sid_x        (l2c_ciu_snpl2_ini_sid_bank_0  ),
  .l2c_ciu_snpl2_vld_x            (l2c_ciu_snpl2_vld_bank_0      ),
  .l2c_data_clk_x                 (l2c_data_clk_bank_0           ),
  .l2c_data_ram_clk_en_x          (l2c_data_ram_clk_en_bank_0    ),
  .l2c_dbg_info_x                 (l2c_dbg_info_bank_0           ),
  .l2c_flush_done_x               (l2c_flush_done_bank_0         ),
  .l2c_flush_req_x                (l2c_flush_req_bank_0          ),
  .l2c_icg_en                     (l2c_icg_en                    ),
  .l2c_no_op_x                    (l2c_no_op_bank_0              ),
  .l2c_tag_clk_x                  (l2c_tag_clk_bank_0            ),
  .l2c_tag_ram_clk_en_x           (l2c_tag_ram_clk_en_bank_0     ),
  .pad_yy_icg_scan_en             (pad_yy_icg_scan_en            )
);

// &Connect( @154
//   .forever_cpuclk       (ciu_top_clk              ) @155
// ); @156

// &ConnRule(s/_x$/_bank_1/); @158
// &Instance("ct_l2c_sub_bank","x_ct_l2c_sub_bank_1"); @159
ct_l2c_sub_bank  x_ct_l2c_sub_bank_1 (
  .ciu_l2c_addr_vld_x             (ciu_l2c_addr_vld_bank_1       ),
  .ciu_l2c_addr_x                 (ciu_l2c_addr_bank_1           ),
  .ciu_l2c_clr_cp_x               (ciu_l2c_clr_cp_bank_1         ),
  .ciu_l2c_ctcq_req_x             (ciu_l2c_ctcq_req_bank_1       ),
  .ciu_l2c_data_acc_cycle         (ciu_l2c_data_acc_cycle        ),
  .ciu_l2c_data_setup             (ciu_l2c_data_setup            ),
  .ciu_l2c_data_vld_x             (ciu_l2c_data_vld_bank_1       ),
  .ciu_l2c_dca_addr_x             (ciu_l2c_dca_addr_bank_1       ),
  .ciu_l2c_dca_req_x              (ciu_l2c_dca_req_bank_1        ),
  .ciu_l2c_hpcp_bus_x             (ciu_l2c_hpcp_bus_bank_1       ),
  .ciu_l2c_icc_mid_x              (ciu_l2c_icc_mid_bank_1        ),
  .ciu_l2c_icc_type_x             (ciu_l2c_icc_type_bank_1       ),
  .ciu_l2c_mid_x                  (ciu_l2c_mid_bank_1            ),
  .ciu_l2c_rdl_ready_x            (ciu_l2c_rdl_ready_bank_1      ),
  .ciu_l2c_rst_req                (ciu_l2c_rst_req               ),
  .ciu_l2c_set_cp_x               (ciu_l2c_set_cp_bank_1         ),
  .ciu_l2c_sid_x                  (ciu_l2c_sid_bank_1            ),
  .ciu_l2c_snpl2_ready_x          (ciu_l2c_snpl2_ready_bank_1    ),
  .ciu_l2c_src_x                  (ciu_l2c_src_bank_1            ),
  .ciu_l2c_tag_acc_cycle          (ciu_l2c_tag_acc_cycle         ),
  .ciu_l2c_tag_setup              (ciu_l2c_tag_setup             ),
  .ciu_l2c_type_x                 (ciu_l2c_type_bank_1           ),
  .ciu_l2c_wdata_x                (ciu_l2c_wdata_bank_1          ),
  .cmp_pref_addr_x                (cmp_pref_addr_bank_1          ),
  .cmp_pref_cache_miss_x          (cmp_pref_cache_miss_bank_1    ),
  .cmp_pref_ifu_req_x             (cmp_pref_ifu_req_bank_1       ),
  .cmp_pref_read_x                (cmp_pref_read_bank_1          ),
  .cmp_pref_tlb_req_x             (cmp_pref_tlb_req_bank_1       ),
  .cmp_pref_vld_x                 (cmp_pref_vld_bank_1           ),
  .cpurst_b                       (cpurst_b                      ),
  .forever_cpuclk                 (ciu_top_clk                   ),
  .l2c_ciu_addr_ready_x           (l2c_ciu_addr_ready_bank_1     ),
  .l2c_ciu_cmplt_x                (l2c_ciu_cmplt_bank_1          ),
  .l2c_ciu_cp_x                   (l2c_ciu_cp_bank_1             ),
  .l2c_ciu_ctcq_cmplt_x           (l2c_ciu_ctcq_cmplt_bank_1     ),
  .l2c_ciu_ctcq_ready_x           (l2c_ciu_ctcq_ready_bank_1     ),
  .l2c_ciu_data_ready_gate_x      (l2c_ciu_data_ready_gate_bank_1),
  .l2c_ciu_data_ready_x           (l2c_ciu_data_ready_bank_1     ),
  .l2c_ciu_data_x                 (l2c_ciu_data_bank_1           ),
  .l2c_ciu_dca_cmplt_x            (l2c_ciu_dca_cmplt_bank_1      ),
  .l2c_ciu_dca_data_x             (l2c_ciu_dca_data_bank_1       ),
  .l2c_ciu_dca_ready_x            (l2c_ciu_dca_ready_bank_1      ),
  .l2c_ciu_hpcp_acc_inc_x         (l2c_ciu_hpcp_acc_inc_bank_1   ),
  .l2c_ciu_hpcp_mid_x             (l2c_ciu_hpcp_mid_bank_1       ),
  .l2c_ciu_hpcp_miss_inc_x        (l2c_ciu_hpcp_miss_inc_bank_1  ),
  .l2c_ciu_rdl_addr_x             (l2c_ciu_rdl_addr_bank_1       ),
  .l2c_ciu_rdl_dvld_x             (l2c_ciu_rdl_dvld_bank_1       ),
  .l2c_ciu_rdl_mid_x              (l2c_ciu_rdl_mid_bank_1        ),
  .l2c_ciu_rdl_prot_x             (l2c_ciu_rdl_prot_bank_1       ),
  .l2c_ciu_rdl_rvld_x             (l2c_ciu_rdl_rvld_bank_1       ),
  .l2c_ciu_resp_x                 (l2c_ciu_resp_bank_1           ),
  .l2c_ciu_sid_x                  (l2c_ciu_sid_bank_1            ),
  .l2c_ciu_snpl2_addr_x           (l2c_ciu_snpl2_addr_bank_1     ),
  .l2c_ciu_snpl2_ini_sid_x        (l2c_ciu_snpl2_ini_sid_bank_1  ),
  .l2c_ciu_snpl2_vld_x            (l2c_ciu_snpl2_vld_bank_1      ),
  .l2c_data_clk_x                 (l2c_data_clk_bank_1           ),
  .l2c_data_ram_clk_en_x          (l2c_data_ram_clk_en_bank_1    ),
  .l2c_dbg_info_x                 (l2c_dbg_info_bank_1           ),
  .l2c_flush_done_x               (l2c_flush_done_bank_1         ),
  .l2c_flush_req_x                (l2c_flush_req_bank_1          ),
  .l2c_icg_en                     (l2c_icg_en                    ),
  .l2c_no_op_x                    (l2c_no_op_bank_1              ),
  .l2c_tag_clk_x                  (l2c_tag_clk_bank_1            ),
  .l2c_tag_ram_clk_en_x           (l2c_tag_ram_clk_en_bank_1     ),
  .pad_yy_icg_scan_en             (pad_yy_icg_scan_en            )
);

// &Connect( @160
//   .forever_cpuclk       (ciu_top_clk              ) @161
// ); @162

// &Instance("ct_l2c_prefetch","x_ct_l2c_prefetch"); @164
ct_l2c_prefetch  x_ct_l2c_prefetch (
  .ciu_l2c_iprf               (ciu_l2c_iprf              ),
  .ciu_l2c_prf_ready          (ciu_l2c_prf_ready         ),
  .ciu_l2c_tprf               (ciu_l2c_tprf              ),
  .cmp_pref_addr_bank_0       (cmp_pref_addr_bank_0      ),
  .cmp_pref_addr_bank_1       (cmp_pref_addr_bank_1      ),
  .cmp_pref_cache_miss_bank_0 (cmp_pref_cache_miss_bank_0),
  .cmp_pref_cache_miss_bank_1 (cmp_pref_cache_miss_bank_1),
  .cmp_pref_ifu_req_bank_0    (cmp_pref_ifu_req_bank_0   ),
  .cmp_pref_ifu_req_bank_1    (cmp_pref_ifu_req_bank_1   ),
  .cmp_pref_read_bank_0       (cmp_pref_read_bank_0      ),
  .cmp_pref_read_bank_1       (cmp_pref_read_bank_1      ),
  .cmp_pref_tlb_req_bank_0    (cmp_pref_tlb_req_bank_0   ),
  .cmp_pref_tlb_req_bank_1    (cmp_pref_tlb_req_bank_1   ),
  .cmp_pref_vld_bank_0        (cmp_pref_vld_bank_0       ),
  .cmp_pref_vld_bank_1        (cmp_pref_vld_bank_1       ),
  .cpurst_b                   (cpurst_b                  ),
  .forever_cpuclk             (ciu_top_clk               ),
  .l2c_ciu_prf_addr           (l2c_ciu_prf_addr          ),
  .l2c_ciu_prf_prot           (l2c_ciu_prf_prot          ),
  .l2c_ciu_prf_vld            (l2c_ciu_prf_vld           ),
  .l2c_icg_en                 (l2c_icg_en                ),
  .pad_yy_icg_scan_en         (pad_yy_icg_scan_en        ),
  .prf_idle                   (prf_idle                  )
);

// &Connect( @165
//   .forever_cpuclk       (ciu_top_clk              ) @166
// ); @167

//==========================================================
//debug information
//==========================================================

assign l2c_ciu_dbg_info[43:0] = {l2c_dbg_info_bank_1[21:0],l2c_dbg_info_bank_0[21:0]};


// &ModuleEnd; @196
endmodule



