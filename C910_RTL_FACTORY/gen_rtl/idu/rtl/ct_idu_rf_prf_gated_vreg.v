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
module ct_idu_rf_prf_gated_vreg(
  cp0_idu_icg_en,
  cp0_yy_clk_en,
  lsu_idu_wb_pipe3_wb_vreg_data,
  pad_yy_icg_scan_en,
  vfpu_idu_ex5_pipe6_wb_vreg_data,
  vfpu_idu_ex5_pipe7_wb_vreg_data,
  vreg_top_clk,
  x_reg_dout,
  x_wb_vld
);

// &Ports; @28
input           cp0_idu_icg_en;                 
input           cp0_yy_clk_en;                  
input   [63:0]  lsu_idu_wb_pipe3_wb_vreg_data;  
input           pad_yy_icg_scan_en;             
input   [63:0]  vfpu_idu_ex5_pipe6_wb_vreg_data; 
input   [63:0]  vfpu_idu_ex5_pipe7_wb_vreg_data; 
input           vreg_top_clk;                   
input   [2 :0]  x_wb_vld;                       
output  [63:0]  x_reg_dout;                     

// &Regs; @29
reg     [63:0]  reg_dout;                       
reg     [63:0]  write_data;                     

// &Wires; @30
wire            cp0_idu_icg_en;                 
wire            cp0_yy_clk_en;                  
wire    [63:0]  lsu_idu_wb_pipe3_wb_vreg_data;  
wire            pad_yy_icg_scan_en;             
wire    [63:0]  vfpu_idu_ex5_pipe6_wb_vreg_data; 
wire    [63:0]  vfpu_idu_ex5_pipe7_wb_vreg_data; 
wire            vreg_clk;                       
wire            vreg_clk_en;                    
wire            vreg_top_clk;                   
wire            write_en;                       
wire    [63:0]  x_reg_dout;                     
wire    [2 :0]  x_wb_vld;                       



//parameter VEC_MSB = `VEC_WIDTH;
parameter VEC_MSB = 63;

//==========================================================
//                 Instance of Gated Cell  
//==========================================================
assign vreg_clk_en = write_en;
// &Instance("gated_clk_cell", "x_vreg_gated_clk"); @40
gated_clk_cell  x_vreg_gated_clk (
  .clk_in             (vreg_top_clk      ),
  .clk_out            (vreg_clk          ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (vreg_clk_en       ),
  .module_en          (cp0_idu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (vreg_top_clk), @41
//          .external_en (1'b0), @42
//          .global_en   (cp0_yy_clk_en), @43
//          .module_en   (cp0_idu_icg_en), @44
//          .local_en    (vreg_clk_en), @45
//          .clk_out     (vreg_clk)); @46

//==========================================================
//                     Write Port
//==========================================================
assign write_en = |x_wb_vld[2:0];
// &CombBeg; @52
always @( lsu_idu_wb_pipe3_wb_vreg_data[63:0]
       or vfpu_idu_ex5_pipe7_wb_vreg_data[63:0]
       or x_wb_vld[2:0]
       or vfpu_idu_ex5_pipe6_wb_vreg_data[63:0])
begin
  case (x_wb_vld[2:0])
    3'b001 : write_data[VEC_MSB:0] = vfpu_idu_ex5_pipe6_wb_vreg_data[VEC_MSB:0];
    3'b010 : write_data[VEC_MSB:0] = vfpu_idu_ex5_pipe7_wb_vreg_data[VEC_MSB:0];
    3'b100 : write_data[VEC_MSB:0] = lsu_idu_wb_pipe3_wb_vreg_data[VEC_MSB:0];
    default: write_data[VEC_MSB:0] = {VEC_MSB+1{1'bx}};
  endcase
// &CombEnd; @59
end

//==========================================================
//                     Vreg Register
//==========================================================
always @(posedge vreg_clk)
begin
  if(write_en)
    reg_dout[VEC_MSB:0] <= write_data[VEC_MSB:0];
  else
    reg_dout[VEC_MSB:0] <= reg_dout[VEC_MSB:0];
end

assign x_reg_dout[VEC_MSB:0] = reg_dout[VEC_MSB:0];

// &ModuleEnd; @74
endmodule


