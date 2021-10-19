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

module cpu_l2_mem_test_tb(
l2_mem_passed
);
output l2_mem_passed;
reg    l2_mem_passed;
//data array parameter

//==========================================================
//                  Parameter Definition
//==========================================================

`ifdef L2_CACHE_256K
parameter LOCAL_DATA_ADDR_WIDTH  = 11;
parameter LOCAL_TAG_ADDR_WIDTH   = 7;
parameter LOCAL_DIRTY_ADDR_WIDTH = 7;
parameter LOCAL_TAG_DATA_WIDTH   = 104;
parameter LOCAL_TAG_WE_WIDTH     = 104;
`endif
`ifdef L2_CACHE_512K
parameter LOCAL_DATA_ADDR_WIDTH  = 12;
parameter LOCAL_TAG_ADDR_WIDTH   = 8;
parameter LOCAL_DIRTY_ADDR_WIDTH = 8;
parameter LOCAL_TAG_DATA_WIDTH   = 100;
parameter LOCAL_TAG_WE_WIDTH     = 100;
`endif
`ifdef L2_CACHE_1M
parameter LOCAL_DATA_ADDR_WIDTH  = 13;
parameter LOCAL_TAG_ADDR_WIDTH   = 9;
parameter LOCAL_DIRTY_ADDR_WIDTH = 9;
parameter LOCAL_TAG_DATA_WIDTH   = 96;
parameter LOCAL_TAG_WE_WIDTH     = 96;
`endif
`ifdef L2_CACHE_2M
parameter LOCAL_DATA_ADDR_WIDTH  = 14;
parameter LOCAL_TAG_ADDR_WIDTH   = 10;
parameter LOCAL_DIRTY_ADDR_WIDTH = 10;
parameter LOCAL_TAG_DATA_WIDTH   = 92;
parameter LOCAL_TAG_WE_WIDTH     = 92;
`endif
`ifdef L2_CACHE_4M
parameter LOCAL_DATA_ADDR_WIDTH  = 15;
parameter LOCAL_TAG_ADDR_WIDTH   = 11;
parameter LOCAL_DIRTY_ADDR_WIDTH = 11;
parameter LOCAL_TAG_DATA_WIDTH   = 88;
parameter LOCAL_TAG_WE_WIDTH     = 88;
`endif
`ifdef L2_CACHE_8M
parameter LOCAL_DATA_ADDR_WIDTH  = 16;
parameter LOCAL_TAG_ADDR_WIDTH   = 12;
parameter LOCAL_DIRTY_ADDR_WIDTH = 12;
parameter LOCAL_TAG_DATA_WIDTH   = 84;
parameter LOCAL_TAG_WE_WIDTH     = 84;
`endif

//data
parameter LOCAL_DATA_DATA_WIDTH = 128;
parameter LOCAL_DATA_WE_WIDTH   = 1;

//tag

//dirty
parameter LOCAL_DIRTY_DATA_WIDTH = 144;
parameter LOCAL_DIRTY_WE_WIDTH   = 144;


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
l2_mem_passed = 1'b0;
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
                   $display("$          Sorry, address %h memory write check fail ! @_@     $",temp_data_addr_internal);    
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
           temp_data_addr_internal <= 0;
           temp_data_din_internal <= 0;
           @(posedge temp_data_CLK)
          for(i=0;i<LOCAL_DATA_WE_WIDTH + 1;i=i+1)
          begin
                 @(posedge temp_data_CLK)
                  temp_data_addr_internal <= {LOCAL_DATA_ADDR_WIDTH{1'b0}};
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
                      $display("$  Sorry, temp_data_q_internal = %h , golden_data =%h, wen=%h \n",temp_data_q_internal,golden_data,temp_data_wen_internal);    
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
           temp_tag_addr_internal = 0;
           temp_tag_din_internal  = 0;
           @(posedge temp_tag_CLK)
          for(i=0;i<LOCAL_TAG_WE_WIDTH + 1;i=i+1)
          begin
                 @(posedge temp_tag_CLK)
                  temp_tag_addr_internal <= {LOCAL_TAG_ADDR_WIDTH{1'b0}} ;
                  temp_tag_wen_internal  <= {{LOCAL_TAG_WE_WIDTH{1'b1}}} >>i ; 
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
                      $display("$  temp_tag_q_internal = %h , golden_tag =%h, wen=%h, (golden_tag &(~tag_mask)) =%h i is %d\n",temp_tag_q_internal,golden_tag,temp_tag_wen_internal, (golden_tag &(~tag_mask_ff)), i);    
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

             #10
             l2_mem_passed =1'b1;



end

//Dumping Control
initial
begin
  // $fsdbDumpfile("l2_mem.fsdb");
  // $fsdbDumpon;
  // $fsdbDumpvars();
  // $dumpfile("test2.vcd");
  // $dumpvars;
end


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
 data_mask <= {LOCAL_DATA_DATA_WIDTH{temp_data_wen_internal}};

//tag array mask
//tag_mask <= {{24{temp_tag_wen_internal[3]}},{24{temp_tag_wen_internal[2]}},{24{temp_tag_wen_internal[1]}},{24{temp_tag_wen_internal[0]}}};
tag_mask <= temp_tag_wen_internal;

//dirty array mask
dirty_mask <=temp_dirty_wen_internal;

end 

// data 
`ifdef L2_CACHE_256K
ct_spsram_2048x128 x_data_array (
`elsif L2_CACHE_512K
ct_spsram_4096x128 x_data_array (
`elsif L2_CACHE_1M
ct_spsram_8192x128 x_data_array (
`elsif L2_CACHE_2M
ct_spsram_16384x128 x_data_array (
`elsif L2_CACHE_4M
ct_spsram_32768x128 x_data_array (
`elsif L2_CACHE_8M
ct_spsram_65536x128 x_data_array (
`endif
  .A                  (  temp_data_addr_internal   ),
  .CEN                (  temp_data_cen_internal    ),
  .CLK                (  temp_data_CLK             ),
  .D                  (  temp_data_din_internal    ),
  .Q                  (  temp_data_q_internal      ),
  .WEN                (  {LOCAL_DATA_DATA_WIDTH{temp_data_wen_internal}}    ),
  .GWEN               ( &temp_data_wen_internal    )
//  .pad_yy_icg_scan_en ( 1'b0                       )
);

// tag
`ifdef L2_CACHE_256K
ct_spsram_128x104    x_tag_array (
`elsif L2_CACHE_512K
ct_spsram_256x100    x_tag_array (
`elsif L2_CACHE_1M
ct_spsram_512x96     x_tag_array (
`elsif L2_CACHE_2M
ct_spsram_1024x92    x_tag_array (
`elsif L2_CACHE_4M
ct_spsram_2048x88    x_tag_array (
`elsif L2_CACHE_8M
ct_spsram_4096x84    x_tag_array (
`endif
  .A                  ( temp_tag_addr_internal       ),
  .CEN                ( temp_tag_cen_internal        ),
  .CLK                ( temp_tag_CLK                 ),
  .D                  ( temp_tag_din_internal        ),
  .Q                  ( temp_tag_q_internal          ),
  .WEN                ( temp_tag_wen_internal        ),
//  .WEN              ({{25{temp_tag_wen_internal[3]}},{25{temp_tag_wen_internal[2]}},
//                     {25{temp_tag_wen_internal[1]}},{25{temp_tag_wen_internal[0]}}} ),
  .GWEN               ( &temp_tag_wen_internal       )
);

// dirty
`ifdef L2_CACHE_256K
ct_spsram_128x144     x_dirty_array (
`elsif L2_CACHE_512K
ct_spsram_256x144     x_dirty_array (
`elsif L2_CACHE_1M
ct_spsram_512x144     x_dirty_array (
`elsif L2_CACHE_2M
ct_spsram_1024x144    x_dirty_array (
`elsif L2_CACHE_4M
ct_spsram_2048x144    x_dirty_array (
`elsif L2_CACHE_8M
ct_spsram_4096x144    x_dirty_array (
`endif
  .A                        ( temp_dirty_addr_internal           ),
  .CEN                      ( temp_dirty_cen_internal            ),
  .CLK                      ( temp_dirty_CLK                     ),
  .D                        ( temp_dirty_din_internal            ),
  .Q                        ( temp_dirty_q_internal              ),
  .WEN                      ( temp_dirty_wen_internal            ),
  .GWEN                     (&temp_dirty_wen_internal            )
);

endmodule
