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
module ct_l2c_icc(
  ciu_l2c_ctcq_req_x,
  ciu_l2c_dca_addr_x,
  ciu_l2c_dca_req_x,
  ciu_l2c_icc_mid_x,
  ciu_l2c_icc_type_x,
  ciu_l2c_rdl_ready_x,
  ciu_l2c_rst_req,
  cpurst_b,
  data_icc_grant,
  forever_cpuclk,
  icc_data_cen,
  icc_data_flop,
  icc_data_index,
  icc_data_req,
  icc_dca_dirty_f,
  icc_dca_tag_f,
  icc_dca_way_sel,
  icc_dirty_cen,
  icc_dirty_gwen,
  icc_dirty_wen,
  icc_idle,
  icc_tag_cen,
  icc_tag_flop,
  icc_tag_gwen,
  icc_tag_index,
  icc_tag_req,
  l2c_ciu_ctcq_cmplt_x,
  l2c_ciu_ctcq_ready_x,
  l2c_ciu_dca_cmplt_x,
  l2c_ciu_dca_data_x,
  l2c_ciu_dca_ready_x,
  l2c_ciu_rdl_addr_x,
  l2c_ciu_rdl_dvld_x,
  l2c_ciu_rdl_mid_x,
  l2c_ciu_rdl_prot_x,
  l2c_ciu_rdl_rvld_x,
  l2c_data_dout_flop,
  l2c_flush_done_x,
  l2c_flush_req_x,
  l2c_icg_en,
  l2c_pipeline_rdy,
  l2c_tag_dirty_fatal_err,
  l2c_way0_tag_dout,
  l2c_way10_tag_dout,
  l2c_way11_tag_dout,
  l2c_way12_tag_dout,
  l2c_way13_tag_dout,
  l2c_way14_tag_dout,
  l2c_way15_tag_dout,
  l2c_way1_tag_dout,
  l2c_way2_tag_dout,
  l2c_way3_tag_dout,
  l2c_way4_tag_dout,
  l2c_way5_tag_dout,
  l2c_way6_tag_dout,
  l2c_way7_tag_dout,
  l2c_way8_tag_dout,
  l2c_way9_tag_dout,
  l2c_way_dirty,
  l2c_way_vld,
  pad_yy_icg_scan_en,
  tag_acc_cnt_zero,
  tag_icc_grant,
  wb_stage_fatal_err
);

// &Ports; @23
input            ciu_l2c_ctcq_req_x;     
input   [32 :0]  ciu_l2c_dca_addr_x;     
input            ciu_l2c_dca_req_x;      
input   [2  :0]  ciu_l2c_icc_mid_x;      
input   [1  :0]  ciu_l2c_icc_type_x;     
input            ciu_l2c_rdl_ready_x;    
input            ciu_l2c_rst_req;        
input            cpurst_b;               
input            data_icc_grant;         
input            forever_cpuclk;         
input   [7  :0]  icc_dca_dirty_f;        
input   [23 :0]  icc_dca_tag_f;          
input   [511:0]  l2c_data_dout_flop;     
input            l2c_flush_req_x;        
input            l2c_icg_en;             
input            l2c_pipeline_rdy;       
input   [15 :0]  l2c_tag_dirty_fatal_err; 
input   [23 :0]  l2c_way0_tag_dout;      
input   [23 :0]  l2c_way10_tag_dout;     
input   [23 :0]  l2c_way11_tag_dout;     
input   [23 :0]  l2c_way12_tag_dout;     
input   [23 :0]  l2c_way13_tag_dout;     
input   [23 :0]  l2c_way14_tag_dout;     
input   [23 :0]  l2c_way15_tag_dout;     
input   [23 :0]  l2c_way1_tag_dout;      
input   [23 :0]  l2c_way2_tag_dout;      
input   [23 :0]  l2c_way3_tag_dout;      
input   [23 :0]  l2c_way4_tag_dout;      
input   [23 :0]  l2c_way5_tag_dout;      
input   [23 :0]  l2c_way6_tag_dout;      
input   [23 :0]  l2c_way7_tag_dout;      
input   [23 :0]  l2c_way8_tag_dout;      
input   [23 :0]  l2c_way9_tag_dout;      
input   [15 :0]  l2c_way_dirty;          
input   [15 :0]  l2c_way_vld;            
input            pad_yy_icg_scan_en;     
input            tag_acc_cnt_zero;       
input            tag_icc_grant;          
input            wb_stage_fatal_err;     
output  [4  :0]  icc_data_cen;           
output           icc_data_flop;          
output  [12 :0]  icc_data_index;         
output           icc_data_req;           
output  [15 :0]  icc_dca_way_sel;        
output           icc_dirty_cen;          
output           icc_dirty_gwen;         
output  [8  :0]  icc_dirty_wen;          
output           icc_idle;               
output           icc_tag_cen;            
output           icc_tag_flop;           
output           icc_tag_gwen;           
output  [8  :0]  icc_tag_index;          
output           icc_tag_req;            
output           l2c_ciu_ctcq_cmplt_x;   
output           l2c_ciu_ctcq_ready_x;   
output           l2c_ciu_dca_cmplt_x;    
output  [127:0]  l2c_ciu_dca_data_x;     
output           l2c_ciu_dca_ready_x;    
output  [32 :0]  l2c_ciu_rdl_addr_x;     
output           l2c_ciu_rdl_dvld_x;     
output  [2  :0]  l2c_ciu_rdl_mid_x;      
output  [2  :0]  l2c_ciu_rdl_prot_x;     
output           l2c_ciu_rdl_rvld_x;     
output           l2c_flush_done_x;       

// &Regs; @24
reg              cln_all_f;              
reg     [13 :0]  dca_index_f;            
reg     [1  :0]  dca_offset_f;           
reg     [127:0]  dca_read_data_f;        
reg     [3  :0]  dca_type_f;             
reg     [3  :0]  dca_way_f;              
reg     [15 :0]  dirty_way_ptr;          
reg     [3  :0]  icc_all_next_state;     
reg     [3  :0]  icc_all_state;          
reg     [3  :0]  icc_data_way;           
reg     [8  :0]  icc_index;              
reg     [2  :0]  icc_mid;                
reg     [15 :0]  icc_status_dirty;       
reg     [15 :0]  icc_status_vld;         
reg              inv_all_f;              
reg     [32 :0]  l2c_ciu_rdl_addr_x;     
reg              l2c_flush_f;            
reg              rst_req_f;              

// &Wires; @25
wire             ciu_icc_req;            
wire             ciu_l2c_ctcq_req_x;     
wire    [32 :0]  ciu_l2c_dca_addr_x;     
wire             ciu_l2c_dca_req_x;      
wire    [2  :0]  ciu_l2c_icc_mid_x;      
wire    [1  :0]  ciu_l2c_icc_type_x;     
wire             ciu_l2c_rdl_ready_x;    
wire             ciu_l2c_rst_req;        
wire             cln_all;                
wire             cln_inv_all;            
wire             cln_inv_all_f;          
wire             cpurst_b;               
wire             ctc_done;               
wire             data_icc_grant;         
wire    [4  :0]  data_ram_sel;           
wire             dca_acc_data;           
wire             dca_acc_data_ecc;       
wire             dca_acc_tag;            
wire             dca_acc_tag_ecc;        
wire             dca_data_clk;           
wire             dca_data_clk_en;        
wire    [127:0]  dca_data_ecc_value;     
wire    [127:0]  dca_data_value;         
wire    [13 :0]  dca_index;              
wire    [1  :0]  dca_offset;             
wire    [127:0]  dca_read_data;          
wire    [127:0]  dca_tag_ecc_value;      
wire    [127:0]  dca_tag_value;          
wire    [3  :0]  dca_way;                
wire             forever_cpuclk;         
wire             have_dirty;             
wire             have_no_dirty;          
wire             icc_all_last;           
wire    [4  :0]  icc_data_cen;           
wire             icc_data_flop;          
wire    [12 :0]  icc_data_index;         
wire             icc_data_req;           
wire             icc_dca_cmplt;          
wire    [7  :0]  icc_dca_dirty_f;        
wire             icc_dca_ready;          
wire    [23 :0]  icc_dca_tag_f;          
wire    [15 :0]  icc_dca_way_sel;        
wire             icc_dirty_cen;          
wire             icc_dirty_gwen;         
wire    [8  :0]  icc_dirty_wen;          
wire             icc_dp_clk;             
wire             icc_dp_clk_en;          
wire             icc_fatal_err;          
wire             icc_fsm_clk;            
wire             icc_fsm_clk_en;         
wire             icc_idle;               
wire             icc_index_clk;          
wire             icc_index_clk_en;       
wire             icc_index_start;        
wire             icc_index_update;       
wire    [32 :0]  icc_rdl_addr;           
wire    [23 :0]  icc_rdl_tag;            
wire             icc_status_clk;         
wire             icc_status_clk_en;      
wire             icc_status_updt;        
wire             icc_status_wen;         
wire             icc_tag_cen;            
wire             icc_tag_flop;           
wire             icc_tag_gwen;           
wire    [8  :0]  icc_tag_index;          
wire             icc_tag_req;            
wire    [15 :0]  icc_way_ptr;            
wire             inv_all;                
wire             l2c_ciu_ctcq_cmplt_x;   
wire             l2c_ciu_ctcq_ready_x;   
wire             l2c_ciu_dca_cmplt_x;    
wire    [127:0]  l2c_ciu_dca_data_x;     
wire             l2c_ciu_dca_ready_x;    
wire             l2c_ciu_rdl_dvld_x;     
wire    [2  :0]  l2c_ciu_rdl_mid_x;      
wire    [2  :0]  l2c_ciu_rdl_prot_x;     
wire             l2c_ciu_rdl_rvld_x;     
wire    [511:0]  l2c_data_dout_flop;     
wire             l2c_flush_done_x;       
wire             l2c_flush_req_x;        
wire             l2c_icg_en;             
wire             l2c_pipeline_rdy;       
wire    [15 :0]  l2c_tag_dirty_fatal_err; 
wire    [23 :0]  l2c_way0_tag_dout;      
wire    [23 :0]  l2c_way10_tag_dout;     
wire    [23 :0]  l2c_way11_tag_dout;     
wire    [23 :0]  l2c_way12_tag_dout;     
wire    [23 :0]  l2c_way13_tag_dout;     
wire    [23 :0]  l2c_way14_tag_dout;     
wire    [23 :0]  l2c_way15_tag_dout;     
wire    [23 :0]  l2c_way1_tag_dout;      
wire    [23 :0]  l2c_way2_tag_dout;      
wire    [23 :0]  l2c_way3_tag_dout;      
wire    [23 :0]  l2c_way4_tag_dout;      
wire    [23 :0]  l2c_way5_tag_dout;      
wire    [23 :0]  l2c_way6_tag_dout;      
wire    [23 :0]  l2c_way7_tag_dout;      
wire    [23 :0]  l2c_way8_tag_dout;      
wire    [23 :0]  l2c_way9_tag_dout;      
wire    [15 :0]  l2c_way_dirty;          
wire    [15 :0]  l2c_way_dirty_vld;      
wire    [15 :0]  l2c_way_vld;            
wire             pad_yy_icg_scan_en;     
wire             rdl_clk;                
wire             rdl_clk_en;             
wire             tag_acc_cnt_zero;       
wire             tag_icc_grant;          
wire             wb_stage_fatal_err;     


parameter TAG_INDEX_LENTH  = `L2C_TAG_INDEX_WIDTH;
parameter TAG_TAG_LENTH    = `L2C_TAG_DATA_WIDTH;
parameter DATA_INDEX_LENTH = `L2C_DATA_INDEX_WIDTH;
parameter L2C_ADDRW        = 33;

assign icc_fsm_clk_en = ciu_icc_req || !icc_idle;
// &Instance("gated_clk_cell", "x_l2c_icc_fsm_gated_clk"); @33
gated_clk_cell  x_l2c_icc_fsm_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (icc_fsm_clk       ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (icc_fsm_clk_en    ),
  .module_en          (l2c_icg_en        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in        (forever_cpuclk     ), @34
//          .external_en   (1'b0               ), @35
//          .global_en     (1'b1               ), @36
//          .module_en (l2c_icg_en     ), @37
//          .local_en      (icc_fsm_clk_en     ), @38
//          .clk_out       (icc_fsm_clk        ) @39
//         ); @40

assign icc_dp_clk_en = ciu_icc_req & icc_idle & l2c_pipeline_rdy;
// &Instance("gated_clk_cell", "x_l2c_icc_dp_gated_clk"); @43
gated_clk_cell  x_l2c_icc_dp_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (icc_dp_clk        ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (icc_dp_clk_en     ),
  .module_en          (l2c_icg_en        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in        (forever_cpuclk     ), @44
//          .external_en   (1'b0               ), @45
//          .global_en     (1'b1               ), @46
//          .module_en (l2c_icg_en     ), @47
//          .local_en      (icc_dp_clk_en      ), @48
//          .clk_out       (icc_dp_clk         ) @49
//         ); @50


assign icc_index_clk_en = icc_index_start || icc_index_update;
// &Instance("gated_clk_cell", "x_l2c_icc_index_gated_clk"); @54
gated_clk_cell  x_l2c_icc_index_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (icc_index_clk     ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (icc_index_clk_en  ),
  .module_en          (l2c_icg_en        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in        (forever_cpuclk     ), @55
//          .external_en   (1'b0               ), @56
//          .global_en     (1'b1               ), @57
//          .module_en (l2c_icg_en     ), @58
//          .local_en      (icc_index_clk_en   ), @59
//          .clk_out       (icc_index_clk      ) @60
//         ); @61

assign icc_status_clk_en = icc_status_wen || icc_status_updt;
// &Instance("gated_clk_cell", "x_l2c_icc_status_gated_clk"); @64
gated_clk_cell  x_l2c_icc_status_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (icc_status_clk    ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (icc_status_clk_en ),
  .module_en          (l2c_icg_en        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in        (forever_cpuclk     ), @65
//          .external_en   (1'b0               ), @66
//          .global_en     (1'b1               ), @67
//          .module_en (l2c_icg_en     ), @68
//          .local_en      (icc_status_clk_en   ), @69
//          .clk_out       (icc_status_clk      ) @70
//         ); @71

assign dca_data_clk_en = icc_dca_ready;
// &Instance("gated_clk_cell", "x_l2c_dca_data_gated_clk"); @74
gated_clk_cell  x_l2c_dca_data_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (dca_data_clk      ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (dca_data_clk_en   ),
  .module_en          (l2c_icg_en        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in        (forever_cpuclk     ), @75
//          .external_en   (1'b0               ), @76
//          .global_en     (1'b1               ), @77
//          .module_en (l2c_icg_en     ), @78
//          .local_en      (dca_data_clk_en    ), @79
//          .clk_out       (dca_data_clk       ) @80
//         ); @81

//==============================================================================
//                            interface to CIU
//==============================================================================
// &Force("bus","ciu_l2c_sid_x",3,0); @86
// &Force("bus","ciu_l2c_type_x",3,0); @87
// &Force("bus","ciu_l2c_dca_addr_x",L2C_ADDRW-1,0); @88

parameter DCA_WAY_3     = 24;
parameter DCA_WAY_0     = 21;
parameter DCA_INDEX_20  = 20;
parameter DCA_INDEX_7   = 7;
parameter DCA_INDEX_5   = 5;
parameter DCA_INDEX_4   = 4;
parameter DCA_INDEX_0   = 0;

assign dca_way[3:0]    = ciu_l2c_dca_addr_x[DCA_WAY_3:DCA_WAY_0];
assign dca_index[13:0] = ciu_l2c_dca_addr_x[DCA_INDEX_20:DCA_INDEX_7];
assign dca_offset[1:0] = ciu_l2c_dca_addr_x[DCA_INDEX_5:DCA_INDEX_4];

assign inv_all     = ciu_l2c_ctcq_req_x & ciu_l2c_icc_type_x[0] | ciu_l2c_rst_req | l2c_flush_req_x;
assign cln_all     = ciu_l2c_ctcq_req_x & ciu_l2c_icc_type_x[1] | l2c_flush_req_x;
assign cln_inv_all = inv_all | cln_all;

assign dca_acc_tag  = ciu_l2c_dca_req_x & (ciu_l2c_icc_type_x[1:0] == 2'b00);
assign dca_acc_data = ciu_l2c_dca_req_x & (ciu_l2c_icc_type_x[1:0] == 2'b01);
assign dca_acc_data_ecc = ciu_l2c_dca_req_x & (ciu_l2c_icc_type_x[1:0] == 2'b11);
assign dca_acc_tag_ecc  = ciu_l2c_dca_req_x & (ciu_l2c_icc_type_x[1:0] == 2'b10);

assign l2c_ciu_ctcq_ready_x = ciu_l2c_ctcq_req_x & icc_idle & l2c_pipeline_rdy;
assign l2c_ciu_ctcq_cmplt_x = ctc_done & !rst_req_f & !l2c_flush_f;
assign l2c_flush_done_x     = ctc_done & l2c_flush_f;

assign l2c_ciu_dca_ready_x  = ciu_l2c_dca_req_x & icc_idle & l2c_pipeline_rdy;

always@(posedge icc_dp_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
  begin
    dca_type_f[3:0]   <= 4'b0;
    dca_way_f[3:0]    <= 4'b0; 
    dca_index_f[13:0] <= 14'b0;
    dca_offset_f[1:0] <= 2'b0;
    inv_all_f         <= 1'b0;
    cln_all_f         <= 1'b0;
    icc_mid[2:0]      <= 3'b0;
  end
  else if ((ciu_l2c_ctcq_req_x | ciu_l2c_rst_req | l2c_flush_req_x) & icc_idle & l2c_pipeline_rdy)
  begin
    dca_type_f[3:0]   <= 4'b0;
    dca_way_f[3:0]    <= dca_way_f[3:0];
    dca_index_f[13:0] <= dca_index_f[13:0];
    dca_offset_f[1:0] <= dca_offset_f[1:0];
    inv_all_f         <= inv_all;
    cln_all_f         <= cln_all;
    icc_mid[2:0]      <= ciu_l2c_icc_mid_x[2:0];
  end
  else if (ciu_l2c_dca_req_x & icc_idle & l2c_pipeline_rdy)
  begin
    dca_type_f[3:0]   <= {dca_acc_tag_ecc,dca_acc_data_ecc,dca_acc_data,dca_acc_tag};
    dca_way_f[3:0]    <= dca_way[3:0];
    dca_index_f[13:0] <= dca_index[13:0];
    dca_offset_f[1:0] <= dca_offset[1:0];
    inv_all_f         <= 1'b0;
    cln_all_f         <= 1'b0;
    icc_mid[2:0]      <= ciu_l2c_icc_mid_x[2:0];
  end
end

always@(posedge icc_fsm_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    rst_req_f <= 1'b0;
  else if (ciu_l2c_rst_req)
    rst_req_f <= 1'b1;
  else if (ctc_done & rst_req_f)
    rst_req_f <= 1'b0;
end

always@(posedge icc_fsm_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    l2c_flush_f <= 1'b0;
  else if (l2c_flush_req_x)
    l2c_flush_f <= 1'b1;
  else if (ctc_done & l2c_flush_f)
    l2c_flush_f <= 1'b0;
end

assign cln_inv_all_f = inv_all_f | cln_all_f;
//==========================================================
//       ICC FSM
//==========================================================
parameter ICC_STATE_IDLE = 4'b0000;
parameter ICC_INV        = 4'b0010;
parameter TAG_RD         = 4'b0011;
parameter TAG_FLOP       = 4'b0100;
parameter STATUS_UPDT    = 4'b0101;
parameter DIRTY_CHECK    = 4'b0110;
parameter WAIT_RDL       = 4'b0111;
parameter DATA_RD        = 4'b1000;
parameter DATA_FLOP      = 4'b1010;
parameter DCA_RDY        = 4'b1011;
parameter DCA_CMPLT      = 4'b1100;
parameter DATA_CRRCT     = 4'b1101;
parameter TAG_CRRCT      = 4'b1110;

// &Force("output","icc_idle"); @198

always@(posedge icc_fsm_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    icc_all_state[3:0] <= ICC_STATE_IDLE;
  else
    icc_all_state[3:0] <= icc_all_next_state[3:0];
end

assign ciu_icc_req = ciu_l2c_ctcq_req_x | ciu_l2c_dca_req_x | ciu_l2c_rst_req | l2c_flush_req_x;

// &CombBeg; @210
always @( icc_all_state
       or inv_all
       or cln_all
       or icc_all_last
       or data_icc_grant
       or tag_icc_grant
       or ciu_icc_req
       or cln_all_f
       or ciu_l2c_rdl_ready_x
       or have_no_dirty
       or dca_acc_tag
       or dca_acc_tag_ecc
       or wb_stage_fatal_err
       or l2c_pipeline_rdy)
begin
  case(icc_all_state)
    ICC_STATE_IDLE:
    begin
      if(ciu_icc_req & l2c_pipeline_rdy) 
        icc_all_next_state = (cln_all || dca_acc_tag || dca_acc_tag_ecc)
                           ? TAG_RD
                           : (inv_all ? ICC_INV : DATA_RD); 
      else
        icc_all_next_state = ICC_STATE_IDLE;
    end
    ICC_INV:
    begin
      if(icc_all_last && tag_icc_grant)
        icc_all_next_state = ICC_STATE_IDLE;
      else
        icc_all_next_state = ICC_INV;
    end
    TAG_RD:
    begin
      if (tag_icc_grant)
        icc_all_next_state = TAG_FLOP;
      else
        icc_all_next_state = TAG_RD;
    end
    TAG_FLOP:
    begin
      if (tag_icc_grant)
        icc_all_next_state = cln_all_f ? STATUS_UPDT : DCA_RDY;
      else 
        icc_all_next_state = TAG_FLOP; 
    end
    STATUS_UPDT:
    begin
      icc_all_next_state = DIRTY_CHECK;
    end
    DIRTY_CHECK:
    begin
      if(have_no_dirty) 
      begin 
        if (icc_all_last)
          icc_all_next_state = ICC_STATE_IDLE;
        else 
          icc_all_next_state = TAG_RD;
      end
      else
        icc_all_next_state = DATA_RD;
    end
    DATA_RD:
    begin
      if(data_icc_grant)
        icc_all_next_state = DATA_FLOP;
      else
        icc_all_next_state = DATA_RD;
    end
    DATA_FLOP:
    begin
      if (data_icc_grant)
        icc_all_next_state = cln_all_f ? WAIT_RDL : DCA_RDY;
      else 
        icc_all_next_state = DATA_FLOP;
    end
    WAIT_RDL:
    begin
      if (ciu_l2c_rdl_ready_x | wb_stage_fatal_err)
        icc_all_next_state = DIRTY_CHECK;
      else
        icc_all_next_state = WAIT_RDL;
    end
    DCA_RDY:
    begin
      icc_all_next_state = DCA_CMPLT;
    end
    DCA_CMPLT:
    begin
      icc_all_next_state = ICC_STATE_IDLE;
    end
    default:
    begin
      icc_all_next_state = ICC_STATE_IDLE;
    end
  endcase
// &CombEnd; @320
end

assign icc_idle         = (icc_all_state == ICC_STATE_IDLE);
assign icc_dca_ready    = (icc_all_state == DCA_RDY);
assign icc_dca_cmplt    = (icc_all_state == DCA_CMPLT);
assign icc_tag_flop     = (icc_all_state == TAG_FLOP) & tag_acc_cnt_zero;
assign icc_data_flop    = (icc_all_state == DATA_FLOP);

assign ctc_done         = (icc_all_state == DIRTY_CHECK) && have_no_dirty && icc_all_last ||
                          (icc_all_state == ICC_INV) && icc_all_last && tag_icc_grant;

//================================================
//         status update
//================================================
assign icc_status_wen   = (icc_all_state == STATUS_UPDT);
assign icc_status_updt  = (icc_all_state == DATA_FLOP) & data_icc_grant;

always@(posedge icc_status_clk or negedge cpurst_b)
begin
  if (!cpurst_b) begin
     icc_status_vld[7:0]   <= 8'b0;
     icc_status_dirty[7:0] <= 8'b0;
     icc_status_vld[15:8]  <= 8'b0;
     icc_status_dirty[15:8]<= 8'b0;
  end
  else if (icc_status_wen) begin
     icc_status_vld[7:0]   <= l2c_way_vld[7:0];
     icc_status_dirty[7:0] <= l2c_way_dirty[7:0];
     icc_status_vld[15:8]  <= l2c_way_vld[15:8];
     icc_status_dirty[15:8]<= l2c_way_dirty[15:8];
  end
  else if (icc_status_updt) begin
     icc_status_vld[7:0]   <= icc_status_vld[7:0] & (~dirty_way_ptr[7:0]);
     icc_status_dirty[7:0] <= icc_status_dirty[7:0] & (~dirty_way_ptr[7:0]);
     icc_status_vld[15:8]  <= icc_status_vld[15:8] & (~dirty_way_ptr[15:8]); 
     icc_status_dirty[15:8]<= icc_status_dirty[15:8] & (~dirty_way_ptr[15:8]);
  end
end

//------------------------------------------------------------------------------
//                        ICC RDL REQ
//------------------------------------------------------------------------------
assign icc_index_start = (icc_all_state == ICC_STATE_IDLE) && l2c_pipeline_rdy && cln_inv_all;

assign icc_index_update = (icc_all_state == DIRTY_CHECK) && have_no_dirty 
                       || (icc_all_state == ICC_INV) && tag_icc_grant;

always@(posedge icc_index_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    icc_index[TAG_INDEX_LENTH-1:0] <= {TAG_INDEX_LENTH{1'b0}};
  else if(icc_index_start)
    icc_index[TAG_INDEX_LENTH-1:0] <= {TAG_INDEX_LENTH{1'b0}};
  else if(icc_index_update)
    icc_index[TAG_INDEX_LENTH-1:0] <= icc_index[TAG_INDEX_LENTH-1:0] + {{TAG_INDEX_LENTH-1{1'b0}},1'b1};
  else
    icc_index[TAG_INDEX_LENTH-1:0] <= icc_index[TAG_INDEX_LENTH-1:0];
end

assign icc_all_last = (icc_index[TAG_INDEX_LENTH-1:0] == {TAG_INDEX_LENTH{1'b1}});

// &CombBeg; @398
// &CombEnd; @410

assign icc_fatal_err           = |l2c_tag_dirty_fatal_err[15:0];
assign l2c_way_dirty_vld[15:0] = icc_status_vld[15:0] & icc_status_dirty[15:0] & ~l2c_tag_dirty_fatal_err[15:0];
assign have_dirty              = |(l2c_way_dirty_vld[15:0]);
assign have_no_dirty           = !have_dirty;

// &CombBeg; @431
always @( l2c_way_dirty_vld[15:0])
begin
casez(l2c_way_dirty_vld[15:0])
  16'b1???????????????: dirty_way_ptr[15:0] = 16'b1000000000000000;
  16'b01??????????????: dirty_way_ptr[15:0] = 16'b0100000000000000;
  16'b001?????????????: dirty_way_ptr[15:0] = 16'b0010000000000000;
  16'b0001????????????: dirty_way_ptr[15:0] = 16'b0001000000000000;
  16'b00001???????????: dirty_way_ptr[15:0] = 16'b0000100000000000;
  16'b000001??????????: dirty_way_ptr[15:0] = 16'b0000010000000000;
  16'b0000001?????????: dirty_way_ptr[15:0] = 16'b0000001000000000;
  16'b00000001????????: dirty_way_ptr[15:0] = 16'b0000000100000000;
  16'b000000001???????: dirty_way_ptr[15:0] = 16'b0000000010000000;
  16'b0000000001??????: dirty_way_ptr[15:0] = 16'b0000000001000000;
  16'b00000000001?????: dirty_way_ptr[15:0] = 16'b0000000000100000;
  16'b000000000001????: dirty_way_ptr[15:0] = 16'b0000000000010000;
  16'b0000000000001???: dirty_way_ptr[15:0] = 16'b0000000000001000;
  16'b00000000000001??: dirty_way_ptr[15:0] = 16'b0000000000000100;
  16'b000000000000001?: dirty_way_ptr[15:0] = 16'b0000000000000010;
  16'b0000000000000001: dirty_way_ptr[15:0] = 16'b0000000000000001;
  default             : dirty_way_ptr[15:0] = 16'b0;
endcase
// &CombEnd; @451
end

assign icc_way_ptr[15:0] = dirty_way_ptr[15:0];

assign icc_rdl_tag[TAG_TAG_LENTH-1:0] =
       {TAG_TAG_LENTH{icc_way_ptr[15]}} & l2c_way15_tag_dout[TAG_TAG_LENTH-1:0] |
       {TAG_TAG_LENTH{icc_way_ptr[14]}} & l2c_way14_tag_dout[TAG_TAG_LENTH-1:0] |
       {TAG_TAG_LENTH{icc_way_ptr[13]}} & l2c_way13_tag_dout[TAG_TAG_LENTH-1:0] |
       {TAG_TAG_LENTH{icc_way_ptr[12]}} & l2c_way12_tag_dout[TAG_TAG_LENTH-1:0] |
       {TAG_TAG_LENTH{icc_way_ptr[11]}} & l2c_way11_tag_dout[TAG_TAG_LENTH-1:0] |
       {TAG_TAG_LENTH{icc_way_ptr[10]}} & l2c_way10_tag_dout[TAG_TAG_LENTH-1:0] |
       {TAG_TAG_LENTH{icc_way_ptr[9]}}  & l2c_way9_tag_dout[TAG_TAG_LENTH-1:0] |
       {TAG_TAG_LENTH{icc_way_ptr[8]}}  & l2c_way8_tag_dout[TAG_TAG_LENTH-1:0] |
       {TAG_TAG_LENTH{icc_way_ptr[7]}}  & l2c_way7_tag_dout[TAG_TAG_LENTH-1:0] |
       {TAG_TAG_LENTH{icc_way_ptr[6]}}  & l2c_way6_tag_dout[TAG_TAG_LENTH-1:0] |
       {TAG_TAG_LENTH{icc_way_ptr[5]}}  & l2c_way5_tag_dout[TAG_TAG_LENTH-1:0] |
       {TAG_TAG_LENTH{icc_way_ptr[4]}}  & l2c_way4_tag_dout[TAG_TAG_LENTH-1:0] |
       {TAG_TAG_LENTH{icc_way_ptr[3]}}  & l2c_way3_tag_dout[TAG_TAG_LENTH-1:0] |
       {TAG_TAG_LENTH{icc_way_ptr[2]}}  & l2c_way2_tag_dout[TAG_TAG_LENTH-1:0] |
       {TAG_TAG_LENTH{icc_way_ptr[1]}}  & l2c_way1_tag_dout[TAG_TAG_LENTH-1:0] |
       {TAG_TAG_LENTH{icc_way_ptr[0]}}  & l2c_way0_tag_dout[TAG_TAG_LENTH-1:0];


assign icc_rdl_addr[L2C_ADDRW-1:0] = {icc_rdl_tag[TAG_TAG_LENTH-1:0], icc_index[TAG_INDEX_LENTH-1:0]};

assign rdl_clk_en = icc_status_updt;
// &Instance("gated_clk_cell", "x_l2c_rdl_gated_clk"); @478
gated_clk_cell  x_l2c_rdl_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (rdl_clk           ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (rdl_clk_en        ),
  .module_en          (l2c_icg_en        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in        (forever_cpuclk     ), @479
//          .external_en   (1'b0               ), @480
//          .global_en     (1'b1               ), @481
//          .module_en (l2c_icg_en     ), @482
//          .local_en      (rdl_clk_en         ), @483
//          .clk_out       (rdl_clk            ) @484
//         ); @485

always@(posedge rdl_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    l2c_ciu_rdl_addr_x[L2C_ADDRW-1:0] <= {L2C_ADDRW{1'b0}};
  else if(icc_status_updt)
    l2c_ciu_rdl_addr_x[L2C_ADDRW-1:0] <= icc_rdl_addr[L2C_ADDRW-1:0];
end

assign l2c_ciu_rdl_prot_x[2:0]  = 3'b011;
assign l2c_ciu_rdl_rvld_x = (icc_all_state == WAIT_RDL) & !wb_stage_fatal_err;
assign l2c_ciu_rdl_dvld_x = (icc_all_state == WAIT_RDL) & !wb_stage_fatal_err;
assign l2c_ciu_rdl_mid_x[2:0] = icc_mid[2:0];

//------------------------------------------------------------------------------
//                       interface with tag ram
//------------------------------------------------------------------------------
// &Force("output", "icc_tag_cen"); @503
// &Force("output", "icc_tag_gwen"); @504
// &Force("output", "icc_dirty_cen"); @505
// &Force("output", "icc_dirty_gwen"); @506

assign icc_tag_req    = icc_dirty_cen || icc_tag_cen;

assign icc_dirty_gwen = (icc_all_state == ICC_INV) || 
                        (icc_all_state == STATUS_UPDT); 
assign icc_tag_gwen   = (icc_all_state == ICC_INV) || 
                        (icc_all_state == STATUS_UPDT) && icc_fatal_err;    

assign icc_tag_cen    = (icc_all_state == TAG_RD) || icc_tag_gwen;
assign icc_dirty_cen  = (icc_all_state == TAG_RD) || icc_dirty_gwen;

//assign icc_dirty_wen[7:0] = ({cp_wen[3:0], valid_wen, shared_wen, dirty_wen, pend_wen} |
//                             {8{icc_fatal_err}}) & {8{icc_dirty_gwen}};
assign icc_dirty_wen[7:0] = ({8{cln_inv_all_f}} | {8{icc_fatal_err}}) & {8{icc_dirty_gwen}};
assign icc_dirty_wen[8]   = cln_inv_all_f;
//assign icc_dirty_wen[8]   = fifo_wen;

//assign valid_wen      = inv_all_f;
//assign shared_wen     = inv_all_f;
//assign dirty_wen      = cln_inv_all_f;
//assign pend_wen       = inv_all_f;
//assign fifo_wen       = inv_all_f;
//assign cp_wen[3:0]    = {4{inv_all_f}};

assign icc_tag_index[TAG_INDEX_LENTH-1:0] = cln_inv_all_f ? icc_index[TAG_INDEX_LENTH-1:0] : dca_index_f[TAG_INDEX_LENTH-1:0];

//------------------------------------------------------------------------------
//                               DATA stage signal
//------------------------------------------------------------------------------
// &Force("output","icc_data_req"); @536
assign data_ram_sel[4]   = dca_type_f[2] | cln_all_f;
assign data_ram_sel[3:0] = cln_all_f
                         ? 4'b1111 
                         : (dca_type_f[1] ? (4'b1 << dca_offset_f[1:0]) : 4'b0);

assign icc_data_req      = (icc_all_state == DATA_RD);
assign icc_data_cen[4:0] = {5{icc_data_req}} & data_ram_sel[4:0];

// &CombBeg; @546
// &CombEnd; @567

// &CombBeg; @574
always @( dirty_way_ptr[15:0])
begin
  casez(dirty_way_ptr[15:0])
    16'b1???????????????:
      icc_data_way[3:0] = 4'b1111;
    16'b01??????????????:
      icc_data_way[3:0] = 4'b1110;
    16'b001?????????????:
      icc_data_way[3:0] = 4'b1101;
    16'b0001????????????:
      icc_data_way[3:0] = 4'b1100;
    16'b00001???????????:
      icc_data_way[3:0] = 4'b1011;
    16'b000001??????????:
      icc_data_way[3:0] = 4'b1010;
    16'b0000001?????????:
      icc_data_way[3:0] = 4'b1001;
    16'b00000001????????:
      icc_data_way[3:0] = 4'b1000;
    16'b000000001???????:
      icc_data_way[3:0] = 4'b0111;
    16'b0000000001??????:        
      icc_data_way[3:0] = 4'b0110;
    16'b00000000001?????:        
      icc_data_way[3:0] = 4'b0101;
    16'b000000000001????:        
      icc_data_way[3:0] = 4'b0100;
    16'b0000000000001???:        
      icc_data_way[3:0] = 4'b0011;
    16'b00000000000001??:        
      icc_data_way[3:0] = 4'b0010;
    16'b000000000000001?:        
      icc_data_way[3:0] = 4'b0001;
    16'b0000000000000001:        
      icc_data_way[3:0] = 4'b0000;
    default:
      icc_data_way[3:0] = 4'b0;
  endcase
// &CombEnd; @611
end
assign icc_data_index[DATA_INDEX_LENTH-1:0] = cln_inv_all_f
                                            ? {icc_data_way[3:0], icc_index[TAG_INDEX_LENTH-1:0]} 
                                            : {dca_way_f[3:0],    dca_index_f[TAG_INDEX_LENTH-1:0]};

// &Force("output","icc_data_index"); @618
//==========================================================
//   direct cache access interface
//==========================================================
assign icc_dca_way_sel[15:0] = (16'b1 << dca_way_f[3:0]);

assign dca_tag_value[127:0]  = {88'b0,icc_dca_tag_f[TAG_TAG_LENTH-1:0],
                                      dca_index_f[TAG_INDEX_LENTH-1:5],
                                 4'b0,icc_dca_dirty_f[7:0]};
assign dca_data_value[127:0] = dca_offset_f[1]
                             ? (dca_offset_f[0] ? l2c_data_dout_flop[511:384]
                                                : l2c_data_dout_flop[383:256])
                             : (dca_offset_f[0] ? l2c_data_dout_flop[255:128]
                                                : l2c_data_dout_flop[127:0]);
assign dca_tag_ecc_value[127:0]  = 128'b0;
assign dca_data_ecc_value[127:0] = 128'b0;

assign dca_read_data[127:0] = {128{dca_type_f[3]}} & dca_tag_ecc_value[127:0] | 
                              {128{dca_type_f[2]}} & dca_data_ecc_value[127:0] |
                              {128{dca_type_f[1]}} & dca_data_value[127:0] |
                              {128{dca_type_f[0]}} & dca_tag_value[127:0];

always@(posedge dca_data_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    dca_read_data_f[127:0] <= 128'b0;
  else if (icc_dca_ready)
    dca_read_data_f[127:0] <= dca_read_data[127:0];
end

assign l2c_ciu_dca_cmplt_x       = icc_dca_cmplt;
assign l2c_ciu_dca_data_x[127:0] = dca_read_data_f[127:0];

// &ModuleEnd; @686
endmodule


