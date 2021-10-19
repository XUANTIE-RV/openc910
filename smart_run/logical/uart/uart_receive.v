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






















module uart_receive(
  ctrl_receive_data_length,
  ctrl_receive_parity_bit,
  ctrl_receive_parity_en,
  ctrl_receive_stop_length,
  ctrl_trans_parity_en,
  receive_clk_en,
  receive_ctrl_busy,
  receive_ctrl_fe,
  receive_ctrl_pe,
  receive_ctrl_rdata,
  receive_ctrl_redata_over,
  rst_b,
  s_in,
  sys_clk
);


input   [1:0]  ctrl_receive_data_length; 
input          ctrl_receive_parity_bit; 
input          ctrl_receive_parity_en;  
input          ctrl_receive_stop_length; 
input          ctrl_trans_parity_en;    
input          receive_clk_en;          
input          rst_b;                   
input          s_in;                    
input          sys_clk;                 
output         receive_ctrl_busy;       
output         receive_ctrl_fe;         
output         receive_ctrl_pe;         
output  [7:0]  receive_ctrl_rdata;      
output         receive_ctrl_redata_over; 


reg     [3:0]  counter;                 
reg     [5:0]  cur_state;               
reg     [2:0]  da_conter;               
reg            di_reg1;                 
reg            di_reg2;                 
reg            fram_error;              
reg     [5:0]  next_state;              
reg            parity_cout;             
reg     [7:0]  receive_shift_reg;       
reg            sync1;                   
reg            sync2;                   


wire           cont_16;                 
wire           cont_8;                  
wire    [1:0]  ctrl_receive_data_length; 
wire           ctrl_receive_parity_bit; 
wire           ctrl_receive_parity_en;  
wire           ctrl_receive_stop_length; 
wire           ctrl_trans_parity_en;    
wire           data_over;               
wire           di_rx_in;                
wire           receive_clk_en;          
wire           receive_ctrl_busy;       
wire           receive_ctrl_fe;         
wire           receive_ctrl_pe;         
wire    [7:0]  receive_ctrl_rdata;      
wire           receive_ctrl_redata_over; 
wire           rst_b;                   
wire           rx_in;                   
wire           s_in;                    
wire           stop_over;               
wire           sys_clk;                 


parameter IDLE     = 6'b000001,
          START    = 6'b000010,
          DATA     = 6'b000100,
          PARITY   = 6'b001000,
          STOP     = 6'b010000,
          CLECT_SIG  = 6'b100000;

always@(posedge sys_clk or negedge rst_b)
begin
  if(!rst_b)
    cur_state[5:0] <= IDLE;
  else if(receive_clk_en)
    cur_state[5:0] <= next_state[5:0];
end




always @(posedge sys_clk or negedge rst_b)
begin 
  if(rst_b == 1'b0)
    begin
      sync1 <= 1'b1;
      sync2 <= 1'b1;
    end
  else
    begin
      sync1 <= s_in;
      sync2 <= sync1;
    end
end 
assign rx_in = sync2;






always @(posedge sys_clk or negedge rst_b)
begin        
  if(rst_b == 1'b0)
    begin
      di_reg1 <= 1'b1;
      di_reg2 <= 1'b1;
    end
   else if(receive_clk_en)
     begin
       di_reg1 <= rx_in;
       di_reg2 <= di_reg1;
     end
end 
assign di_rx_in = (rx_in & di_reg1) | (rx_in & di_reg2) | (di_reg1 & di_reg2);




always @( di_rx_in
       or stop_over
       or cur_state[5:0]
       or cont_8
       or cont_16
       or data_over
       or ctrl_trans_parity_en)
begin
next_state[5:0] = IDLE;
case(cur_state[5:0])
  IDLE:
  begin
    if(!di_rx_in)
      next_state[5:0] = START;
  end
  START:
  begin
    if(cont_8)
    begin
      if(!di_rx_in)
      next_state[5:0] = DATA;
    end
    else
      next_state[5:0] = START;
  end
  DATA:
  begin 
   if(cont_16 && data_over)
     next_state[5:0] = ctrl_trans_parity_en ? PARITY : STOP;
   else
     next_state[5:0] = DATA;
  end
  PARITY:
  begin
    if(cont_16)
      next_state[5:0] = STOP;
    else
      next_state[5:0] = PARITY;
  end  
  STOP:
  begin      
    if(cont_16 && stop_over)
    begin
      next_state[5:0] = CLECT_SIG;
    end
    else
      next_state[5:0] = STOP;
  end
  CLECT_SIG:
    next_state[5:0] = IDLE; 
  default: next_state[5:0] = IDLE;
endcase

end



always@(posedge sys_clk or negedge rst_b)
begin
  if(!rst_b)
    counter[3:0] <= 4'b0;
  else if(receive_clk_en)
  begin
   if( (cur_state[0]) || ((cur_state[1]) && cont_8))
     counter[3:0] <= 4'b0;
   else
     counter[3:0] <= counter[3:0] + 1;
  end
end

assign cont_8   = (counter[3:0] == 4'b0111);
assign cont_16  = (counter[3:0] == 4'b1111);



always@(posedge sys_clk or negedge rst_b)
begin
  if(!rst_b)
   da_conter[2:0] <= 2'b0;
 else if(receive_clk_en) 
 begin
   if((data_over || stop_over)&& cont_16)
    da_conter[2:0] <= 2'b0;
   else if(((cur_state[2]) ||(cur_state[4])) && cont_16)
    da_conter[2:0] <= da_conter[2:0] + 1'b1;
 end
end

assign data_over        = (da_conter[2:0] == {1'b1,ctrl_receive_data_length[1:0]});
assign stop_over        = (cur_state[4]) && (da_conter[2:0] == {2'b0,ctrl_receive_stop_length});




always@(posedge sys_clk or negedge rst_b)
begin 
  if( !rst_b )
    receive_shift_reg[7:0] <= 8'b0;
  else if(receive_clk_en)
  begin
    if((cur_state[2])&& cont_16)
    receive_shift_reg[7:0] <= {di_rx_in,receive_shift_reg[7:1]};
   else if((cur_state[0]))
    receive_shift_reg[7:0] <= 8'b0;
  end
end

assign receive_ctrl_rdata[7:0]   = receive_shift_reg[7:0];




assign receive_ctrl_busy         = ~(cur_state[0]);


always@(posedge sys_clk or negedge rst_b)
begin
  if( !rst_b )
    parity_cout <= 1'b0;
  else if(receive_clk_en)
  begin
    if((cur_state[2]) || (cur_state[3]))
     begin
     if(cont_16)
      parity_cout  <= parity_cout ^ di_rx_in;
     else
      parity_cout  <= parity_cout;
    end
    else if(cur_state[4] || cur_state[5]) 
     parity_cout <= parity_cout;
    else
     parity_cout <= 1'b0;
 end
end



always@(posedge sys_clk or negedge rst_b)
begin
  if( !rst_b )
    fram_error <= 1'b0;
  else if((cur_state[4]))
  begin
    if(fram_error == 1'b1)
       fram_error <= fram_error;
    else if(cont_16)
      fram_error <= ~di_rx_in;
    else
      fram_error <= fram_error;
  end
  else if(cur_state[5])
    fram_error <= fram_error;
  else
    fram_error <= 1'b0;
end



assign receive_ctrl_pe  = (~(parity_cout ^ ctrl_receive_parity_bit)) && ctrl_receive_parity_en && (cur_state[5]);  

assign receive_ctrl_fe  = fram_error && (cur_state[5]);



assign receive_ctrl_redata_over  = cur_state[5] && !fram_error && !receive_ctrl_pe;



endmodule


