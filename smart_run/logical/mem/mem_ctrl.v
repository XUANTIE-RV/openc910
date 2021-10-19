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


























module mem_ctrl(
  haddr_s1,
  hburst_s1,
  hprot_s1,
  hrdata_s1,
  hready_s1,
  hresp_s1,
  hsel_s1,
  hsize_s1,
  htrans_s1,
  hwdata_s1,
  hwrite_s1,
  pad_cpu_rst_b,
  pll_core_cpuclk
);


input   [39 :0]  haddr_s1;             
input   [2  :0]  hburst_s1;            
input   [3  :0]  hprot_s1;             
input            hsel_s1;              
input   [2  :0]  hsize_s1;             
input   [1  :0]  htrans_s1;            
input   [127:0]  hwdata_s1;            
input            hwrite_s1;            
input            pad_cpu_rst_b;        
input            pll_core_cpuclk;      
output  [127:0]  hrdata_s1;            
output           hready_s1;            
output  [1  :0]  hresp_s1;             


wire             ahb_trans_clear;      
wire             ahb_trans_valid;      
wire             bypass_if_write_byte; 
wire             bypass_if_write_dword; 
wire             bypass_if_write_hword; 
wire             bypass_if_write_qword; 
wire             bypass_if_write_word; 
wire    [39 :0]  haddr;                
wire    [39 :0]  haddr_s1;             
wire             hclk;                 
wire    [127:0]  hrdata;               
wire    [127:0]  hrdata_0;             
wire    [31 :0]  hrdata_00;            
wire    [31 :0]  hrdata_01;            
wire    [31 :0]  hrdata_10;            
wire    [31 :0]  hrdata_11;            
wire    [127:0]  hrdata_pre;           
wire    [127:0]  hrdata_s1;            
wire             hready_s1;            
wire    [1  :0]  hresp_s1;             
wire             hrst_b;               
wire             hsel;                 
wire             hsel_s1;              
wire    [2  :0]  hsize;                
wire    [2  :0]  hsize_s1;             
wire    [1  :0]  htrans;               
wire    [1  :0]  htrans_s1;            
wire    [127:0]  hwdata;               
wire    [127:0]  hwdata_s1;            
wire             hwrite;               
wire             hwrite_s1;            
wire             pad_cpu_rst_b;        
wire             pll_core_cpuclk;      
wire    [12 :0]  ram0_addr;            
wire    [7  :0]  ram0_din;             
wire    [7  :0]  ram0_dout;            
wire    [12 :0]  ram10_addr;           
wire    [7  :0]  ram10_din;            
wire    [7  :0]  ram10_dout;           
wire    [12 :0]  ram11_addr;           
wire    [7  :0]  ram11_din;            
wire    [7  :0]  ram11_dout;           
wire    [12 :0]  ram12_addr;           
wire    [7  :0]  ram12_din;            
wire    [7  :0]  ram12_dout;           
wire    [12 :0]  ram13_addr;           
wire    [7  :0]  ram13_din;            
wire    [7  :0]  ram13_dout;           
wire    [12 :0]  ram14_addr;           
wire    [7  :0]  ram14_din;            
wire    [7  :0]  ram14_dout;           
wire    [12 :0]  ram15_addr;           
wire    [7  :0]  ram15_din;            
wire    [7  :0]  ram15_dout;           
wire    [12 :0]  ram1_addr;            
wire    [7  :0]  ram1_din;             
wire    [7  :0]  ram1_dout;            
wire    [12 :0]  ram2_addr;            
wire    [7  :0]  ram2_din;             
wire    [7  :0]  ram2_dout;            
wire    [12 :0]  ram3_addr;            
wire    [7  :0]  ram3_din;             
wire    [7  :0]  ram3_dout;            
wire    [12 :0]  ram4_addr;            
wire    [7  :0]  ram4_din;             
wire    [7  :0]  ram4_dout;            
wire    [12 :0]  ram5_addr;            
wire    [7  :0]  ram5_din;             
wire    [7  :0]  ram5_dout;            
wire    [12 :0]  ram6_addr;            
wire    [7  :0]  ram6_din;             
wire    [7  :0]  ram6_dout;            
wire    [12 :0]  ram7_addr;            
wire    [7  :0]  ram7_din;             
wire    [7  :0]  ram7_dout;            
wire    [12 :0]  ram8_addr;            
wire    [7  :0]  ram8_din;             
wire    [7  :0]  ram8_dout;            
wire    [12 :0]  ram9_addr;            
wire    [7  :0]  ram9_din;             
wire    [7  :0]  ram9_dout;            
wire    [39 :0]  ram_addr;             
wire    [15 :0]  ram_clk;              
wire    [15 :0]  ram_wen_byte;         
wire    [15 :0]  ram_wen_dword;        
wire    [15 :0]  ram_wen_hword;        
wire    [15 :0]  ram_wen_qword;        
wire    [15 :0]  ram_wen_word;         
wire             raw_bypass_en;        
wire             raw_en;               
wire             raw_no_bypass;        
wire             rdata_vld;            
wire             read_en;              
wire             write_en;             


reg     [39 :0]  haddr_ff;             
reg     [127:0]  hrdata_raw;           
reg              hread_ff;             
reg              hready;               
reg     [1  :0]  hresp;                
reg     [2  :0]  hsize_ff;             
reg              hwrite_ff;            
reg     [15 :0]  ram_wen;              
reg     [15 :0]  ram_wen_pre;          
reg              raw_data_vld;         








parameter MEM_ADDR_WIDTH = 17;

assign hclk             = pll_core_cpuclk;
assign hrst_b           = pad_cpu_rst_b;
assign hsel             = hsel_s1;
assign htrans[1:0]      = htrans_s1[1:0];
assign hsize[2:0]       = hsize_s1[2:0];
assign haddr[39:0]      = haddr_s1[39:0];
assign hwrite           = hwrite_s1;
assign hresp_s1[1:0]    = hresp[1:0];
assign hready_s1        = hready;
assign hwdata[127:0]    = hwdata_s1[127:0];
assign hrdata_s1[127:0] = hrdata[127:0];

assign ahb_trans_valid = hsel && hready &&
                         ((htrans[1:0] == 2'b10) || (htrans[1:0] == 2'b11));

assign ahb_trans_clear = hready && !hsel;

always @(posedge hclk or negedge hrst_b)
begin
  if (!hrst_b)
  begin
    hwrite_ff      <= 1'b0;
    hread_ff       <= 1'b0;
    hsize_ff[2:0]  <= 3'd0;
    haddr_ff[39:0] <= 40'd0;
    raw_data_vld   <= 1'b0;
  end
  else if (ahb_trans_valid)
  begin
    hwrite_ff      <= hwrite;
    hread_ff       <= !hwrite;
    hsize_ff[2:0]  <= hsize[2:0];
    haddr_ff[39:0] <= haddr[39:0];
    raw_data_vld   <= raw_bypass_en;
  end
  else if (ahb_trans_clear)
  begin
    hwrite_ff      <= 1'b0;
    hread_ff       <= 1'b0;
    hsize_ff[2:0]  <= 3'd0;
    haddr_ff[39:0] <= 40'd0;
    raw_data_vld   <= 1'b0;
  end
end

assign write_en  = hwrite_ff;
assign read_en   = ahb_trans_valid && !hwrite;
assign rdata_vld = hread_ff;
assign raw_en    = write_en && read_en;




always @(posedge hclk or negedge hrst_b)
begin
  if (!hrst_b)
    hresp[1:0] <= 2'b00;
  else
    hresp[1:0] <= 2'b00;
end

assign raw_no_bypass = raw_en && (!raw_bypass_en);

always @(posedge hclk or negedge hrst_b)
begin
  if (!hrst_b)
    hready <= 1'b0;
  else if (raw_no_bypass)
    hready <= 1'b0;
  else
    hready <= 1'b1;
end

assign ram_addr[39:0] = (write_en || !hready) ? haddr_ff[39:0] : haddr[39:0];



/* {{{ ram address and write-en */
assign ram_clk = {16{hclk}};

assign ram0_addr[MEM_ADDR_WIDTH-5:0]  = ram_addr[MEM_ADDR_WIDTH-1:4];
assign ram1_addr[MEM_ADDR_WIDTH-5:0]  = ram_addr[MEM_ADDR_WIDTH-1:4];
assign ram2_addr[MEM_ADDR_WIDTH-5:0]  = ram_addr[MEM_ADDR_WIDTH-1:4];
assign ram3_addr[MEM_ADDR_WIDTH-5:0]  = ram_addr[MEM_ADDR_WIDTH-1:4];
assign ram4_addr[MEM_ADDR_WIDTH-5:0]  = ram_addr[MEM_ADDR_WIDTH-1:4];
assign ram5_addr[MEM_ADDR_WIDTH-5:0]  = ram_addr[MEM_ADDR_WIDTH-1:4];
assign ram6_addr[MEM_ADDR_WIDTH-5:0]  = ram_addr[MEM_ADDR_WIDTH-1:4];
assign ram7_addr[MEM_ADDR_WIDTH-5:0]  = ram_addr[MEM_ADDR_WIDTH-1:4];
assign ram8_addr[MEM_ADDR_WIDTH-5:0]  = ram_addr[MEM_ADDR_WIDTH-1:4];
assign ram9_addr[MEM_ADDR_WIDTH-5:0]  = ram_addr[MEM_ADDR_WIDTH-1:4];
assign ram10_addr[MEM_ADDR_WIDTH-5:0] = ram_addr[MEM_ADDR_WIDTH-1:4];
assign ram11_addr[MEM_ADDR_WIDTH-5:0] = ram_addr[MEM_ADDR_WIDTH-1:4];
assign ram12_addr[MEM_ADDR_WIDTH-5:0] = ram_addr[MEM_ADDR_WIDTH-1:4];
assign ram13_addr[MEM_ADDR_WIDTH-5:0] = ram_addr[MEM_ADDR_WIDTH-1:4];
assign ram14_addr[MEM_ADDR_WIDTH-5:0] = ram_addr[MEM_ADDR_WIDTH-1:4];
assign ram15_addr[MEM_ADDR_WIDTH-5:0] = ram_addr[MEM_ADDR_WIDTH-1:4];

assign hrdata_00[31:0] = {ram3_dout[7:0], ram2_dout[7:0], ram1_dout[7:0], ram0_dout[7:0]};
assign hrdata_01[31:0] = {ram7_dout[7:0], ram6_dout[7:0], ram5_dout[7:0], ram4_dout[7:0]};
assign hrdata_10[31:0] = {ram11_dout[7:0], ram10_dout[7:0], ram9_dout[7:0], ram8_dout[7:0]};
assign hrdata_11[31:0] = {ram15_dout[7:0], ram14_dout[7:0], ram13_dout[7:0], ram12_dout[7:0]};

assign ram_wen_byte[0] = (haddr[3:0] == 4'h0);
assign ram_wen_byte[1] = (haddr[3:0] == 4'h1);
assign ram_wen_byte[2] = (haddr[3:0] == 4'h2);
assign ram_wen_byte[3] = (haddr[3:0] == 4'h3);
assign ram_wen_byte[4] = (haddr[3:0] == 4'h4);
assign ram_wen_byte[5] = (haddr[3:0] == 4'h5);
assign ram_wen_byte[6] = (haddr[3:0] == 4'h6);
assign ram_wen_byte[7] = (haddr[3:0] == 4'h7);
assign ram_wen_byte[8] = (haddr[3:0] == 4'h8);
assign ram_wen_byte[9] = (haddr[3:0] == 4'h9);
assign ram_wen_byte[10] = (haddr[3:0] == 4'ha);
assign ram_wen_byte[11] = (haddr[3:0] == 4'hb);
assign ram_wen_byte[12] = (haddr[3:0] == 4'hc);
assign ram_wen_byte[13] = (haddr[3:0] == 4'hd);
assign ram_wen_byte[14] = (haddr[3:0] == 4'he);
assign ram_wen_byte[15] = (haddr[3:0] == 4'hf);

assign ram_wen_hword[0] = (haddr[3:1] == 3'd0);
assign ram_wen_hword[1] = (haddr[3:1] == 3'd0);
assign ram_wen_hword[2] = (haddr[3:1] == 3'd1);
assign ram_wen_hword[3] = (haddr[3:1] == 3'd1);
assign ram_wen_hword[4] = (haddr[3:1] == 3'd2);
assign ram_wen_hword[5] = (haddr[3:1] == 3'd2);
assign ram_wen_hword[6] = (haddr[3:1] == 3'd3);
assign ram_wen_hword[7] = (haddr[3:1] == 3'd3);
assign ram_wen_hword[8] = (haddr[3:1] == 3'd4);
assign ram_wen_hword[9] = (haddr[3:1] == 3'd4);
assign ram_wen_hword[10] = (haddr[3:1] == 3'd5);
assign ram_wen_hword[11] = (haddr[3:1] == 3'd5);
assign ram_wen_hword[12] = (haddr[3:1] == 3'd6);
assign ram_wen_hword[13] = (haddr[3:1] == 3'd6);
assign ram_wen_hword[14] = (haddr[3:1] == 3'd7);
assign ram_wen_hword[15] = (haddr[3:1] == 3'd7);

assign ram_wen_word[0] = (haddr[3:2] == 2'd0);
assign ram_wen_word[1] = (haddr[3:2] == 2'd0);
assign ram_wen_word[2] = (haddr[3:2] == 2'd0);
assign ram_wen_word[3] = (haddr[3:2] == 2'd0);
assign ram_wen_word[4] = (haddr[3:2] == 2'd1);
assign ram_wen_word[5] = (haddr[3:2] == 2'd1);
assign ram_wen_word[6] = (haddr[3:2] == 2'd1);
assign ram_wen_word[7] = (haddr[3:2] == 2'd1);
assign ram_wen_word[8] = (haddr[3:2] == 2'd2);
assign ram_wen_word[9] = (haddr[3:2] == 2'd2);
assign ram_wen_word[10] = (haddr[3:2] == 2'd2);
assign ram_wen_word[11] = (haddr[3:2] == 2'd2);
assign ram_wen_word[12] = (haddr[3:2] == 2'd3);
assign ram_wen_word[13] = (haddr[3:2] == 2'd3);
assign ram_wen_word[14] = (haddr[3:2] == 2'd3);
assign ram_wen_word[15] = (haddr[3:2] == 2'd3);

assign ram_wen_dword[0] = (haddr[3] == 1'b0);
assign ram_wen_dword[1] = (haddr[3] == 1'b0);
assign ram_wen_dword[2] = (haddr[3] == 1'b0);
assign ram_wen_dword[3] = (haddr[3] == 1'b0);
assign ram_wen_dword[4] = (haddr[3] == 1'b0);
assign ram_wen_dword[5] = (haddr[3] == 1'b0);
assign ram_wen_dword[6] = (haddr[3] == 1'b0);
assign ram_wen_dword[7] = (haddr[3] == 1'b0);
assign ram_wen_dword[8] = (haddr[3] == 1'b1);
assign ram_wen_dword[9] = (haddr[3] == 1'b1);
assign ram_wen_dword[10] = (haddr[3] == 1'b1);
assign ram_wen_dword[11] = (haddr[3] == 1'b1);
assign ram_wen_dword[12] = (haddr[3] == 1'b1);
assign ram_wen_dword[13] = (haddr[3] == 1'b1);
assign ram_wen_dword[14] = (haddr[3] == 1'b1);
assign ram_wen_dword[15] = (haddr[3] == 1'b1);

assign ram_wen_qword[15:0] = {16{1'b1}};

always @( * )
begin
  case (hsize[2:0])
    3'b000: // byte
      ram_wen_pre[15:0] = ram_wen_byte[15:0];
    3'b001: // half-word
      ram_wen_pre[15:0] = ram_wen_hword[15:0];
    3'b010: // word
      ram_wen_pre[15:0] = ram_wen_word[15:0];
    3'b011: // double-word
      ram_wen_pre[15:0] = ram_wen_dword[15:0];
    3'b100: // quad-word
      ram_wen_pre[15:0] = ram_wen_qword[15:0];
    default:
      ram_wen_pre[15:0] = 16'd0;
  endcase
end

always @(posedge hclk or negedge hrst_b)
begin
  if (!hrst_b)
    ram_wen[15:0] <= 16'd0;
  else if (ahb_trans_valid && hwrite)
    ram_wen[15:0] <= ram_wen_pre[15:0];
  else
    ram_wen[15:0] <= 16'd0;
end
/* }}} */

/* {{{ BUS_WIDTH_128 */
assign ram0_din[7:0]  = hwdata[7:0];
assign ram1_din[7:0]  = hwdata[15:8];
assign ram2_din[7:0]  = hwdata[23:16];
assign ram3_din[7:0]  = hwdata[31:24];
assign ram4_din[7:0]  = hwdata[39:32];
assign ram5_din[7:0]  = hwdata[47:40];
assign ram6_din[7:0]  = hwdata[55:48];
assign ram7_din[7:0]  = hwdata[63:56];
assign ram8_din[7:0]  = hwdata[71:64];
assign ram9_din[7:0]  = hwdata[79:72];
assign ram10_din[7:0] = hwdata[87:80];
assign ram11_din[7:0] = hwdata[95:88];
assign ram12_din[7:0] = hwdata[103:96];
assign ram13_din[7:0] = hwdata[111:104];
assign ram14_din[7:0] = hwdata[119:112];
assign ram15_din[7:0] = hwdata[127:120];

assign hrdata_0[127:0] = {hrdata_11[31:0], hrdata_10[31:0], hrdata_01[31:0], hrdata_00[31:0]};

assign bypass_if_write_qword = (haddr_ff[MEM_ADDR_WIDTH-1:4] == haddr[MEM_ADDR_WIDTH-1:4]) &&
                               (hsize_ff[2:0] == 3'b100);
assign bypass_if_write_dword = (haddr_ff[MEM_ADDR_WIDTH-1:3] == haddr[MEM_ADDR_WIDTH-1:3]) &&
                               (hsize_ff[2:0] == 3'b011) && (!hsize[2]);
assign bypass_if_write_word = (haddr_ff[MEM_ADDR_WIDTH-1:2] == haddr[MEM_ADDR_WIDTH-1:2]) &&
                              (hsize_ff[2:0] == 3'b010) &&
                              ((hsize[2:0] != 3'b011) || (hsize[2:0] != 3'b100));
assign bypass_if_write_hword = (haddr_ff[MEM_ADDR_WIDTH-1:1] == haddr[MEM_ADDR_WIDTH-1:1]) &&
                               (hsize_ff[2:0] == 3'b001) && (hsize[2:1] == 2'b00);
assign bypass_if_write_byte = (haddr_ff[MEM_ADDR_WIDTH-1:0] == haddr[MEM_ADDR_WIDTH-1:0]) &&
                              (hsize[2:0] == 3'b000);

assign raw_bypass_en = raw_en &&
                       (bypass_if_write_qword ||
                        bypass_if_write_dword ||
                        bypass_if_write_word ||
                        bypass_if_write_hword ||
                        bypass_if_write_byte);

assign hrdata_pre[127:0] = hrdata_0[127:0];

always @(posedge hclk or negedge hrst_b)
begin
  if (!hrst_b)
    hrdata_raw[127:0] <= 128'd0;
  else if (raw_bypass_en)
    hrdata_raw[127:0] <= hwdata[127:0];
  else
    hrdata_raw[127:0] <= hrdata_raw[127:0];
end

assign hrdata[127:0] = raw_data_vld ? hrdata_raw[127:0] : hrdata_pre[127:0];
/* }}} */


/* {{{ memory unit instance */
ram #(8, MEM_ADDR_WIDTH-4) ram0(
  .PortAClk (ram_clk[0]),
  .PortAAddr(ram0_addr),
  .PortADataIn (ram0_din),
  .PortAWriteEnable(ram_wen[0]),
  .PortADataOut(ram0_dout));

ram #(8, MEM_ADDR_WIDTH-4) ram1(
  .PortAClk (ram_clk[1]),
  .PortAAddr(ram1_addr),
  .PortADataIn (ram1_din),
  .PortAWriteEnable(ram_wen[1]),
  .PortADataOut(ram1_dout));

ram #(8, MEM_ADDR_WIDTH-4) ram2(
  .PortAClk (ram_clk[2]),
  .PortAAddr(ram2_addr),
  .PortADataIn (ram2_din),
  .PortAWriteEnable(ram_wen[2]),
  .PortADataOut(ram2_dout));

ram #(8, MEM_ADDR_WIDTH-4) ram3(
  .PortAClk (ram_clk[3]),
  .PortAAddr(ram3_addr),
  .PortADataIn (ram3_din),
  .PortAWriteEnable(ram_wen[3]),
  .PortADataOut(ram3_dout));

ram #(8, MEM_ADDR_WIDTH-4) ram4(
  .PortAClk (ram_clk[4]),
  .PortAAddr(ram4_addr),
  .PortADataIn (ram4_din),
  .PortAWriteEnable(ram_wen[4]),
  .PortADataOut(ram4_dout));

ram #(8, MEM_ADDR_WIDTH-4) ram5(
  .PortAClk (ram_clk[5]),
  .PortAAddr(ram5_addr),
  .PortADataIn (ram5_din),
  .PortAWriteEnable(ram_wen[5]),
  .PortADataOut(ram5_dout));

ram #(8, MEM_ADDR_WIDTH-4) ram6(
  .PortAClk (ram_clk[6]),
  .PortAAddr(ram6_addr),
  .PortADataIn (ram6_din),
  .PortAWriteEnable(ram_wen[6]),
  .PortADataOut(ram6_dout));

ram #(8, MEM_ADDR_WIDTH-4) ram7(
  .PortAClk (ram_clk[7]),
  .PortAAddr(ram7_addr),
  .PortADataIn (ram7_din),
  .PortAWriteEnable(ram_wen[7]),
  .PortADataOut(ram7_dout));

ram #(8, MEM_ADDR_WIDTH-4) ram8(
  .PortAClk (ram_clk[8]),
  .PortAAddr(ram8_addr),
  .PortADataIn (ram8_din),
  .PortAWriteEnable(ram_wen[8]),
  .PortADataOut(ram8_dout));

ram #(8, MEM_ADDR_WIDTH-4) ram9(
  .PortAClk (ram_clk[9]),
  .PortAAddr(ram9_addr),
  .PortADataIn (ram9_din),
  .PortAWriteEnable(ram_wen[9]),
  .PortADataOut(ram9_dout));

ram #(8, MEM_ADDR_WIDTH-4) ram10(
  .PortAClk (ram_clk[10]),
  .PortAAddr(ram10_addr),
  .PortADataIn (ram10_din),
  .PortAWriteEnable(ram_wen[10]),
  .PortADataOut(ram10_dout));

ram #(8, MEM_ADDR_WIDTH-4) ram11(
  .PortAClk (ram_clk[11]),
  .PortAAddr(ram11_addr),
  .PortADataIn (ram11_din),
  .PortAWriteEnable(ram_wen[11]),
  .PortADataOut(ram11_dout));

ram #(8, MEM_ADDR_WIDTH-4) ram12(
  .PortAClk (ram_clk[12]),
  .PortAAddr(ram12_addr),
  .PortADataIn (ram12_din),
  .PortAWriteEnable(ram_wen[12]),
  .PortADataOut(ram12_dout));

ram #(8, MEM_ADDR_WIDTH-4) ram13(
  .PortAClk (ram_clk[13]),
  .PortAAddr(ram13_addr),
  .PortADataIn (ram13_din),
  .PortAWriteEnable(ram_wen[13]),
  .PortADataOut(ram13_dout));

ram #(8, MEM_ADDR_WIDTH-4) ram14(
  .PortAClk (ram_clk[14]),
  .PortAAddr(ram14_addr),
  .PortADataIn (ram14_din),
  .PortAWriteEnable(ram_wen[14]),
  .PortADataOut(ram14_dout));

ram #(8, MEM_ADDR_WIDTH-4) ram15(
  .PortAClk (ram_clk[15]),
  .PortAAddr(ram15_addr),
  .PortADataIn (ram15_din),
  .PortAWriteEnable(ram_wen[15]),
  .PortADataOut(ram15_dout));

/* }}} */




















































endmodule



