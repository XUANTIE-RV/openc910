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
module ct_l2c_tag_ecc(
  cmp_stage_stall,
  fifo_dout_after_correct,
  forever_cpuclk,
  icc_dca_dirty_f,
  icc_dca_tag_f,
  icc_dca_way_sel,
  icc_tag_flop,
  l2c_dirty_dout,
  l2c_icg_en,
  l2c_tag_dirty_fatal_err,
  l2c_tag_dout,
  next_stage_stall,
  pad_yy_icg_scan_en,
  tag_stage_flop_vld,
  way0_dirty_dout_after_correct,
  way0_tag_dout_after_correct,
  way10_dirty_dout_after_correct,
  way10_tag_dout_after_correct,
  way11_dirty_dout_after_correct,
  way11_tag_dout_after_correct,
  way12_dirty_dout_after_correct,
  way12_tag_dout_after_correct,
  way13_dirty_dout_after_correct,
  way13_tag_dout_after_correct,
  way14_dirty_dout_after_correct,
  way14_tag_dout_after_correct,
  way15_dirty_dout_after_correct,
  way15_tag_dout_after_correct,
  way1_dirty_dout_after_correct,
  way1_tag_dout_after_correct,
  way2_dirty_dout_after_correct,
  way2_tag_dout_after_correct,
  way3_dirty_dout_after_correct,
  way3_tag_dout_after_correct,
  way4_dirty_dout_after_correct,
  way4_tag_dout_after_correct,
  way5_dirty_dout_after_correct,
  way5_tag_dout_after_correct,
  way6_dirty_dout_after_correct,
  way6_tag_dout_after_correct,
  way7_dirty_dout_after_correct,
  way7_tag_dout_after_correct,
  way8_dirty_dout_after_correct,
  way8_tag_dout_after_correct,
  way9_dirty_dout_after_correct,
  way9_tag_dout_after_correct
);

// &Ports; @23
input            cmp_stage_stall;               
input            forever_cpuclk;                
input   [15 :0]  icc_dca_way_sel;               
input            icc_tag_flop;                  
input   [143:0]  l2c_dirty_dout;                
input            l2c_icg_en;                    
input   [383:0]  l2c_tag_dout;                  
input            pad_yy_icg_scan_en;            
input            tag_stage_flop_vld;            
output  [15 :0]  fifo_dout_after_correct;       
output  [7  :0]  icc_dca_dirty_f;               
output  [23 :0]  icc_dca_tag_f;                 
output  [15 :0]  l2c_tag_dirty_fatal_err;       
output           next_stage_stall;              
output  [7  :0]  way0_dirty_dout_after_correct; 
output  [23 :0]  way0_tag_dout_after_correct;   
output  [7  :0]  way10_dirty_dout_after_correct; 
output  [23 :0]  way10_tag_dout_after_correct;  
output  [7  :0]  way11_dirty_dout_after_correct; 
output  [23 :0]  way11_tag_dout_after_correct;  
output  [7  :0]  way12_dirty_dout_after_correct; 
output  [23 :0]  way12_tag_dout_after_correct;  
output  [7  :0]  way13_dirty_dout_after_correct; 
output  [23 :0]  way13_tag_dout_after_correct;  
output  [7  :0]  way14_dirty_dout_after_correct; 
output  [23 :0]  way14_tag_dout_after_correct;  
output  [7  :0]  way15_dirty_dout_after_correct; 
output  [23 :0]  way15_tag_dout_after_correct;  
output  [7  :0]  way1_dirty_dout_after_correct; 
output  [23 :0]  way1_tag_dout_after_correct;   
output  [7  :0]  way2_dirty_dout_after_correct; 
output  [23 :0]  way2_tag_dout_after_correct;   
output  [7  :0]  way3_dirty_dout_after_correct; 
output  [23 :0]  way3_tag_dout_after_correct;   
output  [7  :0]  way4_dirty_dout_after_correct; 
output  [23 :0]  way4_tag_dout_after_correct;   
output  [7  :0]  way5_dirty_dout_after_correct; 
output  [23 :0]  way5_tag_dout_after_correct;   
output  [7  :0]  way6_dirty_dout_after_correct; 
output  [23 :0]  way6_tag_dout_after_correct;   
output  [7  :0]  way7_dirty_dout_after_correct; 
output  [23 :0]  way7_tag_dout_after_correct;   
output  [7  :0]  way8_dirty_dout_after_correct; 
output  [23 :0]  way8_tag_dout_after_correct;   
output  [7  :0]  way9_dirty_dout_after_correct; 
output  [23 :0]  way9_tag_dout_after_correct;   

// &Regs; @24
reg     [7  :0]  icc_dca_dirty_f;               
reg     [23 :0]  icc_dca_tag_f;                 

// &Wires; @25
wire             cmp_stage_stall;               
wire    [15 :0]  fifo_dout;                     
wire    [15 :0]  fifo_dout_after_correct;       
wire             forever_cpuclk;                
wire    [7  :0]  icc_dca_dirty;                 
wire    [23 :0]  icc_dca_tag;                   
wire    [15 :0]  icc_dca_way_sel;               
wire             icc_tag_flop;                  
wire    [143:0]  l2c_dirty_dout;                
wire             l2c_icg_en;                    
wire    [15 :0]  l2c_tag_dirty_fatal_err;       
wire    [383:0]  l2c_tag_dout;                  
wire             next_stage_stall;              
wire             pad_yy_icg_scan_en;            
wire             tag_dout_clk;                  
wire             tag_dout_flop_vld;             
wire             tag_stage_flop_vld;            
wire    [7  :0]  way0_dirty_dout;               
wire    [7  :0]  way0_dirty_dout_after_correct; 
wire    [23 :0]  way0_tag_dout;                 
wire    [23 :0]  way0_tag_dout_after_correct;   
wire    [7  :0]  way10_dirty_dout;              
wire    [7  :0]  way10_dirty_dout_after_correct; 
wire    [23 :0]  way10_tag_dout;                
wire    [23 :0]  way10_tag_dout_after_correct;  
wire    [7  :0]  way11_dirty_dout;              
wire    [7  :0]  way11_dirty_dout_after_correct; 
wire    [23 :0]  way11_tag_dout;                
wire    [23 :0]  way11_tag_dout_after_correct;  
wire    [7  :0]  way12_dirty_dout;              
wire    [7  :0]  way12_dirty_dout_after_correct; 
wire    [23 :0]  way12_tag_dout;                
wire    [23 :0]  way12_tag_dout_after_correct;  
wire    [7  :0]  way13_dirty_dout;              
wire    [7  :0]  way13_dirty_dout_after_correct; 
wire    [23 :0]  way13_tag_dout;                
wire    [23 :0]  way13_tag_dout_after_correct;  
wire    [7  :0]  way14_dirty_dout;              
wire    [7  :0]  way14_dirty_dout_after_correct; 
wire    [23 :0]  way14_tag_dout;                
wire    [23 :0]  way14_tag_dout_after_correct;  
wire    [7  :0]  way15_dirty_dout;              
wire    [7  :0]  way15_dirty_dout_after_correct; 
wire    [23 :0]  way15_tag_dout;                
wire    [23 :0]  way15_tag_dout_after_correct;  
wire    [7  :0]  way1_dirty_dout;               
wire    [7  :0]  way1_dirty_dout_after_correct; 
wire    [23 :0]  way1_tag_dout;                 
wire    [23 :0]  way1_tag_dout_after_correct;   
wire    [7  :0]  way2_dirty_dout;               
wire    [7  :0]  way2_dirty_dout_after_correct; 
wire    [23 :0]  way2_tag_dout;                 
wire    [23 :0]  way2_tag_dout_after_correct;   
wire    [7  :0]  way3_dirty_dout;               
wire    [7  :0]  way3_dirty_dout_after_correct; 
wire    [23 :0]  way3_tag_dout;                 
wire    [23 :0]  way3_tag_dout_after_correct;   
wire    [7  :0]  way4_dirty_dout;               
wire    [7  :0]  way4_dirty_dout_after_correct; 
wire    [23 :0]  way4_tag_dout;                 
wire    [23 :0]  way4_tag_dout_after_correct;   
wire    [7  :0]  way5_dirty_dout;               
wire    [7  :0]  way5_dirty_dout_after_correct; 
wire    [23 :0]  way5_tag_dout;                 
wire    [23 :0]  way5_tag_dout_after_correct;   
wire    [7  :0]  way6_dirty_dout;               
wire    [7  :0]  way6_dirty_dout_after_correct; 
wire    [23 :0]  way6_tag_dout;                 
wire    [23 :0]  way6_tag_dout_after_correct;   
wire    [7  :0]  way7_dirty_dout;               
wire    [7  :0]  way7_dirty_dout_after_correct; 
wire    [23 :0]  way7_tag_dout;                 
wire    [23 :0]  way7_tag_dout_after_correct;   
wire    [7  :0]  way8_dirty_dout;               
wire    [7  :0]  way8_dirty_dout_after_correct; 
wire    [23 :0]  way8_tag_dout;                 
wire    [23 :0]  way8_tag_dout_after_correct;   
wire    [7  :0]  way9_dirty_dout;               
wire    [7  :0]  way9_dirty_dout_after_correct; 
wire    [23 :0]  way9_tag_dout;                 
wire    [23 :0]  way9_tag_dout_after_correct;   


parameter TAG_TAG_LENTH    = `L2C_TAG_DATA_WIDTH;
parameter TAG_INDEX_LENTH  = `L2C_TAG_INDEX_WIDTH;
parameter DATA_INDEX_LENTH = `L2C_DATA_INDEX_WIDTH;
parameter L2C_ADDRW        = 33;
parameter DIRTY_WIDTH      = 8;

// &Force("output", "next_stage_stall"); @33
// &Force("output", "tecc_stage_addr"); @35
// &Force("output", "tecc_stage_vld"); @36
// &Instance("gated_clk_cell", "x_l2c_tecc_dp_gated_clk"); @41
// &Connect(.clk_in        (forever_cpuclk     ), @42
//          .external_en   (1'b0               ), @43
//          .global_en     (1'b1               ), @44
//          .module_en     (l2c_icg_en     ), @45
//          .local_en      (tecc_dp_clk_en  ), @46
//          .clk_out       (tecc_dp_clk     ) @47
//         ); @48
// &Force("output", "tecc_stage_ecc_en"); @60
assign next_stage_stall = cmp_stage_stall;

// &Instance("ct_l2c_ecc_encode_7bit","x_ct_l2c_tag_ecc_encode"); @106
// &Connect(.d_in         (tag_encode_din), @107
//          .dout         (tag_encode_dout)); @108
// &Instance("ct_l2c_ecc_encode_5bit","x_ct_l2c_dirty_ecc_encode"); @110
// &Connect(.d_in         (dirty_encode_din), @111
//          .dout         (dirty_encode_dout)); @112
// &Force("bus", "cmp_stage_addr",32,0); @114
// &CombBeg; @221
// &CombEnd; @236
// &CombBeg; @267
// &CombEnd; @282
// &Force("output", "way_sel_cnt"); @411
// &ConnRule(s/^x_/way0_/); @427
// &ConnRule(s/_x$/[0]/); @428
// &Instance("ct_l2c_tag_ecc_decode", "x_ct_l2c_tag0_ecc_decode"); @429
// &ConnRule(s/^x_/way1_/); @430
// &ConnRule(s/_x$/[1]/); @431
// &Instance("ct_l2c_tag_ecc_decode", "x_ct_l2c_tag1_ecc_decode"); @432
// &ConnRule(s/^x_/way2_/); @433
// &ConnRule(s/_x$/[2]/); @434
// &Instance("ct_l2c_tag_ecc_decode", "x_ct_l2c_tag2_ecc_decode"); @435
// &ConnRule(s/^x_/way3_/); @436
// &ConnRule(s/_x$/[3]/); @437
// &Instance("ct_l2c_tag_ecc_decode", "x_ct_l2c_tag3_ecc_decode"); @438
// &ConnRule(s/^x_/way4_/); @439
// &ConnRule(s/_x$/[4]/); @440
// &Instance("ct_l2c_tag_ecc_decode", "x_ct_l2c_tag4_ecc_decode"); @441
// &ConnRule(s/^x_/way5_/); @442
// &ConnRule(s/_x$/[5]/); @443
// &Instance("ct_l2c_tag_ecc_decode", "x_ct_l2c_tag5_ecc_decode"); @444
// &ConnRule(s/^x_/way6_/); @445
// &ConnRule(s/_x$/[6]/); @446
// &Instance("ct_l2c_tag_ecc_decode", "x_ct_l2c_tag6_ecc_decode"); @447
// &ConnRule(s/^x_/way7_/); @448
// &ConnRule(s/_x$/[7]/); @449
// &Instance("ct_l2c_tag_ecc_decode", "x_ct_l2c_tag7_ecc_decode"); @450
// &ConnRule(s/^x_/way8_/); @453
// &ConnRule(s/_x$/[8]/); @454
// &Instance("ct_l2c_tag_ecc_decode", "x_ct_l2c_tag8_ecc_decode"); @455
// &ConnRule(s/^x_/way9_/); @456
// &ConnRule(s/_x$/[9]/); @457
// &Instance("ct_l2c_tag_ecc_decode", "x_ct_l2c_tag9_ecc_decode"); @458
// &ConnRule(s/^x_/way10_/); @459
// &ConnRule(s/_x$/[10]/); @460
// &Instance("ct_l2c_tag_ecc_decode", "x_ct_l2c_tag10_ecc_decode"); @461
// &ConnRule(s/^x_/way11_/); @462
// &ConnRule(s/_x$/[11]/); @463
// &Instance("ct_l2c_tag_ecc_decode", "x_ct_l2c_tag11_ecc_decode"); @464
// &ConnRule(s/^x_/way12_/); @465
// &ConnRule(s/_x$/[12]/); @466
// &Instance("ct_l2c_tag_ecc_decode", "x_ct_l2c_tag12_ecc_decode"); @467
// &ConnRule(s/^x_/way13_/); @468
// &ConnRule(s/_x$/[13]/); @469
// &Instance("ct_l2c_tag_ecc_decode", "x_ct_l2c_tag13_ecc_decode"); @470
// &ConnRule(s/^x_/way14_/); @471
// &ConnRule(s/_x$/[14]/); @472
// &Instance("ct_l2c_tag_ecc_decode", "x_ct_l2c_tag14_ecc_decode"); @473
// &ConnRule(s/^x_/way15_/); @474
// &ConnRule(s/_x$/[15]/); @475
// &Instance("ct_l2c_tag_ecc_decode", "x_ct_l2c_tag15_ecc_decode"); @476

//assign l2c_tag_dirty_err[7:0]        = 8'b0;
assign l2c_tag_dirty_fatal_err[7:0]  = 8'b0;
//assign l2c_tag_dirty_err[15:8]       = 8'b0;  
assign l2c_tag_dirty_fatal_err[15:8] = 8'b0;

//================================================
//          TAG AND DIRTY BIT
//================================================
assign way0_tag_dout[TAG_TAG_LENTH-1:0] = l2c_tag_dout[TAG_TAG_LENTH-1:0];
assign way1_tag_dout[TAG_TAG_LENTH-1:0] = l2c_tag_dout[2*TAG_TAG_LENTH-1:TAG_TAG_LENTH];
assign way2_tag_dout[TAG_TAG_LENTH-1:0] = l2c_tag_dout[3*TAG_TAG_LENTH-1:2*TAG_TAG_LENTH];
assign way3_tag_dout[TAG_TAG_LENTH-1:0] = l2c_tag_dout[4*TAG_TAG_LENTH-1:3*TAG_TAG_LENTH];
assign way4_tag_dout[TAG_TAG_LENTH-1:0] = l2c_tag_dout[5*TAG_TAG_LENTH-1:4*TAG_TAG_LENTH];
assign way5_tag_dout[TAG_TAG_LENTH-1:0] = l2c_tag_dout[6*TAG_TAG_LENTH-1:5*TAG_TAG_LENTH];
assign way6_tag_dout[TAG_TAG_LENTH-1:0] = l2c_tag_dout[7*TAG_TAG_LENTH-1:6*TAG_TAG_LENTH];
assign way7_tag_dout[TAG_TAG_LENTH-1:0] = l2c_tag_dout[8*TAG_TAG_LENTH-1:7*TAG_TAG_LENTH];
assign way8_tag_dout[TAG_TAG_LENTH-1:0]  = l2c_tag_dout[9*TAG_TAG_LENTH-1:8*TAG_TAG_LENTH];
assign way9_tag_dout[TAG_TAG_LENTH-1:0]  = l2c_tag_dout[10*TAG_TAG_LENTH-1:9*TAG_TAG_LENTH];
assign way10_tag_dout[TAG_TAG_LENTH-1:0] = l2c_tag_dout[11*TAG_TAG_LENTH-1:10*TAG_TAG_LENTH];
assign way11_tag_dout[TAG_TAG_LENTH-1:0] = l2c_tag_dout[12*TAG_TAG_LENTH-1:11*TAG_TAG_LENTH];
assign way12_tag_dout[TAG_TAG_LENTH-1:0] = l2c_tag_dout[13*TAG_TAG_LENTH-1:12*TAG_TAG_LENTH];
assign way13_tag_dout[TAG_TAG_LENTH-1:0] = l2c_tag_dout[14*TAG_TAG_LENTH-1:13*TAG_TAG_LENTH];
assign way14_tag_dout[TAG_TAG_LENTH-1:0] = l2c_tag_dout[15*TAG_TAG_LENTH-1:14*TAG_TAG_LENTH];
assign way15_tag_dout[TAG_TAG_LENTH-1:0] = l2c_tag_dout[16*TAG_TAG_LENTH-1:15*TAG_TAG_LENTH];

assign way0_dirty_dout[DIRTY_WIDTH-1:0]  = l2c_dirty_dout[DIRTY_WIDTH-1:0];
assign way1_dirty_dout[DIRTY_WIDTH-1:0]  = l2c_dirty_dout[2*DIRTY_WIDTH-1:DIRTY_WIDTH];
assign way2_dirty_dout[DIRTY_WIDTH-1:0]  = l2c_dirty_dout[3*DIRTY_WIDTH-1:2*DIRTY_WIDTH];
assign way3_dirty_dout[DIRTY_WIDTH-1:0]  = l2c_dirty_dout[4*DIRTY_WIDTH-1:3*DIRTY_WIDTH];
assign way4_dirty_dout[DIRTY_WIDTH-1:0]  = l2c_dirty_dout[5*DIRTY_WIDTH-1:4*DIRTY_WIDTH];
assign way5_dirty_dout[DIRTY_WIDTH-1:0]  = l2c_dirty_dout[6*DIRTY_WIDTH-1:5*DIRTY_WIDTH];
assign way6_dirty_dout[DIRTY_WIDTH-1:0]  = l2c_dirty_dout[7*DIRTY_WIDTH-1:6*DIRTY_WIDTH];
assign way7_dirty_dout[DIRTY_WIDTH-1:0]  = l2c_dirty_dout[8*DIRTY_WIDTH-1:7*DIRTY_WIDTH];
assign way8_dirty_dout[DIRTY_WIDTH-1:0]  = l2c_dirty_dout[9*DIRTY_WIDTH-1:8*DIRTY_WIDTH];
assign way9_dirty_dout[DIRTY_WIDTH-1:0]  = l2c_dirty_dout[10*DIRTY_WIDTH-1:9*DIRTY_WIDTH];
assign way10_dirty_dout[DIRTY_WIDTH-1:0] = l2c_dirty_dout[11*DIRTY_WIDTH-1:10*DIRTY_WIDTH];
assign way11_dirty_dout[DIRTY_WIDTH-1:0] = l2c_dirty_dout[12*DIRTY_WIDTH-1:11*DIRTY_WIDTH];
assign way12_dirty_dout[DIRTY_WIDTH-1:0] = l2c_dirty_dout[13*DIRTY_WIDTH-1:12*DIRTY_WIDTH];
assign way13_dirty_dout[DIRTY_WIDTH-1:0] = l2c_dirty_dout[14*DIRTY_WIDTH-1:13*DIRTY_WIDTH];
assign way14_dirty_dout[DIRTY_WIDTH-1:0] = l2c_dirty_dout[15*DIRTY_WIDTH-1:14*DIRTY_WIDTH];
assign way15_dirty_dout[DIRTY_WIDTH-1:0] = l2c_dirty_dout[16*DIRTY_WIDTH-1:15*DIRTY_WIDTH];

//--------------------------------------
//       TAG and DIRTY correct
//--------------------------------------
assign way0_tag_dout_after_correct[TAG_TAG_LENTH-1:0] = way0_tag_dout[TAG_TAG_LENTH-1:0];
assign way1_tag_dout_after_correct[TAG_TAG_LENTH-1:0] = way1_tag_dout[TAG_TAG_LENTH-1:0];
assign way2_tag_dout_after_correct[TAG_TAG_LENTH-1:0] = way2_tag_dout[TAG_TAG_LENTH-1:0];
assign way3_tag_dout_after_correct[TAG_TAG_LENTH-1:0] = way3_tag_dout[TAG_TAG_LENTH-1:0];
assign way4_tag_dout_after_correct[TAG_TAG_LENTH-1:0] = way4_tag_dout[TAG_TAG_LENTH-1:0];
assign way5_tag_dout_after_correct[TAG_TAG_LENTH-1:0] = way5_tag_dout[TAG_TAG_LENTH-1:0];
assign way6_tag_dout_after_correct[TAG_TAG_LENTH-1:0] = way6_tag_dout[TAG_TAG_LENTH-1:0];
assign way7_tag_dout_after_correct[TAG_TAG_LENTH-1:0] = way7_tag_dout[TAG_TAG_LENTH-1:0];
assign way8_tag_dout_after_correct[TAG_TAG_LENTH-1:0]  = way8_tag_dout[TAG_TAG_LENTH-1:0];
assign way9_tag_dout_after_correct[TAG_TAG_LENTH-1:0]  = way9_tag_dout[TAG_TAG_LENTH-1:0];
assign way10_tag_dout_after_correct[TAG_TAG_LENTH-1:0] = way10_tag_dout[TAG_TAG_LENTH-1:0];
assign way11_tag_dout_after_correct[TAG_TAG_LENTH-1:0] = way11_tag_dout[TAG_TAG_LENTH-1:0];
assign way12_tag_dout_after_correct[TAG_TAG_LENTH-1:0] = way12_tag_dout[TAG_TAG_LENTH-1:0];
assign way13_tag_dout_after_correct[TAG_TAG_LENTH-1:0] = way13_tag_dout[TAG_TAG_LENTH-1:0];
assign way14_tag_dout_after_correct[TAG_TAG_LENTH-1:0] = way14_tag_dout[TAG_TAG_LENTH-1:0];
assign way15_tag_dout_after_correct[TAG_TAG_LENTH-1:0] = way15_tag_dout[TAG_TAG_LENTH-1:0];
assign way0_dirty_dout_after_correct[7:0]  = way0_dirty_dout[7:0];
assign way1_dirty_dout_after_correct[7:0]  = way1_dirty_dout[7:0];
assign way2_dirty_dout_after_correct[7:0]  = way2_dirty_dout[7:0];
assign way3_dirty_dout_after_correct[7:0]  = way3_dirty_dout[7:0];
assign way4_dirty_dout_after_correct[7:0]  = way4_dirty_dout[7:0];
assign way5_dirty_dout_after_correct[7:0]  = way5_dirty_dout[7:0];
assign way6_dirty_dout_after_correct[7:0]  = way6_dirty_dout[7:0];
assign way7_dirty_dout_after_correct[7:0]  = way7_dirty_dout[7:0];
assign way8_dirty_dout_after_correct[7:0]  = way8_dirty_dout[7:0];
assign way9_dirty_dout_after_correct[7:0]  = way9_dirty_dout[7:0];
assign way10_dirty_dout_after_correct[7:0] = way10_dirty_dout[7:0];
assign way11_dirty_dout_after_correct[7:0] = way11_dirty_dout[7:0];
assign way12_dirty_dout_after_correct[7:0] = way12_dirty_dout[7:0];
assign way13_dirty_dout_after_correct[7:0] = way13_dirty_dout[7:0];
assign way14_dirty_dout_after_correct[7:0] = way14_dirty_dout[7:0];
assign way15_dirty_dout_after_correct[7:0] = way15_dirty_dout[7:0];

assign fifo_dout[15:0] = l2c_dirty_dout[143:128];
assign fifo_dout_after_correct[15:0] = fifo_dout[15:0];

//==============================================================================
//      FOR DCA
//==============================================================================
assign icc_dca_tag[TAG_TAG_LENTH-1:0] = {TAG_TAG_LENTH{icc_dca_way_sel[15]}} & way15_tag_dout[TAG_TAG_LENTH-1:0] |
                                        {TAG_TAG_LENTH{icc_dca_way_sel[14]}} & way14_tag_dout[TAG_TAG_LENTH-1:0] |
                                        {TAG_TAG_LENTH{icc_dca_way_sel[13]}} & way13_tag_dout[TAG_TAG_LENTH-1:0] |
                                        {TAG_TAG_LENTH{icc_dca_way_sel[12]}} & way12_tag_dout[TAG_TAG_LENTH-1:0] |
                                        {TAG_TAG_LENTH{icc_dca_way_sel[11]}} & way11_tag_dout[TAG_TAG_LENTH-1:0] |
                                        {TAG_TAG_LENTH{icc_dca_way_sel[10]}} & way10_tag_dout[TAG_TAG_LENTH-1:0] |
                                        {TAG_TAG_LENTH{icc_dca_way_sel[9]}}  & way9_tag_dout[TAG_TAG_LENTH-1:0] |
                                        {TAG_TAG_LENTH{icc_dca_way_sel[8]}}  & way8_tag_dout[TAG_TAG_LENTH-1:0] |
                                        {TAG_TAG_LENTH{icc_dca_way_sel[7]}}  & way7_tag_dout[TAG_TAG_LENTH-1:0] |
                                        {TAG_TAG_LENTH{icc_dca_way_sel[6]}}  & way6_tag_dout[TAG_TAG_LENTH-1:0] |
                                        {TAG_TAG_LENTH{icc_dca_way_sel[5]}}  & way5_tag_dout[TAG_TAG_LENTH-1:0] |
                                        {TAG_TAG_LENTH{icc_dca_way_sel[4]}}  & way4_tag_dout[TAG_TAG_LENTH-1:0] |
                                        {TAG_TAG_LENTH{icc_dca_way_sel[3]}}  & way3_tag_dout[TAG_TAG_LENTH-1:0] |
                                        {TAG_TAG_LENTH{icc_dca_way_sel[2]}}  & way2_tag_dout[TAG_TAG_LENTH-1:0] |
                                        {TAG_TAG_LENTH{icc_dca_way_sel[1]}}  & way1_tag_dout[TAG_TAG_LENTH-1:0] |
                                        {TAG_TAG_LENTH{icc_dca_way_sel[0]}}  & way0_tag_dout[TAG_TAG_LENTH-1:0];

assign icc_dca_dirty[7:0] = {8{icc_dca_way_sel[15]}} & way15_dirty_dout[7:0] |
                            {8{icc_dca_way_sel[14]}} & way14_dirty_dout[7:0] |
                            {8{icc_dca_way_sel[13]}} & way13_dirty_dout[7:0] |
                            {8{icc_dca_way_sel[12]}} & way12_dirty_dout[7:0] |
                            {8{icc_dca_way_sel[11]}} & way11_dirty_dout[7:0] |
                            {8{icc_dca_way_sel[10]}} & way10_dirty_dout[7:0] |
                            {8{icc_dca_way_sel[9]}}  & way9_dirty_dout[7:0] |
                            {8{icc_dca_way_sel[8]}}  & way8_dirty_dout[7:0] |
                            {8{icc_dca_way_sel[7]}} & way7_dirty_dout[7:0] |
                            {8{icc_dca_way_sel[6]}} & way6_dirty_dout[7:0] |
                            {8{icc_dca_way_sel[5]}} & way5_dirty_dout[7:0] |
                            {8{icc_dca_way_sel[4]}} & way4_dirty_dout[7:0] |
                            {8{icc_dca_way_sel[3]}} & way3_dirty_dout[7:0] |
                            {8{icc_dca_way_sel[2]}} & way2_dirty_dout[7:0] |
                            {8{icc_dca_way_sel[1]}} & way1_dirty_dout[7:0] |
                            {8{icc_dca_way_sel[0]}} & way0_dirty_dout[7:0];


// &Instance("gated_clk_cell", "x_l2c_tag_dout_gated_clk"); @787
gated_clk_cell  x_l2c_tag_dout_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (tag_dout_clk      ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (tag_dout_flop_vld ),
  .module_en          (l2c_icg_en        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in        (forever_cpuclk     ), @788
//          .external_en   (1'b0               ), @789
//          .global_en     (1'b1               ), @790
//          .module_en (l2c_icg_en     ), @791
//          .local_en      (tag_dout_flop_vld  ), @792
//          .clk_out       (tag_dout_clk       ) @793
//         ); @794

assign tag_dout_flop_vld = (icc_tag_flop | tag_stage_flop_vld) & !next_stage_stall;

always@(posedge tag_dout_clk)
begin
  if (tag_dout_flop_vld)begin
     icc_dca_tag_f[TAG_TAG_LENTH-1:0] <= icc_dca_tag[TAG_TAG_LENTH-1:0];
     icc_dca_dirty_f[7:0]             <= icc_dca_dirty[7:0];
  end
end

// &Force("bus","tag_stage_addr",32,0); @811
// &CombBeg; @818
// &CombEnd; @830
// &CombBeg; @834
// &CombEnd; @854
// &Instance("ct_l2c_wb_sw_fmt", "x_ct_l2c_tag_sw_fmt"); @860
// &Connect(.l2c_wb_stage_set_way   (tag_ecc_set_way), @861
//          .l2c_ciu_ecc_set_way_x  (l2c_ciu_tag_ecc_set_way_x) @862
//         ); @863

// &ModuleEnd; @866
endmodule


