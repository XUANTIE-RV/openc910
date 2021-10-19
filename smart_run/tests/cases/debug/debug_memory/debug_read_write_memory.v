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

// `include "./had_drv.vh"

`define TEST_FAIL_AND_FINISH \
    FILE = $fopen("run_case.report","w"); \
    $fdisplay(FILE,"TEST FAIL");   \
    #100; \
    $finish; 

module debug_read_write_memory(
);

reg[15:0]  hsr_data_out;
reg[63:0]  wbbr_data_out;
reg[63:0]  rand_data;

static integer FILE;

initial
  begin
    hsr_data_out   = 0;
    wbbr_data_out  = 0;
    rand_data      = 0;
    #10000;

    jtag_rst(32'h10);
open_event;
//===============================================
//Main Program: 1. Set DR enter debug mode and then clear DR bit.
//===============================================
    write_hadreg_corea(`hcr,32'h8000);                 //set DR
    wait_debug_mode_corea;
    write_hadreg_corea(`hcr,32'h0);                    //clear DR
    write_hadreg_corea(`event_outen,32'h0); 



//-----------------------------------------------
//1. initial base register
//2. use ld inst access address stored in base register
//-----------------------------------------------
    write_hadreg_corea(`csr,16'h100);                  //set FFY=1
    rand_data = 64'h0;
    $display("Write X6 = 0x%h",rand_data);
    write_hadreg_corea(`wbbr,rand_data);
    write_hadreg_corea(`ir_go_nex,`MV_X6_X6);         //write X6
    write_hadreg_corea(`csr,16'h0);                   //set FFY=0

//Set FFY=0 Read Memory
    write_hadreg_corea(`csr,16'h0);
    write_hadreg_corea(`ir_go_nex,`LD_X7_0_X6 );
    hsr_data_out[12] = 0;
    while(!hsr_data_out[12])
       read_hadreg_corea(`hsr,hsr_data_out);
    read_hadreg_corea(`wbbr,wbbr_data_out);
    $display("read address 0 = 0x%h",wbbr_data_out);



//-----------------------------------------------
//Set FFY=1 Write Memory
    write_hadreg_corea(`csr,16'h100);
// initial base register
    write_hadreg_corea(`wbbr,64'h0);
    write_hadreg_corea(`ir_go_nex,`MV_X6_X6);

    write_hadreg_corea(`wbbr,64'h1111111111111111);
    $display("write address  0 = 0x%h",64'h1111111111111111);
    write_hadreg_corea(`ir_go_nex,`MV_X7_X7);
    write_hadreg_corea(`ir_go_nex,`SD_X7_0_X6);

    write_hadreg_corea(`wbbr,64'h2222222222222222);
    $display("write address  8 = 0x%h",64'h2222222222222222);
    write_hadreg_corea(`ir_go_nex,`MV_X7_X7);
    write_hadreg_corea(`ir_go_nex,`SD_X7_8_X6);

    write_hadreg_corea(`wbbr,64'h3333333333333333);
    $display("write address 16 = 0x%h",64'h3333333333333333);
    write_hadreg_corea(`ir_go_nex,`MV_X7_X7);
    write_hadreg_corea(`ir_go_nex,`SD_X7_16_X6);

    write_hadreg_corea(`wbbr,64'h4444444444444444);
    $display("write address 24 = 0x%h",64'h4444444444444444);
    write_hadreg_corea(`ir_go_nex,`MV_X7_X7);
    write_hadreg_corea(`ir_go_nex,`SD_X7_24_X6);

//Set FFY=0 Read Memory
    write_hadreg_corea(`csr,16'h0);
    write_hadreg_corea(`ir_go_nex,`LD_X7_0_X6 );
    hsr_data_out[12] = 0;
    while(!hsr_data_out[12])
       read_hadreg_corea(`hsr,hsr_data_out);
   read_hadreg_corea(`wbbr,wbbr_data_out);
    if(wbbr_data_out == 64'h1111111111111111)
      $display("Success!Addr at X6+0 mem is 0x%h!",wbbr_data_out);
    else begin
      $display("Fail!Addr at X6+0 mem is 0x%h!",wbbr_data_out);
//      write_hadreg_corea(`pc_go_ex,`TEST_FAIL);
//
      // $finish;
      `TEST_FAIL_AND_FINISH
    end

    write_hadreg_corea(`ir_go_nex,`LD_X7_8_X6 );
    wbbr_data_out = 64'h0;
    hsr_data_out[12] = 0;
    while(!hsr_data_out[12])
      read_hadreg_corea(`hsr,hsr_data_out);
    read_hadreg_corea(`wbbr,wbbr_data_out);
    if(wbbr_data_out == 64'h2222222222222222)
      $display("Success!Addr at X6+8 mem is 0x%h!",wbbr_data_out);
    else begin
      $display("Fail!Addr at X6+8 mem is 0x%h!",wbbr_data_out);
//      write_hadreg_corea(`pc_go_ex,`TEST_FAIL);

      // $finish;
      `TEST_FAIL_AND_FINISH
    end

    write_hadreg_corea(`ir_go_nex,`LD_X7_16_X6 );
    wbbr_data_out = 64'h0;
    hsr_data_out[12] = 0;
    while(!hsr_data_out[12])
      read_hadreg_corea(`hsr,hsr_data_out);
    read_hadreg_corea(`wbbr,wbbr_data_out);
    if(wbbr_data_out == 64'h3333333333333333)
      $display("Success!Addr at X6+16 mem is 0x%h!",wbbr_data_out);
    else begin
      $display("Fail!Addr at X6+16 mem is 0x%h!",wbbr_data_out);
//      write_hadreg_corea(`pc_go_ex,`TEST_FAIL);
      // $finish;
      `TEST_FAIL_AND_FINISH
    end

    write_hadreg_corea(`ir_go_nex,`LD_X7_24_X6 );
    wbbr_data_out = 64'h0;
    hsr_data_out[12] = 0;
    while(!hsr_data_out[12])
      read_hadreg_corea(`hsr,hsr_data_out);
    read_hadreg_corea(`wbbr,wbbr_data_out);
    if(wbbr_data_out == 64'h4444444444444444)
      $display("Success!Addr at X6+24 mem is 0x%h!",wbbr_data_out);
    else begin
      $display("Fail!Addr at X6+24 mem is 0x%h!",wbbr_data_out);
//      write_hadreg_corea(`pc_go_ex,`TEST_FAIL);

      // $finish;
      `TEST_FAIL_AND_FINISH
    end
      $display("#####################################################");
      $display("XXXXX Congratulations!!!!!!  Simulation PASS!!! XXXXX");
      $display("#####################################################");

      FILE = $fopen("run_case.report","w");
      $fdisplay(FILE,"TEST PASS");   
      #100;

      $finish;
end



endmodule



