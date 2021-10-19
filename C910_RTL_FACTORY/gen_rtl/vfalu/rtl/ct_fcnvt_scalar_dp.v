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
module ct_fcnvt_scalar_dp(
  cp0_vfpu_icg_en,
  cp0_yy_clk_en,
  cpurst_b,
  dp_ex1_src,
  dp_vfalu_ex1_pipex_func,
  dp_vfalu_ex1_pipex_imm0,
  dp_vfalu_ex1_pipex_srcf0,
  ex1_dest_double,
  ex1_dest_float,
  ex1_dest_single,
  ex1_narrow,
  ex1_pipedown,
  ex1_rm,
  ex1_sover,
  ex1_src_double,
  ex1_src_float,
  ex1_src_l16,
  ex1_src_l32,
  ex1_src_l64,
  ex1_src_si,
  ex1_src_single,
  ex1_widden,
  ex2_dest_double,
  ex2_dest_float,
  ex2_dest_half,
  ex2_dest_l16,
  ex2_dest_l32,
  ex2_dest_l64,
  ex2_dest_l8,
  ex2_dest_si,
  ex2_dest_single,
  ex2_src_float,
  ex3_pipedown,
  fcnvt_ereg_forward_r_vld,
  fcnvt_ereg_forward_result,
  fcnvt_ex3_expt,
  fcnvt_ex3_result,
  fcnvt_forward_r_vld,
  fcnvt_forward_result,
  forever_cpuclk,
  pad_yy_icg_scan_en,
  vfpu_yy_xx_rm
);

// &Ports; @22
input           cp0_vfpu_icg_en;          
input           cp0_yy_clk_en;            
input           cpurst_b;                 
input   [19:0]  dp_vfalu_ex1_pipex_func;  
input   [2 :0]  dp_vfalu_ex1_pipex_imm0;  
input   [63:0]  dp_vfalu_ex1_pipex_srcf0; 
input           ex1_pipedown;             
input           ex3_pipedown;             
input   [4 :0]  fcnvt_ex3_expt;           
input   [63:0]  fcnvt_ex3_result;         
input           forever_cpuclk;           
input           pad_yy_icg_scan_en;       
input   [2 :0]  vfpu_yy_xx_rm;            
output  [63:0]  dp_ex1_src;               
output          ex1_dest_double;          
output          ex1_dest_float;           
output          ex1_dest_single;          
output          ex1_narrow;               
output  [4 :0]  ex1_rm;                   
output          ex1_sover;                
output          ex1_src_double;           
output          ex1_src_float;            
output          ex1_src_l16;              
output          ex1_src_l32;              
output          ex1_src_l64;              
output          ex1_src_si;               
output          ex1_src_single;           
output          ex1_widden;               
output          ex2_dest_double;          
output          ex2_dest_float;           
output          ex2_dest_half;            
output          ex2_dest_l16;             
output          ex2_dest_l32;             
output          ex2_dest_l64;             
output          ex2_dest_l8;              
output          ex2_dest_si;              
output          ex2_dest_single;          
output          ex2_src_float;            
output          fcnvt_ereg_forward_r_vld; 
output  [4 :0]  fcnvt_ereg_forward_result; 
output          fcnvt_forward_r_vld;      
output  [63:0]  fcnvt_forward_result;     

// &Regs; @23
reg             ex2_dest_double;          
reg             ex2_dest_float;           
reg             ex2_dest_half;            
reg             ex2_dest_l16;             
reg             ex2_dest_l32;             
reg             ex2_dest_l64;             
reg             ex2_dest_si;              
reg             ex2_dest_single;          
reg             ex2_src_float;            

// &Wires; @24
wire            cp0_vfpu_icg_en;          
wire            cp0_yy_clk_en;            
wire            cpurst_b;                 
wire    [63:0]  dp_ex1_src;               
wire    [19:0]  dp_vfalu_ex1_pipex_func;  
wire    [2 :0]  dp_vfalu_ex1_pipex_imm0;  
wire    [63:0]  dp_vfalu_ex1_pipex_srcf0; 
wire            ex1_dest_double;          
wire            ex1_dest_float;           
wire            ex1_dest_half;            
wire            ex1_dest_l16;             
wire            ex1_dest_l32;             
wire            ex1_dest_l64;             
wire            ex1_dest_si;              
wire            ex1_dest_single;          
wire            ex1_equal;                
wire            ex1_narrow;               
wire            ex1_pipe_clk;             
wire            ex1_pipe_clk_en;          
wire            ex1_pipedown;             
wire    [4 :0]  ex1_rm;                   
wire            ex1_rm_rdn;               
wire            ex1_rm_rmm;               
wire            ex1_rm_rne;               
wire            ex1_rm_rtz;               
wire            ex1_rm_rup;               
wire            ex1_sover;                
wire    [63:0]  ex1_src0;                 
wire            ex1_src_double;           
wire            ex1_src_float;            
wire            ex1_src_l16;              
wire            ex1_src_l32;              
wire            ex1_src_l64;              
wire            ex1_src_si;               
wire            ex1_src_single;           
wire            ex1_widden;               
wire            ex2_dest_l8;              
wire            ex3_pipedown;             
wire            fcnvt_ereg_forward_r_vld; 
wire    [4 :0]  fcnvt_ereg_forward_result; 
wire    [4 :0]  fcnvt_ex3_expt;           
wire    [63:0]  fcnvt_ex3_result;         
wire            fcnvt_forward_r_vld;      
wire    [63:0]  fcnvt_forward_result;     
wire            forever_cpuclk;           
wire    [19:0]  func;                     
wire            pad_yy_icg_scan_en;       
wire    [2 :0]  vfalu_rm;                 
wire    [2 :0]  vfalu_static_rm;          
wire    [2 :0]  vfpu_yy_xx_rm;            


//Round Mode Set
assign vfalu_static_rm[2:0] = dp_vfalu_ex1_pipex_imm0[2:0];
assign vfalu_rm[2:0]        = (vfalu_static_rm[2:0] == 3'b111)
                            ? vfpu_yy_xx_rm[2:0]  
                            : vfalu_static_rm[2:0];
assign ex1_rm_rne  = (vfalu_rm[2:0] == 3'b000);
assign ex1_rm_rtz  = (vfalu_rm[2:0] == 3'b001);
assign ex1_rm_rdn  = (vfalu_rm[2:0] == 3'b010);
assign ex1_rm_rup  = (vfalu_rm[2:0] == 3'b011);
assign ex1_rm_rmm  = (vfalu_rm[2:0] == 3'b100);
assign ex1_rm[4:0] = {ex1_rm_rmm,
                      ex1_rm_rdn,
                      ex1_rm_rup,
                      ex1_rm_rtz,
                      ex1_rm_rne}; 
//======================Data Prepare========================
// &Force("bus","dp_vfalu_ex1_pipe6_func",19,0); @42
// &Force("bus","dp_vfalu_ex1_pipex_imm0", 2,0); @43
// &Force("bus","dp_vfalu_ex1_pipex_split_count",5,0); @44
assign func[19:0]      = dp_vfalu_ex1_pipex_func[19:0];


assign ex1_src_l64     = func[16] || func[15] && ex1_narrow;
assign ex1_src_l32     = func[15] && !ex1_narrow || !func[16] && !func[15] && ex1_narrow;
assign ex1_src_l16     = !func[16] && !func[15] && !ex1_narrow;
//assign ex1_src_l16     = 1'b0;
assign ex1_widden      = func[14] && !func[13];
assign ex1_narrow      = !func[14] && func[13];
assign ex1_equal       = !func[13] && !func[14];
assign ex1_sover       = func[14] && func[13]; //this means the 16->64,64->16

//assign ex1_fcnvt       = func[7];
assign ex1_src_si      = func[0];
assign ex1_src_float   = func[1];
assign ex1_dest_float  = func[2];
assign ex1_dest_si     = func[3];
assign ex1_src_single  = ex1_src_l32;
assign ex1_src_double  = ex1_src_l64;
//assign ex1_dest_l16    =  ex1_src_l32 && ex1_narrow ||
//                          ex1_src_l8  && ex1_widden ||
//                          ex1_src_l16 && ex1_equal  ||
//                          ex1_src_l64 && ex1_sover;
assign ex1_dest_l64    =  ex1_src_l64 && ex1_equal ||
                          ex1_src_l32 && ex1_widden ||
                          ex1_src_l16 && ex1_sover;
assign ex1_dest_l32    =  ex1_src_l32 && ex1_equal  ||
                          ex1_src_l16 && ex1_widden ||
                          ex1_src_l64 && ex1_narrow;
assign ex1_dest_l16    =  ex1_src_l32 && ex1_narrow ||
                          ex1_src_l16 && ex1_equal  ||
                          ex1_src_l64 && ex1_sover;                        
assign ex1_dest_half      = ex1_dest_float && ex1_dest_l16;
assign ex1_dest_single    = ex1_dest_float && ex1_dest_l32;
assign ex1_dest_double    = ex1_dest_float && ex1_dest_l64;
// &Force("output","ex1_dest_float"); @80
// &Force("output","ex1_src_float"); @81
// &Force("output","ex1_src_si"); @82
// &Force("output","ex1_rm"); @83
// &Force("output","ex1_narrow"); @84
// &Force("output","ex1_src_l64"); @85
// &Force("output","ex1_src_l32"); @86
// &Force("output","ex1_src_l16"); @87
// &Force("output","ex1_src_single"); @88
// &Force("output","ex1_src_double"); @89
// &Force("output","ex1_widden"); @90
// //&Force("output","ex1_dest_half"); @91
// &Force("output","ex1_dest_double"); @92
// &Force("output","ex1_dest_single"); @93
// //&Force("output","ex1_dest_si"); @94
// &Force("output","ex1_sover"); @95

assign ex1_src0[63:0]                = dp_vfalu_ex1_pipex_srcf0[63:0];
assign dp_ex1_src[63:0]              = ex1_src0[63:0];


//gate clk
// &Instance("gated_clk_cell","x_ex1_pipe_clk"); @102
gated_clk_cell  x_ex1_pipe_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (ex1_pipe_clk      ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (ex1_pipe_clk_en   ),
  .module_en          (cp0_vfpu_icg_en   ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect( .clk_in         (forever_cpuclk), @103
//           .clk_out        (ex1_pipe_clk),//Out Clock @104
//           .external_en    (1'b0), @105
//           .global_en      (cp0_yy_clk_en), @106
//           .local_en       (ex1_pipe_clk_en),//Local Condition @107
//           .module_en      (cp0_vfpu_icg_en) @108
//         ); @109
assign ex1_pipe_clk_en = ex1_pipedown;

always @(posedge ex1_pipe_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
  begin
    ex2_dest_float                <=  1'b0;
    ex2_dest_double               <=  1'b0;
    ex2_dest_single               <=  1'b0;
    ex2_dest_half                 <=  1'b0;
    ex2_dest_l32                  <=  1'b0;
    ex2_dest_l64                  <=  1'b0;
    ex2_dest_l16                  <=  1'b0;
    ex2_dest_si                   <=  1'b0;
    ex2_src_float                 <=  1'b0;
  end
  else if(ex1_pipedown)
  begin
    ex2_dest_double               <= ex1_dest_double;
    ex2_dest_single               <= ex1_dest_single;
    ex2_dest_float                <= ex1_dest_float;
    ex2_dest_l32                  <= ex1_dest_l32; 
    ex2_dest_l64                  <= ex1_dest_l64; 
    ex2_dest_l16                  <= ex1_dest_l16; 
    ex2_dest_half                 <= ex1_dest_half;
    ex2_dest_si                   <= ex1_dest_si;
    ex2_src_float                 <= ex1_src_float;
  end 
end    
// &Force("output","ex2_dest_float"); @139
// &Force("output","ex2_dest_l32"); @140
// &Force("output","ex2_dest_l64"); @141
assign ex2_dest_l8    = 1'b0;


//=======================Pipe to EX3========================
//gate clk
//&Instance("gated_clk_cell","x_ex2_pipe_clk");
// //&Connect( .clk_in         (forever_cpuclk), @148
// //          .clk_out        (ex2_pipe_clk),//Out Clock @149
// //          .external_en    (1'b0), @150
// //          .global_en      (cp0_yy_clk_en), @151
// //          .local_en       (ex2_pipe_clk_en),//Local Condition @152
// //          .module_en      (cp0_vfpu_icg_en) @153
// //        ); @154
//assign ex2_pipe_clk_en = ex2_pipedown;

//always @(posedge ex2_pipe_clk or negedge cpurst_b)
//begin
//  if(!cpurst_b)
//  begin
//    ex3_dest_float          <= 1'b0;
//  end
//  else if(ex2_pipedown)
//  begin
//    ex3_dest_float          <= ex2_dest_float;
//  end
//end

//==========================================================
//                    EX3 Result Merge
//==========================================================
assign fcnvt_ereg_forward_result[4:0]   = fcnvt_ex3_expt[4:0];
assign fcnvt_forward_result[63:0]       = fcnvt_ex3_result[63:0];                                                      
assign fcnvt_forward_r_vld              = ex3_pipedown;
assign fcnvt_ereg_forward_r_vld         = ex3_pipedown;



// &ModuleEnd; @179
endmodule


