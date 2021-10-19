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

// &ModuleBeg; @30
module ct_lsu_pfu_pfb_entry(
  amr_wa_cancel,
  cp0_lsu_icg_en,
  cp0_lsu_l2_st_pref_en,
  cp0_lsu_pfu_mmu_dis,
  cp0_yy_clk_en,
  cp0_yy_priv_mode,
  cpurst_b,
  ld_da_ldfifo_pc,
  ld_da_page_sec_ff,
  ld_da_page_share_ff,
  ld_da_pfu_act_dp_vld,
  ld_da_pfu_act_vld,
  ld_da_pfu_evict_cnt_vld,
  ld_da_pfu_pf_inst_vld,
  ld_da_ppfu_va,
  ld_da_ppn_ff,
  lsu_pfu_l1_dist_sel,
  lsu_pfu_l2_dist_sel,
  lsu_special_clk,
  pad_yy_icg_scan_en,
  pfb_no_req_cnt_val,
  pfb_timeout_cnt_val,
  pfu_biu_pe_req_sel_l1,
  pfu_dcache_pref_en,
  pfu_get_page_sec,
  pfu_get_page_share,
  pfu_get_ppn,
  pfu_get_ppn_err,
  pfu_get_ppn_vld,
  pfu_l2_pref_en,
  pfu_mmu_pe_req_sel_l1,
  pfu_pfb_create_pc,
  pfu_pfb_create_stride,
  pfu_pfb_create_stride_neg,
  pfu_pfb_create_strideh_6to0,
  pfu_pfb_create_type_ld,
  pfu_pfb_entry_biu_pe_req_grnt_x,
  pfu_pfb_entry_biu_pe_req_src_v,
  pfu_pfb_entry_biu_pe_req_x,
  pfu_pfb_entry_create_dp_vld_x,
  pfu_pfb_entry_create_gateclk_en_x,
  pfu_pfb_entry_create_vld_x,
  pfu_pfb_entry_evict_x,
  pfu_pfb_entry_from_lfb_dcache_hit_x,
  pfu_pfb_entry_from_lfb_dcache_miss_x,
  pfu_pfb_entry_hit_pc_x,
  pfu_pfb_entry_l1_page_sec_x,
  pfu_pfb_entry_l1_page_share_x,
  pfu_pfb_entry_l1_pf_addr_v,
  pfu_pfb_entry_l1_vpn_v,
  pfu_pfb_entry_l2_page_sec_x,
  pfu_pfb_entry_l2_page_share_x,
  pfu_pfb_entry_l2_pf_addr_v,
  pfu_pfb_entry_l2_vpn_v,
  pfu_pfb_entry_mmu_pe_req_grnt_x,
  pfu_pfb_entry_mmu_pe_req_src_v,
  pfu_pfb_entry_mmu_pe_req_x,
  pfu_pfb_entry_priv_mode_v,
  pfu_pfb_entry_vld_x,
  pfu_pop_all_part_vld,
  st_da_page_sec_ff,
  st_da_page_share_ff,
  st_da_pc,
  st_da_pfu_act_vld,
  st_da_pfu_evict_cnt_vld,
  st_da_pfu_pf_inst_vld,
  st_da_ppfu_va,
  st_da_ppn_ff
);

// &Ports; @31
input           amr_wa_cancel;                         
input           cp0_lsu_icg_en;                        
input           cp0_lsu_l2_st_pref_en;                 
input           cp0_lsu_pfu_mmu_dis;                   
input           cp0_yy_clk_en;                         
input   [1 :0]  cp0_yy_priv_mode;                      
input           cpurst_b;                              
input   [14:0]  ld_da_ldfifo_pc;                       
input           ld_da_page_sec_ff;                     
input           ld_da_page_share_ff;                   
input           ld_da_pfu_act_dp_vld;                  
input           ld_da_pfu_act_vld;                     
input           ld_da_pfu_evict_cnt_vld;               
input           ld_da_pfu_pf_inst_vld;                 
input   [39:0]  ld_da_ppfu_va;                         
input   [27:0]  ld_da_ppn_ff;                          
input   [3 :0]  lsu_pfu_l1_dist_sel;                   
input   [3 :0]  lsu_pfu_l2_dist_sel;                   
input           lsu_special_clk;                       
input           pad_yy_icg_scan_en;                    
input   [5 :0]  pfb_no_req_cnt_val;                    
input   [7 :0]  pfb_timeout_cnt_val;                   
input           pfu_biu_pe_req_sel_l1;                 
input           pfu_dcache_pref_en;                    
input           pfu_get_page_sec;                      
input           pfu_get_page_share;                    
input   [27:0]  pfu_get_ppn;                           
input           pfu_get_ppn_err;                       
input           pfu_get_ppn_vld;                       
input           pfu_l2_pref_en;                        
input           pfu_mmu_pe_req_sel_l1;                 
input   [14:0]  pfu_pfb_create_pc;                     
input   [10:0]  pfu_pfb_create_stride;                 
input           pfu_pfb_create_stride_neg;             
input   [6 :0]  pfu_pfb_create_strideh_6to0;           
input           pfu_pfb_create_type_ld;                
input           pfu_pfb_entry_biu_pe_req_grnt_x;       
input           pfu_pfb_entry_create_dp_vld_x;         
input           pfu_pfb_entry_create_gateclk_en_x;     
input           pfu_pfb_entry_create_vld_x;            
input           pfu_pfb_entry_from_lfb_dcache_hit_x;   
input           pfu_pfb_entry_from_lfb_dcache_miss_x;  
input           pfu_pfb_entry_mmu_pe_req_grnt_x;       
input           pfu_pop_all_part_vld;                  
input           st_da_page_sec_ff;                     
input           st_da_page_share_ff;                   
input   [14:0]  st_da_pc;                              
input           st_da_pfu_act_vld;                     
input           st_da_pfu_evict_cnt_vld;               
input           st_da_pfu_pf_inst_vld;                 
input   [39:0]  st_da_ppfu_va;                         
input   [27:0]  st_da_ppn_ff;                          
output  [1 :0]  pfu_pfb_entry_biu_pe_req_src_v;        
output          pfu_pfb_entry_biu_pe_req_x;            
output          pfu_pfb_entry_evict_x;                 
output          pfu_pfb_entry_hit_pc_x;                
output          pfu_pfb_entry_l1_page_sec_x;           
output          pfu_pfb_entry_l1_page_share_x;         
output  [39:0]  pfu_pfb_entry_l1_pf_addr_v;            
output  [27:0]  pfu_pfb_entry_l1_vpn_v;                
output          pfu_pfb_entry_l2_page_sec_x;           
output          pfu_pfb_entry_l2_page_share_x;         
output  [39:0]  pfu_pfb_entry_l2_pf_addr_v;            
output  [27:0]  pfu_pfb_entry_l2_vpn_v;                
output  [1 :0]  pfu_pfb_entry_mmu_pe_req_src_v;        
output          pfu_pfb_entry_mmu_pe_req_x;            
output  [1 :0]  pfu_pfb_entry_priv_mode_v;             
output          pfu_pfb_entry_vld_x;                   

// &Regs; @32
reg     [2 :0]  pfu_pfb_entry_confidence;              
reg             pfu_pfb_entry_evict;                   
reg     [5 :0]  pfu_pfb_entry_no_req_cnt;              
reg     [14:0]  pfu_pfb_entry_pc;                      
reg     [10:0]  pfu_pfb_entry_stride;                  
reg             pfu_pfb_entry_stride_neg;              
reg     [6 :0]  pfu_pfb_entry_strideh_6to0;            
reg     [7 :0]  pfu_pfb_entry_timeout_cnt;             
reg             pfu_pfb_entry_type_ld;                 

// &Wires; @33
wire            amr_wa_cancel;                         
wire            cp0_lsu_icg_en;                        
wire            cp0_lsu_l2_st_pref_en;                 
wire            cp0_lsu_pfu_mmu_dis;                   
wire            cp0_yy_clk_en;                         
wire    [1 :0]  cp0_yy_priv_mode;                      
wire            cpurst_b;                              
wire            l1_pref_en;                            
wire    [14:0]  ld_da_ldfifo_pc;                       
wire            ld_da_page_sec_ff;                     
wire            ld_da_page_share_ff;                   
wire            ld_da_pfu_act_dp_vld;                  
wire            ld_da_pfu_act_vld;                     
wire            ld_da_pfu_evict_cnt_vld;               
wire            ld_da_pfu_pf_inst_vld;                 
wire    [39:0]  ld_da_ppfu_va;                         
wire    [27:0]  ld_da_ppn_ff;                          
wire    [3 :0]  lsu_pfu_l1_dist_sel;                   
wire    [3 :0]  lsu_pfu_l2_dist_sel;                   
wire            lsu_special_clk;                       
wire            pad_yy_icg_scan_en;                    
wire    [5 :0]  pfb_no_req_cnt_val;                    
wire    [7 :0]  pfb_timeout_cnt_val;                   
wire            pfu_biu_pe_req_sel_l1;                 
wire            pfu_dcache_pref_en;                    
wire            pfu_get_page_sec;                      
wire            pfu_get_page_share;                    
wire    [27:0]  pfu_get_ppn;                           
wire            pfu_get_ppn_err;                       
wire            pfu_get_ppn_vld;                       
wire            pfu_l2_pref_en;                        
wire            pfu_mmu_pe_req_sel_l1;                 
wire    [14:0]  pfu_pfb_create_pc;                     
wire    [10:0]  pfu_pfb_create_stride;                 
wire            pfu_pfb_create_stride_neg;             
wire    [6 :0]  pfu_pfb_create_strideh_6to0;           
wire            pfu_pfb_create_type_ld;                
wire            pfu_pfb_entry_act_vld;                 
wire            pfu_pfb_entry_all_pf_inst_clk;         
wire            pfu_pfb_entry_all_pf_inst_clk_en;      
wire            pfu_pfb_entry_biu_pe_req;              
wire            pfu_pfb_entry_biu_pe_req_grnt;         
wire            pfu_pfb_entry_biu_pe_req_grnt_x;       
wire    [1 :0]  pfu_pfb_entry_biu_pe_req_src;          
wire    [1 :0]  pfu_pfb_entry_biu_pe_req_src_v;        
wire            pfu_pfb_entry_biu_pe_req_x;            
wire            pfu_pfb_entry_clk;                     
wire            pfu_pfb_entry_clk_en;                  
wire    [2 :0]  pfu_pfb_entry_confidence_add1;         
wire            pfu_pfb_entry_confidence_add_vld;      
wire            pfu_pfb_entry_confidence_high;         
wire            pfu_pfb_entry_confidence_low;          
wire    [2 :0]  pfu_pfb_entry_confidence_next;         
wire            pfu_pfb_entry_confidence_set;          
wire    [2 :0]  pfu_pfb_entry_confidence_sub1;         
wire            pfu_pfb_entry_confidence_zero;         
wire            pfu_pfb_entry_create_clk;              
wire            pfu_pfb_entry_create_clk_en;           
wire            pfu_pfb_entry_create_dp_vld;           
wire            pfu_pfb_entry_create_dp_vld_x;         
wire            pfu_pfb_entry_create_gateclk_en;       
wire            pfu_pfb_entry_create_gateclk_en_x;     
wire            pfu_pfb_entry_create_vld;              
wire            pfu_pfb_entry_create_vld_x;            
wire            pfu_pfb_entry_dcache_hit_pop_req;      
wire            pfu_pfb_entry_evict_clr;               
wire            pfu_pfb_entry_evict_set;               
wire            pfu_pfb_entry_evict_x;                 
wire            pfu_pfb_entry_from_lfb_dcache_hit;     
wire            pfu_pfb_entry_from_lfb_dcache_hit_x;   
wire            pfu_pfb_entry_from_lfb_dcache_miss;    
wire            pfu_pfb_entry_from_lfb_dcache_miss_x;  
wire            pfu_pfb_entry_hit_pc;                  
wire            pfu_pfb_entry_hit_pc_for_new;          
wire            pfu_pfb_entry_hit_pc_x;                
wire    [39:0]  pfu_pfb_entry_inst_new_va;             
wire            pfu_pfb_entry_inst_new_va_hit_pipe;    
wire            pfu_pfb_entry_l1_biu_pe_req_set;       
wire            pfu_pfb_entry_l1_cmp_va_vld;           
wire    [39:0]  pfu_pfb_entry_l1_dist_strideh;         
wire            pfu_pfb_entry_l1_mmu_pe_req_set;       
wire            pfu_pfb_entry_l1_page_sec;             
wire            pfu_pfb_entry_l1_page_sec_x;           
wire            pfu_pfb_entry_l1_page_share;           
wire            pfu_pfb_entry_l1_page_share_x;         
wire    [39:0]  pfu_pfb_entry_l1_pf_addr;              
wire    [39:0]  pfu_pfb_entry_l1_pf_addr_v;            
wire    [39:0]  pfu_pfb_entry_l1_pf_va;                
wire    [39:0]  pfu_pfb_entry_l1_pf_va_sub_inst_new_va; 
wire    [27:0]  pfu_pfb_entry_l1_vpn;                  
wire    [27:0]  pfu_pfb_entry_l1_vpn_v;                
wire            pfu_pfb_entry_l1sm_reinit_req;         
wire            pfu_pfb_entry_l1sm_va_can_cmp;         
wire            pfu_pfb_entry_l2_biu_pe_req_set;       
wire            pfu_pfb_entry_l2_cmp_va_vld;           
wire    [39:0]  pfu_pfb_entry_l2_dist_strideh;         
wire            pfu_pfb_entry_l2_mmu_pe_req_set;       
wire            pfu_pfb_entry_l2_page_sec;             
wire            pfu_pfb_entry_l2_page_sec_x;           
wire            pfu_pfb_entry_l2_page_share;           
wire            pfu_pfb_entry_l2_page_share_x;         
wire    [39:0]  pfu_pfb_entry_l2_pf_addr;              
wire    [39:0]  pfu_pfb_entry_l2_pf_addr_v;            
wire    [39:0]  pfu_pfb_entry_l2_pf_va_sub_l1_pf_va;   
wire    [27:0]  pfu_pfb_entry_l2_vpn;                  
wire    [27:0]  pfu_pfb_entry_l2_vpn_v;                
wire            pfu_pfb_entry_l2sm_reinit_req;         
wire            pfu_pfb_entry_l2sm_va_can_cmp;         
wire            pfu_pfb_entry_mmu_pe_req;              
wire            pfu_pfb_entry_mmu_pe_req_grnt;         
wire            pfu_pfb_entry_mmu_pe_req_grnt_x;       
wire    [1 :0]  pfu_pfb_entry_mmu_pe_req_src;          
wire    [1 :0]  pfu_pfb_entry_mmu_pe_req_src_v;        
wire            pfu_pfb_entry_mmu_pe_req_x;            
wire            pfu_pfb_entry_no_req_cnt_full;         
wire            pfu_pfb_entry_pf_inst_vld;             
wire            pfu_pfb_entry_pop_vld;                 
wire    [1 :0]  pfu_pfb_entry_priv_mode;               
wire    [1 :0]  pfu_pfb_entry_priv_mode_v;             
wire            pfu_pfb_entry_reinit_vld;              
wire    [39:0]  pfu_pfb_entry_strideh;                 
wire            pfu_pfb_entry_timeout_cnt_full;        
wire            pfu_pfb_entry_tsm_is_judge;            
wire            pfu_pfb_entry_vld;                     
wire            pfu_pfb_entry_vld_x;                   
wire            pfu_pop_all_part_vld;                  
wire            pfu_pop_st_all;                        
wire            pipe_act_vld;                          
wire            pipe_cmp_inst_vld;                     
wire    [14:0]  pipe_cmp_pc;                           
wire            pipe_evict_cnt_vld;                    
wire            pipe_page_sec;                         
wire            pipe_page_share;                       
wire    [39:0]  pipe_ppfu_va;                          
wire    [27:0]  pipe_ppn;                              
wire            st_da_page_sec_ff;                     
wire            st_da_page_share_ff;                   
wire    [14:0]  st_da_pc;                              
wire            st_da_pfu_act_vld;                     
wire            st_da_pfu_evict_cnt_vld;               
wire            st_da_pfu_pf_inst_vld;                 
wire    [39:0]  st_da_ppfu_va;                         
wire    [27:0]  st_da_ppn_ff;                          


parameter TIMEOUT_BW          = 8;
parameter PC_LEN              = 15;
//==========================================================
//                 Instance of Gated Cell  
//==========================================================
assign pfu_pfb_entry_clk_en = pfu_pfb_entry_vld
                              ||  pfu_pfb_entry_create_gateclk_en;
// &Instance("gated_clk_cell", "x_lsu_pfu_pfb_entry_gated_clk"); @42
gated_clk_cell  x_lsu_pfu_pfb_entry_gated_clk (
  .clk_in               (lsu_special_clk     ),
  .clk_out              (pfu_pfb_entry_clk   ),
  .external_en          (1'b0                ),
  .global_en            (cp0_yy_clk_en       ),
  .local_en             (pfu_pfb_entry_clk_en),
  .module_en            (cp0_lsu_icg_en      ),
  .pad_yy_icg_scan_en   (pad_yy_icg_scan_en  )
);

// &Connect(.clk_in        (lsu_special_clk     ), @43
//          .external_en   (1'b0               ), @44
//          .global_en     (cp0_yy_clk_en      ), @45
//          .module_en     (cp0_lsu_icg_en     ), @46
//          .local_en      (pfu_pfb_entry_clk_en), @47
//          .clk_out       (pfu_pfb_entry_clk  )); @48

//create clk
assign pfu_pfb_entry_create_clk_en = pfu_pfb_entry_create_gateclk_en;
// &Instance("gated_clk_cell", "x_lsu_pfu_pfb_entry_create_gated_clk"); @52
gated_clk_cell  x_lsu_pfu_pfb_entry_create_gated_clk (
  .clk_in                      (lsu_special_clk            ),
  .clk_out                     (pfu_pfb_entry_create_clk   ),
  .external_en                 (1'b0                       ),
  .global_en                   (cp0_yy_clk_en              ),
  .local_en                    (pfu_pfb_entry_create_clk_en),
  .module_en                   (cp0_lsu_icg_en             ),
  .pad_yy_icg_scan_en          (pad_yy_icg_scan_en         )
);

// &Connect(.clk_in        (lsu_special_clk     ), @53
//          .external_en   (1'b0               ), @54
//          .global_en     (cp0_yy_clk_en      ), @55
//          .module_en     (cp0_lsu_icg_en     ), @56
//          .local_en      (pfu_pfb_entry_create_clk_en), @57
//          .clk_out       (pfu_pfb_entry_create_clk)); @58

//pf_inst_vld clk
assign pfu_pfb_entry_all_pf_inst_clk_en = pfu_pfb_entry_vld
                                             &&  (ld_da_pfu_pf_inst_vld || st_da_pfu_pf_inst_vld)
                                          || pfu_pfb_entry_biu_pe_req
                                          || pfu_pfb_entry_create_gateclk_en;
// &Instance("gated_clk_cell", "x_lsu_pfu_pfb_entry_all_pf_inst_gated_clk"); @65
gated_clk_cell  x_lsu_pfu_pfb_entry_all_pf_inst_gated_clk (
  .clk_in                           (lsu_special_clk                 ),
  .clk_out                          (pfu_pfb_entry_all_pf_inst_clk   ),
  .external_en                      (1'b0                            ),
  .global_en                        (cp0_yy_clk_en                   ),
  .local_en                         (pfu_pfb_entry_all_pf_inst_clk_en),
  .module_en                        (cp0_lsu_icg_en                  ),
  .pad_yy_icg_scan_en               (pad_yy_icg_scan_en              )
);

// &Connect(.clk_in        (lsu_special_clk     ), @66
//          .external_en   (1'b0               ), @67
//          .global_en     (cp0_yy_clk_en      ), @68
//          .module_en     (cp0_lsu_icg_en     ), @69
//          .local_en      (pfu_pfb_entry_all_pf_inst_clk_en), @70
//          .clk_out       (pfu_pfb_entry_all_pf_inst_clk)); @71

//==========================================================
//                 Register
//==========================================================
//+----+--------+----------------------+
//| pc | stride | stride_be_cache_line |
//+----+--------+----------------------+
always @(posedge pfu_pfb_entry_create_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
  begin
    pfu_pfb_entry_pc[PC_LEN-1:0]        <=  {PC_LEN{1'b0}};
    pfu_pfb_entry_stride[10:0]          <=  11'b0;
    pfu_pfb_entry_strideh_6to0[6:0]     <=  7'b0;
    pfu_pfb_entry_stride_neg            <=  1'b0;
    pfu_pfb_entry_type_ld               <=  1'b0;
  end
  else if(pfu_pfb_entry_create_dp_vld)
  begin
    pfu_pfb_entry_pc[PC_LEN-1:0]        <=  pfu_pfb_create_pc[PC_LEN-1:0];
    pfu_pfb_entry_stride[10:0]          <=  pfu_pfb_create_stride[10:0];
    pfu_pfb_entry_strideh_6to0[6:0]     <=  pfu_pfb_create_strideh_6to0[6:0];
    pfu_pfb_entry_stride_neg            <=  pfu_pfb_create_stride_neg;
    pfu_pfb_entry_type_ld               <=  pfu_pfb_create_type_ld;
  end
end

//+-------------+
//| timeout_cnt |
//+-------------+
always @(posedge pfu_pfb_entry_all_pf_inst_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    pfu_pfb_entry_timeout_cnt[TIMEOUT_BW-1:0] <=  {TIMEOUT_BW{1'b0}};
  else if(pfu_pfb_entry_create_dp_vld ||  pfu_pfb_entry_pf_inst_vld)
    pfu_pfb_entry_timeout_cnt[TIMEOUT_BW-1:0] <=  {TIMEOUT_BW{1'b0}};
  else if(pipe_evict_cnt_vld &&  !pfu_pfb_entry_timeout_cnt_full)
    pfu_pfb_entry_timeout_cnt[TIMEOUT_BW-1:0] <=  pfu_pfb_entry_timeout_cnt[TIMEOUT_BW-1:0]
                                                  + {{TIMEOUT_BW-1{1'b0}},1'b1};
end

//+-------------+
//| no_req_cnt |
//+-------------+
always @(posedge pfu_pfb_entry_all_pf_inst_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    pfu_pfb_entry_no_req_cnt[5:0] <=  {6{1'b0}};
  else if(pfu_pfb_entry_create_dp_vld ||  pfu_pfb_entry_biu_pe_req)
    pfu_pfb_entry_no_req_cnt[5:0] <=  {6{1'b0}};
  else if(pfu_pfb_entry_pf_inst_vld && !pfu_pfb_entry_no_req_cnt_full)
    pfu_pfb_entry_no_req_cnt[5:0] <=  pfu_pfb_entry_no_req_cnt[5:0]
                                                  + {{5{1'b0}},1'b1};
end
//+-------+
//| evict |
//+-------+
always @(posedge pfu_pfb_entry_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    pfu_pfb_entry_evict     <=  1'b0;
  else if(pfu_pfb_entry_create_dp_vld ||  pfu_pfb_entry_evict_clr)
    pfu_pfb_entry_evict     <=  1'b0;
  else if(pfu_pfb_entry_evict_set)
    pfu_pfb_entry_evict     <=  1'b1;
end

//+------------+
//| confidence |
//+------------+
always @(posedge pfu_pfb_entry_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    pfu_pfb_entry_confidence[2:0]     <=  3'b0;
  else if(pfu_pfb_entry_create_dp_vld)
    pfu_pfb_entry_confidence[2:0]     <=  3'b110;
  else if(pfu_pfb_entry_confidence_set)
    pfu_pfb_entry_confidence[2:0]     <=  pfu_pfb_entry_confidence_next[2:0];
end
//==========================================================
//                 pipe info select
//==========================================================
assign pipe_cmp_inst_vld = pfu_pfb_entry_type_ld
                           ? ld_da_pfu_pf_inst_vld
                           : st_da_pfu_pf_inst_vld;

assign pipe_cmp_pc[PC_LEN-1:0] = pfu_pfb_entry_type_ld
                                 ? ld_da_ldfifo_pc[PC_LEN-1:0]
                                 : st_da_pc[PC_LEN-1:0];

assign pipe_evict_cnt_vld = ld_da_pfu_evict_cnt_vld || st_da_pfu_evict_cnt_vld;

assign pipe_act_vld       = pfu_pfb_entry_type_ld
                            ? ld_da_pfu_act_vld
                            : st_da_pfu_act_vld; 

assign pipe_ppfu_va[`PA_WIDTH-1:0]  = pfu_pfb_entry_type_ld
                                      ? ld_da_ppfu_va[`PA_WIDTH-1:0]
                                      : st_da_ppfu_va[`PA_WIDTH-1:0];

assign pipe_page_sec    = pfu_pfb_entry_type_ld
                          ? ld_da_page_sec_ff
                          : st_da_page_sec_ff; 

assign pipe_page_share  = pfu_pfb_entry_type_ld
                          ? ld_da_page_share_ff
                          : st_da_page_share_ff; 

assign pipe_ppn[`PA_WIDTH-13:0] = pfu_pfb_entry_type_ld
                                  ? ld_da_ppn_ff[`PA_WIDTH-13:0]
                                  : st_da_ppn_ff[`PA_WIDTH-13:0];

//st will not trigger l1 prefetch
assign l1_pref_en = pfu_dcache_pref_en
                    && pfu_pfb_entry_vld 
                    && pfu_pfb_entry_type_ld;
//==========================================================
//                 Caucalate pf_inst signal
//==========================================================
assign pfu_pfb_entry_hit_pc       = pfu_pfb_entry_vld
                                    &&  (pipe_cmp_pc[PC_LEN-1:0]
                                        ==  pfu_pfb_entry_pc[PC_LEN-1:0]);
assign pfu_pfb_entry_pf_inst_vld  = pfu_pfb_entry_hit_pc
                                    &&  pipe_cmp_inst_vld;
assign pfu_pfb_entry_act_vld      = pfu_pfb_entry_hit_pc
                                    &&  pipe_act_vld;

//for new inst create
assign pfu_pfb_entry_hit_pc_for_new = pfu_pfb_entry_hit_pc
                                      && !(pfu_pfb_entry_type_ld ^ ld_da_pfu_act_dp_vld);
//==========================================================
//                 no req evict
//==========================================================
//when pfb entry not send req for many inst,then set evict
assign pfu_pfb_entry_no_req_cnt_full = (pfu_pfb_entry_no_req_cnt[5:0]
                                        == pfb_no_req_cnt_val[5:0]);
//==========================================================
//                Instance state machine
//==========================================================
// &ConnRule(s/^entry_/pfu_pfb_entry_/); @211
// &Instance("ct_lsu_pfu_pfb_tsm","x_ct_lsu_pfu_pfu_entry_tsm"); @212
ct_lsu_pfu_pfb_tsm  x_ct_lsu_pfu_pfu_entry_tsm (
  .cp0_lsu_icg_en                     (cp0_lsu_icg_en                    ),
  .cp0_yy_clk_en                      (cp0_yy_clk_en                     ),
  .cp0_yy_priv_mode                   (cp0_yy_priv_mode                  ),
  .cpurst_b                           (cpurst_b                          ),
  .entry_act_vld                      (pfu_pfb_entry_act_vld             ),
  .entry_biu_pe_req                   (pfu_pfb_entry_biu_pe_req          ),
  .entry_biu_pe_req_grnt              (pfu_pfb_entry_biu_pe_req_grnt     ),
  .entry_biu_pe_req_src               (pfu_pfb_entry_biu_pe_req_src      ),
  .entry_clk                          (pfu_pfb_entry_clk                 ),
  .entry_create_dp_vld                (pfu_pfb_entry_create_dp_vld       ),
  .entry_create_vld                   (pfu_pfb_entry_create_vld          ),
  .entry_dcache_hit_pop_req           (pfu_pfb_entry_dcache_hit_pop_req  ),
  .entry_from_lfb_dcache_hit          (pfu_pfb_entry_from_lfb_dcache_hit ),
  .entry_from_lfb_dcache_miss         (pfu_pfb_entry_from_lfb_dcache_miss),
  .entry_inst_new_va                  (pfu_pfb_entry_inst_new_va         ),
  .entry_l1_biu_pe_req_set            (pfu_pfb_entry_l1_biu_pe_req_set   ),
  .entry_l1_mmu_pe_req_set            (pfu_pfb_entry_l1_mmu_pe_req_set   ),
  .entry_l2_biu_pe_req_set            (pfu_pfb_entry_l2_biu_pe_req_set   ),
  .entry_l2_mmu_pe_req_set            (pfu_pfb_entry_l2_mmu_pe_req_set   ),
  .entry_mmu_pe_req                   (pfu_pfb_entry_mmu_pe_req          ),
  .entry_mmu_pe_req_grnt              (pfu_pfb_entry_mmu_pe_req_grnt     ),
  .entry_mmu_pe_req_src               (pfu_pfb_entry_mmu_pe_req_src      ),
  .entry_pf_inst_vld                  (pfu_pfb_entry_pf_inst_vld         ),
  .entry_pop_vld                      (pfu_pfb_entry_pop_vld             ),
  .entry_priv_mode                    (pfu_pfb_entry_priv_mode           ),
  .entry_reinit_vld                   (pfu_pfb_entry_reinit_vld          ),
  .entry_stride                       (pfu_pfb_entry_stride              ),
  .entry_stride_neg                   (pfu_pfb_entry_stride_neg          ),
  .entry_tsm_is_judge                 (pfu_pfb_entry_tsm_is_judge        ),
  .entry_vld                          (pfu_pfb_entry_vld                 ),
  .forever_cpuclk                     (lsu_special_clk                   ),
  .pad_yy_icg_scan_en                 (pad_yy_icg_scan_en                ),
  .pipe_va                            (pipe_ppfu_va                      )
);

// &Connect(.pipe_va             (pipe_ppfu_va         ), @213
//          .forever_cpuclk      (lsu_special_clk      )); @214

// &ConnRule(s/^entry_/pfu_pfb_entry_/); @216
// &Instance("ct_lsu_pfu_pfb_l1sm","x_ct_lsu_pfu_pfb_entry_l1sm"); @217
ct_lsu_pfu_pfb_l1sm  x_ct_lsu_pfu_pfb_entry_l1sm (
  .cp0_lsu_icg_en                         (cp0_lsu_icg_en                        ),
  .cp0_lsu_pfu_mmu_dis                    (cp0_lsu_pfu_mmu_dis                   ),
  .cp0_yy_clk_en                          (cp0_yy_clk_en                         ),
  .cpurst_b                               (cpurst_b                              ),
  .entry_biu_pe_req                       (pfu_pfb_entry_biu_pe_req              ),
  .entry_biu_pe_req_grnt                  (pfu_pfb_entry_biu_pe_req_grnt         ),
  .entry_biu_pe_req_src                   (pfu_pfb_entry_biu_pe_req_src          ),
  .entry_clk                              (pfu_pfb_entry_clk                     ),
  .entry_create_dp_vld                    (pfu_pfb_entry_create_dp_vld           ),
  .entry_inst_new_va                      (pfu_pfb_entry_inst_new_va             ),
  .entry_l1_biu_pe_req_set                (pfu_pfb_entry_l1_biu_pe_req_set       ),
  .entry_l1_cmp_va_vld                    (pfu_pfb_entry_l1_cmp_va_vld           ),
  .entry_l1_dist_strideh                  (pfu_pfb_entry_l1_dist_strideh         ),
  .entry_l1_mmu_pe_req_set                (pfu_pfb_entry_l1_mmu_pe_req_set       ),
  .entry_l1_page_sec                      (pfu_pfb_entry_l1_page_sec             ),
  .entry_l1_page_share                    (pfu_pfb_entry_l1_page_share           ),
  .entry_l1_pf_addr                       (pfu_pfb_entry_l1_pf_addr              ),
  .entry_l1_pf_va                         (pfu_pfb_entry_l1_pf_va                ),
  .entry_l1_pf_va_sub_inst_new_va         (pfu_pfb_entry_l1_pf_va_sub_inst_new_va),
  .entry_l1_vpn                           (pfu_pfb_entry_l1_vpn                  ),
  .entry_l1sm_reinit_req                  (pfu_pfb_entry_l1sm_reinit_req         ),
  .entry_l1sm_va_can_cmp                  (pfu_pfb_entry_l1sm_va_can_cmp         ),
  .entry_mmu_pe_req                       (pfu_pfb_entry_mmu_pe_req              ),
  .entry_mmu_pe_req_grnt                  (pfu_pfb_entry_mmu_pe_req_grnt         ),
  .entry_mmu_pe_req_src                   (pfu_pfb_entry_mmu_pe_req_src          ),
  .entry_pf_inst_vld                      (pfu_pfb_entry_pf_inst_vld             ),
  .entry_pop_vld                          (pfu_pfb_entry_pop_vld                 ),
  .entry_reinit_vld                       (pfu_pfb_entry_reinit_vld              ),
  .entry_stride_neg                       (pfu_pfb_entry_stride_neg              ),
  .entry_strideh                          (pfu_pfb_entry_strideh                 ),
  .entry_tsm_is_judge                     (pfu_pfb_entry_tsm_is_judge            ),
  .forever_cpuclk                         (lsu_special_clk                       ),
  .ld_da_page_sec_ff                      (ld_da_page_sec_ff                     ),
  .ld_da_page_share_ff                    (ld_da_page_share_ff                   ),
  .ld_da_ppn_ff                           (ld_da_ppn_ff                          ),
  .pad_yy_icg_scan_en                     (pad_yy_icg_scan_en                    ),
  .pfu_biu_pe_req_sel_l1                  (pfu_biu_pe_req_sel_l1                 ),
  .pfu_dcache_pref_en                     (l1_pref_en                            ),
  .pfu_get_page_sec                       (pfu_get_page_sec                      ),
  .pfu_get_page_share                     (pfu_get_page_share                    ),
  .pfu_get_ppn                            (pfu_get_ppn                           ),
  .pfu_get_ppn_err                        (pfu_get_ppn_err                       ),
  .pfu_get_ppn_vld                        (pfu_get_ppn_vld                       ),
  .pfu_mmu_pe_req_sel_l1                  (pfu_mmu_pe_req_sel_l1                 )
);

// &Connect(.forever_cpuclk      (lsu_special_clk      ), @218
//          .pfu_dcache_pref_en  (l1_pref_en           )); @219
// &Force("nonport","pfu_pfb_entry_l1_pf_va_sub_inst_new_va"); @220
// &Force("nonport","pfu_pfb_entry_l1_cmp_va_vld"); @221
// &Force("nonport","pfu_pfb_entry_l1sm_va_can_cmp"); @222

// &ConnRule(s/^entry_/pfu_pfb_entry_/); @224
// &Instance("ct_lsu_pfu_pfb_l2sm","x_ct_lsu_pfu_pfb_entry_l2sm"); @225
ct_lsu_pfu_pfb_l2sm  x_ct_lsu_pfu_pfb_entry_l2sm (
  .cp0_lsu_icg_en                      (cp0_lsu_icg_en                     ),
  .cp0_lsu_pfu_mmu_dis                 (cp0_lsu_pfu_mmu_dis                ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .entry_biu_pe_req                    (pfu_pfb_entry_biu_pe_req           ),
  .entry_biu_pe_req_grnt               (pfu_pfb_entry_biu_pe_req_grnt      ),
  .entry_biu_pe_req_src                (pfu_pfb_entry_biu_pe_req_src       ),
  .entry_clk                           (pfu_pfb_entry_clk                  ),
  .entry_create_dp_vld                 (pfu_pfb_entry_create_dp_vld        ),
  .entry_inst_new_va                   (pfu_pfb_entry_inst_new_va          ),
  .entry_l1_pf_va                      (pfu_pfb_entry_l1_pf_va             ),
  .entry_l2_biu_pe_req_set             (pfu_pfb_entry_l2_biu_pe_req_set    ),
  .entry_l2_cmp_va_vld                 (pfu_pfb_entry_l2_cmp_va_vld        ),
  .entry_l2_dist_strideh               (pfu_pfb_entry_l2_dist_strideh      ),
  .entry_l2_mmu_pe_req_set             (pfu_pfb_entry_l2_mmu_pe_req_set    ),
  .entry_l2_page_sec                   (pfu_pfb_entry_l2_page_sec          ),
  .entry_l2_page_share                 (pfu_pfb_entry_l2_page_share        ),
  .entry_l2_pf_addr                    (pfu_pfb_entry_l2_pf_addr           ),
  .entry_l2_pf_va_sub_l1_pf_va         (pfu_pfb_entry_l2_pf_va_sub_l1_pf_va),
  .entry_l2_vpn                        (pfu_pfb_entry_l2_vpn               ),
  .entry_l2sm_reinit_req               (pfu_pfb_entry_l2sm_reinit_req      ),
  .entry_l2sm_va_can_cmp               (pfu_pfb_entry_l2sm_va_can_cmp      ),
  .entry_mmu_pe_req                    (pfu_pfb_entry_mmu_pe_req           ),
  .entry_mmu_pe_req_grnt               (pfu_pfb_entry_mmu_pe_req_grnt      ),
  .entry_mmu_pe_req_src                (pfu_pfb_entry_mmu_pe_req_src       ),
  .entry_pf_inst_vld                   (pfu_pfb_entry_pf_inst_vld          ),
  .entry_pop_vld                       (pfu_pfb_entry_pop_vld              ),
  .entry_reinit_vld                    (pfu_pfb_entry_reinit_vld           ),
  .entry_stride_neg                    (pfu_pfb_entry_stride_neg           ),
  .entry_strideh                       (pfu_pfb_entry_strideh              ),
  .entry_tsm_is_judge                  (pfu_pfb_entry_tsm_is_judge         ),
  .forever_cpuclk                      (lsu_special_clk                    ),
  .ld_da_page_sec_ff                   (pipe_page_sec                      ),
  .ld_da_page_share_ff                 (pipe_page_share                    ),
  .ld_da_ppn_ff                        (pipe_ppn                           ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .pfu_biu_pe_req_sel_l1               (pfu_biu_pe_req_sel_l1              ),
  .pfu_get_page_sec                    (pfu_get_page_sec                   ),
  .pfu_get_page_share                  (pfu_get_page_share                 ),
  .pfu_get_ppn                         (pfu_get_ppn                        ),
  .pfu_get_ppn_err                     (pfu_get_ppn_err                    ),
  .pfu_get_ppn_vld                     (pfu_get_ppn_vld                    ),
  .pfu_l2_pref_en                      (pfu_l2_pref_en                     ),
  .pfu_mmu_pe_req_sel_l1               (pfu_mmu_pe_req_sel_l1              )
);

// &Connect(.forever_cpuclk      (lsu_special_clk      ), @226
//          .ld_da_ppn_ff        (pipe_ppn             ), @227
//          .ld_da_page_sec_ff   (pipe_page_sec        ), @228
//          .ld_da_page_share_ff (pipe_page_share      )); @229
// &Force("nonport","pfu_pfb_entry_l2_pf_va_sub_l1_pf_va"); @230
// &Force("nonport","pfu_pfb_entry_l2_cmp_va_vld"); @231
// &Force("nonport","pfu_pfb_entry_l2sm_va_can_cmp"); @232

//==========================================================
//                Generate some compare info
//==========================================================
//------------------generate strideh------------------------
assign pfu_pfb_entry_strideh[`PA_WIDTH-1:0]         = {{`PA_WIDTH-11{pfu_pfb_entry_stride_neg}},
                                                      pfu_pfb_entry_stride[10:7],
                                                      pfu_pfb_entry_strideh_6to0[6:0]};

assign pfu_pfb_entry_l1_dist_strideh[`PA_WIDTH-1:0] = {`PA_WIDTH{lsu_pfu_l1_dist_sel[3]}} & {pfu_pfb_entry_strideh[`PA_WIDTH-4:0],3'b0}
                                                      | {`PA_WIDTH{lsu_pfu_l1_dist_sel[2]}} & {pfu_pfb_entry_strideh[`PA_WIDTH-3:0],2'b0}
                                                      | {`PA_WIDTH{lsu_pfu_l1_dist_sel[1]}} & {pfu_pfb_entry_strideh[`PA_WIDTH-2:0],1'b0}
                                                      | {`PA_WIDTH{lsu_pfu_l1_dist_sel[0]}} & pfu_pfb_entry_strideh[`PA_WIDTH-1:0];
assign pfu_pfb_entry_l2_dist_strideh[`PA_WIDTH-1:0] = {`PA_WIDTH{lsu_pfu_l2_dist_sel[3]}} & {pfu_pfb_entry_strideh[`PA_WIDTH-6:0],5'b0}
                                                      | {`PA_WIDTH{lsu_pfu_l2_dist_sel[2]}} & {pfu_pfb_entry_strideh[`PA_WIDTH-5:0],4'b0}
                                                      | {`PA_WIDTH{lsu_pfu_l2_dist_sel[1]}} & {pfu_pfb_entry_strideh[`PA_WIDTH-4:0],3'b0}
                                                      | {`PA_WIDTH{lsu_pfu_l2_dist_sel[0]}} & {pfu_pfb_entry_strideh[`PA_WIDTH-3:0],2'b0};

//==========================================================
//                    Set confidence
//==========================================================
assign pfu_pfb_entry_inst_new_va_hit_pipe = pipe_ppfu_va[`PA_WIDTH-1:0]
                                            ==  pfu_pfb_entry_inst_new_va[`PA_WIDTH-1:0];

//--------------------confidence set------------------------
assign pfu_pfb_entry_confidence_high      = &pfu_pfb_entry_confidence[2:0];
assign pfu_pfb_entry_confidence_low       = !(|pfu_pfb_entry_confidence[2:0]);

assign pfu_pfb_entry_confidence_set       = pfu_pfb_entry_tsm_is_judge
                                            &&  !(pfu_pfb_entry_confidence_high
                                                &&  pfu_pfb_entry_confidence_add_vld)
                                            &&  !(pfu_pfb_entry_confidence_low
                                                &&  !pfu_pfb_entry_confidence_add_vld)
                                            &&  pfu_pfb_entry_pf_inst_vld;

assign pfu_pfb_entry_confidence_add1[2:0] = pfu_pfb_entry_confidence[2:0] + 3'b1;
assign pfu_pfb_entry_confidence_sub1[2:0] = pfu_pfb_entry_confidence[2:0] - 3'b1;

assign pfu_pfb_entry_confidence_add_vld   = pfu_pfb_entry_inst_new_va_hit_pipe;

assign pfu_pfb_entry_confidence_next[2:0] = pfu_pfb_entry_confidence_add_vld
                                            ? pfu_pfb_entry_confidence_add1[2:0]
                                            : pfu_pfb_entry_confidence_sub1[2:0];

//--------------set confidence thdreshold------------------
assign pfu_pfb_entry_confidence_zero      = pfu_pfb_entry_confidence[2:0]
                                            ==  3'b0;

//==========================================================
//                    Set/clr evict
//==========================================================
assign pfu_pfb_entry_timeout_cnt_full = (pfu_pfb_entry_timeout_cnt[TIMEOUT_BW-1:0]
                                         == pfb_timeout_cnt_val[TIMEOUT_BW-1:0]);

assign pfu_pfb_entry_evict_set  = pfu_pfb_entry_vld
                                  &&  (pfu_pfb_entry_timeout_cnt_full
                                       || pfu_pfb_entry_no_req_cnt_full);

assign pfu_pfb_entry_evict_clr  = !pfu_pfb_entry_timeout_cnt_full
                                  && !pfu_pfb_entry_no_req_cnt_full;

//==========================================================
//                Generate pop signal
//==========================================================
assign pfu_pfb_entry_reinit_vld = pfu_pfb_entry_l1sm_reinit_req
                                  ||  pfu_pfb_entry_l2sm_reinit_req
                                  ||  pfu_pfb_entry_create_vld
                                  ||  pfu_pfb_entry_tsm_is_judge
                                      &&  pfu_pfb_entry_pf_inst_vld
                                      &&  !pfu_pfb_entry_inst_new_va_hit_pipe;

//st pref pop
assign pfu_pop_st_all = pfu_pfb_entry_vld
                        && !pfu_pfb_entry_type_ld 
                        && (!cp0_lsu_l2_st_pref_en || amr_wa_cancel);

assign pfu_pfb_entry_pop_vld    = pfu_pop_all_part_vld
                                  ||  pfu_pop_st_all
                                  ||  pfu_pfb_entry_vld
                                      &&  (pfu_pfb_entry_dcache_hit_pop_req
                                          ||  pfu_pfb_entry_confidence_zero);

//==========================================================
//                 Generate interface
//==========================================================
//------------------input-----------------------------------
//-----------create signal--------------
assign pfu_pfb_entry_create_vld         = pfu_pfb_entry_create_vld_x;
assign pfu_pfb_entry_create_dp_vld      = pfu_pfb_entry_create_dp_vld_x;
assign pfu_pfb_entry_create_gateclk_en  = pfu_pfb_entry_create_gateclk_en_x;
//---------grnt/done signal-------------
assign pfu_pfb_entry_biu_pe_req_grnt    = pfu_pfb_entry_biu_pe_req_grnt_x;
assign pfu_pfb_entry_mmu_pe_req_grnt    = pfu_pfb_entry_mmu_pe_req_grnt_x;
//-----------reply signal---------------
assign pfu_pfb_entry_from_lfb_dcache_hit  = pfu_pfb_entry_from_lfb_dcache_hit_x;
assign pfu_pfb_entry_from_lfb_dcache_miss = pfu_pfb_entry_from_lfb_dcache_miss_x;
//------------------output----------------------------------
//-----------entry signal---------------
assign pfu_pfb_entry_vld_x                        = pfu_pfb_entry_vld;
assign pfu_pfb_entry_l1_vpn_v[`PA_WIDTH-13:0]     = pfu_pfb_entry_l1_vpn[`PA_WIDTH-13:0];
assign pfu_pfb_entry_l1_pf_addr_v[`PA_WIDTH-1:0]  = pfu_pfb_entry_l1_pf_addr[`PA_WIDTH-1:0];
assign pfu_pfb_entry_l1_page_sec_x                = pfu_pfb_entry_l1_page_sec;
assign pfu_pfb_entry_l1_page_share_x              = pfu_pfb_entry_l1_page_share;
assign pfu_pfb_entry_l2_vpn_v[`PA_WIDTH-13:0]     = pfu_pfb_entry_l2_vpn[`PA_WIDTH-13:0];
assign pfu_pfb_entry_l2_pf_addr_v[`PA_WIDTH-1:0]  = pfu_pfb_entry_l2_pf_addr[`PA_WIDTH-1:0];
assign pfu_pfb_entry_l2_page_sec_x                = pfu_pfb_entry_l2_page_sec;
assign pfu_pfb_entry_l2_page_share_x              = pfu_pfb_entry_l2_page_share;
assign pfu_pfb_entry_biu_pe_req_x                 = pfu_pfb_entry_biu_pe_req;
assign pfu_pfb_entry_biu_pe_req_src_v[1:0]        = pfu_pfb_entry_biu_pe_req_src[1:0];
assign pfu_pfb_entry_mmu_pe_req_x                 = pfu_pfb_entry_mmu_pe_req;
assign pfu_pfb_entry_mmu_pe_req_src_v[1:0]        = pfu_pfb_entry_mmu_pe_req_src[1:0];
assign pfu_pfb_entry_evict_x                      = pfu_pfb_entry_evict;
assign pfu_pfb_entry_priv_mode_v[1:0]             = pfu_pfb_entry_priv_mode[1:0];
//-----------hit signal-----------------
assign pfu_pfb_entry_hit_pc_x                     = pfu_pfb_entry_hit_pc_for_new;

// &ModuleEnd; @349
endmodule


