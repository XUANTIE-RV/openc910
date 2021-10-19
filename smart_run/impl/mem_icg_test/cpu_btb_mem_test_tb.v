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
`define BTB
//`include "./cpu_cfig.h"

module cpu_btb_mem_test_tb(
btb_mem_passed
);
output btb_mem_passed;
reg btb_mem_passed;

`ifndef BTB

initial
begin
#10
btb_mem_passed =1'b1;
#100
$display("$$$$$$$$ BTB not define $$$$$$$ $");   
end

`else

//data array parameter

//==========================================================
//                  Parameter Definition
//==========================================================
//btb data
`ifdef BTB_1024
parameter LOCAL_DATA_ADDR_WIDTH = 10;
parameter LOCAL_TAG_ADDR_WIDTH  = 10;
`endif
`ifdef BTB_2048
parameter LOCAL_DATA_ADDR_WIDTH = 10;
parameter LOCAL_TAG_ADDR_WIDTH  = 10;
`endif

parameter LOCAL_DATA_DATA_WIDTH = 44;
parameter LOCAL_DATA_WE_WIDTH   = 4;


//icache dirty
parameter LOCAL_TAG_DATA_WIDTH = 22;
parameter LOCAL_TAG_WE_WIDTH   = 4;





//data array signal
reg [ LOCAL_DATA_ADDR_WIDTH-1 : 0 ] temp_data_addr_internal;
reg [ LOCAL_DATA_DATA_WIDTH-1 : 0 ] temp_data_din_internal ;
reg [ LOCAL_DATA_WE_WIDTH  -1 : 0 ] temp_data_wen_internal ;
reg                                 temp_data_cen_internal ;
reg                                 temp_data_CLK          ;
wire [ LOCAL_DATA_DATA_WIDTH-1 : 0] temp_data_q_internal   ;
wire [ 2*LOCAL_DATA_DATA_WIDTH-1 : 0] temp_data_q_internal_2   ;
reg  [ LOCAL_DATA_DATA_WIDTH-1 : 0] golden_data      ;
reg  [ LOCAL_DATA_DATA_WIDTH-1 : 0] data_mask   ;
reg  [ LOCAL_DATA_DATA_WIDTH-1 : 0] data_mask_ff   ;

//tag array signal
reg [ LOCAL_TAG_ADDR_WIDTH-1 : 0 ] temp_tag_addr_internal;
reg [ LOCAL_TAG_DATA_WIDTH-1 : 0 ] temp_tag_din_internal ;
reg [ LOCAL_TAG_WE_WIDTH  -1 : 0 ] temp_tag_wen_internal ;
reg                                temp_tag_cen_internal ;
reg                                temp_tag_CLK          ;
wire [ LOCAL_TAG_DATA_WIDTH-1 : 0] temp_tag_q_internal   ;
wire [ 2*LOCAL_TAG_DATA_WIDTH-1 : 0] temp_tag_q_internal_2   ;
reg  [ LOCAL_TAG_DATA_WIDTH-1 : 0] golden_tag      ;
reg  [ LOCAL_TAG_DATA_WIDTH-1 : 0] tag_mask   ;
reg  [ LOCAL_TAG_DATA_WIDTH-1 : 0] tag_mask_ff   ;


//gated cell clk
reg temp_forever_cpuclk      ;
reg temp_external_en         ;
reg temp_pad_yy_test_mode    ;
wire temp_xor_clk            ;


integer i;

initial 
begin

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
           //$display("$$$$$$$$  data array  memory cen test cen ==1 test...                          $");   
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
           //$display("$$$$$$$$  data array  memory cen test cen ==1 test...                          $");   
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
                   //$display("$address = %h temp_data_q_internal = %h , golden_data =%h \n",temp_data_addr_internal,temp_data_q_internal,golden_data);    
               if(temp_data_q_internal !== golden_data)
               begin
                   //$display("$          Sorry, address %h memory write check fail ! @_@     $",temp_data_addr_internal);    
                   $finish;
               end
           end

           //cen==0 test
           //$display("$$$$$$$$$$  data array  memory cen test cen ==1  test passed                     $\n");   
           //$display("$$$$$$$$$$  data array  memory cen test  cen ==0 test...                         $");    
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
                   //$display("$          address = %h temp_data_q_internal = %h , golden_data =%h \n",temp_data_addr_internal,temp_data_q_internal,golden_data);    
               if(temp_data_q_internal === golden_data)
               begin
                   //$display("$          Sorry, address %h memory write check fail ! @_@     $",temp_data_addr_internal);    
                   $finish;
               end
           end



           //wen test
           //$display("$$$$$$$$$  data array  memory cen test  cen ==0 test passed                      $");    
           //$display("$$$$$$$$$  data array  memory wen test.......                                    $");    
           #0.1 temp_data_wen_internal   = {LOCAL_DATA_WE_WIDTH{1'b0}};
           #0.1 temp_data_cen_internal   = 1'b0; 
          for(i=0;i<LOCAL_DATA_WE_WIDTH + 1;i=i+1)
          begin
                 @(posedge temp_data_CLK)
                  temp_data_addr_internal <= {LOCAL_DATA_ADDR_WIDTH{1'b0}} ;
                  temp_data_wen_internal  <= {1'b0,{LOCAL_DATA_WE_WIDTH{1'b1}}} >>i ; 
                  temp_data_din_internal  <= i;
                  golden_data             <= i;
                 @(posedge temp_data_CLK)
                 @(posedge temp_data_CLK)
                  #0.1 temp_data_wen_internal  <= {LOCAL_DATA_WE_WIDTH{1'b1}};
                       golden_data             <= temp_data_din_internal ;
                       data_mask_ff            <= data_mask;
                 @(posedge temp_data_CLK)
                  #0.1 
                      //$display("$  address = %h temp_data_q_internal = %h , golden_data =%h,wen=%h \n",temp_data_addr_internal,temp_data_q_internal,(golden_data &(~data_mask)),temp_data_wen_internal);    
                 if(temp_data_q_internal !== (golden_data &(~data_mask_ff)) )
                 begin
                      //$display("$  Sorry, temp_data_q_internal = %h , golden_data =%h, wen=%h \n",temp_data_q_internal,golden_data,temp_data_wen_internal);    
                      $finish;
                 end
           end
            
                      

          //we test
           //$display("$$$$$$$$$  data array  memory wen test passed                                    $");    
           //$display("$$$$$$$$$  data array  memory write test......                                   $");    
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
                   //$display("$          address = %h temp_data_q_internal = %h , golden_data =%h \n",temp_data_addr_internal,temp_data_q_internal,golden_data);    
               if(temp_data_q_internal !== golden_data)
               begin
                   //$display("$          Sorry, address %h memory write check fail ! @_@     $",temp_data_addr_internal);    
                   $finish;
               end
           end


          //address width check
           //$display("$$$$$$$$  data array  memory read test passed                                    $");    
           //$display("$$$$$$$$  data array  memory address width test......                            $");    
           @(posedge temp_data_CLK) //write address 
           #0.1 temp_data_cen_internal   = 1'b0; 
           @(posedge temp_data_CLK)
           temp_data_wen_internal  <= {LOCAL_DATA_WE_WIDTH{1'b0}};
           temp_data_addr_internal <= {LOCAL_DATA_ADDR_WIDTH{1'b0}} ;                // 0 address write bb
           temp_data_din_internal  <= {LOCAL_DATA_DATA_WIDTH{1'b0}} + 8'hbb;
           golden_data             <= {LOCAL_DATA_DATA_WIDTH{1'b0}} + 8'hbb;
           @(posedge temp_data_CLK)
           temp_data_wen_internal  <= {LOCAL_DATA_WE_WIDTH{1'b0}};
           temp_data_addr_internal <= {3'b001,{LOCAL_DATA_ADDR_WIDTH-3{1'b0}}} ; // 1/8 max address 
           temp_data_din_internal  <= {LOCAL_DATA_DATA_WIDTH{1'b0}} + 8'haa;
           golden_data             <= {LOCAL_DATA_DATA_WIDTH{1'b0}} + 8'haa;

           //read data in 1/8max address
           @(posedge temp_data_CLK)
           temp_data_wen_internal  <= {LOCAL_DATA_WE_WIDTH{1'b1}};
           temp_data_addr_internal <= {3'b001,{LOCAL_DATA_ADDR_WIDTH-3{1'b0}}} ; // 1/2 max address
           temp_data_din_internal  <= {LOCAL_DATA_DATA_WIDTH{1'b0}} + 8'hff;
           golden_data             <= {LOCAL_DATA_DATA_WIDTH{1'b0}} + 8'haa;
           @(posedge temp_data_CLK)
           #0.1   
           if(temp_data_q_internal !== golden_data)
           begin
               //$display("$          Sorry, address %h memory read check fail ! @_@     $",temp_data_addr_internal);    
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
               //$display("$          Sorry, address %h memory read check fail ! @_@     $",temp_data_addr_internal);    
               $finish;
           end
           //$display("$$$$$$$$  data array  memory address width test passed                           $");    
           //$display("$$$$$$$$  data array  memory data width test......                               $");    
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
               //$display("$          address = %h temp_data_q_internal = %h , golden_data =%h \n",temp_data_addr_internal,temp_data_q_internal,golden_data);    
           if(temp_data_q_internal !== golden_data)
           begin
               //$display("$          Sorry, address %h memory read check fail ! @_@     $",temp_data_addr_internal);    
               $finish;
           end
           //$display("$$$$$$$$  data array  memory data width test passed                          $");    
          //read data check
           //$display("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$");
           //$display("$           data array test PASS!!!!!!!!!!!!!!!!!!!!                     $");    
           //$display("$           data array test PASS!!!!!!!!!!!!!!!!!!!!                     $");    
           //$display("$           data array test PASS!!!!!!!!!!!!!!!!!!!!                     $");    
           //$display("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$");


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
           //$display("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$");
           //$display("$$$$$$$  tag array   memory cen test cen ==1 test...                  $");   
           //$display("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$");
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
                   //$display("$address = %h temp_tag_q_internal = %h , golden_tag =%h \n",temp_tag_addr_internal,temp_tag_q_internal,golden_tag);    
               if(temp_tag_q_internal !== golden_tag)
               begin
                   //$display("$          Sorry, address %h memory write check fail ! @_@     $",temp_tag_addr_internal);    
                   $finish;
               end
           end


           //cen==0 test
           //$display("$$$$$$$$  tag array   memory cen test cen ==1  test passed                     $");   
           //$display("$$$$$$$$  tag array   memory cen test  cen ==0 test...                         $");    
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
                   //$display("$          address = %h temp_tag_q_internal = %h , golden_tag =%h \n",temp_tag_addr_internal,temp_tag_q_internal,golden_tag);    
               if(temp_tag_q_internal === golden_tag)
               begin
                   //$display("$          Sorry, address %h memory write check fail ! @_@     $",temp_tag_addr_internal);    
                   $finish;
               end
           end



           //wen test
           //$display("$$$$$$$  tag array   memory cen test  cen ==0 test passed                      $");    
           //$display("$$$$$$$  tag array   memory wen test.......                                    $");    
           #0.1 temp_tag_wen_internal   = {LOCAL_TAG_WE_WIDTH{1'b0}};
           #0.1 temp_tag_cen_internal   = 1'b0; 
          for(i=0;i<LOCAL_TAG_WE_WIDTH + 1;i=i+1)
          begin
                 @(posedge temp_tag_CLK)
                  temp_tag_addr_internal <= {LOCAL_TAG_ADDR_WIDTH{1'b0}} ;
                  temp_tag_wen_internal  <= {LOCAL_TAG_WE_WIDTH{1'b1}} >>i ; 
                  temp_tag_din_internal  <= {LOCAL_TAG_DATA_WIDTH{1'b1}} ;
                  golden_tag             <= temp_tag_din_internal ;
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
                      //$display("$  temp_tag_q_internal = %h , golden_tag =%h, wen=%h \n",temp_tag_q_internal,golden_tag,temp_tag_wen_internal);    
                      $finish;
                 end
           end
            
                      

          //write test
           //$display("$$$$$$$$$  tag array   memory wen test passed                                    $");    
           //$display("$$$$$$$$$  tag array   memory write test......                                   $");    
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
                   //$display("$          address = %h temp_tag_q_internal = %h , golden_tag =%h \n",temp_tag_addr_internal,temp_tag_q_internal,golden_tag);    
               if(temp_tag_q_internal !== golden_tag)
               begin
                   //$display("$          Sorry, address %h memory write check fail ! @_@     $",temp_tag_addr_internal);    
                   $finish;
               end
           end




          //address width check
           //$display("$$$$$$$$  tag array   memory read test passed                                    $");    
           //$display("$$$$$$$$  tag array   memory address width test......                            $");    
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
               //$display("$          Sorry, address %h memory read check fail ! @_@     $",temp_tag_addr_internal);    
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
               //$display("$          Sorry, address %h memory read check fail ! @_@     $",temp_tag_addr_internal);    
               $finish;
           end

           //$display("$$$$$$$  tag array   memory address width test passed                                $");    
           //$display("$$$$$$$  tag array   memory data width test......                                    $");    
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
               //$display("$          address = %h temp_tag_q_internal = %h , golden_tag =%h \n",temp_tag_addr_internal,temp_tag_q_internal,golden_tag);    
           if(temp_tag_q_internal !== golden_tag)
           begin
               //$display("$          Sorry, address %h memory read check fail ! @_@     $",temp_tag_addr_internal);    
               $finish;
           end
           //$display("$$$$$$$  tag array   memory data width test passed                       $");    
          //read data check
           //$display("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$");
           //$display("$           tag array test passed!!!!!!!!!!!!!!!!!!!!                    $");    
           //$display("$           tag array test passed!!!!!!!!!!!!!!!!!!!!                    $");    
           //$display("$           tag array test passed!!!!!!!!!!!!!!!!!!!!                    $");    
           //$display("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$");


                 #10
             btb_mem_passed = 1'b1; 

end

//Dumping Control
//initial
//begin
//  ////$display("######time:%d, Dump start######",$time);
//  $fsdbDumpfile("btb_mem.fsdb");
//  $fsdbDumpon;
//  $fsdbDumpvars();
//  //$dumpfile("test.vcd");
//  //$dumpvars;
//end


always 
#(`CLK_PERIOD/2)  temp_data_CLK = ~temp_data_CLK;
always 
#(`CLK_PERIOD/2)  temp_tag_CLK = ~temp_tag_CLK;
//always 
//#(`CLK_PERIOD/2)  temp_dirty_CLK = ~temp_dirty_CLK;
always 
#(`CLK_PERIOD/2)  temp_forever_cpuclk = ~temp_forever_cpuclk;

always @(posedge temp_data_CLK)
begin
//data array mask
 data_mask <= {{22{temp_data_wen_internal[3]}},{22{temp_data_wen_internal[2]}}, {22{temp_data_wen_internal[1]}},{22{temp_data_wen_internal[0]}} };

//tag array mask
tag_mask <={{11{temp_tag_wen_internal[3]}},{11{temp_tag_wen_internal[2]}},{11{temp_tag_wen_internal[1]}},{11{temp_tag_wen_internal[0]}}};

//dirty array mask
//dirty_mask <={temp_dirty_wen_internal[1:0]};

end 


ct_ifu_btb_data_array x_way0_smbist_wrap (
  .btb_index                (  temp_data_addr_internal   ),
  .btb_data_cen_b           (  temp_data_cen_internal    ),
  .forever_cpuclk           (  temp_data_CLK             ),
  .btb_data_din             (  temp_data_din_internal    ),
  .btb_data_dout            (  temp_data_q_internal_2 ),
  .btb_data_wen             (  temp_data_wen_internal    ),
  // .pad_yy_gate_clk_en_b       (  1'b0                      ),
  .pad_yy_icg_scan_en                 (   1'b1                     ),
  .cp0_yy_clk_en         (  1'b1                     ),
  .cp0_ifu_icg_en         (  1'b1                     ),
  .btb_data_clk_en         (  1'b1                     )
);

ct_ifu_btb_tag_array x_tag_array (
  .btb_index                      (temp_tag_addr_internal),
  .btb_tag_cen_b                  (temp_tag_cen_internal ),
  .forever_cpuclk                 (temp_tag_CLK          ),
  .btb_tag_din                    (temp_tag_din_internal ),
  .btb_tag_dout                   (temp_tag_q_internal_2   ),
  .btb_tag_wen                    (temp_tag_wen_internal ),
  // .pad_yy_gate_clk_en_b             (1'b0                  ),
  .pad_yy_icg_scan_en                 (   1'b1                     ),
  .cp0_yy_clk_en               (1'b1                  ),
  .cp0_ifu_icg_en            (1'b1) ,
  .btb_tag_clk_en             (1'b1)
);

assign temp_data_q_internal = temp_data_q_internal_2[LOCAL_DATA_DATA_WIDTH-1:0];
assign temp_tag_q_internal  = temp_tag_q_internal_2[LOCAL_TAG_DATA_WIDTH-1:0];

`endif

endmodule
