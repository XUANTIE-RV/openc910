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

// &ModuleBeg; @22
module ct_ifu_sfp_entry(
  cp0_ifu_icg_en,
  cp0_ifu_nsfe,
  cp0_yy_clk_en,
  cpurst_b,
  entry_bar_pc_updt_bit,
  entry_bar_pc_v,
  entry_clk_en_x,
  entry_cnt_updt_bit,
  entry_cnt_v,
  entry_hi_pc_v,
  entry_sf_pc_updt_bit,
  entry_sf_pc_v,
  entry_type_x,
  entry_write_data,
  entry_write_en_x,
  forever_cpuclk,
  pad_yy_icg_scan_en,
  rtu_ifu_chgflw_vld,
  sfp_vl_pred_en
);

// &Ports; @23
input           cp0_ifu_icg_en;       
input           cp0_ifu_nsfe;         
input           cp0_yy_clk_en;        
input           cpurst_b;             
input           entry_bar_pc_updt_bit; 
input           entry_clk_en_x;       
input           entry_cnt_updt_bit;   
input           entry_sf_pc_updt_bit; 
input   [24:0]  entry_write_data;     
input           entry_write_en_x;     
input           forever_cpuclk;       
input           pad_yy_icg_scan_en;   
input           rtu_ifu_chgflw_vld;   
input           sfp_vl_pred_en;       
output  [11:0]  entry_bar_pc_v;       
output  [1 :0]  entry_cnt_v;          
output  [7 :0]  entry_hi_pc_v;        
output  [11:0]  entry_sf_pc_v;        
output          entry_type_x;         

// &Regs; @24
reg     [11:0]  entry_bar_pc_v;       
reg     [1 :0]  entry_cnt_pre;        
reg     [1 :0]  entry_cnt_v;          
reg     [7 :0]  entry_hi_pc_v;        
reg             entry_miss_state;     
reg     [11:0]  entry_sf_pc_v;        
reg             entry_type_x;         

// &Wires; @25
wire    [1 :0]  cnt_add;              
wire    [1 :0]  cnt_sub;              
wire            cp0_ifu_icg_en;       
wire            cp0_ifu_nsfe;         
wire            cp0_yy_clk_en;        
wire            cpurst_b;             
wire            entry_bar_pc_updt_bit; 
wire            entry_bar_pc_updt_en; 
wire            entry_clk_en_x;       
wire            entry_cnt_updt_bit;   
wire            entry_cnt_updt_en;    
wire            entry_sf_pc_updt_bit; 
wire            entry_sf_pc_updt_en;  
wire    [24:0]  entry_write_data;     
wire            entry_write_en_x;     
wire            forever_cpuclk;       
wire            pad_yy_icg_scan_en;   
wire            rtu_ifu_chgflw_vld;   
wire            sfp_entry_clk;        
wire            sfp_entry_clk_en;     
wire            sfp_vl_pred_en;       


//==========================================================
//                  Entry Valid Signal
//==========================================================
//----------------------Gate Clock--------------------------
// &Instance("gated_clk_cell","x_sfp_entry_clk"); @31
gated_clk_cell  x_sfp_entry_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (sfp_entry_clk     ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (sfp_entry_clk_en  ),
  .module_en          (cp0_ifu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect( .clk_in         (forever_cpuclk), @32
//           .clk_out        (sfp_entry_clk),//Out Clock @33
//           .external_en    (1'b0), @34
//           .global_en      (cp0_yy_clk_en), @35
//           .local_en       (sfp_entry_clk_en),//Local Condition @36
//           .module_en      (cp0_ifu_icg_en) @37
//         ); @38

assign sfp_entry_clk_en = entry_clk_en_x
                       && (cp0_ifu_nsfe || sfp_vl_pred_en);


assign entry_sf_pc_updt_en = entry_sf_pc_updt_bit 
                          && entry_write_en_x
                          && (cp0_ifu_nsfe || sfp_vl_pred_en);

always @(posedge sfp_entry_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
  begin 
    entry_hi_pc_v[7:0]  <= 8'b0;
    entry_sf_pc_v[11:0] <= 12'b0;
    entry_type_x        <= 1'b0;
  end
  else if(entry_sf_pc_updt_en)
  begin
    entry_hi_pc_v[7:0]  <= entry_write_data[23:16];
    entry_sf_pc_v[11:0] <= entry_write_data[15:4];
    entry_type_x        <= entry_write_data[24];
  end
  else
  begin
    entry_hi_pc_v[7:0]  <= entry_hi_pc_v[7:0];
    entry_sf_pc_v[11:0] <= entry_sf_pc_v[11:0];
    entry_type_x        <= entry_type_x;
  end
end

always @ (posedge sfp_entry_clk or negedge cpurst_b)
begin
  if (~cpurst_b)
    entry_miss_state <= 1'b0;
  else if (entry_sf_pc_updt_en)
  begin
    if(entry_write_data[24] && entry_write_data[1])
      entry_miss_state <= 1'b1;
    else
      entry_miss_state <= 1'b0;
  end
  else
    entry_miss_state <= entry_miss_state;
end


assign entry_bar_pc_updt_en = entry_bar_pc_updt_bit 
                           && entry_write_en_x
                           && (cp0_ifu_nsfe || sfp_vl_pred_en);

always @(posedge sfp_entry_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    entry_bar_pc_v[11:0] <= 12'b0;
  else if(entry_bar_pc_updt_en)
    entry_bar_pc_v[11:0] <= entry_write_data[15:4];
  else
    entry_bar_pc_v[11:0] <= entry_bar_pc_v[11:0];
end

// &CombBeg; @100
always @( entry_write_data[3:0]
       or cnt_sub[1:0]
       or entry_cnt_v[1:0]
       or entry_write_data[24]
       or cnt_add[1:0]
       or entry_miss_state
       or rtu_ifu_chgflw_vld)
begin
case(entry_write_data[3:0])
  4'b1000: entry_cnt_pre[1:0] = 2'b00;
  4'b0100: entry_cnt_pre[1:0] = (entry_write_data[24] && entry_cnt_v[1:0] == 2'b01)
                                ? 2'b00
                                : cnt_add[1:0];
  4'b0010: entry_cnt_pre[1:0] = 2'b01;
  4'b0001: entry_cnt_pre[1:0] = (entry_miss_state && rtu_ifu_chgflw_vld)
                                ? cnt_add[1:0]
                                : cnt_sub[1:0];
  default: entry_cnt_pre[1:0] = 2'b0;
endcase
// &CombEnd; @112
end

assign cnt_add[1:0] = (entry_cnt_v[1:0] == 2'b11)
                    ?  2'b11
                    :  entry_cnt_v[1:0] + 2'b01;

assign cnt_sub[1:0] = (entry_cnt_v[1:0] == 2'b00)
                    ?  2'b00
                    :  entry_cnt_v[1:0] - 2'b01;

assign entry_cnt_updt_en = entry_cnt_updt_bit 
                        && entry_write_en_x
                        && (cp0_ifu_nsfe || sfp_vl_pred_en);

always @(posedge sfp_entry_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    entry_cnt_v[1:0] <= 2'b0;
  else if(entry_cnt_updt_en)
    entry_cnt_v[1:0] <= entry_cnt_pre[1:0];
  else
    entry_cnt_v[1:0] <= entry_cnt_v[1:0];
end

// &Force("output","entry_hi_pc_v"); @136
// &Force("output","entry_sf_pc_v"); @137
// &Force("output","entry_bar_pc_v"); @138
// &Force("output","entry_cnt_v"); @139
// &Force("output", "entry_type_x"); @140

// &ModuleEnd; @142
endmodule



