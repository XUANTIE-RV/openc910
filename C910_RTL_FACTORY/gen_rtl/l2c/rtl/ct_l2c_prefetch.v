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
module ct_l2c_prefetch(
  ciu_l2c_iprf,
  ciu_l2c_prf_ready,
  ciu_l2c_tprf,
  cmp_pref_addr_bank_0,
  cmp_pref_addr_bank_1,
  cmp_pref_cache_miss_bank_0,
  cmp_pref_cache_miss_bank_1,
  cmp_pref_ifu_req_bank_0,
  cmp_pref_ifu_req_bank_1,
  cmp_pref_read_bank_0,
  cmp_pref_read_bank_1,
  cmp_pref_tlb_req_bank_0,
  cmp_pref_tlb_req_bank_1,
  cmp_pref_vld_bank_0,
  cmp_pref_vld_bank_1,
  cpurst_b,
  forever_cpuclk,
  l2c_ciu_prf_addr,
  l2c_ciu_prf_prot,
  l2c_ciu_prf_vld,
  l2c_icg_en,
  pad_yy_icg_scan_en,
  prf_idle
);

// &Ports; @23
input   [1 :0]  ciu_l2c_iprf;              
input           ciu_l2c_prf_ready;         
input           ciu_l2c_tprf;              
input   [32:0]  cmp_pref_addr_bank_0;      
input   [32:0]  cmp_pref_addr_bank_1;      
input           cmp_pref_cache_miss_bank_0; 
input           cmp_pref_cache_miss_bank_1; 
input           cmp_pref_ifu_req_bank_0;   
input           cmp_pref_ifu_req_bank_1;   
input           cmp_pref_read_bank_0;      
input           cmp_pref_read_bank_1;      
input           cmp_pref_tlb_req_bank_0;   
input           cmp_pref_tlb_req_bank_1;   
input           cmp_pref_vld_bank_0;       
input           cmp_pref_vld_bank_1;       
input           cpurst_b;                  
input           forever_cpuclk;            
input           l2c_icg_en;                
input           pad_yy_icg_scan_en;        
output  [33:0]  l2c_ciu_prf_addr;          
output  [2 :0]  l2c_ciu_prf_prot;          
output          l2c_ciu_prf_vld;           
output          prf_idle;                  

// &Regs; @24
reg     [33:0]  pref_addr;                 
reg     [1 :0]  pref_cnt;                  
reg             pref_next_state;           
reg             pref_state;                
reg             pref_tlb;                  

// &Wires; @25
wire            bank1_sel;                 
wire            ciu_accepted;              
wire            ciu_ipref_en;              
wire    [1 :0]  ciu_l2c_iprf;              
wire            ciu_l2c_prf_ready;         
wire            ciu_l2c_tprf;              
wire            ciu_tpref_en;              
wire    [33:0]  cmp_pref_addr;             
wire    [32:0]  cmp_pref_addr_bank_0;      
wire    [32:0]  cmp_pref_addr_bank_1;      
wire            cmp_pref_addr_cross_page;  
wire            cmp_pref_cache_miss_bank_0; 
wire            cmp_pref_cache_miss_bank_1; 
wire            cmp_pref_ifu_req_bank_0;   
wire            cmp_pref_ifu_req_bank_1;   
wire            cmp_pref_read_bank_0;      
wire            cmp_pref_read_bank_1;      
wire            cmp_pref_tlb_req_bank_0;   
wire            cmp_pref_tlb_req_bank_1;   
wire            cmp_pref_vld_bank_0;       
wire            cmp_pref_vld_bank_1;       
wire            cpurst_b;                  
wire            cross_page;                
wire            forever_cpuclk;            
wire    [1 :0]  iprf_cnt;                  
wire    [33:0]  l2c_ciu_prf_addr;          
wire    [2 :0]  l2c_ciu_prf_prot;          
wire            l2c_ciu_prf_vld;           
wire            l2c_icg_en;                
wire            l2c_pref_clk;              
wire            l2c_pref_clk_en;           
wire            pad_yy_icg_scan_en;        
wire    [33:0]  pref_addr_bank0;           
wire    [33:0]  pref_addr_bank1;           
wire            pref_addr_update;          
wire            pref_en;                   
wire            pref_en_0;                 
wire            pref_en_1;                 
wire            pref_last;                 
wire    [33:0]  pref_next_addr;            
wire    [33:0]  pref_updt_addr;            
wire            pref_updt_tlb_req;         
wire            prf_idle;                  


parameter IDLE    = 1'b0;
parameter PREF    = 1'b1;

assign l2c_ciu_prf_vld        = (pref_state == PREF);
assign l2c_ciu_prf_addr[33:0] = pref_addr[33:0]     ;
assign l2c_ciu_prf_prot[2 :0] = {!pref_tlb,2'b11}   ;

assign l2c_pref_clk_en  = pref_addr_update || ciu_accepted;
// &Instance("gated_clk_cell", "x_l2c_pref_gated_clk"); @35
gated_clk_cell  x_l2c_pref_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (l2c_pref_clk      ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (l2c_pref_clk_en   ),
  .module_en          (l2c_icg_en        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in        (forever_cpuclk  ), @36
//          .external_en   (1'b0            ), @37
//          .global_en     (1'b1            ), @38
//          .module_en (l2c_icg_en     ), @39
//          .local_en      (l2c_pref_clk_en ), @40
//          .clk_out       (l2c_pref_clk    ) @41
//         ); @42

always@(posedge l2c_pref_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    pref_state <= IDLE;
  else
    pref_state <= pref_next_state;
end

assign ciu_ipref_en  = (ciu_l2c_iprf[1:0] != 2'b00);
assign ciu_tpref_en  = (ciu_l2c_tprf      != 1'b0 );

assign pref_en_0 = cmp_pref_vld_bank_0 &&
                   cmp_pref_read_bank_0 && 
                   (cmp_pref_ifu_req_bank_0 && ciu_ipref_en ||
                    cmp_pref_tlb_req_bank_0 && ciu_tpref_en) &&
                   cmp_pref_cache_miss_bank_0;

assign pref_en_1 = cmp_pref_vld_bank_1 &&
                   cmp_pref_read_bank_1 && 
                   (cmp_pref_ifu_req_bank_1 && ciu_ipref_en ||
                    cmp_pref_tlb_req_bank_1 && ciu_tpref_en) &&
                   cmp_pref_cache_miss_bank_1;

assign pref_en   = (pref_en_0 || pref_en_1) && !cmp_pref_addr_cross_page;

// &CombBeg; @69
always @( cross_page
       or pref_state
       or pref_en
       or ciu_accepted
       or pref_last)
begin
  case(pref_state)
    IDLE:
    begin
      if(pref_en)
        pref_next_state  = PREF;
      else
        pref_next_state  = IDLE;
    end
    PREF:
    begin
      if(ciu_accepted && (pref_last || cross_page))
        pref_next_state  = IDLE;
      else
        pref_next_state  = PREF;
    end
    default:
      pref_next_state  = IDLE;
  endcase
// &CombEnd; @88
end

assign pref_addr_update = pref_en && (pref_state == IDLE);

assign ciu_accepted  = ciu_l2c_prf_ready;
assign pref_last     = pref_cnt[1:0] == 2'b00;


//===============================================
//     prefetch buffer
//===============================================
assign bank1_sel = cmp_pref_cache_miss_bank_1 &&
                   (cmp_pref_ifu_req_bank_1  || cmp_pref_tlb_req_bank_1) && 
                   cmp_pref_vld_bank_1;

assign pref_addr_bank1[33:0] = {cmp_pref_addr_bank_1[32:0],1'b1};
assign pref_addr_bank0[33:0] = {cmp_pref_addr_bank_0[32:0],1'b0};

assign cmp_pref_addr[33:0]  = bank1_sel ? pref_addr_bank1[33:0] : pref_addr_bank0[33:0];
assign pref_updt_tlb_req    = bank1_sel ? cmp_pref_tlb_req_bank_1 : cmp_pref_tlb_req_bank_0;

assign cmp_pref_addr_cross_page = cmp_pref_addr[6] ^ pref_updt_addr[6];

assign pref_updt_addr[33:0] = cmp_pref_addr[33:0] + 34'b1;
assign pref_next_addr[33:0] = pref_addr[33:0] + 34'b1;

assign iprf_cnt[1:0] = ciu_l2c_iprf[1:0] - 2'b1;

always@(posedge l2c_pref_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
  begin
    pref_addr[33:0] <= 34'b0;
    pref_tlb        <= 1'b0 ;
    pref_cnt[1:0]   <= 2'b0;
  end
  else if(pref_addr_update)
  begin
    pref_addr[33:0] <= pref_updt_addr[33:0];
    pref_tlb        <= pref_updt_tlb_req   ;
    pref_cnt[1:0]   <= pref_updt_tlb_req ? 2'b00 : iprf_cnt[1:0];
  end
  else if(ciu_accepted)
  begin
    pref_addr[33:0] <= pref_next_addr[33:0];
    pref_tlb        <= pref_tlb            ;
    pref_cnt[1:0]   <= pref_cnt[1:0] - 2'b1;
  end
  else
  begin
    pref_addr[33:0] <= pref_addr[33:0]  ;
    pref_tlb        <= pref_tlb         ;
    pref_cnt[1:0]   <= pref_cnt[1:0];
  end
end

assign cross_page  = (pref_addr[6] ^ pref_next_addr[6]); 

assign prf_idle = pref_state == IDLE;

// &ModuleEnd; @148
endmodule


