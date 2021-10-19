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
//`include "./cpu_cfig.h"
module cpu_icg_test_tb(
icg_passed
);
output icg_passed;
reg icg_passed;
//data array parameter
//gated cell clk
reg temp_forever_cpuclk      ;
reg temp_external_en         ;
reg temp_pad_yy_test_mode    ;
wire temp_xor_clk            ;
always
#(`CLK_PERIOD/2)  temp_forever_cpuclk = ~temp_forever_cpuclk;

`ifdef GATED_CELL
gated_clk_cell  x_gated_clk_cell_xor (
  .clk_in                   (temp_forever_cpuclk      ),
  .clk_out                  (temp_xor_clk             ),
  .external_en              (temp_external_en         ),
  .global_en                (1'b0                     ),
  .local_en                 (1'b0                     ),
  .module_en                (1'b0                     ),
  // .pad_yy_gate_clk_en_b     (temp_pad_yy_test_mode   )

  .pad_yy_icg_scan_en       (   1'b0                     )
);

//initial
//begin
//  $fsdbDumpfile("icg.fsdb");
//  $fsdbDumpon;
//  $fsdbDumpvars();
//  //$dumpfile("test.vcd");
//  //  //$dumpvars;
//  //  end
//end
`endif



integer i;

`ifdef GATED_CELL
initial 
begin
//gated cell test
           #20
           temp_forever_cpuclk         = 1'b0;
           temp_external_en            = 1'b0;
           temp_pad_yy_test_mode       = 1'b0;
           icg_passed                  = 1'b0;
           #100
//gated celll type test 
           $display("$$$$$$$$$  gated clk type aftre gated,clkout should be 0  test......                                    $");    
           @(posedge temp_forever_cpuclk)
           #0.1
            if(temp_xor_clk !== 1'b0)
               begin
                   $display("$          Sorry, aftre gated clock out is  %h, gated clk check fail ! @_@     $",temp_xor_clk);    
                   $finish;
               end
            #(`CLK_PERIOD/2)
            if(temp_xor_clk !== 1'b0)
               begin
                   $display("$          gated clk  check fail ! @_@     $",temp_xor_clk);    
                   $finish;
               end

            #(`CLK_PERIOD/2)
            if(temp_xor_clk !== 1'b0)
               begin
                   $display("$          gated clk  check fail ! @_@     $",temp_xor_clk);    
                   $finish;
               end
//loacal enable enable test,clkout next cycle valid 
           $display("$$$$$$$$$  gated clk local en  enable  test......                                    $");    
           @(posedge temp_forever_cpuclk)
           #0.1
           temp_external_en            = 1'b1;
           temp_pad_yy_test_mode       = 1'b0;
           #0.1
            if(temp_xor_clk !== 1'b0)
               begin
                   $display("$          Sorry, aftre gated clock out is  %h, gated clk check fail ! @_@     $",temp_xor_clk);    
                   $finish;
               end
            #(`CLK_PERIOD/2)
            if(temp_xor_clk !== 1'b0)
               begin
                   $display("$          gated clk  check fail ! @_@     $",temp_xor_clk);    
                   $finish;
               end
            #(`CLK_PERIOD/2)
            if(temp_xor_clk !== 1'b1)
               begin
                   $display("$          gated loacl en  check fail ! @_@     $",temp_xor_clk);    
                   $finish;
               end

//loacal en disable test,clkout next cycle invalid
           $display("$$$$$$$$$  gated clk local en disable   test......                                  $");    
           @(posedge temp_forever_cpuclk)
           #0.1
           temp_external_en            = 1'b0;
           temp_pad_yy_test_mode       = 1'b0;
           #0.1
            if(temp_xor_clk !== 1'b1)
               begin
                   $display("$          Sorry, loacel en gated disable  check fail ! @_@     $",temp_xor_clk);    
                   $finish;
               end
            #(`CLK_PERIOD/2)
            if(temp_xor_clk !== 1'b0)
               begin
                   $display("$          Sorry, loacel en gated disable  check fail ! @_@     $",temp_xor_clk);    
                   $finish;
               end
            #(`CLK_PERIOD/2)
            if(temp_xor_clk !== 1'b0)
               begin
                   $display("$          Sorry, loacel en gated disable  check fail ! @_@     $",temp_xor_clk);    
                   $finish;
               end
//test en enable test,clkout current cycle vaild
           $display("$$$$$$$$$  gated clk test en enable   test......                                  $");    
           @(posedge temp_forever_cpuclk)
           #0.1
//           temp_external_en            = 1'b0;
//           temp_pad_yy_test_mode       = 1'b1;
//           #0.1
//            if(temp_xor_clk !== 1'b1)
//               begin
//                   $display("$          Sorry, test en enable  check fail ! @_@     $",temp_xor_clk);    
//                   $finish;
//               end
//            #(`CLK_PERIOD/2)
//            if(temp_xor_clk !== 1'b0)
//               begin
//                   $display("$          Sorry, test en enable  check fail ! @_@     $",temp_xor_clk);    
//                   $finish;
//               end
//            #(`CLK_PERIOD/2)
//            if(temp_xor_clk !== 1'b1)
//               begin
//                   $display("$          Sorry, test en enable  check fail ! @_@     $",temp_xor_clk);    
//                   $finish;
//               end
//
////test en disable test,clkout cycle cycle  invalid
//           $display("$$$$$$$$$  gated clk test en disable   test......                                  $");    
//           @(posedge temp_forever_cpuclk)
//           #0.1
           temp_external_en            = 1'b0;
           temp_pad_yy_test_mode       = 1'b0;
           #0.1
            if(temp_xor_clk !== 1'b0)
               begin
                   $display("$          Sorry, test en disable  check fail ! @_@     $",temp_xor_clk);    
                   $finish;
               end
            #(`CLK_PERIOD/2)
            if(temp_xor_clk !== 1'b0)
               begin
                   $display("$          Sorry, test en disable  check fail ! @_@     $",temp_xor_clk);    
                   $finish;
               end
            #(`CLK_PERIOD/2)
            if(temp_xor_clk !== 1'b0)
               begin
                   $display("$          Sorry, test en disable  check fail ! @_@     $",temp_xor_clk);    
                   $finish;
               end

//test en and loacal en both enabke  test,clkout valid current cycle
           $display("$$$$$$$$$  gated clk test en local en both enable   test......                                  $");    
           @(posedge temp_forever_cpuclk)
           #0.1
//           temp_external_en            = 1'b1;
//           temp_pad_yy_test_mode       = 1'b1;
//           #0.1
//            if(temp_xor_clk !== 1'b1)
//               begin
//                   $display("$          Sorry, gated enable check fail ! @_@     $",temp_xor_clk);    
//                   $finish;
//               end
//            #(`CLK_PERIOD/2)
//            if(temp_xor_clk !== 1'b0)
//               begin
//                   $display("$          Sorry, gated enable check fail ! @_@     $",temp_xor_clk);    
//                   $finish;
//               end
//            #(`CLK_PERIOD/2)
//            if(temp_xor_clk !== 1'b1)
//               begin
//                   $display("$          Sorry, gated enable check fail ! @_@     $",temp_xor_clk);    
//                   $finish;
//               end
//
////test en and loacal en both disable  test,clkout disable next cycle
//           $display("$$$$$$$$$  gated clk test en local en both disable   test......                                  $");    
//           @(posedge temp_forever_cpuclk)
//           #0.1
//           temp_external_en            = 1'b0;
//           temp_pad_yy_test_mode       = 1'b0;
//           #0.1
//            if(temp_xor_clk !== 1'b1)
//               begin
//                   $display("$          Sorry, gated disable check fail ! @_@     $",temp_xor_clk);    
//                   $finish;
//               end
//            #(`CLK_PERIOD/2)
//            if(temp_xor_clk !== 1'b0)
//               begin
//                   $display("$          Sorry, gated disable check fail ! @_@     $",temp_xor_clk);    
//                   $finish;
//               end
//            #(`CLK_PERIOD/2)
//            if(temp_xor_clk !== 1'b0)
//               begin
//                   $display("$          Sorry, gated disable check fail ! @_@     $",temp_xor_clk);    
//                   $finish;
//               end
           icg_passed = 1'b1;
           $display("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$");
           $display("$           gated clk test PASS!!!!!!!!!!!!!!!!!!!!                     $");    
           $display("$           gated clk test PASS!!!!!!!!!!!!!!!!!!!!                     $");    
           $display("$           gated clk test PASS!!!!!!!!!!!!!!!!!!!!                     $");    
           $display("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$");
end
`else
initial
begin
  icg_passed = 1'b1;
end
`endif


endmodule
