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

module apb(
  b_pad_gpio_porta,
  biu_pad_haddr,
  biu_pad_hprot,
  biu_pad_lpmd_b,
  clk_en,
  haddr_s2,
  hburst_s2,
  hmastlock,
  hprot_s2,
  hrdata_s2,
  hready_s2,
  hresp_s2,
  hsel_s2,
  hsize_s2,
  htrans_s2,
  hwdata_s2,
  hwrite_s2,
  i_pad_clk,
  pad_biu_clkratio,
  pad_cpu_rst_b,
  per_clk,
  cpu_clk,
`ifdef PMU_LP_MODE_TEST
  pmu_cpu_pwr_on , 
  pmu_cpu_iso_in , 
  pmu_cpu_iso_out, 
  pmu_cpu_save   , 
  pmu_cpu_restore, 
`endif
  uart0_sin,
  uart0_sout,
  xx_intc_vld
);


input   [39 :0]  biu_pad_haddr;    
input   [3  :0]  biu_pad_hprot;    
input   [1  :0]  biu_pad_lpmd_b;   
input   [39 :0]  haddr_s2;         
input   [2  :0]  hburst_s2;        
input            hmastlock;        
input   [3  :0]  hprot_s2;         
input            hsel_s2;          
input   [2  :0]  hsize_s2;         
input   [1  :0]  htrans_s2;        
input   [127:0]  hwdata_s2;        
input            hwrite_s2;        
input            i_pad_clk;        
input            uart0_sin;        
output           clk_en;           
output  [127:0]  hrdata_s2;        
output           hready_s2;        
output  [1  :0]  hresp_s2;         
output  [2  :0]  pad_biu_clkratio; 
input           pad_cpu_rst_b;    
output           per_clk;          
output           cpu_clk;          
`ifdef PMU_LP_MODE_TEST
output           pmu_cpu_pwr_on ; 
output           pmu_cpu_iso_in ; 
output           pmu_cpu_iso_out; 
output           pmu_cpu_save   ; 
output           pmu_cpu_restore; 
`endif
output           uart0_sout;       
output  [39 :0]  xx_intc_vld;      
inout   [7  :0]  b_pad_gpio_porta; 

wire             apb_clkgen_psel;  
wire             apb_gpio_psel;    
wire    [39 :0]  apb_haddr;        
wire    [2  :0]  apb_hburst;       
wire    [31 :0]  apb_hrdata;       
wire             apb_hready;       
wire    [1  :0]  apb_hresp;        
wire             apb_hsel;         
wire    [2  :0]  apb_hsize;        
wire    [1  :0]  apb_htrans;       
wire    [31 :0]  apb_hwdata;       
wire             apb_hwrite;       

wire             apb_intc_psel;    
wire             apb_stim_psel;    
wire             apb_tim_psel;     
wire             apb_uart_psel;    
wire             apb_pmu_psel;          

wire    [39 :0]  apb_xx_paddr;     
wire             apb_xx_penable;   
wire    [31 :0]  apb_xx_pwdata;    
wire             apb_xx_pwrite;    
wire    [7  :0]  b_pad_gpio_porta; 
wire    [39 :0]  biu_pad_haddr;    
wire    [3  :0]  biu_pad_hprot;    
wire    [1  :0]  biu_pad_lpmd_b;   
wire             clk_en;           
wire    [31 :0]  clkgen_apb_prdata; 
wire    [31 :0]  gpio_apb_prdata;  
wire    [7  :0]  gpio_intc_int;    
wire    [39 :0]  haddr_s2;         
wire    [2  :0]  hburst_s2;        
wire             hmastlock;        
wire    [3  :0]  hprot_s2;         
wire    [127:0]  hrdata_s2;        
wire             hready_s2;        
wire    [1  :0]  hresp_s2;         
wire             hsel_s2;          
wire    [2  :0]  hsize_s2;         
wire    [1  :0]  htrans_s2;        
wire    [127:0]  hwdata_s2;        
wire             hwrite_s2;        
wire             i_pad_clk;        
wire    [2  :0]  pad_biu_clkratio; 
wire             pad_cpu_rst_b;    
wire             per_clk;          
wire    [31 :0]  stim_apb_prdata;  
wire    [3  :0]  stim_intc_int;    
wire    [31 :0]  tim_apb_prdata;   
wire    [3  :0]  tim_intc_int;     
wire             uart0_intc_int;   
wire             uart0_sin;        
wire             uart0_sout;       
wire    [31 :0]  uart_apb_prdata;  
wire    [39 :0]  xx_intc_vld;      


wire             gate_en0;              
wire             gate_en1;              
wire             pmu_cpu_pwr_on ; 
wire             pmu_cpu_iso_in ; 
wire             pmu_cpu_iso_out; 
wire             pmu_cpu_save   ; 
wire             pmu_cpu_restore; 
wire             merged_int_vld; 
wire    [31:0 ]  pmu_apb_prdata;        


ahb2apb  x_ahb2apb (
  .apb_haddr       (apb_haddr      ),
  .apb_hburst      (apb_hburst     ),
  .apb_hrdata      (apb_hrdata     ),
  .apb_hready      (apb_hready     ),
  .apb_hresp       (apb_hresp      ),
  .apb_hsel        (apb_hsel       ),
  .apb_hsize       (apb_hsize      ),
  .apb_htrans      (apb_htrans     ),
  .apb_hwdata      (apb_hwdata     ),
  .apb_hwrite      (apb_hwrite     ),
  .haddr_s2        (haddr_s2       ),
  .hburst_s2       (hburst_s2      ),
  .hmastlock       (hmastlock      ),
  .hprot_s2        (hprot_s2       ),
  .hrdata_s2       (hrdata_s2      ),
  .hready_s2       (hready_s2      ),
  .hresp_s2        (hresp_s2       ),
  .hsel_s2         (hsel_s2        ),
  .hsize_s2        (hsize_s2       ),
  .htrans_s2       (htrans_s2      ),
  .hwdata_s2       (hwdata_s2      ),
  .hwrite_s2       (hwrite_s2      ),
  .pad_cpu_rst_b   (pad_cpu_rst_b  ),
  .pll_core_cpuclk (per_clk        )
);

apb_bridge  x_apb_bridge (
  .apb_harb_hrdata   (apb_hrdata       ),
  .apb_harb_hready   (apb_hready       ),
  .apb_harb_hresp    (apb_hresp        ),
  .apb_xx_paddr      (apb_xx_paddr     ),
  .apb_xx_penable    (apb_xx_penable   ),
  .apb_xx_pwdata     (apb_xx_pwdata    ),
  .apb_xx_pwrite     (apb_xx_pwrite    ),
  .harb_apb_hsel     (apb_hsel         ),
  .harb_xx_haddr     (apb_haddr        ),
  .harb_xx_hwdata    (apb_hwdata       ),
  .harb_xx_hwrite    (apb_hwrite       ),
  .hclk              (per_clk          ),
  .hrst_b            (pad_cpu_rst_b    ),
  .prdata_s1         (uart_apb_prdata  ),
  .prdata_s2         (tim_apb_prdata   ),
  .prdata_s3         (pmu_apb_prdata   ),
  .prdata_s4         (32'h0            ),
  .prdata_s5         (gpio_apb_prdata  ),
  .prdata_s6         (clkgen_apb_prdata),
  .prdata_s7         (stim_apb_prdata  ),
  .psel_s1           (apb_uart_psel    ),
  .psel_s2           (apb_tim_psel     ),
  .psel_s3           (apb_pmu_psel     ),
  .psel_s4           (apb_intc_psel    ),
  .psel_s5           (apb_gpio_psel    ),
  .psel_s6           (apb_clkgen_psel  ),
  .psel_s7           (apb_stim_psel    )
);

uart  x_uart (
  .apb_uart_paddr   (apb_xx_paddr    ),
  .apb_uart_penable (apb_xx_penable  ),
  .apb_uart_psel    (apb_uart_psel   ),
  .apb_uart_pwdata  (apb_xx_pwdata   ),
  .apb_uart_pwrite  (apb_xx_pwrite   ),
  .rst_b            (pad_cpu_rst_b   ),
  .s_in             (uart0_sin       ),
  .s_out            (uart0_sout      ),
  .sys_clk          (per_clk         ),
  .uart_apb_prdata  (uart_apb_prdata ),
  .uart_vic_int     (uart0_intc_int  )
);

timer  x_timer (
  .paddr              (apb_xx_paddr[15:0]),
  .pclk               (per_clk           ),
  .penable            (apb_xx_penable    ),
  .prdata             (tim_apb_prdata    ),
  .presetn            (pad_cpu_rst_b     ),
  .psel               (apb_tim_psel      ),
  .pwdata             (apb_xx_pwdata     ),
  .pwrite             (apb_xx_pwrite     ),
  .timer_int          (tim_intc_int      )
);


gpio  x_gpio (
  .b_pad_gpio_porta  (b_pad_gpio_porta ),
  .gpio_intr         (gpio_intc_int    ),
  .paddr             (apb_xx_paddr[6:2]),
  .pclk              (per_clk          ),
  .pclk_intr         (per_clk          ),
  .penable           (apb_xx_penable   ),
  .prdata            (gpio_apb_prdata  ),
  .presetn           (pad_cpu_rst_b    ),
  .psel              (apb_gpio_psel    ),
  .pwdata            (apb_xx_pwdata    ),
  .pwrite            (apb_xx_pwrite    )
);

timer  x_stimer (
  .paddr              (apb_xx_paddr[15:0]),
  .pclk               (per_clk           ),
  .penable            (apb_xx_penable    ),
  .prdata             (stim_apb_prdata   ),
  .presetn            (pad_cpu_rst_b     ),
  .psel               (apb_stim_psel     ),
  .pwdata             (apb_xx_pwdata     ),
  .pwrite             (apb_xx_pwrite     ),
  .timer_int          (stim_intc_int[3:0])
);

clk_gen  x_clk_gen (
  .clk_en             (clk_en            ),
  .clkrst_b           (pad_cpu_rst_b     ),
  .i_pad_clk          (i_pad_clk         ),
  .gate_en0           (gate_en0          ),
  .gate_en1           (gate_en1          ),
  .pad_biu_clkratio   (pad_biu_clkratio  ),
  .penable            (apb_xx_penable    ),
  .per_clk            (per_clk           ),
  .cpu_clk            (cpu_clk           ),
  .prdata             (clkgen_apb_prdata ),
  .psel               (apb_clkgen_psel   ),
  .pwdata             (apb_xx_pwdata[2:0]),
  .pwrite             (apb_xx_pwrite     )
);

pmu  x_pmu (
  .apb_pmu_paddr          (apb_xx_paddr[11:0]    ),
  .apb_pmu_penable        (apb_xx_penable        ),
  .apb_pmu_psel           (apb_pmu_psel          ),
  .apb_pmu_pwdata         (apb_xx_pwdata         ),
  .apb_pmu_pwrite         (apb_xx_pwrite         ),
  .biu_pad_lpmd_b         (biu_pad_lpmd_b        ),
  .corec_pmu_sleep_out    (),
  .cpu_clk                (cpu_clk               ),	// Sample lpmd from CPU
  .gate_en0               (gate_en0              ),
  .gate_en1               (gate_en1              ),
  .had_pad_wakeup_req_b   (1'b1                  ),
  .i_pad_cpu_jtg_rst_b    (1'b1                  ),
  .i_pad_jtg_tclk         (1'b1                  ),
  .intraw_vld             (merged_int_vld        ),
  .pad_cpu_rst_b          (pad_cpu_rst_b         ),
  .pad_had_jdb_req_b      (                      ),
  .pad_had_jtg_tap_en     (1'b0                  ),
  .pad_had_jtg_tms        (1'b0                  ),
  .pad_had_jtg_trst_b     (                      ),
  .pad_had_jtg_trst_b_pre (1'b1                  ),
  .pg_reset_b             (                      ),	// output from pmu
  .pmu_apb_prdata         (pmu_apb_prdata        ),
  .pmu_clk                (per_clk               ),
  .pmu_cpu_pwr_on         (pmu_cpu_pwr_on        ), 
  .pmu_cpu_iso_in         (pmu_cpu_iso_in        ), 
  .pmu_cpu_iso_out        (pmu_cpu_iso_out       ), 
  .pmu_cpu_save           (pmu_cpu_save          ), 
  .pmu_cpu_restore        (pmu_cpu_restore       ) 
);

assign merged_int_vld = | xx_intc_vld[39:0];
assign xx_intc_vld[39:0] = {21'b0,stim_intc_int[3:0],gpio_intc_int[7:0],1'b0,tim_intc_int[3:0],1'b0,uart0_intc_int};


//clk_aligner x_clk_aligner (
//  .clk_div_1         (sclk_div_1       ),
//  .clk_div_2         (sclk_div_2       ),
//  .clk_div_3         (sclk_div_3       ),
//  .clk_div_4         (sclk_div_4       ),
//  .clk_div_5         (sclk_div_5       ),
//  .clk_div_6         (sclk_div_6       ),
//  .clk_div_7         (sclk_div_7       ),
//  .clk_div_8         (sclk_div_8       ),
//  .clk_en            (sclk_en          ),
//  .clk_en_1          (sclk_en_1        ),
//  .clk_en_2          (sclk_en_2        ),
//  .clk_en_3          (sclk_en_3        ),
//  .clk_en_4          (sclk_en_4        ),
//  .clk_en_5          (sclk_en_5        ),
//  .clk_en_6          (sclk_en_6        ),
//  .clk_en_7          (sclk_en_7        ),
//  .clk_en_8          (sclk_en_8        ),
//  .clkgen_ahbclk     (sclkgen_ahbclk   ),
//  .clkgen_apbclk     (sclkgen_apbclk   ),
//  .clkgen_cpuclk     (sclkgen_cpuclk   ),
//  .forever_cpuclk    (top_osc_clk      ),
//  .pad_biu_clkratio  (top_cpu_sclkratio)
//);
//
//clk_divider x_clk_divider (
//  .clk_div_1   (sclk_div_1 ),
//  .clk_div_2   (sclk_div_2 ),
//  .clk_div_3   (sclk_div_3 ),
//  .clk_div_4   (sclk_div_4 ),
//  .clk_div_5   (sclk_div_5 ),
//  .clk_div_6   (sclk_div_6 ),
//  .clk_div_7   (sclk_div_7 ),
//  .clk_div_8   (sclk_div_8 ),
//  .clk_en_1    (sclk_en_1  ),
//  .clk_en_2    (sclk_en_2  ),
//  .clk_en_3    (sclk_en_3  ),
//  .clk_en_4    (sclk_en_4  ),
//  .clk_en_5    (sclk_en_5  ),
//  .clk_en_6    (sclk_en_6  ),
//  .clk_en_7    (sclk_en_7  ),
//  .clk_en_8    (sclk_en_8  ),
//  .osc_clk     (i_pad_clk  )
//)
//
//
//

endmodule


