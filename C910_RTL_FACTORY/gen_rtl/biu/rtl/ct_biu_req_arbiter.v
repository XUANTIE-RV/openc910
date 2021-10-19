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
module ct_biu_req_arbiter(
  araddr,
  arbar,
  arburst,
  arcache,
  ardomain,
  arid,
  arlen,
  arlock,
  arprot,
  arready,
  arsize,
  arsnoop,
  aruser,
  arvalid,
  arvalid_gate,
  biu_ifu_rd_grnt,
  biu_lsu_ar_ready,
  biu_lsu_aw_vb_grnt,
  biu_lsu_aw_wmb_grnt,
  biu_lsu_w_vb_grnt,
  biu_lsu_w_wmb_grnt,
  ifu_biu_rd_addr,
  ifu_biu_rd_burst,
  ifu_biu_rd_cache,
  ifu_biu_rd_domain,
  ifu_biu_rd_id,
  ifu_biu_rd_len,
  ifu_biu_rd_prot,
  ifu_biu_rd_req,
  ifu_biu_rd_req_gate,
  ifu_biu_rd_size,
  ifu_biu_rd_snoop,
  ifu_biu_rd_user,
  lsu_biu_ar_addr,
  lsu_biu_ar_bar,
  lsu_biu_ar_burst,
  lsu_biu_ar_cache,
  lsu_biu_ar_domain,
  lsu_biu_ar_dp_req,
  lsu_biu_ar_id,
  lsu_biu_ar_len,
  lsu_biu_ar_lock,
  lsu_biu_ar_prot,
  lsu_biu_ar_req,
  lsu_biu_ar_req_gate,
  lsu_biu_ar_size,
  lsu_biu_ar_snoop,
  lsu_biu_ar_user,
  lsu_biu_aw_req_gate,
  lsu_biu_aw_st_addr,
  lsu_biu_aw_st_bar,
  lsu_biu_aw_st_burst,
  lsu_biu_aw_st_cache,
  lsu_biu_aw_st_domain,
  lsu_biu_aw_st_dp_req,
  lsu_biu_aw_st_id,
  lsu_biu_aw_st_len,
  lsu_biu_aw_st_lock,
  lsu_biu_aw_st_prot,
  lsu_biu_aw_st_req,
  lsu_biu_aw_st_size,
  lsu_biu_aw_st_snoop,
  lsu_biu_aw_st_unique,
  lsu_biu_aw_st_user,
  lsu_biu_aw_vict_addr,
  lsu_biu_aw_vict_bar,
  lsu_biu_aw_vict_burst,
  lsu_biu_aw_vict_cache,
  lsu_biu_aw_vict_domain,
  lsu_biu_aw_vict_dp_req,
  lsu_biu_aw_vict_id,
  lsu_biu_aw_vict_len,
  lsu_biu_aw_vict_lock,
  lsu_biu_aw_vict_prot,
  lsu_biu_aw_vict_req,
  lsu_biu_aw_vict_size,
  lsu_biu_aw_vict_snoop,
  lsu_biu_aw_vict_unique,
  lsu_biu_aw_vict_user,
  lsu_biu_w_st_data,
  lsu_biu_w_st_last,
  lsu_biu_w_st_strb,
  lsu_biu_w_st_vld,
  lsu_biu_w_st_wns,
  lsu_biu_w_vict_data,
  lsu_biu_w_vict_last,
  lsu_biu_w_vict_strb,
  lsu_biu_w_vict_vld,
  lsu_biu_w_vict_wns,
  st_awaddr,
  st_awbar,
  st_awburst,
  st_awcache,
  st_awdomain,
  st_awid,
  st_awlen,
  st_awlock,
  st_awprot,
  st_awready,
  st_awsize,
  st_awsnoop,
  st_awunique,
  st_awuser,
  st_awvalid,
  st_awvalid_gate,
  st_wdata,
  st_wlast,
  st_wns,
  st_wready,
  st_wstrb,
  st_wvalid,
  vict_awaddr,
  vict_awbar,
  vict_awburst,
  vict_awcache,
  vict_awdomain,
  vict_awid,
  vict_awlen,
  vict_awlock,
  vict_awprot,
  vict_awready,
  vict_awsize,
  vict_awsnoop,
  vict_awunique,
  vict_awuser,
  vict_awvalid,
  vict_awvalid_gate,
  vict_wdata,
  vict_wlast,
  vict_wns,
  vict_wready,
  vict_wstrb,
  vict_wvalid
);

// &Ports; @23
input            arready;               
input   [39 :0]  ifu_biu_rd_addr;       
input   [1  :0]  ifu_biu_rd_burst;      
input   [3  :0]  ifu_biu_rd_cache;      
input   [1  :0]  ifu_biu_rd_domain;     
input            ifu_biu_rd_id;         
input   [1  :0]  ifu_biu_rd_len;        
input   [2  :0]  ifu_biu_rd_prot;       
input            ifu_biu_rd_req;        
input            ifu_biu_rd_req_gate;   
input   [2  :0]  ifu_biu_rd_size;       
input   [3  :0]  ifu_biu_rd_snoop;      
input   [1  :0]  ifu_biu_rd_user;       
input   [39 :0]  lsu_biu_ar_addr;       
input   [1  :0]  lsu_biu_ar_bar;        
input   [1  :0]  lsu_biu_ar_burst;      
input   [3  :0]  lsu_biu_ar_cache;      
input   [1  :0]  lsu_biu_ar_domain;     
input            lsu_biu_ar_dp_req;     
input   [4  :0]  lsu_biu_ar_id;         
input   [1  :0]  lsu_biu_ar_len;        
input            lsu_biu_ar_lock;       
input   [2  :0]  lsu_biu_ar_prot;       
input            lsu_biu_ar_req;        
input            lsu_biu_ar_req_gate;   
input   [2  :0]  lsu_biu_ar_size;       
input   [3  :0]  lsu_biu_ar_snoop;      
input   [2  :0]  lsu_biu_ar_user;       
input            lsu_biu_aw_req_gate;   
input   [39 :0]  lsu_biu_aw_st_addr;    
input   [1  :0]  lsu_biu_aw_st_bar;     
input   [1  :0]  lsu_biu_aw_st_burst;   
input   [3  :0]  lsu_biu_aw_st_cache;   
input   [1  :0]  lsu_biu_aw_st_domain;  
input            lsu_biu_aw_st_dp_req;  
input   [4  :0]  lsu_biu_aw_st_id;      
input   [1  :0]  lsu_biu_aw_st_len;     
input            lsu_biu_aw_st_lock;    
input   [2  :0]  lsu_biu_aw_st_prot;    
input            lsu_biu_aw_st_req;     
input   [2  :0]  lsu_biu_aw_st_size;    
input   [2  :0]  lsu_biu_aw_st_snoop;   
input            lsu_biu_aw_st_unique;  
input            lsu_biu_aw_st_user;    
input   [39 :0]  lsu_biu_aw_vict_addr;  
input   [1  :0]  lsu_biu_aw_vict_bar;   
input   [1  :0]  lsu_biu_aw_vict_burst; 
input   [3  :0]  lsu_biu_aw_vict_cache; 
input   [1  :0]  lsu_biu_aw_vict_domain; 
input            lsu_biu_aw_vict_dp_req; 
input   [4  :0]  lsu_biu_aw_vict_id;    
input   [1  :0]  lsu_biu_aw_vict_len;   
input            lsu_biu_aw_vict_lock;  
input   [2  :0]  lsu_biu_aw_vict_prot;  
input            lsu_biu_aw_vict_req;   
input   [2  :0]  lsu_biu_aw_vict_size;  
input   [2  :0]  lsu_biu_aw_vict_snoop; 
input            lsu_biu_aw_vict_unique; 
input            lsu_biu_aw_vict_user;  
input   [127:0]  lsu_biu_w_st_data;     
input            lsu_biu_w_st_last;     
input   [15 :0]  lsu_biu_w_st_strb;     
input            lsu_biu_w_st_vld;      
input            lsu_biu_w_st_wns;      
input   [127:0]  lsu_biu_w_vict_data;   
input            lsu_biu_w_vict_last;   
input   [15 :0]  lsu_biu_w_vict_strb;   
input            lsu_biu_w_vict_vld;    
input            lsu_biu_w_vict_wns;    
input            st_awready;            
input            st_wready;             
input            vict_awready;          
input            vict_wready;           
output  [39 :0]  araddr;                
output  [1  :0]  arbar;                 
output  [1  :0]  arburst;               
output  [3  :0]  arcache;               
output  [1  :0]  ardomain;              
output  [4  :0]  arid;                  
output  [1  :0]  arlen;                 
output           arlock;                
output  [2  :0]  arprot;                
output  [2  :0]  arsize;                
output  [3  :0]  arsnoop;               
output  [2  :0]  aruser;                
output           arvalid;               
output           arvalid_gate;          
output           biu_ifu_rd_grnt;       
output           biu_lsu_ar_ready;      
output           biu_lsu_aw_vb_grnt;    
output           biu_lsu_aw_wmb_grnt;   
output           biu_lsu_w_vb_grnt;     
output           biu_lsu_w_wmb_grnt;    
output  [39 :0]  st_awaddr;             
output  [1  :0]  st_awbar;              
output  [1  :0]  st_awburst;            
output  [3  :0]  st_awcache;            
output  [1  :0]  st_awdomain;           
output  [4  :0]  st_awid;               
output  [1  :0]  st_awlen;              
output           st_awlock;             
output  [2  :0]  st_awprot;             
output  [2  :0]  st_awsize;             
output  [2  :0]  st_awsnoop;            
output           st_awunique;           
output           st_awuser;             
output           st_awvalid;            
output           st_awvalid_gate;       
output  [127:0]  st_wdata;              
output           st_wlast;              
output           st_wns;                
output  [15 :0]  st_wstrb;              
output           st_wvalid;             
output  [39 :0]  vict_awaddr;           
output  [1  :0]  vict_awbar;            
output  [1  :0]  vict_awburst;          
output  [3  :0]  vict_awcache;          
output  [1  :0]  vict_awdomain;         
output  [4  :0]  vict_awid;             
output  [1  :0]  vict_awlen;            
output           vict_awlock;           
output  [2  :0]  vict_awprot;           
output  [2  :0]  vict_awsize;           
output  [2  :0]  vict_awsnoop;          
output           vict_awunique;         
output           vict_awuser;           
output           vict_awvalid;          
output           vict_awvalid_gate;     
output  [127:0]  vict_wdata;            
output           vict_wlast;            
output           vict_wns;              
output  [15 :0]  vict_wstrb;            
output           vict_wvalid;           

// &Regs; @24
reg     [39 :0]  araddr;                
reg     [1  :0]  arbar;                 
reg     [1  :0]  arburst;               
reg     [3  :0]  arcache;               
reg     [1  :0]  ardomain;              
reg     [4  :0]  arid;                  
reg     [1  :0]  arlen;                 
reg              arlock;                
reg     [2  :0]  arprot;                
reg     [2  :0]  arsize;                
reg     [3  :0]  arsnoop;               
reg     [2  :0]  aruser;                

// &Wires; @25
wire             arready;               
wire             arvalid;               
wire             arvalid_gate;          
wire             biu_ifu_rd_grnt;       
wire             biu_lsu_ar_ready;      
wire             biu_lsu_aw_vb_grnt;    
wire             biu_lsu_aw_wmb_grnt;   
wire             biu_lsu_w_vb_grnt;     
wire             biu_lsu_w_wmb_grnt;    
wire             ifu_ar_req;            
wire    [39 :0]  ifu_biu_rd_addr;       
wire    [1  :0]  ifu_biu_rd_burst;      
wire    [3  :0]  ifu_biu_rd_cache;      
wire    [1  :0]  ifu_biu_rd_domain;     
wire             ifu_biu_rd_id;         
wire    [1  :0]  ifu_biu_rd_len;        
wire    [2  :0]  ifu_biu_rd_prot;       
wire             ifu_biu_rd_req;        
wire    [2  :0]  ifu_biu_rd_size;       
wire    [3  :0]  ifu_biu_rd_snoop;      
wire    [1  :0]  ifu_biu_rd_user;       
wire             lsu_ar_req;            
wire    [39 :0]  lsu_biu_ar_addr;       
wire    [1  :0]  lsu_biu_ar_bar;        
wire    [1  :0]  lsu_biu_ar_burst;      
wire    [3  :0]  lsu_biu_ar_cache;      
wire    [1  :0]  lsu_biu_ar_domain;     
wire             lsu_biu_ar_dp_req;     
wire    [4  :0]  lsu_biu_ar_id;         
wire    [1  :0]  lsu_biu_ar_len;        
wire             lsu_biu_ar_lock;       
wire    [2  :0]  lsu_biu_ar_prot;       
wire             lsu_biu_ar_req;        
wire    [2  :0]  lsu_biu_ar_size;       
wire    [3  :0]  lsu_biu_ar_snoop;      
wire    [2  :0]  lsu_biu_ar_user;       
wire    [39 :0]  lsu_biu_aw_st_addr;    
wire    [1  :0]  lsu_biu_aw_st_bar;     
wire    [1  :0]  lsu_biu_aw_st_burst;   
wire    [3  :0]  lsu_biu_aw_st_cache;   
wire    [1  :0]  lsu_biu_aw_st_domain;  
wire             lsu_biu_aw_st_dp_req;  
wire    [4  :0]  lsu_biu_aw_st_id;      
wire    [1  :0]  lsu_biu_aw_st_len;     
wire             lsu_biu_aw_st_lock;    
wire    [2  :0]  lsu_biu_aw_st_prot;    
wire             lsu_biu_aw_st_req;     
wire    [2  :0]  lsu_biu_aw_st_size;    
wire    [2  :0]  lsu_biu_aw_st_snoop;   
wire             lsu_biu_aw_st_unique;  
wire             lsu_biu_aw_st_user;    
wire    [39 :0]  lsu_biu_aw_vict_addr;  
wire    [1  :0]  lsu_biu_aw_vict_bar;   
wire    [1  :0]  lsu_biu_aw_vict_burst; 
wire    [3  :0]  lsu_biu_aw_vict_cache; 
wire    [1  :0]  lsu_biu_aw_vict_domain; 
wire             lsu_biu_aw_vict_dp_req; 
wire    [4  :0]  lsu_biu_aw_vict_id;    
wire    [1  :0]  lsu_biu_aw_vict_len;   
wire             lsu_biu_aw_vict_lock;  
wire    [2  :0]  lsu_biu_aw_vict_prot;  
wire             lsu_biu_aw_vict_req;   
wire    [2  :0]  lsu_biu_aw_vict_size;  
wire    [2  :0]  lsu_biu_aw_vict_snoop; 
wire             lsu_biu_aw_vict_unique; 
wire             lsu_biu_aw_vict_user;  
wire    [127:0]  lsu_biu_w_st_data;     
wire             lsu_biu_w_st_last;     
wire    [15 :0]  lsu_biu_w_st_strb;     
wire             lsu_biu_w_st_vld;      
wire             lsu_biu_w_st_wns;      
wire    [127:0]  lsu_biu_w_vict_data;   
wire             lsu_biu_w_vict_last;   
wire    [15 :0]  lsu_biu_w_vict_strb;   
wire             lsu_biu_w_vict_vld;    
wire             lsu_biu_w_vict_wns;    
wire    [39 :0]  st_awaddr;             
wire    [1  :0]  st_awbar;              
wire    [1  :0]  st_awburst;            
wire    [3  :0]  st_awcache;            
wire    [1  :0]  st_awdomain;           
wire    [4  :0]  st_awid;               
wire    [1  :0]  st_awlen;              
wire             st_awlock;             
wire    [2  :0]  st_awprot;             
wire             st_awready;            
wire    [2  :0]  st_awsize;             
wire    [2  :0]  st_awsnoop;            
wire             st_awunique;           
wire             st_awuser;             
wire             st_awvalid;            
wire             st_awvalid_gate;       
wire    [127:0]  st_wdata;              
wire             st_wlast;              
wire             st_wns;                
wire             st_wready;             
wire    [15 :0]  st_wstrb;              
wire             st_wvalid;             
wire    [39 :0]  vict_awaddr;           
wire    [1  :0]  vict_awbar;            
wire    [1  :0]  vict_awburst;          
wire    [3  :0]  vict_awcache;          
wire    [1  :0]  vict_awdomain;         
wire    [4  :0]  vict_awid;             
wire    [1  :0]  vict_awlen;            
wire             vict_awlock;           
wire    [2  :0]  vict_awprot;           
wire             vict_awready;          
wire    [2  :0]  vict_awsize;           
wire    [2  :0]  vict_awsnoop;          
wire             vict_awunique;         
wire             vict_awuser;           
wire             vict_awvalid;          
wire             vict_awvalid_gate;     
wire    [127:0]  vict_wdata;            
wire             vict_wlast;            
wire             vict_wns;              
wire             vict_wready;           
wire    [15 :0]  vict_wstrb;            
wire             vict_wvalid;           


//==========================================================
// condition to create accept req from ifu/lsu
// Current_rd/wr_req_buffer empty or bus ready
// lsu rd has higher priority than ifu rd
// note:
// ifu req id: 1'b1-> 5'b10001:prefetch; 
//             1'b0-> 5'b10000:refill;
//==========================================================
//Read

assign ifu_ar_req = ifu_biu_rd_req && !lsu_biu_ar_dp_req;
assign lsu_ar_req = lsu_biu_ar_req  &&  lsu_biu_ar_dp_req;
assign arvalid    = ifu_ar_req || lsu_ar_req;
assign arvalid_gate = ifu_ar_req || lsu_biu_ar_dp_req;

// &CombBeg; @42
always @( lsu_biu_ar_lock
       or ifu_biu_rd_domain[1:0]
       or ifu_biu_rd_burst[1:0]
       or lsu_biu_ar_len[1:0]
       or lsu_biu_ar_size[2:0]
       or lsu_biu_ar_addr[39:0]
       or ifu_biu_rd_len[1:0]
       or ifu_biu_rd_addr[39:0]
       or ifu_biu_rd_cache[3:0]
       or lsu_biu_ar_dp_req
       or lsu_biu_ar_cache[3:0]
       or lsu_biu_ar_burst[1:0]
       or ifu_biu_rd_user[1:0]
       or lsu_biu_ar_user[2:0]
       or lsu_biu_ar_prot[2:0]
       or ifu_biu_rd_snoop[3:0]
       or lsu_biu_ar_bar[1:0]
       or ifu_biu_rd_prot[2:0]
       or lsu_biu_ar_domain[1:0]
       or ifu_biu_rd_size[2:0]
       or lsu_biu_ar_id[4:0]
       or ifu_biu_rd_id
       or lsu_biu_ar_snoop[3:0])
begin
  if(!lsu_biu_ar_dp_req)
  begin
    arid[4:0]     = {4'b1000,ifu_biu_rd_id}; 
    araddr[`PA_WIDTH-1:0]  = ifu_biu_rd_addr[`PA_WIDTH-1:0];
    arlen[1:0]    = ifu_biu_rd_len[1:0];
    arsize[2:0]   = ifu_biu_rd_size[2:0];
    arburst[1:0]  = ifu_biu_rd_burst[1:0];
    arlock        = 1'b0;
    arcache[3:0]  = ifu_biu_rd_cache[3:0];
    arprot[2:0]   = ifu_biu_rd_prot[2:0];
    arsnoop[3:0]  = ifu_biu_rd_snoop[3:0]; //ReadNoSnoop
    ardomain[1:0] = ifu_biu_rd_domain[1:0];//non-shareable domain
    arbar[1:0]    = 2'b0;
    aruser[2:0]   = {1'b0,ifu_biu_rd_user[1:0]};//fot {mmode,mmu} read
  end
  else
  begin
    arid[4:0]     = lsu_biu_ar_id[4:0];
    araddr[`PA_WIDTH-1:0]  = lsu_biu_ar_addr[`PA_WIDTH-1:0];
    arlen[1:0]    = lsu_biu_ar_len[1:0];
    arsize[2:0]   = lsu_biu_ar_size[2:0];
    arburst[1:0]  = lsu_biu_ar_burst[1:0];
    arlock        = lsu_biu_ar_lock;
    arcache[3:0]  = lsu_biu_ar_cache[3:0];
    arprot[2:0]   = lsu_biu_ar_prot[2:0];
    arsnoop[3:0]  = lsu_biu_ar_snoop[3:0];
    ardomain[1:0] = lsu_biu_ar_domain[1:0];
    arbar[1:0]    = lsu_biu_ar_bar[1:0];
    aruser[2:0]   = lsu_biu_ar_user[2:0]; //for mmu read
  end
// &CombEnd; @73
end


assign biu_ifu_rd_grnt  = ifu_ar_req && arready;
assign biu_lsu_ar_ready = arready;


//Write, only one source: lsu
//write addr channel
assign vict_awvalid        = lsu_biu_aw_vict_req;
assign vict_awvalid_gate   = lsu_biu_aw_vict_dp_req;
assign vict_awid[4:0]      = lsu_biu_aw_vict_id[4:0];
assign vict_awaddr[`PA_WIDTH-1:0]   = lsu_biu_aw_vict_addr[`PA_WIDTH-1:0];
assign vict_awlen[1:0]     = lsu_biu_aw_vict_len[1:0];
assign vict_awsize[2:0]    = lsu_biu_aw_vict_size[2:0];
assign vict_awburst[1:0]   = lsu_biu_aw_vict_burst[1:0];
assign vict_awlock         = lsu_biu_aw_vict_lock;
assign vict_awcache[3:0]   = lsu_biu_aw_vict_cache[3:0];
assign vict_awprot[2:0]    = lsu_biu_aw_vict_prot[2:0];
assign vict_awuser         = lsu_biu_aw_vict_user;
assign vict_awsnoop[2:0]   = lsu_biu_aw_vict_snoop[2:0];
assign vict_awdomain[1:0]  = lsu_biu_aw_vict_domain[1:0];
assign vict_awbar[1:0]     = lsu_biu_aw_vict_bar[1:0];
assign vict_awunique       = lsu_biu_aw_vict_unique;

assign st_awvalid        = lsu_biu_aw_st_req;
assign st_awvalid_gate   = lsu_biu_aw_st_dp_req;
assign st_awid[4:0]      = lsu_biu_aw_st_id[4:0];
assign st_awaddr[`PA_WIDTH-1:0]   = lsu_biu_aw_st_addr[`PA_WIDTH-1:0];
assign st_awlen[1:0]     = lsu_biu_aw_st_len[1:0];
assign st_awsize[2:0]    = lsu_biu_aw_st_size[2:0];
assign st_awburst[1:0]   = lsu_biu_aw_st_burst[1:0];
assign st_awlock         = lsu_biu_aw_st_lock;
assign st_awcache[3:0]   = lsu_biu_aw_st_cache[3:0];
assign st_awprot[2:0]    = lsu_biu_aw_st_prot[2:0];
assign st_awuser         = lsu_biu_aw_st_user;
assign st_awsnoop[2:0]   = lsu_biu_aw_st_snoop[2:0];
assign st_awdomain[1:0]  = lsu_biu_aw_st_domain[1:0];
assign st_awbar[1:0]     = lsu_biu_aw_st_bar[1:0];
assign st_awunique       = lsu_biu_aw_st_unique;

assign biu_lsu_aw_vb_grnt  = vict_awready;
assign biu_lsu_aw_wmb_grnt = st_awready;


//write data channel
assign vict_wvalid         = lsu_biu_w_vict_vld;
assign vict_wdata[127:0]   = lsu_biu_w_vict_data[127:0];
assign vict_wstrb[15:0]    = lsu_biu_w_vict_strb[15:0];
assign vict_wlast          = lsu_biu_w_vict_last;
assign vict_wns            = lsu_biu_w_vict_wns;

assign st_wvalid         = lsu_biu_w_st_vld;
assign st_wdata[127:0]   = lsu_biu_w_st_data[127:0];
assign st_wstrb[15:0]    = lsu_biu_w_st_strb[15:0];
assign st_wlast          = lsu_biu_w_st_last;
assign st_wns            = lsu_biu_w_st_wns;

assign biu_lsu_w_vb_grnt  = vict_wready;
assign biu_lsu_w_wmb_grnt = st_wready;
//assign 

//assign biu_pad_arvalid_gate = lsu_biu_ar_req_gate || ifu_biu_rd_req_gate;
//assign biu_pad_awvalid_gate = lsu_biu_aw_req_gate;
// &Force("input", "lsu_biu_ar_req_gate"); @144
// &Force("input", "lsu_biu_aw_req_gate"); @145
// &Force("input", "ifu_biu_rd_req_gate"); @146

// &ModuleEnd; @148
endmodule




