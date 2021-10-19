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
module ct_lsu_snoop_ctcq(
  arb_ctcq_ctc_2nd_trans,
  arb_ctcq_ctc_asid_va,
  arb_ctcq_ctc_type,
  arb_ctcq_ctc_va_pa,
  arb_ctcq_entry_oldest_index,
  biu_ctcq_cr_ready,
  cp0_lsu_ctc_flush_dis,
  cp0_lsu_icg_en,
  cpurst_b,
  ctc_req_create_en,
  ctcq_biu_2_cmplt,
  ctcq_biu_cr_resp,
  ctcq_biu_cr_valid,
  cur_ctcq_entry_empty,
  ifu_lsu_icache_inv_done,
  lsu_ctcq_not_empty,
  lsu_had_ctcq_entry_2_cmplt,
  lsu_had_ctcq_entry_cmplt,
  lsu_had_ctcq_entry_vld,
  lsu_ifu_icache_all_inv,
  lsu_ifu_icache_index,
  lsu_ifu_icache_line_inv,
  lsu_ifu_icache_ptag,
  lsu_mmu_tlb_all_inv,
  lsu_mmu_tlb_asid,
  lsu_mmu_tlb_asid_all_inv,
  lsu_mmu_tlb_va,
  lsu_mmu_tlb_va_all_inv,
  lsu_mmu_tlb_va_asid_inv,
  lsu_rtu_ctc_flush_vld,
  lsu_snoop_clk,
  mmu_lsu_tlb_inv_done,
  pad_yy_icg_scan_en
);

// &Ports; @24
input           arb_ctcq_ctc_2nd_trans;      
input   [23:0]  arb_ctcq_ctc_asid_va;        
input   [5 :0]  arb_ctcq_ctc_type;           
input   [35:0]  arb_ctcq_ctc_va_pa;          
input   [5 :0]  arb_ctcq_entry_oldest_index; 
input           biu_ctcq_cr_ready;           
input           cp0_lsu_ctc_flush_dis;       
input           cp0_lsu_icg_en;              
input           cpurst_b;                    
input           ctc_req_create_en;           
input           ifu_lsu_icache_inv_done;     
input           lsu_snoop_clk;               
input           mmu_lsu_tlb_inv_done;        
input           pad_yy_icg_scan_en;          
output          ctcq_biu_2_cmplt;            
output  [4 :0]  ctcq_biu_cr_resp;            
output          ctcq_biu_cr_valid;           
output          cur_ctcq_entry_empty;        
output          lsu_ctcq_not_empty;          
output  [5 :0]  lsu_had_ctcq_entry_2_cmplt;  
output  [5 :0]  lsu_had_ctcq_entry_cmplt;    
output  [5 :0]  lsu_had_ctcq_entry_vld;      
output          lsu_ifu_icache_all_inv;      
output  [5 :0]  lsu_ifu_icache_index;        
output          lsu_ifu_icache_line_inv;     
output  [27:0]  lsu_ifu_icache_ptag;         
output          lsu_mmu_tlb_all_inv;         
output  [15:0]  lsu_mmu_tlb_asid;            
output          lsu_mmu_tlb_asid_all_inv;    
output  [26:0]  lsu_mmu_tlb_va;              
output          lsu_mmu_tlb_va_all_inv;      
output          lsu_mmu_tlb_va_asid_inv;     
output          lsu_rtu_ctc_flush_vld;       

// &Regs; @25
reg             ctc_async_flush;             
reg             ctcq_ctc_req;                
reg             ctcq_icache_all_inv;         
reg     [5 :0]  ctcq_icache_idx;             
reg             ctcq_icache_line_inv;        
reg     [27:0]  ctcq_icache_ptag;            
reg     [5 :0]  ctcq_req_create_ptr;         
reg     [5 :0]  ctcq_req_launch_ptr;         
reg             ctcq_tlb_all_inv;            
reg     [15:0]  ctcq_tlb_asid;               
reg             ctcq_tlb_asid_all_inv;       
reg     [26:0]  ctcq_tlb_va;                 
reg             ctcq_tlb_va_all_inv;         
reg             ctcq_tlb_va_asid_inv;        

// &Wires; @26
wire            arb_ctcq_ctc_2nd_trans;      
wire    [23:0]  arb_ctcq_ctc_asid_va;        
wire    [5 :0]  arb_ctcq_ctc_type;           
wire    [35:0]  arb_ctcq_ctc_va_pa;          
wire    [5 :0]  arb_ctcq_entry_oldest_index; 
wire            biu_ctcq_cr_ready;           
wire    [5 :0]  biu_ctcq_cr_resp_acept;      
wire            cp0_lsu_ctc_flush_dis;       
wire            cp0_lsu_icg_en;              
wire            cpurst_b;                    
wire            ctc_req_create_en;           
wire    [5 :0]  ctcq_2_cmplt;                
wire            ctcq_biu_2_cmplt;            
wire    [4 :0]  ctcq_biu_cr_resp;            
wire            ctcq_biu_cr_valid;           
wire    [5 :0]  ctcq_cmplt;                  
wire            ctcq_create_2nd_trans;       
wire    [15:0]  ctcq_create_asid_va;         
wire    [23:0]  ctcq_create_asid_va_truncat; 
wire    [5 :0]  ctcq_create_en;              
wire    [5 :0]  ctcq_create_rdy;             
wire    [5 :0]  ctcq_create_type;            
wire    [35:0]  ctcq_create_va_pa;           
wire            ctcq_crt_clk;                
wire            ctcq_crt_clk_en;             
wire            ctcq_entry0_icache_all_inv;  
wire    [5 :0]  ctcq_entry0_icache_index;    
wire            ctcq_entry0_icache_line_inv; 
wire    [27:0]  ctcq_entry0_icache_ptag;     
wire            ctcq_entry0_pe_req;          
wire            ctcq_entry0_tlb_all_inv;     
wire    [15:0]  ctcq_entry0_tlb_asid;        
wire            ctcq_entry0_tlb_asid_all_inv; 
wire    [26:0]  ctcq_entry0_tlb_va;          
wire            ctcq_entry0_tlb_va_all_inv;  
wire            ctcq_entry0_tlb_va_asid_inv; 
wire            ctcq_entry1_icache_all_inv;  
wire    [5 :0]  ctcq_entry1_icache_index;    
wire            ctcq_entry1_icache_line_inv; 
wire    [27:0]  ctcq_entry1_icache_ptag;     
wire            ctcq_entry1_pe_req;          
wire            ctcq_entry1_tlb_all_inv;     
wire    [15:0]  ctcq_entry1_tlb_asid;        
wire            ctcq_entry1_tlb_asid_all_inv; 
wire    [26:0]  ctcq_entry1_tlb_va;          
wire            ctcq_entry1_tlb_va_all_inv;  
wire            ctcq_entry1_tlb_va_asid_inv; 
wire            ctcq_entry2_icache_all_inv;  
wire    [5 :0]  ctcq_entry2_icache_index;    
wire            ctcq_entry2_icache_line_inv; 
wire    [27:0]  ctcq_entry2_icache_ptag;     
wire            ctcq_entry2_pe_req;          
wire            ctcq_entry2_tlb_all_inv;     
wire    [15:0]  ctcq_entry2_tlb_asid;        
wire            ctcq_entry2_tlb_asid_all_inv; 
wire    [26:0]  ctcq_entry2_tlb_va;          
wire            ctcq_entry2_tlb_va_all_inv;  
wire            ctcq_entry2_tlb_va_asid_inv; 
wire            ctcq_entry3_icache_all_inv;  
wire    [5 :0]  ctcq_entry3_icache_index;    
wire            ctcq_entry3_icache_line_inv; 
wire    [27:0]  ctcq_entry3_icache_ptag;     
wire            ctcq_entry3_pe_req;          
wire            ctcq_entry3_tlb_all_inv;     
wire    [15:0]  ctcq_entry3_tlb_asid;        
wire            ctcq_entry3_tlb_asid_all_inv; 
wire    [26:0]  ctcq_entry3_tlb_va;          
wire            ctcq_entry3_tlb_va_all_inv;  
wire            ctcq_entry3_tlb_va_asid_inv; 
wire            ctcq_entry4_icache_all_inv;  
wire    [5 :0]  ctcq_entry4_icache_index;    
wire            ctcq_entry4_icache_line_inv; 
wire    [27:0]  ctcq_entry4_icache_ptag;     
wire            ctcq_entry4_pe_req;          
wire            ctcq_entry4_tlb_all_inv;     
wire    [15:0]  ctcq_entry4_tlb_asid;        
wire            ctcq_entry4_tlb_asid_all_inv; 
wire    [26:0]  ctcq_entry4_tlb_va;          
wire            ctcq_entry4_tlb_va_all_inv;  
wire            ctcq_entry4_tlb_va_asid_inv; 
wire            ctcq_entry5_icache_all_inv;  
wire    [5 :0]  ctcq_entry5_icache_index;    
wire            ctcq_entry5_icache_line_inv; 
wire    [27:0]  ctcq_entry5_icache_ptag;     
wire            ctcq_entry5_pe_req;          
wire            ctcq_entry5_tlb_all_inv;     
wire    [15:0]  ctcq_entry5_tlb_asid;        
wire            ctcq_entry5_tlb_asid_all_inv; 
wire    [26:0]  ctcq_entry5_tlb_va;          
wire            ctcq_entry5_tlb_va_all_inv;  
wire            ctcq_entry5_tlb_va_asid_inv; 
wire    [5 :0]  ctcq_inv_en;                 
wire            ctcq_pe_clk;                 
wire            ctcq_pe_clk_en;              
wire            ctcq_pe_req;                 
wire            ctcq_pe_req_icache_all_inv;  
wire    [5 :0]  ctcq_pe_req_icache_index;    
wire            ctcq_pe_req_icache_line_inv; 
wire    [27:0]  ctcq_pe_req_icache_ptag;     
wire            ctcq_pe_req_tlb_all_inv;     
wire    [15:0]  ctcq_pe_req_tlb_asid;        
wire            ctcq_pe_req_tlb_asid_all_inv; 
wire    [26:0]  ctcq_pe_req_tlb_va;          
wire            ctcq_pe_req_tlb_va_all_inv;  
wire            ctcq_pe_req_tlb_va_asid_inv; 
wire    [5 :0]  ctcq_req_launch_en_index;    
wire    [5 :0]  ctcq_resp_return_index;      
wire    [5 :0]  ctcq_vld;                    
wire            cur_ctcq_entry_empty;        
wire    [5 :0]  ica_tlb_ctcq_inv_cmplt;      
wire            ifu_lsu_icache_inv_done;     
wire            lsu_ctcq_not_empty;          
wire    [5 :0]  lsu_had_ctcq_entry_2_cmplt;  
wire    [5 :0]  lsu_had_ctcq_entry_cmplt;    
wire    [5 :0]  lsu_had_ctcq_entry_vld;      
wire            lsu_ifu_icache_all_inv;      
wire    [5 :0]  lsu_ifu_icache_index;        
wire            lsu_ifu_icache_line_inv;     
wire    [27:0]  lsu_ifu_icache_ptag;         
wire            lsu_mmu_tlb_all_inv;         
wire    [15:0]  lsu_mmu_tlb_asid;            
wire            lsu_mmu_tlb_asid_all_inv;    
wire    [26:0]  lsu_mmu_tlb_va;              
wire            lsu_mmu_tlb_va_all_inv;      
wire            lsu_mmu_tlb_va_asid_inv;     
wire            lsu_rtu_ctc_flush_vld;       
wire            lsu_snoop_clk;               
wire            mmu_lsu_tlb_inv_done;        
wire            pad_yy_icg_scan_en;          


//**************************************
//   to had
//**************************************
assign lsu_ctcq_not_empty     = |ctcq_vld[5:0];
//**************************************
//   ctc queue req create
//**************************************
assign cur_ctcq_entry_empty = |(ctcq_req_create_ptr[5:0] & ctcq_create_rdy[5:0]);
//ctc queue pointer update:one hot
//6 entry
always @(posedge ctcq_crt_clk or negedge cpurst_b)
begin
  if(~cpurst_b)
    ctcq_req_create_ptr[5:0] <= 6'b1;
  else if(ctc_req_create_en && !ctcq_create_2nd_trans)
    ctcq_req_create_ptr[5:0] <= {ctcq_req_create_ptr[4:0],
                                 ctcq_req_create_ptr[5]};
end

assign ctcq_create_en[5:0] = {6{ctc_req_create_en}}
                           & ctcq_req_create_ptr[5:0];
//content create
assign ctcq_create_type[5:0]     = arb_ctcq_ctc_type[5:0];

assign ctcq_create_asid_va_truncat[`PA_WIDTH-17:0] = arb_ctcq_ctc_asid_va[`PA_WIDTH-17:0];
assign ctcq_create_asid_va[15:0] = {ctcq_create_asid_va_truncat[`PA_WIDTH-17:`PA_WIDTH-24],ctcq_create_asid_va_truncat[7:0]};
assign ctcq_create_2nd_trans     = arb_ctcq_ctc_2nd_trans;
assign ctcq_create_va_pa[`PA_WIDTH-5:0]   = arb_ctcq_ctc_va_pa[`PA_WIDTH-5:0];

//for record into Create Order Queue
//assign ctcq_cur_create_entryid[5:0] = ctcq_create_en[5:0];

//**************************************
//   ctc queue req pop entry
//**************************************
always @(posedge ctcq_pe_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ctcq_ctc_req              <=  1'b0;
  else if(ifu_lsu_icache_inv_done ||  mmu_lsu_tlb_inv_done)
    ctcq_ctc_req              <=  1'b0;
  else if(!ctcq_ctc_req  &&  ctcq_pe_req)
    ctcq_ctc_req              <=  1'b1;
end

always @(posedge ctcq_pe_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
  begin
    ctcq_icache_all_inv                 <=  1'b0;
    ctcq_icache_line_inv                <=  1'b0;
    ctcq_icache_idx[5:0]                <=  6'b0;
    ctcq_icache_ptag[`PA_WIDTH-13:0]    <=  {`PA_WIDTH-12{1'b0}};
    ctcq_tlb_all_inv                    <=  1'b0;
    ctcq_tlb_va_all_inv                 <=  1'b0;
    ctcq_tlb_asid_all_inv               <=  1'b0;
    ctcq_tlb_va_asid_inv                <=  1'b0;
    ctcq_tlb_asid[15:0]                 <=  16'b0;
    ctcq_tlb_va[`VA_WIDTH-13:0]         <=  {`VA_WIDTH-12{1'b0}};
  end
  else if(!ctcq_ctc_req  &&  ctcq_pe_req)
  begin
    ctcq_icache_all_inv                 <=  ctcq_pe_req_icache_all_inv;
    ctcq_icache_line_inv                <=  ctcq_pe_req_icache_line_inv;
    ctcq_icache_idx[5:0]                <=  ctcq_pe_req_icache_index[5:0];
    ctcq_icache_ptag[`PA_WIDTH-13:0]    <=  ctcq_pe_req_icache_ptag[`PA_WIDTH-13:0];
    ctcq_tlb_all_inv                    <=  ctcq_pe_req_tlb_all_inv;
    ctcq_tlb_va_all_inv                 <=  ctcq_pe_req_tlb_va_all_inv;
    ctcq_tlb_asid_all_inv               <=  ctcq_pe_req_tlb_asid_all_inv;
    ctcq_tlb_va_asid_inv                <=  ctcq_pe_req_tlb_va_asid_inv;
    ctcq_tlb_asid[15:0]                 <=  ctcq_pe_req_tlb_asid[15:0];
    ctcq_tlb_va[`VA_WIDTH-13:0]         <=  ctcq_pe_req_tlb_va[`VA_WIDTH-13:0];
  end
end

always @(posedge ctcq_pe_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ctcq_req_launch_ptr[5:0] <= 6'b1;
  else if(ifu_lsu_icache_inv_done ||  mmu_lsu_tlb_inv_done)
    ctcq_req_launch_ptr[5:0] <= {ctcq_req_launch_ptr[4:0],
                                 ctcq_req_launch_ptr[5]};
end
assign ctcq_req_launch_en_index[5:0] =  ctcq_req_launch_ptr[5:0];
//assign ctcq_req_launch_en_index[5:0] = ctcq_vld[5:0] & ctcq_req_launch_ptr[5:0];

//----------------------generate ports----------------------
assign lsu_ifu_icache_all_inv               = ctcq_ctc_req  &&  ctcq_icache_all_inv;
assign lsu_ifu_icache_line_inv              = ctcq_ctc_req  &&  ctcq_icache_line_inv;
assign lsu_ifu_icache_index[5:0]            = ctcq_icache_idx[5:0];
assign lsu_ifu_icache_ptag[`PA_WIDTH-13:0]  = ctcq_icache_ptag[`PA_WIDTH-13:0];

assign lsu_mmu_tlb_all_inv                  = ctcq_ctc_req  &&  ctcq_tlb_all_inv;
assign lsu_mmu_tlb_va_all_inv               = ctcq_ctc_req  &&  ctcq_tlb_va_all_inv;
assign lsu_mmu_tlb_asid_all_inv             = ctcq_ctc_req  &&  ctcq_tlb_asid_all_inv;
assign lsu_mmu_tlb_va_asid_inv              = ctcq_ctc_req  &&  ctcq_tlb_va_asid_inv;
assign lsu_mmu_tlb_asid[15:0]               = ctcq_tlb_asid[15:0];
assign lsu_mmu_tlb_va[`VA_WIDTH-13:0]       = ctcq_tlb_va[`VA_WIDTH-13:0];
//--------------------------pe req--------------------------
//icache inv
assign ctcq_pe_req                = ctcq_entry0_pe_req & ctcq_req_launch_en_index[0]
                                  | ctcq_entry1_pe_req & ctcq_req_launch_en_index[1]
                                  | ctcq_entry2_pe_req & ctcq_req_launch_en_index[2]
                                  | ctcq_entry3_pe_req & ctcq_req_launch_en_index[3]
                                  | ctcq_entry4_pe_req & ctcq_req_launch_en_index[4]
                                  | ctcq_entry5_pe_req & ctcq_req_launch_en_index[5];

assign ctcq_pe_req_icache_all_inv = ctcq_entry0_icache_all_inv & ctcq_req_launch_en_index[0]
                                  | ctcq_entry1_icache_all_inv & ctcq_req_launch_en_index[1]
                                  | ctcq_entry2_icache_all_inv & ctcq_req_launch_en_index[2]
                                  | ctcq_entry3_icache_all_inv & ctcq_req_launch_en_index[3]
                                  | ctcq_entry4_icache_all_inv & ctcq_req_launch_en_index[4]
                                  | ctcq_entry5_icache_all_inv & ctcq_req_launch_en_index[5];


assign ctcq_pe_req_icache_line_inv  = ctcq_entry0_icache_line_inv & ctcq_req_launch_en_index[0]
                                    | ctcq_entry1_icache_line_inv & ctcq_req_launch_en_index[1]
                                    | ctcq_entry2_icache_line_inv & ctcq_req_launch_en_index[2]
                                    | ctcq_entry3_icache_line_inv & ctcq_req_launch_en_index[3]
                                    | ctcq_entry4_icache_line_inv & ctcq_req_launch_en_index[4]
                                    | ctcq_entry5_icache_line_inv & ctcq_req_launch_en_index[5];


assign ctcq_pe_req_icache_index[5:0]  = (ctcq_entry0_icache_index[5:0] & {6{ctcq_req_launch_en_index[0]}})
                                      | (ctcq_entry1_icache_index[5:0] & {6{ctcq_req_launch_en_index[1]}})
                                      | (ctcq_entry2_icache_index[5:0] & {6{ctcq_req_launch_en_index[2]}})
                                      | (ctcq_entry3_icache_index[5:0] & {6{ctcq_req_launch_en_index[3]}})
                                      | (ctcq_entry4_icache_index[5:0] & {6{ctcq_req_launch_en_index[4]}})
                                      | (ctcq_entry5_icache_index[5:0] & {6{ctcq_req_launch_en_index[5]}});

assign ctcq_pe_req_icache_ptag[`PA_WIDTH-13:0] =
                (ctcq_entry0_icache_ptag[`PA_WIDTH-13:0] & {`PA_WIDTH-12{ctcq_req_launch_en_index[0]}})
                | (ctcq_entry1_icache_ptag[`PA_WIDTH-13:0] & {`PA_WIDTH-12{ctcq_req_launch_en_index[1]}})
                | (ctcq_entry2_icache_ptag[`PA_WIDTH-13:0] & {`PA_WIDTH-12{ctcq_req_launch_en_index[2]}})
                | (ctcq_entry3_icache_ptag[`PA_WIDTH-13:0] & {`PA_WIDTH-12{ctcq_req_launch_en_index[3]}})
                | (ctcq_entry4_icache_ptag[`PA_WIDTH-13:0] & {`PA_WIDTH-12{ctcq_req_launch_en_index[4]}})
                | (ctcq_entry5_icache_ptag[`PA_WIDTH-13:0] & {`PA_WIDTH-12{ctcq_req_launch_en_index[5]}});

//tlb inv
assign ctcq_pe_req_tlb_all_inv = ctcq_entry0_tlb_all_inv & ctcq_req_launch_en_index[0]
                           | ctcq_entry1_tlb_all_inv & ctcq_req_launch_en_index[1]
                           | ctcq_entry2_tlb_all_inv & ctcq_req_launch_en_index[2]
                           | ctcq_entry3_tlb_all_inv & ctcq_req_launch_en_index[3]
                           | ctcq_entry4_tlb_all_inv & ctcq_req_launch_en_index[4]
                           | ctcq_entry5_tlb_all_inv & ctcq_req_launch_en_index[5];

assign ctcq_pe_req_tlb_va_all_inv = ctcq_entry0_tlb_va_all_inv & ctcq_req_launch_en_index[0]
                              | ctcq_entry1_tlb_va_all_inv & ctcq_req_launch_en_index[1]
                              | ctcq_entry2_tlb_va_all_inv & ctcq_req_launch_en_index[2]
                              | ctcq_entry3_tlb_va_all_inv & ctcq_req_launch_en_index[3]
                              | ctcq_entry4_tlb_va_all_inv & ctcq_req_launch_en_index[4]
                              | ctcq_entry5_tlb_va_all_inv & ctcq_req_launch_en_index[5];

assign ctcq_pe_req_tlb_asid_all_inv = ctcq_entry0_tlb_asid_all_inv & ctcq_req_launch_en_index[0]
                                | ctcq_entry1_tlb_asid_all_inv & ctcq_req_launch_en_index[1]
                                | ctcq_entry2_tlb_asid_all_inv & ctcq_req_launch_en_index[2]
                                | ctcq_entry3_tlb_asid_all_inv & ctcq_req_launch_en_index[3]
                                | ctcq_entry4_tlb_asid_all_inv & ctcq_req_launch_en_index[4]
                                | ctcq_entry5_tlb_asid_all_inv & ctcq_req_launch_en_index[5];

assign ctcq_pe_req_tlb_va_asid_inv = ctcq_entry0_tlb_va_asid_inv & ctcq_req_launch_en_index[0]
                               | ctcq_entry1_tlb_va_asid_inv & ctcq_req_launch_en_index[1]
                               | ctcq_entry2_tlb_va_asid_inv & ctcq_req_launch_en_index[2]
                               | ctcq_entry3_tlb_va_asid_inv & ctcq_req_launch_en_index[3]
                               | ctcq_entry4_tlb_va_asid_inv & ctcq_req_launch_en_index[4]
                               | ctcq_entry5_tlb_va_asid_inv & ctcq_req_launch_en_index[5];

assign ctcq_pe_req_tlb_asid[15:0] = (ctcq_entry0_tlb_asid[15:0] & {16{ctcq_req_launch_en_index[0]}})
                              | (ctcq_entry1_tlb_asid[15:0] & {16{ctcq_req_launch_en_index[1]}})
                              | (ctcq_entry2_tlb_asid[15:0] & {16{ctcq_req_launch_en_index[2]}})
                              | (ctcq_entry3_tlb_asid[15:0] & {16{ctcq_req_launch_en_index[3]}})
                              | (ctcq_entry4_tlb_asid[15:0] & {16{ctcq_req_launch_en_index[4]}})
                              | (ctcq_entry5_tlb_asid[15:0] & {16{ctcq_req_launch_en_index[5]}});

assign ctcq_pe_req_tlb_va[`VA_WIDTH-13:0] =
                (ctcq_entry0_tlb_va[`VA_WIDTH-13:0] & {`VA_WIDTH-12{ctcq_req_launch_en_index[0]}})
                | (ctcq_entry1_tlb_va[`VA_WIDTH-13:0] & {`VA_WIDTH-12{ctcq_req_launch_en_index[1]}})
                | (ctcq_entry2_tlb_va[`VA_WIDTH-13:0] & {`VA_WIDTH-12{ctcq_req_launch_en_index[2]}})
                | (ctcq_entry3_tlb_va[`VA_WIDTH-13:0] & {`VA_WIDTH-12{ctcq_req_launch_en_index[3]}})
                | (ctcq_entry4_tlb_va[`VA_WIDTH-13:0] & {`VA_WIDTH-12{ctcq_req_launch_en_index[4]}})
                | (ctcq_entry5_tlb_va[`VA_WIDTH-13:0] & {`VA_WIDTH-12{ctcq_req_launch_en_index[5]}});

//inv complete
assign ica_tlb_ctcq_inv_cmplt[5:0] = {6{(ifu_lsu_icache_inv_done || mmu_lsu_tlb_inv_done)}}
                                   &  ctcq_req_launch_en_index[5:0];

//**************************************
//   ctc queue return resp
//     send cr resp to biu
//     handshake with biu
//**************************************
assign ctcq_resp_return_index[5:0] = ctcq_cmplt[5:0] & arb_ctcq_entry_oldest_index[5:0];
assign ctcq_biu_cr_valid = |ctcq_resp_return_index[5:0];
assign ctcq_biu_2_cmplt  = |(ctcq_2_cmplt[5:0] & arb_ctcq_entry_oldest_index[5:0]);
assign ctcq_biu_cr_resp[4:0] = 5'b0;

assign biu_ctcq_cr_resp_acept[5:0] = {6{biu_ctcq_cr_ready}} & ctcq_resp_return_index[5:0];
//**************************************
//   ctc queue inv
//**************************************
assign ctcq_inv_en[5:0] = biu_ctcq_cr_resp_acept[5:0];

//**************************************
//   async flush to rtu
//**************************************

always @(posedge ctcq_pe_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ctc_async_flush        <=  1'b0;
  else if(ctcq_ctc_req && (ifu_lsu_icache_inv_done || mmu_lsu_tlb_inv_done) && !cp0_lsu_ctc_flush_dis)
    ctc_async_flush        <=  1'b1;
  else
    ctc_async_flush        <=  1'b0;
end

assign lsu_rtu_ctc_flush_vld = ctc_async_flush;
//==========================================================
// low power gated clock for ctcq
//==========================================================
assign ctcq_crt_clk_en = ctc_req_create_en;
// &Instance("gated_clk_cell","x_ctcq_crt_gated_cell"); @249
gated_clk_cell  x_ctcq_crt_gated_cell (
  .clk_in             (lsu_snoop_clk     ),
  .clk_out            (ctcq_crt_clk      ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (ctcq_crt_clk_en   ),
  .module_en          (cp0_lsu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect( .clk_in           (lsu_snoop_clk   ), @250
//           .clk_out          (ctcq_crt_clk     ), @251
//           .external_en      (1'b0             ), @252
//           .global_en        (1'b1             ), @253
//           .local_en         (ctcq_crt_clk_en  ), @254
//           .module_en        (cp0_lsu_icg_en   ) @255
//         );  @256

assign ctcq_pe_clk_en   = ifu_lsu_icache_inv_done
                          ||  mmu_lsu_tlb_inv_done
                          ||  ctc_async_flush
                          ||  !ctcq_ctc_req
                              &&  ctcq_pe_req;
// &Instance("gated_clk_cell","x_ctcq_pe_gated_cell"); @263
gated_clk_cell  x_ctcq_pe_gated_cell (
  .clk_in             (lsu_snoop_clk     ),
  .clk_out            (ctcq_pe_clk       ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (ctcq_pe_clk_en    ),
  .module_en          (cp0_lsu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect( .clk_in           (lsu_snoop_clk    ), @264
//           .clk_out          (ctcq_pe_clk      ), @265
//           .external_en      (1'b0             ), @266
//           .global_en        (1'b1             ), @267
//           .local_en         (ctcq_pe_clk_en   ), @268
//           .module_en        (cp0_lsu_icg_en   ) @269
//         );  @270

//**********************************************************
//                    ctc queue instance
//**********************************************************
// &ConnRule(s/entryx/entry0/); @275
// &ConnRule(s/_x$/[0]/); @276
// &Instance("ct_lsu_snoop_ctcq_entry","x_ct_lsu_snoop_ctcq_entry_0"); @277
ct_lsu_snoop_ctcq_entry  x_ct_lsu_snoop_ctcq_entry_0 (
  .cp0_lsu_icg_en               (cp0_lsu_icg_en              ),
  .cpurst_b                     (cpurst_b                    ),
  .ctcq_2_cmplt_x               (ctcq_2_cmplt[0]             ),
  .ctcq_cmplt_x                 (ctcq_cmplt[0]               ),
  .ctcq_create_2nd_trans        (ctcq_create_2nd_trans       ),
  .ctcq_create_asid_va          (ctcq_create_asid_va         ),
  .ctcq_create_en_x             (ctcq_create_en[0]           ),
  .ctcq_create_rdy_x            (ctcq_create_rdy[0]          ),
  .ctcq_create_type             (ctcq_create_type            ),
  .ctcq_create_va_pa            (ctcq_create_va_pa           ),
  .ctcq_entryx_icache_all_inv   (ctcq_entry0_icache_all_inv  ),
  .ctcq_entryx_icache_index     (ctcq_entry0_icache_index    ),
  .ctcq_entryx_icache_line_inv  (ctcq_entry0_icache_line_inv ),
  .ctcq_entryx_icache_ptag      (ctcq_entry0_icache_ptag     ),
  .ctcq_entryx_pe_req           (ctcq_entry0_pe_req          ),
  .ctcq_entryx_tlb_all_inv      (ctcq_entry0_tlb_all_inv     ),
  .ctcq_entryx_tlb_asid         (ctcq_entry0_tlb_asid        ),
  .ctcq_entryx_tlb_asid_all_inv (ctcq_entry0_tlb_asid_all_inv),
  .ctcq_entryx_tlb_va           (ctcq_entry0_tlb_va          ),
  .ctcq_entryx_tlb_va_all_inv   (ctcq_entry0_tlb_va_all_inv  ),
  .ctcq_entryx_tlb_va_asid_inv  (ctcq_entry0_tlb_va_asid_inv ),
  .ctcq_inv_en_x                (ctcq_inv_en[0]              ),
  .ctcq_vld_x                   (ctcq_vld[0]                 ),
  .ica_tlb_ctcq_inv_cmplt_x     (ica_tlb_ctcq_inv_cmplt[0]   ),
  .lsu_snoop_clk                (lsu_snoop_clk               ),
  .pad_yy_icg_scan_en           (pad_yy_icg_scan_en          )
);



// &ConnRule(s/entryx/entry1/); @280
// &ConnRule(s/_x$/[1]/); @281
// &Instance("ct_lsu_snoop_ctcq_entry","x_ct_lsu_snoop_ctcq_entry_1"); @282
ct_lsu_snoop_ctcq_entry  x_ct_lsu_snoop_ctcq_entry_1 (
  .cp0_lsu_icg_en               (cp0_lsu_icg_en              ),
  .cpurst_b                     (cpurst_b                    ),
  .ctcq_2_cmplt_x               (ctcq_2_cmplt[1]             ),
  .ctcq_cmplt_x                 (ctcq_cmplt[1]               ),
  .ctcq_create_2nd_trans        (ctcq_create_2nd_trans       ),
  .ctcq_create_asid_va          (ctcq_create_asid_va         ),
  .ctcq_create_en_x             (ctcq_create_en[1]           ),
  .ctcq_create_rdy_x            (ctcq_create_rdy[1]          ),
  .ctcq_create_type             (ctcq_create_type            ),
  .ctcq_create_va_pa            (ctcq_create_va_pa           ),
  .ctcq_entryx_icache_all_inv   (ctcq_entry1_icache_all_inv  ),
  .ctcq_entryx_icache_index     (ctcq_entry1_icache_index    ),
  .ctcq_entryx_icache_line_inv  (ctcq_entry1_icache_line_inv ),
  .ctcq_entryx_icache_ptag      (ctcq_entry1_icache_ptag     ),
  .ctcq_entryx_pe_req           (ctcq_entry1_pe_req          ),
  .ctcq_entryx_tlb_all_inv      (ctcq_entry1_tlb_all_inv     ),
  .ctcq_entryx_tlb_asid         (ctcq_entry1_tlb_asid        ),
  .ctcq_entryx_tlb_asid_all_inv (ctcq_entry1_tlb_asid_all_inv),
  .ctcq_entryx_tlb_va           (ctcq_entry1_tlb_va          ),
  .ctcq_entryx_tlb_va_all_inv   (ctcq_entry1_tlb_va_all_inv  ),
  .ctcq_entryx_tlb_va_asid_inv  (ctcq_entry1_tlb_va_asid_inv ),
  .ctcq_inv_en_x                (ctcq_inv_en[1]              ),
  .ctcq_vld_x                   (ctcq_vld[1]                 ),
  .ica_tlb_ctcq_inv_cmplt_x     (ica_tlb_ctcq_inv_cmplt[1]   ),
  .lsu_snoop_clk                (lsu_snoop_clk               ),
  .pad_yy_icg_scan_en           (pad_yy_icg_scan_en          )
);



// &ConnRule(s/entryx/entry2/); @285
// &ConnRule(s/_x$/[2]/); @286
// &Instance("ct_lsu_snoop_ctcq_entry","x_ct_lsu_snoop_ctcq_entry_2"); @287
ct_lsu_snoop_ctcq_entry  x_ct_lsu_snoop_ctcq_entry_2 (
  .cp0_lsu_icg_en               (cp0_lsu_icg_en              ),
  .cpurst_b                     (cpurst_b                    ),
  .ctcq_2_cmplt_x               (ctcq_2_cmplt[2]             ),
  .ctcq_cmplt_x                 (ctcq_cmplt[2]               ),
  .ctcq_create_2nd_trans        (ctcq_create_2nd_trans       ),
  .ctcq_create_asid_va          (ctcq_create_asid_va         ),
  .ctcq_create_en_x             (ctcq_create_en[2]           ),
  .ctcq_create_rdy_x            (ctcq_create_rdy[2]          ),
  .ctcq_create_type             (ctcq_create_type            ),
  .ctcq_create_va_pa            (ctcq_create_va_pa           ),
  .ctcq_entryx_icache_all_inv   (ctcq_entry2_icache_all_inv  ),
  .ctcq_entryx_icache_index     (ctcq_entry2_icache_index    ),
  .ctcq_entryx_icache_line_inv  (ctcq_entry2_icache_line_inv ),
  .ctcq_entryx_icache_ptag      (ctcq_entry2_icache_ptag     ),
  .ctcq_entryx_pe_req           (ctcq_entry2_pe_req          ),
  .ctcq_entryx_tlb_all_inv      (ctcq_entry2_tlb_all_inv     ),
  .ctcq_entryx_tlb_asid         (ctcq_entry2_tlb_asid        ),
  .ctcq_entryx_tlb_asid_all_inv (ctcq_entry2_tlb_asid_all_inv),
  .ctcq_entryx_tlb_va           (ctcq_entry2_tlb_va          ),
  .ctcq_entryx_tlb_va_all_inv   (ctcq_entry2_tlb_va_all_inv  ),
  .ctcq_entryx_tlb_va_asid_inv  (ctcq_entry2_tlb_va_asid_inv ),
  .ctcq_inv_en_x                (ctcq_inv_en[2]              ),
  .ctcq_vld_x                   (ctcq_vld[2]                 ),
  .ica_tlb_ctcq_inv_cmplt_x     (ica_tlb_ctcq_inv_cmplt[2]   ),
  .lsu_snoop_clk                (lsu_snoop_clk               ),
  .pad_yy_icg_scan_en           (pad_yy_icg_scan_en          )
);



// &ConnRule(s/entryx/entry3/); @290
// &ConnRule(s/_x$/[3]/); @291
// &Instance("ct_lsu_snoop_ctcq_entry","x_ct_lsu_snoop_ctcq_entry_3"); @292
ct_lsu_snoop_ctcq_entry  x_ct_lsu_snoop_ctcq_entry_3 (
  .cp0_lsu_icg_en               (cp0_lsu_icg_en              ),
  .cpurst_b                     (cpurst_b                    ),
  .ctcq_2_cmplt_x               (ctcq_2_cmplt[3]             ),
  .ctcq_cmplt_x                 (ctcq_cmplt[3]               ),
  .ctcq_create_2nd_trans        (ctcq_create_2nd_trans       ),
  .ctcq_create_asid_va          (ctcq_create_asid_va         ),
  .ctcq_create_en_x             (ctcq_create_en[3]           ),
  .ctcq_create_rdy_x            (ctcq_create_rdy[3]          ),
  .ctcq_create_type             (ctcq_create_type            ),
  .ctcq_create_va_pa            (ctcq_create_va_pa           ),
  .ctcq_entryx_icache_all_inv   (ctcq_entry3_icache_all_inv  ),
  .ctcq_entryx_icache_index     (ctcq_entry3_icache_index    ),
  .ctcq_entryx_icache_line_inv  (ctcq_entry3_icache_line_inv ),
  .ctcq_entryx_icache_ptag      (ctcq_entry3_icache_ptag     ),
  .ctcq_entryx_pe_req           (ctcq_entry3_pe_req          ),
  .ctcq_entryx_tlb_all_inv      (ctcq_entry3_tlb_all_inv     ),
  .ctcq_entryx_tlb_asid         (ctcq_entry3_tlb_asid        ),
  .ctcq_entryx_tlb_asid_all_inv (ctcq_entry3_tlb_asid_all_inv),
  .ctcq_entryx_tlb_va           (ctcq_entry3_tlb_va          ),
  .ctcq_entryx_tlb_va_all_inv   (ctcq_entry3_tlb_va_all_inv  ),
  .ctcq_entryx_tlb_va_asid_inv  (ctcq_entry3_tlb_va_asid_inv ),
  .ctcq_inv_en_x                (ctcq_inv_en[3]              ),
  .ctcq_vld_x                   (ctcq_vld[3]                 ),
  .ica_tlb_ctcq_inv_cmplt_x     (ica_tlb_ctcq_inv_cmplt[3]   ),
  .lsu_snoop_clk                (lsu_snoop_clk               ),
  .pad_yy_icg_scan_en           (pad_yy_icg_scan_en          )
);



// &ConnRule(s/entryx/entry4/); @295
// &ConnRule(s/_x$/[4]/); @296
// &Instance("ct_lsu_snoop_ctcq_entry","x_ct_lsu_snoop_ctcq_entry_4"); @297
ct_lsu_snoop_ctcq_entry  x_ct_lsu_snoop_ctcq_entry_4 (
  .cp0_lsu_icg_en               (cp0_lsu_icg_en              ),
  .cpurst_b                     (cpurst_b                    ),
  .ctcq_2_cmplt_x               (ctcq_2_cmplt[4]             ),
  .ctcq_cmplt_x                 (ctcq_cmplt[4]               ),
  .ctcq_create_2nd_trans        (ctcq_create_2nd_trans       ),
  .ctcq_create_asid_va          (ctcq_create_asid_va         ),
  .ctcq_create_en_x             (ctcq_create_en[4]           ),
  .ctcq_create_rdy_x            (ctcq_create_rdy[4]          ),
  .ctcq_create_type             (ctcq_create_type            ),
  .ctcq_create_va_pa            (ctcq_create_va_pa           ),
  .ctcq_entryx_icache_all_inv   (ctcq_entry4_icache_all_inv  ),
  .ctcq_entryx_icache_index     (ctcq_entry4_icache_index    ),
  .ctcq_entryx_icache_line_inv  (ctcq_entry4_icache_line_inv ),
  .ctcq_entryx_icache_ptag      (ctcq_entry4_icache_ptag     ),
  .ctcq_entryx_pe_req           (ctcq_entry4_pe_req          ),
  .ctcq_entryx_tlb_all_inv      (ctcq_entry4_tlb_all_inv     ),
  .ctcq_entryx_tlb_asid         (ctcq_entry4_tlb_asid        ),
  .ctcq_entryx_tlb_asid_all_inv (ctcq_entry4_tlb_asid_all_inv),
  .ctcq_entryx_tlb_va           (ctcq_entry4_tlb_va          ),
  .ctcq_entryx_tlb_va_all_inv   (ctcq_entry4_tlb_va_all_inv  ),
  .ctcq_entryx_tlb_va_asid_inv  (ctcq_entry4_tlb_va_asid_inv ),
  .ctcq_inv_en_x                (ctcq_inv_en[4]              ),
  .ctcq_vld_x                   (ctcq_vld[4]                 ),
  .ica_tlb_ctcq_inv_cmplt_x     (ica_tlb_ctcq_inv_cmplt[4]   ),
  .lsu_snoop_clk                (lsu_snoop_clk               ),
  .pad_yy_icg_scan_en           (pad_yy_icg_scan_en          )
);



// &ConnRule(s/entryx/entry5/); @300
// &ConnRule(s/_x$/[5]/); @301
// &Instance("ct_lsu_snoop_ctcq_entry","x_ct_lsu_snoop_ctcq_entry_5"); @302
ct_lsu_snoop_ctcq_entry  x_ct_lsu_snoop_ctcq_entry_5 (
  .cp0_lsu_icg_en               (cp0_lsu_icg_en              ),
  .cpurst_b                     (cpurst_b                    ),
  .ctcq_2_cmplt_x               (ctcq_2_cmplt[5]             ),
  .ctcq_cmplt_x                 (ctcq_cmplt[5]               ),
  .ctcq_create_2nd_trans        (ctcq_create_2nd_trans       ),
  .ctcq_create_asid_va          (ctcq_create_asid_va         ),
  .ctcq_create_en_x             (ctcq_create_en[5]           ),
  .ctcq_create_rdy_x            (ctcq_create_rdy[5]          ),
  .ctcq_create_type             (ctcq_create_type            ),
  .ctcq_create_va_pa            (ctcq_create_va_pa           ),
  .ctcq_entryx_icache_all_inv   (ctcq_entry5_icache_all_inv  ),
  .ctcq_entryx_icache_index     (ctcq_entry5_icache_index    ),
  .ctcq_entryx_icache_line_inv  (ctcq_entry5_icache_line_inv ),
  .ctcq_entryx_icache_ptag      (ctcq_entry5_icache_ptag     ),
  .ctcq_entryx_pe_req           (ctcq_entry5_pe_req          ),
  .ctcq_entryx_tlb_all_inv      (ctcq_entry5_tlb_all_inv     ),
  .ctcq_entryx_tlb_asid         (ctcq_entry5_tlb_asid        ),
  .ctcq_entryx_tlb_asid_all_inv (ctcq_entry5_tlb_asid_all_inv),
  .ctcq_entryx_tlb_va           (ctcq_entry5_tlb_va          ),
  .ctcq_entryx_tlb_va_all_inv   (ctcq_entry5_tlb_va_all_inv  ),
  .ctcq_entryx_tlb_va_asid_inv  (ctcq_entry5_tlb_va_asid_inv ),
  .ctcq_inv_en_x                (ctcq_inv_en[5]              ),
  .ctcq_vld_x                   (ctcq_vld[5]                 ),
  .ica_tlb_ctcq_inv_cmplt_x     (ica_tlb_ctcq_inv_cmplt[5]   ),
  .lsu_snoop_clk                (lsu_snoop_clk               ),
  .pad_yy_icg_scan_en           (pad_yy_icg_scan_en          )
);


assign lsu_had_ctcq_entry_vld[5:0]      = ctcq_vld[5:0];
assign lsu_had_ctcq_entry_cmplt[5:0]    = ctcq_cmplt[5:0];
assign lsu_had_ctcq_entry_2_cmplt[5:0]  = ctcq_2_cmplt[5:0];


// &ModuleEnd; @309
endmodule




















