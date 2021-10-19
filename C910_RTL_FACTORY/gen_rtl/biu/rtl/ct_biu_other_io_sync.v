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
module ct_biu_other_io_sync(
  biu_cp0_apb_base,
  biu_cp0_coreid,
  biu_cp0_me_int,
  biu_cp0_ms_int,
  biu_cp0_mt_int,
  biu_cp0_rvba,
  biu_cp0_se_int,
  biu_cp0_ss_int,
  biu_cp0_st_int,
  biu_csr_cmplt,
  biu_csr_op,
  biu_csr_rdata,
  biu_csr_sel,
  biu_csr_wdata,
  biu_had_coreid,
  biu_had_sdb_req_b,
  biu_hpcp_l2of_int,
  biu_hpcp_time,
  biu_mmu_smp_disable,
  biu_pad_cnt_en,
  biu_pad_csr_sel,
  biu_pad_csr_wdata,
  biu_pad_jdb_pm,
  biu_pad_lpmd_b,
  biu_xx_dbg_wakeup,
  biu_xx_int_wakeup,
  biu_xx_normal_work,
  biu_xx_pmp_sel,
  coreclk,
  cp0_biu_icg_en,
  cp0_biu_lpmd_b,
  cpurst_b,
  forever_coreclk,
  had_biu_jdb_pm,
  hpcp_biu_cnt_en,
  pad_biu_csr_cmplt,
  pad_biu_csr_rdata,
  pad_biu_dbgrq_b,
  pad_biu_hpcp_l2of_int,
  pad_biu_me_int,
  pad_biu_ms_int,
  pad_biu_mt_int,
  pad_biu_se_int,
  pad_biu_ss_int,
  pad_biu_st_int,
  pad_core_hartid,
  pad_core_rvba,
  pad_xx_apb_base,
  pad_xx_time,
  pad_yy_icg_scan_en
);

// &Ports; @23
input   [15 :0]  biu_csr_op;           
input            biu_csr_sel;          
input   [63 :0]  biu_csr_wdata;        
input            coreclk;              
input            cp0_biu_icg_en;       
input   [1  :0]  cp0_biu_lpmd_b;       
input            cpurst_b;             
input            forever_coreclk;      
input   [1  :0]  had_biu_jdb_pm;       
input   [3  :0]  hpcp_biu_cnt_en;      
input            pad_biu_csr_cmplt;    
input   [127:0]  pad_biu_csr_rdata;    
input            pad_biu_dbgrq_b;      
input   [3  :0]  pad_biu_hpcp_l2of_int; 
input            pad_biu_me_int;       
input            pad_biu_ms_int;       
input            pad_biu_mt_int;       
input            pad_biu_se_int;       
input            pad_biu_ss_int;       
input            pad_biu_st_int;       
input   [2  :0]  pad_core_hartid;      
input   [39 :0]  pad_core_rvba;        
input   [39 :0]  pad_xx_apb_base;      
input   [63 :0]  pad_xx_time;          
input            pad_yy_icg_scan_en;   
output  [39 :0]  biu_cp0_apb_base;     
output  [2  :0]  biu_cp0_coreid;       
output           biu_cp0_me_int;       
output           biu_cp0_ms_int;       
output           biu_cp0_mt_int;       
output  [39 :0]  biu_cp0_rvba;         
output           biu_cp0_se_int;       
output           biu_cp0_ss_int;       
output           biu_cp0_st_int;       
output           biu_csr_cmplt;        
output  [127:0]  biu_csr_rdata;        
output  [1  :0]  biu_had_coreid;       
output           biu_had_sdb_req_b;    
output  [3  :0]  biu_hpcp_l2of_int;    
output  [63 :0]  biu_hpcp_time;        
output           biu_mmu_smp_disable;  
output  [3  :0]  biu_pad_cnt_en;       
output           biu_pad_csr_sel;      
output  [79 :0]  biu_pad_csr_wdata;    
output           biu_pad_jdb_pm;       
output           biu_pad_lpmd_b;       
output           biu_xx_dbg_wakeup;    
output           biu_xx_int_wakeup;    
output           biu_xx_normal_work;   
output           biu_xx_pmp_sel;       

// &Regs; @24
reg     [39 :0]  biu_cp0_apb_base;     
reg     [39 :0]  biu_cp0_rvba;         
reg              biu_csr_cmplt;        
reg     [127:0]  biu_csr_rdata;        
reg              biu_csr_sel_ff;       
reg     [3  :0]  biu_hpcp_l2of_int;    
reg     [63 :0]  biu_hpcp_time;        
reg     [3  :0]  biu_pad_cnt_en;       
reg              biu_pad_csr_sel;      
reg     [79 :0]  biu_pad_csr_wdata;    
reg              biu_pad_jdb_pm;       
reg              biu_pad_lpmd_b;       
reg              cp0_me_int_ff1;       
reg              cp0_me_int_ff2;       
reg              cp0_ms_int_ff1;       
reg              cp0_ms_int_ff2;       
reg              cp0_mt_int_ff1;       
reg              cp0_mt_int_ff2;       
reg              cp0_se_int_ff1;       
reg              cp0_se_int_ff2;       
reg              cp0_ss_int_ff1;       
reg              cp0_ss_int_ff2;       
reg              cp0_st_int_ff1;       
reg              cp0_st_int_ff2;       
reg              had_sdb_req_b_ff1;    
reg              had_sdb_req_b_ff2;    

// &Wires; @25
wire    [2  :0]  biu_cp0_coreid;       
wire             biu_cp0_me_int;       
wire             biu_cp0_ms_int;       
wire             biu_cp0_mt_int;       
wire             biu_cp0_se_int;       
wire             biu_cp0_ss_int;       
wire             biu_cp0_st_int;       
wire    [15 :0]  biu_csr_op;           
wire    [79 :0]  biu_csr_req_data;     
wire             biu_csr_sel;          
wire    [63 :0]  biu_csr_wdata;        
wire    [1  :0]  biu_had_coreid;       
wire             biu_had_sdb_req_b;    
wire             biu_mmu_smp_disable;  
wire             biu_xx_dbg_wakeup;    
wire             biu_xx_int_wakeup;    
wire             biu_xx_normal_work;   
wire             biu_xx_pmp_sel;       
wire             coreclk;              
wire             cp0_biu_icg_en;       
wire    [1  :0]  cp0_biu_lpmd_b;       
wire             cpurst_b;             
wire             csr_sel_pulse;        
wire             forever_coreclk;      
wire    [1  :0]  had_biu_jdb_pm;       
wire    [3  :0]  hpcp_biu_cnt_en;      
wire             l2reg_iclk;           
wire             l2reg_iclk_en;        
wire             l2reg_oclk;           
wire             l2reg_oclk_en;        
wire             pad_biu_csr_cmplt;    
wire    [127:0]  pad_biu_csr_rdata;    
wire             pad_biu_dbgrq_b;      
wire    [3  :0]  pad_biu_hpcp_l2of_int; 
wire             pad_biu_me_int;       
wire             pad_biu_ms_int;       
wire             pad_biu_mt_int;       
wire             pad_biu_se_int;       
wire             pad_biu_ss_int;       
wire             pad_biu_st_int;       
wire    [2  :0]  pad_core_hartid;      
wire    [39 :0]  pad_core_rvba;        
wire    [39 :0]  pad_xx_apb_base;      
wire    [63 :0]  pad_xx_time;          
wire             pad_yy_icg_scan_en;   

//=========================================
//           CIU ID
//=========================================
assign biu_cp0_coreid[2:0] = pad_core_hartid[2:0];
assign biu_had_coreid[1:0] = pad_core_hartid[1:0];

//=========================================
//   RVBA: reset vector base address
//=========================================
always@(posedge coreclk)
begin
  biu_cp0_rvba[39:0] <= pad_core_rvba[39:0];
end
//=========================================
//  apb base address
//=========================================
always@(posedge coreclk)
begin
  biu_cp0_apb_base[39:0] <= pad_xx_apb_base[39:0];
end

// &Force("output", "biu_pmp_psel"); @77
// &Force("output", "biu_pad_pready"); @78
// &Instance("gated_clk_cell", "x_ct_apbif_in_gated_clk"); @81
// &Connect(.clk_in      (forever_coreclk), @82
//          .external_en (1'b0), @83
//          .global_en   (1'b1), @84
//          .module_en   (cp0_biu_icg_en), @85
//          .local_en    (apbif_iclk_en), @86
//          .clk_out     (apbif_iclk)); @87
// &Instance("gated_clk_cell", "x_ct_apbif_out_gated_clk"); @90
// &Connect(.clk_in      (forever_coreclk), @91
//          .external_en (1'b0), @92
//          .global_en   (1'b1), @93
//          .module_en   (cp0_biu_icg_en), @94
//          .local_en    (apbif_oclk_en), @95
//          .clk_out     (apbif_oclk)); @96
assign biu_xx_pmp_sel = 1'b0;
//==============================================================================
// L2C CSR and RAM REQ/ACK signals
//==============================================================================
assign l2reg_oclk_en = biu_csr_sel | biu_csr_sel_ff;          
// &Instance("gated_clk_cell", "x_ct_l2reg_out_gated_clk"); @143
gated_clk_cell  x_ct_l2reg_out_gated_clk (
  .clk_in             (coreclk           ),
  .clk_out            (l2reg_oclk        ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (l2reg_oclk_en     ),
  .module_en          (cp0_biu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (coreclk), @144
//          .external_en (1'b0), @145
//          .global_en   (1'b1), @146
//          .module_en   (cp0_biu_icg_en), @147
//          .local_en    (l2reg_oclk_en), @148
//          .clk_out     (l2reg_oclk)); @149

assign l2reg_iclk_en = pad_biu_csr_cmplt | biu_csr_cmplt;
// &Instance("gated_clk_cell", "x_ct_l2reg_in_gated_clk"); @152
gated_clk_cell  x_ct_l2reg_in_gated_clk (
  .clk_in             (coreclk           ),
  .clk_out            (l2reg_iclk        ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (l2reg_iclk_en     ),
  .module_en          (cp0_biu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (coreclk), @153
//          .external_en (1'b0), @154
//          .global_en   (1'b1), @155
//          .module_en   (cp0_biu_icg_en), @156
//          .local_en    (l2reg_iclk_en), @157
//          .clk_out     (l2reg_iclk)); @158

always@(posedge l2reg_oclk or negedge cpurst_b)
begin
  if (!cpurst_b)
    biu_csr_sel_ff <= 1'b0;
  else 
    biu_csr_sel_ff <= biu_csr_sel;
end

assign csr_sel_pulse = biu_csr_sel & !biu_csr_sel_ff;

always@(posedge l2reg_oclk or negedge cpurst_b)
begin
  if (!cpurst_b)
    biu_pad_csr_sel <= 1'b0;
  else
    biu_pad_csr_sel <= csr_sel_pulse;
end

assign biu_csr_req_data[79:0] = {biu_csr_op[15:0],biu_csr_wdata[63:0]};

always@(posedge l2reg_oclk)
begin
  if (csr_sel_pulse) begin
    biu_pad_csr_wdata[79:0] <= biu_csr_req_data[79:0];
  end
end

always@(posedge l2reg_iclk or negedge cpurst_b)
begin
  if (!cpurst_b)
    biu_csr_cmplt <= 1'b0;
  else
    biu_csr_cmplt <= pad_biu_csr_cmplt;
end

// &Force("output","biu_csr_cmplt"); @195
always@(posedge l2reg_iclk)
begin
  if (pad_biu_csr_cmplt)
    biu_csr_rdata[127:0] <= pad_biu_csr_rdata[127:0];
end

//==============================================================================
// single bit level signals
//==============================================================================
//=========================================
// intput: interrupt requests
//=========================================

always @(posedge forever_coreclk or negedge cpurst_b)
begin
  if (!cpurst_b) begin
    cp0_me_int_ff1 <= 1'b0;
    cp0_mt_int_ff1 <= 1'b0;
    cp0_ms_int_ff1 <= 1'b0;
    cp0_se_int_ff1 <= 1'b0;
    cp0_st_int_ff1 <= 1'b0;
    cp0_ss_int_ff1 <= 1'b0;
    cp0_me_int_ff2 <= 1'b0;
    cp0_mt_int_ff2 <= 1'b0;
    cp0_ms_int_ff2 <= 1'b0;
    cp0_se_int_ff2 <= 1'b0;
    cp0_st_int_ff2 <= 1'b0;
    cp0_ss_int_ff2 <= 1'b0;
  end
  else begin
    cp0_me_int_ff1 <= pad_biu_me_int;
    cp0_mt_int_ff1 <= pad_biu_mt_int;
    cp0_ms_int_ff1 <= pad_biu_ms_int;
    cp0_se_int_ff1 <= pad_biu_se_int;
    cp0_st_int_ff1 <= pad_biu_st_int;
    cp0_ss_int_ff1 <= pad_biu_ss_int;
    cp0_me_int_ff2 <= cp0_me_int_ff1;
    cp0_mt_int_ff2 <= cp0_mt_int_ff1;
    cp0_ms_int_ff2 <= cp0_ms_int_ff1;
    cp0_se_int_ff2 <= cp0_se_int_ff1;
    cp0_st_int_ff2 <= cp0_st_int_ff1;
    cp0_ss_int_ff2 <= cp0_ss_int_ff1;
  end
end

assign biu_cp0_me_int = cp0_me_int_ff2;
assign biu_cp0_mt_int = cp0_mt_int_ff2;
assign biu_cp0_ms_int = cp0_ms_int_ff2;
assign biu_cp0_se_int = cp0_se_int_ff2;
assign biu_cp0_st_int = cp0_st_int_ff2;
assign biu_cp0_ss_int = cp0_ss_int_ff2;

assign biu_xx_int_wakeup = cp0_me_int_ff2 | cp0_mt_int_ff2 | cp0_ms_int_ff2 |
                           cp0_se_int_ff2 | cp0_st_int_ff2 | cp0_ss_int_ff2;

//=========================================
//  input: debug request 
//=========================================
always@(posedge forever_coreclk or negedge cpurst_b)
begin
  if (!cpurst_b) begin
    had_sdb_req_b_ff1 <= 1'b1;
    had_sdb_req_b_ff2 <= 1'b1;
  end
  else begin
    had_sdb_req_b_ff1 <= pad_biu_dbgrq_b;
    had_sdb_req_b_ff2 <= had_sdb_req_b_ff1;
  end
end

assign biu_had_sdb_req_b = had_sdb_req_b_ff2;

assign biu_xx_dbg_wakeup = !had_sdb_req_b_ff2;

//=========================================
//  hpcp_timer 
//=========================================

always@(posedge coreclk)
begin
  biu_hpcp_time[63:0] <= pad_xx_time[63:0];
end

//==============================================================================
//            output port
//==============================================================================
//=========================================
//  lpmd
//=========================================
// &Force("bus", "cp0_biu_lpmd_b",1,0); @285
// &Force("bus", "had_biu_jdb_pm",1,0); @286
// &Force("output", "biu_pad_lpmd_b"); @287

always@(posedge forever_coreclk or negedge cpurst_b)
begin
  if (!cpurst_b) begin
    biu_pad_lpmd_b <= 1'b1;
    biu_pad_jdb_pm <= 1'b0;
  end
  else begin
    biu_pad_lpmd_b <= cp0_biu_lpmd_b[0];
    biu_pad_jdb_pm <= had_biu_jdb_pm[1];
  end
end

assign biu_xx_normal_work = biu_pad_lpmd_b;


//=========================================
//   hpcp_cnt_en for L2C
//=========================================
//output
always@(posedge forever_coreclk or negedge cpurst_b)
begin
  if (!cpurst_b)
    biu_pad_cnt_en[3:0] <= 4'b0;
  else 
    biu_pad_cnt_en[3:0] <= hpcp_biu_cnt_en[3:0];
end

//input
always@(posedge forever_coreclk or negedge cpurst_b)
begin
  if (!cpurst_b)
    biu_hpcp_l2of_int[3:0] <= 4'b0;
  else
    biu_hpcp_l2of_int[3:0] <= pad_biu_hpcp_l2of_int[3:0];
end

assign biu_mmu_smp_disable = 1'b0;

// &ModuleEnd; @353
endmodule



