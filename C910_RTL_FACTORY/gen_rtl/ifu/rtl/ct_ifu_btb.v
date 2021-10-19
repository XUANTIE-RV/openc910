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
module ct_ifu_btb(
  addrgen_btb_index,
  addrgen_btb_tag,
  addrgen_btb_target_pc,
  addrgen_btb_update_vld,
  btb_ifctrl_inv_done,
  btb_ifctrl_inv_on,
  btb_ifdp_way0_pred,
  btb_ifdp_way0_tag,
  btb_ifdp_way0_target,
  btb_ifdp_way0_vld,
  btb_ifdp_way1_pred,
  btb_ifdp_way1_tag,
  btb_ifdp_way1_target,
  btb_ifdp_way1_vld,
  btb_ifdp_way2_pred,
  btb_ifdp_way2_tag,
  btb_ifdp_way2_target,
  btb_ifdp_way2_vld,
  btb_ifdp_way3_pred,
  btb_ifdp_way3_tag,
  btb_ifdp_way3_target,
  btb_ifdp_way3_vld,
  cp0_ifu_btb_en,
  cp0_ifu_icg_en,
  cp0_yy_clk_en,
  cpurst_b,
  forever_cpuclk,
  ibdp_btb_miss,
  ifctrl_btb_inv,
  ipctrl_btb_chgflw_vld,
  ipctrl_btb_way_pred,
  ipctrl_btb_way_pred_error,
  ipdp_btb_index_pc,
  ipdp_btb_target_pc,
  pad_yy_icg_scan_en,
  pcgen_btb_chgflw,
  pcgen_btb_chgflw_higher_than_addrgen,
  pcgen_btb_chgflw_higher_than_if,
  pcgen_btb_chgflw_higher_than_ip,
  pcgen_btb_chgflw_short,
  pcgen_btb_index,
  pcgen_btb_stall,
  pcgen_btb_stall_short
);

// &Ports; @23
input   [9 :0]  addrgen_btb_index;                   
input   [9 :0]  addrgen_btb_tag;                     
input   [19:0]  addrgen_btb_target_pc;               
input           addrgen_btb_update_vld;              
input           cp0_ifu_btb_en;                      
input           cp0_ifu_icg_en;                      
input           cp0_yy_clk_en;                       
input           cpurst_b;                            
input           forever_cpuclk;                      
input           ibdp_btb_miss;                       
input           ifctrl_btb_inv;                      
input           ipctrl_btb_chgflw_vld;               
input   [1 :0]  ipctrl_btb_way_pred;                 
input           ipctrl_btb_way_pred_error;           
input   [38:0]  ipdp_btb_index_pc;                   
input   [19:0]  ipdp_btb_target_pc;                  
input           pad_yy_icg_scan_en;                  
input           pcgen_btb_chgflw;                    
input           pcgen_btb_chgflw_higher_than_addrgen; 
input           pcgen_btb_chgflw_higher_than_if;     
input           pcgen_btb_chgflw_higher_than_ip;     
input           pcgen_btb_chgflw_short;              
input   [9 :0]  pcgen_btb_index;                     
input           pcgen_btb_stall;                     
input           pcgen_btb_stall_short;               
output          btb_ifctrl_inv_done;                 
output          btb_ifctrl_inv_on;                   
output  [1 :0]  btb_ifdp_way0_pred;                  
output  [9 :0]  btb_ifdp_way0_tag;                   
output  [19:0]  btb_ifdp_way0_target;                
output          btb_ifdp_way0_vld;                   
output  [1 :0]  btb_ifdp_way1_pred;                  
output  [9 :0]  btb_ifdp_way1_tag;                   
output  [19:0]  btb_ifdp_way1_target;                
output          btb_ifdp_way1_vld;                   
output  [1 :0]  btb_ifdp_way2_pred;                  
output  [9 :0]  btb_ifdp_way2_tag;                   
output  [19:0]  btb_ifdp_way2_target;                
output          btb_ifdp_way2_vld;                   
output  [1 :0]  btb_ifdp_way3_pred;                  
output  [9 :0]  btb_ifdp_way3_tag;                   
output  [19:0]  btb_ifdp_way3_target;                
output          btb_ifdp_way3_vld;                   

// &Regs; @24
reg             after_addrgen_btb_chgflw_first;      
reg             after_addrgen_btb_chgflw_second;     
reg     [87:0]  btb_data_dout_reg;                   
reg     [3 :0]  btb_data_wen;                        
reg     [9 :0]  btb_index;                           
reg     [9 :0]  btb_index_flop;                      
reg     [38:0]  btb_index_pc_record;                 
reg             btb_inv_on_reg;                      
reg     [9 :0]  btb_inval_cnt;                       
reg             btb_rd_flop;                         
reg     [43:0]  btb_tag_dout_reg;                    
reg     [3 :0]  btb_tag_wen;                         
reg     [19:0]  btb_target_pc_record;                
reg     [9 :0]  refill_buf_index;                    
reg     [9 :0]  refill_buf_tag;                      
reg     [19:0]  refill_buf_target_pc;                
reg             refill_buf_valid;                    
reg     [1 :0]  refill_buf_way_pred;                 

// &Wires; @25
wire    [9 :0]  addrgen_btb_index;                   
wire    [9 :0]  addrgen_btb_tag;                     
wire    [19:0]  addrgen_btb_target_pc;               
wire            addrgen_btb_update_vld;              
wire    [9 :0]  btb_buf_tag_data;                    
wire    [19:0]  btb_buf_target_pc;                   
wire            btb_buf_valid;                       
wire    [1 :0]  btb_buf_way_pred;                    
wire            btb_data_cen_b;                      
wire            btb_data_clk_en;                     
wire    [43:0]  btb_data_din;                        
wire    [87:0]  btb_data_dout;                       
wire            btb_data_rd;                         
wire            btb_dout_flop_clk;                   
wire            btb_dout_flop_clk_en;                
wire            btb_ifctrl_inv_done;                 
wire            btb_ifctrl_inv_on;                   
wire    [1 :0]  btb_ifdp_way0_pred;                  
wire    [9 :0]  btb_ifdp_way0_tag;                   
wire    [19:0]  btb_ifdp_way0_target;                
wire            btb_ifdp_way0_vld;                   
wire    [1 :0]  btb_ifdp_way1_pred;                  
wire    [9 :0]  btb_ifdp_way1_tag;                   
wire    [19:0]  btb_ifdp_way1_target;                
wire            btb_ifdp_way1_vld;                   
wire    [1 :0]  btb_ifdp_way2_pred;                  
wire    [9 :0]  btb_ifdp_way2_tag;                   
wire    [19:0]  btb_ifdp_way2_target;                
wire            btb_ifdp_way2_vld;                   
wire    [1 :0]  btb_ifdp_way3_pred;                  
wire    [9 :0]  btb_ifdp_way3_tag;                   
wire    [19:0]  btb_ifdp_way3_target;                
wire            btb_ifdp_way3_vld;                   
wire            btb_inv_reg_upd_clk;                 
wire            btb_inv_reg_upd_clk_en;              
wire    [9 :0]  btb_mem_way0_tag_data;               
wire    [19:0]  btb_mem_way0_target_pc;              
wire            btb_mem_way0_valid;                  
wire    [1 :0]  btb_mem_way0_way_pred;               
wire    [9 :0]  btb_mem_way1_tag_data;               
wire    [19:0]  btb_mem_way1_target_pc;              
wire            btb_mem_way1_valid;                  
wire    [1 :0]  btb_mem_way1_way_pred;               
wire    [9 :0]  btb_mem_way2_tag_data;               
wire    [19:0]  btb_mem_way2_target_pc;              
wire            btb_mem_way2_valid;                  
wire    [1 :0]  btb_mem_way2_way_pred;               
wire    [9 :0]  btb_mem_way3_tag_data;               
wire    [19:0]  btb_mem_way3_target_pc;              
wire            btb_mem_way3_valid;                  
wire    [1 :0]  btb_mem_way3_way_pred;               
wire            btb_miss_way_pred_rd;                
wire            btb_tag_cen_b;                       
wire            btb_tag_clk_en;                      
wire    [21:0]  btb_tag_din;                         
wire    [43:0]  btb_tag_dout;                        
wire            btb_tag_rd;                          
wire            btb_tag_rd_gateclk_en;               
wire            chgflw_higher_than_addrgen;          
wire            chgflw_higher_than_if;               
wire            chgflw_higher_than_ip;               
wire            cp0_ifu_btb_en;                      
wire            cp0_ifu_icg_en;                      
wire            cp0_yy_clk_en;                       
wire            cpurst_b;                            
wire            forever_cpuclk;                      
wire            ibdp_btb_miss;                       
wire            ifctrl_btb_inv;                      
wire            index_pc_record_clk;                 
wire            index_pc_record_clk_en;              
wire            ip_way_mispred;                      
wire            ipctrl_btb_chgflw_vld;               
wire    [1 :0]  ipctrl_btb_way_pred;                 
wire            ipctrl_btb_way_pred_error;           
wire    [38:0]  ipdp_btb_index_pc;                   
wire    [19:0]  ipdp_btb_target_pc;                  
wire            pad_yy_icg_scan_en;                  
wire            pcgen_btb_chgflw;                    
wire            pcgen_btb_chgflw_higher_than_addrgen; 
wire            pcgen_btb_chgflw_higher_than_if;     
wire            pcgen_btb_chgflw_higher_than_ip;     
wire            pcgen_btb_chgflw_short;              
wire    [9 :0]  pcgen_btb_index;                     
wire            pcgen_btb_stall;                     
wire            pcgen_btb_stall_short;               
wire            pcgen_stall;                         
wire            refill_buf_updt_clk;                 
wire            refill_buf_updt_clk_en;              
wire            refill_buf_updt_vld;                 
wire    [3 :0]  refill_buf_wen;                      
wire            tag_vld_din;                         

// &Force("bus","addrgen_btb_tag",9,0); @27
parameter PC_WIDTH = 40;
//==========================================================
//                    BTB Tag Array
//==========================================================
//|--------|-----------|--------|-----------|
//| Valid1 | Tag1[9:0] | Valid0 | Tag0[9:0] |
//|--------|-----------|--------|-----------|
//
//Tag[9:0] = {vpc[19:13],vpc[2:0]};
//==========================================================
//             Chip Enable to BTB Tag array
//==========================================================
//BTB tag array is enable when:
//1.write enable
//  a.BTB is on inv
//  b.BTB updated by refill buffer && cp0_btb_en
//2.read enable
//  a.Change flow except ip_way_pred_reissue && cp0_btb_en
//    note:way_pred_reissue & ibdp_btb_miss
//         need not to read btb again and
//         use this cycle update refill buffer to btb
//  b.Sequence Read && !pc_stall && cp0_btb_en
//INV > Write enable > Read enable
assign btb_tag_cen_b = !btb_inv_on_reg && 
                       !(cp0_ifu_btb_en && refill_buf_updt_vld) && 
                       !btb_tag_rd; 
                     
assign btb_tag_rd    = cp0_ifu_btb_en && 
                       (
                         (pcgen_btb_chgflw && 
                          !ipctrl_btb_way_pred_error && 
                          !ibdp_btb_miss) ||              
                         (!pcgen_btb_chgflw && 
                          !pcgen_btb_stall)
                        );
assign btb_tag_rd_gateclk_en = cp0_ifu_btb_en && 
                              (pcgen_btb_chgflw_short || 
                              !pcgen_btb_stall_short);
//Gate Clk for Memory
assign btb_tag_clk_en = btb_inv_on_reg || 
                        cp0_ifu_btb_en && 
                        (
                          pcgen_btb_chgflw_short || 
                          !pcgen_btb_stall_short || 
                          ibdp_btb_miss 
                        );
//==========================================================
//             Write Enable to BTB Tag array
//==========================================================
//1.BTB is on INV
//  wen[1:0] = 2'b00, 2 way write
//2.BTB update by refill buffer
//  wen[1:0] = refill buffer wen[1:0] 
//           = {!(pc[3]^pc[2]), pc[3]^pc[2]}
// &CombBeg; @82
always @( btb_inv_on_reg
       or refill_buf_wen[3:0]
       or cp0_ifu_btb_en
       or refill_buf_updt_vld)
begin
if(btb_inv_on_reg)
  btb_tag_wen[3:0] = 4'b00;
else if(cp0_ifu_btb_en && refill_buf_updt_vld)
  btb_tag_wen[3:0] = refill_buf_wen[3:0];
else
  btb_tag_wen[3:0] = 4'b1111;
// &CombEnd; @89
end

assign refill_buf_wen[3:0] = {~(refill_buf_tag[2:1]== 2'b11),
                              ~(refill_buf_tag[2:1]== 2'b10),
                              ~(refill_buf_tag[2:1]== 2'b01),
                              ~(refill_buf_tag[2:1]== 2'b00)};


//==========================================================
//             Write Data to BTB Tag array
//==========================================================
//1.BTB is on INV
//  valid = 0; tag = 0;
//2.BTB update by refill buffer
//  valid = 1; tag = refill_buffer_tag
assign tag_vld_din = refill_buf_updt_vld ? 1'b1 : 1'b0;
//BTB_1024 tag should be the value of right shifting one bit of BTB_2048
assign btb_tag_din[21:0] = {tag_vld_din, refill_buf_tag[9:0],
                            tag_vld_din, refill_buf_tag[9:0]};
//==========================================================
//                    BTB Data Array
//==========================================================
//|-----------|------------|-----------|------------|
//| way1[1:0] | Tar1[19:0] | way0[1:0] | Tar0[19:0] |
//|-----------|------------|-----------|------------|

//==========================================================
//             Chip Enable to BTB Data array
//==========================================================
//BTB Data array is enable when :
//1.write enable
//  a.BTB updated by refill buffer && cp0_btb_en
//2.read enable
//  a.Change flow except ip_way_pred_reissue && cp0_btb_en
//  b.Sequence Read && !pc_stall && cp0_btb_en
assign btb_data_cen_b = !(cp0_ifu_btb_en && refill_buf_updt_vld) && 
                        !btb_data_rd;
                          
assign btb_data_rd    = cp0_ifu_btb_en && 
                        (
                          (pcgen_btb_chgflw && 
                           !ipctrl_btb_way_pred_error && 
                           !ibdp_btb_miss) ||              
                          (!pcgen_btb_chgflw && 
                           !pcgen_btb_stall)
                         );
//Gate Clk for Memory
assign btb_data_clk_en = cp0_ifu_btb_en && 
                         (
                          ibdp_btb_miss || 
                          //ipctrl_btb_way_pred_error || //covered by chgflw
                          pcgen_btb_chgflw_short || 
                          !pcgen_btb_stall_short
                         );
//==========================================================
//             Write Enable to BTB Data array
//==========================================================
//1.BTB update by refill buffer
//  wen[1:0] = refill buffer wen[1:0] 
//           = {!(pc32[3]^pc[2]), pc32[3]^pc[2]}
// &CombBeg; @155
always @( refill_buf_wen[3:0]
       or cp0_ifu_btb_en
       or refill_buf_updt_vld)
begin
if(cp0_ifu_btb_en && refill_buf_updt_vld)
  btb_data_wen[3:0] = refill_buf_wen[3:0];
else
  btb_data_wen[3:0] = 4'b1111;
// &CombEnd; @160
end

//==========================================================
//             Write Data to BTB Data array
//==========================================================
//BTB Only record the low 20 bits of target PC
assign btb_data_din[43:0] = {refill_buf_way_pred[1:0], refill_buf_target_pc[19:0],
                             refill_buf_way_pred[1:0], refill_buf_target_pc[19:0]};

//==========================================================
//                      Index to BTB
//==========================================================
//Index to BTB
//1.BTB on INV
//  index = btb_inval_cnt
//2.Refill Buffer Update
//  index = refill_buf_index
//3.other
//  index = pcgen_pc
// &CombBeg; @179
always @( btb_inval_cnt[9:0]
       or btb_inv_on_reg
       or refill_buf_index[9:0]
       or pcgen_btb_index[9:0]
       or refill_buf_updt_vld)
begin
if(btb_inv_on_reg)
  btb_index[9:0] = btb_inval_cnt[9:0];
else if(refill_buf_updt_vld)
  btb_index[9:0] = refill_buf_index[9:0];
else
  btb_index[9:0] = pcgen_btb_index[9:0];
// &CombEnd; @186
end

//==========================================================
//      Index PC Record for way pred mistake update
//==========================================================
//when in IP stage, BTB change flow happens
//record ip_vpc to btb_index_pc_record[PC_WIDTH-2:0]
//when in IP stage, way predict mistake happens
//take btb_index_pc_record[30:0] as index pc, 
//and write it to the refill buffer
//we also record target PC in the same way
// &Instance("gated_clk_cell","x_index_pc_record_clk"); @197
gated_clk_cell  x_index_pc_record_clk (
  .clk_in                 (forever_cpuclk        ),
  .clk_out                (index_pc_record_clk   ),
  .external_en            (1'b0                  ),
  .global_en              (cp0_yy_clk_en         ),
  .local_en               (index_pc_record_clk_en),
  .module_en              (cp0_ifu_icg_en        ),
  .pad_yy_icg_scan_en     (pad_yy_icg_scan_en    )
);

// &Connect( .clk_in         (forever_cpuclk), @198
//           .clk_out        (index_pc_record_clk),//Out Clock @199
//           .external_en    (1'b0), @200
//           .global_en      (cp0_yy_clk_en), @201
//           .local_en       (index_pc_record_clk_en),//Local Condition @202
//           .module_en      (cp0_ifu_icg_en) @203
//         ); @204
assign index_pc_record_clk_en = btb_inv_on_reg || ipctrl_btb_chgflw_vld;

always @(posedge index_pc_record_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    btb_index_pc_record[PC_WIDTH-2:0] <= {PC_WIDTH-1{1'b0}};
  else if(btb_inv_on_reg)
    btb_index_pc_record[PC_WIDTH-2:0] <= {PC_WIDTH-1{1'b0}};
  else if(ipctrl_btb_chgflw_vld)
    btb_index_pc_record[PC_WIDTH-2:0] <= ipdp_btb_index_pc[PC_WIDTH-2:0];//IP Stage VPC
  else
    btb_index_pc_record[PC_WIDTH-2:0] <= btb_index_pc_record[PC_WIDTH-2:0];
end

always @(posedge index_pc_record_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    btb_target_pc_record[19:0] <= 20'b0;
  else if(btb_inv_on_reg)
    btb_target_pc_record[19:0] <= 20'b0;
  else if(ipctrl_btb_chgflw_vld)
    btb_target_pc_record[19:0] <= ipdp_btb_target_pc[19:0];//IP Stage target PC
  else
    btb_target_pc_record[19:0] <= btb_target_pc_record[19:0];
end

//==========================================================
//                Tag Array Data Output
//==========================================================
//In case of writing change the output data of memory dout
//Every time read data out(rd flop valid), restore data to reg

//------------------Read Flop Signal------------------------
always @(posedge btb_dout_flop_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    btb_rd_flop <= 1'b0;
  else if(btb_inv_on_reg)
    btb_rd_flop <= 1'b0;
  else if(btb_tag_rd)
    btb_rd_flop <= 1'b1;
  else
    btb_rd_flop <= 1'b0;
end

//---------------------Gate Clock---------------------------
// &Instance("gated_clk_cell","x_btb_dout_flop_clk"); @251
gated_clk_cell  x_btb_dout_flop_clk (
  .clk_in               (forever_cpuclk      ),
  .clk_out              (btb_dout_flop_clk   ),
  .external_en          (1'b0                ),
  .global_en            (cp0_yy_clk_en       ),
  .local_en             (btb_dout_flop_clk_en),
  .module_en            (cp0_ifu_icg_en      ),
  .pad_yy_icg_scan_en   (pad_yy_icg_scan_en  )
);

// &Connect( .clk_in         (forever_cpuclk), @252
//           .clk_out        (btb_dout_flop_clk),//Out Clock @253
//           .external_en    (1'b0), @254
//           .global_en      (cp0_yy_clk_en), @255
//           .local_en       (btb_dout_flop_clk_en),//Local Condition @256
//           .module_en      (cp0_ifu_icg_en) @257
//         ); @258
assign btb_dout_flop_clk_en = btb_inv_on_reg || 
                              btb_rd_flop    || 
                              btb_tag_rd_gateclk_en;

//--------------------Dout restore reg----------------------
//When ip_way_mispred, cancel the update of btb_tag_dout_reg
//Maintain the Value of btb_tag_dout_reg as the result of 
//Reissue BTB Read
always @(posedge btb_dout_flop_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    btb_tag_dout_reg[43:0] <= 44'b0;
  else if(btb_inv_on_reg)
    btb_tag_dout_reg[43:0] <= 44'b0;
  else if(btb_rd_flop && !ip_way_mispred)
    btb_tag_dout_reg[43:0] <= btb_tag_dout[43:0];
  else
    btb_tag_dout_reg[43:0] <= btb_tag_dout_reg[43:0];
end

//For timing consider
//Not logic and !chgflw_higher_than_ip;
assign ip_way_mispred = ipctrl_btb_way_pred_error;

always @(posedge btb_dout_flop_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    btb_data_dout_reg[87:0] <= 88'b0;
  else if(btb_inv_on_reg)
    btb_data_dout_reg[87:0] <= 88'b0;
  else if(btb_rd_flop && !ip_way_mispred)
    btb_data_dout_reg[87:0] <= btb_data_dout[87:0];
  else
    btb_data_dout_reg[87:0] <= btb_data_dout_reg[87:0];
end

//BTB Result
//Selected from memory dout & store reg
assign btb_mem_way3_valid           = (btb_rd_flop && !ip_way_mispred) 
                                    ? btb_tag_dout[43] 
                                    : btb_tag_dout_reg[43];
assign btb_mem_way2_valid           = (btb_rd_flop && !ip_way_mispred) 
                                    ? btb_tag_dout[32] 
                                    : btb_tag_dout_reg[32];
assign btb_mem_way1_valid           = (btb_rd_flop && !ip_way_mispred) 
                                    ? btb_tag_dout[21] 
                                    : btb_tag_dout_reg[21];
assign btb_mem_way0_valid           = (btb_rd_flop && !ip_way_mispred) 
                                    ? btb_tag_dout[10] 
                                    : btb_tag_dout_reg[10];
assign btb_mem_way3_tag_data[9:0]   = (btb_rd_flop && !ip_way_mispred) 
                                    ? btb_tag_dout[42:33] 
                                    : btb_tag_dout_reg[42:33];
assign btb_mem_way2_tag_data[9:0]   = (btb_rd_flop && !ip_way_mispred) 
                                    ? btb_tag_dout[31:22] 
                                    : btb_tag_dout_reg[31:22];                                  
assign btb_mem_way1_tag_data[9:0]   = (btb_rd_flop && !ip_way_mispred) 
                                    ? btb_tag_dout[20:11] 
                                    : btb_tag_dout_reg[20:11];                                  
assign btb_mem_way0_tag_data[9:0]   = (btb_rd_flop && !ip_way_mispred) 
                                    ? btb_tag_dout[9:0] 
                                    : btb_tag_dout_reg[9:0];

assign btb_mem_way3_way_pred[1:0]   = (btb_rd_flop && !ip_way_mispred)
                                    ? btb_data_dout[87:86] 
                                    : btb_data_dout_reg[87:86];
assign btb_mem_way2_way_pred[1:0]   = (btb_rd_flop && !ip_way_mispred)
                                    ? btb_data_dout[65:64] 
                                    : btb_data_dout_reg[65:64];    
assign btb_mem_way1_way_pred[1:0]   = (btb_rd_flop && !ip_way_mispred)
                                    ? btb_data_dout[43:42] 
                                    : btb_data_dout_reg[43:42];
assign btb_mem_way0_way_pred[1:0]   = (btb_rd_flop && !ip_way_mispred)
                                    ? btb_data_dout[21:20] 
                                    : btb_data_dout_reg[21:20];
assign btb_mem_way3_target_pc[19:0] = (btb_rd_flop && !ip_way_mispred) 
                                    ? btb_data_dout[85:66] 
                                    : btb_data_dout_reg[85:66];
assign btb_mem_way2_target_pc[19:0] = (btb_rd_flop && !ip_way_mispred) 
                                    ? btb_data_dout[63:44] 
                                    : btb_data_dout_reg[63:44];
assign btb_mem_way1_target_pc[19:0] = (btb_rd_flop && !ip_way_mispred) 
                                    ? btb_data_dout[41:22] 
                                    : btb_data_dout_reg[41:22];
assign btb_mem_way0_target_pc[19:0] = (btb_rd_flop && !ip_way_mispred) 
                                    ? btb_data_dout[19:0] 
                                    : btb_data_dout_reg[19:0];
always @(posedge forever_cpuclk or negedge cpurst_b)
begin
  if(!cpurst_b)
    btb_index_flop[9:0] <= 10'b0;
  else
    btb_index_flop[9:0] <= btb_index[9:0];
end
assign btb_buf_valid                = (btb_index_flop[9:0] == refill_buf_index[9:0]) && refill_buf_updt_vld;
assign btb_buf_tag_data[9:0]        = refill_buf_tag[9:0];
assign btb_buf_way_pred[1:0]        = refill_buf_way_pred[1:0];
assign btb_buf_target_pc[19:0]      = refill_buf_target_pc[19:0];
                        
//BTB data to ifdp
//Select Result from memory dout or BTB Refill Buffer
assign btb_ifdp_way0_target[19:0] = (btb_mem_way0_valid)
                                  ? btb_mem_way0_target_pc[19:0]
                                  : btb_buf_target_pc[19:0];
assign btb_ifdp_way0_pred[1:0]    = (btb_mem_way0_valid)
                                  ? btb_mem_way0_way_pred[1:0]
                                  : btb_buf_way_pred[1:0];
assign btb_ifdp_way0_tag[9:0]     = (btb_mem_way0_valid)
                                  ? btb_mem_way0_tag_data[9:0]
                                  : btb_buf_tag_data[9:0];
assign btb_ifdp_way0_vld          = (btb_mem_way0_valid || btb_buf_valid) && 
                                    cp0_ifu_btb_en;
assign btb_ifdp_way1_target[19:0] = btb_mem_way1_target_pc[19:0];
assign btb_ifdp_way1_pred[1:0]    = btb_mem_way1_way_pred[1:0];
assign btb_ifdp_way1_tag[9:0]     = btb_mem_way1_tag_data[9:0];
assign btb_ifdp_way1_vld          = btb_mem_way1_valid && cp0_ifu_btb_en;

assign btb_ifdp_way2_target[19:0] = btb_mem_way2_target_pc[19:0];
assign btb_ifdp_way2_pred[1:0]    = btb_mem_way2_way_pred[1:0];
assign btb_ifdp_way2_tag[9:0]     = btb_mem_way2_tag_data[9:0];
assign btb_ifdp_way2_vld          = btb_mem_way2_valid && cp0_ifu_btb_en;

assign btb_ifdp_way3_target[19:0] = btb_mem_way3_target_pc[19:0];
assign btb_ifdp_way3_pred[1:0]    = btb_mem_way3_way_pred[1:0];
assign btb_ifdp_way3_tag[9:0]     = btb_mem_way3_tag_data[9:0];
assign btb_ifdp_way3_vld          = btb_mem_way3_valid && cp0_ifu_btb_en;

//==========================================================
//                     INV of BTB
//==========================================================
// &Instance("gated_clk_cell","x_btb_inv_reg_upd_clk"); @389
gated_clk_cell  x_btb_inv_reg_upd_clk (
  .clk_in                 (forever_cpuclk        ),
  .clk_out                (btb_inv_reg_upd_clk   ),
  .external_en            (1'b0                  ),
  .global_en              (cp0_yy_clk_en         ),
  .local_en               (btb_inv_reg_upd_clk_en),
  .module_en              (cp0_ifu_icg_en        ),
  .pad_yy_icg_scan_en     (pad_yy_icg_scan_en    )
);

// &Connect( .clk_in         (forever_cpuclk), @390
//           .clk_out        (btb_inv_reg_upd_clk),//Out Clock @391
//           .external_en    (1'b0), @392
//           .global_en      (cp0_yy_clk_en), @393
//           .local_en       (btb_inv_reg_upd_clk_en),//Local Condition @394
//           .module_en      (cp0_ifu_icg_en) @395
//         ); @396
assign btb_inv_reg_upd_clk_en = btb_inv_on_reg || ifctrl_btb_inv;

//------------------The Index of Inv------------------------
 parameter INV_CNT_VAL = 10'b0111111111;
always @(posedge btb_inv_reg_upd_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    btb_inval_cnt[9:0] <= 10'b0;
  else if(btb_inv_on_reg)
    btb_inval_cnt[9:0] <= btb_inval_cnt[9:0] - 10'b1;
  else if(ifctrl_btb_inv)
//csky vperl_off
    btb_inval_cnt[9:0] <= INV_CNT_VAL;
//csky vperl_on
  else
    btb_inval_cnt[9:0] <= btb_inval_cnt[9:0];
end


//-------------------Inv Status Reg-------------------------
always @(posedge btb_inv_reg_upd_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    btb_inv_on_reg <= 1'b0;
  else if(!(|btb_inval_cnt[9:0]) && btb_inv_on_reg)
    btb_inv_on_reg <= 1'b0;
  else if(ifctrl_btb_inv)
    btb_inv_on_reg <= 1'b1;
  else
    btb_inv_on_reg <= btb_inv_on_reg;
end

assign btb_ifctrl_inv_done = !btb_inv_on_reg;
assign btb_ifctrl_inv_on   = btb_inv_on_reg;

//==========================================================
//                 BTB Refill Buffer
//==========================================================
//CK860 BTB has a refill buffer, 
//which hold the info to be updated into BTB
//The reason why use refill buffer is that
//BTB hold icache way predict info, 
//while pre info can not be get at the same time with target PC
//Thus we use refill buffer hold the update info 
//for last BTB Miss or Way Mispredict
//And update it to BTB when BTB Miss or Way Mispredict next time
//Refill Hold Info as following:
//  1.index[9:0]
//  2.target_pc[19:0]
//  3.tag_pc[20:0]
//  4.way_pred[1:0]
//  5.refill_buf_vld
// &Instance("gated_clk_cell","x_refill_buf_updt_clk"); @453
gated_clk_cell  x_refill_buf_updt_clk (
  .clk_in                 (forever_cpuclk        ),
  .clk_out                (refill_buf_updt_clk   ),
  .external_en            (1'b0                  ),
  .global_en              (cp0_yy_clk_en         ),
  .local_en               (refill_buf_updt_clk_en),
  .module_en              (cp0_ifu_icg_en        ),
  .pad_yy_icg_scan_en     (pad_yy_icg_scan_en    )
);

// &Connect( .clk_in         (forever_cpuclk), @454
//           .clk_out        (refill_buf_updt_clk),//Out Clock @455
//           .external_en    (1'b0), @456
//           .global_en      (cp0_yy_clk_en), @457
//           .local_en       (refill_buf_updt_clk_en),//Local Condition @458
//           .module_en      (cp0_ifu_icg_en) @459
//         ); @460
assign refill_buf_updt_clk_en = btb_inv_on_reg || 
                                addrgen_btb_update_vld || 
                                ipctrl_btb_way_pred_error || 
                                ibdp_btb_miss || 
                                after_addrgen_btb_chgflw_first || 
                                after_addrgen_btb_chgflw_second;

//------------------refill buf index------------------------
always @(posedge refill_buf_updt_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
  refill_buf_index[9:0] <= 10'b0;
else if(btb_inv_on_reg)
  refill_buf_index[9:0] <= 10'b0;
else if(addrgen_btb_update_vld && !chgflw_higher_than_addrgen)
  refill_buf_index[9:0] <= addrgen_btb_index[9:0];//IB next cycle VPC
else if(ipctrl_btb_way_pred_error && !chgflw_higher_than_ip)
  refill_buf_index[9:0] <= btb_index_pc_record[12:3];
else
  refill_buf_index[9:0] <= refill_buf_index[9:0];
end

//------------------refill buf target_pc--------------------
always @(posedge refill_buf_updt_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    refill_buf_target_pc[19:0] <= 20'b0;
  else if(btb_inv_on_reg)
    refill_buf_target_pc[19:0] <= 20'b0;
  else if(addrgen_btb_update_vld && !chgflw_higher_than_addrgen)
    refill_buf_target_pc[19:0] <= addrgen_btb_target_pc[19:0];
  else if(ipctrl_btb_way_pred_error && !chgflw_higher_than_ip)
    refill_buf_target_pc[19:0] <= btb_target_pc_record[19:0];
  else
    refill_buf_target_pc[19:0] <= refill_buf_target_pc[19:0];
end

//------------------refill buf tag_pc-----------------------
always @(posedge refill_buf_updt_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    refill_buf_tag[9:0] <= 10'b0;
  else if(btb_inv_on_reg)
    refill_buf_tag[9:0] <= 10'b0;
  else if(addrgen_btb_update_vld && !chgflw_higher_than_addrgen)
    refill_buf_tag[9:0] <= addrgen_btb_tag[9:0];
  else if(ipctrl_btb_way_pred_error && !chgflw_higher_than_ip)
    refill_buf_tag[9:0] <= {btb_index_pc_record[19:13],btb_index_pc_record[2:0]};
  else
    refill_buf_tag[9:0] <= refill_buf_tag[9:0];
end

//------------------refill buf way_pred---------------------
always @(posedge refill_buf_updt_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    refill_buf_way_pred[1:0] <= 2'b11;
  else if(btb_inv_on_reg)
    refill_buf_way_pred[1:0] <= 2'b11;
  else if(btb_miss_way_pred_rd)//addrgen chgflw after 2 cycle
    refill_buf_way_pred[1:0] <= ipctrl_btb_way_pred[1:0];
  else if(ipctrl_btb_way_pred_error && !chgflw_higher_than_ip)
    refill_buf_way_pred[1:0] <= ipctrl_btb_way_pred[1:0];//IP use fifo bit form way_pred
  else
    refill_buf_way_pred[1:0] <= refill_buf_way_pred[1:0];
end

//------------------refill buf valid------------------------
always @(posedge refill_buf_updt_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    refill_buf_valid <= 1'b0;
  else if(btb_inv_on_reg)
    refill_buf_valid <= 1'b0;
  else if(btb_miss_way_pred_rd)//addrgen chgflw after 2 cycle
    refill_buf_valid <= 1'b1;
  else if(ipctrl_btb_way_pred_error && !chgflw_higher_than_ip)
    refill_buf_valid <= 1'b1;
  else if(ibdp_btb_miss && !chgflw_higher_than_ip || 
          addrgen_btb_update_vld)
    refill_buf_valid <= 1'b0;
  else
    refill_buf_valid <= refill_buf_valid;
end

assign refill_buf_updt_vld = (ibdp_btb_miss || 
                              ipctrl_btb_way_pred_error) && 
                              !chgflw_higher_than_ip && 
                              refill_buf_valid;

//when addrgen give BTB target PC
//2 cycle later will IP stage get icache way pred info
always @(posedge refill_buf_updt_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    after_addrgen_btb_chgflw_first <= 1'b0;
  else if(btb_inv_on_reg)
    after_addrgen_btb_chgflw_first <= 1'b0;
  else if(addrgen_btb_update_vld && !chgflw_higher_than_addrgen)
    after_addrgen_btb_chgflw_first <= 1'b1;
  else
    after_addrgen_btb_chgflw_first <= 1'b0;
end

always @(posedge refill_buf_updt_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    after_addrgen_btb_chgflw_second <= 1'b0;
  else if(btb_inv_on_reg)
    after_addrgen_btb_chgflw_second <= 1'b0;
  else if(after_addrgen_btb_chgflw_first && !chgflw_higher_than_if && !pcgen_stall)
    after_addrgen_btb_chgflw_second <= 1'b1;
  else
    after_addrgen_btb_chgflw_second <= 1'b0;
end

assign btb_miss_way_pred_rd = after_addrgen_btb_chgflw_second;

//-----------------pcgen trans signal-----------------------
assign chgflw_higher_than_ip      = pcgen_btb_chgflw_higher_than_ip;
assign chgflw_higher_than_addrgen = pcgen_btb_chgflw_higher_than_addrgen;
assign chgflw_higher_than_if      = pcgen_btb_chgflw_higher_than_if; 
assign pcgen_stall                = pcgen_btb_stall;

//==========================================================
//               Interface with Memory
//==========================================================
// &Instance("ct_ifu_btb_tag_array",  "x_ct_ifu_btb_tag_array"); @588
ct_ifu_btb_tag_array  x_ct_ifu_btb_tag_array (
  .btb_index          (btb_index         ),
  .btb_tag_cen_b      (btb_tag_cen_b     ),
  .btb_tag_clk_en     (btb_tag_clk_en    ),
  .btb_tag_din        (btb_tag_din       ),
  .btb_tag_dout       (btb_tag_dout      ),
  .btb_tag_wen        (btb_tag_wen       ),
  .cp0_ifu_icg_en     (cp0_ifu_icg_en    ),
  .cp0_yy_clk_en      (cp0_yy_clk_en     ),
  .forever_cpuclk     (forever_cpuclk    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Instance("ct_ifu_btb_data_array", "x_ct_ifu_btb_data_array"); @589
ct_ifu_btb_data_array  x_ct_ifu_btb_data_array (
  .btb_data_cen_b     (btb_data_cen_b    ),
  .btb_data_clk_en    (btb_data_clk_en   ),
  .btb_data_din       (btb_data_din      ),
  .btb_data_dout      (btb_data_dout     ),
  .btb_data_wen       (btb_data_wen      ),
  .btb_index          (btb_index         ),
  .cp0_ifu_icg_en     (cp0_ifu_icg_en    ),
  .cp0_yy_clk_en      (cp0_yy_clk_en     ),
  .forever_cpuclk     (forever_cpuclk    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &ModuleEnd; @591
endmodule


