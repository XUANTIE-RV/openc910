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
module ct_l2c_tag(
  ciu_l2c_addr_vld_x,
  ciu_l2c_addr_x,
  ciu_l2c_clr_cp_x,
  ciu_l2c_hpcp_bus_x,
  ciu_l2c_mid_x,
  ciu_l2c_set_cp_x,
  ciu_l2c_sid_x,
  ciu_l2c_src_x,
  ciu_l2c_tag_acc_cycle,
  ciu_l2c_tag_setup,
  ciu_l2c_type_x,
  cmp_dirty_cen,
  cmp_dirty_din,
  cmp_dirty_gwen,
  cmp_dirty_way,
  cmp_dirty_wen,
  cmp_refill_ptr,
  cmp_req_vld,
  cmp_stage_addr,
  cmp_stage_stall,
  cmp_stage_vld,
  cmp_stall_by_data,
  cmp_tag_cen,
  cmp_tag_gwen,
  cmp_tag_index,
  cmp_tag_wen,
  cmp_way_v_hit,
  cmp_way_vd_hit,
  cmp_way_vs_hit,
  cmp_way_vu_hit,
  cpurst_b,
  data_stage_index,
  data_stage_vld,
  forever_cpuclk,
  icc_dca_dirty_f,
  icc_dca_tag_f,
  icc_dca_way_sel,
  icc_dirty_cen,
  icc_dirty_gwen,
  icc_dirty_wen,
  icc_idle,
  icc_tag_cen,
  icc_tag_flop,
  icc_tag_gwen,
  icc_tag_index,
  icc_tag_req,
  l2c_ciu_addr_ready_x,
  l2c_dirty_din,
  l2c_dirty_dout,
  l2c_dirty_gwen,
  l2c_dirty_ram_cen,
  l2c_dirty_wen,
  l2c_icg_en,
  l2c_tag_din,
  l2c_tag_dirty_fatal_err,
  l2c_tag_dout,
  l2c_tag_gwen,
  l2c_tag_index,
  l2c_tag_ram_cen,
  l2c_tag_ram_clk_en_x,
  l2c_tag_wen,
  l2c_way0_cp_dout,
  l2c_way0_dirty_dout,
  l2c_way0_tag_dout,
  l2c_way10_cp_dout,
  l2c_way10_dirty_dout,
  l2c_way10_tag_dout,
  l2c_way11_cp_dout,
  l2c_way11_dirty_dout,
  l2c_way11_tag_dout,
  l2c_way12_cp_dout,
  l2c_way12_dirty_dout,
  l2c_way12_tag_dout,
  l2c_way13_cp_dout,
  l2c_way13_dirty_dout,
  l2c_way13_tag_dout,
  l2c_way14_cp_dout,
  l2c_way14_dirty_dout,
  l2c_way14_tag_dout,
  l2c_way15_cp_dout,
  l2c_way15_dirty_dout,
  l2c_way15_tag_dout,
  l2c_way1_cp_dout,
  l2c_way1_dirty_dout,
  l2c_way1_tag_dout,
  l2c_way2_cp_dout,
  l2c_way2_dirty_dout,
  l2c_way2_tag_dout,
  l2c_way3_cp_dout,
  l2c_way3_dirty_dout,
  l2c_way3_tag_dout,
  l2c_way4_cp_dout,
  l2c_way4_dirty_dout,
  l2c_way4_tag_dout,
  l2c_way5_cp_dout,
  l2c_way5_dirty_dout,
  l2c_way5_tag_dout,
  l2c_way6_cp_dout,
  l2c_way6_dirty_dout,
  l2c_way6_tag_dout,
  l2c_way7_cp_dout,
  l2c_way7_dirty_dout,
  l2c_way7_tag_dout,
  l2c_way8_cp_dout,
  l2c_way8_dirty_dout,
  l2c_way8_tag_dout,
  l2c_way9_cp_dout,
  l2c_way9_dirty_dout,
  l2c_way9_tag_dout,
  l2c_way_dirty,
  l2c_way_fifo,
  l2c_way_vld,
  pad_yy_icg_scan_en,
  tag_acc_cnt_zero,
  tag_icc_grant,
  tag_stage_vld,
  tag_xx_idle,
  tag_yy_ram_idle,
  ttecc_flop_vld,
  ttecc_stage_addr,
  ttecc_stage_clrcp,
  ttecc_stage_fatal_err,
  ttecc_stage_hpcp_bus,
  ttecc_stage_mid,
  ttecc_stage_setcp,
  ttecc_stage_sid,
  ttecc_stage_src,
  ttecc_stage_type,
  ttecc_stage_write_raw,
  wb_dirty_cen,
  wb_dirty_gwen,
  wb_dirty_way,
  wb_dirty_wen,
  wb_ecc_rfifo_empty,
  wb_tag_cen,
  wb_tag_gwen,
  wb_tag_index,
  wb_tag_req
);

// &Ports; @23
input            ciu_l2c_addr_vld_x;            
input   [32 :0]  ciu_l2c_addr_x;                
input   [3  :0]  ciu_l2c_clr_cp_x;              
input   [2  :0]  ciu_l2c_hpcp_bus_x;            
input   [2  :0]  ciu_l2c_mid_x;                 
input   [3  :0]  ciu_l2c_set_cp_x;              
input   [4  :0]  ciu_l2c_sid_x;                 
input   [1  :0]  ciu_l2c_src_x;                 
input   [2  :0]  ciu_l2c_tag_acc_cycle;         
input            ciu_l2c_tag_setup;             
input   [12 :0]  ciu_l2c_type_x;                
input            cmp_dirty_cen;                 
input   [143:0]  cmp_dirty_din;                 
input            cmp_dirty_gwen;                
input   [15 :0]  cmp_dirty_way;                 
input   [8  :0]  cmp_dirty_wen;                 
input            cmp_req_vld;                   
input   [32 :0]  cmp_stage_addr;                
input            cmp_stage_stall;               
input            cmp_stage_vld;                 
input            cmp_stall_by_data;             
input            cmp_tag_cen;                   
input            cmp_tag_gwen;                  
input   [8  :0]  cmp_tag_index;                 
input   [15 :0]  cmp_tag_wen;                   
input            cpurst_b;                      
input   [6  :0]  data_stage_index;              
input            data_stage_vld;                
input            forever_cpuclk;                
input   [15 :0]  icc_dca_way_sel;               
input            icc_dirty_cen;                 
input            icc_dirty_gwen;                
input   [8  :0]  icc_dirty_wen;                 
input            icc_idle;                      
input            icc_tag_cen;                   
input            icc_tag_flop;                  
input            icc_tag_gwen;                  
input   [8  :0]  icc_tag_index;                 
input            icc_tag_req;                   
input   [143:0]  l2c_dirty_dout;                
input            l2c_icg_en;                    
input   [383:0]  l2c_tag_dout;                  
input            pad_yy_icg_scan_en;            
input            wb_dirty_cen;                  
input            wb_dirty_gwen;                 
input   [15 :0]  wb_dirty_way;                  
input   [8  :0]  wb_dirty_wen;                  
input            wb_ecc_rfifo_empty;            
input            wb_tag_cen;                    
input            wb_tag_gwen;                   
input   [8  :0]  wb_tag_index;                  
input            wb_tag_req;                    
output  [15 :0]  cmp_refill_ptr;                
output  [15 :0]  cmp_way_v_hit;                 
output  [15 :0]  cmp_way_vd_hit;                
output  [15 :0]  cmp_way_vs_hit;                
output  [15 :0]  cmp_way_vu_hit;                
output  [7  :0]  icc_dca_dirty_f;               
output  [23 :0]  icc_dca_tag_f;                 
output           l2c_ciu_addr_ready_x;          
output  [143:0]  l2c_dirty_din;                 
output           l2c_dirty_gwen;                
output           l2c_dirty_ram_cen;             
output  [143:0]  l2c_dirty_wen;                 
output  [383:0]  l2c_tag_din;                   
output  [15 :0]  l2c_tag_dirty_fatal_err;       
output           l2c_tag_gwen;                  
output  [8  :0]  l2c_tag_index;                 
output           l2c_tag_ram_cen;               
output           l2c_tag_ram_clk_en_x;          
output  [383:0]  l2c_tag_wen;                   
output  [3  :0]  l2c_way0_cp_dout;              
output  [7  :0]  l2c_way0_dirty_dout;           
output  [23 :0]  l2c_way0_tag_dout;             
output  [3  :0]  l2c_way10_cp_dout;             
output  [7  :0]  l2c_way10_dirty_dout;          
output  [23 :0]  l2c_way10_tag_dout;            
output  [3  :0]  l2c_way11_cp_dout;             
output  [7  :0]  l2c_way11_dirty_dout;          
output  [23 :0]  l2c_way11_tag_dout;            
output  [3  :0]  l2c_way12_cp_dout;             
output  [7  :0]  l2c_way12_dirty_dout;          
output  [23 :0]  l2c_way12_tag_dout;            
output  [3  :0]  l2c_way13_cp_dout;             
output  [7  :0]  l2c_way13_dirty_dout;          
output  [23 :0]  l2c_way13_tag_dout;            
output  [3  :0]  l2c_way14_cp_dout;             
output  [7  :0]  l2c_way14_dirty_dout;          
output  [23 :0]  l2c_way14_tag_dout;            
output  [3  :0]  l2c_way15_cp_dout;             
output  [7  :0]  l2c_way15_dirty_dout;          
output  [23 :0]  l2c_way15_tag_dout;            
output  [3  :0]  l2c_way1_cp_dout;              
output  [7  :0]  l2c_way1_dirty_dout;           
output  [23 :0]  l2c_way1_tag_dout;             
output  [3  :0]  l2c_way2_cp_dout;              
output  [7  :0]  l2c_way2_dirty_dout;           
output  [23 :0]  l2c_way2_tag_dout;             
output  [3  :0]  l2c_way3_cp_dout;              
output  [7  :0]  l2c_way3_dirty_dout;           
output  [23 :0]  l2c_way3_tag_dout;             
output  [3  :0]  l2c_way4_cp_dout;              
output  [7  :0]  l2c_way4_dirty_dout;           
output  [23 :0]  l2c_way4_tag_dout;             
output  [3  :0]  l2c_way5_cp_dout;              
output  [7  :0]  l2c_way5_dirty_dout;           
output  [23 :0]  l2c_way5_tag_dout;             
output  [3  :0]  l2c_way6_cp_dout;              
output  [7  :0]  l2c_way6_dirty_dout;           
output  [23 :0]  l2c_way6_tag_dout;             
output  [3  :0]  l2c_way7_cp_dout;              
output  [7  :0]  l2c_way7_dirty_dout;           
output  [23 :0]  l2c_way7_tag_dout;             
output  [3  :0]  l2c_way8_cp_dout;              
output  [7  :0]  l2c_way8_dirty_dout;           
output  [23 :0]  l2c_way8_tag_dout;             
output  [3  :0]  l2c_way9_cp_dout;              
output  [7  :0]  l2c_way9_dirty_dout;           
output  [23 :0]  l2c_way9_tag_dout;             
output  [15 :0]  l2c_way_dirty;                 
output  [15 :0]  l2c_way_fifo;                  
output  [15 :0]  l2c_way_vld;                   
output           tag_acc_cnt_zero;              
output           tag_icc_grant;                 
output           tag_stage_vld;                 
output           tag_xx_idle;                   
output           tag_yy_ram_idle;               
output           ttecc_flop_vld;                
output  [32 :0]  ttecc_stage_addr;              
output  [3  :0]  ttecc_stage_clrcp;             
output           ttecc_stage_fatal_err;         
output  [2  :0]  ttecc_stage_hpcp_bus;          
output  [2  :0]  ttecc_stage_mid;               
output  [3  :0]  ttecc_stage_setcp;             
output  [4  :0]  ttecc_stage_sid;               
output  [1  :0]  ttecc_stage_src;               
output  [12 :0]  ttecc_stage_type;              
output           ttecc_stage_write_raw;         

// &Regs; @24
reg     [15 :0]  cmp_refill_ptr;                
reg     [15 :0]  cmp_way_v_hit;                 
reg     [15 :0]  cmp_way_vd_hit;                
reg     [15 :0]  cmp_way_vs_hit;                
reg     [15 :0]  cmp_way_vu_hit;                
reg              l2c_dirty_cen_flop;            
reg     [143:0]  l2c_dirty_din;                 
reg     [143:0]  l2c_dirty_din_flop;            
reg     [79 :0]  l2c_dirty_dout_flop;           
reg              l2c_dirty_gwen;                
reg              l2c_dirty_gwen_flop;           
reg              l2c_dirty_ram_cen;             
reg              l2c_dirty_ram_cen_gate;        
reg     [143:0]  l2c_dirty_wen;                 
reg     [143:0]  l2c_dirty_wen_flop;            
reg              l2c_tag_cen_flop;              
reg     [63 :0]  l2c_tag_cp_dout_flop;          
reg     [383:0]  l2c_tag_din;                   
reg     [383:0]  l2c_tag_din_flop;              
reg              l2c_tag_gwen;                  
reg              l2c_tag_gwen_flop;             
reg     [8  :0]  l2c_tag_index;                 
reg     [8  :0]  l2c_tag_index_flop;            
reg              l2c_tag_ram_cen;               
reg              l2c_tag_ram_cen_gate;          
reg     [383:0]  l2c_tag_wen;                   
reg     [383:0]  l2c_tag_wen_flop;              
reg     [23 :0]  l2c_way0_tag_dout;             
reg     [23 :0]  l2c_way10_tag_dout;            
reg     [23 :0]  l2c_way11_tag_dout;            
reg     [23 :0]  l2c_way12_tag_dout;            
reg     [23 :0]  l2c_way13_tag_dout;            
reg     [23 :0]  l2c_way14_tag_dout;            
reg     [23 :0]  l2c_way15_tag_dout;            
reg     [23 :0]  l2c_way1_tag_dout;             
reg     [23 :0]  l2c_way2_tag_dout;             
reg     [23 :0]  l2c_way3_tag_dout;             
reg     [23 :0]  l2c_way4_tag_dout;             
reg     [23 :0]  l2c_way5_tag_dout;             
reg     [23 :0]  l2c_way6_tag_dout;             
reg     [23 :0]  l2c_way7_tag_dout;             
reg     [23 :0]  l2c_way8_tag_dout;             
reg     [23 :0]  l2c_way9_tag_dout;             
reg     [15 :0]  l2c_way_fifo;                  
reg     [2  :0]  tag_acc_cnt;                   
reg     [1  :0]  tag_ram_next_state;            
reg     [1  :0]  tag_ram_state;                 
reg     [15 :0]  tag_refill_ptr;                
reg     [32 :0]  tag_stage_addr;                
reg     [3  :0]  tag_stage_clrcp;               
reg     [2  :0]  tag_stage_hpcp_bus;            
reg     [2  :0]  tag_stage_mid;                 
reg     [3  :0]  tag_stage_setcp;               
reg     [4  :0]  tag_stage_sid;                 
reg     [1  :0]  tag_stage_src;                 
reg     [12 :0]  tag_stage_type;                
reg              tag_stage_vld;                 
reg     [15 :0]  way_fifo_pend_inv;             

// &Wires; @25
wire             ciu_l2c_addr_vld_x;            
wire    [32 :0]  ciu_l2c_addr_x;                
wire    [3  :0]  ciu_l2c_clr_cp_x;              
wire    [2  :0]  ciu_l2c_hpcp_bus_x;            
wire    [2  :0]  ciu_l2c_mid_x;                 
wire    [3  :0]  ciu_l2c_set_cp_x;              
wire    [4  :0]  ciu_l2c_sid_x;                 
wire    [1  :0]  ciu_l2c_src_x;                 
wire    [2  :0]  ciu_l2c_tag_acc_cycle;         
wire             ciu_l2c_tag_setup;             
wire    [12 :0]  ciu_l2c_type_x;                
wire             ciu_req_dp_vld;                
wire             ciu_req_vld;                   
wire             cmp_addr_hit;                  
wire             cmp_dirty_cen;                 
wire    [143:0]  cmp_dirty_din;                 
wire             cmp_dirty_gwen;                
wire    [15 :0]  cmp_dirty_way;                 
wire    [8  :0]  cmp_dirty_wen;                 
wire    [15 :0]  cmp_icc_wb_dirty_way;          
wire    [8  :0]  cmp_icc_wb_dirty_wen;          
wire    [15 :0]  cmp_icc_wb_tag_way;            
wire             cmp_info_clk;                  
wire             cmp_info_clk_en;               
wire             cmp_req_vld;                   
wire    [32 :0]  cmp_stage_addr;                
wire             cmp_stage_stall;               
wire             cmp_stage_vld;                 
wire             cmp_stall_by_data;             
wire             cmp_tag_cen;                   
wire             cmp_tag_gwen;                  
wire    [8  :0]  cmp_tag_index;                 
wire             cmp_tag_req;                   
wire    [15 :0]  cmp_tag_wen;                   
wire             cpurst_b;                      
wire             data_addr_hit;                 
wire    [6  :0]  data_stage_index;              
wire             data_stage_vld;                
wire    [15 :0]  fifo_dout_after_correct;       
wire             fifo_way_pend_vld;             
wire             forever_cpuclk;                
wire    [7  :0]  icc_dca_dirty_f;               
wire    [23 :0]  icc_dca_tag_f;                 
wire    [15 :0]  icc_dca_way_sel;               
wire             icc_dirty_cen;                 
wire             icc_dirty_gwen;                
wire    [8  :0]  icc_dirty_wen;                 
wire             icc_idle;                      
wire             icc_tag_cen;                   
wire             icc_tag_flop;                  
wire             icc_tag_gwen;                  
wire    [8  :0]  icc_tag_index;                 
wire             icc_tag_req;                   
wire    [15 :0]  icc_wb_dirty_way;              
wire    [8  :0]  icc_wb_dirty_wen;              
wire             icc_wb_req;                    
wire    [8  :0]  icc_wb_tag_index;              
wire    [15 :0]  icc_wb_tag_way;                
wire             l2c_ciu_addr_ready_x;          
wire             l2c_dirty_cen;                 
wire             l2c_dirty_cen_gate;            
wire             l2c_dirty_cen_pre;             
wire    [143:0]  l2c_dirty_din_pre;             
wire    [143:0]  l2c_dirty_dout;                
wire             l2c_dirty_gwen_pre;            
wire    [143:0]  l2c_dirty_wen_pre;             
wire             l2c_icg_en;                    
wire             l2c_index_flop_en;             
wire             l2c_tag_cen;                   
wire             l2c_tag_cen_gate;              
wire             l2c_tag_cen_pre;               
wire    [383:0]  l2c_tag_din_pre;               
wire    [15 :0]  l2c_tag_dirty_fatal_err;       
wire    [383:0]  l2c_tag_dout;                  
wire             l2c_tag_dp_clk;                
wire             l2c_tag_dp_clk_en;             
wire             l2c_tag_gwen_pre;              
wire    [8  :0]  l2c_tag_index_pre;             
wire             l2c_tag_ram_clk_en_x;          
wire    [383:0]  l2c_tag_wen_pre;               
wire    [3  :0]  l2c_way0_cp_dout;              
wire    [7  :0]  l2c_way0_dirty_dout;           
wire    [3  :0]  l2c_way10_cp_dout;             
wire    [7  :0]  l2c_way10_dirty_dout;          
wire    [3  :0]  l2c_way11_cp_dout;             
wire    [7  :0]  l2c_way11_dirty_dout;          
wire    [3  :0]  l2c_way12_cp_dout;             
wire    [7  :0]  l2c_way12_dirty_dout;          
wire    [3  :0]  l2c_way13_cp_dout;             
wire    [7  :0]  l2c_way13_dirty_dout;          
wire    [3  :0]  l2c_way14_cp_dout;             
wire    [7  :0]  l2c_way14_dirty_dout;          
wire    [3  :0]  l2c_way15_cp_dout;             
wire    [7  :0]  l2c_way15_dirty_dout;          
wire    [3  :0]  l2c_way1_cp_dout;              
wire    [7  :0]  l2c_way1_dirty_dout;           
wire    [3  :0]  l2c_way2_cp_dout;              
wire    [7  :0]  l2c_way2_dirty_dout;           
wire    [3  :0]  l2c_way3_cp_dout;              
wire    [7  :0]  l2c_way3_dirty_dout;           
wire    [3  :0]  l2c_way4_cp_dout;              
wire    [7  :0]  l2c_way4_dirty_dout;           
wire    [3  :0]  l2c_way5_cp_dout;              
wire    [7  :0]  l2c_way5_dirty_dout;           
wire    [3  :0]  l2c_way6_cp_dout;              
wire    [7  :0]  l2c_way6_dirty_dout;           
wire    [3  :0]  l2c_way7_cp_dout;              
wire    [7  :0]  l2c_way7_dirty_dout;           
wire    [3  :0]  l2c_way8_cp_dout;              
wire    [7  :0]  l2c_way8_dirty_dout;           
wire    [3  :0]  l2c_way9_cp_dout;              
wire    [7  :0]  l2c_way9_dirty_dout;           
wire    [15 :0]  l2c_way_dirty;                 
wire    [15 :0]  l2c_way_vld;                   
wire             next_stage_stall;              
wire             pad_yy_icg_scan_en;            
wire    [63 :0]  status_cp;                     
wire    [15 :0]  status_dirty;                  
wire    [15 :0]  status_fifo;                   
wire             status_flop_clk;               
wire             status_flop_clk_en;            
wire    [15 :0]  status_inv_pend;               
wire    [15 :0]  status_pend;                   
wire    [15 :0]  status_shared;                 
wire    [15 :0]  status_vld;                    
wire    [15 :0]  status_vld_dirty;              
wire    [15 :0]  status_vld_shared;             
wire    [15 :0]  status_vld_unique;             
wire             tag_acc_cnt_en;                
wire             tag_acc_cnt_init;              
wire             tag_acc_cnt_zero;              
wire             tag_addr_hit;                  
wire             tag_clk;                       
wire             tag_clk_en;                    
wire             tag_flop_clk;                  
wire             tag_flop_clk_en;               
wire             tag_icc_grant;                 
wire             tag_index_flop_clk;            
wire             tag_ram_idle;                  
wire             tag_req_vld;                   
wire             tag_req_vld_gate;              
wire    [15 :0]  tag_stage_addr_hit;            
wire             tag_stage_flop_clk;            
wire             tag_stage_flop_vld;            
wire             tag_stage_stall;               
wire    [15 :0]  tag_stage_v_hit;               
wire    [15 :0]  tag_stage_vd_hit;              
wire    [15 :0]  tag_stage_vs_hit;              
wire    [15 :0]  tag_stage_vu_hit;              
wire             tag_xx_idle;                   
wire             tag_yy_ram_idle;               
wire             tecc_addr_hit;                 
wire             tt_icc_tag_flop;               
wire             ttecc_flop;                    
wire             ttecc_flop_vld;                
wire    [32 :0]  ttecc_stage_addr;              
wire    [3  :0]  ttecc_stage_clrcp;             
wire             ttecc_stage_fatal_err;         
wire             ttecc_stage_flop_vld;          
wire    [2  :0]  ttecc_stage_hpcp_bus;          
wire    [2  :0]  ttecc_stage_mid;               
wire    [3  :0]  ttecc_stage_setcp;             
wire    [4  :0]  ttecc_stage_sid;               
wire    [1  :0]  ttecc_stage_src;               
wire    [12 :0]  ttecc_stage_type;              
wire             ttecc_stage_write_raw;         
wire    [7  :0]  way0_dirty_dout_after_correct; 
wire    [23 :0]  way0_tag_dout_after_correct;   
wire    [7  :0]  way10_dirty_dout_after_correct; 
wire    [23 :0]  way10_tag_dout_after_correct;  
wire    [7  :0]  way11_dirty_dout_after_correct; 
wire    [23 :0]  way11_tag_dout_after_correct;  
wire    [7  :0]  way12_dirty_dout_after_correct; 
wire    [23 :0]  way12_tag_dout_after_correct;  
wire    [7  :0]  way13_dirty_dout_after_correct; 
wire    [23 :0]  way13_tag_dout_after_correct;  
wire    [7  :0]  way14_dirty_dout_after_correct; 
wire    [23 :0]  way14_tag_dout_after_correct;  
wire    [7  :0]  way15_dirty_dout_after_correct; 
wire    [23 :0]  way15_tag_dout_after_correct;  
wire    [7  :0]  way1_dirty_dout_after_correct; 
wire    [23 :0]  way1_tag_dout_after_correct;   
wire    [7  :0]  way2_dirty_dout_after_correct; 
wire    [23 :0]  way2_tag_dout_after_correct;   
wire    [7  :0]  way3_dirty_dout_after_correct; 
wire    [23 :0]  way3_tag_dout_after_correct;   
wire    [7  :0]  way4_dirty_dout_after_correct; 
wire    [23 :0]  way4_tag_dout_after_correct;   
wire    [7  :0]  way5_dirty_dout_after_correct; 
wire    [23 :0]  way5_tag_dout_after_correct;   
wire    [7  :0]  way6_dirty_dout_after_correct; 
wire    [23 :0]  way6_tag_dout_after_correct;   
wire    [7  :0]  way7_dirty_dout_after_correct; 
wire    [23 :0]  way7_tag_dout_after_correct;   
wire    [7  :0]  way8_dirty_dout_after_correct; 
wire    [23 :0]  way8_tag_dout_after_correct;   
wire    [7  :0]  way9_dirty_dout_after_correct; 
wire    [23 :0]  way9_tag_dout_after_correct;   
wire    [15 :0]  way_fifo;                      
wire             wb_dirty_cen;                  
wire             wb_dirty_gwen;                 
wire    [15 :0]  wb_dirty_way;                  
wire    [8  :0]  wb_dirty_wen;                  
wire             wb_ecc_rfifo_empty;            
wire             wb_tag_cen;                    
wire             wb_tag_gwen;                   
wire    [8  :0]  wb_tag_index;                  
wire             wb_tag_req;                    


parameter TAG_INDEX_LENTH = `L2C_TAG_INDEX_WIDTH;
parameter TAG_TAG_LENTH   = `L2C_TAG_DATA_WIDTH;
parameter L2C_ADDRW = 33;

// &Force("output", "tag_stage_vld"); @31

//==============================================================================
//              interface with CIU
//==============================================================================

assign ciu_req_dp_vld = ciu_l2c_addr_vld_x & icc_idle & wb_ecc_rfifo_empty & !cmp_req_vld;
assign ciu_req_vld    = ciu_req_dp_vld &&
                       !tag_addr_hit && !cmp_addr_hit && !data_addr_hit && !tecc_addr_hit;

assign tag_addr_hit  = tag_stage_vld  && (ciu_l2c_addr_x[6:0] == tag_stage_addr[6:0]);
assign tecc_addr_hit = 1'b0;
assign cmp_addr_hit  = cmp_stage_vld  && (ciu_l2c_addr_x[6:0] == cmp_stage_addr[6:0]);
assign data_addr_hit = data_stage_vld && (ciu_l2c_addr_x[6:0] == data_stage_index[6:0]);

assign l2c_ciu_addr_ready_x = ciu_req_vld && !tag_stage_stall;

//==============================================================================
//                TAG and STATUS RAM arbitration
//==============================================================================

assign l2c_tag_cen   = (icc_tag_cen   | cmp_tag_cen   | ciu_req_vld | wb_tag_cen)   & !tag_stage_stall;
assign l2c_dirty_cen = (icc_dirty_cen | cmp_dirty_cen | ciu_req_vld | wb_dirty_cen) & !tag_stage_stall;
 
assign l2c_tag_cen_gate   = (icc_tag_cen   | cmp_tag_cen   | ciu_req_dp_vld | wb_tag_cen) & tag_ram_idle;
assign l2c_dirty_cen_gate = (icc_dirty_cen | cmp_dirty_cen | ciu_req_dp_vld | wb_dirty_cen) & tag_ram_idle;

assign l2c_tag_cen_pre        = ~l2c_tag_cen;
assign l2c_dirty_cen_pre      = ~l2c_dirty_cen;
//assign l2c_tag_cen_gate_pre   = ~l2c_tag_cen_gate;
//assign l2c_dirty_cen_gate_pre = ~l2c_dirty_cen_gate;

assign icc_wb_tag_index[TAG_INDEX_LENTH-1:0] = icc_tag_req 
                                             ? icc_tag_index[TAG_INDEX_LENTH-1:0] 
                                             : wb_tag_index[TAG_INDEX_LENTH-1:0];

assign l2c_tag_index_pre[TAG_INDEX_LENTH-1:0] = icc_wb_req 
                                              ? icc_wb_tag_index[TAG_INDEX_LENTH-1:0]
                                              : cmp_req_vld ? cmp_tag_index[TAG_INDEX_LENTH-1:0] 
                                                            : ciu_l2c_addr_x[TAG_INDEX_LENTH-1:0];

assign icc_wb_req = icc_tag_req || wb_tag_req;

assign l2c_tag_gwen_pre = ~(cmp_tag_gwen | wb_tag_gwen | icc_tag_gwen);
assign l2c_dirty_gwen_pre = ~(icc_dirty_gwen | wb_dirty_gwen | cmp_dirty_gwen);


assign icc_wb_tag_way[15:0] = icc_tag_req ? {16{1'b1}} : wb_dirty_way[15:0];
assign cmp_icc_wb_tag_way[15:0] = icc_wb_req ? icc_wb_tag_way[15:0] : cmp_tag_wen[15:0];

assign l2c_tag_wen_pre[16*TAG_TAG_LENTH-1:0] = ~{
                                    {TAG_TAG_LENTH{cmp_icc_wb_tag_way[15]}},
                                    {TAG_TAG_LENTH{cmp_icc_wb_tag_way[14]}},
                                    {TAG_TAG_LENTH{cmp_icc_wb_tag_way[13]}},
                                    {TAG_TAG_LENTH{cmp_icc_wb_tag_way[12]}},
                                    {TAG_TAG_LENTH{cmp_icc_wb_tag_way[11]}},
                                    {TAG_TAG_LENTH{cmp_icc_wb_tag_way[10]}},
                                    {TAG_TAG_LENTH{cmp_icc_wb_tag_way[9]}},
                                    {TAG_TAG_LENTH{cmp_icc_wb_tag_way[8]}},
                                    {TAG_TAG_LENTH{cmp_icc_wb_tag_way[7]}},
                                    {TAG_TAG_LENTH{cmp_icc_wb_tag_way[6]}},
                                    {TAG_TAG_LENTH{cmp_icc_wb_tag_way[5]}},
                                    {TAG_TAG_LENTH{cmp_icc_wb_tag_way[4]}},
                                    {TAG_TAG_LENTH{cmp_icc_wb_tag_way[3]}},
                                    {TAG_TAG_LENTH{cmp_icc_wb_tag_way[2]}},
                                    {TAG_TAG_LENTH{cmp_icc_wb_tag_way[1]}},
                                    {TAG_TAG_LENTH{cmp_icc_wb_tag_way[0]}}};

assign l2c_tag_din_pre[16*TAG_TAG_LENTH-1:0] = icc_wb_req 
                                             ? {(16*TAG_TAG_LENTH){1'b0}}
                                             : {16{cmp_stage_addr[L2C_ADDRW-1:L2C_ADDRW-TAG_TAG_LENTH]}};

//--------------------------------------
//    dirty wen and din
//--------------------------------------
assign icc_wb_dirty_way[15:0]     = icc_tag_req ? {16{1'b1}} : wb_dirty_way[15:0];
assign cmp_icc_wb_dirty_way[15:0] = icc_wb_req  ? icc_wb_dirty_way[15:0] : cmp_dirty_way[15:0];
assign icc_wb_dirty_wen[8:0]      = icc_tag_req ? icc_dirty_wen[8:0] : wb_dirty_wen[8:0];
assign cmp_icc_wb_dirty_wen[8:0]  = icc_wb_req  ? icc_wb_dirty_wen[8:0] : cmp_dirty_wen[8:0];

assign l2c_dirty_wen_pre[143:128] =~{16{cmp_icc_wb_dirty_wen[8]}};
assign l2c_dirty_wen_pre[127:0]   =~(
                                   {{8{cmp_icc_wb_dirty_way[15]}},
                                    {8{cmp_icc_wb_dirty_way[14]}},
                                    {8{cmp_icc_wb_dirty_way[13]}},
                                    {8{cmp_icc_wb_dirty_way[12]}},
                                    {8{cmp_icc_wb_dirty_way[11]}},
                                    {8{cmp_icc_wb_dirty_way[10]}},
                                    {8{cmp_icc_wb_dirty_way[9]}} ,
                                    {8{cmp_icc_wb_dirty_way[8]}} ,
                                    {8{cmp_icc_wb_dirty_way[7]}} ,
                                    {8{cmp_icc_wb_dirty_way[6]}} ,
                                    {8{cmp_icc_wb_dirty_way[5]}} ,
                                    {8{cmp_icc_wb_dirty_way[4]}} ,
                                    {8{cmp_icc_wb_dirty_way[3]}} ,
                                    {8{cmp_icc_wb_dirty_way[2]}} ,
                                    {8{cmp_icc_wb_dirty_way[1]}} ,
                                    {8{cmp_icc_wb_dirty_way[0]}}} & {16{cmp_icc_wb_dirty_wen[7:0]}});

assign l2c_dirty_din_pre[143:0] = icc_wb_req  ? {16'b1,128'b0} : cmp_dirty_din[143:0];
//================================================
//   flop tag and dirty input port when setup is 1
//================================================
assign l2c_index_flop_en = (l2c_dirty_cen_gate || l2c_tag_cen_gate) && ciu_l2c_tag_setup;
// &Instance("gated_clk_cell", "x_l2c_tag_index_gated_clk"); @190
gated_clk_cell  x_l2c_tag_index_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (tag_index_flop_clk),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (l2c_index_flop_en ),
  .module_en          (l2c_icg_en        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in        (forever_cpuclk     ), @191
//          .external_en   (1'b0               ), @192
//          .global_en     (1'b1               ), @193
//          .module_en (l2c_icg_en     ), @194
//          .local_en      (l2c_index_flop_en  ), @195
//          .clk_out       (tag_index_flop_clk ) @196
//         ); @197

assign tag_flop_clk_en = l2c_tag_cen_gate && ciu_l2c_tag_setup;
// &Instance("gated_clk_cell", "x_l2c_tag_flop_gated_clk"); @200
gated_clk_cell  x_l2c_tag_flop_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (tag_flop_clk      ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (tag_flop_clk_en   ),
  .module_en          (l2c_icg_en        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in        (forever_cpuclk     ), @201
//          .external_en   (1'b0               ), @202
//          .global_en     (1'b1               ), @203
//          .module_en (l2c_icg_en     ), @204
//          .local_en      (tag_flop_clk_en    ), @205
//          .clk_out       (tag_flop_clk       ) @206
//         ); @207

assign status_flop_clk_en = l2c_dirty_cen_gate && ciu_l2c_tag_setup;
// &Instance("gated_clk_cell", "x_l2c_status_flop_gated_clk"); @210
gated_clk_cell  x_l2c_status_flop_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (status_flop_clk   ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (status_flop_clk_en),
  .module_en          (l2c_icg_en        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in        (forever_cpuclk     ), @211
//          .external_en   (1'b0               ), @212
//          .global_en     (1'b1               ), @213
//          .module_en (l2c_icg_en     ), @214
//          .local_en      (status_flop_clk_en ), @215
//          .clk_out       (status_flop_clk    ) @216
//         ); @217

always@(posedge tag_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    l2c_tag_cen_flop                    <= 1'b0;
  else if(l2c_tag_cen && ciu_l2c_tag_setup)
    l2c_tag_cen_flop                    <= 1'b1;
  else
    l2c_tag_cen_flop                    <= 1'b0;
end

always@(posedge tag_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    l2c_dirty_cen_flop     <= 1'b0;
  else if(l2c_dirty_cen && ciu_l2c_tag_setup)
    l2c_dirty_cen_flop     <= 1'b1;
  else
    l2c_dirty_cen_flop     <= 1'b0;
end

always@(posedge tag_index_flop_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    l2c_tag_index_flop[TAG_INDEX_LENTH-1:0] <= {TAG_INDEX_LENTH{1'b0}};
  else if(l2c_index_flop_en)
    l2c_tag_index_flop[TAG_INDEX_LENTH-1:0] <= l2c_tag_index_pre[TAG_INDEX_LENTH-1:0];
  else
    l2c_tag_index_flop[TAG_INDEX_LENTH-1:0] <= l2c_tag_index_flop[TAG_INDEX_LENTH-1:0];
end

// &CombBeg; @282
// &CombEnd; @311

always@(posedge tag_flop_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
  begin
    l2c_tag_din_flop[16*TAG_TAG_LENTH-1:0] <= {(16*TAG_TAG_LENTH){1'b0}};
    l2c_tag_wen_flop[16*TAG_TAG_LENTH-1:0] <= {(16*TAG_TAG_LENTH){1'b0}};
    l2c_tag_gwen_flop                      <= 1'b0;
  end
  else if(!l2c_tag_cen_pre && ciu_l2c_tag_setup)
  begin
    l2c_tag_din_flop[16*TAG_TAG_LENTH-1:0] <= l2c_tag_din_pre[16*TAG_TAG_LENTH-1:0];
    l2c_tag_wen_flop[16*TAG_TAG_LENTH-1:0] <= l2c_tag_wen_pre[16*TAG_TAG_LENTH-1:0];
    l2c_tag_gwen_flop                      <= l2c_tag_gwen_pre;
  end
end

always@(posedge status_flop_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
  begin
    l2c_dirty_din_flop[143:0] <= 144'b0;
    l2c_dirty_wen_flop[143:0] <= 144'b0;
    l2c_dirty_gwen_flop       <=  1'b0;
  end
  else if(l2c_dirty_cen_gate && ciu_l2c_tag_setup)
  begin
    l2c_dirty_din_flop[143:0] <= l2c_dirty_din_pre[143:0];
    l2c_dirty_wen_flop[143:0] <= l2c_dirty_wen_pre[143:0];
    l2c_dirty_gwen_flop       <= l2c_dirty_gwen_pre     ;
  end
end

// &CombBeg; @347
always @( l2c_tag_cen_flop
       or l2c_tag_cen_pre
       or l2c_tag_index_pre[8:0]
       or l2c_dirty_wen_flop[143:0]
       or l2c_tag_din_flop[383:0]
       or l2c_dirty_cen_pre
       or l2c_tag_wen_pre[383:0]
       or l2c_dirty_cen_flop
       or l2c_dirty_din_pre[143:0]
       or l2c_tag_wen_flop[383:0]
       or l2c_dirty_wen_pre[143:0]
       or l2c_tag_index_flop[8:0]
       or l2c_dirty_gwen_flop
       or l2c_dirty_gwen_pre
       or l2c_tag_gwen_flop
       or l2c_dirty_din_flop[143:0]
       or l2c_tag_din_pre[383:0]
       or ciu_l2c_tag_setup
       or l2c_tag_gwen_pre)
begin
if(ciu_l2c_tag_setup)
begin
  l2c_tag_index[TAG_INDEX_LENTH-1:0]  = l2c_tag_index_flop[TAG_INDEX_LENTH-1:0];
  l2c_dirty_ram_cen                   = !l2c_dirty_cen_flop;
  l2c_dirty_ram_cen_gate              = !l2c_dirty_cen_flop;
  l2c_dirty_din[143:0]                = l2c_dirty_din_flop[143:0];
  l2c_dirty_wen[143:0]                = l2c_dirty_wen_flop[143:0];
  l2c_dirty_gwen                      = l2c_dirty_gwen_flop;
  l2c_tag_ram_cen                     = !l2c_tag_cen_flop;
  l2c_tag_ram_cen_gate                = !l2c_tag_cen_flop;
  l2c_tag_din[16*TAG_TAG_LENTH-1:0]   = l2c_tag_din_flop[16*TAG_TAG_LENTH-1:0];
  l2c_tag_wen[16*TAG_TAG_LENTH-1:0]   = l2c_tag_wen_flop[16*TAG_TAG_LENTH-1:0];
  l2c_tag_gwen                        = l2c_tag_gwen_flop;
end
else
begin
  l2c_tag_index[TAG_INDEX_LENTH-1:0]  = l2c_tag_index_pre[TAG_INDEX_LENTH-1:0];
  l2c_dirty_ram_cen                   = l2c_dirty_cen_pre;
  l2c_dirty_ram_cen_gate              = l2c_dirty_cen_pre;
  l2c_dirty_din[143:0]                = l2c_dirty_din_pre[143:0];
  l2c_dirty_wen[143:0]                = l2c_dirty_wen_pre[143:0];
  l2c_dirty_gwen                      = l2c_dirty_gwen_pre;
  l2c_tag_ram_cen                     = l2c_tag_cen_pre;
  l2c_tag_ram_cen_gate                = l2c_tag_cen_pre;
  l2c_tag_din[16*TAG_TAG_LENTH-1:0]   = l2c_tag_din_pre[16*TAG_TAG_LENTH-1:0];
  l2c_tag_wen[16*TAG_TAG_LENTH-1:0]   = l2c_tag_wen_pre[16*TAG_TAG_LENTH-1:0];
  l2c_tag_gwen                        = l2c_tag_gwen_pre;
end
// &CombEnd; @376
end

// &Force("nonport", "l2c_tag_src"); @380

assign l2c_tag_ram_clk_en_x = ~l2c_tag_ram_cen_gate | ~l2c_dirty_ram_cen_gate;

//==============================================================================
//                   control signals for TAG array
//==============================================================================
parameter TAG_IDLE = 2'b01;
parameter TAG_BUSY = 2'b10;

assign tag_clk_en   = tag_req_vld_gate | (tag_ram_state != TAG_IDLE);

// &Instance("gated_clk_cell", "x_l2c_tag_gated_clk"); @398
gated_clk_cell  x_l2c_tag_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (tag_clk           ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (tag_clk_en        ),
  .module_en          (l2c_icg_en        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in        (forever_cpuclk     ), @399
//          .external_en   (1'b0               ), @400
//          .global_en     (1'b1               ), @401
//          .module_en (l2c_icg_en     ), @402
//          .local_en      (tag_clk_en         ), @403
//          .clk_out       (tag_clk            ) @404
//         ); @405

//-----------------------------------------
//  TAG RAM STATE
//-----------------------------------------
assign cmp_tag_req       = cmp_req_vld & !cmp_stall_by_data;
assign tag_req_vld       = icc_tag_req | cmp_tag_req | ciu_req_vld | wb_tag_req;
assign tag_req_vld_gate  = icc_tag_req | cmp_req_vld | ciu_req_dp_vld | wb_tag_req;

always@(posedge tag_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    tag_ram_state[1:0] <= TAG_IDLE;
  else
    tag_ram_state[1:0] <= tag_ram_next_state[1:0];
end

// &CombBeg; @422
always @( tag_acc_cnt_zero
       or next_stage_stall
       or tag_ram_state
       or tag_req_vld)
begin
  tag_ram_next_state = TAG_IDLE;
  case(tag_ram_state)
    TAG_IDLE:
    begin
      if(tag_req_vld)
        tag_ram_next_state = TAG_BUSY;
      else
        tag_ram_next_state = TAG_IDLE;
    end
    TAG_BUSY:
    begin
      if (tag_acc_cnt_zero) begin
        if (!next_stage_stall & !tag_req_vld)
          tag_ram_next_state = TAG_IDLE;
        else
          tag_ram_next_state = TAG_BUSY;
      end
      else
        tag_ram_next_state = TAG_BUSY;
    end
    default: tag_ram_next_state = TAG_IDLE;
  endcase
// &CombEnd; @445
end

//output
assign tag_ram_idle    = (tag_ram_state == TAG_IDLE) | 
                         (tag_ram_state == TAG_BUSY) & tag_acc_cnt_zero;
assign tag_xx_idle     = tag_ram_state == TAG_IDLE;
assign tag_stage_stall = (tag_ram_state == TAG_BUSY) & (!tag_acc_cnt_zero | next_stage_stall);

assign tag_stage_flop_vld  = tag_stage_vld & tag_acc_cnt_zero; //tag_ram_idle & (icc_tag_flop | tag_stage_vld);
//assign tag_stage_flop_gate = tag_ram_idle_gate & (icc_tag_flop | tag_stage_vld);

assign tag_icc_grant = tag_ram_idle;

// &Force("output","tag_acc_cnt_zero"); @461
//-------------------------------------
//   tag acc ant
//-------------------------------------
assign tag_acc_cnt_init = !tag_stage_stall & tag_req_vld;
assign tag_acc_cnt_en   = (tag_ram_state == TAG_BUSY) && !tag_acc_cnt_zero;

always@(posedge tag_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    tag_acc_cnt[2:0] <= 3'b0;
  else if(tag_acc_cnt_init)
    tag_acc_cnt[2:0] <= ciu_l2c_tag_acc_cycle[2:0];
  else if(tag_acc_cnt_en)
    tag_acc_cnt[2:0] <= tag_acc_cnt[2:0] - 3'b1;
end

assign tag_acc_cnt_zero = tag_acc_cnt[2:0] == 3'b0;

assign tag_yy_ram_idle      = tag_ram_idle;
//assign tag_yy_flop_vld      = tag_stage_flop_vld & tag_stage_vld;
//assign tag_yy_flop_vld_gate = tag_stage_flop_gate & tag_stage_vld;

//==============================================================================
//                               TAG STAGE
//==============================================================================
assign l2c_tag_dp_clk_en = ciu_req_dp_vld && tag_ram_idle;

// &Instance("gated_clk_cell", "x_l2c_tag_dp_gated_clk"); @489
gated_clk_cell  x_l2c_tag_dp_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (l2c_tag_dp_clk    ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (l2c_tag_dp_clk_en ),
  .module_en          (l2c_icg_en        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in        (forever_cpuclk     ), @490
//          .external_en   (1'b0               ), @491
//          .global_en     (1'b1               ), @492
//          .module_en (l2c_icg_en     ), @493
//          .local_en      (l2c_tag_dp_clk_en  ), @494
//          .clk_out       (l2c_tag_dp_clk     ) @495
//         ); @496

always@(posedge tag_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    tag_stage_vld <= 1'b0;
  else if(!tag_stage_stall)
    tag_stage_vld <= ciu_req_vld;
  else
    tag_stage_vld <= tag_stage_vld;
end

always@(posedge l2c_tag_dp_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
  begin
    tag_stage_addr[L2C_ADDRW-1:0] <= {L2C_ADDRW{1'b0}};
    tag_stage_sid[4:0]            <= 5'b0;
    tag_stage_type[12:0]          <= 13'b0; 
    tag_stage_src[1:0]            <= 2'b0;
    tag_stage_clrcp[3:0]          <= 4'b0;
    tag_stage_setcp[3:0]          <= 4'b0;
    tag_stage_hpcp_bus[2:0]       <= 3'b0;
    tag_stage_mid[2:0]            <= 3'b0;
  end
  else if(ciu_req_dp_vld && !tag_stage_stall)
  begin
    tag_stage_addr[L2C_ADDRW-1:0] <= ciu_l2c_addr_x[L2C_ADDRW-1:0];
    tag_stage_sid[4:0]            <= ciu_l2c_sid_x[4:0];
    tag_stage_type[12:0]          <= ciu_l2c_type_x[12:0];
    tag_stage_src[1:0]            <= ciu_l2c_src_x[1:0];
    tag_stage_clrcp[3:0]          <= ciu_l2c_clr_cp_x[3:0];
    tag_stage_setcp[3:0]          <= ciu_l2c_set_cp_x[3:0];
    tag_stage_hpcp_bus[2:0]       <= ciu_l2c_hpcp_bus_x[2:0];
    tag_stage_mid[2:0]            <= ciu_l2c_mid_x[2:0];
  end
end

// &Force("output","ttecc_flop_vld"); @540
// &Force("output","ttecc_stage_addr"); @541

// &Force("output","tecc_stage_vld"); @544
assign ttecc_stage_addr[L2C_ADDRW-1:0] = tag_stage_addr[L2C_ADDRW-1:0];
assign ttecc_stage_sid[4:0]            = tag_stage_sid[4:0];
assign ttecc_stage_type[12:0]          = tag_stage_type[12:0];
assign ttecc_stage_src[1:0]            = tag_stage_src[1:0];
assign ttecc_stage_clrcp[3:0]          = tag_stage_clrcp[3:0];
assign ttecc_stage_setcp[3:0]          = tag_stage_setcp[3:0];
assign ttecc_stage_hpcp_bus[2:0]       = tag_stage_hpcp_bus[2:0];
assign ttecc_stage_mid[2:0]            = tag_stage_mid[2:0];
assign ttecc_flop_vld                  = tag_stage_flop_vld;
assign ttecc_stage_write_raw           = |tag_stage_type[8:5];
assign ttecc_stage_fatal_err           = 1'b0;
assign tt_icc_tag_flop                 = icc_tag_flop;

//--------------------------------------
//       TAG COMPARE
//--------------------------------------
assign tag_stage_addr_hit[0]  = (ttecc_stage_addr[L2C_ADDRW-1:L2C_ADDRW-TAG_TAG_LENTH] == way0_tag_dout_after_correct[TAG_TAG_LENTH-1:0]);
assign tag_stage_addr_hit[1]  = (ttecc_stage_addr[L2C_ADDRW-1:L2C_ADDRW-TAG_TAG_LENTH] == way1_tag_dout_after_correct[TAG_TAG_LENTH-1:0]);
assign tag_stage_addr_hit[2]  = (ttecc_stage_addr[L2C_ADDRW-1:L2C_ADDRW-TAG_TAG_LENTH] == way2_tag_dout_after_correct[TAG_TAG_LENTH-1:0]);
assign tag_stage_addr_hit[3]  = (ttecc_stage_addr[L2C_ADDRW-1:L2C_ADDRW-TAG_TAG_LENTH] == way3_tag_dout_after_correct[TAG_TAG_LENTH-1:0]);
assign tag_stage_addr_hit[4]  = (ttecc_stage_addr[L2C_ADDRW-1:L2C_ADDRW-TAG_TAG_LENTH] == way4_tag_dout_after_correct[TAG_TAG_LENTH-1:0]);
assign tag_stage_addr_hit[5]  = (ttecc_stage_addr[L2C_ADDRW-1:L2C_ADDRW-TAG_TAG_LENTH] == way5_tag_dout_after_correct[TAG_TAG_LENTH-1:0]);
assign tag_stage_addr_hit[6]  = (ttecc_stage_addr[L2C_ADDRW-1:L2C_ADDRW-TAG_TAG_LENTH] == way6_tag_dout_after_correct[TAG_TAG_LENTH-1:0]);
assign tag_stage_addr_hit[7]  = (ttecc_stage_addr[L2C_ADDRW-1:L2C_ADDRW-TAG_TAG_LENTH] == way7_tag_dout_after_correct[TAG_TAG_LENTH-1:0]);
assign tag_stage_addr_hit[8]  = (ttecc_stage_addr[L2C_ADDRW-1:L2C_ADDRW-TAG_TAG_LENTH] == way8_tag_dout_after_correct[TAG_TAG_LENTH-1:0]);
assign tag_stage_addr_hit[9]  = (ttecc_stage_addr[L2C_ADDRW-1:L2C_ADDRW-TAG_TAG_LENTH] == way9_tag_dout_after_correct[TAG_TAG_LENTH-1:0]);
assign tag_stage_addr_hit[10] = (ttecc_stage_addr[L2C_ADDRW-1:L2C_ADDRW-TAG_TAG_LENTH] == way10_tag_dout_after_correct[TAG_TAG_LENTH-1:0]);
assign tag_stage_addr_hit[11] = (ttecc_stage_addr[L2C_ADDRW-1:L2C_ADDRW-TAG_TAG_LENTH] == way11_tag_dout_after_correct[TAG_TAG_LENTH-1:0]);
assign tag_stage_addr_hit[12] = (ttecc_stage_addr[L2C_ADDRW-1:L2C_ADDRW-TAG_TAG_LENTH] == way12_tag_dout_after_correct[TAG_TAG_LENTH-1:0]);
assign tag_stage_addr_hit[13] = (ttecc_stage_addr[L2C_ADDRW-1:L2C_ADDRW-TAG_TAG_LENTH] == way13_tag_dout_after_correct[TAG_TAG_LENTH-1:0]);
assign tag_stage_addr_hit[14] = (ttecc_stage_addr[L2C_ADDRW-1:L2C_ADDRW-TAG_TAG_LENTH] == way14_tag_dout_after_correct[TAG_TAG_LENTH-1:0]);
assign tag_stage_addr_hit[15] = (ttecc_stage_addr[L2C_ADDRW-1:L2C_ADDRW-TAG_TAG_LENTH] == way15_tag_dout_after_correct[TAG_TAG_LENTH-1:0]);

assign tag_stage_v_hit[7:0]  = tag_stage_addr_hit[7:0] & status_vld[7:0];
assign tag_stage_vs_hit[7:0] = tag_stage_addr_hit[7:0] & status_vld_shared[7:0];
assign tag_stage_vu_hit[7:0] = tag_stage_addr_hit[7:0] & status_vld_unique[7:0];
assign tag_stage_vd_hit[7:0] = tag_stage_addr_hit[7:0] & status_vld_dirty[7:0];
//assign tag_stage_vp_hit[7:0] = tag_stage_addr_hit[7:0] & status_vld_pend[7:0];
assign tag_stage_v_hit[15:8]  = tag_stage_addr_hit[15:8] & status_vld[15:8];
assign tag_stage_vs_hit[15:8] = tag_stage_addr_hit[15:8] & status_vld_shared[15:8];
assign tag_stage_vu_hit[15:8] = tag_stage_addr_hit[15:8] & status_vld_unique[15:8];
assign tag_stage_vd_hit[15:8] = tag_stage_addr_hit[15:8] & status_vld_dirty[15:8];
//assign tag_stage_vp_hit[15:8] = tag_stage_addr_hit[15:8] & status_vld_pend[15:8];

//--------------------------------------
//  DIRTY PACKAGE
//--------------------------------------
// &CombBeg; @690
// &CombEnd;  @703

assign status_cp[63:0]     = {way15_dirty_dout_after_correct[7:4], 
                              way14_dirty_dout_after_correct[7:4], 
                              way13_dirty_dout_after_correct[7:4], 
                              way12_dirty_dout_after_correct[7:4], 
                              way11_dirty_dout_after_correct[7:4], 
                              way10_dirty_dout_after_correct[7:4], 
                              way9_dirty_dout_after_correct[7:4],
                              way8_dirty_dout_after_correct[7:4],
                              way7_dirty_dout_after_correct[7:4],
                              way6_dirty_dout_after_correct[7:4],
                              way5_dirty_dout_after_correct[7:4],
                              way4_dirty_dout_after_correct[7:4],
                              way3_dirty_dout_after_correct[7:4],
                              way2_dirty_dout_after_correct[7:4],
                              way1_dirty_dout_after_correct[7:4],
                              way0_dirty_dout_after_correct[7:4]};

assign status_vld[15:0]    = {way15_dirty_dout_after_correct[3], 
                              way14_dirty_dout_after_correct[3], 
                              way13_dirty_dout_after_correct[3], 
                              way12_dirty_dout_after_correct[3], 
                              way11_dirty_dout_after_correct[3], 
                              way10_dirty_dout_after_correct[3], 
                              way9_dirty_dout_after_correct[3],
                              way8_dirty_dout_after_correct[3],
                              way7_dirty_dout_after_correct[3],
                              way6_dirty_dout_after_correct[3],
                              way5_dirty_dout_after_correct[3],
                              way4_dirty_dout_after_correct[3],
                              way3_dirty_dout_after_correct[3],
                              way2_dirty_dout_after_correct[3],
                              way1_dirty_dout_after_correct[3],
                              way0_dirty_dout_after_correct[3]};

assign status_shared[15:0] = {way15_dirty_dout_after_correct[2], 
                              way14_dirty_dout_after_correct[2], 
                              way13_dirty_dout_after_correct[2], 
                              way12_dirty_dout_after_correct[2], 
                              way11_dirty_dout_after_correct[2], 
                              way10_dirty_dout_after_correct[2], 
                              way9_dirty_dout_after_correct[2],
                              way8_dirty_dout_after_correct[2],
                              way7_dirty_dout_after_correct[2],
                              way6_dirty_dout_after_correct[2],
                              way5_dirty_dout_after_correct[2],
                              way4_dirty_dout_after_correct[2],
                              way3_dirty_dout_after_correct[2],
                              way2_dirty_dout_after_correct[2],
                              way1_dirty_dout_after_correct[2],
                              way0_dirty_dout_after_correct[2]};

assign status_dirty[15:0]  = {way15_dirty_dout_after_correct[1], 
                              way14_dirty_dout_after_correct[1], 
                              way13_dirty_dout_after_correct[1], 
                              way12_dirty_dout_after_correct[1], 
                              way11_dirty_dout_after_correct[1], 
                              way10_dirty_dout_after_correct[1], 
                              way9_dirty_dout_after_correct[1],
                              way8_dirty_dout_after_correct[1],
                              way7_dirty_dout_after_correct[1],
                              way6_dirty_dout_after_correct[1],
                              way5_dirty_dout_after_correct[1],
                              way4_dirty_dout_after_correct[1],
                              way3_dirty_dout_after_correct[1],
                              way2_dirty_dout_after_correct[1],
                              way1_dirty_dout_after_correct[1],
                              way0_dirty_dout_after_correct[1]};

assign status_pend[15:0]   = {way15_dirty_dout_after_correct[0], 
                              way14_dirty_dout_after_correct[0], 
                              way13_dirty_dout_after_correct[0], 
                              way12_dirty_dout_after_correct[0], 
                              way11_dirty_dout_after_correct[0], 
                              way10_dirty_dout_after_correct[0], 
                              way9_dirty_dout_after_correct[0],
                              way8_dirty_dout_after_correct[0],
                              way7_dirty_dout_after_correct[0],
                              way6_dirty_dout_after_correct[0],
                              way5_dirty_dout_after_correct[0],
                              way4_dirty_dout_after_correct[0],
                              way3_dirty_dout_after_correct[0],
                              way2_dirty_dout_after_correct[0],
                              way1_dirty_dout_after_correct[0],
                              way0_dirty_dout_after_correct[0]};

assign status_fifo[15:0]   = fifo_dout_after_correct[15:0];

assign status_vld_shared[15:0] =  status_vld[15:0] & status_shared[15:0];
assign status_vld_unique[15:0] =  status_vld[15:0] & (~status_shared[15:0]);
assign status_vld_dirty[15:0]  =  status_vld[15:0] & status_dirty[15:0];
//assign status_vld_pend[15:0]   =  status_vld[15:0] & status_pend[15:0];
assign status_inv_pend[15:0]   = ~status_vld[15:0] & status_pend[15:0];

//refill the entry whose pend is 1 and valid is 0
//release the entry whose pend is 1 and valid is 0 
// &CombBeg; @816
always @( status_inv_pend[15:0])
begin
  tag_refill_ptr[15:0] = 16'b0;
  casez(status_inv_pend[15:0])
  16'b???????????????1: tag_refill_ptr[0] = 1'b1;
  16'b??????????????10: tag_refill_ptr[1] = 1'b1;
  16'b?????????????100: tag_refill_ptr[2] = 1'b1;
  16'b????????????1000: tag_refill_ptr[3] = 1'b1;
  16'b???????????10000: tag_refill_ptr[4] = 1'b1;
  16'b??????????100000: tag_refill_ptr[5] = 1'b1;
  16'b?????????1000000: tag_refill_ptr[6] = 1'b1;
  16'b????????10000000: tag_refill_ptr[7] = 1'b1;
  16'b???????100000000: tag_refill_ptr[8] = 1'b1;
  16'b??????1000000000: tag_refill_ptr[9] = 1'b1;
  16'b?????10000000000: tag_refill_ptr[10] = 1'b1;
  16'b????100000000000: tag_refill_ptr[11] = 1'b1;
  16'b???1000000000000: tag_refill_ptr[12] = 1'b1;
  16'b??10000000000000: tag_refill_ptr[13] = 1'b1;
  16'b?100000000000000: tag_refill_ptr[14] = 1'b1;
  16'b1000000000000000: tag_refill_ptr[15] = 1'b1;
  default             : tag_refill_ptr[15:0] = 16'b0;
  endcase
// &CombEnd; @837
end

//assign fifo_mask[15] = |status_fifo[15:0];
//assign fifo_mask[14] = |status_fifo[14:0];
//assign fifo_mask[13] = |status_fifo[13:0];
//assign fifo_mask[12] = |status_fifo[12:0];
//assign fifo_mask[11] = |status_fifo[11:0];
//assign fifo_mask[10] = |status_fifo[10:0];
//assign fifo_mask[9] = |status_fifo[9:0];
//assign fifo_mask[8] = |status_fifo[8:0];
//assign fifo_mask[7] = |status_fifo[7:0];
//assign fifo_mask[6] = |status_fifo[6:0];
//assign fifo_mask[5] = |status_fifo[5:0];
//assign fifo_mask[4] = |status_fifo[4:0];
//assign fifo_mask[3] = |status_fifo[3:0];
//assign fifo_mask[2] = |status_fifo[2:0];
//assign fifo_mask[1] = |status_fifo[1:0];
//assign fifo_mask[0] = status_fifo[0];
//
//assign refill_pend[31:0] = {2{status_inv_pend[15:0]}} & {{16{1'b1}},fifo_mask[15:0]};
//&CombBeg;
//  refill_ptr[31:0] = 32'b0;
//  casez(refill_pend[31:0])
//  32'b???????????????????????????????1: refill_ptr[0] = 1'b1;
//  32'b??????????????????????????????10: refill_ptr[1] = 1'b1;
//  32'b?????????????????????????????100: refill_ptr[2] = 1'b1;
//  32'b????????????????????????????1000: refill_ptr[3] = 1'b1;
//  32'b???????????????????????????10000: refill_ptr[4] = 1'b1;
//  32'b??????????????????????????100000: refill_ptr[5] = 1'b1;
//  32'b?????????????????????????1000000: refill_ptr[6] = 1'b1;
//  32'b????????????????????????10000000: refill_ptr[7] = 1'b1;
//  32'b???????????????????????100000000: refill_ptr[8] = 1'b1;
//  32'b??????????????????????1000000000: refill_ptr[9] = 1'b1;
//  32'b?????????????????????10000000000: refill_ptr[10] = 1'b1;
//  32'b????????????????????100000000000: refill_ptr[11] = 1'b1;
//  32'b???????????????????1000000000000: refill_ptr[12] = 1'b1;
//  32'b??????????????????10000000000000: refill_ptr[13] = 1'b1;
//  32'b?????????????????100000000000000: refill_ptr[14] = 1'b1;
//  32'b????????????????1000000000000000: refill_ptr[15] = 1'b1;
//  32'b???????????????10000000000000000: refill_ptr[16] = 1'b1;
//  32'b??????????????100000000000000000: refill_ptr[17] = 1'b1;
//  32'b?????????????1000000000000000000: refill_ptr[18] = 1'b1;
//  32'b????????????10000000000000000000: refill_ptr[19] = 1'b1;
//  32'b???????????100000000000000000000: refill_ptr[20] = 1'b1;
//  32'b??????????1000000000000000000000: refill_ptr[21] = 1'b1;
//  32'b?????????10000000000000000000000: refill_ptr[22] = 1'b1;
//  32'b????????100000000000000000000000: refill_ptr[23] = 1'b1;
//  32'b???????1000000000000000000000000: refill_ptr[24] = 1'b1;
//  32'b??????10000000000000000000000000: refill_ptr[25] = 1'b1;
//  32'b?????100000000000000000000000000: refill_ptr[26] = 1'b1;
//  32'b????1000000000000000000000000000: refill_ptr[27] = 1'b1;
//  32'b???10000000000000000000000000000: refill_ptr[28] = 1'b1;
//  32'b??100000000000000000000000000000: refill_ptr[29] = 1'b1;
//  32'b?1000000000000000000000000000000: refill_ptr[30] = 1'b1;
//  32'b10000000000000000000000000000000: refill_ptr[31] = 1'b1;
//  default             : refill_ptr[31:0] = 32'b0;
//  endcase
//&CombEnd;
//assign tag_refill_ptr[15:0] = refill_ptr[15:0] | refill_ptr[31:16];

//==============================================================================
//                        Data from tag/status ram
//==============================================================================
assign ttecc_flop = tt_icc_tag_flop | ttecc_flop_vld;
// &Instance("gated_clk_cell", "x_l2c_tag_stage_flop_gated_clk"); @902
gated_clk_cell  x_l2c_tag_stage_flop_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (tag_stage_flop_clk),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (ttecc_flop        ),
  .module_en          (l2c_icg_en        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in        (forever_cpuclk     ), @903
//          .external_en   (1'b0               ), @904
//          .global_en     (1'b1               ), @905
//          .module_en     (l2c_icg_en         ), @906
//          .local_en      (ttecc_flop         ), @907
//          .clk_out       (tag_stage_flop_clk ) @908
//         ); @909

assign ttecc_stage_flop_vld = (tt_icc_tag_flop | ttecc_flop_vld) & !cmp_stage_stall;

always@(posedge tag_stage_flop_clk)
begin
  if(ttecc_stage_flop_vld)begin
    l2c_way0_tag_dout[TAG_TAG_LENTH-1:0] <= way0_tag_dout_after_correct[TAG_TAG_LENTH-1:0];
    l2c_way1_tag_dout[TAG_TAG_LENTH-1:0] <= way1_tag_dout_after_correct[TAG_TAG_LENTH-1:0];
    l2c_way2_tag_dout[TAG_TAG_LENTH-1:0] <= way2_tag_dout_after_correct[TAG_TAG_LENTH-1:0];
    l2c_way3_tag_dout[TAG_TAG_LENTH-1:0] <= way3_tag_dout_after_correct[TAG_TAG_LENTH-1:0];
    l2c_way4_tag_dout[TAG_TAG_LENTH-1:0] <= way4_tag_dout_after_correct[TAG_TAG_LENTH-1:0];
    l2c_way5_tag_dout[TAG_TAG_LENTH-1:0] <= way5_tag_dout_after_correct[TAG_TAG_LENTH-1:0];
    l2c_way6_tag_dout[TAG_TAG_LENTH-1:0] <= way6_tag_dout_after_correct[TAG_TAG_LENTH-1:0];
    l2c_way7_tag_dout[TAG_TAG_LENTH-1:0] <= way7_tag_dout_after_correct[TAG_TAG_LENTH-1:0];
    l2c_way8_tag_dout[TAG_TAG_LENTH-1:0]  <= way8_tag_dout_after_correct[TAG_TAG_LENTH-1:0];
    l2c_way9_tag_dout[TAG_TAG_LENTH-1:0]  <= way9_tag_dout_after_correct[TAG_TAG_LENTH-1:0];
    l2c_way10_tag_dout[TAG_TAG_LENTH-1:0] <= way10_tag_dout_after_correct[TAG_TAG_LENTH-1:0];
    l2c_way11_tag_dout[TAG_TAG_LENTH-1:0] <= way11_tag_dout_after_correct[TAG_TAG_LENTH-1:0];
    l2c_way12_tag_dout[TAG_TAG_LENTH-1:0] <= way12_tag_dout_after_correct[TAG_TAG_LENTH-1:0];
    l2c_way13_tag_dout[TAG_TAG_LENTH-1:0] <= way13_tag_dout_after_correct[TAG_TAG_LENTH-1:0];
    l2c_way14_tag_dout[TAG_TAG_LENTH-1:0] <= way14_tag_dout_after_correct[TAG_TAG_LENTH-1:0];
    l2c_way15_tag_dout[TAG_TAG_LENTH-1:0] <= way15_tag_dout_after_correct[TAG_TAG_LENTH-1:0];
  end
end

parameter CP_WIDTH = 4;

// &CombBeg; @965
// &CombEnd; @978

always@(posedge tag_stage_flop_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    l2c_dirty_dout_flop[79:0] <= 80'b0;
  else if(ttecc_stage_flop_vld)
    l2c_dirty_dout_flop[79:0] <= {status_fifo[15:0],status_vld[15:0],status_shared[15:0],status_dirty[15:0],status_pend[15:0]};
  else
    l2c_dirty_dout_flop[79:0] <= l2c_dirty_dout_flop[79:0];
end

always@(posedge tag_stage_flop_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    l2c_way_fifo[15:0] <= 16'b0;
  else if(ttecc_stage_flop_vld)
    l2c_way_fifo[15:0] <= way_fifo[15:0];
end

assign l2c_way_vld[15:0]    = l2c_dirty_dout_flop[63:48];
//assign l2c_way_shared[15:0] = l2c_dirty_dout_flop[47:32];
assign l2c_way_dirty[15:0]  = l2c_dirty_dout_flop[31:16];
//assign l2c_way_pend[15:0]   = l2c_dirty_dout_flop[15:0];
assign way_fifo[15:0]   = fifo_way_pend_vld ? way_fifo_pend_inv[15:0] : status_fifo[15:0];

assign fifo_way_pend_vld = |(status_fifo[15:0] & status_pend[15:0]);
// &CombBeg; @1044
always @( status_pend[15:0])
begin
  way_fifo_pend_inv[15:0] = 16'b0;
  casez(status_pend[15:0])
    16'b???????????????0: way_fifo_pend_inv[0] = 1'b1;
    16'b??????????????01: way_fifo_pend_inv[1] = 1'b1;
    16'b?????????????011: way_fifo_pend_inv[2] = 1'b1;
    16'b????????????0111: way_fifo_pend_inv[3] = 1'b1;
    16'b???????????01111: way_fifo_pend_inv[4] = 1'b1;
    16'b??????????011111: way_fifo_pend_inv[5] = 1'b1;
    16'b?????????0111111: way_fifo_pend_inv[6] = 1'b1;
    16'b????????01111111: way_fifo_pend_inv[7] = 1'b1;
    16'b???????011111111: way_fifo_pend_inv[8] = 1'b1;
    16'b??????0111111111: way_fifo_pend_inv[9] = 1'b1;
    16'b?????01111111111: way_fifo_pend_inv[10] = 1'b1;
    16'b????011111111111: way_fifo_pend_inv[11] = 1'b1;
    16'b???0111111111111: way_fifo_pend_inv[12] = 1'b1;
    16'b??01111111111111: way_fifo_pend_inv[13] = 1'b1;
    16'b?011111111111111: way_fifo_pend_inv[14] = 1'b1;
    16'b0111111111111111: way_fifo_pend_inv[15] = 1'b1;
    default :             way_fifo_pend_inv[15:0] = {16{1'bx}};
  endcase
// &CombEnd; @1065
end

assign l2c_way0_dirty_dout[3:0]  = {l2c_dirty_dout_flop[48],l2c_dirty_dout_flop[32],l2c_dirty_dout_flop[16],l2c_dirty_dout_flop[0]};
assign l2c_way1_dirty_dout[3:0]  = {l2c_dirty_dout_flop[49],l2c_dirty_dout_flop[33],l2c_dirty_dout_flop[17],l2c_dirty_dout_flop[1]};
assign l2c_way2_dirty_dout[3:0]  = {l2c_dirty_dout_flop[50],l2c_dirty_dout_flop[34],l2c_dirty_dout_flop[18],l2c_dirty_dout_flop[2]};
assign l2c_way3_dirty_dout[3:0]  = {l2c_dirty_dout_flop[51],l2c_dirty_dout_flop[35],l2c_dirty_dout_flop[19],l2c_dirty_dout_flop[3]};
assign l2c_way4_dirty_dout[3:0]  = {l2c_dirty_dout_flop[52],l2c_dirty_dout_flop[36],l2c_dirty_dout_flop[20],l2c_dirty_dout_flop[4]};
assign l2c_way5_dirty_dout[3:0]  = {l2c_dirty_dout_flop[53],l2c_dirty_dout_flop[37],l2c_dirty_dout_flop[21],l2c_dirty_dout_flop[5]};
assign l2c_way6_dirty_dout[3:0]  = {l2c_dirty_dout_flop[54],l2c_dirty_dout_flop[38],l2c_dirty_dout_flop[22],l2c_dirty_dout_flop[6]};
assign l2c_way7_dirty_dout[3:0]  = {l2c_dirty_dout_flop[55],l2c_dirty_dout_flop[39],l2c_dirty_dout_flop[23],l2c_dirty_dout_flop[7]};
assign l2c_way8_dirty_dout[3:0]  = {l2c_dirty_dout_flop[56],l2c_dirty_dout_flop[40],l2c_dirty_dout_flop[24],l2c_dirty_dout_flop[8]};
assign l2c_way9_dirty_dout[3:0]  = {l2c_dirty_dout_flop[57],l2c_dirty_dout_flop[41],l2c_dirty_dout_flop[25],l2c_dirty_dout_flop[9]};
assign l2c_way10_dirty_dout[3:0] = {l2c_dirty_dout_flop[58],l2c_dirty_dout_flop[42],l2c_dirty_dout_flop[26],l2c_dirty_dout_flop[10]};
assign l2c_way11_dirty_dout[3:0] = {l2c_dirty_dout_flop[59],l2c_dirty_dout_flop[43],l2c_dirty_dout_flop[27],l2c_dirty_dout_flop[11]};
assign l2c_way12_dirty_dout[3:0] = {l2c_dirty_dout_flop[60],l2c_dirty_dout_flop[44],l2c_dirty_dout_flop[28],l2c_dirty_dout_flop[12]};
assign l2c_way13_dirty_dout[3:0] = {l2c_dirty_dout_flop[61],l2c_dirty_dout_flop[45],l2c_dirty_dout_flop[29],l2c_dirty_dout_flop[13]};
assign l2c_way14_dirty_dout[3:0] = {l2c_dirty_dout_flop[62],l2c_dirty_dout_flop[46],l2c_dirty_dout_flop[30],l2c_dirty_dout_flop[14]};
assign l2c_way15_dirty_dout[3:0] = {l2c_dirty_dout_flop[63],l2c_dirty_dout_flop[47],l2c_dirty_dout_flop[31],l2c_dirty_dout_flop[15]};

assign l2c_way0_dirty_dout[7:4]  = l2c_tag_cp_dout_flop[CP_WIDTH-1:0];
assign l2c_way1_dirty_dout[7:4]  = l2c_tag_cp_dout_flop[2*CP_WIDTH-1:    CP_WIDTH];
assign l2c_way2_dirty_dout[7:4]  = l2c_tag_cp_dout_flop[3*CP_WIDTH-1:  2*CP_WIDTH];
assign l2c_way3_dirty_dout[7:4]  = l2c_tag_cp_dout_flop[4*CP_WIDTH-1:  3*CP_WIDTH];
assign l2c_way4_dirty_dout[7:4]  = l2c_tag_cp_dout_flop[5*CP_WIDTH-1:  4*CP_WIDTH];
assign l2c_way5_dirty_dout[7:4]  = l2c_tag_cp_dout_flop[6*CP_WIDTH-1:  5*CP_WIDTH];
assign l2c_way6_dirty_dout[7:4]  = l2c_tag_cp_dout_flop[7*CP_WIDTH-1:  6*CP_WIDTH];
assign l2c_way7_dirty_dout[7:4]  = l2c_tag_cp_dout_flop[8*CP_WIDTH-1:  7*CP_WIDTH];
assign l2c_way8_dirty_dout[7:4]  = l2c_tag_cp_dout_flop[9*CP_WIDTH-1:  8*CP_WIDTH];
assign l2c_way9_dirty_dout[7:4]  = l2c_tag_cp_dout_flop[10*CP_WIDTH-1: 9*CP_WIDTH];
assign l2c_way10_dirty_dout[7:4] = l2c_tag_cp_dout_flop[11*CP_WIDTH-1:10*CP_WIDTH];
assign l2c_way11_dirty_dout[7:4] = l2c_tag_cp_dout_flop[12*CP_WIDTH-1:11*CP_WIDTH];
assign l2c_way12_dirty_dout[7:4] = l2c_tag_cp_dout_flop[13*CP_WIDTH-1:12*CP_WIDTH];
assign l2c_way13_dirty_dout[7:4] = l2c_tag_cp_dout_flop[14*CP_WIDTH-1:13*CP_WIDTH];
assign l2c_way14_dirty_dout[7:4] = l2c_tag_cp_dout_flop[15*CP_WIDTH-1:14*CP_WIDTH];
assign l2c_way15_dirty_dout[7:4] = l2c_tag_cp_dout_flop[16*CP_WIDTH-1:15*CP_WIDTH];

always@(posedge tag_stage_flop_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    l2c_tag_cp_dout_flop[63:0] <= 64'b0;
  else if(ttecc_stage_flop_vld)
    l2c_tag_cp_dout_flop[63:0] <= status_cp[63:0];
  else
    l2c_tag_cp_dout_flop[63:0] <= l2c_tag_cp_dout_flop[63:0];
end

assign l2c_way0_cp_dout[CP_WIDTH-1:0]  = l2c_tag_cp_dout_flop[CP_WIDTH-1:0];
assign l2c_way1_cp_dout[CP_WIDTH-1:0]  = l2c_tag_cp_dout_flop[2*CP_WIDTH-1:    CP_WIDTH];
assign l2c_way2_cp_dout[CP_WIDTH-1:0]  = l2c_tag_cp_dout_flop[3*CP_WIDTH-1:  2*CP_WIDTH];
assign l2c_way3_cp_dout[CP_WIDTH-1:0]  = l2c_tag_cp_dout_flop[4*CP_WIDTH-1:  3*CP_WIDTH];
assign l2c_way4_cp_dout[CP_WIDTH-1:0]  = l2c_tag_cp_dout_flop[5*CP_WIDTH-1:  4*CP_WIDTH];
assign l2c_way5_cp_dout[CP_WIDTH-1:0]  = l2c_tag_cp_dout_flop[6*CP_WIDTH-1:  5*CP_WIDTH];
assign l2c_way6_cp_dout[CP_WIDTH-1:0]  = l2c_tag_cp_dout_flop[7*CP_WIDTH-1:  6*CP_WIDTH];
assign l2c_way7_cp_dout[CP_WIDTH-1:0]  = l2c_tag_cp_dout_flop[8*CP_WIDTH-1:  7*CP_WIDTH];
assign l2c_way8_cp_dout[CP_WIDTH-1:0]  = l2c_tag_cp_dout_flop[9*CP_WIDTH-1:  8*CP_WIDTH];
assign l2c_way9_cp_dout[CP_WIDTH-1:0]  = l2c_tag_cp_dout_flop[10*CP_WIDTH-1: 9*CP_WIDTH];
assign l2c_way10_cp_dout[CP_WIDTH-1:0] = l2c_tag_cp_dout_flop[11*CP_WIDTH-1:10*CP_WIDTH];
assign l2c_way11_cp_dout[CP_WIDTH-1:0] = l2c_tag_cp_dout_flop[12*CP_WIDTH-1:11*CP_WIDTH];
assign l2c_way12_cp_dout[CP_WIDTH-1:0] = l2c_tag_cp_dout_flop[13*CP_WIDTH-1:12*CP_WIDTH];
assign l2c_way13_cp_dout[CP_WIDTH-1:0] = l2c_tag_cp_dout_flop[14*CP_WIDTH-1:13*CP_WIDTH];
assign l2c_way14_cp_dout[CP_WIDTH-1:0] = l2c_tag_cp_dout_flop[15*CP_WIDTH-1:14*CP_WIDTH];
assign l2c_way15_cp_dout[CP_WIDTH-1:0] = l2c_tag_cp_dout_flop[16*CP_WIDTH-1:15*CP_WIDTH];

//================================================
//     TAG STAGE REQUEST INFORMATION FLOP
//================================================
assign cmp_info_clk_en = ttecc_flop_vld;
// &Instance("gated_clk_cell", "x_l2c_cmp_info_gated_clk"); @1133
gated_clk_cell  x_l2c_cmp_info_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (cmp_info_clk      ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (cmp_info_clk_en   ),
  .module_en          (l2c_icg_en        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in        (forever_cpuclk     ), @1134
//          .external_en   (1'b0               ), @1135
//          .global_en     (1'b1               ), @1136
//          .module_en (l2c_icg_en     ), @1137
//          .local_en      (cmp_info_clk_en    ), @1138
//          .clk_out       (cmp_info_clk       ) @1139
//         ); @1140

always@(posedge cmp_info_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    cmp_way_v_hit[7:0]   <= 8'b0;
    cmp_way_vs_hit[7:0]  <= 8'b0;
    cmp_way_vu_hit[7:0]  <= 8'b0;
    cmp_way_vd_hit[7:0]  <= 8'b0;
    //cmp_way_vp_hit[7:0]  <= 8'b0;
    cmp_refill_ptr[7:0]  <= 8'b0;
    cmp_way_v_hit[15:8]  <= 8'b0;
    cmp_way_vs_hit[15:8] <= 8'b0;
    cmp_way_vu_hit[15:8] <= 8'b0;
    cmp_way_vd_hit[15:8] <= 8'b0;
   // cmp_way_vp_hit[15:8] <= 8'b0;
    cmp_refill_ptr[15:8] <= 8'b0;
  end
  else if (ttecc_flop_vld & !cmp_stage_stall) begin
    cmp_way_v_hit[7:0]   <= tag_stage_v_hit[7:0];
    cmp_way_vs_hit[7:0]  <= tag_stage_vs_hit[7:0];
    cmp_way_vu_hit[7:0]  <= tag_stage_vu_hit[7:0];
    cmp_way_vd_hit[7:0]  <= tag_stage_vd_hit[7:0];
   // cmp_way_vp_hit[7:0]  <= tag_stage_vp_hit[7:0];
    cmp_refill_ptr[7:0]  <= tag_refill_ptr[7:0];
    cmp_way_v_hit[15:8]  <= tag_stage_v_hit[15:8];
    cmp_way_vs_hit[15:8] <= tag_stage_vs_hit[15:8];
    cmp_way_vu_hit[15:8] <= tag_stage_vu_hit[15:8];
    cmp_way_vd_hit[15:8] <= tag_stage_vd_hit[15:8];
   // cmp_way_vp_hit[15:8] <= tag_stage_vp_hit[15:8];
    cmp_refill_ptr[15:8] <= tag_refill_ptr[15:8];
  end
end

// &Instance("ct_l2c_tag_ecc", "x_ct_l2c_tag_ecc"); @1178
ct_l2c_tag_ecc  x_ct_l2c_tag_ecc (
  .cmp_stage_stall                (cmp_stage_stall               ),
  .fifo_dout_after_correct        (fifo_dout_after_correct       ),
  .forever_cpuclk                 (forever_cpuclk                ),
  .icc_dca_dirty_f                (icc_dca_dirty_f               ),
  .icc_dca_tag_f                  (icc_dca_tag_f                 ),
  .icc_dca_way_sel                (icc_dca_way_sel               ),
  .icc_tag_flop                   (icc_tag_flop                  ),
  .l2c_dirty_dout                 (l2c_dirty_dout                ),
  .l2c_icg_en                     (l2c_icg_en                    ),
  .l2c_tag_dirty_fatal_err        (l2c_tag_dirty_fatal_err       ),
  .l2c_tag_dout                   (l2c_tag_dout                  ),
  .next_stage_stall               (next_stage_stall              ),
  .pad_yy_icg_scan_en             (pad_yy_icg_scan_en            ),
  .tag_stage_flop_vld             (tag_stage_flop_vld            ),
  .way0_dirty_dout_after_correct  (way0_dirty_dout_after_correct ),
  .way0_tag_dout_after_correct    (way0_tag_dout_after_correct   ),
  .way10_dirty_dout_after_correct (way10_dirty_dout_after_correct),
  .way10_tag_dout_after_correct   (way10_tag_dout_after_correct  ),
  .way11_dirty_dout_after_correct (way11_dirty_dout_after_correct),
  .way11_tag_dout_after_correct   (way11_tag_dout_after_correct  ),
  .way12_dirty_dout_after_correct (way12_dirty_dout_after_correct),
  .way12_tag_dout_after_correct   (way12_tag_dout_after_correct  ),
  .way13_dirty_dout_after_correct (way13_dirty_dout_after_correct),
  .way13_tag_dout_after_correct   (way13_tag_dout_after_correct  ),
  .way14_dirty_dout_after_correct (way14_dirty_dout_after_correct),
  .way14_tag_dout_after_correct   (way14_tag_dout_after_correct  ),
  .way15_dirty_dout_after_correct (way15_dirty_dout_after_correct),
  .way15_tag_dout_after_correct   (way15_tag_dout_after_correct  ),
  .way1_dirty_dout_after_correct  (way1_dirty_dout_after_correct ),
  .way1_tag_dout_after_correct    (way1_tag_dout_after_correct   ),
  .way2_dirty_dout_after_correct  (way2_dirty_dout_after_correct ),
  .way2_tag_dout_after_correct    (way2_tag_dout_after_correct   ),
  .way3_dirty_dout_after_correct  (way3_dirty_dout_after_correct ),
  .way3_tag_dout_after_correct    (way3_tag_dout_after_correct   ),
  .way4_dirty_dout_after_correct  (way4_dirty_dout_after_correct ),
  .way4_tag_dout_after_correct    (way4_tag_dout_after_correct   ),
  .way5_dirty_dout_after_correct  (way5_dirty_dout_after_correct ),
  .way5_tag_dout_after_correct    (way5_tag_dout_after_correct   ),
  .way6_dirty_dout_after_correct  (way6_dirty_dout_after_correct ),
  .way6_tag_dout_after_correct    (way6_tag_dout_after_correct   ),
  .way7_dirty_dout_after_correct  (way7_dirty_dout_after_correct ),
  .way7_tag_dout_after_correct    (way7_tag_dout_after_correct   ),
  .way8_dirty_dout_after_correct  (way8_dirty_dout_after_correct ),
  .way8_tag_dout_after_correct    (way8_tag_dout_after_correct   ),
  .way9_dirty_dout_after_correct  (way9_dirty_dout_after_correct ),
  .way9_tag_dout_after_correct    (way9_tag_dout_after_correct   )
);



//==============================================================================
//                        ASSERTION
//==============================================================================
// &Force("nonport","addr_hit"); @1185
// &Force("nonport","tag_dirty_req"); @1195
// &Force("output","l2c_way_fifo"); @1206
// &Force("nonport","way_sel_pend_vld"); @1239

// &ModuleEnd; @1247
endmodule


