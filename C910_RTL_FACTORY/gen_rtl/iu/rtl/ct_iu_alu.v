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

// &ModuleBeg; @28
module ct_iu_alu(
  alu_rbus_ex1_pipex_data,
  alu_rbus_ex1_pipex_data_vld,
  alu_rbus_ex1_pipex_fwd_data,
  alu_rbus_ex1_pipex_fwd_vld,
  alu_rbus_ex1_pipex_preg,
  cp0_iu_icg_en,
  cp0_yy_clk_en,
  cpurst_b,
  forever_cpuclk,
  had_idu_wbbr_data,
  had_idu_wbbr_vld,
  idu_iu_rf_pipex_alu_short,
  idu_iu_rf_pipex_dst_preg,
  idu_iu_rf_pipex_dst_vld,
  idu_iu_rf_pipex_dst_vreg,
  idu_iu_rf_pipex_dstv_vld,
  idu_iu_rf_pipex_func,
  idu_iu_rf_pipex_gateclk_sel,
  idu_iu_rf_pipex_imm,
  idu_iu_rf_pipex_rslt_sel,
  idu_iu_rf_pipex_sel,
  idu_iu_rf_pipex_src0,
  idu_iu_rf_pipex_src1,
  idu_iu_rf_pipex_src2,
  idu_iu_rf_pipex_vl,
  idu_iu_rf_pipex_vlmul,
  idu_iu_rf_pipex_vsew,
  iu_vfpu_ex1_pipex_mtvr_inst,
  iu_vfpu_ex1_pipex_mtvr_vl,
  iu_vfpu_ex1_pipex_mtvr_vld,
  iu_vfpu_ex1_pipex_mtvr_vlmul,
  iu_vfpu_ex1_pipex_mtvr_vreg,
  iu_vfpu_ex1_pipex_mtvr_vsew,
  iu_vfpu_ex2_pipex_mtvr_src0,
  iu_vfpu_ex2_pipex_mtvr_vld,
  pad_yy_icg_scan_en,
  rtu_yy_xx_flush
);

// &Ports; @29
input            cp0_iu_icg_en;               
input            cp0_yy_clk_en;               
input            cpurst_b;                    
input            forever_cpuclk;              
input   [63 :0]  had_idu_wbbr_data;           
input            had_idu_wbbr_vld;            
input            idu_iu_rf_pipex_alu_short;   
input   [6  :0]  idu_iu_rf_pipex_dst_preg;    
input            idu_iu_rf_pipex_dst_vld;     
input   [6  :0]  idu_iu_rf_pipex_dst_vreg;    
input            idu_iu_rf_pipex_dstv_vld;    
input   [4  :0]  idu_iu_rf_pipex_func;        
input            idu_iu_rf_pipex_gateclk_sel; 
input   [5  :0]  idu_iu_rf_pipex_imm;         
input   [20 :0]  idu_iu_rf_pipex_rslt_sel;    
input            idu_iu_rf_pipex_sel;         
input   [63 :0]  idu_iu_rf_pipex_src0;        
input   [63 :0]  idu_iu_rf_pipex_src1;        
input   [63 :0]  idu_iu_rf_pipex_src2;        
input   [7  :0]  idu_iu_rf_pipex_vl;          
input   [1  :0]  idu_iu_rf_pipex_vlmul;       
input   [2  :0]  idu_iu_rf_pipex_vsew;        
input            pad_yy_icg_scan_en;          
input            rtu_yy_xx_flush;             
output  [63 :0]  alu_rbus_ex1_pipex_data;     
output           alu_rbus_ex1_pipex_data_vld; 
output  [63 :0]  alu_rbus_ex1_pipex_fwd_data; 
output           alu_rbus_ex1_pipex_fwd_vld;  
output  [6  :0]  alu_rbus_ex1_pipex_preg;     
output  [4  :0]  iu_vfpu_ex1_pipex_mtvr_inst; 
output  [7  :0]  iu_vfpu_ex1_pipex_mtvr_vl;   
output           iu_vfpu_ex1_pipex_mtvr_vld;  
output  [1  :0]  iu_vfpu_ex1_pipex_mtvr_vlmul; 
output  [6  :0]  iu_vfpu_ex1_pipex_mtvr_vreg; 
output  [2  :0]  iu_vfpu_ex1_pipex_mtvr_vsew; 
output  [63 :0]  iu_vfpu_ex2_pipex_mtvr_src0; 
output           iu_vfpu_ex2_pipex_mtvr_vld;  

// &Regs; @30
reg     [63 :0]  adder_addsl_src1;            
reg     [4  :0]  alu_ex1_adder_func;          
reg     [63 :0]  alu_ex1_adder_fwd_data;      
reg     [63 :0]  alu_ex1_adder_src0;          
reg     [63 :0]  alu_ex1_adder_src1;          
reg              alu_ex1_alu_short;           
reg     [6  :0]  alu_ex1_dst_preg;            
reg              alu_ex1_dst_vld;             
reg     [6  :0]  alu_ex1_dst_vreg;            
reg              alu_ex1_dstv_vld;            
reg     [2  :0]  alu_ex1_eu_sel;              
reg     [4  :0]  alu_ex1_func;                
reg     [63 :0]  alu_ex1_fwd_data;            
reg              alu_ex1_fwd_vld;             
reg     [5  :0]  alu_ex1_imm;                 
reg              alu_ex1_inst_vld;            
reg     [63 :0]  alu_ex1_long_data;           
reg     [63 :0]  alu_ex1_other_fwd_data;      
reg     [20 :0]  alu_ex1_rslt_sel;            
reg     [4  :0]  alu_ex1_shifter_func;        
reg     [63 :0]  alu_ex1_shifter_fwd_data;    
reg     [63 :0]  alu_ex1_shifter_src0;        
reg     [63 :0]  alu_ex1_shifter_src1;        
reg     [63 :0]  alu_ex1_src0;                
reg     [63 :0]  alu_ex1_src1;                
reg     [63 :0]  alu_ex1_src2;                
reg     [7  :0]  alu_ex1_vl;                  
reg     [1  :0]  alu_ex1_vlmul;               
reg     [2  :0]  alu_ex1_vsew;                
reg     [63 :0]  misc_ex2_mtvr_src0;          
reg              misc_ex2_mtvr_vld;           
reg     [63 :0]  misc_ff1_rslt;               
reg              misc_tst_rslt;               
reg              shifter_ext_sign;            
reg     [63 :0]  shifter_extu_mask;           

// &Wires; @31
wire    [63 :0]  adder_addsl_rslt;            
wire    [63 :0]  adder_data_out_add;          
wire    [31 :0]  adder_data_out_addw;         
wire    [63 :0]  adder_data_out_sub;          
wire    [31 :0]  adder_data_out_subw;         
wire             adder_inst_cmp_unsign;       
wire    [63 :0]  adder_rslt_max;              
wire    [31 :0]  adder_rslt_maxw;             
wire    [63 :0]  adder_rslt_min;              
wire    [31 :0]  adder_rslt_minw;             
wire             adder_rslt_slt;              
wire             adder_slts;                  
wire             adder_sltsw;                 
wire             adder_sltu;                  
wire             adder_sltuw;                 
wire             adder_sltw;                  
wire    [63 :0]  alu_rbus_ex1_pipex_data;     
wire             alu_rbus_ex1_pipex_data_vld; 
wire    [63 :0]  alu_rbus_ex1_pipex_fwd_data; 
wire             alu_rbus_ex1_pipex_fwd_vld;  
wire    [6  :0]  alu_rbus_ex1_pipex_preg;     
wire             alu_rf_fwd_vld;              
wire             cp0_iu_icg_en;               
wire             cp0_yy_clk_en;               
wire             cpurst_b;                    
wire             ctrl_clk;                    
wire             ctrl_clk_en;                 
wire             ex1_inst_clk;                
wire             ex1_inst_clk_en;             
wire             ex2_inst_clk;                
wire             ex2_inst_clk_en;             
wire             forever_cpuclk;              
wire    [63 :0]  had_idu_wbbr_data;           
wire             had_idu_wbbr_vld;            
wire             idu_iu_rf_pipex_alu_short;   
wire    [6  :0]  idu_iu_rf_pipex_dst_preg;    
wire             idu_iu_rf_pipex_dst_vld;     
wire    [6  :0]  idu_iu_rf_pipex_dst_vreg;    
wire             idu_iu_rf_pipex_dstv_vld;    
wire    [2  :0]  idu_iu_rf_pipex_eu_sel;      
wire    [4  :0]  idu_iu_rf_pipex_func;        
wire             idu_iu_rf_pipex_gateclk_sel; 
wire    [5  :0]  idu_iu_rf_pipex_imm;         
wire    [20 :0]  idu_iu_rf_pipex_rslt_sel;    
wire             idu_iu_rf_pipex_sel;         
wire    [63 :0]  idu_iu_rf_pipex_src0;        
wire    [63 :0]  idu_iu_rf_pipex_src1;        
wire    [63 :0]  idu_iu_rf_pipex_src2;        
wire    [7  :0]  idu_iu_rf_pipex_vl;          
wire    [1  :0]  idu_iu_rf_pipex_vlmul;       
wire    [2  :0]  idu_iu_rf_pipex_vsew;        
wire    [4  :0]  iu_vfpu_ex1_pipex_mtvr_inst; 
wire    [7  :0]  iu_vfpu_ex1_pipex_mtvr_vl;   
wire             iu_vfpu_ex1_pipex_mtvr_vld;  
wire    [1  :0]  iu_vfpu_ex1_pipex_mtvr_vlmul; 
wire    [6  :0]  iu_vfpu_ex1_pipex_mtvr_vreg; 
wire    [2  :0]  iu_vfpu_ex1_pipex_mtvr_vsew; 
wire    [63 :0]  iu_vfpu_ex2_pipex_mtvr_src0; 
wire             iu_vfpu_ex2_pipex_mtvr_vld;  
wire    [63 :0]  logic_and_rslt;              
wire    [63 :0]  logic_cli_rslt;              
wire    [63 :0]  logic_lui_rslt;              
wire    [63 :0]  logic_or_rslt;               
wire    [63 :0]  logic_xor_rslt;              
wire             misc_ex1_mtvr_vld;           
wire    [63 :0]  misc_ff1_src;                
wire             misc_inst_ff0_sel;           
wire    [4  :0]  misc_inst_mtvr_inst;         
wire    [63 :0]  misc_mv_rslt;                
wire             misc_mv_sel;                 
wire    [63 :0]  misc_rev_rslt;               
wire    [31 :0]  misc_revw_rslt;              
wire             misc_src1_eq_0;              
wire    [63 :0]  misc_tstnbz_rslt;            
wire             pad_yy_icg_scan_en;          
wire             rtu_yy_xx_flush;             
wire    [63 :0]  shifter_ext_and_mask;        
wire             shifter_ext_and_sel_mask;    
wire             shifter_ext_exts;            
wire    [63 :0]  shifter_ext_or_mask;         
wire             shifter_ext_or_sel_mask;     
wire    [63 :0]  shifter_ext_rslt;            
wire    [63 :0]  shifter_ext_shift;           
wire    [63 :0]  shifter_l_rslt;              
wire    [31 :0]  shifter_lw_rslt;             
wire    [127:0]  shifter_r_rslt;              
wire    [63 :0]  shifter_r_shift_in;          
wire    [63 :0]  shifter_rw_rslt;             
wire    [31 :0]  shifter_rw_shift_in;         



//==========================================================
//                   Define ALU result
//==========================================================
parameter ALU_SEL = 21;

parameter ADDER_ADD   = 21'h000001;
parameter ADDER_ADDW  = 21'h000002;
parameter ADDER_SUB   = 21'h000004;
parameter ADDER_SUBW  = 21'h000008;
parameter ADDER_SLT   = 21'h000010;
parameter SHIFTER_SL  = 21'h000020;
parameter SHIFTER_SR  = 21'h000040;
parameter SHIFTER_SLW = 21'h000080;
parameter SHIFTER_SRW = 21'h000100;
parameter SHIFTER_EXT = 21'h000200;
parameter LOGIC_AND   = 21'h000400;
parameter LOGIC_OR    = 21'h000800;
parameter LOGIC_XOR   = 21'h001000;
parameter LOGIC_LUI   = 21'h002000;
parameter LOGIC_CLI   = 21'h004000;
parameter MISC_MV     = 21'h008000;
parameter MISC_TSTNBZ = 21'h010000;
parameter MISC_TST    = 21'h020000;
parameter MISC_FF1    = 21'h040000;
parameter MISC_REV    = 21'h080000;
parameter MISC_REVW   = 21'h100000;

parameter ADDER_MAX   = 21'h01;
parameter ADDER_MAXW  = 21'h02;
parameter ADDER_MIN   = 21'h04;
parameter ADDER_MINW  = 21'h08;
parameter ADDER_ADDSL = 21'h20;

//==========================================================
//                 RF/EX1 Pipeline Register
//==========================================================
//----------------------------------------------------------
//                 Instance of Gated Cell  
//----------------------------------------------------------
assign ctrl_clk_en = idu_iu_rf_pipex_gateclk_sel
                     || alu_ex1_inst_vld
                     || misc_ex2_mtvr_vld;
// &Instance("gated_clk_cell", "x_ctrl_gated_clk"); @76
gated_clk_cell  x_ctrl_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (ctrl_clk          ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (ctrl_clk_en       ),
  .module_en          (cp0_iu_icg_en     ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @77
//          .external_en (1'b0), @78
//          .global_en   (cp0_yy_clk_en), @79
//          .module_en   (cp0_iu_icg_en), @80
//          .local_en    (ctrl_clk_en), @81
//          .clk_out     (ctrl_clk)); @82

assign ex1_inst_clk_en = idu_iu_rf_pipex_gateclk_sel;
// &Instance("gated_clk_cell", "x_ex1_inst_gated_clk"); @85
gated_clk_cell  x_ex1_inst_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (ex1_inst_clk      ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (ex1_inst_clk_en   ),
  .module_en          (cp0_iu_icg_en     ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @86
//          .external_en (1'b0), @87
//          .global_en   (cp0_yy_clk_en), @88
//          .module_en   (cp0_iu_icg_en), @89
//          .local_en    (ex1_inst_clk_en), @90
//          .clk_out     (ex1_inst_clk)); @91

assign ex2_inst_clk_en = misc_ex1_mtvr_vld;
// &Instance("gated_clk_cell", "x_ex2_inst_gated_clk"); @94
gated_clk_cell  x_ex2_inst_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (ex2_inst_clk      ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (ex2_inst_clk_en   ),
  .module_en          (cp0_iu_icg_en     ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @95
//          .external_en (1'b0), @96
//          .global_en   (cp0_yy_clk_en), @97
//          .module_en   (cp0_iu_icg_en), @98
//          .local_en    (ex2_inst_clk_en), @99
//          .clk_out     (ex2_inst_clk)); @100

//----------------------------------------------------------
//              Pipe2 EX1 Instruction valid
//----------------------------------------------------------
assign alu_rf_fwd_vld = idu_iu_rf_pipex_sel
                        && idu_iu_rf_pipex_dst_vld
                        && idu_iu_rf_pipex_alu_short;

always @(posedge ctrl_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    alu_ex1_inst_vld <= 1'b0;
    alu_ex1_fwd_vld  <= 1'b0;
  end
  else if(rtu_yy_xx_flush) begin
    alu_ex1_inst_vld <= 1'b0;
    alu_ex1_fwd_vld  <= 1'b0;
  end
  else begin
    alu_ex1_inst_vld <= idu_iu_rf_pipex_sel;
    alu_ex1_fwd_vld  <= alu_rf_fwd_vld;
  end
end

//----------------------------------------------------------
//               Pipe2 EX1 Instruction Data
//----------------------------------------------------------
assign idu_iu_rf_pipex_eu_sel[0] = |idu_iu_rf_pipex_rslt_sel[4:0];
assign idu_iu_rf_pipex_eu_sel[1] = |idu_iu_rf_pipex_rslt_sel[9:5];
assign idu_iu_rf_pipex_eu_sel[2] = |idu_iu_rf_pipex_rslt_sel[ALU_SEL-1:10];

always @(posedge ex1_inst_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    alu_ex1_dst_vld               <= 1'b0;
    alu_ex1_dst_preg[6:0]         <= 7'b0;
    alu_ex1_dstv_vld              <= 1'b0;
    alu_ex1_dst_vreg[6:0]         <= 7'b0;
    alu_ex1_func[4:0]             <= 5'b0;
    alu_ex1_adder_func[4:0]       <= 5'b0;
    alu_ex1_shifter_func[4:0]     <= 5'b0;
    alu_ex1_src0[63:0]            <= 64'b0;
    alu_ex1_src1[63:0]            <= 64'b0;
    alu_ex1_adder_src0[63:0]      <= 64'b0;
    alu_ex1_adder_src1[63:0]      <= 64'b0;
    alu_ex1_shifter_src0[63:0]    <= 64'b0;
    alu_ex1_shifter_src1[63:0]    <= 64'b0;
    alu_ex1_src2[63:0]            <= 64'b0;
    alu_ex1_imm[5:0]              <= 6'b0;
    alu_ex1_alu_short             <= 1'b0;
    alu_ex1_rslt_sel[ALU_SEL-1:0] <= {ALU_SEL{1'b0}};
    alu_ex1_eu_sel[2:0]           <= 3'b0;
    alu_ex1_vlmul[1:0]            <= 2'b0;
    alu_ex1_vsew[2:0]             <= 3'b0;
    alu_ex1_vl[7:0]               <= 8'b0;
  end
  else if(idu_iu_rf_pipex_gateclk_sel) begin
    alu_ex1_dst_vld               <= idu_iu_rf_pipex_dst_vld;
    alu_ex1_dst_preg[6:0]         <= idu_iu_rf_pipex_dst_preg[6:0];
    alu_ex1_dstv_vld              <= idu_iu_rf_pipex_dstv_vld;
    alu_ex1_dst_vreg[6:0]         <= idu_iu_rf_pipex_dst_vreg[6:0];
    alu_ex1_func[4:0]             <= idu_iu_rf_pipex_func[4:0];
    alu_ex1_adder_func[4:0]       <= idu_iu_rf_pipex_func[4:0];
    alu_ex1_shifter_func[4:0]     <= idu_iu_rf_pipex_func[4:0];
    alu_ex1_src0[63:0]            <= idu_iu_rf_pipex_src0[63:0];
    alu_ex1_src1[63:0]            <= idu_iu_rf_pipex_src1[63:0];
    alu_ex1_adder_src0[63:0]      <= idu_iu_rf_pipex_src0[63:0];
    alu_ex1_adder_src1[63:0]      <= idu_iu_rf_pipex_src1[63:0];
    alu_ex1_shifter_src0[63:0]    <= idu_iu_rf_pipex_src0[63:0];
    alu_ex1_shifter_src1[63:0]    <= idu_iu_rf_pipex_src1[63:0];
    alu_ex1_src2[63:0]            <= idu_iu_rf_pipex_src2[63:0];
    alu_ex1_imm[5:0]              <= idu_iu_rf_pipex_imm[5:0];
    alu_ex1_alu_short             <= idu_iu_rf_pipex_alu_short;
    alu_ex1_rslt_sel[ALU_SEL-1:0] <= idu_iu_rf_pipex_rslt_sel[ALU_SEL-1:0];
    alu_ex1_eu_sel[2:0]           <= idu_iu_rf_pipex_eu_sel[2:0];
    alu_ex1_vlmul[1:0]            <= idu_iu_rf_pipex_vlmul[1:0];
    alu_ex1_vsew[2:0]             <= idu_iu_rf_pipex_vsew[2:0];
    alu_ex1_vl[7:0]               <= idu_iu_rf_pipex_vl[7:0];
  end
  else begin
    alu_ex1_dst_vld               <= alu_ex1_dst_vld;
    alu_ex1_dst_preg[6:0]         <= alu_ex1_dst_preg[6:0];
    alu_ex1_dstv_vld              <= alu_ex1_dstv_vld;
    alu_ex1_dst_vreg[6:0]         <= alu_ex1_dst_vreg[6:0];
    alu_ex1_func[4:0]             <= alu_ex1_func[4:0];
    alu_ex1_adder_func[4:0]       <= alu_ex1_adder_func[4:0];
    alu_ex1_shifter_func[4:0]     <= alu_ex1_shifter_func[4:0];
    alu_ex1_src0[63:0]            <= alu_ex1_src0[63:0];
    alu_ex1_src1[63:0]            <= alu_ex1_src1[63:0];
    alu_ex1_src2[63:0]            <= alu_ex1_src2[63:0];
    alu_ex1_adder_src0[63:0]      <= alu_ex1_adder_src0[63:0];
    alu_ex1_adder_src1[63:0]      <= alu_ex1_adder_src1[63:0];
    alu_ex1_shifter_src0[63:0]    <= alu_ex1_shifter_src0[63:0];
    alu_ex1_shifter_src1[63:0]    <= alu_ex1_shifter_src1[63:0];
    alu_ex1_imm[5:0]              <= alu_ex1_imm[5:0];
    alu_ex1_alu_short             <= alu_ex1_alu_short;
    alu_ex1_rslt_sel[ALU_SEL-1:0] <= alu_ex1_rslt_sel[ALU_SEL-1:0];
    alu_ex1_eu_sel[2:0]           <= alu_ex1_eu_sel[2:0];
    alu_ex1_vlmul[1:0]            <= alu_ex1_vlmul[1:0];
    alu_ex1_vsew[2:0]             <= alu_ex1_vsew[2:0];
    alu_ex1_vl[7:0]               <= alu_ex1_vl[7:0];
  end
end

//==========================================================
//                         Adder
//==========================================================
assign adder_inst_cmp_unsign = alu_ex1_adder_func[3];

//----------------------------------------------------------
//             64-bit carry in carry out adder
//----------------------------------------------------------
//adder0 for normal add
assign adder_data_out_add[63:0] = alu_ex1_adder_src0[63:0] + alu_ex1_adder_src1[63:0];
//adder1 for normal sub
assign adder_data_out_sub[63:0] = alu_ex1_adder_src0[63:0] - alu_ex1_adder_src1[63:0];
//adder1 for word width max/min
assign adder_data_out_subw[31:0] = alu_ex1_adder_src0[31:0] - alu_ex1_adder_src1[31:0];
//adder2 for word width add
assign adder_data_out_addw[31:0] = alu_ex1_adder_src0[31:0] + alu_ex1_adder_src1[31:0];

//----------------------------------------------------------
//                     add with shift
//----------------------------------------------------------
// &CombBeg; @225
always @( alu_ex1_adder_src1[63:0]
       or alu_ex1_imm[1:0])
begin
  case(alu_ex1_imm[1:0])
    2'b00  : adder_addsl_src1[63:0] = alu_ex1_adder_src1[63:0];
    2'b01  : adder_addsl_src1[63:0] = {alu_ex1_adder_src1[62:0],1'b0};
    2'b10  : adder_addsl_src1[63:0] = {alu_ex1_adder_src1[61:0],2'b0};
    2'b11  : adder_addsl_src1[63:0] = {alu_ex1_adder_src1[60:0],3'b0};
    default: adder_addsl_src1[63:0] = {64{1'bx}};
  endcase
// &CombEnd; @233
end

assign adder_addsl_rslt[63:0] = alu_ex1_adder_src0[63:0] + adder_addsl_src1[63:0];

//----------------------------------------------------------
//                  Compare and Result 
//----------------------------------------------------------
assign adder_sltu       =  alu_ex1_adder_src0[63:0] < alu_ex1_adder_src1[63:0];
assign adder_sltuw      =  alu_ex1_adder_src0[31:0] < alu_ex1_adder_src1[31:0];

// &Force ("nonport","adder_slts"); @243
// &Force ("nonport","adder_sltsw"); @244
//csky vperl_off
assign adder_slts  = $signed(alu_ex1_adder_src0[63:0]) < $signed(alu_ex1_adder_src1[63:0]);
assign adder_sltsw = $signed(alu_ex1_adder_src0[31:0]) < $signed(alu_ex1_adder_src1[31:0]);
//csky vperl_on

assign adder_rslt_slt  = adder_inst_cmp_unsign ? adder_sltu  : adder_slts;
assign adder_sltw      = adder_inst_cmp_unsign ? adder_sltuw : adder_sltsw;

//----------------------------------------------------------
//                       max / min
//----------------------------------------------------------
assign adder_rslt_max[63:0] = adder_rslt_slt ? alu_ex1_adder_src1[63:0] : alu_ex1_adder_src0[63:0];

assign adder_rslt_min[63:0] = adder_rslt_slt ? alu_ex1_adder_src0[63:0] : alu_ex1_adder_src1[63:0];

assign adder_rslt_maxw[31:0] = adder_sltw ? alu_ex1_adder_src1[31:0] : alu_ex1_adder_src0[31:0];

assign adder_rslt_minw[31:0] = adder_sltw ? alu_ex1_adder_src0[31:0] : alu_ex1_adder_src1[31:0];

//==========================================================
//                         Shifter
//==========================================================
//----------------------------------------------------------
//                      Left Shifters
//----------------------------------------------------------
assign shifter_l_rslt[63:0]  = alu_ex1_shifter_src0[63:0] << alu_ex1_shifter_src1[5:0];

assign shifter_lw_rslt[31:0] = alu_ex1_shifter_src0[31:0] << alu_ex1_shifter_src1[4:0];

//----------------------------------------------------------
//                     Right Shifters
//----------------------------------------------------------
assign shifter_r_shift_in[63:0]  = alu_ex1_shifter_src0[63:0] & {64{alu_ex1_shifter_func[4]}}
                                   | {64{alu_ex1_shifter_func[1] && alu_ex1_shifter_src0[63]}};

assign shifter_rw_shift_in[31:0] = alu_ex1_shifter_src0[31:0] & {32{alu_ex1_shifter_func[4]}}
                                   | {32{alu_ex1_shifter_func[1] && alu_ex1_shifter_src0[31]}};

assign shifter_r_rslt[127:0]     = {shifter_r_shift_in[63:0], alu_ex1_shifter_src0[63:0]}
                                   >> alu_ex1_shifter_src1[5:0];
assign shifter_rw_rslt[63:0]     = {shifter_rw_shift_in[31:0], alu_ex1_shifter_src0[31:0]}
                                   >> alu_ex1_shifter_src1[4:0];

//----------------------------------------------------------
//                        Extend 
//----------------------------------------------------------
// &CombBeg; @291
always @( alu_ex1_imm[5:0])
begin
  case(alu_ex1_imm[5:0])
    6'd0 :   shifter_extu_mask[63:0] = 64'h0000000000000001;
    6'd1 :   shifter_extu_mask[63:0] = 64'h0000000000000003;
    6'd2 :   shifter_extu_mask[63:0] = 64'h0000000000000007;
    6'd3 :   shifter_extu_mask[63:0] = 64'h000000000000000f;
    6'd4 :   shifter_extu_mask[63:0] = 64'h000000000000001f;
    6'd5 :   shifter_extu_mask[63:0] = 64'h000000000000003f;
    6'd6 :   shifter_extu_mask[63:0] = 64'h000000000000007f;
    6'd7 :   shifter_extu_mask[63:0] = 64'h00000000000000ff;
    6'd8 :   shifter_extu_mask[63:0] = 64'h00000000000001ff;
    6'd9 :   shifter_extu_mask[63:0] = 64'h00000000000003ff;
    6'd10:   shifter_extu_mask[63:0] = 64'h00000000000007ff;
    6'd11:   shifter_extu_mask[63:0] = 64'h0000000000000fff;
    6'd12:   shifter_extu_mask[63:0] = 64'h0000000000001fff;
    6'd13:   shifter_extu_mask[63:0] = 64'h0000000000003fff;
    6'd14:   shifter_extu_mask[63:0] = 64'h0000000000007fff;
    6'd15:   shifter_extu_mask[63:0] = 64'h000000000000ffff;
    6'd16:   shifter_extu_mask[63:0] = 64'h000000000001ffff;
    6'd17:   shifter_extu_mask[63:0] = 64'h000000000003ffff;
    6'd18:   shifter_extu_mask[63:0] = 64'h000000000007ffff;
    6'd19:   shifter_extu_mask[63:0] = 64'h00000000000fffff;
    6'd20:   shifter_extu_mask[63:0] = 64'h00000000001fffff;
    6'd21:   shifter_extu_mask[63:0] = 64'h00000000003fffff;
    6'd22:   shifter_extu_mask[63:0] = 64'h00000000007fffff;
    6'd23:   shifter_extu_mask[63:0] = 64'h0000000000ffffff;
    6'd24:   shifter_extu_mask[63:0] = 64'h0000000001ffffff;
    6'd25:   shifter_extu_mask[63:0] = 64'h0000000003ffffff;
    6'd26:   shifter_extu_mask[63:0] = 64'h0000000007ffffff;
    6'd27:   shifter_extu_mask[63:0] = 64'h000000000fffffff;
    6'd28:   shifter_extu_mask[63:0] = 64'h000000001fffffff;
    6'd29:   shifter_extu_mask[63:0] = 64'h000000003fffffff;
    6'd30:   shifter_extu_mask[63:0] = 64'h000000007fffffff;
    6'd31:   shifter_extu_mask[63:0] = 64'h00000000ffffffff;
    6'd32:   shifter_extu_mask[63:0] = 64'h00000001ffffffff;
    6'd33:   shifter_extu_mask[63:0] = 64'h00000003ffffffff;
    6'd34:   shifter_extu_mask[63:0] = 64'h00000007ffffffff;
    6'd35:   shifter_extu_mask[63:0] = 64'h0000000fffffffff;
    6'd36:   shifter_extu_mask[63:0] = 64'h0000001fffffffff;
    6'd37:   shifter_extu_mask[63:0] = 64'h0000003fffffffff;
    6'd38:   shifter_extu_mask[63:0] = 64'h0000007fffffffff;
    6'd39:   shifter_extu_mask[63:0] = 64'h000000ffffffffff;
    6'd40:   shifter_extu_mask[63:0] = 64'h000001ffffffffff;
    6'd41:   shifter_extu_mask[63:0] = 64'h000003ffffffffff;
    6'd42:   shifter_extu_mask[63:0] = 64'h000007ffffffffff;
    6'd43:   shifter_extu_mask[63:0] = 64'h00000fffffffffff;
    6'd44:   shifter_extu_mask[63:0] = 64'h00001fffffffffff;
    6'd45:   shifter_extu_mask[63:0] = 64'h00003fffffffffff;
    6'd46:   shifter_extu_mask[63:0] = 64'h00007fffffffffff;
    6'd47:   shifter_extu_mask[63:0] = 64'h0000ffffffffffff;
    6'd48:   shifter_extu_mask[63:0] = 64'h0001ffffffffffff;
    6'd49:   shifter_extu_mask[63:0] = 64'h0003ffffffffffff;
    6'd50:   shifter_extu_mask[63:0] = 64'h0007ffffffffffff;
    6'd51:   shifter_extu_mask[63:0] = 64'h000fffffffffffff;
    6'd52:   shifter_extu_mask[63:0] = 64'h001fffffffffffff;
    6'd53:   shifter_extu_mask[63:0] = 64'h003fffffffffffff;
    6'd54:   shifter_extu_mask[63:0] = 64'h007fffffffffffff;
    6'd55:   shifter_extu_mask[63:0] = 64'h00ffffffffffffff;
    6'd56:   shifter_extu_mask[63:0] = 64'h01ffffffffffffff;
    6'd57:   shifter_extu_mask[63:0] = 64'h03ffffffffffffff;
    6'd58:   shifter_extu_mask[63:0] = 64'h07ffffffffffffff;
    6'd59:   shifter_extu_mask[63:0] = 64'h0fffffffffffffff;
    6'd60:   shifter_extu_mask[63:0] = 64'h1fffffffffffffff;
    6'd61:   shifter_extu_mask[63:0] = 64'h3fffffffffffffff;
    6'd62:   shifter_extu_mask[63:0] = 64'h7fffffffffffffff;
    6'd63:   shifter_extu_mask[63:0] = 64'hffffffffffffffff;
    default: shifter_extu_mask[63:0] = {64{1'bx}};
  endcase
// &CombEnd; @359
end

// &CombBeg; @361
always @( alu_ex1_shifter_src0[37:30]
       or alu_ex1_shifter_src0[25:19]
       or alu_ex1_shifter_src0[29:26]
       or alu_ex1_shifter_src0[18:6]
       or alu_ex1_shifter_src0[51:38]
       or alu_ex1_shifter_src0[8:5]
       or alu_ex1_shifter_src0[34:31]
       or alu_ex1_shifter_src0[63:49]
       or alu_ex1_shifter_src0[4:0]
       or alu_ex1_shifter_src1[11:6])
begin
  case(alu_ex1_shifter_src1[11:6])
    6'd0 :   shifter_ext_sign = alu_ex1_shifter_src0[0];
    6'd1 :   shifter_ext_sign = alu_ex1_shifter_src0[1];
    6'd2 :   shifter_ext_sign = alu_ex1_shifter_src0[2];
    6'd3 :   shifter_ext_sign = alu_ex1_shifter_src0[3];
    6'd4 :   shifter_ext_sign = alu_ex1_shifter_src0[4];
    6'd5 :   shifter_ext_sign = alu_ex1_shifter_src0[5];
    6'd6 :   shifter_ext_sign = alu_ex1_shifter_src0[6];
    6'd7 :   shifter_ext_sign = alu_ex1_shifter_src0[7];
    6'd8 :   shifter_ext_sign = alu_ex1_shifter_src0[8];
    6'd9 :   shifter_ext_sign = alu_ex1_shifter_src0[9];
    6'd10:   shifter_ext_sign = alu_ex1_shifter_src0[10];
    6'd11:   shifter_ext_sign = alu_ex1_shifter_src0[11];
    6'd12:   shifter_ext_sign = alu_ex1_shifter_src0[12];
    6'd13:   shifter_ext_sign = alu_ex1_shifter_src0[13];
    6'd14:   shifter_ext_sign = alu_ex1_shifter_src0[14];
    6'd15:   shifter_ext_sign = alu_ex1_shifter_src0[15];
    6'd16:   shifter_ext_sign = alu_ex1_shifter_src0[16];
    6'd17:   shifter_ext_sign = alu_ex1_shifter_src0[17];
    6'd18:   shifter_ext_sign = alu_ex1_shifter_src0[18];
    6'd19:   shifter_ext_sign = alu_ex1_shifter_src0[19];
    6'd20:   shifter_ext_sign = alu_ex1_shifter_src0[20];
    6'd21:   shifter_ext_sign = alu_ex1_shifter_src0[21];
    6'd22:   shifter_ext_sign = alu_ex1_shifter_src0[22];
    6'd23:   shifter_ext_sign = alu_ex1_shifter_src0[23];
    6'd24:   shifter_ext_sign = alu_ex1_shifter_src0[24];
    6'd25:   shifter_ext_sign = alu_ex1_shifter_src0[25];
    6'd26:   shifter_ext_sign = alu_ex1_shifter_src0[26];
    6'd27:   shifter_ext_sign = alu_ex1_shifter_src0[27];
    6'd28:   shifter_ext_sign = alu_ex1_shifter_src0[28];
    6'd29:   shifter_ext_sign = alu_ex1_shifter_src0[29];
    6'd30:   shifter_ext_sign = alu_ex1_shifter_src0[30];
    6'd31:   shifter_ext_sign = alu_ex1_shifter_src0[31];
    6'd32:   shifter_ext_sign = alu_ex1_shifter_src0[32];
    6'd33:   shifter_ext_sign = alu_ex1_shifter_src0[33];
    6'd34:   shifter_ext_sign = alu_ex1_shifter_src0[34];
    6'd35:   shifter_ext_sign = alu_ex1_shifter_src0[35];
    6'd36:   shifter_ext_sign = alu_ex1_shifter_src0[36];
    6'd37:   shifter_ext_sign = alu_ex1_shifter_src0[37];
    6'd38:   shifter_ext_sign = alu_ex1_shifter_src0[38];
    6'd39:   shifter_ext_sign = alu_ex1_shifter_src0[39];
    6'd40:   shifter_ext_sign = alu_ex1_shifter_src0[40];
    6'd41:   shifter_ext_sign = alu_ex1_shifter_src0[41];
    6'd42:   shifter_ext_sign = alu_ex1_shifter_src0[42];
    6'd43:   shifter_ext_sign = alu_ex1_shifter_src0[43];
    6'd44:   shifter_ext_sign = alu_ex1_shifter_src0[44];
    6'd45:   shifter_ext_sign = alu_ex1_shifter_src0[45];
    6'd46:   shifter_ext_sign = alu_ex1_shifter_src0[46];
    6'd47:   shifter_ext_sign = alu_ex1_shifter_src0[47];
    6'd48:   shifter_ext_sign = alu_ex1_shifter_src0[48];
    6'd49:   shifter_ext_sign = alu_ex1_shifter_src0[49];
    6'd50:   shifter_ext_sign = alu_ex1_shifter_src0[50];
    6'd51:   shifter_ext_sign = alu_ex1_shifter_src0[51];
    6'd52:   shifter_ext_sign = alu_ex1_shifter_src0[52];
    6'd53:   shifter_ext_sign = alu_ex1_shifter_src0[53];
    6'd54:   shifter_ext_sign = alu_ex1_shifter_src0[54];
    6'd55:   shifter_ext_sign = alu_ex1_shifter_src0[55];
    6'd56:   shifter_ext_sign = alu_ex1_shifter_src0[56];
    6'd57:   shifter_ext_sign = alu_ex1_shifter_src0[57];
    6'd58:   shifter_ext_sign = alu_ex1_shifter_src0[58];
    6'd59:   shifter_ext_sign = alu_ex1_shifter_src0[59];
    6'd60:   shifter_ext_sign = alu_ex1_shifter_src0[60];
    6'd61:   shifter_ext_sign = alu_ex1_shifter_src0[61];
    6'd62:   shifter_ext_sign = alu_ex1_shifter_src0[62];
    6'd63:   shifter_ext_sign = alu_ex1_shifter_src0[63];
    default: shifter_ext_sign = 1'bx;
  endcase
// &CombEnd; @429
end

assign shifter_ext_exts           = alu_ex1_func[2];

assign shifter_ext_and_sel_mask   = shifter_ext_exts && !shifter_ext_sign
                                    || !shifter_ext_exts;

assign shifter_ext_and_mask[63:0] = shifter_ext_and_sel_mask
                                    ? shifter_extu_mask[63:0] : {64{1'b1}};

assign shifter_ext_or_sel_mask    = shifter_ext_exts && shifter_ext_sign;

assign shifter_ext_or_mask[63:0]  = shifter_ext_or_sel_mask
                                    ? ~shifter_extu_mask[63:0] : {64{1'b0}};

assign shifter_ext_shift[63:0]    = alu_ex1_shifter_src0[63:0] >> alu_ex1_shifter_src1[5:0];

assign shifter_ext_rslt[63:0]     = shifter_ext_shift[63:0]
                                    & shifter_ext_and_mask[63:0]
                                    | shifter_ext_or_mask[63:0];

//==========================================================
//                        Logic
//==========================================================
//----------------------------------------------------------
//                      Logic result
//----------------------------------------------------------
assign logic_and_rslt[63:0]    = alu_ex1_src0[63:0] & alu_ex1_src1[63:0];

assign logic_or_rslt[63:0]     = alu_ex1_src0[63:0] | alu_ex1_src1[63:0];

assign logic_xor_rslt[63:0]    = alu_ex1_src0[63:0] ^ alu_ex1_src1[63:0];

assign logic_lui_rslt[63:0]    = {{32{alu_ex1_src1[19]}},alu_ex1_src1[19:0],12'b0};

assign logic_cli_rslt[63:0]    = {{58{alu_ex1_src1[5]}},alu_ex1_src1[5:0]};

//==========================================================
//                          Misc
//==========================================================
//----------------------------------------------------------
//                        mv cond
//----------------------------------------------------------
assign misc_src1_eq_0 = (alu_ex1_src1[63:0] == 64'b0);

assign misc_mv_sel    = (alu_ex1_func[1:0] == 2'b00) && 1'b0 //cmv
                     || (alu_ex1_func[1:0] == 2'b10) && !misc_src1_eq_0 //mveqz
                     || (alu_ex1_func[1:0] == 2'b11) && misc_src1_eq_0; //mvnez

assign misc_mv_rslt[63:0]     = misc_mv_sel ? alu_ex1_src2[63:0]
                                            : alu_ex1_src0[63:0];

//----------------------------------------------------------
//                         tstnbz
//----------------------------------------------------------
assign misc_tstnbz_rslt[63:56] = (alu_ex1_src0[63:56] == 8'b0) ? 8'hff : 8'b0;
assign misc_tstnbz_rslt[55:48] = (alu_ex1_src0[55:48] == 8'b0) ? 8'hff : 8'b0;
assign misc_tstnbz_rslt[47:40] = (alu_ex1_src0[47:40] == 8'b0) ? 8'hff : 8'b0;
assign misc_tstnbz_rslt[39:32] = (alu_ex1_src0[39:32] == 8'b0) ? 8'hff : 8'b0;
assign misc_tstnbz_rslt[31:24] = (alu_ex1_src0[31:24] == 8'b0) ? 8'hff : 8'b0;
assign misc_tstnbz_rslt[23:16] = (alu_ex1_src0[23:16] == 8'b0) ? 8'hff : 8'b0;
assign misc_tstnbz_rslt[15:8]  = (alu_ex1_src0[15:8]  == 8'b0) ? 8'hff : 8'b0;
assign misc_tstnbz_rslt[7:0]   = (alu_ex1_src0[7:0]   == 8'b0) ? 8'hff : 8'b0;

//----------------------------------------------------------
//                          tst
//----------------------------------------------------------
// &CombBeg; @496
always @( alu_ex1_src0[18:13]
       or alu_ex1_src0[2:0]
       or alu_ex1_src0[63:44]
       or alu_ex1_src0[44:19]
       or alu_ex1_src1[5:0]
       or alu_ex1_src0[12:3])
begin
  case(alu_ex1_src1[5:0])
    6'd0 :   misc_tst_rslt = alu_ex1_src0[0];
    6'd1 :   misc_tst_rslt = alu_ex1_src0[1];
    6'd2 :   misc_tst_rslt = alu_ex1_src0[2];
    6'd3 :   misc_tst_rslt = alu_ex1_src0[3];
    6'd4 :   misc_tst_rslt = alu_ex1_src0[4];
    6'd5 :   misc_tst_rslt = alu_ex1_src0[5];
    6'd6 :   misc_tst_rslt = alu_ex1_src0[6];
    6'd7 :   misc_tst_rslt = alu_ex1_src0[7];
    6'd8 :   misc_tst_rslt = alu_ex1_src0[8];
    6'd9 :   misc_tst_rslt = alu_ex1_src0[9];
    6'd10:   misc_tst_rslt = alu_ex1_src0[10];
    6'd11:   misc_tst_rslt = alu_ex1_src0[11];
    6'd12:   misc_tst_rslt = alu_ex1_src0[12];
    6'd13:   misc_tst_rslt = alu_ex1_src0[13];
    6'd14:   misc_tst_rslt = alu_ex1_src0[14];
    6'd15:   misc_tst_rslt = alu_ex1_src0[15];
    6'd16:   misc_tst_rslt = alu_ex1_src0[16];
    6'd17:   misc_tst_rslt = alu_ex1_src0[17];
    6'd18:   misc_tst_rslt = alu_ex1_src0[18];
    6'd19:   misc_tst_rslt = alu_ex1_src0[19];
    6'd20:   misc_tst_rslt = alu_ex1_src0[20];
    6'd21:   misc_tst_rslt = alu_ex1_src0[21];
    6'd22:   misc_tst_rslt = alu_ex1_src0[22];
    6'd23:   misc_tst_rslt = alu_ex1_src0[23];
    6'd24:   misc_tst_rslt = alu_ex1_src0[24];
    6'd25:   misc_tst_rslt = alu_ex1_src0[25];
    6'd26:   misc_tst_rslt = alu_ex1_src0[26];
    6'd27:   misc_tst_rslt = alu_ex1_src0[27];
    6'd28:   misc_tst_rslt = alu_ex1_src0[28];
    6'd29:   misc_tst_rslt = alu_ex1_src0[29];
    6'd30:   misc_tst_rslt = alu_ex1_src0[30];
    6'd31:   misc_tst_rslt = alu_ex1_src0[31];
    6'd32:   misc_tst_rslt = alu_ex1_src0[32];
    6'd33:   misc_tst_rslt = alu_ex1_src0[33];
    6'd34:   misc_tst_rslt = alu_ex1_src0[34];
    6'd35:   misc_tst_rslt = alu_ex1_src0[35];
    6'd36:   misc_tst_rslt = alu_ex1_src0[36];
    6'd37:   misc_tst_rslt = alu_ex1_src0[37];
    6'd38:   misc_tst_rslt = alu_ex1_src0[38];
    6'd39:   misc_tst_rslt = alu_ex1_src0[39];
    6'd40:   misc_tst_rslt = alu_ex1_src0[40];
    6'd41:   misc_tst_rslt = alu_ex1_src0[41];
    6'd42:   misc_tst_rslt = alu_ex1_src0[42];
    6'd43:   misc_tst_rslt = alu_ex1_src0[43];
    6'd44:   misc_tst_rslt = alu_ex1_src0[44];
    6'd45:   misc_tst_rslt = alu_ex1_src0[45];
    6'd46:   misc_tst_rslt = alu_ex1_src0[46];
    6'd47:   misc_tst_rslt = alu_ex1_src0[47];
    6'd48:   misc_tst_rslt = alu_ex1_src0[48];
    6'd49:   misc_tst_rslt = alu_ex1_src0[49];
    6'd50:   misc_tst_rslt = alu_ex1_src0[50];
    6'd51:   misc_tst_rslt = alu_ex1_src0[51];
    6'd52:   misc_tst_rslt = alu_ex1_src0[52];
    6'd53:   misc_tst_rslt = alu_ex1_src0[53];
    6'd54:   misc_tst_rslt = alu_ex1_src0[54];
    6'd55:   misc_tst_rslt = alu_ex1_src0[55];
    6'd56:   misc_tst_rslt = alu_ex1_src0[56];
    6'd57:   misc_tst_rslt = alu_ex1_src0[57];
    6'd58:   misc_tst_rslt = alu_ex1_src0[58];
    6'd59:   misc_tst_rslt = alu_ex1_src0[59];
    6'd60:   misc_tst_rslt = alu_ex1_src0[60];
    6'd61:   misc_tst_rslt = alu_ex1_src0[61];
    6'd62:   misc_tst_rslt = alu_ex1_src0[62];
    6'd63:   misc_tst_rslt = alu_ex1_src0[63];
    default: misc_tst_rslt = 1'bx;
  endcase
// &CombEnd; @564
end

//----------------------------------------------------------
//                     ff1 / ff0
//----------------------------------------------------------
assign misc_inst_ff0_sel  = alu_ex1_func[0];

assign misc_ff1_src[63:0] = (misc_inst_ff0_sel) ? ~alu_ex1_src0[63:0]
                                                :  alu_ex1_src0[63:0];
// execution of FF1
// &CombBeg; @574
always @( misc_ff1_src[63:0])
begin
  casez(misc_ff1_src[63:0])
    64'b1???????????????????????????????????????????????????????????????: misc_ff1_rslt[63:0] = 64'd0;
    64'b01??????????????????????????????????????????????????????????????: misc_ff1_rslt[63:0] = 64'd1;
    64'b001?????????????????????????????????????????????????????????????: misc_ff1_rslt[63:0] = 64'd2;
    64'b0001????????????????????????????????????????????????????????????: misc_ff1_rslt[63:0] = 64'd3;
    64'b00001???????????????????????????????????????????????????????????: misc_ff1_rslt[63:0] = 64'd4;
    64'b000001??????????????????????????????????????????????????????????: misc_ff1_rslt[63:0] = 64'd5;
    64'b0000001?????????????????????????????????????????????????????????: misc_ff1_rslt[63:0] = 64'd6;
    64'b00000001????????????????????????????????????????????????????????: misc_ff1_rslt[63:0] = 64'd7;
    64'b000000001???????????????????????????????????????????????????????: misc_ff1_rslt[63:0] = 64'd8;
    64'b0000000001??????????????????????????????????????????????????????: misc_ff1_rslt[63:0] = 64'd9;
    64'b00000000001?????????????????????????????????????????????????????: misc_ff1_rslt[63:0] = 64'd10;
    64'b000000000001????????????????????????????????????????????????????: misc_ff1_rslt[63:0] = 64'd11;
    64'b0000000000001???????????????????????????????????????????????????: misc_ff1_rslt[63:0] = 64'd12;
    64'b00000000000001??????????????????????????????????????????????????: misc_ff1_rslt[63:0] = 64'd13;
    64'b000000000000001?????????????????????????????????????????????????: misc_ff1_rslt[63:0] = 64'd14;
    64'b0000000000000001????????????????????????????????????????????????: misc_ff1_rslt[63:0] = 64'd15;
    64'b00000000000000001???????????????????????????????????????????????: misc_ff1_rslt[63:0] = 64'd16;
    64'b000000000000000001??????????????????????????????????????????????: misc_ff1_rslt[63:0] = 64'd17;
    64'b0000000000000000001?????????????????????????????????????????????: misc_ff1_rslt[63:0] = 64'd18;
    64'b00000000000000000001????????????????????????????????????????????: misc_ff1_rslt[63:0] = 64'd19;
    64'b000000000000000000001???????????????????????????????????????????: misc_ff1_rslt[63:0] = 64'd20;
    64'b0000000000000000000001??????????????????????????????????????????: misc_ff1_rslt[63:0] = 64'd21;
    64'b00000000000000000000001?????????????????????????????????????????: misc_ff1_rslt[63:0] = 64'd22;
    64'b000000000000000000000001????????????????????????????????????????: misc_ff1_rslt[63:0] = 64'd23;
    64'b0000000000000000000000001???????????????????????????????????????: misc_ff1_rslt[63:0] = 64'd24;
    64'b00000000000000000000000001??????????????????????????????????????: misc_ff1_rslt[63:0] = 64'd25;
    64'b000000000000000000000000001?????????????????????????????????????: misc_ff1_rslt[63:0] = 64'd26;
    64'b0000000000000000000000000001????????????????????????????????????: misc_ff1_rslt[63:0] = 64'd27;
    64'b00000000000000000000000000001???????????????????????????????????: misc_ff1_rslt[63:0] = 64'd28;
    64'b000000000000000000000000000001??????????????????????????????????: misc_ff1_rslt[63:0] = 64'd29;
    64'b0000000000000000000000000000001?????????????????????????????????: misc_ff1_rslt[63:0] = 64'd30;
    64'b00000000000000000000000000000001????????????????????????????????: misc_ff1_rslt[63:0] = 64'd31;
    64'b000000000000000000000000000000001???????????????????????????????: misc_ff1_rslt[63:0] = 64'd32;
    64'b0000000000000000000000000000000001??????????????????????????????: misc_ff1_rslt[63:0] = 64'd33;
    64'b00000000000000000000000000000000001?????????????????????????????: misc_ff1_rslt[63:0] = 64'd34;
    64'b000000000000000000000000000000000001????????????????????????????: misc_ff1_rslt[63:0] = 64'd35;
    64'b0000000000000000000000000000000000001???????????????????????????: misc_ff1_rslt[63:0] = 64'd36;
    64'b00000000000000000000000000000000000001??????????????????????????: misc_ff1_rslt[63:0] = 64'd37;
    64'b000000000000000000000000000000000000001?????????????????????????: misc_ff1_rslt[63:0] = 64'd38;
    64'b0000000000000000000000000000000000000001????????????????????????: misc_ff1_rslt[63:0] = 64'd39;
    64'b00000000000000000000000000000000000000001???????????????????????: misc_ff1_rslt[63:0] = 64'd40;
    64'b000000000000000000000000000000000000000001??????????????????????: misc_ff1_rslt[63:0] = 64'd41;
    64'b0000000000000000000000000000000000000000001?????????????????????: misc_ff1_rslt[63:0] = 64'd42;
    64'b00000000000000000000000000000000000000000001????????????????????: misc_ff1_rslt[63:0] = 64'd43;
    64'b000000000000000000000000000000000000000000001???????????????????: misc_ff1_rslt[63:0] = 64'd44;
    64'b0000000000000000000000000000000000000000000001??????????????????: misc_ff1_rslt[63:0] = 64'd45;
    64'b00000000000000000000000000000000000000000000001?????????????????: misc_ff1_rslt[63:0] = 64'd46;
    64'b000000000000000000000000000000000000000000000001????????????????: misc_ff1_rslt[63:0] = 64'd47;
    64'b0000000000000000000000000000000000000000000000001???????????????: misc_ff1_rslt[63:0] = 64'd48;
    64'b00000000000000000000000000000000000000000000000001??????????????: misc_ff1_rslt[63:0] = 64'd49;
    64'b000000000000000000000000000000000000000000000000001?????????????: misc_ff1_rslt[63:0] = 64'd50;
    64'b0000000000000000000000000000000000000000000000000001????????????: misc_ff1_rslt[63:0] = 64'd51;
    64'b00000000000000000000000000000000000000000000000000001???????????: misc_ff1_rslt[63:0] = 64'd52;
    64'b000000000000000000000000000000000000000000000000000001??????????: misc_ff1_rslt[63:0] = 64'd53;
    64'b0000000000000000000000000000000000000000000000000000001?????????: misc_ff1_rslt[63:0] = 64'd54;
    64'b00000000000000000000000000000000000000000000000000000001????????: misc_ff1_rslt[63:0] = 64'd55;
    64'b000000000000000000000000000000000000000000000000000000001???????: misc_ff1_rslt[63:0] = 64'd56;
    64'b0000000000000000000000000000000000000000000000000000000001??????: misc_ff1_rslt[63:0] = 64'd57;
    64'b00000000000000000000000000000000000000000000000000000000001?????: misc_ff1_rslt[63:0] = 64'd58;
    64'b000000000000000000000000000000000000000000000000000000000001????: misc_ff1_rslt[63:0] = 64'd59;
    64'b0000000000000000000000000000000000000000000000000000000000001???: misc_ff1_rslt[63:0] = 64'd60;
    64'b00000000000000000000000000000000000000000000000000000000000001??: misc_ff1_rslt[63:0] = 64'd61;
    64'b000000000000000000000000000000000000000000000000000000000000001?: misc_ff1_rslt[63:0] = 64'd62;
    64'b0000000000000000000000000000000000000000000000000000000000000001: misc_ff1_rslt[63:0] = 64'd63;
    64'b0000000000000000000000000000000000000000000000000000000000000000: misc_ff1_rslt[63:0] = 64'd64;
    default:                                                              misc_ff1_rslt[63:0] = {64{1'bx}};
  endcase
// &CombEnd; @643
end

//----------------------------------------------------------
//                         rev
//----------------------------------------------------------
assign misc_rev_rslt[7:0]   = alu_ex1_src0[63:56];
assign misc_rev_rslt[15:8]  = alu_ex1_src0[55:48];
assign misc_rev_rslt[23:16] = alu_ex1_src0[47:40];
assign misc_rev_rslt[31:24] = alu_ex1_src0[39:32];
assign misc_rev_rslt[39:32] = alu_ex1_src0[31:24];
assign misc_rev_rslt[47:40] = alu_ex1_src0[23:16];
assign misc_rev_rslt[55:48] = alu_ex1_src0[15:8];
assign misc_rev_rslt[63:56] = alu_ex1_src0[7:0];

//----------------------------------------------------------
//                         rev
//----------------------------------------------------------
assign misc_revw_rslt[7:0]   = alu_ex1_src0[31:24];
assign misc_revw_rslt[15:8]  = alu_ex1_src0[23:16];
assign misc_revw_rslt[23:16] = alu_ex1_src0[15:8];
assign misc_revw_rslt[31:24] = alu_ex1_src0[7:0];

//==========================================================
//                  Complete Bus signals
//==========================================================
//deal alu complete bus signal in cbus

//==========================================================
//                   Result Bus signals
//==========================================================
//----------------------------------------------------------
//                      Result Bus
//----------------------------------------------------------
// &CombBeg; @676
always @( adder_addsl_rslt[63:0]
       or alu_ex1_rslt_sel[20:0]
       or adder_rslt_max[63:0]
       or adder_rslt_maxw[31:0]
       or adder_rslt_min[63:0]
       or adder_rslt_minw[31:0])
begin
  case (alu_ex1_rslt_sel[ALU_SEL-1:0])
    ADDER_MAX   : alu_ex1_long_data[63:0] = adder_rslt_max[63:0];
    ADDER_MAXW  : alu_ex1_long_data[63:0] = {{32{adder_rslt_maxw[31]}},adder_rslt_maxw[31:0]};
    ADDER_MIN   : alu_ex1_long_data[63:0] = adder_rslt_min[63:0];
    ADDER_MINW  : alu_ex1_long_data[63:0] = {{32{adder_rslt_minw[31]}},adder_rslt_minw[31:0]};
    ADDER_ADDSL : alu_ex1_long_data[63:0] = adder_addsl_rslt[63:0];
    default     : alu_ex1_long_data[63:0] = {64{1'bx}};
  endcase
// &CombEnd; @685
end

// &CombBeg; @687
always @( adder_data_out_subw[31:0]
       or adder_data_out_sub[63:0]
       or adder_rslt_slt
       or alu_ex1_rslt_sel[4:0]
       or adder_data_out_add[63:0]
       or adder_data_out_addw[31:0])
begin
  case (alu_ex1_rslt_sel[4:0])
    5'h01   : alu_ex1_adder_fwd_data[63:0] = adder_data_out_add[63:0];
    5'h02   : alu_ex1_adder_fwd_data[63:0] = {{32{adder_data_out_addw[31]}},adder_data_out_addw[31:0]};
    5'h04   : alu_ex1_adder_fwd_data[63:0] = adder_data_out_sub[63:0];
    5'h08   : alu_ex1_adder_fwd_data[63:0] = {{32{adder_data_out_subw[31]}},adder_data_out_subw[31:0]};
    5'h10   : alu_ex1_adder_fwd_data[63:0] = {63'b0, adder_rslt_slt};
    default: alu_ex1_adder_fwd_data[63:0]  = {64{1'bx}};
  endcase
// &CombEnd; @696
end

// &CombBeg; @698
always @( shifter_r_rslt[63:0]
       or shifter_rw_rslt[31:0]
       or shifter_ext_rslt[63:0]
       or alu_ex1_rslt_sel[9:5]
       or shifter_lw_rslt[31:0]
       or shifter_l_rslt[63:0])
begin
  case (alu_ex1_rslt_sel[9:5])
    5'h01  : alu_ex1_shifter_fwd_data[63:0] = shifter_l_rslt[63:0];
    5'h02  : alu_ex1_shifter_fwd_data[63:0] = shifter_r_rslt[63:0];
    5'h04  : alu_ex1_shifter_fwd_data[63:0] = {{32{shifter_lw_rslt[31]}},shifter_lw_rslt[31:0]};
    5'h08  : alu_ex1_shifter_fwd_data[63:0] = {{32{shifter_rw_rslt[31]}},shifter_rw_rslt[31:0]};
    5'h10  : alu_ex1_shifter_fwd_data[63:0] = shifter_ext_rslt[63:0];
    default: alu_ex1_shifter_fwd_data[63:0] = {64{1'bx}};
  endcase
// &CombEnd; @707
end

// &CombBeg; @709
always @( misc_tstnbz_rslt[63:0]
       or logic_lui_rslt[63:0]
       or misc_rev_rslt[63:0]
       or logic_xor_rslt[63:0]
       or misc_revw_rslt[31:0]
       or logic_or_rslt[63:0]
       or alu_ex1_rslt_sel[20:10]
       or misc_mv_rslt[63:0]
       or misc_tst_rslt
       or logic_cli_rslt[63:0]
       or logic_and_rslt[63:0]
       or misc_ff1_rslt[63:0])
begin
  case (alu_ex1_rslt_sel[ALU_SEL-1:10])
    11'h001 : alu_ex1_other_fwd_data[63:0] = logic_and_rslt[63:0];
    11'h002 : alu_ex1_other_fwd_data[63:0] = logic_or_rslt[63:0];
    11'h004 : alu_ex1_other_fwd_data[63:0] = logic_xor_rslt[63:0];
    11'h008 : alu_ex1_other_fwd_data[63:0] = logic_lui_rslt[63:0];
    11'h010 : alu_ex1_other_fwd_data[63:0] = logic_cli_rslt[63:0];
    11'h020 : alu_ex1_other_fwd_data[63:0] = misc_mv_rslt[63:0];
    11'h040 : alu_ex1_other_fwd_data[63:0] = misc_tstnbz_rslt[63:0];
    11'h080 : alu_ex1_other_fwd_data[63:0] = {63'b0,misc_tst_rslt};
    11'h100 : alu_ex1_other_fwd_data[63:0] = misc_ff1_rslt[63:0];
    11'h200 : alu_ex1_other_fwd_data[63:0] = misc_rev_rslt[63:0];
    11'h400 : alu_ex1_other_fwd_data[63:0] = {{32{misc_revw_rslt[31]}}, misc_revw_rslt[31:0]};
    default : alu_ex1_other_fwd_data[63:0] = {64{1'bx}};
  endcase
// &CombEnd; @724
end

// &CombBeg; @726
always @( alu_ex1_shifter_fwd_data[63:0]
       or alu_ex1_adder_fwd_data[63:0]
       or alu_ex1_other_fwd_data[63:0]
       or alu_ex1_eu_sel[2:0])
begin
  case (alu_ex1_eu_sel[2:0])
    3'h1   : alu_ex1_fwd_data[63:0] = alu_ex1_adder_fwd_data[63:0];
    3'h2   : alu_ex1_fwd_data[63:0] = alu_ex1_shifter_fwd_data[63:0];
    3'h4   : alu_ex1_fwd_data[63:0] = alu_ex1_other_fwd_data[63:0];
    default: alu_ex1_fwd_data[63:0] = {64{1'bx}};
  endcase
// &CombEnd; @733
end

//----------------------------------------------------------
//                    Register Result
//----------------------------------------------------------
assign alu_rbus_ex1_pipex_data_vld       = alu_ex1_inst_vld && alu_ex1_dst_vld;

assign alu_rbus_ex1_pipex_fwd_vld        = alu_ex1_fwd_vld;

assign alu_rbus_ex1_pipex_fwd_data[63:0] = alu_ex1_fwd_data[63:0];

assign alu_rbus_ex1_pipex_preg[6:0]      = alu_ex1_dst_preg[6:0];

assign alu_rbus_ex1_pipex_data[63:0]     = alu_ex1_alu_short ? alu_ex1_fwd_data[63:0]
                                                             : alu_ex1_long_data[63:0];

//==========================================================
//                  Send MTVR result
//==========================================================
assign misc_inst_mtvr_inst[4:0] = alu_ex1_func[4:0];

assign misc_ex1_mtvr_vld  = alu_ex1_inst_vld && alu_ex1_dstv_vld;

//----------------------------------------------------------
//                   EX2 mtvr valid
//----------------------------------------------------------
always @(posedge ctrl_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    misc_ex2_mtvr_vld <= 1'b0;
  else if(rtu_yy_xx_flush)
    misc_ex2_mtvr_vld <= 1'b0;
  else
    misc_ex2_mtvr_vld <= misc_ex1_mtvr_vld;
end

assign iu_vfpu_ex1_pipex_mtvr_vld        = misc_ex1_mtvr_vld;
assign iu_vfpu_ex1_pipex_mtvr_inst[4:0]  = misc_inst_mtvr_inst[4:0];
assign iu_vfpu_ex1_pipex_mtvr_vreg[6:0]  = alu_ex1_dst_vreg[6:0];
assign iu_vfpu_ex1_pipex_mtvr_vlmul[1:0] = alu_ex1_vlmul[1:0];
assign iu_vfpu_ex1_pipex_mtvr_vsew[2:0]  = alu_ex1_vsew[2:0];
assign iu_vfpu_ex1_pipex_mtvr_vl[7:0]    = alu_ex1_vl[7:0];

//----------------------------------------------------------
//                   EX2 mtvr data
//----------------------------------------------------------
always @(posedge ex2_inst_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    misc_ex2_mtvr_src0[63:0]     <= 64'b0;
  end
  else if(misc_ex1_mtvr_vld) begin
    misc_ex2_mtvr_src0[63:0]     <= (had_idu_wbbr_vld)
                                    ? had_idu_wbbr_data[63:0]
                                    : alu_ex1_src0[63:0];
  end
  else begin
    misc_ex2_mtvr_src0[63:0]     <= misc_ex2_mtvr_src0[63:0];
  end
end

assign iu_vfpu_ex2_pipex_mtvr_vld        = misc_ex2_mtvr_vld;
assign iu_vfpu_ex2_pipex_mtvr_src0[63:0] = misc_ex2_mtvr_src0[63:0];

// &ModuleEnd; @797
endmodule


