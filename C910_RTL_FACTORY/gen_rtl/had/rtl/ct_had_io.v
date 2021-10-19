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

// &ModuleBeg; @23
module ct_had_io(
  had_pad_jtg_tdo,
  had_pad_jtg_tdo_en,
  io_serial_tdi,
  io_sm_tap_en,
  pad_had_jtg_tdi,
  serial_io_tdo,
  sm_io_tdo_en
);

// &Ports; @24
input        pad_had_jtg_tdi;   
input        serial_io_tdo;     
input        sm_io_tdo_en;      
output       had_pad_jtg_tdo;   
output       had_pad_jtg_tdo_en; 
output       io_serial_tdi;     
output       io_sm_tap_en;      

// &Regs; @25

// &Wires; @26
wire         had_pad_jtg_tdo;   
wire         had_pad_jtg_tdo_en; 
wire         io_serial_tdi;     
wire         io_sm_tap_en;      
wire         pad_had_jtg_tdi;   
wire         serial_io_tdo;     
wire         sm_io_tdo_en;      


//===============================================================
// JTAG_2 and JTAG_5 interface signals
//===============================================================
//                                |     __
//    pad_had_jtg_tdi ----------->|----|  \
//                                |    |   |----> io_serial_tdi
//  pad_had_jtg_tms_i ----------->|----|__/
//                                |     |
//  pad_had_jtag2_sel ----------->|-----+
//                                |
//    had_pad_jtg_tdo <-----------|--+
//                                |  |----------- serial_io_tdo
//  had_pad_jtg_tms_o <-----------|--+
//                                |
// had_pad_jtg_tdo_en <-----------|-------------- sm_io_tdo_en
//                                |
// had_pad_jtg_tms_oe <-----------|-------------- sm_io_tms_oe
//                                |
//===============================================================
assign io_serial_tdi = pad_had_jtg_tdi;
assign had_pad_jtg_tdo = serial_io_tdo;
assign had_pad_jtg_tdo_en = sm_io_tdo_en;

assign io_sm_tap_en = 1'b1;



// &ModuleEnd; @77
endmodule



