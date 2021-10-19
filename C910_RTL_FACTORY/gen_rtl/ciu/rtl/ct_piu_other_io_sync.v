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
module ct_piu_other_io_sync(
  ciu_ibiu_csr_cmplt,
  ciu_ibiu_csr_rdata,
  ciu_ibiu_dbgrq_b,
  ciu_ibiu_hpcp_l2of_int,
  ciu_ibiu_me_int,
  ciu_ibiu_ms_int,
  ciu_ibiu_mt_int,
  ciu_ibiu_se_int,
  ciu_ibiu_ss_int,
  ciu_ibiu_st_int,
  ciu_icg_en,
  cpurst_b,
  forever_cpuclk,
  ibiu_ciu_cnt_en,
  ibiu_ciu_csr_sel,
  ibiu_ciu_csr_wdata,
  ibiu_ciu_jdb_pm,
  ibiu_ciu_lpmd_b,
  l2cif_piu_read_data_vld,
  l2cif_piux_read_data,
  pad_yy_icg_scan_en,
  perr_l2pmp_x,
  piu_csr_sel,
  piu_l2cif_read_data,
  piu_l2cif_read_data_ecc,
  piu_l2cif_read_index,
  piu_l2cif_read_req,
  piu_l2cif_read_tag,
  piu_l2cif_read_tag_ecc,
  piu_l2cif_read_way,
  piu_regs_hpcp_cnt_en,
  piu_regs_op,
  piu_regs_sel,
  piu_regs_wdata,
  piu_sysio_jdb_pm,
  piu_sysio_lpmd_b,
  piu_xx_regs_no_op,
  pready_l2pmp_x,
  psel_l2pmp_x,
  regs_piu_cmplt,
  regs_piu_hpcp_l2of_int,
  regs_piux_rdata,
  sysio_piu_dbgrq_b,
  sysio_piu_me_int,
  sysio_piu_ms_int,
  sysio_piu_mt_int,
  sysio_piu_se_int,
  sysio_piu_ss_int,
  sysio_piu_st_int,
  x_prdata_l2pmp
);

// &Ports; @24
input            ciu_icg_en;             
input            cpurst_b;               
input            forever_cpuclk;         
input   [3  :0]  ibiu_ciu_cnt_en;        
input            ibiu_ciu_csr_sel;       
input   [79 :0]  ibiu_ciu_csr_wdata;     
input            ibiu_ciu_jdb_pm;        
input            ibiu_ciu_lpmd_b;        
input            l2cif_piu_read_data_vld; 
input   [127:0]  l2cif_piux_read_data;   
input            pad_yy_icg_scan_en;     
input            psel_l2pmp_x;           
input            regs_piu_cmplt;         
input   [3  :0]  regs_piu_hpcp_l2of_int; 
input   [63 :0]  regs_piux_rdata;        
input            sysio_piu_dbgrq_b;      
input            sysio_piu_me_int;       
input            sysio_piu_ms_int;       
input            sysio_piu_mt_int;       
input            sysio_piu_se_int;       
input            sysio_piu_ss_int;       
input            sysio_piu_st_int;       
output           ciu_ibiu_csr_cmplt;     
output  [127:0]  ciu_ibiu_csr_rdata;     
output           ciu_ibiu_dbgrq_b;       
output  [3  :0]  ciu_ibiu_hpcp_l2of_int; 
output           ciu_ibiu_me_int;        
output           ciu_ibiu_ms_int;        
output           ciu_ibiu_mt_int;        
output           ciu_ibiu_se_int;        
output           ciu_ibiu_ss_int;        
output           ciu_ibiu_st_int;        
output           perr_l2pmp_x;           
output           piu_csr_sel;            
output           piu_l2cif_read_data;    
output           piu_l2cif_read_data_ecc; 
output  [20 :0]  piu_l2cif_read_index;   
output           piu_l2cif_read_req;     
output           piu_l2cif_read_tag;     
output           piu_l2cif_read_tag_ecc; 
output  [3  :0]  piu_l2cif_read_way;     
output  [3  :0]  piu_regs_hpcp_cnt_en;   
output  [15 :0]  piu_regs_op;            
output           piu_regs_sel;           
output  [63 :0]  piu_regs_wdata;         
output  [1  :0]  piu_sysio_jdb_pm;       
output  [1  :0]  piu_sysio_lpmd_b;       
output           piu_xx_regs_no_op;      
output           pready_l2pmp_x;         
output  [31 :0]  x_prdata_l2pmp;         

// &Regs; @25
reg              ciu_ibiu_csr_cmplt;     
reg     [127:0]  ciu_ibiu_csr_rdata;     
reg              cp0_csr_sel;            
reg     [79 :0]  cp0_csr_wdata;          
reg              dbgon;                  
reg              in_lpmd_b;              
reg     [3  :0]  piu_regs_hpcp_cnt_en;   

// &Wires; @26
wire             ciu_ibiu_dbgrq_b;       
wire    [3  :0]  ciu_ibiu_hpcp_l2of_int; 
wire             ciu_ibiu_me_int;        
wire             ciu_ibiu_ms_int;        
wire             ciu_ibiu_mt_int;        
wire             ciu_ibiu_se_int;        
wire             ciu_ibiu_ss_int;        
wire             ciu_ibiu_st_int;        
wire             ciu_icg_en;             
wire             cp0_csr_cmplt;          
wire    [127:0]  cp0_csr_rdata;          
wire             cpurst_b;               
wire             forever_cpuclk;         
wire    [3  :0]  ibiu_ciu_cnt_en;        
wire             ibiu_ciu_csr_sel;       
wire    [79 :0]  ibiu_ciu_csr_wdata;     
wire             ibiu_ciu_jdb_pm;        
wire             ibiu_ciu_lpmd_b;        
wire             l2cif_piu_read_data_vld; 
wire    [127:0]  l2cif_piux_read_data;   
wire             l2reg_oclk;             
wire             l2reg_oclk_en;          
wire             pad_yy_icg_scan_en;     
wire             perr_l2pmp_x;           
wire             piu_csr_sel;            
wire             piu_l2cif_read_data;    
wire             piu_l2cif_read_data_ecc; 
wire    [20 :0]  piu_l2cif_read_index;   
wire             piu_l2cif_read_req;     
wire             piu_l2cif_read_tag;     
wire             piu_l2cif_read_tag_ecc; 
wire    [3  :0]  piu_l2cif_read_way;     
wire    [15 :0]  piu_regs_op;            
wire             piu_regs_sel;           
wire    [63 :0]  piu_regs_wdata;         
wire    [1  :0]  piu_sysio_jdb_pm;       
wire    [1  :0]  piu_sysio_lpmd_b;       
wire             piu_xx_regs_no_op;      
wire             pready_l2pmp_x;         
wire             regs_piu_cmplt;         
wire    [3  :0]  regs_piu_hpcp_l2of_int; 
wire    [63 :0]  regs_piux_rdata;        
wire             sysio_piu_dbgrq_b;      
wire             sysio_piu_me_int;       
wire             sysio_piu_ms_int;       
wire             sysio_piu_mt_int;       
wire             sysio_piu_se_int;       
wire             sysio_piu_ss_int;       
wire             sysio_piu_st_int;       
wire    [31 :0]  x_prdata_l2pmp;         


// &Instance("gated_clk_cell", "x_ct_apbif_req_cpu_gated_clk"); @33
// &Connect(.clk_in      (forever_cpuclk), @34
//          .external_en (1'b0), @35
//          .global_en   (1'b1), @36
//          .module_en   (ciu_icg_en), @37
//          .local_en    (apbif_req_cpu_clk_en), @38
//          .clk_out     (apbif_req_cpu_clk)); @39
// &Instance("gated_clk_cell", "x_ct_apbif_in_gated_clk"); @42
// &Connect(.clk_in      (forever_cpuclk), @43
//          .external_en (1'b0), @44
//          .global_en   (1'b1), @45
//          .module_en   (ciu_icg_en), @46
//          .local_en    (apbif_iclk_en), @47
//          .clk_out     (apbif_iclk)); @48
// &Instance("gated_clk_cell", "x_ct_apbif_cmplt_cpu_gated_clk"); @51
// &Connect(.clk_in      (forever_cpuclk), @52
//          .external_en (1'b0), @53
//          .global_en   (1'b1), @54
//          .module_en   (ciu_icg_en), @55
//          .local_en    (apbif_cmplt_apb_clk_en), @56
//          .clk_out     (apbif_cmplt_apb_clk)); @57
// &Force("input", "psel_l2pmp_x"); @157
assign pready_l2pmp_x = 1'b1;
assign perr_l2pmp_x   = 1'b0;
assign x_prdata_l2pmp[31:0] = 32'b0;

//==============================================================================
//   L2C CSR and RAM IF
//==============================================================================
//================================================
// request from core
//================================================
parameter DCA   = 79;
parameter REG_7 = 75;
parameter REG_0 = 68;
parameter WT    = 67;
parameter CSRRW = 66;
parameter CSRRS = 65;
parameter CSRRC = 64;
parameter RID_3 = 31;
parameter RID_0 = 28;
parameter WAY_3 = 24;
parameter WAY_0 = 21;
parameter IDX_20 = 20;
parameter IDX_0  = 0;

always@(posedge forever_cpuclk or negedge cpurst_b)
begin
  if (!cpurst_b)
    cp0_csr_sel <= 1'b0;
  else if (ibiu_ciu_csr_sel)
    cp0_csr_sel <= 1'b1;
  else if (cp0_csr_cmplt)
    cp0_csr_sel <= 1'b0;
end

always@(posedge forever_cpuclk)
begin
  if (ibiu_ciu_csr_sel) 
    cp0_csr_wdata[79:0] <= ibiu_ciu_csr_wdata[79:0];
end

//for ciu top ICG
assign piu_csr_sel                = cp0_csr_sel;
assign piu_xx_regs_no_op          = !cp0_csr_sel;

assign piu_regs_sel               = cp0_csr_sel & !cp0_csr_wdata[DCA];
assign piu_regs_op[15:0]          = cp0_csr_wdata[DCA:CSRRC];
assign piu_regs_wdata[63:0]       = cp0_csr_wdata[63:0];

assign piu_l2cif_read_req         = cp0_csr_sel & cp0_csr_wdata[DCA];
assign piu_l2cif_read_tag         = cp0_csr_wdata[RID_3:RID_0] == 4'd4;
assign piu_l2cif_read_data        = cp0_csr_wdata[RID_3:RID_0] == 4'd5;
assign piu_l2cif_read_tag_ecc     = 1'b0;
assign piu_l2cif_read_data_ecc    = 1'b0;
assign piu_l2cif_read_way[3:0]    = cp0_csr_wdata[WAY_3:WAY_0];
assign piu_l2cif_read_index[20:0] = cp0_csr_wdata[IDX_20:IDX_0];

//================================================
//     cmplt to core
//================================================
// &Force("output", "ciu_ibiu_csr_cmplt"); @223

assign cp0_csr_cmplt        = l2cif_piu_read_data_vld | regs_piu_cmplt;
assign cp0_csr_rdata[127:0] = {128{l2cif_piu_read_data_vld}} & l2cif_piux_read_data[127:0] |
                              {128{regs_piu_cmplt}}          & {64'b0,regs_piux_rdata[63:0]};

always@(posedge l2reg_oclk or negedge cpurst_b)
begin
  if (!cpurst_b)
    ciu_ibiu_csr_cmplt <= 1'b0;
  else
    ciu_ibiu_csr_cmplt <= cp0_csr_cmplt;
end

always@(posedge l2reg_oclk)
begin
  if (cp0_csr_cmplt)
    ciu_ibiu_csr_rdata[127:0] <= cp0_csr_rdata[127:0];
end

//================================================
//  other signals from core to top
//================================================
always@(posedge forever_cpuclk or negedge cpurst_b)
begin
  if (!cpurst_b)begin
    in_lpmd_b <= 1'b1;
    dbgon     <= 1'b0;
  end
  else begin
    in_lpmd_b <= ibiu_ciu_lpmd_b;
    dbgon     <= ibiu_ciu_jdb_pm;
  end
end

assign piu_sysio_jdb_pm[1:0] = dbgon 
                             ? 2'b10 
                             : (!in_lpmd_b) ? 2'b01 : 2'b00;
assign piu_sysio_lpmd_b[1:0] = {in_lpmd_b,in_lpmd_b};


always@(posedge forever_cpuclk or negedge cpurst_b)
begin
  if (!cpurst_b)
    piu_regs_hpcp_cnt_en[3:0] <= 4'b0;
  else 
    piu_regs_hpcp_cnt_en[3:0] <= ibiu_ciu_cnt_en[3:0];
end

assign ciu_ibiu_hpcp_l2of_int[3:0] = regs_piu_hpcp_l2of_int[3:0];
//================================================
//  other signals from top to core
//================================================
assign ciu_ibiu_me_int = sysio_piu_me_int;
assign ciu_ibiu_mt_int = sysio_piu_mt_int;
assign ciu_ibiu_ms_int = sysio_piu_ms_int;
assign ciu_ibiu_se_int = sysio_piu_se_int;
assign ciu_ibiu_st_int = sysio_piu_st_int;
assign ciu_ibiu_ss_int = sysio_piu_ss_int;

assign ciu_ibiu_dbgrq_b = sysio_piu_dbgrq_b;

//================================================
//    ICG
//================================================

assign l2reg_oclk_en = cp0_csr_cmplt | ciu_ibiu_csr_cmplt;
// &Instance("gated_clk_cell", "x_ct_l2reg_out_gated_clk"); @306
gated_clk_cell  x_ct_l2reg_out_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (l2reg_oclk        ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (l2reg_oclk_en     ),
  .module_en          (ciu_icg_en        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk),       @307
//          .external_en (1'b0), @308
//          .global_en   (1'b1), @309
//          .module_en   (ciu_icg_en), @310
//          .local_en    (l2reg_oclk_en), @311
//          .clk_out     (l2reg_oclk)); @312

// &ModuleEnd; @314
endmodule


