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
module plic_hart_arb(
  arbx_hartx_sint_req,
  arbx_hartx_mint_req,
  arbx_hreg_claim_id,
  arbx_hreg_claim_mmode,
  arbx_hreg_claim_reg_ready,
  arbx_hreg_arb_start_ack,
  ciu_plic_icg_en,
  pad_yy_icg_scan_en,
  hreg_arbx_arb_start,
  hreg_arbx_arb_flush,
  hreg_arbx_mint_claim,
  hreg_arbx_sint_claim,
  hreg_arbx_int_en,
  hreg_arbx_int_mmode,
  hreg_arbx_prio_sth,
  hreg_arbx_prio_mth,
  ctrl_xx_amp_mode,
  ctrl_xx_core_sec,
  kid_yy_int_prio,
  kid_yy_int_req,
  int_sec_infor,
  plic_clk,
  plicrst_b
);

parameter         INT_NUM       = 1024;
parameter         ECH_RD        = 32;
parameter         PRIO_BIT      = 5;
parameter         ID_NUM        = 10;
// &Ports; @24
input                           hreg_arbx_arb_start;    
input                           hreg_arbx_arb_flush;
input                           hreg_arbx_mint_claim;      
input                           hreg_arbx_sint_claim;      
input   [INT_NUM-1:0]           hreg_arbx_int_en;         
input   [INT_NUM-1:0]           hreg_arbx_int_mmode;         
input   [PRIO_BIT-1:0]          hreg_arbx_prio_sth;        
input   [PRIO_BIT-1:0]          hreg_arbx_prio_mth;        
input   [INT_NUM*PRIO_BIT-1:0]  kid_yy_int_prio;          
input   [INT_NUM-1:0]           kid_yy_int_req;     
input   [INT_NUM-1:0]           int_sec_infor;
input                           plic_clk;                 
input                           plicrst_b;       
input                           ciu_plic_icg_en;
input                           pad_yy_icg_scan_en;
input                           ctrl_xx_amp_mode;
input                           ctrl_xx_core_sec;
output                          arbx_hartx_sint_req;       
output                          arbx_hartx_mint_req;       
output  [ID_NUM-1   :0]         arbx_hreg_claim_id;       
output                          arbx_hreg_claim_mmode;       
output                          arbx_hreg_claim_reg_ready; 
output                          arbx_hreg_arb_start_ack;

// &Regs; @25

// &Wires; @26
wire    [PRIO_BIT:0]              arb_ctrl_int_prio;        
wire                              arb_ctrl_int_req;         
wire                              arbx_hartx_sint_req;       
wire                              arbx_hartx_mint_req;       
wire    [ID_NUM-1   :0]           arbx_hreg_claim_id;       
wire                              arbx_hreg_claim_reg_ready; 
wire    [1024*(PRIO_BIT+1)-1:0]       ctrl_arb_int_prio;        
wire    [1023:0]                  ctrl_arb_int_req;         
wire    [4   :0]                  ctrl_arb_select_round;    
wire                              hreg_arbx_arb_start;      
wire                              hreg_arbx_mint_claim;      
wire                              hreg_arbx_sint_claim;      
wire    [INT_NUM-1:0]             hreg_arbx_int_en;         
wire    [INT_NUM-1:0]             hreg_arbx_int_mmode;         
wire    [PRIO_BIT-1   :0]         hreg_arbx_prio_sth;        
wire    [PRIO_BIT-1   :0]         hreg_arbx_prio_mth;        
wire    [INT_NUM*PRIO_BIT-1:0]    kid_yy_int_prio;          
wire    [INT_NUM-1:0]             kid_yy_int_req;           
wire                              plic_clk;          
wire                              arb_clk;
wire                              plicrst_b;                
wire                              ctrl_arb_new_arb_start;


// &Instance("plic_arb_ctrl","x_plic_arb_ctrl"); @31
plic_arb_ctrl #(.INT_NUM(INT_NUM),
                   .PRIO_BIT(PRIO_BIT),
                   .ECH_RD(32)
                                    ) x_plic_arb_ctrl (
  .plic_clk               (plic_clk                 ),
  .arb_ctrl_int_prio         (arb_ctrl_int_prio        ),
  .arb_ctrl_int_req          (arb_ctrl_int_req         ),
  .arbx_hartx_sint_req        (arbx_hartx_sint_req       ),
  .arbx_hartx_mint_req        (arbx_hartx_mint_req       ),
  .arbx_hreg_claim_reg_ready (arbx_hreg_claim_reg_ready),
  .arbx_hreg_arb_start_ack   (arbx_hreg_arb_start_ack  ),
  .ciu_plic_icg_en        (ciu_plic_icg_en),
  .pad_yy_icg_scan_en(pad_yy_icg_scan_en),
  .ctrl_arb_int_prio         (ctrl_arb_int_prio        ),
  .ctrl_arb_int_req          (ctrl_arb_int_req         ),
  .ctrl_arb_select_round     (ctrl_arb_select_round    ),
  .ctrl_arb_new_arb_start    (ctrl_arb_new_arb_start   ),
  .hreg_arbx_arb_start       (hreg_arbx_arb_start      ),
  .hreg_arbx_mint_claim      (hreg_arbx_mint_claim     ),
  .hreg_arbx_sint_claim      (hreg_arbx_sint_claim     ),
  .hreg_arbx_arb_flush       (hreg_arbx_arb_flush      ),
  .hreg_arbx_int_en          (hreg_arbx_int_en         ),
  .hreg_arbx_int_mmode       (hreg_arbx_int_mmode      ),
  .hreg_arbx_prio_sth        (hreg_arbx_prio_sth       ),
  .hreg_arbx_prio_mth        (hreg_arbx_prio_mth       ),
  .ctrl_xx_amp_mode          (ctrl_xx_amp_mode         ),
  .ctrl_xx_core_sec          (ctrl_xx_core_sec         ),
  .kid_yy_int_prio           (kid_yy_int_prio          ),
  .kid_yy_int_req            (kid_yy_int_req           ),
  .int_sec_infor             (int_sec_infor             ),
  .arb_clk                   (arb_clk                   ),
  .plicrst_b                 (plicrst_b                )
);

// &Connect( @32
//   .arb_ctl_clk(plic_clk), @33
// ); @34
// &Instance("plic_32to1_arb","x_plic_32to1_arb"); @35
plic_32to1_arb  #(.PRIO_BIT(PRIO_BIT+1),
                     .ID_NUM(ID_NUM),
                     .INT_NUM(1024),
                     .ECH_RD(32),
                     .SEL_NUM(4)    //means 4to1 granu
                            )x_plic_32to1_arb (
  .arb_clk               (arb_clk             ),
  .int_in_prio           (ctrl_arb_int_prio    ),
  .int_in_req            (ctrl_arb_int_req     ),
  .ctrl_arb_new_arb_start    (ctrl_arb_new_arb_start   ),
  .int_out_id            (arbx_hreg_claim_id   ),
  .int_out_prio          (arb_ctrl_int_prio    ),
  .int_out_req           (arb_ctrl_int_req     ),
  .int_select_round      (ctrl_arb_select_round),
  .plicrst_b             (plicrst_b            )
);
assign arbx_hreg_claim_mmode = arb_ctrl_int_prio[PRIO_BIT];
// &Connect( @36
//   .arb_clk(plic_clk), @37
//   .int_in_prio(ctrl_arb_int_prio), @38
//   .int_in_req(ctrl_arb_int_req), @39
//   .int_select_round(ctrl_arb_select_round), @40
//   .int_out_req(arb_ctrl_int_req), @41
//   .int_out_prio(arb_ctrl_int_prio), @42
//   .int_out_id(arbx_hreg_claim_id) @43
// ); @44

endmodule
