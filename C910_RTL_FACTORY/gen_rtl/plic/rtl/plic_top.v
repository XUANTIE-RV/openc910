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
module plic_top(
  plic_hartx_mint_req,
  plic_hartx_sint_req,
  ciu_plic_paddr,
  ciu_plic_penable,
  ciu_plic_psel,
  ciu_plic_pprot,
  ciu_plic_pwdata,
  ciu_plic_pwrite,
  `ifdef PLIC_SEC
  ciu_plic_psec,
  ciu_plic_core_sec,
  `endif
  ciu_plic_icg_en,
  pad_plic_int_vld,
  pad_plic_int_cfg,
  pad_yy_icg_scan_en,

  plic_ciu_prdata,
  plic_ciu_pready,
  plic_ciu_pslverr,
  plic_clk,
  plicrst_b
);
parameter   INT_NUM      = 1024;
parameter   ID_NUM       = 10;
parameter   HART_NUM     = 4;
parameter   PRIO_BIT     = 5;
parameter   MAX_HART_NUM = 32;
parameter   CORE_ID      = 2;
//parameter   CORE_ONE_HOT = 4;
`ifdef PLIC_SEC
parameter   SLV_NUM      = 6;
`else
parameter   SLV_NUM      = 5;
`endif

input   [26  :0]                ciu_plic_paddr;           
input                           ciu_plic_penable;         
input                           ciu_plic_psel;            
input   [1:0]                   ciu_plic_pprot;            
input   [31  :0]                ciu_plic_pwdata;          
input                           ciu_plic_pwrite;    
`ifdef PLIC_SEC
input  [7:0]                    ciu_plic_psec;
input  [HART_NUM*8-1:0]         ciu_plic_core_sec;
`endif
input   [INT_NUM-1:0]           pad_plic_int_vld;         
input   [INT_NUM-1:0]           pad_plic_int_cfg;         
input                           plic_clk;                 
input                           plicrst_b;                
input                           pad_yy_icg_scan_en;
input                           ciu_plic_icg_en;

output  [HART_NUM-1:0]          plic_hartx_mint_req;      
output  [HART_NUM-1:0]          plic_hartx_sint_req;      
output  [31  :0]                plic_ciu_prdata;          
output                          plic_ciu_pready;          
output                          plic_ciu_pslverr;         

wire                              ciu_plic_icg_en;
wire    [HART_NUM-1:0]            plic_hartx_mint_req;      
wire    [HART_NUM-1:0]            plic_hartx_sint_req;      
wire    [HART_NUM-1   :0]         arbx_hreg_arb_start_ack;  
wire    [HART_NUM*ID_NUM-1  :0]   arbx_hreg_claim_id;       
wire    [HART_NUM-1   :0]         arbx_hreg_claim_mmode;    
wire    [HART_NUM-1   :0]         arbx_hreg_claim_reg_ready; 
wire    [17  :0]                  bus_mtx_ict_paddr;        
wire                              bus_mtx_ict_penable;      
wire                              bus_mtx_ict_psel;         
wire    [1:0]                     bus_mtx_ict_pprot;
wire    [31  :0]                  bus_mtx_ict_pwdata;       
wire                              bus_mtx_ict_pwrite; 
wire    [12  :0]                  bus_mtx_ie_paddr;         
wire                              bus_mtx_ie_penable;       
wire                              bus_mtx_ie_psel;     
wire    [1:0]                     bus_mtx_ie_pprot;
wire    [31  :0]                  bus_mtx_ie_pwdata;        
wire                              bus_mtx_ie_pwrite;        
wire    [11  :0]                  bus_mtx_ip_paddr;         
wire                              bus_mtx_ip_penable;       
wire                              bus_mtx_ip_psel;          
wire    [1:0]                     bus_mtx_ip_pprot;
wire    [31  :0]                  bus_mtx_ip_pwdata;        
wire                              bus_mtx_ip_pwrite;        
wire    [11  :0]                  bus_mtx_prio_paddr;       
wire                              bus_mtx_prio_penable;     
wire                              bus_mtx_prio_psel;        
wire    [1:0]                     bus_mtx_prio_pprot;
wire    [31  :0]                  bus_mtx_prio_pwdata;      
wire                              bus_mtx_prio_pwrite;      
wire    [26  :0]                  ciu_plic_paddr;           
wire                              ciu_plic_penable;         
wire                              ciu_plic_psel;            
wire    [31  :0]                  ciu_plic_pwdata;          
wire                              ciu_plic_pwrite;          
wire    [HART_NUM-1   :0]         hreg_arbx_arb_flush;      
wire    [HART_NUM-1   :0]         hreg_arbx_arb_start;      
wire    [HART_NUM-1   :0]         hreg_arbx_mint_claim;      
wire    [HART_NUM-1   :0]         hreg_arbx_sint_claim;      
wire    [INT_NUM*HART_NUM-1:0]    hreg_arbx_int_en;         
wire    [INT_NUM*HART_NUM-1:0]    hreg_arbx_int_mmode;      
wire    [HART_NUM*PRIO_BIT-1:0]   hreg_arbx_prio_mth;       
wire    [HART_NUM*PRIO_BIT-1:0]   hreg_arbx_prio_sth;       
//wire    [ID_NUM-1   :0]           hreg_kid_claim_id;        
wire    [INT_NUM-1:0]             hreg_kid_claim_vld;       
wire    [INT_NUM-1:0]             hreg_kid_cmplt_vld;       
wire    [31  :0]                  ict_bus_mtx_prdata;       
wire                              ict_bus_mtx_pready;       
wire                              ict_bus_mtx_pslverr;      
wire    [31  :0]                  ie_bus_mtx_prdata;        
wire                              ie_bus_mtx_pready;        
wire                              ie_bus_mtx_pslverr;       
wire    [31  :0]                  ip_bus_mtx_prdata;        
wire                              ip_bus_mtx_pready;        
wire                              ip_bus_mtx_pslverr;       
wire                              kid_hreg_new_int_pulse;   
wire    [INT_NUM*PRIO_BIT-1:0]    kid_yy_int_prio;          
wire    [INT_NUM-1:0]             kid_yy_int_req;           
wire    [SLV_NUM*27-1 :0]         mst_base_addr;            
wire    [SLV_NUM*27-1 :0]         mst_base_addr_msk;        
wire    [SLV_NUM*27-1 :0]         mst_paddr;                
wire    [SLV_NUM-1   :0]          mst_penable;              
wire    [SLV_NUM*32-1 :0]         mst_prdata;               
wire    [SLV_NUM-1   :0]          mst_pready;               
wire    [SLV_NUM-1   :0]          mst_psel;                 
wire    [SLV_NUM*2-1   :0]        mst_pprot;
wire    [SLV_NUM-1   :0]          mst_pslverr;              
wire    [SLV_NUM*32-1 :0]         mst_pwdata;               
wire    [SLV_NUM-1   :0]          mst_pwrite;               
wire    [INT_NUM-1:0]             pad_plic_int_vld;         
wire    [31  :0]                  plic_ciu_prdata;          
wire                              plic_ciu_pready;          
wire                              plic_ciu_pslverr;         
wire                              plic_clk;                 
wire                              plicrst_b;                
wire    [31  :0]                  prio_bus_mtx_prdata;      
wire                              prio_bus_mtx_pready;      
wire                              prio_bus_mtx_pslverr;     
wire                              kid_hreg_ip_prio_reg_we;
wire                              bus_mtx_plic_ctrl_psel;
wire                              bus_mtx_plic_ctrl_penable;
wire      [1:0]                   bus_mtx_plic_ctrl_pprot;
wire     [11:0]                   bus_mtx_plic_ctrl_paddr;
wire     [31:0]                   bus_mtx_plic_ctrl_pwdata;
wire                              bus_mtx_plic_ctrl_pwrite;
wire    [31:0]                    plic_ctrl_prdata;
wire                              plic_ctrl_pslverr;
wire                              plic_ctrl_pready;
wire                              ctrl_xx_s_permission_t;
wire                              ctrl_xx_s_permission_nt;
wire                              ctrl_xx_amp_mode;
  
wire                              bus_mtx_ict_psec;
wire                              bus_mtx_prio_psec;
wire                              bus_mtx_ip_psec;
wire                              bus_mtx_ie_psec;
`ifdef PLIC_SEC
wire    [11  :0]                  bus_mtx_sec_paddr;         
wire                              bus_mtx_sec_penable;       
wire                              bus_mtx_sec_psel;          
wire    [1:0]                     bus_mtx_sec_pprot;
wire    [31  :0]                  bus_mtx_sec_pwdata;        
wire                              bus_mtx_sec_pwrite;
wire                              bus_mtx_sec_psec;
wire    [31  :0]                  sec_bus_mtx_prdata;        
wire                              sec_bus_mtx_pready;        
wire                              sec_bus_mtx_pslverr;  
wire                              plic_core_sec_clk;
wire                              plic_core_sec_clk_en;
wire                              core_sec_chg_en;
reg     [HART_NUM-1:0]            ctrl_xx_core_sec;
wire    [HART_NUM-1:0]            ciu_plic_core_sec_bin;
wire    [HART_NUM:0]              core_sec_clk_chg;
wire    [HART_NUM:0]              core_sec_chg;
`else
wire     [HART_NUM-1:0]            ctrl_xx_core_sec;

`endif
wire    [INT_NUM-1:0]             int_sec_infor;
wire    [SLV_NUM-1:0]             mst_psec;
wire                              ciu_plic_psec_in;
wire                              ctrl_xx_amp_lock;
wire                              bus_mtx_plic_ctrl_psec;
//assign   ciu_plic_icg_en   = 1'b0;
csky_apb_1tox_matrix   #(.ADDR(27),
                         .SLAVE(SLV_NUM))
                         x_csky_apb_1tox_matrix (
  .mst_base_addr     (mst_base_addr    ),
  .mst_base_addr_msk (mst_base_addr_msk),
  .mst_paddr         (mst_paddr        ),
  .mst_penable       (mst_penable      ),
  .mst_prdata        (mst_prdata       ),
  .mst_pready        (mst_pready       ),
  .mst_psel          (mst_psel         ),
  .mst_pprot         (mst_pprot         ),
  .mst_pslverr       (mst_pslverr      ),
  .mst_pwdata        (mst_pwdata       ),
  .mst_pwrite        (mst_pwrite       ),
  .mst_psec          (mst_psec         ),
  .ciu_plic_icg_en   (ciu_plic_icg_en  ),
  .pad_yy_icg_scan_en(pad_yy_icg_scan_en),
  .pclk              (plic_clk         ),
  .prst_b            (plicrst_b        ),
  .slv_paddr         (ciu_plic_paddr   ),
  .slv_penable       (ciu_plic_penable ),
  .slv_prdata        (plic_ciu_prdata  ),
  .slv_pready        (plic_ciu_pready  ),
  .slv_psel          (ciu_plic_psel    ),
  .slv_pprot         (ciu_plic_pprot    ),
  .slv_pslverr       (plic_ciu_pslverr ),
  .slv_pwdata        (ciu_plic_pwdata  ),
  .slv_pwrite        (ciu_plic_pwrite  ),
  .slv_psec          (ciu_plic_psec_in    )
);



`ifdef PLIC_SEC

assign ciu_plic_psec_in = (ciu_plic_psec[7:0] == `TEE_VALID_VALUE) || !ctrl_xx_amp_mode;
assign {bus_mtx_prio_psel,
        bus_mtx_ip_psel,
        bus_mtx_ie_psel,
        bus_mtx_sec_psel,
        bus_mtx_plic_ctrl_psel,
        bus_mtx_ict_psel}           = mst_psel[5:0];

assign  bus_mtx_plic_ctrl_pprot[1:0]= mst_pprot[3:2];
assign  bus_mtx_prio_pprot[1:0] = {mst_pprot[11] || ((mst_psec[5] ? ctrl_xx_s_permission_t : ctrl_xx_s_permission_nt) && mst_pprot[10]),
                                   mst_pprot[10]};
assign  bus_mtx_ip_pprot[1:0]   = {mst_pprot[9] || ((mst_psec[4] ? ctrl_xx_s_permission_t : ctrl_xx_s_permission_nt)&& mst_pprot[8]),
                                   mst_pprot[8]};
assign  bus_mtx_ie_pprot[1:0]   = {mst_pprot[7] || ((mst_psec[3] ? ctrl_xx_s_permission_t : ctrl_xx_s_permission_nt)&& mst_pprot[6]),
                                   mst_pprot[6]};  
assign  bus_mtx_sec_pprot[1:0]  = mst_pprot[5:4];
assign  bus_mtx_ict_pprot[1:0]  = {mst_pprot[1] || ((mst_psec[0] ? ctrl_xx_s_permission_t : ctrl_xx_s_permission_nt)&& mst_pprot[0]),
                                   mst_pprot[0]};  
assign {bus_mtx_prio_penable,
        bus_mtx_ip_penable,
        bus_mtx_ie_penable,
        bus_mtx_sec_penable,
        bus_mtx_plic_ctrl_penable,
        bus_mtx_ict_penable}        = mst_penable[5:0];
assign {bus_mtx_prio_pwrite,
        bus_mtx_ip_pwrite,
        bus_mtx_ie_pwrite,
        bus_mtx_sec_pwrite,
        bus_mtx_plic_ctrl_pwrite,
        bus_mtx_ict_pwrite}         = mst_pwrite[5:0];
assign {bus_mtx_prio_pwdata[31:0],
        bus_mtx_ip_pwdata[31:0],
        bus_mtx_ie_pwdata[31:0],
        bus_mtx_sec_pwdata[31:0],
        bus_mtx_plic_ctrl_pwdata[31:0],
        bus_mtx_ict_pwdata[31:0]}   = mst_pwdata[191:0];
assign  bus_mtx_prio_paddr[11:0]    = mst_paddr[146:135];
assign  bus_mtx_ip_paddr[11:0]      = mst_paddr[119:108];
assign  bus_mtx_ie_paddr[12:0]      = mst_paddr[93:81];
assign  bus_mtx_sec_paddr[11:0]     = mst_paddr[65:54];
assign  bus_mtx_plic_ctrl_paddr[11:0]  = mst_paddr[38:27];
assign  bus_mtx_ict_paddr[17:0]     = mst_paddr[17:0];
assign  mst_prdata[191:0]           = { prio_bus_mtx_prdata[31:0],
                                        ip_bus_mtx_prdata[31:0],
                                        ie_bus_mtx_prdata[31:0],
                                        sec_bus_mtx_prdata[31:0],
                                        plic_ctrl_prdata[31:0],
                                        ict_bus_mtx_prdata[31:0]};
assign  mst_pready[5:0]             = { prio_bus_mtx_pready,
                                        ip_bus_mtx_pready,
                                        ie_bus_mtx_pready,
                                        sec_bus_mtx_pready,
                                        plic_ctrl_pready,
                                        ict_bus_mtx_pready};
assign  mst_pslverr[5:0]            = { prio_bus_mtx_pslverr,
                                        ip_bus_mtx_pslverr,
                                        ie_bus_mtx_pslverr,
                                        sec_bus_mtx_pslverr,
                                        plic_ctrl_pslverr,
                                        ict_bus_mtx_pslverr};
assign mst_base_addr[161:0]         = { 27'b0, // priority
                                        27'h0001000,// ip
                                        27'h0002000,// ie
                                        27'h01fe000,// sec
                                        27'h01ff000,// plic privilege ease(enable smode access)
                                        27'h0200000 // ict
                                        };
assign mst_base_addr_msk[161:0]     = { 27'h7fff000,// priority
                                        27'h7fff000,// ip
                                        27'h7fff000,// ie
                                        27'h7fff000,// sec
                                        27'h7fff000,// plic privilege ease(enable smode access)
                                        27'h7fc0000 //ict
                                        };
assign {bus_mtx_prio_psec,
        bus_mtx_ip_psec,
        bus_mtx_ie_psec,
        bus_mtx_sec_psec,
        bus_mtx_plic_ctrl_psec,
        bus_mtx_ict_psec}           = mst_psec[5:0];
plic_sec_busif #(.INT_NUM(INT_NUM),
                      .ADDR(12)
                      ) x_plic_sec_busif(
  .plic_clk            (plic_clk             ),
  .plicrst_b           (plicrst_b            ),
  .bus_mtx_sec_psel    (bus_mtx_sec_psel     ),
  .bus_mtx_sec_pprot   (bus_mtx_sec_pprot    ),
  .bus_mtx_sec_penable (bus_mtx_sec_penable  ),
  .bus_mtx_sec_paddr   (bus_mtx_sec_paddr    ),
  .bus_mtx_sec_pwrite  (bus_mtx_sec_pwrite   ),
  .bus_mtx_sec_pwdata  (bus_mtx_sec_pwdata   ),
  .bus_mtx_sec_psec    (bus_mtx_sec_psec     ),
  .ciu_plic_icg_en     (ciu_plic_icg_en      ),
  .pad_yy_icg_scan_en  (pad_yy_icg_scan_en   ),
  .ctrl_xx_amp_mode    (ctrl_xx_amp_mode     ),
  .ctrl_xx_amp_lock    (ctrl_xx_amp_lock     ),
  //output
  .sec_bus_mtx_pready  (sec_bus_mtx_pready   ),
  .sec_bus_mtx_prdata  (sec_bus_mtx_prdata   ),
  .sec_bus_mtx_pslverr (sec_bus_mtx_pslverr  ),
  .int_sec_infor       (int_sec_infor        )         
);
generate 
genvar j;
for(j=0;j<HART_NUM;j=j+1)
begin: HART_SEC
assign ciu_plic_core_sec_bin[j] = ciu_plic_core_sec[j*8+:8] == `TEE_VALID_VALUE;
end
endgenerate

always @(posedge plic_core_sec_clk or negedge plicrst_b)
begin
    if(!plicrst_b)
        ctrl_xx_core_sec[HART_NUM-1:0] <= {HART_NUM{1'b0}};
    else if(core_sec_chg_en)
        ctrl_xx_core_sec[HART_NUM-1:0] <= ciu_plic_core_sec_bin[HART_NUM-1:0];
end
assign core_sec_chg[HART_NUM:0]  = {1'b0,ciu_plic_core_sec_bin[HART_NUM-1:0] ^ ctrl_xx_core_sec[HART_NUM-1:0]};
assign core_sec_chg_en  = |core_sec_chg[HART_NUM:0];  
gated_clk_cell  x_core_sec_gateclk (
  .clk_in               (plic_clk            ),
  .clk_out              (plic_core_sec_clk   ),
  .external_en          (1'b0                ),
  .global_en            (1'b1                ),
  .local_en             (plic_core_sec_clk_en),
  .module_en            (ciu_plic_icg_en     ),
  .pad_yy_icg_scan_en   (pad_yy_icg_scan_en  )
);
assign core_sec_clk_chg[HART_NUM:0]      = {1'b0,ctrl_xx_core_sec[HART_NUM-1:0] ^ ciu_plic_core_sec_bin[HART_NUM-1:0]};
assign plic_core_sec_clk_en              = |core_sec_clk_chg[HART_NUM:0];
`else
assign ciu_plic_psec_in   = 1'b1;
assign ctrl_xx_core_sec[HART_NUM-1:0] = {HART_NUM{1'b1}};
assign {bus_mtx_prio_psel,
        bus_mtx_ip_psel,
        bus_mtx_ie_psel,
        bus_mtx_plic_ctrl_psel,
        bus_mtx_ict_psel}           = mst_psel[4:0];

assign  bus_mtx_plic_ctrl_pprot[1:0]= mst_pprot[3:2];
assign  bus_mtx_prio_pprot[1:0] = {mst_pprot[9] || ((mst_psec[4] ? ctrl_xx_s_permission_t : ctrl_xx_s_permission_nt) && mst_pprot[8]),
                                   mst_pprot[8]};
assign  bus_mtx_ip_pprot[1:0]   = {mst_pprot[7] || ((mst_psec[3] ? ctrl_xx_s_permission_t : ctrl_xx_s_permission_nt) && mst_pprot[6]),
                                   mst_pprot[6]};
assign  bus_mtx_ie_pprot[1:0]   = {mst_pprot[5] || ((mst_psec[2] ? ctrl_xx_s_permission_t : ctrl_xx_s_permission_nt) && mst_pprot[4]),
                                   mst_pprot[4]};                                
assign  bus_mtx_ict_pprot[1:0]  = {mst_pprot[1] || ((mst_psec[1] ? ctrl_xx_s_permission_t : ctrl_xx_s_permission_nt) && mst_pprot[0]),
                                   mst_pprot[0]};                                
assign {bus_mtx_prio_penable,
        bus_mtx_ip_penable,
        bus_mtx_ie_penable,
        bus_mtx_plic_ctrl_penable,
        bus_mtx_ict_penable}        = mst_penable[4:0];
assign {bus_mtx_prio_pwrite,
        bus_mtx_ip_pwrite,
        bus_mtx_ie_pwrite,
        bus_mtx_plic_ctrl_pwrite,
        bus_mtx_ict_pwrite}         = mst_pwrite[4:0];
assign {bus_mtx_prio_pwdata[31:0],
        bus_mtx_ip_pwdata[31:0],
        bus_mtx_ie_pwdata[31:0],
        bus_mtx_plic_ctrl_pwdata[31:0],
        bus_mtx_ict_pwdata[31:0]}   = mst_pwdata[159:0];
assign  bus_mtx_prio_paddr[11:0]    = mst_paddr[119:108];
assign  bus_mtx_ip_paddr[11:0]      = mst_paddr[92:81];
assign  bus_mtx_ie_paddr[12:0]      = mst_paddr[66:54];
assign  bus_mtx_plic_ctrl_paddr[11:0]  = mst_paddr[38:27];
assign  bus_mtx_ict_paddr[17:0]     = mst_paddr[17:0];
assign  mst_prdata[159:0]           = { prio_bus_mtx_prdata[31:0],
                                        ip_bus_mtx_prdata[31:0],
                                        ie_bus_mtx_prdata[31:0],
                                        plic_ctrl_prdata[31:0],
                                        ict_bus_mtx_prdata[31:0]};
assign  mst_pready[4:0]             = { prio_bus_mtx_pready,
                                        ip_bus_mtx_pready,
                                        ie_bus_mtx_pready,
                                        plic_ctrl_pready,
                                        ict_bus_mtx_pready};
assign  mst_pslverr[4:0]            = { prio_bus_mtx_pslverr,
                                        ip_bus_mtx_pslverr,
                                        ie_bus_mtx_pslverr,
                                        plic_ctrl_pslverr,
                                        ict_bus_mtx_pslverr};
assign mst_base_addr[134:0]         = { 27'b0, // priority
                                        27'h0001000,// ip
                                        27'h0002000,// ie
                                        27'h01ff000,// plic privilege ease(enable smode access)
                                        27'h0200000 // ict
                                        };
assign mst_base_addr_msk[134:0]     = { 27'h7fff000, // priority
                                        27'h7fff000,// ip
                                        27'h7fff000,// ie
                                        27'h7fff000,// plic privilege ease(enable smode access)
                                        27'h7fc0000 //ict
                                        };
assign {bus_mtx_prio_psec,
        bus_mtx_ip_psec,
        bus_mtx_ie_psec,
        bus_mtx_plic_ctrl_psec,
        bus_mtx_ict_psec}           = mst_psec[4:0];
assign int_sec_infor[INT_NUM-1:0]   = {INT_NUM{1'b1}};
`endif
plic_ctrl    x_plic_ctrl (
  .bus_mtx_plic_ctrl_psel(bus_mtx_plic_ctrl_psel),
  .bus_mtx_plic_ctrl_paddr(bus_mtx_plic_ctrl_paddr),
  .bus_mtx_plic_ctrl_penable(bus_mtx_plic_ctrl_penable),
  .bus_mtx_plic_ctrl_pprot(bus_mtx_plic_ctrl_pprot),
  .bus_mtx_plic_ctrl_pwdata(bus_mtx_plic_ctrl_pwdata),
  .bus_mtx_plic_ctrl_pwrite(bus_mtx_plic_ctrl_pwrite),
  .bus_mtx_plic_ctrl_psec(bus_mtx_plic_ctrl_psec),
  .ciu_plic_icg_en   (ciu_plic_icg_en  ),
  .pad_yy_icg_scan_en(pad_yy_icg_scan_en),
  .plic_ctrl_prdata(plic_ctrl_prdata),
  .plic_ctrl_pslverr(plic_ctrl_pslverr),
  .plic_ctrl_pready(plic_ctrl_pready),
  .plic_clk(plic_clk),
  .plicrst_b(plicrst_b),
  .ctrl_xx_s_permission_t(ctrl_xx_s_permission_t),
  .ctrl_xx_s_permission_nt(ctrl_xx_s_permission_nt),
  .ctrl_xx_amp_mode(ctrl_xx_amp_mode),
  .ctrl_xx_amp_lock(ctrl_xx_amp_lock)
);
plic_hreg_busif  #(.INT_NUM(INT_NUM),
                      .ID_NUM(ID_NUM),
                      .HART_NUM(HART_NUM),
                      .PRIO_BIT(PRIO_BIT),
                      .IE_ADDR(13),
                      .ICT_ADDR(18),
                      .MAX_HART_NUM(MAX_HART_NUM)
                      )x_plic_hreg_busif (
  .arbx_hreg_arb_start_ack   (arbx_hreg_arb_start_ack  ),
  .arbx_hreg_claim_id        (arbx_hreg_claim_id       ),
  .arbx_hreg_claim_mmode     (arbx_hreg_claim_mmode    ),
  .arbx_hreg_claim_reg_ready (arbx_hreg_claim_reg_ready),
  .bus_mtx_ict_paddr         (bus_mtx_ict_paddr[17:0]  ),
  .bus_mtx_ict_penable       (bus_mtx_ict_penable      ),
  .bus_mtx_ict_psel          (bus_mtx_ict_psel         ),
  .bus_mtx_ict_pprot         (bus_mtx_ict_pprot        ),
  .bus_mtx_ict_pwdata        (bus_mtx_ict_pwdata       ),
  .bus_mtx_ict_pwrite        (bus_mtx_ict_pwrite       ),
  .bus_mtx_ict_psec          (bus_mtx_ict_psec         ),
  .bus_mtx_ie_paddr          (bus_mtx_ie_paddr[12:0]   ),
  .bus_mtx_ie_penable        (bus_mtx_ie_penable       ),
  .bus_mtx_ie_psel           (bus_mtx_ie_psel          ),
  .bus_mtx_ie_pprot          (bus_mtx_ie_pprot         ),
  .bus_mtx_ie_pwdata         (bus_mtx_ie_pwdata        ),
  .bus_mtx_ie_pwrite         (bus_mtx_ie_pwrite        ),
  .bus_mtx_ie_psec           (bus_mtx_ie_psec          ),
  .kid_hreg_ip_prio_reg_we   (kid_hreg_ip_prio_reg_we  ),
  .ciu_plic_icg_en           (ciu_plic_icg_en          ),
  .pad_yy_icg_scan_en        (pad_yy_icg_scan_en       ),
  .hreg_arbx_arb_flush       (hreg_arbx_arb_flush      ),
  .hreg_arbx_arb_start       (hreg_arbx_arb_start      ),
  .hreg_arbx_mint_claim      (hreg_arbx_mint_claim      ),
  .hreg_arbx_sint_claim      (hreg_arbx_sint_claim      ),
  .hreg_arbx_int_en          (hreg_arbx_int_en         ),
  .hreg_arbx_int_mmode       (hreg_arbx_int_mmode      ),
  .hreg_arbx_prio_mth        (hreg_arbx_prio_mth       ),
  .hreg_arbx_prio_sth        (hreg_arbx_prio_sth       ),
//  .hreg_kid_claim_id         (hreg_kid_claim_id        ),
  .hreg_kid_claim_vld        (hreg_kid_claim_vld       ),
  .hreg_kid_cmplt_vld        (hreg_kid_cmplt_vld       ),
  .ctrl_xx_amp_mode          (ctrl_xx_amp_mode         ),
  .ctrl_xx_core_sec          (ctrl_xx_core_sec         ),
  .int_sec_infor             (int_sec_infor            ),
  .ict_bus_mtx_prdata        (ict_bus_mtx_prdata       ),
  .ict_bus_mtx_pready        (ict_bus_mtx_pready       ),
  .ict_bus_mtx_pslverr       (ict_bus_mtx_pslverr      ),

  .ie_bus_mtx_prdata         (ie_bus_mtx_prdata        ),
  .ie_bus_mtx_pready         (ie_bus_mtx_pready        ),
  .ie_bus_mtx_pslverr        (ie_bus_mtx_pslverr       ),
  .kid_hreg_new_int_pulse    (kid_hreg_new_int_pulse   ),
  .plic_clk                  (plic_clk                 ),
  .plicrst_b                 (plicrst_b                )
);

plic_kid_busif  #(.INT_NUM(INT_NUM),
                      .ID_NUM(ID_NUM),
                      .PRIO_BIT(PRIO_BIT),
                      .ADDR(12)
                      )x_plic_kid_busif (
  .bus_mtx_ip_paddr       (bus_mtx_ip_paddr[11:0]      ),
  .bus_mtx_ip_penable     (bus_mtx_ip_penable    ),
  .bus_mtx_ip_psel        (bus_mtx_ip_psel       ),
  .bus_mtx_ip_pprot       (bus_mtx_ip_pprot      ),
  .bus_mtx_ip_pwdata      (bus_mtx_ip_pwdata     ),
  .bus_mtx_ip_pwrite      (bus_mtx_ip_pwrite     ),
  .bus_mtx_ip_psec        (bus_mtx_ip_psec       ),
  .bus_mtx_prio_paddr     (bus_mtx_prio_paddr[11:0]    ),
  .bus_mtx_prio_penable   (bus_mtx_prio_penable  ),
  .bus_mtx_prio_psel      (bus_mtx_prio_psel     ),
  .bus_mtx_prio_pprot     (bus_mtx_prio_pprot    ),
  .bus_mtx_prio_pwdata    (bus_mtx_prio_pwdata   ),
  .bus_mtx_prio_pwrite    (bus_mtx_prio_pwrite   ),
  .bus_mtx_prio_psec      (bus_mtx_prio_psec     ),
  .ciu_plic_icg_en        (ciu_plic_icg_en       ),
  .pad_yy_icg_scan_en     (pad_yy_icg_scan_en    ),
//  .hreg_kid_claim_id      (hreg_kid_claim_id     ),
  .hreg_kid_claim_vld     (hreg_kid_claim_vld    ),
  .hreg_kid_cmplt_vld     (hreg_kid_cmplt_vld    ),
  .ip_bus_mtx_prdata      (ip_bus_mtx_prdata     ),
  .ip_bus_mtx_pready      (ip_bus_mtx_pready     ),
  .ip_bus_mtx_pslverr     (ip_bus_mtx_pslverr    ),
  .kid_hreg_new_int_pulse (kid_hreg_new_int_pulse),
  .kid_hreg_ip_prio_reg_we   (kid_hreg_ip_prio_reg_we  ),
  .kid_yy_int_prio        (kid_yy_int_prio       ),
  .kid_yy_int_req         (kid_yy_int_req        ),
  .int_sec_infor          (int_sec_infor         ),
  .ctrl_xx_amp_mode       (ctrl_xx_amp_mode      ),
  .pad_plic_int_vld       (pad_plic_int_vld      ),
  .pad_plic_int_cfg       (pad_plic_int_cfg      ),
  .plic_clk               (plic_clk              ),
  .plicrst_b              (plicrst_b             ),
  .prio_bus_mtx_prdata    (prio_bus_mtx_prdata   ),
  .prio_bus_mtx_pready    (prio_bus_mtx_pready   ),
  .prio_bus_mtx_pslverr   (prio_bus_mtx_pslverr  )
);

generate 
genvar i;
for(i=0;i<HART_NUM;i=i+1)
begin: HART_ARB
plic_hart_arb  #(.INT_NUM(INT_NUM),
                    .ID_NUM(ID_NUM),
                    .PRIO_BIT(PRIO_BIT),
                    .ECH_RD(32)
                      )x_plic_hart_arb (
  .arbx_hartx_mint_req       (plic_hartx_mint_req[i]      ),
  .arbx_hartx_sint_req       (plic_hartx_sint_req[i]      ),
  .arbx_hreg_arb_start_ack   (arbx_hreg_arb_start_ack[i]  ),
  .arbx_hreg_claim_id        (arbx_hreg_claim_id[i*ID_NUM+:ID_NUM] ),
  .arbx_hreg_claim_mmode     (arbx_hreg_claim_mmode[i]    ),
  .arbx_hreg_claim_reg_ready (arbx_hreg_claim_reg_ready[i]),
  .hreg_arbx_arb_flush       (hreg_arbx_arb_flush[i]      ),
  .hreg_arbx_arb_start       (hreg_arbx_arb_start[i]      ),
  .hreg_arbx_mint_claim      (hreg_arbx_mint_claim[i]      ),
  .hreg_arbx_sint_claim      (hreg_arbx_sint_claim[i]      ),
  .hreg_arbx_int_en          (hreg_arbx_int_en[i*INT_NUM+:INT_NUM]),
  .hreg_arbx_int_mmode       (hreg_arbx_int_mmode[i*INT_NUM+:INT_NUM]),
  .hreg_arbx_prio_mth        (hreg_arbx_prio_mth[i*PRIO_BIT+:PRIO_BIT]),
  .hreg_arbx_prio_sth        (hreg_arbx_prio_sth[i*PRIO_BIT+:PRIO_BIT]),
  .ciu_plic_icg_en           (ciu_plic_icg_en            ),
  .pad_yy_icg_scan_en        (pad_yy_icg_scan_en         ),
  .ctrl_xx_amp_mode          (ctrl_xx_amp_mode           ),
  .ctrl_xx_core_sec          (ctrl_xx_core_sec[i]        ),
  .kid_yy_int_prio           (kid_yy_int_prio          ),
  .kid_yy_int_req            (kid_yy_int_req           ),
  .int_sec_infor             (int_sec_infor            ), 
  .plic_clk                  (plic_clk                 ),
  .plicrst_b                 (plicrst_b                )
);
end
endgenerate



`ifdef FOR_VERIFICATION
`ifdef COVERAGE


bind plic_top plic_cov x_plic_cov(
    .apb_addr          (`PLIC_TOP.ciu_plic_paddr[26:0]),
    .apb_prot          (`PLIC_TOP.ciu_plic_pprot[1:0]),
    .apb_sel           (`PLIC_TOP.ciu_plic_psel),
    .apb_write         (`PLIC_TOP.ciu_plic_pwrite),
    .c0_mclaim_updt    (`PLIC_TOP.x_plic_hreg_busif.arbx_hreg_claim_reg_ready[0]),
    .c0_mclaim_id      (`PLIC_TOP.x_plic_hreg_busif.hart_mclaim_flop[0]),
    .c0_sclaim_id      (`PLIC_TOP.x_plic_hreg_busif.hart_sclaim_flop[0]),
    .c0_mthres         (`PLIC_TOP.HART_ARB[0].x_plic_hart_arb.x_plic_arb_ctrl.hreg_arbx_prio_mth[4:0]),
    .c0_req_prio       (`PLIC_TOP.HART_ARB[0].x_plic_hart_arb.x_plic_arb_ctrl.arb_ctrl_int_prio[4:0]),
    .c0_sclaim_updt    (`PLIC_TOP.x_plic_hreg_busif.arbx_hreg_claim_reg_ready[0]),
    .c0_sthres         (`PLIC_TOP.HART_ARB[0].x_plic_hart_arb.x_plic_arb_ctrl.hreg_arbx_prio_sth[4:0]),
`ifdef PROCESSOR_1
    .c1_mclaim_updt    (`PLIC_TOP.x_plic_hreg_busif.arbx_hreg_claim_reg_ready[1]),
    .c1_mclaim_id      (`PLIC_TOP.x_plic_hreg_busif.hart_mclaim_flop[1]),
    .c1_sclaim_id      (`PLIC_TOP.x_plic_hreg_busif.hart_sclaim_flop[1]),
    .c1_mthres         (`PLIC_TOP.HART_ARB[1].x_plic_hart_arb.x_plic_arb_ctrl.hreg_arbx_prio_mth[4:0]),
    .c1_req_prio       (`PLIC_TOP.HART_ARB[1].x_plic_hart_arb.x_plic_arb_ctrl.arb_ctrl_int_prio[4:0]),
    .c1_sclaim_updt    (`PLIC_TOP.x_plic_hreg_busif.arbx_hreg_claim_reg_ready[1]),
    .c1_sthres         (`PLIC_TOP.HART_ARB[1].x_plic_hart_arb.x_plic_arb_ctrl.hreg_arbx_prio_sth[4:0]),
`endif
`ifdef PROCESSOR_2
    .c2_mclaim_updt    (`PLIC_TOP.x_plic_hreg_busif.arbx_hreg_claim_reg_ready[2]),
    .c2_mclaim_id      (`PLIC_TOP.x_plic_hreg_busif.hart_mclaim_flop[2]),
    .c2_sclaim_id      (`PLIC_TOP.x_plic_hreg_busif.hart_sclaim_flop[2]),
    .c2_mthres         (`PLIC_TOP.HART_ARB[2].x_plic_hart_arb.x_plic_arb_ctrl.hreg_arbx_prio_mth[4:0]),
    .c2_req_prio       (`PLIC_TOP.HART_ARB[2].x_plic_hart_arb.x_plic_arb_ctrl.arb_ctrl_int_prio[4:0]),
    .c2_sclaim_updt    (`PLIC_TOP.x_plic_hreg_busif.arbx_hreg_claim_reg_ready[2]),
    .c2_sthres         (`PLIC_TOP.HART_ARB[2].x_plic_hart_arb.x_plic_arb_ctrl.hreg_arbx_prio_sth[4:0]),
`endif
`ifdef PROCESSOR_3
    .c3_mclaim_updt    (`PLIC_TOP.x_plic_hreg_busif.arbx_hreg_claim_reg_ready[3]),
    .c3_mclaim_id      (`PLIC_TOP.x_plic_hreg_busif.hart_mclaim_flop[3]),
    .c3_sclaim_id      (`PLIC_TOP.x_plic_hreg_busif.hart_sclaim_flop[3]),
    .c3_mthres         (`PLIC_TOP.HART_ARB[3].x_plic_hart_arb.x_plic_arb_ctrl.hreg_arbx_prio_mth[4:0]),
    .c3_req_prio       (`PLIC_TOP.HART_ARB[3].x_plic_hart_arb.x_plic_arb_ctrl.arb_ctrl_int_prio[4:0]),
    .c3_sclaim_updt    (`PLIC_TOP.x_plic_hreg_busif.arbx_hreg_claim_reg_ready[3]),
    .c3_sthres         (`PLIC_TOP.HART_ARB[3].x_plic_hart_arb.x_plic_arb_ctrl.hreg_arbx_prio_sth[4:0]),
`endif
    .clk               (`PLIC_TOP.plic_clk),
    .int_active        (`PLIC_TOP.x_plic_kid_busif.kid_int_active[INT_NUM-1:0]),
    .int_cfg           (`PLIC_TOP.pad_plic_int_vld[INT_NUM-1:0]),
    .int_vld           (`PLIC_TOP.pad_plic_int_cfg[INT_NUM-1:0]),
    .int_ip            (`PLIC_TOP.x_plic_kid_busif.kid_yy_int_req[INT_NUM-1:0]),
    .mint_req          (`PLIC_TOP.plic_hartx_mint_req[HART_NUM-1:0]),
    .reset             (`PLIC_TOP.plicrst_b),
    .s_per             (`PLIC_TOP.x_plic_ctrl.ctrl_xx_s_permission_t),
    .sint_req          (`PLIC_TOP.plic_hartx_sint_req[HART_NUM-1:0]),

.ciu_plic_paddr          (`PLIC_TOP.ciu_plic_paddr[26:0]),           
.ciu_plic_penable        (`PLIC_TOP.ciu_plic_penable),   
.ciu_plic_psel           (`PLIC_TOP.ciu_plic_psel), 
.ciu_plic_pprot          (`PLIC_TOP.ciu_plic_pprot[1:0]), 
.ciu_plic_pwrite         (`PLIC_TOP.ciu_plic_pwrite),
`ifdef PLIC_SEC
.ciu_plic_psec           (`PLIC_TOP.ciu_plic_psec[7:0]),
`else
.ciu_plic_psec           (8'h0),
`endif
.ctrl_xx_core_sec        (`PLIC_TOP.ctrl_xx_core_sec[HART_NUM-1:0]),
.ctrl_xx_s_permission_t  (`PLIC_TOP.ctrl_xx_s_permission_t),
.ctrl_xx_s_permission_nt (`PLIC_TOP.ctrl_xx_s_permission_nt),
                         
.prio_bus_mtx_pslverr    (`PLIC_TOP.prio_bus_mtx_pslverr),
.ip_bus_mtx_pslverr      (`PLIC_TOP.ip_bus_mtx_pslverr),
.ie_bus_mtx_pslverr      (`PLIC_TOP.ie_bus_mtx_pslverr),
`ifdef PLIC_SEC
.sec_bus_mtx_pslverr     (`PLIC_TOP.sec_bus_mtx_pslverr),
`else
.sec_bus_mtx_pslverr     (1'b0),
`endif
.plic_ctrl_pslverr       (`PLIC_TOP.plic_ctrl_pslverr),
.ict_bus_mtx_pslverr     (`PLIC_TOP.ict_bus_mtx_pslverr),

.ctrl_xx_amp_mode         (`PLIC_TOP.ctrl_xx_amp_mode),
.ctrl_xx_amp_lock         (`PLIC_TOP.ctrl_xx_amp_lock),   
.bus_mtx_plic_ctrl_pwdata (`PLIC_TOP.x_plic_ctrl.bus_mtx_plic_ctrl_pwdata[30]),
`ifdef PLIC_SEC
.data_flop_32      (`PLIC_TOP.x_plic_sec_busif.INT_SEC[0].x_int_sec_ff.data_flop[31:0]),
.data_in_32        (`PLIC_TOP.x_plic_sec_busif.INT_SEC[0].x_int_sec_ff.data_in[31:0]),
.data_flop_64      (`PLIC_TOP.x_plic_sec_busif.INT_SEC[1].x_int_sec_ff.data_flop[31:0]),
.data_in_64        (`PLIC_TOP.x_plic_sec_busif.INT_SEC[1].x_int_sec_ff.data_in[31:0]),
.data_flop_96      (`PLIC_TOP.x_plic_sec_busif.INT_SEC[2].x_int_sec_ff.data_flop[31:0]),
.data_in_96        (`PLIC_TOP.x_plic_sec_busif.INT_SEC[2].x_int_sec_ff.data_in[31:0]),
.data_flop_128     (`PLIC_TOP.x_plic_sec_busif.INT_SEC[3].x_int_sec_ff.data_flop[31:0]),
.data_in_128       (`PLIC_TOP.x_plic_sec_busif.INT_SEC[3].x_int_sec_ff.data_in[31:0]),
.data_flop_160     (`PLIC_TOP.x_plic_sec_busif.INT_SEC[4].x_int_sec_ff.data_flop[31:0]),
.data_in_160       (`PLIC_TOP.x_plic_sec_busif.INT_SEC[4].x_int_sec_ff.data_in[31:0]),
`else
.data_flop_32      (32'h0),
.data_in_32        (32'h0),
.data_flop_64      (32'h0),
.data_in_64        (32'h0),
.data_flop_96      (32'h0),
.data_in_96        (32'h0),
.data_flop_128     (32'h0),
.data_in_128       (32'h0),
.data_flop_160     (32'h0),
.data_in_160       (32'h0),
`endif
.int_sec_infor     (`PLIC_TOP.int_sec_infor[INT_NUM-1:0]),
.kid_busif_pending (`PLIC_TOP.x_plic_kid_busif.kid_busif_pending[INT_NUM-1:0]),
.kid_int_active    (`PLIC_TOP.x_plic_kid_busif.kid_int_active[INT_NUM-1:0]),
.plic_ciu_pready   (`PLIC_TOP.plic_ciu_pready),
.plic_ciu_pslverr  (`PLIC_TOP.plic_ciu_pslverr),

.C0_arbx_hreg_claim_id       (`PLIC_TOP.HART_ARB[0].x_plic_hart_arb.arbx_hreg_claim_id[ID_NUM-1:0]),          
.C0_hart_mie_1d_bus          (`PLIC_TOP.x_plic_hreg_busif.hart_mie_1d_bus[INT_NUM-1:1]),
.C0_hart_sie_1d_bus          (`PLIC_TOP.x_plic_hreg_busif.hart_sie_1d_bus[INT_NUM-1:1]),
.C0_hreg_arbx_mint_claim     (`PLIC_TOP.HART_ARB[0].x_plic_hart_arb.hreg_arbx_mint_claim),
.C0_hreg_arbx_sint_claim     (`PLIC_TOP.HART_ARB[0].x_plic_hart_arb.hreg_arbx_sint_claim),
.C0_arbx_hartx_mint_req      (`PLIC_TOP.HART_ARB[0].x_plic_hart_arb.arbx_hartx_mint_req),
.C0_arbx_hartx_sint_req      (`PLIC_TOP.HART_ARB[0].x_plic_hart_arb.arbx_hartx_sint_req),
.C0_busif_hart_mclaim_wr_en  (`PLIC_TOP.x_plic_hreg_busif.busif_hart_mclaim_wr_en[0]),
.C0_busif_hart_sclaim_wr_en  (`PLIC_TOP.x_plic_hreg_busif.busif_hart_sclaim_wr_en[0]),
.hreg_kid_cmplt_id           (`PLIC_TOP.x_plic_hreg_busif.hreg_kid_cmplt_id[ID_NUM-1:0])
`ifdef PROCESSOR_1
,                             
.C1_arbx_hreg_claim_id       (`PLIC_TOP.HART_ARB[1].x_plic_hart_arb.arbx_hreg_claim_id[ID_NUM-1:0]),
.C1_hart_mie_1d_bus          (`PLIC_TOP.x_plic_hreg_busif.hart_mie_1d_bus[2*INT_NUM-1:INT_NUM]),
.C1_hart_sie_1d_bus          (`PLIC_TOP.x_plic_hreg_busif.hart_sie_1d_bus[2*INT_NUM-1:INT_NUM]),
.C1_hreg_arbx_mint_claim     (`PLIC_TOP.HART_ARB[1].x_plic_hart_arb.hreg_arbx_mint_claim),
.C1_hreg_arbx_sint_claim     (`PLIC_TOP.HART_ARB[1].x_plic_hart_arb.hreg_arbx_sint_claim),
.C1_arbx_hartx_mint_req      (`PLIC_TOP.HART_ARB[1].x_plic_hart_arb.arbx_hartx_mint_req),
.C1_arbx_hartx_sint_req      (`PLIC_TOP.HART_ARB[1].x_plic_hart_arb.arbx_hartx_sint_req),
.C1_busif_hart_mclaim_wr_en  (`PLIC_TOP.x_plic_hreg_busif.busif_hart_mclaim_wr_en[1]),
.C1_busif_hart_sclaim_wr_en  (`PLIC_TOP.x_plic_hreg_busif.busif_hart_sclaim_wr_en[1])
`endif

`ifdef PROCESSOR_2
,
.C2_arbx_hreg_claim_id       (`PLIC_TOP.HART_ARB[2].x_plic_hart_arb.arbx_hreg_claim_id[9:0]),
.C2_hart_mie_1d_bus          (`PLIC_TOP.x_plic_hreg_busif.hart_mie_1d_bus[3*INT_NUM-1:2*INT_NUM]),
.C2_hart_sie_1d_bus          (`PLIC_TOP.x_plic_hreg_busif.hart_sie_1d_bus[3*INT_NUM-1:2*INT_NUM]),
.C2_hreg_arbx_mint_claim     (`PLIC_TOP.HART_ARB[2].x_plic_hart_arb.hreg_arbx_mint_claim),
.C2_hreg_arbx_sint_claim     (`PLIC_TOP.HART_ARB[2].x_plic_hart_arb.hreg_arbx_sint_claim),
.C2_arbx_hartx_mint_req      (`PLIC_TOP.HART_ARB[2].x_plic_hart_arb.arbx_hartx_mint_req),
.C2_arbx_hartx_sint_req      (`PLIC_TOP.HART_ARB[2].x_plic_hart_arb.arbx_hartx_sint_req),
.C2_busif_hart_mclaim_wr_en  (`PLIC_TOP.x_plic_hreg_busif.busif_hart_mclaim_wr_en[2]),
.C2_busif_hart_sclaim_wr_en  (`PLIC_TOP.x_plic_hreg_busif.busif_hart_sclaim_wr_en[2])
`endif

`ifdef PROCESSOR_3
  ,
.C3_arbx_hreg_claim_id       (`PLIC_TOP.HART_ARB[3].x_plic_hart_arb.arbx_hreg_claim_id[ID_NUM-1:0]),
.C3_hart_mie_1d_bus          (`PLIC_TOP.x_plic_hreg_busif.hart_mie_1d_bus[4*INT_NUM-1:3*INT_NUM]),
.C3_hart_sie_1d_bus          (`PLIC_TOP.x_plic_hreg_busif.hart_sie_1d_bus[4*INT_NUM-1:3*INT_NUM]),
.C3_hreg_arbx_mint_claim     (`PLIC_TOP.HART_ARB[3].x_plic_hart_arb.hreg_arbx_mint_claim),
.C3_hreg_arbx_sint_claim     (`PLIC_TOP.HART_ARB[3].x_plic_hart_arb.hreg_arbx_sint_claim),
.C3_arbx_hartx_mint_req      (`PLIC_TOP.HART_ARB[3].x_plic_hart_arb.arbx_hartx_mint_req),
.C3_arbx_hartx_sint_req      (`PLIC_TOP.HART_ARB[3].x_plic_hart_arb.arbx_hartx_sint_req),
.C3_busif_hart_mclaim_wr_en  (`PLIC_TOP.x_plic_hreg_busif.busif_hart_mclaim_wr_en[3]),
.C3_busif_hart_sclaim_wr_en  (`PLIC_TOP.x_plic_hreg_busif.busif_hart_sclaim_wr_en[3])
`endif
);

`endif
`endif

endmodule
