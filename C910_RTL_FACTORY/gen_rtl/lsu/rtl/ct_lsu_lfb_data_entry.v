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
module ct_lsu_lfb_data_entry(
  biu_lsu_r_data,
  biu_lsu_r_last,
  biu_lsu_r_vld,
  cp0_lsu_dcache_en,
  cp0_lsu_icg_en,
  cp0_yy_clk_en,
  cpurst_b,
  lfb_addr_entry_linefill_abort,
  lfb_addr_entry_linefill_permit,
  lfb_biu_id_2to0,
  lfb_biu_r_id_hit,
  lfb_data_entry_addr_id_v,
  lfb_data_entry_addr_pop_req_v,
  lfb_data_entry_create_dp_vld_x,
  lfb_data_entry_create_gateclk_en_x,
  lfb_data_entry_create_vld_x,
  lfb_data_entry_data_v,
  lfb_data_entry_dcache_share_x,
  lfb_data_entry_full_x,
  lfb_data_entry_last_x,
  lfb_data_entry_lf_sm_req_x,
  lfb_data_entry_vld_x,
  lfb_data_entry_wait_surplus_x,
  lfb_first_pass_ptr,
  lfb_lf_sm_data_grnt_x,
  lfb_lf_sm_data_pop_req_x,
  lfb_r_resp_err,
  lfb_r_resp_share,
  lsu_special_clk,
  pad_yy_icg_scan_en,
  snq_lfb_bypass_chg_tag_x,
  snq_lfb_bypass_invalid_x
);

// &Ports; @28
input   [127:0]  biu_lsu_r_data;                    
input            biu_lsu_r_last;                    
input            biu_lsu_r_vld;                     
input            cp0_lsu_dcache_en;                 
input            cp0_lsu_icg_en;                    
input            cp0_yy_clk_en;                     
input            cpurst_b;                          
input   [7  :0]  lfb_addr_entry_linefill_abort;     
input   [7  :0]  lfb_addr_entry_linefill_permit;    
input   [2  :0]  lfb_biu_id_2to0;                   
input            lfb_biu_r_id_hit;                  
input            lfb_data_entry_create_dp_vld_x;    
input            lfb_data_entry_create_gateclk_en_x; 
input            lfb_data_entry_create_vld_x;       
input   [3  :0]  lfb_first_pass_ptr;                
input            lfb_lf_sm_data_grnt_x;             
input            lfb_lf_sm_data_pop_req_x;          
input            lfb_r_resp_err;                    
input            lfb_r_resp_share;                  
input            lsu_special_clk;                   
input            pad_yy_icg_scan_en;                
input            snq_lfb_bypass_chg_tag_x;          
input            snq_lfb_bypass_invalid_x;          
output  [7  :0]  lfb_data_entry_addr_id_v;          
output  [7  :0]  lfb_data_entry_addr_pop_req_v;     
output  [511:0]  lfb_data_entry_data_v;             
output           lfb_data_entry_dcache_share_x;     
output           lfb_data_entry_full_x;             
output           lfb_data_entry_last_x;             
output           lfb_data_entry_lf_sm_req_x;        
output           lfb_data_entry_vld_x;              
output           lfb_data_entry_wait_surplus_x;     

// &Regs; @29
reg     [7  :0]  lfb_data_entry_addr_id;            
reg     [2  :0]  lfb_data_entry_biu_id;             
reg              lfb_data_entry_bus_err;            
reg     [1  :0]  lfb_data_entry_cnt;                
reg     [511:0]  lfb_data_entry_data;               
reg              lfb_data_entry_dcache_share;       
reg              lfb_data_entry_last;               
reg              lfb_data_entry_lf_sm_req_success;  
reg     [3  :0]  lfb_data_entry_pass_ptr;           
reg              lfb_data_entry_vld;                

// &Wires; @30
wire    [127:0]  biu_lsu_r_data;                    
wire             biu_lsu_r_last;                    
wire             biu_lsu_r_vld;                     
wire             cp0_lsu_dcache_en;                 
wire             cp0_lsu_icg_en;                    
wire             cp0_yy_clk_en;                     
wire             cpurst_b;                          
wire    [7  :0]  lfb_addr_entry_linefill_abort;     
wire    [7  :0]  lfb_addr_entry_linefill_permit;    
wire    [2  :0]  lfb_biu_id_2to0;                   
wire             lfb_biu_r_id_hit;                  
wire             lfb_data_entry_abort;              
wire    [7  :0]  lfb_data_entry_addr_id_v;          
wire    [7  :0]  lfb_data_entry_addr_pop_req;       
wire    [7  :0]  lfb_data_entry_addr_pop_req_v;     
wire             lfb_data_entry_clk;                
wire             lfb_data_entry_clk_en;             
wire             lfb_data_entry_create_dp_vld;      
wire             lfb_data_entry_create_dp_vld_x;    
wire             lfb_data_entry_create_gateclk_en;  
wire             lfb_data_entry_create_gateclk_en_x; 
wire             lfb_data_entry_create_vld;         
wire             lfb_data_entry_create_vld_x;       
wire             lfb_data_entry_data0_clk;          
wire             lfb_data_entry_data0_clk_en;       
wire             lfb_data_entry_data1_clk;          
wire             lfb_data_entry_data1_clk_en;       
wire             lfb_data_entry_data2_clk;          
wire             lfb_data_entry_data2_clk_en;       
wire             lfb_data_entry_data3_clk;          
wire             lfb_data_entry_data3_clk_en;       
wire             lfb_data_entry_data_clk;           
wire             lfb_data_entry_data_clk_en;        
wire    [511:0]  lfb_data_entry_data_v;             
wire             lfb_data_entry_dcache_share_x;     
wire             lfb_data_entry_finish_line;        
wire             lfb_data_entry_finish_once;        
wire             lfb_data_entry_full;               
wire             lfb_data_entry_full_x;             
wire             lfb_data_entry_last_x;             
wire             lfb_data_entry_lf_sm_req;          
wire             lfb_data_entry_lf_sm_req_x;        
wire             lfb_data_entry_linefill_abort;     
wire             lfb_data_entry_linefill_permit;    
wire             lfb_data_entry_pass_3times;        
wire             lfb_data_entry_pass_data0_vld;     
wire             lfb_data_entry_pass_data1_vld;     
wire             lfb_data_entry_pass_data2_vld;     
wire             lfb_data_entry_pass_data3_vld;     
wire             lfb_data_entry_pass_data_last;     
wire             lfb_data_entry_pass_data_vld;      
wire             lfb_data_entry_pop_vld;            
wire             lfb_data_entry_r_id_hit;           
wire             lfb_data_entry_vld_x;              
wire             lfb_data_entry_wait_surplus;       
wire             lfb_data_entry_wait_surplus_x;     
wire    [3  :0]  lfb_first_pass_ptr;                
wire             lfb_lf_sm_data_grnt;               
wire             lfb_lf_sm_data_grnt_x;             
wire             lfb_lf_sm_data_pop_req;            
wire             lfb_lf_sm_data_pop_req_x;          
wire             lfb_r_resp_err;                    
wire             lfb_r_resp_share;                  
wire             lsu_special_clk;                   
wire             pad_yy_icg_scan_en;                
wire             snq_lfb_bypass_chg_tag;            
wire             snq_lfb_bypass_chg_tag_x;          
wire             snq_lfb_bypass_invalid;            
wire             snq_lfb_bypass_invalid_x;          


parameter LFB_ADDR_ENTRY  = 8;

//==========================================================
//                 Instance of Gated Cell  
//==========================================================
//-----------entry gateclk--------------
//normal gateclk ,open when create || entry_vld
assign lfb_data_entry_clk_en  = lfb_data_entry_vld
                                ||  lfb_data_entry_create_gateclk_en;
// &Instance("gated_clk_cell", "x_lsu_lfb_data_entry_gated_clk"); @41
gated_clk_cell  x_lsu_lfb_data_entry_gated_clk (
  .clk_in                (lsu_special_clk      ),
  .clk_out               (lfb_data_entry_clk   ),
  .external_en           (1'b0                 ),
  .global_en             (cp0_yy_clk_en        ),
  .local_en              (lfb_data_entry_clk_en),
  .module_en             (cp0_lsu_icg_en       ),
  .pad_yy_icg_scan_en    (pad_yy_icg_scan_en   )
);

// &Connect(.clk_in        (lsu_special_clk     ), @42
//          .external_en   (1'b0               ), @43
//          .global_en     (cp0_yy_clk_en      ), @44
//          .module_en     (cp0_lsu_icg_en     ), @45
//          .local_en      (lfb_data_entry_clk_en), @46
//          .clk_out       (lfb_data_entry_clk )); @47

//-----------data gateclk---------------
assign lfb_data_entry_data_clk_en   = lfb_data_entry_pass_data_vld;
// &Instance("gated_clk_cell", "x_lsu_lfb_data_entry_data_gated_clk"); @51
gated_clk_cell  x_lsu_lfb_data_entry_data_gated_clk (
  .clk_in                     (lsu_special_clk           ),
  .clk_out                    (lfb_data_entry_data_clk   ),
  .external_en                (1'b0                      ),
  .global_en                  (cp0_yy_clk_en             ),
  .local_en                   (lfb_data_entry_data_clk_en),
  .module_en                  (cp0_lsu_icg_en            ),
  .pad_yy_icg_scan_en         (pad_yy_icg_scan_en        )
);

// &Connect(.clk_in        (lsu_special_clk     ), @52
//          .external_en   (1'b0               ), @53
//          .global_en     (cp0_yy_clk_en      ), @54
//          .module_en     (cp0_lsu_icg_en     ), @55
//          .local_en      (lfb_data_entry_data_clk_en), @56
//          .clk_out       (lfb_data_entry_data_clk)); @57

assign lfb_data_entry_data0_clk_en  = lfb_data_entry_pass_data0_vld;
// &Instance("gated_clk_cell", "x_lsu_lfb_data_entry_data0_gated_clk"); @60
gated_clk_cell  x_lsu_lfb_data_entry_data0_gated_clk (
  .clk_in                      (lsu_special_clk            ),
  .clk_out                     (lfb_data_entry_data0_clk   ),
  .external_en                 (1'b0                       ),
  .global_en                   (cp0_yy_clk_en              ),
  .local_en                    (lfb_data_entry_data0_clk_en),
  .module_en                   (cp0_lsu_icg_en             ),
  .pad_yy_icg_scan_en          (pad_yy_icg_scan_en         )
);

// &Connect(.clk_in        (lsu_special_clk     ), @61
//          .external_en   (1'b0               ), @62
//          .global_en     (cp0_yy_clk_en      ), @63
//          .module_en     (cp0_lsu_icg_en     ), @64
//          .local_en      (lfb_data_entry_data0_clk_en), @65
//          .clk_out       (lfb_data_entry_data0_clk)); @66

assign lfb_data_entry_data1_clk_en  = lfb_data_entry_pass_data1_vld;
// &Instance("gated_clk_cell", "x_lsu_lfb_data_entry_data1_gated_clk"); @69
gated_clk_cell  x_lsu_lfb_data_entry_data1_gated_clk (
  .clk_in                      (lsu_special_clk            ),
  .clk_out                     (lfb_data_entry_data1_clk   ),
  .external_en                 (1'b0                       ),
  .global_en                   (cp0_yy_clk_en              ),
  .local_en                    (lfb_data_entry_data1_clk_en),
  .module_en                   (cp0_lsu_icg_en             ),
  .pad_yy_icg_scan_en          (pad_yy_icg_scan_en         )
);

// &Connect(.clk_in        (lsu_special_clk     ), @70
//          .external_en   (1'b0               ), @71
//          .global_en     (cp0_yy_clk_en      ), @72
//          .module_en     (cp0_lsu_icg_en     ), @73
//          .local_en      (lfb_data_entry_data1_clk_en), @74
//          .clk_out       (lfb_data_entry_data1_clk)); @75

assign lfb_data_entry_data2_clk_en  = lfb_data_entry_pass_data2_vld;
// &Instance("gated_clk_cell", "x_lsu_lfb_data_entry_data2_gated_clk"); @78
gated_clk_cell  x_lsu_lfb_data_entry_data2_gated_clk (
  .clk_in                      (lsu_special_clk            ),
  .clk_out                     (lfb_data_entry_data2_clk   ),
  .external_en                 (1'b0                       ),
  .global_en                   (cp0_yy_clk_en              ),
  .local_en                    (lfb_data_entry_data2_clk_en),
  .module_en                   (cp0_lsu_icg_en             ),
  .pad_yy_icg_scan_en          (pad_yy_icg_scan_en         )
);

// &Connect(.clk_in        (lsu_special_clk     ), @79
//          .external_en   (1'b0               ), @80
//          .global_en     (cp0_yy_clk_en      ), @81
//          .module_en     (cp0_lsu_icg_en     ), @82
//          .local_en      (lfb_data_entry_data2_clk_en), @83
//          .clk_out       (lfb_data_entry_data2_clk)); @84

assign lfb_data_entry_data3_clk_en  = lfb_data_entry_pass_data3_vld;
// &Instance("gated_clk_cell", "x_lsu_lfb_data_entry_data3_gated_clk"); @87
gated_clk_cell  x_lsu_lfb_data_entry_data3_gated_clk (
  .clk_in                      (lsu_special_clk            ),
  .clk_out                     (lfb_data_entry_data3_clk   ),
  .external_en                 (1'b0                       ),
  .global_en                   (cp0_yy_clk_en              ),
  .local_en                    (lfb_data_entry_data3_clk_en),
  .module_en                   (cp0_lsu_icg_en             ),
  .pad_yy_icg_scan_en          (pad_yy_icg_scan_en         )
);

// &Connect(.clk_in        (lsu_special_clk     ), @88
//          .external_en   (1'b0               ), @89
//          .global_en     (cp0_yy_clk_en      ), @90
//          .module_en     (cp0_lsu_icg_en     ), @91
//          .local_en      (lfb_data_entry_data3_clk_en), @92
//          .clk_out       (lfb_data_entry_data3_clk)); @93

//==========================================================
//                 Registers
//==========================================================
//+-----------+
//| entry_vld |
//+-----------+
always @(posedge lfb_data_entry_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    lfb_data_entry_vld              <=  1'b0;
  else if(lfb_data_entry_pop_vld)
    lfb_data_entry_vld              <=  1'b0;
  else if(lfb_data_entry_create_vld)
    lfb_data_entry_vld              <=  1'b1;
end

//+--------------------+
//| addr_entry_id/r_id |
//+--------------------+
always @(posedge lfb_data_entry_data_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    lfb_data_entry_biu_id[2:0]  <=  3'b0;
  else if(lfb_data_entry_create_dp_vld)
    lfb_data_entry_biu_id[2:0]  <=  lfb_biu_id_2to0[2:0];
end

//+-------------+-----+------------+
//| cache share | cnt | bypass_ptr |
//+-------------+-----+------------+
always @(posedge lfb_data_entry_data_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
  begin
    lfb_data_entry_cnt[1:0]       <=  2'b0;
    lfb_data_entry_last           <=  1'b0;
    lfb_data_entry_pass_ptr[3:0]  <=  4'b1;
  end
  else if(lfb_data_entry_create_dp_vld)
  begin
    lfb_data_entry_cnt[1:0]       <=  2'b0;
    lfb_data_entry_last           <=  biu_lsu_r_last;
    lfb_data_entry_pass_ptr[3:0]  <=  {lfb_first_pass_ptr[2:0],
                                      lfb_first_pass_ptr[3]};
  end
  else if(lfb_data_entry_pass_data_vld)
  begin
    lfb_data_entry_cnt[1:0]       <=  lfb_data_entry_cnt[1:0] + 2'b1;
    lfb_data_entry_last           <=  biu_lsu_r_last;
    lfb_data_entry_pass_ptr[3:0]  <=  {lfb_data_entry_pass_ptr[2:0],
                                      lfb_data_entry_pass_ptr[3]};
  end
end

always @(posedge lfb_data_entry_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
  begin
    lfb_data_entry_dcache_share   <=  1'b0;
  end
  else if(lfb_data_entry_create_dp_vld)
  begin
    lfb_data_entry_dcache_share   <=  lfb_r_resp_share;
  end
  else if(lfb_data_entry_pass_data_vld)
  begin
    lfb_data_entry_dcache_share   <=  lfb_r_resp_share;
  end
  else if(snq_lfb_bypass_chg_tag)
  begin
    lfb_data_entry_dcache_share   <=  1'b1;
  end
end

//+-----------+
//| bus error |
//+-----------+
always @(posedge lfb_data_entry_data_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    lfb_data_entry_bus_err        <=  1'b0;
  else if(lfb_data_entry_create_dp_vld)
    lfb_data_entry_bus_err        <=  lfb_r_resp_err;
  else if(lfb_data_entry_pass_data_vld &&  lfb_r_resp_err)
    lfb_data_entry_bus_err        <=  1'b1;
end

//+------+
//| data |
//+------+
always @(posedge lfb_data_entry_data0_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    lfb_data_entry_data[127:0]    <=  128'b0;
  else if(lfb_data_entry_pass_data0_vld)
    lfb_data_entry_data[127:0]    <=  biu_lsu_r_data[127:0];
end

always @(posedge lfb_data_entry_data1_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    lfb_data_entry_data[255:128]    <=  128'b0;
  else if(lfb_data_entry_pass_data1_vld)
    lfb_data_entry_data[255:128]    <=  biu_lsu_r_data[127:0];
end

always @(posedge lfb_data_entry_data2_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    lfb_data_entry_data[383:256]    <=  128'b0;
  else if(lfb_data_entry_pass_data2_vld)
    lfb_data_entry_data[383:256]    <=  biu_lsu_r_data[127:0];
end

always @(posedge lfb_data_entry_data3_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    lfb_data_entry_data[511:384]    <=  128'b0;
  else if(lfb_data_entry_pass_data3_vld)
    lfb_data_entry_data[511:384]    <=  biu_lsu_r_data[127:0];
end

//+-------------------+
//| lf_sm_req_success |
//+-------------------+
always @(posedge lfb_data_entry_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    lfb_data_entry_lf_sm_req_success  <=  1'b0;
  else if(lfb_data_entry_create_dp_vld)
    lfb_data_entry_lf_sm_req_success  <=  1'b0;
  else if(lfb_lf_sm_data_grnt)
    lfb_data_entry_lf_sm_req_success  <=  1'b1;
end


//==========================================================
//                        Wires
//==========================================================
//---------------------full signal--------------------------
assign lfb_data_entry_full          = lfb_data_entry_vld
                                      &&  lfb_data_entry_last;
//wait surplus means, though this entry is vld, but it hasn't received all data
assign lfb_data_entry_wait_surplus  = lfb_data_entry_vld
                                      &&  !lfb_data_entry_last;

//------------------pass data signal------------------------
assign lfb_data_entry_r_id_hit  = lfb_data_entry_vld
                                  &&  biu_lsu_r_vld
                                  &&  lfb_biu_r_id_hit
                                  &&  (lfb_data_entry_biu_id[2:0]
                                      ==  lfb_biu_id_2to0[2:0]);

assign lfb_data_entry_pass_data_vld   = lfb_data_entry_create_dp_vld
                                        ||  lfb_data_entry_r_id_hit;

assign lfb_data_entry_pass_data0_vld  = lfb_data_entry_create_dp_vld
                                            &&  lfb_first_pass_ptr[0]
                                        ||  lfb_data_entry_r_id_hit
                                            &&  lfb_data_entry_pass_ptr[0];

assign lfb_data_entry_pass_data1_vld  = lfb_data_entry_create_dp_vld
                                            &&  lfb_first_pass_ptr[1]
                                        ||  lfb_data_entry_r_id_hit
                                            &&  lfb_data_entry_pass_ptr[1];

assign lfb_data_entry_pass_data2_vld  = lfb_data_entry_create_dp_vld
                                            &&  lfb_first_pass_ptr[2]
                                        ||  lfb_data_entry_r_id_hit
                                            &&  lfb_data_entry_pass_ptr[2];

assign lfb_data_entry_pass_data3_vld  = lfb_data_entry_create_dp_vld
                                            &&  lfb_first_pass_ptr[3]
                                        ||  lfb_data_entry_r_id_hit
                                            &&  lfb_data_entry_pass_ptr[3];

//==========================================================
//                 Generate req/pop signal
//==========================================================
//------------------last signal---------------------------
assign lfb_data_entry_pass_3times   = lfb_data_entry_vld
                                      &&  (lfb_data_entry_cnt[1:0]  ==  2'd2);
assign lfb_data_entry_finish_line   = lfb_data_entry_vld
                                      &&  (lfb_data_entry_cnt[1:0]  ==  2'd3)
                                      &&  lfb_data_entry_last;
assign lfb_data_entry_finish_once   = lfb_data_entry_vld
                                      &&  (lfb_data_entry_cnt[1:0]  ==  2'd0)
                                      &&  lfb_data_entry_last;

assign lfb_data_entry_pass_data_last  = lfb_data_entry_vld
                                        &&  biu_lsu_r_last
                                        &&  lfb_data_entry_pass_data_vld;

//------------------addr entry signal-----------------------
// &CombBeg; @289
always @( lfb_data_entry_biu_id[2:0])
begin
lfb_data_entry_addr_id[LFB_ADDR_ENTRY-1:0]  = {LFB_ADDR_ENTRY{1'b0}};
case(lfb_data_entry_biu_id[2:0])
  3'd0:lfb_data_entry_addr_id[0]  = 1'b1;
  3'd1:lfb_data_entry_addr_id[1]  = 1'b1;
  3'd2:lfb_data_entry_addr_id[2]  = 1'b1;
  3'd3:lfb_data_entry_addr_id[3]  = 1'b1;
  3'd4:lfb_data_entry_addr_id[4]  = 1'b1;
  3'd5:lfb_data_entry_addr_id[5]  = 1'b1;
  3'd6:lfb_data_entry_addr_id[6]  = 1'b1;
  3'd7:lfb_data_entry_addr_id[7]  = 1'b1;
  default:lfb_data_entry_addr_id[LFB_ADDR_ENTRY-1:0]  = {LFB_ADDR_ENTRY{1'b0}};
endcase
// &CombEnd; @302
end

assign lfb_data_entry_linefill_permit = |(lfb_data_entry_addr_id[LFB_ADDR_ENTRY-1:0]
                                          & lfb_addr_entry_linefill_permit[LFB_ADDR_ENTRY-1:0]);
assign lfb_data_entry_linefill_abort  = |(lfb_data_entry_addr_id[LFB_ADDR_ENTRY-1:0]
                                          & lfb_addr_entry_linefill_abort[LFB_ADDR_ENTRY-1:0]);

//if addr entry/bus err/read once should abort
assign lfb_data_entry_abort     = lfb_data_entry_finish_once
                                  ||  snq_lfb_bypass_invalid
                                  ||  lfb_data_entry_finish_line
                                      &&  (lfb_data_entry_linefill_abort
                                          ||  lfb_data_entry_linefill_permit
                                              &&  (lfb_data_entry_bus_err
                                                   || !cp0_lsu_dcache_en));

assign lfb_data_entry_addr_pop_req[LFB_ADDR_ENTRY-1:0]  = lfb_data_entry_addr_id[LFB_ADDR_ENTRY-1:0]
                                                          & {LFB_ADDR_ENTRY{lfb_data_entry_abort}};

//------------------lf req signal---------------------------
//if get all data already, or get last data this cycle, it will request linefill
//state machine
assign lfb_data_entry_lf_sm_req   = lfb_data_entry_vld
                                    &&  !lfb_data_entry_lf_sm_req_success
                                    &&  !lfb_data_entry_bus_err
                                    &&  lfb_data_entry_linefill_permit
                                    &&  cp0_lsu_dcache_en
                                    &&  (lfb_data_entry_finish_line
                                        ||  lfb_data_entry_pass_3times
                                            &&  lfb_data_entry_pass_data_last
                                            &&  !lfb_r_resp_err);

//------------------pop signal------------------------------
assign lfb_data_entry_pop_vld     = lfb_data_entry_abort
                                    ||  lfb_lf_sm_data_pop_req;

//==========================================================
//                 Generate interface
//==========================================================
//------------------input-----------------------------------
//-----------create signal--------------
assign lfb_data_entry_create_vld          = lfb_data_entry_create_vld_x;
assign lfb_data_entry_create_dp_vld       = lfb_data_entry_create_dp_vld_x;
assign lfb_data_entry_create_gateclk_en   = lfb_data_entry_create_gateclk_en_x;
//-----------grnt signal----------------
assign lfb_lf_sm_data_grnt                = lfb_lf_sm_data_grnt_x;
//-----------other signal---------------
assign lfb_lf_sm_data_pop_req             = lfb_lf_sm_data_pop_req_x;

assign snq_lfb_bypass_invalid             = snq_lfb_bypass_invalid_x;
assign snq_lfb_bypass_chg_tag             = snq_lfb_bypass_chg_tag_x;
//------------------output----------------------------------
//----------- entry signal--------------
assign lfb_data_entry_vld_x           = lfb_data_entry_vld;
assign lfb_data_entry_addr_id_v[LFB_ADDR_ENTRY-1:0] =
                lfb_data_entry_addr_id[LFB_ADDR_ENTRY-1:0];
assign lfb_data_entry_dcache_share_x  = lfb_data_entry_dcache_share;
assign lfb_data_entry_data_v[511:0]   = lfb_data_entry_data[511:0];
assign lfb_data_entry_last_x          = lfb_data_entry_last;
assign lfb_data_entry_wait_surplus_x  = lfb_data_entry_wait_surplus;
assign lfb_data_entry_full_x          = lfb_data_entry_full;
//-----------request--------------------
assign lfb_data_entry_addr_pop_req_v[LFB_ADDR_ENTRY-1:0]  = lfb_data_entry_addr_pop_req[LFB_ADDR_ENTRY-1:0];
assign lfb_data_entry_lf_sm_req_x   = lfb_data_entry_lf_sm_req;

// &ModuleEnd; @367
endmodule


