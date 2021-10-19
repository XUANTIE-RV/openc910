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
module ct_pmp_top(
  cp0_pmp_icg_en,
  cp0_pmp_mpp,
  cp0_pmp_mprv,
  cp0_pmp_reg_num,
  cp0_pmp_wdata,
  cp0_pmp_wreg,
  cp0_yy_priv_mode,
  cpurst_b,
  forever_cpuclk,
  mmu_pmp_fetch3,
  mmu_pmp_pa0,
  mmu_pmp_pa1,
  mmu_pmp_pa2,
  mmu_pmp_pa3,
  mmu_pmp_pa4,
  pad_yy_icg_scan_en,
  pmp_cp0_data,
  pmp_mmu_flg0,
  pmp_mmu_flg1,
  pmp_mmu_flg2,
  pmp_mmu_flg3,
  pmp_mmu_flg4
);

// &Ports; @25
input           cp0_pmp_icg_en;    
input   [1 :0]  cp0_pmp_mpp;       
input           cp0_pmp_mprv;      
input   [4 :0]  cp0_pmp_reg_num;   
input   [63:0]  cp0_pmp_wdata;     
input           cp0_pmp_wreg;      
input   [1 :0]  cp0_yy_priv_mode;  
input           cpurst_b;          
input           forever_cpuclk;    
input           mmu_pmp_fetch3;    
input   [27:0]  mmu_pmp_pa0;       
input   [27:0]  mmu_pmp_pa1;       
input   [27:0]  mmu_pmp_pa2;       
input   [27:0]  mmu_pmp_pa3;       
input   [27:0]  mmu_pmp_pa4;       
input           pad_yy_icg_scan_en; 
output  [63:0]  pmp_cp0_data;      
output  [3 :0]  pmp_mmu_flg0;      
output  [3 :0]  pmp_mmu_flg1;      
output  [3 :0]  pmp_mmu_flg2;      
output  [3 :0]  pmp_mmu_flg3;      
output  [3 :0]  pmp_mmu_flg4;      

// &Regs; @26

// &Wires; @27
wire    [11:0]  cp0_pmp_addr;      
wire            cp0_pmp_icg_en;    
wire    [1 :0]  cp0_pmp_mpp;       
wire            cp0_pmp_mprv;      
wire    [4 :0]  cp0_pmp_reg_num;   
wire    [63:0]  cp0_pmp_wdata;     
wire            cp0_pmp_wreg;      
wire    [1 :0]  cp0_yy_priv_mode;  
wire            cpuclk;            
wire            cpurst_b;          
wire    [1 :0]  cur_priv_mode;     
wire            forever_cpuclk;    
wire            mmu_pmp_fetch3;    
wire    [27:0]  mmu_pmp_pa0;       
wire    [27:0]  mmu_pmp_pa1;       
wire    [27:0]  mmu_pmp_pa2;       
wire    [27:0]  mmu_pmp_pa3;       
wire    [27:0]  mmu_pmp_pa4;       
wire            pad_yy_icg_scan_en; 
wire    [63:0]  pmp_cp0_data;      
wire    [17:0]  pmp_csr_sel;       
wire    [17:0]  pmp_csr_wen;       
wire    [3 :0]  pmp_mmu_flg0;      
wire    [3 :0]  pmp_mmu_flg1;      
wire    [3 :0]  pmp_mmu_flg2;      
wire    [3 :0]  pmp_mmu_flg3;      
wire    [3 :0]  pmp_mmu_flg4;      
wire            pmp_mprv_status0;  
wire            pmp_mprv_status1;  
wire            pmp_mprv_status2;  
wire            pmp_mprv_status3;  
wire            pmp_mprv_status4;  
wire    [28:0]  pmpaddr0_value;    
wire    [28:0]  pmpaddr1_value;    
wire    [28:0]  pmpaddr2_value;    
wire    [28:0]  pmpaddr3_value;    
wire    [28:0]  pmpaddr4_value;    
wire    [28:0]  pmpaddr5_value;    
wire    [28:0]  pmpaddr6_value;    
wire    [28:0]  pmpaddr7_value;    
wire    [63:0]  pmpcfg0_value;     
wire    [63:0]  pmpcfg2_value;     
wire            wr_pmp_regs;       


// &Force("output", "pmp_biu_pready"); @30
// &Force("output", "pmp_biu_perr"); @31
// &Instance("gated_clk_cell", "x_l2pmp_gateclk"); @33
// &Connect( .clk_in     (forever_cpuclk), @34
//           .external_en(1'b0          ), @35
//           .global_en  (1'b1          ), @36
//           .module_en  (cp0_pmp_icg_en), @37
//           .local_en   (l2pmp_clk_en  ), @38
//           .clk_out    (l2pmp_clk     ) @39
//          ); @40
// &Instance("ct_l2pmp_apbif", "x_ct_l2pmp_apbif"); @42
// &Instance("ct_l2pmp_regs", "x_ct_l2pmp_regs"); @44
// &ConnRule(s/g_y/g0/); @46
// &ConnRule(s/a_y/a0/); @47
// &Instance("ct_l2pmp_func", "x_ct_l2pmp_func0"); @48
// &ConnRule(s/g_y/g1/); @50
// &ConnRule(s/a_y/a1/); @51
// &Instance("ct_l2pmp_func", "x_ct_l2pmp_func1"); @52
// &ConnRule(s/g_y/g2/); @54
// &ConnRule(s/a_y/a2/); @55
// &Instance("ct_l2pmp_func", "x_ct_l2pmp_func2"); @56
// &ConnRule(s/g_y/g3/); @58
// &ConnRule(s/a_y/a3/); @59
// &Instance("ct_l2pmp_func", "x_ct_l2pmp_func3"); @60
// &ConnRule(s/g_y/g4/); @62
// &ConnRule(s/a_y/a4/); @63
// &Instance("ct_l2pmp_func", "x_ct_l2pmp_func4"); @64
// &Force("input", "cp0_pmp_reg_num"); &Force("bus", "cp0_pmp_reg_num", 4, 0); @66
// &Force("input", "cp0_pmp_wdata");   &Force("bus", "cp0_pmp_wdata", 63, 0); @67
// &Force("input", "cp0_pmp_mpp");     &Force("bus", "cp0_pmp_mpp", 1, 0); @68
// &Force("input", "cp0_pmp_mprv"); @69
// &Force("input", "cp0_pmp_wreg"); @70
// &Force("input", "mmu_pmp_fetch3"); @71
parameter PMPCFG0   = 12'h3A0;
parameter PMPCFG2   = 12'h3A2;
parameter PMPADDR0  = 12'h3B0;
parameter PMPADDR1  = 12'h3B1;
parameter PMPADDR2  = 12'h3B2;
parameter PMPADDR3  = 12'h3B3;
parameter PMPADDR4  = 12'h3B4;
parameter PMPADDR5  = 12'h3B5;
parameter PMPADDR6  = 12'h3B6;
parameter PMPADDR7  = 12'h3B7;
parameter PMPADDR8  = 12'h3B8;
parameter PMPADDR9  = 12'h3B9;
parameter PMPADDR10 = 12'h3BA;
parameter PMPADDR11 = 12'h3BB;
parameter PMPADDR12 = 12'h3BC;
parameter PMPADDR13 = 12'h3BD;
parameter PMPADDR14 = 12'h3BE;
parameter PMPADDR15 = 12'h3BF;

assign cp0_pmp_addr[11:0] = {7'b0011101, cp0_pmp_reg_num[4:0]};
assign pmp_csr_sel[0]  = cp0_pmp_addr[11:0] == PMPCFG0; 
assign pmp_csr_sel[1]  = cp0_pmp_addr[11:0] == PMPCFG2; 
assign pmp_csr_sel[2]  = cp0_pmp_addr[11:0] == PMPADDR0; 
assign pmp_csr_sel[3]  = cp0_pmp_addr[11:0] == PMPADDR1; 
assign pmp_csr_sel[4]  = cp0_pmp_addr[11:0] == PMPADDR2; 
assign pmp_csr_sel[5]  = cp0_pmp_addr[11:0] == PMPADDR3; 
assign pmp_csr_sel[6]  = cp0_pmp_addr[11:0] == PMPADDR4; 
assign pmp_csr_sel[7]  = cp0_pmp_addr[11:0] == PMPADDR5; 
assign pmp_csr_sel[8]  = cp0_pmp_addr[11:0] == PMPADDR6; 
assign pmp_csr_sel[9]  = cp0_pmp_addr[11:0] == PMPADDR7; 
assign pmp_csr_sel[10] = cp0_pmp_addr[11:0] == PMPADDR8; 
assign pmp_csr_sel[11] = cp0_pmp_addr[11:0] == PMPADDR9; 
assign pmp_csr_sel[12] = cp0_pmp_addr[11:0] == PMPADDR10; 
assign pmp_csr_sel[13] = cp0_pmp_addr[11:0] == PMPADDR11; 
assign pmp_csr_sel[14] = cp0_pmp_addr[11:0] == PMPADDR12; 
assign pmp_csr_sel[15] = cp0_pmp_addr[11:0] == PMPADDR13; 
assign pmp_csr_sel[16] = cp0_pmp_addr[11:0] == PMPADDR14; 
assign pmp_csr_sel[17] = cp0_pmp_addr[11:0] == PMPADDR15; 

assign pmp_csr_wen[17:0] = pmp_csr_sel[17:0] & {18{cp0_pmp_wreg}};

assign wr_pmp_regs = |pmp_csr_wen[17:0];

// &Instance("gated_clk_cell", "x_pmp_gated_clk"); @118
gated_clk_cell  x_pmp_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (cpuclk            ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (wr_pmp_regs       ),
  .module_en          (cp0_pmp_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect( @119
//          .clk_in      (forever_cpuclk), @120
//          .global_en   (1'b1          ), @121
//          .module_en   (cp0_pmp_icg_en), @122
//          .local_en    (wr_pmp_regs   ), @123
//          .external_en (1'b0          ), @124
//          .clk_out     (cpuclk        ), @125
//         ); @126

// &Instance("ct_pmp_regs"); @128
ct_pmp_regs  x_ct_pmp_regs (
  .cp0_pmp_wdata  (cp0_pmp_wdata ),
  .cpuclk         (cpuclk        ),
  .cpurst_b       (cpurst_b      ),
  .pmp_cp0_data   (pmp_cp0_data  ),
  .pmp_csr_sel    (pmp_csr_sel   ),
  .pmp_csr_wen    (pmp_csr_wen   ),
  .pmpaddr0_value (pmpaddr0_value),
  .pmpaddr1_value (pmpaddr1_value),
  .pmpaddr2_value (pmpaddr2_value),
  .pmpaddr3_value (pmpaddr3_value),
  .pmpaddr4_value (pmpaddr4_value),
  .pmpaddr5_value (pmpaddr5_value),
  .pmpaddr6_value (pmpaddr6_value),
  .pmpaddr7_value (pmpaddr7_value),
  .pmpcfg0_value  (pmpcfg0_value ),
  .pmpcfg2_value  (pmpcfg2_value )
);

assign cur_priv_mode[1:0] = cp0_yy_priv_mode[1:0];
assign pmp_mprv_status0 = cp0_pmp_mprv;
assign pmp_mprv_status1 = cp0_pmp_mprv;
assign pmp_mprv_status2 = 1'b0;
assign pmp_mprv_status3 = cp0_pmp_mprv && !mmu_pmp_fetch3;
assign pmp_mprv_status4 = cp0_pmp_mprv;

// &ConnRule(s/_y/0/); @136
// &Instance("ct_pmp_acc", "x_ct_pmp_acc0"); @137
ct_pmp_acc  x_ct_pmp_acc0 (
  .cp0_pmp_mpp       (cp0_pmp_mpp      ),
  .cur_priv_mode     (cur_priv_mode    ),
  .mmu_pmp_pa_y      (mmu_pmp_pa0      ),
  .pmp_mmu_flg_y     (pmp_mmu_flg0     ),
  .pmp_mprv_status_y (pmp_mprv_status0 ),
  .pmpaddr0_value    (pmpaddr0_value   ),
  .pmpaddr1_value    (pmpaddr1_value   ),
  .pmpaddr2_value    (pmpaddr2_value   ),
  .pmpaddr3_value    (pmpaddr3_value   ),
  .pmpaddr4_value    (pmpaddr4_value   ),
  .pmpaddr5_value    (pmpaddr5_value   ),
  .pmpaddr6_value    (pmpaddr6_value   ),
  .pmpaddr7_value    (pmpaddr7_value   ),
  .pmpcfg0_value     (pmpcfg0_value    ),
  .pmpcfg2_value     (pmpcfg2_value    )
);


// &ConnRule(s/_y/1/); @139
// &Instance("ct_pmp_acc", "x_ct_pmp_acc1"); @140
ct_pmp_acc  x_ct_pmp_acc1 (
  .cp0_pmp_mpp       (cp0_pmp_mpp      ),
  .cur_priv_mode     (cur_priv_mode    ),
  .mmu_pmp_pa_y      (mmu_pmp_pa1      ),
  .pmp_mmu_flg_y     (pmp_mmu_flg1     ),
  .pmp_mprv_status_y (pmp_mprv_status1 ),
  .pmpaddr0_value    (pmpaddr0_value   ),
  .pmpaddr1_value    (pmpaddr1_value   ),
  .pmpaddr2_value    (pmpaddr2_value   ),
  .pmpaddr3_value    (pmpaddr3_value   ),
  .pmpaddr4_value    (pmpaddr4_value   ),
  .pmpaddr5_value    (pmpaddr5_value   ),
  .pmpaddr6_value    (pmpaddr6_value   ),
  .pmpaddr7_value    (pmpaddr7_value   ),
  .pmpcfg0_value     (pmpcfg0_value    ),
  .pmpcfg2_value     (pmpcfg2_value    )
);


// &ConnRule(s/_y/2/); @142
// &Instance("ct_pmp_acc", "x_ct_pmp_acc2"); @143
ct_pmp_acc  x_ct_pmp_acc2 (
  .cp0_pmp_mpp       (cp0_pmp_mpp      ),
  .cur_priv_mode     (cur_priv_mode    ),
  .mmu_pmp_pa_y      (mmu_pmp_pa2      ),
  .pmp_mmu_flg_y     (pmp_mmu_flg2     ),
  .pmp_mprv_status_y (pmp_mprv_status2 ),
  .pmpaddr0_value    (pmpaddr0_value   ),
  .pmpaddr1_value    (pmpaddr1_value   ),
  .pmpaddr2_value    (pmpaddr2_value   ),
  .pmpaddr3_value    (pmpaddr3_value   ),
  .pmpaddr4_value    (pmpaddr4_value   ),
  .pmpaddr5_value    (pmpaddr5_value   ),
  .pmpaddr6_value    (pmpaddr6_value   ),
  .pmpaddr7_value    (pmpaddr7_value   ),
  .pmpcfg0_value     (pmpcfg0_value    ),
  .pmpcfg2_value     (pmpcfg2_value    )
);


// &ConnRule(s/_y/3/); @145
// &Instance("ct_pmp_acc", "x_ct_pmp_acc3"); @146
ct_pmp_acc  x_ct_pmp_acc3 (
  .cp0_pmp_mpp       (cp0_pmp_mpp      ),
  .cur_priv_mode     (cur_priv_mode    ),
  .mmu_pmp_pa_y      (mmu_pmp_pa3      ),
  .pmp_mmu_flg_y     (pmp_mmu_flg3     ),
  .pmp_mprv_status_y (pmp_mprv_status3 ),
  .pmpaddr0_value    (pmpaddr0_value   ),
  .pmpaddr1_value    (pmpaddr1_value   ),
  .pmpaddr2_value    (pmpaddr2_value   ),
  .pmpaddr3_value    (pmpaddr3_value   ),
  .pmpaddr4_value    (pmpaddr4_value   ),
  .pmpaddr5_value    (pmpaddr5_value   ),
  .pmpaddr6_value    (pmpaddr6_value   ),
  .pmpaddr7_value    (pmpaddr7_value   ),
  .pmpcfg0_value     (pmpcfg0_value    ),
  .pmpcfg2_value     (pmpcfg2_value    )
);


// &ConnRule(s/_y/4/); @148
// &Instance("ct_pmp_acc", "x_ct_pmp_acc4"); @149
ct_pmp_acc  x_ct_pmp_acc4 (
  .cp0_pmp_mpp       (cp0_pmp_mpp      ),
  .cur_priv_mode     (cur_priv_mode    ),
  .mmu_pmp_pa_y      (mmu_pmp_pa4      ),
  .pmp_mmu_flg_y     (pmp_mmu_flg4     ),
  .pmp_mprv_status_y (pmp_mprv_status4 ),
  .pmpaddr0_value    (pmpaddr0_value   ),
  .pmpaddr1_value    (pmpaddr1_value   ),
  .pmpaddr2_value    (pmpaddr2_value   ),
  .pmpaddr3_value    (pmpaddr3_value   ),
  .pmpaddr4_value    (pmpaddr4_value   ),
  .pmpaddr5_value    (pmpaddr5_value   ),
  .pmpaddr6_value    (pmpaddr6_value   ),
  .pmpaddr7_value    (pmpaddr7_value   ),
  .pmpcfg0_value     (pmpcfg0_value    ),
  .pmpcfg2_value     (pmpcfg2_value    )
);



// &ModuleEnd; @170
endmodule


