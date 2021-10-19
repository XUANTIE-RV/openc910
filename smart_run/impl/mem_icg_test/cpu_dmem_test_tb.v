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
`define CLK_PERIOD          10
// `define DCACHE_64K
//`include "./cpu_cfig.h"
module cpu_dmem_test_tb(
dmem_passed
);
output dmem_passed;
reg    dmem_passed;
//data array parameter

//==========================================================
//                  Parameter Definition
//==========================================================

//data cache parameter
//`ifdef DCACHE_2K
//  `define DCACHE_INDEX_MSB 9
//  `define DCACHE_TAG_SIZE 22
//`endif
//
//`ifdef DCACHE_4K
//  `define DCACHE_INDEX_MSB 10
//  `define DCACHE_TAG_SIZE 21
//`endif
//
//`ifdef DCACHE_8K
// parameter LOCAL_DATA_ADDR_WIDTH   = 8;
// parameter LOCAL_DIRTY_ADDR_WIDTH  = 6;
//`endif

`ifdef DCACHE_32K
parameter LOCAL_DATA_ADDR_WIDTH  = 10;
parameter LOCAL_TAG_ADDR_WIDTH   = 8;
parameter LOCAL_DIRTY_ADDR_WIDTH = 8;
`endif

`ifdef DCACHE_64K
parameter LOCAL_DATA_ADDR_WIDTH  = 11;
parameter LOCAL_TAG_ADDR_WIDTH   = 9;
parameter LOCAL_DIRTY_ADDR_WIDTH = 9;
`endif

//data
`ifdef L1_CACHE_ECC
parameter LOCAL_DATA_DATA_WIDTH  = 39;
parameter LOCAL_DIRTY_DATA_WIDTH = 21;
parameter LOCAL_DIRTY_WE_WIDTH   = 21;
`else
parameter LOCAL_DATA_DATA_WIDTH  = 32;
parameter LOCAL_DIRTY_DATA_WIDTH = 7;
parameter LOCAL_DIRTY_WE_WIDTH   = 7;
`endif

parameter LOCAL_DATA_WE_WIDTH   = 4;
//tag
parameter LOCAL_TAG_DATA_WIDTH = 52;
parameter LOCAL_TAG_WE_WIDTH   = 2;
//dirty


//data array signal
reg [ LOCAL_DATA_ADDR_WIDTH-1 : 0 ] temp_data_addr_internal;
reg [ LOCAL_DATA_DATA_WIDTH-1 : 0 ] temp_data_din_internal ;
reg [ LOCAL_DATA_WE_WIDTH  -1 : 0 ] temp_data_wen_internal ;
reg                                 temp_data_cen_internal ;
reg                                 temp_data_CLK          ;
wire [ LOCAL_DATA_DATA_WIDTH-1 : 0] temp_data_q_internal   ;
reg  [ LOCAL_DATA_DATA_WIDTH-1 : 0] golden_data      ;
reg  [ LOCAL_DATA_DATA_WIDTH-1 : 0] data_mask   ;
reg  [ LOCAL_DATA_DATA_WIDTH-1 : 0] data_mask_ff  ;

//tag array signal
reg [ LOCAL_TAG_ADDR_WIDTH-1 : 0 ] temp_tag_addr_internal;
reg [ LOCAL_TAG_DATA_WIDTH-1 : 0 ] temp_tag_din_internal ;
reg [ LOCAL_TAG_WE_WIDTH  -1 : 0 ] temp_tag_wen_internal ;
reg                                temp_tag_cen_internal ;
reg                                temp_tag_CLK          ;
wire [ LOCAL_TAG_DATA_WIDTH-1 : 0] temp_tag_q_internal   ;
reg  [ LOCAL_TAG_DATA_WIDTH-1 : 0] golden_tag      ;
reg  [ LOCAL_TAG_DATA_WIDTH-1 : 0] tag_mask   ;
reg  [ LOCAL_TAG_DATA_WIDTH-1 : 0] tag_mask_ff   ;

//dirty array signal
reg [ LOCAL_DIRTY_ADDR_WIDTH-1 : 0 ] temp_dirty_addr_internal;
reg [ LOCAL_DIRTY_DATA_WIDTH-1 : 0 ] temp_dirty_din_internal ;
reg [ LOCAL_DIRTY_WE_WIDTH  -1 : 0 ] temp_dirty_wen_internal ;
reg                                  temp_dirty_cen_internal ;
reg                                  temp_dirty_CLK          ;
wire [ LOCAL_DIRTY_DATA_WIDTH-1 : 0] temp_dirty_q_internal   ;
reg  [ LOCAL_DIRTY_DATA_WIDTH-1 : 0] golden_dirty      ;
reg  [ LOCAL_DIRTY_DATA_WIDTH-1 : 0] dirty_mask   ;
reg  [ LOCAL_DIRTY_DATA_WIDTH-1 : 0] dirty_mask_ff   ;

//gated cell clk
reg temp_forever_cpuclk      ;
reg temp_external_en         ;
reg temp_pad_yy_test_mode    ;
wire temp_xor_clk            ;


integer i;

initial 
begin
dmem_passed = 1'b0;
//gated cell test
           #20
           temp_forever_cpuclk         = 1'b0;
           temp_external_en            = 1'b0;
           temp_pad_yy_test_mode       = 1'b0;

//memory test
           temp_data_CLK               = 1'b0; 
           temp_data_cen_internal      = 1'b0; 
           temp_data_wen_internal      = {LOCAL_DATA_WE_WIDTH{1'b1}};
           temp_data_addr_internal     = {LOCAL_DATA_ADDR_WIDTH{1'b0}};
           temp_data_din_internal      = {LOCAL_DATA_DATA_WIDTH{1'b0}};
           golden_data                 = {LOCAL_DATA_DATA_WIDTH{1'b0}};
           data_mask                   = {LOCAL_DATA_DATA_WIDTH{1'b0}};
           #20
           @(posedge temp_data_CLK)

           //cen==1 test
           ////$display("$$$$$$$$  data array  memory cen test cen ==1 test...                          $");   
           #0.1 temp_data_wen_internal   = {LOCAL_DATA_WE_WIDTH{1'b0}};
           #0.1 temp_data_cen_internal  = 1'b0; 
           for(i=1;i<10;i=i+1)     //set address 1~9
           begin
               @(posedge temp_data_CLK)
                temp_data_addr_internal <= {LOCAL_DATA_ADDR_WIDTH{1'b0}} + i;
                temp_data_din_internal  <= {LOCAL_DATA_DATA_WIDTH{1'b0}} + i;
                golden_data             <= {LOCAL_DATA_DATA_WIDTH{1'b0}} + i;
           end

           @(posedge temp_data_CLK)

           //cen==1 test
           ////$display("$$$$$$$$  data array  memory cen test cen ==1 test...                          $");   
           #0.1 temp_data_wen_internal   = {LOCAL_DATA_WE_WIDTH{1'b1}};
           #0.1 temp_data_cen_internal  = 1'b0; 
           for(i=1;i<10;i=i+1)     //set address 1~9
           begin
               @(posedge temp_data_CLK)
                temp_data_addr_internal <= {LOCAL_DATA_ADDR_WIDTH{1'b0}} + i;
                temp_data_din_internal  <= {LOCAL_DATA_DATA_WIDTH{1'b0}} + i;
                golden_data             <= {LOCAL_DATA_DATA_WIDTH{1'b0}} + i;
               @(posedge temp_data_CLK)
               #0.1   
                   ////$display("$address = %h temp_data_q_internal = %h , golden_data =%h \n",temp_data_addr_internal,temp_data_q_internal,golden_data);    
               if(temp_data_q_internal !== golden_data)
               begin
                   ////$display("$          Sorry, address %h memory write check fail ! @_@     $",temp_data_addr_internal);    
                   $finish;
               end
           end

           //cen==0 test
           ////$display("$$$$$$$$$$  data array  memory cen test cen ==1  test passed                     $\n");   
           ////$display("$$$$$$$$$$  data array  memory cen test  cen ==0 test...                         $");    
           #0.1 temp_data_wen_internal   = {LOCAL_DATA_WE_WIDTH{1'b0}};
           #0.1 temp_data_cen_internal  = 1'b1; 

           for(i=10;i<15;i=i+1)     //set address 10 ~15
           begin
               @(posedge temp_data_CLK)
                temp_data_addr_internal <= {LOCAL_DATA_ADDR_WIDTH{1'b0}} + i;
                temp_data_din_internal  <= {LOCAL_DATA_DATA_WIDTH{1'b0}} + i;
                golden_data             <= {LOCAL_DATA_DATA_WIDTH{1'b0}} + i;
               @(posedge temp_data_CLK)
               #0.1   
                   ////$display("$          address = %h temp_data_q_internal = %h , golden_data =%h \n",temp_data_addr_internal,temp_data_q_internal,golden_data);    
               if(temp_data_q_internal === golden_data)
               begin
                   ////$display("$          Sorry, address %h memory write check fail ! @_@     $",temp_data_addr_internal);    
                   $finish;
               end
           end

           //wen test
           ////$display("$$$$$$$$$  data array  memory cen test  cen ==0 test passed                      $");    
           ////$display("$$$$$$$$$  data array  memory wen test.......                                    $");    
           #0.1 temp_data_wen_internal   = {LOCAL_DATA_WE_WIDTH{1'b0}};
           #0.1 temp_data_cen_internal   = 1'b0; 
          for(i=0;i<LOCAL_DATA_WE_WIDTH + 1;i=i+1)
          begin
                 @(posedge temp_data_CLK)
                  temp_data_addr_internal <= {LOCAL_DATA_ADDR_WIDTH{1'b0}} ;
                  temp_data_wen_internal  <= {LOCAL_DATA_WE_WIDTH{1'b1}} >>i ; 
                  temp_data_din_internal  <= {LOCAL_DATA_DATA_WIDTH{1'b1}} ;
                  golden_data             <= temp_data_din_internal ;
                 @(posedge temp_data_CLK)
                 @(posedge temp_data_CLK)
                  #0.1 temp_data_wen_internal  <= {LOCAL_DATA_WE_WIDTH{1'b1}};
                       golden_data             <= temp_data_din_internal ;
                       data_mask_ff            <= data_mask;
                 @(posedge temp_data_CLK)
                  #0.1 
                      ////$display("$  address = %h temp_data_q_internal = %h , golden_data =%h,wen=%h \n",temp_data_addr_internal,temp_data_q_internal,(golden_data &(~data_mask)),temp_data_wen_internal);    
                 if(temp_data_q_internal !== (golden_data &(~data_mask_ff)) )
                 begin
                      ////$display("$  Sorry, temp_data_q_internal = %h , golden_data =%h, wen=%h \n",temp_data_q_internal,golden_data,temp_data_wen_internal);    
                      $finish;
                 end
           end
            
                      

          //write test
           ////$display("$$$$$$$$$  data array  memory wen test passed                                    $");    
           ////$display("$$$$$$$$$  data array  memory write test......                                   $");    
           @(posedge temp_data_CLK) //write address 0
           #0.1 temp_data_wen_internal   = {LOCAL_DATA_WE_WIDTH{1'b0}};
           #0.1 temp_data_cen_internal   = 1'b0; 
           for(i=10;i<15;i = i+1)     //set address 10 ~15
           begin
           #0.1 temp_data_wen_internal   = {LOCAL_DATA_WE_WIDTH{1'b0}};
           #0.1 temp_data_cen_internal   = 1'b0; 
               @(posedge temp_data_CLK)
                temp_data_addr_internal <= {LOCAL_DATA_ADDR_WIDTH{1'b0}} + i;
                temp_data_din_internal  <= {LOCAL_DATA_DATA_WIDTH{1'b0}} + i;
                golden_data             <= {LOCAL_DATA_DATA_WIDTH{1'b0}} + i;
               @(posedge temp_data_CLK)
               #0.1 temp_data_wen_internal   = {LOCAL_DATA_WE_WIDTH{1'b1}};
                    golden_data             <= temp_data_din_internal ;
               @(posedge temp_data_CLK)
               #0.1   
                   ////$display("$          address = %h temp_data_q_internal = %h , golden_data =%h \n",temp_data_addr_internal,temp_data_q_internal,golden_data);    
               if(temp_data_q_internal !== golden_data)
               begin
                   ////$display("$          Sorry, address %h memory write check fail ! @_@     $",temp_data_addr_internal);    
                   $finish;
               end
           end


          //address width check
           ////$display("$$$$$$$$  data array  memory read test passed                                    $");    
           ////$display("$$$$$$$$  data array  memory address width test......                            $");    
           @(posedge temp_data_CLK) //write address 
           #0.1 temp_data_cen_internal   = 1'b0; 
           @(posedge temp_data_CLK)
           temp_data_wen_internal  <= {LOCAL_DATA_WE_WIDTH{1'b0}};
           temp_data_addr_internal <= {LOCAL_DATA_ADDR_WIDTH{1'b0}} ;                // 0 address write bb
           temp_data_din_internal  <= {LOCAL_DATA_DATA_WIDTH{1'b0}} + 8'hbb;
           golden_data             <= {LOCAL_DATA_DATA_WIDTH{1'b0}} + 8'hbb;
           @(posedge temp_data_CLK)
           temp_data_wen_internal  <= {LOCAL_DATA_WE_WIDTH{1'b0}};
           temp_data_addr_internal <= { {3'b001},{LOCAL_DATA_ADDR_WIDTH-3{1'b0}} } ; // 1/2 max address 
           temp_data_din_internal  <= {LOCAL_DATA_DATA_WIDTH{1'b0}} + 8'haa;
           golden_data             <= {LOCAL_DATA_DATA_WIDTH{1'b0}} + 8'haa;

           //read data in 1/2max address
           @(posedge temp_data_CLK)
           temp_data_wen_internal  <= {LOCAL_DATA_WE_WIDTH{1'b1}};
           temp_data_addr_internal <= { {3'b001},{LOCAL_DATA_ADDR_WIDTH-3{1'b0}} } ; // 1/2 max address
           temp_data_din_internal  <= {LOCAL_DATA_DATA_WIDTH{1'b0}} + 8'hff;
           golden_data             <= {LOCAL_DATA_DATA_WIDTH{1'b0}} + 8'haa;
           @(posedge temp_data_CLK)
           #0.1   
           if(temp_data_q_internal !== golden_data)
           begin
               ////$display("$          Sorry, address %h memory read check fail ! @_@     $",temp_data_addr_internal);    
               $finish;
           end

           //read data in  address 0
           @(posedge temp_data_CLK)
           temp_data_wen_internal  <= {LOCAL_DATA_WE_WIDTH{1'b1}};
           temp_data_addr_internal <= {LOCAL_DATA_ADDR_WIDTH{1'b0}} ;                // 0 address write bb
           temp_data_din_internal  <= {LOCAL_DATA_DATA_WIDTH{1'b0}} + 8'hff;
           golden_data             <= {LOCAL_DATA_DATA_WIDTH{1'b0}} + 8'hbb;
           @(posedge temp_data_CLK)
           #0.1   
           if(temp_data_q_internal !== golden_data)
           begin
               ////$display("$          Sorry, address %h memory read check fail ! @_@     $",temp_data_addr_internal);    
               $finish;
           end
           ////$display("$$$$$$$$  data array  memory address width test passed                           $");    
           ////$display("$$$$$$$$  data array  memory data width test......                               $");    
          //read data check
     
           @(posedge temp_data_CLK) //write address 
           #0.1 temp_data_cen_internal   = 1'b0; 
           @(posedge temp_data_CLK)
           temp_data_wen_internal  <= {LOCAL_DATA_WE_WIDTH{1'b0}};
           temp_data_addr_internal <= {LOCAL_DATA_ADDR_WIDTH{1'b1}} ;
           temp_data_din_internal  <= {LOCAL_DATA_DATA_WIDTH{1'b1}} ;
           golden_data             <= {LOCAL_DATA_DATA_WIDTH{1'b1}} ;
           @(posedge temp_data_CLK)
           #0.1 temp_data_wen_internal   = {LOCAL_DATA_WE_WIDTH{1'b1}};
                golden_data             <= temp_data_din_internal ;
           @(posedge temp_data_CLK)
           #0.1   
               ////$display("$          address = %h temp_data_q_internal = %h , golden_data =%h \n",temp_data_addr_internal,temp_data_q_internal,golden_data);    
           if(temp_data_q_internal !== golden_data)
           begin
               ////$display("$          Sorry, address %h memory read check fail ! @_@     $",temp_data_addr_internal);    
               $finish;
           end
           ////$display("$$$$$$$$  data array  memory data width test passed                          $");    
          //read data check
           ////$display("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$");
           ////$display("$           data array test PASS!!!!!!!!!!!!!!!!!!!!                     $");    
           ////$display("$           data array test PASS!!!!!!!!!!!!!!!!!!!!                     $");    
           ////$display("$           data array test PASS!!!!!!!!!!!!!!!!!!!!                     $");    
           ////$display("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$");


           temp_tag_CLK               = 1'b0; 
           temp_tag_cen_internal      = 1'b0; 
           temp_tag_wen_internal      = {LOCAL_TAG_WE_WIDTH{1'b1}};
           temp_tag_addr_internal     = {LOCAL_TAG_ADDR_WIDTH{1'b0}};
           temp_tag_din_internal      = {LOCAL_TAG_DATA_WIDTH{1'b0}};
           golden_tag                 = {LOCAL_TAG_DATA_WIDTH{1'b0}};
           tag_mask                   = {LOCAL_TAG_DATA_WIDTH{1'b0}};

           #20
           @(posedge temp_tag_CLK)

           //cen==1 test
           ////$display("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$");
           ////$display("$$$$$$$  tag array   memory cen test cen ==1 test...                  $");   
           ////$display("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$");
           #0.1 temp_tag_wen_internal   = {LOCAL_TAG_WE_WIDTH{1'b0}};
           #0.1 temp_tag_cen_internal  = 1'b0; 
           for(i=1;i<10;i=i+1)     //set address 1~9
           begin
           #0.1 temp_tag_wen_internal   = {LOCAL_TAG_WE_WIDTH{1'b0}};
           #0.1 temp_tag_cen_internal  = 1'b0; 
               @(posedge temp_tag_CLK)
                temp_tag_addr_internal <= {LOCAL_TAG_ADDR_WIDTH{1'b0}} + i;
                temp_tag_din_internal  <= {LOCAL_TAG_DATA_WIDTH{1'b0}} + i;
                golden_tag             <= {LOCAL_TAG_DATA_WIDTH{1'b0}} + i;
               @(posedge temp_tag_CLK)
               #0.1 temp_tag_wen_internal   = {LOCAL_TAG_WE_WIDTH{1'b1}};
                    golden_tag             <= temp_tag_din_internal;
               @(posedge temp_tag_CLK)
               #0.1   
                   ////$display("$address = %h temp_tag_q_internal = %h , golden_tag =%h \n",temp_tag_addr_internal,temp_tag_q_internal,golden_tag);    
               if(temp_tag_q_internal !== golden_tag)
               begin
                   ////$display("$          Sorry, address %h memory write check fail ! @_@     $",temp_tag_addr_internal);    
                   $finish;
               end
           end


           //cen==0 test
           ////$display("$$$$$$$$  tag array   memory cen test cen ==1  test passed                     $");   
           ////$display("$$$$$$$$  tag array   memory cen test  cen ==0 test...                         $");    
           #0.1 temp_tag_wen_internal   = {LOCAL_TAG_WE_WIDTH{1'b0}};
           #0.1 temp_tag_cen_internal  = 1'b1; 

           for(i=10;i<15;i=i+1)     //set address 10 ~15
           begin
               @(posedge temp_tag_CLK)
                temp_tag_addr_internal <= {LOCAL_TAG_ADDR_WIDTH{1'b0}} + i;
                temp_tag_din_internal  <= {LOCAL_TAG_DATA_WIDTH{1'b0}} + i;
                golden_tag             <= {LOCAL_TAG_DATA_WIDTH{1'b0}} + i;
               @(posedge temp_tag_CLK)
               #0.1   
                   ////$display("$          address = %h temp_tag_q_internal = %h , golden_tag =%h \n",temp_tag_addr_internal,temp_tag_q_internal,golden_tag);    
               if(temp_tag_q_internal === golden_tag)
               begin
                   ////$display("$          Sorry, address %h memory write check fail ! @_@     $",temp_tag_addr_internal);    
                   $finish;
               end
           end


           //wen test
           ////$display("$$$$$$$  tag array   memory cen test  cen ==0 test passed                      $");    
           ////$display("$$$$$$$  tag array   memory wen test.......                                    $");    
           #0.1 temp_tag_wen_internal   = {LOCAL_TAG_WE_WIDTH{1'b0}};
           #0.1 temp_tag_cen_internal   = 1'b0; 
          for(i=0;i<LOCAL_TAG_WE_WIDTH + 1;i=i+1)
          begin
                 @(posedge temp_tag_CLK)
                  temp_tag_addr_internal <= {LOCAL_TAG_ADDR_WIDTH{1'b0}} ;
                  temp_tag_wen_internal  <= {{LOCAL_TAG_WE_WIDTH{1'b1}},1'b0} <<i ; 
                  temp_tag_din_internal  <= {LOCAL_TAG_DATA_WIDTH{1'b1}} ;
                  //golden_tag             <= {LOCAL_TAG_DATA_WIDTH{1'b1}} ;
                 @(posedge temp_tag_CLK)
                 @(posedge temp_tag_CLK)
                 #0.1 temp_tag_wen_internal  <= {LOCAL_TAG_WE_WIDTH{1'b1}};
                      golden_tag             <= temp_tag_din_internal;
                      tag_mask_ff            <= tag_mask;
                 @(posedge temp_tag_CLK)
                  #0.1 
                      //$display("$  address = %h temp_tag_q_internal = %h , golden_tag =%h,wen=%h \n",temp_tag_addr_internal,temp_tag_q_internal,(golden_tag &(~tag_mask)),temp_tag_wen_internal);    
                 if(temp_tag_q_internal !== (golden_tag &(~tag_mask_ff)) )
                 begin
                      $display("$  temp_tag_q_internal = %h , golden_tag =%h, wen=%h, (golden_tag &(~tag_mask)) =%h \n",temp_tag_q_internal,golden_tag,temp_tag_wen_internal, (golden_tag &(~tag_mask_ff)));    
                      $finish;
                 end
           end
                      

          //write test
           ////$display("$$$$$$$$$  tag array   memory wen test passed                                    $");    
           ////$display("$$$$$$$$$  tag array   memory write test......                                   $");    
           @(posedge temp_tag_CLK) //write address 0
           #0.1 temp_tag_wen_internal   = {LOCAL_TAG_WE_WIDTH{1'b0}};
           #0.1 temp_tag_cen_internal   = 1'b0; 
           for(i=10;i<15;i = i+1)     //set address 10 ~15
           begin
           #0.1 temp_tag_wen_internal   = {LOCAL_TAG_WE_WIDTH{1'b0}};
           #0.1 temp_tag_cen_internal   = 1'b0; 
               @(posedge temp_tag_CLK)
                temp_tag_addr_internal <= {LOCAL_TAG_ADDR_WIDTH{1'b0}} + i;
                temp_tag_din_internal  <= {LOCAL_TAG_DATA_WIDTH{1'b0}} + i;
                golden_tag             <= {LOCAL_TAG_DATA_WIDTH{1'b0}} + i;
               @(posedge temp_tag_CLK)
               #0.1 temp_tag_wen_internal   = {LOCAL_TAG_WE_WIDTH{1'b1}};
                    golden_tag             <= temp_tag_din_internal;
               @(posedge temp_tag_CLK)
               #0.1   
                   ////$display("$          address = %h temp_tag_q_internal = %h , golden_tag =%h \n",temp_tag_addr_internal,temp_tag_q_internal,golden_tag);    
               if(temp_tag_q_internal !== golden_tag)
               begin
                   ////$display("$          Sorry, address %h memory write check fail ! @_@     $",temp_tag_addr_internal);    
                   $finish;
               end
           end


          //address width check
           ////$display("$$$$$$$$  tag array   memory read test passed                                    $");    
           ////$display("$$$$$$$$  tag array   memory address width test......                            $");    
           @(posedge temp_tag_CLK) //write address 
           #0.1 temp_tag_cen_internal   = 1'b0; 
           //write address 0 
           @(posedge temp_tag_CLK)
           temp_tag_wen_internal  <= {LOCAL_TAG_WE_WIDTH{1'b0}};
           temp_tag_addr_internal <= {LOCAL_TAG_ADDR_WIDTH{1'b0}} ;
           temp_tag_din_internal  <= {LOCAL_TAG_DATA_WIDTH{1'b0}} + 8'hbb;
           golden_tag             <= {LOCAL_TAG_DATA_WIDTH{1'b0}} + 8'hbb;
           //write address 1/2 max address
           @(posedge temp_tag_CLK)
           temp_tag_wen_internal  <= {LOCAL_TAG_WE_WIDTH{1'b0}};
           temp_tag_addr_internal <= {{3'b001}, {LOCAL_TAG_ADDR_WIDTH-3{1'b0}} } ;
           temp_tag_din_internal  <= {LOCAL_TAG_DATA_WIDTH{1'b0}} + 8'haa;
           golden_tag             <= {LOCAL_TAG_DATA_WIDTH{1'b0}} + 8'haa;

           //read address 1/2 max address
           @(posedge temp_tag_CLK)
           temp_tag_wen_internal  <= {LOCAL_TAG_WE_WIDTH{1'b1}};
           temp_tag_addr_internal <= {{3'b001}, {LOCAL_TAG_ADDR_WIDTH-3{1'b0}} } ;
           temp_tag_din_internal  <= {LOCAL_TAG_DATA_WIDTH{1'b0}} + 8'hff;
           golden_tag             <= {LOCAL_TAG_DATA_WIDTH{1'b0}} + 8'haa;
           @(posedge temp_tag_CLK)
           #0.1   
           if(temp_tag_q_internal !== golden_tag)
           begin
               ////$display("$          Sorry, address %h memory read check fail ! @_@     $",temp_tag_addr_internal);    
               $finish;
           end

           //read address 0
           @(posedge temp_tag_CLK)
           temp_tag_wen_internal  <= {LOCAL_TAG_WE_WIDTH{1'b1}};
           temp_tag_addr_internal <= {LOCAL_TAG_ADDR_WIDTH{1'b0}}  ;
           temp_tag_din_internal  <= {LOCAL_TAG_DATA_WIDTH{1'b0}} + 8'hff;
           golden_tag             <= {LOCAL_TAG_DATA_WIDTH{1'b0}} + 8'hbb;
           @(posedge temp_tag_CLK)
           #0.1   
           if(temp_tag_q_internal !== golden_tag)
           begin
               ////$display("$          Sorry, address %h memory read check fail ! @_@     $",temp_tag_addr_internal);    
               $finish;
           end

           ////$display("$$$$$$$  tag array   memory address width test passed                                $");    
           ////$display("$$$$$$$  tag array   memory data width test......                                    $");    
          //read data check
     
           @(posedge temp_tag_CLK) //write address 
           #0.1 temp_tag_cen_internal   = 1'b0; 
           @(posedge temp_tag_CLK)
           temp_tag_wen_internal  <= {LOCAL_TAG_WE_WIDTH{1'b0}};
           temp_tag_addr_internal <= {LOCAL_TAG_ADDR_WIDTH{1'b1}} ;
           temp_tag_din_internal  <= {LOCAL_TAG_DATA_WIDTH{1'b1}} ;
           golden_tag             <= {LOCAL_TAG_DATA_WIDTH{1'b1}} ;
           @(posedge temp_tag_CLK)
           #0.1 temp_tag_wen_internal   = {LOCAL_TAG_WE_WIDTH{1'b1}};
                golden_tag             <= temp_tag_din_internal;
           @(posedge temp_tag_CLK)
           #0.1   
               ////$display("$          address = %h temp_tag_q_internal = %h , golden_tag =%h \n",temp_tag_addr_internal,temp_tag_q_internal,golden_tag);    
           if(temp_tag_q_internal !== golden_tag)
           begin
               ////$display("$          Sorry, address %h memory read check fail ! @_@     $",temp_tag_addr_internal);    
               $finish;
           end
           ////$display("$$$$$$$  tag array   memory data width test passed                       $");    
          //read data check
           ////$display("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$");
           ////$display("$           tag array test passed!!!!!!!!!!!!!!!!!!!!                    $");    
           ////$display("$           tag array test passed!!!!!!!!!!!!!!!!!!!!                    $");    
           ////$display("$           tag array test passed!!!!!!!!!!!!!!!!!!!!                    $");    
           ////$display("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$");


           temp_dirty_CLK               = 1'b0; 
           temp_dirty_cen_internal      = 1'b0; 
           temp_dirty_wen_internal      = {LOCAL_DIRTY_WE_WIDTH{1'b1}};
           temp_dirty_addr_internal     = {LOCAL_DIRTY_ADDR_WIDTH{1'b0}};
           temp_dirty_din_internal      = {LOCAL_DIRTY_DATA_WIDTH{1'b0}};
           golden_dirty                 = {LOCAL_DIRTY_DATA_WIDTH{1'b0}};
           dirty_mask                   = {LOCAL_DIRTY_DATA_WIDTH{1'b0}};

           #20
           @(posedge temp_dirty_CLK)

           //cen==1 test
           ////$display("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$");
           ////$display("$ dirty array memory cen test cen ==1 test...                          $");   
           ////$display("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$");
           #0.1 temp_dirty_wen_internal   = {LOCAL_DIRTY_WE_WIDTH{1'b0}};
           #0.1 temp_dirty_cen_internal  = 1'b0; 
           for(i=1;i<10;i=i+1)     //set address 1~9
           begin
           #0.1 temp_dirty_wen_internal   = {LOCAL_DIRTY_WE_WIDTH{1'b0}};
           #0.1 temp_dirty_cen_internal  = 1'b0; 
               @(posedge temp_dirty_CLK)
                temp_dirty_addr_internal <= {LOCAL_DIRTY_ADDR_WIDTH{1'b0}} + i;
                temp_dirty_din_internal  <= {LOCAL_DIRTY_DATA_WIDTH{1'b0}} + i;
                golden_dirty             <= {LOCAL_DIRTY_DATA_WIDTH{1'b0}} + i;
               @(posedge temp_dirty_CLK)
                    golden_dirty              <= temp_dirty_din_internal;
               #0.1 temp_dirty_wen_internal   = {LOCAL_DIRTY_WE_WIDTH{1'b1}};
               @(posedge temp_dirty_CLK)
               #0.1   
                   ////$display("$address = %h temp_dirty_q_internal = %h , golden_dirty =%h \n",temp_dirty_addr_internal,temp_dirty_q_internal,golden_dirty);    
               if(temp_dirty_q_internal !== golden_dirty)
               begin
                   ////$display("$          Sorry, address %h memory write check fail ! @_@     $",temp_dirty_addr_internal);    
                   $finish;
               end
           end


           //cen==0 test
           ////$display("$$$$$$$$$  dirty array memory cen test cen ==1  test passed                     $");   
           ////$display("$$$$$$$$$  dirty array memory cen test  cen ==0 test...                         $");    
           #0.1 temp_dirty_wen_internal   = {LOCAL_DIRTY_WE_WIDTH{1'b0}};
           #0.1 temp_dirty_cen_internal  = 1'b1; 

           for(i=10;i<15;i=i+1)     //set address 10 ~15
           begin
               @(posedge temp_dirty_CLK)
                temp_dirty_addr_internal <= {LOCAL_DIRTY_ADDR_WIDTH{1'b0}} + i;
                temp_dirty_din_internal  <= {LOCAL_DIRTY_DATA_WIDTH{1'b0}} + 2;
                golden_dirty             <= {LOCAL_DIRTY_DATA_WIDTH{1'b0}} + 2;
               @(posedge temp_dirty_CLK)
               #0.1   
                   ////$display("$          address = %h temp_dirty_q_internal = %h , golden_dirty =%h \n",temp_dirty_addr_internal,temp_dirty_q_internal,golden_dirty);    
               if(temp_dirty_q_internal === golden_dirty)
               begin
                   ////$display("$          Sorry, address %h memory write check fail ! @_@     $",temp_dirty_addr_internal);    
                   $finish;
               end
           end

           //wen test
           ////$display("$$$$$$$$$  dirty array memory cen test  cen ==0 test passed                      $");    
           ////$display("$$$$$$$$$  dirty array memory wen test.......                                    $");    
           #0.1 temp_dirty_wen_internal   = {LOCAL_DIRTY_WE_WIDTH{1'b0}};
           #0.1 temp_dirty_cen_internal   = 1'b0; 
          for(i=0;i<LOCAL_DIRTY_WE_WIDTH + 1;i=i+1)
          begin
                 @(posedge temp_dirty_CLK)
                  temp_dirty_addr_internal <= {LOCAL_DIRTY_ADDR_WIDTH{1'b0}} ;
                  temp_dirty_wen_internal  <= {LOCAL_DIRTY_WE_WIDTH{1'b1}} >>i ; 
                  temp_dirty_din_internal  <= {LOCAL_DIRTY_DATA_WIDTH{1'b1}} ;
                 // golden_dirty             <= temp_dirty_din_internal ;
                 @(posedge temp_dirty_CLK)
                 @(posedge temp_dirty_CLK)
                 #0.1 temp_dirty_wen_internal  <= {LOCAL_DIRTY_WE_WIDTH{1'b1}};
                      golden_dirty             <= temp_dirty_din_internal;
                      dirty_mask_ff            <= dirty_mask;
                 @(posedge temp_dirty_CLK)
                  #0.1 
                      ////$display("$  address = %h temp_dirty_q_internal = %h , golden_dirty =%h,wen=%h \n",temp_dirty_addr_internal,temp_dirty_q_internal,(golden_dirty &(~dirty_mask)),temp_dirty_wen_internal);    
                 if(temp_dirty_q_internal !== (golden_dirty &(~dirty_mask_ff)) )
                 begin
                      ////$display("$  temp_dirty_q_internal = %h , golden_dirty =%h, wen=%h \n",temp_dirty_q_internal,golden_dirty,temp_dirty_wen_internal);    
                      $finish;
                 end
           end
            
                      
          //write test
           ////$display("$$$$$$$$$  dirty array memory wen test passed                                    $");    
           ////$display("$$$$$$$$$  dirty array memory write test......                                   $");    
           @(posedge temp_dirty_CLK) //write address 0
           #0.1 temp_dirty_wen_internal   = {LOCAL_DIRTY_WE_WIDTH{1'b0}};
           #0.1 temp_dirty_cen_internal   = 1'b0; 
           for(i=10;i<15;i = i+1)     //set address 10 ~15
           begin
           #0.1 temp_dirty_wen_internal   = {LOCAL_DIRTY_WE_WIDTH{1'b0}};
           #0.1 temp_dirty_cen_internal   = 1'b0; 
               @(posedge temp_dirty_CLK)
                temp_dirty_addr_internal <= {LOCAL_DIRTY_ADDR_WIDTH{1'b0}} + i;
                temp_dirty_din_internal  <= {LOCAL_DIRTY_DATA_WIDTH{1'b0}} + i;
                golden_dirty             <= {LOCAL_DIRTY_DATA_WIDTH{1'b0}} + i;
               @(posedge temp_dirty_CLK)
                    golden_dirty              <= temp_dirty_din_internal;
               #0.1 temp_dirty_wen_internal   = {LOCAL_DIRTY_WE_WIDTH{1'b1}};
               @(posedge temp_dirty_CLK)
               #0.1   
                   ////$display("$          address = %h temp_dirty_q_internal = %h , golden_dirty =%h \n",temp_dirty_addr_internal,temp_dirty_q_internal,golden_dirty);    
               if(temp_dirty_q_internal !== golden_dirty)
               begin
                   ////$display("$          Sorry, address %h memory write check fail ! @_@     $",temp_dirty_addr_internal);    
                   $finish;
               end
           end


          //address width check
           ////$display("$$$$$$$$$  dirty array memory read test passed                                    $");    
           ////$display("$$$$$$$$$  dirty array memory address width test......                            $");    
           @(posedge temp_dirty_CLK) //write address 
           #0.1 temp_dirty_cen_internal   = 1'b0; 
           //address 0
           @(posedge temp_dirty_CLK)
           temp_dirty_wen_internal  <= {LOCAL_DIRTY_WE_WIDTH{1'b0}};
           temp_dirty_addr_internal <= {LOCAL_DIRTY_ADDR_WIDTH{1'b0}} ;
           temp_dirty_din_internal  <= {LOCAL_DIRTY_DATA_WIDTH{1'b0}} + 8'hbb;
           golden_dirty             <= {LOCAL_DIRTY_DATA_WIDTH{1'b0}} + 8'hbb;
           //address 1/2 max address
           @(posedge temp_dirty_CLK)
           temp_dirty_wen_internal  <= {LOCAL_DIRTY_WE_WIDTH{1'b0}};
           temp_dirty_addr_internal <= {{3'b001}, {LOCAL_DIRTY_ADDR_WIDTH-3{1'b0}} };
           temp_dirty_din_internal  <= {LOCAL_DIRTY_DATA_WIDTH{1'b0}} + 8'haa;
           golden_dirty             <= {LOCAL_DIRTY_DATA_WIDTH{1'b0}} + 8'haa;
           //read data in 1/2 max address
           @(posedge temp_dirty_CLK)
           temp_dirty_wen_internal  <= {LOCAL_DIRTY_WE_WIDTH{1'b1}};
           temp_dirty_addr_internal <= {{3'b001}, {LOCAL_DIRTY_ADDR_WIDTH-3{1'b0}} };
           temp_dirty_din_internal  <= {LOCAL_DIRTY_DATA_WIDTH{1'b0}} + 8'hff;
           golden_dirty             <= {LOCAL_DIRTY_DATA_WIDTH{1'b0}} + 8'haa;
           @(posedge temp_dirty_CLK)
           #0.1  if(temp_dirty_q_internal !== golden_dirty)
           begin
               ////$display("$          Sorry, address %h memory read check fail ! @_@     $",temp_dirty_addr_internal);    
               $finish;
           end
           //read data in address 0
           @(posedge temp_dirty_CLK)
           temp_dirty_wen_internal  <= {LOCAL_DIRTY_WE_WIDTH{1'b1}};
           temp_dirty_addr_internal <= {LOCAL_DIRTY_ADDR_WIDTH{1'b0}} ;
           temp_dirty_din_internal  <= {LOCAL_DIRTY_DATA_WIDTH{1'b0}} + 8'hff;
           golden_dirty             <= {LOCAL_DIRTY_DATA_WIDTH{1'b0}} + 8'hbb;
           @(posedge temp_dirty_CLK)
           #0.1  if(temp_dirty_q_internal !== golden_dirty)
           begin
               ////$display("$          Sorry, address %h memory read check fail ! @_@     $",temp_dirty_addr_internal);    
               $finish;
           end

           ////$display("$$$$$$$$$  dirty array memory address width test passed                           $");    
           ////$display("$$$$$$$$$  dirty array memory data width test......                               $");    
          //read data check
     
           @(posedge temp_dirty_CLK) //write address 
           #0.1 temp_dirty_cen_internal   = 1'b0; 
           @(posedge temp_dirty_CLK)
           temp_dirty_wen_internal  <= {LOCAL_DIRTY_WE_WIDTH{1'b0}};
           temp_dirty_addr_internal <= {LOCAL_DIRTY_ADDR_WIDTH{1'b1}} ;
           temp_dirty_din_internal  <= {LOCAL_DIRTY_DATA_WIDTH{1'b1}} ;
           //golden_dirty             <= {LOCAL_DIRTY_DATA_WIDTH{1'b1}} ;
           @(posedge temp_dirty_CLK)
           #0.1 temp_dirty_wen_internal   = {LOCAL_DIRTY_WE_WIDTH{1'b1}};
                golden_dirty             <= temp_dirty_din_internal;
           @(posedge temp_dirty_CLK)
           #0.1   
               ////$display("$          address = %h temp_dirty_q_internal = %h , golden_dirty =%h \n",temp_dirty_addr_internal,temp_dirty_q_internal,golden_dirty);    
           if(temp_dirty_q_internal !== golden_dirty)
           begin
               ////$display("$          Sorry, address %h memory read check fail ! @_@     $",temp_dirty_addr_internal);    
               $finish;
           end
           ////$display("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$");
           ////$display("$$$$$$$$$  dirty array memory data width test passed                  $");    
           ////$display("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$");
          //read data check
           ////$display("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$");
           ////$display("$           dirty array test passed!!!!!!!!!!!!!!!!!!!!               $");    
           ////$display("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$");

           `ifdef DCACHE_16K
           $dispaly("$$$$$$$$  dcache 16k  Congratuations PASS!!!!!!!!!                     $");   
            `endif 
           `ifdef DCACHE_8K
           $dispaly("$$$$$$$$  dcache 8k  Congratuations PASS!!!!!!!!!                     $");   
            `endif 
           `ifdef DCACHE_4K
           $dispaly("$$$$$$$$  dcache 4k  Congratuations PASS!!!!!!!!!                     $");   
            `endif 
           `ifdef DCACHE_2K
           $dispaly("$$$$$$$$  dcache 2k  Congratuations PASS!!!!!!!!!                     $");   
            `endif 
           `ifdef DCACHE_1K
           /$dispaly("$$$$$$$$  dcache 1k  Congratuations PASS!!!!!!!!!                     $");   
            `endif 

             #10
             dmem_passed =1'b1;



end

//Dumping Control
//initial
//begin
//  $fsdbDumpfile("dmem_test.fsdb");
//  $fsdbDumpon;
//  $fsdbDumpvars();
//  //$dumpfile("test.vcd");
//  //$dumpvars;
//end


always 
#(`CLK_PERIOD/2)  temp_data_CLK = ~temp_data_CLK;
always 
#(`CLK_PERIOD/2)  temp_tag_CLK = ~temp_tag_CLK;
always 
#(`CLK_PERIOD/2)  temp_dirty_CLK = ~temp_dirty_CLK;
always 
#(`CLK_PERIOD/2)  temp_forever_cpuclk = ~temp_forever_cpuclk;

always @(posedge temp_data_CLK)
begin
//data array mask
// data_mask <= { {8{temp_data_wen_internal[3]}},{8{temp_data_wen_internal[2]}},{8{temp_data_wen_internal[1]}},{8{temp_data_wen_internal[0]}} };
`ifdef L1_CACHE_ECC
data_mask <= {{7{&temp_data_wen_internal}},{8{temp_data_wen_internal[3]}},{8{temp_data_wen_internal[2]}},{8{temp_data_wen_internal[1]}},{8{temp_data_wen_internal[0]}} };
`else
data_mask <= { {8{temp_data_wen_internal[3]}},{8{temp_data_wen_internal[2]}},{8{temp_data_wen_internal[1]}},{8{temp_data_wen_internal[0]}} };
`endif
//tag array mask
tag_mask <= {{26{temp_tag_wen_internal[1]}},{26{temp_tag_wen_internal[0]}}};

//dirty array mask
dirty_mask <=temp_dirty_wen_internal;

end 



ct_lsu_dcache_data_array x_way0_smbist_wrap (
`ifdef DCACHE_32K
  .data_idx                      (temp_data_addr_internal),
`endif

`ifdef DCACHE_64K
  .data_idx                      (temp_data_addr_internal),
`endif

  .data_sel_b              (  temp_data_cen_internal    ),
  .forever_cpuclk              (  temp_data_CLK             ),
  .data_din                (  temp_data_din_internal    ),
  .data_dout                (  temp_data_q_internal      ),
  .data_wen_b              (  temp_data_wen_internal    ),
  .data_gwen_b            (  &temp_data_wen_internal    ),
 // .b_done           (                            ),
 // .b_fail           (                            ),
 // .b_rst_n          (  1'b1                      ),
  .cp0_lsu_icg_en       (1'b0),
  // .pad_yy_gate_clk_en_b             (  1'b1                      ),
  .pad_yy_icg_scan_en       (   1'b0                     ),
 // .bstclk           (  1'b0                       ),
  .data_gateclk_en (1'b1      )
 // .s_mode           (  1'b0                      )
);

ct_lsu_dcache_tag_array x_tag_array (
`ifdef DCACHE_32K
  .tag_idx                      ({1'b0,temp_tag_addr_internal}),
`endif
`ifdef DCACHE_64K
  .tag_idx                      (temp_tag_addr_internal),
`endif
  .tag_sel_b                    (temp_tag_cen_internal ),
  .forever_cpuclk                    (temp_tag_CLK          ),
  .tag_din                      (temp_tag_din_internal ),
  .tag_dout                      (temp_tag_q_internal   ),
  .tag_wen_b                    (temp_tag_wen_internal ),
  .tag_gwen_b                    (&temp_tag_wen_internal ),
 // .b_done                 (                      ),
 // .b_fail                 (                      ),
 // .b_rst_n                (1'b1                  ),
  .tag_gateclk_en            (1'b1),
 // .pad_yy_gate_clk_en_b                   (1'b0                  ),
  .pad_yy_icg_scan_en       (   1'b0                     ),
 // .bstclk                 (1'b0                  ),
  .cp0_lsu_icg_en       (1'b0      )
  //.s_mode                 (1'b0                  )
);

ct_lsu_dcache_dirty_array x_dirty_array (
`ifdef DCACHE_32K
  .dirty_idx                        ( {1'b0,temp_dirty_addr_internal}    ), //address expand 1'b0
`endif
`ifdef DCACHE_64K
  .dirty_idx                        ( {temp_dirty_addr_internal}    ), //address expand 1'b0
`endif
  .dirty_sel_b                      ( temp_dirty_cen_internal            ),
  .forever_cpuclk                      ( temp_dirty_CLK                     ),
  .dirty_din                        ( temp_dirty_din_internal            ),
  .dirty_dout                        ( temp_dirty_q_internal              ),
  .dirty_wen_b                      ( temp_dirty_wen_internal            ),
  .dirty_gwen_b                      (&temp_dirty_wen_internal            ),
//  .b_done                   (),
//  .b_fail                   (),
//  .b_rst_n                  (1'b1      ),
  .dirty_gateclk_en        (1'b1),
// .pad_yy_gate_clk_en_b                     (1'b1      ),
  .pad_yy_icg_scan_en       (   1'b0                     ),
//  .bstclk                   (1'b0      ),
  .cp0_lsu_icg_en         (1'b0      )
//  .s_mode                   (1'b0      )
);

//gated_clk_cell  x_gated_clk_cell_xor (
//  .clk_in                   (temp_forever_cpuclk      ),
//  .clk_out                  (temp_xor_clk             ),
//  .external_en              (temp_external_en         ),
//  .global_en                (1'b0                     ),
//  .local_en                 (1'b0                     ),
//  .module_en                (1'b0                     ),
//  .pad_yy_bist_tst_en       (1'b0                     ),
//  .pad_yy_gate_clk_en_b     (1'b0                     ),
//  .pad_yy_test_mode         (temp_pad_yy_test_mode    )
//);

endmodule
