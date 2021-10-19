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
module ct_lsu_vb_addr_entry(
  cp0_lsu_icg_en,
  cp0_yy_clk_en,
  cpurst_b,
  evict_req_success,
  icc_vb_addr_tto6,
  icc_vb_inv,
  lfb_vb_addr_tto6,
  lfb_vb_id,
  lsu_special_clk,
  pad_yy_icg_scan_en,
  pfu_biu_req_addr,
  rb_biu_req_addr,
  snq_bypass_addr_tto6,
  snq_create_addr,
  st_da_vb_feedback_addr_tto14,
  vb_addr_entry_addr_tto6_v,
  vb_addr_entry_create_data_x,
  vb_addr_entry_create_gateclk_en_x,
  vb_addr_entry_create_vld_x,
  vb_addr_entry_data_pop_x,
  vb_addr_entry_db_id_v,
  vb_addr_entry_dep_remove_x,
  vb_addr_entry_feedback_vld_x,
  vb_addr_entry_icc_create_dp_vld_x,
  vb_addr_entry_inv_x,
  vb_addr_entry_lfb_create_dp_vld_x,
  vb_addr_entry_lfb_create_x,
  vb_addr_entry_lfb_vb_req_hit_idx_x,
  vb_addr_entry_pfu_biu_req_hit_idx_x,
  vb_addr_entry_pop_x,
  vb_addr_entry_rb_biu_req_hit_idx_x,
  vb_addr_entry_rcl_sm_req_x,
  vb_addr_entry_set_way_mode_x,
  vb_addr_entry_snq_bypass_hit_x,
  vb_addr_entry_snq_create_hit_idx_x,
  vb_addr_entry_snq_start_wait_x,
  vb_addr_entry_source_id_v,
  vb_addr_entry_vld_x,
  vb_addr_entry_wmb_create_dp_vld_x,
  vb_addr_entry_wmb_create_x,
  vb_addr_entry_wmb_write_req_hit_idx_x,
  vb_data_entry_id,
  vb_rcl_sm_addr_grnt_x,
  vb_rcl_sm_done_x,
  wmb_vb_addr_tto6,
  wmb_vb_inv,
  wmb_vb_set_way_mode,
  wmb_write_ptr_encode,
  wmb_write_req_addr
);

// &Ports; @27
input           cp0_lsu_icg_en;                        
input           cp0_yy_clk_en;                         
input           cpurst_b;                              
input           evict_req_success;                     
input   [33:0]  icc_vb_addr_tto6;                      
input           icc_vb_inv;                            
input   [33:0]  lfb_vb_addr_tto6;                      
input   [2 :0]  lfb_vb_id;                             
input           lsu_special_clk;                       
input           pad_yy_icg_scan_en;                    
input   [39:0]  pfu_biu_req_addr;                      
input   [39:0]  rb_biu_req_addr;                       
input   [33:0]  snq_bypass_addr_tto6;                  
input   [39:0]  snq_create_addr;                       
input   [25:0]  st_da_vb_feedback_addr_tto14;          
input           vb_addr_entry_create_data_x;           
input           vb_addr_entry_create_gateclk_en_x;     
input           vb_addr_entry_create_vld_x;            
input           vb_addr_entry_data_pop_x;              
input           vb_addr_entry_feedback_vld_x;          
input           vb_addr_entry_icc_create_dp_vld_x;     
input           vb_addr_entry_lfb_create_dp_vld_x;     
input           vb_addr_entry_pop_x;                   
input           vb_addr_entry_wmb_create_dp_vld_x;     
input   [2 :0]  vb_data_entry_id;                      
input           vb_rcl_sm_addr_grnt_x;                 
input           vb_rcl_sm_done_x;                      
input   [33:0]  wmb_vb_addr_tto6;                      
input           wmb_vb_inv;                            
input           wmb_vb_set_way_mode;                   
input   [2 :0]  wmb_write_ptr_encode;                  
input   [39:0]  wmb_write_req_addr;                    
output  [33:0]  vb_addr_entry_addr_tto6_v;             
output  [2 :0]  vb_addr_entry_db_id_v;                 
output          vb_addr_entry_dep_remove_x;            
output          vb_addr_entry_inv_x;                   
output          vb_addr_entry_lfb_create_x;            
output          vb_addr_entry_lfb_vb_req_hit_idx_x;    
output          vb_addr_entry_pfu_biu_req_hit_idx_x;   
output          vb_addr_entry_rb_biu_req_hit_idx_x;    
output          vb_addr_entry_rcl_sm_req_x;            
output          vb_addr_entry_set_way_mode_x;          
output          vb_addr_entry_snq_bypass_hit_x;        
output          vb_addr_entry_snq_create_hit_idx_x;    
output          vb_addr_entry_snq_start_wait_x;        
output  [2 :0]  vb_addr_entry_source_id_v;             
output          vb_addr_entry_vld_x;                   
output          vb_addr_entry_wmb_create_x;            
output          vb_addr_entry_wmb_write_req_hit_idx_x; 

// &Regs; @28
reg     [33:0]  vb_addr_entry_addr_tto6;               
reg             vb_addr_entry_data_req_success;        
reg     [2 :0]  vb_addr_entry_db_id;                   
reg             vb_addr_entry_inv;                     
reg             vb_addr_entry_lfb_create;              
reg             vb_addr_entry_rcl_done;                
reg             vb_addr_entry_rcl_sm_req_success;      
reg             vb_addr_entry_set_way_mode;            
reg     [2 :0]  vb_addr_entry_source_id;               
reg             vb_addr_entry_vld;                     
reg             vb_addr_entry_wmb_create;              

// &Wires; @29
wire            cp0_lsu_icg_en;                        
wire            cp0_yy_clk_en;                         
wire            cpurst_b;                              
wire            evict_req_success;                     
wire    [33:0]  icc_vb_addr_tto6;                      
wire            icc_vb_inv;                            
wire    [33:0]  lfb_vb_addr_tto6;                      
wire    [2 :0]  lfb_vb_id;                             
wire            lsu_special_clk;                       
wire            pad_yy_icg_scan_en;                    
wire    [39:0]  pfu_biu_req_addr;                      
wire    [39:0]  rb_biu_req_addr;                       
wire            snq_bypass_addr_hit;                   
wire    [33:0]  snq_bypass_addr_tto6;                  
wire    [39:0]  snq_create_addr;                       
wire    [25:0]  st_da_vb_feedback_addr_tto14;          
wire            vb_addr_data_pop;                      
wire    [33:0]  vb_addr_entry_addr_tto6_v;             
wire            vb_addr_entry_clk;                     
wire            vb_addr_entry_clk_en;                  
wire    [33:0]  vb_addr_entry_cmp_lfb_vb_addr_tto6;    
wire    [39:0]  vb_addr_entry_cmp_pfu_biu_req_addr;    
wire    [39:0]  vb_addr_entry_cmp_rb_biu_req_addr;     
wire    [33:0]  vb_addr_entry_cmp_snq_bypass_addr_tto6; 
wire    [39:0]  vb_addr_entry_cmp_snq_create_addr;     
wire    [39:0]  vb_addr_entry_cmp_wmb_write_req_addr;  
wire            vb_addr_entry_create_clk;              
wire            vb_addr_entry_create_clk_en;           
wire            vb_addr_entry_create_data;             
wire            vb_addr_entry_create_data_x;           
wire            vb_addr_entry_create_gateclk_en;       
wire            vb_addr_entry_create_gateclk_en_x;     
wire            vb_addr_entry_create_vld;              
wire            vb_addr_entry_create_vld_x;            
wire            vb_addr_entry_data_pop_x;              
wire    [2 :0]  vb_addr_entry_db_id_v;                 
wire            vb_addr_entry_dep_remove;              
wire            vb_addr_entry_dep_remove_x;            
wire            vb_addr_entry_feedback_clk;            
wire            vb_addr_entry_feedback_clk_en;         
wire            vb_addr_entry_feedback_vld;            
wire            vb_addr_entry_feedback_vld_x;          
wire            vb_addr_entry_icc_create_dp_vld;       
wire            vb_addr_entry_icc_create_dp_vld_x;     
wire            vb_addr_entry_inv_x;                   
wire            vb_addr_entry_lfb_create_dp_vld;       
wire            vb_addr_entry_lfb_create_dp_vld_x;     
wire            vb_addr_entry_lfb_create_x;            
wire            vb_addr_entry_lfb_vb_req_hit_idx;      
wire            vb_addr_entry_lfb_vb_req_hit_idx_x;    
wire            vb_addr_entry_pfu_biu_req_hit_idx;     
wire            vb_addr_entry_pfu_biu_req_hit_idx_x;   
wire            vb_addr_entry_pop;                     
wire            vb_addr_entry_pop_vld;                 
wire            vb_addr_entry_pop_x;                   
wire            vb_addr_entry_rb_biu_req_hit_idx;      
wire            vb_addr_entry_rb_biu_req_hit_idx_x;    
wire            vb_addr_entry_rcl_sm_req;              
wire            vb_addr_entry_rcl_sm_req_x;            
wire            vb_addr_entry_set_way_mode_x;          
wire            vb_addr_entry_snq_bypass_hit;          
wire            vb_addr_entry_snq_bypass_hit_x;        
wire            vb_addr_entry_snq_create_hit_idx;      
wire            vb_addr_entry_snq_create_hit_idx_x;    
wire            vb_addr_entry_snq_start_wait;          
wire            vb_addr_entry_snq_start_wait_x;        
wire    [2 :0]  vb_addr_entry_source_id_v;             
wire            vb_addr_entry_vld_x;                   
wire            vb_addr_entry_wmb_create_dp_vld;       
wire            vb_addr_entry_wmb_create_dp_vld_x;     
wire            vb_addr_entry_wmb_create_x;            
wire            vb_addr_entry_wmb_write_req_hit_idx;   
wire            vb_addr_entry_wmb_write_req_hit_idx_x; 
wire    [2 :0]  vb_data_entry_id;                      
wire            vb_rcl_sm_addr_grnt;                   
wire            vb_rcl_sm_addr_grnt_x;                 
wire            vb_rcl_sm_done;                        
wire            vb_rcl_sm_done_x;                      
wire    [33:0]  wmb_vb_addr_tto6;                      
wire            wmb_vb_inv;                            
wire            wmb_vb_set_way_mode;                   
wire    [2 :0]  wmb_write_ptr_encode;                  
wire    [39:0]  wmb_write_req_addr;                    



//==========================================================
//                 Instance of Gated Cell  
//==========================================================
//-----------entry gateclk--------------
//normal gateclk ,open when create || entry_vld
assign vb_addr_entry_clk_en   = vb_addr_entry_vld
                                ||  vb_addr_entry_create_clk_en;
// &Instance("gated_clk_cell", "x_lsu_vb_addr_entry_gated_clk"); @39
gated_clk_cell  x_lsu_vb_addr_entry_gated_clk (
  .clk_in               (lsu_special_clk     ),
  .clk_out              (vb_addr_entry_clk   ),
  .external_en          (1'b0                ),
  .global_en            (cp0_yy_clk_en       ),
  .local_en             (vb_addr_entry_clk_en),
  .module_en            (cp0_lsu_icg_en      ),
  .pad_yy_icg_scan_en   (pad_yy_icg_scan_en  )
);

// &Connect(.clk_in        (lsu_special_clk     ), @40
//          .external_en   (1'b0               ), @41
//          .global_en     (cp0_yy_clk_en      ), @42
//          .module_en     (cp0_lsu_icg_en     ), @43
//          .local_en      (vb_addr_entry_clk_en), @44
//          .clk_out       (vb_addr_entry_clk  )); @45

//-----------create gateclk-------------
assign vb_addr_entry_create_clk_en  = vb_addr_entry_create_gateclk_en;
// &Instance("gated_clk_cell", "x_lsu_vb_addr_entry_create_gated_clk"); @49
gated_clk_cell  x_lsu_vb_addr_entry_create_gated_clk (
  .clk_in                      (lsu_special_clk            ),
  .clk_out                     (vb_addr_entry_create_clk   ),
  .external_en                 (1'b0                       ),
  .global_en                   (cp0_yy_clk_en              ),
  .local_en                    (vb_addr_entry_create_clk_en),
  .module_en                   (cp0_lsu_icg_en             ),
  .pad_yy_icg_scan_en          (pad_yy_icg_scan_en         )
);

// &Connect(.clk_in        (lsu_special_clk     ), @50
//          .external_en   (1'b0               ), @51
//          .global_en     (cp0_yy_clk_en      ), @52
//          .module_en     (cp0_lsu_icg_en     ), @53
//          .local_en      (vb_addr_entry_create_clk_en), @54
//          .clk_out       (vb_addr_entry_create_clk)); @55

//--------feedback gateclk--------------
assign vb_addr_entry_feedback_clk_en  = vb_addr_entry_feedback_vld
                                        ||  vb_addr_entry_create_clk_en;
// &Instance("gated_clk_cell", "x_lsu_vb_addr_entry_feedback_gated_clk"); @60
gated_clk_cell  x_lsu_vb_addr_entry_feedback_gated_clk (
  .clk_in                        (lsu_special_clk              ),
  .clk_out                       (vb_addr_entry_feedback_clk   ),
  .external_en                   (1'b0                         ),
  .global_en                     (cp0_yy_clk_en                ),
  .local_en                      (vb_addr_entry_feedback_clk_en),
  .module_en                     (cp0_lsu_icg_en               ),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           )
);

// &Connect(.clk_in        (lsu_special_clk     ), @61
//          .external_en   (1'b0               ), @62
//          .global_en     (cp0_yy_clk_en      ), @63
//          .module_en     (cp0_lsu_icg_en     ), @64
//          .local_en      (vb_addr_entry_feedback_clk_en), @65
//          .clk_out       (vb_addr_entry_feedback_clk)); @66

//==========================================================
//                 Register
//==========================================================
//+-----------+
//| entry_vld |
//+-----------+
always @(posedge vb_addr_entry_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    vb_addr_entry_vld              <=  1'b0;
  else if(vb_addr_entry_pop_vld)
    vb_addr_entry_vld              <=  1'b0;
  else if(vb_addr_entry_create_vld)
    vb_addr_entry_vld              <=  1'b1;
end

//+------+
//| addr |
//+------+
always @(posedge vb_addr_entry_feedback_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    vb_addr_entry_addr_tto6[`PA_WIDTH-7:8]   <=  {`PA_WIDTH-14{1'b0}};
  else if(vb_addr_entry_icc_create_dp_vld)
    vb_addr_entry_addr_tto6[`PA_WIDTH-7:8]   <=  icc_vb_addr_tto6[`PA_WIDTH-7:8];
  else if(vb_addr_entry_lfb_create_dp_vld)
    vb_addr_entry_addr_tto6[`PA_WIDTH-7:8]   <=  lfb_vb_addr_tto6[`PA_WIDTH-7:8];
  else if(vb_addr_entry_wmb_create_dp_vld)
    vb_addr_entry_addr_tto6[`PA_WIDTH-7:8]   <=  wmb_vb_addr_tto6[`PA_WIDTH-7:8];
  else if(vb_addr_entry_feedback_vld)
    vb_addr_entry_addr_tto6[`PA_WIDTH-7:8]   <=  st_da_vb_feedback_addr_tto14[`PA_WIDTH-15:0];
end

//+--------------+-----------+-----+------------+------------+--------+
//| set_way_mode | cache_way | inv | lfb_create | icc_create | lfb_id |
//+--------------+-----------+-----+------------+------------+--------+
always @(posedge vb_addr_entry_create_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
  begin
    vb_addr_entry_addr_tto6[7:0]    <=  8'b0;
    vb_addr_entry_set_way_mode      <=  1'b0;
    vb_addr_entry_inv               <=  1'b0;
    vb_addr_entry_wmb_create        <=  1'b0;
    vb_addr_entry_lfb_create        <=  1'b0;
    vb_addr_entry_source_id[2:0]    <=  3'b0;
  end
  else if(vb_addr_entry_icc_create_dp_vld)
  begin
    vb_addr_entry_addr_tto6[7:0]    <=  icc_vb_addr_tto6[7:0];
    vb_addr_entry_set_way_mode      <=  1'b1;
    vb_addr_entry_inv               <=  icc_vb_inv;
    vb_addr_entry_wmb_create        <=  1'b0;
    vb_addr_entry_lfb_create        <=  1'b0;
    vb_addr_entry_source_id[2:0]    <=  3'b0;
  end
  else if(vb_addr_entry_lfb_create_dp_vld)
  begin
    vb_addr_entry_addr_tto6[7:0]    <=  lfb_vb_addr_tto6[7:0];
    vb_addr_entry_set_way_mode      <=  1'b0;
    vb_addr_entry_inv               <=  1'b1;
    vb_addr_entry_wmb_create        <=  1'b0;
    vb_addr_entry_lfb_create        <=  1'b1;
    vb_addr_entry_source_id[2:0]    <=  lfb_vb_id[2:0];
  end
  else if(vb_addr_entry_wmb_create_dp_vld)
  begin
    vb_addr_entry_addr_tto6[7:0]    <=  wmb_vb_addr_tto6[7:0];
    vb_addr_entry_set_way_mode      <=  wmb_vb_set_way_mode;
    vb_addr_entry_inv               <=  wmb_vb_inv;
    vb_addr_entry_wmb_create        <=  1'b1;
    vb_addr_entry_lfb_create        <=  1'b0;
    vb_addr_entry_source_id[2:0]    <=  wmb_write_ptr_encode[2:0];
  end
end

always @(posedge vb_addr_entry_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    vb_addr_entry_rcl_sm_req_success  <=  1'b0;
  else if(vb_addr_entry_create_vld)
    vb_addr_entry_rcl_sm_req_success  <=  1'b0;
  else if(vb_rcl_sm_addr_grnt)
    vb_addr_entry_rcl_sm_req_success  <=  1'b1;
end

//rcl_done,for snq dep
always @(posedge vb_addr_entry_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    vb_addr_entry_rcl_done  <=  1'b0;
  else if(vb_addr_entry_create_vld)
    vb_addr_entry_rcl_done  <=  1'b0;
  else if(vb_rcl_sm_done)
    vb_addr_entry_rcl_done  <=  1'b1;
end

//record vb data has been pop
always @(posedge vb_addr_entry_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    vb_addr_entry_data_req_success  <=  1'b0;
  else if(vb_addr_entry_create_vld)
    vb_addr_entry_data_req_success  <=  1'b0;
  else if(vb_rcl_sm_done)
    vb_addr_entry_data_req_success  <=  evict_req_success;
  else if(vb_addr_data_pop)
    vb_addr_entry_data_req_success  <=  1'b1;
end

//data buffer id
always @(posedge vb_addr_entry_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    vb_addr_entry_db_id[2:0]  <=  3'b0;
  else if(vb_addr_entry_create_data)
    vb_addr_entry_db_id[2:0]  <=  vb_data_entry_id[2:0];
end
//==========================================================
//                Generate req/pop/resp signal
//==========================================================
assign vb_addr_entry_rcl_sm_req = vb_addr_entry_vld
                                  &&  !vb_addr_entry_rcl_sm_req_success;

assign vb_addr_entry_pop_vld    = vb_addr_entry_pop;

//for snq dep remove
assign vb_addr_entry_dep_remove = !vb_addr_entry_vld || vb_addr_entry_rcl_done;
//==========================================================
//                    Compare index
//==========================================================
//------------------compare rb_biu_req----------------------
assign vb_addr_entry_cmp_rb_biu_req_addr[`PA_WIDTH-1:0]  = rb_biu_req_addr[`PA_WIDTH-1:0];
assign vb_addr_entry_rb_biu_req_hit_idx = vb_addr_entry_vld
                                          &&  (vb_addr_entry_addr_tto6[7:0]
                                              ==  vb_addr_entry_cmp_rb_biu_req_addr[13:6]);
//------------------compare pfu pop entry-------------------
assign vb_addr_entry_cmp_pfu_biu_req_addr[`PA_WIDTH-1:0]  = pfu_biu_req_addr[`PA_WIDTH-1:0];
assign vb_addr_entry_pfu_biu_req_hit_idx  = vb_addr_entry_vld
                                            &&  (vb_addr_entry_addr_tto6[7:0]
                                                ==  vb_addr_entry_cmp_pfu_biu_req_addr[13:6]);
//------------------compare wmb addr ptr entry--------------
assign vb_addr_entry_cmp_wmb_write_req_addr[`PA_WIDTH-1:0]  = wmb_write_req_addr[`PA_WIDTH-1:0];
assign vb_addr_entry_wmb_write_req_hit_idx  = vb_addr_entry_vld
                                              &&  (vb_addr_entry_addr_tto6[7:0]
                                                  ==  vb_addr_entry_cmp_wmb_write_req_addr[13:6]);
//------------------compare lfb vb req addr-----------------
assign vb_addr_entry_cmp_lfb_vb_addr_tto6[`PA_WIDTH-7:0]  = lfb_vb_addr_tto6[`PA_WIDTH-7:0];
assign vb_addr_entry_lfb_vb_req_hit_idx   = vb_addr_entry_vld
                                            &&  (vb_addr_entry_addr_tto6[7:0]
                                                ==  vb_addr_entry_cmp_lfb_vb_addr_tto6[7:0]);
//---------------compare snq create req addr----------------
assign vb_addr_entry_cmp_snq_create_addr[`PA_WIDTH-1:0]  = snq_create_addr[`PA_WIDTH-1:0];
assign vb_addr_entry_snq_create_hit_idx   = vb_addr_entry_vld
                                            &&  !vb_addr_entry_rcl_done
                                            &&  (vb_addr_entry_addr_tto6[7:0]
                                                ==  vb_addr_entry_cmp_snq_create_addr[13:6]);
//---------------compare snq bypass req addr----------------
assign vb_addr_entry_cmp_snq_bypass_addr_tto6[`PA_WIDTH-7:0]  = snq_bypass_addr_tto6[`PA_WIDTH-7:0];
assign snq_bypass_addr_hit = (vb_addr_entry_addr_tto6[`PA_WIDTH-7:0]
                              ==  vb_addr_entry_cmp_snq_bypass_addr_tto6[`PA_WIDTH-7:0]);

assign vb_addr_entry_snq_bypass_hit       = vb_addr_entry_vld
                                            &&  vb_addr_entry_rcl_done
                                            &&  !vb_addr_entry_data_req_success
                                            &&  snq_bypass_addr_hit;
//---------------compare snq start req addr----------------
assign vb_addr_entry_snq_start_wait       = vb_addr_entry_vld
                                            &&  vb_addr_entry_data_req_success
                                            &&  snq_bypass_addr_hit;

//==========================================================
//                 Generate interface
//==========================================================
//------------------input-----------------------------------
//-----------create signal--------------
assign vb_addr_entry_create_vld               = vb_addr_entry_create_vld_x;
assign vb_addr_entry_icc_create_dp_vld        = vb_addr_entry_icc_create_dp_vld_x;
assign vb_addr_entry_lfb_create_dp_vld        = vb_addr_entry_lfb_create_dp_vld_x;
assign vb_addr_entry_wmb_create_dp_vld        = vb_addr_entry_wmb_create_dp_vld_x;
assign vb_addr_entry_create_gateclk_en        = vb_addr_entry_create_gateclk_en_x;
//-----------grnt signal----------------
assign vb_rcl_sm_addr_grnt                    = vb_rcl_sm_addr_grnt_x;
//-----------other signal---------------
//assign vb_addr_entry_b_resp                   = vb_addr_entry_b_resp_x;
assign vb_addr_entry_feedback_vld             = vb_addr_entry_feedback_vld_x;
//assign vb_rcl_sm_addr_pop_req                 = vb_rcl_sm_addr_pop_req_x;
assign vb_rcl_sm_done                         = vb_rcl_sm_done_x;
assign vb_addr_entry_create_data              = vb_addr_entry_create_data_x;
//assign vb_addr_bypass_pop                     = vb_addr_entry_bypass_pop_x;
assign vb_addr_entry_pop                      = vb_addr_entry_pop_x;
assign vb_addr_data_pop                       = vb_addr_entry_data_pop_x;
//------------------output----------------------------------
//-----------entry signal---------------
assign vb_addr_entry_vld_x                    = vb_addr_entry_vld;
assign vb_addr_entry_addr_tto6_v[`PA_WIDTH-7:0] = vb_addr_entry_addr_tto6[`PA_WIDTH-7:0];
assign vb_addr_entry_set_way_mode_x           = vb_addr_entry_set_way_mode;
assign vb_addr_entry_inv_x                    = vb_addr_entry_inv;
assign vb_addr_entry_lfb_create_x             = vb_addr_entry_lfb_create;
assign vb_addr_entry_wmb_create_x             = vb_addr_entry_wmb_create;
assign vb_addr_entry_source_id_v[2:0]         = vb_addr_entry_source_id[2:0];
assign vb_addr_entry_db_id_v[2:0]             = vb_addr_entry_db_id[2:0];

assign vb_addr_entry_dep_remove_x             = vb_addr_entry_dep_remove;
//-----------request--------------------
assign vb_addr_entry_rcl_sm_req_x             = vb_addr_entry_rcl_sm_req;
//-----------hit idx--------------------
assign vb_addr_entry_rb_biu_req_hit_idx_x     = vb_addr_entry_rb_biu_req_hit_idx;
assign vb_addr_entry_pfu_biu_req_hit_idx_x    = vb_addr_entry_pfu_biu_req_hit_idx;
assign vb_addr_entry_wmb_write_req_hit_idx_x  = vb_addr_entry_wmb_write_req_hit_idx;
assign vb_addr_entry_lfb_vb_req_hit_idx_x     = vb_addr_entry_lfb_vb_req_hit_idx;
assign vb_addr_entry_snq_create_hit_idx_x     = vb_addr_entry_snq_create_hit_idx;
assign vb_addr_entry_snq_start_wait_x         = vb_addr_entry_snq_start_wait;
assign vb_addr_entry_snq_bypass_hit_x         = vb_addr_entry_snq_bypass_hit;

// &ModuleEnd; @283
endmodule


