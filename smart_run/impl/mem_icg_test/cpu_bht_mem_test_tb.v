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
//`define BHT_2K
//`include "./cpu_cfig.h"

module cpu_bht_mem_test_tb(
bht_mem_passed
);
output bht_mem_passed;
reg    bht_mem_passed;
//data array parameter

//branch history table parameter
parameter LOCAL_DATA_ADDR_WIDTH = 10;

//==========================================================
//                  Parameter Definition
//==========================================================
parameter LOCAL_DATA_DATA_WIDTH = 64;
parameter LOCAL_DATA_WE_WIDTH   = 64;





//data array signal
reg [ LOCAL_DATA_ADDR_WIDTH-1 : 0 ] temp_data_addr_internal;
reg [ LOCAL_DATA_DATA_WIDTH-1 : 0 ] temp_data_din_internal ;
reg [ LOCAL_DATA_WE_WIDTH  -1 : 0 ] temp_data_wen_internal ;
reg                                 temp_data_cen_internal ;
reg                                 temp_data_CLK          ;
wire [ LOCAL_DATA_DATA_WIDTH-1 : 0] temp_data_q_internal   ;
reg  [ LOCAL_DATA_DATA_WIDTH-1 : 0] golden_data      ;
reg  [ LOCAL_DATA_DATA_WIDTH-1 : 0] data_mask   ;
reg  [ LOCAL_DATA_DATA_WIDTH-1 : 0] data_mask_ff   ;

//gated cell clk
reg temp_forever_cpuclk      ;
reg temp_external_en         ;
reg temp_pad_yy_test_mode    ;
wire temp_xor_clk            ;


integer i;

initial 
begin
bht_mem_passed =1'b0;


////memory test
           temp_data_CLK               = 1'b0; 
           temp_data_cen_internal      = 1'b0; 
           temp_data_wen_internal      = {LOCAL_DATA_WE_WIDTH{1'b1}};
           temp_data_addr_internal     = {LOCAL_DATA_ADDR_WIDTH{1'b0}};
           temp_data_din_internal      = {LOCAL_DATA_DATA_WIDTH{1'b0}};
           golden_data                 = {LOCAL_DATA_DATA_WIDTH{1'b0}};
           data_mask                   = {LOCAL_DATA_DATA_WIDTH{1'b0}};
           #20
           @(posedge temp_data_CLK)

           //write
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

           //read
           //$display("$$$$$$$$  data array  memory cen test cen ==1 test...                          $");   
           @(posedge temp_data_CLK)
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
                temp_data_din_internal  <= {LOCAL_DATA_DATA_WIDTH{1'b0}} + 2;
                golden_data             <= {LOCAL_DATA_DATA_WIDTH{1'b0}} + 2;
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
          for(i=0;i<LOCAL_DATA_WE_WIDTH/2 ;i=i+1)
          begin
                 @(posedge temp_data_CLK)
                  temp_data_addr_internal <= {LOCAL_DATA_ADDR_WIDTH{1'b0}} ;
                  temp_data_wen_internal  <= {{LOCAL_DATA_WE_WIDTH-2{1'b1}},2'b0} <<2*i ; 
                  temp_data_din_internal  <= {LOCAL_DATA_DATA_WIDTH{1'b1}} ;
                  golden_data             <= {LOCAL_DATA_DATA_WIDTH{1'b1}} ;
                 @(posedge temp_data_CLK)
                 @(posedge temp_data_CLK)
                  #0.1 temp_data_wen_internal  <= {LOCAL_DATA_WE_WIDTH{1'b1}};
                       golden_data             <= temp_data_din_internal ;
                       data_mask_ff            <= data_mask;
                 @(posedge temp_data_CLK)
                  #0.1 
                     // $display("$  address = %h temp_data_q_internal = %h , golden_data =%h,wen=%h \n",temp_data_addr_internal,temp_data_q_internal,(golden_data &(~data_mask)),temp_data_wen_internal);    
                 if(temp_data_q_internal !== (golden_data &(~data_mask_ff)) )
                 begin
                     // $display("$  Sorry, temp_data_q_internal = %h , golden_data =%h, wen=%h \n",temp_data_q_internal,golden_data,temp_data_wen_internal);    
                      $finish;
                 end
           end
            

          //write test
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
           temp_data_addr_internal <= { {1{1'b1}},{LOCAL_DATA_ADDR_WIDTH-1{1'b0}} } ; // 1/2 max address 
           temp_data_din_internal  <= {LOCAL_DATA_DATA_WIDTH{1'b0}} + 8'haa;
           golden_data             <= {LOCAL_DATA_DATA_WIDTH{1'b0}} + 8'haa;

           //read data in 1/2max address
           @(posedge temp_data_CLK)
           temp_data_wen_internal  <= {LOCAL_DATA_WE_WIDTH{1'b1}};
           temp_data_addr_internal <= { {1{1'b1}},{LOCAL_DATA_ADDR_WIDTH-1{1'b0}} } ; // 1/2 max address
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


           $display("$$$$$$$$  bht  Congratuations PASS!!!!!!!!!                     $");   
           #10
             bht_mem_passed = 1'b1;

end

//Dumping Control
//initial
//begin
//  $fsdbDumpfile("bht_mem.fsdb");
//  $fsdbDumpon;
//  $fsdbDumpvars();
//  //$dumpfile("test.vcd");
//  //$dumpvars;
//end


always 
#(`CLK_PERIOD/2)  temp_data_CLK = ~temp_data_CLK;
//always 
//#(`CLK_PERIOD/2)  temp_tag_CLK = ~temp_tag_CLK;
//always 
//#(`CLK_PERIOD/2)  temp_dirty_CLK = ~temp_dirty_CLK;
always 
#(`CLK_PERIOD/2)  temp_forever_cpuclk = ~temp_forever_cpuclk;

always @(posedge temp_data_CLK)
begin
//data array mask
 data_mask <= { {temp_data_wen_internal[63:0]} };
end 



ct_ifu_bht_pre_array  x_way0_smbist_wrap (
  .bht_pred_array_index        (  temp_data_addr_internal   ),
  .bht_pred_array_cen_b        (  temp_data_cen_internal    ),
  .forever_cpuclk              (  temp_data_CLK             ),
  .bht_pred_array_din          (  temp_data_din_internal    ),
  .bht_pre_data_out            (  temp_data_q_internal      ),
  .bht_pred_bwen               (  temp_data_wen_internal    ),
  .bht_pred_array_gwen         ( &temp_data_wen_internal    ),
  // .pad_yy_gate_clk_en_b          (  1'b0                      ),
  .pad_yy_icg_scan_en                 (   1'b0                     ),
  .cp0_ifu_icg_en          (  1'b0                      ),
  .cp0_yy_clk_en          (  1'b1                      ),
  .bht_pre_array_clk_en          (  1'b1                      )
);


endmodule
