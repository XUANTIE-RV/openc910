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
module ct_lsu_sd_ex1(
  cp0_lsu_icg_en,
  cp0_yy_clk_en,
  cpurst_b,
  ctrl_st_clk,
  forever_cpuclk,
  idu_lsu_rf_pipe5_gateclk_sel,
  idu_lsu_rf_pipe5_sdiq_entry,
  idu_lsu_rf_pipe5_sel,
  idu_lsu_rf_pipe5_src0,
  idu_lsu_rf_pipe5_srcv0_fr,
  idu_lsu_rf_pipe5_srcv0_fr_vld,
  idu_lsu_rf_pipe5_srcv0_vld,
  idu_lsu_rf_pipe5_srcv0_vr0,
  idu_lsu_rf_pipe5_srcv0_vr1,
  idu_lsu_rf_pipe5_stdata1_vld,
  idu_lsu_rf_pipe5_unalign,
  lsu_idu_ex1_sdiq_entry,
  lsu_idu_ex1_sdiq_frz_clr,
  lsu_idu_ex1_sdiq_pop_vld,
  pad_yy_icg_scan_en,
  rtu_yy_xx_flush,
  sd_ex1_data,
  sd_ex1_data_bypass,
  sd_ex1_inst_vld,
  sd_rf_ex1_sdid,
  sd_rf_inst_vld_short
);

// &Ports; @26
input            cp0_lsu_icg_en;               
input            cp0_yy_clk_en;                
input            cpurst_b;                     
input            ctrl_st_clk;                  
input            forever_cpuclk;               
input            idu_lsu_rf_pipe5_gateclk_sel; 
input   [11 :0]  idu_lsu_rf_pipe5_sdiq_entry;  
input            idu_lsu_rf_pipe5_sel;         
input   [63 :0]  idu_lsu_rf_pipe5_src0;        
input   [63 :0]  idu_lsu_rf_pipe5_srcv0_fr;    
input            idu_lsu_rf_pipe5_srcv0_fr_vld; 
input            idu_lsu_rf_pipe5_srcv0_vld;   
input   [63 :0]  idu_lsu_rf_pipe5_srcv0_vr0;   
input   [63 :0]  idu_lsu_rf_pipe5_srcv0_vr1;   
input            idu_lsu_rf_pipe5_stdata1_vld; 
input            idu_lsu_rf_pipe5_unalign;     
input            pad_yy_icg_scan_en;           
input            rtu_yy_xx_flush;              
output  [11 :0]  lsu_idu_ex1_sdiq_entry;       
output           lsu_idu_ex1_sdiq_frz_clr;     
output           lsu_idu_ex1_sdiq_pop_vld;     
output  [63 :0]  sd_ex1_data;                  
output  [127:0]  sd_ex1_data_bypass;           
output           sd_ex1_inst_vld;              
output  [3  :0]  sd_rf_ex1_sdid;               
output           sd_rf_inst_vld_short;         

// &Regs; @27
reg              sd_ex1_boundary;              
reg              sd_ex1_inst_vld;              
reg     [11 :0]  sd_ex1_sdid_oh;               
reg              sd_ex1_secd;                  
reg     [63 :0]  sd_ex1_src0_data;             
reg     [63 :0]  sd_ex1_srcv0_fr_data;         
reg              sd_ex1_srcv0_fr_vld;          
reg              sd_ex1_srcv0_vld;             
reg     [63 :0]  sd_ex1_srcv0_vr0_data;        
reg     [63 :0]  sd_ex1_srcv0_vr1_data;        

// &Wires; @28
wire             cp0_lsu_icg_en;               
wire             cp0_yy_clk_en;                
wire             cpurst_b;                     
wire             ctrl_st_clk;                  
wire             forever_cpuclk;               
wire             idu_lsu_rf_pipe5_gateclk_sel; 
wire    [11 :0]  idu_lsu_rf_pipe5_sdiq_entry;  
wire             idu_lsu_rf_pipe5_sel;         
wire    [63 :0]  idu_lsu_rf_pipe5_src0;        
wire    [63 :0]  idu_lsu_rf_pipe5_srcv0_fr;    
wire             idu_lsu_rf_pipe5_srcv0_fr_vld; 
wire             idu_lsu_rf_pipe5_srcv0_vld;   
wire    [63 :0]  idu_lsu_rf_pipe5_srcv0_vr0;   
wire    [63 :0]  idu_lsu_rf_pipe5_srcv0_vr1;   
wire             idu_lsu_rf_pipe5_stdata1_vld; 
wire             idu_lsu_rf_pipe5_unalign;     
wire    [11 :0]  lsu_idu_ex1_sdiq_entry;       
wire             lsu_idu_ex1_sdiq_frz_clr;     
wire             lsu_idu_ex1_sdiq_pop_vld;     
wire             pad_yy_icg_scan_en;           
wire             rtu_yy_xx_flush;              
wire             sd_ex1_clk;                   
wire             sd_ex1_clk_en;                
wire    [63 :0]  sd_ex1_data;                  
wire    [63 :0]  sd_ex1_data_64;               
wire    [127:0]  sd_ex1_data_bypass;           
wire             sd_ex1_data_clk;              
wire             sd_ex1_data_clk_en;           
wire             sd_ex1_vdata_clk;             
wire             sd_ex1_vdata_clk_en;          
wire             sd_rf_ex1_inst_vld;           
wire    [3  :0]  sd_rf_ex1_sdid;               
wire             sd_rf_inst_vld_short;         


parameter LSIQ_ENTRY  = 12;

//==========================================================
//                 Instance of Gated Cell  
//==========================================================
assign sd_ex1_clk_en = idu_lsu_rf_pipe5_gateclk_sel;
// &Instance("gated_clk_cell", "x_lsu_sd_ex1_gated_clk"); @36
gated_clk_cell  x_lsu_sd_ex1_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (sd_ex1_clk        ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (sd_ex1_clk_en     ),
  .module_en          (cp0_lsu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in        (forever_cpuclk     ), @37
//          .external_en   (1'b0               ), @38
//          .global_en     (cp0_yy_clk_en      ), @39
//          .module_en     (cp0_lsu_icg_en     ), @40
//          .local_en      (sd_ex1_clk_en      ), @41
//          .clk_out       (sd_ex1_clk         )); @42

assign sd_ex1_data_clk_en = idu_lsu_rf_pipe5_gateclk_sel 
                            && !idu_lsu_rf_pipe5_srcv0_vld;
// &Instance("gated_clk_cell", "x_lsu_sd_ex1_data_gated_clk"); @46
gated_clk_cell  x_lsu_sd_ex1_data_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (sd_ex1_data_clk   ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (sd_ex1_data_clk_en),
  .module_en          (cp0_lsu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in        (forever_cpuclk     ), @47
//          .external_en   (1'b0               ), @48
//          .global_en     (cp0_yy_clk_en      ), @49
//          .module_en     (cp0_lsu_icg_en     ), @50
//          .local_en      (sd_ex1_data_clk_en      ), @51
//          .clk_out       (sd_ex1_data_clk         )); @52

assign sd_ex1_vdata_clk_en = idu_lsu_rf_pipe5_gateclk_sel
                             && idu_lsu_rf_pipe5_srcv0_vld;
// &Instance("gated_clk_cell", "x_lsu_sd_ex1_vdata_gated_clk"); @56
gated_clk_cell  x_lsu_sd_ex1_vdata_gated_clk (
  .clk_in              (forever_cpuclk     ),
  .clk_out             (sd_ex1_vdata_clk   ),
  .external_en         (1'b0               ),
  .global_en           (cp0_yy_clk_en      ),
  .local_en            (sd_ex1_vdata_clk_en),
  .module_en           (cp0_lsu_icg_en     ),
  .pad_yy_icg_scan_en  (pad_yy_icg_scan_en )
);

// &Connect(.clk_in        (forever_cpuclk     ), @57
//          .external_en   (1'b0               ), @58
//          .global_en     (cp0_yy_clk_en      ), @59
//          .module_en     (cp0_lsu_icg_en     ), @60
//          .local_en      (sd_ex1_vdata_clk_en      ), @61
//          .clk_out       (sd_ex1_vdata_clk         )); @62
//==========================================================
//                      encode sdid
//==========================================================
assign sd_rf_ex1_sdid[3:0]  = {4{idu_lsu_rf_pipe5_sdiq_entry[0]}} & 4'd0
                              | {4{idu_lsu_rf_pipe5_sdiq_entry[1]}} & 4'd1
                              | {4{idu_lsu_rf_pipe5_sdiq_entry[2]}} & 4'd2
                              | {4{idu_lsu_rf_pipe5_sdiq_entry[3]}} & 4'd3
                              | {4{idu_lsu_rf_pipe5_sdiq_entry[4]}} & 4'd4
                              | {4{idu_lsu_rf_pipe5_sdiq_entry[5]}} & 4'd5
                              | {4{idu_lsu_rf_pipe5_sdiq_entry[6]}} & 4'd6
                              | {4{idu_lsu_rf_pipe5_sdiq_entry[7]}} & 4'd7
                              | {4{idu_lsu_rf_pipe5_sdiq_entry[8]}} & 4'd8
                              | {4{idu_lsu_rf_pipe5_sdiq_entry[9]}} & 4'd9
                              | {4{idu_lsu_rf_pipe5_sdiq_entry[10]}} & 4'd10
                              | {4{idu_lsu_rf_pipe5_sdiq_entry[11]}} & 4'd11;


//==========================================================
//                 Pipeline Register
//==========================================================
//------------------control part----------------------------
//+----------+
//| inst_vld |
//+----------+
assign sd_rf_inst_vld_short = idu_lsu_rf_pipe5_gateclk_sel;
assign sd_rf_ex1_inst_vld = idu_lsu_rf_pipe5_sel  &&  !rtu_yy_xx_flush;
// &Force("output","sd_ex1_inst_vld"); @89
always @(posedge ctrl_st_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    sd_ex1_inst_vld  <=  1'b0;
  else
    sd_ex1_inst_vld  <=  sd_rf_ex1_inst_vld;
end

//+------+------+----------+------+
//| sdid | secd | boundary | data |
//+------+------+----------+------+
always @(posedge sd_ex1_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
  begin
    sd_ex1_sdid_oh[LSIQ_ENTRY-1:0]  <=  {LSIQ_ENTRY{1'b0}};
    sd_ex1_secd                     <=  1'b0;
    sd_ex1_boundary                 <=  1'b0;
    sd_ex1_srcv0_vld                <=  1'b0;
    sd_ex1_srcv0_fr_vld             <=  1'b0;
  end
  else if (sd_ex1_clk_en)
  begin
    sd_ex1_sdid_oh[LSIQ_ENTRY-1:0]  <=  idu_lsu_rf_pipe5_sdiq_entry[LSIQ_ENTRY-1:0];
    sd_ex1_secd                     <=  idu_lsu_rf_pipe5_stdata1_vld;
    sd_ex1_boundary                 <=  idu_lsu_rf_pipe5_unalign;
    sd_ex1_srcv0_vld                <=  idu_lsu_rf_pipe5_srcv0_vld;
    sd_ex1_srcv0_fr_vld             <=  idu_lsu_rf_pipe5_srcv0_fr_vld;
  end
end

always @(posedge sd_ex1_data_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
  sd_ex1_src0_data[63:0]            <=  64'b0;
  else if (sd_ex1_data_clk_en)
  sd_ex1_src0_data[63:0]            <=  idu_lsu_rf_pipe5_src0[63:0];
end

always @(posedge sd_ex1_vdata_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
  begin
    sd_ex1_srcv0_vr1_data[63:0]     <=  64'b0;
    sd_ex1_srcv0_vr0_data[63:0]     <=  64'b0;
    sd_ex1_srcv0_fr_data[63:0]      <=  64'b0;
  end
  else if (sd_ex1_vdata_clk_en)
  begin
    sd_ex1_srcv0_vr1_data[63:0]     <=  idu_lsu_rf_pipe5_srcv0_vr1[63:0];
    sd_ex1_srcv0_vr0_data[63:0]     <=  idu_lsu_rf_pipe5_srcv0_vr0[63:0];
    sd_ex1_srcv0_fr_data[63:0]      <=  idu_lsu_rf_pipe5_srcv0_fr[63:0];
  end
end
//==========================================================
//        data select
//==========================================================
assign sd_ex1_data_64[63:0]  = sd_ex1_srcv0_vld  
                               ? (sd_ex1_srcv0_fr_vld
                                  ? sd_ex1_srcv0_fr_data[63:0]
                                  : sd_ex1_srcv0_vr0_data[63:0])
                               : sd_ex1_src0_data[63:0];

//sd_ex1_data used for sq data rot,sd_ex1_data_bypass used for ld_da data bypass 
// &Force("nonport","sd_ex1_srcv0_vr1_data"); @158
assign sd_ex1_data[63:0]         = sd_ex1_data_64[63:0];
assign sd_ex1_data_bypass[127:0] = {64'b0,sd_ex1_data_64[63:0]};
//==========================================================
//        Generage interface to idu
//==========================================================
assign lsu_idu_ex1_sdiq_pop_vld   = sd_ex1_inst_vld
                                    &&  (!sd_ex1_boundary  ||  sd_ex1_secd);
assign lsu_idu_ex1_sdiq_frz_clr   = sd_ex1_inst_vld
                                    &&  sd_ex1_boundary
                                    &&  !sd_ex1_secd;
assign lsu_idu_ex1_sdiq_entry[LSIQ_ENTRY-1:0] = sd_ex1_sdid_oh[LSIQ_ENTRY-1:0];

// &ModuleEnd; @172
endmodule


