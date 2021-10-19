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
module ct_clint_func(
  apb_clk_en,
  ciu_clint_icg_en,
  clint_core0_ms_int,
  clint_core0_mt_int,
  clint_core0_ss_int,
  clint_core0_st_int,
  clint_core1_ms_int,
  clint_core1_mt_int,
  clint_core1_ss_int,
  clint_core1_st_int,
  cpurst_b,
  forever_apbclk,
  forever_cpuclk,
  pad_yy_icg_scan_en,
  paddr,
  penable,
  perr_clint,
  pprot,
  prdata_clint,
  pready_clint,
  psel_clint,
  pwdata,
  pwrite,
  sysio_clint_mtime
);

// &Ports; @25
input           apb_clk_en;        
input           ciu_clint_icg_en;  
input           cpurst_b;          
input           forever_apbclk;    
input           forever_cpuclk;    
input           pad_yy_icg_scan_en; 
input   [31:0]  paddr;             
input           penable;           
input   [1 :0]  pprot;             
input           psel_clint;        
input   [31:0]  pwdata;            
input           pwrite;            
input   [63:0]  sysio_clint_mtime; 
output          clint_core0_ms_int; 
output          clint_core0_mt_int; 
output          clint_core0_ss_int; 
output          clint_core0_st_int; 
output          clint_core1_ms_int; 
output          clint_core1_mt_int; 
output          clint_core1_ss_int; 
output          clint_core1_st_int; 
output          perr_clint;        
output  [31:0]  prdata_clint;      
output          pready_clint;      

// &Regs; @26
reg             acc_err;           
reg     [63:0]  clint_mtime_reg;   
reg     [31:0]  data_out;          
reg             msip0_reg;         
reg             msip1_reg;         
reg     [31:0]  mtimecmp0_reg;     
reg     [31:0]  mtimecmp1_reg;     
reg     [31:0]  mtimecmph0_reg;    
reg     [31:0]  mtimecmph1_reg;    
reg             perr_clint;        
reg             pready_clint;      
reg             ssip0_reg;         
reg             ssip1_reg;         
reg     [31:0]  stimecmp0_reg;     
reg     [31:0]  stimecmp1_reg;     
reg     [31:0]  stimecmph0_reg;    
reg     [31:0]  stimecmph1_reg;    

// &Wires; @27
wire            apb_clk_en;        
wire            ciu_clint_icg_en;  
wire            clint_clk;         
wire            clint_clk_en;      
wire            clint_core0_ms_int; 
wire            clint_core0_mt_int; 
wire            clint_core0_ss_int; 
wire            clint_core0_st_int; 
wire            clint_core1_ms_int; 
wire            clint_core1_mt_int; 
wire            clint_core1_ss_int; 
wire            clint_core1_st_int; 
wire            clint_wen;         
wire            cpurst_b;          
wire            forever_apbclk;    
wire            forever_cpuclk;    
wire            mach_mode;         
wire            mreg_wen;          
wire    [31:0]  msip0_value;       
wire            msip0_wen;         
wire    [31:0]  msip1_value;       
wire            msip1_wen;         
wire            mtime_clk;         
wire    [31:0]  mtimecmp0_value;   
wire            mtimecmp0_wen;     
wire    [31:0]  mtimecmp1_value;   
wire            mtimecmp1_wen;     
wire    [31:0]  mtimecmph0_value;  
wire            mtimecmph0_wen;    
wire    [31:0]  mtimecmph1_value;  
wire            mtimecmph1_wen;    
wire            pad_yy_icg_scan_en; 
wire    [31:0]  paddr;             
wire            penable;           
wire    [1 :0]  pprot;             
wire    [31:0]  prdata_clint;      
wire            priv_err;          
wire            psel_clint;        
wire    [31:0]  pwdata;            
wire            pwrite;            
wire            sreg_wen;          
wire    [31:0]  ssip0_value;       
wire            ssip0_wen;         
wire    [31:0]  ssip1_value;       
wire            ssip1_wen;         
wire    [31:0]  stimecmp0_value;   
wire            stimecmp0_wen;     
wire    [31:0]  stimecmp1_value;   
wire            stimecmp1_wen;     
wire    [31:0]  stimecmph0_value;  
wire            stimecmph0_wen;    
wire    [31:0]  stimecmph1_value;  
wire            stimecmph1_wen;    
wire            supv_mode;         
wire    [63:0]  sysio_clint_mtime; 
wire            user_mode;         


parameter MSIP0      = 16'h0000;
parameter MSIP1      = 16'h0004;
parameter MSIP2      = 16'h0008;
parameter MSIP3      = 16'h000C;

parameter MTIMECMP0  = 16'h4000;
parameter MTIMECMPH0 = 16'h4004;
parameter MTIMECMP1  = 16'h4008;
parameter MTIMECMPH1 = 16'h400C;
parameter MTIMECMP2  = 16'h4010;
parameter MTIMECMPH2 = 16'h4014;
parameter MTIMECMP3  = 16'h4018;
parameter MTIMECMPH3 = 16'h401C;

parameter SSIP0      = 16'hC000;
parameter SSIP1      = 16'hC004;
parameter SSIP2      = 16'hC008;
parameter SSIP3      = 16'hC00C;

parameter STIMECMP0  = 16'hD000;
parameter STIMECMPH0 = 16'hD004;
parameter STIMECMP1  = 16'hD008;
parameter STIMECMPH1 = 16'hD00C;
parameter STIMECMP2  = 16'hD010;
parameter STIMECMPH2 = 16'hD014;
parameter STIMECMP3  = 16'hD018;
parameter STIMECMPH3 = 16'hD01C;

// &Force("output", "pready_clint"); @57
// &Force("output", "perr_clint"); @58
assign clint_clk_en = psel_clint || perr_clint || pready_clint;
// &Instance("gated_clk_cell", "x_clint_gateclk"); @60
gated_clk_cell  x_clint_gateclk (
  .clk_in             (forever_apbclk    ),
  .clk_out            (clint_clk         ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (clint_clk_en      ),
  .module_en          (ciu_clint_icg_en  ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect( .clk_in     (forever_apbclk), @61
//           .external_en(1'b0          ), @62
//           .global_en  (1'b1          ), @63
//           .module_en  (ciu_clint_icg_en), @64
//           .local_en   (clint_clk_en  ), @65
//           .clk_out    (clint_clk     ) @66
//          ); @67

//===================================================
// Clint Function Module
// 1. APB interface
// 2. Software and Time Register
// 3. CP0 interface
//===================================================


//===================================================
// 1. APB interface
//===================================================

assign clint_wen = psel_clint && pwrite && penable;

assign user_mode = pprot[1:0] == 2'b00;
assign supv_mode = pprot[1:0] == 2'b01;
assign mach_mode = pprot[1:0] == 2'b11;

assign mreg_wen  = mach_mode && clint_wen;
assign sreg_wen  = (mach_mode || supv_mode) && clint_wen;

// pready
always @ (posedge clint_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    pready_clint <= 1'b0;
  else if(psel_clint && !penable)
    pready_clint <= 1'b1;
  else
    pready_clint <= 1'b0;
end

// perr
always @ (posedge clint_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    perr_clint <= 1'b0;
  else if(psel_clint && !penable && (acc_err || priv_err))
    perr_clint <= 1'b1;
  else
    perr_clint <= 1'b0;
end

// prdata
assign prdata_clint[31:0] = data_out[31:0];

// &Force("bus", "paddr", 31, 0); @115
// access error when addr not legal
// &CombBeg; @117
always @( paddr[15:0])
begin
case(paddr[15:0])
  MSIP0:      acc_err = 1'b0;
  MTIMECMP0:  acc_err = 1'b0;
  MTIMECMPH0: acc_err = 1'b0;

  SSIP0:      acc_err = 1'b0;
  STIMECMP0:  acc_err = 1'b0;
  STIMECMPH0: acc_err = 1'b0;

  MSIP1:      acc_err = 1'b0;
  MTIMECMP1:  acc_err = 1'b0;
  MTIMECMPH1: acc_err = 1'b0;

  SSIP1:      acc_err = 1'b0;
  STIMECMP1:  acc_err = 1'b0;
  STIMECMPH1: acc_err = 1'b0;



  default:    acc_err = 1'b1;
endcase
// &CombEnd; @159
end

assign priv_err = (paddr[15:12] == 4'h0 || paddr[15:12] == 4'h4) && !mach_mode
               || (paddr[15:12] == 4'hC || paddr[15:12] == 4'hD) &&  user_mode;

//===================================================
// 2. Software and Time Register
//===================================================

// write enable
assign msip0_wen      = mreg_wen && paddr[15:0] == MSIP0;
assign mtimecmp0_wen  = mreg_wen && paddr[15:0] == MTIMECMP0;
assign mtimecmph0_wen = mreg_wen && paddr[15:0] == MTIMECMPH0;

assign ssip0_wen      = sreg_wen && paddr[15:0] == SSIP0;
assign stimecmp0_wen  = sreg_wen && paddr[15:0] == STIMECMP0;
assign stimecmph0_wen = sreg_wen && paddr[15:0] == STIMECMPH0;

assign msip1_wen      = mreg_wen && paddr[15:0] == MSIP1;
assign mtimecmp1_wen  = mreg_wen && paddr[15:0] == MTIMECMP1;
assign mtimecmph1_wen = mreg_wen && paddr[15:0] == MTIMECMPH1;

assign ssip1_wen      = sreg_wen && paddr[15:0] == SSIP1;
assign stimecmp1_wen  = sreg_wen && paddr[15:0] == STIMECMP1;
assign stimecmph1_wen = sreg_wen && paddr[15:0] == STIMECMPH1;



// Machine Software Interrupt Pending Register
always @ (posedge clint_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    msip0_reg <= 1'b0;
  else if(msip0_wen)
    msip0_reg <= pwdata[0];
end
assign msip0_value[31:0] = {31'b0, msip0_reg};

// Machine Time Compare Register Low
always @ (posedge clint_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    mtimecmp0_reg[31:0] <= 32'hffffffff;
  else if(mtimecmp0_wen)
    mtimecmp0_reg[31:0] <= pwdata[31:0];
end
assign mtimecmp0_value[31:0] = mtimecmp0_reg[31:0];

// Machine Time Compare Register High
always @ (posedge clint_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    mtimecmph0_reg[31:0] <= 32'hffffffff;
  else if(mtimecmph0_wen)
    mtimecmph0_reg[31:0] <= pwdata[31:0];
end
assign mtimecmph0_value[31:0] = mtimecmph0_reg[31:0];

// Supervisor Software Interrupt Pending Register
always @ (posedge clint_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ssip0_reg <= 1'b0;
  else if(ssip0_wen)
    ssip0_reg <= pwdata[0];
end
assign ssip0_value[31:0] = {31'b0, ssip0_reg};

// Supervisor Time Compare Register Low
always @ (posedge clint_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    stimecmp0_reg[31:0] <= 32'hffffffff;
  else if(stimecmp0_wen)
    stimecmp0_reg[31:0] <= pwdata[31:0];
end
assign stimecmp0_value[31:0] = stimecmp0_reg[31:0];

// Supervisor Time Compare Register High
always @ (posedge clint_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    stimecmph0_reg[31:0] <= 32'hffffffff;
  else if(stimecmph0_wen)
    stimecmph0_reg[31:0] <= pwdata[31:0];
end
assign stimecmph0_value[31:0] = stimecmph0_reg[31:0];

// Machine Software Interrupt Pending Register
always @ (posedge clint_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    msip1_reg <= 1'b0;
  else if(msip1_wen)
    msip1_reg <= pwdata[0];
end
assign msip1_value[31:0] = {31'b0, msip1_reg};

// Machine Time Compare Register Low
always @ (posedge clint_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    mtimecmp1_reg[31:0] <= 32'hffffffff;
  else if(mtimecmp1_wen)
    mtimecmp1_reg[31:0] <= pwdata[31:0];
end
assign mtimecmp1_value[31:0] = mtimecmp1_reg[31:0];

// Machine Time Compare Register High
always @ (posedge clint_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    mtimecmph1_reg[31:0] <= 32'hffffffff;
  else if(mtimecmph1_wen)
    mtimecmph1_reg[31:0] <= pwdata[31:0];
end
assign mtimecmph1_value[31:0] = mtimecmph1_reg[31:0];

// Supervisor Software Interrupt Pending Register
always @ (posedge clint_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ssip1_reg <= 1'b0;
  else if(ssip1_wen)
    ssip1_reg <= pwdata[0];
end
assign ssip1_value[31:0] = {31'b0, ssip1_reg};

// Supervisor Time Compare Register Low
always @ (posedge clint_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    stimecmp1_reg[31:0] <= 32'hffffffff;
  else if(stimecmp1_wen)
    stimecmp1_reg[31:0] <= pwdata[31:0];
end
assign stimecmp1_value[31:0] = stimecmp1_reg[31:0];

// Supervisor Time Compare Register High
always @ (posedge clint_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    stimecmph1_reg[31:0] <= 32'hffffffff;
  else if(stimecmph1_wen)
    stimecmph1_reg[31:0] <= pwdata[31:0];
end
assign stimecmph1_value[31:0] = stimecmph1_reg[31:0];



// read data
// &CombBeg; @454
always @( mtimecmp0_value[31:0]
       or paddr[15:0]
       or msip1_value[31:0]
       or ssip1_value[31:0]
       or stimecmp1_value[31:0]
       or ssip0_value[31:0]
       or msip0_value[31:0]
       or mtimecmp1_value[31:0]
       or stimecmp0_value[31:0]
       or mtimecmph0_value[31:0]
       or stimecmph0_value[31:0]
       or stimecmph1_value[31:0]
       or mtimecmph1_value[31:0])
begin
case(paddr[15:0])
  MSIP0:      data_out[31:0] = msip0_value[31:0];
  MTIMECMP0:  data_out[31:0] = mtimecmp0_value[31:0];
  MTIMECMPH0: data_out[31:0] = mtimecmph0_value[31:0];

  SSIP0:      data_out[31:0] = ssip0_value[31:0];
  STIMECMP0:  data_out[31:0] = stimecmp0_value[31:0];
  STIMECMPH0: data_out[31:0] = stimecmph0_value[31:0];

  MSIP1:      data_out[31:0] = msip1_value[31:0];
  MTIMECMP1:  data_out[31:0] = mtimecmp1_value[31:0];
  MTIMECMPH1: data_out[31:0] = mtimecmph1_value[31:0];

  SSIP1:      data_out[31:0] = ssip1_value[31:0];
  STIMECMP1:  data_out[31:0] = stimecmp1_value[31:0];
  STIMECMPH1: data_out[31:0] = stimecmph1_value[31:0];



  default:    data_out[31:0] = {32{1'bx}};
endcase
// &CombEnd; @496
end


//===================================================
// 3. CP0 interface
//===================================================
// sample mtime in apb
// &Instance("gated_clk_cell", "x_mtime_gated_clk"); @503
gated_clk_cell  x_mtime_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (mtime_clk         ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (apb_clk_en        ),
  .module_en          (ciu_clint_icg_en  ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @504
//          .external_en (1'b0          ), @505
//          .global_en   (1'b1          ), @506
//          .module_en   (ciu_clint_icg_en). @507
//          .local_en    (apb_clk_en   ), @508
//          .clk_out     (mtime_clk     ) @509
//         ); @510

always@(posedge mtime_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    clint_mtime_reg[63:0] <= 64'b0;
  else if(apb_clk_en)
    clint_mtime_reg[63:0] <= sysio_clint_mtime[63:0];
  else
    clint_mtime_reg[63:0] <= clint_mtime_reg[63:0];
end

assign clint_core0_ms_int = msip0_reg;
assign clint_core0_ss_int = ssip0_reg;

assign clint_core0_mt_int = !({mtimecmph0_reg[31:0], mtimecmp0_reg[31:0]}
                          > clint_mtime_reg[63:0]);
assign clint_core0_st_int = !({stimecmph0_reg[31:0], stimecmp0_reg[31:0]}
                          > clint_mtime_reg[63:0]);

//assign clint_core0_time[63:0] = sysio_clint_mtime[63:0];

assign clint_core1_ms_int = msip1_reg;
assign clint_core1_ss_int = ssip1_reg;

assign clint_core1_mt_int = !({mtimecmph1_reg[31:0], mtimecmp1_reg[31:0]}
                           > clint_mtime_reg[63:0]);
assign clint_core1_st_int = !({stimecmph1_reg[31:0], stimecmp1_reg[31:0]}
                           > clint_mtime_reg[63:0]);

//assign clint_core1_time[63:0] = sysio_clint_mtime[63:0];



// &ModuleEnd; @568
endmodule


