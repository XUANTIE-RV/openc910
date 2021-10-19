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
module ct_lsu_snoop_ctcq_entry(
  cp0_lsu_icg_en,
  cpurst_b,
  ctcq_2_cmplt_x,
  ctcq_cmplt_x,
  ctcq_create_2nd_trans,
  ctcq_create_asid_va,
  ctcq_create_en_x,
  ctcq_create_rdy_x,
  ctcq_create_type,
  ctcq_create_va_pa,
  ctcq_entryx_icache_all_inv,
  ctcq_entryx_icache_index,
  ctcq_entryx_icache_line_inv,
  ctcq_entryx_icache_ptag,
  ctcq_entryx_pe_req,
  ctcq_entryx_tlb_all_inv,
  ctcq_entryx_tlb_asid,
  ctcq_entryx_tlb_asid_all_inv,
  ctcq_entryx_tlb_va,
  ctcq_entryx_tlb_va_all_inv,
  ctcq_entryx_tlb_va_asid_inv,
  ctcq_inv_en_x,
  ctcq_vld_x,
  ica_tlb_ctcq_inv_cmplt_x,
  lsu_snoop_clk,
  pad_yy_icg_scan_en
);

// &Ports; @23
input           cp0_lsu_icg_en;              
input           cpurst_b;                    
input           ctcq_create_2nd_trans;       
input   [15:0]  ctcq_create_asid_va;         
input           ctcq_create_en_x;            
input   [5 :0]  ctcq_create_type;            
input   [35:0]  ctcq_create_va_pa;           
input           ctcq_inv_en_x;               
input           ica_tlb_ctcq_inv_cmplt_x;    
input           lsu_snoop_clk;               
input           pad_yy_icg_scan_en;          
output          ctcq_2_cmplt_x;              
output          ctcq_cmplt_x;                
output          ctcq_create_rdy_x;           
output          ctcq_entryx_icache_all_inv;  
output  [5 :0]  ctcq_entryx_icache_index;    
output          ctcq_entryx_icache_line_inv; 
output  [27:0]  ctcq_entryx_icache_ptag;     
output          ctcq_entryx_pe_req;          
output          ctcq_entryx_tlb_all_inv;     
output  [15:0]  ctcq_entryx_tlb_asid;        
output          ctcq_entryx_tlb_asid_all_inv; 
output  [26:0]  ctcq_entryx_tlb_va;          
output          ctcq_entryx_tlb_va_all_inv;  
output          ctcq_entryx_tlb_va_asid_inv; 
output          ctcq_vld_x;                  

// &Regs; @24
reg             ctcq_2nd_trans;              
reg             ctcq_2nd_trans_vld;          
reg     [15:0]  ctcq_asid_va;                
reg     [1 :0]  ctcq_cmplt;                  
reg             ctcq_entry_vld;              
reg     [5 :0]  ctcq_type;                   
reg     [35:0]  ctcq_va_pa;                  

// &Wires; @25
wire            cp0_lsu_icg_en;              
wire            cpurst_b;                    
wire            ctcq1transclk;               
wire            ctcq2transclk;               
wire            ctcq_1trans_clk_en;          
wire            ctcq_2_cmplt_x;              
wire            ctcq_2trans_clk_en;          
wire            ctcq_cmplt_x;                
wire            ctcq_create_2nd_trans;       
wire    [15:0]  ctcq_create_asid_va;         
wire            ctcq_create_en;              
wire            ctcq_create_en_x;            
wire            ctcq_create_rdy_x;           
wire    [5 :0]  ctcq_create_type;            
wire    [35:0]  ctcq_create_va_pa;           
wire            ctcq_ctrl_clk_en;            
wire            ctcq_entryx_icache_all_inv;  
wire    [5 :0]  ctcq_entryx_icache_index;    
wire            ctcq_entryx_icache_line_inv; 
wire    [27:0]  ctcq_entryx_icache_ptag;     
wire            ctcq_entryx_pe_req;          
wire            ctcq_entryx_tlb_all_inv;     
wire    [15:0]  ctcq_entryx_tlb_asid;        
wire            ctcq_entryx_tlb_asid_all_inv; 
wire    [26:0]  ctcq_entryx_tlb_va;          
wire            ctcq_entryx_tlb_va_all_inv;  
wire            ctcq_entryx_tlb_va_asid_inv; 
wire            ctcq_inv_en;                 
wire            ctcq_inv_en_x;               
wire    [3 :0]  ctcq_type_lite;              
wire            ctcq_vld;                    
wire            ctcq_vld_x;                  
wire            ctcqctrlclk;                 
wire            ica_tlb_ctcq_inv_cmplt;      
wire            ica_tlb_ctcq_inv_cmplt_x;    
wire            lsu_snoop_clk;               
wire            pad_yy_icg_scan_en;          


//**************************************
//    ctc queue entry
//entry content:
//| entry_vld[1:0]               |
//| req_type                     |
//| asid(for tlbi)/VA(for icai)  | 
//| VA(for tlbi)/PA(for icai)    |
//| cmplt                        |
//note: 
//    VA:virtual addr
//    PA:physical addr
//    tlbi: tlb inv
//    icai: icache inv
//**************************************
//ctcq_entry_vld
always @(posedge ctcqctrlclk or negedge cpurst_b)
begin
  if(~cpurst_b)
    ctcq_entry_vld <= 1'b0;
  else if(ctcq_create_en)
    ctcq_entry_vld <= 1'b1;
  else if(ctcq_inv_en && ctcq_cmplt[0])
    ctcq_entry_vld <= 1'b0;
end
//second trans vld
always @(posedge ctcqctrlclk or negedge cpurst_b)
begin
  if(~cpurst_b)
    ctcq_2nd_trans_vld <= 1'b0;
  else
  begin
    if(ctcq_create_en && ctcq_entry_vld && ctcq_2nd_trans)
      ctcq_2nd_trans_vld <= 1'b1;
    else if(ctcq_inv_en && ctcq_cmplt[0]) //,and invalid cur entry
      ctcq_2nd_trans_vld <= 1'b0;
  end
end

//ctcq_req_vld
assign ctcq_vld =  ctcq_2nd_trans_vld
                || (ctcq_entry_vld && !ctcq_2nd_trans);
//type and asid_va
always @(posedge ctcq1transclk or negedge cpurst_b)
begin
  if(~cpurst_b)
  begin
    ctcq_type[5:0]     <= 6'b0; 
    ctcq_asid_va[15:0] <= 16'b0;
    ctcq_2nd_trans     <= 1'b0;
  end
  else if(ctcq_create_en && !ctcq_entry_vld) //first create
  begin
    ctcq_type[5:0]     <= ctcq_create_type[5:0];
    ctcq_asid_va[15:0] <= ctcq_create_asid_va[15:0];
    ctcq_2nd_trans     <= ctcq_create_2nd_trans;
  end
end

//va_pa
always @(posedge ctcq2transclk or negedge cpurst_b)
begin
  if(~cpurst_b)
    ctcq_va_pa[`PA_WIDTH-5:0]   <= {`PA_WIDTH-4{1'b0}};
  else if(ctcq_create_en && ctcq_entry_vld) //second create
    ctcq_va_pa[`PA_WIDTH-5:0]   <= ctcq_create_va_pa[`PA_WIDTH-5:0];
end

//cmplt
always @(posedge ctcqctrlclk or negedge cpurst_b)
begin
  if(~cpurst_b)
    ctcq_cmplt[1:0] <= 2'b0;
  else if(ctcq_create_en && !ctcq_entry_vld) //first create
    ctcq_cmplt[1:0] <= 2'b0;
  else if(ica_tlb_ctcq_inv_cmplt && !ctcq_2nd_trans) //1 trans cmplt
    ctcq_cmplt[1:0] <= 2'b01;
  else if(ica_tlb_ctcq_inv_cmplt && ctcq_2nd_trans) //2 trans cmplt
    ctcq_cmplt[1:0] <= 2'b10;
  else if(ctcq_inv_en)
    ctcq_cmplt[1:0] <= ctcq_cmplt[1:0] - 2'b01;
end

//==========================================================
// low power gated clock for snq entry
//==========================================================
assign ctcq_ctrl_clk_en =  ctcq_create_en
                        || ctcq_cmplt_x
                        || ica_tlb_ctcq_inv_cmplt; 

// &Instance("gated_clk_cell","x_ctcq_ctrl_gated_cell"); @116
gated_clk_cell  x_ctcq_ctrl_gated_cell (
  .clk_in             (lsu_snoop_clk     ),
  .clk_out            (ctcqctrlclk       ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (ctcq_ctrl_clk_en  ),
  .module_en          (cp0_lsu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect( .clk_in           (lsu_snoop_clk         ), @117
//           .clk_out          (ctcqctrlclk            ), @118
//           .external_en      (1'b0                   ), @119
//           .global_en        (1'b1                   ), @120
//           .local_en         (ctcq_ctrl_clk_en       ), @121
//           .module_en        (cp0_lsu_icg_en   ) @122
//         );  @123

assign ctcq_1trans_clk_en =  ctcq_create_en && !ctcq_entry_vld;

// &Instance("gated_clk_cell","x_ctcq_1trans_gated_cell"); @127
gated_clk_cell  x_ctcq_1trans_gated_cell (
  .clk_in             (lsu_snoop_clk     ),
  .clk_out            (ctcq1transclk     ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (ctcq_1trans_clk_en),
  .module_en          (cp0_lsu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect( .clk_in           (lsu_snoop_clk         ), @128
//           .clk_out          (ctcq1transclk          ), @129
//           .external_en      (1'b0                   ), @130
//           .global_en        (1'b1                   ), @131
//           .local_en         (ctcq_1trans_clk_en     ), @132
//           .module_en        (cp0_lsu_icg_en   ) @133
//         ); @134

assign ctcq_2trans_clk_en =  ctcq_create_en && ctcq_entry_vld;

// &Instance("gated_clk_cell","x_ctcq_2trans_gated_cell"); @138
gated_clk_cell  x_ctcq_2trans_gated_cell (
  .clk_in             (lsu_snoop_clk     ),
  .clk_out            (ctcq2transclk     ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (ctcq_2trans_clk_en),
  .module_en          (cp0_lsu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect( .clk_in           (lsu_snoop_clk         ), @139
//           .clk_out          (ctcq2transclk          ), @140
//           .external_en      (1'b0                   ), @141
//           .global_en        (1'b1                   ), @142
//           .local_en         (ctcq_2trans_clk_en     ), @143
//           .module_en        (cp0_lsu_icg_en   ) @144
//         ); @145

//**********************************************************
//                    input/output
//**********************************************************
//==========================================================
//                     CTCQ entry content create
//1.Req type:first transaction (ctcq_type[5:0])
//   | Addr[14:12] | Addr[6:5] | Addr[0] |               |
//   |     000     |    00     |    0    | TLBI_ALL      |
//   |     000     |    00     |    1    | TLBI_VA_ALL   |
//   |     000     |    01     |    0    | TLBI_ASID_ALL |
//   |     000     |    01     |    1    | TLBI_VA_ASID  |
//   |     010     |    11     |    1    | ICI_VA        |
//   |     010     |    00     |    0    | ICI_ALL       |
//2.ASID(for TLBI) or VA(for ICI):first transaction
//  if(TLBI_ASID_ALL || TLBI_VA_ASID): ASID = Addr[23:16]
//  if(ICI_VA): VA = ADDR[31:16]
//3.VA(for TLBI) or PA(for ICI):second transaction
//(only exist when first transaction addr[0]==1)
//   
//==========================================================
assign ctcq_type_lite[3:0] = {ctcq_type[4],ctcq_type[2:0]};//for timing
//input
assign ctcq_create_en         = ctcq_create_en_x;
assign ica_tlb_ctcq_inv_cmplt = ica_tlb_ctcq_inv_cmplt_x;
assign ctcq_inv_en            = ctcq_inv_en_x;
//output
//valid
//assign ctcq_vld_x = ctcq_vld;
assign ctcq_vld_x = ctcq_entry_vld;
assign ctcq_create_rdy_x = !ctcq_vld;
//icache inv 
//assign ctcq_entryx_icache_all_inv    = (ctcq_type[5:0] == 6'b010000) && ctcq_vld;
//assign ctcq_entryx_icache_line_inv   = (ctcq_type[5:0] == 6'b010111) && ctcq_vld;
assign ctcq_entryx_pe_req            = ctcq_vld && !(|ctcq_cmplt[1:0]);
assign ctcq_entryx_icache_all_inv    = ctcq_type_lite[3:0] == 4'b1000;
assign ctcq_entryx_icache_line_inv   = ctcq_type_lite[3:0] == 4'b1001;
assign ctcq_entryx_icache_index[5:0] = ctcq_va_pa[7:2]  & {6{ctcq_vld}};
assign ctcq_entryx_icache_ptag[`PA_WIDTH-13:0]  = 
                ctcq_va_pa[`PA_WIDTH-5:8] & {`PA_WIDTH-12{ctcq_vld}};
//tlb inv
//assign ctcq_entryx_tlb_all_inv      = (ctcq_type[5:0] == 6'b000000) && ctcq_vld;
//assign ctcq_entryx_tlb_va_all_inv   = (ctcq_type[5:0] == 6'b000001) && ctcq_vld;
//assign ctcq_entryx_tlb_asid_all_inv = (ctcq_type[5:0] == 6'b000010) && ctcq_vld;
//assign ctcq_entryx_tlb_va_asid_inv  = (ctcq_type[5:0] == 6'b000011) && ctcq_vld;
assign ctcq_entryx_tlb_all_inv      = ctcq_type_lite[3:0] == 4'b0000;
assign ctcq_entryx_tlb_va_all_inv   = ctcq_type_lite[3:0] == 4'b0001;
assign ctcq_entryx_tlb_asid_all_inv = ctcq_type_lite[3:0] == 4'b0010;
assign ctcq_entryx_tlb_va_asid_inv  = ctcq_type_lite[3:0] == 4'b0011;
assign ctcq_entryx_tlb_asid[15:0]   = ctcq_asid_va[15:0] & {16{ctcq_vld}};
assign ctcq_entryx_tlb_va[`VA_WIDTH-13:0] = ctcq_va_pa[`VA_WIDTH-5:8]   & {`VA_WIDTH-12{ctcq_vld}};

//cmplt
//assign ctcq_cmplt_x = ctcq_cmplt && ctcq_vld;
// &Force("output","ctcq_cmplt_x"); @200
assign ctcq_cmplt_x   = |ctcq_cmplt[1:0];
assign ctcq_2_cmplt_x = ctcq_cmplt[1];

// &ModuleEnd; @204
endmodule




