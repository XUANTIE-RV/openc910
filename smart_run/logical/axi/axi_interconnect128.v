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























module axi_interconnect128(
  aclk,
  araddr,
  aresetn,
  arready,
  arready_s0,
  arready_s1,
  arready_s2,
  arready_s3,
  arvalid,
  arvalid_s0,
  arvalid_s1,
  arvalid_s2,
  arvalid_s3,
  awaddr,
  awid,
  awready,
  awready_s0,
  awready_s1,
  awready_s2,
  awready_s3,
  awvalid,
  awvalid_s0,
  awvalid_s1,
  awvalid_s2,
  awvalid_s3,
  bid,
  bid_s0,
  bid_s1,
  bid_s2,
  bid_s3,
  bready,
  bready_s0,
  bready_s1,
  bready_s2,
  bready_s3,
  bresp,
  bresp_s0,
  bresp_s1,
  bresp_s2,
  bresp_s3,
  bvalid,
  bvalid_s0,
  bvalid_s1,
  bvalid_s2,
  bvalid_s3,
  rdata,
  rdata_s0,
  rdata_s1,
  rdata_s2,
  rdata_s3,
  rid,
  rid_s0,
  rid_s1,
  rid_s2,
  rid_s3,
  rlast,
  rlast_s0,
  rlast_s1,
  rlast_s2,
  rlast_s3,
  rready,
  rready_s0,
  rready_s1,
  rready_s2,
  rready_s3,
  rresp,
  rresp_s0,
  rresp_s1,
  rresp_s2,
  rresp_s3,
  rvalid,
  rvalid_s0,
  rvalid_s1,
  rvalid_s2,
  rvalid_s3,
  wid,
  wlast,
  wready,
  wready_s0,
  wready_s1,
  wready_s2,
  wready_s3,
  wvalid,
  wvalid_s0,
  wvalid_s1,
  wvalid_s2,
  wvalid_s3
);


input            aclk;             
input   [39 :0]  araddr;           
input            aresetn;          
input            arready_s0;       
input            arready_s1;       
input            arready_s2;       
input            arready_s3;       
input            arvalid;          
input   [39 :0]  awaddr;           
input   [7  :0]  awid;             
input            awready_s0;       
input            awready_s1;       
input            awready_s2;       
input            awready_s3;       
input            awvalid;          
input   [7  :0]  bid_s0;           
input   [7  :0]  bid_s1;           
input   [7  :0]  bid_s2;           
input   [7  :0]  bid_s3;           
input            bready;           
input   [1  :0]  bresp_s0;         
input   [1  :0]  bresp_s1;         
input   [1  :0]  bresp_s2;         
input   [1  :0]  bresp_s3;         
input            bvalid_s0;        
input            bvalid_s1;        
input            bvalid_s2;        
input            bvalid_s3;        
input   [127:0]  rdata_s0;         
input   [127:0]  rdata_s1;         
input   [127:0]  rdata_s2;         
input   [127:0]  rdata_s3;         
input   [7  :0]  rid_s0;           
input   [7  :0]  rid_s1;           
input   [7  :0]  rid_s2;           
input   [7  :0]  rid_s3;           
input            rlast_s0;         
input            rlast_s1;         
input            rlast_s2;         
input            rlast_s3;         
input            rready;           
input   [1  :0]  rresp_s0;         
input   [1  :0]  rresp_s1;         
input   [1  :0]  rresp_s2;         
input   [1  :0]  rresp_s3;         
input            rvalid_s0;        
input            rvalid_s1;        
input            rvalid_s2;        
input            rvalid_s3;        
input   [7  :0]  wid;              
input            wlast;            
input            wready_s0;        
input            wready_s1;        
input            wready_s2;        
input            wready_s3;        
input            wvalid;           
output           arready;          
output           arvalid_s0;       
output           arvalid_s1;       
output           arvalid_s2;       
output           arvalid_s3;       
output           awready;          
output           awvalid_s0;       
output           awvalid_s1;       
output           awvalid_s2;       
output           awvalid_s3;       
output  [7  :0]  bid;              
output           bready_s0;        
output           bready_s1;        
output           bready_s2;        
output           bready_s3;        
output  [1  :0]  bresp;            
output           bvalid;           
output  [127:0]  rdata;            
output  [7  :0]  rid;              
output           rlast;            
output           rready_s0;        
output           rready_s1;        
output           rready_s2;        
output           rready_s3;        
output  [1  :0]  rresp;            
output           rvalid;           
output           wready;           
output           wvalid_s0;        
output           wvalid_s1;        
output           wvalid_s2;        
output           wvalid_s3;        


reg              arready;          
reg     [39 :0]  awaddr_sel_store0; 
reg     [39 :0]  awaddr_sel_store1; 
reg     [39 :0]  awaddr_sel_store2; 
reg     [39 :0]  awaddr_sel_store3; 
reg     [39 :0]  awaddr_store;     
reg     [7  :0]  awid_sel_store0;  
reg     [7  :0]  awid_sel_store1;  
reg     [7  :0]  awid_sel_store2;  
reg     [7  :0]  awid_sel_store3;  
reg              awready;          
reg     [7  :0]  bid;              
reg     [1  :0]  bresp;            
reg              bvalid;           
reg     [127:0]  rdata;            
reg              read_done0;       
reg              read_done1;       
reg              read_done2;       
reg              read_done3;       
reg     [7  :0]  rid;              
reg              rlast;            
reg     [1  :0]  rresp;            
reg              rvalid;           
reg              wready;           


wire             aclk;             
wire    [39 :0]  araddr;           
wire             aresetn;          
wire             arready_s0;       
wire             arready_s1;       
wire             arready_s2;       
wire             arready_s3;       
wire             arsel0;           
wire             arsel1;           
wire             arsel2;           
wire             arsel3;           
wire             arvalid;          
wire             arvalid_s0;       
wire             arvalid_s1;       
wire             arvalid_s2;       
wire             arvalid_s3;       
wire    [39 :0]  awaddr;           
wire    [7  :0]  awid;             
wire             awready_s0;       
wire             awready_s1;       
wire             awready_s2;       
wire             awready_s3;       
wire             awsel0;           
wire             awsel1;           
wire             awsel2;           
wire             awsel3;           
wire             awvalid;          
wire             awvalid_s0;       
wire             awvalid_s1;       
wire             awvalid_s2;       
wire             awvalid_s3;       
wire    [7  :0]  bid_s0;           
wire    [7  :0]  bid_s1;           
wire    [7  :0]  bid_s2;           
wire    [7  :0]  bid_s3;           
wire             bready;           
wire             bready_s0;        
wire             bready_s1;        
wire             bready_s2;        
wire             bready_s3;        
wire    [1  :0]  bresp_s0;         
wire    [1  :0]  bresp_s1;         
wire    [1  :0]  bresp_s2;         
wire    [1  :0]  bresp_s3;         
wire             bsel0;            
wire             bsel1;            
wire             bsel2;            
wire             bsel3;            
wire             bvalid_s0;        
wire             bvalid_s1;        
wire             bvalid_s2;        
wire             bvalid_s3;        
wire             clr_store0;       
wire             clr_store1;       
wire             clr_store2;       
wire             clr_store3;       
wire    [127:0]  rdata_s0;         
wire    [127:0]  rdata_s1;         
wire    [127:0]  rdata_s2;         
wire    [127:0]  rdata_s3;         
wire    [7  :0]  rid_s0;           
wire    [7  :0]  rid_s1;           
wire    [7  :0]  rid_s2;           
wire    [7  :0]  rid_s3;           
wire             rlast_s0;         
wire             rlast_s1;         
wire             rlast_s2;         
wire             rlast_s3;         
wire             rready;           
wire             rready_s0;        
wire             rready_s1;        
wire             rready_s2;        
wire             rready_s3;        
wire    [1  :0]  rresp_s0;         
wire    [1  :0]  rresp_s1;         
wire    [1  :0]  rresp_s2;         
wire    [1  :0]  rresp_s3;         
wire             rsel0;            
wire             rsel1;            
wire             rsel2;            
wire             rsel3;            
wire             rvalid_s0;        
wire             rvalid_s1;        
wire             rvalid_s2;        
wire             rvalid_s3;        
wire    [7  :0]  wid;              
wire             wlast;            
wire             wready_s0;        
wire             wready_s1;        
wire             wready_s2;        
wire             wready_s3;        
wire             wsel0;            
wire             wsel1;            
wire             wsel2;            
wire             wsel3;            
wire             wvalid;           
wire             wvalid_s0;        
wire             wvalid_s1;        
wire             wvalid_s2;        
wire             wvalid_s3;        














  parameter SRAM_START = 40'h0000_0000;
//  parameter SRAM_END   = 40'h000fffff;
  parameter SRAM_END   = 40'h01ff_ffff;

  parameter ERR1_START = 40'h0200_0000;
  parameter ERR1_END   = 40'h0fff_ffff;

  parameter APB_START  = 40'h10000000;
  parameter APB_END    = 40'h1fffffff;

  parameter ERR2_START = 40'h20000000;
  parameter ERR2_END   = 40'hff_ffffffff;



  assign awsel0 = (awaddr>=SRAM_START) && (awaddr<=SRAM_END);
  assign awsel1 = (awaddr>=ERR1_START) && (awaddr<=ERR1_END);
  assign awsel2 = (awaddr>=APB_START)  && (awaddr<=APB_END);
  assign awsel3 = (awaddr>=ERR2_START) && (awaddr<=ERR2_END);





  
  assign awvalid_s0 = awsel0 & awvalid;
  assign awvalid_s1 = awsel1 & awvalid;
  assign awvalid_s2 = awsel2 & awvalid;
  assign awvalid_s3 = awsel3 & awvalid;


always @( awsel0
       or awsel3
       or awready_s0
       or awready_s2
       or awsel1
       or awsel2
       or awready_s1
       or awready_s3)
begin
      case({awsel3,awsel2,awsel1,awsel0})
        4'b0001: awready = awready_s0;
        4'b0010: awready = awready_s1;
        4'b0100: awready = awready_s2;
        4'b1000: awready = awready_s3;
        default:  awready = 1'b0;
      endcase

end





  assign clr_store0 = wsel0 & wvalid & wready & wlast;
  assign clr_store1 = wsel1 & wvalid & wready & wlast;
  assign clr_store2 = wsel2 & wvalid & wready & wlast;
  assign clr_store3 = wsel3 & wvalid & wready & wlast;

  always @(posedge aclk or negedge aresetn)
  begin
    if(!aresetn) begin
        awaddr_sel_store0 <= 40'b0;
        awid_sel_store0 <= 8'b0;
    end
    else if(awvalid && awready && awsel0) begin
                awaddr_sel_store0[39:0] <= awaddr[39:0];
                awid_sel_store0[7:0] <= awid[7:0];
    end
    else if(clr_store0) begin
            awaddr_sel_store0[39:0] <= 40'b0;
            awid_sel_store0[7:0] <= 8'b0;
    end
  end

  always @(posedge aclk or negedge aresetn)
  begin
    if(!aresetn) begin
        awaddr_sel_store1 <= 40'b0;
        awid_sel_store1 <= 8'b0;
    end
    else if(awvalid && awready && awsel1) begin
                awaddr_sel_store1[39:0] <= awaddr[39:0];
                awid_sel_store1[7:0] <= awid[7:0];
    end
    else if(clr_store1) begin
            awaddr_sel_store1[39:0] <= 40'b0;
            awid_sel_store1[7:0] <= 8'b0;
    end
  end

  always @(posedge aclk or negedge aresetn)
  begin
    if(!aresetn) begin
        awaddr_sel_store2 <= 40'b0;
        awid_sel_store2 <= 8'b0;
    end
    else if(awvalid && awready && awsel2) begin
                awaddr_sel_store2[39:0] <= awaddr[39:0];
                awid_sel_store2[7:0] <= awid[7:0];
    end
    else if(clr_store2) begin
            awaddr_sel_store2[39:0] <= 40'b0;
            awid_sel_store2[7:0] <= 8'b0;
    end
  end

  always @(posedge aclk or negedge aresetn)
  begin
    if(!aresetn) begin
        awaddr_sel_store3 <= 40'b0;
        awid_sel_store3 <= 8'b0;
    end
    else if(awvalid && awready && awsel3) begin
                awaddr_sel_store3[39:0] <= awaddr[39:0];
                awid_sel_store3[7:0] <= awid[7:0];
    end
    else if(clr_store3) begin
            awaddr_sel_store3[39:0] <= 40'b0;
            awid_sel_store3[7:0] <= 8'b0;
    end
  end


  always @(*)
  begin
  if(wid[7:0] == 8'h0)
    awaddr_store[39:0] = 40'h0;
  else if(wid[7:0] == awid_sel_store0[7:0])
    awaddr_store[39:0] = awaddr_sel_store0[39:0];
  else if(wid[7:0] == awid_sel_store1[7:0])
    awaddr_store[39:0] = awaddr_sel_store1[39:0];
  else if(wid[7:0] == awid_sel_store2[7:0])
    awaddr_store[39:0] = awaddr_sel_store2[39:0];
  else if(wid[7:0] == awid_sel_store3[7:0])
    awaddr_store[39:0] = awaddr_sel_store3[39:0];
  else
    awaddr_store[39:0] = 40'h0;
  end

  assign wsel0 = (awaddr_store>=SRAM_START) && (awaddr_store<=SRAM_END);
  assign wsel1 = (awaddr_store>=ERR1_START) && (awaddr_store<=ERR1_END);
  assign wsel2 = (awaddr_store>=APB_START)  && (awaddr_store<=APB_END);
  assign wsel3 = (awaddr_store>=ERR2_START) && (awaddr_store<=ERR2_END);





  
  assign wvalid_s0 = wsel0 & wvalid;
  assign wvalid_s1 = wsel1 & wvalid;
  assign wvalid_s2 = wsel2 & wvalid;
  assign wvalid_s3 = wsel3 & wvalid;


always @( wready_s0
       or wsel3
       or wready_s3
       or wready_s1
       or wready_s2
       or wsel0
       or wsel2
       or wsel1)
begin
      case({wsel3,wsel2,wsel1,wsel0})
        4'b0001: wready = wready_s0;
        4'b0010: wready = wready_s1;
        4'b0100: wready = wready_s2;
        4'b1000: wready = wready_s3;
        default: wready = 1'b0;
      endcase

end



  assign bsel0 = bvalid_s0;
  assign bsel1 = (!bvalid_s0) & bvalid_s1;
  assign bsel2 = (!bvalid_s0) & (!bvalid_s1) & bvalid_s2;
  assign bsel3 = (!bvalid_s0) & (!bvalid_s1) & (!bvalid_s2) & bvalid_s3;

  assign bready_s0 = bsel0 & bready;
  assign bready_s1 = bsel1 & bready;
  assign bready_s2 = bsel2 & bready;
  assign bready_s3 = bsel3 & bready;


always @( bresp_s0[1:0]
       or bresp_s3[1:0]
       or bsel1
       or bsel0
       or bid_s2[7:0]
       or bid_s1[7:0]
       or bvalid_s1
       or bvalid_s3
       or bid_s3[7:0]
       or bsel2
       or bvalid_s2
       or bresp_s1[1:0]
       or bvalid_s0
       or bid_s0[7:0]
       or bsel3
       or bresp_s2[1:0])
begin
      case({bsel3,bsel2,bsel1,bsel0})
        4'b0001: begin
                    bvalid = bvalid_s0;
                    bid[7:0] = bid_s0[7:0];
                    bresp[1:0] = bresp_s0[1:0];
                  end 
        4'b0010: begin
                    bvalid = bvalid_s1;
                    bid[7:0] = bid_s1[7:0];
                    bresp[1:0] = bresp_s1[1:0];
                  end
        4'b0100: begin
                    bvalid = bvalid_s2;
                    bid[7:0] = bid_s2[7:0];
                    bresp[1:0] = bresp_s2[1:0];
                  end
        4'b1000: begin
                    bvalid = bvalid_s3;
                    bid[7:0] = bid_s3[7:0];
                    bresp[1:0] = bresp_s3[1:0];
                  end
        default:  begin
                    bvalid = 1'b0;
                    bid[7:0] = 8'b0;
                    bresp[1:0] = 2'b0;
                  end
      endcase

end






  assign arsel0 = (araddr>=SRAM_START) && (araddr<=SRAM_END);
  assign arsel1 = (araddr>=ERR1_START) && (araddr<=ERR1_END);
  assign arsel2 = (araddr>=APB_START)  && (araddr<=APB_END);
  assign arsel3 = (araddr>=ERR2_START) && (araddr<=ERR2_END);





  
  assign arvalid_s0 = arsel0 & arvalid;
  assign arvalid_s1 = arsel1 & arvalid;
  assign arvalid_s2 = arsel2 & arvalid;
  assign arvalid_s3 = arsel3 & arvalid;


always @( arready_s2
       or arready_s1
       or arsel1
       or arsel0
       or arsel3
       or arsel2
       or arready_s0
       or arready_s3)
begin
      case({arsel3,arsel2,arsel1,arsel0})
        4'b0001: arready = arready_s0;
        4'b0010: arready = arready_s1;
        4'b0100: arready = arready_s2;
        4'b1000: arready = arready_s3;
        default: arready = 1'b0;
      endcase

end




  always @(posedge aclk or negedge aresetn)
  begin
    if(!aresetn)
        read_done0 <= 1'b0;
    else if(rvalid_s0 && rready && rlast_s0)
        read_done0 <= 1'b0;
    else if(rvalid_s0 && (!read_done1) && (!read_done2) && (!read_done3))
        read_done0 <= 1'b1;
  end

  assign rsel0 = (!read_done1)&&(!read_done2)&&(!read_done3)&&rvalid_s0;
  
  always @(posedge aclk or negedge aresetn)
  begin
    if(!aresetn)
        read_done1 <= 1'b0;
    else if(rvalid_s1 && rready && rlast_s1)
        read_done1 <= 1'b0;
    else if(rvalid_s1 && (!rvalid_s0) && (!read_done0) &&
            (!read_done2) && (!read_done3))
        read_done1 <= 1'b1;
  end

  assign rsel1 = (!read_done0)&&(!read_done2)&&(!read_done3)&&rvalid_s1
                 &&((!rvalid_s0) || read_done1);
  
  always @(posedge aclk or negedge aresetn)
  begin
    if(!aresetn)
        read_done2 <= 1'b0;
    else if(rvalid_s2 && rready && rlast_s2)
        read_done2 <= 1'b0;
    else if(rvalid_s2 && (!rvalid_s0) && (!rvalid_s1) 
           && (!read_done0) && (!read_done1) && (!read_done3))
        read_done2 <= 1'b1;
  end

  assign rsel2 = (!read_done1)&&(!read_done0)&&(!read_done3)&&rvalid_s2
                 &&((!rvalid_s0)&&(!rvalid_s1) || read_done2);
  
  always @(posedge aclk or negedge aresetn)
  begin
    if(!aresetn)
        read_done3 <= 1'b0;
    else if(rvalid_s3 && rready && rlast_s3)
        read_done3 <= 1'b0;
    else if(rvalid_s3 && (!rvalid_s0) && (!rvalid_s1) && (!rvalid_s2)
           && (!read_done0) && (!read_done1) && (!read_done2))
        read_done3 <= 1'b1;
  end

  assign rsel3 = (!read_done1)&&(!read_done0)&&(!read_done2)&&rvalid_s3
                 &&((!rvalid_s0)&&(!rvalid_s1)&&(!rvalid_s2) || read_done3);
  
  assign rready_s0 = rsel0 & rready;
  assign rready_s1 = rsel1 & rready;
  assign rready_s2 = rsel2 & rready;
  assign rready_s3 = rsel3 & rready;


always @( rvalid_s0
       or rid_s1[7:0]
       or rsel2
       or rvalid_s3
       or rdata_s0[127:0]
       or rid_s2[7:0]
       or rid_s0[7:0]
       or rlast_s2
       or rresp_s2[1:0]
       or rresp_s0[1:0]
       or rresp_s1[1:0]
       or rlast_s1
       or rid_s3[7:0]
       or rdata_s2[127:0]
       or rsel3
       or rdata_s3[127:0]
       or rvalid_s2
       or rresp_s3[1:0]
       or rlast_s0
       or rdata_s1[127:0]
       or rsel0
       or rsel1
       or rlast_s3
       or rvalid_s1)
begin
      case({rsel3,rsel2,rsel1,rsel0})
        4'b0001: begin
                    rvalid = rvalid_s0;
                    rid[7:0] = rid_s0[7:0];
                    rdata[127:0] = rdata_s0[127:0];
                    rresp[1:0] = rresp_s0[1:0];
                    rlast = rlast_s0;
                  end 
        4'b0010: begin
                    rvalid = rvalid_s1;
                    rid[7:0] = rid_s1[7:0];
                    rdata[127:0] = rdata_s1[127:0];
                    rresp[1:0] = rresp_s1[1:0];
                    rlast = rlast_s1;
                  end 
        4'b0100: begin
                    rvalid = rvalid_s2;
                    rid[7:0] = rid_s2[7:0];
                    rdata[127:0] = rdata_s2[127:0];
                    rresp[1:0] = rresp_s2[1:0];
                    rlast = rlast_s2;
                  end 
        4'b1000: begin
                    rvalid = rvalid_s3;
                    rid[7:0] = rid_s3[7:0];
                    rdata[127:0] = rdata_s3[127:0];
                    rresp[1:0] = rresp_s3[1:0];
                    rlast = rlast_s3;
                  end 
        default:  begin
                    rvalid = 1'b0;
                    rid[7:0] = 8'b0;
                    rdata[127:0] = 128'b0;
                    rresp[1:0] = 2'b0;
                    rlast = 1'b0;
                  end 
      endcase

end






endmodule


