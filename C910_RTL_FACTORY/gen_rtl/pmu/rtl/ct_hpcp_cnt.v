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
module ct_hpcp_cnt(
  cnt_adder,
  cnt_clk_en,
  cnt_en,
  cnt_of,
  cnt_value,
  cnt_wen,
  cp0_hpcp_icg_en,
  cpurst_b,
  forever_cpuclk,
  hpcp_cnt_en,
  hpcp_wdata,
  pad_yy_icg_scan_en
);

// &Ports; @23
input   [3 :0]  cnt_adder;         
input           cnt_clk_en;        
input           cnt_en;            
input           cnt_wen;           
input           cp0_hpcp_icg_en;   
input           cpurst_b;          
input           forever_cpuclk;    
input           hpcp_cnt_en;       
input   [63:0]  hpcp_wdata;        
input           pad_yy_icg_scan_en; 
output          cnt_of;            
output  [63:0]  cnt_value;         

// &Regs; @24
reg     [3 :0]  cnt_adder_ff;      
reg             cnt_en_ff;         
reg             cnt_overflow;      
reg     [63:0]  counter;           

// &Wires @25
wire            clk_en;            
wire    [3 :0]  cnt_adder;         
wire            cnt_clk;           
wire            cnt_clk_en;        
wire            cnt_en;            
wire            cnt_of;            
wire    [63:0]  cnt_value;         
wire            cnt_wen;           
wire    [64:0]  counter_adder;     
wire            cp0_hpcp_icg_en;   
wire            cpurst_b;          
wire            forever_cpuclk;    
wire            hpcp_cnt_en;       
wire    [63:0]  hpcp_wdata;        
wire            pad_yy_icg_scan_en; 


//==========================================================
//                 Instance of Gated Cell  
//========================================================== 
// &Instance("gated_clk_cell", "x_gated_clk"); @30
gated_clk_cell  x_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (cnt_clk           ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (clk_en            ),
  .module_en          (cp0_hpcp_icg_en   ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk ), @31
//          .external_en (1'b0           ), @32
//          .global_en   (1'b1           ), @33
//          .module_en   (cp0_hpcp_icg_en), @34
//          .local_en    (clk_en     ), @35
//          .clk_out     (cnt_clk        )); @36

assign clk_en = cnt_clk_en || cnt_en_ff;


always @(posedge cnt_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
  begin
    cnt_en_ff         <= 1'b0;
    cnt_adder_ff[3:0] <= 4'b0;
  end
  else if(cnt_en)                     
  begin
    cnt_en_ff         <= cnt_en;
    cnt_adder_ff[3:0] <= cnt_adder[3:0];
  end
  else
  begin
    cnt_en_ff         <= 1'b0;
    cnt_adder_ff[3:0] <= cnt_adder_ff[3:0];
  end
end
       
//==========================================================
//                 Implementation of counter  
//==========================================================
always @(posedge cnt_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    counter[63:0] <= 64'b0;
  else if(cnt_wen)
    counter[63:0] <= hpcp_wdata[63:0];
  else if(cnt_en_ff && hpcp_cnt_en && (|cnt_adder_ff[3:0]))                
    counter[63:0] <= counter_adder[63:0];
  else
    counter[63:0] <= counter[63:0];
end

always @(posedge cnt_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    cnt_overflow <= 1'b0;
  else if(cnt_overflow)
    cnt_overflow <= 1'b0;
  else if(cnt_en_ff && hpcp_cnt_en && (|cnt_adder_ff[3:0]))                
    cnt_overflow <= counter_adder[64];
  else
    cnt_overflow <= cnt_overflow;
end

assign counter_adder[64:0] = {1'b0,counter[63:0]} + {61'b0,cnt_adder_ff[3:0]};

//output
assign cnt_value[63:0] = counter[63:0];
assign cnt_of          = cnt_overflow;

// &Force("input","cnt_dis"); @97
// &Force("input","cp0_yy_priv_mode"); @98
// &Force("nonport","counter_ff"); @99
// &ModuleEnd; @137
endmodule


