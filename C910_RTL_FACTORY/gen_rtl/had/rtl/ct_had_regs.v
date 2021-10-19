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
  
// &ModuleBeg; @24
module ct_had_regs(
  bkpt_regs_mbca,
  bkpt_regs_mbcb,
  cp0_had_cpuid_0,
  cp0_had_lpmd_b,
  cpuclk,
  cpurst_b,
  ctrl_regs_bkpta_vld,
  ctrl_regs_bkptb_vld,
  ctrl_regs_exit_dbg,
  ctrl_regs_freeze_pcfifo,
  ctrl_regs_set_sqa,
  ctrl_regs_set_sqb,
  ctrl_regs_update_adro,
  ctrl_regs_update_dro,
  ctrl_regs_update_mbo,
  ctrl_regs_update_pro,
  ctrl_regs_update_swo,
  ctrl_regs_update_to,
  dbgfifo_regs_data,
  ddc_regs_daddr,
  ddc_regs_ddata,
  ddc_regs_ffy,
  ddc_regs_ir,
  ddc_regs_update_csr,
  ddc_regs_update_wbbr,
  ddc_regs_wbbr,
  ddc_xx_update_ir,
  had_biu_jdb_pm,
  had_idu_wbbr_data,
  had_idu_wbbr_vld,
  had_ifu_ir,
  had_ifu_pc,
  had_yy_xx_bkpta_base,
  had_yy_xx_bkpta_mask,
  had_yy_xx_bkpta_rc,
  had_yy_xx_bkptb_base,
  had_yy_xx_bkptb_mask,
  had_yy_xx_bkptb_rc,
  idu_had_iq_empty,
  idu_had_pipe_stall,
  idu_had_pipeline_empty,
  idu_had_wb_data,
  idu_had_wb_vld,
  ifu_had_no_inst,
  ifu_had_no_op,
  ifu_had_reset_on,
  ir_xx_baba_reg_sel,
  ir_xx_babb_reg_sel,
  ir_xx_bama_reg_sel,
  ir_xx_bamb_reg_sel,
  ir_xx_csr_reg_sel,
  ir_xx_daddr_reg_sel,
  ir_xx_dbgfifo_reg_sel,
  ir_xx_ddata_reg_sel,
  ir_xx_eventie_reg_sel,
  ir_xx_eventoe_reg_sel,
  ir_xx_hcr_reg_sel,
  ir_xx_hsr_reg_sel,
  ir_xx_id_reg_sel,
  ir_xx_ir_reg_sel,
  ir_xx_mbca_reg_sel,
  ir_xx_mbcb_reg_sel,
  ir_xx_mbir_reg_sel,
  ir_xx_otc_reg_sel,
  ir_xx_pc_reg_sel,
  ir_xx_pcfifo_reg_sel,
  ir_xx_pipefifo_reg_sel,
  ir_xx_pipesel_reg_sel,
  ir_xx_wbbr_reg_sel,
  ir_xx_wdata,
  lsu_had_no_op,
  mmu_xx_mmu_en,
  pcfifo_regs_data,
  pipefifo_regs_data,
  pipesel_regs_data,
  regs_ctrl_adr,
  regs_ctrl_dr,
  regs_ctrl_fdb,
  regs_ctrl_frzc,
  regs_ctrl_pcfifo_frozen,
  regs_ctrl_pm,
  regs_ctrl_sqa,
  regs_ctrl_sqb,
  regs_ctrl_sqc,
  regs_ctrl_tme,
  regs_event_enter_ie,
  regs_event_enter_oe,
  regs_event_exit_ie,
  regs_event_exit_oe,
  regs_xx_bca,
  regs_xx_bcb,
  regs_xx_ddc_en,
  regs_xx_nirven,
  rtu_had_inst_exe_dead,
  rtu_had_inst_not_wb,
  rtu_had_rob_empty,
  rtu_had_xx_dbg_ack_pc,
  rtu_had_xx_pc,
  rtu_yy_xx_dbgon,
  trace_regs_otc,
  x_regs_serial_data,
  x_sm_xx_update_dr_en
);

// &Ports; @25
input   [7 :0]  bkpt_regs_mbca;         
input   [7 :0]  bkpt_regs_mbcb;         
input   [31:0]  cp0_had_cpuid_0;        
input   [1 :0]  cp0_had_lpmd_b;         
input           cpuclk;                 
input           cpurst_b;               
input           ctrl_regs_bkpta_vld;    
input           ctrl_regs_bkptb_vld;    
input           ctrl_regs_exit_dbg;     
input           ctrl_regs_freeze_pcfifo; 
input           ctrl_regs_set_sqa;      
input           ctrl_regs_set_sqb;      
input           ctrl_regs_update_adro;  
input           ctrl_regs_update_dro;   
input           ctrl_regs_update_mbo;   
input           ctrl_regs_update_pro;   
input           ctrl_regs_update_swo;   
input           ctrl_regs_update_to;    
input   [63:0]  dbgfifo_regs_data;      
input   [63:0]  ddc_regs_daddr;         
input   [63:0]  ddc_regs_ddata;         
input           ddc_regs_ffy;           
input   [31:0]  ddc_regs_ir;            
input           ddc_regs_update_csr;    
input           ddc_regs_update_wbbr;   
input   [63:0]  ddc_regs_wbbr;          
input           ddc_xx_update_ir;       
input           idu_had_iq_empty;       
input           idu_had_pipe_stall;     
input           idu_had_pipeline_empty; 
input   [63:0]  idu_had_wb_data;        
input           idu_had_wb_vld;         
input           ifu_had_no_inst;        
input           ifu_had_no_op;          
input           ifu_had_reset_on;       
input           ir_xx_baba_reg_sel;     
input           ir_xx_babb_reg_sel;     
input           ir_xx_bama_reg_sel;     
input           ir_xx_bamb_reg_sel;     
input           ir_xx_csr_reg_sel;      
input           ir_xx_daddr_reg_sel;    
input           ir_xx_dbgfifo_reg_sel;  
input           ir_xx_ddata_reg_sel;    
input           ir_xx_eventie_reg_sel;  
input           ir_xx_eventoe_reg_sel;  
input           ir_xx_hcr_reg_sel;      
input           ir_xx_hsr_reg_sel;      
input           ir_xx_id_reg_sel;       
input           ir_xx_ir_reg_sel;       
input           ir_xx_mbca_reg_sel;     
input           ir_xx_mbcb_reg_sel;     
input           ir_xx_mbir_reg_sel;     
input           ir_xx_otc_reg_sel;      
input           ir_xx_pc_reg_sel;       
input           ir_xx_pcfifo_reg_sel;   
input           ir_xx_pipefifo_reg_sel; 
input           ir_xx_pipesel_reg_sel;  
input           ir_xx_wbbr_reg_sel;     
input   [63:0]  ir_xx_wdata;            
input           lsu_had_no_op;          
input           mmu_xx_mmu_en;          
input   [63:0]  pcfifo_regs_data;       
input   [63:0]  pipefifo_regs_data;     
input   [31:0]  pipesel_regs_data;      
input           rtu_had_inst_exe_dead;  
input           rtu_had_inst_not_wb;    
input           rtu_had_rob_empty;      
input           rtu_had_xx_dbg_ack_pc;  
input   [38:0]  rtu_had_xx_pc;          
input           rtu_yy_xx_dbgon;        
input   [7 :0]  trace_regs_otc;         
input           x_sm_xx_update_dr_en;   
output  [1 :0]  had_biu_jdb_pm;         
output  [63:0]  had_idu_wbbr_data;      
output          had_idu_wbbr_vld;       
output  [31:0]  had_ifu_ir;             
output  [38:0]  had_ifu_pc;             
output  [39:0]  had_yy_xx_bkpta_base;   
output  [7 :0]  had_yy_xx_bkpta_mask;   
output          had_yy_xx_bkpta_rc;     
output  [39:0]  had_yy_xx_bkptb_base;   
output  [7 :0]  had_yy_xx_bkptb_mask;   
output          had_yy_xx_bkptb_rc;     
output          regs_ctrl_adr;          
output          regs_ctrl_dr;           
output          regs_ctrl_fdb;          
output          regs_ctrl_frzc;         
output          regs_ctrl_pcfifo_frozen; 
output  [1 :0]  regs_ctrl_pm;           
output          regs_ctrl_sqa;          
output          regs_ctrl_sqb;          
output  [1 :0]  regs_ctrl_sqc;          
output          regs_ctrl_tme;          
output          regs_event_enter_ie;    
output          regs_event_enter_oe;    
output          regs_event_exit_ie;     
output          regs_event_exit_oe;     
output  [4 :0]  regs_xx_bca;            
output  [4 :0]  regs_xx_bcb;            
output          regs_xx_ddc_en;         
output          regs_xx_nirven;         
output  [63:0]  x_regs_serial_data;     

// &Regs; @26
reg             adro;                   
reg     [63:0]  baba_reg;               
reg     [63:0]  babb_reg;               
reg     [7 :0]  bama_reg;               
reg     [7 :0]  bamb_reg;               
reg             bus_dead;               
reg             dro;                    
reg             event_ent_ie;           
reg             event_ent_oe;           
reg             event_exit_ie;          
reg             event_exit_oe;          
reg             exe_dead;               
reg             fdb;                    
reg             ffy;                    
reg             frzo;                   
reg             hcr_adr;                
reg     [4 :0]  hcr_bca;                
reg     [4 :0]  hcr_bcb;                
reg             hcr_ddcen;              
reg             hcr_dr;                 
reg             hcr_frzc;               
reg             hcr_idre;               
reg             hcr_nicven;             
reg             hcr_rca;                
reg             hcr_rcb;                
reg     [1 :0]  hcr_sqc;                
reg             hcr_tme;                
reg             idu_stall;              
reg             ifu_dead;               
reg             inst_not_wb;            
reg             iq_not_empty;           
reg     [31:0]  ir_reg;                 
reg     [1 :0]  mbir_idx;               
reg             mbo;                    
reg     [63:0]  pc;                     
reg     [1 :0]  pm;                     
reg             pro;                    
reg             ps;                     
reg             rob_not_empty;          
reg             sqa;                    
reg             sqb;                    
reg             swo;                    
reg             to;                     
reg     [63:0]  wbbr_reg;               
reg     [63:0]  x_regs_serial_data;     

// &Wires; @27
wire            biu_idle;               
wire    [7 :0]  bkpt_regs_mbca;         
wire    [7 :0]  bkpt_regs_mbcb;         
wire    [31:0]  cp0_had_cpuid_0;        
wire    [1 :0]  cp0_had_lpmd_b;         
wire            cpu_idle;               
wire            cpuclk;                 
wire            cpurst_b;               
wire    [15:0]  csr_reg;                
wire            ctrl_regs_bkpta_vld;    
wire            ctrl_regs_bkptb_vld;    
wire            ctrl_regs_exit_dbg;     
wire            ctrl_regs_freeze_pcfifo; 
wire            ctrl_regs_set_sqa;      
wire            ctrl_regs_set_sqb;      
wire            ctrl_regs_update_adro;  
wire            ctrl_regs_update_dro;   
wire            ctrl_regs_update_mbo;   
wire            ctrl_regs_update_pro;   
wire            ctrl_regs_update_swo;   
wire            ctrl_regs_update_to;    
wire    [63:0]  dbgfifo_regs_data;      
wire    [63:0]  ddc_regs_daddr;         
wire    [63:0]  ddc_regs_ddata;         
wire            ddc_regs_ffy;           
wire    [31:0]  ddc_regs_ir;            
wire            ddc_regs_update_csr;    
wire            ddc_regs_update_wbbr;   
wire    [63:0]  ddc_regs_wbbr;          
wire            ddc_xx_update_ir;       
wire    [31:0]  event_ie_reg;           
wire    [31:0]  event_oe_reg;           
wire    [1 :0]  had_biu_jdb_pm;         
wire    [63:0]  had_idu_wbbr_data;      
wire            had_idu_wbbr_vld;       
wire    [31:0]  had_ifu_ir;             
wire    [38:0]  had_ifu_pc;             
wire    [39:0]  had_yy_xx_bkpta_base;   
wire    [7 :0]  had_yy_xx_bkpta_mask;   
wire            had_yy_xx_bkpta_rc;     
wire    [39:0]  had_yy_xx_bkptb_base;   
wire    [7 :0]  had_yy_xx_bkptb_mask;   
wire            had_yy_xx_bkptb_rc;     
wire            hcr_jtgr_int_en;        
wire            hcr_jtgw_int_en;        
wire    [31:0]  hcr_reg;                
wire            hcr_wen;                
wire    [31:0]  hsr_reg;                
wire    [31:0]  id_reg;                 
wire            idu_had_iq_empty;       
wire            idu_had_pipe_stall;     
wire            idu_had_pipeline_empty; 
wire    [63:0]  idu_had_wb_data;        
wire            idu_had_wb_vld;         
wire            ifu_had_no_inst;        
wire            ifu_had_no_op;          
wire            ifu_had_reset_on;       
wire            ir_xx_baba_reg_sel;     
wire            ir_xx_babb_reg_sel;     
wire            ir_xx_bama_reg_sel;     
wire            ir_xx_bamb_reg_sel;     
wire            ir_xx_csr_reg_sel;      
wire            ir_xx_daddr_reg_sel;    
wire            ir_xx_dbgfifo_reg_sel;  
wire            ir_xx_ddata_reg_sel;    
wire            ir_xx_eventie_reg_sel;  
wire            ir_xx_eventoe_reg_sel;  
wire            ir_xx_hcr_reg_sel;      
wire            ir_xx_hsr_reg_sel;      
wire            ir_xx_id_reg_sel;       
wire            ir_xx_ir_reg_sel;       
wire            ir_xx_mbca_reg_sel;     
wire            ir_xx_mbcb_reg_sel;     
wire            ir_xx_mbir_reg_sel;     
wire            ir_xx_otc_reg_sel;      
wire            ir_xx_pc_reg_sel;       
wire            ir_xx_pcfifo_reg_sel;   
wire            ir_xx_pipefifo_reg_sel; 
wire            ir_xx_pipesel_reg_sel;  
wire            ir_xx_wbbr_reg_sel;     
wire    [63:0]  ir_xx_wdata;            
wire            lsu_had_no_op;          
wire    [31:0]  mbir_reg;               
wire            mmu_xx_mmu_en;          
wire    [63:0]  pc_reg;                 
wire            pc_wen;                 
wire    [63:0]  pcfifo_regs_data;       
wire    [63:0]  pipefifo_regs_data;     
wire    [31:0]  pipesel_regs_data;      
wire            regs_ctrl_adr;          
wire            regs_ctrl_dr;           
wire            regs_ctrl_fdb;          
wire            regs_ctrl_frzc;         
wire            regs_ctrl_pcfifo_frozen; 
wire    [1 :0]  regs_ctrl_pm;           
wire            regs_ctrl_sqa;          
wire            regs_ctrl_sqb;          
wire    [1 :0]  regs_ctrl_sqc;          
wire            regs_ctrl_tme;          
wire    [63:0]  regs_data_out;          
wire            regs_event_enter_ie;    
wire            regs_event_enter_oe;    
wire            regs_event_exit_ie;     
wire            regs_event_exit_oe;     
wire    [4 :0]  regs_xx_bca;            
wire    [4 :0]  regs_xx_bcb;            
wire            regs_xx_ddc_en;         
wire            regs_xx_nirven;         
wire            rtu_had_inst_exe_dead;  
wire            rtu_had_inst_not_wb;    
wire            rtu_had_rob_empty;      
wire            rtu_had_xx_dbg_ack_pc;  
wire    [38:0]  rtu_had_xx_pc;          
wire            rtu_yy_xx_dbgon;        
wire            sm_xx_update_dr_en;     
wire    [7 :0]  trace_regs_otc;         
wire            x_sm_xx_update_dr_en;   


//==========================================================
// HAD_ID register
//==========================================================
// +-------+-----+---------+----+----+-------+------+-----+-----+
// | 31:28 |27:26|  25:18  | 17 | 16 | 15:12 | 11:8 | 7:4 | 3:0 |
// +-------+-----+---------+----+----+-------+------+-----+-----+
//     |      |              |    |      |       |    |     |
//     |      |              |    |      |       |    |     +--- ID_VERSION
//     |      |              |    |      |       |    +--------- HAD_VERSION
//     |      |              |    |      |       +-------------- HAD_REVISION
//     |      |              |    |      +---------------------- BKPT_NUM
//     |      |              |    +----------------------------- DDC
//     |      |              +---------------------------------- BANK1
//     |      +--------------------------------------- CPU Inst. Arch
//     +---------------------------------------------- JTAG InterfaceType
parameter ADDRW = `PA_WIDTH;
parameter DATAW = 64;

// &Force("bus", "cp0_had_cpuid_0", 31,0); @47

assign id_reg[31:28] = 4'b0;
assign id_reg[27:26] = cp0_had_cpuid_0[27:26]; //2'b10;  //CSKY V3
assign id_reg[25:19] = 7'd0;   // -
assign id_reg[18]    = 1'b1;  //hacr_reg is 16 bits
assign id_reg[17]    = 1'b0;  // BANK1
assign id_reg[16]    = 1'b1;  // DDC
assign id_reg[15:12] = 4'd2;  // BKPT_NUM

//-----------------------------------------
// initial reversion
// assign id_reg[11:8]  = 4'b0000;
//-----------------------------------------
// memeory breakpoint logic modify
// current instruction doesnot executing
// but goto debug mode if current maca is 0
// assign id_reg[11:8]  = 4'b0001;
//-----------------------------------------
// add HCR[ASR] and cpu dead reason in HSR
//assign id_reg[11:8]  = 4'b0010;

// version 2.3
// 1. add DCC handshake
// 2. add TEE support
assign id_reg[11:8]  = 4'b1011;

// HAD_VER as ISA version,0000:6xx, 0001:810p, 0010: 8xx, 0011:902, 0100: 960
assign id_reg[7:4]   = 4'b0100; 

assign id_reg[3:0]   = 4'b0011;

assign sm_xx_update_dr_en = x_sm_xx_update_dr_en;
//==========================================================
// BABA -- Base Address of Breakpoint A  
//==========================================================

always @(posedge cpuclk or negedge cpurst_b)
begin
  if (!cpurst_b)
    baba_reg[DATAW-1:0] <= {DATAW{1'b0}};
  else if (sm_xx_update_dr_en && ir_xx_baba_reg_sel)
    baba_reg[DATAW-1:0] <= ir_xx_wdata[DATAW-1:0];
  else
    baba_reg[DATAW-1:0] <= baba_reg[DATAW-1:0];
end

//==========================================================
// BABB -- Base Address of Breakpoint B 
//==========================================================

always @(posedge cpuclk or negedge cpurst_b)
begin
  if (!cpurst_b)
    babb_reg[DATAW-1:0] <= {DATAW{1'b0}};
  else if (sm_xx_update_dr_en && ir_xx_babb_reg_sel)
    babb_reg[DATAW-1:0] <= ir_xx_wdata[DATAW-1:0];
  else
    babb_reg[DATAW-1:0] <= babb_reg[DATAW-1:0];
end

//==========================================================
// BAMA -- Base Address Mask of Breakpoint A 
//==========================================================
// reset BAMA to zero for low power design

always @(posedge cpuclk or negedge cpurst_b)
begin
  if (!cpurst_b)
    bama_reg[7:0] <= 8'b0;
  else if (sm_xx_update_dr_en && ir_xx_bama_reg_sel)
    bama_reg[7:0] <= ir_xx_wdata[7:0];
  else
    bama_reg[7:0] <= bama_reg[7:0];
end

//==========================================================
// BAMB -- Base Address Mask of Breakpoint B 
//==========================================================
// reset BAMB to zero for low power design

always @(posedge cpuclk or negedge cpurst_b)
begin
  if (!cpurst_b)
    bamb_reg[7:0] <= 8'b0;
  else if (sm_xx_update_dr_en && ir_xx_bamb_reg_sel)
    bamb_reg[7:0] <= ir_xx_wdata[7:0];
  else
    bamb_reg[7:0] <= bamb_reg[7:0];
end

//==========================================================
// EVENT_OE -- event output enable reg
//==========================================================

always @(posedge cpuclk or negedge cpurst_b)
begin
  if (!cpurst_b)
  begin
    event_exit_oe <= 1'b0;
    event_ent_oe  <= 1'b0;
  end
  else if (sm_xx_update_dr_en && ir_xx_eventoe_reg_sel)
  begin
    event_exit_oe <= ir_xx_wdata[1];
    event_ent_oe  <= ir_xx_wdata[0];
  end
end

assign event_oe_reg[31:0] = {30'b0,event_exit_oe, event_ent_oe};

//==========================================================
// EVENT_IE -- event input enable reg
//==========================================================

always @(posedge cpuclk or negedge cpurst_b)
begin
  if (!cpurst_b)
  begin
    event_exit_ie <= 1'b0;
    event_ent_ie  <= 1'b0;
  end
  else if (sm_xx_update_dr_en && ir_xx_eventie_reg_sel)
  begin
    event_exit_ie <= ir_xx_wdata[1];
    event_ent_ie  <= ir_xx_wdata[0];
  end
end

assign event_ie_reg[31:0] = {30'b0, event_exit_ie, event_ent_ie};

//==========================================================
// CPUSCR scan chain, includes WBBR, PSR, PC, IR and CSR
//==========================================================

// WBBR
always @(posedge cpuclk or negedge cpurst_b)
begin
  if (!cpurst_b)
    wbbr_reg[DATAW-1:0] <= 64'b0;
  else if (sm_xx_update_dr_en && ir_xx_wbbr_reg_sel)
    wbbr_reg[DATAW-1:0] <= ir_xx_wdata[DATAW-1:0];
  else if (ddc_regs_update_wbbr)
    wbbr_reg[DATAW-1:0] <= ddc_regs_wbbr[DATAW-1:0];
  else if (idu_had_wb_vld)
    wbbr_reg[DATAW-1:0] <= idu_had_wb_data[DATAW-1:0];
  else
    wbbr_reg[DATAW-1:0] <= wbbr_reg[DATAW-1:0];
end

// PC
assign pc_wen = sm_xx_update_dr_en && rtu_yy_xx_dbgon && ir_xx_pc_reg_sel;

always @(posedge cpuclk or negedge cpurst_b)
begin
  if (!cpurst_b)
    pc[DATAW-1:0] <= 64'b0;
  else if (rtu_had_xx_dbg_ack_pc)// || rtu_had_int_ack)
    pc[DATAW-1:0] <= mmu_xx_mmu_en ? {{(DATAW-ADDRW){rtu_had_xx_pc[ADDRW-2]}},rtu_had_xx_pc[ADDRW-2:0],1'b0}
                                   : {{(DATAW-ADDRW){1'b0}},                  rtu_had_xx_pc[ADDRW-2:0],1'b0};
  else if (pc_wen)
    pc[DATAW-1:0] <= ir_xx_wdata[DATAW-1:0];
end

assign pc_reg[DATAW-1:0] = pc[DATAW-1:0];

// IR
always @(posedge cpuclk or negedge cpurst_b)
begin
  if (!cpurst_b)
    ir_reg[31:0] <= 32'b0;
  else if (sm_xx_update_dr_en && ir_xx_ir_reg_sel)
    ir_reg[31:0] <= ir_xx_wdata[31:0];
  else if (ddc_xx_update_ir)
    ir_reg[31:0] <= ddc_regs_ir[31:0];
  else
    ir_reg[31:0] <= ir_reg[31:0];
end

assign had_ifu_ir[31:0] = ir_reg[31:0];

// CSR
always @(posedge cpuclk or negedge cpurst_b)
begin
  if (!cpurst_b) begin
    ffy         <= 1'b0;
    fdb         <= 1'b0;
  end
  else if (sm_xx_update_dr_en && ir_xx_csr_reg_sel) begin
    ffy         <= ir_xx_wdata[8];
    fdb         <= ir_xx_wdata[7];
  end
  else if (ddc_regs_update_csr) begin
    ffy         <= ddc_regs_ffy;
    fdb         <= 1'b0;
  end
  else begin
    ffy         <= ffy;
    fdb         <= fdb;
  end
end

assign csr_reg[15:0] = {7'b0, ffy, fdb, 7'b0};

//==============================================================================
// HCR -- Had Control Reigster
//==============================================================================
assign hcr_wen = sm_xx_update_dr_en && ir_xx_hcr_reg_sel;

always @(posedge cpuclk or negedge cpurst_b)
begin
  if (!cpurst_b) begin 
    hcr_nicven      <= 1'b0;
    hcr_adr         <= 1'b0;
    hcr_ddcen       <= 1'b0;
    hcr_sqc[1:0]    <= 2'b0;
    hcr_dr          <= 1'b0;
    hcr_idre        <= 1'b0;
    hcr_tme         <= 1'b0;
    hcr_frzc        <= 1'b0;
    hcr_rcb         <= 1'b0;
    hcr_bcb[4:0]    <= 5'b0;
    hcr_rca         <= 1'b0;
    hcr_bca[4:0]    <= 5'b0;
  end
  else if (hcr_wen) begin
    hcr_nicven      <= ir_xx_wdata[31];
    hcr_adr         <= ir_xx_wdata[21];
    hcr_ddcen       <= ir_xx_wdata[20];
    hcr_sqc[1:0]    <= ir_xx_wdata[17:16];
    hcr_dr          <= ir_xx_wdata[15];
    hcr_idre        <= ir_xx_wdata[14];
    hcr_tme         <= ir_xx_wdata[13];
    hcr_frzc        <= ir_xx_wdata[12];
    hcr_rcb         <= ir_xx_wdata[11];
    hcr_bcb[4:0]    <= ir_xx_wdata[10:6];
    hcr_rca         <= ir_xx_wdata[5];
    hcr_bca[4:0]    <= ir_xx_wdata[4:0];
  end
end

assign hcr_jtgr_int_en = 1'b0;
assign hcr_jtgw_int_en = 1'b0;

assign hcr_reg[31:0] = {hcr_nicven, 9'b0, hcr_adr, hcr_ddcen,
                        hcr_jtgr_int_en, hcr_jtgw_int_en, hcr_sqc[1:0],
                        hcr_dr, hcr_idre, hcr_tme, hcr_frzc,
                        hcr_rcb, hcr_bcb[4:0], hcr_rca, hcr_bca[4:0]};

//==============================================================================
// HSR -- Had Status Reigster
//==============================================================================
assign biu_idle = ifu_had_no_op && lsu_had_no_op;

always @(posedge cpuclk or negedge cpurst_b)
begin
  if (!cpurst_b) begin
    inst_not_wb    <= 1'b0;
    rob_not_empty  <= 1'b0;
    iq_not_empty   <= 1'b0;
    idu_stall      <= 1'b0;
    bus_dead       <= 1'b0;
    ifu_dead       <= 1'b0;
    exe_dead       <= 1'b0;
  end 
  else if (rtu_had_xx_dbg_ack_pc) begin
    inst_not_wb    <= rtu_had_inst_not_wb;
    rob_not_empty  <= !rtu_had_rob_empty;
    iq_not_empty   <= !idu_had_iq_empty;
    idu_stall      <= idu_had_pipe_stall;
    bus_dead       <= !biu_idle;
    ifu_dead       <= biu_idle && ifu_had_no_inst;
    exe_dead       <= rtu_had_inst_exe_dead;
  end
end

// ps: 0:busy  1:idle
assign cpu_idle = idu_had_pipeline_empty &&
                  lsu_had_no_op &&
                  ifu_had_no_op;

always @(posedge cpuclk or negedge cpurst_b)
begin
  if (!cpurst_b)
    ps <= 1'b1;
  else if (cpu_idle)
    ps <= 1'b1;
  else
    ps <= 1'b0;
end

// ADRO: set adr or jdb_req_b
always @(posedge cpuclk or negedge cpurst_b)
begin
  if (!cpurst_b)
    adro <= 1'b0;
  else if (ctrl_regs_update_adro)
    adro <= 1'b1;
  else if (ctrl_regs_exit_dbg)
    adro <= 1'b0;
  else
    adro <= adro;
end

// DRO: set DR
always @(posedge cpuclk or negedge cpurst_b)
begin
  if (!cpurst_b)
    dro <= 1'b0;
  else if (ctrl_regs_update_dro)
    dro <= 1'b1;
  else if (ctrl_regs_exit_dbg)
    dro <= 1'b0;
  else
    dro <= dro;
end
  
// MBO: memory bkpt
always @(posedge cpuclk or negedge cpurst_b)
begin
  if (!cpurst_b)
    mbo <= 1'b0;
  else if (ctrl_regs_update_mbo)
    mbo <= 1'b1;
  else if (ctrl_regs_exit_dbg)
    mbo <= 1'b0;
  else
    mbo <= mbo;
end

// SWO: bkpt inst
always @(posedge cpuclk or negedge cpurst_b)
begin
  if (!cpurst_b)
    swo <= 1'b0;
  else if (ctrl_regs_update_swo)
    swo <= 1'b1;
  else if (ctrl_regs_exit_dbg)
    swo <= 1'b0;
  else
    swo <= swo;
end

// TO: trace
always @(posedge cpuclk or negedge cpurst_b)
begin
  if (!cpurst_b)
    to <= 1'b0;
  else if (ctrl_regs_update_to)
    to <= 1'b1;
  else if (ctrl_regs_exit_dbg)
    to <= 1'b0;
  else 
    to <= to;
end

// FRZO: 
always @(posedge cpuclk or negedge cpurst_b)
begin
  if (!cpurst_b)
    frzo <= 1'b0;
  else if (ctrl_regs_freeze_pcfifo)
    frzo <= 1'b1;
  else if (ctrl_regs_exit_dbg)
    frzo <= 1'b0;
  else
    frzo <= frzo;
end

// SQB: this bit will set when SQC enable and mem bkptb occurs
always @(posedge cpuclk or negedge cpurst_b)
begin
  if (!cpurst_b)
    sqb <= 1'b0;
  else if (ctrl_regs_set_sqb)
    sqb <= 1'b1;
  else if (ctrl_regs_exit_dbg)
    sqb <= 1'b0;
  else
    sqb <= sqb;
end

// SQA: this bit will set when SQC enable and mem bkpta occurs
always @(posedge cpuclk or negedge cpurst_b)
begin
  if (!cpurst_b)
    sqa <= 1'b0;
  else if (ctrl_regs_set_sqa)
    sqa <= 1'b1;
  else if (ctrl_regs_exit_dbg)
    sqa <= 1'b0;
  else
    sqa <= sqa;
end

// PM
always @(posedge cpuclk or negedge cpurst_b)
begin
  if (!cpurst_b)
    pm[1:0] <= 2'b11;
  else if (ifu_had_reset_on)
    pm[1:0] <= 2'b11;
  else if (rtu_yy_xx_dbgon)
    pm[1:0] <= 2'b10;
  else if (!cp0_had_lpmd_b[1] || !cp0_had_lpmd_b[0])
    pm[1:0] <= 2'b01;
  else 
    pm[1:0] <= 2'b00;
end

//PRO: passive debug request
always @(posedge cpuclk or negedge cpurst_b)
begin
  if (!cpurst_b)
    pro <= 1'b0;
  else if (ctrl_regs_update_pro)
    pro <= 1'b1;
  else if (ctrl_regs_exit_dbg)
    pro <= 1'b0;
  else
    pro <= pro;
end
assign hsr_reg[31:0] = {11'b0,                         
                        idu_stall, iq_not_empty, rob_not_empty, inst_not_wb,
                        pro, bus_dead, ifu_dead, exe_dead, ps, 2'b0, adro, dro, mbo, swo,
                        to, frzo, sqb, sqa, pm[1:0]};

always @(posedge cpuclk or negedge cpurst_b)
begin
  if (!cpurst_b)
    mbir_idx[1:0] <= 2'b0;
  else if (ctrl_regs_bkpta_vld)
    mbir_idx[1:0] <= 2'b01;
  else if (ctrl_regs_bkptb_vld)
    mbir_idx[1:0] <= 2'b10;
  else if (ctrl_regs_exit_dbg)
    mbir_idx[1:0] <= 2'b0;
  else
    mbir_idx[1:0] <= mbir_idx[1:0];
end

assign mbir_reg[31:0] = {30'b0, mbir_idx[1:0]};

//==============================================================================
// Interface to other CPU units
//==============================================================================

//==========================================================
// Interface to IFU
//==========================================================

assign had_ifu_pc[ADDRW-2:0] = pc_reg[ADDRW-1:1];

//==========================================================
// Interface to IDU
//==========================================================

assign had_idu_wbbr_data[DATAW-1:0] = wbbr_reg[DATAW-1:0];
assign had_idu_wbbr_vld = ffy && rtu_yy_xx_dbgon;

//==========================================================
// Control signal from CPUSCR's CSR
//==========================================================

assign regs_ctrl_fdb = fdb;

//==========================================================
// Control signal from HCR
//==========================================================
assign regs_ctrl_adr      = hcr_reg[21];

assign regs_xx_ddc_en     = hcr_reg[20];

assign regs_ctrl_sqc[1:0] = hcr_reg[17:16];

assign regs_ctrl_dr       = hcr_reg[15];

assign regs_ctrl_tme      = hcr_reg[13];

assign regs_ctrl_frzc     = hcr_reg[12];

assign regs_xx_bcb[4:0]   = hcr_reg[10:6];

assign regs_xx_bca[4:0]   = hcr_reg[4:0];

assign regs_xx_nirven     = hcr_reg[31]; 

//==========================================================
// Control signal from event regs
//==========================================================
assign regs_event_enter_ie = event_ent_ie;

assign regs_event_exit_ie  = event_exit_ie;

assign regs_event_enter_oe = event_ent_oe;

assign regs_event_exit_oe  = event_exit_oe;

//==========================================================
// status signal from HSR
//==========================================================

assign regs_ctrl_pcfifo_frozen = frzo;

assign regs_ctrl_sqb = sqb;

assign regs_ctrl_sqa = sqa;

assign regs_ctrl_pm[1:0] = pm[1:0];

//==========================================================
// Base address and mask to RTU and LSU
//==========================================================

assign had_yy_xx_bkpta_base[ADDRW-1:0] = baba_reg[ADDRW-1:0];
assign had_yy_xx_bkptb_base[ADDRW-1:0] = babb_reg[ADDRW-1:0];

assign had_yy_xx_bkpta_mask[7:0]  = bama_reg[7:0];

assign had_yy_xx_bkptb_mask[7:0]  = bamb_reg[7:0];

assign had_yy_xx_bkpta_rc = hcr_reg[5];

assign had_yy_xx_bkptb_rc = hcr_reg[11];


//==========================================================
// Output signal from HSR
//==========================================================

assign had_biu_jdb_pm[1:0] = pm[1:0];

//==============================================================================
// data read out from regs to serial
//==============================================================================
assign regs_data_out[DATAW-1:0] =
    {DATAW{ir_xx_id_reg_sel}}       & {{DATAW-32{1'b0}},id_reg[31:0]}
  | {DATAW{ir_xx_otc_reg_sel}}      & {{DATAW-8{1'b0}},trace_regs_otc[7:0]}
  | {DATAW{ir_xx_mbca_reg_sel}}     & {{DATAW-8{1'b0}},bkpt_regs_mbca[7:0]}
  | {DATAW{ir_xx_mbcb_reg_sel}}     & {{DATAW-8{1'b0}},bkpt_regs_mbcb[7:0]}
  | {DATAW{ir_xx_pcfifo_reg_sel}}   & pcfifo_regs_data[DATAW-1:0]
  | {DATAW{ir_xx_baba_reg_sel}}     & baba_reg[DATAW-1:0]
  | {DATAW{ir_xx_babb_reg_sel}}     & babb_reg[DATAW-1:0]
  | {DATAW{ir_xx_bama_reg_sel}}     & {{DATAW-8{1'b0}},bama_reg[7:0]}
  | {DATAW{ir_xx_bamb_reg_sel}}     & {{DATAW-8{1'b0}},bamb_reg[7:0]}
  | {DATAW{ir_xx_wbbr_reg_sel}}     & wbbr_reg[DATAW-1:0]
  | {DATAW{ir_xx_pc_reg_sel}}       & pc_reg[DATAW-1:0]
  | {DATAW{ir_xx_ir_reg_sel}}       & {{DATAW-32{1'b0}},ir_reg[31:0]}
  | {DATAW{ir_xx_csr_reg_sel}}      & {{DATAW-16{1'b0}},csr_reg[15:0]}
  | {DATAW{ir_xx_hcr_reg_sel}}      & {{DATAW-32{1'b0}},hcr_reg[31:0]}
  | {DATAW{ir_xx_hsr_reg_sel}}      & {{DATAW-32{1'b0}},hsr_reg[31:0]}
  | {DATAW{ir_xx_mbir_reg_sel}}     & {{DATAW-32{1'b0}},mbir_reg[31:0]}
  | {DATAW{ir_xx_daddr_reg_sel}}    & ddc_regs_daddr[DATAW-1:0]
  | {DATAW{ir_xx_ddata_reg_sel}}    & ddc_regs_ddata[DATAW-1:0]
  | {DATAW{ir_xx_eventoe_reg_sel}}  & {{DATAW-32{1'b0}},event_oe_reg[31:0]}
  | {DATAW{ir_xx_eventie_reg_sel}}  & {{DATAW-32{1'b0}},event_ie_reg[31:0]}
  | {DATAW{ir_xx_dbgfifo_reg_sel}}  & dbgfifo_regs_data[DATAW-1:0]
  | {DATAW{ir_xx_pipefifo_reg_sel}} & pipefifo_regs_data[DATAW-1:0]
  | {DATAW{ir_xx_pipesel_reg_sel}}  & {{DATAW-32{1'b0}},pipesel_regs_data[31:0]};

always @(posedge cpuclk) 
begin
  x_regs_serial_data[DATAW-1:0] <= regs_data_out[DATAW-1:0];
end

// &ModuleEnd; @612
endmodule



