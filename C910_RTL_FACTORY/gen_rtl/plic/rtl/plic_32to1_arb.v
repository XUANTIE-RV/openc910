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
module plic_32to1_arb(
  //input
  arb_clk,
  plicrst_b,
  int_in_prio,
  int_in_req,
  int_select_round,
  ctrl_arb_new_arb_start,
  
  //output
  int_out_req,
  int_out_id,
  int_out_prio
);
parameter PRIO_BIT   = 5;
parameter ID_NUM     = 10;
parameter INT_NUM    = 1024;
parameter SEL_NUM    = 4;
parameter ECH_RD     = 32;

localparam ROUND_WIDTH= 5;
localparam ROUND      = INT_NUM/ECH_RD;

//localparam PRIO_BIG   = SEL_NUM*PRIO_BIT;
//localparam ID_BIG     = SEL_NUM*ID_NUM;

input                           arb_clk;
input                           plicrst_b;
input   [INT_NUM-1:0]           int_in_req;
input   [INT_NUM*PRIO_BIT-1:0]  int_in_prio;
input   [ROUND_WIDTH-1:0]       int_select_round;  
input                           ctrl_arb_new_arb_start;


output  [ID_NUM-1:0]            int_out_id;
output                          int_out_req;
output  [PRIO_BIT-1:0]           int_out_prio;



//wire definition
wire    [INT_NUM*ID_NUM-1:0]            int_in_id;

wire    [ECH_RD-1:0]         int_req_aft_round;
wire    [ECH_RD*ID_NUM-1:0]  int_id_aft_round;
wire    [ECH_RD*PRIO_BIT-1:0]int_prio_aft_round;


wire    [ECH_RD/4-1:0]          int_req_aft_frt_sel;
wire    [ECH_RD/4*ID_NUM-1:0]   int_id_aft_frt_sel;
wire    [ECH_RD/4*PRIO_BIT-1:0] int_prio_aft_frt_sel;

wire    [9-1:0]           int_req_secd_tmp_sel;
wire    [9*ID_NUM-1:0]    int_id_secd_tmp_sel;
wire    [9*PRIO_BIT-1:0]  int_prio_secd_tmp_sel;

wire    [ECH_RD/4-1:0]          round_int_req_fst_en;
wire                            round_int_req_secd_en;

wire                            int_req_aft_secd_sel;
wire    [ID_NUM-1:0]            int_id_aft_secd_sel;
wire    [PRIO_BIT-1:0]          int_prio_aft_secd_sel;

// reg definition
wire    [ROUND-1:0]              int_req_round_prepare[ECH_RD-1:0];    
wire    [ROUND*ID_NUM-1:0]       int_id_round_prepare[ECH_RD-1:0];
wire    [ROUND*PRIO_BIT-1:0]     int_prio_round_prepare[ECH_RD-1:0];

reg    [ECH_RD/4-1:0]          int_req_fst_stg;
reg    [ECH_RD/4*ID_NUM-1:0]   int_id_fst_stg;
reg    [ECH_RD/4*PRIO_BIT-1:0] int_prio_fst_stg;

reg                            int_req_secd_stg;
reg    [ID_NUM-1:0]            int_id_secd_stg;
reg    [PRIO_BIT-1:0]          int_prio_secd_stg;

//**********************************************************************
//  form the interrupt id
//
//**********************************************************************
generate
genvar i;
for(i=0;i<INT_NUM;i=i+1)
begin:ID_FORM
  assign int_in_id[i*ID_NUM+:ID_NUM] = $unsigned(i) & {ID_NUM{1'b1}};
end
endgenerate

//**********************************************************************
//  first.round preperation,and prio selection,  
//  32to1 selection and 4 prio selection
//
//**********************************************************************
genvar j;
genvar k;
generate
  for(j=0;j<ROUND;j=j+1)
  begin:ROUND_NUM
    for(k=0;k<ECH_RD;k=k+1)
    begin:PREPARE
assign    int_req_round_prepare[k][j]               =  int_in_req[ECH_RD*j+k];
assign    int_id_round_prepare[k][j*ID_NUM+:ID_NUM] =  
                                            int_in_id[(ECH_RD*j+k)*ID_NUM+:ID_NUM];
assign    int_prio_round_prepare[k][j*PRIO_BIT+:PRIO_BIT] =
                                      int_in_prio[(ECH_RD*j+k)*PRIO_BIT+:PRIO_BIT]; 
    end 
  end
endgenerate

generate 
genvar m;
for(m=0;m<INT_NUM/ROUND;m=m+1)
begin: ROUND_SEL
   nor_sel #(.SEL_BIT(5),
            .SEL_NUM(ROUND),
            .DATA(ID_NUM)  )  x_round_sel_id(
          .data_in(int_id_round_prepare[m]),
          .sel_in(int_select_round),
          .data_out(int_id_aft_round[m*ID_NUM+:ID_NUM])
          );
    nor_sel #(.SEL_BIT(5),
            .SEL_NUM(ROUND),
            .DATA(PRIO_BIT)  )  x_round_sel_prio(
          .data_in(int_prio_round_prepare[m]),
          .sel_in(int_select_round),
          .data_out(int_prio_aft_round[m*PRIO_BIT+:PRIO_BIT])
          );
     nor_sel #(.SEL_BIT(5),
            .SEL_NUM(ROUND),
            .DATA(1)  )  x_round_sel_req(
          .data_in(int_req_round_prepare[m]),
          .sel_in(int_select_round),
          .data_out(int_req_aft_round[m])
          );
end
endgenerate

//*************************************
//  first stage prio selection
//
//*************************************

generate
genvar n;
for(n=0;n<ECH_RD/SEL_NUM;n=n+1)
begin:FIRST_SEL
  //plic_granu_arb #(.SEL_NUM(SEL_NUM),
  //                    .ID_NUM(ID_NUM),
  //                    .PRIO_BIT(PRIO_BIT))first_prio_selection(
  plic_granu2_arb #( .ID_NUM(ID_NUM),
                        .PRIO_BIT(PRIO_BIT))x_first_prio_selection(
    .int_in_prio(int_prio_aft_round[n*SEL_NUM*PRIO_BIT+:SEL_NUM*PRIO_BIT]),
    .int_in_id(int_id_aft_round[n*SEL_NUM*ID_NUM+:SEL_NUM*ID_NUM]),
    .int_in_req(int_req_aft_round[n*SEL_NUM+:SEL_NUM]),
    
    .int_out_req(int_req_aft_frt_sel[n]),
    .int_out_id(int_id_aft_frt_sel[n*ID_NUM+:ID_NUM]),
    .int_out_prio(int_prio_aft_frt_sel[n*PRIO_BIT+:PRIO_BIT])
  );
end
endgenerate
//************************************
//  first stage int flop
//
//************************************

genvar fst_idx;
generate
for(fst_idx=0;fst_idx<ECH_RD/SEL_NUM;fst_idx=fst_idx+1)
begin:FIRST_SEL_FLOP
  always @(posedge arb_clk or negedge plicrst_b)
  begin
    if(!plicrst_b)
    begin
      int_id_fst_stg[fst_idx*ID_NUM+:ID_NUM]          <= {ID_NUM{1'b0}};
      int_prio_fst_stg[fst_idx*PRIO_BIT+:PRIO_BIT]    <= {PRIO_BIT{1'b0}};
    end
    else if(int_req_aft_frt_sel[fst_idx])
    begin
      int_id_fst_stg[fst_idx*ID_NUM+:ID_NUM]  <= int_id_aft_frt_sel[fst_idx*ID_NUM+:ID_NUM];
      int_prio_fst_stg[fst_idx*PRIO_BIT+:PRIO_BIT] <= 
                                int_prio_aft_frt_sel[fst_idx*PRIO_BIT+:PRIO_BIT];
    end
  end
  always @(posedge arb_clk or negedge plicrst_b)
  begin
    if(!plicrst_b)
      int_req_fst_stg[fst_idx]   <=1'b0;
    else if(round_int_req_fst_en[fst_idx])
      int_req_fst_stg[fst_idx]   <= int_req_aft_frt_sel[fst_idx];
  end
  assign round_int_req_fst_en[fst_idx] = int_req_fst_stg[fst_idx] 
                                     ^ int_req_aft_frt_sel[fst_idx];
end

endgenerate

//**********************************************************************
//  secod stage: 9 to 1 prio selction.  
//  
//**********************************************************************
plic_granu_arb #(.SEL_NUM(9),
                    .SEL_BIT(4),
                      .ID_NUM(ID_NUM),
                      .PRIO_BIT(PRIO_BIT))
                      x_secd_prio_selection10(
    .int_in_prio(int_prio_secd_tmp_sel[9*PRIO_BIT-1:0]),
    .int_in_id(int_id_secd_tmp_sel[9*ID_NUM-1:0]),
    .int_in_req(int_req_secd_tmp_sel[9-1:0]),
    
    .int_out_req(int_req_aft_secd_sel),
    .int_out_id(int_id_aft_secd_sel[ID_NUM-1:0]),
    .int_out_prio(int_prio_aft_secd_sel[PRIO_BIT-1:0])
  );
assign int_req_secd_tmp_sel[8:0] = {int_req_fst_stg[7:0],int_req_secd_stg};
assign int_prio_secd_tmp_sel[9*PRIO_BIT-1:0]  = {int_prio_fst_stg[8*PRIO_BIT-1:0],
                                                 int_prio_secd_stg[PRIO_BIT-1:0]};
assign int_id_secd_tmp_sel[9*ID_NUM-1:0]      = {int_id_fst_stg[8*ID_NUM-1:0],
                                                 int_id_secd_stg[ID_NUM-1:0]};  


always @(posedge arb_clk or negedge plicrst_b)
  begin
    if(!plicrst_b)
    begin
      int_id_secd_stg[ID_NUM-1:0]        <= {ID_NUM{1'b0}};
      int_prio_secd_stg[PRIO_BIT-1:0]    <= {PRIO_BIT{1'b0}};
    end
    else if(int_req_aft_secd_sel)
    begin
      int_id_secd_stg[ID_NUM-1:0]    <= int_id_aft_secd_sel[ID_NUM-1:0];
      int_prio_secd_stg[PRIO_BIT-1:0]  <= 
                                int_prio_aft_secd_sel[PRIO_BIT-1:0];
    end
end
always @(posedge arb_clk or negedge plicrst_b)
begin
  if(!plicrst_b)
    int_req_secd_stg   <=1'b0;
  else if(ctrl_arb_new_arb_start)
    int_req_secd_stg   <= 1'b0;
  else if(round_int_req_secd_en)
    int_req_secd_stg   <= int_req_aft_secd_sel;
end
assign round_int_req_secd_en = int_req_secd_stg 
                                   ^ int_req_aft_secd_sel;

assign int_out_req                 = int_req_secd_stg;
assign int_out_id[ID_NUM-1:0]      = int_id_secd_stg[ID_NUM-1:0];
assign int_out_prio[PRIO_BIT-1:0]  = int_prio_secd_stg[PRIO_BIT-1:0];

endmodule



module nor_sel(
  //input
  data_in,
  sel_in,
  //out
  data_out
);
parameter    SEL_BIT  = 5;
parameter    SEL_NUM  = 32;
parameter    DATA     = 10;

input   [SEL_NUM*DATA-1:0]        data_in;
input   [SEL_BIT-1:0]                 sel_in;

output  [DATA-1:0]                data_out;


//wire definition
wire [SEL_NUM-1:0]          sel_onehot;
wire [(SEL_NUM+1)*DATA-1:0] tmp_sel_out; 
//reg definition


assign tmp_sel_out[DATA-1:0]  = {DATA{1'b0}};
generate
genvar i;
for(i=0;i<SEL_NUM;i=i+1)
begin: SEL_OUT
  assign sel_onehot[i]                 = sel_in[SEL_BIT-1:0] == i;
  assign tmp_sel_out[(i+1)*DATA+:DATA] = ({DATA{sel_onehot[i]}} & data_in[DATA*i+:DATA])
                                        | tmp_sel_out[DATA*i+:DATA];
end
endgenerate
assign data_out[DATA-1:0]             = tmp_sel_out[DATA*SEL_NUM+:DATA];

endmodule
