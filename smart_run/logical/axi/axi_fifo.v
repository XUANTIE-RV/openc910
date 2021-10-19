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




















module axi_fifo(
  biu_pad_araddr,
  biu_pad_arburst,
  biu_pad_arcache,
  biu_pad_arid,
  biu_pad_arlen,
  biu_pad_arlock,
  biu_pad_arprot,
  biu_pad_arsize,
  biu_pad_arvalid,
  counter_num0,
  counter_num1,
  counter_num2,
  counter_num3,
  counter_num4,
  counter_num5,
  counter_num6,
  counter_num7,
  cpu_clk,
  cpu_rst_b,
  fifo_biu_arready,
  fifo_pad_araddr,
  fifo_pad_arburst,
  fifo_pad_arcache,
  fifo_pad_arid,
  fifo_pad_arlen,
  fifo_pad_arlock,
  fifo_pad_arprot,
  fifo_pad_arsize,
  fifo_pad_artrust,
  fifo_pad_arvalid,
  pad_biu_arready
);


input   [39:0]  biu_pad_araddr;  
input   [1 :0]  biu_pad_arburst; 
input   [3 :0]  biu_pad_arcache; 
input   [7 :0]  biu_pad_arid;    
input   [7 :0]  biu_pad_arlen;   
input           biu_pad_arlock;  
input   [2 :0]  biu_pad_arprot;  
input   [2 :0]  biu_pad_arsize;  
input           biu_pad_arvalid; 
input   [31:0]  counter_num0;    
input   [31:0]  counter_num1;    
input   [31:0]  counter_num2;    
input   [31:0]  counter_num3;    
input   [31:0]  counter_num4;    
input   [31:0]  counter_num5;    
input   [31:0]  counter_num6;    
input   [31:0]  counter_num7;    
input           cpu_clk;         
input           cpu_rst_b;       
input           pad_biu_arready; 
output          fifo_biu_arready; 
output  [39:0]  fifo_pad_araddr; 
output  [1 :0]  fifo_pad_arburst; 
output  [3 :0]  fifo_pad_arcache; 
output  [7 :0]  fifo_pad_arid;   
output  [7 :0]  fifo_pad_arlen;  
output          fifo_pad_arlock; 
output  [2 :0]  fifo_pad_arprot; 
output  [2 :0]  fifo_pad_arsize; 
output          fifo_pad_artrust; 
output          fifo_pad_arvalid; 


reg     [7 :0]  create_ptr;      
reg     [7 :0]  entry_vld;       
reg     [7 :0]  pop_ptr;         


wire            araddr_hit;      
wire    [39:0]  biu_pad_araddr;  
wire    [1 :0]  biu_pad_arburst; 
wire    [3 :0]  biu_pad_arcache; 
wire    [7 :0]  biu_pad_arid;    
wire    [7 :0]  biu_pad_arlen;   
wire            biu_pad_arlock;  
wire    [2 :0]  biu_pad_arprot;  
wire    [2 :0]  biu_pad_arsize;  
wire            biu_pad_arvalid; 
wire    [7 :0]  counter_done;    
wire    [7 :0]  counter_en;      
wire    [31:0]  counter_num0;    
wire    [31:0]  counter_num1;    
wire    [31:0]  counter_num2;    
wire    [31:0]  counter_num3;    
wire    [31:0]  counter_num4;    
wire    [31:0]  counter_num5;    
wire    [31:0]  counter_num6;    
wire    [31:0]  counter_num7;    
wire            cpu_clk;         
wire            cpu_rst_b;       
wire    [7 :0]  create;          
wire            create_en;       
wire            create_vld;      
wire            fifo_biu_arready; 
wire    [39:0]  fifo_pad_araddr; 
wire    [1 :0]  fifo_pad_arburst; 
wire    [3 :0]  fifo_pad_arcache; 
wire    [7 :0]  fifo_pad_arid;   
wire    [7 :0]  fifo_pad_arlen;  
wire            fifo_pad_arlock; 
wire    [2 :0]  fifo_pad_arprot; 
wire    [2 :0]  fifo_pad_arsize; 
wire            fifo_pad_artrust; 
wire            fifo_pad_arvalid; 
wire    [70:0]  input_data;      
wire    [70:0]  output_data;     
wire    [70:0]  output_data0;    
wire    [70:0]  output_data1;    
wire    [70:0]  output_data2;    
wire    [70:0]  output_data3;    
wire    [70:0]  output_data4;    
wire    [70:0]  output_data5;    
wire    [70:0]  output_data6;    
wire    [70:0]  output_data7;    
wire            pad_biu_arready; 
wire            pop_en;          
wire            pop_req;         

parameter ENTRY_NUM = 8;

parameter NUM = 3;

parameter SRAM_START = 40'h00000000;
parameter SRAM_END   = 40'h0001ffff;





assign create_en = biu_pad_arvalid && !(|(create_ptr[ENTRY_NUM-1:0] & entry_vld[ENTRY_NUM-1:0]));

always @(posedge cpu_clk or negedge cpu_rst_b)
begin
  if (!cpu_rst_b)
    create_ptr[ENTRY_NUM-1:0]  <= {{(ENTRY_NUM-1){1'b0}},1'b1};
  else if (create_en)
    create_ptr[ENTRY_NUM-1:0] <= {create_ptr[ENTRY_NUM-2:0],create_ptr[ENTRY_NUM-1]};
  else 
    create_ptr[ENTRY_NUM-1:0] <= create_ptr[ENTRY_NUM-1:0] ;
end





always @(posedge cpu_clk or negedge cpu_rst_b)
begin
  if (!cpu_rst_b) 
      entry_vld[ENTRY_NUM-1:0] <= {ENTRY_NUM{1'b0}};
  else 
  begin   
    if (create_en && pop_en) 
      entry_vld[ENTRY_NUM-1:0] <= (entry_vld[ENTRY_NUM-1:0] | create_ptr[ENTRY_NUM-1:0]) & (~pop_ptr[ENTRY_NUM-1:0]);
    else if (create_en) 
      entry_vld[ENTRY_NUM-1:0] <= entry_vld[ENTRY_NUM-1:0] | create_ptr[ENTRY_NUM-1:0];
    else if (pop_en)
      entry_vld[ENTRY_NUM-1:0] <= entry_vld[ENTRY_NUM-1:0] & (~pop_ptr[ENTRY_NUM-1:0]);
    else
      entry_vld[ENTRY_NUM-1:0] <= entry_vld[ENTRY_NUM-1:0];
  end
end




assign araddr_hit = (biu_pad_araddr[39:0] >=SRAM_START) && (biu_pad_araddr[39:0] <=SRAM_END) 
                 &&  biu_pad_arcache[2];

assign create_vld = create_en && araddr_hit;
assign counter_en[ENTRY_NUM-1:0] = {ENTRY_NUM{create_vld}} & create_ptr[ENTRY_NUM-1:0]; 


fifo_counter  x_counter_entry0 (
  .counter_done    (counter_done[0]),
  .counter_en      (counter_en[0]  ),
  .counter_load    (counter_num0   ),
  .cpu_clk         (cpu_clk        ),
  .cpu_rst_b       (cpu_rst_b      )
);







fifo_counter  x_counter_entry1 (
  .counter_done    (counter_done[1]),
  .counter_en      (counter_en[1]  ),
  .counter_load    (counter_num1   ),
  .cpu_clk         (cpu_clk        ),
  .cpu_rst_b       (cpu_rst_b      )
);







fifo_counter  x_counter_entry2 (
  .counter_done    (counter_done[2]),
  .counter_en      (counter_en[2]  ),
  .counter_load    (counter_num2   ),
  .cpu_clk         (cpu_clk        ),
  .cpu_rst_b       (cpu_rst_b      )
);







fifo_counter  x_counter_entry3 (
  .counter_done    (counter_done[3]),
  .counter_en      (counter_en[3]  ),
  .counter_load    (counter_num3   ),
  .cpu_clk         (cpu_clk        ),
  .cpu_rst_b       (cpu_rst_b      )
);







fifo_counter  x_counter_entry4 (
  .counter_done    (counter_done[4]),
  .counter_en      (counter_en[4]  ),
  .counter_load    (counter_num4   ),
  .cpu_clk         (cpu_clk        ),
  .cpu_rst_b       (cpu_rst_b      )
);







fifo_counter  x_counter_entry5 (
  .counter_done    (counter_done[5]),
  .counter_en      (counter_en[5]  ),
  .counter_load    (counter_num5   ),
  .cpu_clk         (cpu_clk        ),
  .cpu_rst_b       (cpu_rst_b      )
);







fifo_counter  x_counter_entry6 (
  .counter_done    (counter_done[6]),
  .counter_en      (counter_en[6]  ),
  .counter_load    (counter_num6   ),
  .cpu_clk         (cpu_clk        ),
  .cpu_rst_b       (cpu_rst_b      )
);







fifo_counter  x_counter_entry7 (
  .counter_done    (counter_done[7]),
  .counter_en      (counter_en[7]  ),
  .counter_load    (counter_num7   ),
  .cpu_clk         (cpu_clk        ),
  .cpu_rst_b       (cpu_rst_b      )
);










assign pop_req = |(pop_ptr[ENTRY_NUM-1:0] & counter_done[ENTRY_NUM-1:0] & entry_vld[ENTRY_NUM-1:0]);
assign pop_en  = pop_req && pad_biu_arready; 

always @(posedge cpu_clk or negedge cpu_rst_b)
begin
  if (!cpu_rst_b)
    pop_ptr[ENTRY_NUM-1:0] <=  {{(ENTRY_NUM-1){1'b0}},1'b1};
  else if (pop_en)
    pop_ptr[ENTRY_NUM-1:0] <= {pop_ptr[ENTRY_NUM-2:0], pop_ptr[ENTRY_NUM-1]};
  else
    pop_ptr[ENTRY_NUM-1:0] <=  pop_ptr[ENTRY_NUM-1:0];
end




assign input_data[70:0] = { biu_pad_arlen[7:4],biu_pad_araddr[39:0],biu_pad_arburst[1:0],biu_pad_arcache[3:0],
                            biu_pad_arid[7:0],biu_pad_arlen[3:0],1'b0,biu_pad_arlock,biu_pad_arprot[2:0],
                            biu_pad_arsize[2:0],1'b0};


assign create[ENTRY_NUM-1:0] = {ENTRY_NUM{create_en}} & create_ptr[ENTRY_NUM-1:0];


axi_fifo_entry  x_axi_fifo_entry0 (
  .create_en    (create[0]   ),
  .data_in      (input_data  ),
  .data_out     (output_data0),
  .entry_clk    (cpu_clk     ),
  .entry_rst_b  (cpu_rst_b   )
);









axi_fifo_entry  x_axi_fifo_entry1 (
  .create_en    (create[1]   ),
  .data_in      (input_data  ),
  .data_out     (output_data1),
  .entry_clk    (cpu_clk     ),
  .entry_rst_b  (cpu_rst_b   )
);









axi_fifo_entry  x_axi_fifo_entry2 (
  .create_en    (create[2]   ),
  .data_in      (input_data  ),
  .data_out     (output_data2),
  .entry_clk    (cpu_clk     ),
  .entry_rst_b  (cpu_rst_b   )
);









axi_fifo_entry  x_axi_fifo_entry3 (
  .create_en    (create[3]   ),
  .data_in      (input_data  ),
  .data_out     (output_data3),
  .entry_clk    (cpu_clk     ),
  .entry_rst_b  (cpu_rst_b   )
);









axi_fifo_entry  x_axi_fifo_entry4 (
  .create_en    (create[4]   ),
  .data_in      (input_data  ),
  .data_out     (output_data4),
  .entry_clk    (cpu_clk     ),
  .entry_rst_b  (cpu_rst_b   )
);









axi_fifo_entry  x_axi_fifo_entry5 (
  .create_en    (create[5]   ),
  .data_in      (input_data  ),
  .data_out     (output_data5),
  .entry_clk    (cpu_clk     ),
  .entry_rst_b  (cpu_rst_b   )
);









axi_fifo_entry  x_axi_fifo_entry6 (
  .create_en    (create[6]   ),
  .data_in      (input_data  ),
  .data_out     (output_data6),
  .entry_clk    (cpu_clk     ),
  .entry_rst_b  (cpu_rst_b   )
);









axi_fifo_entry  x_axi_fifo_entry7 (
  .create_en    (create[7]   ),
  .data_in      (input_data  ),
  .data_out     (output_data7),
  .entry_clk    (cpu_clk     ),
  .entry_rst_b  (cpu_rst_b   )
);








assign output_data[70:0] = {71{pop_ptr[0]}} & output_data0[70:0]
                         | {71{pop_ptr[1]}} & output_data1[70:0]
                         | {71{pop_ptr[2]}} & output_data2[70:0]
                         | {71{pop_ptr[3]}} & output_data3[70:0]
                         | {71{pop_ptr[4]}} & output_data4[70:0]
                         | {71{pop_ptr[5]}} & output_data5[70:0]
                         | {71{pop_ptr[6]}} & output_data6[70:0]
                         | {71{pop_ptr[7]}} & output_data7[70:0];













assign fifo_pad_artrust      = output_data[0];
assign fifo_pad_arsize[2:0]  = output_data[3:1];
assign fifo_pad_arprot[2:0]  = output_data[6:4];
assign fifo_pad_arlock       = output_data[7]; 
assign fifo_pad_arlen[7:0]   = {output_data[70:67],output_data[12:9]}; 
assign fifo_pad_arid[7:0]    = output_data[20:13]; 
assign fifo_pad_arcache[3:0] = output_data[24:21]; 
assign fifo_pad_arburst[1:0] = output_data[26:25]; 
assign fifo_pad_araddr[39:0] = output_data[66:27]; 

assign fifo_pad_arvalid =  pop_req ;
assign fifo_biu_arready =  create_en;



endmodule


