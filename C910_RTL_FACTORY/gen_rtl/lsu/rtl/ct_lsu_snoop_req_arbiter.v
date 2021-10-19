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
module ct_lsu_snoop_req_arbiter(
  arb_ctcq_ctc_2nd_trans,
  arb_ctcq_ctc_asid_va,
  arb_ctcq_ctc_type,
  arb_ctcq_ctc_va_pa,
  arb_ctcq_entry_oldest_index,
  arb_snq_entry_oldest_index,
  arb_snq_snoop_addr,
  arb_snq_snoop_depd,
  arb_snq_snoop_prot,
  arb_snq_snoop_type,
  biu_lsu_ac_addr,
  biu_lsu_ac_prot,
  biu_lsu_ac_req,
  biu_lsu_ac_snoop,
  biu_lsu_cr_resp_acept,
  biu_lsu_ctc_req,
  cp0_lsu_icg_en,
  cpurst_b,
  ctc_req_create_en,
  ctcq_biu_2_cmplt,
  ctcq_biu_cr_valid,
  cur_ctcq_entry_empty,
  cur_snq_entry_empty,
  forever_cpuclk,
  icc_snq_create_permit,
  lm_snq_stall,
  lsu_biu_ac_empty,
  lsu_biu_ac_ready,
  lsu_ctcq_not_empty,
  lsu_sdb_not_empty,
  lsu_snoop_clk,
  lsu_snq_not_empty,
  pad_yy_icg_scan_en,
  snoop_req_create_en,
  snq_biu_cr_valid,
  vb_snq_depd,
  wmb_snq_depd
);

// &Ports; @25
input   [39:0]  biu_lsu_ac_addr;            
input   [2 :0]  biu_lsu_ac_prot;            
input           biu_lsu_ac_req;             
input   [3 :0]  biu_lsu_ac_snoop;           
input           biu_lsu_cr_resp_acept;      
input           cp0_lsu_icg_en;             
input           cpurst_b;                   
input           ctcq_biu_2_cmplt;           
input           ctcq_biu_cr_valid;          
input           cur_ctcq_entry_empty;       
input           cur_snq_entry_empty;        
input           forever_cpuclk;             
input           icc_snq_create_permit;      
input           lm_snq_stall;               
input           lsu_ctcq_not_empty;         
input           lsu_sdb_not_empty;          
input           lsu_snq_not_empty;          
input           pad_yy_icg_scan_en;         
input           snq_biu_cr_valid;           
input   [1 :0]  vb_snq_depd;                
input   [7 :0]  wmb_snq_depd;               
output          arb_ctcq_ctc_2nd_trans;     
output  [23:0]  arb_ctcq_ctc_asid_va;       
output  [5 :0]  arb_ctcq_ctc_type;          
output  [35:0]  arb_ctcq_ctc_va_pa;         
output  [5 :0]  arb_ctcq_entry_oldest_index; 
output  [5 :0]  arb_snq_entry_oldest_index; 
output  [39:0]  arb_snq_snoop_addr;         
output  [9 :0]  arb_snq_snoop_depd;         
output  [2 :0]  arb_snq_snoop_prot;         
output  [3 :0]  arb_snq_snoop_type;         
output          biu_lsu_ctc_req;            
output          ctc_req_create_en;          
output          lsu_biu_ac_empty;           
output          lsu_biu_ac_ready;           
output          lsu_snoop_clk;              
output          snoop_req_create_en;        

// &Regs; @26
reg     [4 :0]  coq_create_ptr;             
reg     [4 :0]  coq_pop_ptr;                
reg     [17:0]  create_order_source;        
reg     [5 :0]  ctcq_entry_oldest_index;    
reg     [5 :0]  snq_entry_oldest_index;     

// &Wires; @27
wire            arb_ctcq_ctc_2nd_trans;     
wire    [23:0]  arb_ctcq_ctc_asid_va;       
wire    [5 :0]  arb_ctcq_ctc_type;          
wire    [35:0]  arb_ctcq_ctc_va_pa;         
wire    [5 :0]  arb_ctcq_entry_oldest_index; 
wire    [5 :0]  arb_snq_entry_oldest_index; 
wire    [39:0]  arb_snq_snoop_addr;         
wire    [9 :0]  arb_snq_snoop_depd;         
wire    [2 :0]  arb_snq_snoop_prot;         
wire    [3 :0]  arb_snq_snoop_type;         
wire    [39:0]  biu_lsu_ac_addr;            
wire    [2 :0]  biu_lsu_ac_prot;            
wire            biu_lsu_ac_req;             
wire    [3 :0]  biu_lsu_ac_snoop;           
wire            biu_lsu_cr_resp_acept;      
wire            biu_lsu_ctc_req;            
wire            biu_lsu_snp_req;            
wire            coq_create_max;             
wire            coq_pop_max;                
wire            cp0_lsu_icg_en;             
wire            cpurst_b;                   
wire            ctc_req_aft_check;          
wire            ctc_req_create_en;          
wire            ctcq_biu_2_cmplt;           
wire            ctcq_biu_cr_valid;          
wire            cur_ctcq_entry_empty;       
wire            cur_snq_entry_empty;        
wire            forever_cpuclk;             
wire            icc_snq_create_permit;      
wire            lm_snq_stall;               
wire            lsu_biu_ac_empty;           
wire            lsu_biu_ac_ready;           
wire            lsu_ctcq_not_empty;         
wire            lsu_sdb_not_empty;          
wire            lsu_snoop_clk;              
wire            lsu_snoop_clk_en;           
wire            lsu_snq_not_empty;          
wire            pad_yy_icg_scan_en;         
wire            snoop_req_aft_check;        
wire            snoop_req_create_en;        
wire            snp_create_clk_en;          
wire            snp_ctcq_clk_en;            
wire            snp_pop_clk_en;             
wire            snp_snq_clk_en;             
wire            snpcrtclk;                  
wire            snpindexclk0;               
wire            snpindexclk1;               
wire            snppopclk;                  
wire            snq_biu_cr_valid;           
wire    [1 :0]  vb_snq_depd;                
wire    [7 :0]  wmb_snq_depd;               


assign lsu_snoop_clk_en =  biu_lsu_ac_req
                        || lsu_snq_not_empty
                        || lsu_sdb_not_empty
                        || lsu_ctcq_not_empty; 
// &Force("output","lsu_snoop_clk"); @33
// &Instance("gated_clk_cell", "x_lsu_snoop_clk"); @34
gated_clk_cell  x_lsu_snoop_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (lsu_snoop_clk     ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (lsu_snoop_clk_en  ),
  .module_en          (cp0_lsu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in        (forever_cpuclk     ), @35
//          .external_en   (1'b0               ), @36
//          .global_en     (1'b1               ), @37
//          .module_en     (cp0_lsu_icg_en     ), @38
//          .local_en      (lsu_snoop_clk_en   ), @39
//          .clk_out       (lsu_snoop_clk      )); @40

//==========================================================
//                    Snoop Req create condition
//                    normal snoop & ctc
//  condition to create into SNQ(snoop queue):
//  1. icc is idle
//  2. no lfb stall
//  3. cur snq entry empty(ready)
//  condition to create into CTCQ(CTC queue):
//  1.cur ctcq entry empty(ready)
//  note:snpu:snoop uint
//==========================================================
// &Force("output","snoop_req_create_en"); @53
// &Force("output","ctc_req_create_en"); @54
assign snoop_req_create_en = snoop_req_aft_check && lsu_biu_ac_ready;
assign ctc_req_create_en   = ctc_req_aft_check   && lsu_biu_ac_ready;

assign snoop_req_aft_check =   biu_lsu_snp_req
                           &&  icc_snq_create_permit
//                           && !lfb_snq_stall
                           &&  !lm_snq_stall
                           &&  cur_snq_entry_empty;

assign ctc_req_aft_check   =   biu_lsu_ctc_req
                           &&  cur_ctcq_entry_empty;

assign biu_lsu_snp_req  =   biu_lsu_ac_req
                        && !biu_lsu_ctc_req;
// &Force("output","biu_lsu_ctc_req"); @69
assign biu_lsu_ctc_req  =   biu_lsu_ac_req 
                        &&  biu_lsu_ac_snoop[3:0] == 4'b1111; //ctc req
//ac_ready cannot depend on req
// &Force("output","lsu_biu_ac_ready"); @73
assign lsu_biu_ac_ready =  ((cur_snq_entry_empty && biu_lsu_snp_req) || (cur_ctcq_entry_empty && biu_lsu_ctc_req))
//                        && !lfb_snq_stall
                        && !lm_snq_stall
                        && icc_snq_create_permit;

//for core icg
assign lsu_biu_ac_empty = !lsu_snoop_clk_en;

//==========================================================
//                     SNQ entry content create
//1.depend check with VB/WMB, only for normal snoop req
//2.snoop type
//3.addr
//4.prot
//==========================================================
//for depend check

assign arb_snq_snoop_depd[9:0] = {wmb_snq_depd[7:0], vb_snq_depd[1:0]};
assign arb_snq_snoop_type[3:0]  = biu_lsu_ac_snoop[3:0];
assign arb_snq_snoop_addr[`PA_WIDTH-1:0] = biu_lsu_ac_addr[`PA_WIDTH-1:0];
assign arb_snq_snoop_prot[2:0]  = biu_lsu_ac_prot[2:0];

//==========================================================
//                     CTCQ entry content create
//1.Req type:first transaction
//   | Addr[14:12] | Addr[6:5] | Addr[0] |               |
//   |     000     |    00     |    0    | TLBI_ALL      |
//   |     000     |    00     |    1    | TLBI_VA_ALL   |
//   |     000     |    01     |    0    | TLBI_ASID_ALL |
//   |     000     |    01     |    1    | TLBI_VA_ASID  |
//   |     010     |    11     |    1    | ICI_VA        |
//   |     010     |    00     |    0    | ICI_ALL       |
//2.ASID(for TLBI) or VA(for ICI):first transaction
//  if(TLBI_ASID_ALL || TLBI_VA_ASID): ASID = Addr[23:16]
//  if(ICI_VA): VA = ADDR[`PA_WIDTH-1:16]
//3.VA(for TLBI) or PA(for ICI):second transaction
//(only exist when first transaction addr[0]==1)
//   
//==========================================================

assign arb_ctcq_ctc_type[5:0]     = {biu_lsu_ac_addr[14:12] //1st trans
                                    ,biu_lsu_ac_addr[6:5]
                                    ,biu_lsu_ac_addr[0]};
assign arb_ctcq_ctc_asid_va[`PA_WIDTH-17:0] = biu_lsu_ac_addr[`PA_WIDTH-1:16]; //1st trans
assign arb_ctcq_ctc_2nd_trans               = biu_lsu_ac_addr[0];     //1st trans
assign arb_ctcq_ctc_va_pa[`PA_WIDTH-5:0]    = biu_lsu_ac_addr[`PA_WIDTH-1:4];  //2nd trans




//==========================================================
//                   Create Order Queue
//          record normal snoop/ctc req create order
//         SNQ(6 entry) & CTCQ(6 entry) order together
//entry content:
//| vld | entryid[3:0] |
//in which,entryid[3] : snq(0) or ctcq(1)
//         entry[2:0] : entryid in snq/ctcq
//==========================================================
//for syntax
assign coq_create_max = (coq_create_ptr[4:0] == 5'd17);
assign coq_pop_max    = (coq_pop_ptr[4:0] == 5'd17);

parameter COQ_ENTRY = 18; //must >=(SNQ + 2*CTCQ)
always @(posedge snpcrtclk or negedge cpurst_b)
begin
  if(~cpurst_b)
    coq_create_ptr[4:0] <= 5'b0;
  else if(snoop_req_create_en || ctc_req_create_en)
  begin
    if(coq_create_max) //0~17 entry
      coq_create_ptr[4:0] <= 5'b0;
    else
      coq_create_ptr[4:0] <= coq_create_ptr[4:0] + 5'b1;
  end
end

always @(posedge snppopclk or negedge cpurst_b)
begin
  if(~cpurst_b)
    coq_pop_ptr[4:0] <= 5'b0;
  else if(biu_lsu_cr_resp_acept)
  begin
    if(coq_pop_max) //0~17 entry
      coq_pop_ptr[4:0] <= 5'b0;
    else
      coq_pop_ptr[4:0] <= coq_pop_ptr[4:0] + 5'b1;
  end
end
integer i;
// &Force("bus","create_order_source",17,0); @164
always @(posedge snpcrtclk or negedge cpurst_b)
begin
  if(~cpurst_b)
  begin
   for(i=0;i<COQ_ENTRY;i=i+1)
     create_order_source[i] <= 1'b0;
  end
  else
  begin
    for(i=0;i<COQ_ENTRY;i=i+1)
    begin
      if(snoop_req_create_en && (coq_create_ptr[4:0] == i))
        create_order_source[i]  <= 1'b0; //stand for snq
      else if(ctc_req_create_en && (coq_create_ptr[4:0] == i))
        create_order_source[i]  <= 1'b1; //stand for ctcq
      else
        create_order_source[i]  <= create_order_source[i];
    end
  end
end

always @(posedge snpindexclk0 or negedge cpurst_b)
begin
  if(~cpurst_b)
    snq_entry_oldest_index[5:0] <= 6'b000001;
  else if(biu_lsu_cr_resp_acept && snq_biu_cr_valid)
    snq_entry_oldest_index[5:0] <= {snq_entry_oldest_index[4:0],snq_entry_oldest_index[5]};
end
always @(posedge snpindexclk1 or negedge cpurst_b)
begin
  if(~cpurst_b)
    ctcq_entry_oldest_index[5:0] <= 6'b000001;
  else if(biu_lsu_cr_resp_acept && ctcq_biu_cr_valid && !ctcq_biu_2_cmplt)
    ctcq_entry_oldest_index[5:0] <= {ctcq_entry_oldest_index[4:0],ctcq_entry_oldest_index[5]};
end

//--------------------------------------
//oldest entry(snq/ctcq), for resp return etc.
assign arb_snq_entry_oldest_index[5:0]  = snq_entry_oldest_index[5:0]
                                        & {6{~create_order_source[coq_pop_ptr[4:0]]}};

assign arb_ctcq_entry_oldest_index[5:0] = ctcq_entry_oldest_index[5:0]
                                        & {6{create_order_source[coq_pop_ptr[4:0]]}};


//==========================================================
// low power gated clock for ca_wt
//==========================================================
assign snp_create_clk_en =  snoop_req_create_en
                         || ctc_req_create_en;

// &Instance("gated_clk_cell","x_snp_create_gated_cell"); @216
gated_clk_cell  x_snp_create_gated_cell (
  .clk_in             (lsu_snoop_clk     ),
  .clk_out            (snpcrtclk         ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (snp_create_clk_en ),
  .module_en          (cp0_lsu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect( .clk_in           (lsu_snoop_clk      ), @217
//           .clk_out          (snpcrtclk           ), @218
//           .external_en      (1'b0                ), @219
//           .global_en        (1'b1                ), @220
//           .local_en         (snp_create_clk_en   ), @221
//           .module_en        (cp0_lsu_icg_en   ) @222
//         ); @223

assign snp_pop_clk_en = snq_biu_cr_valid || ctcq_biu_cr_valid;
// &Instance("gated_clk_cell","x_snp_pop_gated_cell"); @226
gated_clk_cell  x_snp_pop_gated_cell (
  .clk_in             (lsu_snoop_clk     ),
  .clk_out            (snppopclk         ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (snp_pop_clk_en    ),
  .module_en          (cp0_lsu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect( .clk_in           (lsu_snoop_clk      ), @227
//           .clk_out          (snppopclk           ), @228
//           .external_en      (1'b0                ), @229
//           .global_en        (1'b1                ), @230
//           .local_en         (snp_pop_clk_en      ), @231
//           .module_en        (cp0_lsu_icg_en   ) @232
//         ); @233

assign snp_snq_clk_en = snq_biu_cr_valid;
// &Instance("gated_clk_cell","x_snp_snq_gated_cell"); @236
gated_clk_cell  x_snp_snq_gated_cell (
  .clk_in             (lsu_snoop_clk     ),
  .clk_out            (snpindexclk0      ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (snp_snq_clk_en    ),
  .module_en          (cp0_lsu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect( .clk_in           (lsu_snoop_clk      ), @237
//           .clk_out          (snpindexclk0        ), @238
//           .external_en      (1'b0                ), @239
//           .global_en        (1'b1                ), @240
//           .local_en         (snp_snq_clk_en      ), @241
//           .module_en        (cp0_lsu_icg_en   ) @242
//         ); @243

assign snp_ctcq_clk_en = ctcq_biu_cr_valid && !ctcq_biu_2_cmplt;
// &Instance("gated_clk_cell","x_snp_ctcq_gated_cell"); @246
gated_clk_cell  x_snp_ctcq_gated_cell (
  .clk_in             (lsu_snoop_clk     ),
  .clk_out            (snpindexclk1      ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (snp_ctcq_clk_en   ),
  .module_en          (cp0_lsu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect( .clk_in           (lsu_snoop_clk      ), @247
//           .clk_out          (snpindexclk1        ), @248
//           .external_en      (1'b0                ), @249
//           .global_en        (1'b1                ), @250
//           .local_en         (snp_ctcq_clk_en     ), @251
//           .module_en        (cp0_lsu_icg_en   ) @252
//         ); @253


// &ModuleEnd; @256
endmodule




