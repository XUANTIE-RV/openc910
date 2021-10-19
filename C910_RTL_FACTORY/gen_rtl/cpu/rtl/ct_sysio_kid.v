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
module ct_sysio_kid(
  apb_clk_en,
  axim_clk_en,
  ciu_sysio_icg_en,
  clint_core_ms_int,
  clint_core_mt_int,
  clint_core_ss_int,
  clint_core_st_int,
  core_pad_jdb_pm,
  core_pad_lpmd_b,
  cpurst_b,
  forever_cpuclk,
  pad_core_dbg_mask,
  pad_core_dbgrq_b,
  pad_yy_icg_scan_en,
  piu_sysio_jdb_pm,
  piu_sysio_lpmd_b,
  plic_core_me_int,
  plic_core_se_int,
  sysio_clk,
  sysio_had_dbg_mask_x,
  sysio_piu_dbgrq_b,
  sysio_piu_me_int,
  sysio_piu_ms_int,
  sysio_piu_mt_int,
  sysio_piu_se_int,
  sysio_piu_ss_int,
  sysio_piu_st_int
);

// &Ports; @23
input          apb_clk_en;           
input          axim_clk_en;          
input          ciu_sysio_icg_en;     
input          clint_core_ms_int;    
input          clint_core_mt_int;    
input          clint_core_ss_int;    
input          clint_core_st_int;    
input          cpurst_b;             
input          forever_cpuclk;       
input          pad_core_dbg_mask;    
input          pad_core_dbgrq_b;     
input          pad_yy_icg_scan_en;   
input   [1:0]  piu_sysio_jdb_pm;     
input   [1:0]  piu_sysio_lpmd_b;     
input          plic_core_me_int;     
input          plic_core_se_int;     
input          sysio_clk;            
output  [1:0]  core_pad_jdb_pm;      
output  [1:0]  core_pad_lpmd_b;      
output         sysio_had_dbg_mask_x; 
output         sysio_piu_dbgrq_b;    
output         sysio_piu_me_int;     
output         sysio_piu_ms_int;     
output         sysio_piu_mt_int;     
output         sysio_piu_se_int;     
output         sysio_piu_ss_int;     
output         sysio_piu_st_int;     

// &Regs; @24
reg            clint_core_ms_int_cpu; 
reg            clint_core_mt_int_cpu; 
reg            clint_core_ss_int_cpu; 
reg            clint_core_st_int_cpu; 
reg     [1:0]  core_pad_jdb_pm;      
reg     [1:0]  core_pad_lpmd_b;      
reg            plic_core_me_int_cpu; 
reg            plic_core_se_int_cpu; 
reg            sysio_had_dbg_mask_x; 
reg            sysio_piu_dbgrq_b;    

// &Wires; @25
wire           apb_clk_en;           
wire           axim_clk_en;          
wire           ciu_sysio_icg_en;     
wire           clint_core_ms_int;    
wire           clint_core_mt_int;    
wire           clint_core_ss_int;    
wire           clint_core_st_int;    
wire           cpurst_b;             
wire           forever_cpuclk;       
wire           kid_int_clk;          
wire           kid_int_clk_en;       
wire           pad_core_dbg_mask;    
wire           pad_core_dbgrq_b;     
wire           pad_yy_icg_scan_en;   
wire    [1:0]  piu_sysio_jdb_pm;     
wire    [1:0]  piu_sysio_lpmd_b;     
wire           plic_core_me_int;     
wire           plic_core_se_int;     
wire           sysio_clk;            
wire           sysio_piu_me_int;     
wire           sysio_piu_ms_int;     
wire           sysio_piu_mt_int;     
wire           sysio_piu_se_int;     
wire           sysio_piu_ss_int;     
wire           sysio_piu_st_int;     


//==========================================================
//input
//==========================================================
always @(posedge sysio_clk)
begin
  if (axim_clk_en)
  begin
   sysio_piu_dbgrq_b <= pad_core_dbgrq_b;
  end
end

always @(posedge sysio_clk)
begin
  if (axim_clk_en)
  begin
   sysio_had_dbg_mask_x <= pad_core_dbg_mask;
  end
end

//==========================================================
//output
//==========================================================
always @(posedge sysio_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
  begin
    core_pad_jdb_pm[1:0] <= 2'b0;
    core_pad_lpmd_b[1:0] <= 2'b11;
  end
  else if (axim_clk_en)
  begin
    core_pad_jdb_pm[1:0] <= piu_sysio_jdb_pm[1:0];
    core_pad_lpmd_b[1:0] <= piu_sysio_lpmd_b[1:0];
  end
end


//==========================================================
//PLIC and CLINT int
//==========================================================
assign kid_int_clk_en = apb_clk_en;

// &Instance("gated_clk_cell", "x_sysio_kid_int_gated_clk"); @86
gated_clk_cell  x_sysio_kid_int_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (kid_int_clk       ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (kid_int_clk_en    ),
  .module_en          (ciu_sysio_icg_en  ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @87
//          .external_en (1'b0          ), @88
//          .global_en   (1'b1          ), @89
//          .module_en   (ciu_sysio_icg_en). @90
//          .local_en    (kid_int_clk_en), @91
//          .clk_out     (kid_int_clk   ) @92
//         ); @93

always @(posedge kid_int_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
  begin
    plic_core_me_int_cpu  <= 1'b0;
    plic_core_se_int_cpu  <= 1'b0;
    clint_core_ms_int_cpu <= 1'b0;
    clint_core_ss_int_cpu <= 1'b0;
    clint_core_mt_int_cpu <= 1'b0;
    clint_core_st_int_cpu <= 1'b0;
  end
  else if (apb_clk_en)
  begin
    plic_core_me_int_cpu  <=  plic_core_me_int;
    plic_core_se_int_cpu  <=  plic_core_se_int;
    clint_core_ms_int_cpu <= clint_core_ms_int;
    clint_core_ss_int_cpu <= clint_core_ss_int;
    clint_core_mt_int_cpu <= clint_core_mt_int;
    clint_core_st_int_cpu <= clint_core_st_int;
  end
end

assign sysio_piu_me_int =  plic_core_me_int_cpu;
assign sysio_piu_se_int =  plic_core_se_int_cpu;
assign sysio_piu_ms_int = clint_core_ms_int_cpu;
assign sysio_piu_ss_int = clint_core_ss_int_cpu;
assign sysio_piu_mt_int = clint_core_mt_int_cpu;
assign sysio_piu_st_int = clint_core_st_int_cpu;

// &ModuleEnd; @124
endmodule




