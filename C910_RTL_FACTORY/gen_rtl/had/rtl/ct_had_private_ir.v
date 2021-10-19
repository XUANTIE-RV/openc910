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

// &ModuleBeg; @23
module ct_had_private_ir(
  biu_had_coreid,
  cpuclk,
  cpurst_b,
  ctrl_xx_dbg_disable,
  forever_coreclk,
  ir_corex_wdata,
  ir_ctrl_exit_dbg_reg,
  ir_ctrl_had_clk_en,
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
  sm_update_dr,
  sm_update_ir,
  x_ir_ctrl_dbgfifo_read_pulse,
  x_ir_ctrl_pcfifo_read_pulse,
  x_ir_ctrl_pipefifo_read_pulse,
  x_ir_xx_ex,
  x_ir_xx_go,
  x_sm_xx_update_dr_en
);

// &Ports; @24
input   [1 :0]  biu_had_coreid;               
input           cpuclk;                       
input           cpurst_b;                     
input           ctrl_xx_dbg_disable;          
input           forever_coreclk;              
input   [63:0]  ir_corex_wdata;               
input           sm_update_dr;                 
input           sm_update_ir;                 
output          ir_ctrl_exit_dbg_reg;         
output          ir_ctrl_had_clk_en;           
output          ir_xx_baba_reg_sel;           
output          ir_xx_babb_reg_sel;           
output          ir_xx_bama_reg_sel;           
output          ir_xx_bamb_reg_sel;           
output          ir_xx_csr_reg_sel;            
output          ir_xx_daddr_reg_sel;          
output          ir_xx_dbgfifo_reg_sel;        
output          ir_xx_ddata_reg_sel;          
output          ir_xx_eventie_reg_sel;        
output          ir_xx_eventoe_reg_sel;        
output          ir_xx_hcr_reg_sel;            
output          ir_xx_hsr_reg_sel;            
output          ir_xx_id_reg_sel;             
output          ir_xx_ir_reg_sel;             
output          ir_xx_mbca_reg_sel;           
output          ir_xx_mbcb_reg_sel;           
output          ir_xx_mbir_reg_sel;           
output          ir_xx_otc_reg_sel;            
output          ir_xx_pc_reg_sel;             
output          ir_xx_pcfifo_reg_sel;         
output          ir_xx_pipefifo_reg_sel;       
output          ir_xx_pipesel_reg_sel;        
output          ir_xx_wbbr_reg_sel;           
output  [63:0]  ir_xx_wdata;                  
output          x_ir_ctrl_dbgfifo_read_pulse; 
output          x_ir_ctrl_pcfifo_read_pulse;  
output          x_ir_ctrl_pipefifo_read_pulse; 
output          x_ir_xx_ex;                   
output          x_ir_xx_go;                   
output          x_sm_xx_update_dr_en;         

// &Regs; @25
reg     [15:0]  hacr_f;                       
reg             update_dr_ff1;                
reg             update_hacr_ff1;              

// &Wires; @26
wire            bank0_sel;                    
wire            bank1_sel;                    
wire            bank2_sel;                    
wire    [1 :0]  biu_had_coreid;               
wire            core_sel;                     
wire            cpuclk;                       
wire            cpurst_b;                     
wire            ctrl_xx_dbg_disable;          
wire            dbgfifo_read;                 
wire            forever_coreclk;              
wire    [4 :0]  hacr_index;                   
wire            hacr_rw;                      
wire            hacr_update_en;               
wire    [63:0]  ir_corex_wdata;               
wire            ir_ctrl_exit_dbg_reg;         
wire            ir_ctrl_had_clk_en;           
wire            ir_xx_baba_reg_sel;           
wire            ir_xx_babb_reg_sel;           
wire            ir_xx_bama_reg_sel;           
wire            ir_xx_bamb_reg_sel;           
wire            ir_xx_bypass_reg_sel;         
wire            ir_xx_csr_reg_sel;            
wire            ir_xx_daddr_reg_sel;          
wire            ir_xx_dbgfifo_reg_sel;        
wire            ir_xx_ddata_reg_sel;          
wire            ir_xx_eventie_reg_sel;        
wire            ir_xx_eventoe_reg_sel;        
wire            ir_xx_ex;                     
wire            ir_xx_go;                     
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
wire            pcfifo_read;                  
wire            pipefifo_read;                
wire            sm_update_dr;                 
wire            sm_update_ir;                 
wire            x_ir_ctrl_dbgfifo_read_pulse; 
wire            x_ir_ctrl_pcfifo_read_pulse;  
wire            x_ir_ctrl_pipefifo_read_pulse; 
wire            x_ir_xx_ex;                   
wire            x_ir_xx_go;                   
wire            x_sm_xx_update_dr_en;         
wire            x_update_dr_cpu;              
wire            x_update_dr_cpu_ack;          
wire            x_update_dr_cpu_raw;          
wire            x_update_ir_cpu;              
wire            x_update_ir_cpu_ack;          
wire            x_update_ir_cpu_raw;          



//==========================================================
//                     DR/IR Generation
//==========================================================
// &Instance("sync_level2pulse", "x_ct_had_private_sync_ir"); @32
sync_level2pulse  x_ct_had_private_sync_ir (
  .clk                 (forever_coreclk    ),
  .rst_b               (cpurst_b           ),
  .sync_ack            (x_update_ir_cpu_ack),
  .sync_in             (sm_update_ir       ),
  .sync_out            (x_update_ir_cpu_raw)
);

// &Connect(.clk           (forever_coreclk), @33
//          .rst_b         (cpurst_b), @34
//          .sync_in       (sm_update_ir), @35
//          .sync_out      (x_update_ir_cpu_raw), @36
//          .sync_ack      (x_update_ir_cpu_ack) @37
//         ); @38
assign x_update_ir_cpu = x_update_ir_cpu_raw && !ctrl_xx_dbg_disable;
// &Force("nonport", "x_update_ir_cpu_ack"); @40

// &Instance("sync_level2pulse", "x_ct_had_private_sync_dr"); @42
sync_level2pulse  x_ct_had_private_sync_dr (
  .clk                 (forever_coreclk    ),
  .rst_b               (cpurst_b           ),
  .sync_ack            (x_update_dr_cpu_ack),
  .sync_in             (sm_update_dr       ),
  .sync_out            (x_update_dr_cpu_raw)
);

// &Connect(.clk           (forever_coreclk), @43
//          .rst_b         (cpurst_b), @44
//          .sync_in       (sm_update_dr), @45
//          .sync_out      (x_update_dr_cpu_raw), @46
//          .sync_ack      (x_update_dr_cpu_ack) @47
//         ); @48
assign x_update_dr_cpu = x_update_dr_cpu_raw && !ctrl_xx_dbg_disable;
// &Force("nonport", "x_update_dr_cpu_ack"); @50

always @(posedge cpuclk or negedge cpurst_b)
begin
  if (!cpurst_b)begin
    update_hacr_ff1 <= 1'b0;
    update_dr_ff1   <= 1'b0;
  end
  else begin
    update_hacr_ff1 <= x_update_ir_cpu;
    update_dr_ff1   <= x_update_dr_cpu;
  end
end

//==============================================================================
//  Update HACR
//==============================================================================
assign hacr_update_en = x_update_ir_cpu; //|(hacr_f[15:0] ^ ir_corex_hacr[15:0]);

always @(posedge cpuclk or negedge cpurst_b)
begin
  if (!cpurst_b)
    hacr_f[15:0] <= 16'h8200; // Async reset to point to HAD_ID
  else if (hacr_update_en)
    hacr_f[15:0] <= ir_corex_wdata[15:0];
end

//==============================================================================
//  HACR commond decode
//==============================================================================
parameter ID_NUM     = 5'd2;
parameter OTC_NUM    = 5'd3;
parameter MBCA_NUM   = 5'd4;
parameter MBCB_NUM   = 5'd5;
parameter PCFIFO_NUM = 5'd6;
parameter BABA_NUM   = 5'd7;
parameter BABB_NUM   = 5'd8;
parameter BAMA_NUM   = 5'd9;
parameter BAMB_NUM   = 5'd10;
parameter BYPASS_NUM = 5'd12;
parameter HCR_NUM    = 5'd13;
parameter HSR_NUM    = 5'd14;
parameter WBBR_NUM   = 5'd17;
parameter PSR_NUM    = 5'd18;
parameter PC_NUM     = 5'd19;
parameter IR_NUM     = 5'd20;
parameter CSR_NUM    = 5'd21;
parameter DADDR_NUM  = 5'd24;
parameter DDATA_NUM  = 5'd25;

assign hacr_rw           = hacr_f[15];
assign ir_xx_go          = hacr_f[14];
assign ir_xx_ex          = hacr_f[13];
assign ir_xx_wdata[63:0] = ir_corex_wdata[63:0];

assign core_sel          = (hacr_f[1:0] == biu_had_coreid[1:0]);
assign x_ir_xx_ex        = ir_xx_ex && core_sel;
assign x_ir_xx_go        = ir_xx_go && core_sel;

assign bank0_sel         = (hacr_f[6:4] == 3'd0);
assign bank1_sel         = (hacr_f[6:4] == 3'd1);
assign bank2_sel         = (hacr_f[6:4] == 3'd2);
assign hacr_index[4:0]   =  hacr_f[12:8];

assign ir_xx_id_reg_sel     = bank0_sel && (hacr_index[4:0] == ID_NUM);
assign ir_xx_otc_reg_sel    = bank0_sel && (hacr_index[4:0] == OTC_NUM);
assign ir_xx_mbca_reg_sel   = bank0_sel && (hacr_index[4:0] == MBCA_NUM);
assign ir_xx_mbcb_reg_sel   = bank0_sel && (hacr_index[4:0] == MBCB_NUM);
assign ir_xx_pcfifo_reg_sel = bank0_sel && (hacr_index[4:0] == PCFIFO_NUM);
assign ir_xx_baba_reg_sel   = bank0_sel && (hacr_index[4:0] == BABA_NUM);
assign ir_xx_babb_reg_sel   = bank0_sel && (hacr_index[4:0] == BABB_NUM);
assign ir_xx_bama_reg_sel   = bank0_sel && (hacr_index[4:0] == BAMA_NUM);
assign ir_xx_bamb_reg_sel   = bank0_sel && (hacr_index[4:0] == BAMB_NUM);
assign ir_xx_bypass_reg_sel = bank0_sel && (hacr_index[4:0] == BYPASS_NUM);
assign ir_xx_hcr_reg_sel    = bank0_sel && (hacr_index[4:0] == HCR_NUM);
assign ir_xx_hsr_reg_sel    = bank0_sel && (hacr_index[4:0] == HSR_NUM);
assign ir_xx_wbbr_reg_sel   = bank0_sel && (hacr_index[4:0] == WBBR_NUM);
assign ir_xx_pc_reg_sel     = bank0_sel && (hacr_index[4:0] == PC_NUM);
assign ir_xx_ir_reg_sel     = bank0_sel && (hacr_index[4:0] == IR_NUM);
assign ir_xx_csr_reg_sel    = bank0_sel && (hacr_index[4:0] == CSR_NUM);
assign ir_xx_daddr_reg_sel  = bank0_sel && (hacr_index[4:0] == DADDR_NUM);
assign ir_xx_ddata_reg_sel  = bank0_sel && (hacr_index[4:0] == DDATA_NUM);

parameter MBIR_NUM = 5'd27;

assign ir_xx_mbir_reg_sel   = bank1_sel && (hacr_index[4:0] == MBIR_NUM);

parameter EVENT_OE_NUM = 5'd2;
parameter EVENT_IE_NUM = 5'd3;
parameter DBGFIFO_NUM  = 5'd4;
parameter PIPEFIFO_NUM = 5'd5;
parameter PIPESEL_NUM  = 5'd6;

assign ir_xx_eventoe_reg_sel  = bank2_sel && (hacr_index[4:0] == EVENT_OE_NUM);
assign ir_xx_eventie_reg_sel  = bank2_sel && (hacr_index[4:0] == EVENT_IE_NUM);
assign ir_xx_pipefifo_reg_sel = bank2_sel && (hacr_index[4:0] == PIPEFIFO_NUM);
assign ir_xx_pipesel_reg_sel  = bank2_sel && (hacr_index[4:0] == PIPESEL_NUM);
assign ir_xx_dbgfifo_reg_sel  = bank2_sel && (hacr_index[4:0] == DBGFIFO_NUM);

//================================================
//
//================================================
// &Force("output", "ir_xx_ir_reg_sel"); @152
// &Force("output", "ir_xx_csr_reg_sel"); @153
// &Force("output", "ir_xx_pc_reg_sel"); @154
// &Force("output", "ir_xx_wbbr_reg_sel"); @155
// &Force("output", "ir_xx_pcfifo_reg_sel"); @156
// &Force("output", "ir_xx_pipefifo_reg_sel"); @157
// &Force("output", "ir_xx_dbgfifo_reg_sel"); @158

assign pcfifo_read   = hacr_rw && ir_xx_pcfifo_reg_sel;
assign pipefifo_read = hacr_rw && ir_xx_pipefifo_reg_sel;
assign dbgfifo_read  = hacr_rw && ir_xx_dbgfifo_reg_sel;

assign x_ir_ctrl_pcfifo_read_pulse   = pcfifo_read   && update_hacr_ff1 && core_sel;
assign x_ir_ctrl_pipefifo_read_pulse = pipefifo_read && update_hacr_ff1 && core_sel;
assign x_ir_ctrl_dbgfifo_read_pulse  = dbgfifo_read  && update_hacr_ff1 && core_sel;


assign x_sm_xx_update_dr_en = update_dr_ff1 & !hacr_rw & core_sel;

assign ir_ctrl_exit_dbg_reg = ir_xx_wbbr_reg_sel || 
                              ir_xx_pc_reg_sel   ||
                              ir_xx_ir_reg_sel   ||
                              ir_xx_csr_reg_sel  ||
                              ir_xx_bypass_reg_sel;

assign ir_ctrl_had_clk_en = x_update_ir_cpu_raw
                         || x_update_dr_cpu_raw;

// &ModuleEnd; @180
endmodule
















