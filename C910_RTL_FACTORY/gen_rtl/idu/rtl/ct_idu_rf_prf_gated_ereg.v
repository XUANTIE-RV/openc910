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
module ct_idu_rf_prf_gated_ereg(
  cp0_idu_icg_en,
  cp0_yy_clk_en,
  cpurst_b,
  ereg_top_clk,
  pad_yy_icg_scan_en,
  vfpu_idu_ex5_pipe6_wb_ereg_data,
  vfpu_idu_ex5_pipe7_wb_ereg_data,
  x_acc_reg_dout,
  x_retired_released_wb,
  x_wb_vld
);

// &Ports; @28
input          cp0_idu_icg_en;                 
input          cp0_yy_clk_en;                  
input          cpurst_b;                       
input          ereg_top_clk;                   
input          pad_yy_icg_scan_en;             
input   [5:0]  vfpu_idu_ex5_pipe6_wb_ereg_data; 
input   [5:0]  vfpu_idu_ex5_pipe7_wb_ereg_data; 
input          x_retired_released_wb;          
input   [1:0]  x_wb_vld;                       
output  [5:0]  x_acc_reg_dout;                 

// &Regs; @29
reg     [5:0]  reg_dout;                       

// &Wires; @30
wire           cp0_idu_icg_en;                 
wire           cp0_yy_clk_en;                  
wire           cpurst_b;                       
wire           ereg_clk;                       
wire           ereg_clk_en;                    
wire           ereg_top_clk;                   
wire           pad_yy_icg_scan_en;             
wire    [5:0]  vfpu_idu_ex5_pipe6_wb_ereg_data; 
wire    [5:0]  vfpu_idu_ex5_pipe7_wb_ereg_data; 
wire    [5:0]  write_data;                     
wire           write_en;                       
wire    [5:0]  x_acc_reg_dout;                 
wire           x_retired_released_wb;          
wire    [1:0]  x_wb_vld;                       



//==========================================================
//                 Instance of Gated Cell  
//==========================================================
assign ereg_clk_en = write_en;
// &Instance("gated_clk_cell", "x_ereg_gated_clk"); @37
gated_clk_cell  x_ereg_gated_clk (
  .clk_in             (ereg_top_clk      ),
  .clk_out            (ereg_clk          ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (ereg_clk_en       ),
  .module_en          (cp0_idu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (ereg_top_clk), @38
//          .external_en (1'b0), @39
//          .global_en   (cp0_yy_clk_en), @40
//          .module_en   (cp0_idu_icg_en), @41
//          .local_en    (ereg_clk_en), @42
//          .clk_out     (ereg_clk)); @43

//==========================================================
//                     Write Port
//==========================================================
assign write_en = |x_wb_vld[1:0];
assign write_data[5:0] =
    {6{x_wb_vld[0]}} & vfpu_idu_ex5_pipe6_wb_ereg_data[5:0]
  | {6{x_wb_vld[1]}} & vfpu_idu_ex5_pipe7_wb_ereg_data[5:0];

//==========================================================
//                     Freg Register
//==========================================================
always @(posedge ereg_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    reg_dout[5:0] <= 6'b0;
  else if(write_en)
    reg_dout[5:0] <= write_data[5:0];
  else
    reg_dout[5:0] <= reg_dout[5:0];
end

//assign x_reg_dout[5:0] = reg_dout[5:0];

//==========================================================
//             Accumulate Register Update Value
//==========================================================
assign x_acc_reg_dout[5:0] = {6{x_retired_released_wb}} & reg_dout[5:0];

// &ModuleEnd; @73
endmodule


