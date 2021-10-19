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
module ct_ifu_ind_btb(
  bht_ind_btb_rtu_ghr,
  bht_ind_btb_vghr,
  cp0_ifu_icg_en,
  cp0_ifu_ind_btb_en,
  cp0_yy_clk_en,
  cp0_yy_priv_mode,
  cpurst_b,
  forever_cpuclk,
  ibctrl_ind_btb_check_vld,
  ibctrl_ind_btb_fifo_stall,
  ibctrl_ind_btb_path,
  ifctrl_ind_btb_inv,
  ind_btb_ibctrl_dout,
  ind_btb_ibctrl_priv_mode,
  ind_btb_ifctrl_inv_done,
  ind_btb_ifctrl_inv_on,
  ipctrl_ind_btb_con_br_vld,
  ipdp_ind_btb_jmp_detect,
  pad_yy_icg_scan_en,
  rtu_ifu_flush,
  rtu_ifu_retire0_chk_idx,
  rtu_ifu_retire0_jmp,
  rtu_ifu_retire0_jmp_mispred,
  rtu_ifu_retire0_mispred,
  rtu_ifu_retire0_next_pc,
  rtu_ifu_retire1_chk_idx,
  rtu_ifu_retire1_jmp,
  rtu_ifu_retire2_chk_idx,
  rtu_ifu_retire2_jmp
);

// &Ports; @23
input   [7 :0]  bht_ind_btb_rtu_ghr;        
input   [7 :0]  bht_ind_btb_vghr;           
input           cp0_ifu_icg_en;             
input           cp0_ifu_ind_btb_en;         
input           cp0_yy_clk_en;              
input   [1 :0]  cp0_yy_priv_mode;           
input           cpurst_b;                   
input           forever_cpuclk;             
input           ibctrl_ind_btb_check_vld;   
input           ibctrl_ind_btb_fifo_stall;  
input   [7 :0]  ibctrl_ind_btb_path;        
input           ifctrl_ind_btb_inv;         
input           ipctrl_ind_btb_con_br_vld;  
input           ipdp_ind_btb_jmp_detect;    
input           pad_yy_icg_scan_en;         
input           rtu_ifu_flush;              
input   [7 :0]  rtu_ifu_retire0_chk_idx;    
input           rtu_ifu_retire0_jmp;        
input           rtu_ifu_retire0_jmp_mispred; 
input           rtu_ifu_retire0_mispred;    
input   [38:0]  rtu_ifu_retire0_next_pc;    
input   [7 :0]  rtu_ifu_retire1_chk_idx;    
input           rtu_ifu_retire1_jmp;        
input   [7 :0]  rtu_ifu_retire2_chk_idx;    
input           rtu_ifu_retire2_jmp;        
output  [22:0]  ind_btb_ibctrl_dout;        
output  [1 :0]  ind_btb_ibctrl_priv_mode;   
output          ind_btb_ifctrl_inv_done;    
output          ind_btb_ifctrl_inv_on;      

// &Regs; @24
reg             after_path_reg_rtu_updt;    
reg     [22:0]  ind_btb_dout_reg;           
reg     [7 :0]  ind_btb_index;              
reg     [7 :0]  ind_btb_inv_cnt;            
reg             ind_btb_inv_on_reg;         
reg             ind_btb_rd_flop;            
reg     [7 :0]  path_reg_0;                 
reg     [7 :0]  path_reg_1;                 
reg     [7 :0]  path_reg_2;                 
reg     [7 :0]  path_reg_3;                 
reg     [1 :0]  priv_mode_reg;              
reg     [7 :0]  rtu_path_reg_0;             
reg     [7 :0]  rtu_path_reg_0_pre;         
reg     [7 :0]  rtu_path_reg_1;             
reg     [7 :0]  rtu_path_reg_1_pre;         
reg     [7 :0]  rtu_path_reg_2;             
reg     [7 :0]  rtu_path_reg_2_pre;         
reg     [7 :0]  rtu_path_reg_3;             
reg     [7 :0]  rtu_path_reg_3_pre;         

// &Wires; @25
wire            after_path_reg_rtu_updt_rd; 
wire    [7 :0]  bht_ind_btb_rtu_ghr;        
wire    [7 :0]  bht_ind_btb_vghr;           
wire            cp0_ifu_icg_en;             
wire            cp0_ifu_ind_btb_en;         
wire            cp0_yy_clk_en;              
wire    [1 :0]  cp0_yy_priv_mode;           
wire            cpurst_b;                   
wire            dout_update_clk;            
wire            dout_update_clk_en;         
wire            forever_cpuclk;             
wire            ib_stage_path_update_rd;    
wire            ibctrl_ind_btb_check_vld;   
wire            ibctrl_ind_btb_fifo_stall;  
wire    [7 :0]  ibctrl_ind_btb_path;        
wire            ifctrl_ind_btb_inv;         
wire            ind_btb_cen_b;              
wire            ind_btb_clk_en;             
wire    [22:0]  ind_btb_data_in;            
wire    [22:0]  ind_btb_dout;               
wire    [22:0]  ind_btb_ibctrl_dout;        
wire    [1 :0]  ind_btb_ibctrl_priv_mode;   
wire            ind_btb_ifctrl_inv_done;    
wire            ind_btb_ifctrl_inv_on;      
wire            ind_btb_inv_reg_upd_clk;    
wire            ind_btb_inv_reg_upd_clk_en; 
wire            ind_btb_invalidate;         
wire            ind_btb_rd;                 
wire    [7 :0]  ind_btb_rd_index;           
wire            ind_btb_wen_b;              
wire    [7 :0]  ind_btb_wr_index;           
wire            ip_stage_vghr_update_rd;    
wire            ipctrl_ind_btb_con_br_vld;  
wire            ipdp_ind_btb_jmp_detect;    
wire            pad_yy_icg_scan_en;         
wire    [7 :0]  path_reg_0_pre;             
wire    [7 :0]  path_reg_1_pre;             
wire    [7 :0]  path_reg_2_pre;             
wire    [7 :0]  path_reg_3_pre;             
wire            path_reg_rtu_updt;          
wire            path_reg_rtu_updt_rd;       
wire            path_reg_updt_clk;          
wire            path_reg_updt_clk_en;       
wire    [7 :0]  rtu_ghr;                    
wire            rtu_ifu_flush;              
wire    [7 :0]  rtu_ifu_retire0_chk_idx;    
wire            rtu_ifu_retire0_jmp;        
wire            rtu_ifu_retire0_jmp_mispred; 
wire            rtu_ifu_retire0_mispred;    
wire    [38:0]  rtu_ifu_retire0_next_pc;    
wire    [7 :0]  rtu_ifu_retire1_chk_idx;    
wire            rtu_ifu_retire1_jmp;        
wire    [7 :0]  rtu_ifu_retire2_chk_idx;    
wire            rtu_ifu_retire2_jmp;        
wire            rtu_ind_btb_update_vld;     
wire            rtu_jmp_check_vld;          
wire    [19:0]  rtu_jmp_target_pc;          
wire            rtu_path_reg_updt_clk;      
wire            rtu_path_reg_updt_clk_en;   
wire            updt_clk;                   
wire            updt_clk_en;                
wire    [7 :0]  vghr_reg;                   



//==========================================================
//               Chip Enable to Ind_BTB
//==========================================================
//Ind_BTB is enabled when :
//1.write enable
//  a.Ind_BTB Invalid
//  b.Ind_BTB Update by RTU
//    When RTU ckeck any ind_btb inst, rtu_ind_btb_mispred
//    It will update ind BTB memory data
//2.read enable
//  a.After RTU_Ind_BTB_recover --> Update PATH Infor
//    1).RTU IFU Flush
//    2).RTU retire any mispredict inst
//  b.BJU Change Flow  --> Update VGHR
//    BJU check any mispredict inst will update VGHR  
//    Need not to read ind btb, beacuse from IU check Mispred
//    inst, until RTU retire Mispred inst, if IFU fetch ind btb 
//    inst, it will stall inst fetch 
//  c.IB Stage check Ind_BTB Inst --> Update PATH Infor
//  d.IP Stage check Con_br Inst --> Update VGHR 
assign ind_btb_cen_b = !ind_btb_inv_on_reg && 
                       !(cp0_ifu_ind_btb_en && 
                          (
                            rtu_ind_btb_update_vld || 
                            path_reg_rtu_updt_rd || 
                            after_path_reg_rtu_updt_rd || 
                            ib_stage_path_update_rd || 
                            ip_stage_vghr_update_rd
                          )
                        );
//Clk Enable Signal for Memory Gate Clk
assign ind_btb_clk_en = ind_btb_inv_on_reg || 
                        cp0_ifu_ind_btb_en && 
                        (
                          rtu_ind_btb_update_vld || 
                          ipdp_ind_btb_jmp_detect
                        );

//----------------------read signal-------------------------
//Only When ip stage detect JMP inst will read ind_btb
assign rtu_ind_btb_update_vld  = rtu_ifu_retire0_jmp_mispred;
assign ib_stage_path_update_rd = ipdp_ind_btb_jmp_detect || 
                                 ibctrl_ind_btb_check_vld;
assign ip_stage_vghr_update_rd = ipctrl_ind_btb_con_br_vld && 
                                 ipdp_ind_btb_jmp_detect;
assign path_reg_rtu_updt_rd    = path_reg_rtu_updt && 
                                 ipdp_ind_btb_jmp_detect;

//-------------after_path_reg_rtu_updt_rd-------------------
// &Instance("gated_clk_cell","x_updt_clk"); @77
gated_clk_cell  x_updt_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (updt_clk          ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (updt_clk_en       ),
  .module_en          (cp0_ifu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect( .clk_in         (forever_cpuclk), @78
//           .clk_out        (updt_clk),//Out Clock @79
//           .external_en    (1'b0), @80
//           .global_en      (cp0_yy_clk_en), @81
//           .local_en       (updt_clk_en),//Local Condition @82
//           .module_en      (cp0_ifu_icg_en) @83
//         ); @84
assign updt_clk_en = ind_btb_inv_on_reg || 
                     path_reg_rtu_updt || 
                     after_path_reg_rtu_updt;

//path_reg_rtu_updt means rtu retire one any mispredict inst
//path_reg_rtu_updt will recover ind btb's PATH reg
always @(posedge updt_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    after_path_reg_rtu_updt <= 1'b0;
  else if(ind_btb_inv_on_reg)
    after_path_reg_rtu_updt <= 1'b0;
  else if(path_reg_rtu_updt && rtu_ind_btb_update_vld)//rtu_ind_br_mispred
    after_path_reg_rtu_updt <= 1'b1;
  else
    after_path_reg_rtu_updt <= 1'b0;
end

assign after_path_reg_rtu_updt_rd = after_path_reg_rtu_updt && 
                                    ipdp_ind_btb_jmp_detect;
assign path_reg_rtu_updt = rtu_ifu_retire0_mispred || 
                           rtu_ifu_flush;
//==========================================================
//               Write Enable to Ind_BTB
//==========================================================
//Ind_BTB write priority is higher than Ind_BTB read
//1.Ind_BTB Invalid
//2.Ind_BTB Update by RTU
assign ind_btb_wen_b = !ind_btb_inv_on_reg && 
                       !(cp0_ifu_ind_btb_en && 
                         rtu_ind_btb_update_vld);

//==========================================================
//               Read Enable to Ind_BTB
//==========================================================
assign ind_btb_rd = cp0_ifu_ind_btb_en &&  
                    (
                      path_reg_rtu_updt_rd || 
                      after_path_reg_rtu_updt_rd || 
                      ib_stage_path_update_rd || 
                      ip_stage_vghr_update_rd
                    ) && 
                    !rtu_ind_btb_update_vld && 
                    !ibctrl_ind_btb_fifo_stall && 
                    !ind_btb_inv_on_reg;
                  
//==========================================================
//                Write Data to Ind BTB
//==========================================================
//data_in[20:0] = {vld, target[19:0]}
assign ind_btb_data_in[22:0] = (ind_btb_inv_on_reg) 
                             ? 23'b0 
                             : {1'b1,cp0_yy_priv_mode[1:0],rtu_jmp_target_pc[19:0]};
assign rtu_jmp_target_pc[19:0] = rtu_ifu_retire0_next_pc[19:0];
// &Force("bus","rtu_ifu_retire0_next_pc",38,0);       @139
                             
//==========================================================
//                   Index to Ind BTB
//==========================================================
// &CombBeg; @144
always @( ind_btb_rd_index[7:0]
       or ind_btb_inv_cnt[7:0]
       or ind_btb_inv_on_reg
       or ind_btb_wr_index[7:0]
       or rtu_ind_btb_update_vld)
begin
if(ind_btb_inv_on_reg)
  ind_btb_index[7:0] = ind_btb_inv_cnt[7:0];
else if(rtu_ind_btb_update_vld)
  ind_btb_index[7:0] = ind_btb_wr_index[7:0];
else //if(ind_btb_read) 
  ind_btb_index[7:0] = ind_btb_rd_index[7:0];
// &CombEnd; @151
end

assign ind_btb_wr_index[7:0] = {
                                 {rtu_path_reg_3[7:6] ^ rtu_ghr[7:6]}, 
                                 {rtu_path_reg_2[5:4] ^ rtu_ghr[5:4]}, 
                                 {rtu_path_reg_1[3:2] ^ rtu_ghr[3:2]}, 
                                 {rtu_path_reg_0[1:0] ^ rtu_ghr[1:0]}
                               };
//For timing, use vghr_reg in stead of vghr_pre
assign ind_btb_rd_index[7:0] = {
                                 {path_reg_3_pre[7:6] ^ vghr_reg[7:6]}, 
                                 {path_reg_2_pre[5:4] ^ vghr_reg[5:4]}, 
                                 {path_reg_1_pre[3:2] ^ vghr_reg[3:2]}, 
                                 {path_reg_0_pre[1:0] ^ vghr_reg[1:0]}
                               };

assign rtu_ghr[7:0]  = bht_ind_btb_rtu_ghr[7:0];
assign vghr_reg[7:0] = bht_ind_btb_vghr[7:0];

//==========================================================
//                   rtu_path_reg 
//==========================================================
//Gate Clk
// &Instance("gated_clk_cell","x_rtu_path_reg_updt_clk"); @174
gated_clk_cell  x_rtu_path_reg_updt_clk (
  .clk_in                   (forever_cpuclk          ),
  .clk_out                  (rtu_path_reg_updt_clk   ),
  .external_en              (1'b0                    ),
  .global_en                (cp0_yy_clk_en           ),
  .local_en                 (rtu_path_reg_updt_clk_en),
  .module_en                (cp0_ifu_icg_en          ),
  .pad_yy_icg_scan_en       (pad_yy_icg_scan_en      )
);

// &Connect( .clk_in         (forever_cpuclk), @175
//           .clk_out        (rtu_path_reg_updt_clk),//Out Clock @176
//           .external_en    (1'b0), @177
//           .global_en      (cp0_yy_clk_en), @178
//           .local_en       (rtu_path_reg_updt_clk_en),//Local Condition @179
//           .module_en      (cp0_ifu_icg_en) @180
//         ); @181
assign rtu_path_reg_updt_clk_en = rtu_jmp_check_vld && 
                                  cp0_ifu_ind_btb_en || 
                                  ind_btb_inv_on_reg;
assign rtu_jmp_check_vld        = rtu_ifu_retire0_jmp || 
                                  rtu_ifu_retire1_jmp || 
                                  rtu_ifu_retire2_jmp;
//rtu_path_reg                             
always @(posedge rtu_path_reg_updt_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
  begin
    rtu_path_reg_3[7:0] <= 8'b0;
    rtu_path_reg_2[7:0] <= 8'b0;
    rtu_path_reg_1[7:0] <= 8'b0;
    rtu_path_reg_0[7:0] <= 8'b0;
  end
  else if(ind_btb_inv_on_reg)
  begin
    rtu_path_reg_3[7:0] <= 8'b0;
    rtu_path_reg_2[7:0] <= 8'b0;
    rtu_path_reg_1[7:0] <= 8'b0;
    rtu_path_reg_0[7:0] <= 8'b0;
  end
  else if(rtu_jmp_check_vld && cp0_ifu_ind_btb_en)
  begin
    rtu_path_reg_3[7:0] <= rtu_path_reg_3_pre[7:0];
    rtu_path_reg_2[7:0] <= rtu_path_reg_2_pre[7:0];
    rtu_path_reg_1[7:0] <= rtu_path_reg_1_pre[7:0];
    rtu_path_reg_0[7:0] <= rtu_path_reg_0_pre[7:0];
  end
  else
  begin
    rtu_path_reg_3[7:0] <= rtu_path_reg_3[7:0];
    rtu_path_reg_2[7:0] <= rtu_path_reg_2[7:0];
    rtu_path_reg_1[7:0] <= rtu_path_reg_1[7:0];
    rtu_path_reg_0[7:0] <= rtu_path_reg_0[7:0];
  end    
end 

//rtu_path_reg_pre
// &CombBeg; @222
always @( rtu_ifu_retire1_chk_idx[7:0]
       or rtu_ifu_retire2_chk_idx[7:0]
       or rtu_path_reg_2[7:0]
       or rtu_ifu_retire0_jmp
       or rtu_ifu_retire0_chk_idx[7:0]
       or rtu_path_reg_1[7:0]
       or rtu_ifu_retire1_jmp
       or rtu_path_reg_0[7:0]
       or rtu_path_reg_3[7:0]
       or rtu_ifu_retire2_jmp)
begin
case({rtu_ifu_retire0_jmp, rtu_ifu_retire1_jmp, rtu_ifu_retire2_jmp})
  3'b000  : begin
            rtu_path_reg_3_pre[7:0] = rtu_path_reg_3[7:0];
            rtu_path_reg_2_pre[7:0] = rtu_path_reg_2[7:0];
            rtu_path_reg_1_pre[7:0] = rtu_path_reg_1[7:0];
            rtu_path_reg_0_pre[7:0] = rtu_path_reg_0[7:0];
            end
  3'b001  : begin
            rtu_path_reg_3_pre[7:0] = rtu_path_reg_2[7:0];
            rtu_path_reg_2_pre[7:0] = rtu_path_reg_1[7:0];
            rtu_path_reg_1_pre[7:0] = rtu_path_reg_0[7:0];
            rtu_path_reg_0_pre[7:0] = rtu_ifu_retire2_chk_idx[7:0];
            end
  3'b010  : begin
            rtu_path_reg_3_pre[7:0] = rtu_path_reg_2[7:0];
            rtu_path_reg_2_pre[7:0] = rtu_path_reg_1[7:0];
            rtu_path_reg_1_pre[7:0] = rtu_path_reg_0[7:0];
            rtu_path_reg_0_pre[7:0] = rtu_ifu_retire1_chk_idx[7:0];
            end
  3'b100  : begin
            rtu_path_reg_3_pre[7:0] = rtu_path_reg_2[7:0];
            rtu_path_reg_2_pre[7:0] = rtu_path_reg_1[7:0];
            rtu_path_reg_1_pre[7:0] = rtu_path_reg_0[7:0];
            rtu_path_reg_0_pre[7:0] = rtu_ifu_retire0_chk_idx[7:0];
            end
  3'b011  : begin
            rtu_path_reg_3_pre[7:0] = rtu_path_reg_1[7:0];
            rtu_path_reg_2_pre[7:0] = rtu_path_reg_0[7:0];
            rtu_path_reg_1_pre[7:0] = rtu_ifu_retire1_chk_idx[7:0];
            rtu_path_reg_0_pre[7:0] = rtu_ifu_retire2_chk_idx[7:0];
            end
  3'b101  : begin
            rtu_path_reg_3_pre[7:0] = rtu_path_reg_1[7:0];
            rtu_path_reg_2_pre[7:0] = rtu_path_reg_0[7:0];
            rtu_path_reg_1_pre[7:0] = rtu_ifu_retire0_chk_idx[7:0];
            rtu_path_reg_0_pre[7:0] = rtu_ifu_retire2_chk_idx[7:0];
            end
  3'b110  : begin
            rtu_path_reg_3_pre[7:0] = rtu_path_reg_1[7:0];
            rtu_path_reg_2_pre[7:0] = rtu_path_reg_0[7:0];
            rtu_path_reg_1_pre[7:0] = rtu_ifu_retire0_chk_idx[7:0];
            rtu_path_reg_0_pre[7:0] = rtu_ifu_retire1_chk_idx[7:0];
            end
  3'b111  : begin
            rtu_path_reg_3_pre[7:0] = rtu_path_reg_0[7:0];
            rtu_path_reg_2_pre[7:0] = rtu_ifu_retire0_chk_idx[7:0];
            rtu_path_reg_1_pre[7:0] = rtu_ifu_retire1_chk_idx[7:0];
            rtu_path_reg_0_pre[7:0] = rtu_ifu_retire2_chk_idx[7:0];
            end
  default : begin
            rtu_path_reg_3_pre[7:0] = rtu_path_reg_3[7:0];
            rtu_path_reg_2_pre[7:0] = rtu_path_reg_2[7:0];
            rtu_path_reg_1_pre[7:0] = rtu_path_reg_1[7:0];
            rtu_path_reg_0_pre[7:0] = rtu_path_reg_0[7:0];
            end
endcase
// &CombEnd; @279
end

//==========================================================
//                       path_reg
//==========================================================
//Gate Clk
// &Instance("gated_clk_cell","x_path_reg_updt_clk"); @285
gated_clk_cell  x_path_reg_updt_clk (
  .clk_in               (forever_cpuclk      ),
  .clk_out              (path_reg_updt_clk   ),
  .external_en          (1'b0                ),
  .global_en            (cp0_yy_clk_en       ),
  .local_en             (path_reg_updt_clk_en),
  .module_en            (cp0_ifu_icg_en      ),
  .pad_yy_icg_scan_en   (pad_yy_icg_scan_en  )
);

// &Connect( .clk_in         (forever_cpuclk), @286
//           .clk_out        (path_reg_updt_clk),//Out Clock @287
//           .external_en    (1'b0), @288
//           .global_en      (cp0_yy_clk_en), @289
//           .local_en       (path_reg_updt_clk_en),//Local Condition @290
//           .module_en      (cp0_ifu_icg_en) @291
//         ); @292
assign path_reg_updt_clk_en = (
                                path_reg_rtu_updt || 
                                ibctrl_ind_btb_check_vld
                              ) && 
                              cp0_ifu_ind_btb_en || 
                              ind_btb_inv_on_reg; 

//path_reg
always @(posedge path_reg_updt_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
  begin
    path_reg_3[7:0] <= 8'b0;
    path_reg_2[7:0] <= 8'b0;
    path_reg_1[7:0] <= 8'b0;
    path_reg_0[7:0] <= 8'b0;
  end
  else if(ind_btb_inv_on_reg)
  begin
    path_reg_3[7:0] <= 8'b0;
    path_reg_2[7:0] <= 8'b0;
    path_reg_1[7:0] <= 8'b0;
    path_reg_0[7:0] <= 8'b0;
  end
  else if((path_reg_rtu_updt || ibctrl_ind_btb_check_vld) && cp0_ifu_ind_btb_en)
  begin
    path_reg_3[7:0] <= path_reg_3_pre[7:0];
    path_reg_2[7:0] <= path_reg_2_pre[7:0];
    path_reg_1[7:0] <= path_reg_1_pre[7:0];
    path_reg_0[7:0] <= path_reg_0_pre[7:0];
  end
  else
  begin
    path_reg_3[7:0] <= path_reg_3[7:0];
    path_reg_2[7:0] <= path_reg_2[7:0];
    path_reg_1[7:0] <= path_reg_1[7:0];
    path_reg_0[7:0] <= path_reg_0[7:0];
  end    
end 

//path_reg_pre
assign path_reg_3_pre[7:0] = (path_reg_rtu_updt)
                           ? rtu_path_reg_3_pre[7:0]
                           : (ibctrl_ind_btb_check_vld)
                             ? path_reg_2[7:0]
                             : path_reg_3[7:0];
assign path_reg_2_pre[7:0] = (path_reg_rtu_updt)
                           ? rtu_path_reg_2_pre[7:0]
                           : (ibctrl_ind_btb_check_vld)
                             ? path_reg_1[7:0]
                             : path_reg_2[7:0];
assign path_reg_1_pre[7:0] = (path_reg_rtu_updt)
                           ? rtu_path_reg_1_pre[7:0]
                           : (ibctrl_ind_btb_check_vld)
                             ? path_reg_0[7:0]
                             : path_reg_1[7:0];
assign path_reg_0_pre[7:0] = (path_reg_rtu_updt)
                           ? rtu_path_reg_0_pre[7:0]
                           : (ibctrl_ind_btb_check_vld)
                             ? ibctrl_ind_btb_path[7:0]
                             : path_reg_0[7:0];

//==========================================================
//                 Ind BTB Data out reg
//==========================================================
//In case of memory write affect the read data of Memory Dout
//when read memory, flop one cycle, write data in dout into reg
always @(posedge forever_cpuclk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ind_btb_rd_flop <= 1'b0;
  else if(ind_btb_inv_on_reg)
    ind_btb_rd_flop <= 1'b0;
  else if(ind_btb_rd)
    ind_btb_rd_flop <= 1'b1;
  else
    ind_btb_rd_flop <= 1'b0;
end

//Gate clk
// &Instance("gated_clk_cell","x_dout_update_clk"); @373
gated_clk_cell  x_dout_update_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (dout_update_clk   ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (dout_update_clk_en),
  .module_en          (cp0_ifu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect( .clk_in         (forever_cpuclk), @374
//           .clk_out        (dout_update_clk),//Out Clock @375
//           .external_en    (1'b0), @376
//           .global_en      (cp0_yy_clk_en), @377
//           .local_en       (dout_update_clk_en),//Local Condition @378
//           .module_en      (cp0_ifu_icg_en) @379
//         ); @380
assign dout_update_clk_en = ind_btb_rd_flop;

//Dout Reg Update
always @(posedge dout_update_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ind_btb_dout_reg[22:0] <= 23'b0;
  else if(ind_btb_rd_flop)
    ind_btb_dout_reg[22:0] <= ind_btb_dout[22:0];//Memory Dout
  else
    ind_btb_dout_reg[22:0] <= ind_btb_dout_reg[22:0];
end
assign ind_btb_ibctrl_dout[22:0] = ind_btb_dout_reg[22:0];

//for timing consideration,when read ind btb,flop priv_mode
always @(posedge dout_update_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    priv_mode_reg[1:0] <= 2'b11; //reset machine mode
  else if(ind_btb_rd_flop)
    priv_mode_reg[1:0] <= cp0_yy_priv_mode[1:0];
  else
    priv_mode_reg[1:0] <= priv_mode_reg[1:0];
end
assign ind_btb_ibctrl_priv_mode[1:0] = priv_mode_reg[1:0];

//==========================================================
//              Invalidation of Ind BTB
//==========================================================
//Gate Clk
// &Instance("gated_clk_cell","x_ind_btb_inv_reg_upd_clk"); @411
gated_clk_cell  x_ind_btb_inv_reg_upd_clk (
  .clk_in                     (forever_cpuclk            ),
  .clk_out                    (ind_btb_inv_reg_upd_clk   ),
  .external_en                (1'b0                      ),
  .global_en                  (cp0_yy_clk_en             ),
  .local_en                   (ind_btb_inv_reg_upd_clk_en),
  .module_en                  (cp0_ifu_icg_en            ),
  .pad_yy_icg_scan_en         (pad_yy_icg_scan_en        )
);

// &Connect( .clk_in         (forever_cpuclk), @412
//           .clk_out        (ind_btb_inv_reg_upd_clk),//Out Clock @413
//           .external_en    (1'b0), @414
//           .global_en      (cp0_yy_clk_en), @415
//           .local_en       (ind_btb_inv_reg_upd_clk_en),//Local Condition @416
//           .module_en      (cp0_ifu_icg_en) @417
//         ); @418
assign ind_btb_inv_reg_upd_clk_en = ind_btb_inv_on_reg || 
                                    ind_btb_invalidate;
//Invalidation Index
always @(posedge ind_btb_inv_reg_upd_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ind_btb_inv_cnt[7:0] <= 8'b0;
  else if(ind_btb_inv_on_reg)
    ind_btb_inv_cnt[7:0] <= ind_btb_inv_cnt[7:0] - 8'b1;
  else if(ind_btb_invalidate)
    ind_btb_inv_cnt[7:0] <= 8'b11111111;
  else
    ind_btb_inv_cnt[7:0] <= ind_btb_inv_cnt[7:0];
end
assign ind_btb_invalidate = ifctrl_ind_btb_inv;

//==========================================================
//             Invalidating Status Register
//==========================================================
always @(posedge ind_btb_inv_reg_upd_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ind_btb_inv_on_reg <= 1'b0;
  else if(!(|ind_btb_inv_cnt[7:0]) && ind_btb_inv_on_reg)
    ind_btb_inv_on_reg <= 1'b0;
  else if(ind_btb_invalidate)
    ind_btb_inv_on_reg <= 1'b1;
  else
    ind_btb_inv_on_reg <= ind_btb_inv_on_reg;
end

//==========================================================
//              Invalidating Finish Signal
//==========================================================
assign ind_btb_ifctrl_inv_done = !ind_btb_inv_on_reg;
assign ind_btb_ifctrl_inv_on   = ind_btb_inv_on_reg;

//==========================================================
//              Ind BTB Memory Instance
//==========================================================
// &Instance("ct_ifu_ind_btb_array", "x_ct_ifu_ind_btb_array"); @459
ct_ifu_ind_btb_array  x_ct_ifu_ind_btb_array (
  .cp0_ifu_icg_en     (cp0_ifu_icg_en    ),
  .cp0_yy_clk_en      (cp0_yy_clk_en     ),
  .forever_cpuclk     (forever_cpuclk    ),
  .ind_btb_cen_b      (ind_btb_cen_b     ),
  .ind_btb_clk_en     (ind_btb_clk_en    ),
  .ind_btb_data_in    (ind_btb_data_in   ),
  .ind_btb_dout       (ind_btb_dout      ),
  .ind_btb_index      (ind_btb_index     ),
  .ind_btb_wen_b      (ind_btb_wen_b     ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);


// &ModuleEnd; @461
endmodule


