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
module ct_pmp_regs(
  cp0_pmp_wdata,
  cpuclk,
  cpurst_b,
  pmp_cp0_data,
  pmp_csr_sel,
  pmp_csr_wen,
  pmpaddr0_value,
  pmpaddr1_value,
  pmpaddr2_value,
  pmpaddr3_value,
  pmpaddr4_value,
  pmpaddr5_value,
  pmpaddr6_value,
  pmpaddr7_value,
  pmpcfg0_value,
  pmpcfg2_value
);

// &Ports; @24
input   [63:0]  cp0_pmp_wdata;      
input           cpuclk;             
input           cpurst_b;           
input   [17:0]  pmp_csr_sel;        
input   [17:0]  pmp_csr_wen;        
output  [63:0]  pmp_cp0_data;       
output  [28:0]  pmpaddr0_value;     
output  [28:0]  pmpaddr1_value;     
output  [28:0]  pmpaddr2_value;     
output  [28:0]  pmpaddr3_value;     
output  [28:0]  pmpaddr4_value;     
output  [28:0]  pmpaddr5_value;     
output  [28:0]  pmpaddr6_value;     
output  [28:0]  pmpaddr7_value;     
output  [63:0]  pmpcfg0_value;      
output  [63:0]  pmpcfg2_value;      

// &Regs; @25
reg     [1 :0]  pmp0cfg_addr_mode;  
reg             pmp0cfg_executeable; 
reg             pmp0cfg_lock;       
reg             pmp0cfg_readable;   
reg             pmp0cfg_writable;   
reg     [1 :0]  pmp1cfg_addr_mode;  
reg             pmp1cfg_executeable; 
reg             pmp1cfg_lock;       
reg             pmp1cfg_readable;   
reg             pmp1cfg_writable;   
reg     [1 :0]  pmp2cfg_addr_mode;  
reg             pmp2cfg_executeable; 
reg             pmp2cfg_lock;       
reg             pmp2cfg_readable;   
reg             pmp2cfg_writable;   
reg     [1 :0]  pmp3cfg_addr_mode;  
reg             pmp3cfg_executeable; 
reg             pmp3cfg_lock;       
reg             pmp3cfg_readable;   
reg             pmp3cfg_writable;   
reg     [1 :0]  pmp4cfg_addr_mode;  
reg             pmp4cfg_executeable; 
reg             pmp4cfg_lock;       
reg             pmp4cfg_readable;   
reg             pmp4cfg_writable;   
reg     [1 :0]  pmp5cfg_addr_mode;  
reg             pmp5cfg_executeable; 
reg             pmp5cfg_lock;       
reg             pmp5cfg_readable;   
reg             pmp5cfg_writable;   
reg     [1 :0]  pmp6cfg_addr_mode;  
reg             pmp6cfg_executeable; 
reg             pmp6cfg_lock;       
reg             pmp6cfg_readable;   
reg             pmp6cfg_writable;   
reg     [1 :0]  pmp7cfg_addr_mode;  
reg             pmp7cfg_executeable; 
reg             pmp7cfg_lock;       
reg             pmp7cfg_readable;   
reg             pmp7cfg_writable;   
reg     [28:0]  pmpaddr0_value;     
reg     [28:0]  pmpaddr1_value;     
reg     [28:0]  pmpaddr2_value;     
reg     [28:0]  pmpaddr3_value;     
reg     [28:0]  pmpaddr4_value;     
reg     [28:0]  pmpaddr5_value;     
reg     [28:0]  pmpaddr6_value;     
reg     [28:0]  pmpaddr7_value;     

// &Wires; @26
wire    [63:0]  cp0_pmp_wdata;      
wire            cpuclk;             
wire            cpurst_b;           
wire    [63:0]  pmp_cp0_data;       
wire    [17:0]  pmp_csr_sel;        
wire    [17:0]  pmp_csr_wen;        
wire            pmp_updt_pmp0cfg;   
wire            pmp_updt_pmp1cfg;   
wire            pmp_updt_pmp2cfg;   
wire            pmp_updt_pmp3cfg;   
wire            pmp_updt_pmp4cfg;   
wire            pmp_updt_pmp5cfg;   
wire            pmp_updt_pmp6cfg;   
wire            pmp_updt_pmp7cfg;   
wire            pmp_updt_pmpaddr0;  
wire            pmp_updt_pmpaddr1;  
wire            pmp_updt_pmpaddr2;  
wire            pmp_updt_pmpaddr3;  
wire            pmp_updt_pmpaddr4;  
wire            pmp_updt_pmpaddr5;  
wire            pmp_updt_pmpaddr6;  
wire            pmp_updt_pmpaddr7;  
wire    [28:0]  pmpaddr10_value;    
wire    [28:0]  pmpaddr11_value;    
wire    [28:0]  pmpaddr12_value;    
wire    [28:0]  pmpaddr13_value;    
wire    [28:0]  pmpaddr14_value;    
wire    [28:0]  pmpaddr15_value;    
wire    [28:0]  pmpaddr8_value;     
wire    [28:0]  pmpaddr9_value;     
wire    [63:0]  pmpcfg0_value;      
wire    [63:0]  pmpcfg2_value;      


parameter ADDR_WIDTH = 28+1;

// &Force("bus", "pmp_csr_wen", 17, 0); @30
//==========================================================
//                PMP Entry Configuration Register
//==========================================================
//------------------------------------------------
//pmpcfg0 register
//------------------------------------------------
assign pmp_updt_pmp0cfg = pmp_csr_wen[0] && !pmp0cfg_lock;
always @(posedge cpuclk or negedge cpurst_b)
begin
  if(!cpurst_b)
  begin
    pmp0cfg_readable       <= 1'b0;
    pmp0cfg_writable       <= 1'b0;
    pmp0cfg_executeable    <= 1'b0;
    pmp0cfg_addr_mode[1:0] <= 2'b0;
    pmp0cfg_lock           <= 1'b0;
  end
  else if(pmp_updt_pmp0cfg)
  begin
    pmp0cfg_readable       <= cp0_pmp_wdata[0];
    pmp0cfg_writable       <= cp0_pmp_wdata[1];
    pmp0cfg_executeable    <= cp0_pmp_wdata[2];
    pmp0cfg_addr_mode[1:0] <= cp0_pmp_wdata[4:3];
    pmp0cfg_lock           <= cp0_pmp_wdata[7];
  end
  else
  begin
    pmp0cfg_readable       <= pmp0cfg_readable;     
    pmp0cfg_writable       <= pmp0cfg_writable;     
    pmp0cfg_executeable    <= pmp0cfg_executeable;     
    pmp0cfg_addr_mode[1:0] <= pmp0cfg_addr_mode[1:0];
    pmp0cfg_lock           <= pmp0cfg_lock;     
  end
end

assign pmp_updt_pmp1cfg = pmp_csr_wen[0] && !pmp1cfg_lock;
always @(posedge cpuclk or negedge cpurst_b)
begin
  if(!cpurst_b)
  begin
    pmp1cfg_readable       <= 1'b0;
    pmp1cfg_writable       <= 1'b0;
    pmp1cfg_executeable    <= 1'b0;
    pmp1cfg_addr_mode[1:0] <= 2'b0;
    pmp1cfg_lock           <= 1'b0;
  end
  else if(pmp_updt_pmp1cfg)
  begin
    pmp1cfg_readable       <= cp0_pmp_wdata[8];
    pmp1cfg_writable       <= cp0_pmp_wdata[9];
    pmp1cfg_executeable    <= cp0_pmp_wdata[10];
    pmp1cfg_addr_mode[1:0] <= cp0_pmp_wdata[12:11];
    pmp1cfg_lock           <= cp0_pmp_wdata[15];
  end
  else
  begin
    pmp1cfg_readable       <= pmp1cfg_readable;     
    pmp1cfg_writable       <= pmp1cfg_writable;     
    pmp1cfg_executeable    <= pmp1cfg_executeable;     
    pmp1cfg_addr_mode[1:0] <= pmp1cfg_addr_mode[1:0];
    pmp1cfg_lock           <= pmp1cfg_lock;     
  end
end

assign pmp_updt_pmp2cfg = pmp_csr_wen[0] && !pmp2cfg_lock;
always @(posedge cpuclk or negedge cpurst_b)
begin
  if(!cpurst_b)
  begin
    pmp2cfg_readable       <= 1'b0;
    pmp2cfg_writable       <= 1'b0;
    pmp2cfg_executeable    <= 1'b0;
    pmp2cfg_addr_mode[1:0] <= 2'b0;
    pmp2cfg_lock           <= 1'b0;
  end
  else if(pmp_updt_pmp2cfg)
  begin
    pmp2cfg_readable       <= cp0_pmp_wdata[16];
    pmp2cfg_writable       <= cp0_pmp_wdata[17];
    pmp2cfg_executeable    <= cp0_pmp_wdata[18];
    pmp2cfg_addr_mode[1:0] <= cp0_pmp_wdata[20:19];
    pmp2cfg_lock           <= cp0_pmp_wdata[23];
  end
  else
  begin
    pmp2cfg_readable       <= pmp2cfg_readable;     
    pmp2cfg_writable       <= pmp2cfg_writable;     
    pmp2cfg_executeable    <= pmp2cfg_executeable;     
    pmp2cfg_addr_mode[1:0] <= pmp2cfg_addr_mode[1:0];
    pmp2cfg_lock           <= pmp2cfg_lock;     
  end
end

assign pmp_updt_pmp3cfg = pmp_csr_wen[0] && !pmp3cfg_lock;
always @(posedge cpuclk or negedge cpurst_b)
begin
  if(!cpurst_b)
  begin
    pmp3cfg_readable       <= 1'b0;
    pmp3cfg_writable       <= 1'b0;
    pmp3cfg_executeable    <= 1'b0;
    pmp3cfg_addr_mode[1:0] <= 2'b0;
    pmp3cfg_lock           <= 1'b0;
  end
  else if(pmp_updt_pmp3cfg)
  begin
    pmp3cfg_readable       <= cp0_pmp_wdata[24];
    pmp3cfg_writable       <= cp0_pmp_wdata[25];
    pmp3cfg_executeable    <= cp0_pmp_wdata[26];
    pmp3cfg_addr_mode[1:0] <= cp0_pmp_wdata[28:27];
    pmp3cfg_lock           <= cp0_pmp_wdata[31];
  end
  else
  begin
    pmp3cfg_readable       <= pmp3cfg_readable;     
    pmp3cfg_writable       <= pmp3cfg_writable;     
    pmp3cfg_executeable    <= pmp3cfg_executeable;     
    pmp3cfg_addr_mode[1:0] <= pmp3cfg_addr_mode[1:0];
    pmp3cfg_lock           <= pmp3cfg_lock;     
  end
end

assign pmp_updt_pmp4cfg = pmp_csr_wen[0] && !pmp4cfg_lock;
always @(posedge cpuclk or negedge cpurst_b)
begin
  if(!cpurst_b)
  begin
    pmp4cfg_readable       <= 1'b0;
    pmp4cfg_writable       <= 1'b0;
    pmp4cfg_executeable    <= 1'b0;
    pmp4cfg_addr_mode[1:0] <= 2'b0;
    pmp4cfg_lock           <= 1'b0;
  end
  else if(pmp_updt_pmp4cfg)
  begin
    pmp4cfg_readable        <= cp0_pmp_wdata[32];
    pmp4cfg_writable        <= cp0_pmp_wdata[33];
    pmp4cfg_executeable     <= cp0_pmp_wdata[34];
    pmp4cfg_addr_mode[1:0]  <= cp0_pmp_wdata[36:35];
    pmp4cfg_lock            <= cp0_pmp_wdata[39];
  end
  else
  begin
    pmp4cfg_readable       <= pmp4cfg_readable;     
    pmp4cfg_writable       <= pmp4cfg_writable;     
    pmp4cfg_executeable    <= pmp4cfg_executeable;     
    pmp4cfg_addr_mode[1:0] <= pmp4cfg_addr_mode[1:0];
    pmp4cfg_lock           <= pmp4cfg_lock;     
  end
end

assign pmp_updt_pmp5cfg = pmp_csr_wen[0] && !pmp5cfg_lock;
always @(posedge cpuclk or negedge cpurst_b)
begin
  if(!cpurst_b)
  begin
    pmp5cfg_readable       <= 1'b0;
    pmp5cfg_writable       <= 1'b0;
    pmp5cfg_executeable    <= 1'b0;
    pmp5cfg_addr_mode[1:0] <= 2'b0;
    pmp5cfg_lock           <= 1'b0;
  end
  else if(pmp_updt_pmp5cfg)
  begin
    pmp5cfg_readable       <= cp0_pmp_wdata[40];
    pmp5cfg_writable       <= cp0_pmp_wdata[41];
    pmp5cfg_executeable    <= cp0_pmp_wdata[42];
    pmp5cfg_addr_mode[1:0] <= cp0_pmp_wdata[44:43];
    pmp5cfg_lock           <= cp0_pmp_wdata[47];
  end
  else
  begin
    pmp5cfg_readable       <= pmp5cfg_readable;     
    pmp5cfg_writable       <= pmp5cfg_writable;     
    pmp5cfg_executeable    <= pmp5cfg_executeable;     
    pmp5cfg_addr_mode[1:0] <= pmp5cfg_addr_mode[1:0];
    pmp5cfg_lock           <= pmp5cfg_lock;     
  end
end

assign pmp_updt_pmp6cfg = pmp_csr_wen[0] && !pmp6cfg_lock;
always @(posedge cpuclk or negedge cpurst_b)
begin
  if(!cpurst_b)
  begin
    pmp6cfg_readable       <= 1'b0;
    pmp6cfg_writable       <= 1'b0;
    pmp6cfg_executeable    <= 1'b0;
    pmp6cfg_addr_mode[1:0] <= 2'b0;
    pmp6cfg_lock           <= 1'b0;
  end
  else if(pmp_updt_pmp6cfg)
  begin
    pmp6cfg_readable       <= cp0_pmp_wdata[48];
    pmp6cfg_writable       <= cp0_pmp_wdata[49];
    pmp6cfg_executeable    <= cp0_pmp_wdata[50];
    pmp6cfg_addr_mode[1:0] <= cp0_pmp_wdata[52:51];
    pmp6cfg_lock           <= cp0_pmp_wdata[55];
  end
  else
  begin
    pmp6cfg_readable       <= pmp6cfg_readable;     
    pmp6cfg_writable       <= pmp6cfg_writable;     
    pmp6cfg_executeable    <= pmp6cfg_executeable;     
    pmp6cfg_addr_mode[1:0] <= pmp6cfg_addr_mode[1:0];
    pmp6cfg_lock           <= pmp6cfg_lock;     
  end
end

assign pmp_updt_pmp7cfg = pmp_csr_wen[0] && !pmp7cfg_lock;
always @(posedge cpuclk or negedge cpurst_b)
begin
  if(!cpurst_b)
  begin
    pmp7cfg_readable       <= 1'b0;
    pmp7cfg_writable       <= 1'b0;
    pmp7cfg_executeable    <= 1'b0;
    pmp7cfg_addr_mode[1:0] <= 2'b0;
    pmp7cfg_lock           <= 1'b0;
  end
  else if(pmp_updt_pmp7cfg)
  begin
    pmp7cfg_readable       <= cp0_pmp_wdata[56];
    pmp7cfg_writable       <= cp0_pmp_wdata[57];
    pmp7cfg_executeable    <= cp0_pmp_wdata[58];
    pmp7cfg_addr_mode[1:0] <= cp0_pmp_wdata[60:59];
    pmp7cfg_lock           <= cp0_pmp_wdata[63];
  end
  else
  begin
    pmp7cfg_readable       <= pmp7cfg_readable;     
    pmp7cfg_writable       <= pmp7cfg_writable;     
    pmp7cfg_executeable    <= pmp7cfg_executeable;     
    pmp7cfg_addr_mode[1:0] <= pmp7cfg_addr_mode[1:0];
    pmp7cfg_lock           <= pmp7cfg_lock;     
  end
end

//------------------------------------------------
//pmpcfg1 register
//------------------------------------------------

// &Force("output","pmpcfg0_value"); @506
// &Force("output","pmpcfg2_value"); @507
assign pmpcfg0_value[31:0] = {pmp3cfg_lock,2'b0,pmp3cfg_addr_mode[1:0],pmp3cfg_executeable,pmp3cfg_writable,pmp3cfg_readable,
                              pmp2cfg_lock,2'b0,pmp2cfg_addr_mode[1:0],pmp2cfg_executeable,pmp2cfg_writable,pmp2cfg_readable,
                              pmp1cfg_lock,2'b0,pmp1cfg_addr_mode[1:0],pmp1cfg_executeable,pmp1cfg_writable,pmp1cfg_readable,
                              pmp0cfg_lock,2'b0,pmp0cfg_addr_mode[1:0],pmp0cfg_executeable,pmp0cfg_writable,pmp0cfg_readable};
assign pmpcfg0_value[63:32] = {pmp7cfg_lock,2'b0,pmp7cfg_addr_mode[1:0],pmp7cfg_executeable,pmp7cfg_writable,pmp7cfg_readable,
                              pmp6cfg_lock,2'b0,pmp6cfg_addr_mode[1:0],pmp6cfg_executeable,pmp6cfg_writable,pmp6cfg_readable,
                              pmp5cfg_lock,2'b0,pmp5cfg_addr_mode[1:0],pmp5cfg_executeable,pmp5cfg_writable,pmp5cfg_readable,
                              pmp4cfg_lock,2'b0,pmp4cfg_addr_mode[1:0],pmp4cfg_executeable,pmp4cfg_writable,pmp4cfg_readable};

assign pmpcfg2_value[63:0] = 64'b0;


//==========================================================
//                PMP Entry Address Register
//==========================================================
//------------------------------------------------
//pmpaddr0 register
//------------------------------------------------
assign pmp_updt_pmpaddr0 = pmp_csr_wen[2] && !pmpcfg0_value[7] && !(pmpcfg0_value[15] && (pmpcfg0_value[12:11] == 2'b01)) ;
always @(posedge cpuclk or negedge cpurst_b)
begin
  if(!cpurst_b)
    pmpaddr0_value[ADDR_WIDTH-1:0] <= {ADDR_WIDTH{1'b0}};
  else if(pmp_updt_pmpaddr0)
    pmpaddr0_value[ADDR_WIDTH-1:0] <= cp0_pmp_wdata[ADDR_WIDTH+8:9];
  else
    pmpaddr0_value[ADDR_WIDTH-1:0] <= pmpaddr0_value[ADDR_WIDTH-1:0];
end
// &Force("output","pmpaddr0_value"); @547

assign pmp_updt_pmpaddr1 = pmp_csr_wen[3] && !pmpcfg0_value[15] && !(pmpcfg0_value[23] && (pmpcfg0_value[20:19] == 2'b01));
always @(posedge cpuclk or negedge cpurst_b)
begin
  if(!cpurst_b)
    pmpaddr1_value[ADDR_WIDTH-1:0] <= {ADDR_WIDTH{1'b0}};
  else if(pmp_updt_pmpaddr1)
    pmpaddr1_value[ADDR_WIDTH-1:0] <= cp0_pmp_wdata[ADDR_WIDTH+8:9];
  else
    pmpaddr1_value[ADDR_WIDTH-1:0] <= pmpaddr1_value[ADDR_WIDTH-1:0];
end
// &Force("output","pmpaddr1_value"); @559

assign pmp_updt_pmpaddr2 = pmp_csr_wen[4] && !pmpcfg0_value[23] && !(pmpcfg0_value[31] && (pmpcfg0_value[28:27] == 2'b01));
always @(posedge cpuclk or negedge cpurst_b)
begin
  if(!cpurst_b)
    pmpaddr2_value[ADDR_WIDTH-1:0] <= {ADDR_WIDTH{1'b0}};
  else if(pmp_updt_pmpaddr2)
    pmpaddr2_value[ADDR_WIDTH-1:0] <= cp0_pmp_wdata[ADDR_WIDTH+8:9];
  else
    pmpaddr2_value[ADDR_WIDTH-1:0] <= pmpaddr2_value[ADDR_WIDTH-1:0];
end
// &Force("output","pmpaddr2_value"); @571

assign pmp_updt_pmpaddr3 = pmp_csr_wen[5] && !pmpcfg0_value[31] && !(pmpcfg0_value[39] && (pmpcfg0_value[36:35] == 2'b01));
always @(posedge cpuclk or negedge cpurst_b)
begin
  if(!cpurst_b)
    pmpaddr3_value[ADDR_WIDTH-1:0] <= {ADDR_WIDTH{1'b0}};
  else if(pmp_updt_pmpaddr3)
    pmpaddr3_value[ADDR_WIDTH-1:0] <= cp0_pmp_wdata[ADDR_WIDTH+8:9];
  else
    pmpaddr3_value[ADDR_WIDTH-1:0] <= pmpaddr3_value[ADDR_WIDTH-1:0];
end
// &Force("output","pmpaddr3_value"); @583

assign pmp_updt_pmpaddr4 = pmp_csr_wen[6] && !pmpcfg0_value[39] && !(pmpcfg0_value[47] && (pmpcfg0_value[44:43] == 2'b01));
always @(posedge cpuclk or negedge cpurst_b)
begin
  if(!cpurst_b)
    pmpaddr4_value[ADDR_WIDTH-1:0] <= {ADDR_WIDTH{1'b0}};
  else if(pmp_updt_pmpaddr4)
    pmpaddr4_value[ADDR_WIDTH-1:0] <= cp0_pmp_wdata[ADDR_WIDTH+8:9];
  else
    pmpaddr4_value[ADDR_WIDTH-1:0] <= pmpaddr4_value[ADDR_WIDTH-1:0];
end
// &Force("output","pmpaddr4_value"); @595

assign pmp_updt_pmpaddr5 = pmp_csr_wen[7] && !pmpcfg0_value[47] && !(pmpcfg0_value[55] && (pmpcfg0_value[52:51] == 2'b01));
always @(posedge cpuclk or negedge cpurst_b)
begin
  if(!cpurst_b)
    pmpaddr5_value[ADDR_WIDTH-1:0] <= {ADDR_WIDTH{1'b0}};
  else if(pmp_updt_pmpaddr5)
    pmpaddr5_value[ADDR_WIDTH-1:0] <= cp0_pmp_wdata[ADDR_WIDTH+8:9];
  else
    pmpaddr5_value[ADDR_WIDTH-1:0] <= pmpaddr5_value[ADDR_WIDTH-1:0];
end
// &Force("output","pmpaddr5_value"); @607

assign pmp_updt_pmpaddr6 = pmp_csr_wen[8] && !pmpcfg0_value[55] && !(pmpcfg0_value[63] && (pmpcfg0_value[60:59] == 2'b01));
always @(posedge cpuclk or negedge cpurst_b)
begin
  if(!cpurst_b)
    pmpaddr6_value[ADDR_WIDTH-1:0] <= {ADDR_WIDTH{1'b0}};
  else if(pmp_updt_pmpaddr6)
    pmpaddr6_value[ADDR_WIDTH-1:0] <= cp0_pmp_wdata[ADDR_WIDTH+8:9];
  else
    pmpaddr6_value[ADDR_WIDTH-1:0] <= pmpaddr6_value[ADDR_WIDTH-1:0];
end
// &Force("output","pmpaddr6_value"); @619

assign pmp_updt_pmpaddr7 = pmp_csr_wen[9] && !pmpcfg0_value[63] && !(pmpcfg2_value[7] && (pmpcfg2_value[4:3] == 2'b01));
always @(posedge cpuclk or negedge cpurst_b)
begin
  if(!cpurst_b)
    pmpaddr7_value[ADDR_WIDTH-1:0] <= {ADDR_WIDTH{1'b0}};
  else if(pmp_updt_pmpaddr7)
    pmpaddr7_value[ADDR_WIDTH-1:0] <= cp0_pmp_wdata[ADDR_WIDTH+8:9];
  else
    pmpaddr7_value[ADDR_WIDTH-1:0] <= pmpaddr7_value[ADDR_WIDTH-1:0];
end
// &Force("output","pmpaddr7_value"); @631

assign pmpaddr8_value[ADDR_WIDTH-1:0]  = {ADDR_WIDTH{1'b0}};
assign pmpaddr9_value[ADDR_WIDTH-1:0]  = {ADDR_WIDTH{1'b0}};
assign pmpaddr10_value[ADDR_WIDTH-1:0] = {ADDR_WIDTH{1'b0}};
assign pmpaddr11_value[ADDR_WIDTH-1:0] = {ADDR_WIDTH{1'b0}};
assign pmpaddr12_value[ADDR_WIDTH-1:0] = {ADDR_WIDTH{1'b0}};
assign pmpaddr13_value[ADDR_WIDTH-1:0] = {ADDR_WIDTH{1'b0}};
assign pmpaddr14_value[ADDR_WIDTH-1:0] = {ADDR_WIDTH{1'b0}};
assign pmpaddr15_value[ADDR_WIDTH-1:0] = {ADDR_WIDTH{1'b0}};

// &Force("output","pmpaddr8_value"); @655
// &Force("output","pmpaddr9_value"); @667
// &Force("output","pmpaddr10_value"); @679
// &Force("output","pmpaddr11_value"); @691
// &Force("output","pmpaddr12_value"); @703
// &Force("output","pmpaddr13_value"); @715
// &Force("output","pmpaddr14_value"); @727
// &Force("output","pmpaddr15_value"); @739


//----------------------------------------------------------
//  Interface to CP0
//----------------------------------------------------------
assign pmp_cp0_data[63:0]  = {64{pmp_csr_sel[0]}}  & pmpcfg0_value[63:0] 
                           | {64{pmp_csr_sel[1]}}  & pmpcfg2_value[63:0]
                           | {64{pmp_csr_sel[2]}}  & {{(64-ADDR_WIDTH-9){1'b0}}, pmpaddr0_value[ADDR_WIDTH-1:0],  9'b0}
                           | {64{pmp_csr_sel[3]}}  & {{(64-ADDR_WIDTH-9){1'b0}}, pmpaddr1_value[ADDR_WIDTH-1:0],  9'b0}
                           | {64{pmp_csr_sel[4]}}  & {{(64-ADDR_WIDTH-9){1'b0}}, pmpaddr2_value[ADDR_WIDTH-1:0],  9'b0}
                           | {64{pmp_csr_sel[5]}}  & {{(64-ADDR_WIDTH-9){1'b0}}, pmpaddr3_value[ADDR_WIDTH-1:0],  9'b0}
                           | {64{pmp_csr_sel[6]}}  & {{(64-ADDR_WIDTH-9){1'b0}}, pmpaddr4_value[ADDR_WIDTH-1:0],  9'b0}
                           | {64{pmp_csr_sel[7]}}  & {{(64-ADDR_WIDTH-9){1'b0}}, pmpaddr5_value[ADDR_WIDTH-1:0],  9'b0}
                           | {64{pmp_csr_sel[8]}}  & {{(64-ADDR_WIDTH-9){1'b0}}, pmpaddr6_value[ADDR_WIDTH-1:0],  9'b0}
                           | {64{pmp_csr_sel[9]}}  & {{(64-ADDR_WIDTH-9){1'b0}}, pmpaddr7_value[ADDR_WIDTH-1:0],  9'b0}
                           | {64{pmp_csr_sel[10]}} & {{(64-ADDR_WIDTH-9){1'b0}}, pmpaddr8_value[ADDR_WIDTH-1:0],  9'b0}
                           | {64{pmp_csr_sel[11]}} & {{(64-ADDR_WIDTH-9){1'b0}}, pmpaddr9_value[ADDR_WIDTH-1:0],  9'b0}
                           | {64{pmp_csr_sel[12]}} & {{(64-ADDR_WIDTH-9){1'b0}}, pmpaddr10_value[ADDR_WIDTH-1:0], 9'b0}
                           | {64{pmp_csr_sel[13]}} & {{(64-ADDR_WIDTH-9){1'b0}}, pmpaddr11_value[ADDR_WIDTH-1:0], 9'b0}
                           | {64{pmp_csr_sel[14]}} & {{(64-ADDR_WIDTH-9){1'b0}}, pmpaddr12_value[ADDR_WIDTH-1:0], 9'b0}
                           | {64{pmp_csr_sel[15]}} & {{(64-ADDR_WIDTH-9){1'b0}}, pmpaddr13_value[ADDR_WIDTH-1:0], 9'b0}
                           | {64{pmp_csr_sel[16]}} & {{(64-ADDR_WIDTH-9){1'b0}}, pmpaddr14_value[ADDR_WIDTH-1:0], 9'b0}
                           | {64{pmp_csr_sel[17]}} & {{(64-ADDR_WIDTH-9){1'b0}}, pmpaddr15_value[ADDR_WIDTH-1:0], 9'b0};

// &ModuleEnd; @765
endmodule


