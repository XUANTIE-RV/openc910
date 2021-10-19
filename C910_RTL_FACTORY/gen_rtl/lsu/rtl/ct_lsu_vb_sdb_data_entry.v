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
module ct_lsu_vb_sdb_data_entry(
  cp0_lsu_icg_en,
  cpurst_b,
  forever_cpuclk,
  ld_da_data256,
  ld_da_vb_borrow_vb_x,
  pad_yy_icg_scan_en,
  sdb_create_data_order,
  sdb_create_en_x,
  sdb_data_vld_x,
  sdb_entry_avail_x,
  sdb_entry_data_index,
  sdb_entry_data_v,
  sdb_inv_en_x,
  sdb_vld_x,
  snq_data_bypass_hit_x,
  snq_vb_bypass_invalid_x,
  snq_vb_bypass_readonce,
  snq_vb_bypass_start_x,
  vb_data_entry_addr_id_v,
  vb_data_entry_biu_req_success_x,
  vb_data_entry_biu_req_x,
  vb_data_entry_bypass_pop_x,
  vb_data_entry_create_dp_vld_x,
  vb_data_entry_create_gateclk_en_x,
  vb_data_entry_create_vld_x,
  vb_data_entry_dirty_x,
  vb_data_entry_inv_x,
  vb_data_entry_lfb_create_x,
  vb_data_entry_normal_pop_x,
  vb_data_entry_req_success_x,
  vb_data_entry_vld_x,
  vb_data_entry_wd_sm_grnt_x,
  vb_data_entry_wd_sm_req_x,
  vb_data_entry_write_data128_v,
  vb_rcl_sm_addr_id,
  vb_rcl_sm_data_dcache_dirty,
  vb_rcl_sm_data_set_data_done_x,
  vb_rcl_sm_inv,
  vb_rcl_sm_lfb_create,
  vb_sdb_data_entry_vld_x,
  vb_wd_sm_data_bias,
  vb_wd_sm_data_pop_req_x
);

// &Ports; @28
input            cp0_lsu_icg_en;                   
input            cpurst_b;                         
input            forever_cpuclk;                   
input   [255:0]  ld_da_data256;                    
input            ld_da_vb_borrow_vb_x;             
input            pad_yy_icg_scan_en;               
input   [1  :0]  sdb_create_data_order;            
input            sdb_create_en_x;                  
input   [3  :0]  sdb_entry_data_index;             
input            sdb_inv_en_x;                     
input            snq_data_bypass_hit_x;            
input            snq_vb_bypass_invalid_x;          
input            snq_vb_bypass_readonce;           
input            snq_vb_bypass_start_x;            
input            vb_data_entry_biu_req_success_x;  
input            vb_data_entry_create_dp_vld_x;    
input            vb_data_entry_create_gateclk_en_x; 
input            vb_data_entry_create_vld_x;       
input            vb_data_entry_wd_sm_grnt_x;       
input   [1  :0]  vb_rcl_sm_addr_id;                
input            vb_rcl_sm_data_dcache_dirty;      
input            vb_rcl_sm_data_set_data_done_x;   
input            vb_rcl_sm_inv;                    
input            vb_rcl_sm_lfb_create;             
input   [3  :0]  vb_wd_sm_data_bias;               
input            vb_wd_sm_data_pop_req_x;          
output           sdb_data_vld_x;                   
output           sdb_entry_avail_x;                
output  [127:0]  sdb_entry_data_v;                 
output           sdb_vld_x;                        
output  [1  :0]  vb_data_entry_addr_id_v;          
output           vb_data_entry_biu_req_x;          
output           vb_data_entry_bypass_pop_x;       
output           vb_data_entry_dirty_x;            
output           vb_data_entry_inv_x;              
output           vb_data_entry_lfb_create_x;       
output           vb_data_entry_normal_pop_x;       
output           vb_data_entry_req_success_x;      
output           vb_data_entry_vld_x;              
output           vb_data_entry_wd_sm_req_x;        
output  [127:0]  vb_data_entry_write_data128_v;    
output           vb_sdb_data_entry_vld_x;          

// &Regs; @29
reg              sdb_bypass_readonce;              
reg     [3  :0]  sdb_return_order;                 
reg     [1  :0]  sdb_start_bias;                   
reg     [1  :0]  vb_data_entry_addr_id;            
reg     [511:0]  vb_data_entry_data;               
reg     [1  :0]  vb_data_entry_data_bias;          
reg              vb_data_entry_dirty;              
reg              vb_data_entry_inv;                
reg              vb_data_entry_lfb_create;         
reg     [3  :0]  vb_data_entry_next_state;         
reg     [3  :0]  vb_data_entry_state;              

// &Wires; @30
wire             cp0_lsu_icg_en;                   
wire             cpurst_b;                         
wire             forever_cpuclk;                   
wire    [255:0]  ld_da_data256;                    
wire             ld_da_vb_borrow_vb;               
wire             ld_da_vb_borrow_vb_x;             
wire             pad_yy_icg_scan_en;               
wire             sdb_bypass_reverse;               
wire    [1  :0]  sdb_create_data_order;            
wire             sdb_create_en;                    
wire             sdb_create_en_x;                  
wire             sdb_data_vld;                     
wire             sdb_data_vld_x;                   
wire             sdb_entry_avail;                  
wire             sdb_entry_avail_x;                
wire    [127:0]  sdb_entry_data;                   
wire    [3  :0]  sdb_entry_data_index;             
wire    [127:0]  sdb_entry_data_v;                 
wire             sdb_inv_en;                       
wire             sdb_inv_en_x;                     
wire             sdb_vld;                          
wire             sdb_vld_x;                        
wire             snq_data_bypass_hit;              
wire             snq_data_bypass_hit_x;            
wire             snq_vb_bypass_invalid;            
wire             snq_vb_bypass_invalid_x;          
wire             snq_vb_bypass_readonce;           
wire             snq_vb_bypass_start;              
wire             snq_vb_bypass_start_x;            
wire             vb_data_bypass_pop;               
wire    [1  :0]  vb_data_entry_addr_id_v;          
wire             vb_data_entry_biu_req;            
wire             vb_data_entry_biu_req_success;    
wire             vb_data_entry_biu_req_success_x;  
wire             vb_data_entry_biu_req_x;          
wire             vb_data_entry_bypass_pop_x;       
wire             vb_data_entry_clk;                
wire             vb_data_entry_clk_en;             
wire             vb_data_entry_create_clk;         
wire             vb_data_entry_create_clk_en;      
wire             vb_data_entry_create_dp_vld;      
wire             vb_data_entry_create_dp_vld_x;    
wire             vb_data_entry_create_gateclk_en;  
wire             vb_data_entry_create_gateclk_en_x; 
wire             vb_data_entry_create_vld;         
wire             vb_data_entry_create_vld_x;       
wire             vb_data_entry_data0_clk;          
wire             vb_data_entry_data0_clk_en;       
wire             vb_data_entry_data1_clk;          
wire             vb_data_entry_data1_clk_en;       
wire             vb_data_entry_dirty_x;            
wire             vb_data_entry_inv_x;              
wire             vb_data_entry_lfb_create_x;       
wire             vb_data_entry_normal_pop_x;       
wire             vb_data_entry_pass_data0_vld;     
wire             vb_data_entry_pass_data1_vld;     
wire             vb_data_entry_pop_vld;            
wire             vb_data_entry_req_success;        
wire             vb_data_entry_req_success_x;      
wire             vb_data_entry_vld;                
wire             vb_data_entry_vld_x;              
wire             vb_data_entry_wd_sm_grnt;         
wire             vb_data_entry_wd_sm_grnt_x;       
wire             vb_data_entry_wd_sm_req;          
wire             vb_data_entry_wd_sm_req_x;        
wire    [127:0]  vb_data_entry_write_data128;      
wire    [127:0]  vb_data_entry_write_data128_v;    
wire             vb_data_normal_pop;               
wire    [1  :0]  vb_rcl_sm_addr_id;                
wire             vb_rcl_sm_data_dcache_dirty;      
wire             vb_rcl_sm_data_set_data_done;     
wire             vb_rcl_sm_data_set_data_done_x;   
wire             vb_rcl_sm_inv;                    
wire             vb_rcl_sm_lfb_create;             
wire             vb_sdb_data_entry_vld;            
wire             vb_sdb_data_entry_vld_x;          
wire    [3  :0]  vb_wd_sm_data_bias;               
wire             vb_wd_sm_data_pop_req;            
wire             vb_wd_sm_data_pop_req_x;          


parameter IDLE            = 4'b0000,
          GET_VB_DATA     = 4'b1000,
          REQ_WRITE_ADDR  = 4'b1001,
          REQ_WRITE_DATA  = 4'b1010,
          GRNT_WRITE_DATA = 4'b1011,
//          VB_NOP          = 4'b1111,
          WAIT_REQ        = 4'b0111,
          GET_SNQ_DATA    = 4'b0100,
          REQ_CD_CHANNEL  = 4'b0101;


//==========================================================
//                 Instance of Gated Cell  
//==========================================================
//-----------entry gateclk--------------
//normal gateclk ,open when create || entry_vld
assign vb_data_entry_clk_en   = vb_data_entry_vld
                                ||  sdb_vld
                                ||  sdb_create_en
                                ||  vb_data_entry_create_gateclk_en;
// &Instance("gated_clk_cell", "x_lsu_vb_data_entry_gated_clk"); @52
gated_clk_cell  x_lsu_vb_data_entry_gated_clk (
  .clk_in               (forever_cpuclk      ),
  .clk_out              (vb_data_entry_clk   ),
  .external_en          (1'b0                ),
  .global_en            (1'b1                ),
  .local_en             (vb_data_entry_clk_en),
  .module_en            (cp0_lsu_icg_en      ),
  .pad_yy_icg_scan_en   (pad_yy_icg_scan_en  )
);

// &Connect(.clk_in        (forever_cpuclk     ), @53
//          .external_en   (1'b0               ), @54
//          .global_en     (1'b1               ), @55
//          .module_en     (cp0_lsu_icg_en     ), @56
//          .local_en      (vb_data_entry_clk_en), @57
//          .clk_out       (vb_data_entry_clk )); @58

//-----------data gateclk---------------
assign vb_data_entry_create_clk_en    = vb_data_entry_create_gateclk_en;
// &Instance("gated_clk_cell", "x_lsu_vb_data_entry_create_gated_clk"); @62
gated_clk_cell  x_lsu_vb_data_entry_create_gated_clk (
  .clk_in                      (forever_cpuclk             ),
  .clk_out                     (vb_data_entry_create_clk   ),
  .external_en                 (1'b0                       ),
  .global_en                   (1'b1                       ),
  .local_en                    (vb_data_entry_create_clk_en),
  .module_en                   (cp0_lsu_icg_en             ),
  .pad_yy_icg_scan_en          (pad_yy_icg_scan_en         )
);

// &Connect(.clk_in        (forever_cpuclk     ), @63
//          .external_en   (1'b0               ), @64
//          .global_en     (1'b1               ), @65
//          .module_en     (cp0_lsu_icg_en     ), @66
//          .local_en      (vb_data_entry_create_clk_en), @67
//          .clk_out       (vb_data_entry_create_clk)); @68

assign vb_data_entry_data0_clk_en  = vb_data_entry_pass_data0_vld;
// &Instance("gated_clk_cell", "x_lsu_vb_data_entry_data0_gated_clk"); @71
gated_clk_cell  x_lsu_vb_data_entry_data0_gated_clk (
  .clk_in                     (forever_cpuclk            ),
  .clk_out                    (vb_data_entry_data0_clk   ),
  .external_en                (1'b0                      ),
  .global_en                  (1'b1                      ),
  .local_en                   (vb_data_entry_data0_clk_en),
  .module_en                  (cp0_lsu_icg_en            ),
  .pad_yy_icg_scan_en         (pad_yy_icg_scan_en        )
);

// &Connect(.clk_in        (forever_cpuclk     ), @72
//          .external_en   (1'b0               ), @73
//          .global_en     (1'b1               ), @74
//          .module_en     (cp0_lsu_icg_en     ), @75
//          .local_en      (vb_data_entry_data0_clk_en), @76
//          .clk_out       (vb_data_entry_data0_clk)); @77

assign vb_data_entry_data1_clk_en  = vb_data_entry_pass_data1_vld;
// &Instance("gated_clk_cell", "x_lsu_vb_data_entry_data1_gated_clk"); @80
gated_clk_cell  x_lsu_vb_data_entry_data1_gated_clk (
  .clk_in                     (forever_cpuclk            ),
  .clk_out                    (vb_data_entry_data1_clk   ),
  .external_en                (1'b0                      ),
  .global_en                  (1'b1                      ),
  .local_en                   (vb_data_entry_data1_clk_en),
  .module_en                  (cp0_lsu_icg_en            ),
  .pad_yy_icg_scan_en         (pad_yy_icg_scan_en        )
);

// &Connect(.clk_in        (forever_cpuclk     ), @81
//          .external_en   (1'b0               ), @82
//          .global_en     (1'b1               ), @83
//          .module_en     (cp0_lsu_icg_en     ), @84
//          .local_en      (vb_data_entry_data1_clk_en), @85
//          .clk_out       (vb_data_entry_data1_clk)); @86

//==========================================================
//                 Registers
//==========================================================
//+-------+
//| state |
//+-------+
always @(posedge vb_data_entry_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    vb_data_entry_state[3:0]      <=  IDLE;
  else
    vb_data_entry_state[3:0]      <=  vb_data_entry_next_state[3:0];
end

assign vb_data_entry_vld        = vb_data_entry_state[3];
assign vb_data_entry_biu_req    = (vb_data_entry_state[3:0] == REQ_WRITE_ADDR);
assign vb_data_entry_wd_sm_req  = (vb_data_entry_state[3:0] == REQ_WRITE_DATA);

//+-----------+
//| data_bias |
//+-----------+
always @(posedge vb_data_entry_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    vb_data_entry_data_bias[1:0]  <=  2'b1;
  else if(vb_data_entry_create_dp_vld || sdb_create_en)
    vb_data_entry_data_bias[1:0]  <=  2'b1;
  else if(ld_da_vb_borrow_vb)
    vb_data_entry_data_bias[1:0]  <=  {vb_data_entry_data_bias[0],
                                      vb_data_entry_data_bias[1]};
end

//+-------+------------+-----+---------+
//| dirty | lfb_create | inv | addr_id |
//+-------+------------+-----+---------+
//dirty is read from cache
//lfb create is read from addr entry
always @(posedge vb_data_entry_create_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
  begin
    vb_data_entry_dirty           <=  1'b0;
    vb_data_entry_lfb_create      <=  1'b0;
    vb_data_entry_inv             <=  1'b0;
    vb_data_entry_addr_id[1:0]    <=  2'b0;
  end
  else if(vb_data_entry_create_dp_vld)
  begin
    vb_data_entry_dirty           <=  vb_rcl_sm_data_dcache_dirty;
    vb_data_entry_lfb_create      <=  vb_rcl_sm_lfb_create;
    vb_data_entry_inv             <=  vb_rcl_sm_inv;
    vb_data_entry_addr_id[1:0]    <=  vb_rcl_sm_addr_id[1:0];
  end
end

//+------+
//| data |
//+------+
always @(posedge vb_data_entry_data0_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    vb_data_entry_data[255:0]     <=  256'b0;
  else if(vb_data_entry_pass_data0_vld)
    vb_data_entry_data[255:0]     <=  ld_da_data256[255:0];
end

always @(posedge vb_data_entry_data1_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    vb_data_entry_data[511:256]   <=  256'b0;
  else if(vb_data_entry_pass_data1_vld)
    vb_data_entry_data[511:256]   <=  ld_da_data256[255:0];
end


//for sdb return order
//+--------------+
//| return order |
//+--------------+
always @(posedge vb_data_entry_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    sdb_start_bias[1:0]  <=  2'b0;
  else if(sdb_create_en || snq_vb_bypass_start)
    sdb_start_bias[1:0]  <=  sdb_create_data_order[1:0];
end

//for readonce record
always @(posedge vb_data_entry_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    sdb_bypass_readonce  <=  1'b0;
  else if(sdb_create_en)
    sdb_bypass_readonce  <=  1'b0;
  else if(snq_vb_bypass_start)
    sdb_bypass_readonce  <=  snq_vb_bypass_readonce;
end
//==========================================================
//                 Generate next state
//==========================================================
// &CombBeg; @207
always @( sdb_create_en
       or vb_rcl_sm_data_set_data_done
       or vb_data_entry_wd_sm_grnt
       or sdb_bypass_readonce
       or vb_data_entry_create_vld
       or snq_vb_bypass_start
       or snq_vb_bypass_invalid
       or vb_data_entry_pass_data0_vld
       or vb_data_entry_pop_vld
       or snq_data_bypass_hit
       or vb_data_entry_state[3:0]
       or vb_data_entry_biu_req_success
       or vb_data_entry_pass_data1_vld
       or sdb_inv_en)
begin
vb_data_entry_next_state[3:0]  = IDLE;
case(vb_data_entry_state[3:0])
  IDLE:
    if(vb_data_entry_create_vld)
      vb_data_entry_next_state[3:0]  = GET_VB_DATA;
    else if(sdb_create_en)
      vb_data_entry_next_state[3:0]  = GET_SNQ_DATA;
  GET_VB_DATA:
    if(vb_rcl_sm_data_set_data_done)
      vb_data_entry_next_state[3:0]  = REQ_WRITE_ADDR;
    else
      vb_data_entry_next_state[3:0]  = GET_VB_DATA;
  REQ_WRITE_ADDR:
    if(vb_data_entry_biu_req_success)
      vb_data_entry_next_state[3:0]  = REQ_WRITE_DATA;
    else if(snq_data_bypass_hit)
      vb_data_entry_next_state[3:0]  = WAIT_REQ;
    else
      vb_data_entry_next_state[3:0]  = REQ_WRITE_ADDR;
  REQ_WRITE_DATA:
    if(vb_data_entry_wd_sm_grnt)
      vb_data_entry_next_state[3:0]  = GRNT_WRITE_DATA;
    else
      vb_data_entry_next_state[3:0]  = REQ_WRITE_DATA;
  GRNT_WRITE_DATA:
    if(vb_data_entry_pop_vld)
      vb_data_entry_next_state[3:0]  = IDLE;
    else
      vb_data_entry_next_state[3:0]  = GRNT_WRITE_DATA;
  WAIT_REQ:
    if(snq_vb_bypass_start)
      vb_data_entry_next_state[3:0]  = REQ_CD_CHANNEL;
    else if(snq_vb_bypass_invalid)
      vb_data_entry_next_state[3:0]  = IDLE;
    else
      vb_data_entry_next_state[3:0]  = WAIT_REQ;
  GET_SNQ_DATA:
    if(vb_data_entry_pass_data0_vld || vb_data_entry_pass_data1_vld)
      vb_data_entry_next_state[3:0]  = REQ_CD_CHANNEL;
    else
      vb_data_entry_next_state[3:0]  = GET_SNQ_DATA;
  REQ_CD_CHANNEL:
    if(sdb_inv_en & sdb_bypass_readonce)
      vb_data_entry_next_state[3:0]  = REQ_WRITE_ADDR;
    else if(sdb_inv_en)
      vb_data_entry_next_state[3:0]  = IDLE;
    else
      vb_data_entry_next_state[3:0]  = REQ_CD_CHANNEL;
  default:vb_data_entry_next_state[3:0]  = IDLE;
endcase
// &CombEnd; @258
end

//==========================================================
//                 State 1 : get data
//==========================================================
//when sdb get data,critial first
assign sdb_bypass_reverse = sdb_vld
                            && sdb_start_bias[1];

assign vb_data_entry_pass_data0_vld = ld_da_vb_borrow_vb
                                      &&  (vb_data_entry_data_bias[0] ^ sdb_bypass_reverse);
assign vb_data_entry_pass_data1_vld = ld_da_vb_borrow_vb
                                      &&  (vb_data_entry_data_bias[1] ^ sdb_bypass_reverse);

//==========================================================
//                 State 4 : grnt write data
//==========================================================
assign vb_data_entry_pop_vld  = vb_wd_sm_data_pop_req;

assign vb_data_entry_write_data128[127:0] = {128{vb_wd_sm_data_bias[0]}}  & vb_data_entry_data[127:0]
                                            | {128{vb_wd_sm_data_bias[1]}}  & vb_data_entry_data[255:128]
                                            | {128{vb_wd_sm_data_bias[2]}}  & vb_data_entry_data[383:256]
                                            | {128{vb_wd_sm_data_bias[3]}}  & vb_data_entry_data[511:384];
//==========================================================
//                 Snoop signal
//==========================================================
assign vb_sdb_data_entry_vld = |vb_data_entry_state[3:2]; 

assign sdb_vld         = !vb_data_entry_state[3] && vb_data_entry_state[2]; 
assign sdb_data_vld    = (vb_data_entry_state[3:0] == REQ_CD_CHANNEL); 
assign sdb_entry_avail = !vb_sdb_data_entry_vld && !vb_data_entry_create_vld;

//snoop data
// &CombBeg; @291
always @( sdb_start_bias[1:0]
       or sdb_entry_data_index[3:0])
begin
case(sdb_start_bias[1:0])
  2'b00:  sdb_return_order[3:0] = sdb_entry_data_index[3:0];
  2'b01:  sdb_return_order[3:0] = {sdb_entry_data_index[2:0],sdb_entry_data_index[3]};
  2'b10:  sdb_return_order[3:0] = {sdb_entry_data_index[1:0],sdb_entry_data_index[3:2]};
  2'b11:  sdb_return_order[3:0] = {sdb_entry_data_index[0],sdb_entry_data_index[3:1]};
  default:sdb_return_order[3:0] = {4{1'bx}};
endcase
// &CombEnd; @299
end

assign sdb_entry_data[127:0]  =  {128{sdb_return_order[0]}}  & vb_data_entry_data[127:0]
                                 | {128{sdb_return_order[1]}}  & vb_data_entry_data[255:128]
                                 | {128{sdb_return_order[2]}}  & vb_data_entry_data[383:256]
                                 | {128{sdb_return_order[3]}}  & vb_data_entry_data[511:384];

//for data dep or bypass
assign vb_data_entry_req_success = (vb_data_entry_state[3:0] == REQ_WRITE_ADDR) && vb_data_entry_biu_req_success
                                   || (vb_data_entry_state[3:0] == REQ_WRITE_DATA)
                                   || (vb_data_entry_state[3:0] == GRNT_WRITE_DATA);

//bypass should pop vb addr entry
assign vb_data_bypass_pop = (vb_data_entry_state[3:0] == WAIT_REQ)
                            && (snq_vb_bypass_start && !snq_vb_bypass_readonce || snq_vb_bypass_invalid);

//when req data success,should ack addr entry not bypass
assign vb_data_normal_pop = (vb_data_entry_state[3:0] == GRNT_WRITE_DATA)
                            && vb_data_entry_pop_vld; 
//==========================================================
//                 Generate interface
//==========================================================
//------------------input-----------------------------------
//-----------create signal--------------
assign vb_data_entry_create_vld         = vb_data_entry_create_vld_x;
assign vb_data_entry_create_dp_vld      = vb_data_entry_create_dp_vld_x;
assign vb_data_entry_create_gateclk_en  = vb_data_entry_create_gateclk_en_x;
//-----------grnt signal----------------
assign vb_data_entry_biu_req_success    = vb_data_entry_biu_req_success_x;
assign vb_data_entry_wd_sm_grnt         = vb_data_entry_wd_sm_grnt_x;
//-----------other signal---------------
assign ld_da_vb_borrow_vb               = ld_da_vb_borrow_vb_x;
assign vb_rcl_sm_data_set_data_done     = vb_rcl_sm_data_set_data_done_x;
assign vb_wd_sm_data_pop_req            = vb_wd_sm_data_pop_req_x;
//----------- for snq--------------
assign snq_vb_bypass_start              = snq_vb_bypass_start_x;
assign snq_vb_bypass_invalid            = snq_vb_bypass_invalid_x;
assign snq_data_bypass_hit              = snq_data_bypass_hit_x;
assign sdb_create_en                    = sdb_create_en_x;
assign sdb_inv_en                       = sdb_inv_en_x;
//------------------output----------------------------------
//----------- entry signal--------------
assign vb_sdb_data_entry_vld_x          = vb_sdb_data_entry_vld;
assign vb_data_entry_vld_x              = vb_data_entry_vld;
assign vb_data_entry_dirty_x            = vb_data_entry_dirty;
assign vb_data_entry_lfb_create_x       = vb_data_entry_lfb_create;
assign vb_data_entry_inv_x              = vb_data_entry_inv;
assign vb_data_entry_addr_id_v[1:0]     = vb_data_entry_addr_id[1:0];
//-----------request--------------------
assign vb_data_entry_biu_req_x          = vb_data_entry_biu_req;
assign vb_data_entry_wd_sm_req_x        = vb_data_entry_wd_sm_req;
//-----------other signal---------------
assign vb_data_entry_write_data128_v[127:0] = vb_data_entry_write_data128[127:0];
assign vb_data_entry_req_success_x      = vb_data_entry_req_success;
assign vb_data_entry_bypass_pop_x       = vb_data_bypass_pop;
assign vb_data_entry_normal_pop_x       = vb_data_normal_pop;
//----------- for snq--------------
assign sdb_vld_x         = sdb_vld;
assign sdb_data_vld_x    = sdb_data_vld;
assign sdb_entry_avail_x = sdb_entry_avail;

assign sdb_entry_data_v[127:0] = sdb_entry_data[127:0];

// &ModuleEnd; @368
endmodule


