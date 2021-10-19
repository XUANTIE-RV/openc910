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
module ct_lsu_pfu_pmb_entry(
  amr_wa_cancel,
  cp0_lsu_icg_en,
  cp0_lsu_l2_st_pref_en,
  cp0_yy_clk_en,
  cpurst_b,
  ld_da_ldfifo_pc,
  ld_da_pfu_act_dp_vld,
  ld_da_pfu_evict_cnt_vld,
  ld_da_pfu_pf_inst_vld,
  lsu_special_clk,
  pad_yy_icg_scan_en,
  pfu_pmb_entry_create_dp_vld_x,
  pfu_pmb_entry_create_gateclk_en_x,
  pfu_pmb_entry_create_vld_x,
  pfu_pmb_entry_evict_x,
  pfu_pmb_entry_hit_pc_x,
  pfu_pmb_entry_pc_v,
  pfu_pmb_entry_ready_grnt_x,
  pfu_pmb_entry_ready_x,
  pfu_pmb_entry_type_ld_x,
  pfu_pmb_entry_vld_x,
  pfu_pop_all_part_vld,
  pipe_create_pc,
  pmb_timeout_cnt_val,
  st_da_pc,
  st_da_pfu_evict_cnt_vld,
  st_da_pfu_pf_inst_vld
);

// &Ports; @27
input           amr_wa_cancel;                    
input           cp0_lsu_icg_en;                   
input           cp0_lsu_l2_st_pref_en;            
input           cp0_yy_clk_en;                    
input           cpurst_b;                         
input   [14:0]  ld_da_ldfifo_pc;                  
input           ld_da_pfu_act_dp_vld;             
input           ld_da_pfu_evict_cnt_vld;          
input           ld_da_pfu_pf_inst_vld;            
input           lsu_special_clk;                  
input           pad_yy_icg_scan_en;               
input           pfu_pmb_entry_create_dp_vld_x;    
input           pfu_pmb_entry_create_gateclk_en_x; 
input           pfu_pmb_entry_create_vld_x;       
input           pfu_pmb_entry_ready_grnt_x;       
input           pfu_pop_all_part_vld;             
input   [14:0]  pipe_create_pc;                   
input   [7 :0]  pmb_timeout_cnt_val;              
input   [14:0]  st_da_pc;                         
input           st_da_pfu_evict_cnt_vld;          
input           st_da_pfu_pf_inst_vld;            
output          pfu_pmb_entry_evict_x;            
output          pfu_pmb_entry_hit_pc_x;           
output  [14:0]  pfu_pmb_entry_pc_v;               
output          pfu_pmb_entry_ready_x;            
output          pfu_pmb_entry_type_ld_x;          
output          pfu_pmb_entry_vld_x;              

// &Regs; @28
reg             pfu_pmb_entry_cnt;                
reg             pfu_pmb_entry_evict;              
reg     [14:0]  pfu_pmb_entry_pc;                 
reg             pfu_pmb_entry_ready;              
reg     [7 :0]  pfu_pmb_entry_timeout_cnt;        
reg             pfu_pmb_entry_type_ld;            
reg             pfu_pmb_entry_vld;                

// &Wires; @29
wire            amr_wa_cancel;                    
wire            cp0_lsu_icg_en;                   
wire            cp0_lsu_l2_st_pref_en;            
wire            cp0_yy_clk_en;                    
wire            cpurst_b;                         
wire            entry_hit_pc;                     
wire    [14:0]  ld_da_ldfifo_pc;                  
wire            ld_da_pfu_act_dp_vld;             
wire            ld_da_pfu_evict_cnt_vld;          
wire            ld_da_pfu_pf_inst_vld;            
wire            lsu_special_clk;                  
wire            pad_yy_icg_scan_en;               
wire            pfu_pmb_entry_all_pf_inst_clk;    
wire            pfu_pmb_entry_all_pf_inst_clk_en; 
wire            pfu_pmb_entry_clk;                
wire            pfu_pmb_entry_clk_en;             
wire            pfu_pmb_entry_create_clk;         
wire            pfu_pmb_entry_create_clk_en;      
wire            pfu_pmb_entry_create_dp_vld;      
wire            pfu_pmb_entry_create_dp_vld_x;    
wire            pfu_pmb_entry_create_gateclk_en;  
wire            pfu_pmb_entry_create_gateclk_en_x; 
wire            pfu_pmb_entry_create_vld;         
wire            pfu_pmb_entry_create_vld_x;       
wire            pfu_pmb_entry_evict_pop;          
wire            pfu_pmb_entry_evict_x;            
wire            pfu_pmb_entry_hit_pc;             
wire            pfu_pmb_entry_hit_pc_for_new;     
wire            pfu_pmb_entry_hit_pc_x;           
wire    [14:0]  pfu_pmb_entry_pc_v;               
wire            pfu_pmb_entry_pop_vld;            
wire            pfu_pmb_entry_ready_grnt;         
wire            pfu_pmb_entry_ready_grnt_x;       
wire            pfu_pmb_entry_ready_x;            
wire            pfu_pmb_entry_timeout_cnt_full;   
wire            pfu_pmb_entry_type_ld_x;          
wire            pfu_pmb_entry_vld_x;              
wire            pfu_pop_all_part_vld;             
wire            pfu_pop_st_all;                   
wire            pfu_sdb_entry_evict_clr;          
wire            pfu_sdb_entry_evict_set;          
wire            pipe_cmp_inst_vld;                
wire    [14:0]  pipe_cmp_pc;                      
wire    [14:0]  pipe_create_pc;                   
wire            pipe_evict_cnt_vld;               
wire    [7 :0]  pmb_timeout_cnt_val;              
wire    [14:0]  st_da_pc;                         
wire            st_da_pfu_evict_cnt_vld;          
wire            st_da_pfu_pf_inst_vld;            


parameter TIMEOUT_BW  = 8;
parameter PC_LEN      = 15;

//==========================================================
//                 Instance of Gated Cell  
//==========================================================
assign pfu_pmb_entry_clk_en = pfu_pmb_entry_vld
                              ||  pfu_pmb_entry_create_gateclk_en;
// &Instance("gated_clk_cell", "x_lsu_pfu_pmb_entry_gated_clk"); @39
gated_clk_cell  x_lsu_pfu_pmb_entry_gated_clk (
  .clk_in               (lsu_special_clk     ),
  .clk_out              (pfu_pmb_entry_clk   ),
  .external_en          (1'b0                ),
  .global_en            (cp0_yy_clk_en       ),
  .local_en             (pfu_pmb_entry_clk_en),
  .module_en            (cp0_lsu_icg_en      ),
  .pad_yy_icg_scan_en   (pad_yy_icg_scan_en  )
);

// &Connect(.clk_in        (lsu_special_clk     ), @40
//          .external_en   (1'b0               ), @41
//          .global_en     (cp0_yy_clk_en      ), @42
//          .module_en     (cp0_lsu_icg_en     ), @43
//          .local_en      (pfu_pmb_entry_clk_en), @44
//          .clk_out       (pfu_pmb_entry_clk  )); @45

assign pfu_pmb_entry_create_clk_en = pfu_pmb_entry_create_gateclk_en;
// &Instance("gated_clk_cell", "x_lsu_pfu_pmb_entry_create_gated_clk"); @48
gated_clk_cell  x_lsu_pfu_pmb_entry_create_gated_clk (
  .clk_in                      (lsu_special_clk            ),
  .clk_out                     (pfu_pmb_entry_create_clk   ),
  .external_en                 (1'b0                       ),
  .global_en                   (cp0_yy_clk_en              ),
  .local_en                    (pfu_pmb_entry_create_clk_en),
  .module_en                   (cp0_lsu_icg_en             ),
  .pad_yy_icg_scan_en          (pad_yy_icg_scan_en         )
);

// &Connect(.clk_in        (lsu_special_clk     ), @49
//          .external_en   (1'b0               ), @50
//          .global_en     (cp0_yy_clk_en      ), @51
//          .module_en     (cp0_lsu_icg_en     ), @52
//          .local_en      (pfu_pmb_entry_create_clk_en), @53
//          .clk_out       (pfu_pmb_entry_create_clk)); @54

assign pfu_pmb_entry_all_pf_inst_clk_en = pfu_pmb_entry_vld
                                             && (ld_da_pfu_pf_inst_vld || st_da_pfu_pf_inst_vld)
                                          || pfu_pmb_entry_create_gateclk_en;
// &Instance("gated_clk_cell", "x_lsu_pfu_pmb_entry_all_pf_inst_gated_clk"); @59
gated_clk_cell  x_lsu_pfu_pmb_entry_all_pf_inst_gated_clk (
  .clk_in                           (lsu_special_clk                 ),
  .clk_out                          (pfu_pmb_entry_all_pf_inst_clk   ),
  .external_en                      (1'b0                            ),
  .global_en                        (cp0_yy_clk_en                   ),
  .local_en                         (pfu_pmb_entry_all_pf_inst_clk_en),
  .module_en                        (cp0_lsu_icg_en                  ),
  .pad_yy_icg_scan_en               (pad_yy_icg_scan_en              )
);

// &Connect(.clk_in        (lsu_special_clk     ), @60
//          .external_en   (1'b0               ), @61
//          .global_en     (cp0_yy_clk_en      ), @62
//          .module_en     (cp0_lsu_icg_en     ), @63
//          .local_en      (pfu_pmb_entry_all_pf_inst_clk_en), @64
//          .clk_out       (pfu_pmb_entry_all_pf_inst_clk)); @65

//==========================================================
//                 Register
//==========================================================
//+-----------+
//| entry_vld |
//+-----------+
always @(posedge pfu_pmb_entry_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    pfu_pmb_entry_vld  <=  1'b0;
  else if(pfu_pmb_entry_pop_vld)
    pfu_pmb_entry_vld  <=  1'b0;
  else if(pfu_pmb_entry_create_vld)
    pfu_pmb_entry_vld  <=  1'b1;
end

//+----+
//| pc |
//+----+
always @(posedge pfu_pmb_entry_create_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    pfu_pmb_entry_pc[PC_LEN-1:0]  <=  {PC_LEN{1'b0}};
  else if(pfu_pmb_entry_create_dp_vld)
    pfu_pmb_entry_pc[PC_LEN-1:0]  <=  pipe_create_pc[PC_LEN-1:0];
end

//+----+------+
//| pref_type |
//+----+------+
always @(posedge pfu_pmb_entry_create_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    pfu_pmb_entry_type_ld  <=  1'b0;
  else if(pfu_pmb_entry_create_dp_vld)
    pfu_pmb_entry_type_ld  <=  ld_da_pfu_act_dp_vld;
end

//+-----+
//| cnt |
//+-----+
always @(posedge pfu_pmb_entry_all_pf_inst_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    pfu_pmb_entry_cnt       <=  1'b0;
  else if(pfu_pmb_entry_create_dp_vld)
    pfu_pmb_entry_cnt       <=  1'b0;
  else if(!pfu_pmb_entry_cnt  &&  pfu_pmb_entry_hit_pc)
    pfu_pmb_entry_cnt       <=  ~pfu_pmb_entry_cnt;
end

//+-------------+
//| timeout_cnt |
//+-------------+
always @(posedge pfu_pmb_entry_all_pf_inst_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    pfu_pmb_entry_timeout_cnt[TIMEOUT_BW-1:0] <=  {TIMEOUT_BW{1'b0}};
  else if(pfu_pmb_entry_create_dp_vld ||  pfu_pmb_entry_hit_pc)
    pfu_pmb_entry_timeout_cnt[TIMEOUT_BW-1:0] <=  {TIMEOUT_BW{1'b0}};
  else if(pipe_evict_cnt_vld &&  !pfu_pmb_entry_timeout_cnt_full)
    pfu_pmb_entry_timeout_cnt[TIMEOUT_BW-1:0] <=  pfu_pmb_entry_timeout_cnt[TIMEOUT_BW-1:0]
                                                  + {{TIMEOUT_BW-1{1'b0}},1'b1};
end

//+-------+
//| ready |
//+-------+
always @(posedge pfu_pmb_entry_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    pfu_pmb_entry_ready     <=  1'b0;
  else if(pfu_pmb_entry_create_dp_vld ||  pfu_pmb_entry_pop_vld)
    pfu_pmb_entry_ready     <=  1'b0;
  else if(pfu_pmb_entry_cnt &&  pfu_pmb_entry_hit_pc)
    pfu_pmb_entry_ready     <=  1'b1;
end

//+-------+
//| evict |
//+-------+
always @(posedge pfu_pmb_entry_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    pfu_pmb_entry_evict     <=  1'b0;
  else if(pfu_pmb_entry_create_dp_vld ||  pfu_pmb_entry_pop_vld ||  pfu_sdb_entry_evict_clr)
    pfu_pmb_entry_evict     <=  1'b0;
  else if(pfu_sdb_entry_evict_set)
    pfu_pmb_entry_evict     <=  1'b1;
end
//==========================================================
//                 pipe info select
//==========================================================
assign pipe_cmp_inst_vld = pfu_pmb_entry_type_ld
                           ? ld_da_pfu_pf_inst_vld
                           : st_da_pfu_pf_inst_vld;

assign pipe_cmp_pc[PC_LEN-1:0] = pfu_pmb_entry_type_ld
                                 ? ld_da_ldfifo_pc[PC_LEN-1:0]
                                 : st_da_pc[PC_LEN-1:0];

assign pipe_evict_cnt_vld = ld_da_pfu_evict_cnt_vld || st_da_pfu_evict_cnt_vld;
//==========================================================
//                 Caucalate hit pc signal
//==========================================================
assign entry_hit_pc = pfu_pmb_entry_vld
                      && (pipe_cmp_pc[PC_LEN-1:0]
                         ==  pfu_pmb_entry_pc[PC_LEN-1:0]);

//for maintance
assign pfu_pmb_entry_hit_pc = entry_hit_pc
                              &&  pipe_cmp_inst_vld;

//for new inst create
assign pfu_pmb_entry_hit_pc_for_new = entry_hit_pc
                                      && !(pfu_pmb_entry_type_ld ^ ld_da_pfu_act_dp_vld);
//==========================================================
//                    Set/clr evict
//==========================================================
assign pfu_pmb_entry_timeout_cnt_full = (pfu_pmb_entry_timeout_cnt[TIMEOUT_BW-1:0]
                                         == pmb_timeout_cnt_val[TIMEOUT_BW-1:0]);

//if 
assign pfu_sdb_entry_evict_set  = pfu_pmb_entry_vld
                                  &&  !pfu_pmb_entry_ready
                                  &&  pipe_cmp_inst_vld
                                  &&  pfu_pmb_entry_timeout_cnt_full
                                  &&  !pfu_pmb_entry_hit_pc;

assign pfu_sdb_entry_evict_clr  = pfu_pmb_entry_hit_pc;

//==========================================================
//                Generate pop signal
//==========================================================
//st pref pop
assign pfu_pop_st_all = pfu_pmb_entry_vld
                        && !pfu_pmb_entry_type_ld 
                        && (!cp0_lsu_l2_st_pref_en || amr_wa_cancel);

//for timing
//when create_vld != create_dp,and the entry is at evict state
//pop entry preventing data path from being changed incorrectly
assign pfu_pmb_entry_evict_pop  = pfu_pmb_entry_vld
                                  && pfu_pmb_entry_evict
                                  && pfu_pmb_entry_create_dp_vld
                                  && !pfu_pmb_entry_create_vld; 

assign pfu_pmb_entry_pop_vld    = pfu_pmb_entry_ready_grnt
                                  ||  pfu_pmb_entry_evict_pop
                                  ||  pfu_pop_st_all
                                  ||  pfu_pop_all_part_vld;

//==========================================================
//                 Generate interface
//==========================================================
//------------------input-----------------------------------
//-----------create signal--------------
assign pfu_pmb_entry_create_vld         = pfu_pmb_entry_create_vld_x;
assign pfu_pmb_entry_create_dp_vld      = pfu_pmb_entry_create_dp_vld_x;
assign pfu_pmb_entry_create_gateclk_en  = pfu_pmb_entry_create_gateclk_en_x;
//---------grnt/done signal-------------
assign pfu_pmb_entry_ready_grnt         = pfu_pmb_entry_ready_grnt_x;
//------------------output----------------------------------
//-----------entry signal---------------
assign pfu_pmb_entry_vld_x              = pfu_pmb_entry_vld;
assign pfu_pmb_entry_pc_v[PC_LEN-1:0]   = pfu_pmb_entry_pc[PC_LEN-1:0];
assign pfu_pmb_entry_ready_x            = pfu_pmb_entry_ready;
assign pfu_pmb_entry_evict_x            = pfu_pmb_entry_evict;
assign pfu_pmb_entry_type_ld_x          = pfu_pmb_entry_type_ld;
//-----------hit signal-----------------
assign pfu_pmb_entry_hit_pc_x           = pfu_pmb_entry_hit_pc_for_new;

// &ModuleEnd; @239
endmodule


