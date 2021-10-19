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
module ct_iu_div_entry(
  cp0_iu_div_entry_disable_clr,
  cp0_iu_icg_en,
  cp0_yy_clk_en,
  cpurst_b,
  div_clk,
  div_entry0_read_data,
  div_entry0_read_vld,
  div_entry1_read_data,
  div_entry1_read_vld,
  div_entry_write_data,
  div_entry_write_en,
  forever_cpuclk,
  pad_yy_icg_scan_en
);

// &Ports; @26
input            cp0_iu_div_entry_disable_clr; 
input            cp0_iu_icg_en;               
input            cp0_yy_clk_en;               
input            cpurst_b;                    
input            div_clk;                     
input            div_entry0_read_vld;         
input            div_entry1_read_vld;         
input   [257:0]  div_entry_write_data;        
input            div_entry_write_en;          
input            forever_cpuclk;              
input            pad_yy_icg_scan_en;          
output  [257:0]  div_entry0_read_data;        
output  [257:0]  div_entry1_read_data;        

// &Regs; @27
reg     [257:0]  div_entry0_data;             
reg              div_entry0_older;            
reg     [257:0]  div_entry1_data;             

// &Wires; @28
wire             cp0_iu_div_entry_disable_clr; 
wire             cp0_iu_icg_en;               
wire             cp0_yy_clk_en;               
wire             cpurst_b;                    
wire             div_clk;                     
wire             div_entry0_clk;              
wire             div_entry0_clk_en;           
wire    [257:0]  div_entry0_read_data;        
wire             div_entry0_read_vld;         
wire             div_entry1_clk;              
wire             div_entry1_clk_en;           
wire    [257:0]  div_entry1_read_data;        
wire             div_entry1_read_vld;         
wire    [257:0]  div_entry_write_data;        
wire             div_entry_write_en;          
wire             forever_cpuclk;              
wire             pad_yy_icg_scan_en;          



//==========================================================
//                 Instance of Gated Cell  
//==========================================================
assign div_entry0_clk_en = div_entry_write_en && div_entry0_older
                           || cp0_iu_div_entry_disable_clr;
// &Instance("gated_clk_cell", "x_div_entry0_gated_clk"); @36
gated_clk_cell  x_div_entry0_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (div_entry0_clk    ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (div_entry0_clk_en ),
  .module_en          (cp0_iu_icg_en     ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @37
//          .external_en (1'b0), @38
//          .global_en   (cp0_yy_clk_en), @39
//          .module_en   (cp0_iu_icg_en), @40
//          .local_en    (div_entry0_clk_en), @41
//          .clk_out     (div_entry0_clk)); @42

assign div_entry1_clk_en = div_entry_write_en && !div_entry0_older
                           || cp0_iu_div_entry_disable_clr;
// &Instance("gated_clk_cell", "x_div_entry1_gated_clk"); @46
gated_clk_cell  x_div_entry1_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (div_entry1_clk    ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (div_entry1_clk_en ),
  .module_en          (cp0_iu_icg_en     ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @47
//          .external_en (1'b0), @48
//          .global_en   (cp0_yy_clk_en), @49
//          .module_en   (cp0_iu_icg_en), @50
//          .local_en    (div_entry1_clk_en), @51
//          .clk_out     (div_entry1_clk)); @52

//==========================================================
//                  Write Select bit
//==========================================================
//indicate whether entry0 is older than entry1
always @(posedge div_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    div_entry0_older <= 1'b0;
  else if(cp0_iu_div_entry_disable_clr)
    div_entry0_older <= 1'b0;
  else if(div_entry0_read_vld)
    div_entry0_older <= 1'b0;
  else if(div_entry1_read_vld)
    div_entry0_older <= 1'b1;
  else if(div_entry_write_en)
    div_entry0_older <= !div_entry0_older;
  else
    div_entry0_older <= div_entry0_older;
end

//==========================================================
//                     Div Entry0
//==========================================================
always @(posedge div_entry0_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    //reset as unsign 64'bffffffffffffffff / 64'b1
    div_entry0_data[257:0] <= {1'b0, 1'b0,
                               64'b0, 64'hffffffffffffffff,
                               64'b1, 64'hffffffffffffffff};
  else if(cp0_iu_div_entry_disable_clr)
    //reset as unsign 64'bffffffffffffffff / 64'b1
    div_entry0_data[257:0] <= {1'b0, 1'b0,
                               64'b0, 64'hffffffffffffffff,
                               64'b1, 64'hffffffffffffffff};
  else if(div_entry_write_en && div_entry0_older)
    div_entry0_data[257:0] <= div_entry_write_data[257:0];
  else
    div_entry0_data[257:0] <= div_entry0_data[257:0];
end

assign div_entry0_read_data[257:0] = div_entry0_data[257:0];

//==========================================================
//                     Div Entry1
//==========================================================
always @(posedge div_entry1_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    //reset as sign 64'b7fffffffffffffff / 64'b1
    div_entry1_data[257:0] <= {1'b0, 1'b1,
                               64'b0, 64'h7fffffffffffffff,
                               64'b1, 64'h7fffffffffffffff};
  else if(cp0_iu_div_entry_disable_clr)
    //reset as sign 64'b7fffffffffffffff / 64'b1
    div_entry1_data[257:0] <= {1'b0, 1'b1,
                               64'b0, 64'h7fffffffffffffff,
                               64'b1, 64'h7fffffffffffffff};
  else if(div_entry_write_en && !div_entry0_older)
    div_entry1_data[257:0] <= div_entry_write_data[257:0];
  else
    div_entry1_data[257:0] <= div_entry1_data[257:0];
end

assign div_entry1_read_data[257:0] = div_entry1_data[257:0];


// &ModuleEnd; @121
endmodule


