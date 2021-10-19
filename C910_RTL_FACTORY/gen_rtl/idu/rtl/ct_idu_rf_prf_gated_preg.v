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

// &ModuleBeg; @27
module ct_idu_rf_prf_gated_preg(
  cp0_idu_icg_en,
  cp0_yy_clk_en,
  forever_cpuclk,
  iu_idu_ex2_pipe0_wb_preg_data,
  iu_idu_ex2_pipe1_wb_preg_data,
  lsu_idu_wb_pipe3_wb_preg_data,
  pad_yy_icg_scan_en,
  x_reg_dout,
  x_wb_vld
);

// &Ports; @28
input           cp0_idu_icg_en;               
input           cp0_yy_clk_en;                
input           forever_cpuclk;               
input   [63:0]  iu_idu_ex2_pipe0_wb_preg_data; 
input   [63:0]  iu_idu_ex2_pipe1_wb_preg_data; 
input   [63:0]  lsu_idu_wb_pipe3_wb_preg_data; 
input           pad_yy_icg_scan_en;           
input   [2 :0]  x_wb_vld;                     
output  [63:0]  x_reg_dout;                   

// &Regs; @29
reg     [63:0]  reg_dout;                     
reg     [63:0]  write_data;                   

// &Wires; @30
wire            cp0_idu_icg_en;               
wire            cp0_yy_clk_en;                
wire            forever_cpuclk;               
wire    [63:0]  iu_idu_ex2_pipe0_wb_preg_data; 
wire    [63:0]  iu_idu_ex2_pipe1_wb_preg_data; 
wire    [63:0]  lsu_idu_wb_pipe3_wb_preg_data; 
wire            pad_yy_icg_scan_en;           
wire            preg_clk;                     
wire            preg_clk_en;                  
wire            write_en;                     
wire    [63:0]  x_reg_dout;                   
wire    [2 :0]  x_wb_vld;                     



//==========================================================
//                 Instance of Gated Cell  
//==========================================================
assign preg_clk_en = write_en;
// &Instance("gated_clk_cell", "x_preg_gated_clk"); @37
gated_clk_cell  x_preg_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (preg_clk          ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (preg_clk_en       ),
  .module_en          (cp0_idu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @38
//          .external_en (1'b0), @39
//          .global_en   (cp0_yy_clk_en), @40
//          .module_en   (cp0_idu_icg_en), @41
//          .local_en    (preg_clk_en), @42
//          .clk_out     (preg_clk)); @43

//==========================================================
//                     Write Port
//==========================================================
assign write_en = |x_wb_vld[2:0];
// &CombBeg; @49
always @( iu_idu_ex2_pipe0_wb_preg_data[63:0]
       or x_wb_vld[2:0]
       or lsu_idu_wb_pipe3_wb_preg_data[63:0]
       or iu_idu_ex2_pipe1_wb_preg_data[63:0])
begin
  case (x_wb_vld[2:0])
    3'b001 : write_data[63:0] = iu_idu_ex2_pipe0_wb_preg_data[63:0];
    3'b010 : write_data[63:0] = iu_idu_ex2_pipe1_wb_preg_data[63:0];
    3'b100 : write_data[63:0] = lsu_idu_wb_pipe3_wb_preg_data[63:0];
    default: write_data[63:0] = {64{1'bx}};
  endcase
// &CombEnd; @56
end

//==========================================================
//                     Preg Register
//==========================================================
always @(posedge preg_clk)
begin
  if(write_en)
    reg_dout[63:0] <= write_data[63:0];
  else
    reg_dout[63:0] <= reg_dout[63:0];
end
assign x_reg_dout[63:0] = reg_dout[63:0];

// &ModuleEnd; @91
endmodule


