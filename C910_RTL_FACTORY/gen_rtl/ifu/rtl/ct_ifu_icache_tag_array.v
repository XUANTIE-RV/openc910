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
// &Depend("ct_spsram_512x61.vp"); @24
// &Depend("ct_spsram_256x61.vp"); @25
// &Depend("ct_spsram_2048x59.vp"); @27
// &Depend("ct_spsram_1024x59.vp"); @28
// &Depend("ct_spsram_512x59.vp"); @29
// &Depend("ct_spsram_256x59.vp"); @30


module ct_ifu_icache_tag_array(
  cp0_ifu_icg_en,
  forever_cpuclk,
  icache_ifu_tag_dout,
  ifu_icache_index,
  ifu_icache_tag_cen_b,
  ifu_icache_tag_clk_en,
  ifu_icache_tag_din,
  ifu_icache_tag_wen,
  pad_yy_icg_scan_en
);

input           forever_cpuclk;       
input           cp0_ifu_icg_en;
input   [15:0]  ifu_icache_index;     
input           ifu_icache_tag_cen_b; 
input           ifu_icache_tag_clk_en; 
input   [58:0]  ifu_icache_tag_din;   
input   [2 :0]  ifu_icache_tag_wen;   
input           pad_yy_icg_scan_en; 
output  [58:0]  icache_ifu_tag_dout;  

wire            forever_cpuclk;   
wire            cp0_ifu_icg_en;
wire    [58:0]  icache_ifu_tag_dout;  
wire    [15:0]  ifu_icache_index;     
wire    [58:0]  ifu_icache_tag_bwen;  
wire            ifu_icache_tag_cen_b; 
wire            ifu_icache_tag_clk_en; 
wire    [58:0]  ifu_icache_tag_din;   
wire            ifu_icache_tag_gwen;  
wire    [2 :0]  ifu_icache_tag_wen;   
wire            pad_yy_icg_scan_en; 
wire            tag_clk;              
wire            tag_local_en;         


//Gate Clk
gated_clk_cell  x_tag_clk (
  .clk_in               (forever_cpuclk      ),
  .clk_out              (tag_clk             ),
  .external_en          (1'b0                ),
  .global_en            (1'b1                ),
  .local_en             (tag_local_en        ),
  .module_en            (cp0_ifu_icg_en      ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

assign tag_local_en = ifu_icache_tag_clk_en;

//Instance Logic
//Support Bit Write
assign ifu_icache_tag_gwen       = &ifu_icache_tag_wen[2:0];
assign ifu_icache_tag_bwen[58:0] = {
                                     ifu_icache_tag_wen[2], 
                                     {29{ifu_icache_tag_wen[1]}},
                                     {29{ifu_icache_tag_wen[0]}}
                                   };

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
ct_spsram_512x61  x_ct_spsram_512x61 (
`else
ct_spsram_256x61  x_ct_spsram_256x61 (
`endif
  `ifdef MEM_CFG_IN
  .mem_cfg_in             (mem_cfg_in               ),
  `endif //MEM_CFG_IN
  .A                      (ifu_icache_index[WIDTH:5]),
  .CEN                    (ifu_icache_tag_cen_b     ),
  .CLK                    (tag_clk                  ),
  .D                      (ifu_icache_tag_din       ),
  .GWEN                   (ifu_icache_tag_gwen      ),
  .Q                      (icache_ifu_tag_dout      ),
  .WEN                    (ifu_icache_tag_bwen      )
);
`else //L1_CACHE_ECC
`ifdef ICACHE_256K
ct_spsram_2048x59  x_ct_spsram_2048x59 (
`endif
`ifdef ICACHE_128K
ct_spsram_1024x59  x_ct_spsram_1024x59 (
`endif
`ifdef ICACHE_64K
ct_spsram_512x59  x_ct_spsram_512x59 (
`endif
`ifdef ICACHE_32K
ct_spsram_256x59  x_ct_spsram_256x59 (
`endif
  `ifdef MEM_CFG_IN
  .mem_cfg_in             (mem_cfg_in               ),
  `endif //MEM_CFG_IN
  .A                      (ifu_icache_index[WIDTH:5]),
  .CEN                    (ifu_icache_tag_cen_b     ),
  .CLK                    (tag_clk                  ),
  .D                      (ifu_icache_tag_din       ),
  .GWEN                   (ifu_icache_tag_gwen      ),
  .Q                      (icache_ifu_tag_dout      ),
  .WEN                    (ifu_icache_tag_bwen      )
);
`endif //L1_CACHE_ECC
//csky vperl_on
endmodule
