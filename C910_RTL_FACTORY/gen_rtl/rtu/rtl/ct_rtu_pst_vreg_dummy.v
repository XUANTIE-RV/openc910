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

// &ModuleBeg; @23
module ct_rtu_pst_vreg_dummy(
  idu_rtu_ir_xreg0_alloc_vld,
  idu_rtu_ir_xreg1_alloc_vld,
  idu_rtu_ir_xreg2_alloc_vld,
  idu_rtu_ir_xreg3_alloc_vld,
  idu_rtu_ir_xreg_alloc_gateclk_vld,
  idu_rtu_pst_dis_inst0_dstv_reg,
  idu_rtu_pst_dis_inst0_rel_vreg,
  idu_rtu_pst_dis_inst0_vreg,
  idu_rtu_pst_dis_inst0_vreg_iid,
  idu_rtu_pst_dis_inst0_xreg_vld,
  idu_rtu_pst_dis_inst1_dstv_reg,
  idu_rtu_pst_dis_inst1_rel_vreg,
  idu_rtu_pst_dis_inst1_vreg,
  idu_rtu_pst_dis_inst1_vreg_iid,
  idu_rtu_pst_dis_inst1_xreg_vld,
  idu_rtu_pst_dis_inst2_dstv_reg,
  idu_rtu_pst_dis_inst2_rel_vreg,
  idu_rtu_pst_dis_inst2_vreg,
  idu_rtu_pst_dis_inst2_vreg_iid,
  idu_rtu_pst_dis_inst2_xreg_vld,
  idu_rtu_pst_dis_inst3_dstv_reg,
  idu_rtu_pst_dis_inst3_rel_vreg,
  idu_rtu_pst_dis_inst3_vreg,
  idu_rtu_pst_dis_inst3_vreg_iid,
  idu_rtu_pst_dis_inst3_xreg_vld,
  idu_rtu_pst_xreg_dealloc_mask,
  lsu_rtu_wb_pipe3_wb_vreg_expand,
  lsu_rtu_wb_pipe3_wb_vreg_vld,
  pst_retired_xreg_wb,
  rtu_idu_alloc_xreg0,
  rtu_idu_alloc_xreg0_vld,
  rtu_idu_alloc_xreg1,
  rtu_idu_alloc_xreg1_vld,
  rtu_idu_alloc_xreg2,
  rtu_idu_alloc_xreg2_vld,
  rtu_idu_alloc_xreg3,
  rtu_idu_alloc_xreg3_vld,
  rtu_idu_rt_recover_xreg,
  vfpu_rtu_ex5_pipe6_wb_vreg_expand,
  vfpu_rtu_ex5_pipe6_wb_vreg_vld,
  vfpu_rtu_ex5_pipe7_wb_vreg_expand,
  vfpu_rtu_ex5_pipe7_wb_vreg_vld
);

// &Ports; @24
input            idu_rtu_ir_xreg0_alloc_vld; 
input            idu_rtu_ir_xreg1_alloc_vld; 
input            idu_rtu_ir_xreg2_alloc_vld; 
input            idu_rtu_ir_xreg3_alloc_vld; 
input            idu_rtu_ir_xreg_alloc_gateclk_vld; 
input   [4  :0]  idu_rtu_pst_dis_inst0_dstv_reg; 
input   [5  :0]  idu_rtu_pst_dis_inst0_rel_vreg; 
input   [5  :0]  idu_rtu_pst_dis_inst0_vreg; 
input   [6  :0]  idu_rtu_pst_dis_inst0_vreg_iid; 
input            idu_rtu_pst_dis_inst0_xreg_vld; 
input   [4  :0]  idu_rtu_pst_dis_inst1_dstv_reg; 
input   [5  :0]  idu_rtu_pst_dis_inst1_rel_vreg; 
input   [5  :0]  idu_rtu_pst_dis_inst1_vreg; 
input   [6  :0]  idu_rtu_pst_dis_inst1_vreg_iid; 
input            idu_rtu_pst_dis_inst1_xreg_vld; 
input   [4  :0]  idu_rtu_pst_dis_inst2_dstv_reg; 
input   [5  :0]  idu_rtu_pst_dis_inst2_rel_vreg; 
input   [5  :0]  idu_rtu_pst_dis_inst2_vreg; 
input   [6  :0]  idu_rtu_pst_dis_inst2_vreg_iid; 
input            idu_rtu_pst_dis_inst2_xreg_vld; 
input   [4  :0]  idu_rtu_pst_dis_inst3_dstv_reg; 
input   [5  :0]  idu_rtu_pst_dis_inst3_rel_vreg; 
input   [5  :0]  idu_rtu_pst_dis_inst3_vreg; 
input   [6  :0]  idu_rtu_pst_dis_inst3_vreg_iid; 
input            idu_rtu_pst_dis_inst3_xreg_vld; 
input   [63 :0]  idu_rtu_pst_xreg_dealloc_mask; 
input   [63 :0]  lsu_rtu_wb_pipe3_wb_vreg_expand; 
input            lsu_rtu_wb_pipe3_wb_vreg_vld; 
input   [63 :0]  vfpu_rtu_ex5_pipe6_wb_vreg_expand; 
input            vfpu_rtu_ex5_pipe6_wb_vreg_vld; 
input   [63 :0]  vfpu_rtu_ex5_pipe7_wb_vreg_expand; 
input            vfpu_rtu_ex5_pipe7_wb_vreg_vld; 
output           pst_retired_xreg_wb;    
output  [5  :0]  rtu_idu_alloc_xreg0;    
output           rtu_idu_alloc_xreg0_vld; 
output  [5  :0]  rtu_idu_alloc_xreg1;    
output           rtu_idu_alloc_xreg1_vld; 
output  [5  :0]  rtu_idu_alloc_xreg2;    
output           rtu_idu_alloc_xreg2_vld; 
output  [5  :0]  rtu_idu_alloc_xreg3;    
output           rtu_idu_alloc_xreg3_vld; 
output  [191:0]  rtu_idu_rt_recover_xreg; 

// &Regs; @25

// &Wires; @26
wire             pst_retired_xreg_wb;    
wire    [5  :0]  rtu_idu_alloc_xreg0;    
wire             rtu_idu_alloc_xreg0_vld; 
wire    [5  :0]  rtu_idu_alloc_xreg1;    
wire             rtu_idu_alloc_xreg1_vld; 
wire    [5  :0]  rtu_idu_alloc_xreg2;    
wire             rtu_idu_alloc_xreg2_vld; 
wire    [5  :0]  rtu_idu_alloc_xreg3;    
wire             rtu_idu_alloc_xreg3_vld; 
wire    [191:0]  rtu_idu_rt_recover_xreg; 




// &Force("bus","idu_rtu_pst_dis_inst0_dstv_reg",4,0); @30
// &Force("bus","idu_rtu_pst_dis_inst0_rel_vreg",5,0); @31
// &Force("bus","idu_rtu_pst_dis_inst0_vreg",5,0); @32
// &Force("bus","idu_rtu_pst_dis_inst0_vreg_iid",6,0); @33
// &Force("bus","idu_rtu_pst_dis_inst1_dstv_reg",4,0); @34
// &Force("bus","idu_rtu_pst_dis_inst1_rel_vreg",5,0); @35
// &Force("bus","idu_rtu_pst_dis_inst1_vreg",5,0); @36
// &Force("bus","idu_rtu_pst_dis_inst1_vreg_iid",6,0); @37
// &Force("bus","idu_rtu_pst_dis_inst2_dstv_reg",4,0); @38
// &Force("bus","idu_rtu_pst_dis_inst2_rel_vreg",5,0); @39
// &Force("bus","idu_rtu_pst_dis_inst2_vreg",5,0); @40
// &Force("bus","idu_rtu_pst_dis_inst2_vreg_iid",6,0); @41
// &Force("bus","idu_rtu_pst_dis_inst3_dstv_reg",4,0); @42
// &Force("bus","idu_rtu_pst_dis_inst3_rel_vreg",5,0); @43
// &Force("bus","idu_rtu_pst_dis_inst3_vreg",5,0); @44
// &Force("bus","idu_rtu_pst_dis_inst3_vreg_iid",6,0); @45
// &Force("bus","idu_rtu_pst_xreg_dealloc_mask",63,0); @46
// &Force("bus","lsu_rtu_wb_pipe3_wb_vreg_expand",63,0); @47
// &Force("bus","rob_pst_retire_inst0_iid_updt_val",6,0); @48
// &Force("bus","rob_pst_retire_inst1_iid_updt_val",6,0); @49
// &Force("bus","rob_pst_retire_inst2_iid_updt_val",6,0); @50
// &Force("bus","vfpu_rtu_ex5_pipe6_wb_vreg_expand",63,0); @51
// &Force("bus","vfpu_rtu_ex5_pipe7_wb_vreg_expand",63,0); @52

// &Force("input","idu_rtu_ir_xreg0_alloc_vld"); @54
// &Force("input","idu_rtu_ir_xreg1_alloc_vld"); @55
// &Force("input","idu_rtu_ir_xreg2_alloc_vld"); @56
// &Force("input","idu_rtu_ir_xreg3_alloc_vld"); @57
// &Force("input","idu_rtu_ir_xreg_alloc_gateclk_vld"); @58
// &Force("input","idu_rtu_pst_dis_inst0_dstv_reg"); @59
// &Force("input","idu_rtu_pst_dis_inst0_rel_vreg"); @60
// &Force("input","idu_rtu_pst_dis_inst0_vreg"); @61
// &Force("input","idu_rtu_pst_dis_inst0_vreg_iid"); @62
// &Force("input","idu_rtu_pst_dis_inst0_xreg_vld"); @63
// &Force("input","idu_rtu_pst_dis_inst1_dstv_reg"); @64
// &Force("input","idu_rtu_pst_dis_inst1_rel_vreg"); @65
// &Force("input","idu_rtu_pst_dis_inst1_vreg"); @66
// &Force("input","idu_rtu_pst_dis_inst1_vreg_iid"); @67
// &Force("input","idu_rtu_pst_dis_inst1_xreg_vld"); @68
// &Force("input","idu_rtu_pst_dis_inst2_dstv_reg"); @69
// &Force("input","idu_rtu_pst_dis_inst2_rel_vreg"); @70
// &Force("input","idu_rtu_pst_dis_inst2_vreg"); @71
// &Force("input","idu_rtu_pst_dis_inst2_vreg_iid"); @72
// &Force("input","idu_rtu_pst_dis_inst2_xreg_vld"); @73
// &Force("input","idu_rtu_pst_dis_inst3_dstv_reg"); @74
// &Force("input","idu_rtu_pst_dis_inst3_rel_vreg"); @75
// &Force("input","idu_rtu_pst_dis_inst3_vreg"); @76
// &Force("input","idu_rtu_pst_dis_inst3_vreg_iid"); @77
// &Force("input","idu_rtu_pst_dis_inst3_xreg_vld"); @78
// &Force("input","idu_rtu_pst_xreg_dealloc_mask"); @79
// &Force("input","lsu_rtu_wb_pipe3_wb_vreg_vld"); @80
// &Force("input","lsu_rtu_wb_pipe3_wb_vreg_expand"); @81
// &Force("input","vfpu_rtu_ex5_pipe6_wb_vreg_vld"); @82
// &Force("input","vfpu_rtu_ex5_pipe6_wb_vreg_expand"); @83
// &Force("input","vfpu_rtu_ex5_pipe7_wb_vreg_vld"); @84
// &Force("input","vfpu_rtu_ex5_pipe7_wb_vreg_expand"); @85

assign pst_retired_xreg_wb            = 1'b1;
assign rtu_idu_alloc_xreg0[5:0]       = 6'b0;
assign rtu_idu_alloc_xreg0_vld        = 1'b0;
assign rtu_idu_alloc_xreg1[5:0]       = 6'b0;
assign rtu_idu_alloc_xreg1_vld        = 1'b0;
assign rtu_idu_alloc_xreg2[5:0]       = 6'b0;
assign rtu_idu_alloc_xreg2_vld        = 1'b0;
assign rtu_idu_alloc_xreg3[5:0]       = 6'b0;
assign rtu_idu_alloc_xreg3_vld        = 1'b0;
assign rtu_idu_rt_recover_xreg[191:0] = 192'b0;

// &ModuleEnd; @98
endmodule


