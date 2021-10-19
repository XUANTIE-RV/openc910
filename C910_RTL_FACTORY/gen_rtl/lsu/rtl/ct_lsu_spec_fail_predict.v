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

// &ModuleBeg; @24
module ct_lsu_spec_fail_predict(
  cp0_lsu_icg_en,
  cpurst_b,
  forever_cpuclk,
  ld_da_sf_addr_tto4,
  ld_da_sf_bytes_vld,
  ld_da_sf_spec_chk_req,
  pad_yy_icg_scan_en,
  rtu_lsu_spec_fail_flush,
  rtu_lsu_spec_fail_iid,
  rtu_yy_xx_flush,
  sf_spec_hit,
  sf_spec_mark,
  st_da_sf_addr_tto4,
  st_da_sf_bytes_vld,
  st_da_sf_iid,
  st_da_sf_no_spec_miss,
  st_da_sf_no_spec_miss_gate,
  st_da_sf_spec_chk,
  st_da_sf_spec_chk_gate
);

// &Ports; @25
input           cp0_lsu_icg_en;                     
input           cpurst_b;                           
input           forever_cpuclk;                     
input   [35:0]  ld_da_sf_addr_tto4;                 
input   [15:0]  ld_da_sf_bytes_vld;                 
input           ld_da_sf_spec_chk_req;              
input           pad_yy_icg_scan_en;                 
input           rtu_lsu_spec_fail_flush;            
input   [6 :0]  rtu_lsu_spec_fail_iid;              
input           rtu_yy_xx_flush;                    
input   [35:0]  st_da_sf_addr_tto4;                 
input   [15:0]  st_da_sf_bytes_vld;                 
input   [6 :0]  st_da_sf_iid;                       
input           st_da_sf_no_spec_miss;              
input           st_da_sf_no_spec_miss_gate;         
input           st_da_sf_spec_chk;                  
input           st_da_sf_spec_chk_gate;             
output          sf_spec_hit;                        
output          sf_spec_mark;                       

// &Regs; @26
reg     [15:0]  sf_mispred_chk_bytes_vld;           
reg     [3 :0]  sf_mispred_chk_clr_counter;         
reg     [35:0]  sf_mispred_chk_st_addr_tto4;        
reg     [6 :0]  sf_mispred_chk_st_iid;              
reg             sf_mispred_chk_vld;                 
reg     [3 :0]  sf_start_clr_counter;               
reg             sf_start_pre;                       
reg     [35:0]  sf_start_st_addr_tto4;              
reg     [15:0]  sf_start_st_bytes_vld;              
reg     [6 :0]  sf_start_st_iid;                    
reg             sf_start_vld;                       

// &Wires; @27
wire            cp0_lsu_icg_en;                     
wire            cpurst_b;                           
wire            forever_cpuclk;                     
wire    [35:0]  ld_da_sf_addr_tto4;                 
wire    [15:0]  ld_da_sf_bytes_vld;                 
wire            ld_da_sf_spec_chk_req;              
wire            ld_hit_sf_mispred_chk;              
wire            ld_hit_sf_start;                    
wire            ld_mark_clr;                        
wire            ld_spec_hit_clr;                    
wire            pad_yy_icg_scan_en;                 
wire            rtu_lsu_spec_fail_flush;            
wire    [6 :0]  rtu_lsu_spec_fail_iid;              
wire            rtu_yy_xx_flush;                    
wire            sf_clk;                             
wire            sf_clk_en;                          
wire            sf_mispred_chk_abnormal_clr;        
wire            sf_mispred_chk_clr_counter_max;     
wire            sf_mispred_chk_iid_newer_than_st_da; 
wire            sf_mispred_chk_info_up;             
wire            sf_mispred_chk_start;               
wire            sf_pred_chk_dp_clk;                 
wire            sf_pred_chk_dp_clk_en;              
wire            sf_spec_hit;                        
wire            sf_spec_mark;                       
wire            sf_start_abnormal_clr;              
wire            sf_start_clr_counter_max;           
wire            sf_start_dp_clk;                    
wire            sf_start_dp_clk_en;                 
wire            sf_start_iid_hit;                   
wire            sf_start_iid_newer_than_st_da;      
wire            sf_start_info_up;                   
wire            sf_start_success;                   
wire    [35:0]  st_da_sf_addr_tto4;                 
wire    [15:0]  st_da_sf_bytes_vld;                 
wire    [6 :0]  st_da_sf_iid;                       
wire            st_da_sf_no_spec_miss;              
wire            st_da_sf_no_spec_miss_gate;         
wire            st_da_sf_spec_chk;                  
wire            st_da_sf_spec_chk_gate;             


//==========================================================
//                 Instance of Gated Cell
//==========================================================
assign sf_clk_en  = sf_start_pre
                    || sf_start_vld
                    || sf_mispred_chk_vld
                    || st_da_sf_no_spec_miss_gate
                    || st_da_sf_spec_chk_gate
                    || rtu_yy_xx_flush;
// &Instance("gated_clk_cell", "x_lsu_sf_gated_clk"); @38
gated_clk_cell  x_lsu_sf_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (sf_clk            ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (sf_clk_en         ),
  .module_en          (cp0_lsu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in        (forever_cpuclk        ), @39
//          .external_en   (1'b0                  ), @40
//          .global_en     (1'b1                  ), @41
//          .module_en     (cp0_lsu_icg_en        ), @42
//          .local_en      (sf_clk_en             ), @43
//          .clk_out       (sf_clk                )); @44

assign sf_start_dp_clk_en  = st_da_sf_no_spec_miss_gate; 
// &Instance("gated_clk_cell", "x_lsu_sf_start_dp_gated_clk"); @47
gated_clk_cell  x_lsu_sf_start_dp_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (sf_start_dp_clk   ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (sf_start_dp_clk_en),
  .module_en          (cp0_lsu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in        (forever_cpuclk        ), @48
//          .external_en   (1'b0                  ), @49
//          .global_en     (1'b1                  ), @50
//          .module_en     (cp0_lsu_icg_en        ), @51
//          .local_en      (sf_start_dp_clk_en    ), @52
//          .clk_out       (sf_start_dp_clk       )); @53

assign sf_pred_chk_dp_clk_en  = st_da_sf_spec_chk_gate; 
// &Instance("gated_clk_cell", "x_lsu_sf_pred_chk_dp_gated_clk"); @56
gated_clk_cell  x_lsu_sf_pred_chk_dp_gated_clk (
  .clk_in                (forever_cpuclk       ),
  .clk_out               (sf_pred_chk_dp_clk   ),
  .external_en           (1'b0                 ),
  .global_en             (1'b1                 ),
  .local_en              (sf_pred_chk_dp_clk_en),
  .module_en             (cp0_lsu_icg_en       ),
  .pad_yy_icg_scan_en    (pad_yy_icg_scan_en   )
);

// &Connect(.clk_in        (forever_cpuclk        ), @57
//          .external_en   (1'b0                  ), @58
//          .global_en     (1'b1                  ), @59
//          .module_en     (cp0_lsu_icg_en        ), @60
//          .local_en      (sf_pred_chk_dp_clk_en ), @61
//          .clk_out       (sf_pred_chk_dp_clk    )); @62
//==========================================================
//                      Registers
//==========================================================
//---------------for spec fail prediction start------------// 
always @(posedge sf_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    sf_start_pre  <=  1'b0;
  else if(rtu_yy_xx_flush)
    sf_start_pre  <=  1'b0;
  else if(sf_start_info_up)
    sf_start_pre  <=  1'b1;
end

always @(posedge sf_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    sf_start_vld  <=  1'b0;
  else if(sf_start_success)
    sf_start_vld  <=  1'b1;
  else if(ld_mark_clr || sf_start_abnormal_clr)
    sf_start_vld  <=  1'b0;
end

always @(posedge sf_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    sf_start_clr_counter[3:0]  <=  4'b0;
  else if(sf_start_success)
    sf_start_clr_counter[3:0]  <=  4'b0;
  else if(sf_start_vld && ld_da_sf_spec_chk_req)
    sf_start_clr_counter[3:0]  <=  sf_start_clr_counter[3:0] + 4'h1;
end

always @(posedge sf_start_dp_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
  begin
    sf_start_st_addr_tto4[`PA_WIDTH-5:0]  <=  {`PA_WIDTH-4{1'b0}};
    sf_start_st_iid[6:0]                  <=  7'b0;
    sf_start_st_bytes_vld[15:0]           <=  16'b0;
  end
  else if(sf_start_info_up)
  begin
    sf_start_st_addr_tto4[`PA_WIDTH-5:0]  <=  st_da_sf_addr_tto4[`PA_WIDTH-5:0];
    sf_start_st_iid[6:0]                  <=  st_da_sf_iid[6:0];
    sf_start_st_bytes_vld[15:0]           <=  st_da_sf_bytes_vld[15:0];
  end
end

//---------------for spec fail misprediction check------------// 
always @(posedge sf_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    sf_mispred_chk_vld  <=  1'b0;
  else if(sf_mispred_chk_start)
    sf_mispred_chk_vld  <=  1'b1;
  else if(ld_spec_hit_clr || sf_mispred_chk_abnormal_clr)
    sf_mispred_chk_vld  <=  1'b0;
end

always @(posedge sf_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    sf_mispred_chk_clr_counter[3:0]  <=  4'b0;
  else if(sf_mispred_chk_start)
    sf_mispred_chk_clr_counter[3:0]  <=  4'b0;
  else if(sf_mispred_chk_vld && ld_da_sf_spec_chk_req)
    sf_mispred_chk_clr_counter[3:0]  <=  sf_mispred_chk_clr_counter[3:0] + 4'h1;
end

always @(posedge sf_pred_chk_dp_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
  begin
    sf_mispred_chk_st_addr_tto4[`PA_WIDTH-5:0]  <=  {`PA_WIDTH-4{1'b0}};
    sf_mispred_chk_st_iid[6:0]                  <=  7'b0;
    sf_mispred_chk_bytes_vld[15:0]              <=  16'b0;
  end
  else if(sf_mispred_chk_info_up)
  begin
    sf_mispred_chk_st_addr_tto4[`PA_WIDTH-5:0]  <=  st_da_sf_addr_tto4[`PA_WIDTH-5:0];
    sf_mispred_chk_st_iid[6:0]                  <=  st_da_sf_iid[6:0];
    sf_mispred_chk_bytes_vld[15:0]              <=  st_da_sf_bytes_vld[15:0];
  end
end

//==========================================================
//                      control logic
//==========================================================
//---------------for spec fail prediction start------------// 
//iid compare
// &Instance("ct_rtu_compare_iid","x_lsu_sf_start_compare_iid"); @155
ct_rtu_compare_iid  x_lsu_sf_start_compare_iid (
  .x_iid0                        (st_da_sf_iid[6:0]            ),
  .x_iid0_older                  (sf_start_iid_newer_than_st_da),
  .x_iid1                        (sf_start_st_iid[6:0]         )
);

// &Connect( .x_iid0         (st_da_sf_iid[6:0]       ), @156
//           .x_iid1         (sf_start_st_iid[6:0]    ), @157
//           .x_iid0_older   (sf_start_iid_newer_than_st_da)); @158

assign sf_start_info_up = st_da_sf_no_spec_miss
                          && !sf_start_vld
                          && (!sf_start_pre || sf_start_iid_newer_than_st_da);

//commit check (iid)
assign sf_start_iid_hit = (sf_start_st_iid[6:0] == rtu_lsu_spec_fail_iid[6:0]);

//sf_start_check
assign sf_start_success = sf_start_pre
                          && sf_start_iid_hit
                          && rtu_lsu_spec_fail_flush
                          && rtu_yy_xx_flush;

//mark ld
assign ld_hit_sf_start  = sf_start_vld
                          && (ld_da_sf_addr_tto4[`PA_WIDTH-5:0] == sf_start_st_addr_tto4[`PA_WIDTH-5:0])
                          && |(ld_da_sf_bytes_vld[15:0] & sf_start_st_bytes_vld[15:0]);

assign ld_mark_clr =  ld_da_sf_spec_chk_req
                      && ld_hit_sf_start;

assign sf_spec_mark = ld_hit_sf_start; 

//abnormal clr
assign sf_start_clr_counter_max = (sf_start_clr_counter[3:0] == 4'd12);
assign sf_start_abnormal_clr    =  sf_start_clr_counter_max
                                   || rtu_yy_xx_flush;
//---------------for spec fail misprediction check------------//
//iid compare
// &Instance("ct_rtu_compare_iid","x_lsu_sf_mispred_chk_compare_iid"); @189
ct_rtu_compare_iid  x_lsu_sf_mispred_chk_compare_iid (
  .x_iid0                              (st_da_sf_iid[6:0]                  ),
  .x_iid0_older                        (sf_mispred_chk_iid_newer_than_st_da),
  .x_iid1                              (sf_mispred_chk_st_iid[6:0]         )
);

// &Connect( .x_iid0         (st_da_sf_iid[6:0]       ), @190
//           .x_iid1         (sf_mispred_chk_st_iid[6:0]    ), @191
//           .x_iid0_older   (sf_mispred_chk_iid_newer_than_st_da)); @192

assign sf_mispred_chk_info_up = st_da_sf_spec_chk
                                && (!sf_mispred_chk_vld || sf_mispred_chk_iid_newer_than_st_da);

assign sf_mispred_chk_start = sf_mispred_chk_info_up;

//ld check
assign ld_hit_sf_mispred_chk  = sf_mispred_chk_vld
                                && (ld_da_sf_addr_tto4[`PA_WIDTH-5:0] == sf_mispred_chk_st_addr_tto4[`PA_WIDTH-5:0])
                                && |(ld_da_sf_bytes_vld[15:0] & sf_mispred_chk_bytes_vld[15:0]);

assign ld_spec_hit_clr =  ld_da_sf_spec_chk_req
                          && ld_hit_sf_mispred_chk;

assign sf_spec_hit = ld_hit_sf_mispred_chk; 

//abnormal clr
assign sf_mispred_chk_clr_counter_max = (sf_mispred_chk_clr_counter[3:0] == 4'd12);
assign sf_mispred_chk_abnormal_clr    =  sf_mispred_chk_clr_counter_max
                                         || rtu_yy_xx_flush;
 
// &ModuleEnd; @214
endmodule


