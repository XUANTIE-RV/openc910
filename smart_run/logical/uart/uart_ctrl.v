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






















module uart_ctrl(
  ctrl_baud_gen_divisor,
  ctrl_baud_gen_set_dllh_vld,
  ctrl_receive_data_length,
  ctrl_receive_parity_bit,
  ctrl_receive_parity_en,
  ctrl_receive_stop_length,
  ctrl_reg_busy,
  ctrl_reg_fe,
  ctrl_reg_iid,
  ctrl_reg_iid_vld,
  ctrl_reg_oe,
  ctrl_reg_pe,
  ctrl_reg_rbr_wdata,
  ctrl_reg_rbr_write_en,
  ctrl_reg_thr_read,
  ctrl_reg_thsr_empty,
  ctrl_trans_data_length,
  ctrl_trans_parity_bit,
  ctrl_trans_parity_en,
  ctrl_trans_shift_data,
  ctrl_trans_stop_length,
  ctrl_trans_thr_vld,
  receive_ctrl_busy,
  receive_ctrl_fe,
  receive_ctrl_pe,
  receive_ctrl_rdata,
  receive_ctrl_redata_over,
  reg_ctrl_dllh_data,
  reg_ctrl_ier_enable,
  reg_ctrl_lcr_dls,
  reg_ctrl_lcr_eps,
  reg_ctrl_lcr_pen,
  reg_ctrl_lcr_stop,
  reg_ctrl_lcr_wen,
  reg_ctrl_rbr_vld,
  reg_ctrl_set_dllh_vld,
  reg_ctrl_thr_data,
  reg_ctrl_thr_vld,
  reg_ctrl_threint_en,
  rst_b,
  sys_clk,
  trans_ctrl_busy,
  trans_ctrl_thr_read,
  trans_ctrl_thsr_empty
);


input           receive_ctrl_busy;         
input           receive_ctrl_fe;           
input           receive_ctrl_pe;           
input   [7 :0]  receive_ctrl_rdata;        
input           receive_ctrl_redata_over;  
input   [15:0]  reg_ctrl_dllh_data;        
input   [2 :0]  reg_ctrl_ier_enable;       
input   [1 :0]  reg_ctrl_lcr_dls;          
input           reg_ctrl_lcr_eps;          
input           reg_ctrl_lcr_pen;          
input           reg_ctrl_lcr_stop;         
input           reg_ctrl_lcr_wen;          
input           reg_ctrl_rbr_vld;          
input           reg_ctrl_set_dllh_vld;     
input   [7 :0]  reg_ctrl_thr_data;         
input           reg_ctrl_thr_vld;          
input           reg_ctrl_threint_en;       
input           rst_b;                     
input           sys_clk;                   
input           trans_ctrl_busy;           
input           trans_ctrl_thr_read;       
input           trans_ctrl_thsr_empty;     
output  [15:0]  ctrl_baud_gen_divisor;     
output          ctrl_baud_gen_set_dllh_vld; 
output  [1 :0]  ctrl_receive_data_length;  
output          ctrl_receive_parity_bit;   
output          ctrl_receive_parity_en;    
output          ctrl_receive_stop_length;  
output          ctrl_reg_busy;             
output          ctrl_reg_fe;               
output  [3 :0]  ctrl_reg_iid;              
output          ctrl_reg_iid_vld;          
output          ctrl_reg_oe;               
output          ctrl_reg_pe;               
output  [7 :0]  ctrl_reg_rbr_wdata;        
output          ctrl_reg_rbr_write_en;     
output          ctrl_reg_thr_read;         
output          ctrl_reg_thsr_empty;       
output  [1 :0]  ctrl_trans_data_length;    
output          ctrl_trans_parity_bit;     
output          ctrl_trans_parity_en;      
output  [7 :0]  ctrl_trans_shift_data;     
output          ctrl_trans_stop_length;    
output          ctrl_trans_thr_vld;        


reg             ctrl_rbr_write_en_sample;  
reg     [3 :0]  ctrl_reg_iid;              
reg     [7 :0]  ctrl_reg_rbr_wdata;        
reg             receive_ctrl_fe_sample;    
reg             receive_ctrl_pe_sample;    
reg             thr_read_sample;           


wire    [15:0]  ctrl_baud_gen_divisor;     
wire            ctrl_baud_gen_set_dllh_vld; 
wire    [1 :0]  ctrl_receive_data_length;  
wire            ctrl_receive_parity_bit;   
wire            ctrl_receive_parity_en;    
wire            ctrl_receive_stop_length;  
wire            ctrl_reg_busy;             
wire            ctrl_reg_fe;               
wire            ctrl_reg_iid_vld;          
wire            ctrl_reg_oe;               
wire            ctrl_reg_pe;               
wire            ctrl_reg_rbr_write_en;     
wire            ctrl_reg_thr_read;         
wire            ctrl_reg_thsr_empty;       
wire    [1 :0]  ctrl_trans_data_length;    
wire            ctrl_trans_parity_bit;     
wire            ctrl_trans_parity_en;      
wire    [7 :0]  ctrl_trans_shift_data;     
wire            ctrl_trans_stop_length;    
wire            ctrl_trans_thr_vld;        
wire            high_pri;                  
wire            int_vld;                   
wire            line_status_int;           
wire            receive_ctrl_busy;         
wire            receive_ctrl_fe;           
wire            receive_ctrl_pe;           
wire    [7 :0]  receive_ctrl_rdata;        
wire            receive_ctrl_redata_over;  
wire            receive_data_int;          
wire    [15:0]  reg_ctrl_dllh_data;        
wire    [2 :0]  reg_ctrl_ier_enable;       
wire    [1 :0]  reg_ctrl_lcr_dls;          
wire            reg_ctrl_lcr_eps;          
wire            reg_ctrl_lcr_pen;          
wire            reg_ctrl_lcr_stop;         
wire            reg_ctrl_lcr_wen;          
wire            reg_ctrl_rbr_vld;          
wire            reg_ctrl_set_dllh_vld;     
wire    [7 :0]  reg_ctrl_thr_data;         
wire            reg_ctrl_thr_vld;          
wire            reg_ctrl_threint_en;       
wire            rst_b;                     
wire            sys_clk;                   
wire            thre_int_init;             
wire            trans_ctrl_busy;           
wire            trans_ctrl_thr_read;       
wire            trans_ctrl_thsr_empty;     
wire            trans_hold_empty_int;      
wire            uart_busy_int;             





assign ctrl_trans_thr_vld          = reg_ctrl_thr_vld;
assign ctrl_trans_shift_data[7:0]  = reg_ctrl_thr_data[7:0];
assign ctrl_trans_data_length[1:0] = reg_ctrl_lcr_dls[1:0];
assign ctrl_trans_stop_length = reg_ctrl_lcr_stop;
assign ctrl_trans_parity_en   = reg_ctrl_lcr_pen;
assign ctrl_trans_parity_bit  = reg_ctrl_lcr_eps;



assign ctrl_receive_data_length[1:0]  = reg_ctrl_lcr_dls[1:0];
assign ctrl_receive_stop_length       = reg_ctrl_lcr_stop;
assign ctrl_receive_parity_en         = reg_ctrl_lcr_pen;
assign ctrl_receive_parity_bit        = reg_ctrl_lcr_eps;






always @(posedge sys_clk or negedge rst_b )
begin
  if(!rst_b)
    thr_read_sample <= 1'b0;
  else
    thr_read_sample <= !trans_ctrl_thr_read;
end

assign ctrl_reg_thr_read   = trans_ctrl_thr_read && thr_read_sample;
assign ctrl_reg_thsr_empty = trans_ctrl_thsr_empty;


always @(posedge sys_clk or negedge rst_b )
begin
  if(!rst_b)
    ctrl_rbr_write_en_sample <= 1'b0;
  else 
    ctrl_rbr_write_en_sample <= !receive_ctrl_redata_over;
end

assign ctrl_reg_rbr_write_en = ctrl_rbr_write_en_sample && receive_ctrl_redata_over;



always @( reg_ctrl_lcr_dls[1:0]
       or receive_ctrl_rdata[7:0])
begin
case(reg_ctrl_lcr_dls[1:0])
  2'b00:  ctrl_reg_rbr_wdata[7:0] = {3'b0,receive_ctrl_rdata[7:3]};
  2'b01:  ctrl_reg_rbr_wdata[7:0] = {2'b0,receive_ctrl_rdata[7:2]};
  2'b10:  ctrl_reg_rbr_wdata[7:0] = {1'b0,receive_ctrl_rdata[7:1]};
  2'b11:  ctrl_reg_rbr_wdata[7:0] = receive_ctrl_rdata[7:0];
  default:ctrl_reg_rbr_wdata[7:0] = 8'b0;
endcase

end


assign ctrl_reg_busy = trans_ctrl_busy || receive_ctrl_busy;
assign uart_busy_int = ctrl_reg_busy && reg_ctrl_lcr_wen;



always @(posedge sys_clk or negedge rst_b )
begin
  if(!rst_b)
    receive_ctrl_fe_sample <= 1'b0;
  else 
  receive_ctrl_fe_sample <= !receive_ctrl_fe;
end

assign ctrl_reg_fe   = receive_ctrl_fe_sample && receive_ctrl_fe;


always @(posedge sys_clk or negedge rst_b )
begin
  if(!rst_b)
    receive_ctrl_pe_sample <= 1'b0;
  else 
    receive_ctrl_pe_sample <= !receive_ctrl_pe;
end

assign ctrl_reg_pe   = receive_ctrl_pe_sample && receive_ctrl_pe;


assign ctrl_reg_oe   = reg_ctrl_rbr_vld && ctrl_reg_rbr_write_en;










assign int_vld =    high_pri 
                 || receive_data_int
                 || trans_hold_empty_int
                 || uart_busy_int ; 

assign ctrl_reg_iid_vld = int_vld;


assign high_pri         = ctrl_reg_pe || ctrl_reg_fe || ctrl_reg_oe;

assign line_status_int        = high_pri && reg_ctrl_ier_enable[2];
assign receive_data_int       = ctrl_reg_rbr_write_en && reg_ctrl_ier_enable[0];
assign trans_hold_empty_int   = (ctrl_reg_thr_read && reg_ctrl_ier_enable[1])
                                 ||thre_int_init;
assign thre_int_init          = reg_ctrl_threint_en && !reg_ctrl_thr_vld;

always @( uart_busy_int
       or trans_hold_empty_int
       or line_status_int
       or receive_data_int)
begin
casez({line_status_int,receive_data_int,trans_hold_empty_int,uart_busy_int})
  4'b1???: ctrl_reg_iid[3:0] = 4'b0110;
  4'b01??: ctrl_reg_iid[3:0] = 4'b0100;
  4'b001?: ctrl_reg_iid[3:0] = 4'b0010;
  4'b0001: ctrl_reg_iid[3:0] = 4'b0111;
  default: ctrl_reg_iid[3:0] = 4'b0001;
endcase

end




assign ctrl_baud_gen_divisor[15:0] = reg_ctrl_dllh_data[15:0];
assign ctrl_baud_gen_set_dllh_vld  = reg_ctrl_set_dllh_vld;

endmodule


