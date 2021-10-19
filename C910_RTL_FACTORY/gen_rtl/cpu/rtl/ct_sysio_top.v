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

// &ModuleBeg; @24
module ct_sysio_top(
  apb_clk_en,
  axim_clk_en,
  ciu_sysio_icg_en,
  ciu_xx_no_op,
  clint_core0_ms_int,
  clint_core0_mt_int,
  clint_core0_ss_int,
  clint_core0_st_int,
  clint_core1_ms_int,
  clint_core1_mt_int,
  clint_core1_ss_int,
  clint_core1_st_int,
  core0_pad_jdb_pm,
  core0_pad_lpmd_b,
  core1_pad_jdb_pm,
  core1_pad_lpmd_b,
  cpu_pad_l2cache_flush_done,
  cpu_pad_no_op,
  cpurst_b,
  forever_cpuclk,
  l2c_sysio_flush_done,
  l2c_sysio_flush_idle,
  pad_core0_dbg_mask,
  pad_core0_dbgrq_b,
  pad_core1_dbg_mask,
  pad_core1_dbgrq_b,
  pad_cpu_apb_base,
  pad_cpu_l2cache_flush_req,
  pad_cpu_sys_cnt,
  pad_yy_icg_scan_en,
  piu0_sysio_jdb_pm,
  piu0_sysio_lpmd_b,
  piu1_sysio_jdb_pm,
  piu1_sysio_lpmd_b,
  plic_core0_me_int,
  plic_core0_se_int,
  plic_core1_me_int,
  plic_core1_se_int,
  sysio_ciu_apb_base,
  sysio_clint_mtime,
  sysio_had_dbg_mask,
  sysio_l2c_flush_req,
  sysio_piu0_dbgrq_b,
  sysio_piu0_me_int,
  sysio_piu0_ms_int,
  sysio_piu0_mt_int,
  sysio_piu0_se_int,
  sysio_piu0_ss_int,
  sysio_piu0_st_int,
  sysio_piu1_dbgrq_b,
  sysio_piu1_me_int,
  sysio_piu1_ms_int,
  sysio_piu1_mt_int,
  sysio_piu1_se_int,
  sysio_piu1_ss_int,
  sysio_piu1_st_int,
  sysio_xx_apb_base,
  sysio_xx_time
);

// &Ports; @25
input           apb_clk_en;                
input           axim_clk_en;               
input           ciu_sysio_icg_en;          
input           ciu_xx_no_op;              
input           clint_core0_ms_int;        
input           clint_core0_mt_int;        
input           clint_core0_ss_int;        
input           clint_core0_st_int;        
input           clint_core1_ms_int;        
input           clint_core1_mt_int;        
input           clint_core1_ss_int;        
input           clint_core1_st_int;        
input           cpurst_b;                  
input           forever_cpuclk;            
input           l2c_sysio_flush_done;      
input           l2c_sysio_flush_idle;      
input           pad_core0_dbg_mask;        
input           pad_core0_dbgrq_b;         
input           pad_core1_dbg_mask;        
input           pad_core1_dbgrq_b;         
input   [39:0]  pad_cpu_apb_base;          
input           pad_cpu_l2cache_flush_req; 
input   [63:0]  pad_cpu_sys_cnt;           
input           pad_yy_icg_scan_en;        
input   [1 :0]  piu0_sysio_jdb_pm;         
input   [1 :0]  piu0_sysio_lpmd_b;         
input   [1 :0]  piu1_sysio_jdb_pm;         
input   [1 :0]  piu1_sysio_lpmd_b;         
input           plic_core0_me_int;         
input           plic_core0_se_int;         
input           plic_core1_me_int;         
input           plic_core1_se_int;         
output  [1 :0]  core0_pad_jdb_pm;          
output  [1 :0]  core0_pad_lpmd_b;          
output  [1 :0]  core1_pad_jdb_pm;          
output  [1 :0]  core1_pad_lpmd_b;          
output          cpu_pad_l2cache_flush_done; 
output          cpu_pad_no_op;             
output  [39:0]  sysio_ciu_apb_base;        
output  [63:0]  sysio_clint_mtime;         
output  [3 :0]  sysio_had_dbg_mask;        
output          sysio_l2c_flush_req;       
output          sysio_piu0_dbgrq_b;        
output          sysio_piu0_me_int;         
output          sysio_piu0_ms_int;         
output          sysio_piu0_mt_int;         
output          sysio_piu0_se_int;         
output          sysio_piu0_ss_int;         
output          sysio_piu0_st_int;         
output          sysio_piu1_dbgrq_b;        
output          sysio_piu1_me_int;         
output          sysio_piu1_ms_int;         
output          sysio_piu1_mt_int;         
output          sysio_piu1_se_int;         
output          sysio_piu1_ss_int;         
output          sysio_piu1_st_int;         
output  [39:0]  sysio_xx_apb_base;         
output  [63:0]  sysio_xx_time;             

// &Regs; @26
reg     [12:0]  apb_base;                  
reg     [63:0]  ccvr;                      
reg             cpu_pad_l2cache_flush_done; 
reg             cpu_pad_no_op;             
reg             sysio_l2c_flush_req;       

// &Wires; @27
wire            apb_clk_en;                
wire            axim_clk_en;               
wire            ciu_sysio_icg_en;          
wire            ciu_xx_no_op;              
wire            clint_core0_ms_int;        
wire            clint_core0_mt_int;        
wire            clint_core0_ss_int;        
wire            clint_core0_st_int;        
wire            clint_core1_ms_int;        
wire            clint_core1_mt_int;        
wire            clint_core1_ss_int;        
wire            clint_core1_st_int;        
wire    [1 :0]  core0_pad_jdb_pm;          
wire    [1 :0]  core0_pad_lpmd_b;          
wire    [1 :0]  core1_pad_jdb_pm;          
wire    [1 :0]  core1_pad_lpmd_b;          
wire            cpurst_b;                  
wire            forever_cpuclk;            
wire            l2c_sysio_flush_done;      
wire            l2c_sysio_flush_idle;      
wire            pad_core0_dbg_mask;        
wire            pad_core0_dbgrq_b;         
wire            pad_core1_dbg_mask;        
wire            pad_core1_dbgrq_b;         
wire    [39:0]  pad_cpu_apb_base;          
wire            pad_cpu_l2cache_flush_req; 
wire    [63:0]  pad_cpu_sys_cnt;           
wire            pad_yy_icg_scan_en;        
wire    [1 :0]  piu0_sysio_jdb_pm;         
wire    [1 :0]  piu0_sysio_lpmd_b;         
wire    [1 :0]  piu1_sysio_jdb_pm;         
wire    [1 :0]  piu1_sysio_lpmd_b;         
wire            plic_core0_me_int;         
wire            plic_core0_se_int;         
wire            plic_core1_me_int;         
wire            plic_core1_se_int;         
wire    [39:0]  sysio_ciu_apb_base;        
wire    [63:0]  sysio_clint_mtime;         
wire            sysio_clk;                 
wire            sysio_clk_en;              
wire    [3 :0]  sysio_had_dbg_mask;        
wire            sysio_piu0_dbgrq_b;        
wire            sysio_piu0_me_int;         
wire            sysio_piu0_ms_int;         
wire            sysio_piu0_mt_int;         
wire            sysio_piu0_se_int;         
wire            sysio_piu0_ss_int;         
wire            sysio_piu0_st_int;         
wire            sysio_piu1_dbgrq_b;        
wire            sysio_piu1_me_int;         
wire            sysio_piu1_ms_int;         
wire            sysio_piu1_mt_int;         
wire            sysio_piu1_se_int;         
wire            sysio_piu1_ss_int;         
wire            sysio_piu1_st_int;         
wire    [39:0]  sysio_xx_apb_base;         
wire    [63:0]  sysio_xx_time;             


assign sysio_clk_en = axim_clk_en;

// &Instance("gated_clk_cell", "x_ct_sysio_in_gated_clk"); @31
gated_clk_cell  x_ct_sysio_in_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (sysio_clk         ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (sysio_clk_en      ),
  .module_en          (ciu_sysio_icg_en  ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk ), @32
//          .external_en (1'b0           ), @33
//          .global_en   (1'b1           ), @34
//          .module_en   (ciu_sysio_icg_en), @35
//          .local_en    (sysio_clk_en), @36
//          .clk_out     (sysio_clk   ) @37
//         ); @38


//================================================
//  debug disable
//================================================
always@(posedge sysio_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    sysio_l2c_flush_req <= 1'b0;
  else if (axim_clk_en)
    sysio_l2c_flush_req <= pad_cpu_l2cache_flush_req;
end

always@(posedge sysio_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    cpu_pad_l2cache_flush_done <= 1'b0;
  else if (axim_clk_en)
    cpu_pad_l2cache_flush_done <= l2c_sysio_flush_done;
end


//================================================
//      system counter value to PTIM
//================================================

always@(posedge sysio_clk)
begin
  if (axim_clk_en)
    ccvr[63:0] <= pad_cpu_sys_cnt[63:0];
  else
    ccvr[63:0] <= ccvr[63:0];
end

assign sysio_clint_mtime[63:0] = ccvr[63:0];

// &Force("nonport","ccvr_gray"); @100
// &Instance("gated_clk_cell", "x_ct_sysio_time_gated_clk"); @107
// &Connect(.clk_in      (forever_cpuclk ), @108
//          .external_en (1'b0           ), @109
//          .global_en   (1'b1           ), @110
//          .module_en   (ciu_sysio_icg_en). @111
//          .local_en    (time_updt_en   ), @112
//          .clk_out     (time_clk       ) @113
//         ); @114
assign sysio_xx_time[63:0] = ccvr[63:0];

//================================================
//apb base address
//================================================
// &Force("bus","pad_cpu_apb_base",39,0); @142

always @(posedge sysio_clk)
begin
  if (axim_clk_en)
   apb_base[12:0] <= pad_cpu_apb_base[39:27];
end

assign sysio_ciu_apb_base[39:0] = {apb_base[12:0], 27'b0};
assign sysio_xx_apb_base[39:0] = {apb_base[12:0], 27'b0};

//================================================
// cpu no op
//================================================
always @(posedge sysio_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    cpu_pad_no_op <= 1'b0;
  else if (axim_clk_en)
    cpu_pad_no_op <= ciu_xx_no_op && l2c_sysio_flush_idle;
end

//================================================
// cpu no op
//================================================
// &ConnRule(s/core_/core0_/); @167
// &ConnRule(s/piu_/piu0_/); @168
// &ConnRule(s/_x/[0]/); @169
// &Instance("ct_sysio_kid", "x_ct_sysio_core0"); @170
ct_sysio_kid  x_ct_sysio_core0 (
  .apb_clk_en            (apb_clk_en           ),
  .axim_clk_en           (axim_clk_en          ),
  .ciu_sysio_icg_en      (ciu_sysio_icg_en     ),
  .clint_core_ms_int     (clint_core0_ms_int   ),
  .clint_core_mt_int     (clint_core0_mt_int   ),
  .clint_core_ss_int     (clint_core0_ss_int   ),
  .clint_core_st_int     (clint_core0_st_int   ),
  .core_pad_jdb_pm       (core0_pad_jdb_pm     ),
  .core_pad_lpmd_b       (core0_pad_lpmd_b     ),
  .cpurst_b              (cpurst_b             ),
  .forever_cpuclk        (forever_cpuclk       ),
  .pad_core_dbg_mask     (pad_core0_dbg_mask   ),
  .pad_core_dbgrq_b      (pad_core0_dbgrq_b    ),
  .pad_yy_icg_scan_en    (pad_yy_icg_scan_en   ),
  .piu_sysio_jdb_pm      (piu0_sysio_jdb_pm    ),
  .piu_sysio_lpmd_b      (piu0_sysio_lpmd_b    ),
  .plic_core_me_int      (plic_core0_me_int    ),
  .plic_core_se_int      (plic_core0_se_int    ),
  .sysio_clk             (sysio_clk            ),
  .sysio_had_dbg_mask_x  (sysio_had_dbg_mask[0]),
  .sysio_piu_dbgrq_b     (sysio_piu0_dbgrq_b   ),
  .sysio_piu_me_int      (sysio_piu0_me_int    ),
  .sysio_piu_ms_int      (sysio_piu0_ms_int    ),
  .sysio_piu_mt_int      (sysio_piu0_mt_int    ),
  .sysio_piu_se_int      (sysio_piu0_se_int    ),
  .sysio_piu_ss_int      (sysio_piu0_ss_int    ),
  .sysio_piu_st_int      (sysio_piu0_st_int    )
);


// &ConnRule(s/core_/core1_/); @173
// &ConnRule(s/piu_/piu1_/); @174
// &ConnRule(s/_x/[1]/); @175
// &Instance("ct_sysio_kid", "x_ct_sysio_core1"); @176
ct_sysio_kid  x_ct_sysio_core1 (
  .apb_clk_en            (apb_clk_en           ),
  .axim_clk_en           (axim_clk_en          ),
  .ciu_sysio_icg_en      (ciu_sysio_icg_en     ),
  .clint_core_ms_int     (clint_core1_ms_int   ),
  .clint_core_mt_int     (clint_core1_mt_int   ),
  .clint_core_ss_int     (clint_core1_ss_int   ),
  .clint_core_st_int     (clint_core1_st_int   ),
  .core_pad_jdb_pm       (core1_pad_jdb_pm     ),
  .core_pad_lpmd_b       (core1_pad_lpmd_b     ),
  .cpurst_b              (cpurst_b             ),
  .forever_cpuclk        (forever_cpuclk       ),
  .pad_core_dbg_mask     (pad_core1_dbg_mask   ),
  .pad_core_dbgrq_b      (pad_core1_dbgrq_b    ),
  .pad_yy_icg_scan_en    (pad_yy_icg_scan_en   ),
  .piu_sysio_jdb_pm      (piu1_sysio_jdb_pm    ),
  .piu_sysio_lpmd_b      (piu1_sysio_lpmd_b    ),
  .plic_core_me_int      (plic_core1_me_int    ),
  .plic_core_se_int      (plic_core1_se_int    ),
  .sysio_clk             (sysio_clk            ),
  .sysio_had_dbg_mask_x  (sysio_had_dbg_mask[1]),
  .sysio_piu_dbgrq_b     (sysio_piu1_dbgrq_b   ),
  .sysio_piu_me_int      (sysio_piu1_me_int    ),
  .sysio_piu_ms_int      (sysio_piu1_ms_int    ),
  .sysio_piu_mt_int      (sysio_piu1_mt_int    ),
  .sysio_piu_se_int      (sysio_piu1_se_int    ),
  .sysio_piu_ss_int      (sysio_piu1_ss_int    ),
  .sysio_piu_st_int      (sysio_piu1_st_int    )
);


// &ConnRule(s/core_/core2_/); @182
// &ConnRule(s/piu_/piu2_/); @183
// &ConnRule(s/_x/[2]/); @184
// &Instance("ct_sysio_kid", "x_ct_sysio_core2"); @185
assign sysio_had_dbg_mask[2] = 1'b0;

// &ConnRule(s/core_/core3_/); @191
// &ConnRule(s/piu_/piu3_/); @192
// &ConnRule(s/_x/[3]/); @193
// &Instance("ct_sysio_kid", "x_ct_sysio_core3"); @194
assign sysio_had_dbg_mask[3] = 1'b0;

// &ModuleEnd; @199
endmodule



