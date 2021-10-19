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
module ct_lsu_pfu_gsdb(
  cp0_lsu_icg_en,
  cp0_yy_clk_en,
  cp0_yy_dcache_pref_en,
  cpurst_b,
  forever_cpuclk,
  ld_da_iid,
  ld_da_pfu_act_vld,
  ld_da_pfu_pf_inst_vld,
  ld_da_pfu_va,
  pad_yy_icg_scan_en,
  pfu_gpfb_vld,
  pfu_gsdb_gpfb_create_vld,
  pfu_gsdb_gpfb_pop_req,
  pfu_gsdb_stride,
  pfu_gsdb_stride_neg,
  pfu_gsdb_strideh_6to0,
  pfu_pop_all_vld,
  rtu_yy_xx_commit0,
  rtu_yy_xx_commit0_iid,
  rtu_yy_xx_commit1,
  rtu_yy_xx_commit1_iid,
  rtu_yy_xx_commit2,
  rtu_yy_xx_commit2_iid,
  rtu_yy_xx_flush
);

// &Ports; @29
input           cp0_lsu_icg_en;                              
input           cp0_yy_clk_en;                               
input           cp0_yy_dcache_pref_en;                       
input           cpurst_b;                                    
input           forever_cpuclk;                              
input   [6 :0]  ld_da_iid;                                   
input           ld_da_pfu_act_vld;                           
input           ld_da_pfu_pf_inst_vld;                       
input   [39:0]  ld_da_pfu_va;                                
input           pad_yy_icg_scan_en;                          
input           pfu_gpfb_vld;                                
input           pfu_pop_all_vld;                             
input           rtu_yy_xx_commit0;                           
input   [6 :0]  rtu_yy_xx_commit0_iid;                       
input           rtu_yy_xx_commit1;                           
input   [6 :0]  rtu_yy_xx_commit1_iid;                       
input           rtu_yy_xx_commit2;                           
input   [6 :0]  rtu_yy_xx_commit2_iid;                       
input           rtu_yy_xx_flush;                             
output          pfu_gsdb_gpfb_create_vld;                    
output          pfu_gsdb_gpfb_pop_req;                       
output  [10:0]  pfu_gsdb_stride;                             
output          pfu_gsdb_stride_neg;                         
output  [6 :0]  pfu_gsdb_strideh_6to0;                       

// &Regs; @30
reg             pfu_gsdb_newest_pf_inst_cmit;                
reg     [6 :0]  pfu_gsdb_newest_pf_inst_iid;                 
reg             pfu_gsdb_newest_pf_inst_vld;                 
reg     [3 :0]  pfu_gsdb_next_state;                         
reg     [1 :0]  pfu_gsdb_pop_confidence;                     
reg     [3 :0]  pfu_gsdb_state;                              

// &Wires; @31
wire            confidence_add_vld;                          
wire            confidence_max;                              
wire            confidence_min;                              
wire            confidence_reset;                            
wire            confidence_sub_vld;                          
wire            cp0_lsu_icg_en;                              
wire            cp0_yy_clk_en;                               
wire            cp0_yy_dcache_pref_en;                       
wire            cpurst_b;                                    
wire            forever_cpuclk;                              
wire    [6 :0]  ld_da_iid;                                   
wire            ld_da_pfu_act_vld;                           
wire            ld_da_pfu_pf_inst_vld;                       
wire    [39:0]  ld_da_pfu_va;                                
wire            monitor_with_confidence;                     
wire            pad_yy_icg_scan_en;                          
wire            pfu_gpfb_vld;                                
wire            pfu_gsdb_addr0_act;                          
wire            pfu_gsdb_addr_cmp_info_vld;                  
wire            pfu_gsdb_check_stride_success;               
wire            pfu_gsdb_clk;                                
wire            pfu_gsdb_clk_en;                             
wire            pfu_gsdb_create_dp_vld;                      
wire            pfu_gsdb_create_gateclk_en;                  
wire            pfu_gsdb_create_vld;                         
wire            pfu_gsdb_gpfb_create_vld;                    
wire            pfu_gsdb_gpfb_pop_req;                       
wire            pfu_gsdb_newest_pf_inst_cmit_hit0;           
wire            pfu_gsdb_newest_pf_inst_cmit_hit1;           
wire            pfu_gsdb_newest_pf_inst_cmit_hit2;           
wire            pfu_gsdb_newest_pf_inst_cmit_set;            
wire            pfu_gsdb_newest_pf_inst_flush_uncmit;        
wire            pfu_gsdb_newest_pf_inst_iid_older_than_ld_da; 
wire            pfu_gsdb_newest_pf_inst_older_than_ld_da;    
wire            pfu_gsdb_newest_pf_inst_set;                 
wire            pfu_gsdb_normal_stride;                      
wire            pfu_gsdb_pf_inst_vld;                        
wire            pfu_gsdb_pf_inst_vld_clk;                    
wire            pfu_gsdb_pf_inst_vld_clk_en;                 
wire            pfu_gsdb_state_is_check_stride;              
wire            pfu_gsdb_state_is_get_stride;                
wire            pfu_gsdb_state_is_monitor_stride;            
wire    [10:0]  pfu_gsdb_stride;                             
wire            pfu_gsdb_stride_neg;                         
wire    [6 :0]  pfu_gsdb_strideh_6to0;                       
wire            pfu_gsdb_vld;                                
wire            pfu_pop_all_vld;                             
wire            rtu_yy_xx_commit0;                           
wire    [6 :0]  rtu_yy_xx_commit0_iid;                       
wire            rtu_yy_xx_commit1;                           
wire    [6 :0]  rtu_yy_xx_commit1_iid;                       
wire            rtu_yy_xx_commit2;                           
wire    [6 :0]  rtu_yy_xx_commit2_iid;                       
wire            rtu_yy_xx_flush;                             


parameter IDLE              = 4'b0000,
          GET_STRIDE        = 4'b1001,
          CHECK_STRIDE      = 4'b1010,
          MONITOR_STRIDE    = 4'b1100;

//==========================================================
//                 Instance of Gated Cell  
//==========================================================
assign pfu_gsdb_clk_en  = pfu_gsdb_vld
                          ||  pfu_gsdb_create_gateclk_en;
// &Instance("gated_clk_cell", "x_lsu_pfu_gsdb_gated_clk"); @43
gated_clk_cell  x_lsu_pfu_gsdb_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (pfu_gsdb_clk      ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (pfu_gsdb_clk_en   ),
  .module_en          (cp0_lsu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in        (forever_cpuclk     ), @44
//          .external_en   (1'b0               ), @45
//          .global_en     (cp0_yy_clk_en      ), @46
//          .module_en     (cp0_lsu_icg_en     ), @47
//          .local_en      (pfu_gsdb_clk_en    ), @48
//          .clk_out       (pfu_gsdb_clk       )); @49

assign pfu_gsdb_pf_inst_vld_clk_en = pfu_gsdb_pf_inst_vld;
// &Instance("gated_clk_cell", "x_lsu_pfu_gsdb_pf_inst_vld_gated_clk"); @52
gated_clk_cell  x_lsu_pfu_gsdb_pf_inst_vld_gated_clk (
  .clk_in                      (forever_cpuclk             ),
  .clk_out                     (pfu_gsdb_pf_inst_vld_clk   ),
  .external_en                 (1'b0                       ),
  .global_en                   (cp0_yy_clk_en              ),
  .local_en                    (pfu_gsdb_pf_inst_vld_clk_en),
  .module_en                   (cp0_lsu_icg_en             ),
  .pad_yy_icg_scan_en          (pad_yy_icg_scan_en         )
);

// &Connect(.clk_in        (forever_cpuclk     ), @53
//          .external_en   (1'b0               ), @54
//          .global_en     (cp0_yy_clk_en      ), @55
//          .module_en     (cp0_lsu_icg_en     ), @56
//          .local_en      (pfu_gsdb_pf_inst_vld_clk_en), @57
//          .clk_out       (pfu_gsdb_pf_inst_vld_clk)); @58

//==========================================================
//                 Register
//==========================================================
//+-------+
//| state |
//+-------+
always @(posedge pfu_gsdb_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    pfu_gsdb_state[3:0] <=  IDLE;
  else if(pfu_pop_all_vld)
    pfu_gsdb_state[3:0] <=  IDLE;
  else
    pfu_gsdb_state[3:0] <=  pfu_gsdb_next_state[3:0];
end
assign pfu_gsdb_vld = pfu_gsdb_state[3];

//+----------------+
//| newest_pf_inst | 
//+----------------+
always @(posedge pfu_gsdb_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    pfu_gsdb_newest_pf_inst_vld <=  1'b0;
  else if(pfu_gsdb_create_dp_vld || pfu_gsdb_newest_pf_inst_flush_uncmit)
    pfu_gsdb_newest_pf_inst_vld <=  1'b0;
  else if(pfu_gsdb_vld  &&  pfu_gsdb_pf_inst_vld)
    pfu_gsdb_newest_pf_inst_vld <=  1'b1;
end

always @(posedge pfu_gsdb_pf_inst_vld_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    pfu_gsdb_newest_pf_inst_iid[6:0]  <=  7'b0;
  else if(pfu_gsdb_newest_pf_inst_set)
    pfu_gsdb_newest_pf_inst_iid[6:0]  <=  ld_da_iid[6:0];
end

always @(posedge pfu_gsdb_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    pfu_gsdb_newest_pf_inst_cmit  <=  1'b0;
  else if(pfu_gsdb_newest_pf_inst_set)
    pfu_gsdb_newest_pf_inst_cmit  <=  1'b0;
  else if(pfu_gsdb_newest_pf_inst_cmit_set)
    pfu_gsdb_newest_pf_inst_cmit  <=  1'b1;
end

//+-----------------------------+
//| gsdb to gpfb pop confidence | 
//+-----------------------------+
always @(posedge pfu_gsdb_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    pfu_gsdb_pop_confidence[1:0] <=  2'b0;
  else if(confidence_reset)
    pfu_gsdb_pop_confidence[1:0] <=  2'b10;
  else if(confidence_sub_vld)
    pfu_gsdb_pop_confidence[1:0] <=  pfu_gsdb_pop_confidence[1:0] - 2'b01;
  else if(confidence_add_vld)
    pfu_gsdb_pop_confidence[1:0] <=  pfu_gsdb_pop_confidence[1:0] + 2'b01;
end
//==========================================================
//                Instance addr cmp
//==========================================================
// &ConnRule(s/^entry_/pfu_gsdb_/); @125
// &Instance("ct_lsu_pfu_sdb_cmp","x_ct_lsu_pfu_gsdb_cmp"); @126
ct_lsu_pfu_sdb_cmp  x_ct_lsu_pfu_gsdb_cmp (
  .cp0_lsu_icg_en                (cp0_lsu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .cpurst_b                      (cpurst_b                     ),
  .entry_addr0_act               (pfu_gsdb_addr0_act           ),
  .entry_addr_cmp_info_vld       (pfu_gsdb_addr_cmp_info_vld   ),
  .entry_check_stride_success    (pfu_gsdb_check_stride_success),
  .entry_clk                     (pfu_gsdb_clk                 ),
  .entry_create_dp_vld           (pfu_gsdb_create_dp_vld       ),
  .entry_create_gateclk_en       (pfu_gsdb_create_gateclk_en   ),
  .entry_normal_stride           (pfu_gsdb_normal_stride       ),
  .entry_pf_inst_vld             (pfu_gsdb_pf_inst_vld         ),
  .entry_stride                  (pfu_gsdb_stride              ),
  .entry_stride_keep             (monitor_with_confidence      ),
  .entry_stride_neg              (pfu_gsdb_stride_neg          ),
  .entry_strideh_6to0            (pfu_gsdb_strideh_6to0        ),
  .entry_vld                     (pfu_gsdb_vld                 ),
  .forever_cpuclk                (forever_cpuclk               ),
  .ld_da_iid                     (ld_da_iid                    ),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .pipe_va                       (ld_da_pfu_va                 ),
  .rtu_yy_xx_commit0             (rtu_yy_xx_commit0            ),
  .rtu_yy_xx_commit0_iid         (rtu_yy_xx_commit0_iid        ),
  .rtu_yy_xx_commit1             (rtu_yy_xx_commit1            ),
  .rtu_yy_xx_commit1_iid         (rtu_yy_xx_commit1_iid        ),
  .rtu_yy_xx_commit2             (rtu_yy_xx_commit2            ),
  .rtu_yy_xx_commit2_iid         (rtu_yy_xx_commit2_iid        ),
  .rtu_yy_xx_flush               (rtu_yy_xx_flush              )
);

// &Connect(.pipe_va             (ld_da_pfu_va           ), @127
//          .entry_stride_keep   (monitor_with_confidence)); @128


//==========================================================
//                Generate state machine
//==========================================================
// &CombBeg; @134
always @( confidence_min
       or pfu_gsdb_normal_stride
       or pfu_gsdb_create_vld
       or pfu_gsdb_addr_cmp_info_vld
       or pfu_gpfb_vld
       or pfu_gsdb_state[3:0]
       or pfu_gsdb_check_stride_success)
begin
pfu_gsdb_next_state[3:0]  = IDLE;
case(pfu_gsdb_state[3:0])
  IDLE:
    if(pfu_gsdb_create_vld)
      pfu_gsdb_next_state[3:0]  = GET_STRIDE;
    else
      pfu_gsdb_next_state[3:0]  = IDLE;
  GET_STRIDE:
    if(pfu_gsdb_addr_cmp_info_vld &&  pfu_gsdb_normal_stride)
      pfu_gsdb_next_state[3:0]  = CHECK_STRIDE;
    else
      pfu_gsdb_next_state[3:0]  = GET_STRIDE;
  CHECK_STRIDE:
    if(pfu_gsdb_addr_cmp_info_vld &&  pfu_gsdb_check_stride_success)
      pfu_gsdb_next_state[3:0]  = MONITOR_STRIDE;
    else if(pfu_gsdb_addr_cmp_info_vld &&  !pfu_gsdb_check_stride_success)
      pfu_gsdb_next_state[3:0]  = GET_STRIDE;
    else
      pfu_gsdb_next_state[3:0]  = CHECK_STRIDE;
  MONITOR_STRIDE:
    if(pfu_gsdb_addr_cmp_info_vld
          &&  (!pfu_gsdb_check_stride_success
               && confidence_min
              ||  !pfu_gpfb_vld))
      pfu_gsdb_next_state[3:0]  = GET_STRIDE;
    else
      pfu_gsdb_next_state[3:0]  = MONITOR_STRIDE;
  default:
    pfu_gsdb_next_state[3:0]  = IDLE;
endcase
// &CombEnd; @165
end
assign pfu_gsdb_state_is_get_stride     = pfu_gsdb_state[0];
assign pfu_gsdb_state_is_check_stride   = pfu_gsdb_state[1];
assign pfu_gsdb_state_is_monitor_stride = pfu_gsdb_state[2];

//==========================================================
//                    Set ld inst
//==========================================================
assign pfu_gsdb_pf_inst_vld   = pfu_gsdb_vld
                                &&  ld_da_pfu_pf_inst_vld;
assign pfu_gsdb_addr0_act     = pfu_gsdb_newest_pf_inst_older_than_ld_da
                                &&  (!pfu_gsdb_state_is_get_stride
                                    ||  ld_da_pfu_act_vld);
//==========================================================
//              Generate create gsdb signal
//==========================================================
assign pfu_gsdb_create_vld          = !pfu_gsdb_vld
                                      &&  cp0_yy_dcache_pref_en;
assign pfu_gsdb_create_dp_vld       = pfu_gsdb_create_vld;
assign pfu_gsdb_create_gateclk_en   = pfu_gsdb_create_vld;
//==========================================================
//              pop confidence ctrl 
//==========================================================
assign confidence_max = (pfu_gsdb_pop_confidence[1:0] == 2'b11);
assign confidence_min = (pfu_gsdb_pop_confidence[1:0] == 2'b00);

assign confidence_reset   = pfu_gsdb_state_is_check_stride
                            && pfu_gsdb_addr_cmp_info_vld
                            && pfu_gsdb_check_stride_success;  

assign confidence_sub_vld = pfu_gsdb_state_is_monitor_stride
                            && pfu_gsdb_addr_cmp_info_vld
                            && !pfu_gsdb_check_stride_success  
                            && !confidence_min;   

assign confidence_add_vld = pfu_gsdb_state_is_monitor_stride
                            && pfu_gsdb_addr_cmp_info_vld
                            && pfu_gsdb_check_stride_success  
                            && !confidence_max;

assign monitor_with_confidence = pfu_gsdb_state_is_monitor_stride
                                 && pfu_gpfb_vld
                                 && !confidence_min; 
//==========================================================
//              Maintain newest iid
//==========================================================
//-------------------------older----------------------------
// &Instance("ct_rtu_compare_iid","x_lsu_gsdb_newest_inst_cmp"); @212
ct_rtu_compare_iid  x_lsu_gsdb_newest_inst_cmp (
  .x_iid0                                       (pfu_gsdb_newest_pf_inst_iid[6:0]            ),
  .x_iid0_older                                 (pfu_gsdb_newest_pf_inst_iid_older_than_ld_da),
  .x_iid1                                       (ld_da_iid[6:0]                              )
);

// &Connect( .x_iid0         (pfu_gsdb_newest_pf_inst_iid[6:0]), @213
//           .x_iid1         (ld_da_iid[6:0]     ), @214
//           .x_iid0_older   (pfu_gsdb_newest_pf_inst_iid_older_than_ld_da)); @215

assign pfu_gsdb_newest_pf_inst_cmit_hit0  = {rtu_yy_xx_commit0,rtu_yy_xx_commit0_iid[6:0]}
                                            ==  {1'b1,pfu_gsdb_newest_pf_inst_iid[6:0]};
assign pfu_gsdb_newest_pf_inst_cmit_hit1  = {rtu_yy_xx_commit1,rtu_yy_xx_commit1_iid[6:0]}
                                            ==  {1'b1,pfu_gsdb_newest_pf_inst_iid[6:0]};
assign pfu_gsdb_newest_pf_inst_cmit_hit2  = {rtu_yy_xx_commit2,rtu_yy_xx_commit2_iid[6:0]}
                                            ==  {1'b1,pfu_gsdb_newest_pf_inst_iid[6:0]};

assign pfu_gsdb_newest_pf_inst_cmit_set   = (pfu_gsdb_newest_pf_inst_cmit_hit0
                                                ||  pfu_gsdb_newest_pf_inst_cmit_hit1
                                                ||  pfu_gsdb_newest_pf_inst_cmit_hit2)
                                            &&  pfu_gsdb_newest_pf_inst_vld;

assign pfu_gsdb_newest_pf_inst_older_than_ld_da = pfu_gsdb_newest_pf_inst_vld
                                                  &&  (pfu_gsdb_newest_pf_inst_iid_older_than_ld_da
                                                      ||  pfu_gsdb_newest_pf_inst_cmit);

//-------------------newest_pf_inst_set---------------------
assign pfu_gsdb_newest_pf_inst_set  = pfu_gsdb_vld
                                      &&  pfu_gsdb_pf_inst_vld
                                      &&  (!pfu_gsdb_newest_pf_inst_vld
                                          ||  pfu_gsdb_newest_pf_inst_older_than_ld_da);

assign pfu_gsdb_newest_pf_inst_flush_uncmit = rtu_yy_xx_flush
                                              &&  !pfu_gsdb_newest_pf_inst_cmit;

//==========================================================
//              Generate gpfb signal
//==========================================================
assign pfu_gsdb_gpfb_create_vld     = pfu_gsdb_state_is_check_stride
                                      &&  pfu_gsdb_addr_cmp_info_vld
                                      &&  pfu_gsdb_check_stride_success;

assign pfu_gsdb_gpfb_pop_req        = pfu_gsdb_state_is_monitor_stride
                                      &&  pfu_gsdb_addr_cmp_info_vld
                                      &&  confidence_min
                                      &&  !pfu_gsdb_check_stride_success;


// &ModuleEnd; @255
endmodule


