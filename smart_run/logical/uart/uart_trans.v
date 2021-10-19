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






















module uart_trans(
  ctrl_trans_data_length,
  ctrl_trans_parity_bit,
  ctrl_trans_parity_en,
  ctrl_trans_shift_data,
  ctrl_trans_stop_length,
  ctrl_trans_thr_vld,
  rst_b,
  s_out,
  sys_clk,
  trans_clk_en,
  trans_ctrl_busy,
  trans_ctrl_thr_read,
  trans_ctrl_thsr_empty
);


input   [1:0]  ctrl_trans_data_length; 
input          ctrl_trans_parity_bit; 
input          ctrl_trans_parity_en;  
input   [7:0]  ctrl_trans_shift_data; 
input          ctrl_trans_stop_length; 
input          ctrl_trans_thr_vld;    
input          rst_b;                 
input          sys_clk;               
input          trans_clk_en;          
output         s_out;                 
output         trans_ctrl_busy;       
output         trans_ctrl_thr_read;   
output         trans_ctrl_thsr_empty; 


reg     [2:0]  conter;                
reg     [4:0]  cur_state;             
reg     [4:0]  next_state;            
reg            parity_cout;           
reg            s_out;                 
reg            thsr_empty;            
reg            trans_ctrl_thr_read;   
reg     [7:0]  trans_shift_reg;       


wire    [1:0]  ctrl_trans_data_length; 
wire           ctrl_trans_parity_bit; 
wire           ctrl_trans_parity_en;  
wire    [7:0]  ctrl_trans_shift_data; 
wire           ctrl_trans_stop_length; 
wire           ctrl_trans_thr_vld;    
wire           data_over;             
wire           parity_bit;            
wire           rst_b;                 
wire           stop_over;             
wire           sys_clk;               
wire           thsr_shift_over;       
wire           thsr_wen;              
wire           trans_clk_en;          
wire           trans_ctrl_busy;       
wire           trans_ctrl_thsr_empty; 
wire           trans_enable;          


parameter IDLE   = 5'b00001,
          START  = 5'b00010,
          DATA   = 5'b00100,
          PARITY = 5'b01000,
          STOP   = 5'b10000;

always@(posedge sys_clk or negedge rst_b)
begin
  if(!rst_b)
    cur_state[4:0] <= IDLE;
  else if(trans_clk_en)
    cur_state[4:0] <= next_state[4:0];
end


assign trans_enable          = !thsr_empty;


always @( parity_bit
       or stop_over
       or cur_state[4:0]
       or trans_enable
       or ctrl_trans_parity_en
       or trans_shift_reg[0]
       or data_over
       or thsr_wen)
begin
s_out           = 1'b1;
next_state[4:0] = IDLE;
case(cur_state[4:0])
  IDLE: 
  begin
    if(trans_enable)
      next_state[4:0] = START;
  end  
  START:
  begin
    s_out           = 1'b0;
    next_state[4:0] = DATA;
  end
  DATA:
  begin
    s_out           =  trans_shift_reg[0];
    if(data_over)
      next_state[4:0] = ctrl_trans_parity_en ? PARITY : STOP;
    else
     next_state[4:0] = DATA;
  end
  PARITY:
  begin
    s_out           = parity_bit;
    next_state[4:0] = STOP;
  end
  STOP:
  begin
    s_out           = 1'b1;
    if(stop_over)
    begin
      if(thsr_wen)
         next_state[4:0] = START;
      else
         next_state[4:0] = IDLE;
    end
    else
      next_state[4:0] = STOP;
  end
  default: next_state[4:0] = IDLE;
endcase


end

always@(posedge sys_clk or negedge rst_b)
begin
 if(!rst_b)
   conter[2:0] <= 2'b0;
 else if(trans_clk_en)
 begin
   if(data_over || stop_over)
     conter[2:0] <= 2'b0;   
   else if((cur_state[2]) ||(cur_state[4]))
     conter[2:0] <= conter[2:0] + 1'b1;
 end
end

assign data_over        = (conter[2:0] == {1'b1,ctrl_trans_data_length[1:0]});
assign stop_over        = (cur_state[4]) && (conter[2:0] == {2'b0,ctrl_trans_stop_length}); 





assign trans_ctrl_busy            = !(cur_state[0]); 







assign thsr_shift_over = cur_state[4];





always@(posedge sys_clk or negedge rst_b)
begin
  if( !rst_b )
    trans_shift_reg[7:0] <= 8'b0;
  else if(trans_clk_en)
  begin
   if((cur_state[2]))
    trans_shift_reg[7:0] <= {1'b0,trans_shift_reg[7:1]};
   else if(thsr_wen)
     trans_shift_reg[7:0] <= ctrl_trans_shift_data[7:0];
  end
end

always@(posedge sys_clk or negedge rst_b)
begin
  if( !rst_b )
    thsr_empty <= 1'b1;
  else if(trans_clk_en)
  begin
   if( thsr_wen )
     thsr_empty <= 1'b0;
   else if(thsr_shift_over)
     thsr_empty <= 1'b1;
  end
end

assign thsr_wen = ctrl_trans_thr_vld && ( thsr_shift_over || thsr_empty);

always@(posedge sys_clk or negedge rst_b)
begin
  if( !rst_b )
    trans_ctrl_thr_read <= 1'b0;
  else if(trans_clk_en)
  begin
  if( thsr_wen )
    trans_ctrl_thr_read <= 1'b1;
  else 
    trans_ctrl_thr_read <= 1'b0;
  end
end

assign trans_ctrl_thsr_empty = thsr_empty;
always@(posedge sys_clk or negedge rst_b)
begin
  if( !rst_b )
    parity_cout <= 1'b0;
  else if(trans_clk_en)
  begin
   if(cur_state[1])
     parity_cout <= 1'b0;
   else if( (cur_state[2]))
     parity_cout  <= parity_cout ^ trans_shift_reg[0]; 
  end
end

assign parity_bit = ~(parity_cout ^ ctrl_trans_parity_bit);
  

endmodule


