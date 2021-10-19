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

module ct_ifu_icache_predecd_array0(
  cp0_ifu_icg_en,
  cp0_yy_clk_en,
  forever_cpuclk,
  icache_ifu_predecd_array0_dout,
  ifu_icache_data_array0_wen_b,
  ifu_icache_index,
  ifu_icache_predecd_array0_cen_b,
  ifu_icache_predecd_array0_clk_en,
  ifu_icache_predecd_array0_din,
  ifu_icache_predecd_array0_wen_b,
  pad_yy_icg_scan_en
);

input           cp0_ifu_icg_en;                  
input           cp0_yy_clk_en;                   
input           forever_cpuclk;                  
input           ifu_icache_data_array0_wen_b;    
input   [15:0]  ifu_icache_index;                
input           ifu_icache_predecd_array0_cen_b; 
input           ifu_icache_predecd_array0_clk_en;
input   [31:0]  ifu_icache_predecd_array0_din;
input           ifu_icache_predecd_array0_wen_b; 
input           pad_yy_icg_scan_en;            
output  [31:0]  icache_ifu_predecd_array0_dout;  

wire            cp0_ifu_icg_en;                  
wire            cp0_yy_clk_en;                   
wire            forever_cpuclk;    
wire    [31:0]  icache_ifu_predecd_array0_dout;  
wire            ifu_icache_data_array0_wen_b;    
wire    [15:0]  ifu_icache_index;                
wire    [31:0]  ifu_icache_predecd_array0_bwen;  
wire            ifu_icache_predecd_array0_cen_b; 
wire            ifu_icache_predecd_array0_clk_en; 
wire    [31:0]  ifu_icache_predecd_array0_din;   
wire            ifu_icache_predecd_array0_wen_b; 
wire            pad_yy_icg_scan_en;            
wire            predecd_clk;                     
wire            predecd_local_en;                


gated_clk_cell  x_predecd_clk (
  .clk_in               (forever_cpuclk      ),
  .clk_out              (predecd_clk         ),
  .external_en          (1'b0                ),
  .global_en            (cp0_yy_clk_en       ),
  .local_en             (predecd_local_en    ),
  .module_en            (cp0_ifu_icg_en      ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

assign predecd_local_en = ifu_icache_predecd_array0_clk_en;

//Support Bit Write
assign ifu_icache_predecd_array0_bwen[31:0] = {32{ifu_icache_predecd_array0_wen_b}};

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
ct_spsram_2048x33  x_ct_spsram_2048x33 (
`else  //ICACHE_64K
ct_spsram_1024x33  x_ct_spsram_1024x33 (
`endif //ICACHE_64K  
  `ifdef MEM_CFG_IN
  .mem_cfg_in                      (mem_cfg_in                     ),
  `endif //MEM_CFG_IN
  .A                               (ifu_icache_index[WIDTH:3]      ),
  .CEN                             (ifu_icache_predecd_array0_cen_b),
  .CLK                             (predecd_clk                    ),
  .D                               (ifu_icache_predecd_array0_din  ),
  .GWEN                            (ifu_icache_data_array0_wen_b   ),
  .Q                               (icache_ifu_predecd_array0_dout ),
  .WEN                             (ifu_icache_predecd_array0_bwen )
);
`else //L1_CACHE_ECC
`ifdef ICACHE_256K
ct_spsram_8192x32  x_ct_spsram_8192x32 (
`endif
`ifdef ICACHE_128K
ct_spsram_4096x32  x_ct_spsram_4096x32 (
`endif
`ifdef ICACHE_64K
ct_spsram_2048x32_split  x_ct_spsram_2048x32_split (
`endif
`ifdef ICACHE_32K
ct_spsram_1024x32  x_ct_spsram_1024x32 (
`endif //ICACHE_64K  
  `ifdef MEM_CFG_IN
  .mem_cfg_in                      (mem_cfg_in                     ),
  `endif //MEM_CFG_IN
  .A                               (ifu_icache_index[WIDTH:3]      ),
  .CEN                             (ifu_icache_predecd_array0_cen_b),
  .CLK                             (predecd_clk                    ),
  .D                               (ifu_icache_predecd_array0_din  ),
  .GWEN                            (ifu_icache_data_array0_wen_b   ),
  .Q                               (icache_ifu_predecd_array0_dout ),
  .WEN                             (ifu_icache_predecd_array0_bwen )
);
`endif //L1_CACHE_ECC
//csky vperl_on

endmodule


