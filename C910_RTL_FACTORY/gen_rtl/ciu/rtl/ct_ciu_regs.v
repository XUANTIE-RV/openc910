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
module ct_ciu_regs(
  ciu_apbif_had_pctrace_inv,
  ciu_chr2_bar_dis,
  ciu_chr2_dvm_dis,
  ciu_chr2_sf_dis,
  ciu_global_icg_en,
  ciu_icg_en,
  ciu_l2c_data_latency,
  ciu_l2c_data_setup,
  ciu_l2c_iprf,
  ciu_l2c_rst_req,
  ciu_l2c_tag_latency,
  ciu_l2c_tag_setup,
  ciu_l2c_tprf,
  ciu_so_ostd_dis,
  ciu_sysio_icg_en,
  ciu_xx_smpen,
  core0_fifo_rst_b,
  core1_fifo_rst_b,
  cpurst_b,
  forever_cpuclk,
  l2c_icg_en,
  l2c_plic_ecc_int_vld,
  l2cif0_regs_read_acc_inc,
  l2cif0_regs_read_miss_inc,
  l2cif0_regs_write_acc_inc,
  l2cif0_regs_write_miss_inc,
  l2cif1_regs_read_acc_inc,
  l2cif1_regs_read_miss_inc,
  l2cif1_regs_write_acc_inc,
  l2cif1_regs_write_miss_inc,
  pad_yy_icg_scan_en,
  piu0_regs_hpcp_cnt_en,
  piu0_regs_op,
  piu0_regs_sel,
  piu0_regs_wdata,
  piu1_regs_hpcp_cnt_en,
  piu1_regs_op,
  piu1_regs_sel,
  piu1_regs_wdata,
  piu2_regs_op,
  piu2_regs_sel,
  piu2_regs_wdata,
  piu3_regs_op,
  piu3_regs_sel,
  piu3_regs_wdata,
  regs_apbif_icg_en,
  regs_piu0_cmplt,
  regs_piu0_hpcp_l2of_int,
  regs_piu1_cmplt,
  regs_piu1_hpcp_l2of_int,
  regs_piu2_cmplt,
  regs_piu3_cmplt,
  regs_piux_rdata
);

// &Ports; @23
input           core0_fifo_rst_b;          
input           core1_fifo_rst_b;          
input           cpurst_b;                  
input           forever_cpuclk;            
input   [3 :0]  l2cif0_regs_read_acc_inc;  
input   [3 :0]  l2cif0_regs_read_miss_inc; 
input   [3 :0]  l2cif0_regs_write_acc_inc; 
input   [3 :0]  l2cif0_regs_write_miss_inc; 
input   [3 :0]  l2cif1_regs_read_acc_inc;  
input   [3 :0]  l2cif1_regs_read_miss_inc; 
input   [3 :0]  l2cif1_regs_write_acc_inc; 
input   [3 :0]  l2cif1_regs_write_miss_inc; 
input           pad_yy_icg_scan_en;        
input   [3 :0]  piu0_regs_hpcp_cnt_en;     
input   [15:0]  piu0_regs_op;              
input           piu0_regs_sel;             
input   [63:0]  piu0_regs_wdata;           
input   [3 :0]  piu1_regs_hpcp_cnt_en;     
input   [15:0]  piu1_regs_op;              
input           piu1_regs_sel;             
input   [63:0]  piu1_regs_wdata;           
input   [15:0]  piu2_regs_op;              
input           piu2_regs_sel;             
input   [63:0]  piu2_regs_wdata;           
input   [15:0]  piu3_regs_op;              
input           piu3_regs_sel;             
input   [63:0]  piu3_regs_wdata;           
output          ciu_apbif_had_pctrace_inv; 
output          ciu_chr2_bar_dis;          
output          ciu_chr2_dvm_dis;          
output          ciu_chr2_sf_dis;           
output          ciu_global_icg_en;         
output          ciu_icg_en;                
output  [2 :0]  ciu_l2c_data_latency;      
output          ciu_l2c_data_setup;        
output  [1 :0]  ciu_l2c_iprf;              
output          ciu_l2c_rst_req;           
output  [2 :0]  ciu_l2c_tag_latency;       
output          ciu_l2c_tag_setup;         
output          ciu_l2c_tprf;              
output          ciu_so_ostd_dis;           
output          ciu_sysio_icg_en;          
output  [3 :0]  ciu_xx_smpen;              
output          l2c_icg_en;                
output          l2c_plic_ecc_int_vld;      
output          regs_apbif_icg_en;         
output          regs_piu0_cmplt;           
output  [3 :0]  regs_piu0_hpcp_l2of_int;   
output          regs_piu1_cmplt;           
output  [3 :0]  regs_piu1_hpcp_l2of_int;   
output          regs_piu2_cmplt;           
output          regs_piu3_cmplt;           
output  [63:0]  regs_piux_rdata;           

// &Regs; @24
reg     [10:0]  chr2_data;                 
reg     [2 :0]  ciu_ccr2_dltncy;           
reg             ciu_ccr2_dsetup;           
reg     [1 :0]  ciu_ccr2_iprf;             
reg     [2 :0]  ciu_ccr2_tltncy;           
reg             ciu_ccr2_tprf;             
reg             ciu_ccr2_tsetup;           
reg     [63:0]  private_csr_value;         
reg     [1 :0]  regs_cur_state;            
reg     [63:0]  regs_dout;                 
reg     [1 :0]  regs_next_state;           
reg     [11:0]  regs_op;                   
reg     [63:0]  regs_rdata;                
reg     [3 :0]  regs_sel;                  
reg     [3 :0]  regs_sel_ff;               
reg     [63:0]  regs_wdata;                
reg             rvba_rst;                  

// &Wires; @25
wire            ccr2_clk;                  
wire            ccr2_clk_en;               
wire            ccr2_wen;                  
wire            chr2_clk;                  
wire            chr2_clk_en;               
wire            ciu_apbif_had_pctrace_inv; 
wire    [63:0]  ciu_ccr2;                  
wire            ciu_ccr2_eccen;            
wire    [63:0]  ciu_cer2;                  
wire    [63:0]  ciu_chr2;                  
wire            ciu_chr2_bar_dis;          
wire            ciu_chr2_dvm_dis;          
wire            ciu_chr2_sf_dis;           
wire    [63:0]  ciu_eir2;                  
wire            ciu_global_icg_en;         
wire            ciu_icg_en;                
wire    [2 :0]  ciu_l2c_data_latency;      
wire            ciu_l2c_data_setup;        
wire    [1 :0]  ciu_l2c_iprf;              
wire            ciu_l2c_rst_req;           
wire    [2 :0]  ciu_l2c_tag_latency;       
wire            ciu_l2c_tag_setup;         
wire            ciu_l2c_tprf;              
wire            ciu_so_ostd_dis;           
wire            ciu_sysio_icg_en;          
wire    [3 :0]  ciu_xx_smpen;              
wire    [63:0]  core0_csr_value;           
wire            core0_fifo_rst_b;          
wire    [3 :0]  core0_hpcp_cnt_en;         
wire    [3 :0]  core0_l2of_int;            
wire    [63:0]  core1_csr_value;           
wire            core1_fifo_rst_b;          
wire    [3 :0]  core1_hpcp_cnt_en;         
wire    [3 :0]  core1_l2of_int;            
wire    [63:0]  core2_csr_value;           
wire    [63:0]  core3_csr_value;           
wire            cpurst_b;                  
wire            ctrl_clk;                  
wire            ctrl_clk_en;               
wire            forever_cpuclk;            
wire            hint2_wen;                 
wire            l2c_icg_en;                
wire            l2c_plic_ecc_int_vld;      
wire    [3 :0]  l2cif0_regs_read_acc_inc;  
wire    [3 :0]  l2cif0_regs_read_miss_inc; 
wire    [3 :0]  l2cif0_regs_write_acc_inc; 
wire    [3 :0]  l2cif0_regs_write_miss_inc; 
wire    [3 :0]  l2cif1_regs_read_acc_inc;  
wire    [3 :0]  l2cif1_regs_read_miss_inc; 
wire    [3 :0]  l2cif1_regs_write_acc_inc; 
wire    [3 :0]  l2cif1_regs_write_miss_inc; 
wire            pad_yy_icg_scan_en;        
wire    [3 :0]  piu0_regs_hpcp_cnt_en;     
wire    [15:0]  piu0_regs_op;              
wire            piu0_regs_sel;             
wire    [63:0]  piu0_regs_wdata;           
wire    [3 :0]  piu1_regs_hpcp_cnt_en;     
wire    [15:0]  piu1_regs_op;              
wire            piu1_regs_sel;             
wire    [63:0]  piu1_regs_wdata;           
wire    [15:0]  piu2_regs_op;              
wire            piu2_regs_sel;             
wire    [63:0]  piu2_regs_wdata;           
wire    [15:0]  piu3_regs_op;              
wire            piu3_regs_sel;             
wire    [63:0]  piu3_regs_wdata;           
wire            rdata_clk;                 
wire            rdata_clk_en;              
wire            regs_apbif_icg_en;         
wire            regs_csrrc;                
wire            regs_csrrs;                
wire            regs_csrrw;                
wire            regs_cur_idle;             
wire            regs_cur_read;             
wire            regs_cur_write;            
wire    [3 :0]  regs_idx;                  
wire    [3 :0]  regs_l2of_wen;             
wire            regs_piu0_cmplt;           
wire    [3 :0]  regs_piu0_hpcp_l2of_int;   
wire            regs_piu1_cmplt;           
wire    [3 :0]  regs_piu1_hpcp_l2of_int;   
wire            regs_piu2_cmplt;           
wire            regs_piu3_cmplt;           
wire            regs_piu_cmplt;            
wire    [63:0]  regs_piux_rdata;           
wire            regs_req_vld;              
wire    [3 :0]  regs_sel_final;            
wire    [3 :0]  regs_sel_raw;              
wire    [63:0]  regs_wdata_final;          
wire            regs_wen;                  
wire            regs_write;                
wire    [3 :0]  smpen;                     


parameter CCR2  = 4'h0;
parameter HINT2 = 4'h1;
parameter CER2  = 4'h2;
parameter EIR2  = 4'h3;
parameter SMPR  = 4'h4;
parameter TEEM  = 4'h5;
parameter L2RA  = 4'h8;
parameter L2RM  = 4'h9;
parameter L2WA  = 4'ha;
parameter L2WM  = 4'hb;
parameter L2OF  = 4'hc;

//==============================================================================
//  arbiterf of requests from multicore
//==============================================================================
parameter REG_7 = 11;
parameter REG_4 = 8;
parameter REG_3 = 7;
parameter REG_0 = 4;
parameter WT    = 3;
parameter CSRRW = 2;
parameter CSRRS = 1;
parameter CSRRC = 0;

// &Force("bus", "piu0_regs_op",15,0); @51
// &Force("bus", "piu1_regs_op",15,0); @52
// &Force("bus", "piu2_regs_op",15,0); @53
// &Force("bus", "piu3_regs_op",15,0); @54

assign regs_sel_raw[3:0] = {piu3_regs_sel,piu2_regs_sel,piu1_regs_sel,piu0_regs_sel};

// &CombBeg; @58
always @( regs_sel_raw[3:0])
begin
  casez(regs_sel_raw[3:0])
    4'b1??? : regs_sel[3:0] = 4'b1000; 
    4'b01?? : regs_sel[3:0] = 4'b0100;
    4'b001? : regs_sel[3:0] = 4'b0010; 
    4'b0001 : regs_sel[3:0] = 4'b0001; 
    default : regs_sel[3:0] = 4'b0000; 
  endcase
// &CombEnd; @66
end

always@(posedge ctrl_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    regs_sel_ff[3:0] <= 4'b0;
  else if (regs_req_vld & regs_cur_idle)
    regs_sel_ff[3:0] <= regs_sel[3:0];
end

assign regs_sel_final[3:0] = regs_cur_idle ? regs_sel[3:0] : regs_sel_ff[3:0];

// &CombBeg; @78
always @( piu2_regs_op[11:0]
       or piu3_regs_op[11:0]
       or piu2_regs_wdata[63:0]
       or piu0_regs_op[11:0]
       or piu0_regs_wdata[63:0]
       or piu1_regs_op[11:0]
       or piu1_regs_wdata[63:0]
       or piu3_regs_wdata[63:0]
       or regs_sel_final[3:0])
begin
  case(regs_sel_final[3:0])
    4'b0001 : begin regs_op[11:0] = piu0_regs_op[11:0]; regs_wdata[63:0] = piu0_regs_wdata[63:0]; end
    4'b0010 : begin regs_op[11:0] = piu1_regs_op[11:0]; regs_wdata[63:0] = piu1_regs_wdata[63:0]; end
    4'b0100 : begin regs_op[11:0] = piu2_regs_op[11:0]; regs_wdata[63:0] = piu2_regs_wdata[63:0]; end
    4'b1000 : begin regs_op[11:0] = piu3_regs_op[11:0]; regs_wdata[63:0] = piu3_regs_wdata[63:0]; end
    default : begin regs_op[11:0] = 12'b0;              regs_wdata[63:0] = 64'b0;                 end
  endcase
// &CombEnd; @86
end

assign regs_req_vld       = |regs_sel_final[3:0];
assign regs_write         = regs_op[WT];
assign regs_l2of_wen[3:0] = regs_op[REG_7:REG_4];
assign regs_idx[3:0]      = regs_op[REG_3:REG_0];
assign regs_csrrw         = regs_op[CSRRW];
assign regs_csrrs         = regs_op[CSRRS];
assign regs_csrrc         = regs_op[CSRRC];

//================================================
//  REGS FSM
//================================================
parameter IDLE  = 2'b00;
parameter READ  = 2'b01;
parameter WRITE = 2'b10;

always@(posedge ctrl_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    regs_cur_state[1:0] <= IDLE;
  else 
    regs_cur_state[1:0] <= regs_next_state[1:0];
end

// &CombBeg; @111
always @( regs_write
       or regs_req_vld
       or regs_cur_state)
begin
  case(regs_cur_state)
    IDLE: begin
      if (regs_req_vld)
        regs_next_state = READ;
      else 
        regs_next_state = IDLE;
    end
    READ: begin
      if (regs_write)
        regs_next_state = WRITE;
      else
        regs_next_state = IDLE;
    end
    WRITE: begin
      regs_next_state = IDLE;
    end
    default: regs_next_state = IDLE;
  endcase
// &CombEnd; @130
end

assign regs_cur_idle  = regs_cur_state == IDLE;
assign regs_cur_read  = regs_cur_state == READ;
assign regs_cur_write = regs_cur_state == WRITE;

assign regs_piu_cmplt        = regs_write ? regs_cur_write : regs_cur_read;
assign regs_piu0_cmplt       = regs_piu_cmplt & regs_sel_final[0];
assign regs_piu1_cmplt       = regs_piu_cmplt & regs_sel_final[1];
assign regs_piu2_cmplt       = regs_piu_cmplt & regs_sel_final[2];
assign regs_piu3_cmplt       = regs_piu_cmplt & regs_sel_final[3];
assign regs_piux_rdata[63:0] = regs_rdata[63:0];

always@(posedge rdata_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    regs_rdata[63:0] <= 64'b0;
  else if (regs_req_vld & regs_cur_idle)
    regs_rdata[63:0] <= regs_dout[63:0];
end

// &CombBeg; @151
always @( ciu_eir2[63:0]
       or private_csr_value[63:0]
       or regs_idx[3:0]
       or ciu_chr2[63:0]
       or ciu_cer2[63:0]
       or ciu_ccr2[63:0])
begin
  case(regs_idx[3:0])
    CCR2:    regs_dout[63:0] = ciu_ccr2[63:0];
    HINT2:   regs_dout[63:0] = ciu_chr2[63:0];
    CER2:    regs_dout[63:0] = ciu_cer2[63:0];
    EIR2:    regs_dout[63:0] = ciu_eir2[63:0];
    SMPR,TEEM,L2RA,L2RM,L2WA,L2WM,L2OF:
             regs_dout[63:0] = private_csr_value[63:0];
    default: regs_dout[63:0] = 64'b0;
  endcase
// &CombEnd; @161
end

// &CombBeg; @163
always @( core1_csr_value[63:0]
       or core0_csr_value[63:0]
       or core2_csr_value[63:0]
       or core3_csr_value[63:0]
       or regs_sel_final[3:0])
begin
  case(regs_sel_final[3:0])
    4'b0001 : private_csr_value[63:0] = core0_csr_value[63:0]; 
    4'b0010 : private_csr_value[63:0] = core1_csr_value[63:0]; 
    4'b0100 : private_csr_value[63:0] = core2_csr_value[63:0]; 
    4'b1000 : private_csr_value[63:0] = core3_csr_value[63:0]; 
    default : private_csr_value[63:0] = 64'b0;
  endcase
// &CombEnd; @171
end

//==============================================================================
//          shared CSR of L2C
//==============================================================================
assign regs_wen  = regs_cur_read & regs_write;
assign ccr2_wen  = regs_wen & regs_idx[3:0] == CCR2;
assign hint2_wen = regs_wen & regs_idx[3:0] == HINT2;

assign regs_wdata_final[63:0] = {64{regs_csrrw}} &  regs_wdata[63:0] |
                                {64{regs_csrrs}} & (regs_rdata[63:0] | regs_wdata[63:0]) |
                                {64{regs_csrrc}} & (regs_rdata[63:0] & ~regs_wdata[63:0]);


//======================================
//          CHR2
//======================================

always @(posedge chr2_clk or negedge cpurst_b)
begin
  if(~cpurst_b)
    chr2_data[10:0] <= 11'b0;
  else if (hint2_wen) 
    chr2_data[10:0] <= regs_wdata_final[10:0];
end

assign ciu_chr2[63:0] = {53'b0, chr2_data[10:0]}; 

assign ciu_icg_en           = chr2_data[1];
assign l2c_icg_en           = chr2_data[6];
assign regs_apbif_icg_en    = chr2_data[7];
assign ciu_sysio_icg_en     = chr2_data[8];
assign ciu_global_icg_en    = chr2_data[9];

assign ciu_chr2_bar_dis     = chr2_data[0];
assign ciu_chr2_sf_dis      = chr2_data[4];
assign ciu_chr2_dvm_dis     = chr2_data[5];
assign ciu_so_ostd_dis      = chr2_data[10];


// &Force("output","ciu_icg_en"); @218
//======================================
//     error injection register
//======================================
assign ciu_eir2[63:0] = 64'b0;

//======================================
//          CCR2 
//reg content:
//| 31 |30-29|28:26|  25  |24-22 |21-20|
//|TPRF| IPRF| res |TSETUP|TLTNCY| res |
//|  19  |18-16 |15-4| 3 | 2 |  1  | 0  |
//|DSETUP|DLTNCY|res |L2E|res|ECCEN|INCL|
//INCL: L2 inclusive en
//TPRF: L2 TLB prefetch en
//IPRF: L2 Icache prefetch strength
//TSETUP: L2 TAG RAM setup
//TLTNCY: L2 TAG RAM latency
//DSETUP: L2 DATA RAM setup
//DLTNCY: L2 DATA RAM latency
//ECCEN : L2 DATA RAM ECC en
//L2E   : L2 cache en
//======================================
//TPRF
always @(posedge ccr2_clk or negedge cpurst_b)
begin
  if(~cpurst_b)
    ciu_ccr2_tprf <= 1'b0;
  else if(ccr2_wen)
    ciu_ccr2_tprf <= regs_wdata_final[31];
  else
    ciu_ccr2_tprf <= ciu_ccr2_tprf;
end
//IPRF
always @(posedge ccr2_clk or negedge cpurst_b)
begin
  if(~cpurst_b)
    ciu_ccr2_iprf[1:0] <= 2'b0;
  else if(ccr2_wen)
    ciu_ccr2_iprf[1:0] <= regs_wdata_final[30:29];
  else
    ciu_ccr2_iprf[1:0] <= ciu_ccr2_iprf[1:0];
end
//TSETUP
always @(posedge ccr2_clk or negedge cpurst_b)
begin
  if(~cpurst_b)
    ciu_ccr2_tsetup <= 1'b0;
  else if(ccr2_wen)
    ciu_ccr2_tsetup <= regs_wdata_final[25];
  else
    ciu_ccr2_tsetup <= ciu_ccr2_tsetup;
end
//TLTNCY
always @(posedge ccr2_clk or negedge cpurst_b)
begin
  if(~cpurst_b)
    ciu_ccr2_tltncy[2:0] <= 3'b1;
  else if(ccr2_wen)
    ciu_ccr2_tltncy[2:0] <= regs_wdata_final[24:22];
  else
    ciu_ccr2_tltncy[2:0] <= ciu_ccr2_tltncy[2:0];
end
//DSETUP
always @(posedge ccr2_clk or negedge cpurst_b)
begin
  if(~cpurst_b)
    ciu_ccr2_dsetup <= 1'b0;
  else if(ccr2_wen)
    ciu_ccr2_dsetup <= regs_wdata_final[19];
  else
    ciu_ccr2_dsetup <= ciu_ccr2_dsetup;
end
//DLTNCY
always @(posedge ccr2_clk or negedge cpurst_b)
begin
  if(~cpurst_b)
    ciu_ccr2_dltncy[2:0] <= 3'b1;
  else if(ccr2_wen)
    ciu_ccr2_dltncy[2:0] <= regs_wdata_final[18:16];
  else
    ciu_ccr2_dltncy[2:0] <= ciu_ccr2_dltncy[2:0];
end
//ECCEN
assign ciu_ccr2_eccen = 1'b0;

assign ciu_ccr2[63:0] = {32'b0,
                         ciu_ccr2_tprf,
                         ciu_ccr2_iprf[1:0],
                         3'b0,
                         ciu_ccr2_tsetup,
                         ciu_ccr2_tltncy[2:0],
                         2'b0,
                         ciu_ccr2_dsetup,
                         ciu_ccr2_dltncy[2:0],
                         12'b0,
                         1'b1,
                         1'b0,
                         ciu_ccr2_eccen,
                         1'b1
                        };


assign ciu_l2c_iprf[1:0]         = ciu_ccr2_iprf[1:0];
assign ciu_l2c_tprf              = ciu_ccr2_tprf;
assign ciu_l2c_tag_latency[2:0]  = ciu_ccr2_tltncy[2:0];
assign ciu_l2c_data_latency[2:0] = ciu_ccr2_dltncy[2:0];
assign ciu_l2c_tag_setup         = ciu_ccr2_tsetup;
assign ciu_l2c_data_setup        = ciu_ccr2_dsetup; 

//======================================
//          CER2 
// | 31      |
// | ECC_ERR |
//======================================
assign ciu_cer2[63:0] = 64'b0;
assign l2c_plic_ecc_int_vld = 1'b0;

// &ConnRule(s/^x_/core0_/); @461
// &ConnRule(s/_x$/[0]/); @462
// &Instance("ct_ciu_regs_kid","x_ct_ciu_regs_kid_core0"); @463
ct_ciu_regs_kid  x_ct_ciu_regs_kid_core0 (
  .ciu_icg_en                    (ciu_icg_en                   ),
  .forever_cpuclk                (forever_cpuclk               ),
  .l2cif0_regs_read_acc_inc_x    (l2cif0_regs_read_acc_inc[0]  ),
  .l2cif0_regs_read_miss_inc_x   (l2cif0_regs_read_miss_inc[0] ),
  .l2cif0_regs_write_acc_inc_x   (l2cif0_regs_write_acc_inc[0] ),
  .l2cif0_regs_write_miss_inc_x  (l2cif0_regs_write_miss_inc[0]),
  .l2cif1_regs_read_acc_inc_x    (l2cif1_regs_read_acc_inc[0]  ),
  .l2cif1_regs_read_miss_inc_x   (l2cif1_regs_read_miss_inc[0] ),
  .l2cif1_regs_write_acc_inc_x   (l2cif1_regs_write_acc_inc[0] ),
  .l2cif1_regs_write_miss_inc_x  (l2cif1_regs_write_miss_inc[0]),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .regs_idx                      (regs_idx                     ),
  .regs_l2of_wen                 (regs_l2of_wen                ),
  .regs_sel_final_x              (regs_sel_final[0]            ),
  .regs_wdata_final              (regs_wdata_final             ),
  .regs_wen                      (regs_wen                     ),
  .smpen_x                       (smpen[0]                     ),
  .x_csr_value                   (core0_csr_value              ),
  .x_fifo_rst_b                  (core0_fifo_rst_b             ),
  .x_hpcp_cnt_en                 (core0_hpcp_cnt_en            ),
  .x_l2of_int                    (core0_l2of_int               )
);

// &ConnRule(s/^x_/core1_/); @468
// &ConnRule(s/_x$/[1]/); @469
// &Instance("ct_ciu_regs_kid","x_ct_ciu_regs_kid_core1"); @471
ct_ciu_regs_kid  x_ct_ciu_regs_kid_core1 (
  .ciu_icg_en                    (ciu_icg_en                   ),
  .forever_cpuclk                (forever_cpuclk               ),
  .l2cif0_regs_read_acc_inc_x    (l2cif0_regs_read_acc_inc[1]  ),
  .l2cif0_regs_read_miss_inc_x   (l2cif0_regs_read_miss_inc[1] ),
  .l2cif0_regs_write_acc_inc_x   (l2cif0_regs_write_acc_inc[1] ),
  .l2cif0_regs_write_miss_inc_x  (l2cif0_regs_write_miss_inc[1]),
  .l2cif1_regs_read_acc_inc_x    (l2cif1_regs_read_acc_inc[1]  ),
  .l2cif1_regs_read_miss_inc_x   (l2cif1_regs_read_miss_inc[1] ),
  .l2cif1_regs_write_acc_inc_x   (l2cif1_regs_write_acc_inc[1] ),
  .l2cif1_regs_write_miss_inc_x  (l2cif1_regs_write_miss_inc[1]),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .regs_idx                      (regs_idx                     ),
  .regs_l2of_wen                 (regs_l2of_wen                ),
  .regs_sel_final_x              (regs_sel_final[1]            ),
  .regs_wdata_final              (regs_wdata_final             ),
  .regs_wen                      (regs_wen                     ),
  .smpen_x                       (smpen[1]                     ),
  .x_csr_value                   (core1_csr_value              ),
  .x_fifo_rst_b                  (core1_fifo_rst_b             ),
  .x_hpcp_cnt_en                 (core1_hpcp_cnt_en            ),
  .x_l2of_int                    (core1_l2of_int               )
);

// &ConnRule(s/^x_/core2_/); @477
// &ConnRule(s/_x$/[2]/); @478
// &Instance("ct_ciu_regs_kid","x_ct_ciu_regs_kid_core2"); @479
assign core2_csr_value[63:0] = 64'b0;
assign smpen[2]    = 1'b0;
// &ConnRule(s/^x_/core3_/); @485
// &ConnRule(s/_x$/[3]/); @486
// &Instance("ct_ciu_regs_kid","x_ct_ciu_regs_kid_core3"); @487
assign core3_csr_value[63:0] = 64'b0;
assign smpen[3]    = 1'b0;


// &Force("bus", "l2cif0_regs_read_acc_inc",3,0); @538
// &Force("bus", "l2cif0_regs_read_miss_inc",3,0); @539
// &Force("bus", "l2cif0_regs_write_acc_inc",3,0); @540
// &Force("bus", "l2cif0_regs_write_miss_inc",3,0); @541
// &Force("bus", "l2cif1_regs_read_acc_inc",3,0); @542
// &Force("bus", "l2cif1_regs_read_miss_inc",3,0); @543
// &Force("bus", "l2cif1_regs_write_acc_inc",3,0); @544
// &Force("bus", "l2cif1_regs_write_miss_inc",3,0); @545

assign regs_piu0_hpcp_l2of_int[3:0] = core0_l2of_int[3:0];
assign core0_hpcp_cnt_en[3:0]       = piu0_regs_hpcp_cnt_en[3:0];
assign regs_piu1_hpcp_l2of_int[3:0] = core1_l2of_int[3:0];
assign core1_hpcp_cnt_en[3:0]       = piu1_regs_hpcp_cnt_en[3:0];

assign ciu_xx_smpen[3:0]      = smpen[3:0];

always@(posedge forever_cpuclk or negedge cpurst_b)
begin
  if (!cpurst_b)
    rvba_rst <= 1'b1;
  else
    rvba_rst <= 1'b0;
end

assign ciu_l2c_rst_req = rvba_rst;

assign ciu_apbif_had_pctrace_inv = rvba_rst;

//==========================================================
//                 Gated Clk EN
//==========================================================
assign chr2_clk_en = hint2_wen;
// &Instance("gated_clk_cell", "x_chr2_gated_clk"); @583
gated_clk_cell  x_chr2_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (chr2_clk          ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (chr2_clk_en       ),
  .module_en          (ciu_icg_en        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @584
//          .external_en (1'b0), @585
//          .global_en   (1'b1), @586
//          .module_en   (ciu_icg_en), @587
//          .local_en    (chr2_clk_en), @588
//          .clk_out     (chr2_clk)); @589

assign ccr2_clk_en = ccr2_wen;
// &Instance("gated_clk_cell", "x_ccr2_gated_clk"); @592
gated_clk_cell  x_ccr2_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (ccr2_clk          ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (ccr2_clk_en       ),
  .module_en          (ciu_icg_en        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @593
//          .external_en (1'b0), @594
//          .global_en   (1'b1), @595
//          .module_en   (ciu_icg_en), @596
//          .local_en    (ccr2_clk_en), @597
//          .clk_out     (ccr2_clk)); @598

// &Instance("gated_clk_cell", "x_cer2_gated_clk"); @603
// &Connect(.clk_in      (forever_cpuclk), @604
//          .external_en (1'b0), @605
//          .global_en   (1'b1), @606
//          .module_en   (ciu_icg_en), @607
//          .local_en    (cer2_clk_en), @608
//          .clk_out     (cer2_clk)); @609
// &Instance("gated_clk_cell", "x_eir2_gated_clk"); @614
// &Connect(.clk_in      (forever_cpuclk), @615
//          .external_en (1'b0), @616
//          .global_en   (1'b1), @617
//          .module_en   (ciu_icg_en), @618
//          .local_en    (eir2_clk_en), @619
//          .clk_out     (eir2_clk)); @620

assign ctrl_clk_en = regs_req_vld | !regs_cur_idle;
// &Instance("gated_clk_cell", "x_ctrl_gated_clk"); @625
gated_clk_cell  x_ctrl_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (ctrl_clk          ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (ctrl_clk_en       ),
  .module_en          (ciu_icg_en        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @626
//          .external_en (1'b0), @627
//          .global_en   (1'b1), @628
//          .module_en   (ciu_icg_en), @629
//          .local_en    (ctrl_clk_en), @630
//          .clk_out     (ctrl_clk)); @631

assign rdata_clk_en = regs_req_vld & regs_cur_idle;
// &Instance("gated_clk_cell", "x_rdata_gated_clk"); @634
gated_clk_cell  x_rdata_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (rdata_clk         ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (rdata_clk_en      ),
  .module_en          (ciu_icg_en        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @635
//          .external_en (1'b0), @636
//          .global_en   (1'b1), @637
//          .module_en   (ciu_icg_en), @638
//          .local_en    (rdata_clk_en), @639
//          .clk_out     (rdata_clk)); @640

// &ModuleEnd; @642
endmodule


