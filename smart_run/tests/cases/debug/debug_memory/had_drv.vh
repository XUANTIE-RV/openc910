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

//signal remaning
//-----------------------------------------------
`define CPU_DRV_TOP         tb.x_soc.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top

`define jtag_tap_on         `CPU_DRV_TOP.had_pad_jtg_tap_on
`define jtag_tdo            `CPU_DRV_TOP.had_pad_jtg_tdo
`define jtag_tdo_en         `CPU_DRV_TOP.had_pad_jtg_tdo_en

`define jtag_tclk           `CPU_DRV_TOP.pad_had_jtg_tclk
`define jtag_tdi            `CPU_DRV_TOP.pad_had_jtg_tdi
`define jtag_tms_i          `CPU_DRV_TOP.pad_had_jtg_tms
`define jtag_trst_b         `CPU_DRV_TOP.pad_had_jtg_trst_b
`define jtag2_sel           1'b0

//-----------------------------------------------
//define the instructions opcodes
`define EBREAK          32'h00100073
`define MV_X0_X0        32'h00000013
`define MV_X1_X1        16'h8086
`define MV_X2_X2        16'h810a
`define MV_X3_X3        16'h818e
`define MV_X4_X4        16'h8212
`define MV_X5_X5        16'h8296
`define MV_X6_X6        16'h831a
`define MV_X7_X7        16'h839e
`define MV_X8_X8        16'h8422
`define MV_X9_X9        16'h84a6
`define MV_X10_X10      16'h852a
`define MV_X11_X11      16'h85ae
`define MV_X12_X12      16'h8632
`define MV_X13_X13      16'h86b6
`define MV_X14_X14      16'h873a
`define MV_X15_X15      16'h87be
`define MV_X16_X16      16'h8842
`define MV_X17_X17      16'h88c6
`define MV_X18_X18      16'h894a
`define MV_X19_X19      16'h89ce
`define MV_X20_X20      16'h8a52
`define MV_X21_X21      16'h8ad6
`define MV_X22_X22      16'h8b5a
`define MV_X23_X23      16'h8bde
`define MV_X24_X24      16'h8c62
`define MV_X25_X25      16'h8ce6
`define MV_X26_X26      16'h8d6a
`define MV_X27_X27      16'h8dee
`define MV_X28_X28      16'h8e72
`define MV_X29_X29      16'h8ef6
`define MV_X30_X30      16'h8f7a
`define MV_X31_X31      16'h8ffe

`define CSRR_X0_SMCIR   32'h9c302073
`define CSRW_SMCIR_X0   32'h9c301073
`define CSRR_X0_MRVBR   32'h7c702073
`define CSRW_MRVBR_X0   32'h7c701073
`define CSRR_X0_MTVAL   32'h34302073
`define CSRW_MTVAL_X0   32'h34301073
`define CSRR_X0_MSTATUS 32'h30002073
`define CSRW_MSTATUS_X0 32'h30001073
`define CSRR_X0_SSTATUS 32'h10002073
`define CSRW_SSTATUS_X0 32'h10001073
// `define MFCR_R1_CR0     32'hc0006021
// `define MFCR_R5_CR0     32'hc0006025
// `define MFCR_R6_CR0_B3  32'hc0606026
// `define MFCR_R1_CR1     32'hc0016021
// `define MFCR_R1_CR1_B1  32'hc0216021
// `define MFCR_R1_CR1_B3  32'hc0616021
// `define MFCR_R1_CR2     32'hc0026021
// `define MFCR_R1_CR2_B3  32'hc0626021
// `define MFCR_R1_CR3     32'hc0036021
// `define MFCR_R1_CR4     32'hc0046021
// `define MFCR_R1_CR4_B3  32'hc0646021
// `define MFCR_R1_CR5     32'hc0056021
// `define MFCR_R1_CR6     32'hc0066021
// `define MFCR_R1_CR6_B3  32'hc0666021
// `define MFCR_R1_CR7     32'hc0076021
// `define MFCR_R1_CR7_B3  32'hc0676021
// `define MFCR_R1_CR8     32'hc0086021
// `define MFCR_R1_CR8_B3  32'hc0686021
// `define MFCR_R1_CR9     32'hc0096021
// `define MFCR_R1_CR10    32'hc00a6021
// `define MFCR_R1_CR10_B3 32'hc06a6021
// `define MFCR_R1_CR11    32'hc00b6021
// `define MFCR_R1_CR12    32'hc00c6021
// `define MFCR_R1_CR13    32'hc00d6021
// `define MFCR_R1_CR14    32'hc00e6021
// `define MFCR_R1_CR14_B1 32'hc02e6021
// `define MFCR_R1_CR15    32'hc00f6021
// `define MFCR_R1_CR16    32'hc0106021
// `define MFCR_R1_CR17    32'hc0116021
// `define MFCR_R1_CR18    32'hc0126021
// `define MFCR_R1_CR19    32'hc0136021
// `define MFCR_R1_CR20    32'hc0146021
// `define MFCR_R1_CR21    32'hc0156021
//
// `define MTCR_R1_CR0     32'hc0016420
// `define MTCR_R4_CR0     32'hc0046420
// `define MTCR_R7_CR0     32'hc0076420
// `define MTCR_R7_CR0_B3  32'hc0676420
// `define MTCR_R1_CR1     32'hc0016421
// `define MTCR_R11_CR1    32'hc00b6421
// `define MTCR_R11_CR1_B1 32'hc02b6421
// `define MTCR_R11_CR1_B3 32'hc06b6421
// `define MTCR_R5_CR1_B3  32'hc0656421
// `define MTCR_R6_CR1_B3  32'hc0666421
// `define MTCR_R1_CR2     32'hc0016422
// `define MTCR_R10_CR2    32'hc00a6422
// `define MTCR_R9_CR2_B3  32'hc0696422
// `define MTCR_R9_CR2     32'hc0096422
// `define MTCR_R1_CR3     32'hc0016423
// `define MTCR_R1_CR4     32'hc0016424
// `define MTCR_R10_CR4    32'hc00a6424
// `define MTCR_R9_CR4_B3  32'hc0696424
// `define MTCR_R9_CR4     32'hc0096424
// `define MTCR_R1_CR5     32'hc0016425
// `define MTCR_R1_CR6     32'hc0016426
// `define MTCR_R9_CR6_B3  32'hc0696426
// `define MTCR_R1_CR7     32'hc0016427
// `define MTCR_R12_CR7_B3 32'hc06c6427
// `define MTCR_R1_CR8     32'hc0016428
// `define MTCR_R1_CR9     32'hc0016429
// `define MTCR_R1_CR10    32'hc001642a
// `define MTCR_R11_CR10_B3 32'hc06b642a
// `define MTCR_R1_CR11    32'hc001642b
// `define MTCR_R1_CR12    32'hc001642c
// `define MTCR_R1_CR13     32'hc001642d
// `define MTCR_R10_CR14_B1 32'hc02a642e
// `define MTCR_R12_CR14_B1 32'hc02c642e
//
// `define MTCR_R1_CR17    32'hc0016431
// `define MTCR_R13_CR19   32'hc00d6433
// `define MTCR_R1_CR31    32'hc001643f

`define MRET            32'h30200073
`define SRET            32'h10200073

`define LW_X7_0_X6      32'h00032383
`define LW_X7_4_X6      32'h00432383
`define LW_X7_8_X6      32'h00832383
`define LW_X7_12_X6     32'h00C32383
`define LW_X7_16_X6     32'h01032383
`define LW_X7_24_X6     32'h01832383
`define LW_X7_64_X6     32'h04032383
`define LW_X7_0_X8      32'h00042383
`define LW_X7_64_X8     32'h04042383
`define SW_X7_0_X6      32'h00732023
`define SW_X7_8_X6      32'h00732423
`define SW_X7_16_X6     32'h00732823
`define SW_X7_24_X6     32'h00732c23

`define LD_X7_0_X6      32'h00033383
`define LD_X7_8_X6      32'h00833383
`define LD_X7_16_X6     32'h01033383
`define LD_X7_24_X6     32'h01833383
`define SD_X7_0_X6      32'h00733023
`define SD_X7_8_X6      32'h00733423
`define SD_X7_16_X6     32'h00733823
`define SD_X7_24_X6     32'h00733c23


//-----------------------------------------------
//define the HAD registers

//-------------------------------------------------
//----------------------------------------------------
//|15|14|13|12-8|
//|R/W|GO|EX|index[4:0]|bank_sel[7:5|000|cpu_sel|


//-----------------------------------------------------
//CPU COREA HAD registers
//--------------------------------------------------------
`define id           11'b00000100000
`define tracer       11'b00000110000
`define mbca         11'b00001000000
`define mbcb         11'b00001010000
`define pcfifo       11'b00001100000
`define baba         11'b00001110000
`define babb         11'b00010000000
`define bama         11'b00010010000
`define bamb         11'b00010100000
`define cpuscr       11'b00010110000
`define bypass       11'b00011000000
`define hcr          11'b00011010000
`define dder         11'b00101100000
`define hsr          11'b00011100000
`define ehsr         11'b00011110000
`define bsel         11'b00111100000

//bank1 memory break point C-H
`define babc         11'b00000000001
`define babd         11'b00000100001
`define babe         11'b00001000001
`define babf         11'b00001100001
`define babg         11'b00010000001
`define babh         11'b00010100001
`define babi         11'b00011000001
`define bamc         11'b00000010001
`define bamd         11'b00000110001
`define bame         11'b00001010001
`define bamf         11'b00001110001
`define bamg         11'b00010010001
`define bamh         11'b00010110001
`define bami         11'b00011010001

// had bank2 signal (profiction)
`define dcr          11'b00000000010  // add as ck802 may be not supported in ck803s
`define pcr          11'b00000010010
`define event_outen       11'b00000100010  // added in CK860 for multicore debug control
`define event_inen        11'b00000110010  // added in CK860 for multicore debug control
`define fdr          11'b00111110010

`define dbginfofifo  11'b0001000010
`define pipefifo     11'b0001010010
`define pipesel      11'b0001100010

`define daddr        11'b00110000000
`define ddata        11'b00110010000

`define mbir         11'b00110110001

//bank0
`define wbbr         11'b00100010000
`define psr          11'b00100100000
`define pc           11'b00100110000
`define ir           11'b00101000000
`define csr          11'b00101010000

`define wbbr_go_ex   11'b11100010000
`define wbbr_go_nex  11'b10100010000
`define wbbr_ngo_ex  11'b01100010000
`define wbbr_ngo_nex 11'b00100010000
`define psr_go_ex    11'b11100100000
`define psr_go_nex   11'b10100100000
`define psr_ngo_ex   11'b01100100000
`define psr_ngo_nex  11'b00100100000
`define pc_go_ex     11'b11100110000
`define pc_go_nex    11'b10100110000
`define pc_ngo_ex    11'b01100110000
`define pc_ngo_nex   11'b00100110000
`define ir_go_ex     11'b11101000000
`define ir_go_nex    11'b10101000000
`define ir_ngo_ex    11'b01101000000
`define ir_ngo_nex   11'b00101000000
`define csr_go_ex    11'b11101010000
`define csr_go_nex   11'b10101010000
`define csr_ngo_ex   11'b01101010000
`define csr_ngo_nex  11'b00101010000

`define bypass_go_ex    11'b11011000000
`define bypass_go_nex   11'b10011000000
`define bypass_ngo_ex   11'b01011000000
`define bypass_ngo_nex  11'b00011000000

// core id
`define COREA_ID       4'b0
`define COREB_ID       4'b1
`define COREC_ID       4'b0010
`define CORED_ID       4'b0011

//task test;
//begin
//$display("\n\n\n\n\ntest\n\n\n\n");
//end
//endtask

//jtag reset, for example: jtag_rst(100)
task jtag_rst;
input[31:0] rst_cycle;
integer i;
begin
  force `jtag_trst_b = 1'b1;
  if (`jtag2_sel)
    force `jtag_tms_i = 1'b1;
  else
    force `jtag_tms_i  = 1'b0;
  //wait until posedge tclk
  @(negedge `jtag_tclk);
  force `jtag_trst_b = 1'b0;

  //wait for user specified cycles
  for(i=0; i<rst_cycle; i=i+1)
    @(negedge `jtag_tclk);
  force `jtag_trst_b = 1'b1;

  //drive TAP state machine into IDLE state
  @(negedge `jtag_tclk);
  @(negedge `jtag_tclk);
  if (`jtag2_sel)
    force `jtag_tms_i = 1'b1;
  else
    force `jtag_tms_i = 1'b0;
end
endtask

task read_hadreg_bank1;
  input[10:0] reg_select;
  output[31:0] jtag_data_out;
  reg[31:0] jtag_data_out;
  begin
    write_ir ({1'b1, reg_select});
    case(reg_select & 11'b00111111111)
      `babc,
      `babd,
      `babe,
      `babf,
      `babg,
      `babh,
      `bsel,
      `babi :begin
        read_dr (32, jtag_data_out);
      end
      `bamc,
      `bamd,
      `bame,
      `bamf,
      `bamg,
      `bamh,
      `bami :begin
        read_dr (8, jtag_data_out);
      end
      default:$display("There is no target!");
    endcase
  end
endtask

task read_hadreg_bank2;
  input[10:0] reg_select;
  output[31:0] jtag_data_out;
  reg[31:0] jtag_data_out;
  begin
    write_ir ({1'b1, reg_select});
    case(reg_select & 11'b00111111111)
      `dcr,         //debug control register
      `bsel,
      `fdr,
      `pcr :begin   //profile counter register
        read_dr (32, jtag_data_out);
      end
      default:$display("There is no target!");
    endcase
  end
endtask

task write_hadreg_bank1;
  input[10:0] reg_select;
  input[31:0] reg_value;
  begin
    write_ir({1'b0, reg_select});
    case(reg_select & 11'b00111111111)
      `babc,
      `babd,
      `babe,
      `babf,
      `babg,
      `bsel,
      `babh,
      `babi :begin
        write_dr(reg_value,32);
      end
      `bamc,
      `bamd,
      `bame,
      `bamf,
      `bamg,
      `bamh,
      `bami :begin
        write_dr(reg_value,8);
      end
      default:$display("There is no target!");
    endcase
  end
endtask

task write_hadreg_bank2;
  input[10:0] reg_select;
  input[31:0] reg_value;
  begin
    write_ir({1'b0, reg_select});
    case(reg_select & 11'b00111111111)
      `dcr,        //debug control register
      `bsel,
      `fdr,
      `pcr :begin  //profile counter register
        write_dr(reg_value,32);
      end
      default:$display("There is no target!");
    endcase
  end
endtask

//write IR
task write_ir;
input [15:0] ir_value;
integer i;
reg  parity;
begin
  if (`jtag2_sel) begin
    //=================================================
    // JTAG_2 interface Driver
    parity = 1'b1;
    @(negedge `jtag_tclk); // start
    force `jtag_tms_i = 1'b0;
    @(negedge `jtag_tclk); // read/write
    force `jtag_tms_i = 1'b0;
    @(negedge `jtag_tclk); // RS[0]
    force `jtag_tms_i = 1'b0;
    @(negedge `jtag_tclk); // RS[1]
    force `jtag_tms_i = 1'b1;
    @(negedge `jtag_tclk); // Trn
    force `jtag_tms_i = 1'b1;
    @(negedge `jtag_tclk);
    for(i=0; i<16; i=i+1)begin
      force `jtag_tms_i = ir_value[i];
      parity = parity ^ ir_value[i];
      @(negedge `jtag_tclk); // Shift IR
    end
    force `jtag_tms_i = parity;
    @(negedge `jtag_tclk); // Parity
    force `jtag_tms_i = 1'b1;
    @(negedge `jtag_tclk); // Trn
    force `jtag_tms_i = 1'b1;
    @(negedge `jtag_tclk); // IDLE
  end
  else begin
    //=================================================
    // JTAG_5 interface Driver
    @(negedge `jtag_tclk); //drive to Select DR Scan
    force `jtag_tms_i = 1'b1;
    @(negedge `jtag_tclk); //drive to Select IR Scan
    force `jtag_tms_i = 1'b1;
    @(negedge `jtag_tclk); //drive to Capture IR
    force `jtag_tms_i = 1'b0;
    @(negedge `jtag_tclk); //drive to Shift IR
    force `jtag_tms_i = 1'b0;
    @(negedge `jtag_tclk);
    for(i=0;i<15;i=i+1)begin
      force `jtag_tms_i = 1'b0;
      force `jtag_tdi = ir_value[i];
      @(negedge `jtag_tclk); //stay at Shift IR cycle
    end
    force `jtag_tms_i = 1'b1; //stay at Shift IR cycle 8,drive to EXIT IR
    force `jtag_tdi = ir_value[15];
    @(negedge `jtag_tclk); //drive to Update IR
    force `jtag_tms_i = 1'b1;
    @(negedge `jtag_tclk); //drive to IDLE
    force `jtag_tms_i = 1'b0;
  end
//=================================================
end
endtask

//write DR
task write_dr;
input [143:0] jtag_data_in;
input [8:0]   jtag_data_len;
integer i;
reg  parity;
begin
  if (`jtag2_sel) begin
    //=================================================
    // JTAG_2 interface Driver
    parity = 1'b1;
    @(negedge `jtag_tclk); // start
    force `jtag_tms_i = 1'b0;
    @(negedge `jtag_tclk); // read/write
    force `jtag_tms_i = 1'b0;
    @(negedge `jtag_tclk); // RS[0]
    force `jtag_tms_i = 1'b1;
    @(negedge `jtag_tclk); // RS[1]
    force `jtag_tms_i = 1'b1;
    @(negedge `jtag_tclk); // Trn
    force `jtag_tms_i = 1'b1;
    @(negedge `jtag_tclk);
    for(i=0; i<32; i=i+1)begin
      force `jtag_tms_i = jtag_data_in[i];
      parity = parity ^ jtag_data_in[i];
      @(negedge `jtag_tclk); // Shift DR
    end
    force `jtag_tms_i = parity; // Parity
    @(negedge `jtag_tclk); // Trn
    force `jtag_tms_i = 1'b1;
    @(negedge `jtag_tclk); // Drive to IDLE
    force `jtag_tms_i = 1'b1;
  end
  else begin
    //==================================================
    // JTAG_5 interface driver
    @(negedge `jtag_tclk); //drive to Select DR Scan
    force `jtag_tms_i = 1'b1;
    @(negedge `jtag_tclk); //drive to Capture DR
    force `jtag_tms_i = 1'b0;
    @(negedge `jtag_tclk); //drive to Shift DR
    force `jtag_tms_i = 1'b0;
    @(negedge `jtag_tclk);
    for(i=0;i<jtag_data_len-1;i=i+1)begin
      force `jtag_tms_i = 1'b0;
      force `jtag_tdi = jtag_data_in[i];
      @(negedge `jtag_tclk); //stay at Shift DR cycle i
    end
    force `jtag_tms_i = 1'b1; //stay at Shift DR last cycle
    force `jtag_tdi = jtag_data_in[i];
    @(negedge `jtag_tclk); //drive to Update DR
    force `jtag_tms_i = 1'b1;
    @(negedge `jtag_tclk); //drive to IDLE
    force `jtag_tms_i = 1'b0;
  end
//==================================================
end
endtask

//Read DR
task read_dr;
input  [8:0]   jtag_data_len;
output [143:0] jtag_data_out;
reg    [143:0] jtag_data_out;
integer i;
reg  parity;
begin
  jtag_data_out = 144'b0;
  if (`jtag2_sel) begin
    //==================================================
    // JTAG_2 interface driver
    parity = 1'b1;
    @(negedge `jtag_tclk); // start
    force `jtag_tms_i = 1'b0;
    @(negedge `jtag_tclk); // read/write
    force `jtag_tms_i = 1'b1;
    @(negedge `jtag_tclk); // RS[0]
    force `jtag_tms_i = 1'b1;
    @(negedge `jtag_tclk); // RS[1]
    force `jtag_tms_i = 1'b1;
    @(negedge `jtag_tclk); // Trn
    force `jtag_tms_i = 1'b1;
    @(posedge `jtag_tclk);
    @(posedge `jtag_tclk); // Sync cycle
    for(i=0; i<32; i=i+1)begin
      @(posedge `jtag_tclk); // Shift DR
    end
    @(posedge `jtag_tclk); // Parity
    @(negedge `jtag_tclk); // Trn
    force `jtag_tms_i = 1'b1;
    @(negedge `jtag_tclk); // to IDLE
    force `jtag_tms_i = 1'b1;
  end
  else begin
    //==================================================
    // JTAG_5 interface driver
    @(negedge `jtag_tclk); //drive to Select DR Scan
    force `jtag_tms_i = 1'b1;
    @(negedge `jtag_tclk); //drive to Capture DR
    force `jtag_tms_i = 1'b0;
    @(negedge `jtag_tclk); //drive to Shift DR
    force `jtag_tms_i = 1'b0;
    for(i=0;i<jtag_data_len-1;i=i+1)begin
      @(negedge `jtag_tclk); //stay at Shift DR cycle i
      force `jtag_tms_i = 1'b0;
      @(posedge `jtag_tclk);
      jtag_data_out[i] = `jtag_tdo;
    end
    @(negedge `jtag_tclk); //stay at Shift DR last cycle
    force `jtag_tms_i = 1'b1;
    @(posedge `jtag_tclk);
    jtag_data_out[i] = `jtag_tdo;
    @(negedge `jtag_tclk); //drive to Update DR
    force `jtag_tms_i = 1'b1;
    @(negedge `jtag_tclk); //drive to IDLE
    force `jtag_tms_i = 1'b0;
  end
//==================================================
end
endtask

/*****************************************************
The following task has defined the task write_hadreg.
User can invoke this task to write the target register.
If user want to write register and set go,ex simultan
-eously,just add some identifiers in agreement such as
_go_ex,_go_nex,_ngo_ex,_ngo_nex.
Special condition:the registor Bypass was cut,just reserve
the interface to keep the compatibility with CK6xx and CK5xx
usage: write_hadreg(`target_reg_name,value)
       write_hadreg(`wbbr_go_ex,value)
*******************************************************/

// Write COREX had regs
task write_hadreg_corex;
  input[10:0] reg_select;
  input[143:0] reg_value;
  input[3: 0] core_id;
//  input[143:0] cpuscr_value;
  begin
    case(reg_select & 11'b00111111111)
      `id,
      // `pcfifo,
      // `baba,
      // `babb,
      // `wbbr,
      // `psr,
      // `pc,
      `ir,
      `bsel,
      `hcr,
      `dder,
      `mbir : begin
      // `daddr,
      // `ddata : begin
        write_ir({1'b0,reg_select[10:0],core_id[3: 0]});//select id
        write_dr(reg_value,32);
      end

      `pcfifo,
      `baba,
      `babb,
      `wbbr,
      `psr,
      `pc,
      `daddr,
      `ddata,
      `pipefifo,
      `dbginfofifo: begin
        write_ir({1'b0,reg_select[10:0],core_id[3: 0]});//select id
        write_dr(reg_value,64);
      end

      `bypass,
      `tracer,
      `mbca,
      `mbcb,
      `bama,
      `bamb : begin
        write_ir({1'b0,reg_select[10:0],core_id[3: 0]});//select mbcb
        write_dr(reg_value,8);
      end

      `hsr,
      `ehsr,
      `csr : begin
        write_ir({1'b0,reg_select[10:0],core_id[3: 0]});//select hsr
        write_dr(reg_value,16);
      end

      `event_outen,
      `event_inen,
      `pipesel: begin
        write_ir({1'b0,reg_select[10:0],core_id[3: 0]});
        write_dr(reg_value,32);
      end

//       `pipefifo:begin
//         write_ir({1'b0,reg_select[10:0], core_id[3: 0]});
//  write_dr(reg_value,40);
//       end
      default:$display("There is no target!");
    endcase
  end
endtask



//Write COREA had regs
task write_hadreg_corea;
   input[10: 0] reg_select;
   input[143: 0] reg_value;
   begin
       write_hadreg_corex(reg_select[10: 0], reg_value[143: 0], `COREA_ID);
   end
endtask

//Write COREB had regs
task write_hadreg_coreb;
   input[10: 0] reg_select;
   input[143: 0] reg_value;
   begin
       write_hadreg_corex(reg_select[10: 0], reg_value[143: 0], `COREB_ID);
   end
endtask

//Write COREC had regs
task write_hadreg_corec;
   input[10: 0] reg_select;
   input[143: 0] reg_value;
   begin
       write_hadreg_corex(reg_select[10: 0], reg_value[143: 0], `COREC_ID);
   end
endtask

//Write CORED had regs
task write_hadreg_cored;
   input[10: 0] reg_select;
   input[143: 0] reg_value;
   begin
       write_hadreg_corex(reg_select[10: 0], reg_value[143: 0], `CORED_ID);
   end
endtask





/*****************************************************
The following task has defined the task read_hadreg.
User can invoke this task to read the target
register.
Special condition:the same to write_hadreg.
usage:read_hadreg(`target_reg_name,value)
*******************************************************/
// Read COREX Had regs.
task read_hadreg_corex;
  input[10:0] reg_select;
  input[3: 0] core_id;
//  output[143:0] jtag_cpuscr_out;
  output[143:0] jtag_data_out;
  reg[143:0] jtag_data_out;
//  reg[143:0] jtag_cpuscr_out;
  begin
    case(reg_select & 11'b00111111111)
      `id,
      // `pcfifo,
      // `baba,
      // `babb,
      `hsr,
      // `wbbr,
      // `psr,
      // `pc,
      `ir,
      `hcr,
      `dder,
      `mbir : begin
      // `daddr,
      // `ddata : begin
        write_ir({1'b1,reg_select[10:0],core_id[3: 0]});//select id
        read_dr(32, jtag_data_out);
      end

      `pcfifo,
      `baba,
      `babb,
      `wbbr,
      `psr,
      `pc,
      `daddr,
      `ddata,
      `pipefifo,
      `dbginfofifo: begin
        write_ir({1'b1,reg_select[10:0],core_id[3: 0]});//select id
        read_dr(64, jtag_data_out);
      end


      `bypass,
      `tracer,
      `mbca,
      `mbcb,
      `bama,
      `bamb : begin
        write_ir({1'b1,reg_select[10:0],core_id[3: 0]});//select mbcb
        read_dr(8, jtag_data_out);
      end


      `ehsr,
      `csr : begin
        write_ir({1'b1,reg_select[10:0],core_id[3: 0]});//select hsr
        read_dr(16, jtag_data_out);
      end

      `event_outen,
      `event_inen,
      `pipesel:  begin
        write_ir({1'b1,reg_select[10:0], core_id[3: 0]});
    read_dr(32,jtag_data_out);
      end

//       `pipefifo:  begin
//         write_ir({1'b1,reg_select[10:0], core_id[3: 0]});
//  read_dr(40,jtag_data_out);
//       end

      default:$display("There is no target!");
    endcase
  end
endtask	




//-------------------------------------------------
//Read COREa Had regs
//-------------------------------------------------
task read_hadreg_corea;
    input[10:0] reg_select;
    output[143:0] jtag_data_out;
    reg[143:0] jtag_data_out;
    begin
        read_hadreg_corex(reg_select[10: 0], `COREA_ID, jtag_data_out);
    end
endtask

//Read COREB Had regs
task read_hadreg_coreb;
    input[10:0] reg_select;
    output[143:0] jtag_data_out;
    reg[143:0] jtag_data_out;
    begin
        read_hadreg_corex(reg_select[10: 0], `COREB_ID, jtag_data_out);
    end
endtask

//Read COREC HAD regs
task read_hadreg_corec;
    input[10:0] reg_select;
    output[143:0] jtag_data_out;
    reg[143:0] jtag_data_out;
    begin
        read_hadreg_corex(reg_select[10: 0], `COREC_ID, jtag_data_out);
    end
endtask

//Read CORED HAD regs
task read_hadreg_cored;
    input[10:0] reg_select;
    output[143:0] jtag_data_out;
    reg[143:0] jtag_data_out;
    begin
        read_hadreg_corex(reg_select[10: 0], `CORED_ID, jtag_data_out);
    end
endtask

/**********************************************************
The following task was defined to wait COREB enter into lp
mode
************************************************************/
task wait_lpmode_coreb;
  reg[15:0] hsr_data_out;
  begin
    read_hadreg_coreb(`hsr,hsr_data_out);
    $display("---------------------------------------");
    $display("wait COREB into lp mode......            |");
    $display("<wait_begin> The hsr is: 0x%h       |",
             hsr_data_out[15:0]);
   // write_hadreg(`bsel,0);
    while(hsr_data_out[1:0]!=2'b01)
    read_hadreg_coreb(`hsr,hsr_data_out);
    $display("<wait_end>   The hsr is: 0x%h       |",
             hsr_data_out[15:0]);
    $display("Now, COREB is in LP Mode!            |");
    $display("---------------------------------------");
  end
endtask


/**********************************************************
The following task was defined to wait COREC enter into lp
mode
************************************************************/
task wait_lpmode_corec;
  reg[15:0] hsr_data_out;
  begin
    read_hadreg_corec(`hsr,hsr_data_out);
    $display("---------------------------------------");
    $display("wait COREC into lp mode......            |");
    $display("<wait_begin> The hsr is: 0x%h       |",
             hsr_data_out[15:0]);
   // write_hadreg(`bsel,0);
    while(hsr_data_out[1:0]!=2'b01)
    read_hadreg_corec(`hsr,hsr_data_out);
    $display("<wait_end>   The hsr is: 0x%h       |",
             hsr_data_out[15:0]);
    $display("Now, COREC is in LP Mode!            |");
    $display("---------------------------------------");
  end
endtask

/**********************************************************
The following task was defined to wait CORED enter into lp
mode
************************************************************/
task wait_lpmode_cored;
  reg[15:0] hsr_data_out;
  begin
    read_hadreg_cored(`hsr,hsr_data_out);
    $display("---------------------------------------");
    $display("wait CORED into lp mode......            |");
    $display("<wait_begin> The hsr is: 0x%h       |",
             hsr_data_out[15:0]);
   // write_hadreg(`bsel,0);
    while(hsr_data_out[1:0]!=2'b01)
    read_hadreg_cored(`hsr,hsr_data_out);
    $display("<wait_end>   The hsr is: 0x%h       |",
             hsr_data_out[15:0]);
    $display("Now, CORED is in LP Mode!            |");
    $display("---------------------------------------");
  end
endtask

/***********************************************************
The following task was defined to wait CPU enter into debug
mode.
************************************************************/
//task wait_debug_mode;
//  reg15:0] hsr_data_out;
//  begin
//    read_hadreg(`hsr,hsr_data_out);
//    $display("---------------------------------------");
//    $display("wait into debug mode......            |");
//    $display("<wait_begin> The hsr is: 0x%h       |",
//             hsr_data_out[15:0]);
//    write_hadreg(`bsel,0);
//    while(hsr_data_out[1:0]!=2'b10)
//    read_hadreg(`hsr,hsr_data_out);
//    $display("<wait_end>   The hsr is: 0x%h       |",
//             hsr_data_out[15:0]);
//    $display("Now, CPU is in Debug Mode!            |");
//    $display("---------------------------------------");
//  end
//endtask


task wait_debug_mode_corea;
  reg[15:0] hsr_data_out;
  begin
    read_hadreg_corea(`hsr,hsr_data_out);
    $display("---------------------------------------");
    $display("wait COREA into debug mode......            |");
    $display("<wait_begin> The hsr is: 0x%h       |",
             hsr_data_out[15:0]);
  //  write_hadreg(`bsel,0);
    while(hsr_data_out[1:0]!=2'b10)
    read_hadreg_corea(`hsr,hsr_data_out);
    $display("<wait_end>   The hsr is: 0x%h       |",
             hsr_data_out[15:0]);
    $display("Now, COREA is in Debug Mode!            |");
    $display("---------------------------------------");
  end
endtask


/**********************************************************
The following task was defined to wait COREB enter into debug
mode
************************************************************/
task wait_debug_mode_coreb;
  reg[15:0] hsr_data_out;
  begin
    read_hadreg_coreb(`hsr,hsr_data_out);
    $display("---------------------------------------");
    $display("wait COREB into debug mode......            |");
    $display("<wait_begin> The hsr is: 0x%h       |",
             hsr_data_out[15:0]);
   // write_hadreg(`bsel,0);
    while(hsr_data_out[1:0]!=2'b10)
    read_hadreg_coreb(`hsr,hsr_data_out);
    $display("<wait_end>   The hsr is: 0x%h       |",
             hsr_data_out[15:0]);
    $display("Now, COREB is in Debug Mode!            |");
    $display("---------------------------------------");
  end
endtask


/**********************************************************
The following task was defined to wait COREC enter into debug
mode
************************************************************/
task wait_debug_mode_corec;
  reg[15:0] hsr_data_out;
  begin
    read_hadreg_corec(`hsr,hsr_data_out);
    $display("---------------------------------------");
    $display("wait COREC into debug mode......            |");
    $display("<wait_begin> The hsr is: 0x%h       |",
             hsr_data_out[15:0]);
   // write_hadreg(`bsel,0);
    while(hsr_data_out[1:0]!=2'b10)
    read_hadreg_corec(`hsr,hsr_data_out);
    $display("<wait_end>   The hsr is: 0x%h       |",
             hsr_data_out[15:0]);
    $display("Now, COREC is in Debug Mode!            |");
    $display("---------------------------------------");
  end
endtask

/**********************************************************
The following task was defined to wait CORED enter into debug
mode
************************************************************/
task wait_debug_mode_cored;
  reg[15:0] hsr_data_out;
  begin
    read_hadreg_cored(`hsr,hsr_data_out);
    $display("---------------------------------------");
    $display("wait CORED into debug mode......            |");
    $display("<wait_begin> The hsr is: 0x%h       |",
             hsr_data_out[15:0]);
   // write_hadreg(`bsel,0);
    while(hsr_data_out[1:0]!=2'b10)
    read_hadreg_cored(`hsr,hsr_data_out);
    $display("<wait_end>   The hsr is: 0x%h       |",
             hsr_data_out[15:0]);
    $display("Now, CORED is in Debug Mode!            |");
    $display("---------------------------------------");
  end
endtask

/*********************************************************
The following task was defined to wait all the cores enter
in to debug mode
*********************************************************/
task wait_debug_mode;
  reg[15:0] hsr_data_out;
  begin
  //corea enter debug
    read_hadreg_corea(`hsr,hsr_data_out);
    while(hsr_data_out[1:0]!=2'b10)
    read_hadreg_corea(`hsr,hsr_data_out);
    $display("Now, COREA is in Debug Mode!            |");

//`ifdef PROCESSOR_1
//  // coreb enter debug
//    if (`core1_rst_b) begin      // To support single_mode.
//        read_hadreg_coreb(`hsr,hsr_data_out);
//        while(hsr_data_out[1:0]!=2'b10)
//        read_hadreg_coreb(`hsr,hsr_data_out);
//        $display("Now, COREB is in Debug Mode!            |");
//    end
//`endif
//
//`ifdef PROCESSOR_2
//  //corec enter debug
//    if (`core2_rst_b) begin      // To support single_mode.
//        read_hadreg_corec(`hsr,hsr_data_out);
//        while(hsr_data_out[1:0]!=2'b10)
//        read_hadreg_corec(`hsr,hsr_data_out);
//        $display("Now, COREC is in Debug Mode!            |");
//    end
// `endif
//
// `ifdef PROCESSOR_3
//  // cored enter debug
//    if (`core3_rst_b) begin      // To support single_mode.
//        read_hadreg_cored(`hsr,hsr_data_out);
//        while(hsr_data_out[1:0]!=2'b10)
//        read_hadreg_cored(`hsr,hsr_data_out);
//        $display("Now, CORED is in Debug Mode!            |");
//    end

    $display("all cores are in debug mode");
// `endif

  end
endtask





//set all the cores can broadcast debug events and can receive debug events
task open_event;
begin
//COREA
   write_hadreg_corea(`event_outen,32'h3);
   write_hadreg_corea(`event_inen,32'h3);
   
//COREB
`ifdef PROCESSOR_1
   write_hadreg_coreb(`event_outen,32'h3);
   write_hadreg_coreb(`event_inen,32'h3);
`endif

//COREC
`ifdef PROCESSOR_2
   write_hadreg_corec(`event_outen,32'h3);
   write_hadreg_corec(`event_inen,32'h3);
`endif

//CORED
`ifdef PROCESSOR_3
   write_hadreg_cored(`event_outen,32'h3);
   write_hadreg_cored(`event_inen,32'h3);
`endif

end
endtask

/***********************************************************
The following task was defined to check the cpu mode.
If the cpu has into debug mode, 
************************************************************/
//task check_cpu_mode;
//  reg[15:0] hsr_data_out;
//  begin
//    read_hadreg(`hsr,hsr_data_out);
//    if(hsr_data_out[1:0]==2'b00)
//      begin
//      $display("----------------------------------------");
//      $display("*** <CHECK> hsr value is:0x%h  ***   |",
//               hsr_data_out[15:0]);
//      $display("***  CPU is in Normal Mode!  ***       |"); 
//      $display("----------------------------------------");
//      end
//    else if(hsr_data_out[1:0]==2'b01)
//      begin
//      $display("----------------------------------------");
//      $display("*** <CHECK> hsr value is:0x%h  ***   |",
//               hsr_data_out[15:0]);
//      $display("***  CPU is in LowPower Mode!  ***     |"); 
//      $display("----------------------------------------");
//      end
//    else if(hsr_data_out[1:0]==2'b10)
//      begin
//      $display("----------------------------------------");
//      $display("*** <CHECK> hsr value is:0x%h  ***   |",
//               hsr_data_out[15:0]);
//      $display("***  CPU is in Debug Mode!  ***        |"); 
//      $display("----------------------------------------");
//      end    
//    else      
//      beg    in 
//      $di    splay("----------------------------------------");
//      $di    splay("*** <CHECK> hsr value is:0x%h  ***   |",
//                   hsr_data_out[15:0]);
//      $di    splay("***  CPU is in Reserve Mode!  ***      |"); 
//      $di    splay("----------------------------------------");
//      end
//  end        
//endtask      
               
               
/**********    *************************************************
The followi    ng task was defined to check the cpu mode.
If the cpu     has into debug mode,
***********    *************************************************/
task check_cpu_mode_corea;
  reg[15:0] hsr_data_out;
  begin
    read_hadreg_corea(`hsr,hsr_data_out);
    if(hsr_data_out[1:0]==2'b00)
      begin
      $display("----------------------------------------");
      $display("*** <CHECK> hsr value is:0x%h  ***   |",
               hsr_data_out[15:0]);
      $display("***  CPU is in Normal Mode!  ***       |");
      $display("----------------------------------------");
      end
    else if(hsr_data_out[1:0]==2'b01)
      begin
      $display("----------------------------------------");
      $display("*** <CHECK> hsr value is:0x%h  ***   |",
               hsr_data_out[15:0]);
      $display("***  CPU is in LowPower Mode!  ***     |");
      $display("----------------------------------------");
      end
    else if(hsr_data_out[1:0]==2'b10)
      begin
      $display("----------------------------------------");
      $display("*** <CHECK> hsr value is:0x%h  ***   |",
               hsr_data_out[15:0]);
      $display("***  CPU is in Debug Mode!  ***        |");
      $display("----------------------------------------");
      end
    else
      begin
      $display("----------------------------------------");
      $display("*** <CHECK> hsr value is:0x%h  ***   |",
               hsr_data_out[15:0]);
      $display("***  CPU is in Reserve Mode!  ***      |");
      $display("----------------------------------------");
      end
  end
endtask


/***********************************************************
The following task was defined to check the cpu mode.
If the cpu has into debug mode,
************************************************************/
task check_cpu_mode_coreb;
  reg[15:0] hsr_data_out;
  begin
    read_hadreg_coreb(`hsr,hsr_data_out);
    if(hsr_data_out[1:0]==2'b00)
      begin
      $display("----------------------------------------");
      $display("*** <CHECK> hsr value is:0x%h  ***   |",
               hsr_data_out[15:0]);
      $display("***  CPU is in Normal Mode!  ***       |");
      $display("----------------------------------------");
      end
    else if(hsr_data_out[1:0]==2'b01)
      begin
      $display("----------------------------------------");
      $display("*** <CHECK> hsr value is:0x%h  ***   |",
               hsr_data_out[15:0]);
      $display("***  CPU is in LowPower Mode!  ***     |");
      $display("----------------------------------------");
      end
    else if(hsr_data_out[1:0]==2'b10)
      begin
      $display("----------------------------------------");
      $display("*** <CHECK> hsr value is:0x%h  ***   |",
               hsr_data_out[15:0]);
      $display("***  CPU is in Debug Mode!  ***        |");
      $display("----------------------------------------");
      end
    else
      begin
      $display("----------------------------------------");
      $display("*** <CHECK> hsr value is:0x%h  ***   |",
               hsr_data_out[15:0]);
      $display("***  CPU is in Reserve Mode!  ***      |");
      $display("----------------------------------------");
      end
  end
endtask

/***********************************************************
The following task was defined to check the cpu mode.
If the cpu has into debug mode,
************************************************************/
task check_cpu_mode_corec;
  reg[15:0] hsr_data_out;
  begin
    read_hadreg_corec(`hsr,hsr_data_out);
    if(hsr_data_out[1:0]==2'b00)
      begin
      $display("----------------------------------------");
      $display("*** <CHECK> hsr value is:0x%h  ***   |",
               hsr_data_out[15:0]);
      $display("***  CPU is in Normal Mode!  ***       |");
      $display("----------------------------------------");
      end
    else if(hsr_data_out[1:0]==2'b01)
      begin
      $display("----------------------------------------");
      $display("*** <CHECK> hsr value is:0x%h  ***   |",
               hsr_data_out[15:0]);
      $display("***  CPU is in LowPower Mode!  ***     |");
      $display("----------------------------------------");
      end
    else if(hsr_data_out[1:0]==2'b10)
      begin
      $display("----------------------------------------");
      $display("*** <CHECK> hsr value is:0x%h  ***   |",
               hsr_data_out[15:0]);
      $display("***  CPU is in Debug Mode!  ***        |");
      $display("----------------------------------------");
      end
    else
      begin
      $display("----------------------------------------");
      $display("*** <CHECK> hsr value is:0x%h  ***   |",
               hsr_data_out[15:0]);
      $display("***  CPU is in Reserve Mode!  ***      |");
      $display("----------------------------------------");
      end
  end
endtask

/***********************************************************
The following task was defined to check the cpu mode.
If the cpu has into debug mode,
************************************************************/
task check_cpu_mode_cored;
  reg[15:0] hsr_data_out;
  begin
    read_hadreg_cored(`hsr,hsr_data_out);
    if(hsr_data_out[1:0]==2'b00)
      begin
      $display("----------------------------------------");
      $display("*** <CHECK> hsr value is:0x%h  ***   |",
               hsr_data_out[15:0]);
      $display("***  CPU is in Normal Mode!  ***       |");
      $display("----------------------------------------");
      end
    else if(hsr_data_out[1:0]==2'b01)
      begin
      $display("----------------------------------------");
      $display("*** <CHECK> hsr value is:0x%h  ***   |",
               hsr_data_out[15:0]);
      $display("***  CPU is in LowPower Mode!  ***     |");
      $display("----------------------------------------");
      end
    else if(hsr_data_out[1:0]==2'b10)
      begin
      $display("----------------------------------------");
      $display("*** <CHECK> hsr value is:0x%h  ***   |",
               hsr_data_out[15:0]);
      $display("***  CPU is in Debug Mode!  ***        |");
      $display("----------------------------------------");
      end
    else
      begin
      $display("----------------------------------------");
      $display("*** <CHECK> hsr value is:0x%h  ***   |",
               hsr_data_out[15:0]);
      $display("***  CPU is in Reserve Mode!  ***      |"); 
      $display("----------------------------------------");
      end
  end
endtask

task had_mmode_smode_corea;
    reg [63: 0] wbbr_data_out;
    reg [31: 0] hsr_data_out;
begin
    write_hadreg_corea(`csr, 16'h0);
    write_hadreg_corea(`ir_go_nex, `CSRR_X0_MSTATUS);
    hsr_data_out[12] = 0;
    while(!hsr_data_out[12])
        read_hadreg_corea(`hsr, hsr_data_out);
    read_hadreg_corea(`wbbr, wbbr_data_out);
    wbbr_data_out[12:11] = 2'b01;

    write_hadreg_corea(`csr, 16'h100);
    write_hadreg_corea(`wbbr, wbbr_data_out);
    write_hadreg_corea(`ir_go_nex, `CSRW_MSTATUS_X0);
    hsr_data_out[12] = 0;
    while(!hsr_data_out[12])
        read_hadreg_corea(`hsr, hsr_data_out);

    write_hadreg_corea(`ir_go_nex, `MRET);
end
endtask


task had_smode_umode_corea;
    reg [63: 0] wbbr_data_out;
    reg [31: 0] hsr_data_out;
begin
    write_hadreg_corea(`csr, 16'h0);
    write_hadreg_corea(`ir_go_nex, `CSRR_X0_SSTATUS);
    hsr_data_out[12] = 0;
    while(!hsr_data_out[12])
        read_hadreg_corea(`hsr, hsr_data_out);
    read_hadreg_corea(`wbbr, wbbr_data_out);
    wbbr_data_out[8] = 1'b0;

    write_hadreg_corea(`csr, 16'h100);
    write_hadreg_corea(`wbbr, wbbr_data_out);
    write_hadreg_corea(`ir_go_nex, `CSRW_SSTATUS_X0);
    hsr_data_out[12] = 0;
    while(!hsr_data_out[12])
        read_hadreg_corea(`hsr, hsr_data_out);

    write_hadreg_corea(`ir_go_nex, `SRET);
end
endtask

