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
module ct_ifu_ras(
  cp0_ifu_icg_en,
  cp0_ifu_ras_en,
  cp0_yy_clk_en,
  cp0_yy_priv_mode,
  cpurst_b,
  forever_cpuclk,
  ibctrl_ras_inst_pcall,
  ibctrl_ras_pcall_vld,
  ibctrl_ras_pcall_vld_for_gateclk,
  ibctrl_ras_preturn_vld,
  ibctrl_ras_preturn_vld_for_gateclk,
  ibdp_ras_push_pc,
  pad_yy_icg_scan_en,
  ras_ipdp_data_vld,
  ras_ipdp_pc,
  ras_l0_btb_pc,
  ras_l0_btb_push_pc,
  ras_l0_btb_ras_push,
  rtu_ifu_flush,
  rtu_ifu_retire0_inc_pc,
  rtu_ifu_retire0_mispred,
  rtu_ifu_retire0_pcall,
  rtu_ifu_retire0_preturn
);

// &Ports; @23
input           cp0_ifu_icg_en;                    
input           cp0_ifu_ras_en;                    
input           cp0_yy_clk_en;                     
input   [1 :0]  cp0_yy_priv_mode;                  
input           cpurst_b;                          
input           forever_cpuclk;                    
input           ibctrl_ras_inst_pcall;             
input           ibctrl_ras_pcall_vld;              
input           ibctrl_ras_pcall_vld_for_gateclk;  
input           ibctrl_ras_preturn_vld;            
input           ibctrl_ras_preturn_vld_for_gateclk; 
input   [38:0]  ibdp_ras_push_pc;                  
input           pad_yy_icg_scan_en;                
input           rtu_ifu_flush;                     
input   [38:0]  rtu_ifu_retire0_inc_pc;            
input           rtu_ifu_retire0_mispred;           
input           rtu_ifu_retire0_pcall;             
input           rtu_ifu_retire0_preturn;           
output          ras_ipdp_data_vld;                 
output  [38:0]  ras_ipdp_pc;                       
output  [38:0]  ras_l0_btb_pc;                     
output  [38:0]  ras_l0_btb_push_pc;                
output          ras_l0_btb_ras_push;               

// &Regs; @24
reg             ras_entry0_filled;                 
reg     [38:0]  ras_entry0_pc;                     
reg     [1 :0]  ras_entry0_priv_mode;              
reg             ras_entry10_filled;                
reg     [38:0]  ras_entry10_pc;                    
reg     [1 :0]  ras_entry10_priv_mode;             
reg             ras_entry11_filled;                
reg     [38:0]  ras_entry11_pc;                    
reg     [1 :0]  ras_entry11_priv_mode;             
reg             ras_entry1_filled;                 
reg     [38:0]  ras_entry1_pc;                     
reg     [1 :0]  ras_entry1_priv_mode;              
reg             ras_entry2_filled;                 
reg     [38:0]  ras_entry2_pc;                     
reg     [1 :0]  ras_entry2_priv_mode;              
reg             ras_entry3_filled;                 
reg     [38:0]  ras_entry3_pc;                     
reg     [1 :0]  ras_entry3_priv_mode;              
reg             ras_entry4_filled;                 
reg     [38:0]  ras_entry4_pc;                     
reg     [1 :0]  ras_entry4_priv_mode;              
reg             ras_entry5_filled;                 
reg     [38:0]  ras_entry5_pc;                     
reg     [1 :0]  ras_entry5_priv_mode;              
reg             ras_entry6_filled;                 
reg     [38:0]  ras_entry6_pc;                     
reg     [1 :0]  ras_entry6_priv_mode;              
reg             ras_entry7_filled;                 
reg     [38:0]  ras_entry7_pc;                     
reg     [1 :0]  ras_entry7_priv_mode;              
reg             ras_entry8_filled;                 
reg     [38:0]  ras_entry8_pc;                     
reg     [1 :0]  ras_entry8_priv_mode;              
reg             ras_entry9_filled;                 
reg     [38:0]  ras_entry9_pc;                     
reg     [1 :0]  ras_entry9_priv_mode;              
reg             ras_filled;                        
reg     [38:0]  ras_pc_out;                        
reg     [1 :0]  ras_priv_mode;                     
reg             rtu_entry0_filled;                 
reg     [38:0]  rtu_entry0_pc;                     
reg     [1 :0]  rtu_entry0_priv_mode;              
reg             rtu_entry1_filled;                 
reg     [38:0]  rtu_entry1_pc;                     
reg     [1 :0]  rtu_entry1_priv_mode;              
reg             rtu_entry2_filled;                 
reg     [38:0]  rtu_entry2_pc;                     
reg     [1 :0]  rtu_entry2_priv_mode;              
reg             rtu_entry3_filled;                 
reg     [38:0]  rtu_entry3_pc;                     
reg     [1 :0]  rtu_entry3_priv_mode;              
reg             rtu_entry4_filled;                 
reg     [38:0]  rtu_entry4_pc;                     
reg     [1 :0]  rtu_entry4_priv_mode;              
reg             rtu_entry5_filled;                 
reg     [38:0]  rtu_entry5_pc;                     
reg     [1 :0]  rtu_entry5_priv_mode;              
reg     [3 :0]  rtu_fifo_ptr;                      
reg     [4 :0]  rtu_ptr;                           
reg     [4 :0]  rtu_ptr_pre;                       
reg     [4 :0]  status_ptr;                        
reg     [4 :0]  top_ptr;                           
reg     [4 :0]  top_ptr_pre;                       

// &Wires; @25
wire            cp0_ifu_icg_en;                    
wire            cp0_ifu_ras_en;                    
wire            cp0_yy_clk_en;                     
wire    [1 :0]  cp0_yy_priv_mode;                  
wire            cpurst_b;                          
wire            entry0_push;                       
wire            entry10_push;                      
wire            entry11_push;                      
wire            entry1_push;                       
wire            entry2_push;                       
wire            entry3_push;                       
wire            entry4_push;                       
wire            entry5_push;                       
wire            entry6_push;                       
wire            entry7_push;                       
wire            entry8_push;                       
wire            entry9_push;                       
wire            forever_cpuclk;                    
wire            ibctrl_ras_inst_pcall;             
wire            ibctrl_ras_pcall_vld;              
wire            ibctrl_ras_pcall_vld_for_gateclk;  
wire            ibctrl_ras_preturn_vld;            
wire            ibctrl_ras_preturn_vld_for_gateclk; 
wire    [38:0]  ibdp_ras_push_pc;                  
wire            pad_yy_icg_scan_en;                
wire            ras_empty;                         
wire            ras_entry0_upd_clk;                
wire            ras_entry0_upd_clk_en;             
wire            ras_entry10_upd_clk;               
wire            ras_entry10_upd_clk_en;            
wire            ras_entry11_upd_clk;               
wire            ras_entry11_upd_clk_en;            
wire            ras_entry1_upd_clk;                
wire            ras_entry1_upd_clk_en;             
wire            ras_entry2_upd_clk;                
wire            ras_entry2_upd_clk_en;             
wire            ras_entry3_upd_clk;                
wire            ras_entry3_upd_clk_en;             
wire            ras_entry4_upd_clk;                
wire            ras_entry4_upd_clk_en;             
wire            ras_entry5_upd_clk;                
wire            ras_entry5_upd_clk_en;             
wire            ras_entry6_upd_clk;                
wire            ras_entry6_upd_clk_en;             
wire            ras_entry7_upd_clk;                
wire            ras_entry7_upd_clk_en;             
wire            ras_entry8_upd_clk;                
wire            ras_entry8_upd_clk_en;             
wire            ras_entry9_upd_clk;                
wire            ras_entry9_upd_clk_en;             
wire            ras_full;                          
wire            ras_ipdp_data_vld;                 
wire    [38:0]  ras_ipdp_pc;                       
wire    [38:0]  ras_l0_btb_pc;                     
wire    [38:0]  ras_l0_btb_push_pc;                
wire            ras_l0_btb_ras_push;               
wire            ras_pop;                           
wire            ras_push;                          
wire    [38:0]  ras_push_pc;                       
wire            rtu_entry0_copy;                   
wire    [38:0]  rtu_entry0_pre;                    
wire            rtu_entry0_push;                   
wire            rtu_entry0_upd_clk;                
wire            rtu_entry0_upd_clk_en;             
wire            rtu_entry10_copy;                  
wire            rtu_entry11_copy;                  
wire            rtu_entry1_copy;                   
wire    [38:0]  rtu_entry1_pre;                    
wire            rtu_entry1_push;                   
wire            rtu_entry1_upd_clk;                
wire            rtu_entry1_upd_clk_en;             
wire            rtu_entry2_copy;                   
wire    [38:0]  rtu_entry2_pre;                    
wire            rtu_entry2_push;                   
wire            rtu_entry2_upd_clk;                
wire            rtu_entry2_upd_clk_en;             
wire            rtu_entry3_copy;                   
wire    [38:0]  rtu_entry3_pre;                    
wire            rtu_entry3_push;                   
wire            rtu_entry3_upd_clk;                
wire            rtu_entry3_upd_clk_en;             
wire            rtu_entry4_copy;                   
wire    [38:0]  rtu_entry4_pre;                    
wire            rtu_entry4_push;                   
wire            rtu_entry4_upd_clk;                
wire            rtu_entry4_upd_clk_en;             
wire            rtu_entry5_copy;                   
wire    [38:0]  rtu_entry5_pre;                    
wire            rtu_entry5_push;                   
wire            rtu_entry5_upd_clk;                
wire            rtu_entry5_upd_clk_en;             
wire            rtu_entry6_copy;                   
wire            rtu_entry7_copy;                   
wire            rtu_entry8_copy;                   
wire            rtu_entry9_copy;                   
wire    [3 :0]  rtu_fifo_ptr_pre;                  
wire            rtu_fifo_ptr_upd_clk;              
wire            rtu_fifo_ptr_upd_clk_en;           
wire            rtu_ifu_flush;                     
wire    [38:0]  rtu_ifu_retire0_inc_pc;            
wire            rtu_ifu_retire0_mispred;           
wire            rtu_ifu_retire0_pcall;             
wire            rtu_ifu_retire0_preturn;           
wire            rtu_ptr_upd_clk;                   
wire            rtu_ptr_upd_clk_en;                
wire            rtu_ras_empty;                     
wire    [4 :0]  status_ptr_pre;                    
wire            status_ptr_upd_clk;                
wire            status_ptr_upd_clk_en;             
wire            top_entry_rtu_updt;                
wire            top_ptr_upd_clk;                   
wire            top_ptr_upd_clk_en;                


//CK 860 RAS has 12 + 6 Entry
//12 Top Entry maintained by IFU
//6  RTU Entry maintained by RTU

parameter PC_WIDTH = 40;
//==========================================================
//                    RTU RAS Pointer 
//==========================================================
//rtu ras pointer is maintained by rtu signal
//1.when inst pcall retires, this pointer add by one
//2.when inst preturn retires, this pointer sub by one
//pointer MSB is used to judge RAS empty logic
// &CombBeg; @39
always @( rtu_ptr[4:0]
       or rtu_ifu_retire0_pcall
       or rtu_ifu_retire0_preturn
       or rtu_ras_empty)
begin
if(rtu_ifu_retire0_pcall && rtu_ifu_retire0_preturn)
    rtu_ptr_pre[4:0] = rtu_ptr[4:0];
else if(rtu_ifu_retire0_pcall)
  if(rtu_ptr[3:0] == 4'b1011)
    rtu_ptr_pre[4:0] = {{~rtu_ptr[4]},4'b0000};
  else
    rtu_ptr_pre[4:0] = rtu_ptr[4:0] + 5'b1;
else if(rtu_ifu_retire0_preturn && !rtu_ras_empty)
  if(rtu_ptr[3:0] == 4'b0000)
    rtu_ptr_pre[4:0] = {{~rtu_ptr[4]},4'b1011};
  else
    rtu_ptr_pre[4:0] = rtu_ptr[4:0] - 5'b1;
else
    rtu_ptr_pre[4:0] = rtu_ptr[4:0];
// &CombEnd; @54
end
assign rtu_ras_empty = (rtu_ptr[4:0] == status_ptr[4:0]);

always @(posedge rtu_ptr_upd_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    rtu_ptr[4:0] <= 5'b0;
  else if(cp0_ifu_ras_en)
    rtu_ptr[4:0] <= rtu_ptr_pre[4:0];
  else
    rtu_ptr[4:0] <= rtu_ptr[4:0];
end

//Gate Clk
// &Instance("gated_clk_cell","x_rtu_ptr_upd_clk"); @68
gated_clk_cell  x_rtu_ptr_upd_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (rtu_ptr_upd_clk   ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (rtu_ptr_upd_clk_en),
  .module_en          (cp0_ifu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect( .clk_in         (forever_cpuclk), @69
//           .clk_out        (rtu_ptr_upd_clk),//Out Clock @70
//           .external_en    (1'b0), @71
//           .global_en      (cp0_yy_clk_en), @72
//           .local_en       (rtu_ptr_upd_clk_en),//Local Condition @73
//           .module_en      (cp0_ifu_icg_en) @74
//         ); @75
assign rtu_ptr_upd_clk_en = cp0_ifu_ras_en && 
                            (rtu_ifu_retire0_pcall || 
                             rtu_ifu_retire0_preturn);

//==========================================================
//                    TOP RAS Pointer 
//==========================================================
//top ras pointer is maintained by IFU
//1.when rtu_ifu ras update, load the value of rtu_ptr
//2.when inst jsr/bsr pre_decode, this pointer add by one
//3.when inst jmp r15/rts/pop pre_decode, this pointer sub by one
//pointer MSB is used to judge RAS empty logic
// &CombBeg; @88
always @( top_ptr[4:0]
       or ras_pop
       or ras_empty
       or top_entry_rtu_updt
       or rtu_ptr_pre[4:0]
       or ras_push)
begin
if(top_entry_rtu_updt)
  top_ptr_pre[4:0] = rtu_ptr_pre[4:0];
else if(ras_push && ras_pop)
  top_ptr_pre[4:0] = top_ptr[4:0];
else if(ras_push)
  if(top_ptr[3:0] == 4'b1011)
    top_ptr_pre[4:0] = {{~top_ptr[4]},4'b0000};
  else
    top_ptr_pre[4:0] = top_ptr[4:0] + 5'b1;
else if(ras_pop && !ras_empty)
  if(top_ptr[3:0] == 4'b0000)
    top_ptr_pre[4:0] = {{~top_ptr[4]},4'b1011};
  else
    top_ptr_pre[4:0] = top_ptr[4:0] - 5'b1;
else
    top_ptr_pre[4:0] = top_ptr[4:0];
// &CombEnd; @105
end

always @(posedge top_ptr_upd_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    top_ptr[4:0] <= 5'b0;
  else if(cp0_ifu_ras_en)
    top_ptr[4:0] <= top_ptr_pre[4:0];
  else
    top_ptr[4:0] <= top_ptr[4:0];
end

//Gate Clk
// &Instance("gated_clk_cell","x_top_ptr_upd_clk"); @118
gated_clk_cell  x_top_ptr_upd_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (top_ptr_upd_clk   ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (top_ptr_upd_clk_en),
  .module_en          (cp0_ifu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect( .clk_in         (forever_cpuclk), @119
//           .clk_out        (top_ptr_upd_clk),//Out Clock @120
//           .external_en    (1'b0), @121
//           .global_en      (cp0_yy_clk_en), @122
//           .local_en       (top_ptr_upd_clk_en),//Local Condition @123
//           .module_en      (cp0_ifu_icg_en) @124
//         ); @125
assign top_ptr_upd_clk_en = cp0_ifu_ras_en && 
                           (top_entry_rtu_updt || 
                            ibctrl_ras_pcall_vld_for_gateclk || 
                            ibctrl_ras_preturn_vld_for_gateclk);

assign top_entry_rtu_updt = rtu_ifu_retire0_mispred || 
                            rtu_ifu_flush;  
//==========================================================
//                   Status Pointer
//==========================================================
//the extra bit of pointer can be used to decide the full or empty state easily
//here,a 5-bit status counter is used to solve return stack overflow problem
//when return stack is full and pc is overwritten, this counter adds by one for
//example, when 13 consecutive procedual call will lead a result that the latest
//12 will return correctly, and return stack will be empty so the oldest one will
//get pc from x1 value from iu
assign status_ptr_pre[4:0] = (status_ptr[3:0] == 4'b1011)
                           ? {{~status_ptr[4]},4'b0000} 
                           : (status_ptr[4:0] + 1'b1);
always @(posedge status_ptr_upd_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    status_ptr[4:0] <= 5'b0;
  else if(cp0_ifu_ras_en && top_entry_rtu_updt)
  begin
    if(rtu_ptr_pre[4] ^ top_ptr[4])
      status_ptr[4:0] <= 5'b0;
    else
      status_ptr[4:0] <= {status_ptr[4],rtu_ptr_pre[3:0]};
  end
  else if(cp0_ifu_ras_en && ras_full && ras_push && ras_pop)
    status_ptr[4:0] <= status_ptr[4:0];
  else if(cp0_ifu_ras_en && ras_full && ras_push)
    status_ptr[4:0] <= status_ptr_pre[4:0];
  else if(cp0_ifu_ras_en && ras_full && ras_pop)
  begin
    if(status_ptr[3:0] == 4'b0)
      status_ptr[4:0] <= 5'b0;
    else
      status_ptr[4:0] <= status_ptr[4:0] - 5'b1;
  end
  else
    status_ptr[4:0] <= status_ptr[4:0];
end
assign ras_empty = (top_ptr[4:0] == status_ptr[4:0]);
assign ras_full  = (top_ptr[4:0] == {~status_ptr[4], status_ptr[3:0]});

//Gate Clk
// &Instance("gated_clk_cell","x_status_ptr_upd_clk"); @174
gated_clk_cell  x_status_ptr_upd_clk (
  .clk_in                (forever_cpuclk       ),
  .clk_out               (status_ptr_upd_clk   ),
  .external_en           (1'b0                 ),
  .global_en             (cp0_yy_clk_en        ),
  .local_en              (status_ptr_upd_clk_en),
  .module_en             (cp0_ifu_icg_en       ),
  .pad_yy_icg_scan_en    (pad_yy_icg_scan_en   )
);

// &Connect( .clk_in         (forever_cpuclk), @175
//           .clk_out        (status_ptr_upd_clk),//Out Clock @176
//           .external_en    (1'b0), @177
//           .global_en      (cp0_yy_clk_en), @178
//           .local_en       (status_ptr_upd_clk_en),//Local Condition @179
//           .module_en      (cp0_ifu_icg_en) @180
//         ); @181
assign status_ptr_upd_clk_en = cp0_ifu_ras_en && ras_full && ibctrl_ras_pcall_vld_for_gateclk|| 
                               cp0_ifu_ras_en && ras_full && ibctrl_ras_preturn_vld_for_gateclk  || 
                               cp0_ifu_ras_en && top_entry_rtu_updt;

//==========================================================
//                    RTU RAS FIFO
//==========================================================
// &Force("bus","rtu_ifu_retire0_inc_pc",38,0); @189
//rtu ras fifo entry write in logic
//rtu ras entry0
always @ (posedge rtu_entry0_upd_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    rtu_entry0_pc[PC_WIDTH-2:0] <= {PC_WIDTH-1{1'b0}};
  else if(cp0_ifu_ras_en && rtu_ifu_retire0_pcall && rtu_entry0_push)
    rtu_entry0_pc[PC_WIDTH-2:0] <= rtu_ifu_retire0_inc_pc[PC_WIDTH-2:0];
  else
    rtu_entry0_pc[PC_WIDTH-2:0] <= rtu_entry0_pc[PC_WIDTH-2:0];
end
always @ (posedge rtu_entry0_upd_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    rtu_entry0_filled <= 1'b0;
  else if(cp0_ifu_ras_en && rtu_ifu_retire0_pcall && rtu_entry0_push)
    rtu_entry0_filled <= 1'b1;
  else
    rtu_entry0_filled <= rtu_entry0_filled;
end

always @ (posedge rtu_entry0_upd_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    rtu_entry0_priv_mode[1:0] <= 2'b0;
  else if(cp0_ifu_ras_en && rtu_ifu_retire0_pcall && rtu_entry0_push)
    rtu_entry0_priv_mode[1:0] <= cp0_yy_priv_mode[1:0];
  else
    rtu_entry0_priv_mode[1:0] <= rtu_entry0_priv_mode[1:0];
end

assign rtu_entry0_push = (rtu_ptr[3:0] == 4'b0000) || 
                         (rtu_ptr[3:0] == 4'b0110);

//Gate Clk
// &Instance("gated_clk_cell","x_rtu_entry0_upd_clk"); @225
gated_clk_cell  x_rtu_entry0_upd_clk (
  .clk_in                (forever_cpuclk       ),
  .clk_out               (rtu_entry0_upd_clk   ),
  .external_en           (1'b0                 ),
  .global_en             (cp0_yy_clk_en        ),
  .local_en              (rtu_entry0_upd_clk_en),
  .module_en             (cp0_ifu_icg_en       ),
  .pad_yy_icg_scan_en    (pad_yy_icg_scan_en   )
);

// &Connect( .clk_in         (forever_cpuclk), @226
//           .clk_out        (rtu_entry0_upd_clk),//Out Clock @227
//           .external_en    (1'b0), @228
//           .global_en      (cp0_yy_clk_en), @229
//           .local_en       (rtu_entry0_upd_clk_en),//Local Condition @230
//           .module_en      (cp0_ifu_icg_en) @231
//         ); @232
assign rtu_entry0_upd_clk_en = cp0_ifu_ras_en && 
                               rtu_ifu_retire0_pcall && 
                               rtu_entry0_push;

//rtu ras entry1
always @ (posedge rtu_entry1_upd_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    rtu_entry1_pc[PC_WIDTH-2:0] <= {PC_WIDTH-1{1'b0}};
  else if(cp0_ifu_ras_en && rtu_ifu_retire0_pcall && rtu_entry1_push)
    rtu_entry1_pc[PC_WIDTH-2:0] <= rtu_ifu_retire0_inc_pc[PC_WIDTH-2:0];
  else
    rtu_entry1_pc[PC_WIDTH-2:0] <= rtu_entry1_pc[PC_WIDTH-2:0];
end
always @ (posedge rtu_entry1_upd_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    rtu_entry1_filled <= 1'b0;
  else if(cp0_ifu_ras_en && rtu_ifu_retire0_pcall && rtu_entry1_push)
    rtu_entry1_filled <= 1'b1;
  else
    rtu_entry1_filled <= rtu_entry1_filled;
end

always @ (posedge rtu_entry1_upd_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    rtu_entry1_priv_mode[1:0] <= 2'b0;
  else if(cp0_ifu_ras_en && rtu_ifu_retire0_pcall && rtu_entry1_push)
    rtu_entry1_priv_mode[1:0] <= cp0_yy_priv_mode[1:0];
  else
    rtu_entry1_priv_mode[1:0] <= rtu_entry1_priv_mode[1:0];
end


assign rtu_entry1_push = (rtu_ptr[3:0] == 4'b0001) || 
                         (rtu_ptr[3:0] == 4'b0111);

//Gate Clk
// &Instance("gated_clk_cell","x_rtu_entry1_upd_clk"); @272
gated_clk_cell  x_rtu_entry1_upd_clk (
  .clk_in                (forever_cpuclk       ),
  .clk_out               (rtu_entry1_upd_clk   ),
  .external_en           (1'b0                 ),
  .global_en             (cp0_yy_clk_en        ),
  .local_en              (rtu_entry1_upd_clk_en),
  .module_en             (cp0_ifu_icg_en       ),
  .pad_yy_icg_scan_en    (pad_yy_icg_scan_en   )
);

// &Connect( .clk_in         (forever_cpuclk), @273
//           .clk_out        (rtu_entry1_upd_clk),//Out Clock @274
//           .external_en    (1'b0), @275
//           .global_en      (cp0_yy_clk_en), @276
//           .local_en       (rtu_entry1_upd_clk_en),//Local Condition @277
//           .module_en      (cp0_ifu_icg_en) @278
//         ); @279
assign rtu_entry1_upd_clk_en = cp0_ifu_ras_en && 
                               rtu_ifu_retire0_pcall && 
                               rtu_entry1_push;

//rtu ras entry2
always @ (posedge rtu_entry2_upd_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    rtu_entry2_pc[PC_WIDTH-2:0] <= {PC_WIDTH-1{1'b0}};
  else if(cp0_ifu_ras_en && rtu_ifu_retire0_pcall && rtu_entry2_push)
    rtu_entry2_pc[PC_WIDTH-2:0] <= rtu_ifu_retire0_inc_pc[PC_WIDTH-2:0];
  else
    rtu_entry2_pc[PC_WIDTH-2:0] <= rtu_entry2_pc[PC_WIDTH-2:0];
end
always @ (posedge rtu_entry2_upd_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    rtu_entry2_filled <= 1'b0;
  else if(cp0_ifu_ras_en && rtu_ifu_retire0_pcall && rtu_entry2_push)
    rtu_entry2_filled <= 1'b1;
  else
    rtu_entry2_filled <= rtu_entry2_filled;
end

always @ (posedge rtu_entry2_upd_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    rtu_entry2_priv_mode[1:0] <= 2'b0;
  else if(cp0_ifu_ras_en && rtu_ifu_retire0_pcall && rtu_entry2_push)
    rtu_entry2_priv_mode[1:0] <= cp0_yy_priv_mode[1:0];
  else
    rtu_entry2_priv_mode[1:0] <= rtu_entry2_priv_mode[1:0];
end

assign rtu_entry2_push = (rtu_ptr[3:0] == 4'b0010) || 
                         (rtu_ptr[3:0] == 4'b1000);

//Gate Clk
// &Instance("gated_clk_cell","x_rtu_entry2_upd_clk"); @318
gated_clk_cell  x_rtu_entry2_upd_clk (
  .clk_in                (forever_cpuclk       ),
  .clk_out               (rtu_entry2_upd_clk   ),
  .external_en           (1'b0                 ),
  .global_en             (cp0_yy_clk_en        ),
  .local_en              (rtu_entry2_upd_clk_en),
  .module_en             (cp0_ifu_icg_en       ),
  .pad_yy_icg_scan_en    (pad_yy_icg_scan_en   )
);

// &Connect( .clk_in         (forever_cpuclk), @319
//           .clk_out        (rtu_entry2_upd_clk),//Out Clock @320
//           .external_en    (1'b0), @321
//           .global_en      (cp0_yy_clk_en), @322
//           .local_en       (rtu_entry2_upd_clk_en),//Local Condition @323
//           .module_en      (cp0_ifu_icg_en) @324
//         ); @325
assign rtu_entry2_upd_clk_en = cp0_ifu_ras_en && 
                               rtu_ifu_retire0_pcall && 
                               rtu_entry2_push;

//rtu ras entry3
always @ (posedge rtu_entry3_upd_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    rtu_entry3_pc[PC_WIDTH-2:0] <= {PC_WIDTH-1{1'b0}};
  else if(cp0_ifu_ras_en && rtu_ifu_retire0_pcall && rtu_entry3_push)
    rtu_entry3_pc[PC_WIDTH-2:0] <= rtu_ifu_retire0_inc_pc[PC_WIDTH-2:0];
  else
    rtu_entry3_pc[PC_WIDTH-2:0] <= rtu_entry3_pc[PC_WIDTH-2:0];
end
always @ (posedge rtu_entry3_upd_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    rtu_entry3_filled <= 1'b0;
  else if(cp0_ifu_ras_en && rtu_ifu_retire0_pcall && rtu_entry3_push)
    rtu_entry3_filled <= 1'b1;
  else
    rtu_entry3_filled <= rtu_entry3_filled;
end

always @ (posedge rtu_entry3_upd_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    rtu_entry3_priv_mode[1:0] <= 2'b0;
  else if(cp0_ifu_ras_en && rtu_ifu_retire0_pcall && rtu_entry3_push)
    rtu_entry3_priv_mode[1:0] <= cp0_yy_priv_mode[1:0];
  else
    rtu_entry3_priv_mode[1:0] <= rtu_entry3_priv_mode[1:0];
end

assign rtu_entry3_push = (rtu_ptr[3:0] == 4'b0011) || 
                         (rtu_ptr[3:0] == 4'b1001);

//Gate Clk
// &Instance("gated_clk_cell","x_rtu_entry3_upd_clk"); @364
gated_clk_cell  x_rtu_entry3_upd_clk (
  .clk_in                (forever_cpuclk       ),
  .clk_out               (rtu_entry3_upd_clk   ),
  .external_en           (1'b0                 ),
  .global_en             (cp0_yy_clk_en        ),
  .local_en              (rtu_entry3_upd_clk_en),
  .module_en             (cp0_ifu_icg_en       ),
  .pad_yy_icg_scan_en    (pad_yy_icg_scan_en   )
);

// &Connect( .clk_in         (forever_cpuclk), @365
//           .clk_out        (rtu_entry3_upd_clk),//Out Clock @366
//           .external_en    (1'b0), @367
//           .global_en      (cp0_yy_clk_en), @368
//           .local_en       (rtu_entry3_upd_clk_en),//Local Condition @369
//           .module_en      (cp0_ifu_icg_en) @370
//         ); @371
assign rtu_entry3_upd_clk_en = cp0_ifu_ras_en && 
                               rtu_ifu_retire0_pcall && 
                               rtu_entry3_push;

//rtu ras entry4
always @ (posedge rtu_entry4_upd_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    rtu_entry4_pc[PC_WIDTH-2:0] <= {PC_WIDTH-1{1'b0}};
  else if(cp0_ifu_ras_en && rtu_ifu_retire0_pcall && rtu_entry4_push)
    rtu_entry4_pc[PC_WIDTH-2:0] <= rtu_ifu_retire0_inc_pc[PC_WIDTH-2:0];
  else
    rtu_entry4_pc[PC_WIDTH-2:0] <= rtu_entry4_pc[PC_WIDTH-2:0];
end
always @ (posedge rtu_entry4_upd_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    rtu_entry4_filled <= 1'b0;
  else if(cp0_ifu_ras_en && rtu_ifu_retire0_pcall && rtu_entry4_push)
    rtu_entry4_filled <= 1'b1;
  else
    rtu_entry4_filled <= rtu_entry4_filled;
end

always @ (posedge rtu_entry4_upd_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    rtu_entry4_priv_mode[1:0] <= 2'b0;
  else if(cp0_ifu_ras_en && rtu_ifu_retire0_pcall && rtu_entry4_push)
    rtu_entry4_priv_mode[1:0] <= cp0_yy_priv_mode[1:0];
  else
    rtu_entry4_priv_mode[1:0] <= rtu_entry4_priv_mode[1:0];
end

assign rtu_entry4_push = (rtu_ptr[3:0] == 4'b0100) || 
                         (rtu_ptr[3:0] == 4'b1010);

//Gate Clk
// &Instance("gated_clk_cell","x_rtu_entry4_upd_clk"); @410
gated_clk_cell  x_rtu_entry4_upd_clk (
  .clk_in                (forever_cpuclk       ),
  .clk_out               (rtu_entry4_upd_clk   ),
  .external_en           (1'b0                 ),
  .global_en             (cp0_yy_clk_en        ),
  .local_en              (rtu_entry4_upd_clk_en),
  .module_en             (cp0_ifu_icg_en       ),
  .pad_yy_icg_scan_en    (pad_yy_icg_scan_en   )
);

// &Connect( .clk_in         (forever_cpuclk), @411
//           .clk_out        (rtu_entry4_upd_clk),//Out Clock @412
//           .external_en    (1'b0), @413
//           .global_en      (cp0_yy_clk_en), @414
//           .local_en       (rtu_entry4_upd_clk_en),//Local Condition @415
//           .module_en      (cp0_ifu_icg_en) @416
//         ); @417
assign rtu_entry4_upd_clk_en = cp0_ifu_ras_en && 
                               rtu_ifu_retire0_pcall && 
                               rtu_entry4_push;

//rtu ras entry5
always @ (posedge rtu_entry5_upd_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    rtu_entry5_pc[PC_WIDTH-2:0] <= {PC_WIDTH-1{1'b0}};
  else if(cp0_ifu_ras_en && rtu_ifu_retire0_pcall && rtu_entry5_push)
    rtu_entry5_pc[PC_WIDTH-2:0] <= rtu_ifu_retire0_inc_pc[PC_WIDTH-2:0];
  else
    rtu_entry5_pc[PC_WIDTH-2:0] <= rtu_entry5_pc[PC_WIDTH-2:0];
end
always @ (posedge rtu_entry5_upd_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    rtu_entry5_filled <= 1'b0;
  else if(cp0_ifu_ras_en && rtu_ifu_retire0_pcall && rtu_entry5_push)
    rtu_entry5_filled <= 1'b1;
  else
    rtu_entry5_filled <= rtu_entry5_filled;
end

always @ (posedge rtu_entry5_upd_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    rtu_entry5_priv_mode[1:0] <= 2'b0;
  else if(cp0_ifu_ras_en && rtu_ifu_retire0_pcall && rtu_entry5_push)
    rtu_entry5_priv_mode[1:0] <= cp0_yy_priv_mode[1:0];
  else
    rtu_entry5_priv_mode[1:0] <= rtu_entry5_priv_mode[1:0];
end

assign rtu_entry5_push = (rtu_ptr[3:0] == 4'b0101) || 
                         (rtu_ptr[3:0] == 4'b1011);

//Gate Clk
// &Instance("gated_clk_cell","x_rtu_entry5_upd_clk"); @456
gated_clk_cell  x_rtu_entry5_upd_clk (
  .clk_in                (forever_cpuclk       ),
  .clk_out               (rtu_entry5_upd_clk   ),
  .external_en           (1'b0                 ),
  .global_en             (cp0_yy_clk_en        ),
  .local_en              (rtu_entry5_upd_clk_en),
  .module_en             (cp0_ifu_icg_en       ),
  .pad_yy_icg_scan_en    (pad_yy_icg_scan_en   )
);

// &Connect( .clk_in         (forever_cpuclk), @457
//           .clk_out        (rtu_entry5_upd_clk),//Out Clock @458
//           .external_en    (1'b0), @459
//           .global_en      (cp0_yy_clk_en), @460
//           .local_en       (rtu_entry5_upd_clk_en),//Local Condition @461
//           .module_en      (cp0_ifu_icg_en) @462
//         ); @463
assign rtu_entry5_upd_clk_en = cp0_ifu_ras_en && 
                               rtu_ifu_retire0_pcall && 
                               rtu_entry5_push;

//==========================================================
//                    TOP RAS FIFO
//==========================================================
assign ras_push = ibctrl_ras_pcall_vld;
assign ras_push_pc[PC_WIDTH-2:0] = ibdp_ras_push_pc[PC_WIDTH-2:0];

//rtu_fifo_ptr[3:0]
always @(posedge rtu_fifo_ptr_upd_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    rtu_fifo_ptr[3:0] <= 4'b0;
  else if(cp0_ifu_ras_en && rtu_ifu_retire0_pcall)
    rtu_fifo_ptr[3:0] <= rtu_fifo_ptr_pre[3:0];
end

assign rtu_fifo_ptr_pre[3:0] = (rtu_ifu_retire0_pcall) 
                             ? rtu_ptr[3:0] 
                             : rtu_fifo_ptr[3:0];
//Gate Clk
// &Instance("gated_clk_cell","x_rtu_fifo_ptr_upd_clk"); @487
gated_clk_cell  x_rtu_fifo_ptr_upd_clk (
  .clk_in                  (forever_cpuclk         ),
  .clk_out                 (rtu_fifo_ptr_upd_clk   ),
  .external_en             (1'b0                   ),
  .global_en               (cp0_yy_clk_en          ),
  .local_en                (rtu_fifo_ptr_upd_clk_en),
  .module_en               (cp0_ifu_icg_en         ),
  .pad_yy_icg_scan_en      (pad_yy_icg_scan_en     )
);

// &Connect( .clk_in         (forever_cpuclk), @488
//           .clk_out        (rtu_fifo_ptr_upd_clk),//Out Clock @489
//           .external_en    (1'b0), @490
//           .global_en      (cp0_yy_clk_en), @491
//           .local_en       (rtu_fifo_ptr_upd_clk_en),//Local Condition @492
//           .module_en      (cp0_ifu_icg_en) @493
//         ); @494
assign rtu_fifo_ptr_upd_clk_en = cp0_ifu_ras_en && 
                                 rtu_ifu_retire0_pcall;

//top ras fifo entry write in logic
//top ras entry0
always @(posedge ras_entry0_upd_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ras_entry0_pc[PC_WIDTH-2:0] <= {PC_WIDTH-1{1'b0}};
  else if(top_entry_rtu_updt)
  begin
    if(rtu_entry0_copy)
      ras_entry0_pc[PC_WIDTH-2:0] <= rtu_entry0_pre[PC_WIDTH-2:0];
    else
      ras_entry0_pc[PC_WIDTH-2:0] <= ras_entry0_pc[PC_WIDTH-2:0];
  end
  else if(ras_push)
  begin
    if(entry0_push)
      ras_entry0_pc[PC_WIDTH-2:0] <= ras_push_pc[PC_WIDTH-2:0];
    else
      ras_entry0_pc[PC_WIDTH-2:0] <= ras_entry0_pc[PC_WIDTH-2:0];
  end
  else
    ras_entry0_pc[PC_WIDTH-2:0] <= ras_entry0_pc[PC_WIDTH-2:0];
end
always @(posedge ras_entry0_upd_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ras_entry0_filled <= 1'b0;
  else if(top_entry_rtu_updt && rtu_entry0_copy)
    ras_entry0_filled <= rtu_entry0_filled;
  else if(ras_push && entry0_push)
    ras_entry0_filled <= 1'b1;
  else
    ras_entry0_filled <= ras_entry0_filled;
end

always @ (posedge ras_entry0_upd_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ras_entry0_priv_mode[1:0] <= 2'b0;
  else if(top_entry_rtu_updt && rtu_entry0_copy)
    ras_entry0_priv_mode[1:0] <= rtu_entry0_priv_mode[1:0];
  else if(ras_push && entry0_push)
    ras_entry0_priv_mode[1:0] <= cp0_yy_priv_mode[1:0];
  else
    ras_entry0_priv_mode[1:0] <= ras_entry0_priv_mode[1:0];
end

assign rtu_entry0_pre[PC_WIDTH-2:0] = (rtu_ifu_retire0_pcall && 
                                       rtu_entry0_push)
                                    ? rtu_ifu_retire0_inc_pc[PC_WIDTH-2:0] 
                                    : rtu_entry0_pc[PC_WIDTH-2:0];
//only when entry0 is the last 6 entry used
//will it be updated by rtu entry copy value                             
assign rtu_entry0_copy = (rtu_fifo_ptr_pre[3:0] == 4'b0101) ||
                         (rtu_fifo_ptr_pre[3:0] == 4'b0100) ||
                         (rtu_fifo_ptr_pre[3:0] == 4'b0011) ||
                         (rtu_fifo_ptr_pre[3:0] == 4'b0010) ||
                         (rtu_fifo_ptr_pre[3:0] == 4'b0001) ||
                         (rtu_fifo_ptr_pre[3:0] == 4'b0000);
assign entry0_push = (top_ptr[3:0] == 4'b0000);    

//top ras entry1
always @(posedge ras_entry1_upd_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ras_entry1_pc[PC_WIDTH-2:0] <= {PC_WIDTH-1{1'b0}};
  else if(top_entry_rtu_updt)
  begin
    if(rtu_entry1_copy)
      ras_entry1_pc[PC_WIDTH-2:0] <= rtu_entry1_pre[PC_WIDTH-2:0];
    else
      ras_entry1_pc[PC_WIDTH-2:0] <= ras_entry1_pc[PC_WIDTH-2:0];
  end
  else if(ras_push)
  begin
    if(entry1_push)
      ras_entry1_pc[PC_WIDTH-2:0] <= ras_push_pc[PC_WIDTH-2:0];
    else
      ras_entry1_pc[PC_WIDTH-2:0] <= ras_entry1_pc[PC_WIDTH-2:0];
  end
  else
    ras_entry1_pc[PC_WIDTH-2:0] <= ras_entry1_pc[PC_WIDTH-2:0];
end
always @(posedge ras_entry1_upd_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ras_entry1_filled <= 1'b0;
  else if(top_entry_rtu_updt && rtu_entry1_copy)
    ras_entry1_filled <= rtu_entry1_filled;
  else if(ras_push && entry1_push)
    ras_entry1_filled <= 1'b1;
  else
    ras_entry1_filled <= ras_entry1_filled;
end

always @ (posedge ras_entry1_upd_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ras_entry1_priv_mode[1:0] <= 2'b0;
  else if(top_entry_rtu_updt && rtu_entry1_copy)
    ras_entry1_priv_mode[1:0] <= rtu_entry1_priv_mode[1:0];
  else if(ras_push && entry1_push)
    ras_entry1_priv_mode[1:0] <= cp0_yy_priv_mode[1:0];
  else
    ras_entry1_priv_mode[1:0] <= ras_entry1_priv_mode[1:0];
end

assign rtu_entry1_pre[PC_WIDTH-2:0] = (rtu_ifu_retire0_pcall && 
                                       rtu_entry1_push)
                                    ? rtu_ifu_retire0_inc_pc[PC_WIDTH-2:0] 
                                    : rtu_entry1_pc[PC_WIDTH-2:0];
//only when entry1 is the last 6 entry used
//will it be updated by rtu entry copy value                             
assign rtu_entry1_copy = (rtu_fifo_ptr_pre[3:0] == 4'b0110) ||
                         (rtu_fifo_ptr_pre[3:0] == 4'b0101) ||
                         (rtu_fifo_ptr_pre[3:0] == 4'b0100) ||
                         (rtu_fifo_ptr_pre[3:0] == 4'b0011) ||
                         (rtu_fifo_ptr_pre[3:0] == 4'b0010) ||
                         (rtu_fifo_ptr_pre[3:0] == 4'b0001);
assign entry1_push = (top_ptr[3:0] == 4'b0001);    

//top ras entry2
always @(posedge ras_entry2_upd_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ras_entry2_pc[PC_WIDTH-2:0] <= {PC_WIDTH-1{1'b0}};
  else if(top_entry_rtu_updt)
  begin
    if(rtu_entry2_copy)
      ras_entry2_pc[PC_WIDTH-2:0] <= rtu_entry2_pre[PC_WIDTH-2:0];
    else
      ras_entry2_pc[PC_WIDTH-2:0] <= ras_entry2_pc[PC_WIDTH-2:0];
  end
  else if(ras_push)
  begin
    if(entry2_push)
      ras_entry2_pc[PC_WIDTH-2:0] <= ras_push_pc[PC_WIDTH-2:0];
    else
      ras_entry2_pc[PC_WIDTH-2:0] <= ras_entry2_pc[PC_WIDTH-2:0];
  end
  else
    ras_entry2_pc[PC_WIDTH-2:0] <= ras_entry2_pc[PC_WIDTH-2:0];
end
always @(posedge ras_entry2_upd_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ras_entry2_filled <= 1'b0;
  else if(top_entry_rtu_updt && rtu_entry2_copy)
    ras_entry2_filled <= rtu_entry2_filled;
  else if(ras_push && entry2_push)
    ras_entry2_filled <= 1'b1;
  else
    ras_entry2_filled <= ras_entry2_filled;
end

always @ (posedge ras_entry2_upd_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ras_entry2_priv_mode[1:0] <= 2'b0;
  else if(top_entry_rtu_updt && rtu_entry2_copy)
    ras_entry2_priv_mode[1:0] <= rtu_entry2_priv_mode[1:0];
  else if(ras_push && entry2_push)
    ras_entry2_priv_mode[1:0] <= cp0_yy_priv_mode[1:0];
  else
    ras_entry2_priv_mode[1:0] <= ras_entry2_priv_mode[1:0];
end

assign rtu_entry2_pre[PC_WIDTH-2:0] = (rtu_ifu_retire0_pcall && 
                                       rtu_entry2_push)
                                    ? rtu_ifu_retire0_inc_pc[PC_WIDTH-2:0] 
                                    : rtu_entry2_pc[PC_WIDTH-2:0];
//only when entry2 is the last 6 entry used
//will it be updated by rtu entry copy value                             
assign rtu_entry2_copy = (rtu_fifo_ptr_pre[3:0] == 4'b0111) ||
                         (rtu_fifo_ptr_pre[3:0] == 4'b0110) ||
                         (rtu_fifo_ptr_pre[3:0] == 4'b0101) ||
                         (rtu_fifo_ptr_pre[3:0] == 4'b0100) ||
                         (rtu_fifo_ptr_pre[3:0] == 4'b0011) ||
                         (rtu_fifo_ptr_pre[3:0] == 4'b0010);
assign entry2_push = (top_ptr[3:0] == 4'b0010);    

//top ras entry3
always @(posedge ras_entry3_upd_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ras_entry3_pc[PC_WIDTH-2:0] <= {PC_WIDTH-1{1'b0}};
  else if(top_entry_rtu_updt)
  begin
    if(rtu_entry3_copy)
      ras_entry3_pc[PC_WIDTH-2:0] <= rtu_entry3_pre[PC_WIDTH-2:0];
    else
      ras_entry3_pc[PC_WIDTH-2:0] <= ras_entry3_pc[PC_WIDTH-2:0];
  end
  else if(ras_push)
  begin
    if(entry3_push)
      ras_entry3_pc[PC_WIDTH-2:0] <= ras_push_pc[PC_WIDTH-2:0];
    else
      ras_entry3_pc[PC_WIDTH-2:0] <= ras_entry3_pc[PC_WIDTH-2:0];
  end
  else
    ras_entry3_pc[PC_WIDTH-2:0] <= ras_entry3_pc[PC_WIDTH-2:0];
end
always @(posedge ras_entry3_upd_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ras_entry3_filled <= 1'b0;
  else if(top_entry_rtu_updt && rtu_entry3_copy)
    ras_entry3_filled <= rtu_entry3_filled;
  else if(ras_push && entry3_push)
    ras_entry3_filled <= 1'b1;
  else
    ras_entry3_filled <= ras_entry3_filled;
end

always @ (posedge ras_entry3_upd_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ras_entry3_priv_mode[1:0] <= 2'b0;
  else if(top_entry_rtu_updt && rtu_entry3_copy)
    ras_entry3_priv_mode[1:0] <= rtu_entry3_priv_mode[1:0];
  else if(ras_push && entry3_push)
    ras_entry3_priv_mode[1:0] <= cp0_yy_priv_mode[1:0];
  else
    ras_entry3_priv_mode[1:0] <= ras_entry3_priv_mode[1:0];
end

assign rtu_entry3_pre[PC_WIDTH-2:0] = (rtu_ifu_retire0_pcall && 
                                       rtu_entry3_push)
                                    ? rtu_ifu_retire0_inc_pc[PC_WIDTH-2:0] 
                                    : rtu_entry3_pc[PC_WIDTH-2:0];
//only when entry3 is the last 6 entry used
//will it be updated by rtu entry copy value                             
assign rtu_entry3_copy = (rtu_fifo_ptr_pre[3:0] == 4'b1000) ||
                         (rtu_fifo_ptr_pre[3:0] == 4'b0111) ||
                         (rtu_fifo_ptr_pre[3:0] == 4'b0110) ||
                         (rtu_fifo_ptr_pre[3:0] == 4'b0101) ||
                         (rtu_fifo_ptr_pre[3:0] == 4'b0100) ||
                         (rtu_fifo_ptr_pre[3:0] == 4'b0011);
assign entry3_push = (top_ptr[3:0] == 4'b0011);    

//top ras entry4
always @(posedge ras_entry4_upd_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ras_entry4_pc[PC_WIDTH-2:0] <= {PC_WIDTH-1{1'b0}};
  else if(top_entry_rtu_updt)
  begin
    if(rtu_entry4_copy)
      ras_entry4_pc[PC_WIDTH-2:0] <= rtu_entry4_pre[PC_WIDTH-2:0];
    else
      ras_entry4_pc[PC_WIDTH-2:0] <= ras_entry4_pc[PC_WIDTH-2:0];
  end
  else if(ras_push)
  begin
    if(entry4_push)
      ras_entry4_pc[PC_WIDTH-2:0] <= ras_push_pc[PC_WIDTH-2:0];
    else
      ras_entry4_pc[PC_WIDTH-2:0] <= ras_entry4_pc[PC_WIDTH-2:0];
  end
  else
    ras_entry4_pc[PC_WIDTH-2:0] <= ras_entry4_pc[PC_WIDTH-2:0];
end
always @(posedge ras_entry4_upd_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ras_entry4_filled <= 1'b0;
  else if(top_entry_rtu_updt && rtu_entry4_copy)
    ras_entry4_filled <= rtu_entry4_filled;
  else if(ras_push && entry4_push)
    ras_entry4_filled <= 1'b1;
  else
    ras_entry4_filled <= ras_entry4_filled;
end

always @ (posedge ras_entry4_upd_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ras_entry4_priv_mode[1:0] <= 2'b0;
  else if(top_entry_rtu_updt && rtu_entry4_copy)
    ras_entry4_priv_mode[1:0] <= rtu_entry4_priv_mode[1:0];
  else if(ras_push && entry4_push)
    ras_entry4_priv_mode[1:0] <= cp0_yy_priv_mode[1:0];
  else
    ras_entry4_priv_mode[1:0] <= ras_entry4_priv_mode[1:0];
end

assign rtu_entry4_pre[PC_WIDTH-2:0] = (rtu_ifu_retire0_pcall && 
                                       rtu_entry4_push)
                                    ? rtu_ifu_retire0_inc_pc[PC_WIDTH-2:0] 
                                    : rtu_entry4_pc[PC_WIDTH-2:0];
//only when entry4 is the last 6 entry used
//will it be updated by rtu entry copy value                             
assign rtu_entry4_copy = (rtu_fifo_ptr_pre[3:0] == 4'b1001) ||
                         (rtu_fifo_ptr_pre[3:0] == 4'b1000) ||
                         (rtu_fifo_ptr_pre[3:0] == 4'b0111) ||
                         (rtu_fifo_ptr_pre[3:0] == 4'b0110) ||
                         (rtu_fifo_ptr_pre[3:0] == 4'b0101) ||
                         (rtu_fifo_ptr_pre[3:0] == 4'b0100);
assign entry4_push = (top_ptr[3:0] == 4'b0100);    

//top ras entry5
always @(posedge ras_entry5_upd_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ras_entry5_pc[PC_WIDTH-2:0] <= {PC_WIDTH-1{1'b0}};
  else if(top_entry_rtu_updt)
  begin
    if(rtu_entry5_copy)
      ras_entry5_pc[PC_WIDTH-2:0] <= rtu_entry5_pre[PC_WIDTH-2:0];
    else
      ras_entry5_pc[PC_WIDTH-2:0] <= ras_entry5_pc[PC_WIDTH-2:0];
  end
  else if(ras_push)
  begin
    if(entry5_push)
      ras_entry5_pc[PC_WIDTH-2:0] <= ras_push_pc[PC_WIDTH-2:0];
    else
      ras_entry5_pc[PC_WIDTH-2:0] <= ras_entry5_pc[PC_WIDTH-2:0];
  end
  else
    ras_entry5_pc[PC_WIDTH-2:0] <= ras_entry5_pc[PC_WIDTH-2:0];
end
always @(posedge ras_entry5_upd_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ras_entry5_filled <= 1'b0;
  else if(top_entry_rtu_updt && rtu_entry5_copy)
    ras_entry5_filled <= rtu_entry5_filled;
  else if(ras_push && entry5_push)
    ras_entry5_filled <= 1'b1;
  else
    ras_entry5_filled <= ras_entry5_filled;
end

always @ (posedge ras_entry5_upd_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ras_entry5_priv_mode[1:0] <= 2'b0;
  else if(top_entry_rtu_updt && rtu_entry5_copy)
    ras_entry5_priv_mode[1:0] <= rtu_entry5_priv_mode[1:0];
  else if(ras_push && entry5_push)
    ras_entry5_priv_mode[1:0] <= cp0_yy_priv_mode[1:0];
  else
    ras_entry5_priv_mode[1:0] <= ras_entry5_priv_mode[1:0];
end

assign rtu_entry5_pre[PC_WIDTH-2:0] = (rtu_ifu_retire0_pcall && 
                                       rtu_entry5_push)
                                    ? rtu_ifu_retire0_inc_pc[PC_WIDTH-2:0] 
                                    : rtu_entry5_pc[PC_WIDTH-2:0];
//only when entry5 is the last 6 entry used
//will it be updated by rtu entry copy value                             
assign rtu_entry5_copy = (rtu_fifo_ptr_pre[3:0] == 4'b1010) ||
                         (rtu_fifo_ptr_pre[3:0] == 4'b1001) ||
                         (rtu_fifo_ptr_pre[3:0] == 4'b1000) ||
                         (rtu_fifo_ptr_pre[3:0] == 4'b0111) ||
                         (rtu_fifo_ptr_pre[3:0] == 4'b0110) ||
                         (rtu_fifo_ptr_pre[3:0] == 4'b0101);
assign entry5_push = (top_ptr[3:0] == 4'b0101);    

//top ras entry6
always @(posedge ras_entry6_upd_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ras_entry6_pc[PC_WIDTH-2:0] <= {PC_WIDTH-1{1'b0}};
  else if(top_entry_rtu_updt)
  begin
    if(rtu_entry6_copy)
      ras_entry6_pc[PC_WIDTH-2:0] <= rtu_entry0_pre[PC_WIDTH-2:0];
    else
      ras_entry6_pc[PC_WIDTH-2:0] <= ras_entry6_pc[PC_WIDTH-2:0];
  end
  else if(ras_push)
  begin
    if(entry6_push)
      ras_entry6_pc[PC_WIDTH-2:0] <= ras_push_pc[PC_WIDTH-2:0];
    else
      ras_entry6_pc[PC_WIDTH-2:0] <= ras_entry6_pc[PC_WIDTH-2:0];
  end
  else
    ras_entry6_pc[PC_WIDTH-2:0] <= ras_entry6_pc[PC_WIDTH-2:0];
end
always @(posedge ras_entry6_upd_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ras_entry6_filled <= 1'b0;
  else if(top_entry_rtu_updt && rtu_entry6_copy)
    ras_entry6_filled <= rtu_entry0_filled;
  else if(ras_push && entry6_push)
    ras_entry6_filled <= 1'b1;
  else
    ras_entry6_filled <= ras_entry6_filled;
end

always @ (posedge ras_entry6_upd_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ras_entry6_priv_mode[1:0] <= 2'b0;
  else if(top_entry_rtu_updt && rtu_entry6_copy)
    ras_entry6_priv_mode[1:0] <= rtu_entry0_priv_mode[1:0];
  else if(ras_push && entry6_push)
    ras_entry6_priv_mode[1:0] <= cp0_yy_priv_mode[1:0];
  else
    ras_entry6_priv_mode[1:0] <= ras_entry6_priv_mode[1:0];
end

//only when entry6 is the last 6 entry used
//will it be updated by rtu entry copy value                             
assign rtu_entry6_copy = (rtu_fifo_ptr_pre[3:0] == 4'b1011) ||
                         (rtu_fifo_ptr_pre[3:0] == 4'b1010) ||
                         (rtu_fifo_ptr_pre[3:0] == 4'b1001) ||
                         (rtu_fifo_ptr_pre[3:0] == 4'b1000) ||
                         (rtu_fifo_ptr_pre[3:0] == 4'b0111) ||
                         (rtu_fifo_ptr_pre[3:0] == 4'b0110);
assign entry6_push = (top_ptr[3:0] == 4'b0110);    

//top ras entry7
always @(posedge ras_entry7_upd_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ras_entry7_pc[PC_WIDTH-2:0] <= {PC_WIDTH-1{1'b0}};
  else if(top_entry_rtu_updt)
  begin
    if(rtu_entry7_copy)
      ras_entry7_pc[PC_WIDTH-2:0] <= rtu_entry1_pre[PC_WIDTH-2:0];
    else
      ras_entry7_pc[PC_WIDTH-2:0] <= ras_entry7_pc[PC_WIDTH-2:0];
  end
  else if(ras_push)
  begin
    if(entry7_push)
      ras_entry7_pc[PC_WIDTH-2:0] <= ras_push_pc[PC_WIDTH-2:0];
    else
      ras_entry7_pc[PC_WIDTH-2:0] <= ras_entry7_pc[PC_WIDTH-2:0];
  end
  else
    ras_entry7_pc[PC_WIDTH-2:0] <= ras_entry7_pc[PC_WIDTH-2:0];
end
always @(posedge ras_entry7_upd_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ras_entry7_filled <= 1'b0;
  else if(top_entry_rtu_updt && rtu_entry7_copy)
    ras_entry7_filled <= rtu_entry1_filled;
  else if(ras_push && entry7_push)
    ras_entry7_filled <= 1'b1;
  else
    ras_entry7_filled <= ras_entry7_filled;
end

always @ (posedge ras_entry7_upd_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ras_entry7_priv_mode[1:0] <= 2'b0;
  else if(top_entry_rtu_updt && rtu_entry7_copy)
    ras_entry7_priv_mode[1:0] <= rtu_entry1_priv_mode[1:0];
  else if(ras_push && entry7_push)
    ras_entry7_priv_mode[1:0] <= cp0_yy_priv_mode[1:0];
  else
    ras_entry7_priv_mode[1:0] <= ras_entry7_priv_mode[1:0];
end

//only when entry7 is the last 6 entry used
//will it be updated by rtu entry copy value                             
assign rtu_entry7_copy = (rtu_fifo_ptr_pre[3:0] == 4'b0000) ||
                         (rtu_fifo_ptr_pre[3:0] == 4'b1011) ||
                         (rtu_fifo_ptr_pre[3:0] == 4'b1010) ||
                         (rtu_fifo_ptr_pre[3:0] == 4'b1001) ||
                         (rtu_fifo_ptr_pre[3:0] == 4'b1000) ||
                         (rtu_fifo_ptr_pre[3:0] == 4'b0111);
assign entry7_push = (top_ptr[3:0] == 4'b0111);    

//top ras entry8
always @(posedge ras_entry8_upd_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ras_entry8_pc[PC_WIDTH-2:0] <= {PC_WIDTH-1{1'b0}};
  else if(top_entry_rtu_updt)
  begin
    if(rtu_entry8_copy)
      ras_entry8_pc[PC_WIDTH-2:0] <= rtu_entry2_pre[PC_WIDTH-2:0];
    else
      ras_entry8_pc[PC_WIDTH-2:0] <= ras_entry8_pc[PC_WIDTH-2:0];
  end
  else if(ras_push)
  begin
    if(entry8_push)
      ras_entry8_pc[PC_WIDTH-2:0] <= ras_push_pc[PC_WIDTH-2:0];
    else
      ras_entry8_pc[PC_WIDTH-2:0] <= ras_entry8_pc[PC_WIDTH-2:0];
  end
  else
    ras_entry8_pc[PC_WIDTH-2:0] <= ras_entry8_pc[PC_WIDTH-2:0];
end
always @(posedge ras_entry8_upd_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ras_entry8_filled <= 1'b0;
  else if(top_entry_rtu_updt && rtu_entry8_copy)
    ras_entry8_filled <= rtu_entry2_filled;
  else if(ras_push && entry8_push)
    ras_entry8_filled <= 1'b1;
  else
    ras_entry8_filled <= ras_entry8_filled;
end

always @ (posedge ras_entry8_upd_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ras_entry8_priv_mode[1:0] <= 2'b0;
  else if(top_entry_rtu_updt && rtu_entry8_copy)
    ras_entry8_priv_mode[1:0] <= rtu_entry2_priv_mode[1:0];
  else if(ras_push && entry8_push)
    ras_entry8_priv_mode[1:0] <= cp0_yy_priv_mode[1:0];
  else
    ras_entry8_priv_mode[1:0] <= ras_entry8_priv_mode[1:0];
end

//only when entry8 is the last 6 entry used
//will it be updated by rtu entry copy value                             
assign rtu_entry8_copy = (rtu_fifo_ptr_pre[3:0] == 4'b0001) ||
                         (rtu_fifo_ptr_pre[3:0] == 4'b0000) ||
                         (rtu_fifo_ptr_pre[3:0] == 4'b1011) ||
                         (rtu_fifo_ptr_pre[3:0] == 4'b1010) ||
                         (rtu_fifo_ptr_pre[3:0] == 4'b1001) ||
                         (rtu_fifo_ptr_pre[3:0] == 4'b1000);
assign entry8_push = (top_ptr[3:0] == 4'b1000);    

//top ras entry9
always @(posedge ras_entry9_upd_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ras_entry9_pc[PC_WIDTH-2:0] <= {PC_WIDTH-1{1'b0}};
  else if(top_entry_rtu_updt)
  begin
    if(rtu_entry9_copy)
      ras_entry9_pc[PC_WIDTH-2:0] <= rtu_entry3_pre[PC_WIDTH-2:0];
    else
      ras_entry9_pc[PC_WIDTH-2:0] <= ras_entry9_pc[PC_WIDTH-2:0];
  end
  else if(ras_push)
  begin
    if(entry9_push)
      ras_entry9_pc[PC_WIDTH-2:0] <= ras_push_pc[PC_WIDTH-2:0];
    else
      ras_entry9_pc[PC_WIDTH-2:0] <= ras_entry9_pc[PC_WIDTH-2:0];
  end
  else
    ras_entry9_pc[PC_WIDTH-2:0] <= ras_entry9_pc[PC_WIDTH-2:0];
end
always @(posedge ras_entry9_upd_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ras_entry9_filled <= 1'b0;
  else if(top_entry_rtu_updt && rtu_entry9_copy)
    ras_entry9_filled <= rtu_entry3_filled;
  else if(ras_push && entry9_push)
    ras_entry9_filled <= 1'b1;
  else
    ras_entry9_filled <= ras_entry9_filled;
end

always @ (posedge ras_entry9_upd_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ras_entry9_priv_mode[1:0] <= 2'b0;
  else if(top_entry_rtu_updt && rtu_entry9_copy)
    ras_entry9_priv_mode[1:0] <= rtu_entry3_priv_mode[1:0];
  else if(ras_push && entry9_push)
    ras_entry9_priv_mode[1:0] <= cp0_yy_priv_mode[1:0];
  else
    ras_entry9_priv_mode[1:0] <= ras_entry9_priv_mode[1:0];
end

//only when entry9 is the last 6 entry used
//will it be updated by rtu entry copy value                             
assign rtu_entry9_copy = (rtu_fifo_ptr_pre[3:0] == 4'b0010) ||
                         (rtu_fifo_ptr_pre[3:0] == 4'b0001) ||
                         (rtu_fifo_ptr_pre[3:0] == 4'b0000) ||
                         (rtu_fifo_ptr_pre[3:0] == 4'b1011) ||
                         (rtu_fifo_ptr_pre[3:0] == 4'b1010) ||
                         (rtu_fifo_ptr_pre[3:0] == 4'b1001);
assign entry9_push = (top_ptr[3:0] == 4'b1001);    

//top ras entry10
always @(posedge ras_entry10_upd_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ras_entry10_pc[PC_WIDTH-2:0] <= {PC_WIDTH-1{1'b0}};
  else if(top_entry_rtu_updt)
  begin
    if(rtu_entry10_copy)
      ras_entry10_pc[PC_WIDTH-2:0] <= rtu_entry4_pre[PC_WIDTH-2:0];
    else
      ras_entry10_pc[PC_WIDTH-2:0] <= ras_entry10_pc[PC_WIDTH-2:0];
  end
  else if(ras_push)
  begin
    if(entry10_push)
      ras_entry10_pc[PC_WIDTH-2:0] <= ras_push_pc[PC_WIDTH-2:0];
    else
      ras_entry10_pc[PC_WIDTH-2:0] <= ras_entry10_pc[PC_WIDTH-2:0];
  end
  else
    ras_entry10_pc[PC_WIDTH-2:0] <= ras_entry10_pc[PC_WIDTH-2:0];
end
always @(posedge ras_entry10_upd_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ras_entry10_filled <= 1'b0;
  else if(top_entry_rtu_updt && rtu_entry10_copy)
    ras_entry10_filled <= rtu_entry4_filled;
  else if(ras_push && entry10_push)
    ras_entry10_filled <= 1'b1;
  else
    ras_entry10_filled <= ras_entry10_filled;
end

always @ (posedge ras_entry10_upd_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ras_entry10_priv_mode[1:0] <= 2'b0;
  else if(top_entry_rtu_updt && rtu_entry10_copy)
    ras_entry10_priv_mode[1:0] <= rtu_entry4_priv_mode[1:0];
  else if(ras_push && entry10_push)
    ras_entry10_priv_mode[1:0] <= cp0_yy_priv_mode[1:0];
  else
    ras_entry10_priv_mode[1:0] <= ras_entry10_priv_mode[1:0];
end

//only when entry10 is the last 6 entry used
//will it be updated by rtu entry copy value                             
assign rtu_entry10_copy = (rtu_fifo_ptr_pre[3:0] == 4'b0011) ||
                          (rtu_fifo_ptr_pre[3:0] == 4'b0010) ||
                          (rtu_fifo_ptr_pre[3:0] == 4'b0001) ||
                          (rtu_fifo_ptr_pre[3:0] == 4'b0000) ||
                          (rtu_fifo_ptr_pre[3:0] == 4'b1011) ||
                          (rtu_fifo_ptr_pre[3:0] == 4'b1010);
assign entry10_push = (top_ptr[3:0] == 4'b1010);    

//top ras entry11
always @(posedge ras_entry11_upd_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ras_entry11_pc[PC_WIDTH-2:0] <= {PC_WIDTH-1{1'b0}};
  else if(top_entry_rtu_updt)
  begin
    if(rtu_entry11_copy)
      ras_entry11_pc[PC_WIDTH-2:0] <= rtu_entry5_pre[PC_WIDTH-2:0];
    else
      ras_entry11_pc[PC_WIDTH-2:0] <= ras_entry11_pc[PC_WIDTH-2:0];
  end
  else if(ras_push)
  begin
    if(entry11_push)
      ras_entry11_pc[PC_WIDTH-2:0] <= ras_push_pc[PC_WIDTH-2:0];
    else
      ras_entry11_pc[PC_WIDTH-2:0] <= ras_entry11_pc[PC_WIDTH-2:0];
  end
  else
    ras_entry11_pc[PC_WIDTH-2:0] <= ras_entry11_pc[PC_WIDTH-2:0];
end
always @(posedge ras_entry11_upd_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ras_entry11_filled <= 1'b0;
  else if(top_entry_rtu_updt && rtu_entry11_copy)
    ras_entry11_filled <= rtu_entry5_filled;
  else if(ras_push && entry11_push)
    ras_entry11_filled <= 1'b1;
  else
    ras_entry11_filled <= ras_entry11_filled;
end

always @ (posedge ras_entry11_upd_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ras_entry11_priv_mode[1:0] <= 2'b0;
  else if(top_entry_rtu_updt && rtu_entry11_copy)
    ras_entry11_priv_mode[1:0] <= rtu_entry5_priv_mode[1:0];
  else if(ras_push && entry11_push)
    ras_entry11_priv_mode[1:0] <= cp0_yy_priv_mode[1:0];
  else
    ras_entry11_priv_mode[1:0] <= ras_entry11_priv_mode[1:0];
end

//only when entry11 is the last 6 entry used
//will it be updated by rtu entry copy value                             
assign rtu_entry11_copy = (rtu_fifo_ptr_pre[3:0] == 4'b0100) ||
                          (rtu_fifo_ptr_pre[3:0] == 4'b0011) ||
                          (rtu_fifo_ptr_pre[3:0] == 4'b0010) ||
                          (rtu_fifo_ptr_pre[3:0] == 4'b0001) ||
                          (rtu_fifo_ptr_pre[3:0] == 4'b0000) ||
                          (rtu_fifo_ptr_pre[3:0] == 4'b1011);
assign entry11_push = (top_ptr[3:0] == 4'b1011);    

//----------------ras entry update gate clk-----------------
//Gate Clk - ras_entry0_upd_clk
// &Instance("gated_clk_cell","x_ras_entry0_upd_clk"); @1197
gated_clk_cell  x_ras_entry0_upd_clk (
  .clk_in                (forever_cpuclk       ),
  .clk_out               (ras_entry0_upd_clk   ),
  .external_en           (1'b0                 ),
  .global_en             (cp0_yy_clk_en        ),
  .local_en              (ras_entry0_upd_clk_en),
  .module_en             (cp0_ifu_icg_en       ),
  .pad_yy_icg_scan_en    (pad_yy_icg_scan_en   )
);

// &Connect( .clk_in         (forever_cpuclk), @1198
//           .clk_out        (ras_entry0_upd_clk),//Out Clock @1199
//           .external_en    (1'b0), @1200
//           .global_en      (cp0_yy_clk_en), @1201
//           .local_en       (ras_entry0_upd_clk_en),//Local Condition @1202
//           .module_en      (cp0_ifu_icg_en) @1203
//         ); @1204
assign ras_entry0_upd_clk_en = cp0_ifu_ras_en && 
                               (top_entry_rtu_updt && rtu_entry0_copy || 
                                ibctrl_ras_pcall_vld_for_gateclk && entry0_push);

//Gate Clk - ras_entry1_upd_clk
// &Instance("gated_clk_cell","x_ras_entry1_upd_clk"); @1210
gated_clk_cell  x_ras_entry1_upd_clk (
  .clk_in                (forever_cpuclk       ),
  .clk_out               (ras_entry1_upd_clk   ),
  .external_en           (1'b0                 ),
  .global_en             (cp0_yy_clk_en        ),
  .local_en              (ras_entry1_upd_clk_en),
  .module_en             (cp0_ifu_icg_en       ),
  .pad_yy_icg_scan_en    (pad_yy_icg_scan_en   )
);

// &Connect( .clk_in         (forever_cpuclk), @1211
//           .clk_out        (ras_entry1_upd_clk),//Out Clock @1212
//           .external_en    (1'b0), @1213
//           .global_en      (cp0_yy_clk_en), @1214
//           .local_en       (ras_entry1_upd_clk_en),//Local Condition @1215
//           .module_en      (cp0_ifu_icg_en) @1216
//         ); @1217
assign ras_entry1_upd_clk_en = cp0_ifu_ras_en && 
                               (top_entry_rtu_updt && rtu_entry1_copy || 
                                ibctrl_ras_pcall_vld_for_gateclk && entry1_push);

//Gate Clk - ras_entry2_upd_clk
// &Instance("gated_clk_cell","x_ras_entry2_upd_clk"); @1223
gated_clk_cell  x_ras_entry2_upd_clk (
  .clk_in                (forever_cpuclk       ),
  .clk_out               (ras_entry2_upd_clk   ),
  .external_en           (1'b0                 ),
  .global_en             (cp0_yy_clk_en        ),
  .local_en              (ras_entry2_upd_clk_en),
  .module_en             (cp0_ifu_icg_en       ),
  .pad_yy_icg_scan_en    (pad_yy_icg_scan_en   )
);

// &Connect( .clk_in         (forever_cpuclk), @1224
//           .clk_out        (ras_entry2_upd_clk),//Out Clock @1225
//           .external_en    (1'b0), @1226
//           .global_en      (cp0_yy_clk_en), @1227
//           .local_en       (ras_entry2_upd_clk_en),//Local Condition @1228
//           .module_en      (cp0_ifu_icg_en) @1229
//         ); @1230
assign ras_entry2_upd_clk_en = cp0_ifu_ras_en && 
                               (top_entry_rtu_updt && rtu_entry2_copy || 
                                ibctrl_ras_pcall_vld_for_gateclk && entry2_push);

//Gate Clk - ras_entry3_upd_clk
// &Instance("gated_clk_cell","x_ras_entry3_upd_clk"); @1236
gated_clk_cell  x_ras_entry3_upd_clk (
  .clk_in                (forever_cpuclk       ),
  .clk_out               (ras_entry3_upd_clk   ),
  .external_en           (1'b0                 ),
  .global_en             (cp0_yy_clk_en        ),
  .local_en              (ras_entry3_upd_clk_en),
  .module_en             (cp0_ifu_icg_en       ),
  .pad_yy_icg_scan_en    (pad_yy_icg_scan_en   )
);

// &Connect( .clk_in         (forever_cpuclk), @1237
//           .clk_out        (ras_entry3_upd_clk),//Out Clock @1238
//           .external_en    (1'b0), @1239
//           .global_en      (cp0_yy_clk_en), @1240
//           .local_en       (ras_entry3_upd_clk_en),//Local Condition @1241
//           .module_en      (cp0_ifu_icg_en) @1242
//         ); @1243
assign ras_entry3_upd_clk_en = cp0_ifu_ras_en && 
                               (top_entry_rtu_updt && rtu_entry3_copy || 
                                ibctrl_ras_pcall_vld_for_gateclk && entry3_push);

//Gate Clk - ras_entry4_upd_clk
// &Instance("gated_clk_cell","x_ras_entry4_upd_clk"); @1249
gated_clk_cell  x_ras_entry4_upd_clk (
  .clk_in                (forever_cpuclk       ),
  .clk_out               (ras_entry4_upd_clk   ),
  .external_en           (1'b0                 ),
  .global_en             (cp0_yy_clk_en        ),
  .local_en              (ras_entry4_upd_clk_en),
  .module_en             (cp0_ifu_icg_en       ),
  .pad_yy_icg_scan_en    (pad_yy_icg_scan_en   )
);

// &Connect( .clk_in         (forever_cpuclk), @1250
//           .clk_out        (ras_entry4_upd_clk),//Out Clock @1251
//           .external_en    (1'b0), @1252
//           .global_en      (cp0_yy_clk_en), @1253
//           .local_en       (ras_entry4_upd_clk_en),//Local Condition @1254
//           .module_en      (cp0_ifu_icg_en) @1255
//         ); @1256
assign ras_entry4_upd_clk_en = cp0_ifu_ras_en && 
                               (top_entry_rtu_updt && rtu_entry4_copy || 
                                ibctrl_ras_pcall_vld_for_gateclk && entry4_push);

//Gate Clk - ras_entry5_upd_clk
// &Instance("gated_clk_cell","x_ras_entry5_upd_clk"); @1262
gated_clk_cell  x_ras_entry5_upd_clk (
  .clk_in                (forever_cpuclk       ),
  .clk_out               (ras_entry5_upd_clk   ),
  .external_en           (1'b0                 ),
  .global_en             (cp0_yy_clk_en        ),
  .local_en              (ras_entry5_upd_clk_en),
  .module_en             (cp0_ifu_icg_en       ),
  .pad_yy_icg_scan_en    (pad_yy_icg_scan_en   )
);

// &Connect( .clk_in         (forever_cpuclk), @1263
//           .clk_out        (ras_entry5_upd_clk),//Out Clock @1264
//           .external_en    (1'b0), @1265
//           .global_en      (cp0_yy_clk_en), @1266
//           .local_en       (ras_entry5_upd_clk_en),//Local Condition @1267
//           .module_en      (cp0_ifu_icg_en) @1268
//         ); @1269
assign ras_entry5_upd_clk_en = cp0_ifu_ras_en && 
                               (top_entry_rtu_updt && rtu_entry5_copy || 
                                ibctrl_ras_pcall_vld_for_gateclk && entry5_push);

//Gate Clk - ras_entry6_upd_clk
// &Instance("gated_clk_cell","x_ras_entry6_upd_clk"); @1275
gated_clk_cell  x_ras_entry6_upd_clk (
  .clk_in                (forever_cpuclk       ),
  .clk_out               (ras_entry6_upd_clk   ),
  .external_en           (1'b0                 ),
  .global_en             (cp0_yy_clk_en        ),
  .local_en              (ras_entry6_upd_clk_en),
  .module_en             (cp0_ifu_icg_en       ),
  .pad_yy_icg_scan_en    (pad_yy_icg_scan_en   )
);

// &Connect( .clk_in         (forever_cpuclk), @1276
//           .clk_out        (ras_entry6_upd_clk),//Out Clock @1277
//           .external_en    (1'b0), @1278
//           .global_en      (cp0_yy_clk_en), @1279
//           .local_en       (ras_entry6_upd_clk_en),//Local Condition @1280
//           .module_en      (cp0_ifu_icg_en) @1281
//         ); @1282
assign ras_entry6_upd_clk_en = cp0_ifu_ras_en && 
                               (top_entry_rtu_updt && rtu_entry6_copy || 
                                ibctrl_ras_pcall_vld_for_gateclk && entry6_push);

//Gate Clk - ras_entry7_upd_clk
// &Instance("gated_clk_cell","x_ras_entry7_upd_clk"); @1288
gated_clk_cell  x_ras_entry7_upd_clk (
  .clk_in                (forever_cpuclk       ),
  .clk_out               (ras_entry7_upd_clk   ),
  .external_en           (1'b0                 ),
  .global_en             (cp0_yy_clk_en        ),
  .local_en              (ras_entry7_upd_clk_en),
  .module_en             (cp0_ifu_icg_en       ),
  .pad_yy_icg_scan_en    (pad_yy_icg_scan_en   )
);

// &Connect( .clk_in         (forever_cpuclk), @1289
//           .clk_out        (ras_entry7_upd_clk),//Out Clock @1290
//           .external_en    (1'b0), @1291
//           .global_en      (cp0_yy_clk_en), @1292
//           .local_en       (ras_entry7_upd_clk_en),//Local Condition @1293
//           .module_en      (cp0_ifu_icg_en) @1294
//         ); @1295
assign ras_entry7_upd_clk_en = cp0_ifu_ras_en && 
                               (top_entry_rtu_updt && rtu_entry7_copy || 
                                ibctrl_ras_pcall_vld_for_gateclk && entry7_push);

//Gate Clk - ras_entry8_upd_clk
// &Instance("gated_clk_cell","x_ras_entry8_upd_clk"); @1301
gated_clk_cell  x_ras_entry8_upd_clk (
  .clk_in                (forever_cpuclk       ),
  .clk_out               (ras_entry8_upd_clk   ),
  .external_en           (1'b0                 ),
  .global_en             (cp0_yy_clk_en        ),
  .local_en              (ras_entry8_upd_clk_en),
  .module_en             (cp0_ifu_icg_en       ),
  .pad_yy_icg_scan_en    (pad_yy_icg_scan_en   )
);

// &Connect( .clk_in         (forever_cpuclk), @1302
//           .clk_out        (ras_entry8_upd_clk),//Out Clock @1303
//           .external_en    (1'b0), @1304
//           .global_en      (cp0_yy_clk_en), @1305
//           .local_en       (ras_entry8_upd_clk_en),//Local Condition @1306
//           .module_en      (cp0_ifu_icg_en) @1307
//         ); @1308
assign ras_entry8_upd_clk_en = cp0_ifu_ras_en && 
                               (top_entry_rtu_updt && rtu_entry8_copy || 
                                ibctrl_ras_pcall_vld_for_gateclk && entry8_push);

//Gate Clk - ras_entry9_upd_clk
// &Instance("gated_clk_cell","x_ras_entry9_upd_clk"); @1314
gated_clk_cell  x_ras_entry9_upd_clk (
  .clk_in                (forever_cpuclk       ),
  .clk_out               (ras_entry9_upd_clk   ),
  .external_en           (1'b0                 ),
  .global_en             (cp0_yy_clk_en        ),
  .local_en              (ras_entry9_upd_clk_en),
  .module_en             (cp0_ifu_icg_en       ),
  .pad_yy_icg_scan_en    (pad_yy_icg_scan_en   )
);

// &Connect( .clk_in         (forever_cpuclk), @1315
//           .clk_out        (ras_entry9_upd_clk),//Out Clock @1316
//           .external_en    (1'b0), @1317
//           .global_en      (cp0_yy_clk_en), @1318
//           .local_en       (ras_entry9_upd_clk_en),//Local Condition @1319
//           .module_en      (cp0_ifu_icg_en) @1320
//         ); @1321
assign ras_entry9_upd_clk_en = cp0_ifu_ras_en && 
                               (top_entry_rtu_updt && rtu_entry9_copy || 
                                ibctrl_ras_pcall_vld_for_gateclk && entry9_push);

//Gate Clk - ras_entry10_upd_clk
// &Instance("gated_clk_cell","x_ras_entry10_upd_clk"); @1327
gated_clk_cell  x_ras_entry10_upd_clk (
  .clk_in                 (forever_cpuclk        ),
  .clk_out                (ras_entry10_upd_clk   ),
  .external_en            (1'b0                  ),
  .global_en              (cp0_yy_clk_en         ),
  .local_en               (ras_entry10_upd_clk_en),
  .module_en              (cp0_ifu_icg_en        ),
  .pad_yy_icg_scan_en     (pad_yy_icg_scan_en    )
);

// &Connect( .clk_in         (forever_cpuclk), @1328
//           .clk_out        (ras_entry10_upd_clk),//Out Clock @1329
//           .external_en    (1'b0), @1330
//           .global_en      (cp0_yy_clk_en), @1331
//           .local_en       (ras_entry10_upd_clk_en),//Local Condition @1332
//           .module_en      (cp0_ifu_icg_en) @1333
//         ); @1334
assign ras_entry10_upd_clk_en = cp0_ifu_ras_en && 
                                (top_entry_rtu_updt && rtu_entry10_copy || 
                                 ibctrl_ras_pcall_vld_for_gateclk && entry10_push);

//Gate Clk - ras_entry11_upd_clk
// &Instance("gated_clk_cell","x_ras_entry11_upd_clk"); @1340
gated_clk_cell  x_ras_entry11_upd_clk (
  .clk_in                 (forever_cpuclk        ),
  .clk_out                (ras_entry11_upd_clk   ),
  .external_en            (1'b0                  ),
  .global_en              (cp0_yy_clk_en         ),
  .local_en               (ras_entry11_upd_clk_en),
  .module_en              (cp0_ifu_icg_en        ),
  .pad_yy_icg_scan_en     (pad_yy_icg_scan_en    )
);

// &Connect( .clk_in         (forever_cpuclk), @1341
//           .clk_out        (ras_entry11_upd_clk),//Out Clock @1342
//           .external_en    (1'b0), @1343
//           .global_en      (cp0_yy_clk_en), @1344
//           .local_en       (ras_entry11_upd_clk_en),//Local Condition @1345
//           .module_en      (cp0_ifu_icg_en) @1346
//         ); @1347
assign ras_entry11_upd_clk_en = cp0_ifu_ras_en && 
                                (top_entry_rtu_updt && rtu_entry11_copy || 
                                 ibctrl_ras_pcall_vld_for_gateclk && entry11_push);

//==========================================================
//                    POP PC from RAS
//==========================================================
assign ras_pop = ibctrl_ras_preturn_vld;
// &CombBeg; @1356
always @( ras_entry8_pc[38:0]
       or ras_entry3_pc[38:0]
       or ras_entry9_pc[38:0]
       or ras_entry5_pc[38:0]
       or ras_entry1_pc[38:0]
       or ras_entry0_pc[38:0]
       or ras_entry11_pc[38:0]
       or top_ptr[3:0]
       or ras_entry4_pc[38:0]
       or ras_entry6_pc[38:0]
       or ras_entry10_pc[38:0]
       or ras_entry2_pc[38:0]
       or ras_entry7_pc[38:0])
begin
case(top_ptr[3:0])
  4'b0001 : ras_pc_out[PC_WIDTH-2:0] = ras_entry0_pc[PC_WIDTH-2:0];
  4'b0010 : ras_pc_out[PC_WIDTH-2:0] = ras_entry1_pc[PC_WIDTH-2:0];
  4'b0011 : ras_pc_out[PC_WIDTH-2:0] = ras_entry2_pc[PC_WIDTH-2:0];
  4'b0100 : ras_pc_out[PC_WIDTH-2:0] = ras_entry3_pc[PC_WIDTH-2:0];
  4'b0101 : ras_pc_out[PC_WIDTH-2:0] = ras_entry4_pc[PC_WIDTH-2:0];
  4'b0110 : ras_pc_out[PC_WIDTH-2:0] = ras_entry5_pc[PC_WIDTH-2:0];
  4'b0111 : ras_pc_out[PC_WIDTH-2:0] = ras_entry6_pc[PC_WIDTH-2:0];
  4'b1000 : ras_pc_out[PC_WIDTH-2:0] = ras_entry7_pc[PC_WIDTH-2:0];
  4'b1001 : ras_pc_out[PC_WIDTH-2:0] = ras_entry8_pc[PC_WIDTH-2:0];
  4'b1010 : ras_pc_out[PC_WIDTH-2:0] = ras_entry9_pc[PC_WIDTH-2:0];
  4'b1011 : ras_pc_out[PC_WIDTH-2:0] = ras_entry10_pc[PC_WIDTH-2:0];
  4'b0000 : ras_pc_out[PC_WIDTH-2:0] = ras_entry11_pc[PC_WIDTH-2:0];
  default : ras_pc_out[PC_WIDTH-2:0] = ras_entry0_pc[PC_WIDTH-2:0];
endcase
// &CombEnd; @1372
end
// &CombBeg; @1373
always @( ras_entry10_filled
       or ras_entry2_filled
       or ras_entry0_filled
       or ras_entry3_filled
       or ras_entry5_filled
       or ras_entry4_filled
       or ras_entry11_filled
       or top_ptr[3:0]
       or ras_entry1_filled
       or ras_entry9_filled
       or ras_entry6_filled
       or ras_entry8_filled
       or ras_entry7_filled)
begin
case(top_ptr[3:0])
  4'b0001 : ras_filled = ras_entry0_filled;
  4'b0010 : ras_filled = ras_entry1_filled;
  4'b0011 : ras_filled = ras_entry2_filled;
  4'b0100 : ras_filled = ras_entry3_filled;
  4'b0101 : ras_filled = ras_entry4_filled;
  4'b0110 : ras_filled = ras_entry5_filled;
  4'b0111 : ras_filled = ras_entry6_filled;
  4'b1000 : ras_filled = ras_entry7_filled;
  4'b1001 : ras_filled = ras_entry8_filled;
  4'b1010 : ras_filled = ras_entry9_filled;
  4'b1011 : ras_filled = ras_entry10_filled;
  4'b0000 : ras_filled = ras_entry11_filled;
  default : ras_filled = ras_entry0_filled;
endcase
// &CombEnd; @1389
end

// &CombBeg; @1391
always @( ras_entry9_priv_mode[1:0]
       or ras_entry7_priv_mode[1:0]
       or ras_entry3_priv_mode[1:0]
       or ras_entry1_priv_mode[1:0]
       or ras_entry8_priv_mode[1:0]
       or ras_entry0_priv_mode[1:0]
       or ras_entry5_priv_mode[1:0]
       or ras_entry10_priv_mode[1:0]
       or top_ptr[3:0]
       or ras_entry11_priv_mode[1:0]
       or ras_entry6_priv_mode[1:0]
       or ras_entry2_priv_mode[1:0]
       or ras_entry4_priv_mode[1:0])
begin
case(top_ptr[3:0])
  4'b0001 : ras_priv_mode[1:0] = ras_entry0_priv_mode[1:0];
  4'b0010 : ras_priv_mode[1:0] = ras_entry1_priv_mode[1:0];
  4'b0011 : ras_priv_mode[1:0] = ras_entry2_priv_mode[1:0];
  4'b0100 : ras_priv_mode[1:0] = ras_entry3_priv_mode[1:0];
  4'b0101 : ras_priv_mode[1:0] = ras_entry4_priv_mode[1:0];
  4'b0110 : ras_priv_mode[1:0] = ras_entry5_priv_mode[1:0];
  4'b0111 : ras_priv_mode[1:0] = ras_entry6_priv_mode[1:0];
  4'b1000 : ras_priv_mode[1:0] = ras_entry7_priv_mode[1:0];
  4'b1001 : ras_priv_mode[1:0] = ras_entry8_priv_mode[1:0];
  4'b1010 : ras_priv_mode[1:0] = ras_entry9_priv_mode[1:0];
  4'b1011 : ras_priv_mode[1:0] = ras_entry10_priv_mode[1:0];
  4'b0000 : ras_priv_mode[1:0] = ras_entry11_priv_mode[1:0];
  default : ras_priv_mode[1:0] = ras_entry0_priv_mode[1:0];
endcase
// &CombEnd; @1407
end


//ibctrl_ras_pc[PC_WIDTH-2:0] used for created into pcfifo
assign ras_ipdp_data_vld = (!ras_empty 
                            && ras_filled 
                            && (cp0_yy_priv_mode[1:0] == ras_priv_mode[1:0]) 
                            || ras_push) 
                         && cp0_ifu_ras_en;
assign ras_ipdp_pc[PC_WIDTH-2:0] = (ibctrl_ras_inst_pcall)
                                 ? ibdp_ras_push_pc[PC_WIDTH-2:0]
                                 : ras_pc_out[PC_WIDTH-2:0];
assign ras_l0_btb_ras_push              = ras_push && cp0_ifu_ras_en;
assign ras_l0_btb_push_pc[PC_WIDTH-2:0] = ibdp_ras_push_pc[PC_WIDTH-2:0];
assign ras_l0_btb_pc[PC_WIDTH-2:0]      = ras_pc_out[PC_WIDTH-2:0];





// &ModuleEnd; @1429
endmodule


