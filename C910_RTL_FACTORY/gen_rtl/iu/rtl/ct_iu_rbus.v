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
module ct_iu_rbus(
  alu_rbus_ex1_pipe0_data,
  alu_rbus_ex1_pipe0_data_vld,
  alu_rbus_ex1_pipe0_fwd_data,
  alu_rbus_ex1_pipe0_fwd_vld,
  alu_rbus_ex1_pipe0_preg,
  alu_rbus_ex1_pipe1_data,
  alu_rbus_ex1_pipe1_data_vld,
  alu_rbus_ex1_pipe1_fwd_data,
  alu_rbus_ex1_pipe1_fwd_vld,
  alu_rbus_ex1_pipe1_preg,
  cp0_iu_ex3_rslt_data,
  cp0_iu_ex3_rslt_preg,
  cp0_iu_ex3_rslt_vld,
  cp0_iu_icg_en,
  cp0_yy_clk_en,
  cpurst_b,
  div_rbus_data,
  div_rbus_pipe0_data_vld,
  div_rbus_preg,
  forever_cpuclk,
  had_idu_wbbr_data,
  had_idu_wbbr_vld,
  iu_idu_ex1_pipe0_fwd_preg,
  iu_idu_ex1_pipe0_fwd_preg_data,
  iu_idu_ex1_pipe0_fwd_preg_vld,
  iu_idu_ex1_pipe1_fwd_preg,
  iu_idu_ex1_pipe1_fwd_preg_data,
  iu_idu_ex1_pipe1_fwd_preg_vld,
  iu_idu_ex2_pipe0_wb_preg,
  iu_idu_ex2_pipe0_wb_preg_data,
  iu_idu_ex2_pipe0_wb_preg_dup0,
  iu_idu_ex2_pipe0_wb_preg_dup1,
  iu_idu_ex2_pipe0_wb_preg_dup2,
  iu_idu_ex2_pipe0_wb_preg_dup3,
  iu_idu_ex2_pipe0_wb_preg_dup4,
  iu_idu_ex2_pipe0_wb_preg_expand,
  iu_idu_ex2_pipe0_wb_preg_vld,
  iu_idu_ex2_pipe0_wb_preg_vld_dup0,
  iu_idu_ex2_pipe0_wb_preg_vld_dup1,
  iu_idu_ex2_pipe0_wb_preg_vld_dup2,
  iu_idu_ex2_pipe0_wb_preg_vld_dup3,
  iu_idu_ex2_pipe0_wb_preg_vld_dup4,
  iu_idu_ex2_pipe1_wb_preg,
  iu_idu_ex2_pipe1_wb_preg_data,
  iu_idu_ex2_pipe1_wb_preg_dup0,
  iu_idu_ex2_pipe1_wb_preg_dup1,
  iu_idu_ex2_pipe1_wb_preg_dup2,
  iu_idu_ex2_pipe1_wb_preg_dup3,
  iu_idu_ex2_pipe1_wb_preg_dup4,
  iu_idu_ex2_pipe1_wb_preg_expand,
  iu_idu_ex2_pipe1_wb_preg_vld,
  iu_idu_ex2_pipe1_wb_preg_vld_dup0,
  iu_idu_ex2_pipe1_wb_preg_vld_dup1,
  iu_idu_ex2_pipe1_wb_preg_vld_dup2,
  iu_idu_ex2_pipe1_wb_preg_vld_dup3,
  iu_idu_ex2_pipe1_wb_preg_vld_dup4,
  iu_rtu_ex2_pipe0_wb_preg_expand,
  iu_rtu_ex2_pipe0_wb_preg_vld,
  iu_rtu_ex2_pipe1_wb_preg_expand,
  iu_rtu_ex2_pipe1_wb_preg_vld,
  mult_rbus_ex3_data_vld,
  mult_rbus_ex3_preg,
  mult_rbus_ex4_data,
  mult_rbus_ex4_data_vld,
  pad_yy_icg_scan_en,
  rtu_yy_xx_flush,
  special_rbus_ex1_data,
  special_rbus_ex1_data_vld,
  special_rbus_ex1_preg,
  vfpu_iu_ex2_pipe6_mfvr_data,
  vfpu_iu_ex2_pipe6_mfvr_data_vld,
  vfpu_iu_ex2_pipe6_mfvr_preg,
  vfpu_iu_ex2_pipe7_mfvr_data,
  vfpu_iu_ex2_pipe7_mfvr_data_vld,
  vfpu_iu_ex2_pipe7_mfvr_preg
);

// &Ports; @26
input   [63:0]  alu_rbus_ex1_pipe0_data;          
input           alu_rbus_ex1_pipe0_data_vld;      
input   [63:0]  alu_rbus_ex1_pipe0_fwd_data;      
input           alu_rbus_ex1_pipe0_fwd_vld;       
input   [6 :0]  alu_rbus_ex1_pipe0_preg;          
input   [63:0]  alu_rbus_ex1_pipe1_data;          
input           alu_rbus_ex1_pipe1_data_vld;      
input   [63:0]  alu_rbus_ex1_pipe1_fwd_data;      
input           alu_rbus_ex1_pipe1_fwd_vld;       
input   [6 :0]  alu_rbus_ex1_pipe1_preg;          
input   [63:0]  cp0_iu_ex3_rslt_data;             
input   [6 :0]  cp0_iu_ex3_rslt_preg;             
input           cp0_iu_ex3_rslt_vld;              
input           cp0_iu_icg_en;                    
input           cp0_yy_clk_en;                    
input           cpurst_b;                         
input   [63:0]  div_rbus_data;                    
input           div_rbus_pipe0_data_vld;          
input   [6 :0]  div_rbus_preg;                    
input           forever_cpuclk;                   
input   [63:0]  had_idu_wbbr_data;                
input           had_idu_wbbr_vld;                 
input           mult_rbus_ex3_data_vld;           
input   [6 :0]  mult_rbus_ex3_preg;               
input   [63:0]  mult_rbus_ex4_data;               
input           mult_rbus_ex4_data_vld;           
input           pad_yy_icg_scan_en;               
input           rtu_yy_xx_flush;                  
input   [63:0]  special_rbus_ex1_data;            
input           special_rbus_ex1_data_vld;        
input   [6 :0]  special_rbus_ex1_preg;            
input   [63:0]  vfpu_iu_ex2_pipe6_mfvr_data;      
input           vfpu_iu_ex2_pipe6_mfvr_data_vld;  
input   [6 :0]  vfpu_iu_ex2_pipe6_mfvr_preg;      
input   [63:0]  vfpu_iu_ex2_pipe7_mfvr_data;      
input           vfpu_iu_ex2_pipe7_mfvr_data_vld;  
input   [6 :0]  vfpu_iu_ex2_pipe7_mfvr_preg;      
output  [6 :0]  iu_idu_ex1_pipe0_fwd_preg;        
output  [63:0]  iu_idu_ex1_pipe0_fwd_preg_data;   
output          iu_idu_ex1_pipe0_fwd_preg_vld;    
output  [6 :0]  iu_idu_ex1_pipe1_fwd_preg;        
output  [63:0]  iu_idu_ex1_pipe1_fwd_preg_data;   
output          iu_idu_ex1_pipe1_fwd_preg_vld;    
output  [6 :0]  iu_idu_ex2_pipe0_wb_preg;         
output  [63:0]  iu_idu_ex2_pipe0_wb_preg_data;    
output  [6 :0]  iu_idu_ex2_pipe0_wb_preg_dup0;    
output  [6 :0]  iu_idu_ex2_pipe0_wb_preg_dup1;    
output  [6 :0]  iu_idu_ex2_pipe0_wb_preg_dup2;    
output  [6 :0]  iu_idu_ex2_pipe0_wb_preg_dup3;    
output  [6 :0]  iu_idu_ex2_pipe0_wb_preg_dup4;    
output  [95:0]  iu_idu_ex2_pipe0_wb_preg_expand;  
output          iu_idu_ex2_pipe0_wb_preg_vld;     
output          iu_idu_ex2_pipe0_wb_preg_vld_dup0; 
output          iu_idu_ex2_pipe0_wb_preg_vld_dup1; 
output          iu_idu_ex2_pipe0_wb_preg_vld_dup2; 
output          iu_idu_ex2_pipe0_wb_preg_vld_dup3; 
output          iu_idu_ex2_pipe0_wb_preg_vld_dup4; 
output  [6 :0]  iu_idu_ex2_pipe1_wb_preg;         
output  [63:0]  iu_idu_ex2_pipe1_wb_preg_data;    
output  [6 :0]  iu_idu_ex2_pipe1_wb_preg_dup0;    
output  [6 :0]  iu_idu_ex2_pipe1_wb_preg_dup1;    
output  [6 :0]  iu_idu_ex2_pipe1_wb_preg_dup2;    
output  [6 :0]  iu_idu_ex2_pipe1_wb_preg_dup3;    
output  [6 :0]  iu_idu_ex2_pipe1_wb_preg_dup4;    
output  [95:0]  iu_idu_ex2_pipe1_wb_preg_expand;  
output          iu_idu_ex2_pipe1_wb_preg_vld;     
output          iu_idu_ex2_pipe1_wb_preg_vld_dup0; 
output          iu_idu_ex2_pipe1_wb_preg_vld_dup1; 
output          iu_idu_ex2_pipe1_wb_preg_vld_dup2; 
output          iu_idu_ex2_pipe1_wb_preg_vld_dup3; 
output          iu_idu_ex2_pipe1_wb_preg_vld_dup4; 
output  [95:0]  iu_rtu_ex2_pipe0_wb_preg_expand;  
output          iu_rtu_ex2_pipe0_wb_preg_vld;     
output  [95:0]  iu_rtu_ex2_pipe1_wb_preg_expand;  
output          iu_rtu_ex2_pipe1_wb_preg_vld;     

// &Regs; @27
reg     [63:0]  rbus_pipe0_rslt_data;             
reg     [6 :0]  rbus_pipe0_rslt_preg;             
reg     [63:0]  rbus_pipe0_wb_data;               
reg     [6 :0]  rbus_pipe0_wb_preg_dup0;          
reg     [6 :0]  rbus_pipe0_wb_preg_dup1;          
reg     [6 :0]  rbus_pipe0_wb_preg_dup2;          
reg     [6 :0]  rbus_pipe0_wb_preg_dup3;          
reg     [6 :0]  rbus_pipe0_wb_preg_dup4;          
reg     [6 :0]  rbus_pipe0_wb_preg_dup5;          
reg     [95:0]  rbus_pipe0_wb_preg_expand;        
reg     [6 :0]  rbus_pipe0_wb_vld;                
reg     [63:0]  rbus_pipe1_rslt_data;             
reg     [6 :0]  rbus_pipe1_rslt_preg;             
reg     [63:0]  rbus_pipe1_wb_data;               
reg     [6 :0]  rbus_pipe1_wb_preg_dup0;          
reg     [6 :0]  rbus_pipe1_wb_preg_dup1;          
reg     [6 :0]  rbus_pipe1_wb_preg_dup2;          
reg     [6 :0]  rbus_pipe1_wb_preg_dup3;          
reg     [6 :0]  rbus_pipe1_wb_preg_dup4;          
reg     [6 :0]  rbus_pipe1_wb_preg_dup5;          
reg     [95:0]  rbus_pipe1_wb_preg_expand;        
reg     [6 :0]  rbus_pipe1_wb_vld;                

// &Wires; @28
wire    [63:0]  alu_rbus_ex1_pipe0_data;          
wire    [63:0]  alu_rbus_ex1_pipe0_data_aft_wbbr; 
wire            alu_rbus_ex1_pipe0_data_vld;      
wire    [63:0]  alu_rbus_ex1_pipe0_fwd_data;      
wire            alu_rbus_ex1_pipe0_fwd_vld;       
wire    [6 :0]  alu_rbus_ex1_pipe0_preg;          
wire    [63:0]  alu_rbus_ex1_pipe1_data;          
wire    [63:0]  alu_rbus_ex1_pipe1_data_aft_wbbr; 
wire            alu_rbus_ex1_pipe1_data_vld;      
wire    [63:0]  alu_rbus_ex1_pipe1_fwd_data;      
wire            alu_rbus_ex1_pipe1_fwd_vld;       
wire    [6 :0]  alu_rbus_ex1_pipe1_preg;          
wire    [63:0]  cp0_iu_ex3_rslt_data;             
wire    [6 :0]  cp0_iu_ex3_rslt_preg;             
wire            cp0_iu_ex3_rslt_vld;              
wire            cp0_iu_icg_en;                    
wire            cp0_yy_clk_en;                    
wire            cpurst_b;                         
wire    [63:0]  div_rbus_data;                    
wire            div_rbus_pipe0_data_vld;          
wire    [6 :0]  div_rbus_preg;                    
wire            forever_cpuclk;                   
wire    [63:0]  had_idu_wbbr_data;                
wire            had_idu_wbbr_vld;                 
wire    [6 :0]  iu_idu_ex1_pipe0_fwd_preg;        
wire    [63:0]  iu_idu_ex1_pipe0_fwd_preg_data;   
wire            iu_idu_ex1_pipe0_fwd_preg_vld;    
wire    [6 :0]  iu_idu_ex1_pipe1_fwd_preg;        
wire    [63:0]  iu_idu_ex1_pipe1_fwd_preg_data;   
wire            iu_idu_ex1_pipe1_fwd_preg_vld;    
wire    [6 :0]  iu_idu_ex2_pipe0_wb_preg;         
wire    [63:0]  iu_idu_ex2_pipe0_wb_preg_data;    
wire    [6 :0]  iu_idu_ex2_pipe0_wb_preg_dup0;    
wire    [6 :0]  iu_idu_ex2_pipe0_wb_preg_dup1;    
wire    [6 :0]  iu_idu_ex2_pipe0_wb_preg_dup2;    
wire    [6 :0]  iu_idu_ex2_pipe0_wb_preg_dup3;    
wire    [6 :0]  iu_idu_ex2_pipe0_wb_preg_dup4;    
wire    [95:0]  iu_idu_ex2_pipe0_wb_preg_expand;  
wire            iu_idu_ex2_pipe0_wb_preg_vld;     
wire            iu_idu_ex2_pipe0_wb_preg_vld_dup0; 
wire            iu_idu_ex2_pipe0_wb_preg_vld_dup1; 
wire            iu_idu_ex2_pipe0_wb_preg_vld_dup2; 
wire            iu_idu_ex2_pipe0_wb_preg_vld_dup3; 
wire            iu_idu_ex2_pipe0_wb_preg_vld_dup4; 
wire    [6 :0]  iu_idu_ex2_pipe1_wb_preg;         
wire    [63:0]  iu_idu_ex2_pipe1_wb_preg_data;    
wire    [6 :0]  iu_idu_ex2_pipe1_wb_preg_dup0;    
wire    [6 :0]  iu_idu_ex2_pipe1_wb_preg_dup1;    
wire    [6 :0]  iu_idu_ex2_pipe1_wb_preg_dup2;    
wire    [6 :0]  iu_idu_ex2_pipe1_wb_preg_dup3;    
wire    [6 :0]  iu_idu_ex2_pipe1_wb_preg_dup4;    
wire    [95:0]  iu_idu_ex2_pipe1_wb_preg_expand;  
wire            iu_idu_ex2_pipe1_wb_preg_vld;     
wire            iu_idu_ex2_pipe1_wb_preg_vld_dup0; 
wire            iu_idu_ex2_pipe1_wb_preg_vld_dup1; 
wire            iu_idu_ex2_pipe1_wb_preg_vld_dup2; 
wire            iu_idu_ex2_pipe1_wb_preg_vld_dup3; 
wire            iu_idu_ex2_pipe1_wb_preg_vld_dup4; 
wire    [95:0]  iu_rtu_ex2_pipe0_wb_preg_expand;  
wire            iu_rtu_ex2_pipe0_wb_preg_vld;     
wire    [95:0]  iu_rtu_ex2_pipe1_wb_preg_expand;  
wire            iu_rtu_ex2_pipe1_wb_preg_vld;     
wire            mult_rbus_ex3_data_vld;           
wire    [6 :0]  mult_rbus_ex3_preg;               
wire    [63:0]  mult_rbus_ex4_data;               
wire            mult_rbus_ex4_data_vld;           
wire            pad_yy_icg_scan_en;               
wire            pipe0_data_clk;                   
wire            pipe0_data_clk_en;                
wire            pipe1_data_clk;                   
wire            pipe1_data_clk_en;                
wire    [95:0]  rbus_pipe0_rslt_preg_expand;      
wire            rbus_pipe0_rslt_vld;              
wire    [95:0]  rbus_pipe1_rslt_preg_expand;      
wire            rbus_pipe1_rslt_vld;              
wire            rslt_vld_clk;                     
wire            rslt_vld_clk_en;                  
wire            rtu_yy_xx_flush;                  
wire    [63:0]  special_rbus_ex1_data;            
wire            special_rbus_ex1_data_vld;        
wire    [6 :0]  special_rbus_ex1_preg;            
wire    [63:0]  vfpu_iu_ex2_pipe6_mfvr_data;      
wire            vfpu_iu_ex2_pipe6_mfvr_data_vld;  
wire    [6 :0]  vfpu_iu_ex2_pipe6_mfvr_preg;      
wire    [63:0]  vfpu_iu_ex2_pipe7_mfvr_data;      
wire            vfpu_iu_ex2_pipe7_mfvr_data_vld;  
wire    [6 :0]  vfpu_iu_ex2_pipe7_mfvr_preg;      



//==========================================================
//                 Instance of Gated Cell  
//==========================================================
assign rslt_vld_clk_en = rbus_pipe0_rslt_vld
                         || rbus_pipe1_rslt_vld
                         || rbus_pipe0_wb_vld[0]
                         || rbus_pipe1_wb_vld[0];
// &Instance("gated_clk_cell", "x_rslt_vld_gated_clk"); @38
gated_clk_cell  x_rslt_vld_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (rslt_vld_clk      ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (rslt_vld_clk_en   ),
  .module_en          (cp0_iu_icg_en     ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @39
//          .external_en (1'b0), @40
//          .global_en   (cp0_yy_clk_en), @41
//          .module_en   (cp0_iu_icg_en), @42
//          .local_en    (rslt_vld_clk_en), @43
//          .clk_out     (rslt_vld_clk)); @44

//==========================================================
//               Pipe0 GPR result Data Path
//==========================================================
//----------------------------------------------------------
//              Result Valid Control Signal
//----------------------------------------------------------
assign rbus_pipe0_rslt_vld = alu_rbus_ex1_pipe0_data_vld
                             || div_rbus_pipe0_data_vld
                             || special_rbus_ex1_data_vld
                             || cp0_iu_ex3_rslt_vld
                             || vfpu_iu_ex2_pipe6_mfvr_data_vld;

//----------------------------------------------------------
//                   Write Back Valid
//----------------------------------------------------------
always @(posedge rslt_vld_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    rbus_pipe0_wb_vld[6:0] <= 7'b0;
  else if(rtu_yy_xx_flush)
    rbus_pipe0_wb_vld[6:0] <= 7'b0;
  else
    rbus_pipe0_wb_vld[6:0] <= {7{rbus_pipe0_rslt_vld}};
end
//output to IDU
assign iu_idu_ex2_pipe0_wb_preg_vld_dup0 = rbus_pipe0_wb_vld[0];
assign iu_idu_ex2_pipe0_wb_preg_vld_dup1 = rbus_pipe0_wb_vld[1];
assign iu_idu_ex2_pipe0_wb_preg_vld_dup2 = rbus_pipe0_wb_vld[2];
assign iu_idu_ex2_pipe0_wb_preg_vld_dup3 = rbus_pipe0_wb_vld[3];
assign iu_idu_ex2_pipe0_wb_preg_vld_dup4 = rbus_pipe0_wb_vld[4];
assign iu_idu_ex2_pipe0_wb_preg_vld      = rbus_pipe0_wb_vld[5];
//output to RTU
assign iu_rtu_ex2_pipe0_wb_preg_vld = rbus_pipe0_wb_vld[6];

//----------------------------------------------------------
//                Write Back Data Selection
//----------------------------------------------------------
// &CombBeg; @87
always @( special_rbus_ex1_preg[6:0]
       or vfpu_iu_ex2_pipe6_mfvr_data_vld
       or div_rbus_pipe0_data_vld
       or vfpu_iu_ex2_pipe6_mfvr_preg[6:0]
       or cp0_iu_ex3_rslt_preg[6:0]
       or cp0_iu_ex3_rslt_vld
       or special_rbus_ex1_data_vld
       or div_rbus_preg[6:0]
       or alu_rbus_ex1_pipe0_preg[6:0]
       or alu_rbus_ex1_pipe0_data_vld)
begin
  case ({special_rbus_ex1_data_vld,
         vfpu_iu_ex2_pipe6_mfvr_data_vld,
         cp0_iu_ex3_rslt_vld,
         div_rbus_pipe0_data_vld,
         alu_rbus_ex1_pipe0_data_vld})
    5'h01  : rbus_pipe0_rslt_preg[6:0] = alu_rbus_ex1_pipe0_preg[6:0];
    5'h02  : rbus_pipe0_rslt_preg[6:0] = div_rbus_preg[6:0];
    5'h04  : rbus_pipe0_rslt_preg[6:0] = cp0_iu_ex3_rslt_preg[6:0];
    5'h08  : rbus_pipe0_rslt_preg[6:0] = vfpu_iu_ex2_pipe6_mfvr_preg[6:0];
    5'h10  : rbus_pipe0_rslt_preg[6:0] = special_rbus_ex1_preg[6:0];
    default: rbus_pipe0_rslt_preg[6:0] = {7{1'bx}};
  endcase
// &CombEnd; @100
end

assign alu_rbus_ex1_pipe0_data_aft_wbbr[63:0] = (had_idu_wbbr_vld)
                                                ? had_idu_wbbr_data[63:0]
                                                : alu_rbus_ex1_pipe0_data[63:0];

// &CombBeg; @106
always @( special_rbus_ex1_data[63:0]
       or div_rbus_data[63:0]
       or vfpu_iu_ex2_pipe6_mfvr_data_vld
       or div_rbus_pipe0_data_vld
       or cp0_iu_ex3_rslt_vld
       or special_rbus_ex1_data_vld
       or cp0_iu_ex3_rslt_data[63:0]
       or alu_rbus_ex1_pipe0_data_aft_wbbr[63:0]
       or vfpu_iu_ex2_pipe6_mfvr_data[63:0]
       or alu_rbus_ex1_pipe0_data_vld)
begin
  case ({special_rbus_ex1_data_vld,
         vfpu_iu_ex2_pipe6_mfvr_data_vld,
         cp0_iu_ex3_rslt_vld,
         div_rbus_pipe0_data_vld,
         alu_rbus_ex1_pipe0_data_vld})
    5'h01  : rbus_pipe0_rslt_data[63:0] = alu_rbus_ex1_pipe0_data_aft_wbbr[63:0];
    5'h02  : rbus_pipe0_rslt_data[63:0] = div_rbus_data[63:0];
    5'h04  : rbus_pipe0_rslt_data[63:0] = cp0_iu_ex3_rslt_data[63:0];
    5'h08  : rbus_pipe0_rslt_data[63:0] = vfpu_iu_ex2_pipe6_mfvr_data[63:0];
    5'h10  : rbus_pipe0_rslt_data[63:0] = special_rbus_ex1_data[63:0];
    default: rbus_pipe0_rslt_data[63:0] = {64{1'bx}};
  endcase
// &CombEnd; @119
end

// &ConnRule(s/^x_num/rbus_pipe0_rslt_preg/); @121
// &Instance("ct_rtu_expand_96","x_ct_rtu_expand_96_rbus_pipe0_rslt_preg"); @122
ct_rtu_expand_96  x_ct_rtu_expand_96_rbus_pipe0_rslt_preg (
  .x_num                       (rbus_pipe0_rslt_preg       ),
  .x_num_expand                (rbus_pipe0_rslt_preg_expand)
);


//----------------------------------------------------------
//                 Instance of Gated Cell  
//----------------------------------------------------------
assign pipe0_data_clk_en = rbus_pipe0_rslt_vld;
// &Instance("gated_clk_cell", "x_pipe0_data_gated_clk"); @128
gated_clk_cell  x_pipe0_data_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (pipe0_data_clk    ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (pipe0_data_clk_en ),
  .module_en          (cp0_iu_icg_en     ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @129
//          .external_en (1'b0), @130
//          .global_en   (cp0_yy_clk_en), @131
//          .module_en   (cp0_iu_icg_en), @132
//          .local_en    (pipe0_data_clk_en), @133
//          .clk_out     (pipe0_data_clk)); @134

//----------------------------------------------------------
//                   Write Back Data
//----------------------------------------------------------
always @(posedge pipe0_data_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    rbus_pipe0_wb_preg_dup0[6:0]    <= 7'b0;
    rbus_pipe0_wb_preg_dup1[6:0]    <= 7'b0;
    rbus_pipe0_wb_preg_dup2[6:0]    <= 7'b0;
    rbus_pipe0_wb_preg_dup3[6:0]    <= 7'b0;
    rbus_pipe0_wb_preg_dup4[6:0]    <= 7'b0;
    rbus_pipe0_wb_preg_dup5[6:0]    <= 7'b0;
    rbus_pipe0_wb_preg_expand[95:0] <= 96'b0;
    rbus_pipe0_wb_data[63:0]        <= 64'b0;
  end
  else if(rbus_pipe0_rslt_vld) begin
    rbus_pipe0_wb_preg_dup0[6:0]    <= rbus_pipe0_rslt_preg[6:0];
    rbus_pipe0_wb_preg_dup1[6:0]    <= rbus_pipe0_rslt_preg[6:0];
    rbus_pipe0_wb_preg_dup2[6:0]    <= rbus_pipe0_rslt_preg[6:0];
    rbus_pipe0_wb_preg_dup3[6:0]    <= rbus_pipe0_rslt_preg[6:0];
    rbus_pipe0_wb_preg_dup4[6:0]    <= rbus_pipe0_rslt_preg[6:0];
    rbus_pipe0_wb_preg_dup5[6:0]    <= rbus_pipe0_rslt_preg[6:0];
    rbus_pipe0_wb_preg_expand[95:0] <= rbus_pipe0_rslt_preg_expand[95:0];
    rbus_pipe0_wb_data[63:0]        <= rbus_pipe0_rslt_data[63:0];
  end
  else begin
    rbus_pipe0_wb_preg_dup0[6:0]    <= rbus_pipe0_wb_preg_dup0[6:0];
    rbus_pipe0_wb_preg_dup1[6:0]    <= rbus_pipe0_wb_preg_dup1[6:0];
    rbus_pipe0_wb_preg_dup2[6:0]    <= rbus_pipe0_wb_preg_dup2[6:0];
    rbus_pipe0_wb_preg_dup3[6:0]    <= rbus_pipe0_wb_preg_dup3[6:0];
    rbus_pipe0_wb_preg_dup4[6:0]    <= rbus_pipe0_wb_preg_dup4[6:0];
    rbus_pipe0_wb_preg_dup5[6:0]    <= rbus_pipe0_wb_preg_dup5[6:0];
    rbus_pipe0_wb_preg_expand[95:0] <= rbus_pipe0_wb_preg_expand[95:0];
    rbus_pipe0_wb_data[63:0]        <= rbus_pipe0_wb_data[63:0];
  end
end

//output to idu
assign iu_idu_ex2_pipe0_wb_preg_dup0[6:0]    = rbus_pipe0_wb_preg_dup0[6:0];
assign iu_idu_ex2_pipe0_wb_preg_dup1[6:0]    = rbus_pipe0_wb_preg_dup1[6:0];
assign iu_idu_ex2_pipe0_wb_preg_dup2[6:0]    = rbus_pipe0_wb_preg_dup2[6:0];
assign iu_idu_ex2_pipe0_wb_preg_dup3[6:0]    = rbus_pipe0_wb_preg_dup3[6:0];
assign iu_idu_ex2_pipe0_wb_preg_dup4[6:0]    = rbus_pipe0_wb_preg_dup4[6:0];
assign iu_idu_ex2_pipe0_wb_preg[6:0]         = rbus_pipe0_wb_preg_dup5[6:0];
assign iu_idu_ex2_pipe0_wb_preg_expand[95:0] = rbus_pipe0_wb_preg_expand[95:0];
assign iu_idu_ex2_pipe0_wb_preg_data[63:0]   = rbus_pipe0_wb_data[63:0];
//output to rtu
assign iu_rtu_ex2_pipe0_wb_preg_expand[95:0] = rbus_pipe0_wb_preg_expand[95:0];

//----------------------------------------------------------
//                     Forward Signals
//----------------------------------------------------------
//ex1 forward path: only alu0
assign iu_idu_ex1_pipe0_fwd_preg_vld        = alu_rbus_ex1_pipe0_fwd_vld;
assign iu_idu_ex1_pipe0_fwd_preg[6:0]       = alu_rbus_ex1_pipe0_preg[6:0];
assign iu_idu_ex1_pipe0_fwd_preg_data[63:0] = alu_rbus_ex1_pipe0_fwd_data[63:0];

//==========================================================
//               Pipe1 GPR result Data Path
//==========================================================
//----------------------------------------------------------
//              Result Valid Control Signal
//----------------------------------------------------------
assign rbus_pipe1_rslt_vld = alu_rbus_ex1_pipe1_data_vld
                             || mult_rbus_ex3_data_vld
                             || vfpu_iu_ex2_pipe7_mfvr_data_vld;

//----------------------------------------------------------
//                   Write Back Valid
//----------------------------------------------------------
always @(posedge rslt_vld_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    rbus_pipe1_wb_vld[6:0] <= 7'b0;
  else if(rtu_yy_xx_flush)
    rbus_pipe1_wb_vld[6:0] <= 7'b0;
  else
    rbus_pipe1_wb_vld[6:0] <= {7{rbus_pipe1_rslt_vld}};
end
//output to IDU
assign iu_idu_ex2_pipe1_wb_preg_vld_dup0 = rbus_pipe1_wb_vld[0];
assign iu_idu_ex2_pipe1_wb_preg_vld_dup1 = rbus_pipe1_wb_vld[1];
assign iu_idu_ex2_pipe1_wb_preg_vld_dup2 = rbus_pipe1_wb_vld[2];
assign iu_idu_ex2_pipe1_wb_preg_vld_dup3 = rbus_pipe1_wb_vld[3];
assign iu_idu_ex2_pipe1_wb_preg_vld_dup4 = rbus_pipe1_wb_vld[4];
assign iu_idu_ex2_pipe1_wb_preg_vld      = rbus_pipe1_wb_vld[5];
//output to RTU
assign iu_rtu_ex2_pipe1_wb_preg_vld = rbus_pipe1_wb_vld[6];

//----------------------------------------------------------
//                Write Back Data Selection
//----------------------------------------------------------
// &CombBeg; @237
always @( vfpu_iu_ex2_pipe7_mfvr_preg[6:0]
       or mult_rbus_ex3_preg[6:0]
       or alu_rbus_ex1_pipe1_data_vld
       or vfpu_iu_ex2_pipe7_mfvr_data_vld
       or mult_rbus_ex3_data_vld
       or alu_rbus_ex1_pipe1_preg[6:0])
begin
  case ({vfpu_iu_ex2_pipe7_mfvr_data_vld,
         mult_rbus_ex3_data_vld,
         alu_rbus_ex1_pipe1_data_vld})
    3'h1   : rbus_pipe1_rslt_preg[6:0] = alu_rbus_ex1_pipe1_preg[6:0];
    3'h2   : rbus_pipe1_rslt_preg[6:0] = mult_rbus_ex3_preg[6:0];
    3'h4   : rbus_pipe1_rslt_preg[6:0] = vfpu_iu_ex2_pipe7_mfvr_preg[6:0];
    default: rbus_pipe1_rslt_preg[6:0] = {7{1'bx}};
  endcase
// &CombEnd; @246
end

assign alu_rbus_ex1_pipe1_data_aft_wbbr[63:0] = (had_idu_wbbr_vld)
                                                ? had_idu_wbbr_data[63:0]
                                                : alu_rbus_ex1_pipe1_data[63:0];

//mult data is available at EX4
// &CombBeg; @253
always @( alu_rbus_ex1_pipe1_data_vld
       or vfpu_iu_ex2_pipe7_mfvr_data_vld
       or alu_rbus_ex1_pipe1_data_aft_wbbr[63:0]
       or vfpu_iu_ex2_pipe7_mfvr_data[63:0])
begin
  case ({vfpu_iu_ex2_pipe7_mfvr_data_vld,
         alu_rbus_ex1_pipe1_data_vld})
    2'h1   : rbus_pipe1_rslt_data[63:0] = alu_rbus_ex1_pipe1_data_aft_wbbr[63:0];
    2'h2   : rbus_pipe1_rslt_data[63:0] = vfpu_iu_ex2_pipe7_mfvr_data[63:0];
    default: rbus_pipe1_rslt_data[63:0] = {64{1'bx}};
  endcase
// &CombEnd; @260
end

// &ConnRule(s/^x_num/rbus_pipe1_rslt_preg/); @262
// &Instance("ct_rtu_expand_96","x_ct_rtu_expand_96_rbus_pipe1_rslt_preg"); @263
ct_rtu_expand_96  x_ct_rtu_expand_96_rbus_pipe1_rslt_preg (
  .x_num                       (rbus_pipe1_rslt_preg       ),
  .x_num_expand                (rbus_pipe1_rslt_preg_expand)
);


//----------------------------------------------------------
//                 Instance of Gated Cell  
//----------------------------------------------------------
assign pipe1_data_clk_en = rbus_pipe1_rslt_vld;
// &Instance("gated_clk_cell", "x_pipe1_data_gated_clk"); @269
gated_clk_cell  x_pipe1_data_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (pipe1_data_clk    ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (pipe1_data_clk_en ),
  .module_en          (cp0_iu_icg_en     ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @270
//          .external_en (1'b0), @271
//          .global_en   (cp0_yy_clk_en), @272
//          .module_en   (cp0_iu_icg_en), @273
//          .local_en    (pipe1_data_clk_en), @274
//          .clk_out     (pipe1_data_clk)); @275

//----------------------------------------------------------
//                   Write Back Data
//----------------------------------------------------------
always @(posedge pipe1_data_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    rbus_pipe1_wb_preg_dup0[6:0]    <= 7'b0;
    rbus_pipe1_wb_preg_dup1[6:0]    <= 7'b0;
    rbus_pipe1_wb_preg_dup2[6:0]    <= 7'b0;
    rbus_pipe1_wb_preg_dup3[6:0]    <= 7'b0;
    rbus_pipe1_wb_preg_dup4[6:0]    <= 7'b0;
    rbus_pipe1_wb_preg_dup5[6:0]    <= 7'b0;
    rbus_pipe1_wb_preg_expand[95:0] <= 96'b0;
    rbus_pipe1_wb_data[63:0]        <= 64'b0;
  end
  else if(rbus_pipe1_rslt_vld) begin
    rbus_pipe1_wb_preg_dup0[6:0]    <= rbus_pipe1_rslt_preg[6:0];
    rbus_pipe1_wb_preg_dup1[6:0]    <= rbus_pipe1_rslt_preg[6:0];
    rbus_pipe1_wb_preg_dup2[6:0]    <= rbus_pipe1_rslt_preg[6:0];
    rbus_pipe1_wb_preg_dup3[6:0]    <= rbus_pipe1_rslt_preg[6:0];
    rbus_pipe1_wb_preg_dup4[6:0]    <= rbus_pipe1_rslt_preg[6:0];
    rbus_pipe1_wb_preg_dup5[6:0]    <= rbus_pipe1_rslt_preg[6:0];
    rbus_pipe1_wb_preg_expand[95:0] <= rbus_pipe1_rslt_preg_expand[95:0];
    rbus_pipe1_wb_data[63:0]        <= rbus_pipe1_rslt_data[63:0];
  end
  else begin
    rbus_pipe1_wb_preg_dup0[6:0]    <= rbus_pipe1_wb_preg_dup0[6:0];
    rbus_pipe1_wb_preg_dup1[6:0]    <= rbus_pipe1_wb_preg_dup1[6:0];
    rbus_pipe1_wb_preg_dup2[6:0]    <= rbus_pipe1_wb_preg_dup2[6:0];
    rbus_pipe1_wb_preg_dup3[6:0]    <= rbus_pipe1_wb_preg_dup3[6:0];
    rbus_pipe1_wb_preg_dup4[6:0]    <= rbus_pipe1_wb_preg_dup4[6:0];
    rbus_pipe1_wb_preg_dup5[6:0]    <= rbus_pipe1_wb_preg_dup5[6:0];
    rbus_pipe1_wb_preg_expand[95:0] <= rbus_pipe1_wb_preg_expand[95:0];
    rbus_pipe1_wb_data[63:0]        <= rbus_pipe1_wb_data[63:0];
  end
end

//output to idu
assign iu_idu_ex2_pipe1_wb_preg_dup0[6:0]    = rbus_pipe1_wb_preg_dup0[6:0];
assign iu_idu_ex2_pipe1_wb_preg_dup1[6:0]    = rbus_pipe1_wb_preg_dup1[6:0];
assign iu_idu_ex2_pipe1_wb_preg_dup2[6:0]    = rbus_pipe1_wb_preg_dup2[6:0];
assign iu_idu_ex2_pipe1_wb_preg_dup3[6:0]    = rbus_pipe1_wb_preg_dup3[6:0];
assign iu_idu_ex2_pipe1_wb_preg_dup4[6:0]    = rbus_pipe1_wb_preg_dup4[6:0];
assign iu_idu_ex2_pipe1_wb_preg[6:0]         = rbus_pipe1_wb_preg_dup5[6:0];
assign iu_idu_ex2_pipe1_wb_preg_expand[95:0] = rbus_pipe1_wb_preg_expand[95:0];
assign iu_idu_ex2_pipe1_wb_preg_data[63:0]   = (mult_rbus_ex4_data_vld)
                                               ? mult_rbus_ex4_data[63:0]
                                               : rbus_pipe1_wb_data[63:0];
//output to rtu
assign iu_rtu_ex2_pipe1_wb_preg_expand[95:0] = rbus_pipe1_wb_preg_expand[95:0];

//----------------------------------------------------------
//                     Forward Signals
//----------------------------------------------------------
//ex1 forward path: only alu
assign iu_idu_ex1_pipe1_fwd_preg_vld        = alu_rbus_ex1_pipe1_fwd_vld;
assign iu_idu_ex1_pipe1_fwd_preg[6:0]       = alu_rbus_ex1_pipe1_preg[6:0];
assign iu_idu_ex1_pipe1_fwd_preg_data[63:0] = alu_rbus_ex1_pipe1_fwd_data[63:0];

// &ModuleEnd; @343
endmodule


