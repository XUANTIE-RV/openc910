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























module timer(
  paddr,
  pclk,
  penable,
  prdata,
  presetn,
  psel,
  pwdata,
  pwrite,
  timer_int
);


input   [15:0]  paddr;                 
input           pclk;                  
input           penable;               
input           presetn;               
input           psel;                  
input   [31:0]  pwdata;
input           pwrite;
output  [31:0]  prdata;                
output  [3 :0]  timer_int;             


reg     [31:0]  prdata;                
reg     [2 :0]  timer_1_control_reg;   
reg     [31:0]  timer_1_load_count;    
reg             timer_1_raw_int_status; 
reg     [2 :0]  timer_2_control_reg;   
reg     [31:0]  timer_2_load_count;    
reg             timer_2_raw_int_status; 
reg     [2 :0]  timer_3_control_reg;   
reg     [31:0]  timer_3_load_count;    
reg             timer_3_raw_int_status; 
reg     [2 :0]  timer_4_control_reg;   
reg     [31:0]  timer_4_load_count;    
reg             timer_4_raw_int_status; 


wire    [15:0]  paddr;                 
wire            pclk;                  
wire            presetn;               
wire            psel;                  
wire    [31:0]  pwdata;                
wire            pwrite;  
wire    [31:0]  timer_1_current_value; 
wire            timer_1_int_clear;     
wire            timer_1_int_status;    
wire            timer_1_interrupt;     
wire    [31:0]  timer_2_current_value; 
wire            timer_2_int_clear;     
wire            timer_2_int_status;    
wire            timer_2_interrupt;     
wire    [31:0]  timer_3_current_value; 
wire            timer_3_int_clear;     
wire            timer_3_int_status;    
wire            timer_3_interrupt;     
wire    [31:0]  timer_4_current_value; 
wire            timer_4_int_clear;     
wire            timer_4_int_status;    
wire            timer_4_interrupt;     
wire    [3 :0]  timer_int;             
wire            timers_int_clear;      











counter  timer_1 (
  .interrupt              (timer_1_interrupt     ),
  .pclk                   (pclk                  ),
  .presetn                (presetn               ),
  .timer_current_value    (timer_1_current_value ),
  .timer_enable           (timer_1_control_reg[0]),
  .timer_load_count       (timer_1_load_count    ),
  .timer_mode             (timer_1_control_reg[1])
);











counter  timer_2 (
  .interrupt              (timer_2_interrupt     ),
  .pclk                   (pclk             ),
  .presetn                (presetn          ),
  .timer_current_value    (timer_2_current_value ),
  .timer_enable           (timer_2_control_reg[0]),
  .timer_load_count       (timer_2_load_count    ),
  .timer_mode             (timer_2_control_reg[1])
);











counter  timer_3 (
  .interrupt              (timer_3_interrupt     ),
  .pclk                   (pclk             ),
  .presetn                (presetn          ),
  .timer_current_value    (timer_3_current_value ),
  .timer_enable           (timer_3_control_reg[0]),
  .timer_load_count       (timer_3_load_count    ),
  .timer_mode             (timer_3_control_reg[1])
);











counter  timer_4 (
  .interrupt              (timer_4_interrupt     ),
  .pclk                   (pclk             ),
  .presetn                (presetn          ),
  .timer_current_value    (timer_4_current_value ),
  .timer_enable           (timer_4_control_reg[0]),
  .timer_load_count       (timer_4_load_count    ),
  .timer_mode             (timer_4_control_reg[1])
);













always @(posedge pclk or negedge presetn)
begin
  if(!presetn)
  begin
    timer_1_load_count <= 32'b0;
    timer_1_control_reg <= 3'b0;
    timer_2_load_count <= 32'b0;
    timer_2_control_reg <= 3'b0;
    timer_3_load_count <= 32'b0;
    timer_3_control_reg <= 3'b0;
    timer_4_load_count <= 32'b0;
    timer_4_control_reg <= 3'b0;
  end
  else
  begin
    if(psel && pwrite && penable)
    begin
      case(paddr[7:2])
        6'b000000:
        begin
          timer_1_load_count <= pwdata;
        end
        6'b000010:
        begin
          timer_1_control_reg <= pwdata[2:0];
        end
        6'b000101:
        begin
          timer_2_load_count <= pwdata;
        end
        6'b000111:
        begin
          timer_2_control_reg <= pwdata[2:0];
        end
        6'b001010:
        begin
          timer_3_load_count <= pwdata;
        end
        6'b001100:
        begin
          timer_3_control_reg <= pwdata[2:0];
        end
        6'b001111:
        begin
          timer_4_load_count <= pwdata;
        end
        6'b010001:
        begin
          timer_4_control_reg <= pwdata[2:0];
        end
      endcase
    end
  end
end
    



always @(posedge pclk)
begin
  if(psel && !pwrite)
  begin
    if (!penable)
	begin
      case(paddr[7:2])
        6'b000000:
        begin
          prdata <= timer_1_load_count;
        end
        6'b000001:
        begin
          prdata <= timer_1_current_value;
        end
        6'b000010:
        begin
          prdata <= {29'b0, timer_1_control_reg};
        end
        6'b000011:
        begin
          prdata <= 32'b0;
        end
        6'b000100:
        begin
          prdata <= {31'b0, timer_1_int_status};
        end
        6'b000101:
        begin
          prdata <= timer_2_load_count;
        end
        6'b000110:
        begin
          prdata <= timer_2_current_value;
        end
        6'b000111:
        begin
          prdata <= {29'b0, timer_2_control_reg};
        end
        6'b001000:
        begin
          prdata <= 32'b0;
        end
        6'b001001:
        begin
          prdata <= {31'b0, timer_2_int_status};
        end
        6'b001010:
        begin
          prdata <= timer_3_load_count;
        end
        6'b001011:
        begin
          prdata <= timer_3_current_value;
        end
        6'b001100:
        begin
          prdata <= {29'b0, timer_3_control_reg};
        end
        6'b001101:
        begin
          prdata <= 32'b0;
        end
        6'b001110:
        begin
          prdata <= {31'b0, timer_3_int_status};
        end
        6'b001111:
        begin
          prdata <= timer_4_load_count;
        end
        6'b010000:
        begin
          prdata <= timer_4_current_value;
        end
        6'b010001:
        begin
          prdata <= {29'b0, timer_4_control_reg};
        end
        6'b010010:
        begin
          prdata <= 32'b0;
        end
        6'b010011:
        begin
          prdata <= {31'b0, timer_4_int_status};
        end
        6'b101000:
        begin
          prdata <= {28'b0, timer_int};
        end
        6'b101001:
        begin
          prdata <= 32'b0;
        end
        6'b101010:
        begin
          prdata <= {28'b0, timer_4_raw_int_status, timer_3_raw_int_status, timer_2_raw_int_status, timer_1_raw_int_status};
        end
        default:
        begin
          prdata <= 32'bx;
        end
      endcase
	end
	else
	begin
	  prdata <= 32'bx;
	end
  end
end

assign timer_int = {timer_4_int_status, timer_3_int_status, timer_2_int_status, timer_1_int_status};




assign timer_1_int_clear = (paddr[7:2] == 6'b000011) && psel && !pwrite;
assign timer_2_int_clear = (paddr[7:2] == 6'b001000) && psel && !pwrite;
assign timer_3_int_clear = (paddr[7:2] == 6'b001101) && psel && !pwrite;
assign timer_4_int_clear = (paddr[7:2] == 6'b010010) && psel && !pwrite;
assign timers_int_clear = (paddr[7:2] == 6'b101001) && psel && !pwrite;




assign timer_1_int_status = timer_1_raw_int_status && !timer_1_control_reg[2];
always @(posedge pclk or negedge presetn)
begin
  if(!presetn)
  begin
    timer_1_raw_int_status <= 1'b0;
  end
  else
  begin
    if(timer_1_control_reg[0])
    begin
      if(timer_1_interrupt)
      begin
        timer_1_raw_int_status <= 1'b1;
      end
      else
      begin
        if(timer_1_int_clear || timers_int_clear)
        begin
          timer_1_raw_int_status <= 1'b0;
        end
      end
    end
    else
    begin
      timer_1_raw_int_status <= 1'b0;
    end
  end
end




assign timer_2_int_status = timer_2_raw_int_status && !timer_2_control_reg[2];
always @(posedge pclk or negedge presetn)
begin
  if(!presetn)
  begin
    timer_2_raw_int_status <= 1'b0;
  end
  else
  begin
    if(timer_2_control_reg[0])
    begin
      if(timer_2_interrupt)
      begin
        timer_2_raw_int_status <= 1'b1;
      end
      else
      begin
        if(timer_2_int_clear || timers_int_clear)
        begin
          timer_2_raw_int_status <= 1'b0;
        end
      end
    end
    else
    begin
      timer_2_raw_int_status <= 1'b0;
    end
  end
end




assign timer_3_int_status = timer_3_raw_int_status && !timer_3_control_reg[2];
always @(posedge pclk or negedge presetn)
begin
  if(!presetn)
  begin
    timer_3_raw_int_status <= 1'b0;
  end
  else
  begin
    if(timer_3_control_reg[0])
    begin
      if(timer_3_interrupt)
      begin
        timer_3_raw_int_status <= 1'b1;
      end
      else
      begin
        if(timer_3_int_clear || timers_int_clear)
        begin
          timer_3_raw_int_status <= 1'b0;
        end
      end
    end
    else
    begin
      timer_3_raw_int_status <= 1'b0;
    end
  end
end




assign timer_4_int_status = timer_4_raw_int_status && !timer_4_control_reg[2];
always @(posedge pclk or negedge presetn)
begin
  if(!presetn)
  begin
    timer_4_raw_int_status <= 1'b0;
  end
  else
  begin
    if(timer_4_control_reg[0])
    begin
      if(timer_4_interrupt)
      begin
        timer_4_raw_int_status <= 1'b1;
      end
      else
      begin
        if(timer_4_int_clear || timers_int_clear)
        begin
          timer_4_raw_int_status <= 1'b0;
        end
      end
    end
    else
    begin
      timer_4_raw_int_status <= 1'b0;
    end
  end
end


endmodule

module counter(
  interrupt,
  pclk,
  presetn,
  timer_current_value,
  timer_enable,
  timer_load_count,
  timer_mode
);


input           pclk;               
input           presetn;            
input           timer_enable;       
input   [31:0]  timer_load_count;   
input           timer_mode;         
output          interrupt;          
output  [31:0]  timer_current_value; 


reg     [31:0]  counter;            
reg             interrupt;          
reg             timer_enable_flop;  


wire            load_cnt_en;        
wire            pclk;               
wire            presetn;            
wire    [31:0]  timer_current_value; 
wire            timer_enable;       
wire    [31:0]  timer_load_count;   
wire            timer_mode;         





always @(posedge pclk or negedge presetn)
begin
  if(!presetn)
  begin
      timer_enable_flop <=0;
  end
  else
  begin
      timer_enable_flop <=timer_enable ;
  end
end

assign load_cnt_en= (timer_enable && !timer_enable_flop)
                    || !(|counter[31:0]);

always @(posedge pclk or negedge presetn)
begin
  if(!presetn)
  begin
      counter[31:0] <=32'hffffffff;
  end
  else if(load_cnt_en)
  begin
    if(timer_mode)
    begin
      counter[31:0]<=timer_load_count[31:0];
    end
    else 
    begin
      counter[31:0]<=32'hffffffff;
    end
  end
  else if (timer_enable)
  begin
    counter[31:0]<=counter[31:0]-1'b1;
  end
  else
  begin
    counter[31:0]<=counter[31:0];
  end
end

assign timer_current_value[31:0]=counter[31:0];




always @(posedge pclk or negedge presetn)
begin
  if(!presetn)
  begin
    interrupt <=1'b0;
  end
  else if(!{|counter[31:0]})
  begin
    interrupt <=1'b1;
  end
  else
  begin
    interrupt<=1'b0 ;
  end
end


endmodule

