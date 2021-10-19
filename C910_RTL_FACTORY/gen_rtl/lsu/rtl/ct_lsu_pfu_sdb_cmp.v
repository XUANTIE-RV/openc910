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
module ct_lsu_pfu_sdb_cmp(
  cp0_lsu_icg_en,
  cp0_yy_clk_en,
  cpurst_b,
  entry_addr0_act,
  entry_addr_cmp_info_vld,
  entry_check_stride_success,
  entry_clk,
  entry_create_dp_vld,
  entry_create_gateclk_en,
  entry_normal_stride,
  entry_pf_inst_vld,
  entry_stride,
  entry_stride_keep,
  entry_stride_neg,
  entry_strideh_6to0,
  entry_vld,
  forever_cpuclk,
  ld_da_iid,
  pad_yy_icg_scan_en,
  pipe_va,
  rtu_yy_xx_commit0,
  rtu_yy_xx_commit0_iid,
  rtu_yy_xx_commit1,
  rtu_yy_xx_commit1_iid,
  rtu_yy_xx_commit2,
  rtu_yy_xx_commit2_iid,
  rtu_yy_xx_flush
);

// &Ports; @27
input           cp0_lsu_icg_en;                    
input           cp0_yy_clk_en;                     
input           cpurst_b;                          
input           entry_addr0_act;                   
input           entry_clk;                         
input           entry_create_dp_vld;               
input           entry_create_gateclk_en;           
input           entry_pf_inst_vld;                 
input           entry_stride_keep;                 
input           entry_vld;                         
input           forever_cpuclk;                    
input   [6 :0]  ld_da_iid;                         
input           pad_yy_icg_scan_en;                
input   [39:0]  pipe_va;                           
input           rtu_yy_xx_commit0;                 
input   [6 :0]  rtu_yy_xx_commit0_iid;             
input           rtu_yy_xx_commit1;                 
input   [6 :0]  rtu_yy_xx_commit1_iid;             
input           rtu_yy_xx_commit2;                 
input   [6 :0]  rtu_yy_xx_commit2_iid;             
input           rtu_yy_xx_flush;                   
output          entry_addr_cmp_info_vld;           
output          entry_check_stride_success;        
output          entry_normal_stride;               
output  [10:0]  entry_stride;                      
output          entry_stride_neg;                  
output  [6 :0]  entry_strideh_6to0;                

// &Regs; @28
reg     [39:0]  entry_addr_0;                      
reg     [39:0]  entry_addr_1;                      
reg     [39:0]  entry_addr_2;                      
reg             entry_addr_cmp_info_vld;           
reg     [2 :0]  entry_addr_vld;                    
reg     [2 :0]  entry_cmit;                        
reg     [6 :0]  entry_iid_0;                       
reg     [6 :0]  entry_iid_1;                       
reg     [6 :0]  entry_iid_2;                       
reg     [10:0]  entry_stride;                      
reg             entry_stride_0to1_neg_cross_2k;    
reg             entry_stride_0to1_pos_cross_2k;    
reg             entry_stride_0to1_zero;            
reg             entry_stride_cmp0_eq;              
reg             entry_stride_diff_eq;              
reg             entry_stride_neg;                  

// &Wires; @29
wire            cp0_lsu_icg_en;                    
wire            cp0_yy_clk_en;                     
wire            cpurst_b;                          
wire            entry_addr0_act;                   
wire            entry_addr_0_clk;                  
wire            entry_addr_0_clk_en;               
wire    [39:0]  entry_addr_0_next;                 
wire            entry_addr_1_clk;                  
wire            entry_addr_1_clk_en;               
wire    [39:0]  entry_addr_1_next;                 
wire            entry_addr_2_clk;                  
wire            entry_addr_2_clk_en;               
wire    [39:0]  entry_addr_2_next;                 
wire    [2 :0]  entry_addr_dp_set;                 
wire    [2 :0]  entry_addr_set;                    
wire            entry_check_stride_success;        
wire            entry_clk;                         
wire            entry_clr_addr_info_vld;           
wire            entry_cmit_all;                    
wire            entry_cmit_all_clk;                
wire            entry_cmit_all_clk_en;             
wire    [2 :0]  entry_cmit_hit0;                   
wire    [2 :0]  entry_cmit_hit1;                   
wire    [2 :0]  entry_cmit_hit2;                   
wire    [2 :0]  entry_cmit_set;                    
wire            entry_create_dp_vld;               
wire            entry_create_gateclk_en;           
wire    [2 :0]  entry_flush_uncmit;                
wire    [6 :0]  entry_iid_0_next;                  
wire    [6 :0]  entry_iid_1_next;                  
wire    [6 :0]  entry_iid_2_next;                  
wire    [2 :0]  entry_iid_newer_than_ld_da;        
wire    [2 :0]  entry_newer_than_ld_da;            
wire            entry_normal_stride;               
wire            entry_pf_inst_vld;                 
wire            entry_sel_2;                       
wire    [39:0]  entry_stride_0to1;                 
wire            entry_stride_0to1_cross_2k;        
wire            entry_stride_0to1_neg_cross_2k_set; 
wire            entry_stride_0to1_pos_cross_2k_set; 
wire            entry_stride_0to1_zero_set;        
wire    [39:0]  entry_stride_1to0;                 
wire    [39:0]  entry_stride_1to2;                 
wire            entry_stride_cmp0_eq_set;          
wire            entry_stride_create_vld;           
wire            entry_stride_diff_eq_set;          
wire            entry_stride_ge_cache_line;        
wire            entry_stride_keep;                 
wire            entry_stride_neg_ge_cache_line;    
wire            entry_stride_neg_set;              
wire            entry_stride_pos_ge_cache_line;    
wire    [6 :0]  entry_strideh_6to0;                
wire            entry_vld;                         
wire            forever_cpuclk;                    
wire    [6 :0]  ld_da_iid;                         
wire            pad_yy_icg_scan_en;                
wire    [39:0]  pipe_va;                           
wire            rtu_yy_xx_commit0;                 
wire    [6 :0]  rtu_yy_xx_commit0_iid;             
wire            rtu_yy_xx_commit1;                 
wire    [6 :0]  rtu_yy_xx_commit1_iid;             
wire            rtu_yy_xx_commit2;                 
wire    [6 :0]  rtu_yy_xx_commit2_iid;             
wire            rtu_yy_xx_flush;                   


//==========================================================
//                 Instance of Gated Cell  
//==========================================================
assign entry_cmit_all_clk_en  = entry_create_gateclk_en
                                ||  entry_vld
                                    &&  entry_cmit_all;
// &Instance("gated_clk_cell", "x_lsu_entry_cmit_all_gated_clk"); @37
gated_clk_cell  x_lsu_entry_cmit_all_gated_clk (
  .clk_in                (forever_cpuclk       ),
  .clk_out               (entry_cmit_all_clk   ),
  .external_en           (1'b0                 ),
  .global_en             (cp0_yy_clk_en        ),
  .local_en              (entry_cmit_all_clk_en),
  .module_en             (cp0_lsu_icg_en       ),
  .pad_yy_icg_scan_en    (pad_yy_icg_scan_en   )
);

// &Connect(.clk_in        (forever_cpuclk     ), @38
//          .external_en   (1'b0               ), @39
//          .global_en     (cp0_yy_clk_en      ), @40
//          .module_en     (cp0_lsu_icg_en     ), @41
//          .local_en      (entry_cmit_all_clk_en), @42
//          .clk_out       (entry_cmit_all_clk)); @43

assign entry_addr_0_clk_en = entry_addr_dp_set[0];
// &Instance("gated_clk_cell", "x_lsu_entry_addr_0_gated_clk"); @46
gated_clk_cell  x_lsu_entry_addr_0_gated_clk (
  .clk_in              (forever_cpuclk     ),
  .clk_out             (entry_addr_0_clk   ),
  .external_en         (1'b0               ),
  .global_en           (cp0_yy_clk_en      ),
  .local_en            (entry_addr_0_clk_en),
  .module_en           (cp0_lsu_icg_en     ),
  .pad_yy_icg_scan_en  (pad_yy_icg_scan_en )
);

// &Connect(.clk_in        (forever_cpuclk     ), @47
//          .external_en   (1'b0               ), @48
//          .global_en     (cp0_yy_clk_en      ), @49
//          .module_en     (cp0_lsu_icg_en     ), @50
//          .local_en      (entry_addr_0_clk_en), @51
//          .clk_out       (entry_addr_0_clk)); @52

assign entry_addr_1_clk_en = entry_addr_dp_set[1];
// &Instance("gated_clk_cell", "x_lsu_entry_addr_1_gated_clk"); @55
gated_clk_cell  x_lsu_entry_addr_1_gated_clk (
  .clk_in              (forever_cpuclk     ),
  .clk_out             (entry_addr_1_clk   ),
  .external_en         (1'b0               ),
  .global_en           (cp0_yy_clk_en      ),
  .local_en            (entry_addr_1_clk_en),
  .module_en           (cp0_lsu_icg_en     ),
  .pad_yy_icg_scan_en  (pad_yy_icg_scan_en )
);

// &Connect(.clk_in        (forever_cpuclk     ), @56
//          .external_en   (1'b0               ), @57
//          .global_en     (cp0_yy_clk_en      ), @58
//          .module_en     (cp0_lsu_icg_en     ), @59
//          .local_en      (entry_addr_1_clk_en), @60
//          .clk_out       (entry_addr_1_clk)); @61

assign entry_addr_2_clk_en = entry_addr_dp_set[2];
// &Instance("gated_clk_cell", "x_lsu_entry_addr_2_gated_clk"); @64
gated_clk_cell  x_lsu_entry_addr_2_gated_clk (
  .clk_in              (forever_cpuclk     ),
  .clk_out             (entry_addr_2_clk   ),
  .external_en         (1'b0               ),
  .global_en           (cp0_yy_clk_en      ),
  .local_en            (entry_addr_2_clk_en),
  .module_en           (cp0_lsu_icg_en     ),
  .pad_yy_icg_scan_en  (pad_yy_icg_scan_en )
);

// &Connect(.clk_in        (forever_cpuclk     ), @65
//          .external_en   (1'b0               ), @66
//          .global_en     (cp0_yy_clk_en      ), @67
//          .module_en     (cp0_lsu_icg_en     ), @68
//          .local_en      (entry_addr_2_clk_en), @69
//          .clk_out       (entry_addr_2_clk)); @70

//==========================================================
//                 Register
//==========================================================
//------------------addr/addr_vld/cmit----------------------
//+--------+-------+
//| addr_0 | iid_0 |
//+--------+-------+
always @(posedge entry_addr_0_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
  begin
    entry_addr_0[`PA_WIDTH-1:0]  <=  {`PA_WIDTH{1'b0}};
    entry_iid_0[6:0]             <=  7'b0;
  end
  else if(entry_addr_dp_set[0])
  begin
    entry_addr_0[`PA_WIDTH-1:0]  <=  entry_addr_0_next[`PA_WIDTH-1:0];
    entry_iid_0[6:0]             <=  entry_iid_0_next[6:0];
  end
end

//+-------------+
//| addr_vld[0] |
//+-------------+
always @(posedge entry_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    entry_addr_vld[0]   <=  1'b0;
  else if(entry_create_dp_vld ||  entry_flush_uncmit[0] ||  entry_clr_addr_info_vld)
    entry_addr_vld[0]   <=  1'b0;
  else if(entry_addr_set[0])
    entry_addr_vld[0]   <=  1'b1;
end

//+---------+
//| cmit[0] |
//+---------+
always @(posedge entry_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    entry_cmit[0]       <=  1'b0;
  else if(entry_create_dp_vld ||  entry_flush_uncmit[0] ||  entry_clr_addr_info_vld)
    entry_cmit[0]       <=  1'b0;
  else if(entry_cmit_set[0])
    entry_cmit[0]       <=  1'b1;
end

//+--------+-------+
//| addr_1 | iid_1 |
//+--------+-------+
always @(posedge entry_addr_1_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
  begin
    entry_addr_1[`PA_WIDTH-1:0]  <=  {`PA_WIDTH{1'b0}};
    entry_iid_1[6:0]    <=  7'b0;
  end
  else if(entry_addr_dp_set[1])
  begin
    entry_addr_1[`PA_WIDTH-1:0]  <=  entry_addr_1_next[`PA_WIDTH-1:0];
    entry_iid_1[6:0]             <=  entry_iid_1_next[6:0];
  end
end

//+-------------+
//| addr_vld[1] |
//+-------------+
always @(posedge entry_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    entry_addr_vld[1]   <=  1'b0;
  else if(entry_create_dp_vld ||  entry_flush_uncmit[1] ||  entry_clr_addr_info_vld)
    entry_addr_vld[1]   <=  1'b0;
  else if(entry_addr_set[1])
    entry_addr_vld[1]   <=  1'b1;
end

//+---------+
//| cmit[1] |
//+---------+
always @(posedge entry_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    entry_cmit[1]       <=  1'b0;
  else if(entry_create_dp_vld ||  entry_flush_uncmit[1] ||  entry_clr_addr_info_vld)
    entry_cmit[1]       <=  1'b0;
  else if(entry_cmit_set[1])
    entry_cmit[1]       <=  1'b1;
end

//+--------+-------+
//| addr_2 | iid_2 |
//+--------+-------+
always @(posedge entry_addr_2_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
  begin
    entry_addr_2[`PA_WIDTH-1:0]  <=  {`PA_WIDTH{1'b0}};
    entry_iid_2[6:0]             <=  7'b0;
  end
  else if(entry_addr_dp_set[2])
  begin
    entry_addr_2[`PA_WIDTH-1:0]  <=  entry_addr_2_next[`PA_WIDTH-1:0];
    entry_iid_2[6:0]             <=  entry_iid_2_next[6:0];
  end
end

//+-------------+
//| addr_vld[2] |
//+-------------+
always @(posedge entry_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    entry_addr_vld[2]   <=  1'b0;
  else if(entry_create_dp_vld ||  entry_flush_uncmit[2] ||  entry_clr_addr_info_vld)
    entry_addr_vld[2]   <=  1'b0;
  else if(entry_addr_set[2])
    entry_addr_vld[2]   <=  1'b1;
end

//+---------+
//| cmit[2] |
//+---------+
always @(posedge entry_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    entry_cmit[2]       <=  1'b0;
  else if(entry_create_dp_vld ||  entry_flush_uncmit[2] ||  entry_clr_addr_info_vld)
    entry_cmit[2]       <=  1'b0;
  else if(entry_cmit_set[2])
    entry_cmit[2]       <=  1'b1;
end

//+--------+
//| stride |
//+--------+
// &Force("output","entry_stride_neg"); @208
// &Force("output","entry_stride"); @209
always @(posedge entry_cmit_all_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
  begin
    entry_stride_neg   <=  1'b0;
    entry_stride[10:0] <=  11'b0;
  end
  else if(entry_stride_create_vld)
  begin
    entry_stride_neg   <=  entry_stride_neg_set;
    entry_stride[10:0] <=  entry_stride_0to1[10:0];
  end
end
//+-------------------+
//| addr compare info |
//+-------------------+
// &Force("output","entry_addr_cmp_info_vld"); @226
always @(posedge entry_cmit_all_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
  begin
    entry_addr_cmp_info_vld        <=  1'b0;
    entry_stride_diff_eq           <=  1'b0;
    entry_stride_cmp0_eq           <=  1'b0;
    entry_stride_0to1_zero         <=  1'b0;
    entry_stride_0to1_pos_cross_2k <=  1'b0;
    entry_stride_0to1_neg_cross_2k <=  1'b0;
  end
  else if(entry_create_dp_vld  ||  entry_clr_addr_info_vld)
  begin
    entry_addr_cmp_info_vld        <=  1'b0;
    entry_stride_diff_eq           <=  1'b0;
    entry_stride_cmp0_eq           <=  1'b0;
    entry_stride_0to1_zero         <=  1'b0;
    entry_stride_0to1_pos_cross_2k <=  1'b0;
    entry_stride_0to1_neg_cross_2k <=  1'b0;
  end
  else if(entry_vld &&  entry_cmit_all)
  begin
    entry_addr_cmp_info_vld        <=  1'b1;
    entry_stride_diff_eq           <=  entry_stride_diff_eq_set;
    entry_stride_cmp0_eq           <=  entry_stride_cmp0_eq_set;
    entry_stride_0to1_zero         <=  entry_stride_0to1_zero_set;
    entry_stride_0to1_pos_cross_2k <=  entry_stride_0to1_pos_cross_2k_set;
    entry_stride_0to1_neg_cross_2k <=  entry_stride_0to1_neg_cross_2k_set;
  end
end

//==========================================================
//                 Generate cmit signal
//==========================================================
//----------------------cmit0 signal------------------------
assign entry_cmit_hit0[0] = {rtu_yy_xx_commit0,rtu_yy_xx_commit0_iid[6:0]}
                            ==  {1'b1,entry_iid_0[6:0]};
assign entry_cmit_hit1[0] = {rtu_yy_xx_commit1,rtu_yy_xx_commit1_iid[6:0]}
                            ==  {1'b1,entry_iid_0[6:0]};
assign entry_cmit_hit2[0] = {rtu_yy_xx_commit2,rtu_yy_xx_commit2_iid[6:0]}
                            ==  {1'b1,entry_iid_0[6:0]};

assign entry_cmit_set[0]  = (entry_cmit_hit0[0]
                                ||  entry_cmit_hit1[0]
                                ||  entry_cmit_hit2[0])
                            &&  entry_addr_vld[0];

//----------------------cmit1 signal------------------------
assign entry_cmit_hit0[1] = {rtu_yy_xx_commit0,rtu_yy_xx_commit0_iid[6:0]}
                            ==  {1'b1,entry_iid_1[6:0]};
assign entry_cmit_hit1[1] = {rtu_yy_xx_commit1,rtu_yy_xx_commit1_iid[6:0]}
                            ==  {1'b1,entry_iid_1[6:0]};
assign entry_cmit_hit2[1] = {rtu_yy_xx_commit2,rtu_yy_xx_commit2_iid[6:0]}
                            ==  {1'b1,entry_iid_1[6:0]};

assign entry_cmit_set[1]  = (entry_cmit_hit0[1]
                                ||  entry_cmit_hit1[1]
                                ||  entry_cmit_hit2[1])
                            &&  entry_addr_vld[1];

//----------------------cmit2 signal------------------------
assign entry_cmit_hit0[2] = {rtu_yy_xx_commit0,rtu_yy_xx_commit0_iid[6:0]}
                            ==  {1'b1,entry_iid_2[6:0]};
assign entry_cmit_hit1[2] = {rtu_yy_xx_commit1,rtu_yy_xx_commit1_iid[6:0]}
                            ==  {1'b1,entry_iid_2[6:0]};
assign entry_cmit_hit2[2] = {rtu_yy_xx_commit2,rtu_yy_xx_commit2_iid[6:0]}
                            ==  {1'b1,entry_iid_2[6:0]};

assign entry_cmit_set[2]  = (entry_cmit_hit0[2]
                                ||  entry_cmit_hit1[2]
                                ||  entry_cmit_hit2[2])
                            &&  entry_addr_vld[2];

//-------------------flush uncommited-----------------------
assign entry_flush_uncmit[2:0]  = {3{rtu_yy_xx_flush}}
                                  & (~entry_cmit[2:0]);
                                        

//==========================================================
//                    Set addr and iid
//==========================================================
//------------------------addr_set--------------------------
//addr0 is static, addr1 and addr2 can change
assign entry_addr_dp_set[0] = entry_pf_inst_vld
                              &&  !entry_addr_vld[0];
assign entry_addr_dp_set[1] = entry_pf_inst_vld
                              &&  !entry_newer_than_ld_da[0]
                              &&  (entry_addr_vld[0]
                                      &&  !entry_addr_vld[1]
                                  ||  entry_newer_than_ld_da[1]);
assign entry_addr_dp_set[2] = entry_pf_inst_vld
                              &&  !entry_newer_than_ld_da[0]
                              &&  (entry_addr_vld[0]
                                      &&  entry_addr_vld[1]
                                      &&  !entry_addr_vld[2]
                                  ||  entry_newer_than_ld_da[2]);

assign entry_addr_set[0]    = entry_addr_dp_set[0]
                              &&  entry_addr0_act;
assign entry_addr_set[1]    = entry_addr_dp_set[1];
assign entry_addr_set[2]    = entry_addr_dp_set[2];
//----------------------addr/iid set------------------------
//------------------0-------------------
assign entry_addr_0_next[`PA_WIDTH-1:0] = pipe_va[`PA_WIDTH-1:0];
assign entry_iid_0_next[6:0]            = ld_da_iid[6:0];
//------------------1-------------------
assign entry_addr_1_next[`PA_WIDTH-1:0] = pipe_va[`PA_WIDTH-1:0];
assign entry_iid_1_next[6:0]            = ld_da_iid[6:0];
//------------------2-------------------
//for sel signal, 1 means use last entry
assign entry_sel_2 = entry_newer_than_ld_da[1];
assign entry_addr_2_next[`PA_WIDTH-1:0] = entry_sel_2
                                          ? entry_addr_1[`PA_WIDTH-1:0]
                                          : pipe_va[`PA_WIDTH-1:0];

assign entry_iid_2_next[6:0]            = entry_sel_2
                                          ? entry_iid_1[6:0]
                                          : ld_da_iid[6:0];

//--------------------compare iid---------------------------
//------------------0-------------------
//sdb entry iid[0] newer than ld da siganl
// &Instance("ct_rtu_compare_iid","x_lsu_sdb_cmp_0"); @349
ct_rtu_compare_iid  x_lsu_sdb_cmp_0 (
  .x_iid0                        (ld_da_iid[6:0]               ),
  .x_iid0_older                  (entry_iid_newer_than_ld_da[0]),
  .x_iid1                        (entry_iid_0[6:0]             )
);

// &Connect( .x_iid0         (ld_da_iid[6:0]       ), @350
//           .x_iid1         (entry_iid_0[6:0]     ), @351
//           .x_iid0_older   (entry_iid_newer_than_ld_da[0])); @352

assign entry_newer_than_ld_da[0]  = entry_iid_newer_than_ld_da[0]
                                    &&  !entry_cmit[0]
                                    &&  entry_addr_vld[0];

//------------------1-------------------
//sdb entry iid[1] newer than ld da siganl
// &Instance("ct_rtu_compare_iid","x_lsu_sdb_cmp_1"); @360
ct_rtu_compare_iid  x_lsu_sdb_cmp_1 (
  .x_iid0                        (ld_da_iid[6:0]               ),
  .x_iid0_older                  (entry_iid_newer_than_ld_da[1]),
  .x_iid1                        (entry_iid_1[6:0]             )
);

// &Connect( .x_iid0         (ld_da_iid[6:0]       ), @361
//           .x_iid1         (entry_iid_1[6:0]     ), @362
//           .x_iid0_older   (entry_iid_newer_than_ld_da[1])); @363

assign entry_newer_than_ld_da[1]  = entry_iid_newer_than_ld_da[1]
                                    &&  !entry_cmit[1]
                                    &&  entry_addr_vld[1];

//------------------2-------------------
//sdb entry iid[1] newer than ld da siganl
// &Instance("ct_rtu_compare_iid","x_lsu_sdb_cmp_2"); @371
ct_rtu_compare_iid  x_lsu_sdb_cmp_2 (
  .x_iid0                        (ld_da_iid[6:0]               ),
  .x_iid0_older                  (entry_iid_newer_than_ld_da[2]),
  .x_iid1                        (entry_iid_2[6:0]             )
);

// &Connect( .x_iid0         (ld_da_iid[6:0]       ), @372
//           .x_iid1         (entry_iid_2[6:0]     ), @373
//           .x_iid0_older   (entry_iid_newer_than_ld_da[2])); @374

assign entry_newer_than_ld_da[2]  = entry_iid_newer_than_ld_da[2]
                                    &&  !entry_cmit[2]
                                    &&  entry_addr_vld[2];

//==========================================================
//                Compare stride
//==========================================================
assign entry_stride_1to0[`PA_WIDTH-1:0]  = entry_addr_0[`PA_WIDTH-1:0]
                                              - entry_addr_1[`PA_WIDTH-1:0];
assign entry_stride_0to1[`PA_WIDTH-1:0]  = entry_addr_1[`PA_WIDTH-1:0]
                                              - entry_addr_0[`PA_WIDTH-1:0];
assign entry_stride_1to2[`PA_WIDTH-1:0]  = entry_addr_2[`PA_WIDTH-1:0]
                                              - entry_addr_1[`PA_WIDTH-1:0];

assign entry_stride_neg_set     = entry_stride_0to1[`PA_WIDTH-1];

assign entry_stride_diff_eq_set = entry_stride_0to1[`PA_WIDTH-1:0]
                                  ==  entry_stride_1to2[`PA_WIDTH-1:0];
assign entry_stride_cmp0_eq_set = entry_stride_0to1[11:0]
                                  ==  {entry_stride_neg,entry_stride[10:0]};

assign entry_stride_0to1_pos_cross_2k_set  = |entry_stride_0to1[`PA_WIDTH-1:12];
assign entry_stride_0to1_neg_cross_2k_set  = |entry_stride_1to0[`PA_WIDTH-1:12];

assign entry_stride_0to1_zero_set   = ~(|entry_stride_0to1[`PA_WIDTH-1:0]);

assign entry_stride_0to1_cross_2k   = entry_stride_neg
                                          &&  entry_stride_0to1_neg_cross_2k
                                      ||  !entry_stride_neg
                                          &&  entry_stride_0to1_pos_cross_2k;

//----------------------judge stride------------------------
// &Force("output","entry_normal_stride"); @408
assign entry_normal_stride          = !entry_stride_0to1_zero
                                      &&  !entry_stride_0to1_cross_2k
                                      &&  entry_stride_diff_eq;

assign entry_check_stride_success   = entry_normal_stride
                                      &&  entry_stride_cmp0_eq;

//==========================================================
//                    Addr info wires
//==========================================================
assign entry_cmit_all           = &entry_cmit[2:0];
assign entry_stride_create_vld  = entry_cmit_all
                                  &&  !entry_stride_keep
                                  &&  !entry_addr_cmp_info_vld;
assign entry_clr_addr_info_vld  = entry_cmit_all
                                  &&  entry_addr_cmp_info_vld;

//==========================================================
//              Generate create gpfb signal
//==========================================================
assign entry_stride_neg_ge_cache_line = !(&entry_stride[10:6]);

assign entry_stride_pos_ge_cache_line = |entry_stride[10:6];

assign entry_stride_ge_cache_line     = entry_stride_neg
                                        ? entry_stride_neg_ge_cache_line
                                        : entry_stride_pos_ge_cache_line;

assign entry_strideh_6to0[6:0]        = entry_stride_ge_cache_line
                                        ? entry_stride[6:0]
                                        : 7'h40;


// &ModuleEnd; @442
endmodule


