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
module ct_l2c_sub_bank(
  ciu_l2c_addr_vld_x,
  ciu_l2c_addr_x,
  ciu_l2c_clr_cp_x,
  ciu_l2c_ctcq_req_x,
  ciu_l2c_data_acc_cycle,
  ciu_l2c_data_setup,
  ciu_l2c_data_vld_x,
  ciu_l2c_dca_addr_x,
  ciu_l2c_dca_req_x,
  ciu_l2c_hpcp_bus_x,
  ciu_l2c_icc_mid_x,
  ciu_l2c_icc_type_x,
  ciu_l2c_mid_x,
  ciu_l2c_rdl_ready_x,
  ciu_l2c_rst_req,
  ciu_l2c_set_cp_x,
  ciu_l2c_sid_x,
  ciu_l2c_snpl2_ready_x,
  ciu_l2c_src_x,
  ciu_l2c_tag_acc_cycle,
  ciu_l2c_tag_setup,
  ciu_l2c_type_x,
  ciu_l2c_wdata_x,
  cmp_pref_addr_x,
  cmp_pref_cache_miss_x,
  cmp_pref_ifu_req_x,
  cmp_pref_read_x,
  cmp_pref_tlb_req_x,
  cmp_pref_vld_x,
  cpurst_b,
  forever_cpuclk,
  l2c_ciu_addr_ready_x,
  l2c_ciu_cmplt_x,
  l2c_ciu_cp_x,
  l2c_ciu_ctcq_cmplt_x,
  l2c_ciu_ctcq_ready_x,
  l2c_ciu_data_ready_gate_x,
  l2c_ciu_data_ready_x,
  l2c_ciu_data_x,
  l2c_ciu_dca_cmplt_x,
  l2c_ciu_dca_data_x,
  l2c_ciu_dca_ready_x,
  l2c_ciu_hpcp_acc_inc_x,
  l2c_ciu_hpcp_mid_x,
  l2c_ciu_hpcp_miss_inc_x,
  l2c_ciu_rdl_addr_x,
  l2c_ciu_rdl_dvld_x,
  l2c_ciu_rdl_mid_x,
  l2c_ciu_rdl_prot_x,
  l2c_ciu_rdl_rvld_x,
  l2c_ciu_resp_x,
  l2c_ciu_sid_x,
  l2c_ciu_snpl2_addr_x,
  l2c_ciu_snpl2_ini_sid_x,
  l2c_ciu_snpl2_vld_x,
  l2c_data_clk_x,
  l2c_data_ram_clk_en_x,
  l2c_dbg_info_x,
  l2c_flush_done_x,
  l2c_flush_req_x,
  l2c_icg_en,
  l2c_no_op_x,
  l2c_tag_clk_x,
  l2c_tag_ram_clk_en_x,
  pad_yy_icg_scan_en
);

// &Ports; @23
input            ciu_l2c_addr_vld_x;       
input   [32 :0]  ciu_l2c_addr_x;           
input   [3  :0]  ciu_l2c_clr_cp_x;         
input            ciu_l2c_ctcq_req_x;       
input   [3  :0]  ciu_l2c_data_acc_cycle;   
input            ciu_l2c_data_setup;       
input            ciu_l2c_data_vld_x;       
input   [32 :0]  ciu_l2c_dca_addr_x;       
input            ciu_l2c_dca_req_x;        
input   [2  :0]  ciu_l2c_hpcp_bus_x;       
input   [2  :0]  ciu_l2c_icc_mid_x;        
input   [1  :0]  ciu_l2c_icc_type_x;       
input   [2  :0]  ciu_l2c_mid_x;            
input            ciu_l2c_rdl_ready_x;      
input            ciu_l2c_rst_req;          
input   [3  :0]  ciu_l2c_set_cp_x;         
input   [4  :0]  ciu_l2c_sid_x;            
input            ciu_l2c_snpl2_ready_x;    
input   [1  :0]  ciu_l2c_src_x;            
input   [2  :0]  ciu_l2c_tag_acc_cycle;    
input            ciu_l2c_tag_setup;        
input   [12 :0]  ciu_l2c_type_x;           
input   [511:0]  ciu_l2c_wdata_x;          
input            cpurst_b;                 
input            forever_cpuclk;           
input            l2c_data_clk_x;           
input            l2c_flush_req_x;          
input            l2c_icg_en;               
input            l2c_tag_clk_x;            
input            pad_yy_icg_scan_en;       
output  [32 :0]  cmp_pref_addr_x;          
output           cmp_pref_cache_miss_x;    
output           cmp_pref_ifu_req_x;       
output           cmp_pref_read_x;          
output           cmp_pref_tlb_req_x;       
output           cmp_pref_vld_x;           
output           l2c_ciu_addr_ready_x;     
output           l2c_ciu_cmplt_x;          
output  [3  :0]  l2c_ciu_cp_x;             
output           l2c_ciu_ctcq_cmplt_x;     
output           l2c_ciu_ctcq_ready_x;     
output           l2c_ciu_data_ready_gate_x; 
output           l2c_ciu_data_ready_x;     
output  [511:0]  l2c_ciu_data_x;           
output           l2c_ciu_dca_cmplt_x;      
output  [127:0]  l2c_ciu_dca_data_x;       
output           l2c_ciu_dca_ready_x;      
output  [1  :0]  l2c_ciu_hpcp_acc_inc_x;   
output  [2  :0]  l2c_ciu_hpcp_mid_x;       
output  [1  :0]  l2c_ciu_hpcp_miss_inc_x;  
output  [32 :0]  l2c_ciu_rdl_addr_x;       
output           l2c_ciu_rdl_dvld_x;       
output  [2  :0]  l2c_ciu_rdl_mid_x;        
output  [2  :0]  l2c_ciu_rdl_prot_x;       
output           l2c_ciu_rdl_rvld_x;       
output  [4  :0]  l2c_ciu_resp_x;           
output  [4  :0]  l2c_ciu_sid_x;            
output  [32 :0]  l2c_ciu_snpl2_addr_x;     
output  [4  :0]  l2c_ciu_snpl2_ini_sid_x;  
output           l2c_ciu_snpl2_vld_x;      
output           l2c_data_ram_clk_en_x;    
output  [21 :0]  l2c_dbg_info_x;           
output           l2c_flush_done_x;         
output           l2c_no_op_x;              
output           l2c_tag_ram_clk_en_x;     

// &Regs; @24

// &Wires; @25
wire             ciu_l2c_addr_vld_x;       
wire    [32 :0]  ciu_l2c_addr_x;           
wire    [3  :0]  ciu_l2c_clr_cp_x;         
wire             ciu_l2c_ctcq_req_x;       
wire    [3  :0]  ciu_l2c_data_acc_cycle;   
wire             ciu_l2c_data_setup;       
wire             ciu_l2c_data_vld_x;       
wire    [32 :0]  ciu_l2c_dca_addr_x;       
wire             ciu_l2c_dca_req_x;        
wire    [2  :0]  ciu_l2c_hpcp_bus_x;       
wire    [2  :0]  ciu_l2c_icc_mid_x;        
wire    [1  :0]  ciu_l2c_icc_type_x;       
wire    [2  :0]  ciu_l2c_mid_x;            
wire             ciu_l2c_rdl_ready_x;      
wire             ciu_l2c_rst_req;          
wire    [3  :0]  ciu_l2c_set_cp_x;         
wire    [4  :0]  ciu_l2c_sid_x;            
wire             ciu_l2c_snpl2_ready_x;    
wire    [1  :0]  ciu_l2c_src_x;            
wire    [2  :0]  ciu_l2c_tag_acc_cycle;    
wire             ciu_l2c_tag_setup;        
wire    [12 :0]  ciu_l2c_type_x;           
wire    [511:0]  ciu_l2c_wdata_x;          
wire    [511:0]  cmp_data_din;             
wire    [12 :0]  cmp_data_index;           
wire             cmp_data_req;             
wire             cmp_data_req_gate;        
wire             cmp_data_vld;             
wire             cmp_data_wen;             
wire             cmp_dirty_cen;            
wire    [143:0]  cmp_dirty_din;            
wire             cmp_dirty_gwen;           
wire    [15 :0]  cmp_dirty_way;            
wire    [8  :0]  cmp_dirty_wen;            
wire    [32 :0]  cmp_pref_addr_x;          
wire             cmp_pref_cache_miss_x;    
wire             cmp_pref_ifu_req_x;       
wire             cmp_pref_read_x;          
wire             cmp_pref_tlb_req_x;       
wire             cmp_pref_vld_x;           
wire    [15 :0]  cmp_refill_ptr;           
wire             cmp_req_vld;              
wire    [3  :0]  cmp_rfifo_cp;             
wire             cmp_rfifo_create;         
wire    [4  :0]  cmp_rfifo_resp;           
wire    [4  :0]  cmp_rfifo_sid;            
wire    [32 :0]  cmp_stage_addr;           
wire    [3  :0]  cmp_stage_cp;             
wire    [4  :0]  cmp_stage_resp;           
wire    [4  :0]  cmp_stage_sid;            
wire    [1  :0]  cmp_stage_src;            
wire             cmp_stage_stall;          
wire             cmp_stage_vld;            
wire             cmp_stage_write;          
wire             cmp_stall_by_data;        
wire             cmp_tag_cen;              
wire             cmp_tag_gwen;             
wire    [8  :0]  cmp_tag_index;            
wire    [15 :0]  cmp_tag_wen;              
wire    [15 :0]  cmp_way_v_hit;            
wire    [15 :0]  cmp_way_vd_hit;           
wire    [15 :0]  cmp_way_vs_hit;           
wire    [15 :0]  cmp_way_vu_hit;           
wire             cmp_yy_wdata_pop;         
wire             cmp_yy_wdata_pop_gate;    
wire             cpurst_b;                 
wire             data_ecc_ram_cen;         
wire             data_ecc_wen;             
wire             data_icc_grant;           
wire    [3  :0]  data_stage_cp;            
wire    [6  :0]  data_stage_index;         
wire    [4  :0]  data_stage_resp;          
wire    [4  :0]  data_stage_sid;           
wire             data_stage_vld;           
wire             data_xx_idle;             
wire             data_yy_flop_vld;         
wire             data_yy_ram_idle;         
wire             forever_cpuclk;           
wire    [4  :0]  icc_data_cen;             
wire             icc_data_flop;            
wire    [12 :0]  icc_data_index;           
wire             icc_data_req;             
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
wire             l2c_busy;                 
wire             l2c_ciu_addr_ready_x;     
wire             l2c_ciu_cmplt_x;          
wire    [3  :0]  l2c_ciu_cp_x;             
wire             l2c_ciu_ctcq_cmplt_x;     
wire             l2c_ciu_ctcq_ready_x;     
wire             l2c_ciu_data_ready_gate_x; 
wire             l2c_ciu_data_ready_x;     
wire    [511:0]  l2c_ciu_data_x;           
wire             l2c_ciu_dca_cmplt_x;      
wire    [127:0]  l2c_ciu_dca_data_x;       
wire             l2c_ciu_dca_ready_x;      
wire    [1  :0]  l2c_ciu_hpcp_acc_inc_x;   
wire    [2  :0]  l2c_ciu_hpcp_mid_x;       
wire    [1  :0]  l2c_ciu_hpcp_miss_inc_x;  
wire    [32 :0]  l2c_ciu_rdl_addr_x;       
wire             l2c_ciu_rdl_dvld_x;       
wire    [2  :0]  l2c_ciu_rdl_mid_x;        
wire    [2  :0]  l2c_ciu_rdl_prot_x;       
wire             l2c_ciu_rdl_rvld_x;       
wire    [4  :0]  l2c_ciu_resp_x;           
wire    [4  :0]  l2c_ciu_sid_x;            
wire    [32 :0]  l2c_ciu_snpl2_addr_x;     
wire    [4  :0]  l2c_ciu_snpl2_ini_sid_x;  
wire             l2c_ciu_snpl2_vld_x;      
wire             l2c_clk;                  
wire             l2c_clk_en;               
wire             l2c_data_clk_x;           
wire    [511:0]  l2c_data_din;             
wire    [511:0]  l2c_data_dout;            
wire    [511:0]  l2c_data_dout_flop;       
wire    [12 :0]  l2c_data_index0;          
wire    [12 :0]  l2c_data_index1;          
wire    [12 :0]  l2c_data_index2;          
wire    [12 :0]  l2c_data_index3;          
wire    [3  :0]  l2c_data_ram_cen;         
wire             l2c_data_ram_clk_en_x;    
wire    [3  :0]  l2c_data_wen;             
wire    [21 :0]  l2c_dbg_info_x;           
wire    [143:0]  l2c_dirty_din;            
wire    [143:0]  l2c_dirty_dout;           
wire             l2c_dirty_gwen;           
wire             l2c_dirty_ram_cen;        
wire    [143:0]  l2c_dirty_wen;            
wire             l2c_flush_done_x;         
wire             l2c_flush_req_x;          
wire             l2c_icg_en;               
wire             l2c_no_op_x;              
wire             l2c_pipeline_rdy;         
wire             l2c_tag_clk_x;            
wire    [383:0]  l2c_tag_din;              
wire    [15 :0]  l2c_tag_dirty_fatal_err;  
wire    [383:0]  l2c_tag_dout;             
wire             l2c_tag_gwen;             
wire    [8  :0]  l2c_tag_index;            
wire             l2c_tag_ram_cen;          
wire             l2c_tag_ram_clk_en_x;     
wire    [383:0]  l2c_tag_wen;              
wire    [3  :0]  l2c_way0_cp_dout;         
wire    [7  :0]  l2c_way0_dirty_dout;      
wire    [23 :0]  l2c_way0_tag_dout;        
wire    [3  :0]  l2c_way10_cp_dout;        
wire    [7  :0]  l2c_way10_dirty_dout;     
wire    [23 :0]  l2c_way10_tag_dout;       
wire    [3  :0]  l2c_way11_cp_dout;        
wire    [7  :0]  l2c_way11_dirty_dout;     
wire    [23 :0]  l2c_way11_tag_dout;       
wire    [3  :0]  l2c_way12_cp_dout;        
wire    [7  :0]  l2c_way12_dirty_dout;     
wire    [23 :0]  l2c_way12_tag_dout;       
wire    [3  :0]  l2c_way13_cp_dout;        
wire    [7  :0]  l2c_way13_dirty_dout;     
wire    [23 :0]  l2c_way13_tag_dout;       
wire    [3  :0]  l2c_way14_cp_dout;        
wire    [7  :0]  l2c_way14_dirty_dout;     
wire    [23 :0]  l2c_way14_tag_dout;       
wire    [3  :0]  l2c_way15_cp_dout;        
wire    [7  :0]  l2c_way15_dirty_dout;     
wire    [23 :0]  l2c_way15_tag_dout;       
wire    [3  :0]  l2c_way1_cp_dout;         
wire    [7  :0]  l2c_way1_dirty_dout;      
wire    [23 :0]  l2c_way1_tag_dout;        
wire    [3  :0]  l2c_way2_cp_dout;         
wire    [7  :0]  l2c_way2_dirty_dout;      
wire    [23 :0]  l2c_way2_tag_dout;        
wire    [3  :0]  l2c_way3_cp_dout;         
wire    [7  :0]  l2c_way3_dirty_dout;      
wire    [23 :0]  l2c_way3_tag_dout;        
wire    [3  :0]  l2c_way4_cp_dout;         
wire    [7  :0]  l2c_way4_dirty_dout;      
wire    [23 :0]  l2c_way4_tag_dout;        
wire    [3  :0]  l2c_way5_cp_dout;         
wire    [7  :0]  l2c_way5_dirty_dout;      
wire    [23 :0]  l2c_way5_tag_dout;        
wire    [3  :0]  l2c_way6_cp_dout;         
wire    [7  :0]  l2c_way6_dirty_dout;      
wire    [23 :0]  l2c_way6_tag_dout;        
wire    [3  :0]  l2c_way7_cp_dout;         
wire    [7  :0]  l2c_way7_dirty_dout;      
wire    [23 :0]  l2c_way7_tag_dout;        
wire    [3  :0]  l2c_way8_cp_dout;         
wire    [7  :0]  l2c_way8_dirty_dout;      
wire    [23 :0]  l2c_way8_tag_dout;        
wire    [3  :0]  l2c_way9_cp_dout;         
wire    [7  :0]  l2c_way9_dirty_dout;      
wire    [23 :0]  l2c_way9_tag_dout;        
wire    [15 :0]  l2c_way_dirty;            
wire    [15 :0]  l2c_way_fifo;             
wire    [15 :0]  l2c_way_vld;              
wire             pad_yy_icg_scan_en;       
wire             rfifo_empty;              
wire             tag_acc_cnt_zero;         
wire             tag_icc_grant;            
wire             tag_stage_vld;            
wire             tag_xx_idle;              
wire             tag_yy_ram_idle;          
wire             ttecc_flop_vld;           
wire    [32 :0]  ttecc_stage_addr;         
wire    [3  :0]  ttecc_stage_clrcp;        
wire             ttecc_stage_fatal_err;    
wire    [2  :0]  ttecc_stage_hpcp_bus;     
wire    [2  :0]  ttecc_stage_mid;          
wire    [3  :0]  ttecc_stage_setcp;        
wire    [4  :0]  ttecc_stage_sid;          
wire    [1  :0]  ttecc_stage_src;          
wire    [12 :0]  ttecc_stage_type;         
wire             ttecc_stage_write_raw;    
wire             wb_dirty_cen;             
wire             wb_dirty_gwen;            
wire    [15 :0]  wb_dirty_way;             
wire    [8  :0]  wb_dirty_wen;             
wire             wb_ecc_rfifo_empty;       
wire             wb_stage_fatal_err;       
wire             wb_stage_vld;             
wire             wb_tag_cen;               
wire             wb_tag_gwen;              
wire    [8  :0]  wb_tag_index;             
wire             wb_tag_req;               



assign l2c_busy = tag_stage_vld | cmp_stage_vld | data_stage_vld | wb_stage_vld |
                  !tag_xx_idle | !data_xx_idle |
                  !rfifo_empty | !icc_idle;

assign l2c_dbg_info_x[21:0] = {ciu_l2c_type_x[12:0],ciu_l2c_addr_vld_x,
                              tag_stage_vld,cmp_stage_vld,
                              data_stage_vld,1'b0,
                              wb_stage_vld,rfifo_empty,
                              1'b0,icc_idle};

assign l2c_clk_en = ciu_l2c_data_vld_x | l2c_busy; 
assign l2c_no_op_x = !l2c_busy;

// &Instance("gated_clk_cell", "x_l2c_gated_clk"); @53
gated_clk_cell  x_l2c_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (l2c_clk           ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (l2c_clk_en        ),
  .module_en          (l2c_icg_en        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in        (forever_cpuclk     ), @54
//          .external_en   (1'b0               ), @55
//          .global_en     (1'b1               ), @56
//          .module_en (l2c_icg_en     ), @57
//          .local_en      (l2c_clk_en         ), @58
//          .clk_out       (l2c_clk            ) @59
//         ); @60

// &Instance("ct_l2c_tag","x_ct_l2c_tag"); @62
ct_l2c_tag  x_ct_l2c_tag (
  .ciu_l2c_addr_vld_x      (ciu_l2c_addr_vld_x     ),
  .ciu_l2c_addr_x          (ciu_l2c_addr_x         ),
  .ciu_l2c_clr_cp_x        (ciu_l2c_clr_cp_x       ),
  .ciu_l2c_hpcp_bus_x      (ciu_l2c_hpcp_bus_x     ),
  .ciu_l2c_mid_x           (ciu_l2c_mid_x          ),
  .ciu_l2c_set_cp_x        (ciu_l2c_set_cp_x       ),
  .ciu_l2c_sid_x           (ciu_l2c_sid_x          ),
  .ciu_l2c_src_x           (ciu_l2c_src_x          ),
  .ciu_l2c_tag_acc_cycle   (ciu_l2c_tag_acc_cycle  ),
  .ciu_l2c_tag_setup       (ciu_l2c_tag_setup      ),
  .ciu_l2c_type_x          (ciu_l2c_type_x         ),
  .cmp_dirty_cen           (cmp_dirty_cen          ),
  .cmp_dirty_din           (cmp_dirty_din          ),
  .cmp_dirty_gwen          (cmp_dirty_gwen         ),
  .cmp_dirty_way           (cmp_dirty_way          ),
  .cmp_dirty_wen           (cmp_dirty_wen          ),
  .cmp_refill_ptr          (cmp_refill_ptr         ),
  .cmp_req_vld             (cmp_req_vld            ),
  .cmp_stage_addr          (cmp_stage_addr         ),
  .cmp_stage_stall         (cmp_stage_stall        ),
  .cmp_stage_vld           (cmp_stage_vld          ),
  .cmp_stall_by_data       (cmp_stall_by_data      ),
  .cmp_tag_cen             (cmp_tag_cen            ),
  .cmp_tag_gwen            (cmp_tag_gwen           ),
  .cmp_tag_index           (cmp_tag_index          ),
  .cmp_tag_wen             (cmp_tag_wen            ),
  .cmp_way_v_hit           (cmp_way_v_hit          ),
  .cmp_way_vd_hit          (cmp_way_vd_hit         ),
  .cmp_way_vs_hit          (cmp_way_vs_hit         ),
  .cmp_way_vu_hit          (cmp_way_vu_hit         ),
  .cpurst_b                (cpurst_b               ),
  .data_stage_index        (data_stage_index       ),
  .data_stage_vld          (data_stage_vld         ),
  .forever_cpuclk          (forever_cpuclk         ),
  .icc_dca_dirty_f         (icc_dca_dirty_f        ),
  .icc_dca_tag_f           (icc_dca_tag_f          ),
  .icc_dca_way_sel         (icc_dca_way_sel        ),
  .icc_dirty_cen           (icc_dirty_cen          ),
  .icc_dirty_gwen          (icc_dirty_gwen         ),
  .icc_dirty_wen           (icc_dirty_wen          ),
  .icc_idle                (icc_idle               ),
  .icc_tag_cen             (icc_tag_cen            ),
  .icc_tag_flop            (icc_tag_flop           ),
  .icc_tag_gwen            (icc_tag_gwen           ),
  .icc_tag_index           (icc_tag_index          ),
  .icc_tag_req             (icc_tag_req            ),
  .l2c_ciu_addr_ready_x    (l2c_ciu_addr_ready_x   ),
  .l2c_dirty_din           (l2c_dirty_din          ),
  .l2c_dirty_dout          (l2c_dirty_dout         ),
  .l2c_dirty_gwen          (l2c_dirty_gwen         ),
  .l2c_dirty_ram_cen       (l2c_dirty_ram_cen      ),
  .l2c_dirty_wen           (l2c_dirty_wen          ),
  .l2c_icg_en              (l2c_icg_en             ),
  .l2c_tag_din             (l2c_tag_din            ),
  .l2c_tag_dirty_fatal_err (l2c_tag_dirty_fatal_err),
  .l2c_tag_dout            (l2c_tag_dout           ),
  .l2c_tag_gwen            (l2c_tag_gwen           ),
  .l2c_tag_index           (l2c_tag_index          ),
  .l2c_tag_ram_cen         (l2c_tag_ram_cen        ),
  .l2c_tag_ram_clk_en_x    (l2c_tag_ram_clk_en_x   ),
  .l2c_tag_wen             (l2c_tag_wen            ),
  .l2c_way0_cp_dout        (l2c_way0_cp_dout       ),
  .l2c_way0_dirty_dout     (l2c_way0_dirty_dout    ),
  .l2c_way0_tag_dout       (l2c_way0_tag_dout      ),
  .l2c_way10_cp_dout       (l2c_way10_cp_dout      ),
  .l2c_way10_dirty_dout    (l2c_way10_dirty_dout   ),
  .l2c_way10_tag_dout      (l2c_way10_tag_dout     ),
  .l2c_way11_cp_dout       (l2c_way11_cp_dout      ),
  .l2c_way11_dirty_dout    (l2c_way11_dirty_dout   ),
  .l2c_way11_tag_dout      (l2c_way11_tag_dout     ),
  .l2c_way12_cp_dout       (l2c_way12_cp_dout      ),
  .l2c_way12_dirty_dout    (l2c_way12_dirty_dout   ),
  .l2c_way12_tag_dout      (l2c_way12_tag_dout     ),
  .l2c_way13_cp_dout       (l2c_way13_cp_dout      ),
  .l2c_way13_dirty_dout    (l2c_way13_dirty_dout   ),
  .l2c_way13_tag_dout      (l2c_way13_tag_dout     ),
  .l2c_way14_cp_dout       (l2c_way14_cp_dout      ),
  .l2c_way14_dirty_dout    (l2c_way14_dirty_dout   ),
  .l2c_way14_tag_dout      (l2c_way14_tag_dout     ),
  .l2c_way15_cp_dout       (l2c_way15_cp_dout      ),
  .l2c_way15_dirty_dout    (l2c_way15_dirty_dout   ),
  .l2c_way15_tag_dout      (l2c_way15_tag_dout     ),
  .l2c_way1_cp_dout        (l2c_way1_cp_dout       ),
  .l2c_way1_dirty_dout     (l2c_way1_dirty_dout    ),
  .l2c_way1_tag_dout       (l2c_way1_tag_dout      ),
  .l2c_way2_cp_dout        (l2c_way2_cp_dout       ),
  .l2c_way2_dirty_dout     (l2c_way2_dirty_dout    ),
  .l2c_way2_tag_dout       (l2c_way2_tag_dout      ),
  .l2c_way3_cp_dout        (l2c_way3_cp_dout       ),
  .l2c_way3_dirty_dout     (l2c_way3_dirty_dout    ),
  .l2c_way3_tag_dout       (l2c_way3_tag_dout      ),
  .l2c_way4_cp_dout        (l2c_way4_cp_dout       ),
  .l2c_way4_dirty_dout     (l2c_way4_dirty_dout    ),
  .l2c_way4_tag_dout       (l2c_way4_tag_dout      ),
  .l2c_way5_cp_dout        (l2c_way5_cp_dout       ),
  .l2c_way5_dirty_dout     (l2c_way5_dirty_dout    ),
  .l2c_way5_tag_dout       (l2c_way5_tag_dout      ),
  .l2c_way6_cp_dout        (l2c_way6_cp_dout       ),
  .l2c_way6_dirty_dout     (l2c_way6_dirty_dout    ),
  .l2c_way6_tag_dout       (l2c_way6_tag_dout      ),
  .l2c_way7_cp_dout        (l2c_way7_cp_dout       ),
  .l2c_way7_dirty_dout     (l2c_way7_dirty_dout    ),
  .l2c_way7_tag_dout       (l2c_way7_tag_dout      ),
  .l2c_way8_cp_dout        (l2c_way8_cp_dout       ),
  .l2c_way8_dirty_dout     (l2c_way8_dirty_dout    ),
  .l2c_way8_tag_dout       (l2c_way8_tag_dout      ),
  .l2c_way9_cp_dout        (l2c_way9_cp_dout       ),
  .l2c_way9_dirty_dout     (l2c_way9_dirty_dout    ),
  .l2c_way9_tag_dout       (l2c_way9_tag_dout      ),
  .l2c_way_dirty           (l2c_way_dirty          ),
  .l2c_way_fifo            (l2c_way_fifo           ),
  .l2c_way_vld             (l2c_way_vld            ),
  .pad_yy_icg_scan_en      (pad_yy_icg_scan_en     ),
  .tag_acc_cnt_zero        (tag_acc_cnt_zero       ),
  .tag_icc_grant           (tag_icc_grant          ),
  .tag_stage_vld           (tag_stage_vld          ),
  .tag_xx_idle             (tag_xx_idle            ),
  .tag_yy_ram_idle         (tag_yy_ram_idle        ),
  .ttecc_flop_vld          (ttecc_flop_vld         ),
  .ttecc_stage_addr        (ttecc_stage_addr       ),
  .ttecc_stage_clrcp       (ttecc_stage_clrcp      ),
  .ttecc_stage_fatal_err   (ttecc_stage_fatal_err  ),
  .ttecc_stage_hpcp_bus    (ttecc_stage_hpcp_bus   ),
  .ttecc_stage_mid         (ttecc_stage_mid        ),
  .ttecc_stage_setcp       (ttecc_stage_setcp      ),
  .ttecc_stage_sid         (ttecc_stage_sid        ),
  .ttecc_stage_src         (ttecc_stage_src        ),
  .ttecc_stage_type        (ttecc_stage_type       ),
  .ttecc_stage_write_raw   (ttecc_stage_write_raw  ),
  .wb_dirty_cen            (wb_dirty_cen           ),
  .wb_dirty_gwen           (wb_dirty_gwen          ),
  .wb_dirty_way            (wb_dirty_way           ),
  .wb_dirty_wen            (wb_dirty_wen           ),
  .wb_ecc_rfifo_empty      (wb_ecc_rfifo_empty     ),
  .wb_tag_cen              (wb_tag_cen             ),
  .wb_tag_gwen             (wb_tag_gwen            ),
  .wb_tag_index            (wb_tag_index           ),
  .wb_tag_req              (wb_tag_req             )
);

// &Instance("ct_l2c_cmp","x_ct_l2c_cmp"); @63
ct_l2c_cmp  x_ct_l2c_cmp (
  .ciu_l2c_snpl2_ready_x   (ciu_l2c_snpl2_ready_x  ),
  .cmp_data_index          (cmp_data_index         ),
  .cmp_data_req            (cmp_data_req           ),
  .cmp_data_req_gate       (cmp_data_req_gate      ),
  .cmp_data_vld            (cmp_data_vld           ),
  .cmp_data_wen            (cmp_data_wen           ),
  .cmp_dirty_cen           (cmp_dirty_cen          ),
  .cmp_dirty_din           (cmp_dirty_din          ),
  .cmp_dirty_gwen          (cmp_dirty_gwen         ),
  .cmp_dirty_way           (cmp_dirty_way          ),
  .cmp_dirty_wen           (cmp_dirty_wen          ),
  .cmp_pref_addr_x         (cmp_pref_addr_x        ),
  .cmp_pref_cache_miss_x   (cmp_pref_cache_miss_x  ),
  .cmp_pref_ifu_req_x      (cmp_pref_ifu_req_x     ),
  .cmp_pref_read_x         (cmp_pref_read_x        ),
  .cmp_pref_tlb_req_x      (cmp_pref_tlb_req_x     ),
  .cmp_pref_vld_x          (cmp_pref_vld_x         ),
  .cmp_refill_ptr          (cmp_refill_ptr         ),
  .cmp_req_vld             (cmp_req_vld            ),
  .cmp_rfifo_cp            (cmp_rfifo_cp           ),
  .cmp_rfifo_create        (cmp_rfifo_create       ),
  .cmp_rfifo_resp          (cmp_rfifo_resp         ),
  .cmp_rfifo_sid           (cmp_rfifo_sid          ),
  .cmp_stage_addr          (cmp_stage_addr         ),
  .cmp_stage_cp            (cmp_stage_cp           ),
  .cmp_stage_resp          (cmp_stage_resp         ),
  .cmp_stage_sid           (cmp_stage_sid          ),
  .cmp_stage_src           (cmp_stage_src          ),
  .cmp_stage_stall         (cmp_stage_stall        ),
  .cmp_stage_vld           (cmp_stage_vld          ),
  .cmp_stage_write         (cmp_stage_write        ),
  .cmp_stall_by_data       (cmp_stall_by_data      ),
  .cmp_tag_cen             (cmp_tag_cen            ),
  .cmp_tag_gwen            (cmp_tag_gwen           ),
  .cmp_tag_index           (cmp_tag_index          ),
  .cmp_tag_wen             (cmp_tag_wen            ),
  .cmp_way_v_hit           (cmp_way_v_hit          ),
  .cmp_way_vd_hit          (cmp_way_vd_hit         ),
  .cmp_way_vs_hit          (cmp_way_vs_hit         ),
  .cmp_way_vu_hit          (cmp_way_vu_hit         ),
  .cmp_yy_wdata_pop        (cmp_yy_wdata_pop       ),
  .cmp_yy_wdata_pop_gate   (cmp_yy_wdata_pop_gate  ),
  .cpurst_b                (cpurst_b               ),
  .data_yy_ram_idle        (data_yy_ram_idle       ),
  .forever_cpuclk          (forever_cpuclk         ),
  .l2c_ciu_hpcp_acc_inc_x  (l2c_ciu_hpcp_acc_inc_x ),
  .l2c_ciu_hpcp_mid_x      (l2c_ciu_hpcp_mid_x     ),
  .l2c_ciu_hpcp_miss_inc_x (l2c_ciu_hpcp_miss_inc_x),
  .l2c_ciu_snpl2_addr_x    (l2c_ciu_snpl2_addr_x   ),
  .l2c_ciu_snpl2_ini_sid_x (l2c_ciu_snpl2_ini_sid_x),
  .l2c_ciu_snpl2_vld_x     (l2c_ciu_snpl2_vld_x    ),
  .l2c_clk                 (l2c_clk                ),
  .l2c_icg_en              (l2c_icg_en             ),
  .l2c_way0_cp_dout        (l2c_way0_cp_dout       ),
  .l2c_way0_dirty_dout     (l2c_way0_dirty_dout    ),
  .l2c_way0_tag_dout       (l2c_way0_tag_dout      ),
  .l2c_way10_cp_dout       (l2c_way10_cp_dout      ),
  .l2c_way10_dirty_dout    (l2c_way10_dirty_dout   ),
  .l2c_way10_tag_dout      (l2c_way10_tag_dout     ),
  .l2c_way11_cp_dout       (l2c_way11_cp_dout      ),
  .l2c_way11_dirty_dout    (l2c_way11_dirty_dout   ),
  .l2c_way11_tag_dout      (l2c_way11_tag_dout     ),
  .l2c_way12_cp_dout       (l2c_way12_cp_dout      ),
  .l2c_way12_dirty_dout    (l2c_way12_dirty_dout   ),
  .l2c_way12_tag_dout      (l2c_way12_tag_dout     ),
  .l2c_way13_cp_dout       (l2c_way13_cp_dout      ),
  .l2c_way13_dirty_dout    (l2c_way13_dirty_dout   ),
  .l2c_way13_tag_dout      (l2c_way13_tag_dout     ),
  .l2c_way14_cp_dout       (l2c_way14_cp_dout      ),
  .l2c_way14_dirty_dout    (l2c_way14_dirty_dout   ),
  .l2c_way14_tag_dout      (l2c_way14_tag_dout     ),
  .l2c_way15_cp_dout       (l2c_way15_cp_dout      ),
  .l2c_way15_dirty_dout    (l2c_way15_dirty_dout   ),
  .l2c_way15_tag_dout      (l2c_way15_tag_dout     ),
  .l2c_way1_cp_dout        (l2c_way1_cp_dout       ),
  .l2c_way1_dirty_dout     (l2c_way1_dirty_dout    ),
  .l2c_way1_tag_dout       (l2c_way1_tag_dout      ),
  .l2c_way2_cp_dout        (l2c_way2_cp_dout       ),
  .l2c_way2_dirty_dout     (l2c_way2_dirty_dout    ),
  .l2c_way2_tag_dout       (l2c_way2_tag_dout      ),
  .l2c_way3_cp_dout        (l2c_way3_cp_dout       ),
  .l2c_way3_dirty_dout     (l2c_way3_dirty_dout    ),
  .l2c_way3_tag_dout       (l2c_way3_tag_dout      ),
  .l2c_way4_cp_dout        (l2c_way4_cp_dout       ),
  .l2c_way4_dirty_dout     (l2c_way4_dirty_dout    ),
  .l2c_way4_tag_dout       (l2c_way4_tag_dout      ),
  .l2c_way5_cp_dout        (l2c_way5_cp_dout       ),
  .l2c_way5_dirty_dout     (l2c_way5_dirty_dout    ),
  .l2c_way5_tag_dout       (l2c_way5_tag_dout      ),
  .l2c_way6_cp_dout        (l2c_way6_cp_dout       ),
  .l2c_way6_dirty_dout     (l2c_way6_dirty_dout    ),
  .l2c_way6_tag_dout       (l2c_way6_tag_dout      ),
  .l2c_way7_cp_dout        (l2c_way7_cp_dout       ),
  .l2c_way7_dirty_dout     (l2c_way7_dirty_dout    ),
  .l2c_way7_tag_dout       (l2c_way7_tag_dout      ),
  .l2c_way8_cp_dout        (l2c_way8_cp_dout       ),
  .l2c_way8_dirty_dout     (l2c_way8_dirty_dout    ),
  .l2c_way8_tag_dout       (l2c_way8_tag_dout      ),
  .l2c_way9_cp_dout        (l2c_way9_cp_dout       ),
  .l2c_way9_dirty_dout     (l2c_way9_dirty_dout    ),
  .l2c_way9_tag_dout       (l2c_way9_tag_dout      ),
  .l2c_way_fifo            (l2c_way_fifo           ),
  .l2c_way_vld             (l2c_way_vld            ),
  .pad_yy_icg_scan_en      (pad_yy_icg_scan_en     ),
  .tag_yy_ram_idle         (tag_yy_ram_idle        ),
  .ttecc_flop_vld          (ttecc_flop_vld         ),
  .ttecc_stage_addr        (ttecc_stage_addr       ),
  .ttecc_stage_clrcp       (ttecc_stage_clrcp      ),
  .ttecc_stage_fatal_err   (ttecc_stage_fatal_err  ),
  .ttecc_stage_hpcp_bus    (ttecc_stage_hpcp_bus   ),
  .ttecc_stage_mid         (ttecc_stage_mid        ),
  .ttecc_stage_setcp       (ttecc_stage_setcp      ),
  .ttecc_stage_sid         (ttecc_stage_sid        ),
  .ttecc_stage_src         (ttecc_stage_src        ),
  .ttecc_stage_type        (ttecc_stage_type       ),
  .ttecc_stage_write_raw   (ttecc_stage_write_raw  )
);

// &Instance("ct_l2c_data","x_ct_l2c_data"); @64
ct_l2c_data  x_ct_l2c_data (
  .ciu_l2c_data_acc_cycle (ciu_l2c_data_acc_cycle),
  .ciu_l2c_data_setup     (ciu_l2c_data_setup    ),
  .cmp_data_din           (cmp_data_din          ),
  .cmp_data_index         (cmp_data_index        ),
  .cmp_data_req           (cmp_data_req          ),
  .cmp_data_req_gate      (cmp_data_req_gate     ),
  .cmp_data_wen           (cmp_data_wen          ),
  .cmp_stage_addr         (cmp_stage_addr        ),
  .cmp_stage_cp           (cmp_stage_cp          ),
  .cmp_stage_resp         (cmp_stage_resp        ),
  .cmp_stage_sid          (cmp_stage_sid         ),
  .cmp_stage_src          (cmp_stage_src         ),
  .cmp_stage_write        (cmp_stage_write       ),
  .cpurst_b               (cpurst_b              ),
  .data_ecc_ram_cen       (data_ecc_ram_cen      ),
  .data_ecc_wen           (data_ecc_wen          ),
  .data_icc_grant         (data_icc_grant        ),
  .data_stage_cp          (data_stage_cp         ),
  .data_stage_index       (data_stage_index      ),
  .data_stage_resp        (data_stage_resp       ),
  .data_stage_sid         (data_stage_sid        ),
  .data_stage_vld         (data_stage_vld        ),
  .data_xx_idle           (data_xx_idle          ),
  .data_yy_flop_vld       (data_yy_flop_vld      ),
  .data_yy_ram_idle       (data_yy_ram_idle      ),
  .forever_cpuclk         (forever_cpuclk        ),
  .icc_data_cen           (icc_data_cen          ),
  .icc_data_flop          (icc_data_flop         ),
  .icc_data_index         (icc_data_index        ),
  .icc_data_req           (icc_data_req          ),
  .l2c_clk                (l2c_clk               ),
  .l2c_data_din           (l2c_data_din          ),
  .l2c_data_dout          (l2c_data_dout         ),
  .l2c_data_dout_flop     (l2c_data_dout_flop    ),
  .l2c_data_index0        (l2c_data_index0       ),
  .l2c_data_index1        (l2c_data_index1       ),
  .l2c_data_index2        (l2c_data_index2       ),
  .l2c_data_index3        (l2c_data_index3       ),
  .l2c_data_ram_cen       (l2c_data_ram_cen      ),
  .l2c_data_ram_clk_en_x  (l2c_data_ram_clk_en_x ),
  .l2c_data_wen           (l2c_data_wen          ),
  .l2c_icg_en             (l2c_icg_en            ),
  .pad_yy_icg_scan_en     (pad_yy_icg_scan_en    )
);

// &Instance("ct_l2c_wb","x_ct_l2c_wb"); @65
ct_l2c_wb  x_ct_l2c_wb (
  .cmp_rfifo_cp       (cmp_rfifo_cp      ),
  .cmp_rfifo_create   (cmp_rfifo_create  ),
  .cmp_rfifo_resp     (cmp_rfifo_resp    ),
  .cmp_rfifo_sid      (cmp_rfifo_sid     ),
  .cmp_stage_vld      (cmp_stage_vld     ),
  .cpurst_b           (cpurst_b          ),
  .data_stage_cp      (data_stage_cp     ),
  .data_stage_resp    (data_stage_resp   ),
  .data_stage_sid     (data_stage_sid    ),
  .data_stage_vld     (data_stage_vld    ),
  .data_yy_flop_vld   (data_yy_flop_vld  ),
  .forever_cpuclk     (forever_cpuclk    ),
  .l2c_ciu_cmplt_x    (l2c_ciu_cmplt_x   ),
  .l2c_ciu_cp_x       (l2c_ciu_cp_x      ),
  .l2c_ciu_data_x     (l2c_ciu_data_x    ),
  .l2c_ciu_resp_x     (l2c_ciu_resp_x    ),
  .l2c_ciu_sid_x      (l2c_ciu_sid_x     ),
  .l2c_clk            (l2c_clk           ),
  .l2c_data_dout_flop (l2c_data_dout_flop),
  .l2c_icg_en         (l2c_icg_en        ),
  .l2c_pipeline_rdy   (l2c_pipeline_rdy  ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en),
  .rfifo_empty        (rfifo_empty       ),
  .tag_stage_vld      (tag_stage_vld     ),
  .wb_dirty_cen       (wb_dirty_cen      ),
  .wb_dirty_gwen      (wb_dirty_gwen     ),
  .wb_dirty_way       (wb_dirty_way      ),
  .wb_dirty_wen       (wb_dirty_wen      ),
  .wb_ecc_rfifo_empty (wb_ecc_rfifo_empty),
  .wb_stage_fatal_err (wb_stage_fatal_err),
  .wb_stage_vld       (wb_stage_vld      ),
  .wb_tag_cen         (wb_tag_cen        ),
  .wb_tag_gwen        (wb_tag_gwen       ),
  .wb_tag_index       (wb_tag_index      ),
  .wb_tag_req         (wb_tag_req        )
);

// &Instance("ct_l2c_icc","x_ct_l2c_icc"); @66
ct_l2c_icc  x_ct_l2c_icc (
  .ciu_l2c_ctcq_req_x      (ciu_l2c_ctcq_req_x     ),
  .ciu_l2c_dca_addr_x      (ciu_l2c_dca_addr_x     ),
  .ciu_l2c_dca_req_x       (ciu_l2c_dca_req_x      ),
  .ciu_l2c_icc_mid_x       (ciu_l2c_icc_mid_x      ),
  .ciu_l2c_icc_type_x      (ciu_l2c_icc_type_x     ),
  .ciu_l2c_rdl_ready_x     (ciu_l2c_rdl_ready_x    ),
  .ciu_l2c_rst_req         (ciu_l2c_rst_req        ),
  .cpurst_b                (cpurst_b               ),
  .data_icc_grant          (data_icc_grant         ),
  .forever_cpuclk          (forever_cpuclk         ),
  .icc_data_cen            (icc_data_cen           ),
  .icc_data_flop           (icc_data_flop          ),
  .icc_data_index          (icc_data_index         ),
  .icc_data_req            (icc_data_req           ),
  .icc_dca_dirty_f         (icc_dca_dirty_f        ),
  .icc_dca_tag_f           (icc_dca_tag_f          ),
  .icc_dca_way_sel         (icc_dca_way_sel        ),
  .icc_dirty_cen           (icc_dirty_cen          ),
  .icc_dirty_gwen          (icc_dirty_gwen         ),
  .icc_dirty_wen           (icc_dirty_wen          ),
  .icc_idle                (icc_idle               ),
  .icc_tag_cen             (icc_tag_cen            ),
  .icc_tag_flop            (icc_tag_flop           ),
  .icc_tag_gwen            (icc_tag_gwen           ),
  .icc_tag_index           (icc_tag_index          ),
  .icc_tag_req             (icc_tag_req            ),
  .l2c_ciu_ctcq_cmplt_x    (l2c_ciu_ctcq_cmplt_x   ),
  .l2c_ciu_ctcq_ready_x    (l2c_ciu_ctcq_ready_x   ),
  .l2c_ciu_dca_cmplt_x     (l2c_ciu_dca_cmplt_x    ),
  .l2c_ciu_dca_data_x      (l2c_ciu_dca_data_x     ),
  .l2c_ciu_dca_ready_x     (l2c_ciu_dca_ready_x    ),
  .l2c_ciu_rdl_addr_x      (l2c_ciu_rdl_addr_x     ),
  .l2c_ciu_rdl_dvld_x      (l2c_ciu_rdl_dvld_x     ),
  .l2c_ciu_rdl_mid_x       (l2c_ciu_rdl_mid_x      ),
  .l2c_ciu_rdl_prot_x      (l2c_ciu_rdl_prot_x     ),
  .l2c_ciu_rdl_rvld_x      (l2c_ciu_rdl_rvld_x     ),
  .l2c_data_dout_flop      (l2c_data_dout_flop     ),
  .l2c_flush_done_x        (l2c_flush_done_x       ),
  .l2c_flush_req_x         (l2c_flush_req_x        ),
  .l2c_icg_en              (l2c_icg_en             ),
  .l2c_pipeline_rdy        (l2c_pipeline_rdy       ),
  .l2c_tag_dirty_fatal_err (l2c_tag_dirty_fatal_err),
  .l2c_way0_tag_dout       (l2c_way0_tag_dout      ),
  .l2c_way10_tag_dout      (l2c_way10_tag_dout     ),
  .l2c_way11_tag_dout      (l2c_way11_tag_dout     ),
  .l2c_way12_tag_dout      (l2c_way12_tag_dout     ),
  .l2c_way13_tag_dout      (l2c_way13_tag_dout     ),
  .l2c_way14_tag_dout      (l2c_way14_tag_dout     ),
  .l2c_way15_tag_dout      (l2c_way15_tag_dout     ),
  .l2c_way1_tag_dout       (l2c_way1_tag_dout      ),
  .l2c_way2_tag_dout       (l2c_way2_tag_dout      ),
  .l2c_way3_tag_dout       (l2c_way3_tag_dout      ),
  .l2c_way4_tag_dout       (l2c_way4_tag_dout      ),
  .l2c_way5_tag_dout       (l2c_way5_tag_dout      ),
  .l2c_way6_tag_dout       (l2c_way6_tag_dout      ),
  .l2c_way7_tag_dout       (l2c_way7_tag_dout      ),
  .l2c_way8_tag_dout       (l2c_way8_tag_dout      ),
  .l2c_way9_tag_dout       (l2c_way9_tag_dout      ),
  .l2c_way_dirty           (l2c_way_dirty          ),
  .l2c_way_vld             (l2c_way_vld            ),
  .pad_yy_icg_scan_en      (pad_yy_icg_scan_en     ),
  .tag_acc_cnt_zero        (tag_acc_cnt_zero       ),
  .tag_icc_grant           (tag_icc_grant          ),
  .wb_stage_fatal_err      (wb_stage_fatal_err     )
);


// &Instance("ct_l2c_ecc","x_ct_l2c_ecc"); @69
// &Force("nonport","data_ecc_ram_cen"); @71
// &Force("nonport","data_ecc_wen"); @72
assign l2c_ciu_data_ready_x = cmp_yy_wdata_pop;
assign l2c_ciu_data_ready_gate_x = cmp_yy_wdata_pop_gate;
assign cmp_data_vld  = ciu_l2c_data_vld_x;
assign cmp_data_din[511:0] = ciu_l2c_wdata_x[511:0];

// &Instance("ct_l2cache_top","x_ct_l2cache_top"); @79
ct_l2cache_top  x_ct_l2cache_top (
  .l2c_data_clk_x     (l2c_data_clk_x    ),
  .l2c_data_din       (l2c_data_din      ),
  .l2c_data_dout      (l2c_data_dout     ),
  .l2c_data_index0    (l2c_data_index0   ),
  .l2c_data_index1    (l2c_data_index1   ),
  .l2c_data_index2    (l2c_data_index2   ),
  .l2c_data_index3    (l2c_data_index3   ),
  .l2c_data_ram_cen   (l2c_data_ram_cen  ),
  .l2c_data_wen       (l2c_data_wen      ),
  .l2c_dirty_din      (l2c_dirty_din     ),
  .l2c_dirty_dout     (l2c_dirty_dout    ),
  .l2c_dirty_gwen     (l2c_dirty_gwen    ),
  .l2c_dirty_ram_cen  (l2c_dirty_ram_cen ),
  .l2c_dirty_wen      (l2c_dirty_wen     ),
  .l2c_tag_clk_x      (l2c_tag_clk_x     ),
  .l2c_tag_din        (l2c_tag_din       ),
  .l2c_tag_dout       (l2c_tag_dout      ),
  .l2c_tag_gwen       (l2c_tag_gwen      ),
  .l2c_tag_index      (l2c_tag_index     ),
  .l2c_tag_ram_cen    (l2c_tag_ram_cen   ),
  .l2c_tag_wen        (l2c_tag_wen       ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);


// &ModuleEnd; @81
endmodule


