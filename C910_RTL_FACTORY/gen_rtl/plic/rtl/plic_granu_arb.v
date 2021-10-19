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
module plic_granu_arb(
  //input
  int_in_prio,
  int_in_req, 
  int_in_id,

  //output
  int_out_req,
  int_out_id,
  int_out_prio

);
parameter    SEL_NUM        = 4;
parameter    SEL_BIT        = 2;
parameter    ID_NUM         = 10;
parameter    PRIO_BIT       = 5;
localparam   PRIO_NUM       = 1<<<PRIO_BIT;
localparam   INT_INFO       = ID_NUM + PRIO_BIT;

input   [SEL_NUM*PRIO_BIT-1:0]  int_in_prio;
input   [SEL_NUM-1:0]           int_in_req;
input   [SEL_NUM*ID_NUM-1:0]    int_in_id;

  //output
output                          int_out_req;
output  [ID_NUM-1:0]            int_out_id;
output  [PRIO_BIT-1:0]          int_out_prio;

// wire definition
wire    [PRIO_NUM-1:0]          int_valid_prio;
wire    [SEL_NUM-1:0]           high_prio_pos;
wire    [ID_NUM*SEL_NUM-1:0]    int_id_1d_bus;
wire    [PRIO_BIT-1:0]          high_prio;
wire    [SEL_NUM-1:0]           sel_pos_rever;
wire    [ID_NUM-1:0]            sel_out_id;

// reg definition
wire     [PRIO_NUM-1:0]          int_in_exp_prio[SEL_NUM-1:0];
wire     [SEL_NUM-1:0]           int_prio_pos_array[PRIO_NUM-1:0];
wire     [PRIO_NUM*SEL_NUM-1:0]  int_prio_pos_1d_bus;

wire    [SEL_BIT-1:0]           tmp_pos;
//**********************************************************************
//  first, get all the expand priority using 2-d array
//
//**********************************************************************
genvar i;
genvar j;
generate 
  for(i=0;i<SEL_NUM;i=i+1)
  begin: INT_EXP_I
    for(j=0;j<PRIO_NUM;j=j+1)
    begin:INT_EXP_J
assign        int_in_exp_prio[i][j] = int_in_req[i] && (int_in_prio[i*PRIO_BIT+:PRIO_BIT] == j);
    end
  end
endgenerate
//**********************************************************************
//  secod, reverse the expand priority array, ognized with priority
//
//**********************************************************************
generate 
  for(i=0;i<SEL_NUM;i=i+1)
  begin:REV_INT_I
    for(j=0;j<PRIO_NUM;j=j+1)
    begin:REV_INT_J
assign        int_prio_pos_array[j][i] = int_in_exp_prio[i][j];
    end
  end
endgenerate
generate 
  for(j=0;j<PRIO_NUM;j=j+1)
  begin:INT_PRI_1D
assign      int_prio_pos_1d_bus[j*SEL_NUM+:SEL_NUM] = int_prio_pos_array[j];
  end
endgenerate
//**********************************************************************
//  third, get the valid priority 
//  and select the highest priority position
//**********************************************************************
genvar k;
generate 
  for(k=0;k<PRIO_NUM;k=k+1)
  begin:VALID_PRIO
  assign int_valid_prio[k] = |int_prio_pos_array[k];
  end
endgenerate

prio_sel #(SEL_NUM,PRIO_NUM,PRIO_BIT) x_priority_select(
  .data_in(int_prio_pos_1d_bus),
  .sel_in(int_valid_prio),
  .data_out(high_prio_pos),
  .pos_out(high_prio)
);


//**********************************************************************
//  fourth, get the selected int information 
//  and select the highest priority position
//**********************************************************************
generate 
genvar m;
  for(m=0;m<SEL_NUM;m=m+1)
    begin:FLAT_INT_INFO
    assign int_id_1d_bus[(SEL_NUM-1-m)*ID_NUM+:ID_NUM] = int_in_id[m*ID_NUM+:ID_NUM];
    assign sel_pos_rever[SEL_NUM-1-m]                  = high_prio_pos[m];
    end
endgenerate

prio_sel #(ID_NUM,SEL_NUM,SEL_BIT) x_id_select(
  .data_in(int_id_1d_bus),
  .sel_in(sel_pos_rever),
  .data_out(sel_out_id),
  .pos_out(tmp_pos)
);

assign int_out_req                 = |int_in_req[SEL_NUM-1:0];
assign int_out_prio[PRIO_BIT-1:0]  = high_prio[PRIO_BIT-1:0];
assign int_out_id[ID_NUM-1:0]      = sel_out_id[ID_NUM-1:0];


endmodule

module prio_sel(
  //input
  data_in,
  sel_in,
  //out
  data_out,
  pos_out
);
parameter DATA    = 4;
parameter SEL     = 32;
parameter SEL_BIT = 5;

input   [DATA*SEL-1:0]  data_in;
input   [SEL-1:0]       sel_in;

output  [DATA-1:0]      data_out;
output  [SEL_BIT-1:0]   pos_out;

//wire definition

wire    [SEL-1:0]             tmp_sel; 
wire    [SEL:0]               tmp_sel2; 
wire    [SEL-1:0]             onehot_sel;
wire    [(SEL+1)*DATA-1:0]    tmp_out;
wire    [(SEL+1)*SEL_BIT-1:0] tmp_pos_out;
wire    [SEL:0]               sel_in_exp;

//**************************************
//  make the select to all ones
//  01100   -> 01111
//**************************************
assign sel_in_exp[SEL:0]  = {1'b0,sel_in[SEL-1:0]};
genvar k;
generate 
  for(k=0;k<SEL;k=k+1)
  begin:ALL_ONE_SEL
  assign tmp_sel[k] = |sel_in_exp[SEL:k];
  end
endgenerate
//**************************************
//  make the select to  one hot
//  01111   -> 01000
//**************************************

assign tmp_sel2[SEL:0] = {1'b0,tmp_sel[SEL-1:0]};
genvar m;
generate 
  for(m=0;m<SEL;m=m+1)
  begin:ONE_HOT_SEL
  assign onehot_sel[m] = tmp_sel[m] && !tmp_sel2[m+1];
  end
endgenerate
assign tmp_out[DATA-1:0] = {DATA{1'b0}};
assign tmp_pos_out[SEL_BIT-1:0] = {SEL_BIT{1'b0}};
genvar n;
generate 
  for(n=0;n<SEL;n=n+1)
  begin:OUT_SEL
  assign tmp_out[(n+1)*DATA+:DATA] = ({DATA{onehot_sel[n]}} & data_in[n*DATA+:DATA])
                                    | tmp_out[n*DATA+:DATA];
  assign tmp_pos_out[(n+1)*SEL_BIT+:SEL_BIT] = ({SEL_BIT{onehot_sel[n]}} & n)
                                                | tmp_pos_out[n*SEL_BIT+:SEL_BIT];  
  end
endgenerate

assign data_out[DATA-1:0]   = tmp_out[(SEL+1)*DATA-1:SEL*DATA];
assign pos_out[SEL_BIT-1:0] = tmp_pos_out[(SEL+1)*SEL_BIT-1:SEL*SEL_BIT];
endmodule


