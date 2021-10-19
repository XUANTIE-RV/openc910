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

`include "had_drv.h"
module debug_stim(
);

reg[15:0]  hsr_data_out;
reg[63:0]  wbbr_data_out;
reg[63:0]  rand_data;
initial
  begin
    hsr_data_out   = 0;
    wbbr_data_out  = 0;
    rand_data      = 0;
    #5000;

    jtag_rst(32'h10);
open_event;
//===============================================
//Main Program: 1. Set DR enter debug mode and then clear DR bit.
//              2. Set FFY=0 Read GPR
//              3. Set FFY=1 Write GPR
//===============================================
    write_hadreg_corea(`hcr,32'h8000);                 //set DR
    wait_debug_mode_corea;
    write_hadreg_corea(`hcr,32'h0);                    //clear DR
    write_hadreg_corea(`event_outen,32'h0);
//-----------------------------------------------


//read gpr
      $display("=================================Read GPR===================================");
//X0 
    write_hadreg_corea(`ir_go_nex,`MV_X0_X0);
    hsr_data_out[12] = 0;
    while(!hsr_data_out[12])
      read_hadreg_corea(`hsr,hsr_data_out);
    read_hadreg_corea(`wbbr,wbbr_data_out);
    $display("Read X0 = 64'h%h!",wbbr_data_out);
    
//X1 
    write_hadreg_corea(`ir_go_nex,`MV_X1_X1);
    hsr_data_out[12] = 0;
    while(!hsr_data_out[12])
      read_hadreg_corea(`hsr,hsr_data_out);
    read_hadreg_corea(`wbbr,wbbr_data_out);
    $display("Read X1 = 64'h%h!",wbbr_data_out);

//X2
    write_hadreg_corea(`ir_go_nex,`MV_X2_X2);
    hsr_data_out[12] = 0;
    while(!hsr_data_out[12])
      read_hadreg_corea(`hsr,hsr_data_out);
    read_hadreg_corea(`wbbr,wbbr_data_out);
    $display("Read X2 = 64'h%h!",wbbr_data_out);

//X3
    write_hadreg_corea(`ir_go_nex,`MV_X3_X3);
    hsr_data_out[12] = 0;
    while(!hsr_data_out[12])
      read_hadreg_corea(`hsr,hsr_data_out);
    read_hadreg_corea(`wbbr,wbbr_data_out);
    $display("Read X3 = 64'h%h!",wbbr_data_out);

//X4
    write_hadreg_corea(`ir_go_nex,`MV_X4_X4);
    hsr_data_out[12] = 0;
    while(!hsr_data_out[12])
      read_hadreg_corea(`hsr,hsr_data_out);
    read_hadreg_corea(`wbbr,wbbr_data_out);
    $display("Read X4 = 64'h%h!",wbbr_data_out);

//X5
    write_hadreg_corea(`ir_go_nex,`MV_X5_X5);
    hsr_data_out[12] = 0;
    while(!hsr_data_out[12])
      read_hadreg_corea(`hsr,hsr_data_out);
    read_hadreg_corea(`wbbr,wbbr_data_out);
    $display("Read X5 = 64'h%h!",wbbr_data_out);

//X6
    write_hadreg_corea(`ir_go_nex,`MV_X6_X6);
    hsr_data_out[12] = 0;
    while(!hsr_data_out[12])
      read_hadreg_corea(`hsr,hsr_data_out);
    read_hadreg_corea(`wbbr,wbbr_data_out);
    $display("Read X6 = 64'h%h!",wbbr_data_out);

//X7
    write_hadreg_corea(`ir_go_nex,`MV_X7_X7);
    hsr_data_out[12] = 0;
    while(!hsr_data_out[12])
      read_hadreg_corea(`hsr,hsr_data_out);
    read_hadreg_corea(`wbbr,wbbr_data_out);
    $display("Read X7 = 64'h%h!",wbbr_data_out);

//X8
    write_hadreg_corea(`ir_go_nex,`MV_X8_X8);
    hsr_data_out[12] = 0;
    while(!hsr_data_out[12])
      read_hadreg_corea(`hsr,hsr_data_out);
    read_hadreg_corea(`wbbr,wbbr_data_out);
    $display("Read X8 = 64'h%h!",wbbr_data_out);

//X9
    write_hadreg_corea(`ir_go_nex,`MV_X9_X9);
    hsr_data_out[12] = 0;
    while(!hsr_data_out[12])
      read_hadreg_corea(`hsr,hsr_data_out);
    read_hadreg_corea(`wbbr,wbbr_data_out);
    $display("Read X9 = 64'h%h!",wbbr_data_out);

//X10
    write_hadreg_corea(`ir_go_nex,`MV_X10_X10);
    hsr_data_out[12] = 0;
    while(!hsr_data_out[12])
      read_hadreg_corea(`hsr,hsr_data_out);
    read_hadreg_corea(`wbbr,wbbr_data_out);
    $display("Read X10 = 64'h%h!",wbbr_data_out);

//X11
    write_hadreg_corea(`ir_go_nex,`MV_X11_X11);
    hsr_data_out[12] = 0;
    while(!hsr_data_out[12])
      read_hadreg_corea(`hsr,hsr_data_out);
    read_hadreg_corea(`wbbr,wbbr_data_out);
    $display("Read X11 = 64'h%h!",wbbr_data_out);

//X12
    write_hadreg_corea(`ir_go_nex,`MV_X12_X12);
    hsr_data_out[12] = 0;
    while(!hsr_data_out[12])
      read_hadreg_corea(`hsr,hsr_data_out);
    read_hadreg_corea(`wbbr,wbbr_data_out);
    $display("Read X12 = 64'h%h!",wbbr_data_out);

//X13
    write_hadreg_corea(`ir_go_nex,`MV_X13_X13);
    hsr_data_out[12] = 0;
    while(!hsr_data_out[12])
      read_hadreg_corea(`hsr,hsr_data_out);
    read_hadreg_corea(`wbbr,wbbr_data_out);
    $display("Read X13 = 64'h%h!",wbbr_data_out);

//X14
    write_hadreg_corea(`ir_go_nex,`MV_X14_X14);
    hsr_data_out[12] = 0;
    while(!hsr_data_out[12])
      read_hadreg_corea(`hsr,hsr_data_out);
    read_hadreg_corea(`wbbr,wbbr_data_out);
    $display("Read X14 = 64'h%h!",wbbr_data_out);

//X15
    write_hadreg_corea(`ir_go_nex,`MV_X15_X15);
    hsr_data_out[12] = 0;
    while(!hsr_data_out[12])
      read_hadreg_corea(`hsr,hsr_data_out);
    read_hadreg_corea(`wbbr,wbbr_data_out);
    $display("Read X15 = 64'h%h!",wbbr_data_out);

//X16
    write_hadreg_corea(`ir_go_nex,`MV_X16_X16);
    hsr_data_out[12] = 0;
    while(!hsr_data_out[12])
      read_hadreg_corea(`hsr,hsr_data_out);
    read_hadreg_corea(`wbbr,wbbr_data_out);
    $display("Read X16 = 64'h%h!",wbbr_data_out);

//X17
    write_hadreg_corea(`ir_go_nex,`MV_X17_X17);
    hsr_data_out[12] = 0;
    while(!hsr_data_out[12])
      read_hadreg_corea(`hsr,hsr_data_out);
    read_hadreg_corea(`wbbr,wbbr_data_out);
    $display("Read X17 = 64'h%h!",wbbr_data_out);

//X18
    write_hadreg_corea(`ir_go_nex,`MV_X18_X18);
    hsr_data_out[12] = 0;
    while(!hsr_data_out[12])
      read_hadreg_corea(`hsr,hsr_data_out);
    read_hadreg_corea(`wbbr,wbbr_data_out);
    $display("Read X18 = 64'h%h!",wbbr_data_out);

//X19
    write_hadreg_corea(`ir_go_nex,`MV_X19_X19);
    hsr_data_out[12] = 0;
    while(!hsr_data_out[12])
      read_hadreg_corea(`hsr,hsr_data_out);
    read_hadreg_corea(`wbbr,wbbr_data_out);
    $display("Read X19 = 64'h%h!",wbbr_data_out);

//X20
    write_hadreg_corea(`ir_go_nex,`MV_X20_X20);
    hsr_data_out[12] = 0;
    while(!hsr_data_out[12])
      read_hadreg_corea(`hsr,hsr_data_out);
    read_hadreg_corea(`wbbr,wbbr_data_out);
    $display("Read X20 = 64'h%h!",wbbr_data_out);

//X21
    write_hadreg_corea(`ir_go_nex,`MV_X21_X21);
    hsr_data_out[12] = 0;
    while(!hsr_data_out[12])
      read_hadreg_corea(`hsr,hsr_data_out);
    read_hadreg_corea(`wbbr,wbbr_data_out);
    $display("Read X21 = 64'h%h!",wbbr_data_out);

//X22
    write_hadreg_corea(`ir_go_nex,`MV_X22_X22);
    hsr_data_out[12] = 0;
    while(!hsr_data_out[12])
      read_hadreg_corea(`hsr,hsr_data_out);
    read_hadreg_corea(`wbbr,wbbr_data_out);
    $display("Read X22 = 64'h%h!",wbbr_data_out);

//X23
    write_hadreg_corea(`ir_go_nex,`MV_X23_X23);
    hsr_data_out[12] = 0;
    while(!hsr_data_out[12])
      read_hadreg_corea(`hsr,hsr_data_out);
    read_hadreg_corea(`wbbr,wbbr_data_out);
    $display("Read X23 = 64'h%h!",wbbr_data_out);

//X24
    write_hadreg_corea(`ir_go_nex,`MV_X24_X24);
    hsr_data_out[12] = 0;
    while(!hsr_data_out[12])
      read_hadreg_corea(`hsr,hsr_data_out);
    read_hadreg_corea(`wbbr,wbbr_data_out);
    $display("Read X24 = 64'h%h!",wbbr_data_out);

//X25
    write_hadreg_corea(`ir_go_nex,`MV_X25_X25);
    hsr_data_out[12] = 0;
    while(!hsr_data_out[12])
      read_hadreg_corea(`hsr,hsr_data_out);
    read_hadreg_corea(`wbbr,wbbr_data_out);
    $display("Read X25 = 64'h%h!",wbbr_data_out);

//X26
    write_hadreg_corea(`ir_go_nex,`MV_X26_X26);
    hsr_data_out[12] = 0;
    while(!hsr_data_out[12])
      read_hadreg_corea(`hsr,hsr_data_out);
    read_hadreg_corea(`wbbr,wbbr_data_out);
    $display("Read X26 = 64'h%h!",wbbr_data_out);

//X27
    write_hadreg_corea(`ir_go_nex,`MV_X27_X27);
    hsr_data_out[12] = 0;
    while(!hsr_data_out[12])
      read_hadreg_corea(`hsr,hsr_data_out);
    read_hadreg_corea(`wbbr,wbbr_data_out);
    $display("Read X27 = 64'h%h!",wbbr_data_out);

//X28
    write_hadreg_corea(`ir_go_nex,`MV_X28_X28);
    hsr_data_out[12] = 0;
    while(!hsr_data_out[12])
      read_hadreg_corea(`hsr,hsr_data_out);
    read_hadreg_corea(`wbbr,wbbr_data_out);
    $display("Read X28 = 64'h%h!",wbbr_data_out);

//X29
    write_hadreg_corea(`ir_go_nex,`MV_X29_X29);
    hsr_data_out[12] = 0;
    while(!hsr_data_out[12])
      read_hadreg_corea(`hsr,hsr_data_out);
    read_hadreg_corea(`wbbr,wbbr_data_out);
    $display("Read X29 = 64'h%h!",wbbr_data_out);

//X30
    write_hadreg_corea(`ir_go_nex,`MV_X30_X30);
    hsr_data_out[12] = 0;
    while(!hsr_data_out[12])
      read_hadreg_corea(`hsr,hsr_data_out);
    read_hadreg_corea(`wbbr,wbbr_data_out);
    $display("Read X30 = 64'h%h!",wbbr_data_out);

//X31
    write_hadreg_corea(`ir_go_nex,`MV_X31_X31);
    hsr_data_out[12] = 0;
    while(!hsr_data_out[12])
      read_hadreg_corea(`hsr,hsr_data_out);
    read_hadreg_corea(`wbbr,wbbr_data_out);
    $display("Read X31 = 64'h%h!",wbbr_data_out);

      $display("=================================Write GPR===================================");
//-----------------------------------------------
//Set FFY=1 Write GPR
//X0
    write_hadreg_corea(`csr,16'h100);                  //set FFY=1
    rand_data = {$random, $random};
    $display("Write X0 = 0x%h",rand_data);
    write_hadreg_corea(`wbbr,rand_data);
    write_hadreg_corea(`ir_go_nex,`MV_X0_X0);         //write X0
    write_hadreg_corea(`csr,16'h0);                    //set FFY=0
    write_hadreg_corea(`wbbr,32'h0);                   //clear WBBR
    write_hadreg_corea(`ir_go_nex,`MV_X0_X0);         //read X0
    hsr_data_out[12] = 0;
    while(!hsr_data_out[12])
      read_hadreg_corea(`hsr,hsr_data_out);
    read_hadreg_corea(`wbbr,wbbr_data_out);
    $display("Read X0 = 0x%h",wbbr_data_out);
    if(wbbr_data_out == 0)begin
      $display("Success!Write X0 Test");
    end
    else begin
      $display("Fail!Write X0 Test");
//      write_hadreg_corea(`pc_go_ex,`TEST_FAIL);
$finish;
    end
//X1
    write_hadreg_corea(`csr,16'h100);                  //set FFY=1
    rand_data = {$random, $random};
    $display("Write X1 = 0x%h",rand_data);
    write_hadreg_corea(`wbbr,rand_data);
    write_hadreg_corea(`ir_go_nex,`MV_X1_X1);         //write X1
    write_hadreg_corea(`csr,16'h0);                    //set FFY=0
    write_hadreg_corea(`wbbr,32'h0);                   //clear WBBR
    write_hadreg_corea(`ir_go_nex,`MV_X1_X1);         //read X1
    hsr_data_out[12] = 0;
    while(!hsr_data_out[12])
      read_hadreg_corea(`hsr,hsr_data_out);
    read_hadreg_corea(`wbbr,wbbr_data_out);
    $display("Read X1 = 0x%h",wbbr_data_out);
    if(wbbr_data_out == rand_data)begin
      $display("Success!Write X1 Test");
    end
    else begin
      $display("Fail!Write X1 Test");
//      write_hadreg_corea(`pc_go_ex,`TEST_FAIL);
$finish;
    end
//X2
    write_hadreg_corea(`csr,16'h100);                  //set FFY=1
    rand_data = {$random, $random};
    $display("Write X2 = 0x%h",rand_data);
    write_hadreg_corea(`wbbr,rand_data);
    write_hadreg_corea(`ir_go_nex,`MV_X2_X2);         //write X2
    write_hadreg_corea(`csr,16'h0);                    //set FFY=0
    write_hadreg_corea(`wbbr,32'h0);                   //clear WBBR
    write_hadreg_corea(`ir_go_nex,`MV_X2_X2);         //read X2
    hsr_data_out[12] = 0;
    while(!hsr_data_out[12])
      read_hadreg_corea(`hsr,hsr_data_out);
    read_hadreg_corea(`wbbr,wbbr_data_out);
    $display("Read X2 = 0x%h",wbbr_data_out);
    if(wbbr_data_out == rand_data)begin
      $display("Success!Write X2 Test");
    end
    else begin
      $display("Fail!Write X2 Test");
//      write_hadreg_corea(`pc_go_ex,`TEST_FAIL);
$finish;
    end
//X3
    write_hadreg_corea(`csr,16'h100);                  //set FFY=1
    rand_data = {$random, $random};
    $display("Write X3 = 0x%h",rand_data);
    write_hadreg_corea(`wbbr,rand_data);
    write_hadreg_corea(`ir_go_nex,`MV_X3_X3);         //write X3
    write_hadreg_corea(`csr,16'h0);                    //set FFY=0
    write_hadreg_corea(`wbbr,32'h0);                   //clear WBBR
    write_hadreg_corea(`ir_go_nex,`MV_X3_X3);         //read X3
    hsr_data_out[12] = 0;
    while(!hsr_data_out[12])
      read_hadreg_corea(`hsr,hsr_data_out);
    read_hadreg_corea(`wbbr,wbbr_data_out);
    $display("Read X3 = 0x%h",wbbr_data_out);
    if(wbbr_data_out == rand_data)begin
      $display("Success!Write X3 Test");
    end
    else begin
      $display("Fail!Write X3 Test");
//      write_hadreg_corea(`pc_go_ex,`TEST_FAIL);
$finish;
    end
//X4
    write_hadreg_corea(`csr,16'h100);                  //set FFY=1
    rand_data = {$random, $random};
    $display("Write X4 = 0x%h",rand_data);
    write_hadreg_corea(`wbbr,rand_data);
    write_hadreg_corea(`ir_go_nex,`MV_X4_X4);         //write X4
    write_hadreg_corea(`csr,16'h0);                    //set FFY=0
    write_hadreg_corea(`wbbr,32'h0);                   //clear WBBR
    write_hadreg_corea(`ir_go_nex,`MV_X4_X4);         //read X4
    hsr_data_out[12] = 0;
    while(!hsr_data_out[12])
      read_hadreg_corea(`hsr,hsr_data_out);
    read_hadreg_corea(`wbbr,wbbr_data_out);
    $display("Read X4 = 0x%h",wbbr_data_out);
    if(wbbr_data_out == rand_data)begin
      $display("Success!Write X4 Test");
    end
    else begin
      $display("Fail!Write X4 Test");
//      write_hadreg_corea(`pc_go_ex,`TEST_FAIL);
$finish;
    end
//X5
    write_hadreg_corea(`csr,16'h100);                  //set FFY=1
    rand_data = {$random, $random};
    $display("Write X5 = 0x%h",rand_data);
    write_hadreg_corea(`wbbr,rand_data);
    write_hadreg_corea(`ir_go_nex,`MV_X5_X5);         //write X5
    write_hadreg_corea(`csr,16'h0);                    //set FFY=0
    write_hadreg_corea(`wbbr,32'h0);                   //clear WBBR
    write_hadreg_corea(`ir_go_nex,`MV_X5_X5);         //read X5
    hsr_data_out[12] = 0;
    while(!hsr_data_out[12])
      read_hadreg_corea(`hsr,hsr_data_out);
    read_hadreg_corea(`wbbr,wbbr_data_out);
    $display("Read X5 = 0x%h",wbbr_data_out);
    if(wbbr_data_out == rand_data)begin
      $display("Success!Write X5 Test");
    end
    else begin
      $display("Fail!Write X5 Test");
//      write_hadreg_corea(`pc_go_ex,`TEST_FAIL);
$finish;
    end
//X6
    write_hadreg_corea(`csr,16'h100);                  //set FFY=1
    rand_data = {$random, $random};
    $display("Write X6 = 0x%h",rand_data);
    write_hadreg_corea(`wbbr,rand_data);
    write_hadreg_corea(`ir_go_nex,`MV_X6_X6);         //write X6
    write_hadreg_corea(`csr,16'h0);                    //set FFY=0
    write_hadreg_corea(`wbbr,32'h0);                   //clear WBBR
    write_hadreg_corea(`ir_go_nex,`MV_X6_X6);         //read X6
    hsr_data_out[12] = 0;
    while(!hsr_data_out[12])
      read_hadreg_corea(`hsr,hsr_data_out);
    read_hadreg_corea(`wbbr,wbbr_data_out);
    $display("Read X6 = 0x%h",wbbr_data_out);
    if(wbbr_data_out == rand_data)begin
      $display("Success!Write X6 Test");
    end
    else begin
      $display("Fail!Write X6 Test");
//      write_hadreg_corea(`pc_go_ex,`TEST_FAIL);
$finish;
    end
//X7
    write_hadreg_corea(`csr,16'h100);                  //set FFY=1
    rand_data = {$random, $random};
    $display("Write X7 = 0x%h",rand_data);
    write_hadreg_corea(`wbbr,rand_data);
    write_hadreg_corea(`ir_go_nex,`MV_X7_X7);         //write X7
    write_hadreg_corea(`csr,16'h0);                    //set FFY=0
    write_hadreg_corea(`wbbr,32'h0);                   //clear WBBR
    write_hadreg_corea(`ir_go_nex,`MV_X7_X7);         //read X7
    hsr_data_out[12] = 0;
    while(!hsr_data_out[12])
      read_hadreg_corea(`hsr,hsr_data_out);
    read_hadreg_corea(`wbbr,wbbr_data_out);
    $display("Read X7 = 0x%h",wbbr_data_out);
    if(wbbr_data_out == rand_data)begin
      $display("Success!Write X7 Test");
    end
    else begin
      $display("Fail!Write X7 Test");
//      write_hadreg_corea(`pc_go_ex,`TEST_FAIL);
$finish;
    end
//X8
    write_hadreg_corea(`csr,16'h100);                  //set FFY=1
    rand_data = {$random, $random};
    $display("Write X8 = 0x%h",rand_data);
    write_hadreg_corea(`wbbr,rand_data);
    write_hadreg_corea(`ir_go_nex,`MV_X8_X8);         //write X8
    write_hadreg_corea(`csr,16'h0);                    //set FFY=0
    write_hadreg_corea(`wbbr,32'h0);                   //clear WBBR
    write_hadreg_corea(`ir_go_nex,`MV_X8_X8);         //read X8
    hsr_data_out[12] = 0;
    while(!hsr_data_out[12])
      read_hadreg_corea(`hsr,hsr_data_out);
    read_hadreg_corea(`wbbr,wbbr_data_out);
    $display("Read X8 = 0x%h",wbbr_data_out);
    if(wbbr_data_out == rand_data)begin
      $display("Success!Write X8 Test");
    end
    else begin
      $display("Fail!Write X8 Test");
//      write_hadreg_corea(`pc_go_ex,`TEST_FAIL);
$finish;
    end
//X9
    write_hadreg_corea(`csr,16'h100);                  //set FFY=1
    rand_data = {$random, $random};
    $display("Write X9 = 0x%h",rand_data);
    write_hadreg_corea(`wbbr,rand_data);
    write_hadreg_corea(`ir_go_nex,`MV_X9_X9);         //write X9
    write_hadreg_corea(`csr,16'h0);                    //set FFY=0
    write_hadreg_corea(`wbbr,32'h0);                   //clear WBBR
    write_hadreg_corea(`ir_go_nex,`MV_X9_X9);         //read X9
    hsr_data_out[12] = 0;
    while(!hsr_data_out[12])
      read_hadreg_corea(`hsr,hsr_data_out);
    read_hadreg_corea(`wbbr,wbbr_data_out);
    $display("Read X9 = 0x%h",wbbr_data_out);
    if(wbbr_data_out == rand_data)begin
      $display("Success!Write X9 Test");
    end
    else begin
      $display("Fail!Write X9 Test");
//      write_hadreg_corea(`pc_go_ex,`TEST_FAIL);
$finish;
    end
//X10
    write_hadreg_corea(`csr,16'h100);                  //set FFY=1
    rand_data = {$random, $random};
    $display("Write X10 = 0x%h",rand_data);
    write_hadreg_corea(`wbbr,rand_data);
    write_hadreg_corea(`ir_go_nex,`MV_X10_X10);         //write X10
    write_hadreg_corea(`csr,16'h0);                    //set FFY=0
    write_hadreg_corea(`wbbr,32'h0);                   //clear WBBR
    write_hadreg_corea(`ir_go_nex,`MV_X10_X10);         //read X10
    hsr_data_out[12] = 0;
    while(!hsr_data_out[12])
      read_hadreg_corea(`hsr,hsr_data_out);
    read_hadreg_corea(`wbbr,wbbr_data_out);
    $display("Read X10 = 0x%h",wbbr_data_out);
    if(wbbr_data_out == rand_data)begin
      $display("Success!Write X10 Test");
    end
    else begin
      $display("Fail!Write X10 Test");
//      write_hadreg_corea(`pc_go_ex,`TEST_FAIL);
$finish;
    end
//X11
    write_hadreg_corea(`csr,16'h100);                  //set FFY=1
    rand_data = {$random, $random};
    $display("Write X11 = 0x%h",rand_data);
    write_hadreg_corea(`wbbr,rand_data);
    write_hadreg_corea(`ir_go_nex,`MV_X11_X11);         //write X11
    write_hadreg_corea(`csr,16'h0);                    //set FFY=0
    write_hadreg_corea(`wbbr,32'h0);                   //clear WBBR
    write_hadreg_corea(`ir_go_nex,`MV_X11_X11);         //read X11
    hsr_data_out[12] = 0;
    while(!hsr_data_out[12])
      read_hadreg_corea(`hsr,hsr_data_out);
    read_hadreg_corea(`wbbr,wbbr_data_out);
    $display("Read X11 = 0x%h",wbbr_data_out);
    if(wbbr_data_out == rand_data)begin
      $display("Success!Write X11 Test");
    end
    else begin
      $display("Fail!Write X11 Test");
//      write_hadreg_corea(`pc_go_ex,`TEST_FAIL);
$finish;
    end
//X12
    write_hadreg_corea(`csr,16'h100);                  //set FFY=1
    rand_data = {$random, $random};
    $display("Write X12 = 0x%h",rand_data);
    write_hadreg_corea(`wbbr,rand_data);
    write_hadreg_corea(`ir_go_nex,`MV_X12_X12);         //write X12
    write_hadreg_corea(`csr,16'h0);                    //set FFY=0
    write_hadreg_corea(`wbbr,32'h0);                   //clear WBBR
    write_hadreg_corea(`ir_go_nex,`MV_X12_X12);         //read X12
    hsr_data_out[12] = 0;
    while(!hsr_data_out[12])
      read_hadreg_corea(`hsr,hsr_data_out);
    read_hadreg_corea(`wbbr,wbbr_data_out);
    $display("Read X12 = 0x%h",wbbr_data_out);
    if(wbbr_data_out == rand_data)begin
      $display("Success!Write X12 Test");
    end
    else begin
      $display("Fail!Write X12 Test");
//      write_hadreg_corea(`pc_go_ex,`TEST_FAIL);
$finish;
    end
//X13
    write_hadreg_corea(`csr,16'h100);                  //set FFY=1
    rand_data = {$random, $random};
    $display("Write X13 = 0x%h",rand_data);
    write_hadreg_corea(`wbbr,rand_data);
    write_hadreg_corea(`ir_go_nex,`MV_X13_X13);         //write X13
    write_hadreg_corea(`csr,16'h0);                    //set FFY=0
    write_hadreg_corea(`wbbr,32'h0);                   //clear WBBR
    write_hadreg_corea(`ir_go_nex,`MV_X13_X13);         //read X13
    hsr_data_out[12] = 0;
    while(!hsr_data_out[12])
      read_hadreg_corea(`hsr,hsr_data_out);
    read_hadreg_corea(`wbbr,wbbr_data_out);
    $display("Read X13 = 0x%h",wbbr_data_out);
    if(wbbr_data_out == rand_data)begin
      $display("Success!Write X13 Test");
    end
    else begin
      $display("Fail!Write X13 Test");
//      write_hadreg_corea(`pc_go_ex,`TEST_FAIL);
$finish;
    end
//X14
    write_hadreg_corea(`csr,16'h100);                  //set FFY=1
    rand_data = {$random, $random};
    $display("Write X14 = 0x%h",rand_data);
    write_hadreg_corea(`wbbr,rand_data);
    write_hadreg_corea(`ir_go_nex,`MV_X14_X14);         //write X14
    write_hadreg_corea(`csr,16'h0);                    //set FFY=0
    write_hadreg_corea(`wbbr,32'h0);                   //clear WBBR
    write_hadreg_corea(`ir_go_nex,`MV_X14_X14);         //read X14
    hsr_data_out[12] = 0;
    while(!hsr_data_out[12])
      read_hadreg_corea(`hsr,hsr_data_out);
    read_hadreg_corea(`wbbr,wbbr_data_out);
    $display("Read X14 = 0x%h",wbbr_data_out);
    if(wbbr_data_out == rand_data)begin
      $display("Success!Write X14 Test");
    end
    else begin
      $display("Fail!Write X14 Test");
//      write_hadreg_corea(`pc_go_ex,`TEST_FAIL);
$finish;
    end
//X15
    write_hadreg_corea(`csr,16'h100);                  //set FFY=1
    rand_data = {$random, $random};
    $display("Write X15 = 0x%h",rand_data);
    write_hadreg_corea(`wbbr,rand_data);
    write_hadreg_corea(`ir_go_nex,`MV_X15_X15);         //write X15
    write_hadreg_corea(`csr,16'h0);                    //set FFY=0
    write_hadreg_corea(`wbbr,32'h0);                   //clear WBBR
    write_hadreg_corea(`ir_go_nex,`MV_X15_X15);         //read X15
    hsr_data_out[12] = 0;
    while(!hsr_data_out[12])
      read_hadreg_corea(`hsr,hsr_data_out);
    read_hadreg_corea(`wbbr,wbbr_data_out);
    $display("Read X15 = 0x%h",wbbr_data_out);
    if(wbbr_data_out == rand_data)
      $display("Success!Write X15 Test");
    else begin
      $display("Fail!Write X15 Test");
//      write_hadreg_corea(`pc_go_ex,`TEST_FAIL);
$finish;
    end
//X16
    write_hadreg_corea(`csr,16'h100);                  //set FFY=1
    rand_data = {$random, $random};
    $display("Write X16 = 0x%h",rand_data);
    write_hadreg_corea(`wbbr,rand_data);
    write_hadreg_corea(`ir_go_nex,`MV_X16_X16);         //write X16
    write_hadreg_corea(`csr,16'h0);                    //set FFY=0
    write_hadreg_corea(`wbbr,32'h0);                   //clear WBBR
    write_hadreg_corea(`ir_go_nex,`MV_X16_X16);         //read X16
    hsr_data_out[12] = 0;
    while(!hsr_data_out[12])
      read_hadreg_corea(`hsr,hsr_data_out);
    read_hadreg_corea(`wbbr,wbbr_data_out);
    $display("Read X16 = 0x%h",wbbr_data_out);
    if(wbbr_data_out == rand_data)begin
      $display("Success!Write X16 Test");
    end
    else begin
      $display("Fail!Write X16 Test");
//      write_hadreg_corea(`pc_go_ex,`TEST_FAIL);
$finish;
    end
//X17
    write_hadreg_corea(`csr,16'h100);                  //set FFY=1
    rand_data = {$random, $random};
    $display("Write X17 = 0x%h",rand_data);
    write_hadreg_corea(`wbbr,rand_data);
    write_hadreg_corea(`ir_go_nex,`MV_X17_X17);         //write X17
    write_hadreg_corea(`csr,16'h0);                    //set FFY=0
    write_hadreg_corea(`wbbr,32'h0);                   //clear WBBR
    write_hadreg_corea(`ir_go_nex,`MV_X17_X17);         //read X17
    hsr_data_out[12] = 0;
    while(!hsr_data_out[12])
      read_hadreg_corea(`hsr,hsr_data_out);
    read_hadreg_corea(`wbbr,wbbr_data_out);
    $display("Read X2 = 0x%h",wbbr_data_out);
    if(wbbr_data_out == rand_data)begin
      $display("Success!Write X17 Test");
    end
    else begin
      $display("Fail!Write X17 Test");
//      write_hadreg_corea(`pc_go_ex,`TEST_FAIL);
$finish;
    end
//X18
    write_hadreg_corea(`csr,16'h100);                  //set FFY=1
    rand_data = {$random, $random};
    $display("Write X18 = 0x%h",rand_data);
    write_hadreg_corea(`wbbr,rand_data);
    write_hadreg_corea(`ir_go_nex,`MV_X18_X18);         //write X18
    write_hadreg_corea(`csr,16'h0);                    //set FFY=0
    write_hadreg_corea(`wbbr,32'h0);                   //clear WBBR
    write_hadreg_corea(`ir_go_nex,`MV_X18_X18);         //read X18
    hsr_data_out[12] = 0;
    while(!hsr_data_out[12])
      read_hadreg_corea(`hsr,hsr_data_out);
    read_hadreg_corea(`wbbr,wbbr_data_out);
    $display("Read X18 = 0x%h",wbbr_data_out);
    if(wbbr_data_out == rand_data)begin
      $display("Success!Write X18 Test");
    end
    else begin
      $display("Fail!Write X18 Test");
//      write_hadreg_corea(`pc_go_ex,`TEST_FAIL);
$finish;
    end
//X19
    write_hadreg_corea(`csr,16'h100);                  //set FFY=1
    rand_data = {$random, $random};
    $display("Write X19 = 0x%h",rand_data);
    write_hadreg_corea(`wbbr,rand_data);
    write_hadreg_corea(`ir_go_nex,`MV_X19_X19);         //write X19
    write_hadreg_corea(`csr,16'h0);                    //set FFY=0
    write_hadreg_corea(`wbbr,32'h0);                   //clear WBBR
    write_hadreg_corea(`ir_go_nex,`MV_X19_X19);         //read X19
    hsr_data_out[12] = 0;
    while(!hsr_data_out[12])
      read_hadreg_corea(`hsr,hsr_data_out);
    read_hadreg_corea(`wbbr,wbbr_data_out);
    $display("Read X19 = 0x%h",wbbr_data_out);
    if(wbbr_data_out == rand_data)begin
      $display("Success!Write X19 Test");
    end
    else begin
      $display("Fail!Write X19 Test");
//      write_hadreg_corea(`pc_go_ex,`TEST_FAIL);
$finish;
    end
//X20
    write_hadreg_corea(`csr,16'h100);                  //set FFY=1
    rand_data = {$random, $random};
    $display("Write X20 = 0x%h",rand_data);
    write_hadreg_corea(`wbbr,rand_data);
    write_hadreg_corea(`ir_go_nex,`MV_X20_X20);         //write X20
    write_hadreg_corea(`csr,16'h0);                    //set FFY=0
    write_hadreg_corea(`wbbr,32'h0);                   //clear WBBR
    write_hadreg_corea(`ir_go_nex,`MV_X20_X20);         //read X20
    hsr_data_out[12] = 0;
    while(!hsr_data_out[12])
      read_hadreg_corea(`hsr,hsr_data_out);
    read_hadreg_corea(`wbbr,wbbr_data_out);
    $display("Read X20 = 0x%h",wbbr_data_out);
    if(wbbr_data_out == rand_data)begin
      $display("Success!Write X20 Test");
    end
    else begin
      $display("Fail!Write X20 Test");
//      write_hadreg_corea(`pc_go_ex,`TEST_FAIL);
$finish;
    end
//X21
    write_hadreg_corea(`csr,16'h100);                  //set FFY=1
    rand_data = {$random, $random};
    $display("Write X21 = 0x%h",rand_data);
    write_hadreg_corea(`wbbr,rand_data);
    write_hadreg_corea(`ir_go_nex,`MV_X21_X21);         //write X21
    write_hadreg_corea(`csr,16'h0);                    //set FFY=0
    write_hadreg_corea(`wbbr,32'h0);                   //clear WBBR
    write_hadreg_corea(`ir_go_nex,`MV_X21_X21);         //read X21
    hsr_data_out[12] = 0;
    while(!hsr_data_out[12])
      read_hadreg_corea(`hsr,hsr_data_out);
    read_hadreg_corea(`wbbr,wbbr_data_out);
    $display("Read X21 = 0x%h",wbbr_data_out);
    if(wbbr_data_out == rand_data)begin
      $display("Success!Write X21 Test");
    end
    else begin
      $display("Fail!Write X21 Test");
//      write_hadreg_corea(`pc_go_ex,`TEST_FAIL);
$finish;
    end
//X22
    write_hadreg_corea(`csr,16'h100);                  //set FFY=1
    rand_data = {$random, $random};
    $display("Write X22 = 0x%h",rand_data);
    write_hadreg_corea(`wbbr,rand_data);
    write_hadreg_corea(`ir_go_nex,`MV_X22_X22);         //write X22
    write_hadreg_corea(`csr,16'h0);                    //set FFY=0
    write_hadreg_corea(`wbbr,32'h0);                   //clear WBBR
    write_hadreg_corea(`ir_go_nex,`MV_X22_X22);         //read X22
    hsr_data_out[12] = 0;
    while(!hsr_data_out[12])
      read_hadreg_corea(`hsr,hsr_data_out);
    read_hadreg_corea(`wbbr,wbbr_data_out);
    $display("Read X22 = 0x%h",wbbr_data_out);
    if(wbbr_data_out == rand_data)begin
      $display("Success!Write X22 Test");
    end
    else begin
      $display("Fail!Write X22 Test");
//      write_hadreg_corea(`pc_go_ex,`TEST_FAIL);
$finish;
    end
//X23
    write_hadreg_corea(`csr,16'h100);                  //set FFY=1
    rand_data = {$random, $random};
    $display("Write X23 = 0x%h",rand_data);
    write_hadreg_corea(`wbbr,rand_data);
    write_hadreg_corea(`ir_go_nex,`MV_X23_X23);         //write X23
    write_hadreg_corea(`csr,16'h0);                    //set FFY=0
    write_hadreg_corea(`wbbr,32'h0);                   //clear WBBR
    write_hadreg_corea(`ir_go_nex,`MV_X23_X23);         //read X23
    hsr_data_out[12] = 0;
    while(!hsr_data_out[12])
      read_hadreg_corea(`hsr,hsr_data_out);
    read_hadreg_corea(`wbbr,wbbr_data_out);
    $display("Read X23 = 0x%h",wbbr_data_out);
    if(wbbr_data_out == rand_data)begin
      $display("Success!Write X23 Test");
    end
    else begin
      $display("Fail!Write X23 Test");
//      write_hadreg_corea(`pc_go_ex,`TEST_FAIL);
$finish;
    end
//X24
    write_hadreg_corea(`csr,16'h100);                  //set FFY=1
    rand_data = {$random, $random};
    $display("Write X24 = 0x%h",rand_data);
    write_hadreg_corea(`wbbr,rand_data);
    write_hadreg_corea(`ir_go_nex,`MV_X24_X24);         //write X24
    write_hadreg_corea(`csr,16'h0);                    //set FFY=0
    write_hadreg_corea(`wbbr,32'h0);                   //clear WBBR
    write_hadreg_corea(`ir_go_nex,`MV_X24_X24);         //read X24
    hsr_data_out[12] = 0;
    while(!hsr_data_out[12])
      read_hadreg_corea(`hsr,hsr_data_out);
    read_hadreg_corea(`wbbr,wbbr_data_out);
    $display("Read X24 = 0x%h",wbbr_data_out);
    if(wbbr_data_out == rand_data)begin
      $display("Success!Write X24 Test");
    end
    else begin
      $display("Fail!Write X24 Test");
//      write_hadreg_corea(`pc_go_ex,`TEST_FAIL);
$finish;
    end
//X25
    write_hadreg_corea(`csr,16'h100);                  //set FFY=1
    rand_data = {$random, $random};
    $display("Write X25 = 0x%h",rand_data);
    write_hadreg_corea(`wbbr,rand_data);
    write_hadreg_corea(`ir_go_nex,`MV_X25_X25);         //write X25
    write_hadreg_corea(`csr,16'h0);                    //set FFY=0
    write_hadreg_corea(`wbbr,32'h0);                   //clear WBBR
    write_hadreg_corea(`ir_go_nex,`MV_X25_X25);         //read X25
    hsr_data_out[12] = 0;
    while(!hsr_data_out[12])
      read_hadreg_corea(`hsr,hsr_data_out);
    read_hadreg_corea(`wbbr,wbbr_data_out);
    $display("Read X25 = 0x%h",wbbr_data_out);
    if(wbbr_data_out == rand_data)begin
      $display("Success!Write X25 Test");
    end
    else begin
      $display("Fail!Write X25 Test");
//      write_hadreg_corea(`pc_go_ex,`TEST_FAIL);
$finish;
    end
//X26
    write_hadreg_corea(`csr,16'h100);                  //set FFY=1
    rand_data = {$random, $random};
    $display("Write X26 = 0x%h",rand_data);
    write_hadreg_corea(`wbbr,rand_data);
    write_hadreg_corea(`ir_go_nex,`MV_X26_X26);         //write X26
    write_hadreg_corea(`csr,16'h0);                    //set FFY=0
    write_hadreg_corea(`wbbr,32'h0);                   //clear WBBR
    write_hadreg_corea(`ir_go_nex,`MV_X26_X26);         //read X26
    hsr_data_out[12] = 0;
    while(!hsr_data_out[12])
      read_hadreg_corea(`hsr,hsr_data_out);
    read_hadreg_corea(`wbbr,wbbr_data_out);
    $display("Read X26 = 0x%h",wbbr_data_out);
    if(wbbr_data_out == rand_data)begin
      $display("Success!Write X26 Test");
    end
    else begin
      $display("Fail!Write X26 Test");
//      write_hadreg_corea(`pc_go_ex,`TEST_FAIL);
$finish;
    end
//X27
    write_hadreg_corea(`csr,16'h100);                  //set FFY=1
    rand_data = {$random, $random};
    $display("Write X27 = 0x%h",rand_data);
    write_hadreg_corea(`wbbr,rand_data);
    write_hadreg_corea(`ir_go_nex,`MV_X27_X27);         //write X27
    write_hadreg_corea(`csr,16'h0);                    //set FFY=0
    write_hadreg_corea(`wbbr,32'h0);                   //clear WBBR
    write_hadreg_corea(`ir_go_nex,`MV_X27_X27);         //read X27
    hsr_data_out[12] = 0;
    while(!hsr_data_out[12])
      read_hadreg_corea(`hsr,hsr_data_out);
    read_hadreg_corea(`wbbr,wbbr_data_out);
    $display("Read X27 = 0x%h",wbbr_data_out);
    if(wbbr_data_out == rand_data)begin
      $display("Success!Write X27 Test");
    end
    else begin
      $display("Fail!Write X27 Test");
//      write_hadreg_corea(`pc_go_ex,`TEST_FAIL);
$finish;
    end
//X28
    write_hadreg_corea(`csr,16'h100);                  //set FFY=1
    rand_data = {$random, $random};
    $display("Write X28 = 0x%h",rand_data);
    write_hadreg_corea(`wbbr,rand_data);
    write_hadreg_corea(`ir_go_nex,`MV_X28_X28);         //write X28
    write_hadreg_corea(`csr,16'h0);                    //set FFY=0
    write_hadreg_corea(`wbbr,32'h0);                   //clear WBBR
    write_hadreg_corea(`ir_go_nex,`MV_X28_X28);         //read X28
    hsr_data_out[12] = 0;
    while(!hsr_data_out[12])
      read_hadreg_corea(`hsr,hsr_data_out);
    read_hadreg_corea(`wbbr,wbbr_data_out);
    $display("Read X28 = 0x%h",wbbr_data_out);
    if(wbbr_data_out == rand_data)begin
      $display("Success!Write X28 Test");
    end
    else begin
      $display("Fail!Write X28 Test");
//      write_hadreg_corea(`pc_go_ex,`TEST_FAIL);
$finish;
    end
//X29
    write_hadreg_corea(`csr,16'h100);                  //set FFY=1
    rand_data = {$random, $random};
    $display("Write X29 = 0x%h",rand_data);
    write_hadreg_corea(`wbbr,rand_data);
    write_hadreg_corea(`ir_go_nex,`MV_X29_X29);         //write X29
    write_hadreg_corea(`csr,16'h0);                    //set FFY=0
    write_hadreg_corea(`wbbr,32'h0);                   //clear WBBR
    write_hadreg_corea(`ir_go_nex,`MV_X29_X29);         //read X29
    hsr_data_out[12] = 0;
    while(!hsr_data_out[12])
      read_hadreg_corea(`hsr,hsr_data_out);
    read_hadreg_corea(`wbbr,wbbr_data_out);
    $display("Read X29 = 0x%h",wbbr_data_out);
    if(wbbr_data_out == rand_data)begin
      $display("Success!Write X29 Test");
    end
    else begin
      $display("Fail!Write X29 Test");
//      write_hadreg_corea(`pc_go_ex,`TEST_FAIL);
$finish;
    end
//X30
    write_hadreg_corea(`csr,16'h100);                  //set FFY=1
    rand_data = {$random, $random};
    $display("Write X30 = 0x%h",rand_data);
    write_hadreg_corea(`wbbr,rand_data);
    write_hadreg_corea(`ir_go_nex,`MV_X30_X30);         //write X30
    write_hadreg_corea(`csr,16'h0);                    //set FFY=0
    write_hadreg_corea(`wbbr,32'h0);                   //clear WBBR
    write_hadreg_corea(`ir_go_nex,`MV_X30_X30);         //read X30
    hsr_data_out[12] = 0;
    while(!hsr_data_out[12])
      read_hadreg_corea(`hsr,hsr_data_out);
    read_hadreg_corea(`wbbr,wbbr_data_out);
    $display("Read X30 = 0x%h",wbbr_data_out);
    if(wbbr_data_out == rand_data)begin
      $display("Success!Write X30 Test");
    end
    else begin
      $display("Fail!Write X30 Test");
//      write_hadreg_corea(`pc_go_ex,`TEST_FAIL);
$finish;
    end
//X31
    write_hadreg_corea(`csr,16'h100);                  //set FFY=1
    rand_data = {$random, $random};
    $display("Write X31 = 0x%h",rand_data);
    write_hadreg_corea(`wbbr,rand_data);
    write_hadreg_corea(`ir_go_nex,`MV_X31_X31);         //write X31
    write_hadreg_corea(`csr,16'h0);                    //set FFY=0
    write_hadreg_corea(`wbbr,32'h0);                   //clear WBBR
    write_hadreg_corea(`ir_go_nex,`MV_X31_X31);         //read X31
    hsr_data_out[12] = 0;
    while(!hsr_data_out[12])
      read_hadreg_corea(`hsr,hsr_data_out);
    read_hadreg_corea(`wbbr,wbbr_data_out);
    $display("Read X31 = 0x%h",wbbr_data_out);
    if(wbbr_data_out == rand_data)begin
      $display("Success!Write X31 Test");
//      write_hadreg_corea(`pc_go_ex,`TEST_PASS);
//
      $display("#####################################################");
      $display("XXXXX Congratulations!!!!!!  Simulation PASS!!! XXXXX");
      $display("#####################################################");

$finish;
    end
    else begin
      $display("Fail!Write X31 Test");
//      write_hadreg_corea(`pc_go_ex,`TEST_FAIL);
$finish;
    end

  end




endmodule



