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
module ct_iu_special(
  bju_special_pc,
  cp0_iu_icg_en,
  cp0_iu_vill,
  cp0_iu_vl,
  cp0_iu_vsetvli_pre_decd_disable,
  cp0_iu_vstart,
  cp0_yy_clk_en,
  cp0_yy_priv_mode,
  cpurst_b,
  forever_cpuclk,
  idu_iu_rf_pipe0_dst_preg,
  idu_iu_rf_pipe0_expt_vec,
  idu_iu_rf_pipe0_expt_vld,
  idu_iu_rf_pipe0_func,
  idu_iu_rf_pipe0_high_hw_expt,
  idu_iu_rf_pipe0_iid,
  idu_iu_rf_pipe0_opcode,
  idu_iu_rf_pipe0_special_imm,
  idu_iu_rf_pipe0_src0,
  idu_iu_rf_pipe0_src1_no_imm,
  idu_iu_rf_pipe0_vl,
  idu_iu_rf_special_gateclk_sel,
  idu_iu_rf_special_sel,
  mmu_xx_mmu_en,
  pad_yy_icg_scan_en,
  rtu_yy_xx_flush,
  special_cbus_ex1_abnormal,
  special_cbus_ex1_bkpt,
  special_cbus_ex1_expt_vec,
  special_cbus_ex1_expt_vld,
  special_cbus_ex1_flush,
  special_cbus_ex1_high_hw_expt,
  special_cbus_ex1_iid,
  special_cbus_ex1_immu_expt,
  special_cbus_ex1_inst_gateclk_vld,
  special_cbus_ex1_inst_vld,
  special_cbus_ex1_mtval,
  special_cbus_ex1_vsetvl,
  special_cbus_ex1_vstart,
  special_cbus_ex1_vstart_vld,
  special_rbus_ex1_data,
  special_rbus_ex1_data_vld,
  special_rbus_ex1_preg
);

// &Ports; @29
input   [39:0]  bju_special_pc;                       
input           cp0_iu_icg_en;                        
input           cp0_iu_vill;                          
input   [7 :0]  cp0_iu_vl;                            
input           cp0_iu_vsetvli_pre_decd_disable;      
input   [6 :0]  cp0_iu_vstart;                        
input           cp0_yy_clk_en;                        
input   [1 :0]  cp0_yy_priv_mode;                     
input           cpurst_b;                             
input           forever_cpuclk;                       
input   [6 :0]  idu_iu_rf_pipe0_dst_preg;             
input   [4 :0]  idu_iu_rf_pipe0_expt_vec;             
input           idu_iu_rf_pipe0_expt_vld;             
input   [4 :0]  idu_iu_rf_pipe0_func;                 
input           idu_iu_rf_pipe0_high_hw_expt;         
input   [6 :0]  idu_iu_rf_pipe0_iid;                  
input   [31:0]  idu_iu_rf_pipe0_opcode;               
input   [19:0]  idu_iu_rf_pipe0_special_imm;          
input   [63:0]  idu_iu_rf_pipe0_src0;                 
input   [63:0]  idu_iu_rf_pipe0_src1_no_imm;          
input   [7 :0]  idu_iu_rf_pipe0_vl;                   
input           idu_iu_rf_special_gateclk_sel;        
input           idu_iu_rf_special_sel;                
input           mmu_xx_mmu_en;                        
input           pad_yy_icg_scan_en;                   
input           rtu_yy_xx_flush;                      
output          special_cbus_ex1_abnormal;            
output          special_cbus_ex1_bkpt;                
output  [4 :0]  special_cbus_ex1_expt_vec;            
output          special_cbus_ex1_expt_vld;            
output          special_cbus_ex1_flush;               
output          special_cbus_ex1_high_hw_expt;        
output  [6 :0]  special_cbus_ex1_iid;                 
output          special_cbus_ex1_immu_expt;           
output          special_cbus_ex1_inst_gateclk_vld;    
output          special_cbus_ex1_inst_vld;            
output  [31:0]  special_cbus_ex1_mtval;               
output          special_cbus_ex1_vsetvl;              
output  [6 :0]  special_cbus_ex1_vstart;              
output          special_cbus_ex1_vstart_vld;          
output  [63:0]  special_rbus_ex1_data;                
output          special_rbus_ex1_data_vld;            
output  [6 :0]  special_rbus_ex1_preg;                

// &Regs; @30
reg     [31:0]  special_cbus_ex1_mtval;               
reg     [6 :0]  special_ex1_dst_preg;                 
reg     [4 :0]  special_ex1_ecall_expt_vec;           
reg     [4 :0]  special_ex1_expt_vec;                 
reg             special_ex1_expt_vld;                 
reg     [4 :0]  special_ex1_func;                     
reg             special_ex1_high_hw_expt;             
reg     [6 :0]  special_ex1_iid;                      
reg     [19:0]  special_ex1_imm;                      
reg             special_ex1_inst_vld;                 
reg     [31:0]  special_ex1_opcode;                   
reg     [39:0]  special_ex1_pc;                       
reg     [7 :0]  special_ex1_pred_vl;                  
reg     [63:0]  special_ex1_src0;                     
reg     [63:0]  special_ex1_src1;                     
reg     [7 :0]  special_ex1_vsetvl_src_vl;            
reg     [7 :0]  special_ex1_vsetvl_vl;                
reg             special_ex1_vsetvl_vl_mispred;        
reg     [1 :0]  special_ex1_vsetvl_vlmul;             
reg     [2 :0]  special_ex1_vsetvl_vsew;              

// &Wires; @31
wire    [39:0]  bju_special_pc;                       
wire            cp0_iu_icg_en;                        
wire            cp0_iu_vill;                          
wire    [7 :0]  cp0_iu_vl;                            
wire            cp0_iu_vsetvli_pre_decd_disable;      
wire    [6 :0]  cp0_iu_vstart;                        
wire            cp0_yy_clk_en;                        
wire    [1 :0]  cp0_yy_priv_mode;                     
wire            cpurst_b;                             
wire            ex1_ctrl_clk;                         
wire            ex1_ctrl_clk_en;                      
wire            ex1_inst_clk;                         
wire            ex1_inst_clk_en;                      
wire            forever_cpuclk;                       
wire    [6 :0]  idu_iu_rf_pipe0_dst_preg;             
wire    [4 :0]  idu_iu_rf_pipe0_expt_vec;             
wire            idu_iu_rf_pipe0_expt_vld;             
wire    [4 :0]  idu_iu_rf_pipe0_func;                 
wire            idu_iu_rf_pipe0_high_hw_expt;         
wire    [6 :0]  idu_iu_rf_pipe0_iid;                  
wire    [31:0]  idu_iu_rf_pipe0_opcode;               
wire    [19:0]  idu_iu_rf_pipe0_special_imm;          
wire    [63:0]  idu_iu_rf_pipe0_src0;                 
wire    [63:0]  idu_iu_rf_pipe0_src1_no_imm;          
wire    [7 :0]  idu_iu_rf_pipe0_vl;                   
wire            idu_iu_rf_special_gateclk_sel;        
wire            idu_iu_rf_special_sel;                
wire            mmu_xx_mmu_en;                        
wire            pad_yy_icg_scan_en;                   
wire            rtu_yy_xx_flush;                      
wire    [63:0]  special_auipc_rslt;                   
wire            special_cbus_ex1_abnormal;            
wire            special_cbus_ex1_bkpt;                
wire    [4 :0]  special_cbus_ex1_expt_vec;            
wire            special_cbus_ex1_expt_vld;            
wire            special_cbus_ex1_flush;               
wire            special_cbus_ex1_high_hw_expt;        
wire    [6 :0]  special_cbus_ex1_iid;                 
wire            special_cbus_ex1_immu_expt;           
wire            special_cbus_ex1_inst_gateclk_vld;    
wire            special_cbus_ex1_inst_vld;            
wire            special_cbus_ex1_vsetvl;              
wire    [6 :0]  special_cbus_ex1_vstart;              
wire            special_cbus_ex1_vstart_vld;          
wire            special_ex1_illegal_expt;             
wire            special_ex1_inst_auipc;               
wire            special_ex1_inst_ebreak;              
wire            special_ex1_inst_ecall;               
wire            special_ex1_inst_nop;                 
wire            special_ex1_inst_pseudo_auipc;        
wire            special_ex1_inst_vsetvl;              
wire            special_ex1_inst_vsetvli;             
wire    [63:0]  special_ex1_offset;                   
wire    [63:0]  special_ex1_pc_addend;                
wire            special_ex1_vsetvl_avl_ge_128;        
wire            special_ex1_vsetvl_avl_ge_16;         
wire            special_ex1_vsetvl_avl_ge_2;          
wire            special_ex1_vsetvl_avl_ge_32;         
wire            special_ex1_vsetvl_avl_ge_4;          
wire            special_ex1_vsetvl_avl_ge_64;         
wire            special_ex1_vsetvl_avl_ge_8;          
wire            special_ex1_vsetvl_illegal;           
wire    [31:0]  special_ex1_vsetvl_mtval;             
wire            special_ex1_vsetvl_rs1_x0;            
wire    [63:0]  special_ex1_vsetvl_rslt;              
wire    [63:0]  special_ex1_vsetvl_src_avl;           
wire    [1 :0]  special_ex1_vsetvl_src_vediv;         
wire    [1 :0]  special_ex1_vsetvl_src_vlmul;         
wire    [2 :0]  special_ex1_vsetvl_src_vsew;          
wire    [7 :0]  special_ex1_vsetvl_vl_128;            
wire    [7 :0]  special_ex1_vsetvl_vl_16;             
wire    [7 :0]  special_ex1_vsetvl_vl_2;              
wire    [7 :0]  special_ex1_vsetvl_vl_32;             
wire    [7 :0]  special_ex1_vsetvl_vl_4;              
wire    [7 :0]  special_ex1_vsetvl_vl_64;             
wire    [7 :0]  special_ex1_vsetvl_vl_8;              
wire            special_ex1_vsetvl_vl_mispred_128;    
wire            special_ex1_vsetvl_vl_mispred_16;     
wire            special_ex1_vsetvl_vl_mispred_2;      
wire            special_ex1_vsetvl_vl_mispred_32;     
wire            special_ex1_vsetvl_vl_mispred_4;      
wire            special_ex1_vsetvl_vl_mispred_64;     
wire            special_ex1_vsetvl_vl_mispred_8;      
wire            special_ex1_vsetvl_vl_modified_from_0; 
wire            special_ex1_vsetvlx_abnormal;         
wire            special_ex1_vstart_clr;               
wire    [63:0]  special_rbus_ex1_data;                
wire            special_rbus_ex1_data_vld;            
wire    [6 :0]  special_rbus_ex1_preg;                



//==========================================================
//                        Parameters
//==========================================================
parameter SPECIAL_NOP           = 5'b00000;
parameter SPECIAL_ECALL         = 5'b00010;
parameter SPECIAL_EBREAK        = 5'b00011;
parameter SPECIAL_AUIPC         = 5'b00100;
parameter SPECIAL_PSEUDO_AUIPC  = 5'b00101;
parameter SPECIAL_VSETVLI       = 5'b00110;
parameter SPECIAL_VSETVL        = 5'b00111;

//==========================================================
//                 RF/EX1 Pipeline Register
//==========================================================
//----------------------------------------------------------
//                 Instance of Gated Cell  
//----------------------------------------------------------
assign ex1_ctrl_clk_en = idu_iu_rf_special_gateclk_sel || special_ex1_inst_vld;
// &Instance("gated_clk_cell", "x_ex1_ctrl_gated_clk"); @52
gated_clk_cell  x_ex1_ctrl_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (ex1_ctrl_clk      ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (ex1_ctrl_clk_en   ),
  .module_en          (cp0_iu_icg_en     ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @53
//          .external_en (1'b0), @54
//          .global_en   (cp0_yy_clk_en), @55
//          .module_en   (cp0_iu_icg_en), @56
//          .local_en    (ex1_ctrl_clk_en), @57
//          .clk_out     (ex1_ctrl_clk)); @58

assign ex1_inst_clk_en = idu_iu_rf_special_gateclk_sel;
// &Instance("gated_clk_cell", "x_ex1_inst_gated_clk"); @61
gated_clk_cell  x_ex1_inst_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (ex1_inst_clk      ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (ex1_inst_clk_en   ),
  .module_en          (cp0_iu_icg_en     ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @62
//          .external_en (1'b0), @63
//          .global_en   (cp0_yy_clk_en), @64
//          .module_en   (cp0_iu_icg_en), @65
//          .local_en    (ex1_inst_clk_en), @66
//          .clk_out     (ex1_inst_clk)); @67

//----------------------------------------------------------
//              Pipe2 EX1 Instruction valid
//----------------------------------------------------------
always @(posedge ex1_ctrl_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    special_ex1_inst_vld <= 1'b0;
  else if(rtu_yy_xx_flush)
    special_ex1_inst_vld <= 1'b0;
  else
    special_ex1_inst_vld <= idu_iu_rf_special_sel;
end

//----------------------------------------------------------
//               Pipe2 EX1 Instruction Data
//----------------------------------------------------------
always @(posedge ex1_inst_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    special_ex1_iid[6:0]             <= 7'b0;
    special_ex1_opcode[31:0]         <= 32'b0;
    special_ex1_dst_preg[6:0]        <= 7'b0;
    special_ex1_func[4:0]            <= 5'b0;
    special_ex1_pc[39:0]             <= 40'b0;
    special_ex1_imm[19:0]            <= 20'b0;
    special_ex1_expt_vld             <= 1'b0;
    special_ex1_expt_vec[4:0]        <= 5'b0;
    special_ex1_high_hw_expt         <= 1'b0;
    special_ex1_src0[63:0]           <= 64'b0;
    special_ex1_src1[63:0]           <= 64'b0;
    special_ex1_pred_vl[7:0]         <= 8'b0;
  end
  else if(idu_iu_rf_special_gateclk_sel) begin
    special_ex1_iid[6:0]             <= idu_iu_rf_pipe0_iid[6:0];
    special_ex1_opcode[31:0]         <= idu_iu_rf_pipe0_opcode[31:0];
    special_ex1_dst_preg[6:0]        <= idu_iu_rf_pipe0_dst_preg[6:0];
    special_ex1_func[4:0]            <= idu_iu_rf_pipe0_func[4:0];
    special_ex1_pc[39:0]             <= bju_special_pc[39:0];
    special_ex1_imm[19:0]            <= idu_iu_rf_pipe0_special_imm[19:0];
    special_ex1_expt_vld             <= idu_iu_rf_pipe0_expt_vld;
    special_ex1_expt_vec[4:0]        <= idu_iu_rf_pipe0_expt_vec[4:0];
    special_ex1_high_hw_expt         <= idu_iu_rf_pipe0_high_hw_expt;
    special_ex1_src0[63:0]           <= idu_iu_rf_pipe0_src0[63:0];
    special_ex1_src1[63:0]           <= idu_iu_rf_pipe0_src1_no_imm[63:0];
    special_ex1_pred_vl[7:0]         <= idu_iu_rf_pipe0_vl[7:0];
  end
  else begin
    special_ex1_iid[6:0]             <= special_ex1_iid[6:0];
    special_ex1_opcode[31:0]         <= special_ex1_opcode[31:0];
    special_ex1_dst_preg[6:0]        <= special_ex1_dst_preg[6:0];
    special_ex1_func[4:0]            <= special_ex1_func[4:0];
    special_ex1_pc[39:0]             <= special_ex1_pc[39:0];
    special_ex1_imm[19:0]            <= special_ex1_imm[19:0];
    special_ex1_expt_vld             <= special_ex1_expt_vld;
    special_ex1_expt_vec[4:0]        <= special_ex1_expt_vec[4:0];
    special_ex1_high_hw_expt         <= special_ex1_high_hw_expt;
    special_ex1_src0[63:0]           <= special_ex1_src0[63:0];
    special_ex1_src1[63:0]           <= special_ex1_src1[63:0];
    special_ex1_pred_vl[7:0]         <= special_ex1_pred_vl[7:0];
  end
end

//==========================================================
//                  Instruction Selection
//==========================================================
assign special_ex1_inst_nop          = (special_ex1_func[4:0] == SPECIAL_NOP);
assign special_ex1_inst_ecall        = (special_ex1_func[4:0] == SPECIAL_ECALL);
assign special_ex1_inst_ebreak       = (special_ex1_func[4:0] == SPECIAL_EBREAK);
assign special_ex1_inst_auipc        = (special_ex1_func[4:0] == SPECIAL_AUIPC);
assign special_ex1_inst_pseudo_auipc = (special_ex1_func[4:0] == SPECIAL_PSEUDO_AUIPC);
assign special_ex1_inst_vsetvli      = (special_ex1_func[4:0] == SPECIAL_VSETVLI);
assign special_ex1_inst_vsetvl       = (special_ex1_func[4:0] == SPECIAL_VSETVL);

//==========================================================
//                     AUIPC result
//==========================================================
assign special_ex1_offset[63:0] =
         special_ex1_inst_pseudo_auipc
         ? {{44{special_ex1_imm[19]}}, special_ex1_imm[19:0]}
         : {{32{special_ex1_imm[19]}}, special_ex1_imm[19:0], 12'b0};
assign special_ex1_pc_addend[63:0] =
         mmu_xx_mmu_en
         ? {{24{special_ex1_pc[39]}}, special_ex1_pc[39:0]}
         : {24'b0, special_ex1_pc[39:0]};

assign special_auipc_rslt[63:0] =  special_ex1_pc_addend[63:0]
                                 + special_ex1_offset[63:0];

//==========================================================
//                   VSETVL/VSETVLI
//==========================================================
//----------------------------------------------------------
//                 Prepare Source values
//----------------------------------------------------------
assign special_ex1_vsetvl_src_vlmul[1:0]  = special_ex1_inst_vsetvli
                                            ? special_ex1_opcode[21:20]
                                            : special_ex1_src1[1:0];
assign special_ex1_vsetvl_src_vsew[2:0]   = special_ex1_inst_vsetvli
                                            ? special_ex1_opcode[24:22]
                                            : special_ex1_src1[4:2];
assign special_ex1_vsetvl_src_vediv[1:0]  = special_ex1_inst_vsetvli
                                            ? special_ex1_opcode[26:25]
                                            : special_ex1_src1[6:5];
assign special_ex1_vsetvl_src_avl[63:0]   = special_ex1_src0[63:0];

//----------------------------------------------------------
//                      VL values
//----------------------------------------------------------
assign special_ex1_vsetvl_rs1_x0      = (special_ex1_opcode[19:15] == 5'b0);

assign special_ex1_vsetvl_avl_ge_2    = (|special_ex1_vsetvl_src_avl[63:1])
                                        || special_ex1_vsetvl_rs1_x0;
assign special_ex1_vsetvl_avl_ge_4    = (|special_ex1_vsetvl_src_avl[63:2])
                                        || special_ex1_vsetvl_rs1_x0;
assign special_ex1_vsetvl_avl_ge_8    = (|special_ex1_vsetvl_src_avl[63:3])
                                        || special_ex1_vsetvl_rs1_x0;
assign special_ex1_vsetvl_avl_ge_16   = (|special_ex1_vsetvl_src_avl[63:4])
                                        || special_ex1_vsetvl_rs1_x0;
assign special_ex1_vsetvl_avl_ge_32   = (|special_ex1_vsetvl_src_avl[63:5])
                                        || special_ex1_vsetvl_rs1_x0;
assign special_ex1_vsetvl_avl_ge_64   = (|special_ex1_vsetvl_src_avl[63:6])
                                        || special_ex1_vsetvl_rs1_x0;
assign special_ex1_vsetvl_avl_ge_128  = (|special_ex1_vsetvl_src_avl[63:7])
                                        || special_ex1_vsetvl_rs1_x0;

assign special_ex1_vsetvl_vl_2[7:0]   = {6'b0,special_ex1_vsetvl_avl_ge_2,
                                             !special_ex1_vsetvl_avl_ge_2
                                              & special_ex1_vsetvl_src_avl[0]};
assign special_ex1_vsetvl_vl_4[7:0]   = {5'b0,special_ex1_vsetvl_avl_ge_4,
                                          {2{!special_ex1_vsetvl_avl_ge_4}}
                                              & special_ex1_vsetvl_src_avl[1:0]};
assign special_ex1_vsetvl_vl_8[7:0]   = {4'b0,special_ex1_vsetvl_avl_ge_8,
                                          {3{!special_ex1_vsetvl_avl_ge_8}}
                                              & special_ex1_vsetvl_src_avl[2:0]};
assign special_ex1_vsetvl_vl_16[7:0]  = {3'b0,special_ex1_vsetvl_avl_ge_16,
                                          {4{!special_ex1_vsetvl_avl_ge_16}}
                                              & special_ex1_vsetvl_src_avl[3:0]};
assign special_ex1_vsetvl_vl_32[7:0]  = {2'b0,special_ex1_vsetvl_avl_ge_32,
                                          {5{!special_ex1_vsetvl_avl_ge_32}}
                                              & special_ex1_vsetvl_src_avl[4:0]};
assign special_ex1_vsetvl_vl_64[7:0]  = {1'b0,special_ex1_vsetvl_avl_ge_64,
                                          {6{!special_ex1_vsetvl_avl_ge_64}}
                                              & special_ex1_vsetvl_src_avl[5:0]};
assign special_ex1_vsetvl_vl_128[7:0] = {special_ex1_vsetvl_avl_ge_128,
                                          {7{!special_ex1_vsetvl_avl_ge_128}}
                                              & special_ex1_vsetvl_src_avl[6:0]};

assign special_ex1_vsetvl_vl_mispred_2   = special_ex1_vsetvl_avl_ge_2
                                            ? (special_ex1_pred_vl[7:0] != 8'd2)
                                            : (special_ex1_pred_vl[7:0] != special_ex1_vsetvl_src_avl[7:0]);
assign special_ex1_vsetvl_vl_mispred_4   = special_ex1_vsetvl_avl_ge_4
                                            ? (special_ex1_pred_vl[7:0] != 8'd4)
                                            : (special_ex1_pred_vl[7:0] != special_ex1_vsetvl_src_avl[7:0]);
assign special_ex1_vsetvl_vl_mispred_8   = special_ex1_vsetvl_avl_ge_8
                                            ? (special_ex1_pred_vl[7:0] != 8'd8)
                                            : (special_ex1_pred_vl[7:0] != special_ex1_vsetvl_src_avl[7:0]);
assign special_ex1_vsetvl_vl_mispred_16  = special_ex1_vsetvl_avl_ge_16
                                            ? (special_ex1_pred_vl[7:0] != 8'd16)
                                            : (special_ex1_pred_vl[7:0] != special_ex1_vsetvl_src_avl[7:0]);
assign special_ex1_vsetvl_vl_mispred_32  = special_ex1_vsetvl_avl_ge_32
                                            ? (special_ex1_pred_vl[7:0] != 8'd32)
                                            : (special_ex1_pred_vl[7:0] != special_ex1_vsetvl_src_avl[7:0]);
assign special_ex1_vsetvl_vl_mispred_64  = special_ex1_vsetvl_avl_ge_64
                                            ? (special_ex1_pred_vl[7:0] != 8'd64)
                                            : (special_ex1_pred_vl[7:0] != special_ex1_vsetvl_src_avl[7:0]);
assign special_ex1_vsetvl_vl_mispred_128 = special_ex1_vsetvl_avl_ge_128
                                            ? (special_ex1_pred_vl[7:0] != 8'd128)
                                            : (special_ex1_pred_vl[7:0] != special_ex1_vsetvl_src_avl[7:0]);

// &CombBeg; @238
always @( special_ex1_vsetvl_vl_64[7:0]
       or special_ex1_vsetvl_vl_128[7:0]
       or special_ex1_vsetvl_vl_8[7:0]
       or special_ex1_vsetvl_src_vsew[1:0]
       or special_ex1_vsetvl_vl_32[7:0]
       or special_ex1_vsetvl_vl_2[7:0]
       or special_ex1_vsetvl_src_vlmul[1:0]
       or special_ex1_vsetvl_vl_16[7:0]
       or special_ex1_vsetvl_vl_4[7:0])
begin
  case({special_ex1_vsetvl_src_vlmul[1:0],special_ex1_vsetvl_src_vsew[1:0]})
    4'b0000: special_ex1_vsetvl_src_vl[7:0] = special_ex1_vsetvl_vl_16[7:0];
    4'b0001: special_ex1_vsetvl_src_vl[7:0] = special_ex1_vsetvl_vl_8[7:0];
    4'b0010: special_ex1_vsetvl_src_vl[7:0] = special_ex1_vsetvl_vl_4[7:0];
    4'b0011: special_ex1_vsetvl_src_vl[7:0] = special_ex1_vsetvl_vl_2[7:0];
    4'b0100: special_ex1_vsetvl_src_vl[7:0] = special_ex1_vsetvl_vl_32[7:0];
    4'b0101: special_ex1_vsetvl_src_vl[7:0] = special_ex1_vsetvl_vl_16[7:0];
    4'b0110: special_ex1_vsetvl_src_vl[7:0] = special_ex1_vsetvl_vl_8[7:0];
    4'b0111: special_ex1_vsetvl_src_vl[7:0] = special_ex1_vsetvl_vl_4[7:0];
    4'b1000: special_ex1_vsetvl_src_vl[7:0] = special_ex1_vsetvl_vl_64[7:0];
    4'b1001: special_ex1_vsetvl_src_vl[7:0] = special_ex1_vsetvl_vl_32[7:0];
    4'b1010: special_ex1_vsetvl_src_vl[7:0] = special_ex1_vsetvl_vl_16[7:0];
    4'b1011: special_ex1_vsetvl_src_vl[7:0] = special_ex1_vsetvl_vl_8[7:0];
    4'b1100: special_ex1_vsetvl_src_vl[7:0] = special_ex1_vsetvl_vl_128[7:0];
    4'b1101: special_ex1_vsetvl_src_vl[7:0] = special_ex1_vsetvl_vl_64[7:0];
    4'b1110: special_ex1_vsetvl_src_vl[7:0] = special_ex1_vsetvl_vl_32[7:0];
    4'b1111: special_ex1_vsetvl_src_vl[7:0] = special_ex1_vsetvl_vl_16[7:0];
    default: special_ex1_vsetvl_src_vl[7:0] = {8{1'bx}};
  endcase
// &CombEnd; @258
end

// &CombBeg; @260
always @( special_ex1_vsetvl_vl_mispred_32
       or special_ex1_vsetvl_vl_mispred_8
       or special_ex1_vsetvl_vl_mispred_64
       or special_ex1_vsetvl_vl_mispred_2
       or special_ex1_vsetvl_src_vsew[1:0]
       or special_ex1_vsetvl_vl_mispred_16
       or special_ex1_vsetvl_vl_mispred_4
       or special_ex1_vsetvl_src_vlmul[1:0]
       or special_ex1_vsetvl_vl_mispred_128)
begin
  case({special_ex1_vsetvl_src_vlmul[1:0],special_ex1_vsetvl_src_vsew[1:0]})
    4'b0000: special_ex1_vsetvl_vl_mispred = special_ex1_vsetvl_vl_mispred_16;
    4'b0001: special_ex1_vsetvl_vl_mispred = special_ex1_vsetvl_vl_mispred_8;
    4'b0010: special_ex1_vsetvl_vl_mispred = special_ex1_vsetvl_vl_mispred_4;
    4'b0011: special_ex1_vsetvl_vl_mispred = special_ex1_vsetvl_vl_mispred_2;
    4'b0100: special_ex1_vsetvl_vl_mispred = special_ex1_vsetvl_vl_mispred_32;
    4'b0101: special_ex1_vsetvl_vl_mispred = special_ex1_vsetvl_vl_mispred_16;
    4'b0110: special_ex1_vsetvl_vl_mispred = special_ex1_vsetvl_vl_mispred_8;
    4'b0111: special_ex1_vsetvl_vl_mispred = special_ex1_vsetvl_vl_mispred_4;
    4'b1000: special_ex1_vsetvl_vl_mispred = special_ex1_vsetvl_vl_mispred_64;
    4'b1001: special_ex1_vsetvl_vl_mispred = special_ex1_vsetvl_vl_mispred_32;
    4'b1010: special_ex1_vsetvl_vl_mispred = special_ex1_vsetvl_vl_mispred_16;
    4'b1011: special_ex1_vsetvl_vl_mispred = special_ex1_vsetvl_vl_mispred_8;
    4'b1100: special_ex1_vsetvl_vl_mispred = special_ex1_vsetvl_vl_mispred_128;
    4'b1101: special_ex1_vsetvl_vl_mispred = special_ex1_vsetvl_vl_mispred_64;
    4'b1110: special_ex1_vsetvl_vl_mispred = special_ex1_vsetvl_vl_mispred_32;
    4'b1111: special_ex1_vsetvl_vl_mispred = special_ex1_vsetvl_vl_mispred_16;
    default: special_ex1_vsetvl_vl_mispred = 1'bx;
  endcase
// &CombEnd; @280
end

// &CombBeg; @282
always @( special_ex1_vsetvl_src_vsew[2:0]
       or special_ex1_vsetvl_src_vlmul[1:0]
       or special_ex1_vsetvl_illegal
       or special_ex1_vsetvl_src_vl[7:0])
begin
  if(special_ex1_vsetvl_illegal) begin
    special_ex1_vsetvl_vl[7:0]    = 8'b0;
    special_ex1_vsetvl_vsew[2:0]  = 3'b0;
    special_ex1_vsetvl_vlmul[1:0] = 2'b0;
  end
  else begin
    special_ex1_vsetvl_vl[7:0]    = special_ex1_vsetvl_src_vl[7:0];
    special_ex1_vsetvl_vsew[2:0]  = special_ex1_vsetvl_src_vsew[2:0];
    special_ex1_vsetvl_vlmul[1:0] = special_ex1_vsetvl_src_vlmul[1:0];
  end
// &CombEnd; @293
end

assign special_ex1_vsetvl_vl_modified_from_0 = (special_ex1_vsetvl_vl[7:0] != 8'b0)
                                               && (cp0_iu_vl[7:0] == 8'b0);

//----------------------------------------------------------
//                     vstart values
//----------------------------------------------------------
assign special_ex1_vstart_clr = (special_ex1_inst_vsetvl || special_ex1_inst_vsetvli)
                                && (cp0_iu_vstart[6:0] != 7'b0);

//----------------------------------------------------------
//                     cmplt value
//----------------------------------------------------------
assign special_ex1_vsetvl_illegal      = (special_ex1_vsetvl_src_vediv[1:0] != 2'b0)
                                      || (special_ex1_vsetvl_src_vsew[2:0] == 3'b100)
                                      || (special_ex1_vsetvl_src_vsew[2:0] == 3'b101)
                                      || (special_ex1_vsetvl_src_vsew[2:0] == 3'b110)
                                      || (special_ex1_vsetvl_src_vsew[2:0] == 3'b111);

assign special_ex1_vsetvlx_abnormal    = special_ex1_inst_vsetvl
                                      || special_ex1_inst_vsetvli
                                         && (special_ex1_vsetvl_illegal
                                          || special_ex1_vsetvl_vl_mispred
                                          || cp0_iu_vill
                                          || special_ex1_vsetvl_vl_modified_from_0
                                          || cp0_iu_vsetvli_pre_decd_disable);

assign special_ex1_vsetvl_mtval[31:16] = 16'b0;
assign special_ex1_vsetvl_mtval[15]    = 1'b0; //fof_expt
assign special_ex1_vsetvl_mtval[14]    = special_ex1_vsetvl_vl_mispred;
assign special_ex1_vsetvl_mtval[13]    = special_ex1_vsetvl_illegal;
assign special_ex1_vsetvl_mtval[12:5]  = special_ex1_vsetvl_vl[7:0];
assign special_ex1_vsetvl_mtval[4:2]   = special_ex1_vsetvl_vsew[2:0];
assign special_ex1_vsetvl_mtval[1:0]   = special_ex1_vsetvl_vlmul[1:0];

//----------------------------------------------------------
//                     write back value
//----------------------------------------------------------
assign special_ex1_vsetvl_rslt[63:8] = 56'b0;
assign special_ex1_vsetvl_rslt[7:0]  = special_ex1_vsetvl_vl[7:0];

//==========================================================
//               RF stage Complete Bus signals
//==========================================================
// &CombBeg; @338
always @( cp0_yy_priv_mode[1:0])
begin
  case(cp0_yy_priv_mode[1:0])
    2'b00  : special_ex1_ecall_expt_vec[4:0] = 5'd8;
    2'b01  : special_ex1_ecall_expt_vec[4:0] = 5'd9;
    2'b11  : special_ex1_ecall_expt_vec[4:0] = 5'd11;
    default: special_ex1_ecall_expt_vec[4:0] = {5{1'bx}};
  endcase
// &CombEnd; @345
end

assign special_cbus_ex1_inst_vld         = special_ex1_inst_vld;
assign special_cbus_ex1_inst_gateclk_vld = special_ex1_inst_vld;
assign special_cbus_ex1_abnormal         = special_ex1_inst_nop
                                           && special_ex1_expt_vld
                                        || special_ex1_inst_ecall
                                        || special_ex1_inst_ebreak
                                        || special_ex1_vsetvlx_abnormal
                                        || special_ex1_vstart_clr;

assign special_cbus_ex1_iid[6:0]         = special_ex1_iid[6:0];

assign special_cbus_ex1_flush            = special_ex1_vsetvlx_abnormal
                                        || special_ex1_vstart_clr;

assign special_cbus_ex1_bkpt             = special_ex1_inst_ebreak;

assign special_cbus_ex1_vsetvl           = special_ex1_vsetvlx_abnormal;

assign special_cbus_ex1_vstart_vld       = special_ex1_vstart_clr;

assign special_cbus_ex1_vstart[6:0]      = 7'b0;

//----------------------------------------------------------
//                     Exception
//----------------------------------------------------------
assign special_cbus_ex1_expt_vld         = special_ex1_inst_ecall
                                        || special_ex1_inst_ebreak
                                        || special_ex1_inst_nop
                                           && special_ex1_expt_vld;
assign special_cbus_ex1_expt_vec[4:0] =
    {5{special_ex1_inst_ecall}}  & special_ex1_ecall_expt_vec[4:0]
  | {5{special_ex1_inst_ebreak}} & 5'd3
  | {5{special_ex1_inst_nop}}    & special_ex1_expt_vec[4:0];

assign special_cbus_ex1_high_hw_expt     = special_ex1_high_hw_expt;

assign special_ex1_illegal_expt          = special_ex1_inst_nop
                                           && special_ex1_expt_vld
                                           && (special_ex1_expt_vec[4:0] == 5'd2);

assign special_cbus_ex1_immu_expt        = special_ex1_inst_nop
                                           && special_ex1_expt_vld
                                           && ((special_ex1_expt_vec[4:0] == 5'd0)
                                            || (special_ex1_expt_vec[4:0] == 5'd1)
                                            || (special_ex1_expt_vec[4:0] == 5'd12));
// &CombBeg; @392
always @( special_ex1_illegal_expt
       or special_ex1_vsetvl_mtval[31:0]
       or special_ex1_inst_vsetvl
       or special_ex1_opcode[31:0]
       or special_ex1_inst_vsetvli)
begin
  if(special_ex1_illegal_expt)
    special_cbus_ex1_mtval[31:0] = special_ex1_opcode[31:0];
  else if(special_ex1_inst_vsetvl || special_ex1_inst_vsetvli)
    special_cbus_ex1_mtval[31:0] = special_ex1_vsetvl_mtval[31:0];
  else
    special_cbus_ex1_mtval[31:0] = 32'b0;
// &CombEnd; @399
end

//==========================================================
//                    Result Bus signals
//==========================================================
assign special_rbus_ex1_data_vld   = special_ex1_inst_vld
                                     && (special_ex1_inst_auipc
                                      || special_ex1_inst_pseudo_auipc
                                      || special_ex1_inst_vsetvli
                                      || special_ex1_inst_vsetvl);
assign special_rbus_ex1_preg[6:0]  = special_ex1_dst_preg[6:0];
assign special_rbus_ex1_data[63:0] = (special_ex1_inst_vsetvli || special_ex1_inst_vsetvl)
                                     ? special_ex1_vsetvl_rslt[63:0]
                                     : special_auipc_rslt[63:0];

// &ModuleEnd; @414
endmodule


