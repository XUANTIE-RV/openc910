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

// &ModuleBeg; @20
module ct_l2c_wb(
  cmp_rfifo_cp,
  cmp_rfifo_create,
  cmp_rfifo_resp,
  cmp_rfifo_sid,
  cmp_stage_vld,
  cpurst_b,
  data_stage_cp,
  data_stage_resp,
  data_stage_sid,
  data_stage_vld,
  data_yy_flop_vld,
  forever_cpuclk,
  l2c_ciu_cmplt_x,
  l2c_ciu_cp_x,
  l2c_ciu_data_x,
  l2c_ciu_resp_x,
  l2c_ciu_sid_x,
  l2c_clk,
  l2c_data_dout_flop,
  l2c_icg_en,
  l2c_pipeline_rdy,
  pad_yy_icg_scan_en,
  rfifo_empty,
  tag_stage_vld,
  wb_dirty_cen,
  wb_dirty_gwen,
  wb_dirty_way,
  wb_dirty_wen,
  wb_ecc_rfifo_empty,
  wb_stage_fatal_err,
  wb_stage_vld,
  wb_tag_cen,
  wb_tag_gwen,
  wb_tag_index,
  wb_tag_req
);

// &Ports; @21
input   [3  :0]  cmp_rfifo_cp;           
input            cmp_rfifo_create;       
input   [4  :0]  cmp_rfifo_resp;         
input   [4  :0]  cmp_rfifo_sid;          
input            cmp_stage_vld;          
input            cpurst_b;               
input   [3  :0]  data_stage_cp;          
input   [4  :0]  data_stage_resp;        
input   [4  :0]  data_stage_sid;         
input            data_stage_vld;         
input            data_yy_flop_vld;       
input            forever_cpuclk;         
input            l2c_clk;                
input   [511:0]  l2c_data_dout_flop;     
input            l2c_icg_en;             
input            pad_yy_icg_scan_en;     
input            tag_stage_vld;          
output           l2c_ciu_cmplt_x;        
output  [3  :0]  l2c_ciu_cp_x;           
output  [511:0]  l2c_ciu_data_x;         
output  [4  :0]  l2c_ciu_resp_x;         
output  [4  :0]  l2c_ciu_sid_x;          
output           l2c_pipeline_rdy;       
output           rfifo_empty;            
output           wb_dirty_cen;           
output           wb_dirty_gwen;          
output  [15 :0]  wb_dirty_way;           
output  [8  :0]  wb_dirty_wen;           
output           wb_ecc_rfifo_empty;     
output           wb_stage_fatal_err;     
output           wb_stage_vld;           
output           wb_tag_cen;             
output           wb_tag_gwen;            
output  [8  :0]  wb_tag_index;           
output           wb_tag_req;             

// &Regs; @22
reg     [3  :0]  wb_stage_cp;            
reg     [4  :0]  wb_stage_resp;          
reg     [4  :0]  wb_stage_sid;           
reg              wb_stage_vld;           

// &Wires; @23
wire    [3  :0]  cmp_rfifo_cp;           
wire             cmp_rfifo_create;       
wire    [4  :0]  cmp_rfifo_resp;         
wire    [4  :0]  cmp_rfifo_sid;          
wire             cmp_stage_vld;          
wire             cpurst_b;               
wire    [3  :0]  data_stage_cp;          
wire    [4  :0]  data_stage_resp;        
wire    [4  :0]  data_stage_sid;         
wire             data_stage_vld;         
wire             data_yy_flop_vld;       
wire    [3  :0]  fl_ecc_stage_cp;        
wire    [4  :0]  fl_ecc_stage_resp;      
wire    [4  :0]  fl_ecc_stage_sid;       
wire             forever_cpuclk;         
wire             l2c_ciu_cmplt_x;        
wire    [3  :0]  l2c_ciu_cp_x;           
wire    [511:0]  l2c_ciu_data_x;         
wire    [4  :0]  l2c_ciu_resp_x;         
wire    [4  :0]  l2c_ciu_sid_x;          
wire             l2c_clk;                
wire    [511:0]  l2c_data_dout_flop;     
wire             l2c_icg_en;             
wire             l2c_pipeline_rdy;       
wire             pad_yy_icg_scan_en;     
wire    [13 :0]  rfifo_create_bus;       
wire             rfifo_create_en;        
wire             rfifo_create_en_dp;     
wire             rfifo_empty;            
wire    [13 :0]  rfifo_pop_bus;          
wire             rfifo_pop_bus_vld;      
wire             rfifo_pop_en;           
wire    [3  :0]  rfifo_pop_entry_cp;     
wire    [4  :0]  rfifo_pop_entry_resp;   
wire    [4  :0]  rfifo_pop_entry_sid;    
wire             rfifo_pop_entry_vld;    
wire             tag_stage_vld;          
wire             wb_dirty_cen;           
wire             wb_dirty_gwen;          
wire    [15 :0]  wb_dirty_way;           
wire    [8  :0]  wb_dirty_wen;           
wire             wb_dp_clk;              
wire             wb_dp_clk_en;           
wire             wb_ecc_rfifo_empty;     
wire             wb_flop_vld;            
wire    [511:0]  wb_stage_data;          
wire             wb_stage_fatal_err;     
wire    [4  :0]  wb_stage_resp_after_ecc; 
wire             wb_tag_cen;             
wire             wb_tag_gwen;            
wire    [8  :0]  wb_tag_index;           
wire             wb_tag_req;             


parameter TAG_INDEX_LENTH = `L2C_TAG_INDEX_WIDTH;
parameter DATA_INDEX_LENTH = `L2C_DATA_INDEX_WIDTH;

// &Force("output","wb_stage_vld"); @28
// &Force("output","wb_stage_fatal_err"); @29
// &Force("output","wb_ecc_rfifo_empty"); @30

assign wb_flop_vld            = data_yy_flop_vld;
assign fl_ecc_stage_sid[4:0]  = data_stage_sid[4:0];
assign fl_ecc_stage_resp[4:0] = data_stage_resp[4:0];
assign fl_ecc_stage_cp[3:0]   = data_stage_cp[3:0];
assign l2c_pipeline_rdy       = !tag_stage_vld && !cmp_stage_vld && 
                                !data_stage_vld && !wb_stage_vld && rfifo_empty && wb_ecc_rfifo_empty;

//==============================================================================
//                               WB STAGE DATAPATH
//==============================================================================
assign wb_dp_clk_en = wb_flop_vld;
// &Instance("gated_clk_cell", "x_l2c_wb_dp_gated_clk"); @57
gated_clk_cell  x_l2c_wb_dp_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (wb_dp_clk         ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (wb_dp_clk_en      ),
  .module_en          (l2c_icg_en        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in        (forever_cpuclk     ), @58
//          .external_en   (1'b0               ), @59
//          .global_en     (1'b1               ), @60
//          .module_en     (l2c_icg_en         ), @61
//          .local_en      (wb_dp_clk_en       ), @62
//          .clk_out       (wb_dp_clk          ) @63
//         ); @64

always@(posedge l2c_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    wb_stage_vld        <= 1'b0;
  else if(wb_flop_vld)
    wb_stage_vld        <= 1'b1;
  else
    wb_stage_vld        <= 1'b0;
end

always@(posedge wb_dp_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
  begin
    wb_stage_sid[4:0]      <= 5'b0;
    wb_stage_resp[4:0]     <= 5'b0;
    wb_stage_cp[3:0]       <= 4'b0;
  end
  else if(wb_flop_vld)
  begin
    wb_stage_sid[4:0]      <= fl_ecc_stage_sid[4:0];
    wb_stage_resp[4:0]     <= fl_ecc_stage_resp[4:0];
    wb_stage_cp[3:0]       <= fl_ecc_stage_cp[3:0];
  end
end


assign wb_stage_data[511:0] = l2c_data_dout_flop[511:0];
assign wb_stage_fatal_err   = 1'b0;
assign wb_stage_resp_after_ecc[4:0] = wb_stage_resp[4:0] | {3'b0,wb_stage_fatal_err,1'b0};

//==============================================================================
//                            RFIFO
//==============================================================================
// &Force("nonport", "rfifo_create_en"); @124
// &Force("nonport", "rfifo_create_en_dp"); @125
// &Force("nonport", "rfifo_create_bus"); @126
// &Force("nonport", "rfifo_pop_en"); @127
// &Force("nonport", "rfifo_pop_bus"); @128
// &Force("nonport", "rfifo_pop_bus_vld"); @129
// &Force("nonport", "rfifo_full"); @130
// &Force("output", "rfifo_empty"); @131

assign rfifo_create_en    = cmp_rfifo_create;
assign rfifo_create_en_dp = cmp_rfifo_create;

assign rfifo_pop_en       = !wb_stage_vld && rfifo_pop_entry_vld;

assign rfifo_create_bus[13:0] = {cmp_rfifo_resp[4:0],
                                 cmp_rfifo_cp[3:0],
                                 cmp_rfifo_sid[4:0]};

ct_fifo #(.WIDTH(14), .DEPTH(3), .PTR_W(2)) x_ct_l2c_resp_rfifo(
  .clk                 (forever_cpuclk      ),
  .rst_b               (cpurst_b            ),
  .fifo_create_en      (rfifo_create_en     ),
  .fifo_create_en_dp   (rfifo_create_en_dp  ),
  .fifo_pop_en         (rfifo_pop_en        ),
  .fifo_create_data    (rfifo_create_bus    ),
  .fifo_pop_data       (rfifo_pop_bus       ),
  .fifo_pop_data_vld   (rfifo_pop_bus_vld   ),
  .fifo_full           (rfifo_full          ),
  .fifo_empty          (rfifo_empty         ),
  .pad_yy_icg_scan_en(pad_yy_icg_scan_en),
  .fifo_icg_en         (l2c_icg_en          )
);

assign rfifo_pop_entry_vld       = rfifo_pop_bus_vld;
assign rfifo_pop_entry_resp[4:0] = rfifo_pop_bus[13:9];
assign rfifo_pop_entry_cp[3:0]   = rfifo_pop_bus[8:5];
assign rfifo_pop_entry_sid[4:0]  = rfifo_pop_bus[4:0];

//==============================================================================
//                         output to CIU
//==============================================================================

assign l2c_ciu_cmplt_x       = wb_stage_vld | rfifo_pop_en;
assign l2c_ciu_resp_x[4:0]   = wb_stage_vld ? wb_stage_resp_after_ecc[4:0] : rfifo_pop_entry_resp[4:0];
assign l2c_ciu_cp_x[3:0]     = wb_stage_vld ? wb_stage_cp[3:0] : rfifo_pop_entry_cp[3:0];
assign l2c_ciu_sid_x[4:0]    = wb_stage_vld ? wb_stage_sid[4:0] : rfifo_pop_entry_sid[4:0];
assign l2c_ciu_data_x[511:0] = wb_stage_data[511:0];

// &Instance("ct_l2c_wb_sw_fmt", "x_ct_l2c_wb_sw_fmt"); @181
// &Connect(.l2c_ciu_ecc_set_way_x   (l2c_ciu_data_ecc_set_way_x), @182
//          .l2c_wb_stage_set_way    (wb_icc_set_way)); @183
// &Instance("gated_clk_cell", "x_ecc_rfifo_gated_clk"); @191
// &Connect(.clk_in        (forever_cpuclk     ), @192
//          .external_en   (1'b0               ), @193
//          .global_en     (1'b1               ), @194
//          .module_en     (l2c_icg_en         ), @195
//          .local_en      (ecc_rfifo_clk_en   ), @196
//          .clk_out       (ecc_rfifo_clk      ) @197
//         ); @198
// &Force("output","wb_dirty_cen"); @199
// &ConnRule(s/^x_/entry0_/); @201
// &ConnRule(s/_x$/[0]/); @202
// &Instance("ct_l2c_ecc_rfifo_entry", "x_ct_l2c_ecc_rfifo_entry0"); @203
// &ConnRule(s/^x_/entry1_/); @204
// &ConnRule(s/_x$/[1]/); @205
// &Instance("ct_l2c_ecc_rfifo_entry", "x_ct_l2c_ecc_rfifo_entry1"); @206
// &ConnRule(s/^x_/entry2_/); @207
// &ConnRule(s/_x$/[2]/); @208
// &Instance("ct_l2c_ecc_rfifo_entry", "x_ct_l2c_ecc_rfifo_entry2"); @209
// &ConnRule(s/^x_/entry3_/); @210
// &ConnRule(s/_x$/[3]/); @211
// &Instance("ct_l2c_ecc_rfifo_entry", "x_ct_l2c_ecc_rfifo_entry3"); @212
// &ConnRule(s/^x_/entry4_/); @213
// &ConnRule(s/_x$/[4]/); @214
// &Instance("ct_l2c_ecc_rfifo_entry", "x_ct_l2c_ecc_rfifo_entry4"); @215
// &ConnRule(s/^x_/entry5_/); @216
// &ConnRule(s/_x$/[5]/); @217
// &Instance("ct_l2c_ecc_rfifo_entry", "x_ct_l2c_ecc_rfifo_entry5"); @218
// &CombBeg; @267
// &CombEnd; @277
assign wb_tag_req         = 1'b0;
assign wb_tag_cen         = 1'b0;
assign wb_tag_gwen        = 1'b0;
assign wb_dirty_gwen      = 1'b0;
assign wb_dirty_cen       = 1'b0;
assign wb_ecc_rfifo_empty = 1'b1;
assign wb_dirty_wen[8:0]  = 9'b0;
assign wb_tag_index[TAG_INDEX_LENTH-1:0] = {TAG_INDEX_LENTH{1'b0}};
assign wb_dirty_way[15:0] = 16'b0;

// &Force("nonport","rfifo_create_when_full"); @314
// &Force("nonport","ecc_rfifo_full"); @323

// &ModuleEnd; @333
endmodule


