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

// &ModuleBeg; @26
module ct_lsu_pfu_pfb_tsm(
  cp0_lsu_icg_en,
  cp0_yy_clk_en,
  cp0_yy_priv_mode,
  cpurst_b,
  entry_act_vld,
  entry_biu_pe_req,
  entry_biu_pe_req_grnt,
  entry_biu_pe_req_src,
  entry_clk,
  entry_create_dp_vld,
  entry_create_vld,
  entry_dcache_hit_pop_req,
  entry_from_lfb_dcache_hit,
  entry_from_lfb_dcache_miss,
  entry_inst_new_va,
  entry_l1_biu_pe_req_set,
  entry_l1_mmu_pe_req_set,
  entry_l2_biu_pe_req_set,
  entry_l2_mmu_pe_req_set,
  entry_mmu_pe_req,
  entry_mmu_pe_req_grnt,
  entry_mmu_pe_req_src,
  entry_pf_inst_vld,
  entry_pop_vld,
  entry_priv_mode,
  entry_reinit_vld,
  entry_stride,
  entry_stride_neg,
  entry_tsm_is_judge,
  entry_vld,
  forever_cpuclk,
  pad_yy_icg_scan_en,
  pipe_va
);

// &Ports; @27
input           cp0_lsu_icg_en;            
input           cp0_yy_clk_en;             
input   [1 :0]  cp0_yy_priv_mode;          
input           cpurst_b;                  
input           entry_act_vld;             
input           entry_biu_pe_req_grnt;     
input           entry_clk;                 
input           entry_create_dp_vld;       
input           entry_create_vld;          
input           entry_from_lfb_dcache_hit; 
input           entry_from_lfb_dcache_miss; 
input           entry_l1_biu_pe_req_set;   
input           entry_l1_mmu_pe_req_set;   
input           entry_l2_biu_pe_req_set;   
input           entry_l2_mmu_pe_req_set;   
input           entry_mmu_pe_req_grnt;     
input           entry_pf_inst_vld;         
input           entry_pop_vld;             
input           entry_reinit_vld;          
input   [10:0]  entry_stride;              
input           entry_stride_neg;          
input           forever_cpuclk;            
input           pad_yy_icg_scan_en;        
input   [39:0]  pipe_va;                   
output          entry_biu_pe_req;          
output  [1 :0]  entry_biu_pe_req_src;      
output          entry_dcache_hit_pop_req;  
output  [39:0]  entry_inst_new_va;         
output          entry_mmu_pe_req;          
output  [1 :0]  entry_mmu_pe_req_src;      
output  [1 :0]  entry_priv_mode;           
output          entry_tsm_is_judge;        
output          entry_vld;                 

// &Regs; @28
reg             entry_already_dcache_hit;  
reg             entry_biu_pe_req;          
reg     [1 :0]  entry_biu_pe_req_src;      
reg     [39:0]  entry_inst_new_va;         
reg             entry_mmu_pe_req;          
reg     [1 :0]  entry_mmu_pe_req_src;      
reg     [1 :0]  entry_priv_mode;           
reg     [1 :0]  entry_top_next_state;      
reg     [1 :0]  entry_top_state;           

// &Wires; @29
wire            cp0_lsu_icg_en;            
wire            cp0_yy_clk_en;             
wire    [1 :0]  cp0_yy_priv_mode;          
wire            cpurst_b;                  
wire            entry_act_vld;             
wire            entry_biu_pe_req_grnt;     
wire            entry_biu_pe_req_set;      
wire    [1 :0]  entry_biu_pe_req_set_src;  
wire            entry_clk;                 
wire            entry_create_dp_vld;       
wire            entry_create_vld;          
wire            entry_dcache_hit_pop_req;  
wire            entry_from_lfb_dcache_hit; 
wire            entry_from_lfb_dcache_miss; 
wire            entry_inst_new_va_cross_4k; 
wire            entry_l1_biu_pe_req_set;   
wire            entry_l1_mmu_pe_req_set;   
wire            entry_l2_biu_pe_req_set;   
wire            entry_l2_mmu_pe_req_set;   
wire            entry_mmu_pe_req_grnt;     
wire            entry_mmu_pe_req_set;      
wire    [1 :0]  entry_mmu_pe_req_set_src;  
wire            entry_pf_inst_vld;         
wire            entry_pf_inst_vld_clk;     
wire            entry_pf_inst_vld_clk_en;  
wire    [39:0]  entry_pipe_va_add_stride;  
wire            entry_pop_vld;             
wire            entry_reinit_vld;          
wire    [10:0]  entry_stride;              
wire    [39:0]  entry_stride_ext;          
wire            entry_stride_neg;          
wire    [12:0]  entry_sum_4k;              
wire            entry_tsm_is_judge;        
wire            entry_vld;                 
wire            forever_cpuclk;            
wire            pad_yy_icg_scan_en;        
wire    [39:0]  pipe_va;                   


parameter IDLE                = 2'b00,
          INIT_INST_NEW_VA    = 2'b10,
          JUDGE               = 2'b11;

//==========================================================
//                 Instance of Gated Cell  
//==========================================================
//pf_inst_vld clk
assign entry_pf_inst_vld_clk_en = entry_vld
                                  &&  entry_pf_inst_vld;
// &Instance("gated_clk_cell", "x_lsu_pfu_pfb_tsm_pf_inst_vld_gated_clk"); @41
gated_clk_cell  x_lsu_pfu_pfb_tsm_pf_inst_vld_gated_clk (
  .clk_in                   (forever_cpuclk          ),
  .clk_out                  (entry_pf_inst_vld_clk   ),
  .external_en              (1'b0                    ),
  .global_en                (cp0_yy_clk_en           ),
  .local_en                 (entry_pf_inst_vld_clk_en),
  .module_en                (cp0_lsu_icg_en          ),
  .pad_yy_icg_scan_en       (pad_yy_icg_scan_en      )
);

// &Connect(.clk_in        (forever_cpuclk     ), @42
//          .external_en   (1'b0               ), @43
//          .global_en     (cp0_yy_clk_en      ), @44
//          .module_en     (cp0_lsu_icg_en     ), @45
//          .local_en      (entry_pf_inst_vld_clk_en), @46
//          .clk_out       (entry_pf_inst_vld_clk)); @47

//==========================================================
//                 Register
//==========================================================
//+-------+
//| state |
//+-------+
always @(posedge entry_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    entry_top_state[1:0]  <=  IDLE;
  else if(entry_pop_vld)
    entry_top_state[1:0]  <=  IDLE;
  else
    entry_top_state[1:0]  <=  entry_top_next_state[1:0];
end

// &Force("output","entry_vld"); @65
assign entry_vld  = entry_top_state[1];

//+-------------+-------------------+
//| inst_new_va | addr_compare_info |
//+-------------+-------------------+
// &Force("output","entry_inst_new_va"); @71
always @(posedge entry_pf_inst_vld_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    entry_inst_new_va[`PA_WIDTH-1:0]  <=  {`PA_WIDTH{1'b0}};
  else if(entry_pf_inst_vld)
    entry_inst_new_va[`PA_WIDTH-1:0]  <=  entry_pipe_va_add_stride[`PA_WIDTH-1:0];
end

//+-------------+
//| supv_mode   |
//+-------------+
// &Force("output","entry_priv_mode"); @83
always @(posedge entry_pf_inst_vld_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    entry_priv_mode[1:0]  <=  2'b0;
  else if(entry_pf_inst_vld)
    entry_priv_mode[1:0]  <=  cp0_yy_priv_mode[1:0];
end

//+--------------------+
//| already_dcache_hit |
//+--------------------+
always @(posedge entry_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    entry_already_dcache_hit  <=  1'b0;
  else if(entry_create_dp_vld ||  entry_from_lfb_dcache_miss)
    entry_already_dcache_hit  <=  1'b0;
  else if(entry_from_lfb_dcache_hit)
    entry_already_dcache_hit  <=  1'b1;
end

//+------------+
//| biu_pe_req |
//+------------+
// &Force("output","entry_biu_pe_req"); @108
// &Force("output","entry_biu_pe_req_src"); @109
always @(posedge entry_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
  begin
    entry_biu_pe_req          <=  1'b0;
    entry_biu_pe_req_src[1:0] <=  2'b0;
  end
  else if(entry_pop_vld ||  entry_biu_pe_req_grnt)
  begin
    entry_biu_pe_req          <=  1'b0;
    entry_biu_pe_req_src[1:0] <=  2'b0;
  end
  else if(entry_biu_pe_req_set)
  begin
    entry_biu_pe_req          <=  1'b1;
    entry_biu_pe_req_src[1:0] <=  entry_biu_pe_req_src[1:0] | entry_biu_pe_req_set_src[1:0];
  end
end

//+------------+
//| mmu_pe_req |
//+------------+
// &Force("output","entry_mmu_pe_req"); @132
// &Force("output","entry_mmu_pe_req_src"); @133
always @(posedge entry_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
  begin
    entry_mmu_pe_req          <=  1'b0;
    entry_mmu_pe_req_src[1:0] <=  2'b0;
  end
  else if(entry_pop_vld ||  entry_mmu_pe_req_grnt)
  begin
    entry_mmu_pe_req          <=  1'b0;
    entry_mmu_pe_req_src[1:0] <=  2'b0;
  end
  else if(entry_mmu_pe_req_set)
  begin
    entry_mmu_pe_req          <=  1'b1;
    entry_mmu_pe_req_src[1:0] <=  entry_mmu_pe_req_src[1:0] | entry_mmu_pe_req_set_src[1:0];
  end
end

//==========================================================
//                 Generate next state
//==========================================================
// &CombBeg; @156
always @( entry_reinit_vld
       or entry_inst_new_va_cross_4k
       or entry_top_state[1:0]
       or entry_create_vld
       or entry_act_vld)
begin
entry_top_next_state[1:0] = IDLE;
case(entry_top_state[1:0])
  IDLE:
    if(entry_create_vld)
      entry_top_next_state[1:0] = INIT_INST_NEW_VA;
    else
      entry_top_next_state[1:0] = IDLE;
  INIT_INST_NEW_VA:
    if(entry_act_vld
          &&  !entry_inst_new_va_cross_4k
          &&  !entry_reinit_vld)
      entry_top_next_state[1:0] = JUDGE;
    else
      entry_top_next_state[1:0] = INIT_INST_NEW_VA;
  JUDGE:
    if(entry_reinit_vld)
      entry_top_next_state[1:0] = INIT_INST_NEW_VA;
    else
      entry_top_next_state[1:0] = JUDGE;
  default:entry_top_next_state[1:0] = IDLE;
endcase
// &CombEnd; @178
end
assign entry_tsm_is_judge = entry_top_state[1:0]  == JUDGE;

//==========================================================
//                 State 1 : init inst_new_va
//==========================================================
assign entry_stride_ext[`PA_WIDTH-1:0]  = {{`PA_WIDTH-11{entry_stride_neg}},
                                          entry_stride[10:0]};

assign entry_pipe_va_add_stride[`PA_WIDTH-1:0]  = pipe_va[`PA_WIDTH-1:0]
                                                  + entry_stride_ext[`PA_WIDTH-1:0];
//judge whether pipe_va + stride cross 4k
assign entry_sum_4k[12:0]                       = {1'b0,pipe_va[11:0]}
                                                  + entry_stride_ext[12:0];

assign entry_inst_new_va_cross_4k   = entry_sum_4k[12];

//==========================================================
//                 Generate biu pe req
//==========================================================
assign entry_biu_pe_req_set           = entry_l2_biu_pe_req_set ||  entry_l1_biu_pe_req_set;
assign entry_biu_pe_req_set_src[1:0]  = {entry_l2_biu_pe_req_set,entry_l1_biu_pe_req_set};
//==========================================================
//                 Generate mmu pe req
//==========================================================
assign entry_mmu_pe_req_set           = entry_l2_mmu_pe_req_set ||  entry_l1_mmu_pe_req_set;
assign entry_mmu_pe_req_set_src[1:0]  = {entry_l2_mmu_pe_req_set,entry_l1_mmu_pe_req_set};
//==========================================================
//                 Generate pop req
//==========================================================
assign entry_dcache_hit_pop_req = entry_already_dcache_hit
                                  &&  entry_from_lfb_dcache_hit;

// &ModuleEnd; @211
endmodule


