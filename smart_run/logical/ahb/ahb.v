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






















`define S1_BASE_START 32'h1f000000
`define S1_BASE_END   32'h1f01ffff

`define S2_BASE_START 32'h10000000
`define S2_BASE_END   32'h1effffff




module ahb(
  biu_pad_haddr,
  biu_pad_hburst,
  biu_pad_hbusreq,
  biu_pad_hlock,
  biu_pad_hprot,
  biu_pad_hsize,
  biu_pad_htrans,
  biu_pad_hwdata,
  biu_pad_hwrite,
  haddr_s1,
  haddr_s2,
  haddr_s3,
  hburst_s1,
  hburst_s2,
  hburst_s3,
  hmastlock,
  hprot_s1,
  hprot_s2,
  hprot_s3,
  hrdata_s1,
  hrdata_s2,
  hrdata_s3,
  hready_s1,
  hready_s2,
  hready_s3,
  hresp_s1,
  hresp_s2,
  hresp_s3,
  hsel_s1,
  hsel_s2,
  hsel_s3,
  hsize_s1,
  hsize_s2,
  hsize_s3,
  htrans_s1,
  htrans_s2,
  htrans_s3,
  hwdata_s1,
  hwdata_s2,
  hwdata_s3,
  hwrite_s1,
  hwrite_s2,
  hwrite_s3,
  pad_biu_hgrant,
  pad_biu_hrdata,
  pad_biu_hready,
  pad_biu_hresp,
  pad_cpu_rst_b,
  pll_core_cpuclk
);


input   [39 :0]  biu_pad_haddr;  
input   [2  :0]  biu_pad_hburst; 
input            biu_pad_hbusreq; 
input            biu_pad_hlock;  
input   [3  :0]  biu_pad_hprot;  
input   [2  :0]  biu_pad_hsize;  
input   [1  :0]  biu_pad_htrans; 
input   [127:0]  biu_pad_hwdata; 
input            biu_pad_hwrite; 
input   [127:0]  hrdata_s1;      
input   [127:0]  hrdata_s2;      
input   [127:0]  hrdata_s3;      
input            hready_s1;      
input            hready_s2;      
input            hready_s3;      
input   [1  :0]  hresp_s1;       
input   [1  :0]  hresp_s2;       
input   [1  :0]  hresp_s3;       
input            pad_cpu_rst_b;  
input            pll_core_cpuclk; 
output  [39 :0]  haddr_s1;       
output  [39 :0]  haddr_s2;       
output  [39 :0]  haddr_s3;       
output  [2  :0]  hburst_s1;      
output  [2  :0]  hburst_s2;      
output  [2  :0]  hburst_s3;      
output           hmastlock;      
output  [3  :0]  hprot_s1;       
output  [3  :0]  hprot_s2;       
output  [3  :0]  hprot_s3;       
output           hsel_s1;        
output           hsel_s2;        
output           hsel_s3;        
output  [2  :0]  hsize_s1;       
output  [2  :0]  hsize_s2;       
output  [2  :0]  hsize_s3;       
output  [1  :0]  htrans_s1;      
output  [1  :0]  htrans_s2;      
output  [1  :0]  htrans_s3;      
output  [127:0]  hwdata_s1;      
output  [127:0]  hwdata_s2;      
output  [127:0]  hwdata_s3;      
output           hwrite_s1;      
output           hwrite_s2;      
output           hwrite_s3;      
output           pad_biu_hgrant; 
output  [127:0]  pad_biu_hrdata; 
output           pad_biu_hready; 
output  [1  :0]  pad_biu_hresp;  


reg              busy_s1;        
reg              busy_s2;        
reg              busy_s3;        
reg     [127:0]  pad_biu_hrdata; 
reg              pad_biu_hready; 
reg     [1  :0]  pad_biu_hresp;  


wire             arb_block;      
wire    [39 :0]  biu_pad_haddr;  
wire    [2  :0]  biu_pad_hburst; 
wire             biu_pad_hlock;  
wire    [3  :0]  biu_pad_hprot;  
wire    [2  :0]  biu_pad_hsize;  
wire    [1  :0]  biu_pad_htrans; 
wire    [127:0]  biu_pad_hwdata; 
wire             biu_pad_hwrite; 
wire    [39 :0]  haddr_s1;       
wire    [39 :0]  haddr_s2;       
wire    [39 :0]  haddr_s3;       
wire    [2  :0]  hburst_s1;      
wire    [2  :0]  hburst_s2;      
wire    [2  :0]  hburst_s3;      
wire             hmastlock;      
wire    [3  :0]  hprot_s1;       
wire    [3  :0]  hprot_s2;       
wire    [3  :0]  hprot_s3;       
wire    [127:0]  hrdata_s1;      
wire    [127:0]  hrdata_s2;      
wire    [127:0]  hrdata_s3;      
wire             hready_s1;      
wire             hready_s2;      
wire             hready_s3;      
wire    [1  :0]  hresp_s1;       
wire    [1  :0]  hresp_s2;       
wire    [1  :0]  hresp_s3;       
wire             hsel_s1;        
wire             hsel_s2;        
wire             hsel_s3;        
wire    [2  :0]  hsize_s1;       
wire    [2  :0]  hsize_s2;       
wire    [2  :0]  hsize_s3;       
wire    [1  :0]  htrans_s1;      
wire    [1  :0]  htrans_s2;      
wire    [1  :0]  htrans_s3;      
wire    [127:0]  hwdata_s1;      
wire    [127:0]  hwdata_s2;      
wire    [127:0]  hwdata_s3;      
wire             hwrite_s1;      
wire             hwrite_s2;      
wire             hwrite_s3;      
wire             pad_biu_hgrant; 
wire             pad_cpu_rst_b;  
wire             pll_core_cpuclk; 
wire             pre_busy_s1;    
wire             pre_busy_s2;    
wire             pre_busy_s3;    


assign    pad_biu_hgrant       =    1'b1;
assign    hmastlock            =    biu_pad_hlock; 
assign    haddr_s1[39:0]       =    biu_pad_haddr[39:0];  
assign    hburst_s1[2:0]       =    biu_pad_hburst[2:0]; 
assign    hprot_s1[3:0]        =    biu_pad_hprot[3:0];  
assign    hsize_s1[2:0]        =    biu_pad_hsize[2:0];  
assign    htrans_s1[1:0]       =    biu_pad_htrans[1:0]; 
assign    hwrite_s1            =    biu_pad_hwrite; 
assign    haddr_s2[39:0]       =    biu_pad_haddr[39:0];  
assign    hburst_s2[2:0]       =    biu_pad_hburst[2:0]; 
assign    hprot_s2[3:0]        =    biu_pad_hprot[3:0];  
assign    hsize_s2[2:0]        =    biu_pad_hsize[2:0];  
assign    htrans_s2[1:0]       =    biu_pad_htrans[1:0]; 
assign    hwrite_s2            =    biu_pad_hwrite; 
assign    haddr_s3[39:0]       =    biu_pad_haddr[39:0];  
assign    hburst_s3[2:0]       =    biu_pad_hburst[2:0]; 
assign    hprot_s3[3:0]        =    biu_pad_hprot[3:0];  
assign    hsize_s3[2:0]        =    biu_pad_hsize[2:0];  
assign    htrans_s3[1:0]       =    biu_pad_htrans[1:0]; 
assign    hwrite_s3            =    biu_pad_hwrite; 



assign    hwdata_s1[127:0]     =    biu_pad_hwdata[127:0]; 
assign    hwdata_s2[127:0]     =    biu_pad_hwdata[127:0]; 
assign    hwdata_s3[127:0]     =    biu_pad_hwdata[127:0]; 






assign    hsel_s1 = (biu_pad_htrans[1]==1'b1) && (biu_pad_haddr >= `S1_BASE_START) && (biu_pad_haddr <= `S1_BASE_END) && !arb_block;
assign    hsel_s2 = (biu_pad_htrans[1]==1'b1) && (biu_pad_haddr >= `S2_BASE_START) && (biu_pad_haddr <= `S2_BASE_END) && !arb_block;
assign    hsel_s3 = (biu_pad_htrans[1]==1'b1) && (!(hsel_s1 || hsel_s2)) && !arb_block;

assign    pre_busy_s1 = hsel_s1 || busy_s1 && !hready_s1;
assign    pre_busy_s2 = hsel_s2 || busy_s2 && !hready_s2;
assign    pre_busy_s3 = hsel_s3 || busy_s3 && !hready_s3;


always @(posedge pll_core_cpuclk or negedge pad_cpu_rst_b)
begin
  if(!pad_cpu_rst_b)begin
  busy_s1 <= 1'b0;
  busy_s2 <= 1'b0;
  busy_s3 <= 1'b0;
  end
  else begin
  busy_s1 <= pre_busy_s1;
  busy_s2 <= pre_busy_s2;
  busy_s3 <= pre_busy_s3;
  end
end

assign arb_block = busy_s1 && !hready_s1 ||
                   busy_s2 && !hready_s2 ||
                   busy_s3 && !hready_s3; 











always @( hresp_s3[1:0]
       or hresp_s1[1:0]
       or busy_s3
       or hrdata_s2[127:0]
       or hrdata_s1[127:0]
       or hready_s2
       or busy_s1
       or hrdata_s3[127:0]
       or hready_s3
       or hresp_s2[1:0]
       or busy_s2
       or hready_s1)
begin
  case({busy_s1,busy_s2,busy_s3})
    3'b100:
    begin
      pad_biu_hrdata[127:0] = hrdata_s1[127:0];
      pad_biu_hready        = hready_s1;
      pad_biu_hresp[1:0]    = hresp_s1[1:0];
    end
    3'b010:
    begin
      pad_biu_hrdata[127:0] = hrdata_s2[127:0];
      pad_biu_hready        = hready_s2;
      pad_biu_hresp[1:0]    = hresp_s2[1:0];
    end
    3'b001:
    begin 
      pad_biu_hrdata[127:0] = hrdata_s3[127:0];
      pad_biu_hready        = hready_s3;
      pad_biu_hresp[1:0]    = hresp_s3[1:0];
    end
    default:
    begin
      pad_biu_hrdata[127:0] = 128'b0;
      pad_biu_hready       = 1'b1;
      pad_biu_hresp[1:0]   = 2'b0;
    end
  endcase

end

endmodule


