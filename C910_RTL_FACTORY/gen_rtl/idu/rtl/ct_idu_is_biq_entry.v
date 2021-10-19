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
module ct_idu_is_biq_entry(
  cp0_idu_icg_en,
  cp0_yy_clk_en,
  cpurst_b,
  ctrl_biq_rf_pop_vld,
  ctrl_xx_rf_pipe0_preg_lch_vld_dupx,
  ctrl_xx_rf_pipe1_preg_lch_vld_dupx,
  dp_biq_rf_rdy_clr,
  dp_xx_rf_pipe0_dst_preg_dupx,
  dp_xx_rf_pipe1_dst_preg_dupx,
  forever_cpuclk,
  iu_idu_div_inst_vld,
  iu_idu_div_preg_dupx,
  iu_idu_ex2_pipe0_wb_preg_dupx,
  iu_idu_ex2_pipe0_wb_preg_vld_dupx,
  iu_idu_ex2_pipe1_mult_inst_vld_dupx,
  iu_idu_ex2_pipe1_preg_dupx,
  iu_idu_ex2_pipe1_wb_preg_dupx,
  iu_idu_ex2_pipe1_wb_preg_vld_dupx,
  lsu_idu_ag_pipe3_load_inst_vld,
  lsu_idu_ag_pipe3_preg_dupx,
  lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx,
  lsu_idu_dc_pipe3_load_inst_vld_dupx,
  lsu_idu_dc_pipe3_preg_dupx,
  lsu_idu_wb_pipe3_wb_preg_dupx,
  lsu_idu_wb_pipe3_wb_preg_vld_dupx,
  pad_yy_icg_scan_en,
  rtu_idu_flush_fe,
  rtu_idu_flush_is,
  vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx,
  vfpu_idu_ex1_pipe6_preg_dupx,
  vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx,
  vfpu_idu_ex1_pipe7_preg_dupx,
  x_agevec,
  x_alu0_reg_fwd_vld,
  x_alu1_reg_fwd_vld,
  x_create_agevec,
  x_create_data,
  x_create_dp_en,
  x_create_en,
  x_create_frz,
  x_create_gateclk_en,
  x_frz_clr,
  x_issue_en,
  x_pop_cur_entry,
  x_pop_other_entry,
  x_rdy,
  x_read_data,
  x_vld,
  x_vld_with_frz
);

// &Ports; @28
input           cp0_idu_icg_en;                         
input           cp0_yy_clk_en;                          
input           cpurst_b;                               
input           ctrl_biq_rf_pop_vld;                    
input           ctrl_xx_rf_pipe0_preg_lch_vld_dupx;     
input           ctrl_xx_rf_pipe1_preg_lch_vld_dupx;     
input   [1 :0]  dp_biq_rf_rdy_clr;                      
input   [6 :0]  dp_xx_rf_pipe0_dst_preg_dupx;           
input   [6 :0]  dp_xx_rf_pipe1_dst_preg_dupx;           
input           forever_cpuclk;                         
input           iu_idu_div_inst_vld;                    
input   [6 :0]  iu_idu_div_preg_dupx;                   
input   [6 :0]  iu_idu_ex2_pipe0_wb_preg_dupx;          
input           iu_idu_ex2_pipe0_wb_preg_vld_dupx;      
input           iu_idu_ex2_pipe1_mult_inst_vld_dupx;    
input   [6 :0]  iu_idu_ex2_pipe1_preg_dupx;             
input   [6 :0]  iu_idu_ex2_pipe1_wb_preg_dupx;          
input           iu_idu_ex2_pipe1_wb_preg_vld_dupx;      
input           lsu_idu_ag_pipe3_load_inst_vld;         
input   [6 :0]  lsu_idu_ag_pipe3_preg_dupx;             
input           lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx; 
input           lsu_idu_dc_pipe3_load_inst_vld_dupx;    
input   [6 :0]  lsu_idu_dc_pipe3_preg_dupx;             
input   [6 :0]  lsu_idu_wb_pipe3_wb_preg_dupx;          
input           lsu_idu_wb_pipe3_wb_preg_vld_dupx;      
input           pad_yy_icg_scan_en;                     
input           rtu_idu_flush_fe;                       
input           rtu_idu_flush_is;                       
input           vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx;  
input   [6 :0]  vfpu_idu_ex1_pipe6_preg_dupx;           
input           vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx;  
input   [6 :0]  vfpu_idu_ex1_pipe7_preg_dupx;           
input   [1 :0]  x_alu0_reg_fwd_vld;                     
input   [1 :0]  x_alu1_reg_fwd_vld;                     
input   [10:0]  x_create_agevec;                        
input   [81:0]  x_create_data;                          
input           x_create_dp_en;                         
input           x_create_en;                            
input           x_create_frz;                           
input           x_create_gateclk_en;                    
input           x_frz_clr;                              
input           x_issue_en;                             
input           x_pop_cur_entry;                        
input   [10:0]  x_pop_other_entry;                      
output  [10:0]  x_agevec;                               
output          x_rdy;                                  
output  [81:0]  x_read_data;                            
output          x_vld;                                  
output          x_vld_with_frz;                         

// &Regs; @29
reg     [10:0]  agevec;                                 
reg             frz;                                    
reg     [6 :0]  iid;                                    
reg             length;                                 
reg     [31:0]  opcode;                                 
reg             pcall;                                  
reg     [4 :0]  pid;                                    
reg             rts;                                    
reg             src0_vld;                               
reg             src1_vld;                               
reg     [7 :0]  vl;                                     
reg             vld;                                    
reg     [1 :0]  vlmul;                                  
reg     [2 :0]  vsew;                                   

// &Wires; @30
wire            cp0_idu_icg_en;                         
wire            cp0_yy_clk_en;                          
wire            cpurst_b;                               
wire            create_clk;                             
wire            create_clk_en;                          
wire    [9 :0]  create_src0_data;                       
wire            create_src0_gateclk_en;                 
wire    [9 :0]  create_src1_data;                       
wire            create_src1_gateclk_en;                 
wire            ctrl_biq_rf_pop_vld;                    
wire            ctrl_xx_rf_pipe0_preg_lch_vld_dupx;     
wire            ctrl_xx_rf_pipe1_preg_lch_vld_dupx;     
wire    [1 :0]  dp_biq_rf_rdy_clr;                      
wire    [6 :0]  dp_xx_rf_pipe0_dst_preg_dupx;           
wire    [6 :0]  dp_xx_rf_pipe1_dst_preg_dupx;           
wire            entry_clk;                              
wire            entry_clk_en;                           
wire            forever_cpuclk;                         
wire            gateclk_entry_vld;                      
wire            iu_idu_div_inst_vld;                    
wire    [6 :0]  iu_idu_div_preg_dupx;                   
wire    [6 :0]  iu_idu_ex2_pipe0_wb_preg_dupx;          
wire            iu_idu_ex2_pipe0_wb_preg_vld_dupx;      
wire            iu_idu_ex2_pipe1_mult_inst_vld_dupx;    
wire    [6 :0]  iu_idu_ex2_pipe1_preg_dupx;             
wire    [6 :0]  iu_idu_ex2_pipe1_wb_preg_dupx;          
wire            iu_idu_ex2_pipe1_wb_preg_vld_dupx;      
wire            lsu_idu_ag_pipe3_load_inst_vld;         
wire    [6 :0]  lsu_idu_ag_pipe3_preg_dupx;             
wire            lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx; 
wire            lsu_idu_dc_pipe3_load_inst_vld_dupx;    
wire    [6 :0]  lsu_idu_dc_pipe3_preg_dupx;             
wire    [6 :0]  lsu_idu_wb_pipe3_wb_preg_dupx;          
wire            lsu_idu_wb_pipe3_wb_preg_vld_dupx;      
wire            pad_yy_icg_scan_en;                     
wire    [11:0]  read_src0_data;                         
wire    [11:0]  read_src1_data;                         
wire            rtu_idu_flush_fe;                       
wire            rtu_idu_flush_is;                       
wire            src0_rdy_clr;                           
wire            src0_rdy_for_issue;                     
wire            src1_rdy_clr;                           
wire            src1_rdy_for_issue;                     
wire            vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx;  
wire    [6 :0]  vfpu_idu_ex1_pipe6_preg_dupx;           
wire            vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx;  
wire    [6 :0]  vfpu_idu_ex1_pipe7_preg_dupx;           
wire    [10:0]  x_agevec;                               
wire    [1 :0]  x_alu0_reg_fwd_vld;                     
wire    [1 :0]  x_alu1_reg_fwd_vld;                     
wire    [10:0]  x_create_agevec;                        
wire    [81:0]  x_create_data;                          
wire            x_create_dp_en;                         
wire            x_create_en;                            
wire            x_create_frz;                           
wire            x_create_gateclk_en;                    
wire            x_frz_clr;                              
wire            x_issue_en;                             
wire            x_pop_cur_entry;                        
wire    [10:0]  x_pop_other_entry;                      
wire            x_rdy;                                  
wire    [81:0]  x_read_data;                            
wire            x_vld;                                  
wire            x_vld_with_frz;                         



//==========================================================
//                       Parameters
//==========================================================
//----------------------------------------------------------
//                    BIQ Parameters
//----------------------------------------------------------
parameter BIQ_WIDTH             = 82;

parameter BIQ_VL                = 81;
parameter BIQ_VSEW              = 73;
parameter BIQ_VLMUL             = 70;
parameter BIQ_PCALL             = 68;
parameter BIQ_RTS               = 67;
parameter BIQ_PID               = 66;
parameter BIQ_LENGTH            = 61;
parameter BIQ_SRC1_LSU_MATCH    = 60;
parameter BIQ_SRC1_DATA         = 59;
parameter BIQ_SRC1_PREG         = 59;
parameter BIQ_SRC1_WB           = 52;
parameter BIQ_SRC1_RDY          = 51;
parameter BIQ_SRC0_LSU_MATCH    = 50;
parameter BIQ_SRC0_DATA         = 49;
parameter BIQ_SRC0_PREG         = 49;
parameter BIQ_SRC0_WB           = 42;
parameter BIQ_SRC0_RDY          = 41;
parameter BIQ_SRC1_VLD          = 40;
parameter BIQ_SRC0_VLD          = 39;
parameter BIQ_IID               = 38;
parameter BIQ_OPCODE            = 31;

//==========================================================
//                 Instance of Gated Cell  
//==========================================================
assign entry_clk_en = x_create_gateclk_en || vld;
// &Instance("gated_clk_cell", "x_entry_gated_clk"); @67
gated_clk_cell  x_entry_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (entry_clk         ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (entry_clk_en      ),
  .module_en          (cp0_idu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @68
//          .external_en (1'b0), @69
//          .global_en   (cp0_yy_clk_en), @70
//          .module_en   (cp0_idu_icg_en), @71
//          .local_en    (entry_clk_en), @72
//          .clk_out     (entry_clk)); @73

assign create_clk_en = x_create_gateclk_en;
// &Instance("gated_clk_cell", "x_create_gated_clk"); @76
gated_clk_cell  x_create_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (create_clk        ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (create_clk_en     ),
  .module_en          (cp0_idu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @77
//          .external_en (1'b0), @78
//          .global_en   (cp0_yy_clk_en), @79
//          .module_en   (cp0_idu_icg_en), @80
//          .local_en    (create_clk_en), @81
//          .clk_out     (create_clk)); @82

//if entry is not valid, shut down dep info clock
assign gateclk_entry_vld = vld;

//==========================================================
//                  Create and Read Bus
//==========================================================
//force create and read bus width
// &Force("bus","x_create_data",BIQ_WIDTH-1,0); @91
// &Force("bus","x_read_data",BIQ_WIDTH-1,0); @92
// &Force("output","x_read_data"); @93

//==========================================================
//                      Entry Valid
//==========================================================
assign x_vld = vld;
always @(posedge entry_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    vld <= 1'b0;
  else if(rtu_idu_flush_fe || rtu_idu_flush_is)
    vld <= 1'b0;
  else if(x_create_en)
    vld <= 1'b1;
  else if(ctrl_biq_rf_pop_vld && x_pop_cur_entry)
    vld <= 1'b0;
  else
    vld <= vld;
end

//==========================================================
//                        Freeze
//==========================================================
assign x_vld_with_frz = vld && !frz;
always @(posedge entry_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    frz <= 1'b0;
  else if(x_create_en)
    frz <= x_create_frz;
  else if(x_frz_clr)
    frz <= 1'b0;
  else if(x_issue_en)
    frz <= 1'b1;
  else
    frz <= frz;
end

//==========================================================
//                       Age Vector
//==========================================================
assign x_agevec[10:0] = agevec[10:0];
always @(posedge entry_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    agevec[10:0] <= 11'b0;
  else if(x_create_en)
    agevec[10:0] <= x_create_agevec[10:0];
  else if(ctrl_biq_rf_pop_vld)
    agevec[10:0] <= agevec[10:0] & ~x_pop_other_entry[10:0];
  else
    agevec[10:0] <= agevec[10:0];
end

//==========================================================
//                 Instruction Information
//==========================================================
always @(posedge create_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    opcode[31:0]       <= 32'b0;
    iid[6:0]           <= 7'b0;
    src0_vld           <= 1'b0;
    src1_vld           <= 1'b0;
    length             <= 1'b0;
    rts                <= 1'b0;
    pcall              <= 1'b0;
    pid[4:0]           <= 5'b0;
    vlmul[1:0]         <= 2'b0;
    vsew[2:0]          <= 3'b0;
    vl[7:0]            <= 8'b0;
  end
  else if(x_create_dp_en) begin
    opcode[31:0]       <= x_create_data[BIQ_OPCODE:BIQ_OPCODE-31];
    iid[6:0]           <= x_create_data[BIQ_IID:BIQ_IID-6];
    src0_vld           <= x_create_data[BIQ_SRC0_VLD];
    src1_vld           <= x_create_data[BIQ_SRC1_VLD];
    length             <= x_create_data[BIQ_LENGTH];
    rts                <= x_create_data[BIQ_RTS];
    pcall              <= x_create_data[BIQ_PCALL];
    pid[4:0]           <= x_create_data[BIQ_PID:BIQ_PID-4];
    vlmul[1:0]         <= x_create_data[BIQ_VLMUL:BIQ_VLMUL-1];
    vsew[2:0]          <= x_create_data[BIQ_VSEW:BIQ_VSEW-2];
    vl[7:0]            <= x_create_data[BIQ_VL:BIQ_VL-7];
  end
  else begin
    opcode[31:0]       <= opcode[31:0];
    iid[6:0]           <= iid[6:0];
    src0_vld           <= src0_vld;
    src1_vld           <= src1_vld;
    length             <= length;
    rts                <= rts;
    pcall              <= pcall;
    pid[4:0]           <= pid[4:0];
    vlmul[1:0]         <= vlmul[1:0];
    vsew[2:0]          <= vsew[2:0];
    vl[7:0]            <= vl[7:0];
  end
end

//rename for read output
assign x_read_data[BIQ_OPCODE:BIQ_OPCODE-31] = opcode[31:0];
assign x_read_data[BIQ_IID:BIQ_IID-6]        = iid[6:0];
assign x_read_data[BIQ_SRC0_VLD]             = src0_vld;
assign x_read_data[BIQ_SRC1_VLD]             = src1_vld;
assign x_read_data[BIQ_LENGTH]               = length;
assign x_read_data[BIQ_RTS]                  = rts;
assign x_read_data[BIQ_PCALL]                = pcall;
assign x_read_data[BIQ_PID:BIQ_PID-4]        = pid[4:0];
assign x_read_data[BIQ_VLMUL:BIQ_VLMUL-1]    = vlmul[1:0];
assign x_read_data[BIQ_VSEW:BIQ_VSEW-2]      = vsew[2:0];
assign x_read_data[BIQ_VL:BIQ_VL-7]          = vl[7:0];

//==========================================================
//              Source Dependency Information
//==========================================================
assign src0_rdy_clr = x_frz_clr && dp_biq_rf_rdy_clr[0];
assign src1_rdy_clr = x_frz_clr && dp_biq_rf_rdy_clr[1];

//------------------------source 0--------------------------
assign create_src0_gateclk_en = x_create_gateclk_en && x_create_data[BIQ_SRC0_VLD];
assign create_src0_data[9]    = x_create_data[BIQ_SRC0_LSU_MATCH];
assign create_src0_data[8:0]  = x_create_data[BIQ_SRC0_DATA:BIQ_SRC0_DATA-8];
// &Instance("ct_idu_dep_reg_entry", "x_ct_idu_is_biq_src0_entry"); @216
ct_idu_dep_reg_entry  x_ct_idu_is_biq_src0_entry (
  .alu0_reg_fwd_vld                        (x_alu0_reg_fwd_vld[0]                  ),
  .alu1_reg_fwd_vld                        (x_alu1_reg_fwd_vld[0]                  ),
  .cp0_idu_icg_en                          (cp0_idu_icg_en                         ),
  .cp0_yy_clk_en                           (cp0_yy_clk_en                          ),
  .cpurst_b                                (cpurst_b                               ),
  .ctrl_xx_rf_pipe0_preg_lch_vld_dupx      (ctrl_xx_rf_pipe0_preg_lch_vld_dupx     ),
  .ctrl_xx_rf_pipe1_preg_lch_vld_dupx      (ctrl_xx_rf_pipe1_preg_lch_vld_dupx     ),
  .dp_xx_rf_pipe0_dst_preg_dupx            (dp_xx_rf_pipe0_dst_preg_dupx           ),
  .dp_xx_rf_pipe1_dst_preg_dupx            (dp_xx_rf_pipe1_dst_preg_dupx           ),
  .forever_cpuclk                          (forever_cpuclk                         ),
  .gateclk_entry_vld                       (gateclk_entry_vld                      ),
  .iu_idu_div_inst_vld                     (iu_idu_div_inst_vld                    ),
  .iu_idu_div_preg_dupx                    (iu_idu_div_preg_dupx                   ),
  .iu_idu_ex2_pipe0_wb_preg_dupx           (iu_idu_ex2_pipe0_wb_preg_dupx          ),
  .iu_idu_ex2_pipe0_wb_preg_vld_dupx       (iu_idu_ex2_pipe0_wb_preg_vld_dupx      ),
  .iu_idu_ex2_pipe1_mult_inst_vld_dupx     (iu_idu_ex2_pipe1_mult_inst_vld_dupx    ),
  .iu_idu_ex2_pipe1_preg_dupx              (iu_idu_ex2_pipe1_preg_dupx             ),
  .iu_idu_ex2_pipe1_wb_preg_dupx           (iu_idu_ex2_pipe1_wb_preg_dupx          ),
  .iu_idu_ex2_pipe1_wb_preg_vld_dupx       (iu_idu_ex2_pipe1_wb_preg_vld_dupx      ),
  .lsu_idu_ag_pipe3_load_inst_vld          (lsu_idu_ag_pipe3_load_inst_vld         ),
  .lsu_idu_ag_pipe3_preg_dupx              (lsu_idu_ag_pipe3_preg_dupx             ),
  .lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx (lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx),
  .lsu_idu_dc_pipe3_load_inst_vld_dupx     (lsu_idu_dc_pipe3_load_inst_vld_dupx    ),
  .lsu_idu_dc_pipe3_preg_dupx              (lsu_idu_dc_pipe3_preg_dupx             ),
  .lsu_idu_wb_pipe3_wb_preg_dupx           (lsu_idu_wb_pipe3_wb_preg_dupx          ),
  .lsu_idu_wb_pipe3_wb_preg_vld_dupx       (lsu_idu_wb_pipe3_wb_preg_vld_dupx      ),
  .pad_yy_icg_scan_en                      (pad_yy_icg_scan_en                     ),
  .rtu_idu_flush_fe                        (rtu_idu_flush_fe                       ),
  .rtu_idu_flush_is                        (rtu_idu_flush_is                       ),
  .vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe6_preg_dupx            (vfpu_idu_ex1_pipe6_preg_dupx           ),
  .vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe7_preg_dupx            (vfpu_idu_ex1_pipe7_preg_dupx           ),
  .x_create_data                           (create_src0_data[9:0]                  ),
  .x_gateclk_idx_write_en                  (create_src0_gateclk_en                 ),
  .x_gateclk_write_en                      (x_create_gateclk_en                    ),
  .x_rdy_clr                               (src0_rdy_clr                           ),
  .x_read_data                             (read_src0_data[11:0]                   ),
  .x_write_en                              (x_create_dp_en                         )
);

// &Connect(.gateclk_entry_vld        (gateclk_entry_vld), @217
//          .alu0_reg_fwd_vld         (x_alu0_reg_fwd_vld[0]), @218
//          .alu1_reg_fwd_vld         (x_alu1_reg_fwd_vld[0]), @219
//          .x_write_en               (x_create_dp_en), @220
//          .x_gateclk_write_en       (x_create_gateclk_en), @221
//          .x_gateclk_idx_write_en   (create_src0_gateclk_en), @222
//          .x_create_data            (create_src0_data[9:0]), @223
//          .x_read_data              (read_src0_data[11:0]), @224
//          .x_rdy_clr                (src0_rdy_clr) @225
//         ); @226
assign x_read_data[BIQ_SRC0_WB]                   = read_src0_data[1];
assign x_read_data[BIQ_SRC0_PREG:BIQ_SRC0_PREG-6] = read_src0_data[8:2];
assign src0_rdy_for_issue                         = read_src0_data[9];
assign x_read_data[BIQ_SRC0_RDY]                  = 1'b0;
assign x_read_data[BIQ_SRC0_LSU_MATCH]            = 1'b0;

//------------------------source 1--------------------------
assign create_src1_gateclk_en = x_create_gateclk_en && x_create_data[BIQ_SRC1_VLD];
assign create_src1_data[9]    = x_create_data[BIQ_SRC1_LSU_MATCH];
assign create_src1_data[8:0]  = x_create_data[BIQ_SRC1_DATA:BIQ_SRC1_DATA-8];
// &Instance("ct_idu_dep_reg_entry", "x_ct_idu_is_biq_src1_entry"); @237
ct_idu_dep_reg_entry  x_ct_idu_is_biq_src1_entry (
  .alu0_reg_fwd_vld                        (x_alu0_reg_fwd_vld[1]                  ),
  .alu1_reg_fwd_vld                        (x_alu1_reg_fwd_vld[1]                  ),
  .cp0_idu_icg_en                          (cp0_idu_icg_en                         ),
  .cp0_yy_clk_en                           (cp0_yy_clk_en                          ),
  .cpurst_b                                (cpurst_b                               ),
  .ctrl_xx_rf_pipe0_preg_lch_vld_dupx      (ctrl_xx_rf_pipe0_preg_lch_vld_dupx     ),
  .ctrl_xx_rf_pipe1_preg_lch_vld_dupx      (ctrl_xx_rf_pipe1_preg_lch_vld_dupx     ),
  .dp_xx_rf_pipe0_dst_preg_dupx            (dp_xx_rf_pipe0_dst_preg_dupx           ),
  .dp_xx_rf_pipe1_dst_preg_dupx            (dp_xx_rf_pipe1_dst_preg_dupx           ),
  .forever_cpuclk                          (forever_cpuclk                         ),
  .gateclk_entry_vld                       (gateclk_entry_vld                      ),
  .iu_idu_div_inst_vld                     (iu_idu_div_inst_vld                    ),
  .iu_idu_div_preg_dupx                    (iu_idu_div_preg_dupx                   ),
  .iu_idu_ex2_pipe0_wb_preg_dupx           (iu_idu_ex2_pipe0_wb_preg_dupx          ),
  .iu_idu_ex2_pipe0_wb_preg_vld_dupx       (iu_idu_ex2_pipe0_wb_preg_vld_dupx      ),
  .iu_idu_ex2_pipe1_mult_inst_vld_dupx     (iu_idu_ex2_pipe1_mult_inst_vld_dupx    ),
  .iu_idu_ex2_pipe1_preg_dupx              (iu_idu_ex2_pipe1_preg_dupx             ),
  .iu_idu_ex2_pipe1_wb_preg_dupx           (iu_idu_ex2_pipe1_wb_preg_dupx          ),
  .iu_idu_ex2_pipe1_wb_preg_vld_dupx       (iu_idu_ex2_pipe1_wb_preg_vld_dupx      ),
  .lsu_idu_ag_pipe3_load_inst_vld          (lsu_idu_ag_pipe3_load_inst_vld         ),
  .lsu_idu_ag_pipe3_preg_dupx              (lsu_idu_ag_pipe3_preg_dupx             ),
  .lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx (lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx),
  .lsu_idu_dc_pipe3_load_inst_vld_dupx     (lsu_idu_dc_pipe3_load_inst_vld_dupx    ),
  .lsu_idu_dc_pipe3_preg_dupx              (lsu_idu_dc_pipe3_preg_dupx             ),
  .lsu_idu_wb_pipe3_wb_preg_dupx           (lsu_idu_wb_pipe3_wb_preg_dupx          ),
  .lsu_idu_wb_pipe3_wb_preg_vld_dupx       (lsu_idu_wb_pipe3_wb_preg_vld_dupx      ),
  .pad_yy_icg_scan_en                      (pad_yy_icg_scan_en                     ),
  .rtu_idu_flush_fe                        (rtu_idu_flush_fe                       ),
  .rtu_idu_flush_is                        (rtu_idu_flush_is                       ),
  .vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe6_preg_dupx            (vfpu_idu_ex1_pipe6_preg_dupx           ),
  .vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe7_preg_dupx            (vfpu_idu_ex1_pipe7_preg_dupx           ),
  .x_create_data                           (create_src1_data[9:0]                  ),
  .x_gateclk_idx_write_en                  (create_src1_gateclk_en                 ),
  .x_gateclk_write_en                      (x_create_gateclk_en                    ),
  .x_rdy_clr                               (src1_rdy_clr                           ),
  .x_read_data                             (read_src1_data[11:0]                   ),
  .x_write_en                              (x_create_dp_en                         )
);

// &Connect(.gateclk_entry_vld        (gateclk_entry_vld), @238
//          .alu0_reg_fwd_vld         (x_alu0_reg_fwd_vld[1]), @239
//          .alu1_reg_fwd_vld         (x_alu1_reg_fwd_vld[1]), @240
//          .x_write_en               (x_create_dp_en), @241
//          .x_gateclk_write_en       (x_create_gateclk_en), @242
//          .x_gateclk_idx_write_en   (create_src1_gateclk_en), @243
//          .x_create_data            (create_src1_data[9:0]), @244
//          .x_read_data              (read_src1_data[11:0]), @245
//          .x_rdy_clr                (src1_rdy_clr) @246
//         ); @247
assign x_read_data[BIQ_SRC1_WB]                   = read_src1_data[1];
assign x_read_data[BIQ_SRC1_PREG:BIQ_SRC1_PREG-6] = read_src1_data[8:2];
assign src1_rdy_for_issue                         = read_src1_data[9];
assign x_read_data[BIQ_SRC1_RDY]                  = 1'b0;
assign x_read_data[BIQ_SRC1_LSU_MATCH]            = 1'b0;

//==========================================================
//                  Entry Ready Signal
//==========================================================
assign x_rdy = vld
               && !frz
               && src0_rdy_for_issue
               && src1_rdy_for_issue;

// &ModuleEnd; @262
endmodule


