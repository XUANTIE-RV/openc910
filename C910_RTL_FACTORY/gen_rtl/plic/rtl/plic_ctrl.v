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
module plic_ctrl(
  plicrst_b,
  plic_clk,
  bus_mtx_plic_ctrl_psel,
  bus_mtx_plic_ctrl_penable,
  bus_mtx_plic_ctrl_paddr,
  bus_mtx_plic_ctrl_pprot,
  bus_mtx_plic_ctrl_pwdata,
  bus_mtx_plic_ctrl_pwrite,
  bus_mtx_plic_ctrl_psec,
  ciu_plic_icg_en,
  pad_yy_icg_scan_en,
  plic_ctrl_prdata,
  plic_ctrl_pslverr,
  plic_ctrl_pready,
  ctrl_xx_s_permission_t,
  ctrl_xx_s_permission_nt,
  ctrl_xx_amp_mode,
  ctrl_xx_amp_lock

);
input               plic_clk;
input               plicrst_b;
input               bus_mtx_plic_ctrl_psel;
input               bus_mtx_plic_ctrl_penable;
input      [1:0]    bus_mtx_plic_ctrl_pprot;
input     [11:0]    bus_mtx_plic_ctrl_paddr;
input     [31:0]    bus_mtx_plic_ctrl_pwdata;
input               bus_mtx_plic_ctrl_pwrite;
input               bus_mtx_plic_ctrl_psec;
input               ciu_plic_icg_en;
input               pad_yy_icg_scan_en;
output    [31:0]    plic_ctrl_prdata;
output              plic_ctrl_pslverr;
output              plic_ctrl_pready;
output              ctrl_xx_s_permission_t;
output              ctrl_xx_s_permission_nt;
output              ctrl_xx_amp_mode;
output              ctrl_xx_amp_lock;
  
wire                plic_ctrl_apb_acc_en;
wire                plic_ctrl_apb_write_en;
wire                plic_ctrl_apb_read_en;
wire                plic_ctrl_reg_wr_en;
wire                plic_ctrl_pslverr_pre;
wire                plic_ctrl_clk_en;
wire                plic_ctrl_clk;
wire                plic_ctrl_reg_rd_en;
wire                plic_ctrl_reg_sel_en;

reg                 plic_ctrl_pready;
wire                plic_t_amp_write_en;

reg                 plic_s_permission_t;
wire                plic_s_permision_t_wen;
wire                plic_s_permission_t_clean;
wire                plic_s_permission_t_pre;
wire                plic_ctrl_reg_t_write_en;
`ifdef PLIC_SEC
reg                 plic_amp;
reg                 plic_sec_lock;
reg                 plic_s_permission;
wire                plic_s_permission_norm_wen;
wire                plic_s_permission_norm_clean;
wire                plic_s_permission_norm_pre;
wire                plic_ctrl_reg_norm_write_en;
wire                sec_ctrl_reg_sel_en;

wire                plic_ctrl_nt_vio;
wire                plic_sec_ctrl_reg_wr_en;
wire                plic_sec_ctrl_reg_rd_en;
wire    [31:0]      plic_sec_ctrl_reg_prdata;
wire    [31:0]      plic_ctrl_reg_prdata;

`else
wire                plic_amp;
`endif
assign plic_ctrl_apb_acc_en     = bus_mtx_plic_ctrl_psel 
                                  && !bus_mtx_plic_ctrl_penable;

assign plic_ctrl_apb_write_en   = plic_ctrl_apb_acc_en 
                                  && bus_mtx_plic_ctrl_pwrite 
                                  && !plic_ctrl_pslverr_pre;

assign plic_ctrl_apb_read_en    = plic_ctrl_apb_acc_en 
                                  && !bus_mtx_plic_ctrl_pwrite 
                                  && !plic_ctrl_pslverr_pre;

assign plic_ctrl_reg_sel_en     = (bus_mtx_plic_ctrl_paddr[11:0] == 12'hffc);
assign plic_ctrl_reg_wr_en      = plic_ctrl_apb_write_en 
                                  && plic_ctrl_reg_sel_en;
assign plic_ctrl_reg_rd_en      = plic_ctrl_apb_read_en && plic_ctrl_reg_sel_en;




`ifdef PLIC_SEC

// the slave err pre will different when 
assign plic_ctrl_pslverr_pre    = (((bus_mtx_plic_ctrl_paddr[11:0] != 12'hffc) 
                                     && (bus_mtx_plic_ctrl_paddr[11:0] != 12'hff8)) || 
                                   (bus_mtx_plic_ctrl_pprot[1:0]  != 2'b11)) 
                                 || plic_ctrl_nt_vio;
assign plic_ctrl_nt_vio         = plic_amp 
                                  && (bus_mtx_plic_ctrl_paddr[11:0] == 12'hff8) 
                                  && !bus_mtx_plic_ctrl_psec;
                                     
assign sec_ctrl_reg_sel_en      = (bus_mtx_plic_ctrl_paddr[11:0] == 12'hff8);

assign plic_sec_ctrl_reg_wr_en  = plic_ctrl_apb_write_en
                                  && sec_ctrl_reg_sel_en
                                  && bus_mtx_plic_ctrl_psec;
assign plic_sec_ctrl_reg_rd_en  = plic_ctrl_apb_read_en
                                  && sec_ctrl_reg_sel_en
                                  && bus_mtx_plic_ctrl_psec;
// 

assign plic_t_amp_write_en      =  plic_sec_ctrl_reg_wr_en && !plic_sec_lock;
always @(posedge plic_ctrl_clk or negedge plicrst_b)
begin
  if(!plicrst_b)
    plic_amp  <=  1'b0;
  else if(plic_t_amp_write_en)
    plic_amp  <= bus_mtx_plic_ctrl_pwdata[30];
end
always @(posedge plic_ctrl_clk or negedge plicrst_b)
begin
  if(!plicrst_b)
    plic_sec_lock  <=  1'b0;
  else if(plic_t_amp_write_en)
    plic_sec_lock  <= bus_mtx_plic_ctrl_pwdata[31];
end

assign plic_ctrl_reg_norm_write_en  = plic_ctrl_reg_wr_en && !bus_mtx_plic_ctrl_psec && plic_amp;
assign plic_s_permission_norm_wen   = plic_ctrl_reg_norm_write_en || plic_s_permission_norm_clean;

assign plic_s_permission_norm_clean = plic_amp && ~bus_mtx_plic_ctrl_pwdata[30] && plic_t_amp_write_en;
assign plic_s_permission_norm_pre   = plic_s_permission_norm_clean ? 1'b0 : bus_mtx_plic_ctrl_pwdata[0];

always @(posedge plic_ctrl_clk or negedge plicrst_b)
begin
  if(!plicrst_b)
    plic_s_permission  <=  1'b0;
  else if(plic_s_permission_norm_wen)
    plic_s_permission  <= plic_s_permission_norm_pre;
end


assign ctrl_xx_amp_mode               = plic_amp;

assign plic_ctrl_reg_prdata[31:0]     = bus_mtx_plic_ctrl_psec ? {31'b0,plic_s_permission_t}
                                                               : {31'b0,plic_s_permission};
assign plic_sec_ctrl_reg_prdata[31:0] = {32{bus_mtx_plic_ctrl_psec}} & {plic_sec_lock,plic_amp,30'b0};

assign plic_ctrl_prdata[31:0]         = {32{~plic_ctrl_pslverr_pre}} & ({32{sec_ctrl_reg_sel_en}}  & plic_sec_ctrl_reg_prdata[31:0] |
                                                                        {32{plic_ctrl_reg_sel_en}} & plic_ctrl_reg_prdata[31:0]);

assign ctrl_xx_amp_lock          = plic_sec_lock;
assign ctrl_xx_s_permission_t = plic_s_permission_t;
assign ctrl_xx_s_permission_nt = plic_s_permission;
`else
assign ctrl_xx_amp_mode = 1'b0;
assign plic_t_amp_write_en = 1'b0;
assign plic_amp            = 1'b0;
assign plic_ctrl_prdata[31:0] = {32{~plic_ctrl_pslverr_pre}} & {31'b0,plic_s_permission_t};
assign plic_ctrl_pslverr_pre    = (((bus_mtx_plic_ctrl_paddr[11:0] != 12'hffc)) || 
                                   (bus_mtx_plic_ctrl_pprot[1:0]  != 2'b11));
assign ctrl_xx_amp_lock       = 1'b0;
assign ctrl_xx_s_permission_t = plic_s_permission_t;
assign ctrl_xx_s_permission_nt = 1'b0;
`endif
always @(posedge plic_ctrl_clk or negedge plicrst_b)
begin
  if(!plicrst_b)
    plic_s_permission_t  <=  1'b0;
  else if(plic_s_permision_t_wen)
    plic_s_permission_t  <= plic_s_permission_t_pre;
end
assign plic_ctrl_reg_t_write_en  = plic_ctrl_reg_wr_en && (bus_mtx_plic_ctrl_psec || !plic_amp); 
assign plic_s_permision_t_wen    = plic_ctrl_reg_t_write_en || plic_s_permission_t_clean;
assign plic_s_permission_t_clean = ~plic_amp && bus_mtx_plic_ctrl_pwdata[30] && plic_t_amp_write_en;
assign plic_s_permission_t_pre   = plic_s_permission_t_clean ? 1'b0 : bus_mtx_plic_ctrl_pwdata[0];

always @(posedge plic_ctrl_clk or negedge plicrst_b)
begin
  if(!plicrst_b)
    plic_ctrl_pready <= 1'b0;
  else if(bus_mtx_plic_ctrl_psel)
    plic_ctrl_pready <= plic_ctrl_apb_acc_en;
end 
assign plic_ctrl_pslverr    = plic_ctrl_pslverr_pre;                                           
gated_clk_cell  x_ict_ready_gateclk (
  .clk_in               (plic_clk            ),
  .clk_out              (plic_ctrl_clk       ),
  .external_en          (1'b0                ),
  .global_en            (1'b1                ),
  .local_en             (plic_ctrl_clk_en    ),
  .module_en            (ciu_plic_icg_en     ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)                
);
assign plic_ctrl_clk_en  = bus_mtx_plic_ctrl_psel;
endmodule
