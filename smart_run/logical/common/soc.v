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


module soc(
  b_pad_gpio_porta,
  i_pad_clk,
  i_pad_jtg_tclk,
  i_pad_jtg_tdi,
  i_pad_jtg_tms,
  i_pad_jtg_trst_b,
  i_pad_rst_b,
  i_pad_uart0_sin,
  o_pad_jtg_tdo,
  o_pad_uart0_sout
);

input            i_pad_clk;            
input            i_pad_jtg_tclk;       
input            i_pad_jtg_tdi;        
input            i_pad_jtg_tms;        
input            i_pad_jtg_trst_b;     
input            i_pad_rst_b;          
input            i_pad_uart0_sin;      
output           o_pad_jtg_tdo;        
output           o_pad_uart0_sout;     
inout   [7  :0]  b_pad_gpio_porta;     


wire             arready_s0;           
wire             arready_s1;           
wire             arready_s2;           
wire             arready_s3;           
wire             arvalid_s0;           
wire             arvalid_s1;           
wire             arvalid_s2;           
wire             arvalid_s3;           
wire             awready_s0;           
wire             awready_s1;           
wire             awready_s2;           
wire             awready_s3;           
wire             awvalid_s0;           
wire             awvalid_s1;           
wire             awvalid_s2;           
wire             awvalid_s3;           
wire    [7  :0]  b_pad_gpio_porta;     
wire    [7  :0]  bid_s0;               
wire    [7  :0]  bid_s1;               
wire    [7  :0]  bid_s2;               
wire    [7  :0]  bid_s3;               
wire    [39 :0]  biu_pad_araddr;       
wire    [1  :0]  biu_pad_arburst;      
wire    [3  :0]  biu_pad_arcache;      
wire    [7  :0]  biu_pad_arid;         
wire    [7  :0]  biu_pad_arlen;        
wire             biu_pad_arlock;       
wire    [2  :0]  biu_pad_arprot;       
wire    [2  :0]  biu_pad_arsize;       
wire             biu_pad_arvalid;      
wire    [39 :0]  biu_pad_awaddr;       
wire    [1  :0]  biu_pad_awburst;      
wire    [3  :0]  biu_pad_awcache;      
wire    [7  :0]  biu_pad_awid;         
wire    [7  :0]  biu_pad_awlen;        
wire             biu_pad_awlock;       
wire    [2  :0]  biu_pad_awprot;       
wire    [2  :0]  biu_pad_awsize;       
wire             biu_pad_awvalid;      
wire             biu_pad_bready;       
wire    [39 :0]  biu_pad_haddr;        
wire    [2  :0]  biu_pad_hburst;       
wire             biu_pad_hbusreq;      
wire             biu_pad_hlock;        
wire    [3  :0]  biu_pad_hprot;        
wire    [2  :0]  biu_pad_hsize;        
wire    [1  :0]  biu_pad_htrans;       
wire    [1  :0]  biu_pad_htrans_dly;   
wire    [127:0]  biu_pad_hwdata;       
wire             biu_pad_hwrite;       
wire             biu_pad_hwrite_dly;   
wire    [1  :0]  biu_pad_lpmd_b;       
// wire             biu_pad_retire_0;     
// wire             biu_pad_retire_1;     
// wire             biu_pad_retire_2;     
// wire    [39 :0]  biu_pad_retire_pc_0;  
// wire    [39 :0]  biu_pad_retire_pc_1;  
// wire    [39 :0]  biu_pad_retire_pc_2;  
wire             biu_pad_rready;       
// wire    [63 :0]  biu_pad_wb_gpr_data_0; 
// wire    [63 :0]  biu_pad_wb_gpr_data_1; 
// wire    [63 :0]  biu_pad_wb_gpr_data_2; 
// wire             biu_pad_wb_gpr_en_0;  
// wire             biu_pad_wb_gpr_en_1;  
// wire             biu_pad_wb_gpr_en_2;  
wire    [127:0]  biu_pad_wdata;        
wire    [7  :0]  biu_pad_wid;          
wire             biu_pad_wlast;        
wire    [15 :0]  biu_pad_wstrb;        
wire             biu_pad_wvalid;       
wire             bready_s0;            
wire             bready_s1;            
wire             bready_s2;            
wire             bready_s3;            
wire    [1  :0]  bresp_s0;             
wire    [1  :0]  bresp_s1;             
wire    [1  :0]  bresp_s2;             
wire    [1  :0]  bresp_s3;             
wire             bvalid_s0;            
wire             bvalid_s1;            
wire             bvalid_s2;            
wire             bvalid_s3;            
wire             axim_clk_en;               
wire             fifo_biu_arready;     
wire    [39 :0]  fifo_pad_araddr;      
wire    [1  :0]  fifo_pad_arburst;     
wire    [3  :0]  fifo_pad_arcache;     
wire    [7  :0]  fifo_pad_arid;        
wire    [7  :0]  fifo_pad_arlen;       
wire             fifo_pad_arlock;      
wire    [2  :0]  fifo_pad_arprot;      
wire    [2  :0]  fifo_pad_arsize;      
wire             fifo_pad_artrust;     
wire             fifo_pad_arvalid;     
wire             had_pad_jtg_tdo;      
wire             had_pad_jtg_tdo_en;      
wire    [39 :0]  haddr_dly;            
wire    [39 :0]  haddr_s1;             
wire    [39 :0]  haddr_s2;             
wire    [39 :0]  haddr_s3;             
wire    [2  :0]  hburst_s1;            
wire    [2  :0]  hburst_s2;            
wire    [2  :0]  hburst_s3;            
wire             hmastlock;            
wire    [3  :0]  hprot_s1;             
wire    [3  :0]  hprot_s2;             
wire    [3  :0]  hprot_s3;             
wire    [127:0]  hrdata_s1;            
wire    [127:0]  hrdata_s2;            
wire    [127:0]  hrdata_s3;            
wire             hready_s1;            
wire             hready_s2;            
wire             hready_s3;            
wire    [1  :0]  hresp_s1;             
wire    [1  :0]  hresp_s2;             
wire    [1  :0]  hresp_s3;             
wire             hsel_s1;              
wire             hsel_s2;              
wire             hsel_s3;              
wire    [2  :0]  hsize_s1;             
wire    [2  :0]  hsize_s2;             
wire    [2  :0]  hsize_s3;             
wire    [1  :0]  htrans_s1;            
wire    [1  :0]  htrans_s2;            
wire    [1  :0]  htrans_s3;            
wire    [127:0]  hwdata_s1;            
wire    [127:0]  hwdata_s2;            
wire    [127:0]  hwdata_s3;            
wire             hwrite_s1;            
wire             hwrite_s2;            
wire             hwrite_s3;            
wire             i_pad_clk;            
wire             cpu_clk;            
wire             i_pad_jtg_tclk;       
wire             i_pad_jtg_tdi;        
wire             i_pad_jtg_tms;        
wire             i_pad_jtg_trst_b;     
wire             i_pad_rst_b;          
wire             i_pad_uart0_sin;      
wire             o_pad_jtg_tdo;        
wire             o_pad_uart0_sout;     
wire             pad_biu_arready;      
wire             pad_biu_awready;      
wire    [7  :0]  pad_biu_bid;          
wire    [1  :0]  pad_biu_bresp;        
wire             pad_biu_bvalid;       
wire             pad_biu_hgrant;       
wire    [127:0]  pad_biu_hrdata;       
wire             pad_biu_hready;       
wire    [1  :0]  pad_biu_hresp;        
wire    [127:0]  pad_biu_rdata;        
wire    [7  :0]  pad_biu_rid;          
wire             pad_biu_rlast;        
wire    [1  :0]  pad_biu_rresp;        
wire             pad_biu_rvalid;       
wire             pad_biu_wready;       
wire             pad_cpu_rst_b;        
wire             pad_had_jtg_tclk;     
wire             pad_had_jtg_tdi;      
wire             pad_had_jtg_trst_b;   
wire             per_clk;              
wire             pll_cpu_clk;      
wire    [127:0]  rdata_s0;             
wire    [127:0]  rdata_s1;             
wire    [127:0]  rdata_s2;             
wire    [127:0]  rdata_s3;             
wire    [7  :0]  rid_s0;               
wire    [7  :0]  rid_s1;               
wire    [7  :0]  rid_s2;               
wire    [7  :0]  rid_s3;               
wire             rlast_s0;             
wire             rlast_s1;             
wire             rlast_s2;             
wire             rlast_s3;             
wire             rready_s0;            
wire             rready_s1;            
wire             rready_s2;            
wire             rready_s3;            
wire    [1  :0]  rresp_s0;             
wire    [1  :0]  rresp_s1;             
wire    [1  :0]  rresp_s2;             
wire    [1  :0]  rresp_s3;             
wire             rvalid_s0;            
wire             rvalid_s1;            
wire             rvalid_s2;            
wire             rvalid_s3;            
wire             uart0_sin;            
wire             uart0_sout;           
wire             wready_s0;            
wire             wready_s1;            
wire             wready_s2;            
wire             wready_s3;            
wire             wvalid_s0;            
wire             wvalid_s1;            
wire             wvalid_s2;            
wire             wvalid_s3;            
wire    [39 :0]  xx_intc_vld;          

`ifdef PMU_LP_MODE_TEST
wire             pmu_cpu_pwr_on ; 
wire             pmu_cpu_iso_in ; 
wire             pmu_cpu_iso_out; 
wire             pmu_cpu_save   ; 
wire             pmu_cpu_restore; 
`endif

cpu_sub_system_axi  x_cpu_sub_system_axi (
  .biu_pad_araddr        (biu_pad_araddr       ),
  .biu_pad_arburst       (biu_pad_arburst      ),
  .biu_pad_arcache       (biu_pad_arcache      ),
  .biu_pad_arid          (biu_pad_arid         ),
  .biu_pad_arlen         (biu_pad_arlen        ),
  .biu_pad_arlock        (biu_pad_arlock       ),
  .biu_pad_arprot        (biu_pad_arprot       ),
  .biu_pad_arsize        (biu_pad_arsize       ),
  .biu_pad_arvalid       (biu_pad_arvalid      ),
  .biu_pad_awaddr        (biu_pad_awaddr       ),
  .biu_pad_awburst       (biu_pad_awburst      ),
  .biu_pad_awcache       (biu_pad_awcache      ),
  .biu_pad_awid          (biu_pad_awid         ),
  .biu_pad_awlen         (biu_pad_awlen        ),
  .biu_pad_awlock        (biu_pad_awlock       ),
  .biu_pad_awprot        (biu_pad_awprot       ),
  .biu_pad_awsize        (biu_pad_awsize       ),
  .biu_pad_awvalid       (biu_pad_awvalid      ),
  .biu_pad_bready        (biu_pad_bready       ),
  .biu_pad_lpmd_b        (biu_pad_lpmd_b       ),
  .biu_pad_rready        (biu_pad_rready       ),
  .biu_pad_wdata         (biu_pad_wdata        ),
  .biu_pad_wid           (biu_pad_wid          ),
  .biu_pad_wlast         (biu_pad_wlast        ),
  .biu_pad_wstrb         (biu_pad_wstrb        ),
  .biu_pad_wvalid        (biu_pad_wvalid       ),
  .axim_clk_en           (axim_clk_en          ),
  .had_pad_jtg_tdo       (had_pad_jtg_tdo      ),
  .had_pad_jtg_tdo_en    (had_pad_jtg_tdo_en   ),
  .i_pad_jtg_tms         (i_pad_jtg_tms        ),
  .pad_biu_arready       (fifo_biu_arready     ),
  .pad_biu_awready       (pad_biu_awready      ),
  .pad_biu_bid           (pad_biu_bid          ),
  .pad_biu_bresp         (pad_biu_bresp        ),
  .pad_biu_bvalid        (pad_biu_bvalid       ),
  .pad_biu_rdata         (pad_biu_rdata        ),
  .pad_biu_rid           (pad_biu_rid          ),
  .pad_biu_rlast         (pad_biu_rlast        ),
  .pad_biu_rresp         ({2'b0,pad_biu_rresp} ),
  .pad_biu_rvalid        (pad_biu_rvalid       ),
  .pad_biu_wready        (pad_biu_wready       ),
  .pad_cpu_rst_b         (pad_cpu_rst_b        ),
  .pad_yy_dft_clk_rst_b  (pad_cpu_rst_b        ),
  .pad_had_jtg_tclk      (pad_had_jtg_tclk     ),
  .pad_had_jtg_tdi       (pad_had_jtg_tdi      ),
  .pad_had_jtg_trst_b    (pad_had_jtg_trst_b   ),
`ifdef PMU_LP_MODE_TEST
  .pmu_cpu_pwr_on         (pmu_cpu_pwr_on      ), 
  .pmu_cpu_iso_in         (pmu_cpu_iso_in      ), 
  .pmu_cpu_iso_out        (pmu_cpu_iso_out     ), 
  .pmu_cpu_save           (pmu_cpu_save        ), 
  .pmu_cpu_restore        (pmu_cpu_restore     ), 
`endif
  .per_clk               (per_clk              ),
  .pll_cpu_clk           (pll_cpu_clk      ),
  .xx_intc_vld           (xx_intc_vld          )
);

assign pad_cpu_rst_b = i_pad_rst_b;
assign pll_cpu_clk =  cpu_clk;

assign pad_had_jtg_tclk   = i_pad_jtg_tclk;
assign pad_had_jtg_tdi    = i_pad_jtg_tdi;
assign pad_had_jtg_trst_b = i_pad_jtg_trst_b;

assign uart0_sin = i_pad_uart0_sin;

assign o_pad_jtg_tdo = had_pad_jtg_tdo;
assign o_pad_uart0_sout = uart0_sout;

axi_interconnect128  x_axi_interconnect (
  .aclk             (per_clk         ),
  .araddr           (fifo_pad_araddr ),
  .aresetn          (pad_cpu_rst_b   ),
  .arready          (pad_biu_arready ),
  .arready_s0       (arready_s0      ),
  .arready_s1       (arready_s1      ),
  .arready_s2       (arready_s2      ),
  .arready_s3       (arready_s3      ),
  .arvalid          (fifo_pad_arvalid),
  .arvalid_s0       (arvalid_s0      ),
  .arvalid_s1       (arvalid_s1      ),
  .arvalid_s2       (arvalid_s2      ),
  .arvalid_s3       (arvalid_s3      ),
  .awaddr           (biu_pad_awaddr  ),
  .awid             (biu_pad_awid    ),
  .awready          (pad_biu_awready ),
  .awready_s0       (awready_s0      ),
  .awready_s1       (awready_s1      ),
  .awready_s2       (awready_s2      ),
  .awready_s3       (awready_s3      ),
  .awvalid          (biu_pad_awvalid ),
  .awvalid_s0       (awvalid_s0      ),
  .awvalid_s1       (awvalid_s1      ),
  .awvalid_s2       (awvalid_s2      ),
  .awvalid_s3       (awvalid_s3      ),
  .bid              (pad_biu_bid     ),
  .bid_s0           (bid_s0          ),
  .bid_s1           (bid_s1          ),
  .bid_s2           (bid_s2          ),
  .bid_s3           (bid_s3          ),
  .bready           (biu_pad_bready  ),
  .bready_s0        (bready_s0       ),
  .bready_s1        (bready_s1       ),
  .bready_s2        (bready_s2       ),
  .bready_s3        (bready_s3       ),
  .bresp            (pad_biu_bresp   ),
  .bresp_s0         (bresp_s0        ),
  .bresp_s1         (bresp_s1        ),
  .bresp_s2         (bresp_s2        ),
  .bresp_s3         (bresp_s3        ),
  .bvalid           (pad_biu_bvalid  ),
  .bvalid_s0        (bvalid_s0       ),
  .bvalid_s1        (bvalid_s1       ),
  .bvalid_s2        (bvalid_s2       ),
  .bvalid_s3        (bvalid_s3       ),
  .rdata            (pad_biu_rdata   ),
  .rdata_s0         (rdata_s0        ),
  .rdata_s1         (rdata_s1        ),
  .rdata_s2         (rdata_s2        ),
  .rdata_s3         (rdata_s3        ),
  .rid              (pad_biu_rid     ),
  .rid_s0           (rid_s0          ),
  .rid_s1           (rid_s1          ),
  .rid_s2           (rid_s2          ),
  .rid_s3           (rid_s3          ),
  .rlast            (pad_biu_rlast   ),
  .rlast_s0         (rlast_s0        ),
  .rlast_s1         (rlast_s1        ),
  .rlast_s2         (rlast_s2        ),
  .rlast_s3         (rlast_s3        ),
  .rready           (biu_pad_rready  ),
  .rready_s0        (rready_s0       ),
  .rready_s1        (rready_s1       ),
  .rready_s2        (rready_s2       ),
  .rready_s3        (rready_s3       ),
  .rresp            (pad_biu_rresp   ),
  .rresp_s0         (rresp_s0        ),
  .rresp_s1         (rresp_s1        ),
  .rresp_s2         (rresp_s2        ),
  .rresp_s3         (rresp_s3        ),
  .rvalid           (pad_biu_rvalid  ),
  .rvalid_s0        (rvalid_s0       ),
  .rvalid_s1        (rvalid_s1       ),
  .rvalid_s2        (rvalid_s2       ),
  .rvalid_s3        (rvalid_s3       ),
  .wid              (biu_pad_wid     ),
  .wlast            (biu_pad_wlast   ),
  .wready           (pad_biu_wready  ),
  .wready_s0        (wready_s0       ),
  .wready_s1        (wready_s1       ),
  .wready_s2        (wready_s2       ),
  .wready_s3        (wready_s3       ),
  .wvalid           (biu_pad_wvalid  ),
  .wvalid_s0        (wvalid_s0       ),
  .wvalid_s1        (wvalid_s1       ),
  .wvalid_s2        (wvalid_s2       ),
  .wvalid_s3        (wvalid_s3       )
);

axi_fifo  x_axi_fifo (
  .biu_pad_araddr   (biu_pad_araddr  ),
  .biu_pad_arburst  (biu_pad_arburst ),
  .biu_pad_arcache  (biu_pad_arcache ),
  .biu_pad_arid     (biu_pad_arid    ),
  .biu_pad_arlen    (biu_pad_arlen   ),
  .biu_pad_arlock   (biu_pad_arlock  ),
  .biu_pad_arprot   (biu_pad_arprot  ),
  .biu_pad_arsize   (biu_pad_arsize  ),
  .biu_pad_arvalid  (biu_pad_arvalid ),
  .counter_num0     (32'd0           ),
  .counter_num1     (32'd0           ),
  .counter_num2     (32'd0           ),
  .counter_num3     (32'd0           ),
  .counter_num4     (32'd0           ),
  .counter_num5     (32'd0           ),
  .counter_num6     (32'd0           ),
  .counter_num7     (32'd0           ),
  .cpu_clk          (per_clk         ),
  .cpu_rst_b        (pad_cpu_rst_b   ),
  .fifo_biu_arready (fifo_biu_arready),
  .fifo_pad_araddr  (fifo_pad_araddr ),
  .fifo_pad_arburst (fifo_pad_arburst),
  .fifo_pad_arcache (fifo_pad_arcache),
  .fifo_pad_arid    (fifo_pad_arid   ),
  .fifo_pad_arlen   (fifo_pad_arlen  ),
  .fifo_pad_arlock  (fifo_pad_arlock ),
  .fifo_pad_arprot  (fifo_pad_arprot ),
  .fifo_pad_arsize  (fifo_pad_arsize ),
  .fifo_pad_artrust (fifo_pad_artrust),
  .fifo_pad_arvalid (fifo_pad_arvalid),
  .pad_biu_arready  (pad_biu_arready )
);

axi_slave128  x_axi_slave128 (
  .araddr_s0        (fifo_pad_araddr ),
  .arburst_s0       (fifo_pad_arburst),
  .arcache_s0       (fifo_pad_arcache),
  .arid_s0          (fifo_pad_arid   ),
  .arlen_s0         (fifo_pad_arlen  ),
  .arprot_s0        (fifo_pad_arprot ),
  .arready_s0       (arready_s0      ),
  .arsize_s0        (fifo_pad_arsize ),
  .arvalid_s0       (arvalid_s0      ),
  .awaddr_s0        (biu_pad_awaddr  ),
  .awburst_s0       (biu_pad_awburst ),
  .awcache_s0       (biu_pad_awcache ),
  .awid_s0          (biu_pad_awid    ),
  .awlen_s0         (biu_pad_awlen   ),
  .awprot_s0        (biu_pad_awprot  ),
  .awready_s0       (awready_s0      ),
  .awsize_s0        (biu_pad_awsize  ),
  .awvalid_s0       (awvalid_s0      ),
  .bid_s0           (bid_s0          ),
  .bready_s0        (bready_s0       ),
  .bresp_s0         (bresp_s0        ),
  .bvalid_s0        (bvalid_s0       ),
  .pad_cpu_rst_b    (pad_cpu_rst_b   ),
  .pll_core_cpuclk  (per_clk         ),
  .rdata_s0         (rdata_s0        ),
  .rid_s0           (rid_s0          ),
  .rlast_s0         (rlast_s0        ),
  .rready_s0        (rready_s0       ),
  .rresp_s0         (rresp_s0        ),
  .rvalid_s0        (rvalid_s0       ),
  .wdata_s0         (biu_pad_wdata   ),
  .wid_s0           (biu_pad_wid     ),
  .wlast_s0         (biu_pad_wlast   ),
  .wready_s0        (wready_s0       ),
  .wstrb_s0         (biu_pad_wstrb   ),
  .wvalid_s0        (wvalid_s0       )
);

axi_err128  x_axi_err (
  .araddr_s1        (fifo_pad_araddr ),
  .arburst_s1       (fifo_pad_arburst),
  .arcache_s1       (fifo_pad_arcache),
  .arid_s1          (fifo_pad_arid   ),
  .arlen_s1         (fifo_pad_arlen  ),
  .arprot_s1        (fifo_pad_arprot ),
  .arready_s1       (arready_s1      ),
  .arsize_s1        (fifo_pad_arsize ),
  .arvalid_s1       (arvalid_s1      ),
  .awaddr_s1        (biu_pad_awaddr  ),
  .awburst_s1       (biu_pad_awburst ),
  .awcache_s1       (biu_pad_awcache ),
  .awid_s1          (biu_pad_awid    ),
  .awlen_s1         (biu_pad_awlen   ),
  .awprot_s1        (biu_pad_awprot  ),
  .awready_s1       (awready_s1      ),
  .awsize_s1        (biu_pad_awsize  ),
  .awvalid_s1       (awvalid_s1      ),
  .bid_s1           (bid_s1          ),
  .bready_s1        (bready_s1       ),
  .bresp_s1         (bresp_s1        ),
  .bvalid_s1        (bvalid_s1       ),
  .pad_cpu_rst_b    (pad_cpu_rst_b   ),
  .pll_core_cpuclk  (per_clk         ),
  .rdata_s1         (rdata_s1        ),
  .rid_s1           (rid_s1          ),
  .rlast_s1         (rlast_s1        ),
  .rready_s1        (rready_s1       ),
  .rresp_s1         (rresp_s1        ),
  .rvalid_s1        (rvalid_s1       ),
  .wdata_s1         (biu_pad_wdata   ),
  .wid_s1           (biu_pad_wid     ),
  .wlast_s1         (biu_pad_wlast   ),
  .wready_s1        (wready_s1       ),
  .wstrb_s1         (biu_pad_wstrb   ),
  .wvalid_s1        (wvalid_s1       )
);


axi2ahb  x_axi2ahb (
  .biu_pad_araddr   (fifo_pad_araddr ),
  .biu_pad_arburst  (fifo_pad_arburst),
  .biu_pad_arcache  (fifo_pad_arcache),
  .biu_pad_arid     (fifo_pad_arid   ),
  .biu_pad_arlen    (fifo_pad_arlen  ),
  .biu_pad_arlock   (fifo_pad_arlock ),
  .biu_pad_arprot   (fifo_pad_arprot ),
  .biu_pad_arsize   (fifo_pad_arsize ),
  .biu_pad_artrust  (fifo_pad_artrust),
  .biu_pad_arvalid  (arvalid_s2      ),
  .biu_pad_awaddr   (biu_pad_awaddr  ),
  .biu_pad_awburst  (biu_pad_awburst ),
  .biu_pad_awcache  (biu_pad_awcache ),
  .biu_pad_awid     (biu_pad_awid    ),
  .biu_pad_awlen    (biu_pad_awlen   ),
  .biu_pad_awlock   (biu_pad_awlock  ),
  .biu_pad_awprot   (biu_pad_awprot  ),
  .biu_pad_awsize   (biu_pad_awsize  ),
  .biu_pad_awvalid  (awvalid_s2      ),
  .biu_pad_bready   (bready_s2       ),
  .biu_pad_haddr    (biu_pad_haddr   ),
  .biu_pad_hburst   (biu_pad_hburst  ),
  .biu_pad_hbusreq  (biu_pad_hbusreq ),
  .biu_pad_hlock    (biu_pad_hlock   ),
  .biu_pad_hprot    (biu_pad_hprot   ),
  .biu_pad_hsize    (biu_pad_hsize   ),
  .biu_pad_htrans   (biu_pad_htrans  ),
  .biu_pad_hwdata   (biu_pad_hwdata  ),
  .biu_pad_hwrite   (biu_pad_hwrite  ),
  .biu_pad_rready   (rready_s2       ),
  .biu_pad_wdata    (biu_pad_wdata   ),
  .biu_pad_wid      (biu_pad_wid     ),
  .biu_pad_wlast    (biu_pad_wlast   ),
  .biu_pad_wstrb    (biu_pad_wstrb   ),
  .biu_pad_wvalid   (wvalid_s2       ),
  .pad_biu_arready  (arready_s2      ),
  .pad_biu_awready  (awready_s2      ),
  .pad_biu_bid      (bid_s2          ),
  .pad_biu_bresp    (bresp_s2        ),
  .pad_biu_bvalid   (bvalid_s2       ),
  .pad_biu_hgrant   (pad_biu_hgrant  ),
  .pad_biu_hrdata   (pad_biu_hrdata  ),
  .pad_biu_hready   (pad_biu_hready  ),
  .pad_biu_hresp    (pad_biu_hresp   ),
  .pad_biu_rdata    (rdata_s2        ),
  .pad_biu_rid      (rid_s2          ),
  .pad_biu_rlast    (rlast_s2        ),
  .pad_biu_rresp    (rresp_s2        ),
  .pad_biu_rvalid   (rvalid_s2       ),
  .pad_biu_wready   (wready_s2       ),
  .pad_cpu_rst_b    (pad_cpu_rst_b   ),
  .pll_core_cpuclk  (per_clk         )
);


axi_err128  x_axi_err1 (
  .araddr_s1        (fifo_pad_araddr ),
  .arburst_s1       (fifo_pad_arburst),
  .arcache_s1       (fifo_pad_arcache),
  .arid_s1          (fifo_pad_arid   ),
  .arlen_s1         (fifo_pad_arlen  ),
  .arprot_s1        (fifo_pad_arprot ),
  .arready_s1       (arready_s3      ),
  .arsize_s1        (fifo_pad_arsize ),
  .arvalid_s1       (arvalid_s3      ),
  .awaddr_s1        (biu_pad_awaddr  ),
  .awburst_s1       (biu_pad_awburst ),
  .awcache_s1       (biu_pad_awcache ),
  .awid_s1          (biu_pad_awid    ),
  .awlen_s1         (biu_pad_awlen   ),
  .awprot_s1        (biu_pad_awprot  ),
  .awready_s1       (awready_s3      ),
  .awsize_s1        (biu_pad_awsize  ),
  .awvalid_s1       (awvalid_s3      ),
  .bid_s1           (bid_s3          ),
  .bready_s1        (bready_s3       ),
  .bresp_s1         (bresp_s3        ),
  .bvalid_s1        (bvalid_s3       ),
  .pad_cpu_rst_b    (pad_cpu_rst_b   ),
  .pll_core_cpuclk  (per_clk         ),
  .rdata_s1         (rdata_s3        ),
  .rid_s1           (rid_s3          ),
  .rlast_s1         (rlast_s3        ),
  .rready_s1        (rready_s3       ),
  .rresp_s1         (rresp_s3        ),
  .rvalid_s1        (rvalid_s3       ),
  .wdata_s1         (biu_pad_wdata   ),
  .wid_s1           (biu_pad_wid     ),
  .wlast_s1         (biu_pad_wlast   ),
  .wready_s1        (wready_s3       ),
  .wstrb_s1         (biu_pad_wstrb   ),
  .wvalid_s1        (wvalid_s3       )
);


assign #1 biu_pad_htrans_dly[1:0] = biu_pad_htrans[1:0];
assign #1 haddr_dly[39:0] = biu_pad_haddr[39:0];
assign #1 biu_pad_hwrite_dly = biu_pad_hwrite;


ahb  x_ahb (
  .biu_pad_haddr      (haddr_dly         ),
  .biu_pad_hburst     (biu_pad_hburst    ),
  .biu_pad_hbusreq    (biu_pad_hbusreq   ),
  .biu_pad_hlock      (biu_pad_hlock     ),
  .biu_pad_hprot      (biu_pad_hprot     ),
  .biu_pad_hsize      (biu_pad_hsize     ),
  .biu_pad_htrans     (biu_pad_htrans_dly),
  .biu_pad_hwdata     (biu_pad_hwdata    ),
  .biu_pad_hwrite     (biu_pad_hwrite_dly),
  .haddr_s1           (haddr_s1          ),
  .haddr_s2           (haddr_s2          ),
  .haddr_s3           (haddr_s3          ),
  .hburst_s1          (hburst_s1         ),
  .hburst_s2          (hburst_s2         ),
  .hburst_s3          (hburst_s3         ),
  .hmastlock          (hmastlock         ),
  .hprot_s1           (hprot_s1          ),
  .hprot_s2           (hprot_s2          ),
  .hprot_s3           (hprot_s3          ),
  .hrdata_s1          (hrdata_s1         ),
  .hrdata_s2          (hrdata_s2         ),
  .hrdata_s3          (hrdata_s3         ),
  .hready_s1          (hready_s1         ),
  .hready_s2          (hready_s2         ),
  .hready_s3          (hready_s3         ),
  .hresp_s1           (hresp_s1          ),
  .hresp_s2           (hresp_s2          ),
  .hresp_s3           (hresp_s3          ),
  .hsel_s1            (hsel_s1           ),
  .hsel_s2            (hsel_s2           ),
  .hsel_s3            (hsel_s3           ),
  .hsize_s1           (hsize_s1          ),
  .hsize_s2           (hsize_s2          ),
  .hsize_s3           (hsize_s3          ),
  .htrans_s1          (htrans_s1         ),
  .htrans_s2          (htrans_s2         ),
  .htrans_s3          (htrans_s3         ),
  .hwdata_s1          (hwdata_s1         ),
  .hwdata_s2          (hwdata_s2         ),
  .hwdata_s3          (hwdata_s3         ),
  .hwrite_s1          (hwrite_s1         ),
  .hwrite_s2          (hwrite_s2         ),
  .hwrite_s3          (hwrite_s3         ),
  .pad_biu_hgrant     (pad_biu_hgrant    ),
  .pad_biu_hrdata     (pad_biu_hrdata    ),
  .pad_biu_hready     (pad_biu_hready    ),
  .pad_biu_hresp      (pad_biu_hresp     ),
  .pad_cpu_rst_b      (pad_cpu_rst_b     ),
  .pll_core_cpuclk    (per_clk           )
);


mem_ctrl  x_mem_ctrl (
  .haddr_s1        (haddr_s1       ),
  .hburst_s1       (hburst_s1      ),
  .hprot_s1        (hprot_s1       ),
  .hrdata_s1       (hrdata_s1      ),
  .hready_s1       (hready_s1      ),
  .hresp_s1        (hresp_s1       ),
  .hsel_s1         (hsel_s1        ),
  .hsize_s1        (hsize_s1       ),
  .htrans_s1       (htrans_s1      ),
  .hwdata_s1       (hwdata_s1      ),
  .hwrite_s1       (hwrite_s1      ),
  .pad_cpu_rst_b   (pad_cpu_rst_b  ),
  .pll_core_cpuclk (per_clk        )
);


apb  x_apb (
  .b_pad_gpio_porta (b_pad_gpio_porta),
  .biu_pad_haddr    (haddr_dly       ),
  .biu_pad_hprot    (biu_pad_hprot   ),
  .biu_pad_lpmd_b   (biu_pad_lpmd_b  ),
  .clk_en           (axim_clk_en     ),
  .haddr_s2         (haddr_s2        ),
  .hburst_s2        (hburst_s2       ),
  .hmastlock        (hmastlock       ),
  .hprot_s2         (hprot_s2        ),
  .hrdata_s2        (hrdata_s2       ),
  .hready_s2        (hready_s2       ),
  .hresp_s2         (hresp_s2        ),
  .hsel_s2          (hsel_s2         ),
  .hsize_s2         (hsize_s2        ),
  .htrans_s2        (htrans_s2       ),
  .hwdata_s2        (hwdata_s2       ),
  .hwrite_s2        (hwrite_s2       ),
  .i_pad_clk        (i_pad_clk       ),
  .pad_biu_clkratio (                ),
  .pad_cpu_rst_b    (pad_cpu_rst_b   ),
  .per_clk          (per_clk         ),
  .cpu_clk          (cpu_clk         ),
`ifdef PMU_LP_MODE_TEST
  .pmu_cpu_pwr_on   (pmu_cpu_pwr_on  ), 
  .pmu_cpu_iso_in   (pmu_cpu_iso_in  ), 
  .pmu_cpu_iso_out  (pmu_cpu_iso_out ), 
  .pmu_cpu_save     (pmu_cpu_save    ), 
  .pmu_cpu_restore  (pmu_cpu_restore ), 
`endif
  .uart0_sin        (uart0_sin       ),
  .uart0_sout       (uart0_sout      ),
  .xx_intc_vld      (xx_intc_vld     )
);

err_gen  x_err_gen (
  .hburst_s3       (hburst_s3      ),
  .hmastlock       (hmastlock      ),
  .hprot_s3        (hprot_s3       ),
  .hrdata_s3       (hrdata_s3      ),
  .hready_s3       (hready_s3      ),
  .hresp_s3        (hresp_s3       ),
  .hsel_s3         (hsel_s3        ),
  .hsize_s3        (hsize_s3       ),
  .htrans_s3       (htrans_s3      ),
  .hwdata_s3       (hwdata_s3      ),
  .hwrite_s3       (hwrite_s3      ),
  .pad_cpu_rst_b   (pad_cpu_rst_b  ),
  .pll_core_cpuclk (per_clk        )
);

endmodule


