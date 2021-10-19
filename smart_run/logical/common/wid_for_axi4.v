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

module wid_for_axi4(
  biu_pad_awid,
  biu_pad_awvalid, 
  pad_biu_awready,
  biu_pad_wvalid,
  biu_pad_wlast,
  pad_biu_wready,
  pad_cpu_rst_b,
  biu_pad_wid,
  per_clk
);


input   [7:0]  biu_pad_awid;  
input          pad_cpu_rst_b; 
input          per_clk;       
input          biu_pad_awvalid;       
input          pad_biu_awready;       
input          biu_pad_wvalid;       
input          biu_pad_wlast;       
input          pad_biu_wready;       
output  [7:0]  biu_pad_wid;

reg     [4  :0]  wid_fifo_create;        
reg     [4  :0]  wid_fifo_pop;           
reg     [7  :0]  wid_m1_8;               
wire    [7  :0]  wid_0;                  
wire    [7  :0]  wid_1;                  
wire    [7  :0]  wid_10;                 
wire    [7  :0]  wid_11;                 
wire    [7  :0]  wid_12;                 
wire    [7  :0]  wid_13;                 
wire    [7  :0]  wid_14;                 
wire    [7  :0]  wid_15;                 
wire    [7  :0]  wid_16;                 
wire    [7  :0]  wid_17;                 
wire    [7  :0]  wid_18;                 
wire    [7  :0]  wid_19;                 
wire    [7  :0]  wid_2;                  
wire    [7  :0]  wid_20;                 
wire    [7  :0]  wid_21;                 
wire    [7  :0]  wid_22;                 
wire    [7  :0]  wid_23;                 
wire    [7  :0]  wid_24;                 
wire    [7  :0]  wid_25;                 
wire    [7  :0]  wid_26;                 
wire    [7  :0]  wid_27;                 
wire    [7  :0]  wid_28;                 
wire    [7  :0]  wid_29;                 
wire    [7  :0]  wid_3;                  
wire    [7  :0]  wid_30;                 
wire    [7  :0]  wid_31;                 
wire    [7  :0]  wid_4;                  
wire    [7  :0]  wid_5;                  
wire    [7  :0]  wid_6;                  
wire    [7  :0]  wid_7;                  
wire    [7  :0]  wid_8;                  
wire    [7  :0]  wid_9;                  
wire    [31 :0]  wid_entry_push;         

assign create_en = biu_pad_awvalid && pad_biu_awready;

always@(posedge per_clk or negedge pad_cpu_rst_b)
begin
  if (!pad_cpu_rst_b)
    wid_fifo_create[4:0] <= 5'b0;
  else if (create_en)
    wid_fifo_create[4:0] <= wid_fifo_create[4:0] + 5'b1;
end

assign wid_entry_push[31:0] = {32{create_en}} & (32'b1<<wid_fifo_create[4:0]);

always@(posedge per_clk or negedge pad_cpu_rst_b)
begin
  if (!pad_cpu_rst_b)
    wid_fifo_pop[4:0] <= 5'b0;
  else if (biu_pad_wvalid && biu_pad_wlast&& pad_biu_wready)
    wid_fifo_pop[4:0] <= wid_fifo_pop[4:0] + 5'b1;
end


always @( wid_17[7:0]
       or wid_27[7:0]
       or wid_25[7:0]
       or wid_15[7:0]
       or wid_11[7:0]
       or wid_12[7:0]
       or wid_8[7:0]
       or wid_14[7:0]
       or wid_2[7:0]
       or wid_16[7:0]
       or wid_31[7:0]
       or wid_9[7:0]
       or wid_4[7:0]
       or wid_20[7:0]
       or wid_22[7:0]
       or wid_28[7:0]
       or wid_5[7:0]
       or wid_29[7:0]
       or wid_7[7:0]
       or wid_3[7:0]
       or wid_10[7:0]
       or wid_1[7:0]
       or wid_24[7:0]
       or wid_19[7:0]
       or wid_13[7:0]
       or wid_0[7:0]
       or wid_23[7:0]
       or wid_6[7:0]
       or wid_21[7:0]
       or wid_26[7:0]
       or wid_18[7:0]
       or wid_30[7:0]
       or wid_fifo_pop[4:0])
begin
  wid_m1_8[7:0] = 5'b0;
  case(wid_fifo_pop[4:0])
  5'b00000: wid_m1_8[7:0] = wid_0[7:0];
  5'b00001: wid_m1_8[7:0] = wid_1[7:0];
  5'b00010: wid_m1_8[7:0] = wid_2[7:0];
  5'b00011: wid_m1_8[7:0] = wid_3[7:0];
  5'b00100: wid_m1_8[7:0] = wid_4[7:0];
  5'b00101: wid_m1_8[7:0] = wid_5[7:0];
  5'b00110: wid_m1_8[7:0] = wid_6[7:0];
  5'b00111: wid_m1_8[7:0] = wid_7[7:0];
  5'b01000: wid_m1_8[7:0] = wid_8[7:0];
  5'b01001: wid_m1_8[7:0] = wid_9[7:0];
  5'b01010: wid_m1_8[7:0] = wid_10[7:0];
  5'b01011: wid_m1_8[7:0] = wid_11[7:0];
  5'b01100: wid_m1_8[7:0] = wid_12[7:0];
  5'b01101: wid_m1_8[7:0] = wid_13[7:0];
  5'b01110: wid_m1_8[7:0] = wid_14[7:0];
  5'b01111: wid_m1_8[7:0] = wid_15[7:0];

  5'b10000: wid_m1_8[7:0] = wid_16[7:0];
  5'b10001: wid_m1_8[7:0] = wid_17[7:0];
  5'b10010: wid_m1_8[7:0] = wid_18[7:0];
  5'b10011: wid_m1_8[7:0] = wid_19[7:0];
  5'b10100: wid_m1_8[7:0] = wid_20[7:0];
  5'b10101: wid_m1_8[7:0] = wid_21[7:0];
  5'b10110: wid_m1_8[7:0] = wid_22[7:0];
  5'b10111: wid_m1_8[7:0] = wid_23[7:0];
  5'b11000: wid_m1_8[7:0] = wid_24[7:0];
  5'b11001: wid_m1_8[7:0] = wid_25[7:0];
  5'b11010: wid_m1_8[7:0] = wid_26[7:0];
  5'b11011: wid_m1_8[7:0] = wid_27[7:0];
  5'b11100: wid_m1_8[7:0] = wid_28[7:0];
  5'b11101: wid_m1_8[7:0] = wid_29[7:0];
  5'b11110: wid_m1_8[7:0] = wid_30[7:0];
  5'b11111: wid_m1_8[7:0] = wid_31[7:0];
  default:  wid_m1_8[7:0] = 8'b0;
  endcase

end


wid_entry  x_wid_entry_31 (
  .biu_pad_awid       (biu_pad_awid      ),
  .pad_cpu_rst_b      (pad_cpu_rst_b     ),
  .per_clk            (per_clk           ),
  .wid                (wid_31            ),
  .wid_entry_push     (wid_entry_push[31])
);

wid_entry  x_wid_entry_30 (
  .biu_pad_awid       (biu_pad_awid      ),
  .pad_cpu_rst_b      (pad_cpu_rst_b     ),
  .per_clk            (per_clk           ),
  .wid                (wid_30            ),
  .wid_entry_push     (wid_entry_push[30])
);

wid_entry  x_wid_entry_29 (
  .biu_pad_awid       (biu_pad_awid      ),
  .pad_cpu_rst_b      (pad_cpu_rst_b     ),
  .per_clk            (per_clk           ),
  .wid                (wid_29            ),
  .wid_entry_push     (wid_entry_push[29])
);

wid_entry  x_wid_entry_28 (
  .biu_pad_awid       (biu_pad_awid      ),
  .pad_cpu_rst_b      (pad_cpu_rst_b     ),
  .per_clk            (per_clk           ),
  .wid                (wid_28            ),
  .wid_entry_push     (wid_entry_push[28])
);

wid_entry  x_wid_entry_27 (
  .biu_pad_awid       (biu_pad_awid      ),
  .pad_cpu_rst_b      (pad_cpu_rst_b     ),
  .per_clk            (per_clk           ),
  .wid                (wid_27            ),
  .wid_entry_push     (wid_entry_push[27])
);

wid_entry  x_wid_entry_26 (
  .biu_pad_awid       (biu_pad_awid      ),
  .pad_cpu_rst_b      (pad_cpu_rst_b     ),
  .per_clk            (per_clk           ),
  .wid                (wid_26            ),
  .wid_entry_push     (wid_entry_push[26])
);

wid_entry  x_wid_entry_25 (
  .biu_pad_awid       (biu_pad_awid      ),
  .pad_cpu_rst_b      (pad_cpu_rst_b     ),
  .per_clk            (per_clk           ),
  .wid                (wid_25            ),
  .wid_entry_push     (wid_entry_push[25])
);

wid_entry  x_wid_entry_24 (
  .biu_pad_awid       (biu_pad_awid      ),
  .pad_cpu_rst_b      (pad_cpu_rst_b     ),
  .per_clk            (per_clk           ),
  .wid                (wid_24            ),
  .wid_entry_push     (wid_entry_push[24])
);

wid_entry  x_wid_entry_23 (
  .biu_pad_awid       (biu_pad_awid      ),
  .pad_cpu_rst_b      (pad_cpu_rst_b     ),
  .per_clk            (per_clk           ),
  .wid                (wid_23            ),
  .wid_entry_push     (wid_entry_push[23])
);

wid_entry  x_wid_entry_22 (
  .biu_pad_awid       (biu_pad_awid      ),
  .pad_cpu_rst_b      (pad_cpu_rst_b     ),
  .per_clk            (per_clk           ),
  .wid                (wid_22            ),
  .wid_entry_push     (wid_entry_push[22])
);

wid_entry  x_wid_entry_21 (
  .biu_pad_awid       (biu_pad_awid      ),
  .pad_cpu_rst_b      (pad_cpu_rst_b     ),
  .per_clk            (per_clk           ),
  .wid                (wid_21            ),
  .wid_entry_push     (wid_entry_push[21])
);

wid_entry  x_wid_entry_20 (
  .biu_pad_awid       (biu_pad_awid      ),
  .pad_cpu_rst_b      (pad_cpu_rst_b     ),
  .per_clk            (per_clk           ),
  .wid                (wid_20            ),
  .wid_entry_push     (wid_entry_push[20])
);

wid_entry  x_wid_entry_19 (
  .biu_pad_awid       (biu_pad_awid      ),
  .pad_cpu_rst_b      (pad_cpu_rst_b     ),
  .per_clk            (per_clk           ),
  .wid                (wid_19            ),
  .wid_entry_push     (wid_entry_push[19])
);

wid_entry  x_wid_entry_18 (
  .biu_pad_awid       (biu_pad_awid      ),
  .pad_cpu_rst_b      (pad_cpu_rst_b     ),
  .per_clk            (per_clk           ),
  .wid                (wid_18            ),
  .wid_entry_push     (wid_entry_push[18])
);

wid_entry  x_wid_entry_17 (
  .biu_pad_awid       (biu_pad_awid      ),
  .pad_cpu_rst_b      (pad_cpu_rst_b     ),
  .per_clk            (per_clk           ),
  .wid                (wid_17            ),
  .wid_entry_push     (wid_entry_push[17])
);

wid_entry  x_wid_entry_16 (
  .biu_pad_awid       (biu_pad_awid      ),
  .pad_cpu_rst_b      (pad_cpu_rst_b     ),
  .per_clk            (per_clk           ),
  .wid                (wid_16            ),
  .wid_entry_push     (wid_entry_push[16])
);

wid_entry  x_wid_entry_15 (
  .biu_pad_awid       (biu_pad_awid      ),
  .pad_cpu_rst_b      (pad_cpu_rst_b     ),
  .per_clk            (per_clk           ),
  .wid                (wid_15            ),
  .wid_entry_push     (wid_entry_push[15])
);

wid_entry  x_wid_entry_14 (
  .biu_pad_awid       (biu_pad_awid      ),
  .pad_cpu_rst_b      (pad_cpu_rst_b     ),
  .per_clk            (per_clk           ),
  .wid                (wid_14            ),
  .wid_entry_push     (wid_entry_push[14])
);

wid_entry  x_wid_entry_13 (
  .biu_pad_awid       (biu_pad_awid      ),
  .pad_cpu_rst_b      (pad_cpu_rst_b     ),
  .per_clk            (per_clk           ),
  .wid                (wid_13            ),
  .wid_entry_push     (wid_entry_push[13])
);

wid_entry  x_wid_entry_12 (
  .biu_pad_awid       (biu_pad_awid      ),
  .pad_cpu_rst_b      (pad_cpu_rst_b     ),
  .per_clk            (per_clk           ),
  .wid                (wid_12            ),
  .wid_entry_push     (wid_entry_push[12])
);

wid_entry  x_wid_entry_11 (
  .biu_pad_awid       (biu_pad_awid      ),
  .pad_cpu_rst_b      (pad_cpu_rst_b     ),
  .per_clk            (per_clk           ),
  .wid                (wid_11            ),
  .wid_entry_push     (wid_entry_push[11])
);

wid_entry  x_wid_entry_10 (
  .biu_pad_awid       (biu_pad_awid      ),
  .pad_cpu_rst_b      (pad_cpu_rst_b     ),
  .per_clk            (per_clk           ),
  .wid                (wid_10            ),
  .wid_entry_push     (wid_entry_push[10])
);

wid_entry  x_wid_entry_9 (
  .biu_pad_awid      (biu_pad_awid     ),
  .pad_cpu_rst_b     (pad_cpu_rst_b    ),
  .per_clk           (per_clk          ),
  .wid               (wid_9            ),
  .wid_entry_push    (wid_entry_push[9])
);

wid_entry  x_wid_entry_8 (
  .biu_pad_awid      (biu_pad_awid     ),
  .pad_cpu_rst_b     (pad_cpu_rst_b    ),
  .per_clk           (per_clk          ),
  .wid               (wid_8            ),
  .wid_entry_push    (wid_entry_push[8])
);

wid_entry  x_wid_entry_7 (
  .biu_pad_awid      (biu_pad_awid     ),
  .pad_cpu_rst_b     (pad_cpu_rst_b    ),
  .per_clk           (per_clk          ),
  .wid               (wid_7            ),
  .wid_entry_push    (wid_entry_push[7])
);

wid_entry  x_wid_entry_6 (
  .biu_pad_awid      (biu_pad_awid     ),
  .pad_cpu_rst_b     (pad_cpu_rst_b    ),
  .per_clk           (per_clk          ),
  .wid               (wid_6            ),
  .wid_entry_push    (wid_entry_push[6])
);

wid_entry  x_wid_entry_5 (
  .biu_pad_awid      (biu_pad_awid     ),
  .pad_cpu_rst_b     (pad_cpu_rst_b    ),
  .per_clk           (per_clk          ),
  .wid               (wid_5            ),
  .wid_entry_push    (wid_entry_push[5])
);

wid_entry  x_wid_entry_4 (
  .biu_pad_awid      (biu_pad_awid     ),
  .pad_cpu_rst_b     (pad_cpu_rst_b    ),
  .per_clk           (per_clk          ),
  .wid               (wid_4            ),
  .wid_entry_push    (wid_entry_push[4])
);

wid_entry  x_wid_entry_3 (
  .biu_pad_awid      (biu_pad_awid     ),
  .pad_cpu_rst_b     (pad_cpu_rst_b    ),
  .per_clk           (per_clk          ),
  .wid               (wid_3            ),
  .wid_entry_push    (wid_entry_push[3])
);

wid_entry  x_wid_entry_2 (
  .biu_pad_awid      (biu_pad_awid     ),
  .pad_cpu_rst_b     (pad_cpu_rst_b    ),
  .per_clk           (per_clk          ),
  .wid               (wid_2            ),
  .wid_entry_push    (wid_entry_push[2])
);


wid_entry  x_wid_entry_1 (
  .biu_pad_awid      (biu_pad_awid     ),
  .pad_cpu_rst_b     (pad_cpu_rst_b    ),
  .per_clk           (per_clk          ),
  .wid               (wid_1            ),
  .wid_entry_push    (wid_entry_push[1])
);

wid_entry  x_wid_entry_0 (
  .biu_pad_awid      (biu_pad_awid     ),
  .pad_cpu_rst_b     (pad_cpu_rst_b    ),
  .per_clk           (per_clk          ),
  .wid               (wid_0            ),
  .wid_entry_push    (wid_entry_push[0])
);

assign biu_pad_wid[7:0] = wid_m1_8[7:0];


endmodule



