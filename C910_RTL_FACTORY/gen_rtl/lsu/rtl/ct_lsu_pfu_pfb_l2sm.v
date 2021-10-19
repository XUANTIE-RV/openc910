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
module ct_lsu_pfu_pfb_l2sm(
  cp0_lsu_icg_en,
  cp0_lsu_pfu_mmu_dis,
  cp0_yy_clk_en,
  cpurst_b,
  entry_biu_pe_req,
  entry_biu_pe_req_grnt,
  entry_biu_pe_req_src,
  entry_clk,
  entry_create_dp_vld,
  entry_inst_new_va,
  entry_l1_pf_va,
  entry_l2_biu_pe_req_set,
  entry_l2_cmp_va_vld,
  entry_l2_dist_strideh,
  entry_l2_mmu_pe_req_set,
  entry_l2_page_sec,
  entry_l2_page_share,
  entry_l2_pf_addr,
  entry_l2_pf_va_sub_l1_pf_va,
  entry_l2_vpn,
  entry_l2sm_reinit_req,
  entry_l2sm_va_can_cmp,
  entry_mmu_pe_req,
  entry_mmu_pe_req_grnt,
  entry_mmu_pe_req_src,
  entry_pf_inst_vld,
  entry_pop_vld,
  entry_reinit_vld,
  entry_stride_neg,
  entry_strideh,
  entry_tsm_is_judge,
  forever_cpuclk,
  ld_da_page_sec_ff,
  ld_da_page_share_ff,
  ld_da_ppn_ff,
  pad_yy_icg_scan_en,
  pfu_biu_pe_req_sel_l1,
  pfu_get_page_sec,
  pfu_get_page_share,
  pfu_get_ppn,
  pfu_get_ppn_err,
  pfu_get_ppn_vld,
  pfu_l2_pref_en,
  pfu_mmu_pe_req_sel_l1
);

// &Ports; @28
input           cp0_lsu_icg_en;                     
input           cp0_lsu_pfu_mmu_dis;                
input           cp0_yy_clk_en;                      
input           cpurst_b;                           
input           entry_biu_pe_req;                   
input           entry_biu_pe_req_grnt;              
input   [1 :0]  entry_biu_pe_req_src;               
input           entry_clk;                          
input           entry_create_dp_vld;                
input   [39:0]  entry_inst_new_va;                  
input   [39:0]  entry_l1_pf_va;                     
input   [39:0]  entry_l2_dist_strideh;              
input           entry_mmu_pe_req;                   
input           entry_mmu_pe_req_grnt;              
input   [1 :0]  entry_mmu_pe_req_src;               
input           entry_pf_inst_vld;                  
input           entry_pop_vld;                      
input           entry_reinit_vld;                   
input           entry_stride_neg;                   
input   [39:0]  entry_strideh;                      
input           entry_tsm_is_judge;                 
input           forever_cpuclk;                     
input           ld_da_page_sec_ff;                  
input           ld_da_page_share_ff;                
input   [27:0]  ld_da_ppn_ff;                       
input           pad_yy_icg_scan_en;                 
input           pfu_biu_pe_req_sel_l1;              
input           pfu_get_page_sec;                   
input           pfu_get_page_share;                 
input   [27:0]  pfu_get_ppn;                        
input           pfu_get_ppn_err;                    
input           pfu_get_ppn_vld;                    
input           pfu_l2_pref_en;                     
input           pfu_mmu_pe_req_sel_l1;              
output          entry_l2_biu_pe_req_set;            
output          entry_l2_cmp_va_vld;                
output          entry_l2_mmu_pe_req_set;            
output          entry_l2_page_sec;                  
output          entry_l2_page_share;                
output  [39:0]  entry_l2_pf_addr;                   
output  [39:0]  entry_l2_pf_va_sub_l1_pf_va;        
output  [27:0]  entry_l2_vpn;                       
output          entry_l2sm_reinit_req;              
output          entry_l2sm_va_can_cmp;              

// &Regs; @29
reg             entry_in_l2_pf_region;              
reg             entry_l1_pf_va_surpass_l2_pf_va;    
reg             entry_l2_cmp_va_vld;                
reg     [2 :0]  entry_l2_next_state;                
reg             entry_l2_page_sec;                  
reg             entry_l2_page_share;                
reg     [27:0]  entry_l2_pf_ppn;                    
reg     [39:0]  entry_l2_pf_va;                     
reg     [2 :0]  entry_l2_state;                     

// &Wires; @30
wire            cp0_lsu_icg_en;                     
wire            cp0_lsu_pfu_mmu_dis;                
wire            cp0_yy_clk_en;                      
wire            cpurst_b;                           
wire            entry_biu_pe_req;                   
wire            entry_biu_pe_req_grnt;              
wire    [1 :0]  entry_biu_pe_req_src;               
wire            entry_clk;                          
wire            entry_create_dp_vld;                
wire            entry_in_l2_pf_region_set;          
wire    [39:0]  entry_inst_new_va;                  
wire    [39:0]  entry_l1_pf_va;                     
wire            entry_l1_pf_va_surpass_l2_pf_va_set; 
wire            entry_l2_biu_pe_req;                
wire            entry_l2_biu_pe_req_grnt;           
wire            entry_l2_biu_pe_req_set;            
wire    [39:0]  entry_l2_dist_strideh;              
wire            entry_l2_mmu_pe_req;                
wire            entry_l2_mmu_pe_req_grnt;           
wire            entry_l2_mmu_pe_req_set;            
wire    [39:0]  entry_l2_pf_addr;                   
wire            entry_l2_pf_addr_init_vld;          
wire            entry_l2_pf_ppn_clk;                
wire            entry_l2_pf_ppn_clk_en;             
wire            entry_l2_pf_ppn_up_vld;             
wire            entry_l2_pf_va_add_gateclk_en;      
wire    [39:0]  entry_l2_pf_va_add_strideh;         
wire            entry_l2_pf_va_add_vld;             
wire            entry_l2_pf_va_clk;                 
wire            entry_l2_pf_va_clk_en;              
wire            entry_l2_pf_va_cross_4k;            
wire            entry_l2_pf_va_eq_l1_pf_va;         
wire    [39:0]  entry_l2_pf_va_sub_l1_pf_va;        
wire    [12:0]  entry_l2_pf_va_sum_4k;              
wire    [27:0]  entry_l2_vpn;                       
wire    [39:0]  entry_l2sm_diff_sub_dist_strideh;   
wire            entry_l2sm_is_add_pf_va;            
wire            entry_l2sm_is_init_pf_addr;         
wire            entry_l2sm_is_req_mmu;              
wire            entry_l2sm_is_req_pf;               
wire            entry_l2sm_is_wait_ppn;             
wire            entry_l2sm_reinit_req;              
wire            entry_l2sm_va_can_cmp;              
wire            entry_mmu_pe_req;                   
wire            entry_mmu_pe_req_grnt;              
wire    [1 :0]  entry_mmu_pe_req_src;               
wire            entry_pf_inst_vld;                  
wire            entry_pop_vld;                      
wire            entry_reinit_vld;                   
wire            entry_stride_neg;                   
wire    [39:0]  entry_strideh;                      
wire            entry_tsm_is_judge;                 
wire            forever_cpuclk;                     
wire            ld_da_page_sec_ff;                  
wire            ld_da_page_share_ff;                
wire    [27:0]  ld_da_ppn_ff;                       
wire            pad_yy_icg_scan_en;                 
wire            pfu_biu_pe_req_sel_l1;              
wire            pfu_get_page_sec;                   
wire            pfu_get_page_share;                 
wire    [27:0]  pfu_get_ppn;                        
wire            pfu_get_ppn_err;                    
wire            pfu_get_ppn_vld;                    
wire            pfu_l2_pref_en;                     
wire            pfu_mmu_pe_req_sel_l1;              


parameter L2_INIT_PF_ADDR = 3'b000,
          L2_ADD_PF_VA    = 3'b001,
          L2_REQ_PF       = 3'b100,
          L2_REQ_MMU      = 3'b101,
          L2_WAIT_PPN     = 3'b110,
          L2_DEAD         = 3'b111;

//==========================================================
//                 Instance of Gated Cell  
//==========================================================
//l2_pf_va clk
assign entry_l2_pf_va_clk_en  = entry_l2_pf_addr_init_vld
                                ||  entry_l2_pf_va_add_gateclk_en;
// &Instance("gated_clk_cell", "x_lsu_pfu_pfb_l2sm_pf_va_gated_clk"); @45
gated_clk_cell  x_lsu_pfu_pfb_l2sm_pf_va_gated_clk (
  .clk_in                (forever_cpuclk       ),
  .clk_out               (entry_l2_pf_va_clk   ),
  .external_en           (1'b0                 ),
  .global_en             (cp0_yy_clk_en        ),
  .local_en              (entry_l2_pf_va_clk_en),
  .module_en             (cp0_lsu_icg_en       ),
  .pad_yy_icg_scan_en    (pad_yy_icg_scan_en   )
);

// &Connect(.clk_in        (forever_cpuclk     ), @46
//          .external_en   (1'b0               ), @47
//          .global_en     (cp0_yy_clk_en      ), @48
//          .module_en     (cp0_lsu_icg_en     ), @49
//          .local_en      (entry_l2_pf_va_clk_en), @50
//          .clk_out       (entry_l2_pf_va_clk)); @51

//l2_pf_ppn clk
assign entry_l2_pf_ppn_clk_en = entry_l2_pf_addr_init_vld
                                    &&  pfu_l2_pref_en
                                ||  entry_l2_pf_ppn_up_vld;
// &Instance("gated_clk_cell", "x_lsu_pfu_pfb_l2sm_pf_ppn_gated_clk"); @57
gated_clk_cell  x_lsu_pfu_pfb_l2sm_pf_ppn_gated_clk (
  .clk_in                 (forever_cpuclk        ),
  .clk_out                (entry_l2_pf_ppn_clk   ),
  .external_en            (1'b0                  ),
  .global_en              (cp0_yy_clk_en         ),
  .local_en               (entry_l2_pf_ppn_clk_en),
  .module_en              (cp0_lsu_icg_en        ),
  .pad_yy_icg_scan_en     (pad_yy_icg_scan_en    )
);

// &Connect(.clk_in        (forever_cpuclk     ), @58
//          .external_en   (1'b0               ), @59
//          .global_en     (cp0_yy_clk_en      ), @60
//          .module_en     (cp0_lsu_icg_en     ), @61
//          .local_en      (entry_l2_pf_ppn_clk_en), @62
//          .clk_out       (entry_l2_pf_ppn_clk)); @63


//==========================================================
//                 Register
//==========================================================
//+-------+
//| state |
//+-------+
always @(posedge entry_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    entry_l2_state[2:0]  <=  L2_INIT_PF_ADDR;
  else if(entry_pop_vld ||  entry_reinit_vld || !pfu_l2_pref_en)
    entry_l2_state[2:0]  <=  L2_INIT_PF_ADDR;
  else
    entry_l2_state[2:0]  <=  entry_l2_next_state[2:0];
end

//+----------+
//| l2_pf_va |
//+----------+
always @(posedge entry_l2_pf_va_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    entry_l2_pf_va[`PA_WIDTH-1:0] <=  {`PA_WIDTH{1'b0}};
  else if(entry_l2_pf_addr_init_vld)
    entry_l2_pf_va[`PA_WIDTH-1:0] <=  entry_inst_new_va[`PA_WIDTH-1:0];
  else if(entry_l2_pf_va_add_vld)
    entry_l2_pf_va[`PA_WIDTH-1:0] <=  entry_l2_pf_va_add_strideh[`PA_WIDTH-1:0];
end
assign entry_l2_vpn[`PA_WIDTH-13:0] = entry_l2_pf_va[`PA_WIDTH-1:12];

//+-----------+
//| l2_pf_ppn |
//+-----------+
always @(posedge entry_l2_pf_ppn_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
  begin
    entry_l2_pf_ppn[`PA_WIDTH-13:0] <=  {`PA_WIDTH-12{1'b0}};
    entry_l2_page_sec               <=  1'b0;
    entry_l2_page_share             <=  1'b0;
  end
  else if(entry_l2_pf_addr_init_vld &&  pfu_l2_pref_en)
  begin
    entry_l2_pf_ppn[`PA_WIDTH-13:0] <=  ld_da_ppn_ff[`PA_WIDTH-13:0];
    entry_l2_page_sec               <=  ld_da_page_sec_ff;
    entry_l2_page_share             <=  ld_da_page_share_ff;
  end
  else if(entry_l2_pf_ppn_up_vld)
  begin
    entry_l2_pf_ppn[`PA_WIDTH-13:0] <=  pfu_get_ppn[`PA_WIDTH-13:0];
    entry_l2_page_sec               <=  pfu_get_page_sec;
    entry_l2_page_share             <=  pfu_get_page_share;
  end
end

//+-----------------------------+
//| pfu pipeline control signal |
//+-----------------------------+
// &Force("output","entry_l2_cmp_va_vld"); @124
always @(posedge entry_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    entry_l2_cmp_va_vld   <=  1'b0;
  else if(entry_create_dp_vld ||  entry_reinit_vld)
    entry_l2_cmp_va_vld   <=  1'b0;
  else if(entry_l2_pf_va_add_vld  ||  entry_pf_inst_vld &&  entry_l2sm_va_can_cmp)
    entry_l2_cmp_va_vld   <=  1'b1;
  else
    entry_l2_cmp_va_vld   <=  1'b0;
end

//+-------------------+
//| some compare info |
//+-------------------+
always @(posedge entry_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
  begin
    entry_l1_pf_va_surpass_l2_pf_va     <=  1'b0;
    entry_in_l2_pf_region               <=  1'b1;
  end
  else if(entry_create_dp_vld ||  entry_reinit_vld)
  begin
    entry_l1_pf_va_surpass_l2_pf_va     <=  1'b0;
    entry_in_l2_pf_region               <=  1'b1;
  end
  else if(entry_l2_cmp_va_vld &&  entry_l2sm_va_can_cmp)
  begin
    entry_l1_pf_va_surpass_l2_pf_va     <=  entry_l1_pf_va_surpass_l2_pf_va_set;
    entry_in_l2_pf_region               <=  entry_in_l2_pf_region_set;
  end
end

//==========================================================
//                 Generate next state
//==========================================================
// &CombBeg; @162
always @( entry_l2_pf_va_add_vld
       or pfu_get_ppn_vld
       or entry_l2_pf_addr_init_vld
       or cp0_lsu_pfu_mmu_dis
       or entry_l2_mmu_pe_req_grnt
       or entry_l2_state[2:0]
       or entry_reinit_vld
       or pfu_get_ppn_err
       or entry_l2_pf_va_cross_4k
       or pfu_l2_pref_en)
begin
entry_l2_next_state[2:0] = L2_INIT_PF_ADDR;
case(entry_l2_state[2:0])
  L2_INIT_PF_ADDR:
    if(entry_l2_pf_addr_init_vld  &&  pfu_l2_pref_en)
      entry_l2_next_state[2:0] = L2_ADD_PF_VA;
    else
      entry_l2_next_state[2:0] = L2_INIT_PF_ADDR;
  L2_ADD_PF_VA:
      entry_l2_next_state[2:0] = L2_REQ_PF;
  L2_REQ_PF:
    if(entry_l2_pf_va_add_vld &&  entry_l2_pf_va_cross_4k && cp0_lsu_pfu_mmu_dis)
      entry_l2_next_state[2:0] = L2_DEAD;
    else if(entry_l2_pf_va_add_vld &&  entry_l2_pf_va_cross_4k)
      entry_l2_next_state[2:0] = L2_REQ_MMU;
    else
      entry_l2_next_state[2:0] = L2_REQ_PF;
  L2_REQ_MMU:
    if(entry_l2_mmu_pe_req_grnt)
      entry_l2_next_state[2:0] = L2_WAIT_PPN;
    else
      entry_l2_next_state[2:0] = L2_REQ_MMU;
  L2_WAIT_PPN:
    if(pfu_get_ppn_vld  &&  !pfu_get_ppn_err)
      entry_l2_next_state[2:0] = L2_REQ_PF;
    else if(pfu_get_ppn_vld  &&  pfu_get_ppn_err)
      entry_l2_next_state[2:0] = L2_DEAD;
    else
      entry_l2_next_state[2:0] = L2_WAIT_PPN;
  L2_DEAD:
    if(entry_reinit_vld)
      entry_l2_next_state[2:0] = L2_INIT_PF_ADDR;
    else
      entry_l2_next_state[2:0] = L2_DEAD;
  default:entry_l2_next_state[2:0] = L2_INIT_PF_ADDR;
endcase
// &CombEnd; @198
end

assign entry_l2sm_is_init_pf_addr = entry_l2_state[2:0] ==  L2_INIT_PF_ADDR;
assign entry_l2sm_is_add_pf_va    = entry_l2_state[2:0] ==  L2_ADD_PF_VA;
assign entry_l2sm_is_req_pf       = entry_l2_state[2:0] ==  L2_REQ_PF;
assign entry_l2sm_is_req_mmu      = entry_l2_state[2:0] ==  L2_REQ_MMU;
assign entry_l2sm_is_wait_ppn     = entry_l2_state[2:0] ==  L2_WAIT_PPN;
// &Force("output","entry_l2sm_va_can_cmp"); @205
assign entry_l2sm_va_can_cmp      = entry_l2_state[2];

//==========================================================
//                 State 0 : init pf va/ppn
//==========================================================
assign entry_l2_pf_addr_init_vld  = entry_l2sm_is_init_pf_addr
                                    &&  entry_tsm_is_judge
                                    &&  pfu_l2_pref_en;

//==========================================================
//                 State 1 : add l2_pf_va
//==========================================================
//add pf control signal
assign entry_l2_pf_va_add_vld         = entry_l2sm_is_add_pf_va
                                        ||  entry_l2_biu_pe_req_grnt;

assign entry_l2_pf_va_add_gateclk_en  = entry_l2sm_is_add_pf_va
                                        ||  entry_biu_pe_req_grnt;

//add pf and cross_4k
assign entry_l2_pf_va_add_strideh[`PA_WIDTH-1:0]  = entry_l2_pf_va[`PA_WIDTH-1:0]
                                                    + entry_strideh[`PA_WIDTH-1:0];

assign entry_l2_pf_va_sum_4k[12:0]  = {1'b0,entry_l2_pf_va[11:0]}
                                      + entry_strideh[12:0];

assign entry_l2_pf_va_cross_4k      = entry_l2_pf_va_sum_4k[12];

//==========================================================
//                 State 2 : req pf
//==========================================================
//----------------set biu_pe_req reg------------------------
// &Force("bus","entry_biu_pe_req_src","1","0"); @238
assign entry_l2_biu_pe_req      = entry_biu_pe_req
                                  &&  entry_biu_pe_req_src[1];

assign entry_l2_biu_pe_req_set  = entry_l2sm_is_req_pf
                                  &&  entry_in_l2_pf_region
                                  &&  !entry_l2_biu_pe_req;

assign entry_l2_biu_pe_req_grnt = (!pfu_biu_pe_req_sel_l1
                                      ||  entry_l2_pf_va_eq_l1_pf_va)
                                  &&  entry_biu_pe_req_grnt;

assign entry_l2_pf_addr[`PA_WIDTH-1:0]  = {entry_l2_pf_ppn[`PA_WIDTH-13:0],
                                          entry_l2_pf_va[11:0]};

//==========================================================
//                 State 3 : req mmu
//==========================================================
// &Force("bus","entry_mmu_pe_req_src","1","0"); @256
assign entry_l2_mmu_pe_req      = entry_mmu_pe_req
                                  &&  entry_mmu_pe_req_src[1];

assign entry_l2_mmu_pe_req_set  = entry_l2sm_is_req_mmu
                                  &&  !entry_l2_mmu_pe_req;

assign entry_l2_mmu_pe_req_grnt = entry_mmu_pe_req
                                  &&  entry_mmu_pe_req_grnt
                                  &&  (!pfu_mmu_pe_req_sel_l1
                                      ||  entry_l2_pf_va_eq_l1_pf_va);

//==========================================================
//                 State 4 : wait ppn
//==========================================================
assign entry_l2_pf_ppn_up_vld   = entry_l2sm_is_wait_ppn
                                  &&  pfu_get_ppn_vld;

//==========================================================
//                 Some compare info
//==========================================================
// &Force("output","entry_l2_pf_va_sub_l1_pf_va"); @277
assign entry_l2_pf_va_sub_l1_pf_va[`PA_WIDTH-1:0]  =
                entry_l2_pf_va[`PA_WIDTH-1:0]
                - entry_l1_pf_va[`PA_WIDTH-1:0];


assign entry_l2sm_diff_sub_dist_strideh[`PA_WIDTH-1:0] =
                entry_l2_pf_va_sub_l1_pf_va[`PA_WIDTH-1:0]
                - entry_l2_dist_strideh[`PA_WIDTH-1:0];

assign entry_l2_pf_va_eq_l1_pf_va = !(|entry_l2_pf_va_sub_l1_pf_va[`PA_WIDTH-1:0]);

assign entry_l1_pf_va_surpass_l2_pf_va_set = (entry_stride_neg ^ entry_l2_pf_va_sub_l1_pf_va[`PA_WIDTH-1])
                                             && !entry_l2_pf_va_eq_l1_pf_va;

assign entry_in_l2_pf_region_set  =  entry_stride_neg ^ entry_l2sm_diff_sub_dist_strideh[`PA_WIDTH-1];

//==========================================================
//                    Reinit req
//==========================================================
assign entry_l2sm_reinit_req  = entry_l2sm_va_can_cmp
                                &&  entry_l1_pf_va_surpass_l2_pf_va;

// &ModuleEnd; @300
endmodule


