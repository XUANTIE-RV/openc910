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
module ct_ciu_regs_kid(
  ciu_icg_en,
  forever_cpuclk,
  l2cif0_regs_read_acc_inc_x,
  l2cif0_regs_read_miss_inc_x,
  l2cif0_regs_write_acc_inc_x,
  l2cif0_regs_write_miss_inc_x,
  l2cif1_regs_read_acc_inc_x,
  l2cif1_regs_read_miss_inc_x,
  l2cif1_regs_write_acc_inc_x,
  l2cif1_regs_write_miss_inc_x,
  pad_yy_icg_scan_en,
  regs_idx,
  regs_l2of_wen,
  regs_sel_final_x,
  regs_wdata_final,
  regs_wen,
  smpen_x,
  x_csr_value,
  x_fifo_rst_b,
  x_hpcp_cnt_en,
  x_l2of_int
);

// &Ports; @23
input           ciu_icg_en;                  
input           forever_cpuclk;              
input           l2cif0_regs_read_acc_inc_x;  
input           l2cif0_regs_read_miss_inc_x; 
input           l2cif0_regs_write_acc_inc_x; 
input           l2cif0_regs_write_miss_inc_x; 
input           l2cif1_regs_read_acc_inc_x;  
input           l2cif1_regs_read_miss_inc_x; 
input           l2cif1_regs_write_acc_inc_x; 
input           l2cif1_regs_write_miss_inc_x; 
input           pad_yy_icg_scan_en;          
input   [3 :0]  regs_idx;                    
input   [3 :0]  regs_l2of_wen;               
input           regs_sel_final_x;            
input   [63:0]  regs_wdata_final;            
input           regs_wen;                    
input           x_fifo_rst_b;                
input   [3 :0]  x_hpcp_cnt_en;               
output          smpen_x;                     
output  [63:0]  x_csr_value;                 
output  [3 :0]  x_l2of_int;                  

// &Regs; @24
reg     [63:0]  l2_read_acc_cnt;             
reg             l2_read_acc_of;              
reg     [63:0]  l2_read_miss_cnt;            
reg             l2_read_miss_of;             
reg     [63:0]  l2_write_acc_cnt;            
reg             l2_write_acc_of;             
reg     [63:0]  l2_write_miss_cnt;           
reg             l2_write_miss_of;            
reg     [3 :0]  l2of_reg;                    
reg     [63:0]  regs_dout;                   
reg             smpen;                       

// &Wires; @25
wire            ciu_icg_en;                  
wire            forever_cpuclk;              
wire    [64:0]  l2_read_acc_adder;           
wire    [64:0]  l2_read_miss_adder;          
wire    [64:0]  l2_write_acc_adder;          
wire    [64:0]  l2_write_miss_adder;         
wire            l2cif0_regs_read_acc_inc_x;  
wire            l2cif0_regs_read_miss_inc_x; 
wire            l2cif0_regs_write_acc_inc_x; 
wire            l2cif0_regs_write_miss_inc_x; 
wire            l2cif1_regs_read_acc_inc_x;  
wire            l2cif1_regs_read_miss_inc_x; 
wire            l2cif1_regs_write_acc_inc_x; 
wire            l2cif1_regs_write_miss_inc_x; 
wire            l2of_clk;                    
wire            l2of_clk_en;                 
wire    [3 :0]  l2of_updt_data;              
wire    [63:0]  l2of_value;                  
wire            l2of_wen;                    
wire            l2ra_clk;                    
wire            l2ra_clk_en;                 
wire            l2ra_of;                     
wire    [63:0]  l2ra_value;                  
wire            l2ra_wen;                    
wire            l2rm_clk;                    
wire            l2rm_clk_en;                 
wire            l2rm_of;                     
wire    [63:0]  l2rm_value;                  
wire            l2rm_wen;                    
wire            l2wa_clk;                    
wire            l2wa_clk_en;                 
wire            l2wa_of;                     
wire    [63:0]  l2wa_value;                  
wire            l2wa_wen;                    
wire            l2wm_clk;                    
wire            l2wm_clk_en;                 
wire            l2wm_of;                     
wire    [63:0]  l2wm_value;                  
wire            l2wm_wen;                    
wire            pad_yy_icg_scan_en;          
wire    [3 :0]  regs_idx;                    
wire    [3 :0]  regs_l2of_wen;               
wire            regs_sel_final_x;            
wire    [63:0]  regs_wdata_final;            
wire            regs_wen;                    
wire            smpen_x;                     
wire            smpr_clk;                    
wire            smpr_clk_en;                 
wire    [63:0]  smpr_value;                  
wire            smpr_wen;                    
wire    [63:0]  teem_value;                  
wire    [63:0]  x_csr_value;                 
wire            x_fifo_rst_b;                
wire    [3 :0]  x_hpcp_cnt_en;               
wire    [3 :0]  x_l2of_int;                  


parameter SMPR  = 4'h4;
parameter TEEM  = 4'h5;
parameter L2RA  = 4'h8;
parameter L2RM  = 4'h9;
parameter L2WA  = 4'ha;
parameter L2WM  = 4'hb;
parameter L2OF  = 4'hc;

//==========================================================
//  REGS MUX
//==========================================================

// &CombBeg; @39
always @( l2wa_value[63:0]
       or l2rm_value[63:0]
       or regs_idx[3:0]
       or l2of_value[63:0]
       or teem_value[63:0]
       or l2wm_value[63:0]
       or l2ra_value[63:0]
       or smpr_value[63:0])
begin
  case(regs_idx[3:0])
    SMPR:    regs_dout[63:0] = smpr_value[63:0];
    TEEM:    regs_dout[63:0] = teem_value[63:0];
    L2RA:    regs_dout[63:0] = l2ra_value[63:0];
    L2RM:    regs_dout[63:0] = l2rm_value[63:0];
    L2WA:    regs_dout[63:0] = l2wa_value[63:0];
    L2WM:    regs_dout[63:0] = l2wm_value[63:0];
    L2OF:    regs_dout[63:0] = l2of_value[63:0];
    default: regs_dout[63:0] = 64'b0;
  endcase
// &CombEnd; @50
end

assign x_csr_value[63:0] = regs_dout[63:0];

//==========================================================
//  CSR REGS
//==========================================================
assign smpr_wen = regs_sel_final_x & regs_wen & regs_idx[3:0] == SMPR;
assign l2ra_wen = regs_sel_final_x & regs_wen & regs_idx[3:0] == L2RA;
assign l2rm_wen = regs_sel_final_x & regs_wen & regs_idx[3:0] == L2RM;
assign l2wa_wen = regs_sel_final_x & regs_wen & regs_idx[3:0] == L2WA;
assign l2wm_wen = regs_sel_final_x & regs_wen & regs_idx[3:0] == L2WM;
assign l2of_wen = regs_sel_final_x & regs_wen & regs_idx[3:0] == L2OF;


//======================================
//  SMPR
//======================================

always @(posedge smpr_clk or negedge x_fifo_rst_b)
begin
  if (!x_fifo_rst_b)
    smpen <= 1'b0;
  else if (smpr_wen)
    smpen <= regs_wdata_final[0];
end

assign smpr_value[63:0] = {63'b0,smpen};

assign smpen_x = smpen;
assign teem_value[63:0] = 64'b0;

//======================================
//  L2RA
//======================================

always @(posedge l2ra_clk or negedge x_fifo_rst_b)
begin
  if (!x_fifo_rst_b)
    l2_read_acc_cnt[63:0] <= 64'b0;
  else if (l2ra_wen)
    l2_read_acc_cnt[63:0] <= regs_wdata_final[63:0];
  else if (x_hpcp_cnt_en[0])
    l2_read_acc_cnt[63:0] <= l2_read_acc_adder[63:0];   
end

always @(posedge l2ra_clk or negedge x_fifo_rst_b)
begin
  if (!x_fifo_rst_b)
    l2_read_acc_of <= 1'b0;
  else if (l2_read_acc_of)
    l2_read_acc_of <= 1'b0;
  else if (x_hpcp_cnt_en[0])
    l2_read_acc_of <= l2_read_acc_adder[64];   
end

assign l2_read_acc_adder[64:0] = {1'b0,l2_read_acc_cnt[63:0]} 
                               + {64'b0,l2cif0_regs_read_acc_inc_x}
                               + {64'b0,l2cif1_regs_read_acc_inc_x};
assign l2ra_of          = l2_read_acc_of;
assign l2ra_value[63:0] = l2_read_acc_cnt[63:0];


//======================================
//  L2RM
//======================================

always @(posedge l2rm_clk or negedge x_fifo_rst_b)
begin
  if (!x_fifo_rst_b)
    l2_read_miss_cnt[63:0] <= 64'b0;
  else if (l2rm_wen)
    l2_read_miss_cnt[63:0] <= regs_wdata_final[63:0];
  else if (x_hpcp_cnt_en[1])
    l2_read_miss_cnt[63:0] <= l2_read_miss_adder[63:0];   
end

always @(posedge l2rm_clk or negedge x_fifo_rst_b)
begin
  if (!x_fifo_rst_b)
    l2_read_miss_of <= 1'b0;
  else if (l2_read_miss_of)
    l2_read_miss_of <= 1'b0;
  else if (x_hpcp_cnt_en[1])
    l2_read_miss_of <= l2_read_miss_adder[64];   
end

assign l2_read_miss_adder[64:0] = {1'b0,l2_read_miss_cnt[63:0]} 
                                + {64'b0,l2cif0_regs_read_miss_inc_x}
                                + {64'b0,l2cif1_regs_read_miss_inc_x};
assign l2rm_of          = l2_read_miss_of;
assign l2rm_value[63:0] = l2_read_miss_cnt[63:0];

//======================================
//  L2WA
//======================================

always @(posedge l2wa_clk or negedge x_fifo_rst_b)
begin
  if (!x_fifo_rst_b)
    l2_write_acc_cnt[63:0] <= 64'b0;
  else if (l2wa_wen)
    l2_write_acc_cnt[63:0] <= regs_wdata_final[63:0];
  else if (x_hpcp_cnt_en[2])
    l2_write_acc_cnt[63:0] <= l2_write_acc_adder[63:0];   
end

always @(posedge l2wa_clk or negedge x_fifo_rst_b)
begin
  if (!x_fifo_rst_b)
    l2_write_acc_of <= 1'b0;
  else if (l2_write_acc_of)
    l2_write_acc_of <= 1'b0;
  else if (x_hpcp_cnt_en[2])
    l2_write_acc_of <= l2_write_acc_adder[64];   
end

assign l2_write_acc_adder[64:0] = {1'b0,l2_write_acc_cnt[63:0]} 
                                + {64'b0,l2cif0_regs_write_acc_inc_x}
                                + {64'b0,l2cif1_regs_write_acc_inc_x};
assign l2wa_of          = l2_write_acc_of;
assign l2wa_value[63:0] = l2_write_acc_cnt[63:0];


//======================================
//  L2WM
//======================================

always @(posedge l2wm_clk or negedge x_fifo_rst_b)
begin
  if (!x_fifo_rst_b)
    l2_write_miss_cnt[63:0] <= 64'b0;
  else if (l2wm_wen)
    l2_write_miss_cnt[63:0] <= regs_wdata_final[63:0];
  else if (x_hpcp_cnt_en[3])
    l2_write_miss_cnt[63:0] <= l2_write_miss_adder[63:0];   
end

always @(posedge l2wm_clk or negedge x_fifo_rst_b)
begin
  if (!x_fifo_rst_b)
    l2_write_miss_of <= 1'b0;
  else if (l2_write_miss_of)
    l2_write_miss_of <= 1'b0;
  else if (x_hpcp_cnt_en[3])
    l2_write_miss_of <= l2_write_miss_adder[64];   
end

assign l2_write_miss_adder[64:0] = {1'b0,l2_write_miss_cnt[63:0]} 
                                 + {64'b0,l2cif0_regs_write_miss_inc_x}
                                 + {64'b0,l2cif1_regs_write_miss_inc_x};
assign l2wm_of          = l2_write_miss_of;
assign l2wm_value[63:0] = l2_write_miss_cnt[63:0];

//======================================
//  L2OF
//======================================
always @(posedge l2of_clk or negedge x_fifo_rst_b)
begin
  if (!x_fifo_rst_b)
    l2of_reg[3:0] <= 4'b0;
  else if (l2of_wen)
    l2of_reg[3:0] <= l2of_updt_data[3:0];
  else 
    l2of_reg[3:0] <=l2of_reg[3:0] | {l2wm_of,l2wa_of,l2rm_of,l2ra_of};
end

assign l2of_updt_data[3:0] = regs_l2of_wen[3:0]    & regs_wdata_final[3:0]
                           | (~regs_l2of_wen[3:0]) & l2of_reg[3:0];
assign l2of_value[63:0]    = {60'b0,l2of_reg[3:0]};
assign x_l2of_int[3:0]     = l2of_reg[3:0]; 

// &Force("input","x_hpcp_cnt_en");  @247
// &Force("bus", "x_hpcp_cnt_en",3,0); @248
// &Force("input", "l2cif0_regs_read_acc_inc_x"); @249
// &Force("input", "l2cif0_regs_read_miss_inc_x"); @250
// &Force("input", "l2cif0_regs_write_acc_inc_x"); @251
// &Force("input", "l2cif0_regs_write_miss_inc_x"); @252
// &Force("input", "l2cif1_regs_read_acc_inc_x"); @253
// &Force("input", "l2cif1_regs_read_miss_inc_x"); @254
// &Force("input", "l2cif1_regs_write_acc_inc_x"); @255
// &Force("input", "l2cif1_regs_write_miss_inc_x"); @256
// &Force("output", "x_l2of_int"); @257

//==========================================================
//  ICG
//==========================================================
assign smpr_clk_en = smpr_wen;
// &Instance("gated_clk_cell", "x_smpr_gated_clk"); @263
gated_clk_cell  x_smpr_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (smpr_clk          ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (smpr_clk_en       ),
  .module_en          (ciu_icg_en        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @264
//          .external_en (1'b0), @265
//          .global_en   (1'b1), @266
//          .module_en   (ciu_icg_en), @267
//          .local_en    (smpr_clk_en), @268
//          .clk_out     (smpr_clk)); @269

// &Instance("gated_clk_cell", "x_teem_gated_clk"); @273
// &Connect(.clk_in      (forever_cpuclk), @274
//          .external_en (1'b0), @275
//          .global_en   (1'b1), @276
//          .module_en   (ciu_icg_en), @277
//          .local_en    (teem_clk_en), @278
//          .clk_out     (teem_clk)); @279

assign l2ra_clk_en = l2ra_wen || x_hpcp_cnt_en[0] || l2ra_of;
// &Instance("gated_clk_cell", "x_l2ra_gated_clk"); @283
gated_clk_cell  x_l2ra_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (l2ra_clk          ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (l2ra_clk_en       ),
  .module_en          (ciu_icg_en        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @284
//          .external_en (1'b0), @285
//          .global_en   (1'b1), @286
//          .module_en   (ciu_icg_en), @287
//          .local_en    (l2ra_clk_en), @288
//          .clk_out     (l2ra_clk)); @289

assign l2rm_clk_en = l2rm_wen || x_hpcp_cnt_en[1] || l2rm_of;
// &Instance("gated_clk_cell", "x_l2rm_gated_clk"); @292
gated_clk_cell  x_l2rm_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (l2rm_clk          ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (l2rm_clk_en       ),
  .module_en          (ciu_icg_en        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @293
//          .external_en (1'b0), @294
//          .global_en   (1'b1), @295
//          .module_en   (ciu_icg_en), @296
//          .local_en    (l2rm_clk_en), @297
//          .clk_out     (l2rm_clk));        @298

assign l2wa_clk_en = l2wa_wen || x_hpcp_cnt_en[2] || l2wa_of;
// &Instance("gated_clk_cell", "x_l2wa_gated_clk"); @301
gated_clk_cell  x_l2wa_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (l2wa_clk          ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (l2wa_clk_en       ),
  .module_en          (ciu_icg_en        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @302
//          .external_en (1'b0), @303
//          .global_en   (1'b1), @304
//          .module_en   (ciu_icg_en), @305
//          .local_en    (l2wa_clk_en), @306
//          .clk_out     (l2wa_clk)); @307

assign l2wm_clk_en = l2wm_wen || x_hpcp_cnt_en[3] || l2wm_of;
// &Instance("gated_clk_cell", "x_l2wm_gated_clk"); @310
gated_clk_cell  x_l2wm_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (l2wm_clk          ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (l2wm_clk_en       ),
  .module_en          (ciu_icg_en        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @311
//          .external_en (1'b0), @312
//          .global_en   (1'b1), @313
//          .module_en   (ciu_icg_en), @314
//          .local_en    (l2wm_clk_en), @315
//          .clk_out     (l2wm_clk));   @316

assign l2of_clk_en = l2of_wen || l2ra_of || l2rm_of || l2wa_of || l2wm_of;
// &Instance("gated_clk_cell", "x_l2of_gated_clk"); @319
gated_clk_cell  x_l2of_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (l2of_clk          ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (l2of_clk_en       ),
  .module_en          (ciu_icg_en        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @320
//          .external_en (1'b0), @321
//          .global_en   (1'b1), @322
//          .module_en   (ciu_icg_en), @323
//          .local_en    (l2of_clk_en), @324
//          .clk_out     (l2of_clk));  @325

// &ModuleEnd; @327
endmodule


