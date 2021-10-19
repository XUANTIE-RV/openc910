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
module ct_idu_is_sdiq_entry(
  cp0_idu_icg_en,
  cp0_yy_clk_en,
  cpurst_b,
  ctrl_xx_rf_pipe0_preg_lch_vld_dupx,
  ctrl_xx_rf_pipe1_preg_lch_vld_dupx,
  dp_sdiq_rf_rdy_clr,
  dp_sdiq_rf_staddr1_vld,
  dp_sdiq_rf_staddr_rdy_clr,
  dp_sdiq_rf_stdata1_vld,
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
  lsu_idu_ag_pipe3_vload_inst_vld,
  lsu_idu_ag_pipe3_vreg_dupx,
  lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx,
  lsu_idu_dc_pipe3_load_inst_vld_dupx,
  lsu_idu_dc_pipe3_preg_dupx,
  lsu_idu_dc_pipe3_vload_fwd_inst_vld,
  lsu_idu_dc_pipe3_vload_inst_vld_dupx,
  lsu_idu_dc_pipe3_vreg_dupx,
  lsu_idu_dc_staddr1_vld,
  lsu_idu_dc_staddr_unalign,
  lsu_idu_ex1_sdiq_pop_vld,
  lsu_idu_wb_pipe3_wb_preg_dupx,
  lsu_idu_wb_pipe3_wb_preg_vld_dupx,
  lsu_idu_wb_pipe3_wb_vreg_dupx,
  lsu_idu_wb_pipe3_wb_vreg_vld_dupx,
  pad_yy_icg_scan_en,
  rtu_yy_xx_flush,
  vfpu_idu_ex1_pipe6_data_vld_dupx,
  vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx,
  vfpu_idu_ex1_pipe6_preg_dupx,
  vfpu_idu_ex1_pipe6_vreg_dupx,
  vfpu_idu_ex1_pipe7_data_vld_dupx,
  vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx,
  vfpu_idu_ex1_pipe7_preg_dupx,
  vfpu_idu_ex1_pipe7_vreg_dupx,
  vfpu_idu_ex2_pipe6_data_vld_dupx,
  vfpu_idu_ex2_pipe6_vreg_dupx,
  vfpu_idu_ex2_pipe7_data_vld_dupx,
  vfpu_idu_ex2_pipe7_vreg_dupx,
  vfpu_idu_ex3_pipe6_data_vld_dupx,
  vfpu_idu_ex3_pipe6_vreg_dupx,
  vfpu_idu_ex3_pipe7_data_vld_dupx,
  vfpu_idu_ex3_pipe7_vreg_dupx,
  vfpu_idu_ex5_pipe6_wb_vreg_dupx,
  vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx,
  vfpu_idu_ex5_pipe7_wb_vreg_dupx,
  vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx,
  x_agevec,
  x_alu0_reg_fwd_vld,
  x_alu1_reg_fwd_vld,
  x_create_agevec,
  x_create_data,
  x_create_dp_en,
  x_create_en,
  x_create_gateclk_en,
  x_ex1_frz_clr,
  x_issue_en,
  x_pop_cur_entry,
  x_pop_other_entry,
  x_rdy,
  x_read_data,
  x_rf_frz_clr,
  x_src0_preg_expand,
  x_srcf_freg_expand,
  x_srcv_vreg_expand,
  x_staddr_rdy_set,
  x_staddr_stq_create,
  x_vld,
  x_vld_with_frz
);

// &Ports; @28
input           cp0_idu_icg_en;                         
input           cp0_yy_clk_en;                          
input           cpurst_b;                               
input           ctrl_xx_rf_pipe0_preg_lch_vld_dupx;     
input           ctrl_xx_rf_pipe1_preg_lch_vld_dupx;     
input   [1 :0]  dp_sdiq_rf_rdy_clr;                     
input           dp_sdiq_rf_staddr1_vld;                 
input           dp_sdiq_rf_staddr_rdy_clr;              
input           dp_sdiq_rf_stdata1_vld;                 
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
input           lsu_idu_ag_pipe3_vload_inst_vld;        
input   [6 :0]  lsu_idu_ag_pipe3_vreg_dupx;             
input           lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx; 
input           lsu_idu_dc_pipe3_load_inst_vld_dupx;    
input   [6 :0]  lsu_idu_dc_pipe3_preg_dupx;             
input           lsu_idu_dc_pipe3_vload_fwd_inst_vld;    
input           lsu_idu_dc_pipe3_vload_inst_vld_dupx;   
input   [6 :0]  lsu_idu_dc_pipe3_vreg_dupx;             
input           lsu_idu_dc_staddr1_vld;                 
input           lsu_idu_dc_staddr_unalign;              
input           lsu_idu_ex1_sdiq_pop_vld;               
input   [6 :0]  lsu_idu_wb_pipe3_wb_preg_dupx;          
input           lsu_idu_wb_pipe3_wb_preg_vld_dupx;      
input   [6 :0]  lsu_idu_wb_pipe3_wb_vreg_dupx;          
input           lsu_idu_wb_pipe3_wb_vreg_vld_dupx;      
input           pad_yy_icg_scan_en;                     
input           rtu_yy_xx_flush;                        
input           vfpu_idu_ex1_pipe6_data_vld_dupx;       
input           vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx;  
input   [6 :0]  vfpu_idu_ex1_pipe6_preg_dupx;           
input   [6 :0]  vfpu_idu_ex1_pipe6_vreg_dupx;           
input           vfpu_idu_ex1_pipe7_data_vld_dupx;       
input           vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx;  
input   [6 :0]  vfpu_idu_ex1_pipe7_preg_dupx;           
input   [6 :0]  vfpu_idu_ex1_pipe7_vreg_dupx;           
input           vfpu_idu_ex2_pipe6_data_vld_dupx;       
input   [6 :0]  vfpu_idu_ex2_pipe6_vreg_dupx;           
input           vfpu_idu_ex2_pipe7_data_vld_dupx;       
input   [6 :0]  vfpu_idu_ex2_pipe7_vreg_dupx;           
input           vfpu_idu_ex3_pipe6_data_vld_dupx;       
input   [6 :0]  vfpu_idu_ex3_pipe6_vreg_dupx;           
input           vfpu_idu_ex3_pipe7_data_vld_dupx;       
input   [6 :0]  vfpu_idu_ex3_pipe7_vreg_dupx;           
input   [6 :0]  vfpu_idu_ex5_pipe6_wb_vreg_dupx;        
input           vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx;    
input   [6 :0]  vfpu_idu_ex5_pipe7_wb_vreg_dupx;        
input           vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx;    
input           x_alu0_reg_fwd_vld;                     
input           x_alu1_reg_fwd_vld;                     
input   [10:0]  x_create_agevec;                        
input   [26:0]  x_create_data;                          
input           x_create_dp_en;                         
input           x_create_en;                            
input           x_create_gateclk_en;                    
input           x_ex1_frz_clr;                          
input           x_issue_en;                             
input           x_pop_cur_entry;                        
input   [10:0]  x_pop_other_entry;                      
input           x_rf_frz_clr;                           
input           x_staddr_rdy_set;                       
input           x_staddr_stq_create;                    
output  [10:0]  x_agevec;                               
output          x_rdy;                                  
output  [26:0]  x_read_data;                            
output  [95:0]  x_src0_preg_expand;                     
output  [63:0]  x_srcf_freg_expand;                     
output  [63:0]  x_srcv_vreg_expand;                     
output          x_vld;                                  
output          x_vld_with_frz;                         

// &Regs; @29
reg     [10:0]  agevec;                                 
reg             frz;                                    
reg             load;                                   
reg             src0_vld;                               
reg             srcv0_vld;                              
reg             staddr0_in_stq;                         
reg             staddr0_rdy;                            
reg             staddr1_in_stq;                         
reg             staddr1_rdy;                            
reg             stdata1_vld;                            
reg             unalign;                                
reg             vld;                                    

// &Wires; @30
wire            cp0_idu_icg_en;                         
wire            cp0_yy_clk_en;                          
wire            cpurst_b;                               
wire    [9 :0]  create_src0_data;                       
wire            create_src0_gateclk_en;                 
wire    [9 :0]  create_srcv0_data;                      
wire            create_srcv0_gateclk_en;                
wire            ctrl_xx_rf_pipe0_preg_lch_vld_dupx;     
wire            ctrl_xx_rf_pipe1_preg_lch_vld_dupx;     
wire    [1 :0]  dp_sdiq_rf_rdy_clr;                     
wire            dp_sdiq_rf_staddr1_vld;                 
wire            dp_sdiq_rf_staddr_rdy_clr;              
wire            dp_sdiq_rf_stdata1_vld;                 
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
wire            lsu_idu_ag_pipe3_vload_inst_vld;        
wire    [6 :0]  lsu_idu_ag_pipe3_vreg_dupx;             
wire            lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx; 
wire            lsu_idu_dc_pipe3_load_inst_vld_dupx;    
wire    [6 :0]  lsu_idu_dc_pipe3_preg_dupx;             
wire            lsu_idu_dc_pipe3_vload_fwd_inst_vld;    
wire            lsu_idu_dc_pipe3_vload_inst_vld_dupx;   
wire    [6 :0]  lsu_idu_dc_pipe3_vreg_dupx;             
wire            lsu_idu_dc_staddr1_vld;                 
wire            lsu_idu_dc_staddr_unalign;              
wire            lsu_idu_ex1_sdiq_pop_vld;               
wire    [6 :0]  lsu_idu_wb_pipe3_wb_preg_dupx;          
wire            lsu_idu_wb_pipe3_wb_preg_vld_dupx;      
wire    [6 :0]  lsu_idu_wb_pipe3_wb_vreg_dupx;          
wire            lsu_idu_wb_pipe3_wb_vreg_vld_dupx;      
wire            pad_yy_icg_scan_en;                     
wire    [6 :0]  read_data_src0_preg;                    
wire    [95:0]  read_data_src0_preg_expand;             
wire    [5 :0]  read_data_srcv0_vreg;                   
wire    [63:0]  read_data_srcv0_vreg_expand;            
wire    [11:0]  read_src0_data;                         
wire    [11:0]  read_srcv0_data;                        
wire            rtu_yy_xx_flush;                        
wire            src0_rdy_clr;                           
wire            src0_rdy_for_issue;                     
wire            srcv0_rdy_clr;                          
wire            srcv0_rdy_for_issue;                    
wire            staddr0_rdy_clr;                        
wire            staddr0_rdy_set;                        
wire            staddr1_rdy_clr;                        
wire            staddr1_rdy_set;                        
wire            vfpu_idu_ex1_pipe6_data_vld_dupx;       
wire            vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx;  
wire    [6 :0]  vfpu_idu_ex1_pipe6_preg_dupx;           
wire    [6 :0]  vfpu_idu_ex1_pipe6_vreg_dupx;           
wire            vfpu_idu_ex1_pipe7_data_vld_dupx;       
wire            vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx;  
wire    [6 :0]  vfpu_idu_ex1_pipe7_preg_dupx;           
wire    [6 :0]  vfpu_idu_ex1_pipe7_vreg_dupx;           
wire            vfpu_idu_ex2_pipe6_data_vld_dupx;       
wire    [6 :0]  vfpu_idu_ex2_pipe6_vreg_dupx;           
wire            vfpu_idu_ex2_pipe7_data_vld_dupx;       
wire    [6 :0]  vfpu_idu_ex2_pipe7_vreg_dupx;           
wire            vfpu_idu_ex3_pipe6_data_vld_dupx;       
wire    [6 :0]  vfpu_idu_ex3_pipe6_vreg_dupx;           
wire            vfpu_idu_ex3_pipe7_data_vld_dupx;       
wire    [6 :0]  vfpu_idu_ex3_pipe7_vreg_dupx;           
wire    [6 :0]  vfpu_idu_ex5_pipe6_wb_vreg_dupx;        
wire            vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx;    
wire    [6 :0]  vfpu_idu_ex5_pipe7_wb_vreg_dupx;        
wire            vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx;    
wire    [10:0]  x_agevec;                               
wire            x_alu0_reg_fwd_vld;                     
wire            x_alu1_reg_fwd_vld;                     
wire    [10:0]  x_create_agevec;                        
wire    [26:0]  x_create_data;                          
wire            x_create_dp_en;                         
wire            x_create_en;                            
wire            x_create_gateclk_en;                    
wire            x_ex1_frz_clr;                          
wire            x_issue_en;                             
wire            x_pop_cur_entry;                        
wire    [10:0]  x_pop_other_entry;                      
wire            x_rdy;                                  
wire    [26:0]  x_read_data;                            
wire            x_rf_frz_clr;                           
wire    [95:0]  x_src0_preg_expand;                     
wire    [63:0]  x_srcf_freg_expand;                     
wire    [63:0]  x_srcv_vreg_expand;                     
wire            x_staddr_rdy_set;                       
wire            x_staddr_stq_create;                    
wire            x_vld;                                  
wire            x_vld_with_frz;                         



//==========================================================
//                       Parameters
//==========================================================
//----------------------------------------------------------
//                    SDIQ Parameters
//----------------------------------------------------------
parameter SDIQ_WIDTH             = 27;

parameter SDIQ_LOAD              = 26;
parameter SDIQ_STADDR1_IN_STQ    = 25;
parameter SDIQ_STADDR0_IN_STQ    = 24;
parameter SDIQ_STDATA1_VLD       = 23;
parameter SDIQ_UNALIGN           = 22;
parameter SDIQ_SRCV0_LSU_MATCH   = 21;
parameter SDIQ_SRCV0_DATA        = 20;
parameter SDIQ_SRCV0_VREG        = 20;
parameter SDIQ_SRCV0_WB          = 13;
parameter SDIQ_SRCV0_RDY         = 12;
parameter SDIQ_SRC0_LSU_MATCH    = 11;
parameter SDIQ_SRC0_DATA         = 10;
parameter SDIQ_SRC0_PREG         = 10;
parameter SDIQ_SRC0_WB           = 3;
parameter SDIQ_SRC0_RDY          = 2;
parameter SDIQ_SRCV0_VLD         = 1;
parameter SDIQ_SRC0_VLD          = 0;

//==========================================================
//                 Instance of Gated Cell  
//==========================================================
assign entry_clk_en = x_create_gateclk_en || vld;
// &Instance("gated_clk_cell", "x_entry_gated_clk"); @63
gated_clk_cell  x_entry_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (entry_clk         ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (entry_clk_en      ),
  .module_en          (cp0_idu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @64
//          .external_en (1'b0), @65
//          .global_en   (cp0_yy_clk_en), @66
//          .module_en   (cp0_idu_icg_en), @67
//          .local_en    (entry_clk_en), @68
//          .clk_out     (entry_clk)); @69

//if entry is not valid, shut down dep info clock
assign gateclk_entry_vld = vld;

//==========================================================
//                  Create and Read Bus
//==========================================================
//force create and read bus width
// &Force("bus","x_create_data",SDIQ_WIDTH-1,0); @78
// &Force("bus","x_read_data",SDIQ_WIDTH-1,0); @79
// &Force("output","x_read_data"); @80

//==========================================================
//                      Entry Valid
//==========================================================
assign x_vld = vld;
always @(posedge entry_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    vld <= 1'b0;
  else if(rtu_yy_xx_flush)
    vld <= 1'b0;
  else if(x_create_en)
    vld <= 1'b1;
  else if(lsu_idu_ex1_sdiq_pop_vld && x_pop_cur_entry)
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
    //SDIQ cannot bypass, create in frz is always 0
    frz <= 1'b0;
  else if(x_rf_frz_clr || x_ex1_frz_clr)
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
  else if(lsu_idu_ex1_sdiq_pop_vld)
    agevec[10:0] <= agevec[10:0] & ~x_pop_other_entry[10:0];
  else
    agevec[10:0] <= agevec[10:0];
end

//==========================================================
//                 Instruction Information
//==========================================================
always @(posedge entry_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    src0_vld           <= 1'b0;
    srcv0_vld          <= 1'b0;
    load               <= 1'b0;
  end
  else if(x_create_dp_en) begin
    src0_vld           <= x_create_data[SDIQ_SRC0_VLD];
    srcv0_vld          <= x_create_data[SDIQ_SRCV0_VLD];
    load               <= x_create_data[SDIQ_LOAD];
  end
  else begin
    src0_vld           <= src0_vld;
    srcv0_vld          <= srcv0_vld;
    load               <= load;
  end
end

//rename for read output
assign x_read_data[SDIQ_SRC0_VLD]           = src0_vld;
assign x_read_data[SDIQ_SRCV0_VLD]          = srcv0_vld;
assign x_read_data[SDIQ_LOAD]               = load;

//==========================================================
//             Store Address Instruction Ready
//==========================================================
//----------------------------------------------------------
//                    Staddr 0 Ready
//----------------------------------------------------------
assign staddr0_rdy_clr = x_rf_frz_clr
                         && dp_sdiq_rf_staddr_rdy_clr
                         && !dp_sdiq_rf_stdata1_vld;
assign staddr0_rdy_set = staddr0_in_stq
                         || x_staddr_rdy_set
                            && !dp_sdiq_rf_staddr1_vld;
always @(posedge entry_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    staddr0_rdy <= 1'b0;
  else if(x_create_en)
    staddr0_rdy <= 1'b0;
  else if(staddr0_rdy_clr)
    staddr0_rdy <= 1'b0;
  else if(staddr0_rdy_set)
    staddr0_rdy <= 1'b1;
  else
    staddr0_rdy <= staddr0_rdy;
end

//----------------------------------------------------------
//                    Staddr 1 Ready
//----------------------------------------------------------
assign staddr1_rdy_clr = x_rf_frz_clr 
                         && dp_sdiq_rf_staddr_rdy_clr 
                         && dp_sdiq_rf_stdata1_vld;
assign staddr1_rdy_set = staddr1_in_stq
                         || x_staddr_rdy_set
                            && dp_sdiq_rf_staddr1_vld;
always @(posedge entry_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    staddr1_rdy <= 1'b0;
  else if(x_create_en)
    staddr1_rdy <= 1'b0;
  else if(staddr1_rdy_clr)
    staddr1_rdy <= 1'b0;
  else if(staddr1_rdy_set)
    staddr1_rdy <= 1'b1;
  else
    staddr1_rdy <= staddr1_rdy;
end

//----------------------------------------------------------
//                 Staddr 0 in Store Queue
//----------------------------------------------------------
always @(posedge entry_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    staddr0_in_stq <= 1'b0;
    unalign        <= 1'b0;
  end
  else if(x_create_en) begin
    staddr0_in_stq <= 1'b0;
    unalign        <= 1'b0;
  end
  else if(x_staddr_stq_create && !lsu_idu_dc_staddr1_vld) begin
    staddr0_in_stq <= 1'b1;
    unalign        <= lsu_idu_dc_staddr_unalign;
  end
  else begin
    staddr0_in_stq <= staddr0_in_stq;
    unalign        <= unalign;
  end
end

assign x_read_data[SDIQ_UNALIGN] = unalign || x_staddr_stq_create
                                            && !lsu_idu_dc_staddr1_vld
                                            && lsu_idu_dc_staddr_unalign;
assign x_read_data[SDIQ_STADDR0_IN_STQ] = staddr0_in_stq
                                        || x_staddr_stq_create 
                                           && !lsu_idu_dc_staddr1_vld;

//----------------------------------------------------------
//                 Staddr 1 in Store Queue
//----------------------------------------------------------
always @(posedge entry_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    staddr1_in_stq <= 1'b0;
  else if(x_create_en)
    staddr1_in_stq <= 1'b0;
  else if(x_staddr_stq_create && lsu_idu_dc_staddr1_vld)
    staddr1_in_stq <= 1'b1;
  else
    staddr1_in_stq <= staddr1_in_stq;
end

assign x_read_data[SDIQ_STADDR1_IN_STQ] = staddr1_in_stq
                                        || x_staddr_stq_create
                                           && lsu_idu_dc_staddr1_vld;

//==========================================================
//                  Store Data 1 Valid
//==========================================================
//indicate the current entry is unalign stdata inst 1
always @(posedge entry_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    stdata1_vld <= 1'b0;
  else if(x_create_en)
    stdata1_vld <= 1'b0;
  else if(x_ex1_frz_clr)
    stdata1_vld <= 1'b1;
  else
    stdata1_vld <= stdata1_vld;
end

assign x_read_data[SDIQ_STDATA1_VLD] = stdata1_vld;

//==========================================================
//              Source Dependency Information
//==========================================================
assign src0_rdy_clr  = x_rf_frz_clr && dp_sdiq_rf_rdy_clr[0];
assign srcv0_rdy_clr = x_rf_frz_clr && dp_sdiq_rf_rdy_clr[1];
//SDIQ is flush by backend rtu_yy_xx_flush, not frontend or IS
//flush
//------------------------source 0--------------------------
assign create_src0_gateclk_en = x_create_gateclk_en && x_create_data[SDIQ_SRC0_VLD];
assign create_src0_data[9]    = x_create_data[SDIQ_SRC0_LSU_MATCH];
assign create_src0_data[8:0]  = x_create_data[SDIQ_SRC0_DATA:SDIQ_SRC0_DATA-8];
// &Instance("ct_idu_dep_reg_entry", "x_ct_idu_is_sdiq_src0_entry"); @289
ct_idu_dep_reg_entry  x_ct_idu_is_sdiq_src0_entry (
  .alu0_reg_fwd_vld                        (x_alu0_reg_fwd_vld                     ),
  .alu1_reg_fwd_vld                        (x_alu1_reg_fwd_vld                     ),
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
  .rtu_idu_flush_fe                        (rtu_yy_xx_flush                        ),
  .rtu_idu_flush_is                        (rtu_yy_xx_flush                        ),
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

// &Connect(.gateclk_entry_vld        (gateclk_entry_vld), @290
//          .rtu_idu_flush_fe         (rtu_yy_xx_flush), @291
//          .rtu_idu_flush_is         (rtu_yy_xx_flush), @292
//          .alu0_reg_fwd_vld         (x_alu0_reg_fwd_vld), @293
//          .alu1_reg_fwd_vld         (x_alu1_reg_fwd_vld), @294
//          .x_write_en               (x_create_dp_en), @295
//          .x_gateclk_write_en       (x_create_gateclk_en), @296
//          .x_gateclk_idx_write_en   (create_src0_gateclk_en), @297
//          .x_create_data            (create_src0_data[9:0]), @298
//          .x_read_data              (read_src0_data[11:0]), @299
//          .x_rdy_clr                (src0_rdy_clr) @300
//         ); @301
assign x_read_data[SDIQ_SRC0_WB]                    = read_src0_data[1];
assign x_read_data[SDIQ_SRC0_PREG:SDIQ_SRC0_PREG-6] = read_src0_data[8:2];
assign src0_rdy_for_issue                           = read_src0_data[9];
assign x_read_data[SDIQ_SRC0_RDY]                   = 1'b0;
assign x_read_data[SDIQ_SRC0_LSU_MATCH]             = 1'b0;

//-----------------------source v 0-------------------------
assign create_srcv0_gateclk_en = x_create_gateclk_en && x_create_data[SDIQ_SRCV0_VLD];
assign create_srcv0_data[9]    = x_create_data[SDIQ_SRCV0_LSU_MATCH];
assign create_srcv0_data[8:0]  = x_create_data[SDIQ_SRCV0_DATA:SDIQ_SRCV0_DATA-8];
// &Instance("ct_idu_dep_vreg_entry", "x_ct_idu_is_sdiq_srcv0_entry"); @312
ct_idu_dep_vreg_entry  x_ct_idu_is_sdiq_srcv0_entry (
  .cp0_idu_icg_en                       (cp0_idu_icg_en                      ),
  .cp0_yy_clk_en                        (cp0_yy_clk_en                       ),
  .cpurst_b                             (cpurst_b                            ),
  .forever_cpuclk                       (forever_cpuclk                      ),
  .gateclk_entry_vld                    (gateclk_entry_vld                   ),
  .lsu_idu_ag_pipe3_vload_inst_vld      (lsu_idu_ag_pipe3_vload_inst_vld     ),
  .lsu_idu_ag_pipe3_vreg_dupx           (lsu_idu_ag_pipe3_vreg_dupx          ),
  .lsu_idu_dc_pipe3_vload_fwd_inst_vld  (lsu_idu_dc_pipe3_vload_fwd_inst_vld ),
  .lsu_idu_dc_pipe3_vload_inst_vld_dupx (lsu_idu_dc_pipe3_vload_inst_vld_dupx),
  .lsu_idu_dc_pipe3_vreg_dupx           (lsu_idu_dc_pipe3_vreg_dupx          ),
  .lsu_idu_wb_pipe3_wb_vreg_dupx        (lsu_idu_wb_pipe3_wb_vreg_dupx       ),
  .lsu_idu_wb_pipe3_wb_vreg_vld_dupx    (lsu_idu_wb_pipe3_wb_vreg_vld_dupx   ),
  .pad_yy_icg_scan_en                   (pad_yy_icg_scan_en                  ),
  .rtu_idu_flush_fe                     (rtu_yy_xx_flush                     ),
  .rtu_idu_flush_is                     (rtu_yy_xx_flush                     ),
  .vfpu_idu_ex1_pipe6_data_vld_dupx     (vfpu_idu_ex1_pipe6_data_vld_dupx    ),
  .vfpu_idu_ex1_pipe6_vreg_dupx         (vfpu_idu_ex1_pipe6_vreg_dupx        ),
  .vfpu_idu_ex1_pipe7_data_vld_dupx     (vfpu_idu_ex1_pipe7_data_vld_dupx    ),
  .vfpu_idu_ex1_pipe7_vreg_dupx         (vfpu_idu_ex1_pipe7_vreg_dupx        ),
  .vfpu_idu_ex2_pipe6_data_vld_dupx     (vfpu_idu_ex2_pipe6_data_vld_dupx    ),
  .vfpu_idu_ex2_pipe6_vreg_dupx         (vfpu_idu_ex2_pipe6_vreg_dupx        ),
  .vfpu_idu_ex2_pipe7_data_vld_dupx     (vfpu_idu_ex2_pipe7_data_vld_dupx    ),
  .vfpu_idu_ex2_pipe7_vreg_dupx         (vfpu_idu_ex2_pipe7_vreg_dupx        ),
  .vfpu_idu_ex3_pipe6_data_vld_dupx     (vfpu_idu_ex3_pipe6_data_vld_dupx    ),
  .vfpu_idu_ex3_pipe6_vreg_dupx         (vfpu_idu_ex3_pipe6_vreg_dupx        ),
  .vfpu_idu_ex3_pipe7_data_vld_dupx     (vfpu_idu_ex3_pipe7_data_vld_dupx    ),
  .vfpu_idu_ex3_pipe7_vreg_dupx         (vfpu_idu_ex3_pipe7_vreg_dupx        ),
  .vfpu_idu_ex5_pipe6_wb_vreg_dupx      (vfpu_idu_ex5_pipe6_wb_vreg_dupx     ),
  .vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx  (vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx ),
  .vfpu_idu_ex5_pipe7_wb_vreg_dupx      (vfpu_idu_ex5_pipe7_wb_vreg_dupx     ),
  .vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx  (vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx ),
  .x_create_data                        (create_srcv0_data[9:0]              ),
  .x_gateclk_idx_write_en               (create_srcv0_gateclk_en             ),
  .x_gateclk_write_en                   (x_create_gateclk_en                 ),
  .x_rdy_clr                            (srcv0_rdy_clr                       ),
  .x_read_data                          (read_srcv0_data[11:0]               ),
  .x_write_en                           (x_create_dp_en                      )
);

// &Connect(.gateclk_entry_vld        (gateclk_entry_vld), @313
//          .rtu_idu_flush_fe         (rtu_yy_xx_flush), @314
//          .rtu_idu_flush_is         (rtu_yy_xx_flush), @315
//          .x_write_en               (x_create_dp_en), @316
//          .x_gateclk_write_en       (x_create_gateclk_en), @317
//          .x_gateclk_idx_write_en   (create_srcv0_gateclk_en), @318
//          .x_create_data            (create_srcv0_data[9:0]), @319
//          .x_read_data              (read_srcv0_data[11:0]), @320
//          .x_rdy_clr                (srcv0_rdy_clr) @321
//         ); @322
assign x_read_data[SDIQ_SRCV0_WB]                     = read_srcv0_data[1];
assign x_read_data[SDIQ_SRCV0_VREG:SDIQ_SRCV0_VREG-6] = read_srcv0_data[8:2];
assign srcv0_rdy_for_issue                            = read_srcv0_data[9];
assign x_read_data[SDIQ_SRCV0_RDY]                    = 1'b0;
assign x_read_data[SDIQ_SRCV0_LSU_MATCH]              = 1'b0;

//==========================================================
//             Dealloc mask signal for src0/srcv0
//==========================================================
assign read_data_src0_preg[6:0]  = x_read_data[SDIQ_SRC0_PREG:SDIQ_SRC0_PREG-6];
assign read_data_srcv0_vreg[5:0] = x_read_data[SDIQ_SRCV0_VREG-1:SDIQ_SRCV0_VREG-6];

// &ConnRule(s/^x_num/read_data_src0_preg/); @335
// &Instance("ct_rtu_expand_96","x_ct_rtu_expand_96_read_data_src0_preg"); @336
ct_rtu_expand_96  x_ct_rtu_expand_96_read_data_src0_preg (
  .x_num                      (read_data_src0_preg       ),
  .x_num_expand               (read_data_src0_preg_expand)
);

// &ConnRule(s/^x_num/read_data_srcv0_vreg/); @337
// &Instance("ct_rtu_expand_64","x_ct_rtu_expand_64_read_data_srcv0_vreg"); @338
ct_rtu_expand_64  x_ct_rtu_expand_64_read_data_srcv0_vreg (
  .x_num                       (read_data_srcv0_vreg       ),
  .x_num_expand                (read_data_srcv0_vreg_expand)
);


assign x_src0_preg_expand[95:0]  = {96{vld && src0_vld}}
                                   & read_data_src0_preg_expand[95:0];
assign x_srcv_vreg_expand[63:0]  = 
  {64{vld && srcv0_vld && x_read_data[SDIQ_SRCV0_VREG]}} & read_data_srcv0_vreg_expand[63:0];
assign x_srcf_freg_expand[63:0]  = 
  {64{vld && srcv0_vld && !x_read_data[SDIQ_SRCV0_VREG]}} & read_data_srcv0_vreg_expand[63:0];

//==========================================================
//                  Entry Ready Signal
//==========================================================
assign x_rdy = vld
               && !frz
               && src0_rdy_for_issue
               && srcv0_rdy_for_issue
               && (load
                  || !stdata1_vld && staddr0_rdy
                  ||  stdata1_vld && staddr1_rdy);

// &ModuleEnd; @358
endmodule


