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

// &ModuleBeg; @28
module ct_lsu_pfu_sdb_entry(
  amr_wa_cancel,
  cp0_lsu_icg_en,
  cp0_lsu_l2_st_pref_en,
  cp0_yy_clk_en,
  cpurst_b,
  ld_da_iid,
  ld_da_ldfifo_pc,
  ld_da_pfu_act_dp_vld,
  ld_da_pfu_evict_cnt_vld,
  ld_da_pfu_pf_inst_vld,
  ld_da_ppfu_va,
  lsu_special_clk,
  pad_yy_icg_scan_en,
  pfu_pop_all_part_vld,
  pfu_sdb_create_pc,
  pfu_sdb_create_type_ld,
  pfu_sdb_entry_create_dp_vld_x,
  pfu_sdb_entry_create_gateclk_en_x,
  pfu_sdb_entry_create_vld_x,
  pfu_sdb_entry_evict_x,
  pfu_sdb_entry_hit_pc_x,
  pfu_sdb_entry_pc_v,
  pfu_sdb_entry_ready_grnt_x,
  pfu_sdb_entry_ready_x,
  pfu_sdb_entry_stride_neg_x,
  pfu_sdb_entry_stride_v,
  pfu_sdb_entry_strideh_6to0_v,
  pfu_sdb_entry_type_ld_x,
  pfu_sdb_entry_vld_x,
  rtu_yy_xx_commit0,
  rtu_yy_xx_commit0_iid,
  rtu_yy_xx_commit1,
  rtu_yy_xx_commit1_iid,
  rtu_yy_xx_commit2,
  rtu_yy_xx_commit2_iid,
  rtu_yy_xx_flush,
  sdb_timeout_cnt_val,
  st_da_iid,
  st_da_pc,
  st_da_pfu_evict_cnt_vld,
  st_da_pfu_pf_inst_vld,
  st_da_ppfu_va
);

// &Ports; @29
input           amr_wa_cancel;                     
input           cp0_lsu_icg_en;                    
input           cp0_lsu_l2_st_pref_en;             
input           cp0_yy_clk_en;                     
input           cpurst_b;                          
input   [6 :0]  ld_da_iid;                         
input   [14:0]  ld_da_ldfifo_pc;                   
input           ld_da_pfu_act_dp_vld;              
input           ld_da_pfu_evict_cnt_vld;           
input           ld_da_pfu_pf_inst_vld;             
input   [39:0]  ld_da_ppfu_va;                     
input           lsu_special_clk;                   
input           pad_yy_icg_scan_en;                
input           pfu_pop_all_part_vld;              
input   [14:0]  pfu_sdb_create_pc;                 
input           pfu_sdb_create_type_ld;            
input           pfu_sdb_entry_create_dp_vld_x;     
input           pfu_sdb_entry_create_gateclk_en_x; 
input           pfu_sdb_entry_create_vld_x;        
input           pfu_sdb_entry_ready_grnt_x;        
input           rtu_yy_xx_commit0;                 
input   [6 :0]  rtu_yy_xx_commit0_iid;             
input           rtu_yy_xx_commit1;                 
input   [6 :0]  rtu_yy_xx_commit1_iid;             
input           rtu_yy_xx_commit2;                 
input   [6 :0]  rtu_yy_xx_commit2_iid;             
input           rtu_yy_xx_flush;                   
input   [7 :0]  sdb_timeout_cnt_val;               
input   [6 :0]  st_da_iid;                         
input   [14:0]  st_da_pc;                          
input           st_da_pfu_evict_cnt_vld;           
input           st_da_pfu_pf_inst_vld;             
input   [39:0]  st_da_ppfu_va;                     
output          pfu_sdb_entry_evict_x;             
output          pfu_sdb_entry_hit_pc_x;            
output  [14:0]  pfu_sdb_entry_pc_v;                
output          pfu_sdb_entry_ready_x;             
output          pfu_sdb_entry_stride_neg_x;        
output  [10:0]  pfu_sdb_entry_stride_v;            
output  [6 :0]  pfu_sdb_entry_strideh_6to0_v;      
output          pfu_sdb_entry_type_ld_x;           
output          pfu_sdb_entry_vld_x;               

// &Regs; @30
reg             pfu_sdb_entry_evict;               
reg     [14:0]  pfu_sdb_entry_pc;                  
reg             pfu_sdb_entry_ready;               
reg     [7 :0]  pfu_sdb_entry_timeout_cnt;         
reg             pfu_sdb_entry_type_ld;             
reg             pfu_sdb_entry_vld;                 

// &Wires; @31
wire            amr_wa_cancel;                     
wire            cp0_lsu_icg_en;                    
wire            cp0_lsu_l2_st_pref_en;             
wire            cp0_yy_clk_en;                     
wire            cpurst_b;                          
wire    [6 :0]  ld_da_iid;                         
wire    [14:0]  ld_da_ldfifo_pc;                   
wire            ld_da_pfu_act_dp_vld;              
wire            ld_da_pfu_evict_cnt_vld;           
wire            ld_da_pfu_pf_inst_vld;             
wire    [39:0]  ld_da_ppfu_va;                     
wire            lsu_special_clk;                   
wire            pad_yy_icg_scan_en;                
wire            pfu_pfb_entry_all_pf_inst_clk;     
wire            pfu_pfb_entry_all_pf_inst_clk_en;  
wire            pfu_pop_all_part_vld;              
wire            pfu_pop_st_all;                    
wire    [14:0]  pfu_sdb_create_pc;                 
wire            pfu_sdb_create_type_ld;            
wire            pfu_sdb_entry_addr_cmp_info_vld;   
wire            pfu_sdb_entry_check_stride_success; 
wire            pfu_sdb_entry_clk;                 
wire            pfu_sdb_entry_clk_en;              
wire            pfu_sdb_entry_create_clk;          
wire            pfu_sdb_entry_create_clk_en;       
wire            pfu_sdb_entry_create_dp_vld;       
wire            pfu_sdb_entry_create_dp_vld_x;     
wire            pfu_sdb_entry_create_gateclk_en;   
wire            pfu_sdb_entry_create_gateclk_en_x; 
wire            pfu_sdb_entry_create_vld;          
wire            pfu_sdb_entry_create_vld_x;        
wire            pfu_sdb_entry_evict_clr;           
wire            pfu_sdb_entry_evict_set;           
wire            pfu_sdb_entry_evict_x;             
wire            pfu_sdb_entry_hit_pc;              
wire            pfu_sdb_entry_hit_pc_for_new;      
wire            pfu_sdb_entry_hit_pc_x;            
wire            pfu_sdb_entry_normal_stride;       
wire    [14:0]  pfu_sdb_entry_pc_v;                
wire            pfu_sdb_entry_pf_inst_vld;         
wire            pfu_sdb_entry_pop_vld;             
wire            pfu_sdb_entry_ready_grnt;          
wire            pfu_sdb_entry_ready_grnt_x;        
wire            pfu_sdb_entry_ready_set;           
wire            pfu_sdb_entry_ready_x;             
wire    [10:0]  pfu_sdb_entry_stride;              
wire            pfu_sdb_entry_stride_neg;          
wire            pfu_sdb_entry_stride_neg_x;        
wire    [10:0]  pfu_sdb_entry_stride_v;            
wire    [6 :0]  pfu_sdb_entry_strideh_6to0;        
wire    [6 :0]  pfu_sdb_entry_strideh_6to0_v;      
wire            pfu_sdb_entry_timeout_cnt_full;    
wire            pfu_sdb_entry_type_ld_x;           
wire            pfu_sdb_entry_vld_x;               
wire            pipe_cmp_inst_vld;                 
wire    [14:0]  pipe_cmp_pc;                       
wire            pipe_evict_cnt_vld;                
wire    [6 :0]  pipe_iid;                          
wire    [39:0]  pipe_ppfu_va;                      
wire            rtu_yy_xx_commit0;                 
wire    [6 :0]  rtu_yy_xx_commit0_iid;             
wire            rtu_yy_xx_commit1;                 
wire    [6 :0]  rtu_yy_xx_commit1_iid;             
wire            rtu_yy_xx_commit2;                 
wire    [6 :0]  rtu_yy_xx_commit2_iid;             
wire            rtu_yy_xx_flush;                   
wire    [7 :0]  sdb_timeout_cnt_val;               
wire    [6 :0]  st_da_iid;                         
wire    [14:0]  st_da_pc;                          
wire            st_da_pfu_evict_cnt_vld;           
wire            st_da_pfu_pf_inst_vld;             
wire    [39:0]  st_da_ppfu_va;                     


parameter TIMEOUT_BW  = 8;
parameter PC_LEN      = 15;

//==========================================================
//                 Instance of Gated Cell  
//==========================================================
assign pfu_sdb_entry_clk_en = pfu_sdb_entry_vld
                              ||  pfu_sdb_entry_create_gateclk_en;
// &Instance("gated_clk_cell", "x_lsu_pfu_sdb_entry_gated_clk"); @41
gated_clk_cell  x_lsu_pfu_sdb_entry_gated_clk (
  .clk_in               (lsu_special_clk     ),
  .clk_out              (pfu_sdb_entry_clk   ),
  .external_en          (1'b0                ),
  .global_en            (cp0_yy_clk_en       ),
  .local_en             (pfu_sdb_entry_clk_en),
  .module_en            (cp0_lsu_icg_en      ),
  .pad_yy_icg_scan_en   (pad_yy_icg_scan_en  )
);

// &Connect(.clk_in        (lsu_special_clk     ), @42
//          .external_en   (1'b0               ), @43
//          .global_en     (cp0_yy_clk_en      ), @44
//          .module_en     (cp0_lsu_icg_en     ), @45
//          .local_en      (pfu_sdb_entry_clk_en), @46
//          .clk_out       (pfu_sdb_entry_clk  )); @47

assign pfu_sdb_entry_create_clk_en = pfu_sdb_entry_create_gateclk_en;
// &Instance("gated_clk_cell", "x_lsu_pfu_sdb_entry_create_gated_clk"); @50
gated_clk_cell  x_lsu_pfu_sdb_entry_create_gated_clk (
  .clk_in                      (lsu_special_clk            ),
  .clk_out                     (pfu_sdb_entry_create_clk   ),
  .external_en                 (1'b0                       ),
  .global_en                   (cp0_yy_clk_en              ),
  .local_en                    (pfu_sdb_entry_create_clk_en),
  .module_en                   (cp0_lsu_icg_en             ),
  .pad_yy_icg_scan_en          (pad_yy_icg_scan_en         )
);

// &Connect(.clk_in        (lsu_special_clk     ), @51
//          .external_en   (1'b0               ), @52
//          .global_en     (cp0_yy_clk_en      ), @53
//          .module_en     (cp0_lsu_icg_en     ), @54
//          .local_en      (pfu_sdb_entry_create_clk_en), @55
//          .clk_out       (pfu_sdb_entry_create_clk)); @56

assign pfu_pfb_entry_all_pf_inst_clk_en = pfu_sdb_entry_vld
                                             && (ld_da_pfu_pf_inst_vld || st_da_pfu_pf_inst_vld)
                                          || pfu_sdb_entry_create_gateclk_en;
// &Instance("gated_clk_cell", "x_lsu_pfu_sdb_entry_all_pf_inst_gated_clk"); @61
gated_clk_cell  x_lsu_pfu_sdb_entry_all_pf_inst_gated_clk (
  .clk_in                           (lsu_special_clk                 ),
  .clk_out                          (pfu_pfb_entry_all_pf_inst_clk   ),
  .external_en                      (1'b0                            ),
  .global_en                        (cp0_yy_clk_en                   ),
  .local_en                         (pfu_pfb_entry_all_pf_inst_clk_en),
  .module_en                        (cp0_lsu_icg_en                  ),
  .pad_yy_icg_scan_en               (pad_yy_icg_scan_en              )
);

// &Connect(.clk_in        (lsu_special_clk     ), @62
//          .external_en   (1'b0               ), @63
//          .global_en     (cp0_yy_clk_en      ), @64
//          .module_en     (cp0_lsu_icg_en     ), @65
//          .local_en      (pfu_pfb_entry_all_pf_inst_clk_en), @66
//          .clk_out       (pfu_pfb_entry_all_pf_inst_clk)); @67

//==========================================================
//                 Register
//==========================================================
//+-----------+
//| entry_vld |
//+-----------+
always @(posedge pfu_sdb_entry_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    pfu_sdb_entry_vld  <=  1'b0;
  else if(pfu_sdb_entry_pop_vld)
    pfu_sdb_entry_vld  <=  1'b0;
  else if(pfu_sdb_entry_create_vld)
    pfu_sdb_entry_vld  <=  1'b1;
end

//+----+
//| pc |
//+----+
always @(posedge pfu_sdb_entry_create_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    pfu_sdb_entry_pc[PC_LEN-1:0]  <=  {PC_LEN{1'b0}};
  else if(pfu_sdb_entry_create_dp_vld)
    pfu_sdb_entry_pc[PC_LEN-1:0]  <=  pfu_sdb_create_pc[PC_LEN-1:0];
end

//+----+------+
//| pref_type |
//+----+------+
always @(posedge pfu_sdb_entry_create_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    pfu_sdb_entry_type_ld  <=  1'b0;
  else if(pfu_sdb_entry_create_dp_vld)
    pfu_sdb_entry_type_ld  <=  pfu_sdb_create_type_ld;
end

//+-------------+
//| timeout_cnt |
//+-------------+
always @(posedge pfu_pfb_entry_all_pf_inst_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    pfu_sdb_entry_timeout_cnt[TIMEOUT_BW-1:0] <=  {TIMEOUT_BW{1'b0}};
  else if(pfu_sdb_entry_create_dp_vld ||  pfu_sdb_entry_pf_inst_vld)
    pfu_sdb_entry_timeout_cnt[TIMEOUT_BW-1:0] <=  {TIMEOUT_BW{1'b0}};
  else if(pipe_evict_cnt_vld &&  !pfu_sdb_entry_timeout_cnt_full)
    pfu_sdb_entry_timeout_cnt[TIMEOUT_BW-1:0] <=  pfu_sdb_entry_timeout_cnt[TIMEOUT_BW-1:0]
                                                  + {{TIMEOUT_BW-1{1'b0}},1'b1};

end

//+-------+
//| ready |
//+-------+
always @(posedge pfu_sdb_entry_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    pfu_sdb_entry_ready     <=  1'b0;
  else if(pfu_sdb_entry_create_dp_vld ||  pfu_sdb_entry_pop_vld)
    pfu_sdb_entry_ready     <=  1'b0;
  else if(pfu_sdb_entry_ready_set)
    pfu_sdb_entry_ready     <=  1'b1;
end

//+-------+
//| evict |
//+-------+
always @(posedge pfu_sdb_entry_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    pfu_sdb_entry_evict     <=  1'b0;
  else if(pfu_sdb_entry_create_dp_vld ||  pfu_sdb_entry_pop_vld ||  pfu_sdb_entry_evict_clr)
    pfu_sdb_entry_evict     <=  1'b0;
  else if(pfu_sdb_entry_evict_set)
    pfu_sdb_entry_evict     <=  1'b1;
end

//==========================================================
//                Instance addr cmp
//==========================================================
// &ConnRule(s/^entry_/pfu_sdb_entry_/); @151
// &Instance("ct_lsu_pfu_sdb_cmp","x_ct_lsu_pfu_sdb_entry_cmp"); @152
ct_lsu_pfu_sdb_cmp  x_ct_lsu_pfu_sdb_entry_cmp (
  .cp0_lsu_icg_en                     (cp0_lsu_icg_en                    ),
  .cp0_yy_clk_en                      (cp0_yy_clk_en                     ),
  .cpurst_b                           (cpurst_b                          ),
  .entry_addr0_act                    (1'b1                              ),
  .entry_addr_cmp_info_vld            (pfu_sdb_entry_addr_cmp_info_vld   ),
  .entry_check_stride_success         (pfu_sdb_entry_check_stride_success),
  .entry_clk                          (pfu_sdb_entry_clk                 ),
  .entry_create_dp_vld                (pfu_sdb_entry_create_dp_vld       ),
  .entry_create_gateclk_en            (pfu_sdb_entry_create_gateclk_en   ),
  .entry_normal_stride                (pfu_sdb_entry_normal_stride       ),
  .entry_pf_inst_vld                  (pfu_sdb_entry_pf_inst_vld         ),
  .entry_stride                       (pfu_sdb_entry_stride              ),
  .entry_stride_keep                  (1'b0                              ),
  .entry_stride_neg                   (pfu_sdb_entry_stride_neg          ),
  .entry_strideh_6to0                 (pfu_sdb_entry_strideh_6to0        ),
  .entry_vld                          (pfu_sdb_entry_vld                 ),
  .forever_cpuclk                     (lsu_special_clk                   ),
  .ld_da_iid                          (pipe_iid                          ),
  .pad_yy_icg_scan_en                 (pad_yy_icg_scan_en                ),
  .pipe_va                            (pipe_ppfu_va                      ),
  .rtu_yy_xx_commit0                  (rtu_yy_xx_commit0                 ),
  .rtu_yy_xx_commit0_iid              (rtu_yy_xx_commit0_iid             ),
  .rtu_yy_xx_commit1                  (rtu_yy_xx_commit1                 ),
  .rtu_yy_xx_commit1_iid              (rtu_yy_xx_commit1_iid             ),
  .rtu_yy_xx_commit2                  (rtu_yy_xx_commit2                 ),
  .rtu_yy_xx_commit2_iid              (rtu_yy_xx_commit2_iid             ),
  .rtu_yy_xx_flush                    (rtu_yy_xx_flush                   )
);

// &Connect(.pipe_va             (pipe_ppfu_va         ), @153
//          .ld_da_iid           (pipe_iid             ), @154
//          .entry_addr0_act     (1'b1                 ), @155
//          .entry_stride_keep   (1'b0                 ), @156
//          .forever_cpuclk      (lsu_special_clk)); @157
// &Force("nonport","pfu_sdb_entry_check_stride_success"); @158

//==========================================================
//                 pipe info select
//==========================================================
assign pipe_cmp_inst_vld = pfu_sdb_entry_type_ld
                           ? ld_da_pfu_pf_inst_vld
                           : st_da_pfu_pf_inst_vld;

assign pipe_cmp_pc[PC_LEN-1:0] = pfu_sdb_entry_type_ld
                                 ? ld_da_ldfifo_pc[PC_LEN-1:0]
                                 : st_da_pc[PC_LEN-1:0];

assign pipe_evict_cnt_vld = ld_da_pfu_evict_cnt_vld || st_da_pfu_evict_cnt_vld;

assign pipe_iid[6:0]      = pfu_sdb_entry_type_ld
                            ? ld_da_iid[6:0]
                            : st_da_iid[6:0];

assign pipe_ppfu_va[`PA_WIDTH-1:0]  = pfu_sdb_entry_type_ld
                                      ? ld_da_ppfu_va[`PA_WIDTH-1:0]
                                      : st_da_ppfu_va[`PA_WIDTH-1:0];
//==========================================================
//                 Caucalate hit pc signal
//==========================================================
assign pfu_sdb_entry_hit_pc       = pfu_sdb_entry_vld
                                    &&  (pipe_cmp_pc[PC_LEN-1:0]
                                        ==  pfu_sdb_entry_pc[PC_LEN-1:0]);

assign pfu_sdb_entry_pf_inst_vld  = pfu_sdb_entry_hit_pc
                                    &&  pipe_cmp_inst_vld;

//for new inst create
assign pfu_sdb_entry_hit_pc_for_new = pfu_sdb_entry_hit_pc
                                      && !(pfu_sdb_entry_type_ld ^ ld_da_pfu_act_dp_vld);

//==========================================================
//                    Set/clr ready evict
//==========================================================
assign pfu_sdb_entry_ready_set        = pfu_sdb_entry_vld
                                        &&  pfu_sdb_entry_addr_cmp_info_vld
                                        &&  pfu_sdb_entry_normal_stride;


assign pfu_sdb_entry_timeout_cnt_full = (pfu_sdb_entry_timeout_cnt[TIMEOUT_BW-1:0]
                                         == sdb_timeout_cnt_val[TIMEOUT_BW-1:0]);

assign pfu_sdb_entry_evict_set  = pfu_sdb_entry_vld
                                  &&  !pfu_sdb_entry_ready
                                  &&  pipe_cmp_inst_vld
                                  &&  pfu_sdb_entry_timeout_cnt_full
                                  &&  !pfu_sdb_entry_hit_pc;

assign pfu_sdb_entry_evict_clr  = pfu_sdb_entry_pf_inst_vld;

//==========================================================
//                Generate pop signal
//==========================================================
//st pref pop
assign pfu_pop_st_all = pfu_sdb_entry_vld
                        && !pfu_sdb_entry_type_ld 
                        && (!cp0_lsu_l2_st_pref_en || amr_wa_cancel);

//if old 3 entry cross 4k or stride not equal, then pop immediately
assign pfu_sdb_entry_pop_vld    = pfu_sdb_entry_ready_grnt
                                  ||  !pfu_sdb_entry_normal_stride
                                      &&  pfu_sdb_entry_addr_cmp_info_vld
                                      &&  pfu_sdb_entry_vld
                                  ||  pfu_pop_st_all
                                  ||  pfu_pop_all_part_vld;

//==========================================================
//                 Generate interface
//==========================================================
//------------------input-----------------------------------
//-----------create signal--------------
assign pfu_sdb_entry_create_vld         = pfu_sdb_entry_create_vld_x;
assign pfu_sdb_entry_create_dp_vld      = pfu_sdb_entry_create_dp_vld_x;
assign pfu_sdb_entry_create_gateclk_en  = pfu_sdb_entry_create_gateclk_en_x;
//---------grnt/done signal-------------
assign pfu_sdb_entry_ready_grnt         = pfu_sdb_entry_ready_grnt_x;
//------------------output----------------------------------
//-----------entry signal---------------
assign pfu_sdb_entry_vld_x              = pfu_sdb_entry_vld;
assign pfu_sdb_entry_pc_v[PC_LEN-1:0]   = pfu_sdb_entry_pc[PC_LEN-1:0];
assign pfu_sdb_entry_ready_x            = pfu_sdb_entry_ready;
assign pfu_sdb_entry_evict_x            = pfu_sdb_entry_evict;
assign pfu_sdb_entry_stride_neg_x       = pfu_sdb_entry_stride_neg;
assign pfu_sdb_entry_stride_v[10:0]     = pfu_sdb_entry_stride[10:0];
assign pfu_sdb_entry_strideh_6to0_v[6:0]= pfu_sdb_entry_strideh_6to0[6:0];
assign pfu_sdb_entry_type_ld_x          = pfu_sdb_entry_type_ld;
//-----------hit signal-----------------
assign pfu_sdb_entry_hit_pc_x           = pfu_sdb_entry_hit_pc_for_new;

// &ModuleEnd; @252
endmodule


