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
module plic_granu2_arb(
  int_in_id,
  int_in_prio,
  int_in_req,
  int_out_id,
  int_out_prio,
  int_out_req
);
parameter ID_NUM    = 7;
parameter PRIO_BIT  = 6;
// &Ports; @28
input   [ID_NUM*4-1  :0]  int_in_id;      
input   [PRIO_BIT*4-1:0]  int_in_prio;    
input   [3 :0]            int_in_req;     
output  [ID_NUM-1 :0]       int_out_id;     
output  [PRIO_BIT-1 :0]     int_out_prio;   
output                    int_out_req;    

// &Regs; @29

// &Wires; @30
wire    [ID_NUM-1 :0]  int_01_id;      
wire            int_01_out;     
wire    [PRIO_BIT-1 :0]  int_01_prio;    
wire            int_01_sel_0;   
wire    [PRIO_BIT-1 :0]  int_0_req_prio; 
wire    [PRIO_BIT-1 :0]  int_1_req_prio; 
wire    [ID_NUM-1 :0]  int_23_id;      
wire            int_23_out;     
wire    [PRIO_BIT-1 :0]  int_23_prio;    
wire            int_23_sel_2;   
wire    [PRIO_BIT-1 :0]  int_2_req_prio; 
wire    [PRIO_BIT-1 :0]  int_3_req_prio; 
wire    [3 :0]  int_in_req;     
wire            int_lst_sel_01; 
wire    [ID_NUM-1 :0]  int_out_id;     
wire    [PRIO_BIT-1 :0]  int_out_prio;   
wire            int_out_req;    
wire    [PRIO_BIT-1 :0]  int_sel_01_prio; 
wire    [PRIO_BIT-1 :0]  int_sel_23_prio; 
wire    [ID_NUM-1:0]   int_0_id;
wire    [ID_NUM-1:0]   int_1_id;
wire    [ID_NUM-1:0]   int_2_id;
wire    [ID_NUM-1:0]   int_3_id;

assign int_0_req_prio[PRIO_BIT-1:0]  =  int_in_prio[PRIO_BIT-1:0];
assign int_1_req_prio[PRIO_BIT-1:0]  =  int_in_prio[2*PRIO_BIT-1:PRIO_BIT];
assign int_2_req_prio[PRIO_BIT-1:0]  =  int_in_prio[3*PRIO_BIT-1:2*PRIO_BIT];
assign int_3_req_prio[PRIO_BIT-1:0]  =  int_in_prio[4*PRIO_BIT-1:3*PRIO_BIT];
assign int_0_id[ID_NUM-1:0]          =  int_in_id[ID_NUM-1:0];
assign int_1_id[ID_NUM-1:0]          =  int_in_id[2*ID_NUM-1:ID_NUM];
assign int_2_id[ID_NUM-1:0]          =  int_in_id[3*ID_NUM-1:2*ID_NUM];
assign int_3_id[ID_NUM-1:0]          =  int_in_id[4*ID_NUM-1:3*ID_NUM];
assign int_01_sel_0         = ((int_in_req[0] && int_in_req[1]) 
				&& (int_0_req_prio[PRIO_BIT-1:0] >= int_1_req_prio[PRIO_BIT-1:0])) 
                            || (int_in_req[0] && !int_in_req[1]);
assign int_23_sel_2         = ((int_in_req[2] && int_in_req[3]) 
				&& (int_2_req_prio[PRIO_BIT-1:0] >= int_3_req_prio[PRIO_BIT-1:0]))
                            || (int_in_req[2] && !int_in_req[3]);

assign int_01_out           = int_in_req[0] || int_in_req[1];
assign int_01_prio[PRIO_BIT-1:0]     =  int_01_sel_0 ? int_0_req_prio[PRIO_BIT-1:0]
                                                     : int_1_req_prio[PRIO_BIT-1:0];
assign int_01_id[ID_NUM-1:0]       = int_01_sel_0 ? int_0_id[ID_NUM-1:0]
                                                   : int_1_id[ID_NUM-1:0];                   
assign int_23_out           = int_in_req[2] || int_in_req[3];
assign int_23_prio[PRIO_BIT-1:0]     = int_23_sel_2 ? int_2_req_prio[PRIO_BIT-1:0]
                                                    : int_3_req_prio[PRIO_BIT-1:0];
assign int_23_id[ID_NUM-1:0]       = int_23_sel_2 ? int_2_id[ID_NUM-1:0]
                                                  : int_3_id[ID_NUM-1:0]; 

assign int_sel_01_prio[PRIO_BIT-1:0]        = int_01_prio[PRIO_BIT-1:0]; 
assign int_sel_23_prio[PRIO_BIT-1:0]        = int_23_prio[PRIO_BIT-1:0];
assign int_lst_sel_01              = ((int_01_out && int_23_out) 
			             && (int_sel_01_prio[PRIO_BIT-1:0] >= int_sel_23_prio[PRIO_BIT-1:0]))
                                   ||(int_01_out && !int_23_out);

assign int_out_req             = int_01_out || int_23_out;
assign int_out_prio[PRIO_BIT-1:0]       = int_lst_sel_01 ? int_01_prio[PRIO_BIT-1:0]
                                                : int_23_prio[PRIO_BIT-1:0];
assign int_out_id[ID_NUM-1:0]         = int_lst_sel_01 ? int_01_id[ID_NUM-1:0]
                                                       : int_23_id[ID_NUM-1:0];                                               
// &ModuleEnd; @60
endmodule


