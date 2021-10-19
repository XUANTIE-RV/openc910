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



















`define PS1_BASE_START 40'h10015000
`define PS1_BASE_END   40'h10015fff

`define PS2_BASE_START 40'h10011000
`define PS2_BASE_END   40'h10011fff

`define PS3_BASE_START 40'h10016000
`define PS3_BASE_END   40'h10016fff

`define PS4_BASE_START 40'h10010000
`define PS4_BASE_END   40'h10010fff

`define PS5_BASE_START 40'h10019000
`define PS5_BASE_END   40'h10019fff

`define PS6_BASE_START 40'h10017000
`define PS6_BASE_END   40'h10017fff

`define PS7_BASE_START 40'h10018000
`define PS7_BASE_END   40'h10018fff

`define PS8_BASE_START 40'h1001A000
`define PS8_BASE_END   40'h1001Afff


module apb_bridge(
  apb_harb_hrdata,
  apb_harb_hready,
  apb_harb_hresp,
  apb_xx_paddr,
  apb_xx_penable,
  apb_xx_pwdata,
  apb_xx_pwrite,
  harb_apb_hsel,
  harb_xx_haddr,
  harb_xx_hwdata,
  harb_xx_hwrite,
  hclk,
  hrst_b,
  prdata_s1,
  prdata_s2,
  prdata_s3,
  prdata_s4,
  prdata_s5,
  prdata_s6,
  prdata_s7,
  psel_s1,
  psel_s2,
  psel_s3,
  psel_s4,
  psel_s5,
  psel_s6,
  psel_s7
);


input           harb_apb_hsel;  
input   [39:0]  harb_xx_haddr;  
input   [31:0]  harb_xx_hwdata; 
input           harb_xx_hwrite; 
input           hclk;           
input           hrst_b;         
input   [31:0]  prdata_s1;      
input   [31:0]  prdata_s2;      
input   [31:0]  prdata_s3;      
input   [31:0]  prdata_s4;      
input   [31:0]  prdata_s5;      
input   [31:0]  prdata_s6;      
input   [31:0]  prdata_s7;      
output  [31:0]  apb_harb_hrdata; 
output          apb_harb_hready; 
output  [1 :0]  apb_harb_hresp; 
output  [39:0]  apb_xx_paddr;   
output          apb_xx_penable; 
output  [31:0]  apb_xx_pwdata;  
output          apb_xx_pwrite;  
output          psel_s1;        
output          psel_s2;        
output          psel_s3;        
output          psel_s4;        
output          psel_s5;        
output          psel_s6;        
output          psel_s7;        


reg     [31:0]  apb_harb_hrdata; 
reg             apb_harb_hready; 
reg     [39:0]  apb_xx_paddr;   
reg             apb_xx_penable; 
reg             apb_xx_psel;    
reg     [31:0]  apb_xx_pwdata;  
reg             apb_xx_pwrite;  
reg     [2 :0]  cur_state;      
reg     [39:0]  haddr_latch;    
reg             hwrite_latch;   
reg     [2 :0]  nxt_state;      


wire    [1 :0]  apb_harb_hresp; 
wire            busy_s1;        
wire            busy_s2;        
wire            busy_s3;        
wire            busy_s4;        
wire            busy_s5;        
wire            busy_s6;        
wire            busy_s7;        
wire            busy_s8;        
wire            enable_latch;   
wire            enable_r_select; 
wire            harb_apb_hsel;  
wire    [39:0]  harb_xx_haddr;  
wire    [31:0]  harb_xx_hwdata; 
wire            harb_xx_hwrite; 
wire            hclk;           
wire            hrst_b;         
wire            idle_latch;     
wire            idle_r_select;  
wire    [31:0]  prdata_s1;      
wire    [31:0]  prdata_s2;      
wire    [31:0]  prdata_s3;      
wire    [31:0]  prdata_s4;      
wire    [31:0]  prdata_s5;      
wire    [31:0]  prdata_s6;      
wire    [31:0]  prdata_s7;      
wire            psel_s1;        
wire            psel_s2;        
wire            psel_s3;        
wire            psel_s4;        
wire            psel_s5;        
wire            psel_s6;        
wire            psel_s7;        
wire            psel_s8;        



assign apb_harb_hresp[1:0] = 2'b0;


parameter IDLE     = 3'b000;
parameter LATCH    = 3'b001;
parameter W_SELECT = 3'b010;
parameter R_SELECT = 3'b011;
parameter ENABLE   = 3'b100;

always @(posedge hclk or negedge hrst_b)
begin
  if(!hrst_b) 
  begin
    cur_state[2:0] <= IDLE;
  end
  else 
  begin
    cur_state[2:0] <= nxt_state[2:0];
  end
end

assign idle_latch       = harb_apb_hsel && harb_xx_hwrite;
assign idle_r_select    = harb_apb_hsel && !harb_xx_hwrite;
assign enable_latch     = harb_apb_hsel && harb_xx_hwrite;
assign enable_r_select  = harb_apb_hsel && !harb_xx_hwrite;


always @( enable_r_select
       or idle_latch
       or idle_r_select
       or enable_latch
       or cur_state[2:0])
begin
nxt_state[2:0] = IDLE;
case(cur_state[2:0])
  IDLE: 
  begin
    if(idle_latch) 
    begin
      nxt_state[2:0] = LATCH;
    end
    else if(idle_r_select)
    begin
      nxt_state[2:0] = R_SELECT;
    end
    else
    begin
      nxt_state[2:0] = IDLE;
    end
  end
  LATCH: 
  begin
    nxt_state[2:0] = W_SELECT;
  end
  W_SELECT: 
  begin
    nxt_state[2:0] = ENABLE;
  end
  R_SELECT: 
  begin
    nxt_state[2:0] = ENABLE;
  end
  ENABLE: 
  begin
    if(enable_latch) 
    begin
      nxt_state[2:0] = LATCH;
    end
    else if(enable_r_select)
    begin
      nxt_state[2:0] = R_SELECT;
    end
    else
    begin
      nxt_state[2:0] = IDLE;
    end
  end
endcase

end


always @(posedge hclk or negedge hrst_b)
begin
  if(!hrst_b) 
  begin
    haddr_latch[39:0]  <= 40'b0;
    hwrite_latch       <= 1'b0;
  end
  else if(nxt_state[2:0]==LATCH) 
  begin
    haddr_latch[39:0] <= harb_xx_haddr[39:0];
    hwrite_latch      <= harb_xx_hwrite;
  end
  else 
  begin
    haddr_latch[39:0] <= haddr_latch[39:0];
    hwrite_latch      <= hwrite_latch;
  end
end

always @(posedge hclk or negedge hrst_b)
begin
  if(!hrst_b) 
  begin
    apb_xx_paddr[39:0]  <= 40'b0;
    apb_xx_pwrite       <= 1'b0;
  end
  else if(nxt_state[2:0]==W_SELECT) 
  begin
    apb_xx_paddr[39:0]  <= haddr_latch[39:0];
    apb_xx_pwrite       <= hwrite_latch;
  end
  else if(nxt_state[2:0]==R_SELECT) 
  begin
    apb_xx_paddr[39:0]  <= harb_xx_haddr[39:0];
    apb_xx_pwrite       <= harb_xx_hwrite;
  end
  else 
  begin
    apb_xx_paddr[39:0]  <= apb_xx_paddr[39:0];
    apb_xx_pwrite       <= apb_xx_pwrite;
  end
end

always @(posedge hclk or negedge hrst_b)
begin
  if(!hrst_b) 
  begin
    apb_xx_pwdata[31:0] <= 32'b0;
  end
  else if(nxt_state[2:0]==W_SELECT) 
  begin
    apb_xx_pwdata[31:0] <= harb_xx_hwdata[31:0];
  end
  else 
  begin
    apb_xx_pwdata[31:0] <= apb_xx_pwdata[31:0];
  end
end

always @(posedge hclk or negedge hrst_b)
begin
  if(!hrst_b)
  begin
    apb_xx_psel <= 1'b0;
  end
  else if(nxt_state[2:0]==W_SELECT)
  begin
    apb_xx_psel <= 1'b1;
  end
  else if(nxt_state[2:0]==R_SELECT)
  begin
    apb_xx_psel <= 1'b1;
  end
  else if(nxt_state[2:0]==ENABLE)
  begin
    apb_xx_psel <= 1'b1;
  end
  else
  begin
    apb_xx_psel <= 1'b0;
  end
end

always @(posedge hclk or negedge hrst_b)
begin
  if(!hrst_b)
  begin
    apb_xx_penable <= 1'b0;
  end
  else if(nxt_state[2:0]==ENABLE)
  begin
    apb_xx_penable <= 1'b1;
  end
  else
  begin
    apb_xx_penable <= 1'b0;
  end
end

always @(posedge hclk or negedge hrst_b)
begin
  if(!hrst_b)
  begin
    apb_harb_hready <= 1'b1;
  end
  else if(nxt_state[2:0]==LATCH)
  begin
    apb_harb_hready <= 1'b0;
  end
  else if(nxt_state[2:0]==W_SELECT)
  begin
    apb_harb_hready <= 1'b0;
  end
  else if(nxt_state[2:0]==R_SELECT)
  begin
    apb_harb_hready <= 1'b0;
  end
  else
  begin
    apb_harb_hready <= 1'b1;
  end
end


assign psel_s1 = apb_xx_psel && (apb_xx_paddr>=`PS1_BASE_START) && (apb_xx_paddr<=`PS1_BASE_END);
assign psel_s2 = apb_xx_psel && (apb_xx_paddr>=`PS2_BASE_START) && (apb_xx_paddr<=`PS2_BASE_END);
assign psel_s3 = apb_xx_psel && (apb_xx_paddr>=`PS3_BASE_START) && (apb_xx_paddr<=`PS3_BASE_END);
assign psel_s4 = apb_xx_psel && (apb_xx_paddr>=`PS4_BASE_START) && (apb_xx_paddr<=`PS4_BASE_END);
assign psel_s5 = apb_xx_psel && (apb_xx_paddr>=`PS5_BASE_START) && (apb_xx_paddr<=`PS5_BASE_END);
assign psel_s6 = apb_xx_psel && (apb_xx_paddr>=`PS6_BASE_START) && (apb_xx_paddr<=`PS6_BASE_END);
assign psel_s7 = apb_xx_psel && (apb_xx_paddr>=`PS7_BASE_START) && (apb_xx_paddr<=`PS7_BASE_END);
assign psel_s8 = apb_xx_psel && (apb_xx_paddr>=`PS8_BASE_START) && (apb_xx_paddr<=`PS8_BASE_END);















assign busy_s1 = apb_xx_penable && psel_s1;
assign busy_s2 = apb_xx_penable && psel_s2;
assign busy_s3 = apb_xx_penable && psel_s3;
assign busy_s4 = apb_xx_penable && psel_s4;
assign busy_s5 = apb_xx_penable && psel_s5;
assign busy_s6 = apb_xx_penable && psel_s6;
assign busy_s7 = apb_xx_penable && psel_s7;
assign busy_s8 = apb_xx_penable && psel_s8;


always @( busy_s3
       or busy_s4
       or busy_s7
       or busy_s2
       or prdata_s5[31:0]
       or busy_s6
       or prdata_s6[31:0]
       or busy_s5
       or busy_s1
       or prdata_s1[31:0]
       or busy_s8
       or prdata_s4[31:0]
       or prdata_s2[31:0]
       or prdata_s3[31:0]
       or prdata_s7[31:0])
begin
case({busy_s1,busy_s2,busy_s3,busy_s4,busy_s5,busy_s6,busy_s7,busy_s8})
  8'b10000000:
  begin
    apb_harb_hrdata[31:0] = prdata_s1[31:0] ;
  end
  8'b01000000:
  begin
    apb_harb_hrdata[31:0]  = prdata_s2[31:0] ;
  end
  8'b00100000:
  begin
    apb_harb_hrdata[31:0]  = prdata_s3[31:0] ;
  end
  8'b00010000:
  begin
    apb_harb_hrdata[31:0]  = prdata_s4[31:0] ;
  end
  8'b00001000:
  begin
    apb_harb_hrdata[31:0]  = prdata_s5[31:0] ;
  end
  8'b00000100:
  begin
    apb_harb_hrdata[31:0]  = prdata_s6[31:0];
  end
  8'b00000010:
  begin
    apb_harb_hrdata[31:0]  = prdata_s7[31:0] ;
  end
  8'b00000001:
  begin
    apb_harb_hrdata[31:0]  = 32'h0 ;
  end
  default:
  begin
    apb_harb_hrdata[31:0]  = 32'b0;
  end
endcase

end


endmodule




