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

// &ModuleBeg; @25
module ct_lsu_cache_buffer(
  cb_ld_da_data,
  cb_ld_da_data_vld,
  cb_ld_dc_addr_hit,
  cp0_lsu_cb_aclr_dis,
  cp0_lsu_dcache_en,
  cp0_lsu_icg_en,
  cp0_lsu_no_op_req,
  cp0_yy_clk_en,
  cpurst_b,
  dcache_idx,
  forever_cpuclk,
  icc_idle,
  ld_da_cb_data,
  ld_da_cb_data_vld,
  ld_da_cb_ecc_cancel,
  ld_da_cb_ld_inst_vld,
  ld_dc_addr1,
  ld_dc_cb_addr_create_gateclk_en,
  ld_dc_cb_addr_create_vld,
  ld_dc_cb_addr_tto4,
  lsu_dcache_ld_xx_gwen,
  pad_yy_icg_scan_en
);

// &Ports; @26
input            cp0_lsu_cb_aclr_dis;            
input            cp0_lsu_dcache_en;              
input            cp0_lsu_icg_en;                 
input            cp0_lsu_no_op_req;              
input            cp0_yy_clk_en;                  
input            cpurst_b;                       
input   [8  :0]  dcache_idx;                     
input            forever_cpuclk;                 
input            icc_idle;                       
input   [127:0]  ld_da_cb_data;                  
input            ld_da_cb_data_vld;              
input            ld_da_cb_ecc_cancel;            
input            ld_da_cb_ld_inst_vld;           
input   [39 :0]  ld_dc_addr1;                    
input            ld_dc_cb_addr_create_gateclk_en; 
input            ld_dc_cb_addr_create_vld;       
input   [35 :0]  ld_dc_cb_addr_tto4;             
input            lsu_dcache_ld_xx_gwen;          
input            pad_yy_icg_scan_en;             
output  [127:0]  cb_ld_da_data;                  
output           cb_ld_da_data_vld;              
output           cb_ld_dc_addr_hit;              

// &Regs; @27
reg     [35 :0]  cb_addr_tto4;                   
reg     [127:0]  cb_data;                        
reg              cb_vld;                         

// &Wires; @28
wire             cb_addr_clk;                    
wire             cb_addr_clk_en;                 
wire             cb_addr_create_gateclk_en;      
wire             cb_addr_create_vld;             
wire             cb_addr_hit_idx;                
wire    [39 :0]  cb_cmp_ld_dc_addr1;             
wire             cb_create_vld;                  
wire             cb_data_clk;                    
wire             cb_data_clk_en;                 
wire             cb_data_create_vld;             
wire    [127:0]  cb_ld_da_data;                  
wire             cb_ld_da_data_vld;              
wire             cb_ld_dc_addr_hit;              
wire             cb_pop_vld;                     
wire             cp0_lsu_cb_aclr_dis;            
wire             cp0_lsu_dcache_en;              
wire             cp0_lsu_icg_en;                 
wire             cp0_lsu_no_op_req;              
wire             cp0_yy_clk_en;                  
wire             cpurst_b;                       
wire    [8  :0]  dcache_idx;                     
wire             forever_cpuclk;                 
wire             icc_idle;                       
wire    [127:0]  ld_da_cb_data;                  
wire             ld_da_cb_data_vld;              
wire             ld_da_cb_ecc_cancel;            
wire             ld_da_cb_ld_inst_vld;           
wire    [39 :0]  ld_dc_addr1;                    
wire             ld_dc_cb_addr_create_gateclk_en; 
wire             ld_dc_cb_addr_create_vld;       
wire    [35 :0]  ld_dc_cb_addr_tto4;             
wire             lsu_dcache_ld_xx_gwen;          
wire             pad_yy_icg_scan_en;             

//==========================================================
//                 Instance of Gated Cell  
//==========================================================
assign cb_addr_clk_en  = cb_addr_create_gateclk_en;
// &Instance("gated_clk_cell", "x_lsu_cb_addr_gated_clk"); @33
gated_clk_cell  x_lsu_cb_addr_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (cb_addr_clk       ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (cb_addr_clk_en    ),
  .module_en          (cp0_lsu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in        (forever_cpuclk     ), @34
//          .external_en   (1'b0               ), @35
//          .global_en     (cp0_yy_clk_en      ), @36
//          .module_en     (cp0_lsu_icg_en     ), @37
//          .local_en      (cb_addr_clk_en     ), @38
//          .clk_out       (cb_addr_clk        )); @39

assign cb_data_clk_en  = cb_data_create_vld;
// &Instance("gated_clk_cell", "x_lsu_cb_data_gated_clk"); @42
gated_clk_cell  x_lsu_cb_data_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (cb_data_clk       ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (cb_data_clk_en    ),
  .module_en          (cp0_lsu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in        (forever_cpuclk     ), @43
//          .external_en   (1'b0               ), @44
//          .global_en     (cp0_yy_clk_en      ), @45
//          .module_en     (cp0_lsu_icg_en     ), @46
//          .local_en      (cb_data_clk_en     ), @47
//          .clk_out       (cb_data_clk        )); @48

//==========================================================
//            control signal
//==========================================================
// &Force("bus","dcache_idx","8","0"); @53
assign cb_addr_hit_idx    = (cb_addr_tto4[9:2]  ==  dcache_idx[7:0]);
assign cb_addr_create_vld = ld_dc_cb_addr_create_vld && !cp0_lsu_cb_aclr_dis;
assign cb_addr_create_gateclk_en  = ld_dc_cb_addr_create_gateclk_en
                                    &&  !cp0_lsu_cb_aclr_dis;
assign cb_data_create_vld = ld_da_cb_data_vld && !cp0_lsu_cb_aclr_dis;
assign cb_create_vld      = cb_data_create_vld;
assign cb_pop_vld         = !cp0_lsu_dcache_en 
                            || cp0_lsu_cb_aclr_dis 
                            || ld_da_cb_ld_inst_vld 
                               && !ld_da_cb_data_vld
                            || ld_da_cb_ecc_cancel 
                            || lsu_dcache_ld_xx_gwen
                               && cb_addr_hit_idx
                            || cp0_lsu_no_op_req
                            || !icc_idle;  
//==========================================================
//                 Register
//==========================================================

always @(posedge forever_cpuclk or negedge cpurst_b)
begin
  if (!cpurst_b)
    cb_vld  <=  1'b0;
  else if(cb_pop_vld)
    cb_vld  <=  1'b0;
  else if(cb_create_vld)
    cb_vld  <=  1'b1;
end

always @(posedge cb_addr_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    cb_addr_tto4[`PA_WIDTH-5:0]  <=  {`PA_WIDTH-4{1'b0}};
  else if(cb_addr_create_vld)
    cb_addr_tto4[`PA_WIDTH-5:0]  <=  ld_dc_cb_addr_tto4[`PA_WIDTH-5:0];
end

always @(posedge cb_data_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    cb_data[127:0]  <=  128'b0;
  else if(cb_data_create_vld)
    cb_data[127:0]  <=  ld_da_cb_data[127:0];
end

//==========================================================
//            Generage to ld dc signal
//==========================================================
assign cb_cmp_ld_dc_addr1[`PA_WIDTH-1:0]  = ld_dc_addr1[`PA_WIDTH-1:0];
assign cb_ld_dc_addr_hit = cb_addr_tto4[`PA_WIDTH-5:0] == cb_cmp_ld_dc_addr1[`PA_WIDTH-1:4];

//==========================================================
//            Generage to ld da signal
//==========================================================
assign cb_ld_da_data[127:0] =  cb_data[127:0];
assign cb_ld_da_data_vld    =  cb_vld;

// &ModuleEnd; @111
endmodule


