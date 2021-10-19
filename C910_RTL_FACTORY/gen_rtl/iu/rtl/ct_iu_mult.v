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
module ct_iu_mult(
  cp0_iu_icg_en,
  cp0_yy_clk_en,
  cpurst_b,
  forever_cpuclk,
  idu_iu_rf_mult_gateclk_sel,
  idu_iu_rf_mult_sel,
  idu_iu_rf_pipe1_dst_preg,
  idu_iu_rf_pipe1_mla_src2_preg,
  idu_iu_rf_pipe1_mla_src2_vld,
  idu_iu_rf_pipe1_mult_func,
  idu_iu_rf_pipe1_src0,
  idu_iu_rf_pipe1_src1_no_imm,
  idu_iu_rf_pipe1_src2,
  iu_idu_ex1_pipe1_mult_stall,
  iu_idu_ex2_pipe1_mult_inst_vld_dup0,
  iu_idu_ex2_pipe1_mult_inst_vld_dup1,
  iu_idu_ex2_pipe1_mult_inst_vld_dup2,
  iu_idu_ex2_pipe1_mult_inst_vld_dup3,
  iu_idu_ex2_pipe1_mult_inst_vld_dup4,
  iu_idu_ex2_pipe1_preg_dup0,
  iu_idu_ex2_pipe1_preg_dup1,
  iu_idu_ex2_pipe1_preg_dup2,
  iu_idu_ex2_pipe1_preg_dup3,
  iu_idu_ex2_pipe1_preg_dup4,
  iu_idu_pipe1_mla_src2_no_fwd,
  mult_rbus_ex3_data_vld,
  mult_rbus_ex3_preg,
  mult_rbus_ex4_data,
  mult_rbus_ex4_data_vld,
  pad_yy_icg_scan_en,
  rtu_yy_xx_flush
);

// &Ports; @26
input            cp0_iu_icg_en;                      
input            cp0_yy_clk_en;                      
input            cpurst_b;                           
input            forever_cpuclk;                     
input            idu_iu_rf_mult_gateclk_sel;         
input            idu_iu_rf_mult_sel;                 
input   [6  :0]  idu_iu_rf_pipe1_dst_preg;           
input   [6  :0]  idu_iu_rf_pipe1_mla_src2_preg;      
input            idu_iu_rf_pipe1_mla_src2_vld;       
input   [7  :0]  idu_iu_rf_pipe1_mult_func;          
input   [63 :0]  idu_iu_rf_pipe1_src0;               
input   [63 :0]  idu_iu_rf_pipe1_src1_no_imm;        
input   [63 :0]  idu_iu_rf_pipe1_src2;               
input            pad_yy_icg_scan_en;                 
input            rtu_yy_xx_flush;                    
output           iu_idu_ex1_pipe1_mult_stall;        
output           iu_idu_ex2_pipe1_mult_inst_vld_dup0; 
output           iu_idu_ex2_pipe1_mult_inst_vld_dup1; 
output           iu_idu_ex2_pipe1_mult_inst_vld_dup2; 
output           iu_idu_ex2_pipe1_mult_inst_vld_dup3; 
output           iu_idu_ex2_pipe1_mult_inst_vld_dup4; 
output  [6  :0]  iu_idu_ex2_pipe1_preg_dup0;         
output  [6  :0]  iu_idu_ex2_pipe1_preg_dup1;         
output  [6  :0]  iu_idu_ex2_pipe1_preg_dup2;         
output  [6  :0]  iu_idu_ex2_pipe1_preg_dup3;         
output  [6  :0]  iu_idu_ex2_pipe1_preg_dup4;         
output           iu_idu_pipe1_mla_src2_no_fwd;       
output           mult_rbus_ex3_data_vld;             
output  [6  :0]  mult_rbus_ex3_preg;                 
output  [63 :0]  mult_rbus_ex4_data;                 
output           mult_rbus_ex4_data_vld;             

// &Regs; @27
reg     [6  :0]  mult_ex1_dst_preg;                  
reg              mult_ex1_inst_vld;                  
reg              mult_ex1_mla;                       
reg     [64 :0]  mult_ex1_pipedown_src2;             
reg     [1  :0]  mult_ex1_rslt_sel;                  
reg     [64 :0]  mult_ex1_src0;                      
reg     [64 :0]  mult_ex1_src1;                      
reg     [64 :0]  mult_ex1_src2;                      
reg              mult_ex1_src2_ex1_sel_ex3;          
reg              mult_ex1_src2_ex1_sel_ex4;          
reg              mult_ex1_src2_ex2_sel_ex3;          
reg              mult_ex1_src2_h;                    
reg              mult_ex1_sub;                       
reg     [6  :0]  mult_ex2_dst_preg;                  
reg     [6  :0]  mult_ex2_dst_preg_dup0;             
reg     [6  :0]  mult_ex2_dst_preg_dup1;             
reg     [6  :0]  mult_ex2_dst_preg_dup2;             
reg     [6  :0]  mult_ex2_dst_preg_dup3;             
reg     [6  :0]  mult_ex2_dst_preg_dup4;             
reg              mult_ex2_inst_vld;                  
reg     [4  :0]  mult_ex2_inst_vld_dup;              
reg              mult_ex2_mla;                       
reg     [1  :0]  mult_ex2_rslt_sel;                  
reg     [64 :0]  mult_ex2_src2;                      
reg              mult_ex2_src2_ex2_sel_ex3;          
reg              mult_ex2_src2_h;                    
reg     [6  :0]  mult_ex3_dst_preg;                  
reg              mult_ex3_inst_vld;                  
reg              mult_ex3_mla;                       
reg     [1  :0]  mult_ex3_rslt_sel;                  
reg     [6  :0]  mult_ex4_dst_preg;                  
reg              mult_ex4_inst_vld;                  
reg     [127:0]  mult_ex4_result;                    
reg     [1  :0]  mult_ex4_rslt_sel;                  
reg     [63 :0]  mult_rbus_ex4_data;                 

// &Wires; @28
wire             cp0_iu_icg_en;                      
wire             cp0_yy_clk_en;                      
wire             cpurst_b;                           
wire             ex1_inst_clk;                       
wire             ex1_inst_clk_en;                    
wire             ex2_inst_clk;                       
wire             ex2_inst_clk_en;                    
wire             ex3_inst_clk;                       
wire             ex3_inst_clk_en;                    
wire             ex4_inst_clk;                       
wire             ex4_inst_clk_en;                    
wire             forever_cpuclk;                     
wire             idu_iu_rf_mult_gateclk_sel;         
wire             idu_iu_rf_mult_sel;                 
wire    [6  :0]  idu_iu_rf_pipe1_dst_preg;           
wire    [6  :0]  idu_iu_rf_pipe1_mla_src2_preg;      
wire             idu_iu_rf_pipe1_mla_src2_vld;       
wire    [7  :0]  idu_iu_rf_pipe1_mult_func;          
wire    [63 :0]  idu_iu_rf_pipe1_src0;               
wire    [63 :0]  idu_iu_rf_pipe1_src1_no_imm;        
wire    [63 :0]  idu_iu_rf_pipe1_src2;               
wire             iu_idu_ex1_pipe1_mult_stall;        
wire             iu_idu_ex2_pipe1_mult_inst_vld_dup0; 
wire             iu_idu_ex2_pipe1_mult_inst_vld_dup1; 
wire             iu_idu_ex2_pipe1_mult_inst_vld_dup2; 
wire             iu_idu_ex2_pipe1_mult_inst_vld_dup3; 
wire             iu_idu_ex2_pipe1_mult_inst_vld_dup4; 
wire    [6  :0]  iu_idu_ex2_pipe1_preg_dup0;         
wire    [6  :0]  iu_idu_ex2_pipe1_preg_dup1;         
wire    [6  :0]  iu_idu_ex2_pipe1_preg_dup2;         
wire    [6  :0]  iu_idu_ex2_pipe1_preg_dup3;         
wire    [6  :0]  iu_idu_ex2_pipe1_preg_dup4;         
wire             iu_idu_pipe1_mla_src2_no_fwd;       
wire             mult_clk;                           
wire             mult_clk_en;                        
wire             mult_ex1_src2_ex1_sel_ex1;          
wire    [64 :0]  mult_ex2_src2_data;                 
wire    [64 :0]  mult_ex2_src2_fwd_data;             
wire    [64 :0]  mult_ex3_src2_fwd_data;             
wire    [64 :0]  mult_ex4_src2_fwd_data;             
wire    [129:0]  mult_multiplier_result;             
wire             mult_rbus_ex3_data_vld;             
wire    [6  :0]  mult_rbus_ex3_preg;                 
wire             mult_rbus_ex4_data_vld;             
wire             mult_rf_mla_match_ex1;              
wire             mult_rf_mla_match_ex2;              
wire             mult_rf_mla_match_ex3;              
wire    [64 :0]  mult_rf_src0;                       
wire    [64 :0]  mult_rf_src1;                       
wire    [64 :0]  mult_rf_src2;                       
wire             pad_yy_icg_scan_en;                 
wire             rtu_yy_xx_flush;                    


// &Depend("compressor_32.v"); @30
// &Depend("compressor_42.v"); @31
// &Depend("booth_code.v"); @32

//==========================================================
//                 RF/EX1 Pipeline Register
//==========================================================
//----------------------------------------------------------
//                 Instance of Gated Cell  
//----------------------------------------------------------
assign mult_clk_en = idu_iu_rf_mult_gateclk_sel
                     || mult_ex1_inst_vld
                     || mult_ex2_inst_vld
                     || mult_ex3_inst_vld
                     || mult_ex4_inst_vld;
// &Instance("gated_clk_cell", "x_mult_gated_clk"); @45
gated_clk_cell  x_mult_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (mult_clk          ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (mult_clk_en       ),
  .module_en          (cp0_iu_icg_en     ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @46
//          .external_en (1'b0), @47
//          .global_en   (cp0_yy_clk_en), @48
//          .module_en   (cp0_iu_icg_en), @49
//          .local_en    (mult_clk_en), @50
//          .clk_out     (mult_clk)); @51

assign ex1_inst_clk_en = idu_iu_rf_mult_gateclk_sel;
// &Instance("gated_clk_cell", "x_ex1_inst_gated_clk"); @54
gated_clk_cell  x_ex1_inst_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (ex1_inst_clk      ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (ex1_inst_clk_en   ),
  .module_en          (cp0_iu_icg_en     ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @55
//          .external_en (1'b0), @56
//          .global_en   (cp0_yy_clk_en), @57
//          .module_en   (cp0_iu_icg_en), @58
//          .local_en    (ex1_inst_clk_en), @59
//          .clk_out     (ex1_inst_clk)); @60

assign ex2_inst_clk_en = mult_ex1_inst_vld;
// &Instance("gated_clk_cell", "x_ex2_inst_gated_clk"); @63
gated_clk_cell  x_ex2_inst_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (ex2_inst_clk      ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (ex2_inst_clk_en   ),
  .module_en          (cp0_iu_icg_en     ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @64
//          .external_en (1'b0), @65
//          .global_en   (cp0_yy_clk_en), @66
//          .module_en   (cp0_iu_icg_en), @67
//          .local_en    (ex2_inst_clk_en), @68
//          .clk_out     (ex2_inst_clk)); @69

assign ex3_inst_clk_en = mult_ex2_inst_vld;
// &Instance("gated_clk_cell", "x_ex3_inst_gated_clk"); @72
gated_clk_cell  x_ex3_inst_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (ex3_inst_clk      ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (ex3_inst_clk_en   ),
  .module_en          (cp0_iu_icg_en     ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @73
//          .external_en (1'b0), @74
//          .global_en   (cp0_yy_clk_en), @75
//          .module_en   (cp0_iu_icg_en), @76
//          .local_en    (ex3_inst_clk_en), @77
//          .clk_out     (ex3_inst_clk)); @78

assign ex4_inst_clk_en = mult_ex3_inst_vld;
// &Instance("gated_clk_cell", "x_ex4_inst_gated_clk"); @81
gated_clk_cell  x_ex4_inst_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (ex4_inst_clk      ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (ex4_inst_clk_en   ),
  .module_en          (cp0_iu_icg_en     ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @82
//          .external_en (1'b0), @83
//          .global_en   (cp0_yy_clk_en), @84
//          .module_en   (cp0_iu_icg_en), @85
//          .local_en    (ex4_inst_clk_en), @86
//          .clk_out     (ex4_inst_clk)); @87

//----------------------------------------------------------
//               Pipe1 RF Operand Prepare
//----------------------------------------------------------
//mul    : rz = (rx * ry)[63:0]
//mulh   : rz = (rx * ry)[127:64]
//mulhu  : rz = (unsign_rx * unsign_ry)[127:64]
//mulhsu : rz = (rx * unsign_ry)[127:64]
//mulw   : rz = sign_extend(rx[31:0] * ry[31:0])[31:0]
assign mult_rf_src0[64]    = (idu_iu_rf_pipe1_mult_func[2])
                             ? 1'b0 : idu_iu_rf_pipe1_src0[63];
assign mult_rf_src0[63:32] = (idu_iu_rf_pipe1_mult_func[1])
                             ? 32'b0 : idu_iu_rf_pipe1_src0[63:32];
assign mult_rf_src0[31:0]  = (idu_iu_rf_pipe1_mult_func[4])
                             ? {{16{idu_iu_rf_pipe1_src0[15]}},
                                    idu_iu_rf_pipe1_src0[15:0]}
                             : idu_iu_rf_pipe1_src0[31:0];

assign mult_rf_src1[64]    = (idu_iu_rf_pipe1_mult_func[3])
                             ? 1'b0 : idu_iu_rf_pipe1_src1_no_imm[63];
assign mult_rf_src1[63:32] = (idu_iu_rf_pipe1_mult_func[1])
                             ? 32'b0 : idu_iu_rf_pipe1_src1_no_imm[63:32];
assign mult_rf_src1[31:0]  = (idu_iu_rf_pipe1_mult_func[4])
                             ? {{16{idu_iu_rf_pipe1_src1_no_imm[15]}}, 
                                    idu_iu_rf_pipe1_src1_no_imm[15:0]}
                             : idu_iu_rf_pipe1_src1_no_imm[31:0];

assign mult_rf_src2[64:32] = (idu_iu_rf_pipe1_mult_func[6])
                             ? {idu_iu_rf_pipe1_src2[63],
                                idu_iu_rf_pipe1_src2[63:32]}
                             : 33'b0;
assign mult_rf_src2[31:0]  = (idu_iu_rf_pipe1_mult_func[5])
                             ? idu_iu_rf_pipe1_src2[31:0] : 32'b0;

//----------------------------------------------------------
//               Indicate Internal Forward
//----------------------------------------------------------
assign mult_rf_mla_match_ex1 = idu_iu_rf_pipe1_mla_src2_vld
                               && mult_ex1_inst_vld && mult_ex1_mla
                               && (idu_iu_rf_pipe1_mult_func[1]
                                   == mult_ex1_rslt_sel[1])
                               && (idu_iu_rf_pipe1_mla_src2_preg[6:0]
                                   == mult_ex1_dst_preg[6:0]);
assign mult_rf_mla_match_ex2 = idu_iu_rf_pipe1_mla_src2_vld
                               && mult_ex2_inst_vld && mult_ex2_mla
                               && (idu_iu_rf_pipe1_mult_func[1]
                                   == mult_ex2_rslt_sel[1])
                               && (idu_iu_rf_pipe1_mla_src2_preg[6:0]
                                   == mult_ex2_dst_preg[6:0]);
assign mult_rf_mla_match_ex3 = idu_iu_rf_pipe1_mla_src2_vld
                               && mult_ex3_inst_vld && mult_ex3_mla
                               && (idu_iu_rf_pipe1_mult_func[1]
                                   == mult_ex3_rslt_sel[1])
                               && (idu_iu_rf_pipe1_mla_src2_preg[6:0]
                                   == mult_ex3_dst_preg[6:0]);

assign iu_idu_pipe1_mla_src2_no_fwd = !mult_rf_mla_match_ex1
                                   && !mult_rf_mla_match_ex2
                                   && !mult_rf_mla_match_ex3;

//----------------------------------------------------------
//              Pipe1 EX1 Instruction valid
//----------------------------------------------------------
always @(posedge mult_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    mult_ex1_inst_vld <= 1'b0;
  else if(rtu_yy_xx_flush)
    mult_ex1_inst_vld <= 1'b0;
  else
    mult_ex1_inst_vld <= idu_iu_rf_mult_sel;
end
//stop issue alu inst
assign iu_idu_ex1_pipe1_mult_stall    = mult_ex1_inst_vld;

//----------------------------------------------------------
//               Pipe1 EX1 Instruction Data
//----------------------------------------------------------
always @(posedge ex1_inst_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    mult_ex1_dst_preg[6:0]        <= 7'b0;
    mult_ex1_rslt_sel[1:0]        <= 2'b0;
    mult_ex1_sub                  <= 1'b0;
    mult_ex1_src2_h               <= 1'b0;
    mult_ex1_mla                  <= 1'b0;
    mult_ex1_src0[64:0]           <= 65'b0;
    mult_ex1_src1[64:0]           <= 65'b0;
    mult_ex1_src2[64:0]           <= 65'b0;
    mult_ex1_src2_ex1_sel_ex4     <= 1'b0;
    mult_ex1_src2_ex1_sel_ex3     <= 1'b0;
    mult_ex1_src2_ex2_sel_ex3     <= 1'b0;
  end
  else if(idu_iu_rf_mult_gateclk_sel) begin
    mult_ex1_dst_preg[6:0]        <= idu_iu_rf_pipe1_dst_preg[6:0];
    mult_ex1_rslt_sel[1:0]        <= idu_iu_rf_pipe1_mult_func[1:0];
    mult_ex1_sub                  <= idu_iu_rf_pipe1_mult_func[7];
    mult_ex1_src2_h               <= idu_iu_rf_pipe1_mult_func[6];
    mult_ex1_mla                  <= idu_iu_rf_pipe1_mla_src2_vld;
    mult_ex1_src0[64:0]           <= mult_rf_src0[64:0];
    mult_ex1_src1[64:0]           <= mult_rf_src1[64:0];
    mult_ex1_src2[64:0]           <= mult_rf_src2[64:0];
    mult_ex1_src2_ex1_sel_ex4     <= mult_rf_mla_match_ex3;
    mult_ex1_src2_ex1_sel_ex3     <= mult_rf_mla_match_ex2;
    mult_ex1_src2_ex2_sel_ex3     <= mult_rf_mla_match_ex1;
  end
  else begin
    mult_ex1_dst_preg[6:0]        <= mult_ex1_dst_preg[6:0];
    mult_ex1_rslt_sel[1:0]        <= mult_ex1_rslt_sel[1:0];
    mult_ex1_sub                  <= mult_ex1_sub;
    mult_ex1_src2_h               <= mult_ex1_src2_h;
    mult_ex1_mla                  <= mult_ex1_mla;
    mult_ex1_src0[64:0]           <= mult_ex1_src0[64:0];
    mult_ex1_src1[64:0]           <= mult_ex1_src1[64:0];
    mult_ex1_src2[64:0]           <= mult_ex1_src2[64:0];
    mult_ex1_src2_ex1_sel_ex4     <= mult_ex1_src2_ex1_sel_ex4;
    mult_ex1_src2_ex1_sel_ex3     <= mult_ex1_src2_ex1_sel_ex3;
    mult_ex1_src2_ex2_sel_ex3     <= mult_ex1_src2_ex2_sel_ex3;
  end
end

//----------------------------------------------------------
//               Pipe1 EX1 Internal Forward
//----------------------------------------------------------
assign mult_ex1_src2_ex1_sel_ex1 = !(mult_ex1_src2_ex1_sel_ex3
                                  || mult_ex1_src2_ex1_sel_ex4);

// &CombBeg; @215
always @( mult_ex1_src2[64:0]
       or mult_ex1_src2_ex1_sel_ex4
       or mult_ex1_src2_ex1_sel_ex3
       or mult_ex4_src2_fwd_data[64:0]
       or mult_ex1_src2_ex1_sel_ex1
       or mult_ex3_src2_fwd_data[64:0])
begin
  case({mult_ex1_src2_ex1_sel_ex4,
        mult_ex1_src2_ex1_sel_ex3,
        mult_ex1_src2_ex1_sel_ex1})
    3'b001:  mult_ex1_pipedown_src2[64:0] = mult_ex1_src2[64:0];
    3'b010:  mult_ex1_pipedown_src2[64:0] = mult_ex3_src2_fwd_data[64:0];
    3'b100:  mult_ex1_pipedown_src2[64:0] = mult_ex4_src2_fwd_data[64:0];
    default: mult_ex1_pipedown_src2[64:0] = {65{1'bx}};
  endcase
// &CombEnd; @224
end

//----------------------------------------------------------
//              Pipe1 EX2 Instruction valid
//----------------------------------------------------------
always @(posedge mult_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    mult_ex2_inst_vld          <= 1'b0;
    mult_ex2_inst_vld_dup[4:0] <= 5'b0;
  end
  else if(rtu_yy_xx_flush) begin
    mult_ex2_inst_vld          <= 1'b0;
    mult_ex2_inst_vld_dup[4:0] <= 5'b0;
  end
  else begin
    mult_ex2_inst_vld          <= mult_ex1_inst_vld;
    mult_ex2_inst_vld_dup[4:0] <= {5{mult_ex1_inst_vld}};
  end
end
//indicate result ready
assign iu_idu_ex2_pipe1_mult_inst_vld_dup0 = mult_ex2_inst_vld_dup[0];
assign iu_idu_ex2_pipe1_mult_inst_vld_dup1 = mult_ex2_inst_vld_dup[1];
assign iu_idu_ex2_pipe1_mult_inst_vld_dup2 = mult_ex2_inst_vld_dup[2];
assign iu_idu_ex2_pipe1_mult_inst_vld_dup3 = mult_ex2_inst_vld_dup[3];
assign iu_idu_ex2_pipe1_mult_inst_vld_dup4 = mult_ex2_inst_vld_dup[4];

//----------------------------------------------------------
//               Pipe1 EX2 Instruction Data
//----------------------------------------------------------
always @(posedge ex2_inst_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    mult_ex2_dst_preg[6:0]        <= 7'b0;
    mult_ex2_dst_preg_dup0[6:0]   <= 7'b0;
    mult_ex2_dst_preg_dup1[6:0]   <= 7'b0;
    mult_ex2_dst_preg_dup2[6:0]   <= 7'b0;
    mult_ex2_dst_preg_dup3[6:0]   <= 7'b0;
    mult_ex2_dst_preg_dup4[6:0]   <= 7'b0;
    mult_ex2_rslt_sel[1:0]        <= 2'b0;
    mult_ex2_src2[64:0]           <= 65'b0;
    mult_ex2_src2_h               <= 1'b0;
    mult_ex2_mla                  <= 1'b0;
    mult_ex2_src2_ex2_sel_ex3     <= 1'b0;
  end
  else if(mult_ex1_inst_vld) begin
    mult_ex2_dst_preg[6:0]        <= mult_ex1_dst_preg[6:0];
    mult_ex2_dst_preg_dup0[6:0]   <= mult_ex1_dst_preg[6:0];
    mult_ex2_dst_preg_dup1[6:0]   <= mult_ex1_dst_preg[6:0];
    mult_ex2_dst_preg_dup2[6:0]   <= mult_ex1_dst_preg[6:0];
    mult_ex2_dst_preg_dup3[6:0]   <= mult_ex1_dst_preg[6:0];
    mult_ex2_dst_preg_dup4[6:0]   <= mult_ex1_dst_preg[6:0];
    mult_ex2_rslt_sel[1:0]        <= mult_ex1_rslt_sel[1:0];
    mult_ex2_src2[64:0]           <= mult_ex1_pipedown_src2[64:0];
    mult_ex2_src2_h               <= mult_ex1_src2_h;
    mult_ex2_mla                  <= mult_ex1_mla;
    mult_ex2_src2_ex2_sel_ex3     <= mult_ex1_src2_ex2_sel_ex3;
  end
  else begin
    mult_ex2_dst_preg[6:0]        <= mult_ex2_dst_preg[6:0];
    mult_ex2_dst_preg_dup0[6:0]   <= mult_ex2_dst_preg_dup0[6:0];
    mult_ex2_dst_preg_dup1[6:0]   <= mult_ex2_dst_preg_dup1[6:0];
    mult_ex2_dst_preg_dup2[6:0]   <= mult_ex2_dst_preg_dup2[6:0];
    mult_ex2_dst_preg_dup3[6:0]   <= mult_ex2_dst_preg_dup3[6:0];
    mult_ex2_dst_preg_dup4[6:0]   <= mult_ex2_dst_preg_dup4[6:0];
    mult_ex2_rslt_sel[1:0]        <= mult_ex2_rslt_sel[1:0];
    mult_ex2_src2[64:0]           <= mult_ex2_src2[64:0];
    mult_ex2_src2_h               <= mult_ex2_src2_h;
    mult_ex2_mla                  <= mult_ex2_mla;
    mult_ex2_src2_ex2_sel_ex3     <= mult_ex2_src2_ex2_sel_ex3;
  end
end

assign iu_idu_ex2_pipe1_preg_dup0[6:0] = mult_ex2_dst_preg_dup0[6:0];
assign iu_idu_ex2_pipe1_preg_dup1[6:0] = mult_ex2_dst_preg_dup1[6:0];
assign iu_idu_ex2_pipe1_preg_dup2[6:0] = mult_ex2_dst_preg_dup2[6:0];
assign iu_idu_ex2_pipe1_preg_dup3[6:0] = mult_ex2_dst_preg_dup3[6:0];
assign iu_idu_ex2_pipe1_preg_dup4[6:0] = mult_ex2_dst_preg_dup4[6:0];

//----------------------------------------------------------
//               Pipe1 EX2 Internal Forward
//----------------------------------------------------------
assign mult_ex2_src2_fwd_data[64:0] = mult_ex2_src2_ex2_sel_ex3
                                      ? mult_ex3_src2_fwd_data[64:0]
                                      : mult_ex2_src2[64:0];

assign mult_ex2_src2_data[64:32]    = mult_ex2_src2_h
                                      ? mult_ex2_src2_fwd_data[64:32] : 33'b0;
assign mult_ex2_src2_data[31:0]     = mult_ex2_src2_fwd_data[31:0];

//----------------------------------------------------------
//              Pipe1 EX3 Instruction valid
//----------------------------------------------------------
always @(posedge mult_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    mult_ex3_inst_vld <= 1'b0;
  else if(rtu_yy_xx_flush)
    mult_ex3_inst_vld <= 1'b0;
  else
    mult_ex3_inst_vld <= mult_ex2_inst_vld;
end

assign mult_rbus_ex3_data_vld = mult_ex3_inst_vld;

//----------------------------------------------------------
//               Pipe1 EX3 Instruction Data
//----------------------------------------------------------
always @(posedge ex3_inst_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    mult_ex3_dst_preg[6:0]        <= 7'b0;
    mult_ex3_rslt_sel[1:0]        <= 2'b0;
    mult_ex3_mla                  <= 1'b0;
  end
  else if(mult_ex2_inst_vld) begin
    mult_ex3_dst_preg[6:0]        <= mult_ex2_dst_preg[6:0];
    mult_ex3_rslt_sel[1:0]        <= mult_ex2_rslt_sel[1:0];
    mult_ex3_mla                  <= mult_ex2_mla;
  end
  else begin
    mult_ex3_dst_preg[6:0]        <= mult_ex3_dst_preg[6:0];
    mult_ex3_rslt_sel[1:0]        <= mult_ex3_rslt_sel[1:0];
    mult_ex3_mla                  <= mult_ex3_mla;
  end
end

assign mult_rbus_ex3_preg[6:0] = mult_ex3_dst_preg[6:0];

//----------------------------------------------------------
//              Pipe1 EX4 Instruction valid
//----------------------------------------------------------
always @(posedge mult_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    mult_ex4_inst_vld <= 1'b0;
  else if(rtu_yy_xx_flush)
    mult_ex4_inst_vld <= 1'b0;
  else
    mult_ex4_inst_vld <= mult_ex3_inst_vld;
end

assign mult_rbus_ex4_data_vld = mult_ex4_inst_vld;

//----------------------------------------------------------
//               Pipe1 EX4 Instruction Data
//----------------------------------------------------------
always @(posedge ex4_inst_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    mult_ex4_dst_preg[6:0]        <= 7'b0;
    mult_ex4_rslt_sel[1:0]        <= 2'b0;
  end
  else if(mult_ex3_inst_vld) begin
    mult_ex4_dst_preg[6:0]        <= mult_ex3_dst_preg[6:0];
    mult_ex4_rslt_sel[1:0]        <= mult_ex3_rslt_sel[1:0];
  end
  else begin
    mult_ex4_dst_preg[6:0]        <= mult_ex4_dst_preg[6:0];
    mult_ex4_rslt_sel[1:0]        <= mult_ex4_rslt_sel[1:0];
  end
end

//----------------------------------------------------------
//               Pipe1 EX4 Instruction Data
//----------------------------------------------------------
always @(posedge ex4_inst_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    mult_ex4_result[127:0]        <= 128'b0;
  end
  else if(mult_ex3_inst_vld) begin
    mult_ex4_result[127:0]        <= mult_multiplier_result[127:0];
  end
  else begin
    mult_ex4_result[127:0]        <= mult_ex4_result[127:0];
  end
end

assign mult_ex4_src2_fwd_data[64:0] = {mult_ex4_result[63],
                                       mult_ex4_result[63:0]};

//==========================================================
//           EX1~EX3 Design Ware 65x65 multiplier
//    this multiplier cross from ex1 stage to ex3 stage
//==========================================================
// &Force("nonport", "mult_multiplier_result"); @410
// &Force("bus","mult_multiplier_result",129,0); @411

// &Instance("multiplier_65x65_3_stage", "x_ct_iu_mult_multiplier_65x65_3_stage"); @413
multiplier_65x65_3_stage  x_ct_iu_mult_multiplier_65x65_3_stage (
  .addend                        (mult_ex2_src2_data[64:0]     ),
  .cpurst_b                      (cpurst_b                     ),
  .multiplicand                  (mult_ex1_src0[64:0]          ),
  .multiplier                    (mult_ex1_src1[64:0]          ),
  .pipe1_clk                     (ex2_inst_clk                 ),
  .pipe1_down                    (mult_ex1_inst_vld            ),
  .pipe2_clk                     (ex3_inst_clk                 ),
  .pipe2_down                    (mult_ex2_inst_vld            ),
  .product                       (mult_multiplier_result[129:0]),
  .sub_vld                       (mult_ex1_sub                 )
);

// &Connect(.pipe1_clk    (ex2_inst_clk), @414
//          .pipe2_clk    (ex3_inst_clk), @415
//          .pipe1_down   (mult_ex1_inst_vld), @416
//          .pipe2_down   (mult_ex2_inst_vld), @417
//          .sub_vld      (mult_ex1_sub), @418
//          .multiplicand (mult_ex1_src0[64:0]), @419
//          .multiplier   (mult_ex1_src1[64:0]), @420
//          .addend       (mult_ex2_src2_data[64:0]), @421
//          .product      (mult_multiplier_result[129:0]) @422
//         ); @423

assign mult_ex3_src2_fwd_data[64:0] = {mult_multiplier_result[63],
                                       mult_multiplier_result[63:0]};

//==========================================================
//                 EX4 Result Selection
//==========================================================
// &CombBeg; @431
always @( mult_ex4_result[127:0]
       or mult_ex4_result[31:0]
       or mult_ex4_rslt_sel[1:0])
begin
  case (mult_ex4_rslt_sel[1:0])
    2'b00  : mult_rbus_ex4_data[63:0] = mult_ex4_result[63:0];
    2'b01  : mult_rbus_ex4_data[63:0] = mult_ex4_result[127:64];
    2'b10  : mult_rbus_ex4_data[63:0] = {{32{mult_ex4_result[31]}},
                                             mult_ex4_result[31:0]};
    default: mult_rbus_ex4_data[63:0] = {64{1'bx}};
  endcase
// &CombEnd; @439
end

// &ModuleEnd; @441
endmodule


