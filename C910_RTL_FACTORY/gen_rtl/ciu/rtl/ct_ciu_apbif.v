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
module ct_ciu_apbif(
  apb_clk_en,
  apbif_had_pctrace_inv,
  apbif_ncq_ar_grant,
  apbif_ncq_aw_grant,
  apbif_ncq_bid,
  apbif_ncq_bresp,
  apbif_ncq_bvalid,
  apbif_ncq_rdata,
  apbif_ncq_rid,
  apbif_ncq_rlast,
  apbif_ncq_rresp,
  apbif_ncq_rvalid,
  apbif_ncq_w_grant,
  ciu_apbif_had_pctrace_inv,
  ciu_clint_icg_en,
  ciu_icg_en,
  ciu_plic_icg_en,
  core0_prdata_l2pmp,
  core1_prdata_l2pmp,
  core2_prdata_l2pmp,
  core3_prdata_l2pmp,
  cpurst_b,
  forever_cpuclk,
  ncq_apbif_arvalid,
  ncq_apbif_awvalid,
  ncq_apbif_b_grant,
  ncq_apbif_r_grant,
  ncq_apbif_wvalid,
  ncq_xx_araddr,
  ncq_xx_arid,
  ncq_xx_arprot,
  ncq_xx_aruser,
  ncq_xx_aw_needissue,
  ncq_xx_awaddr,
  ncq_xx_awid,
  ncq_xx_awprot,
  ncq_xx_awuser,
  ncq_xx_wdata,
  pad_yy_icg_scan_en,
  paddr,
  penable,
  perr_clint,
  perr_had,
  perr_l2pmp,
  perr_plic,
  perr_rmr,
  pprot,
  prdata_clint,
  prdata_had,
  prdata_plic,
  prdata_rmr,
  pready_clint,
  pready_had,
  pready_l2pmp,
  pready_plic,
  pready_rmr,
  psel_clint,
  psel_had,
  psel_l2pmp,
  psel_plic,
  psel_rmr,
  pwdata,
  pwrite,
  regs_apbif_icg_en
);

// &Ports; @23
input            apb_clk_en;               
input            ciu_apbif_had_pctrace_inv; 
input            ciu_icg_en;               
input   [31 :0]  core0_prdata_l2pmp;       
input   [31 :0]  core1_prdata_l2pmp;       
input   [31 :0]  core2_prdata_l2pmp;       
input   [31 :0]  core3_prdata_l2pmp;       
input            cpurst_b;                 
input            forever_cpuclk;           
input            ncq_apbif_arvalid;        
input            ncq_apbif_awvalid;        
input            ncq_apbif_b_grant;        
input            ncq_apbif_r_grant;        
input            ncq_apbif_wvalid;         
input   [39 :0]  ncq_xx_araddr;            
input   [7  :0]  ncq_xx_arid;              
input   [2  :0]  ncq_xx_arprot;            
input            ncq_xx_aruser;            
input            ncq_xx_aw_needissue;      
input   [39 :0]  ncq_xx_awaddr;            
input   [7  :0]  ncq_xx_awid;              
input   [2  :0]  ncq_xx_awprot;            
input            ncq_xx_awuser;            
input   [127:0]  ncq_xx_wdata;             
input            pad_yy_icg_scan_en;       
input            perr_clint;               
input            perr_had;                 
input   [3  :0]  perr_l2pmp;               
input            perr_plic;                
input            perr_rmr;                 
input   [31 :0]  prdata_clint;             
input   [31 :0]  prdata_had;               
input   [31 :0]  prdata_plic;              
input   [31 :0]  prdata_rmr;               
input            pready_clint;             
input            pready_had;               
input   [3  :0]  pready_l2pmp;             
input            pready_plic;              
input            pready_rmr;               
input            regs_apbif_icg_en;        
output           apbif_had_pctrace_inv;    
output           apbif_ncq_ar_grant;       
output           apbif_ncq_aw_grant;       
output  [7  :0]  apbif_ncq_bid;            
output  [1  :0]  apbif_ncq_bresp;          
output           apbif_ncq_bvalid;         
output  [127:0]  apbif_ncq_rdata;          
output  [7  :0]  apbif_ncq_rid;            
output           apbif_ncq_rlast;          
output  [1  :0]  apbif_ncq_rresp;          
output           apbif_ncq_rvalid;         
output           apbif_ncq_w_grant;        
output           ciu_clint_icg_en;         
output           ciu_plic_icg_en;          
output  [31 :0]  paddr;                    
output           penable;                  
output  [1  :0]  pprot;                    
output           psel_clint;               
output           psel_had;                 
output  [3  :0]  psel_l2pmp;               
output           psel_plic;                
output           psel_rmr;                 
output  [31 :0]  pwdata;                   
output           pwrite;                   

// &Regs; @24
reg     [1  :0]  apb_cur_state;            
reg              apb_icg_en;               
reg     [1  :0]  apb_next_state;           
reg     [39 :0]  apbif_addr;               
reg     [7  :0]  apbif_id;                 
reg              apbif_needissue;          
reg     [1  :0]  apbif_prot;               
reg     [31 :0]  apbif_wdata;              
reg              apbif_write;              
reg     [31 :0]  rdata;                    
reg              resp_err;                 
reg     [7  :0]  resp_id;                  
reg              resp_vld;                 
reg              resp_wt;                  
reg     [7  :0]  sel;                      

// &Wires; @25
wire             apb_clk_en;               
wire             apb_fsm_idle;             
wire             apb_fsm_pend;             
wire             apb_fsm_req;              
wire             apb_fsm_waddr;            
wire             apbif_clk;                
wire             apbif_clk_en;             
wire             apbif_had_pctrace_inv;    
wire             apbif_ncq_ar_grant;       
wire             apbif_ncq_aw_grant;       
wire    [7  :0]  apbif_ncq_bid;            
wire    [1  :0]  apbif_ncq_bresp;          
wire             apbif_ncq_bvalid;         
wire    [127:0]  apbif_ncq_rdata;          
wire    [7  :0]  apbif_ncq_rid;            
wire             apbif_ncq_rlast;          
wire    [1  :0]  apbif_ncq_rresp;          
wire             apbif_ncq_rvalid;         
wire             apbif_ncq_w_grant;        
wire             apbif_req;                
wire             ciu_apbif_had_pctrace_inv; 
wire             ciu_clint_icg_en;         
wire             ciu_icg_en;               
wire             ciu_plic_icg_en;          
wire             cmplt;                    
wire    [31 :0]  core0_prdata_l2pmp;       
wire    [31 :0]  core1_prdata_l2pmp;       
wire    [31 :0]  core2_prdata_l2pmp;       
wire    [31 :0]  core3_prdata_l2pmp;       
wire             cpurst_b;                 
wire             forever_cpuclk;           
wire             l2pmp_sel;                
wire             ncq_apbif_arvalid;        
wire             ncq_apbif_awvalid;        
wire             ncq_apbif_b_grant;        
wire             ncq_apbif_r_grant;        
wire             ncq_apbif_wvalid;         
wire    [39 :0]  ncq_xx_araddr;            
wire    [7  :0]  ncq_xx_arid;              
wire    [2  :0]  ncq_xx_arprot;            
wire             ncq_xx_aruser;            
wire             ncq_xx_aw_needissue;      
wire    [39 :0]  ncq_xx_awaddr;            
wire    [7  :0]  ncq_xx_awid;              
wire    [2  :0]  ncq_xx_awprot;            
wire             ncq_xx_awuser;            
wire    [127:0]  ncq_xx_wdata;             
wire             pad_yy_icg_scan_en;       
wire    [31 :0]  paddr;                    
wire             penable;                  
wire             perr;                     
wire             perr_clint;               
wire             perr_had;                 
wire    [3  :0]  perr_l2pmp;               
wire             perr_plic;                
wire             perr_rmr;                 
wire    [1  :0]  pprot;                    
wire    [31 :0]  prdata;                   
wire    [31 :0]  prdata_clint;             
wire    [31 :0]  prdata_had;               
wire    [31 :0]  prdata_l2pmp;             
wire    [31 :0]  prdata_plic;              
wire    [31 :0]  prdata_rmr;               
wire             pready;                   
wire             pready_clint;             
wire             pready_had;               
wire    [3  :0]  pready_l2pmp;             
wire             pready_plic;              
wire             pready_rmr;               
wire             psel_clint;               
wire             psel_had;                 
wire    [3  :0]  psel_l2pmp;               
wire             psel_none;                
wire             psel_plic;                
wire             psel_rmr;                 
wire    [31 :0]  pwdata;                   
wire             pwrite;                   
wire             regs_apbif_icg_en;        
wire             sel_clint;                
wire    [3  :0]  sel_core;                 
wire             sel_had;                  
wire             sel_l2pmp;                
wire             sel_plic;                 
wire             sel_rmr;                  


parameter ADDRW = `PA_WIDTH;
parameter IDLE  = 2'b00;
parameter WADDR = 2'b01;
parameter REQ   = 2'b10;
parameter PEND  = 2'b11;

always @(posedge apbif_clk or negedge cpurst_b)
begin
  if(~cpurst_b)
    apb_cur_state[1:0] <= IDLE;
  else if (apb_clk_en)
    apb_cur_state[1:0] <= apb_next_state[1:0];
end

// &CombBeg; @41
always @( resp_vld
       or ncq_apbif_wvalid
       or cmplt
       or ncq_apbif_awvalid
       or apb_cur_state
       or ncq_apbif_arvalid)
begin
  case (apb_cur_state)
  IDLE: begin
    if (ncq_apbif_arvalid && !resp_vld)
      apb_next_state = REQ;
    else if (ncq_apbif_awvalid && !resp_vld)
      apb_next_state = WADDR;
    else
      apb_next_state = IDLE;
  end
  WADDR: begin
    if (ncq_apbif_wvalid)
      apb_next_state = REQ;
    else
      apb_next_state = WADDR;
  end
  REQ: begin
    apb_next_state = PEND;
  end
  PEND: begin
    if (cmplt)
      apb_next_state = IDLE;
    else
      apb_next_state = PEND;
  end
  default: apb_next_state = IDLE;
  endcase
// &CombEnd; @68
end

assign apb_fsm_idle  = (apb_cur_state == IDLE);
assign apb_fsm_waddr = (apb_cur_state == WADDR);
assign apb_fsm_req   = (apb_cur_state == REQ);
assign apb_fsm_pend  = (apb_cur_state == PEND);

assign apbif_ncq_aw_grant = ncq_apbif_awvalid && apb_fsm_idle && !ncq_apbif_arvalid && apb_clk_en && !resp_vld;
assign apbif_ncq_ar_grant = ncq_apbif_arvalid && apb_fsm_idle && apb_clk_en && !resp_vld;
assign apbif_ncq_w_grant  = ncq_apbif_wvalid  && apb_fsm_waddr && apb_clk_en;

assign apbif_req   = (apb_fsm_req || apb_fsm_pend) && apbif_needissue;

// &Force("bus", "ncq_xx_arprot",2,0); @81
// &Force("bus", "ncq_xx_awprot",2,0); @82

always @(posedge apbif_clk or negedge cpurst_b)
begin
  if (!cpurst_b)begin
    apbif_addr[ADDRW-1:0] <= {ADDRW{1'b0}}; 
    apbif_id[7:0]         <= 8'b0; 
    apbif_prot[1:0]       <= 2'b0; 
    apbif_needissue       <= 1'b0; 
    apbif_write           <= 1'b0;
  end
  else if (apb_clk_en && apb_fsm_idle)begin
    if (ncq_apbif_arvalid)
    begin
      apbif_addr[ADDRW-1:0] <= ncq_xx_araddr[ADDRW-1:0];
      apbif_id[7:0]         <= ncq_xx_arid[7:0];
      apbif_prot[1:0]       <= {ncq_xx_aruser,ncq_xx_arprot[0]};
      apbif_needissue       <= 1'b1;
      apbif_write           <= 1'b0;
    end
    else if (ncq_apbif_awvalid)
    begin
      apbif_addr[ADDRW-1:0] <= ncq_xx_awaddr[ADDRW-1:0];
      apbif_id[7:0]         <= ncq_xx_awid[7:0];
      apbif_prot[1:0]       <= {ncq_xx_awuser,ncq_xx_awprot[0]};
      apbif_needissue       <= ncq_xx_aw_needissue;
      apbif_write           <= 1'b1;
    end
  end
end

always @(posedge apbif_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    apbif_wdata[31:0] <= 32'b0;
  else if (ncq_apbif_wvalid && apb_fsm_waddr && apb_clk_en) 
  begin
    if (apbif_addr[3:2] == 2'b00)
      apbif_wdata[31:0] <= ncq_xx_wdata[31:0];
    else if (apbif_addr[3:2] == 2'b01)
      apbif_wdata[31:0] <= ncq_xx_wdata[63:32];
    else if (apbif_addr[3:2] == 2'b10)
      apbif_wdata[31:0] <= ncq_xx_wdata[95:64];
    else if (apbif_addr[3:2] == 2'b11)
      apbif_wdata[31:0] <= ncq_xx_wdata[127:96];
  end
end

//====================================================================
//      APB Bridge
//====================================================================
`define PLIC_BASE_START  1'b0
`define CLINT_BASE_START 11'h400
`define HAD_BASE_START   11'h401
`define L2PMP_BASE_START 11'h402
`define RMR_BASE_START   11'h403

assign apbif_had_pctrace_inv = ciu_apbif_had_pctrace_inv;

assign sel_plic  = (apbif_addr[26] == `PLIC_BASE_START);
assign sel_clint = (apbif_addr[26:16] == `CLINT_BASE_START);
assign sel_had   = (apbif_addr[26:16] == `HAD_BASE_START);
assign sel_l2pmp = (apbif_addr[26:16] == `L2PMP_BASE_START);
assign sel_rmr   = (apbif_addr[26:16] == `RMR_BASE_START);

assign psel_plic    = apbif_req && sel_plic;
assign psel_clint   = apbif_req && sel_clint;
assign psel_had     = apbif_req && sel_had;
assign pwrite       = apbif_write;
assign paddr[31:0]  = apbif_addr[31:0];
assign pwdata[31:0] = apbif_wdata[31:0];
assign penable      = apb_fsm_pend;
assign pprot[1:0]   = apbif_prot[1:0];


assign sel_core[3:0]   = (4'b1 << apbif_addr[15:14]) & {4{sel_l2pmp}};
assign psel_l2pmp[3:0] = {4{apbif_req}} & sel_core[3:0];
assign psel_rmr  = apbif_req && sel_rmr;

always @(posedge forever_cpuclk or negedge cpurst_b)
begin
  if (!cpurst_b)
    apb_icg_en <= 1'b0;
  else if (apb_clk_en)
    apb_icg_en <= regs_apbif_icg_en;
  else 
    apb_icg_en <= apb_icg_en;
end

assign ciu_plic_icg_en  = apb_icg_en;
assign ciu_clint_icg_en = apb_icg_en;

//--------------------------------------
//   input from apb
//--------------------------------------
always @(posedge apbif_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    sel[7:0] <= 8'b0;
  else if (apb_fsm_req)
    sel[7:0] <= {sel_rmr,sel_core[3:0],sel_had,sel_clint,sel_plic};
end

assign prdata_l2pmp[31:0] = {32{sel[3]}} & core0_prdata_l2pmp[31:0] |
                            {32{sel[4]}} & core1_prdata_l2pmp[31:0] |
                            {32{sel[5]}} & core2_prdata_l2pmp[31:0] |
                            {32{sel[6]}} & core3_prdata_l2pmp[31:0];

assign prdata[31:0] = {32{sel[0]}}    & prdata_plic[31:0] |
                      {32{sel[1]}}    & prdata_clint[31:0] |
                      {32{sel[2]}}    & prdata_had[31:0] | 
                      {32{l2pmp_sel}} & prdata_l2pmp[31:0] |
                      {32{sel[7]}}    & prdata_rmr[31:0];

assign l2pmp_sel = |sel[6:3];

//assign pready = apbif_req && |(sel[2:0] & {pready_had,pready_clint,pready_plic});
assign pready = |(sel[7:0] & {pready_rmr,pready_l2pmp[3:0],pready_had,pready_clint,pready_plic});

assign perr   = |(sel[7:0] & {perr_rmr,perr_l2pmp[3:0],perr_had,perr_clint,perr_plic} ) || !(|sel[7:0]);

assign psel_none =  apb_fsm_pend && (!(|sel[7:0]) || !apbif_needissue);

assign cmplt = apb_fsm_pend && pready || psel_none;

always @(posedge apbif_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    resp_vld <= 1'b0;
  else if (cmplt && apb_clk_en)
    resp_vld <= 1'b1;
  else if (ncq_apbif_r_grant || ncq_apbif_b_grant)
    resp_vld <= 1'b0;
end

always @(posedge apbif_clk or negedge cpurst_b)
begin
  if (!cpurst_b)begin
    rdata[31:0]  <= 32'b0;
    resp_err     <= 1'b0;
    resp_id[7:0] <= 8'b0;
    resp_wt      <= 1'b0;
  end
  else if (cmplt && apb_clk_en)
  begin
    rdata[31:0]  <= prdata[31:0];
    resp_err     <= perr;
    resp_id[7:0] <= apbif_id[7:0];
    resp_wt      <= apbif_write;
  end
end

assign apbif_ncq_rvalid       = !resp_wt && resp_vld; 
assign apbif_ncq_rdata[127:0] = {4{rdata[31:0]}};
assign apbif_ncq_rresp[1:0]   = {resp_err,1'b0};
assign apbif_ncq_rid[7:0]     = resp_id[7:0];
assign apbif_ncq_rlast        = 1'b1;

assign apbif_ncq_bvalid       = resp_wt && resp_vld; 
assign apbif_ncq_bid[7:0]     = resp_id[7:0];
assign apbif_ncq_bresp[1:0]   = {resp_err,1'b0};

//==========================================================
//     ICG
//==========================================================
assign apbif_clk_en = ncq_apbif_r_grant | ncq_apbif_b_grant | 
                      apb_clk_en & apb_fsm_idle & (ncq_apbif_arvalid | ncq_apbif_awvalid) |
                      apb_clk_en & !apb_fsm_idle;

// &Instance("gated_clk_cell", "x_apbif_gated_clk"); @258
gated_clk_cell  x_apbif_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (apbif_clk         ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (apbif_clk_en      ),
  .module_en          (ciu_icg_en        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @259
//          .external_en (1'b0), @260
//          .global_en   (1'b1), @261
//          .module_en (ciu_icg_en       ), @262
//          .local_en    (apbif_clk_en), @263
//          .clk_out     (apbif_clk)); @264

// &ModuleEnd; @266
endmodule



