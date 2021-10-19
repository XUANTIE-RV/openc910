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



















module ahb2apb(
  apb_haddr,
  apb_hburst,
  apb_hrdata,
  apb_hready,
  apb_hresp,
  apb_hsel,
  apb_hsize,
  apb_htrans,
  apb_hwdata,
  apb_hwrite,
  haddr_s2,
  hburst_s2,
  hmastlock,
  hprot_s2,
  hrdata_s2,
  hready_s2,
  hresp_s2,
  hsel_s2,
  hsize_s2,
  htrans_s2,
  hwdata_s2,
  hwrite_s2,
  pad_cpu_rst_b,
  pll_core_cpuclk
);


input   [31 :0]  apb_hrdata;     
input            apb_hready;     
input   [1  :0]  apb_hresp;      
input   [39 :0]  haddr_s2;       
input   [2  :0]  hburst_s2;      
input            hmastlock;      
input   [3  :0]  hprot_s2;       
input            hsel_s2;        
input   [2  :0]  hsize_s2;       
input   [1  :0]  htrans_s2;      
input   [127:0]  hwdata_s2;      
input            hwrite_s2;      
input            pad_cpu_rst_b;  
input            pll_core_cpuclk; 
output  [39 :0]  apb_haddr;      
output  [2  :0]  apb_hburst;     
output           apb_hsel;       
output  [2  :0]  apb_hsize;      
output  [1  :0]  apb_htrans;     
output  [31 :0]  apb_hwdata;     
output           apb_hwrite;     
output  [127:0]  hrdata_s2;      
output           hready_s2;      
output  [1  :0]  hresp_s2;       


reg     [31 :0]  apb_hwdata;     
reg     [127:0]  hrdata_s2;      
reg     [39 :0]  latch_haddr;    


wire    [39 :0]  apb_haddr;      
wire    [2  :0]  apb_hburst;     
wire    [31 :0]  apb_hrdata;     
wire             apb_hready;     
wire    [1  :0]  apb_hresp;      
wire             apb_hsel;       
wire    [2  :0]  apb_hsize;      
wire    [1  :0]  apb_htrans;     
wire             apb_hwrite;     
wire    [39 :0]  haddr_s2;       
wire    [2  :0]  hburst_s2;      
wire             hready_s2;      
wire    [1  :0]  hresp_s2;       
wire             hsel_s2;        
wire    [2  :0]  hsize_s2;       
wire    [1  :0]  htrans_s2;      
wire    [127:0]  hwdata_s2;      
wire             hwrite_s2;      
wire             pad_cpu_rst_b;  
wire             pll_core_cpuclk; 












assign  hready_s2     = apb_hready;
assign  hresp_s2[1:0] = apb_hresp[1:0];
assign  apb_hsel      = hsel_s2;
assign  apb_haddr[39:0]  = haddr_s2[39:0];
assign  apb_hburst[2:0]  = hburst_s2[2:0];
assign  apb_hsize[2:0]   = hsize_s2[2:0];
assign  apb_htrans[1:0]  = htrans_s2[1:0];
assign  apb_hwrite       = hwrite_s2;


always @(posedge pll_core_cpuclk or negedge pad_cpu_rst_b )
begin
  if(!pad_cpu_rst_b)
  begin
    latch_haddr[39:0] <= 40'b0;
  end
  else if(apb_hready) 
  begin
    latch_haddr[39:0] <= haddr_s2[39:0];
  end
  else 
  begin
    latch_haddr[39:0] <= latch_haddr[39:0];
  end
end


always @( hwdata_s2[63:0]
       or hwdata_s2[127:64]
       or latch_haddr[3:2])
begin
case(latch_haddr[3:2])
  2'b00: 
  begin
    apb_hwdata[31:0] = hwdata_s2[ 31: 0];
  end
  2'b01: 
  begin
    apb_hwdata[31:0] = hwdata_s2[ 63:32];
  end
  2'b10: 
  begin
    apb_hwdata[31:0] = hwdata_s2[ 95:64];
  end
  2'b11: 
  begin
    apb_hwdata[31:0] = hwdata_s2[127:96];
  end
  default: 
  begin
    apb_hwdata[31:0] = 32'bx;
  end
endcase

end


always @( latch_haddr[3:2]
       or apb_hrdata[31:0])
begin
case(latch_haddr[3:2])
  2'b00: 
  begin
    hrdata_s2[127:0] = {96'b0,apb_hrdata[31:0]};
  end
  2'b01: 
  begin
    hrdata_s2[127:0] = {64'b0,apb_hrdata[31:0],32'b0};
  end
  2'b10: 
  begin
    hrdata_s2[127:0] = {32'b0,apb_hrdata[31:0],64'b0};
  end
  2'b11: 
  begin
    hrdata_s2[127:0] = {      apb_hrdata[31:0],96'b0};
  end
  default: 
  begin
    hrdata_s2[127:0] = 128'bx;
  end
endcase

end


















endmodule



