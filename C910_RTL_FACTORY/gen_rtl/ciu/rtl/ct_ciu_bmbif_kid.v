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

// &Depend("ct_fifo.v"); @18

// &ModuleBeg; @20
module ct_ciu_bmbif_kid(
  bmbif_piu0_xx_grant,
  bmbif_piu1_xx_grant,
  bmbif_piu2_xx_grant,
  bmbif_piu3_xx_grant,
  bmbif_xx_bar_req,
  bmbif_xx_mid,
  bmbif_xx_req_bus,
  ciu_icg_en,
  cpurst_b,
  forever_cpuclk,
  pad_yy_icg_scan_en,
  piu0_bmbif_req_bus,
  piu0_bmbif_xx_req,
  piu1_bmbif_req_bus,
  piu1_bmbif_xx_req,
  piu2_bmbif_req_bus,
  piu2_bmbif_xx_req,
  piu3_bmbif_req_bus,
  piu3_bmbif_xx_req,
  xx_bmbif_bar_grant
);

// &Ports; @21
input          ciu_icg_en;         
input          cpurst_b;           
input          forever_cpuclk;     
input          pad_yy_icg_scan_en; 
input   [8:0]  piu0_bmbif_req_bus; 
input          piu0_bmbif_xx_req;  
input   [8:0]  piu1_bmbif_req_bus; 
input          piu1_bmbif_xx_req;  
input   [8:0]  piu2_bmbif_req_bus; 
input          piu2_bmbif_xx_req;  
input   [8:0]  piu3_bmbif_req_bus; 
input          piu3_bmbif_xx_req;  
input          xx_bmbif_bar_grant; 
output         bmbif_piu0_xx_grant; 
output         bmbif_piu1_xx_grant; 
output         bmbif_piu2_xx_grant; 
output         bmbif_piu3_xx_grant; 
output         bmbif_xx_bar_req;   
output  [2:0]  bmbif_xx_mid;       
output  [8:0]  bmbif_xx_req_bus;   

// &Regs; @22

// &Wires; @23
wire           bmbif_piu0_xx_grant; 
wire           bmbif_piu1_xx_grant; 
wire           bmbif_piu2_xx_grant; 
wire           bmbif_piu3_xx_grant; 
wire           bmbif_xx_bar_req;   
wire           bmbif_xx_clk;       
wire           bmbif_xx_clk_en;    
wire    [2:0]  bmbif_xx_mid;       
wire    [8:0]  bmbif_xx_req_bus;   
wire           ciu_icg_en;         
wire           forever_cpuclk;     
wire           pad_yy_icg_scan_en; 
wire    [8:0]  piu0_bmbif_req_bus; 
wire           piu0_bmbif_xx_req;  
wire    [8:0]  piu1_bmbif_req_bus; 
wire           piu1_bmbif_xx_req;  
wire    [8:0]  piu2_bmbif_req_bus; 
wire           piu2_bmbif_xx_req;  
wire    [8:0]  piu3_bmbif_req_bus; 
wire           piu3_bmbif_xx_req;  
wire    [3:0]  xx_bar_sel;         
wire    [3:0]  xx_bar_valid;       
wire           xx_bmbif_bar_grant; 
wire    [3:0]  xx_fifo_create_bus; 
wire           xx_fifo_create_en;  
wire    [3:0]  xx_fifo_pop_bus;    
wire           xx_fifo_pop_bus_vld; 
wire           xx_fifo_pop_en;     


// &Force("nonport", "bmbif_xx_clk"); @25
// &Force("nonport", "xx_bar_valid"); @26
// &Force("nonport", "xx_bar_sel"); @27
// &Force("nonport", "xx_fifo_create_en"); @28
// &Force("nonport", "xx_fifo_pop_en"); @29
// &Force("nonport", "xx_fifo_create_bus"); @30
// &Force("nonport", "xx_fifo_pop_bus"); @31
// &Force("nonport", "xx_fifo_pop_bus_vld"); @32
// &Force("nonport", "xx_fifo_full"); @33
// &Force("nonport", "xx_fifo_empty"); @34
// &Force("input", "cpurst_b"); @35

assign bmbif_xx_clk_en = |xx_bar_sel[3:0];

// &Instance("gated_clk_cell", "x_bmbif_xx_prio_gated_clk"); @39
gated_clk_cell  x_bmbif_xx_prio_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (bmbif_xx_clk      ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (bmbif_xx_clk_en   ),
  .module_en          (ciu_icg_en        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @40
//          .external_en (1'b0), @41
//          .global_en   (1'b1), @42
//          .module_en (ciu_icg_en       ), @43
//          .local_en    (bmbif_xx_clk_en), @44
//          .clk_out     (bmbif_xx_clk)); @45

assign xx_bar_valid[3:0] ={piu3_bmbif_xx_req,
                           piu2_bmbif_xx_req,
                           piu1_bmbif_xx_req,
                           piu0_bmbif_xx_req};

ct_prio #(.NUM(4)) x_ct_bmbif_xx_prio(
  .clk             (bmbif_xx_clk     ),
  .rst_b           (cpurst_b         ),
  .valid           (xx_bar_valid     ),
  .clr             (1'b1             ),
  .sel             (xx_bar_sel       )
);

assign bmbif_piu0_xx_grant = xx_bar_sel[0];
assign bmbif_piu1_xx_grant = xx_bar_sel[1];
assign bmbif_piu2_xx_grant = xx_bar_sel[2];
assign bmbif_piu3_xx_grant = xx_bar_sel[3];

assign xx_fifo_create_en = |xx_bar_valid[3:0];

assign xx_fifo_create_bus[3:0] = xx_bar_sel[3:0];

assign xx_fifo_pop_en = xx_bmbif_bar_grant;

ct_fifo #(.WIDTH(4),.DEPTH(4),.PTR_W(2)) x_ct_bmbif_xx_fifo(
  .clk                 (forever_cpuclk      ),
  .rst_b               (cpurst_b            ),
  .fifo_create_en      (xx_fifo_create_en   ),
  .fifo_create_en_dp   (xx_fifo_create_en   ),
  .fifo_pop_en         (xx_fifo_pop_en      ),
  .fifo_create_data    (xx_fifo_create_bus  ),
  .fifo_pop_data       (xx_fifo_pop_bus     ),
  .fifo_pop_data_vld   (xx_fifo_pop_bus_vld ),
  .fifo_full           (xx_fifo_full        ),
  .fifo_empty          (xx_fifo_empty       ),
  .pad_yy_icg_scan_en  (pad_yy_icg_scan_en   ),
  .fifo_icg_en           (ciu_icg_en)
);

assign bmbif_xx_bar_req = xx_fifo_pop_bus_vld;
assign bmbif_xx_req_bus[8:0] = 
         {9{xx_fifo_pop_bus[3]}} & piu3_bmbif_req_bus[8:0] |
         {9{xx_fifo_pop_bus[2]}} & piu2_bmbif_req_bus[8:0] |
         {9{xx_fifo_pop_bus[1]}} & piu1_bmbif_req_bus[8:0] |
         {9{xx_fifo_pop_bus[0]}} & piu0_bmbif_req_bus[8:0];

assign bmbif_xx_mid[2] = 1'b0;
assign bmbif_xx_mid[1] = xx_fifo_pop_bus[3] | xx_fifo_pop_bus[2];
assign bmbif_xx_mid[0] = xx_fifo_pop_bus[3] | xx_fifo_pop_bus[1];

// &ModuleEnd; @97
endmodule


 
