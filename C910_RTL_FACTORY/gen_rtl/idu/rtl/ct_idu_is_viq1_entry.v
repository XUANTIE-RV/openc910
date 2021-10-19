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
module ct_idu_is_viq1_entry(
  cp0_idu_icg_en,
  cp0_yy_clk_en,
  cpurst_b,
  ctrl_dp_is_dis_viq0_create0_sel,
  ctrl_dp_is_dis_viq0_create1_sel,
  ctrl_dp_is_dis_viq1_create0_sel,
  ctrl_dp_is_dis_viq1_create1_sel,
  ctrl_viq0_create0_dp_en,
  ctrl_viq0_create0_gateclk_en,
  ctrl_viq0_create1_dp_en,
  ctrl_viq0_create1_gateclk_en,
  ctrl_viq1_create0_dp_en,
  ctrl_viq1_create0_gateclk_en,
  ctrl_viq1_create1_dp_en,
  ctrl_viq1_create1_gateclk_en,
  ctrl_viq1_rf_pop_vld,
  ctrl_viq1_stall,
  ctrl_xx_rf_pipe6_vmla_lch_vld_dupx,
  ctrl_xx_rf_pipe7_vmla_lch_vld_dupx,
  dp_viq1_rf_rdy_clr,
  dp_viq_dis_inst0_srcv2_vreg,
  dp_viq_dis_inst1_srcv2_vreg,
  dp_viq_dis_inst2_srcv2_vreg,
  dp_viq_dis_inst3_srcv2_vreg,
  dp_xx_rf_pipe6_dst_vreg_dupx,
  dp_xx_rf_pipe7_dst_vreg_dupx,
  forever_cpuclk,
  lsu_idu_ag_pipe3_vload_inst_vld,
  lsu_idu_ag_pipe3_vreg_dupx,
  lsu_idu_dc_pipe3_vload_fwd_inst_vld,
  lsu_idu_dc_pipe3_vload_inst_vld_dupx,
  lsu_idu_dc_pipe3_vreg_dupx,
  lsu_idu_wb_pipe3_wb_vreg_dupx,
  lsu_idu_wb_pipe3_wb_vreg_vld_dupx,
  pad_yy_icg_scan_en,
  rtu_idu_flush_fe,
  rtu_idu_flush_is,
  vfpu_idu_ex1_pipe6_data_vld_dupx,
  vfpu_idu_ex1_pipe6_fmla_data_vld_dupx,
  vfpu_idu_ex1_pipe6_vreg_dupx,
  vfpu_idu_ex1_pipe7_data_vld_dupx,
  vfpu_idu_ex1_pipe7_fmla_data_vld_dupx,
  vfpu_idu_ex1_pipe7_vreg_dupx,
  vfpu_idu_ex2_pipe6_data_vld_dupx,
  vfpu_idu_ex2_pipe6_fmla_data_vld_dupx,
  vfpu_idu_ex2_pipe6_vreg_dupx,
  vfpu_idu_ex2_pipe7_data_vld_dupx,
  vfpu_idu_ex2_pipe7_fmla_data_vld_dupx,
  vfpu_idu_ex2_pipe7_vreg_dupx,
  vfpu_idu_ex3_pipe6_data_vld_dupx,
  vfpu_idu_ex3_pipe6_vreg_dupx,
  vfpu_idu_ex3_pipe7_data_vld_dupx,
  vfpu_idu_ex3_pipe7_vreg_dupx,
  vfpu_idu_ex5_pipe6_wb_vreg_dupx,
  vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx,
  vfpu_idu_ex5_pipe7_wb_vreg_dupx,
  vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx,
  viq0_viq_create0_entry,
  viq0_viq_create1_entry,
  viq1_viq_create0_entry,
  viq1_viq_create1_entry,
  x_agevec,
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
  x_vfpu0_vreg_fwd_vld,
  x_vfpu1_vreg_fwd_vld,
  x_vld,
  x_vld_with_frz
);

// &Ports; @28
input            cp0_idu_icg_en;                       
input            cp0_yy_clk_en;                        
input            cpurst_b;                             
input   [1  :0]  ctrl_dp_is_dis_viq0_create0_sel;      
input   [1  :0]  ctrl_dp_is_dis_viq0_create1_sel;      
input   [1  :0]  ctrl_dp_is_dis_viq1_create0_sel;      
input   [1  :0]  ctrl_dp_is_dis_viq1_create1_sel;      
input            ctrl_viq0_create0_dp_en;              
input            ctrl_viq0_create0_gateclk_en;         
input            ctrl_viq0_create1_dp_en;              
input            ctrl_viq0_create1_gateclk_en;         
input            ctrl_viq1_create0_dp_en;              
input            ctrl_viq1_create0_gateclk_en;         
input            ctrl_viq1_create1_dp_en;              
input            ctrl_viq1_create1_gateclk_en;         
input            ctrl_viq1_rf_pop_vld;                 
input            ctrl_viq1_stall;                      
input            ctrl_xx_rf_pipe6_vmla_lch_vld_dupx;   
input            ctrl_xx_rf_pipe7_vmla_lch_vld_dupx;   
input   [3  :0]  dp_viq1_rf_rdy_clr;                   
input   [6  :0]  dp_viq_dis_inst0_srcv2_vreg;          
input   [6  :0]  dp_viq_dis_inst1_srcv2_vreg;          
input   [6  :0]  dp_viq_dis_inst2_srcv2_vreg;          
input   [6  :0]  dp_viq_dis_inst3_srcv2_vreg;          
input   [6  :0]  dp_xx_rf_pipe6_dst_vreg_dupx;         
input   [6  :0]  dp_xx_rf_pipe7_dst_vreg_dupx;         
input            forever_cpuclk;                       
input            lsu_idu_ag_pipe3_vload_inst_vld;      
input   [6  :0]  lsu_idu_ag_pipe3_vreg_dupx;           
input            lsu_idu_dc_pipe3_vload_fwd_inst_vld;  
input            lsu_idu_dc_pipe3_vload_inst_vld_dupx; 
input   [6  :0]  lsu_idu_dc_pipe3_vreg_dupx;           
input   [6  :0]  lsu_idu_wb_pipe3_wb_vreg_dupx;        
input            lsu_idu_wb_pipe3_wb_vreg_vld_dupx;    
input            pad_yy_icg_scan_en;                   
input            rtu_idu_flush_fe;                     
input            rtu_idu_flush_is;                     
input            vfpu_idu_ex1_pipe6_data_vld_dupx;     
input            vfpu_idu_ex1_pipe6_fmla_data_vld_dupx; 
input   [6  :0]  vfpu_idu_ex1_pipe6_vreg_dupx;         
input            vfpu_idu_ex1_pipe7_data_vld_dupx;     
input            vfpu_idu_ex1_pipe7_fmla_data_vld_dupx; 
input   [6  :0]  vfpu_idu_ex1_pipe7_vreg_dupx;         
input            vfpu_idu_ex2_pipe6_data_vld_dupx;     
input            vfpu_idu_ex2_pipe6_fmla_data_vld_dupx; 
input   [6  :0]  vfpu_idu_ex2_pipe6_vreg_dupx;         
input            vfpu_idu_ex2_pipe7_data_vld_dupx;     
input            vfpu_idu_ex2_pipe7_fmla_data_vld_dupx; 
input   [6  :0]  vfpu_idu_ex2_pipe7_vreg_dupx;         
input            vfpu_idu_ex3_pipe6_data_vld_dupx;     
input   [6  :0]  vfpu_idu_ex3_pipe6_vreg_dupx;         
input            vfpu_idu_ex3_pipe7_data_vld_dupx;     
input   [6  :0]  vfpu_idu_ex3_pipe7_vreg_dupx;         
input   [6  :0]  vfpu_idu_ex5_pipe6_wb_vreg_dupx;      
input            vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx;  
input   [6  :0]  vfpu_idu_ex5_pipe7_wb_vreg_dupx;      
input            vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx;  
input   [7  :0]  viq0_viq_create0_entry;               
input   [7  :0]  viq0_viq_create1_entry;               
input   [7  :0]  viq1_viq_create0_entry;               
input   [7  :0]  viq1_viq_create1_entry;               
input   [6  :0]  x_create_agevec;                      
input   [149:0]  x_create_data;                        
input            x_create_dp_en;                       
input            x_create_en;                          
input            x_create_frz;                         
input            x_create_gateclk_en;                  
input            x_frz_clr;                            
input            x_issue_en;                           
input            x_pop_cur_entry;                      
input   [6  :0]  x_pop_other_entry;                    
input            x_vfpu0_vreg_fwd_vld;                 
input            x_vfpu1_vreg_fwd_vld;                 
output  [6  :0]  x_agevec;                             
output           x_rdy;                                
output  [149:0]  x_read_data;                          
output           x_vld;                                
output           x_vld_with_frz;                       

// &Regs; @29
reg     [6  :0]  agevec;                               
reg     [4  :0]  dst_ereg;                             
reg     [6  :0]  dst_preg;                             
reg              dst_vld;                              
reg     [6  :0]  dst_vreg;                             
reg              dste_vld;                             
reg              dstv_vld;                             
reg              frz;                                  
reg     [6  :0]  iid;                                  
reg              lch_rdy_viq0_create0_src_match;       
reg              lch_rdy_viq0_create1_src_match;       
reg              lch_rdy_viq1_create0_src_match;       
reg              lch_rdy_viq1_create1_src_match;       
reg              mfvr;                                 
reg     [31 :0]  opcode;                               
reg              split_last;                           
reg     [6  :0]  split_num;                            
reg              srcv0_vld;                            
reg              srcv1_vld;                            
reg              srcv2_vld;                            
reg              srcvm_vld;                            
reg     [7  :0]  vl;                                   
reg              vld;                                  
reg     [1  :0]  vlmul;                                
reg              vmla;                                 
reg              vmla_short;                           
reg     [2  :0]  vmla_type;                            
reg              vmul_unsplit;                         
reg     [2  :0]  vsew;                                 

// &Wires; @30
wire             cp0_idu_icg_en;                       
wire             cp0_yy_clk_en;                        
wire             cpurst_b;                             
wire             create_clk;                           
wire             create_clk_en;                        
wire             create_ereg_clk;                      
wire             create_ereg_clk_en;                   
wire             create_preg_clk;                      
wire             create_preg_clk_en;                   
wire    [9  :0]  create_srcv0_data;                    
wire             create_srcv0_gateclk_en;              
wire    [9  :0]  create_srcv1_data;                    
wire             create_srcv1_gateclk_en;              
wire    [10 :0]  create_srcv2_data;                    
wire             create_srcv2_gateclk_en;              
wire    [9  :0]  create_srcvm_data;                    
wire             create_srcvm_gateclk_en;              
wire             create_vreg_clk;                      
wire             create_vreg_clk_en;                   
wire    [1  :0]  ctrl_dp_is_dis_viq0_create0_sel;      
wire    [1  :0]  ctrl_dp_is_dis_viq0_create1_sel;      
wire    [1  :0]  ctrl_dp_is_dis_viq1_create0_sel;      
wire    [1  :0]  ctrl_dp_is_dis_viq1_create1_sel;      
wire             ctrl_viq0_create0_dp_en;              
wire             ctrl_viq0_create0_gateclk_en;         
wire             ctrl_viq0_create1_dp_en;              
wire             ctrl_viq0_create1_gateclk_en;         
wire             ctrl_viq1_create0_dp_en;              
wire             ctrl_viq1_create0_gateclk_en;         
wire             ctrl_viq1_create1_dp_en;              
wire             ctrl_viq1_create1_gateclk_en;         
wire             ctrl_viq1_rf_pop_vld;                 
wire             ctrl_viq1_stall;                      
wire             ctrl_xx_rf_pipe6_vmla_lch_vld_dupx;   
wire             ctrl_xx_rf_pipe7_vmla_lch_vld_dupx;   
wire             dis_inst0_srcv2_match;                
wire             dis_inst1_srcv2_match;                
wire             dis_inst2_srcv2_match;                
wire             dis_inst3_srcv2_match;                
wire    [3  :0]  dp_viq1_rf_rdy_clr;                   
wire    [6  :0]  dp_viq_dis_inst0_srcv2_vreg;          
wire    [6  :0]  dp_viq_dis_inst1_srcv2_vreg;          
wire    [6  :0]  dp_viq_dis_inst2_srcv2_vreg;          
wire    [6  :0]  dp_viq_dis_inst3_srcv2_vreg;          
wire    [6  :0]  dp_xx_rf_pipe6_dst_vreg_dupx;         
wire    [6  :0]  dp_xx_rf_pipe7_dst_vreg_dupx;         
wire             entry_clk;                            
wire             entry_clk_en;                         
wire             forever_cpuclk;                       
wire             gateclk_entry_vld;                    
wire             lch_rdy_viq0_clk;                     
wire             lch_rdy_viq0_clk_en;                  
wire             lch_rdy_viq0_create0_dp_en;           
wire             lch_rdy_viq0_create1_dp_en;           
wire             lch_rdy_viq1_clk;                     
wire             lch_rdy_viq1_clk_en;                  
wire             lch_rdy_viq1_create0_dp_en;           
wire             lch_rdy_viq1_create1_dp_en;           
wire             lsu_idu_ag_pipe3_vload_inst_vld;      
wire    [6  :0]  lsu_idu_ag_pipe3_vreg_dupx;           
wire             lsu_idu_dc_pipe3_vload_fwd_inst_vld;  
wire             lsu_idu_dc_pipe3_vload_inst_vld_dupx; 
wire    [6  :0]  lsu_idu_dc_pipe3_vreg_dupx;           
wire    [6  :0]  lsu_idu_wb_pipe3_wb_vreg_dupx;        
wire             lsu_idu_wb_pipe3_wb_vreg_vld_dupx;    
wire             pad_yy_icg_scan_en;                   
wire    [11 :0]  read_srcv0_data;                      
wire    [11 :0]  read_srcv1_data;                      
wire    [12 :0]  read_srcv2_data;                      
wire    [11 :0]  read_srcvm_data;                      
wire             rtu_idu_flush_fe;                     
wire             rtu_idu_flush_is;                     
wire             srcv0_rdy_clr;                        
wire             srcv0_rdy_for_issue;                  
wire             srcv1_rdy_clr;                        
wire             srcv1_rdy_for_issue;                  
wire             srcv2_rdy_clr;                        
wire             srcv2_rdy_for_issue;                  
wire             srcvm_rdy_clr;                        
wire             srcvm_rdy_for_issue;                  
wire             vfpu_idu_ex1_pipe6_data_vld_dupx;     
wire             vfpu_idu_ex1_pipe6_fmla_data_vld_dupx; 
wire    [6  :0]  vfpu_idu_ex1_pipe6_vreg_dupx;         
wire             vfpu_idu_ex1_pipe7_data_vld_dupx;     
wire             vfpu_idu_ex1_pipe7_fmla_data_vld_dupx; 
wire    [6  :0]  vfpu_idu_ex1_pipe7_vreg_dupx;         
wire             vfpu_idu_ex2_pipe6_data_vld_dupx;     
wire             vfpu_idu_ex2_pipe6_fmla_data_vld_dupx; 
wire    [6  :0]  vfpu_idu_ex2_pipe6_vreg_dupx;         
wire             vfpu_idu_ex2_pipe7_data_vld_dupx;     
wire             vfpu_idu_ex2_pipe7_fmla_data_vld_dupx; 
wire    [6  :0]  vfpu_idu_ex2_pipe7_vreg_dupx;         
wire             vfpu_idu_ex3_pipe6_data_vld_dupx;     
wire    [6  :0]  vfpu_idu_ex3_pipe6_vreg_dupx;         
wire             vfpu_idu_ex3_pipe7_data_vld_dupx;     
wire    [6  :0]  vfpu_idu_ex3_pipe7_vreg_dupx;         
wire    [6  :0]  vfpu_idu_ex5_pipe6_wb_vreg_dupx;      
wire             vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx;  
wire    [6  :0]  vfpu_idu_ex5_pipe7_wb_vreg_dupx;      
wire             vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx;  
wire    [1  :0]  viq0_entry0_create_entry;             
wire             viq0_entry0_create_lch_rdy;           
wire             viq0_entry0_read_lch_rdy;             
wire    [1  :0]  viq0_entry1_create_entry;             
wire             viq0_entry1_create_lch_rdy;           
wire             viq0_entry1_read_lch_rdy;             
wire    [1  :0]  viq0_entry2_create_entry;             
wire             viq0_entry2_create_lch_rdy;           
wire             viq0_entry2_read_lch_rdy;             
wire    [1  :0]  viq0_entry3_create_entry;             
wire             viq0_entry3_create_lch_rdy;           
wire             viq0_entry3_read_lch_rdy;             
wire    [1  :0]  viq0_entry4_create_entry;             
wire             viq0_entry4_create_lch_rdy;           
wire             viq0_entry4_read_lch_rdy;             
wire    [1  :0]  viq0_entry5_create_entry;             
wire             viq0_entry5_create_lch_rdy;           
wire             viq0_entry5_read_lch_rdy;             
wire    [1  :0]  viq0_entry6_create_entry;             
wire             viq0_entry6_create_lch_rdy;           
wire             viq0_entry6_read_lch_rdy;             
wire    [1  :0]  viq0_entry7_create_entry;             
wire             viq0_entry7_create_lch_rdy;           
wire             viq0_entry7_read_lch_rdy;             
wire    [7  :0]  viq0_viq_create0_entry;               
wire    [7  :0]  viq0_viq_create1_entry;               
wire    [1  :0]  viq1_entry0_create_entry;             
wire             viq1_entry0_create_lch_rdy;           
wire             viq1_entry0_read_lch_rdy;             
wire    [1  :0]  viq1_entry1_create_entry;             
wire             viq1_entry1_create_lch_rdy;           
wire             viq1_entry1_read_lch_rdy;             
wire    [1  :0]  viq1_entry2_create_entry;             
wire             viq1_entry2_create_lch_rdy;           
wire             viq1_entry2_read_lch_rdy;             
wire    [1  :0]  viq1_entry3_create_entry;             
wire             viq1_entry3_create_lch_rdy;           
wire             viq1_entry3_read_lch_rdy;             
wire    [1  :0]  viq1_entry4_create_entry;             
wire             viq1_entry4_create_lch_rdy;           
wire             viq1_entry4_read_lch_rdy;             
wire    [1  :0]  viq1_entry5_create_entry;             
wire             viq1_entry5_create_lch_rdy;           
wire             viq1_entry5_read_lch_rdy;             
wire    [1  :0]  viq1_entry6_create_entry;             
wire             viq1_entry6_create_lch_rdy;           
wire             viq1_entry6_read_lch_rdy;             
wire    [1  :0]  viq1_entry7_create_entry;             
wire             viq1_entry7_create_lch_rdy;           
wire             viq1_entry7_read_lch_rdy;             
wire    [7  :0]  viq1_viq_create0_entry;               
wire    [7  :0]  viq1_viq_create1_entry;               
wire    [6  :0]  x_agevec;                             
wire    [6  :0]  x_create_agevec;                      
wire    [149:0]  x_create_data;                        
wire             x_create_dp_en;                       
wire             x_create_en;                          
wire             x_create_frz;                         
wire             x_create_gateclk_en;                  
wire             x_frz_clr;                            
wire             x_issue_en;                           
wire             x_pop_cur_entry;                      
wire    [6  :0]  x_pop_other_entry;                    
wire             x_rdy;                                
wire    [149:0]  x_read_data;                          
wire             x_vfpu0_vreg_fwd_vld;                 
wire             x_vfpu1_vreg_fwd_vld;                 
wire             x_vld;                                
wire             x_vld_with_frz;                       



//==========================================================
//                       Parameters
//==========================================================
//----------------------------------------------------------
//                    VIQ1 Parameters
//----------------------------------------------------------
parameter VIQ1_WIDTH             = 150;

parameter VIQ1_VL                = 149;
parameter VIQ1_VSEW              = 141;
parameter VIQ1_VLMUL             = 138;
parameter VIQ1_VMUL_UNSPLIT      = 136;
parameter VIQ1_VMLA_SHORT        = 135;
parameter VIQ1_LCH_RDY_VIQ1      = 134;
parameter VIQ1_LCH_RDY_VIQ0      = 126;
parameter VIQ1_VMLA_TYPE         = 118;
parameter VIQ1_SPLIT_NUM         = 115;
parameter VIQ1_SPLIT_LAST        = 108;
parameter VIQ1_MFVR              = 107;
parameter VIQ1_VMLA              = 106;
parameter VIQ1_SRCVM_DATA        = 105;
parameter VIQ1_SRCVM_LSU_MATCH   = 105;
parameter VIQ1_SRCVM_VREG        = 104;
parameter VIQ1_SRCVM_WB          = 97;
parameter VIQ1_SRCVM_RDY         = 96;
parameter VIQ1_SRCV2_DATA        = 95;
parameter VIQ1_SRCV2_LSU_MATCH   = 95;
parameter VIQ1_SRCV2_VREG        = 93;
parameter VIQ1_SRCV2_WB          = 86;
parameter VIQ1_SRCV2_RDY         = 85;
parameter VIQ1_SRCV1_DATA        = 84;
parameter VIQ1_SRCV1_LSU_MATCH   = 84;
parameter VIQ1_SRCV1_VREG        = 83;
parameter VIQ1_SRCV1_WB          = 76;
parameter VIQ1_SRCV1_RDY         = 75;
parameter VIQ1_SRCV0_DATA        = 74;
parameter VIQ1_SRCV0_LSU_MATCH   = 74;
parameter VIQ1_SRCV0_VREG        = 73;
parameter VIQ1_SRCV0_WB          = 66;
parameter VIQ1_SRCV0_RDY         = 65;
parameter VIQ1_DST_EREG          = 64;
parameter VIQ1_DST_VREG          = 59;
parameter VIQ1_DST_PREG          = 52;
parameter VIQ1_DSTE_VLD          = 45;
parameter VIQ1_DSTV_VLD          = 44;
parameter VIQ1_DST_VLD           = 43;
parameter VIQ1_SRCVM_VLD         = 42;
parameter VIQ1_SRCV2_VLD         = 41;
parameter VIQ1_SRCV1_VLD         = 40;
parameter VIQ1_SRCV0_VLD         = 39;
parameter VIQ1_IID               = 38;
parameter VIQ1_OPCODE            = 31;

//==========================================================
//                 Instance of Gated Cell  
//==========================================================
assign entry_clk_en = x_create_gateclk_en || vld;
// &Instance("gated_clk_cell", "x_entry_gated_clk"); @90
gated_clk_cell  x_entry_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (entry_clk         ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (entry_clk_en      ),
  .module_en          (cp0_idu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @91
//          .external_en (1'b0), @92
//          .global_en   (cp0_yy_clk_en), @93
//          .module_en   (cp0_idu_icg_en), @94
//          .local_en    (entry_clk_en), @95
//          .clk_out     (entry_clk)); @96

assign create_clk_en = x_create_gateclk_en;
// &Instance("gated_clk_cell", "x_create_gated_clk"); @99
gated_clk_cell  x_create_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (create_clk        ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (create_clk_en     ),
  .module_en          (cp0_idu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @100
//          .external_en (1'b0), @101
//          .global_en   (cp0_yy_clk_en), @102
//          .module_en   (cp0_idu_icg_en), @103
//          .local_en    (create_clk_en), @104
//          .clk_out     (create_clk)); @105

assign create_vreg_clk_en = x_create_gateclk_en && x_create_data[VIQ1_DSTV_VLD];
// &Instance("gated_clk_cell", "x_create_vreg_gated_clk"); @108
gated_clk_cell  x_create_vreg_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (create_vreg_clk   ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (create_vreg_clk_en),
  .module_en          (cp0_idu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @109
//          .external_en (1'b0), @110
//          .global_en   (cp0_yy_clk_en), @111
//          .module_en   (cp0_idu_icg_en), @112
//          .local_en    (create_vreg_clk_en), @113
//          .clk_out     (create_vreg_clk)); @114

assign create_ereg_clk_en = x_create_gateclk_en && x_create_data[VIQ1_DSTE_VLD];
// &Instance("gated_clk_cell", "x_create_ereg_gated_clk"); @117
gated_clk_cell  x_create_ereg_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (create_ereg_clk   ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (create_ereg_clk_en),
  .module_en          (cp0_idu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @118
//          .external_en (1'b0), @119
//          .global_en   (cp0_yy_clk_en), @120
//          .module_en   (cp0_idu_icg_en), @121
//          .local_en    (create_ereg_clk_en), @122
//          .clk_out     (create_ereg_clk)); @123

assign create_preg_clk_en = x_create_gateclk_en && x_create_data[VIQ1_DST_VLD];
// &Instance("gated_clk_cell", "x_create_preg_gated_clk"); @126
gated_clk_cell  x_create_preg_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (create_preg_clk   ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (create_preg_clk_en),
  .module_en          (cp0_idu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @127
//          .external_en (1'b0), @128
//          .global_en   (cp0_yy_clk_en), @129
//          .module_en   (cp0_idu_icg_en), @130
//          .local_en    (create_preg_clk_en), @131
//          .clk_out     (create_preg_clk)); @132

assign lch_rdy_viq0_clk_en = x_create_gateclk_en
                             || vld && (ctrl_viq0_create0_gateclk_en
                                     || ctrl_viq0_create1_gateclk_en);
// &Instance("gated_clk_cell", "x_lch_rdy_viq0_gated_clk"); @137
gated_clk_cell  x_lch_rdy_viq0_gated_clk (
  .clk_in              (forever_cpuclk     ),
  .clk_out             (lch_rdy_viq0_clk   ),
  .external_en         (1'b0               ),
  .global_en           (cp0_yy_clk_en      ),
  .local_en            (lch_rdy_viq0_clk_en),
  .module_en           (cp0_idu_icg_en     ),
  .pad_yy_icg_scan_en  (pad_yy_icg_scan_en )
);

// &Connect(.clk_in      (forever_cpuclk), @138
//          .external_en (1'b0), @139
//          .global_en   (cp0_yy_clk_en), @140
//          .module_en   (cp0_idu_icg_en), @141
//          .local_en    (lch_rdy_viq0_clk_en), @142
//          .clk_out     (lch_rdy_viq0_clk)); @143

assign lch_rdy_viq1_clk_en = x_create_gateclk_en
                             || vld && (ctrl_viq1_create0_gateclk_en
                                     || ctrl_viq1_create1_gateclk_en);
// &Instance("gated_clk_cell", "x_lch_rdy_viq1_gated_clk"); @148
gated_clk_cell  x_lch_rdy_viq1_gated_clk (
  .clk_in              (forever_cpuclk     ),
  .clk_out             (lch_rdy_viq1_clk   ),
  .external_en         (1'b0               ),
  .global_en           (cp0_yy_clk_en      ),
  .local_en            (lch_rdy_viq1_clk_en),
  .module_en           (cp0_idu_icg_en     ),
  .pad_yy_icg_scan_en  (pad_yy_icg_scan_en )
);

// &Connect(.clk_in      (forever_cpuclk), @149
//          .external_en (1'b0), @150
//          .global_en   (cp0_yy_clk_en), @151
//          .module_en   (cp0_idu_icg_en), @152
//          .local_en    (lch_rdy_viq1_clk_en), @153
//          .clk_out     (lch_rdy_viq1_clk)); @154

//if entry is not valid, shut down dep info clock
assign gateclk_entry_vld = vld;

//==========================================================
//                  Create and Read Bus
//==========================================================
//force create and read bus width
// &Force("bus","x_create_data",VIQ1_WIDTH-1,0); @163
// &Force("bus","x_read_data",VIQ1_WIDTH-1,0); @164
// &Force("output","x_read_data"); @165

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
  else if(ctrl_viq1_rf_pop_vld && x_pop_cur_entry)
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
assign x_agevec[6:0] = agevec[6:0];
always @(posedge entry_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    agevec[6:0] <= 7'b0;
  else if(x_create_en)
    agevec[6:0] <= x_create_agevec[6:0];
  else if(ctrl_viq1_rf_pop_vld)
    agevec[6:0] <= agevec[6:0] & ~x_pop_other_entry[6:0];
  else
    agevec[6:0] <= agevec[6:0];
end

//==========================================================
//                 Instruction Information
//==========================================================
always @(posedge create_vreg_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    dst_vreg[6:0]      <= 7'b0;
  else if(x_create_dp_en)
    dst_vreg[6:0]      <= x_create_data[VIQ1_DST_VREG:VIQ1_DST_VREG-6];
  else
    dst_vreg[6:0]      <= dst_vreg[6:0];
end

always @(posedge create_ereg_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    dst_ereg[4:0]      <= 5'b0;
  else if(x_create_dp_en)
    dst_ereg[4:0]      <= x_create_data[VIQ1_DST_EREG:VIQ1_DST_EREG-4];
  else
    dst_ereg[4:0]      <= dst_ereg[4:0];
end

always @(posedge create_preg_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    dst_preg[6:0]      <= 7'b0;
  else if(x_create_dp_en)
    dst_preg[6:0]      <= x_create_data[VIQ1_DST_PREG:VIQ1_DST_PREG-6];
  else
    dst_preg[6:0]      <= dst_preg[6:0];
end

always @(posedge create_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    opcode[31:0]       <= 32'b0;
    iid[6:0]           <= 7'b0;
    srcv0_vld          <= 1'b0;
    srcv1_vld          <= 1'b0;
    srcv2_vld          <= 1'b0;
    srcvm_vld          <= 1'b0;
    dstv_vld           <= 1'b0;
    dste_vld           <= 1'b0;
    dst_vld            <= 1'b0;
    vmla               <= 1'b0;
    mfvr               <= 1'b0;
    split_last         <= 1'b0;
    split_num[6:0]     <= 7'b0;
    vmla_type[2:0]     <= 3'b0;
    vmla_short         <= 1'b0;
    vmul_unsplit       <= 1'b0;
    vlmul[1:0]         <= 2'b0;
    vsew[2:0]          <= 3'b0;
    vl[7:0]            <= 8'b0;
  end
  else if(x_create_dp_en) begin
    opcode[31:0]       <= x_create_data[VIQ1_OPCODE:VIQ1_OPCODE-31];
    iid[6:0]           <= x_create_data[VIQ1_IID:VIQ1_IID-6];
    srcv0_vld          <= x_create_data[VIQ1_SRCV0_VLD];
    srcv1_vld          <= x_create_data[VIQ1_SRCV1_VLD];
    srcv2_vld          <= x_create_data[VIQ1_SRCV2_VLD];
    srcvm_vld          <= x_create_data[VIQ1_SRCVM_VLD];
    dstv_vld           <= x_create_data[VIQ1_DSTV_VLD];
    dste_vld           <= x_create_data[VIQ1_DSTE_VLD];
    dst_vld            <= x_create_data[VIQ1_DST_VLD];
    vmla               <= x_create_data[VIQ1_VMLA];
    mfvr               <= x_create_data[VIQ1_MFVR];
    split_last         <= x_create_data[VIQ1_SPLIT_LAST];
    split_num[6:0]     <= x_create_data[VIQ1_SPLIT_NUM:VIQ1_SPLIT_NUM-6];
    vmla_type[2:0]     <= x_create_data[VIQ1_VMLA_TYPE:VIQ1_VMLA_TYPE-2];
    vmla_short         <= x_create_data[VIQ1_VMLA_SHORT];
    vmul_unsplit       <= x_create_data[VIQ1_VMUL_UNSPLIT];
    vlmul[1:0]         <= x_create_data[VIQ1_VLMUL:VIQ1_VLMUL-1];
    vsew[2:0]          <= x_create_data[VIQ1_VSEW:VIQ1_VSEW-2];
    vl[7:0]            <= x_create_data[VIQ1_VL:VIQ1_VL-7];
  end
  else begin
    opcode[31:0]       <= opcode[31:0];
    iid[6:0]           <= iid[6:0];
    srcv0_vld          <= srcv0_vld;
    srcv1_vld          <= srcv1_vld;
    srcv2_vld          <= srcv2_vld;
    srcvm_vld          <= srcvm_vld;
    dstv_vld           <= dstv_vld;
    dste_vld           <= dste_vld;
    dst_vld            <= dst_vld;
    vmla               <= vmla;
    mfvr               <= mfvr;
    split_last         <= split_last;
    split_num[6:0]     <= split_num[6:0];
    vmla_type[2:0]     <= vmla_type[2:0];
    vmla_short         <= vmla_short;
    vmul_unsplit       <= vmul_unsplit;
    vlmul[1:0]         <= vlmul[1:0];
    vsew[2:0]          <= vsew[2:0];
    vl[7:0]            <= vl[7:0];
  end
end

//rename for read output
assign x_read_data[VIQ1_OPCODE:VIQ1_OPCODE-31]      = opcode[31:0];
assign x_read_data[VIQ1_IID:VIQ1_IID-6]             = iid[6:0];
assign x_read_data[VIQ1_SRCV0_VLD]                  = srcv0_vld;
assign x_read_data[VIQ1_SRCV1_VLD]                  = srcv1_vld;
assign x_read_data[VIQ1_SRCV2_VLD]                  = srcv2_vld;
assign x_read_data[VIQ1_SRCVM_VLD]                  = srcvm_vld;
assign x_read_data[VIQ1_DST_VLD]                    = dst_vld;
assign x_read_data[VIQ1_DSTV_VLD]                   = dstv_vld;
assign x_read_data[VIQ1_DSTE_VLD]                   = dste_vld;
assign x_read_data[VIQ1_DST_PREG:VIQ1_DST_PREG-6]   = dst_preg[6:0];
assign x_read_data[VIQ1_DST_VREG:VIQ1_DST_VREG-6]   = dst_vreg[6:0];
assign x_read_data[VIQ1_DST_EREG:VIQ1_DST_EREG-4]   = dst_ereg[4:0];
assign x_read_data[VIQ1_VMLA]                       = vmla;
assign x_read_data[VIQ1_MFVR]                       = mfvr;
assign x_read_data[VIQ1_SPLIT_LAST]                 = split_last;
assign x_read_data[VIQ1_SPLIT_NUM:VIQ1_SPLIT_NUM-6] = split_num[6:0];
assign x_read_data[VIQ1_VMLA_TYPE:VIQ1_VMLA_TYPE-2] = vmla_type[2:0];
assign x_read_data[VIQ1_VMLA_SHORT]                 = vmla_short;
assign x_read_data[VIQ1_VMUL_UNSPLIT]               = vmul_unsplit;
assign x_read_data[VIQ1_VLMUL:VIQ1_VLMUL-1]         = vlmul[1:0];
assign x_read_data[VIQ1_VSEW:VIQ1_VSEW-2]           = vsew[2:0];
assign x_read_data[VIQ1_VL:VIQ1_VL-7]               = vl[7:0];

//==========================================================
//              Source Dependency Information
//==========================================================
assign srcv0_rdy_clr = x_frz_clr && dp_viq1_rf_rdy_clr[0];
assign srcv1_rdy_clr = x_frz_clr && dp_viq1_rf_rdy_clr[1];
assign srcv2_rdy_clr = x_frz_clr && dp_viq1_rf_rdy_clr[2];
assign srcvm_rdy_clr = x_frz_clr && dp_viq1_rf_rdy_clr[3];

//-----------------------source v 0-------------------------
assign create_srcv0_gateclk_en = x_create_gateclk_en && x_create_data[VIQ1_SRCV0_VLD];
assign create_srcv0_data[9:0]  = x_create_data[VIQ1_SRCV0_DATA:VIQ1_SRCV0_DATA-9];
// &Instance("ct_idu_dep_vreg_entry", "x_ct_idu_is_viq1_srcv0_entry"); @354
ct_idu_dep_vreg_entry  x_ct_idu_is_viq1_srcv0_entry (
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
  .rtu_idu_flush_fe                     (rtu_idu_flush_fe                    ),
  .rtu_idu_flush_is                     (rtu_idu_flush_is                    ),
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

// &Connect(.gateclk_entry_vld        (gateclk_entry_vld), @355
//          .x_write_en               (x_create_dp_en), @356
//          .x_gateclk_write_en       (x_create_gateclk_en), @357
//          .x_gateclk_idx_write_en   (create_srcv0_gateclk_en), @358
//          .x_create_data            (create_srcv0_data[9:0]), @359
//          .x_read_data              (read_srcv0_data[11:0]), @360
//          .x_rdy_clr                (srcv0_rdy_clr) @361
//         ); @362
assign x_read_data[VIQ1_SRCV0_WB]                     = read_srcv0_data[1];
assign x_read_data[VIQ1_SRCV0_VREG:VIQ1_SRCV0_VREG-6] = read_srcv0_data[8:2];
assign srcv0_rdy_for_issue                            = read_srcv0_data[9];
assign x_read_data[VIQ1_SRCV0_RDY]                    = 1'b0;
assign x_read_data[VIQ1_SRCV0_LSU_MATCH]              = 1'b0;

//-----------------------source v 1-------------------------
assign create_srcv1_gateclk_en = x_create_gateclk_en && x_create_data[VIQ1_SRCV1_VLD];
assign create_srcv1_data[9:0]  = x_create_data[VIQ1_SRCV1_DATA:VIQ1_SRCV1_DATA-9];
// &Instance("ct_idu_dep_vreg_entry", "x_ct_idu_is_viq1_srcv1_entry"); @372
ct_idu_dep_vreg_entry  x_ct_idu_is_viq1_srcv1_entry (
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
  .rtu_idu_flush_fe                     (rtu_idu_flush_fe                    ),
  .rtu_idu_flush_is                     (rtu_idu_flush_is                    ),
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
  .x_create_data                        (create_srcv1_data[9:0]              ),
  .x_gateclk_idx_write_en               (create_srcv1_gateclk_en             ),
  .x_gateclk_write_en                   (x_create_gateclk_en                 ),
  .x_rdy_clr                            (srcv1_rdy_clr                       ),
  .x_read_data                          (read_srcv1_data[11:0]               ),
  .x_write_en                           (x_create_dp_en                      )
);

// &Connect(.gateclk_entry_vld        (gateclk_entry_vld), @373
//          .x_write_en               (x_create_dp_en), @374
//          .x_gateclk_write_en       (x_create_gateclk_en), @375
//          .x_gateclk_idx_write_en   (create_srcv1_gateclk_en), @376
//          .x_create_data            (create_srcv1_data[9:0]), @377
//          .x_read_data              (read_srcv1_data[11:0]), @378
//          .x_rdy_clr                (srcv1_rdy_clr) @379
//         ); @380
assign x_read_data[VIQ1_SRCV1_WB]                     = read_srcv1_data[1];
assign x_read_data[VIQ1_SRCV1_VREG:VIQ1_SRCV1_VREG-6] = read_srcv1_data[8:2];
assign srcv1_rdy_for_issue                            = read_srcv1_data[9];
assign x_read_data[VIQ1_SRCV1_RDY]                    = 1'b0;
assign x_read_data[VIQ1_SRCV1_LSU_MATCH]              = 1'b0;

//-----------------------source v 2-------------------------
assign create_srcv2_gateclk_en = x_create_gateclk_en && x_create_data[VIQ1_SRCV2_VLD];
assign create_srcv2_data[10:0] = x_create_data[VIQ1_SRCV2_DATA:VIQ1_SRCV2_DATA-10];
// &Instance("ct_idu_dep_vreg_srcv2_entry", "x_ct_idu_is_viq1_srcv2_entry"); @390
ct_idu_dep_vreg_srcv2_entry  x_ct_idu_is_viq1_srcv2_entry (
  .cp0_idu_icg_en                        (cp0_idu_icg_en                       ),
  .cp0_yy_clk_en                         (cp0_yy_clk_en                        ),
  .cpurst_b                              (cpurst_b                             ),
  .ctrl_xx_rf_pipe6_vmla_lch_vld_dupx    (ctrl_xx_rf_pipe6_vmla_lch_vld_dupx   ),
  .ctrl_xx_rf_pipe7_vmla_lch_vld_dupx    (ctrl_xx_rf_pipe7_vmla_lch_vld_dupx   ),
  .dp_xx_rf_pipe6_dst_vreg_dupx          (dp_xx_rf_pipe6_dst_vreg_dupx         ),
  .dp_xx_rf_pipe7_dst_vreg_dupx          (dp_xx_rf_pipe7_dst_vreg_dupx         ),
  .forever_cpuclk                        (forever_cpuclk                       ),
  .gateclk_entry_vld                     (gateclk_entry_vld                    ),
  .lsu_idu_ag_pipe3_vload_inst_vld       (lsu_idu_ag_pipe3_vload_inst_vld      ),
  .lsu_idu_ag_pipe3_vreg_dupx            (lsu_idu_ag_pipe3_vreg_dupx           ),
  .lsu_idu_dc_pipe3_vload_fwd_inst_vld   (lsu_idu_dc_pipe3_vload_fwd_inst_vld  ),
  .lsu_idu_dc_pipe3_vload_inst_vld_dupx  (lsu_idu_dc_pipe3_vload_inst_vld_dupx ),
  .lsu_idu_dc_pipe3_vreg_dupx            (lsu_idu_dc_pipe3_vreg_dupx           ),
  .lsu_idu_wb_pipe3_wb_vreg_dupx         (lsu_idu_wb_pipe3_wb_vreg_dupx        ),
  .lsu_idu_wb_pipe3_wb_vreg_vld_dupx     (lsu_idu_wb_pipe3_wb_vreg_vld_dupx    ),
  .pad_yy_icg_scan_en                    (pad_yy_icg_scan_en                   ),
  .rtu_idu_flush_fe                      (rtu_idu_flush_fe                     ),
  .rtu_idu_flush_is                      (rtu_idu_flush_is                     ),
  .vfpu0_vreg_fwd_vld                    (x_vfpu0_vreg_fwd_vld                 ),
  .vfpu1_vreg_fwd_vld                    (x_vfpu1_vreg_fwd_vld                 ),
  .vfpu_idu_ex1_pipe6_data_vld_dupx      (vfpu_idu_ex1_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex1_pipe6_fmla_data_vld_dupx (vfpu_idu_ex1_pipe6_fmla_data_vld_dupx),
  .vfpu_idu_ex1_pipe6_vreg_dupx          (vfpu_idu_ex1_pipe6_vreg_dupx         ),
  .vfpu_idu_ex1_pipe7_data_vld_dupx      (vfpu_idu_ex1_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex1_pipe7_fmla_data_vld_dupx (vfpu_idu_ex1_pipe7_fmla_data_vld_dupx),
  .vfpu_idu_ex1_pipe7_vreg_dupx          (vfpu_idu_ex1_pipe7_vreg_dupx         ),
  .vfpu_idu_ex2_pipe6_data_vld_dupx      (vfpu_idu_ex2_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex2_pipe6_fmla_data_vld_dupx (vfpu_idu_ex2_pipe6_fmla_data_vld_dupx),
  .vfpu_idu_ex2_pipe6_vreg_dupx          (vfpu_idu_ex2_pipe6_vreg_dupx         ),
  .vfpu_idu_ex2_pipe7_data_vld_dupx      (vfpu_idu_ex2_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex2_pipe7_fmla_data_vld_dupx (vfpu_idu_ex2_pipe7_fmla_data_vld_dupx),
  .vfpu_idu_ex2_pipe7_vreg_dupx          (vfpu_idu_ex2_pipe7_vreg_dupx         ),
  .vfpu_idu_ex3_pipe6_data_vld_dupx      (vfpu_idu_ex3_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex3_pipe6_vreg_dupx          (vfpu_idu_ex3_pipe6_vreg_dupx         ),
  .vfpu_idu_ex3_pipe7_data_vld_dupx      (vfpu_idu_ex3_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex3_pipe7_vreg_dupx          (vfpu_idu_ex3_pipe7_vreg_dupx         ),
  .vfpu_idu_ex5_pipe6_wb_vreg_dupx       (vfpu_idu_ex5_pipe6_wb_vreg_dupx      ),
  .vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx   (vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx  ),
  .vfpu_idu_ex5_pipe7_wb_vreg_dupx       (vfpu_idu_ex5_pipe7_wb_vreg_dupx      ),
  .vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx   (vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx  ),
  .x_create_data                         (create_srcv2_data[10:0]              ),
  .x_entry_vmla                          (vmla                                 ),
  .x_gateclk_idx_write_en                (create_srcv2_gateclk_en              ),
  .x_gateclk_write_en                    (x_create_gateclk_en                  ),
  .x_rdy_clr                             (srcv2_rdy_clr                        ),
  .x_read_data                           (read_srcv2_data[12:0]                ),
  .x_write_en                            (x_create_dp_en                       )
);

// &Connect(.gateclk_entry_vld        (gateclk_entry_vld), @391
//          .vfpu0_vreg_fwd_vld       (x_vfpu0_vreg_fwd_vld), @392
//          .vfpu1_vreg_fwd_vld       (x_vfpu1_vreg_fwd_vld), @393
//          .x_write_en               (x_create_dp_en), @394
//          .x_gateclk_write_en       (x_create_gateclk_en), @395
//          .x_gateclk_idx_write_en   (create_srcv2_gateclk_en), @396
//          .x_create_data            (create_srcv2_data[10:0]), @397
//          .x_read_data              (read_srcv2_data[12:0]), @398
//          .x_entry_vmla             (vmla), @399
//          .x_rdy_clr                (srcv2_rdy_clr) @400
//         ); @401
assign x_read_data[VIQ1_SRCV2_WB]                     = read_srcv2_data[1];
assign x_read_data[VIQ1_SRCV2_VREG:VIQ1_SRCV2_VREG-6] = read_srcv2_data[8:2];
assign srcv2_rdy_for_issue                            = read_srcv2_data[10];
assign x_read_data[VIQ1_SRCV2_RDY]                    = 1'b0;
assign x_read_data[VIQ1_SRCV2_LSU_MATCH]              = 1'b0;
assign x_read_data[VIQ1_SRCV2_DATA-1]                 = 1'b0;

//-----------------------source v m-------------------------
assign create_srcvm_gateclk_en = x_create_gateclk_en && x_create_data[VIQ1_SRCVM_VLD];
assign create_srcvm_data[9:0]  = x_create_data[VIQ1_SRCVM_DATA:VIQ1_SRCVM_DATA-9];
// &Instance("ct_idu_dep_vreg_entry", "x_ct_idu_is_viq1_srcvm_entry"); @412
ct_idu_dep_vreg_entry  x_ct_idu_is_viq1_srcvm_entry (
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
  .rtu_idu_flush_fe                     (rtu_idu_flush_fe                    ),
  .rtu_idu_flush_is                     (rtu_idu_flush_is                    ),
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
  .x_create_data                        (create_srcvm_data[9:0]              ),
  .x_gateclk_idx_write_en               (create_srcvm_gateclk_en             ),
  .x_gateclk_write_en                   (x_create_gateclk_en                 ),
  .x_rdy_clr                            (srcvm_rdy_clr                       ),
  .x_read_data                          (read_srcvm_data[11:0]               ),
  .x_write_en                           (x_create_dp_en                      )
);

// &Connect(.gateclk_entry_vld        (gateclk_entry_vld), @413
//          .x_write_en               (x_create_dp_en), @414
//          .x_gateclk_write_en       (x_create_gateclk_en), @415
//          .x_gateclk_idx_write_en   (create_srcvm_gateclk_en), @416
//          .x_create_data            (create_srcvm_data[9:0]), @417
//          .x_read_data              (read_srcvm_data[11:0]), @418
//          .x_rdy_clr                (srcvm_rdy_clr) @419
//         ); @420
assign x_read_data[VIQ1_SRCVM_WB]                     = read_srcvm_data[1];
assign x_read_data[VIQ1_SRCVM_VREG:VIQ1_SRCVM_VREG-6] = read_srcvm_data[8:2];
assign srcvm_rdy_for_issue                            = read_srcvm_data[9];
assign x_read_data[VIQ1_SRCVM_RDY]                    = 1'b0;
assign x_read_data[VIQ1_SRCVM_LSU_MATCH]              = 1'b0;

//==========================================================
//           Bypass Ready indicators for RF launch
//==========================================================
//----------------------------------------------------------
//            Dispatch instruction source match
//----------------------------------------------------------
assign dis_inst0_srcv2_match = (dst_vreg[6:0] == dp_viq_dis_inst0_srcv2_vreg[6:0]);
assign dis_inst1_srcv2_match = (dst_vreg[6:0] == dp_viq_dis_inst1_srcv2_vreg[6:0]);
assign dis_inst2_srcv2_match = (dst_vreg[6:0] == dp_viq_dis_inst2_srcv2_vreg[6:0]);
assign dis_inst3_srcv2_match = (dst_vreg[6:0] == dp_viq_dis_inst3_srcv2_vreg[6:0]);

//----------------------------------------------------------
//                   VIQ0 create update
//----------------------------------------------------------
// &CombBeg; @441
always @( dis_inst3_srcv2_match
       or ctrl_dp_is_dis_viq0_create0_sel[1:0]
       or dis_inst0_srcv2_match
       or dis_inst1_srcv2_match
       or dis_inst2_srcv2_match)
begin
  case(ctrl_dp_is_dis_viq0_create0_sel[1:0])
    2'd0:   lch_rdy_viq0_create0_src_match = dis_inst0_srcv2_match;
    2'd1:   lch_rdy_viq0_create0_src_match = dis_inst1_srcv2_match;
    2'd2:   lch_rdy_viq0_create0_src_match = dis_inst2_srcv2_match;
    2'd3:   lch_rdy_viq0_create0_src_match = dis_inst3_srcv2_match;
    default:lch_rdy_viq0_create0_src_match = 1'bx;
  endcase
// &CombEnd; @449
end

// &CombBeg; @451
always @( ctrl_dp_is_dis_viq0_create1_sel[1:0]
       or dis_inst3_srcv2_match
       or dis_inst0_srcv2_match
       or dis_inst1_srcv2_match
       or dis_inst2_srcv2_match)
begin
  case(ctrl_dp_is_dis_viq0_create1_sel[1:0])
    2'd0:   lch_rdy_viq0_create1_src_match = dis_inst0_srcv2_match;
    2'd1:   lch_rdy_viq0_create1_src_match = dis_inst1_srcv2_match;
    2'd2:   lch_rdy_viq0_create1_src_match = dis_inst2_srcv2_match;
    2'd3:   lch_rdy_viq0_create1_src_match = dis_inst3_srcv2_match;
    default:lch_rdy_viq0_create1_src_match = 1'bx;
  endcase
// &CombEnd; @459
end

assign lch_rdy_viq0_create0_dp_en = ctrl_viq0_create0_dp_en;
assign lch_rdy_viq0_create1_dp_en = ctrl_viq0_create1_dp_en;

assign viq0_entry0_create_lch_rdy = x_create_data[VIQ1_LCH_RDY_VIQ0-7];
assign viq0_entry1_create_lch_rdy = x_create_data[VIQ1_LCH_RDY_VIQ0-6];
assign viq0_entry2_create_lch_rdy = x_create_data[VIQ1_LCH_RDY_VIQ0-5];
assign viq0_entry3_create_lch_rdy = x_create_data[VIQ1_LCH_RDY_VIQ0-4];
assign viq0_entry4_create_lch_rdy = x_create_data[VIQ1_LCH_RDY_VIQ0-3];
assign viq0_entry5_create_lch_rdy = x_create_data[VIQ1_LCH_RDY_VIQ0-2];
assign viq0_entry6_create_lch_rdy = x_create_data[VIQ1_LCH_RDY_VIQ0-1];
assign viq0_entry7_create_lch_rdy = x_create_data[VIQ1_LCH_RDY_VIQ0-0];

assign viq0_entry0_create_entry[1:0] = {viq0_viq_create1_entry[0],viq0_viq_create0_entry[0]};
assign viq0_entry1_create_entry[1:0] = {viq0_viq_create1_entry[1],viq0_viq_create0_entry[1]};
assign viq0_entry2_create_entry[1:0] = {viq0_viq_create1_entry[2],viq0_viq_create0_entry[2]};
assign viq0_entry3_create_entry[1:0] = {viq0_viq_create1_entry[3],viq0_viq_create0_entry[3]};
assign viq0_entry4_create_entry[1:0] = {viq0_viq_create1_entry[4],viq0_viq_create0_entry[4]};
assign viq0_entry5_create_entry[1:0] = {viq0_viq_create1_entry[5],viq0_viq_create0_entry[5]};
assign viq0_entry6_create_entry[1:0] = {viq0_viq_create1_entry[6],viq0_viq_create0_entry[6]};
assign viq0_entry7_create_entry[1:0] = {viq0_viq_create1_entry[7],viq0_viq_create0_entry[7]};

// &ConnRule(s/^y_/lch_rdy_viq0_/); @482
// &Instance("ct_idu_is_aiq_lch_rdy_1", "x_ct_idu_is_aiq_lch_rdy_1_viq0_entry0"); @483
ct_idu_is_aiq_lch_rdy_1  x_ct_idu_is_aiq_lch_rdy_1_viq0_entry0 (
  .cpurst_b                       (cpurst_b                      ),
  .vld                            (vld                           ),
  .x_create_dp_en                 (x_create_dp_en                ),
  .x_create_entry                 (viq0_entry0_create_entry      ),
  .x_create_lch_rdy               (viq0_entry0_create_lch_rdy    ),
  .x_read_lch_rdy                 (viq0_entry0_read_lch_rdy      ),
  .y_clk                          (lch_rdy_viq0_clk              ),
  .y_create0_dp_en                (lch_rdy_viq0_create0_dp_en    ),
  .y_create0_src_match            (lch_rdy_viq0_create0_src_match),
  .y_create1_dp_en                (lch_rdy_viq0_create1_dp_en    ),
  .y_create1_src_match            (lch_rdy_viq0_create1_src_match)
);

// &Connect(.x_create_entry   (viq0_entry0_create_entry), @484
//          .x_create_lch_rdy (viq0_entry0_create_lch_rdy), @485
//          .x_read_lch_rdy   (viq0_entry0_read_lch_rdy)   ); @486
// &ConnRule(s/^y_/lch_rdy_viq0_/); @487
// &Instance("ct_idu_is_aiq_lch_rdy_1", "x_ct_idu_is_aiq_lch_rdy_1_viq0_entry1"); @488
ct_idu_is_aiq_lch_rdy_1  x_ct_idu_is_aiq_lch_rdy_1_viq0_entry1 (
  .cpurst_b                       (cpurst_b                      ),
  .vld                            (vld                           ),
  .x_create_dp_en                 (x_create_dp_en                ),
  .x_create_entry                 (viq0_entry1_create_entry      ),
  .x_create_lch_rdy               (viq0_entry1_create_lch_rdy    ),
  .x_read_lch_rdy                 (viq0_entry1_read_lch_rdy      ),
  .y_clk                          (lch_rdy_viq0_clk              ),
  .y_create0_dp_en                (lch_rdy_viq0_create0_dp_en    ),
  .y_create0_src_match            (lch_rdy_viq0_create0_src_match),
  .y_create1_dp_en                (lch_rdy_viq0_create1_dp_en    ),
  .y_create1_src_match            (lch_rdy_viq0_create1_src_match)
);

// &Connect(.x_create_entry   (viq0_entry1_create_entry), @489
//          .x_create_lch_rdy (viq0_entry1_create_lch_rdy), @490
//          .x_read_lch_rdy   (viq0_entry1_read_lch_rdy)   ); @491
// &ConnRule(s/^y_/lch_rdy_viq0_/); @492
// &Instance("ct_idu_is_aiq_lch_rdy_1", "x_ct_idu_is_aiq_lch_rdy_1_viq0_entry2"); @493
ct_idu_is_aiq_lch_rdy_1  x_ct_idu_is_aiq_lch_rdy_1_viq0_entry2 (
  .cpurst_b                       (cpurst_b                      ),
  .vld                            (vld                           ),
  .x_create_dp_en                 (x_create_dp_en                ),
  .x_create_entry                 (viq0_entry2_create_entry      ),
  .x_create_lch_rdy               (viq0_entry2_create_lch_rdy    ),
  .x_read_lch_rdy                 (viq0_entry2_read_lch_rdy      ),
  .y_clk                          (lch_rdy_viq0_clk              ),
  .y_create0_dp_en                (lch_rdy_viq0_create0_dp_en    ),
  .y_create0_src_match            (lch_rdy_viq0_create0_src_match),
  .y_create1_dp_en                (lch_rdy_viq0_create1_dp_en    ),
  .y_create1_src_match            (lch_rdy_viq0_create1_src_match)
);

// &Connect(.x_create_entry   (viq0_entry2_create_entry), @494
//          .x_create_lch_rdy (viq0_entry2_create_lch_rdy), @495
//          .x_read_lch_rdy   (viq0_entry2_read_lch_rdy)   ); @496
// &ConnRule(s/^y_/lch_rdy_viq0_/); @497
// &Instance("ct_idu_is_aiq_lch_rdy_1", "x_ct_idu_is_aiq_lch_rdy_1_viq0_entry3"); @498
ct_idu_is_aiq_lch_rdy_1  x_ct_idu_is_aiq_lch_rdy_1_viq0_entry3 (
  .cpurst_b                       (cpurst_b                      ),
  .vld                            (vld                           ),
  .x_create_dp_en                 (x_create_dp_en                ),
  .x_create_entry                 (viq0_entry3_create_entry      ),
  .x_create_lch_rdy               (viq0_entry3_create_lch_rdy    ),
  .x_read_lch_rdy                 (viq0_entry3_read_lch_rdy      ),
  .y_clk                          (lch_rdy_viq0_clk              ),
  .y_create0_dp_en                (lch_rdy_viq0_create0_dp_en    ),
  .y_create0_src_match            (lch_rdy_viq0_create0_src_match),
  .y_create1_dp_en                (lch_rdy_viq0_create1_dp_en    ),
  .y_create1_src_match            (lch_rdy_viq0_create1_src_match)
);

// &Connect(.x_create_entry   (viq0_entry3_create_entry), @499
//          .x_create_lch_rdy (viq0_entry3_create_lch_rdy), @500
//          .x_read_lch_rdy   (viq0_entry3_read_lch_rdy)   ); @501
// &ConnRule(s/^y_/lch_rdy_viq0_/); @502
// &Instance("ct_idu_is_aiq_lch_rdy_1", "x_ct_idu_is_aiq_lch_rdy_1_viq0_entry4"); @503
ct_idu_is_aiq_lch_rdy_1  x_ct_idu_is_aiq_lch_rdy_1_viq0_entry4 (
  .cpurst_b                       (cpurst_b                      ),
  .vld                            (vld                           ),
  .x_create_dp_en                 (x_create_dp_en                ),
  .x_create_entry                 (viq0_entry4_create_entry      ),
  .x_create_lch_rdy               (viq0_entry4_create_lch_rdy    ),
  .x_read_lch_rdy                 (viq0_entry4_read_lch_rdy      ),
  .y_clk                          (lch_rdy_viq0_clk              ),
  .y_create0_dp_en                (lch_rdy_viq0_create0_dp_en    ),
  .y_create0_src_match            (lch_rdy_viq0_create0_src_match),
  .y_create1_dp_en                (lch_rdy_viq0_create1_dp_en    ),
  .y_create1_src_match            (lch_rdy_viq0_create1_src_match)
);

// &Connect(.x_create_entry   (viq0_entry4_create_entry), @504
//          .x_create_lch_rdy (viq0_entry4_create_lch_rdy), @505
//          .x_read_lch_rdy   (viq0_entry4_read_lch_rdy)   ); @506
// &ConnRule(s/^y_/lch_rdy_viq0_/); @507
// &Instance("ct_idu_is_aiq_lch_rdy_1", "x_ct_idu_is_aiq_lch_rdy_1_viq0_entry5"); @508
ct_idu_is_aiq_lch_rdy_1  x_ct_idu_is_aiq_lch_rdy_1_viq0_entry5 (
  .cpurst_b                       (cpurst_b                      ),
  .vld                            (vld                           ),
  .x_create_dp_en                 (x_create_dp_en                ),
  .x_create_entry                 (viq0_entry5_create_entry      ),
  .x_create_lch_rdy               (viq0_entry5_create_lch_rdy    ),
  .x_read_lch_rdy                 (viq0_entry5_read_lch_rdy      ),
  .y_clk                          (lch_rdy_viq0_clk              ),
  .y_create0_dp_en                (lch_rdy_viq0_create0_dp_en    ),
  .y_create0_src_match            (lch_rdy_viq0_create0_src_match),
  .y_create1_dp_en                (lch_rdy_viq0_create1_dp_en    ),
  .y_create1_src_match            (lch_rdy_viq0_create1_src_match)
);

// &Connect(.x_create_entry   (viq0_entry5_create_entry), @509
//          .x_create_lch_rdy (viq0_entry5_create_lch_rdy), @510
//          .x_read_lch_rdy   (viq0_entry5_read_lch_rdy)   ); @511
// &ConnRule(s/^y_/lch_rdy_viq0_/); @512
// &Instance("ct_idu_is_aiq_lch_rdy_1", "x_ct_idu_is_aiq_lch_rdy_1_viq0_entry6"); @513
ct_idu_is_aiq_lch_rdy_1  x_ct_idu_is_aiq_lch_rdy_1_viq0_entry6 (
  .cpurst_b                       (cpurst_b                      ),
  .vld                            (vld                           ),
  .x_create_dp_en                 (x_create_dp_en                ),
  .x_create_entry                 (viq0_entry6_create_entry      ),
  .x_create_lch_rdy               (viq0_entry6_create_lch_rdy    ),
  .x_read_lch_rdy                 (viq0_entry6_read_lch_rdy      ),
  .y_clk                          (lch_rdy_viq0_clk              ),
  .y_create0_dp_en                (lch_rdy_viq0_create0_dp_en    ),
  .y_create0_src_match            (lch_rdy_viq0_create0_src_match),
  .y_create1_dp_en                (lch_rdy_viq0_create1_dp_en    ),
  .y_create1_src_match            (lch_rdy_viq0_create1_src_match)
);

// &Connect(.x_create_entry   (viq0_entry6_create_entry), @514
//          .x_create_lch_rdy (viq0_entry6_create_lch_rdy), @515
//          .x_read_lch_rdy   (viq0_entry6_read_lch_rdy)   ); @516
// &ConnRule(s/^y_/lch_rdy_viq0_/); @517
// &Instance("ct_idu_is_aiq_lch_rdy_1", "x_ct_idu_is_aiq_lch_rdy_1_viq0_entry7"); @518
ct_idu_is_aiq_lch_rdy_1  x_ct_idu_is_aiq_lch_rdy_1_viq0_entry7 (
  .cpurst_b                       (cpurst_b                      ),
  .vld                            (vld                           ),
  .x_create_dp_en                 (x_create_dp_en                ),
  .x_create_entry                 (viq0_entry7_create_entry      ),
  .x_create_lch_rdy               (viq0_entry7_create_lch_rdy    ),
  .x_read_lch_rdy                 (viq0_entry7_read_lch_rdy      ),
  .y_clk                          (lch_rdy_viq0_clk              ),
  .y_create0_dp_en                (lch_rdy_viq0_create0_dp_en    ),
  .y_create0_src_match            (lch_rdy_viq0_create0_src_match),
  .y_create1_dp_en                (lch_rdy_viq0_create1_dp_en    ),
  .y_create1_src_match            (lch_rdy_viq0_create1_src_match)
);

// &Connect(.x_create_entry   (viq0_entry7_create_entry), @519
//          .x_create_lch_rdy (viq0_entry7_create_lch_rdy), @520
//          .x_read_lch_rdy   (viq0_entry7_read_lch_rdy)   ); @521

assign x_read_data[VIQ1_LCH_RDY_VIQ0-7] = viq0_entry0_read_lch_rdy;
assign x_read_data[VIQ1_LCH_RDY_VIQ0-6] = viq0_entry1_read_lch_rdy;
assign x_read_data[VIQ1_LCH_RDY_VIQ0-5] = viq0_entry2_read_lch_rdy;
assign x_read_data[VIQ1_LCH_RDY_VIQ0-4] = viq0_entry3_read_lch_rdy;
assign x_read_data[VIQ1_LCH_RDY_VIQ0-3] = viq0_entry4_read_lch_rdy;
assign x_read_data[VIQ1_LCH_RDY_VIQ0-2] = viq0_entry5_read_lch_rdy;
assign x_read_data[VIQ1_LCH_RDY_VIQ0-1] = viq0_entry6_read_lch_rdy;
assign x_read_data[VIQ1_LCH_RDY_VIQ0-0] = viq0_entry7_read_lch_rdy;

//----------------------------------------------------------
//                   VIQ1 create update
//----------------------------------------------------------
// &CombBeg; @535
always @( dis_inst3_srcv2_match
       or dis_inst0_srcv2_match
       or dis_inst1_srcv2_match
       or ctrl_dp_is_dis_viq1_create0_sel[1:0]
       or dis_inst2_srcv2_match)
begin
  case(ctrl_dp_is_dis_viq1_create0_sel[1:0])
    2'd0:   lch_rdy_viq1_create0_src_match = dis_inst0_srcv2_match;
    2'd1:   lch_rdy_viq1_create0_src_match = dis_inst1_srcv2_match;
    2'd2:   lch_rdy_viq1_create0_src_match = dis_inst2_srcv2_match;
    2'd3:   lch_rdy_viq1_create0_src_match = dis_inst3_srcv2_match;
    default:lch_rdy_viq1_create0_src_match = 1'bx;
  endcase
// &CombEnd; @543
end

// &CombBeg; @545
always @( dis_inst3_srcv2_match
       or ctrl_dp_is_dis_viq1_create1_sel[1:0]
       or dis_inst0_srcv2_match
       or dis_inst1_srcv2_match
       or dis_inst2_srcv2_match)
begin
  case(ctrl_dp_is_dis_viq1_create1_sel[1:0])
    2'd0:   lch_rdy_viq1_create1_src_match = dis_inst0_srcv2_match;
    2'd1:   lch_rdy_viq1_create1_src_match = dis_inst1_srcv2_match;
    2'd2:   lch_rdy_viq1_create1_src_match = dis_inst2_srcv2_match;
    2'd3:   lch_rdy_viq1_create1_src_match = dis_inst3_srcv2_match;
    default:lch_rdy_viq1_create1_src_match = 1'bx;
  endcase
// &CombEnd; @553
end

assign lch_rdy_viq1_create0_dp_en = ctrl_viq1_create0_dp_en;
assign lch_rdy_viq1_create1_dp_en = ctrl_viq1_create1_dp_en;

assign viq1_entry0_create_lch_rdy = x_create_data[VIQ1_LCH_RDY_VIQ1-7];
assign viq1_entry1_create_lch_rdy = x_create_data[VIQ1_LCH_RDY_VIQ1-6];
assign viq1_entry2_create_lch_rdy = x_create_data[VIQ1_LCH_RDY_VIQ1-5];
assign viq1_entry3_create_lch_rdy = x_create_data[VIQ1_LCH_RDY_VIQ1-4];
assign viq1_entry4_create_lch_rdy = x_create_data[VIQ1_LCH_RDY_VIQ1-3];
assign viq1_entry5_create_lch_rdy = x_create_data[VIQ1_LCH_RDY_VIQ1-2];
assign viq1_entry6_create_lch_rdy = x_create_data[VIQ1_LCH_RDY_VIQ1-1];
assign viq1_entry7_create_lch_rdy = x_create_data[VIQ1_LCH_RDY_VIQ1-0];

assign viq1_entry0_create_entry[1:0] = {viq1_viq_create1_entry[0],viq1_viq_create0_entry[0]};
assign viq1_entry1_create_entry[1:0] = {viq1_viq_create1_entry[1],viq1_viq_create0_entry[1]};
assign viq1_entry2_create_entry[1:0] = {viq1_viq_create1_entry[2],viq1_viq_create0_entry[2]};
assign viq1_entry3_create_entry[1:0] = {viq1_viq_create1_entry[3],viq1_viq_create0_entry[3]};
assign viq1_entry4_create_entry[1:0] = {viq1_viq_create1_entry[4],viq1_viq_create0_entry[4]};
assign viq1_entry5_create_entry[1:0] = {viq1_viq_create1_entry[5],viq1_viq_create0_entry[5]};
assign viq1_entry6_create_entry[1:0] = {viq1_viq_create1_entry[6],viq1_viq_create0_entry[6]};
assign viq1_entry7_create_entry[1:0] = {viq1_viq_create1_entry[7],viq1_viq_create0_entry[7]};

// &ConnRule(s/^y_/lch_rdy_viq1_/); @576
// &Instance("ct_idu_is_aiq_lch_rdy_1", "x_ct_idu_is_aiq_lch_rdy_1_viq1_entry0"); @577
ct_idu_is_aiq_lch_rdy_1  x_ct_idu_is_aiq_lch_rdy_1_viq1_entry0 (
  .cpurst_b                       (cpurst_b                      ),
  .vld                            (vld                           ),
  .x_create_dp_en                 (x_create_dp_en                ),
  .x_create_entry                 (viq1_entry0_create_entry      ),
  .x_create_lch_rdy               (viq1_entry0_create_lch_rdy    ),
  .x_read_lch_rdy                 (viq1_entry0_read_lch_rdy      ),
  .y_clk                          (lch_rdy_viq1_clk              ),
  .y_create0_dp_en                (lch_rdy_viq1_create0_dp_en    ),
  .y_create0_src_match            (lch_rdy_viq1_create0_src_match),
  .y_create1_dp_en                (lch_rdy_viq1_create1_dp_en    ),
  .y_create1_src_match            (lch_rdy_viq1_create1_src_match)
);

// &Connect(.x_create_entry   (viq1_entry0_create_entry), @578
//          .x_create_lch_rdy (viq1_entry0_create_lch_rdy), @579
//          .x_read_lch_rdy   (viq1_entry0_read_lch_rdy)   ); @580
// &ConnRule(s/^y_/lch_rdy_viq1_/); @581
// &Instance("ct_idu_is_aiq_lch_rdy_1", "x_ct_idu_is_aiq_lch_rdy_1_viq1_entry1"); @582
ct_idu_is_aiq_lch_rdy_1  x_ct_idu_is_aiq_lch_rdy_1_viq1_entry1 (
  .cpurst_b                       (cpurst_b                      ),
  .vld                            (vld                           ),
  .x_create_dp_en                 (x_create_dp_en                ),
  .x_create_entry                 (viq1_entry1_create_entry      ),
  .x_create_lch_rdy               (viq1_entry1_create_lch_rdy    ),
  .x_read_lch_rdy                 (viq1_entry1_read_lch_rdy      ),
  .y_clk                          (lch_rdy_viq1_clk              ),
  .y_create0_dp_en                (lch_rdy_viq1_create0_dp_en    ),
  .y_create0_src_match            (lch_rdy_viq1_create0_src_match),
  .y_create1_dp_en                (lch_rdy_viq1_create1_dp_en    ),
  .y_create1_src_match            (lch_rdy_viq1_create1_src_match)
);

// &Connect(.x_create_entry   (viq1_entry1_create_entry), @583
//          .x_create_lch_rdy (viq1_entry1_create_lch_rdy), @584
//          .x_read_lch_rdy   (viq1_entry1_read_lch_rdy)   ); @585
// &ConnRule(s/^y_/lch_rdy_viq1_/); @586
// &Instance("ct_idu_is_aiq_lch_rdy_1", "x_ct_idu_is_aiq_lch_rdy_1_viq1_entry2"); @587
ct_idu_is_aiq_lch_rdy_1  x_ct_idu_is_aiq_lch_rdy_1_viq1_entry2 (
  .cpurst_b                       (cpurst_b                      ),
  .vld                            (vld                           ),
  .x_create_dp_en                 (x_create_dp_en                ),
  .x_create_entry                 (viq1_entry2_create_entry      ),
  .x_create_lch_rdy               (viq1_entry2_create_lch_rdy    ),
  .x_read_lch_rdy                 (viq1_entry2_read_lch_rdy      ),
  .y_clk                          (lch_rdy_viq1_clk              ),
  .y_create0_dp_en                (lch_rdy_viq1_create0_dp_en    ),
  .y_create0_src_match            (lch_rdy_viq1_create0_src_match),
  .y_create1_dp_en                (lch_rdy_viq1_create1_dp_en    ),
  .y_create1_src_match            (lch_rdy_viq1_create1_src_match)
);

// &Connect(.x_create_entry   (viq1_entry2_create_entry), @588
//          .x_create_lch_rdy (viq1_entry2_create_lch_rdy), @589
//          .x_read_lch_rdy   (viq1_entry2_read_lch_rdy)   ); @590
// &ConnRule(s/^y_/lch_rdy_viq1_/); @591
// &Instance("ct_idu_is_aiq_lch_rdy_1", "x_ct_idu_is_aiq_lch_rdy_1_viq1_entry3"); @592
ct_idu_is_aiq_lch_rdy_1  x_ct_idu_is_aiq_lch_rdy_1_viq1_entry3 (
  .cpurst_b                       (cpurst_b                      ),
  .vld                            (vld                           ),
  .x_create_dp_en                 (x_create_dp_en                ),
  .x_create_entry                 (viq1_entry3_create_entry      ),
  .x_create_lch_rdy               (viq1_entry3_create_lch_rdy    ),
  .x_read_lch_rdy                 (viq1_entry3_read_lch_rdy      ),
  .y_clk                          (lch_rdy_viq1_clk              ),
  .y_create0_dp_en                (lch_rdy_viq1_create0_dp_en    ),
  .y_create0_src_match            (lch_rdy_viq1_create0_src_match),
  .y_create1_dp_en                (lch_rdy_viq1_create1_dp_en    ),
  .y_create1_src_match            (lch_rdy_viq1_create1_src_match)
);

// &Connect(.x_create_entry   (viq1_entry3_create_entry), @593
//          .x_create_lch_rdy (viq1_entry3_create_lch_rdy), @594
//          .x_read_lch_rdy   (viq1_entry3_read_lch_rdy)   ); @595
// &ConnRule(s/^y_/lch_rdy_viq1_/); @596
// &Instance("ct_idu_is_aiq_lch_rdy_1", "x_ct_idu_is_aiq_lch_rdy_1_viq1_entry4"); @597
ct_idu_is_aiq_lch_rdy_1  x_ct_idu_is_aiq_lch_rdy_1_viq1_entry4 (
  .cpurst_b                       (cpurst_b                      ),
  .vld                            (vld                           ),
  .x_create_dp_en                 (x_create_dp_en                ),
  .x_create_entry                 (viq1_entry4_create_entry      ),
  .x_create_lch_rdy               (viq1_entry4_create_lch_rdy    ),
  .x_read_lch_rdy                 (viq1_entry4_read_lch_rdy      ),
  .y_clk                          (lch_rdy_viq1_clk              ),
  .y_create0_dp_en                (lch_rdy_viq1_create0_dp_en    ),
  .y_create0_src_match            (lch_rdy_viq1_create0_src_match),
  .y_create1_dp_en                (lch_rdy_viq1_create1_dp_en    ),
  .y_create1_src_match            (lch_rdy_viq1_create1_src_match)
);

// &Connect(.x_create_entry   (viq1_entry4_create_entry), @598
//          .x_create_lch_rdy (viq1_entry4_create_lch_rdy), @599
//          .x_read_lch_rdy   (viq1_entry4_read_lch_rdy)   ); @600
// &ConnRule(s/^y_/lch_rdy_viq1_/); @601
// &Instance("ct_idu_is_aiq_lch_rdy_1", "x_ct_idu_is_aiq_lch_rdy_1_viq1_entry5"); @602
ct_idu_is_aiq_lch_rdy_1  x_ct_idu_is_aiq_lch_rdy_1_viq1_entry5 (
  .cpurst_b                       (cpurst_b                      ),
  .vld                            (vld                           ),
  .x_create_dp_en                 (x_create_dp_en                ),
  .x_create_entry                 (viq1_entry5_create_entry      ),
  .x_create_lch_rdy               (viq1_entry5_create_lch_rdy    ),
  .x_read_lch_rdy                 (viq1_entry5_read_lch_rdy      ),
  .y_clk                          (lch_rdy_viq1_clk              ),
  .y_create0_dp_en                (lch_rdy_viq1_create0_dp_en    ),
  .y_create0_src_match            (lch_rdy_viq1_create0_src_match),
  .y_create1_dp_en                (lch_rdy_viq1_create1_dp_en    ),
  .y_create1_src_match            (lch_rdy_viq1_create1_src_match)
);

// &Connect(.x_create_entry   (viq1_entry5_create_entry), @603
//          .x_create_lch_rdy (viq1_entry5_create_lch_rdy), @604
//          .x_read_lch_rdy   (viq1_entry5_read_lch_rdy)   ); @605
// &ConnRule(s/^y_/lch_rdy_viq1_/); @606
// &Instance("ct_idu_is_aiq_lch_rdy_1", "x_ct_idu_is_aiq_lch_rdy_1_viq1_entry6"); @607
ct_idu_is_aiq_lch_rdy_1  x_ct_idu_is_aiq_lch_rdy_1_viq1_entry6 (
  .cpurst_b                       (cpurst_b                      ),
  .vld                            (vld                           ),
  .x_create_dp_en                 (x_create_dp_en                ),
  .x_create_entry                 (viq1_entry6_create_entry      ),
  .x_create_lch_rdy               (viq1_entry6_create_lch_rdy    ),
  .x_read_lch_rdy                 (viq1_entry6_read_lch_rdy      ),
  .y_clk                          (lch_rdy_viq1_clk              ),
  .y_create0_dp_en                (lch_rdy_viq1_create0_dp_en    ),
  .y_create0_src_match            (lch_rdy_viq1_create0_src_match),
  .y_create1_dp_en                (lch_rdy_viq1_create1_dp_en    ),
  .y_create1_src_match            (lch_rdy_viq1_create1_src_match)
);

// &Connect(.x_create_entry   (viq1_entry6_create_entry), @608
//          .x_create_lch_rdy (viq1_entry6_create_lch_rdy), @609
//          .x_read_lch_rdy   (viq1_entry6_read_lch_rdy)   ); @610
// &ConnRule(s/^y_/lch_rdy_viq1_/); @611
// &Instance("ct_idu_is_aiq_lch_rdy_1", "x_ct_idu_is_aiq_lch_rdy_1_viq1_entry7"); @612
ct_idu_is_aiq_lch_rdy_1  x_ct_idu_is_aiq_lch_rdy_1_viq1_entry7 (
  .cpurst_b                       (cpurst_b                      ),
  .vld                            (vld                           ),
  .x_create_dp_en                 (x_create_dp_en                ),
  .x_create_entry                 (viq1_entry7_create_entry      ),
  .x_create_lch_rdy               (viq1_entry7_create_lch_rdy    ),
  .x_read_lch_rdy                 (viq1_entry7_read_lch_rdy      ),
  .y_clk                          (lch_rdy_viq1_clk              ),
  .y_create0_dp_en                (lch_rdy_viq1_create0_dp_en    ),
  .y_create0_src_match            (lch_rdy_viq1_create0_src_match),
  .y_create1_dp_en                (lch_rdy_viq1_create1_dp_en    ),
  .y_create1_src_match            (lch_rdy_viq1_create1_src_match)
);

// &Connect(.x_create_entry   (viq1_entry7_create_entry), @613
//          .x_create_lch_rdy (viq1_entry7_create_lch_rdy), @614
//          .x_read_lch_rdy   (viq1_entry7_read_lch_rdy)   ); @615

assign x_read_data[VIQ1_LCH_RDY_VIQ1-7] = viq1_entry0_read_lch_rdy;
assign x_read_data[VIQ1_LCH_RDY_VIQ1-6] = viq1_entry1_read_lch_rdy;
assign x_read_data[VIQ1_LCH_RDY_VIQ1-5] = viq1_entry2_read_lch_rdy;
assign x_read_data[VIQ1_LCH_RDY_VIQ1-4] = viq1_entry3_read_lch_rdy;
assign x_read_data[VIQ1_LCH_RDY_VIQ1-3] = viq1_entry4_read_lch_rdy;
assign x_read_data[VIQ1_LCH_RDY_VIQ1-2] = viq1_entry5_read_lch_rdy;
assign x_read_data[VIQ1_LCH_RDY_VIQ1-1] = viq1_entry6_read_lch_rdy;
assign x_read_data[VIQ1_LCH_RDY_VIQ1-0] = viq1_entry7_read_lch_rdy;

//==========================================================
//                  Entry Ready Signal
//==========================================================
assign x_rdy = vld
               && !frz
               && !ctrl_viq1_stall
               && srcv0_rdy_for_issue
               && srcv1_rdy_for_issue
               && srcv2_rdy_for_issue
               && srcvm_rdy_for_issue;

// &ModuleEnd; @637
endmodule


