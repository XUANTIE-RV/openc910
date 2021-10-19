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
module ct_l2c_cmp(
  ciu_l2c_snpl2_ready_x,
  cmp_data_index,
  cmp_data_req,
  cmp_data_req_gate,
  cmp_data_vld,
  cmp_data_wen,
  cmp_dirty_cen,
  cmp_dirty_din,
  cmp_dirty_gwen,
  cmp_dirty_way,
  cmp_dirty_wen,
  cmp_pref_addr_x,
  cmp_pref_cache_miss_x,
  cmp_pref_ifu_req_x,
  cmp_pref_read_x,
  cmp_pref_tlb_req_x,
  cmp_pref_vld_x,
  cmp_refill_ptr,
  cmp_req_vld,
  cmp_rfifo_cp,
  cmp_rfifo_create,
  cmp_rfifo_resp,
  cmp_rfifo_sid,
  cmp_stage_addr,
  cmp_stage_cp,
  cmp_stage_resp,
  cmp_stage_sid,
  cmp_stage_src,
  cmp_stage_stall,
  cmp_stage_vld,
  cmp_stage_write,
  cmp_stall_by_data,
  cmp_tag_cen,
  cmp_tag_gwen,
  cmp_tag_index,
  cmp_tag_wen,
  cmp_way_v_hit,
  cmp_way_vd_hit,
  cmp_way_vs_hit,
  cmp_way_vu_hit,
  cmp_yy_wdata_pop,
  cmp_yy_wdata_pop_gate,
  cpurst_b,
  data_yy_ram_idle,
  forever_cpuclk,
  l2c_ciu_hpcp_acc_inc_x,
  l2c_ciu_hpcp_mid_x,
  l2c_ciu_hpcp_miss_inc_x,
  l2c_ciu_snpl2_addr_x,
  l2c_ciu_snpl2_ini_sid_x,
  l2c_ciu_snpl2_vld_x,
  l2c_clk,
  l2c_icg_en,
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
  l2c_way_fifo,
  l2c_way_vld,
  pad_yy_icg_scan_en,
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
  ttecc_stage_write_raw
);

// &Ports; @23
input            ciu_l2c_snpl2_ready_x;  
input            cmp_data_vld;           
input   [15 :0]  cmp_refill_ptr;         
input   [15 :0]  cmp_way_v_hit;          
input   [15 :0]  cmp_way_vd_hit;         
input   [15 :0]  cmp_way_vs_hit;         
input   [15 :0]  cmp_way_vu_hit;         
input            cpurst_b;               
input            data_yy_ram_idle;       
input            forever_cpuclk;         
input            l2c_clk;                
input            l2c_icg_en;             
input   [3  :0]  l2c_way0_cp_dout;       
input   [7  :0]  l2c_way0_dirty_dout;    
input   [23 :0]  l2c_way0_tag_dout;      
input   [3  :0]  l2c_way10_cp_dout;      
input   [7  :0]  l2c_way10_dirty_dout;   
input   [23 :0]  l2c_way10_tag_dout;     
input   [3  :0]  l2c_way11_cp_dout;      
input   [7  :0]  l2c_way11_dirty_dout;   
input   [23 :0]  l2c_way11_tag_dout;     
input   [3  :0]  l2c_way12_cp_dout;      
input   [7  :0]  l2c_way12_dirty_dout;   
input   [23 :0]  l2c_way12_tag_dout;     
input   [3  :0]  l2c_way13_cp_dout;      
input   [7  :0]  l2c_way13_dirty_dout;   
input   [23 :0]  l2c_way13_tag_dout;     
input   [3  :0]  l2c_way14_cp_dout;      
input   [7  :0]  l2c_way14_dirty_dout;   
input   [23 :0]  l2c_way14_tag_dout;     
input   [3  :0]  l2c_way15_cp_dout;      
input   [7  :0]  l2c_way15_dirty_dout;   
input   [23 :0]  l2c_way15_tag_dout;     
input   [3  :0]  l2c_way1_cp_dout;       
input   [7  :0]  l2c_way1_dirty_dout;    
input   [23 :0]  l2c_way1_tag_dout;      
input   [3  :0]  l2c_way2_cp_dout;       
input   [7  :0]  l2c_way2_dirty_dout;    
input   [23 :0]  l2c_way2_tag_dout;      
input   [3  :0]  l2c_way3_cp_dout;       
input   [7  :0]  l2c_way3_dirty_dout;    
input   [23 :0]  l2c_way3_tag_dout;      
input   [3  :0]  l2c_way4_cp_dout;       
input   [7  :0]  l2c_way4_dirty_dout;    
input   [23 :0]  l2c_way4_tag_dout;      
input   [3  :0]  l2c_way5_cp_dout;       
input   [7  :0]  l2c_way5_dirty_dout;    
input   [23 :0]  l2c_way5_tag_dout;      
input   [3  :0]  l2c_way6_cp_dout;       
input   [7  :0]  l2c_way6_dirty_dout;    
input   [23 :0]  l2c_way6_tag_dout;      
input   [3  :0]  l2c_way7_cp_dout;       
input   [7  :0]  l2c_way7_dirty_dout;    
input   [23 :0]  l2c_way7_tag_dout;      
input   [3  :0]  l2c_way8_cp_dout;       
input   [7  :0]  l2c_way8_dirty_dout;    
input   [23 :0]  l2c_way8_tag_dout;      
input   [3  :0]  l2c_way9_cp_dout;       
input   [7  :0]  l2c_way9_dirty_dout;    
input   [23 :0]  l2c_way9_tag_dout;      
input   [15 :0]  l2c_way_fifo;           
input   [15 :0]  l2c_way_vld;            
input            pad_yy_icg_scan_en;     
input            tag_yy_ram_idle;        
input            ttecc_flop_vld;         
input   [32 :0]  ttecc_stage_addr;       
input   [3  :0]  ttecc_stage_clrcp;      
input            ttecc_stage_fatal_err;  
input   [2  :0]  ttecc_stage_hpcp_bus;   
input   [2  :0]  ttecc_stage_mid;        
input   [3  :0]  ttecc_stage_setcp;      
input   [4  :0]  ttecc_stage_sid;        
input   [1  :0]  ttecc_stage_src;        
input   [12 :0]  ttecc_stage_type;       
input            ttecc_stage_write_raw;  
output  [12 :0]  cmp_data_index;         
output           cmp_data_req;           
output           cmp_data_req_gate;      
output           cmp_data_wen;           
output           cmp_dirty_cen;          
output  [143:0]  cmp_dirty_din;          
output           cmp_dirty_gwen;         
output  [15 :0]  cmp_dirty_way;          
output  [8  :0]  cmp_dirty_wen;          
output  [32 :0]  cmp_pref_addr_x;        
output           cmp_pref_cache_miss_x;  
output           cmp_pref_ifu_req_x;     
output           cmp_pref_read_x;        
output           cmp_pref_tlb_req_x;     
output           cmp_pref_vld_x;         
output           cmp_req_vld;            
output  [3  :0]  cmp_rfifo_cp;           
output           cmp_rfifo_create;       
output  [4  :0]  cmp_rfifo_resp;         
output  [4  :0]  cmp_rfifo_sid;          
output  [32 :0]  cmp_stage_addr;         
output  [3  :0]  cmp_stage_cp;           
output  [4  :0]  cmp_stage_resp;         
output  [4  :0]  cmp_stage_sid;          
output  [1  :0]  cmp_stage_src;          
output           cmp_stage_stall;        
output           cmp_stage_vld;          
output           cmp_stage_write;        
output           cmp_stall_by_data;      
output           cmp_tag_cen;            
output           cmp_tag_gwen;           
output  [8  :0]  cmp_tag_index;          
output  [15 :0]  cmp_tag_wen;            
output           cmp_yy_wdata_pop;       
output           cmp_yy_wdata_pop_gate;  
output  [1  :0]  l2c_ciu_hpcp_acc_inc_x; 
output  [2  :0]  l2c_ciu_hpcp_mid_x;     
output  [1  :0]  l2c_ciu_hpcp_miss_inc_x; 
output  [32 :0]  l2c_ciu_snpl2_addr_x;   
output  [4  :0]  l2c_ciu_snpl2_ini_sid_x; 
output           l2c_ciu_snpl2_vld_x;    

// &Regs; @24
reg              cmp_data_piped_down;    
reg     [3  :0]  cmp_data_way;           
reg     [32 :0]  cmp_stage_addr;         
reg     [3  :0]  cmp_stage_clrcp;        
reg              cmp_stage_fatal_err;    
reg     [2  :0]  cmp_stage_hpcp_bus;     
reg     [2  :0]  cmp_stage_mid;          
reg     [3  :0]  cmp_stage_setcp;        
reg     [4  :0]  cmp_stage_sid;          
reg     [1  :0]  cmp_stage_src;          
reg     [12 :0]  cmp_stage_type;         
reg              cmp_stage_vld;          
reg              cmp_stage_write_raw;    
reg              snpl2_granted;          

// &Wires; @25
wire             alct_create_rfifo;      
wire             alct_done;              
wire             atag_create_rfifo;      
wire             ciu_l2c_snpl2_ready_x;  
wire             cln_create_rfifo;       
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
wire             cmp_dp_clk;             
wire             cmp_dp_clk_en;          
wire             cmp_hit_way_dirty;      
wire             cmp_hit_way_shared;     
wire             cmp_hit_way_unique;     
wire    [32 :0]  cmp_pref_addr_x;        
wire             cmp_pref_cache_miss_x;  
wire             cmp_pref_ifu_req_x;     
wire             cmp_pref_read_x;        
wire             cmp_pref_tlb_req_x;     
wire             cmp_pref_vld_x;         
wire    [15 :0]  cmp_refill_ptr;         
wire             cmp_req_vld;            
wire    [15 :0]  cmp_req_way_ptr;        
wire    [3  :0]  cmp_rfifo_cp;           
wire             cmp_rfifo_create;       
wire    [4  :0]  cmp_rfifo_resp;         
wire    [4  :0]  cmp_rfifo_sid;          
wire             cmp_rplc_way_vld;       
wire             cmp_stage_alct;         
wire             cmp_stage_atag;         
wire             cmp_stage_cln;          
wire    [3  :0]  cmp_stage_cp;           
wire             cmp_stage_icln;         
wire             cmp_stage_inv;          
wire             cmp_stage_nop;          
wire             cmp_stage_read;         
wire             cmp_stage_refill;       
wire             cmp_stage_release;      
wire    [4  :0]  cmp_stage_resp;         
wire             cmp_stage_shared;       
wire             cmp_stage_stall;        
wire             cmp_stage_unique;       
wire             cmp_stage_write;        
wire             cmp_stage_write_sc;     
wire             cmp_stage_write_sd;     
wire             cmp_stage_write_uc;     
wire             cmp_stage_write_ud;     
wire             cmp_stall_by_data;      
wire    [15 :0]  cmp_status_ptr;         
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
wire             cp_clr;                 
wire             cp_create_rfifo;        
wire             cp_set;                 
wire    [3  :0]  cp_wen;                 
wire             cpurst_b;               
wire             data_rd;                
wire             data_wr;                
wire             data_yy_ram_idle;       
wire             dirty_clr;              
wire             dirty_req_vld;          
wire             dirty_set;              
wire             dirty_updt;             
wire             dirty_wen;              
wire             err_create_rfifo;       
wire    [15 :0]  fifo_din;               
wire             fifo_updt;              
wire             fifo_wen;               
wire             forever_cpuclk;         
wire             icln_create_rfifo;      
wire             inv_create_rfifo;       
wire             l2c_cache_hit;          
wire             l2c_cache_miss;         
wire    [1  :0]  l2c_ciu_hpcp_acc_inc_x; 
wire    [2  :0]  l2c_ciu_hpcp_mid_x;     
wire    [1  :0]  l2c_ciu_hpcp_miss_inc_x; 
wire    [32 :0]  l2c_ciu_snpl2_addr_x;   
wire    [4  :0]  l2c_ciu_snpl2_ini_sid_x; 
wire             l2c_ciu_snpl2_vld_x;    
wire             l2c_clk;                
wire             l2c_icg_en;             
wire    [7  :0]  l2c_status_din;         
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
wire    [15 :0]  l2c_way_fifo;           
wire    [15 :0]  l2c_way_vld;            
wire             pad_yy_icg_scan_en;     
wire             pend_clr;               
wire             pend_set;               
wire             pend_wen;               
wire             rd_first;               
wire             read_acc_vld;           
wire             read_create_rfifo;      
wire             read_miss_vld;          
wire             release_create_rfifo;   
wire    [23 :0]  rplc_tag;               
wire             shared_clr;             
wire             shared_create_rfifo;    
wire             shared_set;             
wire             shared_wen;             
wire             snpl2_grant;            
wire             stall_by_read;          
wire             stall_by_write;         
wire    [7  :0]  status_clr_din;         
wire    [7  :0]  status_din;             
wire    [7  :0]  status_set_din;         
wire    [7  :0]  status_wen;             
wire             tag_updt;               
wire             tag_wen;                
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
wire             uni_create_rfifo;       
wire             valid_clr;              
wire             valid_set;              
wire             valid_wen;              
wire             write_acc_vld;          
wire             write_create_rfifo;     
wire             write_miss_inc;         
wire             wt_first;               


parameter TAG_INDEX_LENTH  = `L2C_TAG_INDEX_WIDTH; 
parameter TAG_TAG_LENTH    = `L2C_TAG_DATA_WIDTH;
parameter DATA_INDEX_LENTH = `L2C_DATA_INDEX_WIDTH;
parameter L2C_ADDRW        = 33;

// &Force("output","cmp_stage_addr"); @32
// &Force("output","cmp_stage_sid"); @33
// &Force("output","cmp_stage_vld"); @34
// &Force("output","cmp_stage_write"); @35
// &Force("output","cmp_req_vld"); @36
// &Force("output","cmp_stage_stall"); @37

assign cmp_dp_clk_en = ttecc_flop_vld;

// &Instance("gated_clk_cell", "x_l2c_cmp_dp_gated_clk"); @41
gated_clk_cell  x_l2c_cmp_dp_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (cmp_dp_clk        ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (cmp_dp_clk_en     ),
  .module_en          (l2c_icg_en        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in        (forever_cpuclk     ), @42
//          .external_en   (1'b0               ), @43
//          .global_en     (1'b1               ), @44
//          .module_en (l2c_icg_en     ), @45
//          .local_en      (cmp_dp_clk_en      ), @46
//          .clk_out       (cmp_dp_clk         ) @47
//         ); @48

//==============================================================================
//                               CMP STAGE 
//==============================================================================
// cmp stage should request tag and dirty only when its data request can be accepted by DATA RAM
assign cmp_stage_stall = cmp_stage_vld & (cmp_stall_by_data | cmp_req_vld & !tag_yy_ram_idle);

always@(posedge l2c_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    cmp_stage_vld <= 1'b0;
  else if(!cmp_stage_stall)
    cmp_stage_vld <= ttecc_flop_vld;
  else
    cmp_stage_vld <= cmp_stage_vld;
end

// &Force("output", "cmp_stage_src"); @66
always@(posedge cmp_dp_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
  begin
    cmp_stage_addr[L2C_ADDRW-1:0] <= {L2C_ADDRW{1'b0}};
    cmp_stage_sid[4:0]            <= 5'b0;
    cmp_stage_type[12:0]          <= 13'b0;
    cmp_stage_src[1:0]            <= 2'b0;
    cmp_stage_clrcp[3:0]          <= 4'b0;
    cmp_stage_setcp[3:0]          <= 4'b0;
    cmp_stage_fatal_err           <= 1'b0;
    cmp_stage_write_raw           <= 1'b0;
    cmp_stage_hpcp_bus[2:0]       <= 3'b0; 
    cmp_stage_mid[2:0]            <= 3'b0;
  end
  else if(ttecc_flop_vld & !cmp_stage_stall)
  begin
    cmp_stage_addr[L2C_ADDRW-1:0] <= ttecc_stage_addr[L2C_ADDRW-1:0];
    cmp_stage_sid[4:0]            <= ttecc_stage_sid[4:0];
    cmp_stage_type[12:0]          <= ttecc_stage_type[12:0];
    cmp_stage_src[1:0]            <= ttecc_stage_src[1:0];
    cmp_stage_clrcp[3:0]          <= ttecc_stage_clrcp[3:0];
    cmp_stage_setcp[3:0]          <= ttecc_stage_setcp[3:0];
    cmp_stage_fatal_err           <= ttecc_stage_fatal_err;
    cmp_stage_write_raw           <= ttecc_stage_write_raw;
    cmp_stage_hpcp_bus[2:0]       <= ttecc_stage_hpcp_bus[2:0];
    cmp_stage_mid[2:0]            <= ttecc_stage_mid[2:0];
  end
end

assign cmp_stage_read     = cmp_stage_type[12];
assign cmp_stage_alct     = cmp_stage_type[11];
assign cmp_stage_cln      = cmp_stage_type[10];
assign cmp_stage_icln     = cmp_stage_type[9];
assign cmp_stage_write_sd = cmp_stage_type[8];
assign cmp_stage_write_uc = cmp_stage_type[7];
assign cmp_stage_write_ud = cmp_stage_type[6];
assign cmp_stage_write_sc = cmp_stage_type[5];
assign cmp_stage_atag     = cmp_stage_type[4];
assign cmp_stage_inv      = cmp_stage_type[3];
assign cmp_stage_release  = cmp_stage_type[2];
assign cmp_stage_unique   = cmp_stage_type[1];
assign cmp_stage_shared   = cmp_stage_type[0];

//==============================================================================
//                    Cache Hit and Cache Miss Signal:
//==============================================================================

assign l2c_cache_hit      = |cmp_way_v_hit[15:0];
assign cmp_hit_way_dirty  = |cmp_way_vd_hit[15:0];
assign cmp_hit_way_shared = |cmp_way_vs_hit[15:0];
assign cmp_hit_way_unique = |cmp_way_vu_hit[15:0];
assign cmp_rplc_way_vld   = |(l2c_way_fifo[15:0] & l2c_way_vld[15:0]);

assign rplc_tag[TAG_TAG_LENTH-1:0] = 
       {TAG_TAG_LENTH{l2c_way_fifo[0]}} & l2c_way0_tag_dout[TAG_TAG_LENTH-1:0] | 
       {TAG_TAG_LENTH{l2c_way_fifo[1]}} & l2c_way1_tag_dout[TAG_TAG_LENTH-1:0] | 
       {TAG_TAG_LENTH{l2c_way_fifo[2]}} & l2c_way2_tag_dout[TAG_TAG_LENTH-1:0] | 
       {TAG_TAG_LENTH{l2c_way_fifo[3]}} & l2c_way3_tag_dout[TAG_TAG_LENTH-1:0] | 
       {TAG_TAG_LENTH{l2c_way_fifo[4]}} & l2c_way4_tag_dout[TAG_TAG_LENTH-1:0] | 
       {TAG_TAG_LENTH{l2c_way_fifo[5]}} & l2c_way5_tag_dout[TAG_TAG_LENTH-1:0] | 
       {TAG_TAG_LENTH{l2c_way_fifo[6]}} & l2c_way6_tag_dout[TAG_TAG_LENTH-1:0] | 
       {TAG_TAG_LENTH{l2c_way_fifo[7]}} & l2c_way7_tag_dout[TAG_TAG_LENTH-1:0] | 
       {TAG_TAG_LENTH{l2c_way_fifo[8]}} & l2c_way8_tag_dout[TAG_TAG_LENTH-1:0] | 
       {TAG_TAG_LENTH{l2c_way_fifo[9]}} & l2c_way9_tag_dout[TAG_TAG_LENTH-1:0] | 
       {TAG_TAG_LENTH{l2c_way_fifo[10]}} & l2c_way10_tag_dout[TAG_TAG_LENTH-1:0] | 
       {TAG_TAG_LENTH{l2c_way_fifo[11]}} & l2c_way11_tag_dout[TAG_TAG_LENTH-1:0] | 
       {TAG_TAG_LENTH{l2c_way_fifo[12]}} & l2c_way12_tag_dout[TAG_TAG_LENTH-1:0] | 
       {TAG_TAG_LENTH{l2c_way_fifo[13]}} & l2c_way13_tag_dout[TAG_TAG_LENTH-1:0] | 
       {TAG_TAG_LENTH{l2c_way_fifo[14]}} & l2c_way14_tag_dout[TAG_TAG_LENTH-1:0] | 
       {TAG_TAG_LENTH{l2c_way_fifo[15]}} & l2c_way15_tag_dout[TAG_TAG_LENTH-1:0];

assign cmp_stage_cp[3:0] = 
       {4{cmp_way_v_hit[0]}} & l2c_way0_cp_dout[3:0] | 
       {4{cmp_way_v_hit[1]}} & l2c_way1_cp_dout[3:0] | 
       {4{cmp_way_v_hit[2]}} & l2c_way2_cp_dout[3:0] | 
       {4{cmp_way_v_hit[3]}} & l2c_way3_cp_dout[3:0] | 
       {4{cmp_way_v_hit[4]}} & l2c_way4_cp_dout[3:0] | 
       {4{cmp_way_v_hit[5]}} & l2c_way5_cp_dout[3:0] | 
       {4{cmp_way_v_hit[6]}} & l2c_way6_cp_dout[3:0] | 
       {4{cmp_way_v_hit[7]}} & l2c_way7_cp_dout[3:0] |
       {4{cmp_way_v_hit[8]}} & l2c_way8_cp_dout[3:0] | 
       {4{cmp_way_v_hit[9]}} & l2c_way9_cp_dout[3:0] |
       {4{cmp_way_v_hit[10]}} & l2c_way10_cp_dout[3:0] | 
       {4{cmp_way_v_hit[11]}} & l2c_way11_cp_dout[3:0] | 
       {4{cmp_way_v_hit[12]}} & l2c_way12_cp_dout[3:0] | 
       {4{cmp_way_v_hit[13]}} & l2c_way13_cp_dout[3:0] | 
       {4{cmp_way_v_hit[14]}} & l2c_way14_cp_dout[3:0] | 
       {4{cmp_way_v_hit[15]}} & l2c_way15_cp_dout[3:0];  

assign l2c_cache_miss    = !l2c_cache_hit;

//==============================================================================
//                       RAM  request
//==============================================================================
//------------------------------------------------
//        TAG AND DIRTY
//------------------------------------------------
//wtsd/wtsc/wtuc/wtud access tag and dirty if miss, access dirty if hit.

assign cmp_stage_write  = cmp_stage_write_sd | cmp_stage_write_sc | 
                          cmp_stage_write_uc | cmp_stage_write_ud;
assign cmp_stage_refill = cmp_stage_write & l2c_cache_miss;

assign valid_set = cmp_stage_refill;
assign valid_clr = (cmp_stage_inv | cmp_stage_icln) & l2c_cache_hit;

assign dirty_set = cmp_stage_write_ud | cmp_stage_write_sd;

assign dirty_clr = cmp_stage_write_uc | cmp_stage_write_sc | 
                   valid_clr | 
                   (cmp_stage_cln | cmp_stage_icln) & cmp_hit_way_dirty;

assign shared_set = cmp_stage_write_sd | cmp_stage_write_sc | 
                    cmp_stage_shared & cmp_hit_way_unique;
assign shared_clr = cmp_stage_write_uc | cmp_stage_write_ud | 
                    valid_clr |
                    cmp_stage_unique & cmp_hit_way_shared;

assign pend_set  = cmp_stage_alct & (!cmp_rplc_way_vld | snpl2_grant);
assign pend_clr  = cmp_stage_release | cmp_stage_refill;   //snpl2 will send icln or inv to L2c, which should not clr pend bit.

assign fifo_updt = pend_set;

assign cp_set    = |cmp_stage_setcp[3:0];
assign cp_clr    = |(cmp_stage_clrcp[3:0] &  cmp_stage_cp[3:0]);

assign cmp_stage_nop = ~(|cmp_stage_type[12:0]);

assign tag_updt   = cmp_stage_refill;
assign dirty_updt = cmp_stage_write | valid_clr | 
                    (cmp_stage_cln | cmp_stage_icln) & cmp_hit_way_dirty |  //valid_clr include cmp_stage_icln cache hit and hit way dirty
                    cmp_stage_shared & cmp_hit_way_unique |
                    cmp_stage_unique & cmp_hit_way_shared | 
                    pend_set |    //different from dirty_req_vld for alct clear cmp_stage_vld until tag ram is idle, but it can not updt dirty if snpl2 is not granted. 
                    cmp_stage_release | 
                    cp_set | cp_clr;

assign dirty_req_vld = cmp_stage_write | valid_clr | 
                      (cmp_stage_cln | cmp_stage_icln) & cmp_hit_way_dirty |
                       cmp_stage_shared & cmp_hit_way_unique |
                       cmp_stage_unique & cmp_hit_way_shared | 
                       cmp_stage_alct |
                       cmp_stage_release | 
                       cp_set | cp_clr;

assign cmp_req_vld = cmp_stage_vld & (tag_updt | dirty_req_vld);  //should match with rfifo_create. but not match with dirty_cen. 

//cen
assign cmp_tag_cen    = cmp_stage_vld & tag_updt & !cmp_stall_by_data;
assign cmp_dirty_cen  = cmp_stage_vld & dirty_updt & !cmp_stall_by_data;
assign cmp_tag_gwen   = cmp_stage_vld & tag_updt;
assign cmp_dirty_gwen = cmp_stage_vld & dirty_updt;
//wen
assign tag_wen     = cmp_stage_vld & tag_updt;
assign valid_wen   = (valid_set | valid_clr);
assign shared_wen  = (shared_set| shared_clr);
assign dirty_wen   = (dirty_set | dirty_clr);
assign pend_wen    = (pend_set | pend_clr);
assign fifo_wen    = fifo_updt;
assign cp_wen[3:0] = cmp_stage_refill ? 4'b1111 : (cmp_stage_setcp[3:0] | cmp_stage_clrcp[3:0]);
assign status_wen[7:0] = {cp_wen[3:0], valid_wen, shared_wen, dirty_wen, pend_wen};

assign status_set_din[7:0] = {cmp_stage_setcp[3:0],valid_set,shared_set,dirty_set,pend_set};
assign status_clr_din[7:0] = {cmp_stage_clrcp[3:0],valid_clr,shared_clr,dirty_clr,pend_clr};
assign status_din[7:0]     = cmp_stage_refill 
                           ? status_set_din[7:0] 
                           : ((l2c_status_din[7:0] | status_set_din[7:0]) & ~status_clr_din[7:0]);


assign l2c_status_din[7:0] = 
            {8{cmp_status_ptr[15]}} & l2c_way15_dirty_dout[7:0] |
            {8{cmp_status_ptr[14]}} & l2c_way14_dirty_dout[7:0] |
            {8{cmp_status_ptr[13]}} & l2c_way13_dirty_dout[7:0] |
            {8{cmp_status_ptr[12]}} & l2c_way12_dirty_dout[7:0] |
            {8{cmp_status_ptr[11]}} & l2c_way11_dirty_dout[7:0] |
            {8{cmp_status_ptr[10]}} & l2c_way10_dirty_dout[7:0] |
            {8{cmp_status_ptr[9]}}  & l2c_way9_dirty_dout[7:0] |
            {8{cmp_status_ptr[8]}}  & l2c_way8_dirty_dout[7:0] |
            {8{cmp_status_ptr[7]}}  & l2c_way7_dirty_dout[7:0] |
            {8{cmp_status_ptr[6]}}  & l2c_way6_dirty_dout[7:0] |
            {8{cmp_status_ptr[5]}}  & l2c_way5_dirty_dout[7:0] |
            {8{cmp_status_ptr[4]}}  & l2c_way4_dirty_dout[7:0] |
            {8{cmp_status_ptr[3]}}  & l2c_way3_dirty_dout[7:0] |
            {8{cmp_status_ptr[2]}}  & l2c_way2_dirty_dout[7:0] |
            {8{cmp_status_ptr[1]}}  & l2c_way1_dirty_dout[7:0] |
            {8{cmp_status_ptr[0]}}  & l2c_way0_dirty_dout[7:0];

assign fifo_din[15:0]        = {l2c_way_fifo[14:0], l2c_way_fifo[15]};
assign cmp_req_way_ptr[15:0] = (cmp_stage_refill | cmp_stage_release) 
                             ? cmp_refill_ptr[15:0] : cmp_way_v_hit[15:0];
assign cmp_status_ptr[15:0]  = cmp_stage_alct ? l2c_way_fifo[15:0] : cmp_req_way_ptr[15:0];

assign cmp_tag_wen[15:0]     = cmp_refill_ptr[15:0] & {16{tag_wen}};
assign cmp_dirty_way[15:0]   = cmp_status_ptr[15:0];
assign cmp_dirty_wen[8:0]    = {fifo_wen,status_wen[7:0]};
assign cmp_dirty_din[143:0]  = {fifo_din[15:0], {16{status_din[7:0]}}};

assign cmp_tag_index[TAG_INDEX_LENTH-1:0]   = cmp_stage_addr[TAG_INDEX_LENTH-1:0];

//------------------------------------------------------------------------------
//                       Data RAM request
//------------------------------------------------------------------------------
// &Force("output", "cmp_data_req"); @333

assign data_rd = cmp_stage_read & l2c_cache_hit | (cmp_stage_cln | cmp_stage_icln) & cmp_hit_way_dirty;  
assign data_wr = cmp_stage_write & cmp_data_vld;

assign cmp_data_req = cmp_stage_vld & (data_wr | data_rd) & !cmp_data_piped_down;

always@(posedge l2c_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    cmp_data_piped_down <= 1'b0;
  else if (ttecc_flop_vld & !cmp_stage_stall)
    cmp_data_piped_down <= 1'b0;
  else if (cmp_data_req && data_yy_ram_idle)
    cmp_data_piped_down <= 1'b1;
  else
    cmp_data_piped_down <= cmp_data_piped_down;
end

assign cmp_data_req_gate = cmp_stage_vld & !cmp_data_piped_down &
                          (cmp_stage_write & cmp_data_vld |
                           cmp_stage_read | cmp_stage_cln | cmp_stage_icln);

assign cmp_data_wen = data_wr;

//---------------------------------------
//                     data ram index
//---------------------------------------
// &CombBeg; @362
// &CombEnd; @374

// &CombBeg; @379
always @( cmp_req_way_ptr[15:0])
begin
  casez(cmp_req_way_ptr[15:0])
    16'b1000000000000000: cmp_data_way[3:0] = 4'b1111;
    16'b0100000000000000: cmp_data_way[3:0] = 4'b1110;
    16'b0010000000000000: cmp_data_way[3:0] = 4'b1101;
    16'b0001000000000000: cmp_data_way[3:0] = 4'b1100;
    16'b0000100000000000: cmp_data_way[3:0] = 4'b1011;
    16'b0000010000000000: cmp_data_way[3:0] = 4'b1010;
    16'b0000001000000000: cmp_data_way[3:0] = 4'b1001;
    16'b0000000100000000: cmp_data_way[3:0] = 4'b1000;
    16'b0000000010000000: cmp_data_way[3:0] = 4'b0111;
    16'b0000000001000000: cmp_data_way[3:0] = 4'b0110;
    16'b0000000000100000: cmp_data_way[3:0] = 4'b0101;
    16'b0000000000010000: cmp_data_way[3:0] = 4'b0100;
    16'b0000000000001000: cmp_data_way[3:0] = 4'b0011;
    16'b0000000000000100: cmp_data_way[3:0] = 4'b0010;
    16'b0000000000000010: cmp_data_way[3:0] = 4'b0001;
    16'b0000000000000001: cmp_data_way[3:0] = 4'b0000;
    default:              cmp_data_way[3:0] = 4'b0;
  endcase
// &CombEnd; @399
end
assign cmp_data_index[DATA_INDEX_LENTH-1:0] = {cmp_data_way[3:0],cmp_stage_addr[DATA_INDEX_LENTH-5:0]};

//--------------------------------------
//  Stalled by DATA stage:
//--------------------------------------
// &Force("output","cmp_stall_by_data"); @406
assign cmp_stall_by_data = cmp_stage_vld & !cmp_data_piped_down &
                           (stall_by_read | stall_by_write);

assign stall_by_read     = data_rd & !data_yy_ram_idle;
assign stall_by_write    = cmp_stage_write & 
                           (!cmp_data_vld | !data_yy_ram_idle);

assign cmp_yy_wdata_pop  = cmp_stage_vld & cmp_stage_write_raw & !cmp_stage_stall;
assign cmp_yy_wdata_pop_gate = cmp_stage_vld & cmp_stage_write_raw; 

//==============================================================================
//              output for snpl2
//==============================================================================
assign alct_done                           = cmp_stage_alct & !cmp_rplc_way_vld;
assign l2c_ciu_snpl2_vld_x                 = cmp_stage_vld & cmp_stage_alct & 
                                             cmp_rplc_way_vld & !snpl2_granted;
assign l2c_ciu_snpl2_addr_x[L2C_ADDRW-1:0] = {rplc_tag[TAG_TAG_LENTH-1:0],cmp_stage_addr[TAG_INDEX_LENTH-1:0]};
assign l2c_ciu_snpl2_ini_sid_x[4:0]        = cmp_stage_sid[4:0];

always@(posedge l2c_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    snpl2_granted <= 1'b0;
  else if (ttecc_flop_vld & !cmp_stage_stall)
    snpl2_granted <= 1'b0;
  else if (ciu_l2c_snpl2_ready_x)
    snpl2_granted <= 1'b1;    
end

assign snpl2_grant = ciu_l2c_snpl2_ready_x | snpl2_granted;
 
//==============================================================================
//              output for prefetch
//==============================================================================
// Interface with prefetcher
assign cmp_pref_vld_x        = cmp_stage_vld;
assign cmp_pref_ifu_req_x    = cmp_stage_src[0];
assign cmp_pref_tlb_req_x    = cmp_stage_src[1];
assign cmp_pref_read_x       = cmp_stage_read ;
assign cmp_pref_cache_miss_x = l2c_cache_miss;
assign cmp_pref_addr_x[L2C_ADDRW-1:0] = cmp_stage_addr[L2C_ADDRW-1:0];

//==============================================================================
//             request RFIFO
//==============================================================================

assign write_create_rfifo   = cmp_stage_write   & cmp_data_vld & tag_yy_ram_idle & !cmp_stall_by_data;
assign read_create_rfifo    = cmp_stage_read    & l2c_cache_miss;
assign alct_create_rfifo    = cmp_stage_alct    & tag_yy_ram_idle;
assign release_create_rfifo = cmp_stage_release & tag_yy_ram_idle;
assign cln_create_rfifo     = cmp_stage_cln     & (l2c_cache_miss | !cmp_hit_way_dirty);
assign icln_create_rfifo    = cmp_stage_icln    & (l2c_cache_miss | !cmp_hit_way_dirty & tag_yy_ram_idle);
assign atag_create_rfifo    = cmp_stage_atag    & (!cp_clr | tag_yy_ram_idle);
assign inv_create_rfifo     = cmp_stage_inv     & (l2c_cache_miss | tag_yy_ram_idle);
assign uni_create_rfifo     = cmp_stage_unique  & (!cmp_hit_way_shared | tag_yy_ram_idle);
assign shared_create_rfifo  = cmp_stage_shared  & (!cmp_hit_way_unique | tag_yy_ram_idle);
assign cp_create_rfifo      = cmp_stage_nop     & cp_set & tag_yy_ram_idle;
assign err_create_rfifo     = cmp_stage_fatal_err;

assign cmp_rfifo_create = cmp_stage_vld & !cmp_stage_stall &
                         (write_create_rfifo   |
                          read_create_rfifo    |
                          alct_create_rfifo    | 
                          release_create_rfifo |
                          cln_create_rfifo     |
                          icln_create_rfifo    |
                          atag_create_rfifo    |
                          inv_create_rfifo     |
                          uni_create_rfifo     |
                          shared_create_rfifo  |
                          cp_create_rfifo      |
                          err_create_rfifo);

assign cmp_rfifo_sid[4:0]  = cmp_stage_sid[4:0];

//[4] also indicates alct_cmplt
//[3] also indicate alct an invalid cache line, so no snpl2 need
assign cmp_rfifo_resp[4:0] = {l2c_cache_hit | pend_set,
                              cmp_hit_way_shared | alct_done,
                              cmp_hit_way_dirty,
                              cmp_stage_fatal_err,
                              1'b0};
assign cmp_rfifo_cp[3:0]   = cmp_stage_cp[3:0];

// &Force("output", "cmp_stage_cp"); @491
assign cmp_stage_resp[4:0] = {l2c_cache_hit,
                              cmp_hit_way_shared,
                              cmp_hit_way_dirty,
                              cmp_stage_fatal_err,
                              1'b1};

//==============================================================================
//          request ECC FIFO to INV CACHE
//==============================================================================
// &CombBeg; @506
// &CombEnd; @518
// &CombBeg; @524
// &CombEnd; @544

//================================================
//           FOR HPCP
//================================================
assign rd_first      = cmp_stage_hpcp_bus[0];
assign wt_first      = cmp_stage_hpcp_bus[1];
assign read_acc_vld  = cmp_stage_vld && rd_first;
assign read_miss_vld = read_acc_vld && !l2c_cache_hit;

assign write_acc_vld = cmp_stage_vld && wt_first;
assign write_miss_inc = write_acc_vld && !l2c_cache_hit;

assign l2c_ciu_hpcp_mid_x[2:0]      = cmp_stage_mid[2:0];
assign l2c_ciu_hpcp_acc_inc_x[1:0]  = {read_acc_vld, write_acc_vld} & {2{!cmp_stage_stall}};
assign l2c_ciu_hpcp_miss_inc_x[1:0] = {read_miss_vld, write_miss_inc} & {2{!cmp_stage_stall}}; 

//================================================
//           assertion
//================================================
// &Force("nonport","cmp_stage_write_fall_edge"); @568
// &Force("nonport","cmp_data_vld_fall_edge"); @569
// &ModuleEnd; @643
endmodule


