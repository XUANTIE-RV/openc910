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

// &Depend("gated_clk_cell.vp"); @22
// &Depend("ct_spsram_2048x33.vp"); @24
// &Depend("ct_spsram_1024x33.vp"); @25
// &Depend("ct_spsram_8192x32.vp"); @27
// &Depend("ct_spsram_4096x32.vp"); @28
// &Depend("ct_spsram_2048x32_split.vp"); @29
// &Depend("ct_spsram_1024x32.vp"); @30

module ct_ifu_icache_data_array0(
  cp0_yy_clk_en,
  cp0_ifu_icg_en,
  forever_cpuclk,
  icache_ifu_data_array0_dout,
  ifu_icache_data_array0_bank0_cen_b,
  ifu_icache_data_array0_bank0_clk_en,
  ifu_icache_data_array0_bank1_cen_b,
  ifu_icache_data_array0_bank1_clk_en,
  ifu_icache_data_array0_bank2_cen_b,
  ifu_icache_data_array0_bank2_clk_en,
  ifu_icache_data_array0_bank3_cen_b,
  ifu_icache_data_array0_bank3_clk_en,
  ifu_icache_data_array0_din,
  ifu_icache_data_array0_wen_b,
  ifu_icache_index,
  pad_yy_icg_scan_en
);

input            cp0_yy_clk_en;                      
input            cp0_ifu_icg_en;                      
input            forever_cpuclk;                     
input            ifu_icache_data_array0_bank0_cen_b; 
input            ifu_icache_data_array0_bank0_clk_en; 
input            ifu_icache_data_array0_bank1_cen_b; 
input            ifu_icache_data_array0_bank1_clk_en; 
input            ifu_icache_data_array0_bank2_cen_b; 
input            ifu_icache_data_array0_bank2_clk_en; 
input            ifu_icache_data_array0_bank3_cen_b; 
input            ifu_icache_data_array0_bank3_clk_en; 
input   [127:0]  ifu_icache_data_array0_din;         
input            ifu_icache_data_array0_wen_b;       
input   [15 :0]  ifu_icache_index;                   
input            pad_yy_icg_scan_en;               
output  [127:0]  icache_ifu_data_array0_dout;        

wire             cp0_yy_clk_en;                      
wire             cp0_ifu_icg_en;                      
wire             data_clk_bank0;                     
wire             data_clk_bank1;                     
wire             data_clk_bank2;                     
wire             data_clk_bank3;                     
wire             data_local_en_bank0;                
wire             data_local_en_bank1;                
wire             data_local_en_bank2;                
wire             data_local_en_bank3;                
wire             forever_cpuclk;                     
wire    [31 :0]  icache_ifu_data_array0_bank0_dout;  
wire    [31 :0]  icache_ifu_data_array0_bank1_dout;  
wire    [31 :0]  icache_ifu_data_array0_bank2_dout;  
wire    [31 :0]  icache_ifu_data_array0_bank3_dout;  
wire    [127:0]  icache_ifu_data_array0_dout;        
wire    [31 :0]  ifu_icache_data_array0_bank0_bwen;  
wire             ifu_icache_data_array0_bank0_cen_b; 
wire             ifu_icache_data_array0_bank0_clk_en; 
wire    [31 :0]  ifu_icache_data_array0_bank0_din;   
wire    [31 :0]  ifu_icache_data_array0_bank1_bwen;  
wire             ifu_icache_data_array0_bank1_cen_b; 
wire             ifu_icache_data_array0_bank1_clk_en; 
wire    [31 :0]  ifu_icache_data_array0_bank1_din;   
wire    [31 :0]  ifu_icache_data_array0_bank2_bwen;  
wire             ifu_icache_data_array0_bank2_cen_b; 
wire             ifu_icache_data_array0_bank2_clk_en; 
wire    [31 :0]  ifu_icache_data_array0_bank2_din;   
wire    [31 :0]  ifu_icache_data_array0_bank3_bwen;  
wire             ifu_icache_data_array0_bank3_cen_b; 
wire             ifu_icache_data_array0_bank3_clk_en; 
wire    [31 :0]  ifu_icache_data_array0_bank3_din;   
wire    [127:0]  ifu_icache_data_array0_din;         
wire             ifu_icache_data_array0_wen_b;       
wire    [15 :0]  ifu_icache_index;                   
wire             pad_yy_icg_scan_en;               

//Gate Clk
// &Instance("gated_clk_cell", "x_data_bank0_clk"); @28
gated_clk_cell  x_data_bank0_clk (
  .clk_in               (forever_cpuclk      ),
  .clk_out              (data_clk_bank0      ),
  .external_en          (1'b0                ),
  .global_en            (cp0_yy_clk_en       ),
  .local_en             (data_local_en_bank0 ),
  .module_en            (cp0_ifu_icg_en      ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);
assign data_local_en_bank0 = ifu_icache_data_array0_bank0_clk_en;

// &Instance("gated_clk_cell", "x_data_bank1_clk"); @32
gated_clk_cell  x_data_bank1_clk (
  .clk_in               (forever_cpuclk      ),
  .clk_out              (data_clk_bank1      ),
  .external_en          (1'b0                ),
  .global_en            (cp0_yy_clk_en       ),
  .local_en             (data_local_en_bank1 ),
  .module_en            (cp0_ifu_icg_en      ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);
assign data_local_en_bank1 = ifu_icache_data_array0_bank1_clk_en;

// &Instance("gated_clk_cell", "x_data_bank2_clk"); @48
gated_clk_cell  x_data_bank2_clk (
  .clk_in               (forever_cpuclk      ),
  .clk_out              (data_clk_bank2      ),
  .external_en          (1'b0                ),
  .global_en            (cp0_yy_clk_en       ),
  .local_en             (data_local_en_bank2 ),
  .module_en            (cp0_ifu_icg_en      ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);
assign data_local_en_bank2 = ifu_icache_data_array0_bank2_clk_en;

// &Instance("gated_clk_cell", "x_data_bank3_clk"); @58
gated_clk_cell  x_data_bank3_clk (
  .clk_in               (forever_cpuclk      ),
  .clk_out              (data_clk_bank3      ),
  .external_en          (1'b0                ),
  .global_en            (cp0_yy_clk_en       ),
  .local_en             (data_local_en_bank3 ),
  .module_en            (cp0_ifu_icg_en      ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);
assign data_local_en_bank3 = ifu_icache_data_array0_bank3_clk_en;

//Instance Logic
//Support Bit Write
assign ifu_icache_data_array0_bank0_bwen[31:0] = {32{ifu_icache_data_array0_wen_b}};
assign ifu_icache_data_array0_bank1_bwen[31:0] = {32{ifu_icache_data_array0_wen_b}};
assign ifu_icache_data_array0_bank2_bwen[31:0] = {32{ifu_icache_data_array0_wen_b}};
assign ifu_icache_data_array0_bank3_bwen[31:0] = {32{ifu_icache_data_array0_wen_b}};

assign icache_ifu_data_array0_dout[127:0] = {icache_ifu_data_array0_bank0_dout[31:0],
                                             icache_ifu_data_array0_bank1_dout[31:0],
                                             icache_ifu_data_array0_bank2_dout[31:0],
                                             icache_ifu_data_array0_bank3_dout[31:0]};

assign ifu_icache_data_array0_bank0_din[31:0] = ifu_icache_data_array0_din[127: 96];
assign ifu_icache_data_array0_bank1_din[31:0] = ifu_icache_data_array0_din[ 95: 64];
assign ifu_icache_data_array0_bank2_din[31:0] = ifu_icache_data_array0_din[ 63: 32];
assign ifu_icache_data_array0_bank3_din[31:0] = ifu_icache_data_array0_din[ 31:  0];


//Icache Size define
//csky vperl_off
`ifdef ICACHE_256K
parameter WIDTH = 15;
`endif
`ifdef ICACHE_128K
parameter WIDTH = 14;
`endif
`ifdef ICACHE_64K
parameter WIDTH = 13;
`endif
`ifdef ICACHE_32K
parameter WIDTH = 12;
`endif


`ifdef L1_CACHE_ECC
`ifdef ICACHE_64K
ct_spsram_2048x33  x_ct_spsram_2048x33_bank0 (
`else
ct_spsram_1024x33  x_ct_spsram_1024x33_bank0 (
`endif
  `ifdef MEM_CFG_IN
  .mem_cfg_in                         (mem_cfg_in                        ),
  `endif //MEM_CFG_IN
  .A                                  (ifu_icache_index[WIDTH:3]         ),
  .CEN                                (ifu_icache_data_array0_bank0_cen_b),
  .CLK                                (data_clk_bank0                    ),
  .D                                  (ifu_icache_data_array0_bank0_din  ),
  .GWEN                               (ifu_icache_data_array0_wen_b      ),
  .Q                                  (icache_ifu_data_array0_bank0_dout ),
  .WEN                                (ifu_icache_data_array0_bank0_bwen )
);

`ifdef ICACHE_64K
ct_spsram_2048x33  x_ct_spsram_2048x33_bank1 (
`else
ct_spsram_1024x33  x_ct_spsram_1024x33_bank1 (
`endif
  `ifdef MEM_CFG_IN
  .mem_cfg_in                         (mem_cfg_in                        ),
  `endif //MEM_CFG_IN
  .A                                  (ifu_icache_index[WIDTH:3]         ),
  .CEN                                (ifu_icache_data_array0_bank1_cen_b),
  .CLK                                (data_clk_bank1                    ),
  .D                                  (ifu_icache_data_array0_bank1_din  ),
  .GWEN                               (ifu_icache_data_array0_wen_b      ),
  .Q                                  (icache_ifu_data_array0_bank1_dout ),
  .WEN                                (ifu_icache_data_array0_bank1_bwen )
);

`ifdef ICACHE_64K
ct_spsram_2048x33  x_ct_spsram_2048x33_bank2 (
`else
ct_spsram_1024x33  x_ct_spsram_1024x33_bank2 (
`endif
  `ifdef MEM_CFG_IN
  .mem_cfg_in                         (mem_cfg_in                        ),
  `endif //MEM_CFG_IN
  .A                                  (ifu_icache_index[WIDTH:3]         ),
  .CEN                                (ifu_icache_data_array0_bank2_cen_b),
  .CLK                                (data_clk_bank2                    ),
  .D                                  (ifu_icache_data_array0_bank2_din  ),
  .GWEN                               (ifu_icache_data_array0_wen_b      ),
  .Q                                  (icache_ifu_data_array0_bank2_dout ),
  .WEN                                (ifu_icache_data_array0_bank2_bwen )
);

`ifdef ICACHE_64K
ct_spsram_2048x33  x_ct_spsram_2048x33_bank3 (
`else
ct_spsram_1024x33  x_ct_spsram_1024x33_bank3 (
`endif
  `ifdef MEM_CFG_IN
  .mem_cfg_in                         (mem_cfg_in                        ),
  `endif //MEM_CFG_IN
  .A                                  (ifu_icache_index[WIDTH:3]         ),
  .CEN                                (ifu_icache_data_array0_bank3_cen_b),
  .CLK                                (data_clk_bank3                    ),
  .D                                  (ifu_icache_data_array0_bank3_din  ),
  .GWEN                               (ifu_icache_data_array0_wen_b      ),
  .Q                                  (icache_ifu_data_array0_bank3_dout ),
  .WEN                                (ifu_icache_data_array0_bank3_bwen )
);
`else //L1_CACHE_ECC
`ifdef ICACHE_256K
ct_spsram_8192x32  x_ct_spsram_8192x32_bank0 (
`endif
`ifdef ICACHE_128K
ct_spsram_4096x32  x_ct_spsram_4096x32_bank0 (
`endif
`ifdef ICACHE_64K
ct_spsram_2048x32_split  x_ct_spsram_2048x32_bank0 (
`endif
`ifdef ICACHE_32K
ct_spsram_1024x32  x_ct_spsram_1024x32_bank0 (
`endif
  `ifdef MEM_CFG_IN
  .mem_cfg_in                         (mem_cfg_in                        ),
  `endif //MEM_CFG_IN
  .A                                  (ifu_icache_index[WIDTH:3]         ),
  .CEN                                (ifu_icache_data_array0_bank0_cen_b),
  .CLK                                (data_clk_bank0                    ),
  .D                                  (ifu_icache_data_array0_bank0_din  ),
  .GWEN                               (ifu_icache_data_array0_wen_b      ),
  .Q                                  (icache_ifu_data_array0_bank0_dout ),
  .WEN                                (ifu_icache_data_array0_bank0_bwen )
);
`ifdef ICACHE_256K
ct_spsram_8192x32  x_ct_spsram_8192x32_bank1 (
`endif
`ifdef ICACHE_128K
ct_spsram_4096x32  x_ct_spsram_4096x32_bank1 (
`endif
`ifdef ICACHE_64K
ct_spsram_2048x32_split  x_ct_spsram_2048x32_bank1 (
`endif
`ifdef ICACHE_32K
ct_spsram_1024x32  x_ct_spsram_1024x32_bank1 (
`endif
  `ifdef MEM_CFG_IN
  .mem_cfg_in                         (mem_cfg_in                        ),
  `endif //MEM_CFG_IN
  .A                                  (ifu_icache_index[WIDTH:3]         ),
  .CEN                                (ifu_icache_data_array0_bank1_cen_b),
  .CLK                                (data_clk_bank1                    ),
  .D                                  (ifu_icache_data_array0_bank1_din  ),
  .GWEN                               (ifu_icache_data_array0_wen_b      ),
  .Q                                  (icache_ifu_data_array0_bank1_dout ),
  .WEN                                (ifu_icache_data_array0_bank1_bwen )
);

`ifdef ICACHE_256K
ct_spsram_8192x32  x_ct_spsram_8192x32_bank2 (
`endif
`ifdef ICACHE_128K
ct_spsram_4096x32  x_ct_spsram_4096x32_bank2 (
`endif
`ifdef ICACHE_64K
ct_spsram_2048x32_split  x_ct_spsram_2048x32_bank2 (
`endif
`ifdef ICACHE_32K
ct_spsram_1024x32  x_ct_spsram_1024x32_bank2 (
`endif
  `ifdef MEM_CFG_IN
  .mem_cfg_in                         (mem_cfg_in                        ),
  `endif //MEM_CFG_IN
  .A                                  (ifu_icache_index[WIDTH:3]         ),
  .CEN                                (ifu_icache_data_array0_bank2_cen_b),
  .CLK                                (data_clk_bank2                    ),
  .D                                  (ifu_icache_data_array0_bank2_din  ),
  .GWEN                               (ifu_icache_data_array0_wen_b      ),
  .Q                                  (icache_ifu_data_array0_bank2_dout ),
  .WEN                                (ifu_icache_data_array0_bank2_bwen )
);
`ifdef ICACHE_256K
ct_spsram_8192x32  x_ct_spsram_8192x32_bank3 (
`endif
`ifdef ICACHE_128K
ct_spsram_4096x32  x_ct_spsram_4096x32_bank3 (
`endif
`ifdef ICACHE_64K
ct_spsram_2048x32_split  x_ct_spsram_2048x32_bank3 (
`endif
`ifdef ICACHE_32K
ct_spsram_1024x32  x_ct_spsram_1024x32_bank3 (
`endif
  `ifdef MEM_CFG_IN
  .mem_cfg_in                         (mem_cfg_in                        ),
  `endif //MEM_CFG_IN
  .A                                  (ifu_icache_index[WIDTH:3]         ),
  .CEN                                (ifu_icache_data_array0_bank3_cen_b),
  .CLK                                (data_clk_bank3                    ),
  .D                                  (ifu_icache_data_array0_bank3_din  ),
  .GWEN                               (ifu_icache_data_array0_wen_b      ),
  .Q                                  (icache_ifu_data_array0_bank3_dout ),
  .WEN                                (ifu_icache_data_array0_bank3_bwen )
);

`endif //L1_CACHE_ECC

//csky vperl_on
endmodule

