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

// &ModuleBeg; @25
module ct_lsu_mcic(
  biu_lsu_r_data,
  biu_lsu_r_id,
  biu_lsu_r_resp,
  biu_lsu_r_vld,
  cp0_lsu_icg_en,
  cp0_yy_clk_en,
  cpurst_b,
  dcache_arb_mcic_ld_grnt,
  forever_cpuclk,
  ld_da_dcache_hit,
  ld_da_mcic_borrow_mmu_req,
  ld_da_mcic_bypass_data,
  ld_da_mcic_data_err,
  ld_da_mcic_rb_full,
  ld_da_mcic_wakeup,
  lfb_mcic_wakeup,
  lsu_had_mcic_data_req,
  lsu_had_mcic_frz,
  lsu_mmu_bus_error,
  lsu_mmu_data,
  lsu_mmu_data_vld,
  mcic_dcache_arb_ld_data_gateclk_en,
  mcic_dcache_arb_ld_data_high_idx,
  mcic_dcache_arb_ld_data_low_idx,
  mcic_dcache_arb_ld_data_req,
  mcic_dcache_arb_ld_req,
  mcic_dcache_arb_ld_tag_gateclk_en,
  mcic_dcache_arb_ld_tag_idx,
  mcic_dcache_arb_req_addr,
  mmu_lsu_data_req,
  mmu_lsu_data_req_addr,
  pad_yy_icg_scan_en,
  rb_mcic_ar_id,
  rb_mcic_biu_req_success,
  rb_mcic_ecc_err,
  rb_mcic_not_full
);

// &Ports; @26
input   [127:0]  biu_lsu_r_data;                    
input   [4  :0]  biu_lsu_r_id;                      
input   [3  :0]  biu_lsu_r_resp;                    
input            biu_lsu_r_vld;                     
input            cp0_lsu_icg_en;                    
input            cp0_yy_clk_en;                     
input            cpurst_b;                          
input            dcache_arb_mcic_ld_grnt;           
input            forever_cpuclk;                    
input            ld_da_dcache_hit;                  
input            ld_da_mcic_borrow_mmu_req;         
input   [63 :0]  ld_da_mcic_bypass_data;            
input            ld_da_mcic_data_err;               
input            ld_da_mcic_rb_full;                
input            ld_da_mcic_wakeup;                 
input            lfb_mcic_wakeup;                   
input            mmu_lsu_data_req;                  
input   [39 :0]  mmu_lsu_data_req_addr;             
input            pad_yy_icg_scan_en;                
input   [4  :0]  rb_mcic_ar_id;                     
input            rb_mcic_biu_req_success;           
input            rb_mcic_ecc_err;                   
input            rb_mcic_not_full;                  
output           lsu_had_mcic_data_req;             
output           lsu_had_mcic_frz;                  
output           lsu_mmu_bus_error;                 
output  [63 :0]  lsu_mmu_data;                      
output           lsu_mmu_data_vld;                  
output  [7  :0]  mcic_dcache_arb_ld_data_gateclk_en; 
output  [10 :0]  mcic_dcache_arb_ld_data_high_idx;  
output  [10 :0]  mcic_dcache_arb_ld_data_low_idx;   
output  [7  :0]  mcic_dcache_arb_ld_data_req;       
output           mcic_dcache_arb_ld_req;            
output           mcic_dcache_arb_ld_tag_gateclk_en; 
output  [8  :0]  mcic_dcache_arb_ld_tag_idx;        
output  [39 :0]  mcic_dcache_arb_req_addr;          

// &Regs; @27
reg     [4  :0]  mcic_ar_id;                        
reg              mcic_ar_id_vld;                    
reg              mcic_frz;                          
reg              mcic_rb_full;                      

// &Wires; @28
wire    [127:0]  biu_lsu_r_data;                    
wire    [4  :0]  biu_lsu_r_id;                      
wire    [3  :0]  biu_lsu_r_resp;                    
wire             biu_lsu_r_vld;                     
wire             cp0_lsu_icg_en;                    
wire             cp0_yy_clk_en;                     
wire             cpurst_b;                          
wire             dcache_arb_mcic_ld_grnt;           
wire             forever_cpuclk;                    
wire             ld_da_dcache_hit;                  
wire             ld_da_mcic_borrow_mmu_req;         
wire    [63 :0]  ld_da_mcic_bypass_data;            
wire             ld_da_mcic_data_err;               
wire             ld_da_mcic_rb_full;                
wire             ld_da_mcic_wakeup;                 
wire             lfb_mcic_wakeup;                   
wire             lsu_had_mcic_data_req;             
wire             lsu_had_mcic_frz;                  
wire             lsu_mmu_bus_error;                 
wire    [63 :0]  lsu_mmu_data;                      
wire             lsu_mmu_data_vld;                  
wire    [63 :0]  mcic_bus_bypass_data;              
wire    [63 :0]  mcic_bus_bypass_data_ori;          
wire             mcic_clk;                          
wire             mcic_clk_en;                       
wire    [63 :0]  mcic_data;                         
wire             mcic_data_vld;                     
wire    [7  :0]  mcic_dcache_arb_ld_data_gateclk_en; 
wire    [10 :0]  mcic_dcache_arb_ld_data_high_idx;  
wire    [10 :0]  mcic_dcache_arb_ld_data_low_idx;   
wire    [7  :0]  mcic_dcache_arb_ld_data_req;       
wire             mcic_dcache_arb_ld_req;            
wire             mcic_dcache_arb_ld_tag_gateclk_en; 
wire    [8  :0]  mcic_dcache_arb_ld_tag_idx;        
wire    [39 :0]  mcic_dcache_arb_req_addr;          
wire    [3  :0]  mcic_dcache_data_req;              
wire             mcic_r_bus_error;                  
wire             mcic_r_id_hit;                     
wire             mcic_rb_full_wakeup;               
wire    [39 :0]  mcic_req_addr;                     
wire             mmu_lsu_data_req;                  
wire    [39 :0]  mmu_lsu_data_req_addr;             
wire             pad_yy_icg_scan_en;                
wire    [4  :0]  rb_mcic_ar_id;                     
wire             rb_mcic_biu_req_success;           
wire             rb_mcic_ecc_err;                   
wire             rb_mcic_not_full;                  


parameter OKAY    = 2'b00,
          EXOKAY  = 2'b01,
          SLVERR  = 2'b10,
          DECERR  = 2'b11;
parameter BYTE    = 2'b00,
          HALF    = 2'b01,
          WORD    = 2'b10;


//==========================================================
//                 Instance of Gated Cell  
//==========================================================
assign mcic_clk_en  = mmu_lsu_data_req;
// &Instance("gated_clk_cell", "x_lsu_mcic_gated_clk"); @43
gated_clk_cell  x_lsu_mcic_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (mcic_clk          ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (mcic_clk_en       ),
  .module_en          (cp0_lsu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in        (forever_cpuclk     ), @44
//          .external_en   (1'b0               ), @45
//          .global_en     (cp0_yy_clk_en      ), @46
//          .module_en     (cp0_lsu_icg_en     ), @47
//          .local_en      (mcic_clk_en        ), @48
//          .clk_out       (mcic_clk           )); @49

//==========================================================
//                 Register
//==========================================================
//+-----+
//| frz |
//+-----+
always @(posedge mcic_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    mcic_frz         <=  1'b0;
  else if(mcic_rb_full_wakeup ||  mcic_data_vld ||  lfb_mcic_wakeup ||  ld_da_mcic_wakeup)
    mcic_frz         <=  1'b0;
  else if(dcache_arb_mcic_ld_grnt)
    mcic_frz         <=  1'b1;
end

//+---------+
//| rb_full |
//+---------+
always @(posedge mcic_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    mcic_rb_full     <=  1'b0;
  else if(mcic_rb_full_wakeup)
    mcic_rb_full     <=  1'b0;
  else if(ld_da_mcic_rb_full)
    mcic_rb_full     <=  1'b1;
end

//+-----------+
//| ar_id_vld |
//+-----------+
always @(posedge mcic_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    mcic_ar_id_vld  <=  1'b0;
  else if(mcic_data_vld)
    mcic_ar_id_vld  <=  1'b0;
  else if(rb_mcic_biu_req_success)
    mcic_ar_id_vld  <=  1'b1;
end

//+-------+
//| ar_id |
//+-------+
always @(posedge mcic_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    mcic_ar_id[4:0] <=  5'b0;
  else if(rb_mcic_biu_req_success)
    mcic_ar_id[4:0] <=  rb_mcic_ar_id[4:0];
end

//==========================================================
//                 Dcache request
//==========================================================
assign mcic_req_addr[39:0]              = mmu_lsu_data_req_addr[39:0];
//-----------dcache req-------------------------------------
// &Force("output", "mcic_dcache_arb_ld_req"); @109
assign mcic_dcache_arb_ld_req           = mmu_lsu_data_req  &&  !mcic_frz;
//-----------tag array------------------
assign mcic_dcache_arb_ld_tag_gateclk_en= mcic_dcache_arb_ld_req;
assign mcic_dcache_arb_ld_tag_idx[8:0]  = mmu_lsu_data_req_addr[14:6];
//-----------data array-----------------
assign mcic_dcache_data_req[3:0]              = mcic_req_addr[3]
                                                ? 4'b1100
                                                : 4'b0011;
// &Force("output","mcic_dcache_arb_ld_data_req"); @118
assign mcic_dcache_arb_ld_data_req[7:0]       = {mcic_dcache_data_req[3:0],mcic_dcache_data_req[3:0]};
assign mcic_dcache_arb_ld_data_gateclk_en[7:0]= mcic_dcache_arb_ld_data_req[7:0]
                                                & {8{mcic_dcache_arb_ld_req}};
assign mcic_dcache_arb_ld_data_low_idx[10:0]  = mcic_req_addr[14:4];
assign mcic_dcache_arb_ld_data_high_idx[10:0] = {mcic_req_addr[14:5],~mcic_req_addr[4]};
//assign mcic_dcache_arb_ld_data_wen[31:0]      = 32'b0;
//-----------borrow signal----------------------------------
assign mcic_dcache_arb_req_addr[39:0] = mcic_req_addr[39:0];

//==========================================================
//                 Restart
//==========================================================
assign mcic_rb_full_wakeup  = mcic_rb_full  &&  rb_mcic_not_full;

//==========================================================
//                 Bypass data
//==========================================================
//----------------------get data----------------------------
//get data from bus
assign mcic_bus_bypass_data_ori[63:0] = mcic_req_addr[3]
                                        ? biu_lsu_r_data[127:64]
                                        : biu_lsu_r_data[63:0];

assign mcic_bus_bypass_data[63:0]     = rb_mcic_ecc_err
                                        ? 64'b0
                                        : mcic_bus_bypass_data_ori[63:0];
//get data unsettle
assign mcic_data[63:0]            = mcic_ar_id_vld
                                    ? mcic_bus_bypass_data[63:0]
                                    : ld_da_mcic_bypass_data[63:0];


//==========================================================
//                 judge biu r info
//==========================================================
assign mcic_data_vld      = (ld_da_mcic_borrow_mmu_req  &&  ld_da_dcache_hit)
                            ||  ld_da_mcic_data_err
                            ||  mcic_r_id_hit;
assign mcic_r_id_hit      = (mcic_ar_id[4:0] ==  biu_lsu_r_id[4:0])
                            &&  mcic_ar_id_vld
                            &&  biu_lsu_r_vld;

// &Force("bus","biu_lsu_r_resp",3,0); @161
assign mcic_r_bus_error   = biu_lsu_r_resp[1:0]  != OKAY;

//==========================================================
//                 Interface to mmu
//==========================================================
assign lsu_mmu_data_vld   = mcic_data_vld;
assign lsu_mmu_data[63:0] = mcic_data[63:0];
assign lsu_mmu_bus_error  = mcic_r_id_hit &&  mcic_r_bus_error;

//==========================================================
//              interface to other module
//==========================================================
assign lsu_had_mcic_data_req  = mmu_lsu_data_req;
assign lsu_had_mcic_frz       = mcic_frz;

// &ModuleEnd; @177
endmodule


