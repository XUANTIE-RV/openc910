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

// &ModuleBeg; @23
module ct_had_common_top(
  apbif_had_pctrace_inv,
  ciu_had_dbg_info,
  core0_dbg_ack_pc,
  core0_enter_dbg_req_i,
  core0_enter_dbg_req_o,
  core0_exit_dbg_req_i,
  core0_exit_dbg_req_o,
  core0_had_dbg_mask,
  core0_regs_serial_data,
  core0_rst_b,
  core1_dbg_ack_pc,
  core1_enter_dbg_req_i,
  core1_enter_dbg_req_o,
  core1_exit_dbg_req_i,
  core1_exit_dbg_req_o,
  core1_had_dbg_mask,
  core1_regs_serial_data,
  core1_rst_b,
  cpurst_b,
  forever_cpuclk,
  had_pad_jtg_tdo,
  had_pad_jtg_tdo_en,
  ir_corex_wdata,
  l2c_had_dbg_info,
  pad_had_jtg_tdi,
  pad_had_jtg_tms,
  pad_yy_icg_scan_en,
  perr_had,
  prdata_had,
  pready_had,
  psel_had,
  sm_update_dr,
  sm_update_ir,
  sysio_had_dbg_mask,
  tclk,
  trst_b
);

// &Ports; @24
input            apbif_had_pctrace_inv; 
input   [292:0]  ciu_had_dbg_info;      
input            core0_dbg_ack_pc;      
input            core0_enter_dbg_req_o; 
input            core0_exit_dbg_req_o;  
input   [63 :0]  core0_regs_serial_data; 
input            core0_rst_b;           
input            core1_dbg_ack_pc;      
input            core1_enter_dbg_req_o; 
input            core1_exit_dbg_req_o;  
input   [63 :0]  core1_regs_serial_data; 
input            core1_rst_b;           
input            cpurst_b;              
input            forever_cpuclk;        
input   [43 :0]  l2c_had_dbg_info;      
input            pad_had_jtg_tdi;       
input            pad_had_jtg_tms;       
input            pad_yy_icg_scan_en;    
input            psel_had;              
input   [3  :0]  sysio_had_dbg_mask;    
input            tclk;                  
input            trst_b;                
output           core0_enter_dbg_req_i; 
output           core0_exit_dbg_req_i;  
output           core0_had_dbg_mask;    
output           core1_enter_dbg_req_i; 
output           core1_exit_dbg_req_i;  
output           core1_had_dbg_mask;    
output           had_pad_jtg_tdo;       
output           had_pad_jtg_tdo_en;    
output  [63 :0]  ir_corex_wdata;        
output           perr_had;              
output  [31 :0]  prdata_had;            
output           pready_had;            
output           sm_update_dr;          
output           sm_update_ir;          

// &Regs;  @25

// &Wires; @26
wire    [292:0]  ciu_had_dbg_info;      
wire    [63 :0]  common_regs_data;      
wire             core0_dbg_ack_pc;      
wire             core0_enter_dbg_req_i; 
wire             core0_enter_dbg_req_o; 
wire             core0_exit_dbg_req_i;  
wire             core0_exit_dbg_req_o;  
wire             core0_had_dbg_mask;    
wire    [63 :0]  core0_regs_serial_data; 
wire             core0_rst_b;           
wire             core1_dbg_ack_pc;      
wire             core1_enter_dbg_req_i; 
wire             core1_enter_dbg_req_o; 
wire             core1_exit_dbg_req_i;  
wire             core1_exit_dbg_req_o;  
wire             core1_had_dbg_mask;    
wire    [63 :0]  core1_regs_serial_data; 
wire             core1_rst_b;           
wire             cpurst_b;              
wire    [63 :0]  dbgfifo2_data;         
wire             dbgfifo2_read_ren;     
wire             forever_cpuclk;        
wire             had_pad_jtg_tdo;       
wire             had_pad_jtg_tdo_en;    
wire             io_serial_tdi;         
wire             io_sm_tap_en;          
wire    [63 :0]  ir_corex_wdata;        
wire             ir_sm_hacr_rw;         
wire             ir_xx_baba_reg_sel;    
wire             ir_xx_babb_reg_sel;    
wire             ir_xx_bama_reg_sel;    
wire             ir_xx_bamb_reg_sel;    
wire             ir_xx_core0_sel;       
wire             ir_xx_core1_sel;       
wire             ir_xx_core2_sel;       
wire             ir_xx_core3_sel;       
wire             ir_xx_csr_reg_sel;     
wire             ir_xx_daddr_reg_sel;   
wire             ir_xx_dbgfifo2_reg_sel; 
wire             ir_xx_dbgfifo_reg_sel; 
wire             ir_xx_ddata_reg_sel;   
wire             ir_xx_dms_reg_sel;     
wire             ir_xx_id_reg_sel;      
wire             ir_xx_mbca_reg_sel;    
wire             ir_xx_mbcb_reg_sel;    
wire             ir_xx_otc_reg_sel;     
wire             ir_xx_pc_reg_sel;      
wire             ir_xx_pcfifo_reg_sel;  
wire             ir_xx_pipefifo_reg_sel; 
wire             ir_xx_rsr_reg_sel;     
wire             ir_xx_wbbr_reg_sel;    
wire    [43 :0]  l2c_had_dbg_info;      
wire             pad_had_jtg_tdi;       
wire             pad_had_jtg_tms;       
wire             pad_yy_icg_scan_en;    
wire             perr_had;              
wire    [31 :0]  prdata_had;            
wire             pready_had;            
wire    [63 :0]  regs_serial_data;      
wire             serial_io_tdo;         
wire    [63 :0]  serial_xx_data;        
wire             sm_io_tdo_en;          
wire             sm_ir_update_hacr;     
wire             sm_serial_capture_dr;  
wire             sm_serial_shift_dr;    
wire             sm_serial_shift_ir;    
wire             sm_update_dr;          
wire             sm_update_ir;          
wire             sm_xx_write_en;        
wire    [3  :0]  sysio_had_dbg_mask;    
wire             tclk;                  
wire             trst_b;                


// &Instance("ct_had_sm"); @28
ct_had_sm  x_ct_had_sm (
  .cpurst_b               (cpurst_b              ),
  .dbgfifo2_read_ren      (dbgfifo2_read_ren     ),
  .forever_cpuclk         (forever_cpuclk        ),
  .io_sm_tap_en           (io_sm_tap_en          ),
  .ir_sm_hacr_rw          (ir_sm_hacr_rw         ),
  .ir_xx_dbgfifo2_reg_sel (ir_xx_dbgfifo2_reg_sel),
  .pad_had_jtg_tms        (pad_had_jtg_tms       ),
  .pad_yy_icg_scan_en     (pad_yy_icg_scan_en    ),
  .sm_io_tdo_en           (sm_io_tdo_en          ),
  .sm_ir_update_hacr      (sm_ir_update_hacr     ),
  .sm_serial_capture_dr   (sm_serial_capture_dr  ),
  .sm_serial_shift_dr     (sm_serial_shift_dr    ),
  .sm_serial_shift_ir     (sm_serial_shift_ir    ),
  .sm_update_dr           (sm_update_dr          ),
  .sm_update_ir           (sm_update_ir          ),
  .sm_xx_write_en         (sm_xx_write_en        ),
  .tclk                   (tclk                  ),
  .trst_b                 (trst_b                )
);

// &Instance("ct_had_io"); @29
ct_had_io  x_ct_had_io (
  .had_pad_jtg_tdo    (had_pad_jtg_tdo   ),
  .had_pad_jtg_tdo_en (had_pad_jtg_tdo_en),
  .io_serial_tdi      (io_serial_tdi     ),
  .io_sm_tap_en       (io_sm_tap_en      ),
  .pad_had_jtg_tdi    (pad_had_jtg_tdi   ),
  .serial_io_tdo      (serial_io_tdo     ),
  .sm_io_tdo_en       (sm_io_tdo_en      )
);

// &Instance("ct_had_serial"); @30
ct_had_serial  x_ct_had_serial (
  .io_serial_tdi          (io_serial_tdi         ),
  .ir_xx_baba_reg_sel     (ir_xx_baba_reg_sel    ),
  .ir_xx_babb_reg_sel     (ir_xx_babb_reg_sel    ),
  .ir_xx_bama_reg_sel     (ir_xx_bama_reg_sel    ),
  .ir_xx_bamb_reg_sel     (ir_xx_bamb_reg_sel    ),
  .ir_xx_csr_reg_sel      (ir_xx_csr_reg_sel     ),
  .ir_xx_daddr_reg_sel    (ir_xx_daddr_reg_sel   ),
  .ir_xx_dbgfifo2_reg_sel (ir_xx_dbgfifo2_reg_sel),
  .ir_xx_dbgfifo_reg_sel  (ir_xx_dbgfifo_reg_sel ),
  .ir_xx_ddata_reg_sel    (ir_xx_ddata_reg_sel   ),
  .ir_xx_mbca_reg_sel     (ir_xx_mbca_reg_sel    ),
  .ir_xx_mbcb_reg_sel     (ir_xx_mbcb_reg_sel    ),
  .ir_xx_otc_reg_sel      (ir_xx_otc_reg_sel     ),
  .ir_xx_pc_reg_sel       (ir_xx_pc_reg_sel      ),
  .ir_xx_pcfifo_reg_sel   (ir_xx_pcfifo_reg_sel  ),
  .ir_xx_pipefifo_reg_sel (ir_xx_pipefifo_reg_sel),
  .ir_xx_wbbr_reg_sel     (ir_xx_wbbr_reg_sel    ),
  .regs_serial_data       (regs_serial_data      ),
  .serial_io_tdo          (serial_io_tdo         ),
  .serial_xx_data         (serial_xx_data        ),
  .sm_serial_capture_dr   (sm_serial_capture_dr  ),
  .sm_serial_shift_dr     (sm_serial_shift_dr    ),
  .sm_serial_shift_ir     (sm_serial_shift_ir    ),
  .sm_xx_write_en         (sm_xx_write_en        ),
  .tclk                   (tclk                  ),
  .trst_b                 (trst_b                )
);

// &Instance("ct_had_ir"); @31
ct_had_ir  x_ct_had_ir (
  .common_regs_data       (common_regs_data      ),
  .core0_regs_serial_data (core0_regs_serial_data),
  .core1_regs_serial_data (core1_regs_serial_data),
  .cpurst_b               (cpurst_b              ),
  .forever_cpuclk         (forever_cpuclk        ),
  .ir_corex_wdata         (ir_corex_wdata        ),
  .ir_sm_hacr_rw          (ir_sm_hacr_rw         ),
  .ir_xx_baba_reg_sel     (ir_xx_baba_reg_sel    ),
  .ir_xx_babb_reg_sel     (ir_xx_babb_reg_sel    ),
  .ir_xx_bama_reg_sel     (ir_xx_bama_reg_sel    ),
  .ir_xx_bamb_reg_sel     (ir_xx_bamb_reg_sel    ),
  .ir_xx_core0_sel        (ir_xx_core0_sel       ),
  .ir_xx_core1_sel        (ir_xx_core1_sel       ),
  .ir_xx_core2_sel        (ir_xx_core2_sel       ),
  .ir_xx_core3_sel        (ir_xx_core3_sel       ),
  .ir_xx_csr_reg_sel      (ir_xx_csr_reg_sel     ),
  .ir_xx_daddr_reg_sel    (ir_xx_daddr_reg_sel   ),
  .ir_xx_dbgfifo2_reg_sel (ir_xx_dbgfifo2_reg_sel),
  .ir_xx_dbgfifo_reg_sel  (ir_xx_dbgfifo_reg_sel ),
  .ir_xx_ddata_reg_sel    (ir_xx_ddata_reg_sel   ),
  .ir_xx_dms_reg_sel      (ir_xx_dms_reg_sel     ),
  .ir_xx_id_reg_sel       (ir_xx_id_reg_sel      ),
  .ir_xx_mbca_reg_sel     (ir_xx_mbca_reg_sel    ),
  .ir_xx_mbcb_reg_sel     (ir_xx_mbcb_reg_sel    ),
  .ir_xx_otc_reg_sel      (ir_xx_otc_reg_sel     ),
  .ir_xx_pc_reg_sel       (ir_xx_pc_reg_sel      ),
  .ir_xx_pcfifo_reg_sel   (ir_xx_pcfifo_reg_sel  ),
  .ir_xx_pipefifo_reg_sel (ir_xx_pipefifo_reg_sel),
  .ir_xx_rsr_reg_sel      (ir_xx_rsr_reg_sel     ),
  .ir_xx_wbbr_reg_sel     (ir_xx_wbbr_reg_sel    ),
  .pad_yy_icg_scan_en     (pad_yy_icg_scan_en    ),
  .regs_serial_data       (regs_serial_data      ),
  .serial_xx_data         (serial_xx_data        ),
  .sm_ir_update_hacr      (sm_ir_update_hacr     ),
  .sysio_had_dbg_mask     (sysio_had_dbg_mask    )
);

// &Instance("ct_had_etm"); @32
ct_had_etm  x_ct_had_etm (
  .core0_enter_dbg_req_i (core0_enter_dbg_req_i),
  .core0_enter_dbg_req_o (core0_enter_dbg_req_o),
  .core0_exit_dbg_req_i  (core0_exit_dbg_req_i ),
  .core0_exit_dbg_req_o  (core0_exit_dbg_req_o ),
  .core1_enter_dbg_req_i (core1_enter_dbg_req_i),
  .core1_enter_dbg_req_o (core1_enter_dbg_req_o),
  .core1_exit_dbg_req_i  (core1_exit_dbg_req_i ),
  .core1_exit_dbg_req_o  (core1_exit_dbg_req_o ),
  .cpurst_b              (cpurst_b             ),
  .forever_cpuclk        (forever_cpuclk       ),
  .pad_yy_icg_scan_en    (pad_yy_icg_scan_en   )
);


// &Instance("ct_had_common_regs"); @34
ct_had_common_regs  x_ct_had_common_regs (
  .common_regs_data       (common_regs_data      ),
  .core0_had_dbg_mask     (core0_had_dbg_mask    ),
  .core0_rst_b            (core0_rst_b           ),
  .core1_had_dbg_mask     (core1_had_dbg_mask    ),
  .core1_rst_b            (core1_rst_b           ),
  .dbgfifo2_data          (dbgfifo2_data         ),
  .forever_cpuclk         (forever_cpuclk        ),
  .ir_xx_core0_sel        (ir_xx_core0_sel       ),
  .ir_xx_core1_sel        (ir_xx_core1_sel       ),
  .ir_xx_core2_sel        (ir_xx_core2_sel       ),
  .ir_xx_core3_sel        (ir_xx_core3_sel       ),
  .ir_xx_dbgfifo2_reg_sel (ir_xx_dbgfifo2_reg_sel),
  .ir_xx_dms_reg_sel      (ir_xx_dms_reg_sel     ),
  .ir_xx_id_reg_sel       (ir_xx_id_reg_sel      ),
  .ir_xx_rsr_reg_sel      (ir_xx_rsr_reg_sel     ),
  .sysio_had_dbg_mask     (sysio_had_dbg_mask    )
);

// &Instance("ct_had_common_dbg_info") @35
ct_had_common_dbg_info  x_ct_had_common_dbg_info (
  .ciu_had_dbg_info   (ciu_had_dbg_info  ),
  .core0_dbg_ack_pc   (core0_dbg_ack_pc  ),
  .core1_dbg_ack_pc   (core1_dbg_ack_pc  ),
  .cpurst_b           (cpurst_b          ),
  .dbgfifo2_data      (dbgfifo2_data     ),
  .dbgfifo2_read_ren  (dbgfifo2_read_ren ),
  .forever_cpuclk     (forever_cpuclk    ),
  .l2c_had_dbg_info   (l2c_had_dbg_info  ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);


// &Instance("ct_had_pctrace_busif"); @38
// &Connect(.pclk      (apb_clk   ), @39
//          .perr      (perr_had  ), @40
//          .prdata    (prdata_had), @41
//          .pready    (pready_had), @42
//          .prst_b    (cpurst_b  ), @43
//          .psel      (psel_had  )); @44
// had apb
// &Force("input", "psel_had"); @47
assign pready_had       = 1'b1;
assign perr_had         = 1'b0;
assign prdata_had[31:0] = 32'b0;
// &Force("input", "apbif_had_pctrace_inv"); @51


// &ModuleEnd; @71
endmodule



