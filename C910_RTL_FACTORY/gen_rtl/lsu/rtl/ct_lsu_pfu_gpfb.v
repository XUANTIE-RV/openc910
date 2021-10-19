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

// &ModuleBeg; @27
module ct_lsu_pfu_gpfb(
  cp0_lsu_icg_en,
  cp0_lsu_pfu_mmu_dis,
  cp0_yy_clk_en,
  cp0_yy_priv_mode,
  cpurst_b,
  forever_cpuclk,
  ld_da_page_sec_ff,
  ld_da_page_share_ff,
  ld_da_pfu_act_vld,
  ld_da_pfu_pf_inst_vld,
  ld_da_pfu_va,
  ld_da_ppn_ff,
  lsu_pfu_l1_dist_sel,
  lsu_pfu_l2_dist_sel,
  pad_yy_icg_scan_en,
  pfu_biu_pe_req_sel_l1,
  pfu_dcache_pref_en,
  pfu_get_page_sec,
  pfu_get_page_share,
  pfu_get_ppn,
  pfu_get_ppn_err,
  pfu_get_ppn_vld,
  pfu_gpfb_biu_pe_req,
  pfu_gpfb_biu_pe_req_grnt,
  pfu_gpfb_biu_pe_req_src,
  pfu_gpfb_from_lfb_dcache_hit,
  pfu_gpfb_from_lfb_dcache_miss,
  pfu_gpfb_l1_page_sec,
  pfu_gpfb_l1_page_share,
  pfu_gpfb_l1_pf_addr,
  pfu_gpfb_l1_vpn,
  pfu_gpfb_l2_page_sec,
  pfu_gpfb_l2_page_share,
  pfu_gpfb_l2_pf_addr,
  pfu_gpfb_l2_vpn,
  pfu_gpfb_mmu_pe_req,
  pfu_gpfb_mmu_pe_req_grnt,
  pfu_gpfb_mmu_pe_req_src,
  pfu_gpfb_priv_mode,
  pfu_gpfb_vld,
  pfu_gsdb_gpfb_create_vld,
  pfu_gsdb_gpfb_pop_req,
  pfu_gsdb_stride,
  pfu_gsdb_stride_neg,
  pfu_gsdb_strideh_6to0,
  pfu_l2_pref_en,
  pfu_mmu_pe_req_sel_l1,
  pfu_pop_all_vld
);

// &Ports; @28
input           cp0_lsu_icg_en;                           
input           cp0_lsu_pfu_mmu_dis;                      
input           cp0_yy_clk_en;                            
input   [1 :0]  cp0_yy_priv_mode;                         
input           cpurst_b;                                 
input           forever_cpuclk;                           
input           ld_da_page_sec_ff;                        
input           ld_da_page_share_ff;                      
input           ld_da_pfu_act_vld;                        
input           ld_da_pfu_pf_inst_vld;                    
input   [39:0]  ld_da_pfu_va;                             
input   [27:0]  ld_da_ppn_ff;                             
input   [3 :0]  lsu_pfu_l1_dist_sel;                      
input   [3 :0]  lsu_pfu_l2_dist_sel;                      
input           pad_yy_icg_scan_en;                       
input           pfu_biu_pe_req_sel_l1;                    
input           pfu_dcache_pref_en;                       
input           pfu_get_page_sec;                         
input           pfu_get_page_share;                       
input   [27:0]  pfu_get_ppn;                              
input           pfu_get_ppn_err;                          
input           pfu_get_ppn_vld;                          
input           pfu_gpfb_biu_pe_req_grnt;                 
input           pfu_gpfb_from_lfb_dcache_hit;             
input           pfu_gpfb_from_lfb_dcache_miss;            
input           pfu_gpfb_mmu_pe_req_grnt;                 
input           pfu_gsdb_gpfb_create_vld;                 
input           pfu_gsdb_gpfb_pop_req;                    
input   [10:0]  pfu_gsdb_stride;                          
input           pfu_gsdb_stride_neg;                      
input   [6 :0]  pfu_gsdb_strideh_6to0;                    
input           pfu_l2_pref_en;                           
input           pfu_mmu_pe_req_sel_l1;                    
input           pfu_pop_all_vld;                          
output          pfu_gpfb_biu_pe_req;                      
output  [1 :0]  pfu_gpfb_biu_pe_req_src;                  
output          pfu_gpfb_l1_page_sec;                     
output          pfu_gpfb_l1_page_share;                   
output  [39:0]  pfu_gpfb_l1_pf_addr;                      
output  [27:0]  pfu_gpfb_l1_vpn;                          
output          pfu_gpfb_l2_page_sec;                     
output          pfu_gpfb_l2_page_share;                   
output  [39:0]  pfu_gpfb_l2_pf_addr;                      
output  [27:0]  pfu_gpfb_l2_vpn;                          
output          pfu_gpfb_mmu_pe_req;                      
output  [1 :0]  pfu_gpfb_mmu_pe_req_src;                  
output  [1 :0]  pfu_gpfb_priv_mode;                       
output          pfu_gpfb_vld;                             

// &Regs; @29
reg             pfu_gpfb_inst_new_va_too_far_l1_pf_va;    
reg             pfu_gpfb_l1_pf_va_too_far_l2_pf_va;       
reg     [6 :0]  pfu_gpfb_strideh_6to0;                    

// &Wires; @30
wire            cp0_lsu_icg_en;                           
wire            cp0_lsu_pfu_mmu_dis;                      
wire            cp0_yy_clk_en;                            
wire    [1 :0]  cp0_yy_priv_mode;                         
wire            cpurst_b;                                 
wire            forever_cpuclk;                           
wire            ld_da_page_sec_ff;                        
wire            ld_da_page_share_ff;                      
wire            ld_da_pfu_act_vld;                        
wire            ld_da_pfu_pf_inst_vld;                    
wire    [39:0]  ld_da_pfu_va;                             
wire    [27:0]  ld_da_ppn_ff;                             
wire    [3 :0]  lsu_pfu_l1_dist_sel;                      
wire    [3 :0]  lsu_pfu_l2_dist_sel;                      
wire            pad_yy_icg_scan_en;                       
wire    [39:0]  pfb_gpfb_128strideh;                      
wire    [39:0]  pfb_gpfb_32strideh;                       
wire            pfu_biu_pe_req_sel_l1;                    
wire            pfu_dcache_pref_en;                       
wire            pfu_get_page_sec;                         
wire            pfu_get_page_share;                       
wire    [27:0]  pfu_get_ppn;                              
wire            pfu_get_ppn_err;                          
wire            pfu_get_ppn_vld;                          
wire            pfu_gpfb_act_vld;                         
wire            pfu_gpfb_biu_pe_req;                      
wire            pfu_gpfb_biu_pe_req_grnt;                 
wire    [1 :0]  pfu_gpfb_biu_pe_req_src;                  
wire            pfu_gpfb_clk;                             
wire            pfu_gpfb_clk_en;                          
wire            pfu_gpfb_create_clk;                      
wire            pfu_gpfb_create_clk_en;                   
wire            pfu_gpfb_create_dp_vld;                   
wire            pfu_gpfb_create_gateclk_en;               
wire            pfu_gpfb_create_vld;                      
wire            pfu_gpfb_dcache_hit_pop_req;              
wire            pfu_gpfb_from_lfb_dcache_hit;             
wire            pfu_gpfb_from_lfb_dcache_miss;            
wire    [39:0]  pfu_gpfb_inst_new_va;                     
wire            pfu_gpfb_inst_new_va_too_far_l1_pf_va_set; 
wire            pfu_gpfb_l1_biu_pe_req_set;               
wire            pfu_gpfb_l1_cmp_va_vld;                   
wire    [39:0]  pfu_gpfb_l1_dist_strideh;                 
wire            pfu_gpfb_l1_mmu_pe_req_set;               
wire            pfu_gpfb_l1_page_sec;                     
wire            pfu_gpfb_l1_page_share;                   
wire    [39:0]  pfu_gpfb_l1_pf_addr;                      
wire    [39:0]  pfu_gpfb_l1_pf_va;                        
wire    [39:0]  pfu_gpfb_l1_pf_va_sub_inst_new_va;        
wire            pfu_gpfb_l1_pf_va_too_far_l2_pf_va_set;   
wire    [27:0]  pfu_gpfb_l1_vpn;                          
wire    [39:0]  pfu_gpfb_l1sm_diff_sub_32strideh;         
wire            pfu_gpfb_l1sm_reinit_req;                 
wire            pfu_gpfb_l1sm_va_can_cmp;                 
wire            pfu_gpfb_l2_biu_pe_req_set;               
wire            pfu_gpfb_l2_cmp_va_vld;                   
wire    [39:0]  pfu_gpfb_l2_dist_strideh;                 
wire            pfu_gpfb_l2_mmu_pe_req_set;               
wire            pfu_gpfb_l2_page_sec;                     
wire            pfu_gpfb_l2_page_share;                   
wire    [39:0]  pfu_gpfb_l2_pf_addr;                      
wire    [39:0]  pfu_gpfb_l2_pf_va_sub_l1_pf_va;           
wire    [27:0]  pfu_gpfb_l2_vpn;                          
wire    [39:0]  pfu_gpfb_l2sm_diff_sub_128strideh;        
wire            pfu_gpfb_l2sm_reinit_req;                 
wire            pfu_gpfb_l2sm_va_can_cmp;                 
wire            pfu_gpfb_mmu_pe_req;                      
wire            pfu_gpfb_mmu_pe_req_grnt;                 
wire    [1 :0]  pfu_gpfb_mmu_pe_req_src;                  
wire            pfu_gpfb_pf_inst_vld;                     
wire            pfu_gpfb_pop_vld;                         
wire    [1 :0]  pfu_gpfb_priv_mode;                       
wire            pfu_gpfb_reinit_vld;                      
wire    [10:0]  pfu_gpfb_stride;                          
wire            pfu_gpfb_stride_neg;                      
wire    [39:0]  pfu_gpfb_strideh;                         
wire            pfu_gpfb_tsm_is_judge;                    
wire            pfu_gpfb_vld;                             
wire            pfu_gsdb_gpfb_create_vld;                 
wire            pfu_gsdb_gpfb_pop_req;                    
wire    [10:0]  pfu_gsdb_stride;                          
wire            pfu_gsdb_stride_neg;                      
wire    [6 :0]  pfu_gsdb_strideh_6to0;                    
wire            pfu_l2_pref_en;                           
wire            pfu_mmu_pe_req_sel_l1;                    
wire            pfu_pop_all_vld;                          


//==========================================================
//                 Instance of Gated Cell  
//==========================================================
assign pfu_gpfb_clk_en  = pfu_gpfb_vld
                          ||  pfu_gpfb_create_gateclk_en;
// &Instance("gated_clk_cell", "x_lsu_pfu_gpfb_gated_clk"); @37
gated_clk_cell  x_lsu_pfu_gpfb_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (pfu_gpfb_clk      ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (pfu_gpfb_clk_en   ),
  .module_en          (cp0_lsu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in        (forever_cpuclk     ), @38
//          .external_en   (1'b0               ), @39
//          .global_en     (cp0_yy_clk_en      ), @40
//          .module_en     (cp0_lsu_icg_en     ), @41
//          .local_en      (pfu_gpfb_clk_en), @42
//          .clk_out       (pfu_gpfb_clk  )); @43

//create clk
assign pfu_gpfb_create_clk_en = pfu_gpfb_create_gateclk_en;
// &Instance("gated_clk_cell", "x_lsu_pfu_gpfb_create_gated_clk"); @47
gated_clk_cell  x_lsu_pfu_gpfb_create_gated_clk (
  .clk_in                 (forever_cpuclk        ),
  .clk_out                (pfu_gpfb_create_clk   ),
  .external_en            (1'b0                  ),
  .global_en              (cp0_yy_clk_en         ),
  .local_en               (pfu_gpfb_create_clk_en),
  .module_en              (cp0_lsu_icg_en        ),
  .pad_yy_icg_scan_en     (pad_yy_icg_scan_en    )
);

// &Connect(.clk_in        (forever_cpuclk     ), @48
//          .external_en   (1'b0               ), @49
//          .global_en     (cp0_yy_clk_en      ), @50
//          .module_en     (cp0_lsu_icg_en     ), @51
//          .local_en      (pfu_gpfb_create_clk_en), @52
//          .clk_out       (pfu_gpfb_create_clk)); @53

//==========================================================
//                 Register
//==========================================================
//+--------+----------------------+
//| stride | stride_be_cache_line |
//+--------+----------------------+
assign pfu_gpfb_stride[10:0]  = pfu_gsdb_stride[10:0];
assign pfu_gpfb_stride_neg    = pfu_gsdb_stride_neg;
always @(posedge pfu_gpfb_create_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
  begin
    pfu_gpfb_strideh_6to0[6:0]     <=  7'b0;
  end
  else if(pfu_gpfb_create_dp_vld)
  begin
    pfu_gpfb_strideh_6to0[6:0]     <=  pfu_gsdb_strideh_6to0[6:0];
  end
end

//+-------------------+
//| some compare info |
//+-------------------+
always @(posedge pfu_gpfb_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    pfu_gpfb_inst_new_va_too_far_l1_pf_va  <=  1'b0;
  else if(pfu_gpfb_create_dp_vld ||  pfu_gpfb_reinit_vld)
    pfu_gpfb_inst_new_va_too_far_l1_pf_va  <=  1'b0;
  else if(pfu_gpfb_l1_cmp_va_vld &&  pfu_gpfb_l1sm_va_can_cmp)
    pfu_gpfb_inst_new_va_too_far_l1_pf_va  <=  pfu_gpfb_inst_new_va_too_far_l1_pf_va_set;
end

always @(posedge pfu_gpfb_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    pfu_gpfb_l1_pf_va_too_far_l2_pf_va     <=  1'b0;
  else if(pfu_gpfb_create_dp_vld ||  pfu_gpfb_reinit_vld)
    pfu_gpfb_l1_pf_va_too_far_l2_pf_va     <=  1'b0;
  else if(pfu_gpfb_l2_cmp_va_vld &&  pfu_gpfb_l2sm_va_can_cmp)
    pfu_gpfb_l1_pf_va_too_far_l2_pf_va     <=  pfu_gpfb_l1_pf_va_too_far_l2_pf_va_set;
end

//==========================================================
//                Generate pf_inst_vld signal
//==========================================================
assign pfu_gpfb_pf_inst_vld = pfu_gpfb_vld
                              &&  ld_da_pfu_pf_inst_vld;

assign pfu_gpfb_act_vld     = pfu_gpfb_vld
                              &&  ld_da_pfu_act_vld;
//==========================================================
//                Instance state machine
//==========================================================
// &ConnRule(s/^entry_/pfu_gpfb_/); @109
// &Instance("ct_lsu_pfu_pfb_tsm","x_ct_lsu_pfu_gpfb_tsm"); @110
ct_lsu_pfu_pfb_tsm  x_ct_lsu_pfu_gpfb_tsm (
  .cp0_lsu_icg_en                (cp0_lsu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .cp0_yy_priv_mode              (cp0_yy_priv_mode             ),
  .cpurst_b                      (cpurst_b                     ),
  .entry_act_vld                 (pfu_gpfb_act_vld             ),
  .entry_biu_pe_req              (pfu_gpfb_biu_pe_req          ),
  .entry_biu_pe_req_grnt         (pfu_gpfb_biu_pe_req_grnt     ),
  .entry_biu_pe_req_src          (pfu_gpfb_biu_pe_req_src      ),
  .entry_clk                     (pfu_gpfb_clk                 ),
  .entry_create_dp_vld           (pfu_gpfb_create_dp_vld       ),
  .entry_create_vld              (pfu_gpfb_create_vld          ),
  .entry_dcache_hit_pop_req      (pfu_gpfb_dcache_hit_pop_req  ),
  .entry_from_lfb_dcache_hit     (pfu_gpfb_from_lfb_dcache_hit ),
  .entry_from_lfb_dcache_miss    (pfu_gpfb_from_lfb_dcache_miss),
  .entry_inst_new_va             (pfu_gpfb_inst_new_va         ),
  .entry_l1_biu_pe_req_set       (pfu_gpfb_l1_biu_pe_req_set   ),
  .entry_l1_mmu_pe_req_set       (pfu_gpfb_l1_mmu_pe_req_set   ),
  .entry_l2_biu_pe_req_set       (pfu_gpfb_l2_biu_pe_req_set   ),
  .entry_l2_mmu_pe_req_set       (pfu_gpfb_l2_mmu_pe_req_set   ),
  .entry_mmu_pe_req              (pfu_gpfb_mmu_pe_req          ),
  .entry_mmu_pe_req_grnt         (pfu_gpfb_mmu_pe_req_grnt     ),
  .entry_mmu_pe_req_src          (pfu_gpfb_mmu_pe_req_src      ),
  .entry_pf_inst_vld             (pfu_gpfb_pf_inst_vld         ),
  .entry_pop_vld                 (pfu_gpfb_pop_vld             ),
  .entry_priv_mode               (pfu_gpfb_priv_mode           ),
  .entry_reinit_vld              (pfu_gpfb_reinit_vld          ),
  .entry_stride                  (pfu_gpfb_stride              ),
  .entry_stride_neg              (pfu_gpfb_stride_neg          ),
  .entry_tsm_is_judge            (pfu_gpfb_tsm_is_judge        ),
  .entry_vld                     (pfu_gpfb_vld                 ),
  .forever_cpuclk                (forever_cpuclk               ),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .pipe_va                       (ld_da_pfu_va                 )
);

// &Connect(.pipe_va             (ld_da_pfu_va       )); @111


// &ConnRule(s/^entry_/pfu_gpfb_/); @114
// &Instance("ct_lsu_pfu_pfb_l1sm","x_ct_lsu_pfu_gpfb_l1sm"); @115
ct_lsu_pfu_pfb_l1sm  x_ct_lsu_pfu_gpfb_l1sm (
  .cp0_lsu_icg_en                    (cp0_lsu_icg_en                   ),
  .cp0_lsu_pfu_mmu_dis               (cp0_lsu_pfu_mmu_dis              ),
  .cp0_yy_clk_en                     (cp0_yy_clk_en                    ),
  .cpurst_b                          (cpurst_b                         ),
  .entry_biu_pe_req                  (pfu_gpfb_biu_pe_req              ),
  .entry_biu_pe_req_grnt             (pfu_gpfb_biu_pe_req_grnt         ),
  .entry_biu_pe_req_src              (pfu_gpfb_biu_pe_req_src          ),
  .entry_clk                         (pfu_gpfb_clk                     ),
  .entry_create_dp_vld               (pfu_gpfb_create_dp_vld           ),
  .entry_inst_new_va                 (pfu_gpfb_inst_new_va             ),
  .entry_l1_biu_pe_req_set           (pfu_gpfb_l1_biu_pe_req_set       ),
  .entry_l1_cmp_va_vld               (pfu_gpfb_l1_cmp_va_vld           ),
  .entry_l1_dist_strideh             (pfu_gpfb_l1_dist_strideh         ),
  .entry_l1_mmu_pe_req_set           (pfu_gpfb_l1_mmu_pe_req_set       ),
  .entry_l1_page_sec                 (pfu_gpfb_l1_page_sec             ),
  .entry_l1_page_share               (pfu_gpfb_l1_page_share           ),
  .entry_l1_pf_addr                  (pfu_gpfb_l1_pf_addr              ),
  .entry_l1_pf_va                    (pfu_gpfb_l1_pf_va                ),
  .entry_l1_pf_va_sub_inst_new_va    (pfu_gpfb_l1_pf_va_sub_inst_new_va),
  .entry_l1_vpn                      (pfu_gpfb_l1_vpn                  ),
  .entry_l1sm_reinit_req             (pfu_gpfb_l1sm_reinit_req         ),
  .entry_l1sm_va_can_cmp             (pfu_gpfb_l1sm_va_can_cmp         ),
  .entry_mmu_pe_req                  (pfu_gpfb_mmu_pe_req              ),
  .entry_mmu_pe_req_grnt             (pfu_gpfb_mmu_pe_req_grnt         ),
  .entry_mmu_pe_req_src              (pfu_gpfb_mmu_pe_req_src          ),
  .entry_pf_inst_vld                 (pfu_gpfb_pf_inst_vld             ),
  .entry_pop_vld                     (pfu_gpfb_pop_vld                 ),
  .entry_reinit_vld                  (pfu_gpfb_reinit_vld              ),
  .entry_stride_neg                  (pfu_gpfb_stride_neg              ),
  .entry_strideh                     (pfu_gpfb_strideh                 ),
  .entry_tsm_is_judge                (pfu_gpfb_tsm_is_judge            ),
  .forever_cpuclk                    (forever_cpuclk                   ),
  .ld_da_page_sec_ff                 (ld_da_page_sec_ff                ),
  .ld_da_page_share_ff               (ld_da_page_share_ff              ),
  .ld_da_ppn_ff                      (ld_da_ppn_ff                     ),
  .pad_yy_icg_scan_en                (pad_yy_icg_scan_en               ),
  .pfu_biu_pe_req_sel_l1             (pfu_biu_pe_req_sel_l1            ),
  .pfu_dcache_pref_en                (pfu_dcache_pref_en               ),
  .pfu_get_page_sec                  (pfu_get_page_sec                 ),
  .pfu_get_page_share                (pfu_get_page_share               ),
  .pfu_get_ppn                       (pfu_get_ppn                      ),
  .pfu_get_ppn_err                   (pfu_get_ppn_err                  ),
  .pfu_get_ppn_vld                   (pfu_get_ppn_vld                  ),
  .pfu_mmu_pe_req_sel_l1             (pfu_mmu_pe_req_sel_l1            )
);


// &ConnRule(s/^entry_/pfu_gpfb_/); @117
// &Instance("ct_lsu_pfu_pfb_l2sm","x_ct_lsu_pfu_gpfb_l2sm"); @118
ct_lsu_pfu_pfb_l2sm  x_ct_lsu_pfu_gpfb_l2sm (
  .cp0_lsu_icg_en                 (cp0_lsu_icg_en                ),
  .cp0_lsu_pfu_mmu_dis            (cp0_lsu_pfu_mmu_dis           ),
  .cp0_yy_clk_en                  (cp0_yy_clk_en                 ),
  .cpurst_b                       (cpurst_b                      ),
  .entry_biu_pe_req               (pfu_gpfb_biu_pe_req           ),
  .entry_biu_pe_req_grnt          (pfu_gpfb_biu_pe_req_grnt      ),
  .entry_biu_pe_req_src           (pfu_gpfb_biu_pe_req_src       ),
  .entry_clk                      (pfu_gpfb_clk                  ),
  .entry_create_dp_vld            (pfu_gpfb_create_dp_vld        ),
  .entry_inst_new_va              (pfu_gpfb_inst_new_va          ),
  .entry_l1_pf_va                 (pfu_gpfb_l1_pf_va             ),
  .entry_l2_biu_pe_req_set        (pfu_gpfb_l2_biu_pe_req_set    ),
  .entry_l2_cmp_va_vld            (pfu_gpfb_l2_cmp_va_vld        ),
  .entry_l2_dist_strideh          (pfu_gpfb_l2_dist_strideh      ),
  .entry_l2_mmu_pe_req_set        (pfu_gpfb_l2_mmu_pe_req_set    ),
  .entry_l2_page_sec              (pfu_gpfb_l2_page_sec          ),
  .entry_l2_page_share            (pfu_gpfb_l2_page_share        ),
  .entry_l2_pf_addr               (pfu_gpfb_l2_pf_addr           ),
  .entry_l2_pf_va_sub_l1_pf_va    (pfu_gpfb_l2_pf_va_sub_l1_pf_va),
  .entry_l2_vpn                   (pfu_gpfb_l2_vpn               ),
  .entry_l2sm_reinit_req          (pfu_gpfb_l2sm_reinit_req      ),
  .entry_l2sm_va_can_cmp          (pfu_gpfb_l2sm_va_can_cmp      ),
  .entry_mmu_pe_req               (pfu_gpfb_mmu_pe_req           ),
  .entry_mmu_pe_req_grnt          (pfu_gpfb_mmu_pe_req_grnt      ),
  .entry_mmu_pe_req_src           (pfu_gpfb_mmu_pe_req_src       ),
  .entry_pf_inst_vld              (pfu_gpfb_pf_inst_vld          ),
  .entry_pop_vld                  (pfu_gpfb_pop_vld              ),
  .entry_reinit_vld               (pfu_gpfb_reinit_vld           ),
  .entry_stride_neg               (pfu_gpfb_stride_neg           ),
  .entry_strideh                  (pfu_gpfb_strideh              ),
  .entry_tsm_is_judge             (pfu_gpfb_tsm_is_judge         ),
  .forever_cpuclk                 (forever_cpuclk                ),
  .ld_da_page_sec_ff              (ld_da_page_sec_ff             ),
  .ld_da_page_share_ff            (ld_da_page_share_ff           ),
  .ld_da_ppn_ff                   (ld_da_ppn_ff                  ),
  .pad_yy_icg_scan_en             (pad_yy_icg_scan_en            ),
  .pfu_biu_pe_req_sel_l1          (pfu_biu_pe_req_sel_l1         ),
  .pfu_get_page_sec               (pfu_get_page_sec              ),
  .pfu_get_page_share             (pfu_get_page_share            ),
  .pfu_get_ppn                    (pfu_get_ppn                   ),
  .pfu_get_ppn_err                (pfu_get_ppn_err               ),
  .pfu_get_ppn_vld                (pfu_get_ppn_vld               ),
  .pfu_l2_pref_en                 (pfu_l2_pref_en                ),
  .pfu_mmu_pe_req_sel_l1          (pfu_mmu_pe_req_sel_l1         )
);


//==========================================================
//                Generate some compare info
//==========================================================
//------------------generate strideh------------------------
assign pfu_gpfb_strideh[`PA_WIDTH-1:0]          = {{`PA_WIDTH-11{pfu_gpfb_stride_neg}},
                                                  pfu_gpfb_stride[10:7],
                                                  pfu_gpfb_strideh_6to0[6:0]};

assign pfu_gpfb_l1_dist_strideh[`PA_WIDTH-1:0]  = {`PA_WIDTH{lsu_pfu_l1_dist_sel[3]}} & {pfu_gpfb_strideh[`PA_WIDTH-5:0],4'b0}
                                                  | {`PA_WIDTH{lsu_pfu_l1_dist_sel[2]}} & {pfu_gpfb_strideh[`PA_WIDTH-4:0],3'b0}
                                                  | {`PA_WIDTH{lsu_pfu_l1_dist_sel[1]}} & {pfu_gpfb_strideh[`PA_WIDTH-3:0],2'b0}
                                                  | {`PA_WIDTH{lsu_pfu_l1_dist_sel[0]}} & {pfu_gpfb_strideh[`PA_WIDTH-2:0],1'b0};
assign pfu_gpfb_l2_dist_strideh[`PA_WIDTH-1:0]  = {`PA_WIDTH{lsu_pfu_l2_dist_sel[3]}} & {pfu_gpfb_strideh[`PA_WIDTH-7:0],6'b0}
                                                  | {`PA_WIDTH{lsu_pfu_l2_dist_sel[2]}} & {pfu_gpfb_strideh[`PA_WIDTH-6:0],5'b0}
                                                  | {`PA_WIDTH{lsu_pfu_l2_dist_sel[1]}} & {pfu_gpfb_strideh[`PA_WIDTH-5:0],4'b0}
                                                  | {`PA_WIDTH{lsu_pfu_l2_dist_sel[0]}} & {pfu_gpfb_strideh[`PA_WIDTH-4:0],3'b0};

assign pfb_gpfb_32strideh[`PA_WIDTH-1:0]        = {pfu_gpfb_strideh[`PA_WIDTH-6:0],5'b0};
assign pfb_gpfb_128strideh[`PA_WIDTH-1:0]        = {pfu_gpfb_strideh[`PA_WIDTH-8:0],7'b0};

//-----------------generate l1 too far----------------------
assign pfu_gpfb_l1sm_diff_sub_32strideh[`PA_WIDTH-1:0]  = 
                pfu_gpfb_l1_pf_va_sub_inst_new_va[`PA_WIDTH-1:0]
                - pfb_gpfb_32strideh[`PA_WIDTH-1:0];

assign pfu_gpfb_inst_new_va_too_far_l1_pf_va_set  =
                pfu_gpfb_stride_neg
                ==  pfu_gpfb_l1sm_diff_sub_32strideh[`PA_WIDTH-1];

//-----------------generate l2 too far----------------------
assign pfu_gpfb_l2sm_diff_sub_128strideh[`PA_WIDTH-1:0]  = 
                pfu_gpfb_l2_pf_va_sub_l1_pf_va[`PA_WIDTH-1:0]
                - pfb_gpfb_128strideh[`PA_WIDTH-1:0];

assign pfu_gpfb_l1_pf_va_too_far_l2_pf_va_set =
                pfu_gpfb_stride_neg
                ==  pfu_gpfb_l2sm_diff_sub_128strideh[`PA_WIDTH-1];

//==========================================================
//              Generate pop/reinit signal
//==========================================================
assign pfu_gpfb_reinit_vld          = pfu_gpfb_l1sm_reinit_req
                                      ||  pfu_gpfb_l2sm_reinit_req;

assign pfu_gpfb_pop_vld             = pfu_pop_all_vld
                                      ||  pfu_gpfb_vld
                                          &&  (pfu_gpfb_dcache_hit_pop_req
                                              ||  pfu_gpfb_inst_new_va_too_far_l1_pf_va
                                              ||  pfu_gpfb_l1_pf_va_too_far_l2_pf_va
                                              ||  pfu_gsdb_gpfb_pop_req);

//==========================================================
//                Generate create signal
//==========================================================
assign pfu_gpfb_create_vld          = pfu_gsdb_gpfb_create_vld;
assign pfu_gpfb_create_dp_vld       = pfu_gsdb_gpfb_create_vld;
assign pfu_gpfb_create_gateclk_en   = pfu_gsdb_gpfb_create_vld;
// &Force("output","pfu_gpfb_vld"); @177
// &Force("output","pfu_gpfb_biu_pe_req"); @178
// &Force("output","pfu_gpfb_biu_pe_req_src"); @179
// &Force("output","pfu_gpfb_mmu_pe_req"); @180
// &Force("output","pfu_gpfb_mmu_pe_req_src"); @181

// &ModuleEnd; @183
endmodule


