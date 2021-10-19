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

// &ModuleBeg; @22
module ct_mp_clk_top(
  apb_clk,
  apb_clk_en,
  axim_clk_en,
  axim_clk_en_f,
  forever_core0_clk,
  forever_core1_clk,
  forever_cpuclk,
  forever_jtgclk,
  l2c_data_clk_bank_0,
  l2c_data_clk_bank_1,
  l2c_data_ram_clk_en_bank_0,
  l2c_data_ram_clk_en_bank_1,
  l2c_tag_clk_bank_0,
  l2c_tag_clk_bank_1,
  l2c_tag_ram_clk_en_bank_0,
  l2c_tag_ram_clk_en_bank_1,
  pad_had_jtg_tclk,
  pad_l2c_data_mbist_clk_ratio,
  pad_l2c_tag_mbist_clk_ratio,
  pad_yy_dft_clk_rst_b,
  pad_yy_icg_scan_en,
  pad_yy_mbist_mode,
  pad_yy_scan_mode,
  phl_rst_b,
  pll_cpu_clk
);

// &Ports; @23
input          axim_clk_en;                   
input          l2c_data_ram_clk_en_bank_0;    
input          l2c_data_ram_clk_en_bank_1;    
input          l2c_tag_ram_clk_en_bank_0;     
input          l2c_tag_ram_clk_en_bank_1;     
input          pad_had_jtg_tclk;              
input   [2:0]  pad_l2c_data_mbist_clk_ratio;  
input   [2:0]  pad_l2c_tag_mbist_clk_ratio;   
input          pad_yy_dft_clk_rst_b;          
input          pad_yy_icg_scan_en;            
input          pad_yy_mbist_mode;             
input          pad_yy_scan_mode;              
input          phl_rst_b;                     
input          pll_cpu_clk;                   
output         apb_clk;                       
output         apb_clk_en;                    
output         axim_clk_en_f;                 
output         forever_core0_clk;             
output         forever_core1_clk;             
output         forever_cpuclk;                
output         forever_jtgclk;                
output         l2c_data_clk_bank_0;           
output         l2c_data_clk_bank_1;           
output         l2c_tag_clk_bank_0;            
output         l2c_tag_clk_bank_1;            

// &Regs; @24
reg            apb_clk_en_f;                  
reg            axim_clk_en_f;                 
reg     [2:0]  l2c_data_ram_bist_clk_ratio;   
reg     [2:0]  l2c_tag_ram_bist_clk_ratio;    
reg            peripheral_clk_en;             

// &Wires; @25
wire           apb_clk_en;                    
wire           axim_clk_en;                   
wire           bist_clk;                      
wire           bist_clk_en;                   
wire           data_ram_bist_cnt_idle;        
wire           data_ram_clk_en_bank_0;        
wire           data_ram_clk_en_bank_1;        
wire           forever_core0_clk;             
wire           forever_core1_clk;             
wire           forever_cpuclk;                
wire           forever_jtgclk;                
wire           l2c_data_clk_bank_0;           
wire           l2c_data_clk_bank_0_before_occ; 
wire           l2c_data_clk_bank_1;           
wire           l2c_data_clk_bank_1_before_occ; 
wire           l2c_data_ram_clk_en_bank_0;    
wire           l2c_data_ram_clk_en_bank_1;    
wire           l2c_tag_clk_bank_0;            
wire           l2c_tag_clk_bank_0_before_occ; 
wire           l2c_tag_clk_bank_1;            
wire           l2c_tag_clk_bank_1_before_occ; 
wire           l2c_tag_ram_clk_en_bank_0;     
wire           l2c_tag_ram_clk_en_bank_1;     
wire           pad_had_jtg_tclk;              
wire    [2:0]  pad_l2c_data_mbist_clk_ratio;  
wire    [2:0]  pad_l2c_tag_mbist_clk_ratio;   
wire           pad_yy_dft_clk_rst_b;          
wire           pad_yy_icg_scan_en;            
wire           pad_yy_mbist_mode;             
wire           pad_yy_scan_mode;              
wire           phl_rst_b;                     
wire           pll_cpu_clk;                   
wire           tag_ram_bist_cnt_idle;         
wire           tag_ram_clk_en_bank_0;         
wire           tag_ram_clk_en_bank_1;         


// //&Depend("BUFGCE.v"); @27
//================================================
//            CPU_CLOCK
//================================================
// &Force("output", "forever_cpuclk"); @31
assign forever_cpuclk = pll_cpu_clk;
// &Instance("clk_buf_cell", "x_ct_mp_top_clk_buf"); @35
// &Connect(.buf_in   (pll_cpu_clk), @36
//          .buf_out  (forever_cpuclk)); @37

assign forever_core0_clk = forever_cpuclk;

assign forever_core1_clk = forever_cpuclk;



//================================================
//            JTAG_CLOCK
//================================================

assign forever_jtgclk = pad_had_jtg_tclk;

//================================================
//            APB CLOCK
//================================================
// &Force("output", "apb_clk_en"); @81
// &Force("input",  "phl_rst_b"); @82

always@(posedge pll_cpu_clk or negedge phl_rst_b)
begin
  if (!phl_rst_b)
    peripheral_clk_en <= 1'b0;
  else
    peripheral_clk_en <= ~peripheral_clk_en;
end

always@(posedge pll_cpu_clk)
begin
  apb_clk_en_f <= peripheral_clk_en;
end

assign apb_clk_en = pad_yy_scan_mode ? 1'b1 : apb_clk_en_f;

// &Force("output","apb_clk"); @104

BUFGCE apb_clk_buf
(.O   (apb_clk),
 .I   (pll_cpu_clk),
 .CE  (apb_clk_en_f)
);
// &Instance("gated_clk_cell", "x_apb_gated_clk"); @116
// &Connect(.clk_in      (pll_cpu_clk   ), @117
//          .external_en (1'b0          ), @118
//          .global_en   (1'b1          ), @119
//          .module_en   (1'b0          ), @120
//          .local_en    (apb_clk_en_f  ), @121
//          .clk_out     (apb_clk_before_occ) @122
//          .pad_yy_icg_scan_en (1'b0) @123
// ); @124
// &Instance("clk_buf_cell", "x_apb_clk_buf"); @125
// &Connect(.buf_in   (apb_clk_before_occ), @126
//          .buf_out  (apb_clk)); @127

//================================================
//            SLVIF CLK_EN
//================================================
// &Force("output", "slvif_clk_en_f"); @134

//================================================
//           AXIM CLK_EN
//================================================
// &Force("output", "axim_clk_en_f"); @145

always@(posedge forever_cpuclk)
begin
  axim_clk_en_f <= axim_clk_en;
end


//================================================
//            L2C DATA CLOCK
//================================================
assign bist_clk_en = pad_yy_mbist_mode | pad_yy_scan_mode;
// &Instance("gated_clk_cell", "x_data_bist_gated_clk"); @157
gated_clk_cell  x_data_bist_gated_clk (
  .clk_in             (pll_cpu_clk       ),
  .clk_out            (bist_clk          ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (bist_clk_en       ),
  .module_en          (1'b0              ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in        (pll_cpu_clk        ), @158
//          .external_en   (1'b0               ), @159
//          .global_en     (1'b1               ), @160
//          .module_en     (1'b0               ), @161
//          .local_en      (bist_clk_en        ), @162
//          .clk_out       (bist_clk           ) @163
//         ); @164

always@(posedge bist_clk or negedge pad_yy_dft_clk_rst_b) 
begin
  if (!pad_yy_dft_clk_rst_b)
    l2c_data_ram_bist_clk_ratio[2:0] <= 3'b0;
  else if (bist_clk_en) begin
    if (data_ram_bist_cnt_idle)
      l2c_data_ram_bist_clk_ratio[2:0] <= pad_l2c_data_mbist_clk_ratio[2:0];
    else
      l2c_data_ram_bist_clk_ratio[2:0] <= l2c_data_ram_bist_clk_ratio[2:0] - 3'b001;
  end
end

assign data_ram_bist_cnt_idle = l2c_data_ram_bist_clk_ratio[2:0] == 3'b000;

assign data_ram_clk_en_bank_0 = bist_clk_en ? data_ram_bist_cnt_idle : l2c_data_ram_clk_en_bank_0;
assign data_ram_clk_en_bank_1 = bist_clk_en ? data_ram_bist_cnt_idle : l2c_data_ram_clk_en_bank_1;

// &Force("nonport","l2c_data_clk_bank_0_before_occ"); @184
// &Force("nonport","l2c_data_clk_bank_1_before_occ"); @185
// &Force("nonport","data_ram_clk_en_bank_0"); @186
// &Force("nonport","data_ram_clk_en_bank_1"); @187

BUFGCE data_bank0_clk_buf
(.O   (l2c_data_clk_bank_0_before_occ),
 .I   (pll_cpu_clk),
 .CE  (data_ram_clk_en_bank_0)
);

BUFGCE data_bank1_clk_buf
(.O   (l2c_data_clk_bank_1_before_occ),
 .I   (pll_cpu_clk),
 .CE  (data_ram_clk_en_bank_1)
);
// &Instance("gated_clk_cell", "x_l2cache_data_ram_gated_clk_0");  @201
// &Connect( @202
//   .clk_in               (pll_cpu_clk         ), @203
//   .external_en          (1'b0                ), @204
//   .global_en            (1'b1                ), @205
//   .module_en            (1'b0                ), @206
//   .local_en             (data_ram_clk_en_bank_0), @207
//   .clk_out              (l2c_data_clk_bank_0_before_occ), @208
//   .pad_yy_icg_scan_en   (1'b0                  ) @209
// ); @210
// &Instance("gated_clk_cell", "x_l2cache_data_ram_gated_clk_1");  @212
// &Connect( @213
//   .clk_in               (pll_cpu_clk         ), @214
//   .external_en          (1'b0                ), @215
//   .global_en            (1'b1                ), @216
//   .module_en            (1'b0                ), @217
//   .local_en             (data_ram_clk_en_bank_1), @218
//   .clk_out              (l2c_data_clk_bank_1_before_occ), @219
//   .pad_yy_icg_scan_en   (1'b0                  ) @220
// ); @221

assign l2c_data_clk_bank_0 = l2c_data_clk_bank_0_before_occ;
assign l2c_data_clk_bank_1 = l2c_data_clk_bank_1_before_occ;
// &Instance("clk_buf_cell", "x_l2c_data_bank0_clk_buf"); @228
// &Connect(.buf_in   (l2c_data_clk_bank_0_before_occ), @229
//          .buf_out  (l2c_data_clk_bank_0)); @230
// &Instance("clk_buf_cell", "x_l2c_data_bank1_clk_buf"); @232
// &Connect(.buf_in   (l2c_data_clk_bank_1_before_occ), @233
//          .buf_out  (l2c_data_clk_bank_1)); @234
         
//================================================
//            L2C TAG CLOCK
//================================================
always@(posedge bist_clk or negedge pad_yy_dft_clk_rst_b)
begin
  if (!pad_yy_dft_clk_rst_b)
    l2c_tag_ram_bist_clk_ratio[2:0] <= 3'b0;
  else if (bist_clk_en) begin
    if (tag_ram_bist_cnt_idle)
      l2c_tag_ram_bist_clk_ratio[2:0] <= pad_l2c_tag_mbist_clk_ratio[2:0];
    else
      l2c_tag_ram_bist_clk_ratio[2:0] <= l2c_tag_ram_bist_clk_ratio[2:0] - 3'b001;
  end
end

assign tag_ram_bist_cnt_idle = l2c_tag_ram_bist_clk_ratio[2:0] == 3'b000;

assign tag_ram_clk_en_bank_0 = bist_clk_en ? tag_ram_bist_cnt_idle : l2c_tag_ram_clk_en_bank_0;
assign tag_ram_clk_en_bank_1 = bist_clk_en ? tag_ram_bist_cnt_idle : l2c_tag_ram_clk_en_bank_1;

// &Force("nonport","l2c_tag_clk_bank_0_before_occ"); @258
// &Force("nonport","l2c_tag_clk_bank_1_before_occ"); @259
// &Force("nonport","tag_ram_clk_en_bank_0"); @260
// &Force("nonport","tag_ram_clk_en_bank_1"); @261
BUFGCE tag_bank0_clk_buf
(.O   (l2c_tag_clk_bank_0_before_occ),
 .I   (pll_cpu_clk),
 .CE  (tag_ram_clk_en_bank_0)
);

BUFGCE tag_bank1_clk_buf
(.O   (l2c_tag_clk_bank_1_before_occ),
 .I   (pll_cpu_clk),
 .CE  (tag_ram_clk_en_bank_1)
);
// &Instance("gated_clk_cell", "x_l2cache_tag_ram_gated_clk_0");  @274
// &Connect( @275
//   .clk_in               (pll_cpu_clk         ), @276
//   .external_en          (1'b0                ), @277
//   .global_en            (1'b1                ), @278
//   .module_en            (1'b0                ), @279
//   .local_en             (tag_ram_clk_en_bank_0), @280
//   .clk_out              (l2c_tag_clk_bank_0_before_occ), @281
//   .pad_yy_icg_scan_en   (1'b0                ) @282
// ); @283
// &Instance("gated_clk_cell", "x_l2cache_tag_ram_gated_clk_1");  @285
// &Connect( @286
//   .clk_in               (pll_cpu_clk         ), @287
//   .external_en          (1'b0                ), @288
//   .global_en            (1'b1                ), @289
//   .module_en            (1'b0                ), @290
//   .local_en             (tag_ram_clk_en_bank_1), @291
//   .clk_out              (l2c_tag_clk_bank_1_before_occ), @292
//   .pad_yy_icg_scan_en   (1'b0                ) @293
// ); @294

assign l2c_tag_clk_bank_0 = l2c_tag_clk_bank_0_before_occ;
assign l2c_tag_clk_bank_1 = l2c_tag_clk_bank_1_before_occ;
// &Instance("clk_buf_cell", "x_l2c_tag_bank0_clk_buf"); @301
// &Connect(.buf_in   (l2c_tag_clk_bank_0_before_occ), @302
//          .buf_out  (l2c_tag_clk_bank_0)); @303
// &Instance("clk_buf_cell", "x_l2c_tag_bank1_clk_buf"); @305
// &Connect(.buf_in   (l2c_tag_clk_bank_1_before_occ), @306
//          .buf_out  (l2c_tag_clk_bank_1)); @307

// &ModuleEnd; @310
endmodule


