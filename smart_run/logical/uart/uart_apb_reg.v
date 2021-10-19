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






















module uart_apb_reg(
  apb_uart_paddr,
  apb_uart_penable,
  apb_uart_psel,
  apb_uart_pwdata,
  apb_uart_pwrite,
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
  uart_apb_prdata,
  uart_vic_int
);


input   [39:0]  apb_uart_paddr;       
input           apb_uart_penable;     
input           apb_uart_psel;        
input   [31:0]  apb_uart_pwdata;      
input           apb_uart_pwrite;      
input           ctrl_reg_busy;        
input           ctrl_reg_fe;          
input   [3 :0]  ctrl_reg_iid;         
input           ctrl_reg_iid_vld;     
input           ctrl_reg_oe;          
input           ctrl_reg_pe;          
input   [7 :0]  ctrl_reg_rbr_wdata;   
input           ctrl_reg_rbr_write_en; 
input           ctrl_reg_thr_read;    
input           ctrl_reg_thsr_empty;  
input           rst_b;                
input           sys_clk;              
output  [15:0]  reg_ctrl_dllh_data;   
output  [2 :0]  reg_ctrl_ier_enable;  
output  [1 :0]  reg_ctrl_lcr_dls;     
output          reg_ctrl_lcr_eps;     
output          reg_ctrl_lcr_pen;     
output          reg_ctrl_lcr_stop;    
output          reg_ctrl_lcr_wen;     
output          reg_ctrl_rbr_vld;     
output          reg_ctrl_set_dllh_vld; 
output  [7 :0]  reg_ctrl_thr_data;    
output          reg_ctrl_thr_vld;     
output          reg_ctrl_threint_en;  
output  [31:0]  uart_apb_prdata;      
output          uart_vic_int;         


reg             iid_priv_vld;         
reg             iir_iid_clr_vld;      
reg     [7 :0]  uart_dlh;             
reg     [7 :0]  uart_dll;             
reg     [3 :0]  uart_ier;             
reg     [3 :0]  uart_iir_iid;         
reg     [4 :0]  uart_lcr;             
reg             uart_lcr_dlab;        
reg             uart_lsr_dr;          
reg             uart_lsr_fe;          
reg             uart_lsr_oe;          
reg             uart_lsr_pe;          
reg             uart_lsr_thre;        
reg     [7 :0]  uart_rbr;             
reg     [7 :0]  uart_reg_data_pre;    
reg     [7 :0]  uart_thr;             
reg             uart_usr;             
reg             uart_vic_int;         


wire            ahb_iir_read_vld;     
wire            ahb_lsr_read_vld;     
wire            ahb_rbr_read_vld;     
wire            ahb_usr_read_vld;     
wire    [39:0]  apb_uart_paddr;       
wire            apb_uart_penable;     
wire            apb_uart_psel;        
wire    [31:0]  apb_uart_pwdata;      
wire            apb_uart_pwrite;      
wire            ctrl_reg_busy;        
wire            ctrl_reg_fe;          
wire    [3 :0]  ctrl_reg_iid;         
wire            ctrl_reg_iid_vld;     
wire            ctrl_reg_oe;          
wire            ctrl_reg_pe;          
wire    [7 :0]  ctrl_reg_rbr_wdata;   
wire            ctrl_reg_rbr_write_en; 
wire            ctrl_reg_thr_read;    
wire            ctrl_reg_thsr_empty;  
wire            dllh_en;              
wire    [7 :0]  endian_wdata;         
wire            iir_iid_write_vld;    
wire            rd_acc;               
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
wire    [31:0]  uart_apb_prdata;      
wire            uart_dlh_wen;         
wire            uart_dll_wen;         
wire            uart_ier_wen;         
wire            uart_lcr_wen;         
wire            uart_lsr_temt;        
wire    [7 :0]  uart_reg_data;        
wire    [5 :0]  uart_reg_haddr;       
wire            uart_thr_wen;         
wire            wr_acc;               


parameter          RBR = 6'h00;
parameter          THR = 6'h00;
parameter          DLL = 6'h00;
parameter          DLH = 6'h01;
parameter          IER = 6'h01;
parameter          IIR = 6'h02;
parameter          LCR = 6'h03;
parameter          LSR = 6'h05;
parameter          USR = 6'h1f;


















































































assign endian_wdata[7:0]  = apb_uart_pwdata[7:0];
assign wr_acc  = apb_uart_psel && apb_uart_pwrite && apb_uart_penable;
assign rd_acc  = apb_uart_psel && !apb_uart_pwrite && apb_uart_penable; 
assign uart_reg_haddr[5:0] = apb_uart_paddr[7:2];



assign dllh_en      = !uart_usr && uart_lcr_dlab; 
assign uart_dll_wen = dllh_en && wr_acc && (uart_reg_haddr[5:0] == DLL);
assign uart_dlh_wen = dllh_en && wr_acc && (uart_reg_haddr[5:0] == DLH);
assign uart_thr_wen = !uart_lcr_dlab && wr_acc && (uart_reg_haddr[5:0] == THR);
assign uart_ier_wen = !uart_lcr_dlab && wr_acc && (uart_reg_haddr[5:0] == IER);
assign uart_lcr_wen = wr_acc && (uart_reg_haddr[5:0] == LCR);

always @(posedge sys_clk or negedge rst_b)
begin
  if(!rst_b)
    uart_dll[7:0] <= 8'h0;
  else if(uart_dll_wen)
    uart_dll[7:0] <= endian_wdata[7:0];
end

always @(posedge sys_clk or negedge rst_b)
begin
  if(!rst_b)
    uart_dlh[7:0] <= 8'h0;
  else if(uart_dlh_wen)
    uart_dlh[7:0] <= endian_wdata[7:0];
end

always @(posedge sys_clk or negedge rst_b)
begin
  if(!rst_b)
    uart_thr[7:0] <= 8'h0;
  else if(uart_thr_wen)
    uart_thr[7:0] <= endian_wdata[7:0];
end

  
always @(posedge sys_clk or negedge rst_b)
begin
  if(!rst_b)
    uart_ier[3:0] <= 4'h0;
  else if(uart_ier_wen)
    uart_ier[3:0] <= endian_wdata[3:0] ;
end

always @(posedge sys_clk or negedge rst_b)
begin
  if(!rst_b)
  begin
    uart_lcr_dlab <= 1'b0;
    uart_lcr[4:0] <= 5'h0;
  end
  else if(uart_lcr_wen)
  begin
    uart_lcr_dlab <= endian_wdata[7];
    uart_lcr[4:0] <= endian_wdata[4:0] ;
  end
  else
  begin
    uart_lcr_dlab <= uart_lcr_dlab;
    uart_lcr[4:0] <= uart_lcr[4:0];
  end
end










assign uart_reg_data[7:0] = rd_acc ? uart_reg_data_pre[7:0] : 8'bx;

always @( uart_dll[7:0]
       or uart_lsr_fe
       or uart_ier[2:0]
       or uart_dlh[7:0]
       or uart_lsr_oe
       or uart_iir_iid[3:0]
       or uart_rbr[7:0]
       or uart_lcr_dlab
       or uart_usr
       or uart_lsr_pe
       or uart_lsr_temt
       or uart_reg_haddr[5:0]
       or uart_lsr_thre
       or uart_lcr[4:0]
       or uart_lsr_dr)
begin
case(uart_reg_haddr[5:0])
  RBR: uart_reg_data_pre[7:0] = uart_lcr_dlab ? uart_dll[7:0] : uart_rbr[7:0];
  IER: uart_reg_data_pre[7:0] = uart_lcr_dlab ? uart_dlh[7:0] : {5'b0,uart_ier[2:0]}; 
  IIR: uart_reg_data_pre[7:0] = {4'b0,uart_iir_iid[3:0]};
  LCR: uart_reg_data_pre[7:0] = {uart_lcr_dlab,2'b0,uart_lcr[4:0]};
  LSR: uart_reg_data_pre[7:0] = {1'b0,uart_lsr_temt,uart_lsr_thre,1'b0,
                               uart_lsr_fe,uart_lsr_pe,uart_lsr_oe,uart_lsr_dr};
  USR: uart_reg_data_pre[7:0] = {6'b0,uart_usr};
  default:uart_reg_data_pre[7:0] = 8'b0;     
 endcase 

end


assign uart_apb_prdata[31:0]  = {24'b0,uart_reg_data[7:0]};

always @( uart_iir_iid[3:0])
begin
casez(uart_iir_iid[3:0])
  4'b0010:uart_vic_int =1'b1;
  4'b0100:uart_vic_int =1'b1;
  4'b0110:uart_vic_int =1'b1;
  default: uart_vic_int = 1'b0;
endcase

end







always @(posedge sys_clk or negedge rst_b)
begin
  if(!rst_b)
    uart_rbr[7:0] <= 8'b0;
  else if(ctrl_reg_rbr_write_en)
    uart_rbr[7:0] <= ctrl_reg_rbr_wdata[7:0]; 
end


always @(posedge sys_clk or negedge rst_b)
begin
  if(!rst_b)
    uart_iir_iid[3:0] <= 4'b0001;
  else if(iir_iid_write_vld)
    uart_iir_iid[3:0] <= ctrl_reg_iid[3:0];
  else if(iir_iid_clr_vld)
    uart_iir_iid[3:0] <= 4'b0001;
end

assign iir_iid_write_vld = ctrl_reg_iid_vld && iid_priv_vld;


always @( uart_iir_iid[3:0]
       or ctrl_reg_iid[2:0])
begin
 casez(uart_iir_iid[3:0])
 4'b0001: iid_priv_vld = 1'b1;
 4'b0111: iid_priv_vld = 1'b1;
 4'b0010: iid_priv_vld = (ctrl_reg_iid[2] && !ctrl_reg_iid[0]) ? 1 : 0;
 4'b0100: iid_priv_vld = (ctrl_reg_iid[2:0] == 3'b110) ? 1 : 0;
 4'b0110: iid_priv_vld = 1'b0;
 default: iid_priv_vld = 1'b0;
 endcase

end



always @( ahb_rbr_read_vld
       or uart_iir_iid[3:0]
       or ahb_lsr_read_vld
       or uart_lsr_thre
       or ahb_iir_read_vld
       or ahb_usr_read_vld)
begin
 casez(uart_iir_iid[3:0])
  4'b0010: iir_iid_clr_vld = !uart_lsr_thre  || ahb_iir_read_vld;
  4'b0100: iir_iid_clr_vld = ahb_rbr_read_vld;
  4'b0110: iir_iid_clr_vld = ahb_lsr_read_vld;
  4'b0111: iir_iid_clr_vld = ahb_usr_read_vld;
  default: iir_iid_clr_vld = 1'b0;  
  endcase

end

  
assign ahb_iir_read_vld = rd_acc && ( uart_reg_haddr[5:0] == IIR );
assign ahb_lsr_read_vld = rd_acc && ( uart_reg_haddr[5:0] == LSR );
assign ahb_usr_read_vld = rd_acc && ( uart_reg_haddr[5:0] == USR );
assign ahb_rbr_read_vld = rd_acc && !uart_lcr_dlab &&( uart_reg_haddr[5:0] == RBR);


always @(posedge sys_clk or negedge rst_b)
begin
  if(!rst_b)
  begin
    uart_lsr_thre <= 1'b1;
  end
  else if(uart_thr_wen)
  begin
    uart_lsr_thre <= 1'b0;
  end
  else if(ctrl_reg_thr_read)  
  begin
    uart_lsr_thre <= 1'b1;
  end
end

assign uart_lsr_temt = ctrl_reg_thsr_empty && uart_lsr_thre;

always @(posedge sys_clk or negedge rst_b)
begin
  if(!rst_b)
    uart_lsr_dr <= 1'b0;
  else if(ctrl_reg_rbr_write_en && !uart_lsr_pe && !uart_lsr_fe)
    uart_lsr_dr <= 1'b1;
  else if(ahb_rbr_read_vld )
    uart_lsr_dr <= 1'b0;
end

always @(posedge sys_clk or negedge rst_b)
begin
  if(!rst_b)
    uart_lsr_fe <= 1'b0;
  else if(ctrl_reg_fe)
    uart_lsr_fe <= 1'b1;
  else if( ahb_lsr_read_vld )
    uart_lsr_fe <= 1'b0;
end
  
always @(posedge sys_clk or negedge rst_b)
begin
  if(!rst_b)
    uart_lsr_pe <= 1'b0;
  else if(ctrl_reg_pe)
    uart_lsr_pe <= 1'b1;
  else if( ahb_lsr_read_vld )
    uart_lsr_pe <= 1'b0;
end
 
always @(posedge sys_clk or negedge rst_b)
begin
  if(!rst_b)
    uart_lsr_oe <= 1'b0;
  else if(ctrl_reg_oe)
    uart_lsr_oe <= 1'b1;
  else if( ahb_lsr_read_vld )
    uart_lsr_oe <= 1'b0;
end

always @(posedge sys_clk or negedge rst_b)
begin
  if(!rst_b)
    uart_usr <= 1'b0;
  else if(ctrl_reg_busy)
    uart_usr <= 1'b1;
  else if(!ctrl_reg_busy)
    uart_usr <= 1'b0;
end
   



assign reg_ctrl_thr_vld         = !uart_lsr_thre;
assign reg_ctrl_thr_data[7:0]   = uart_thr[7:0];
assign reg_ctrl_ier_enable[2:0] = uart_ier[2:0];
assign reg_ctrl_dllh_data[15:0] = {uart_dlh[7:0],uart_dll[7:0]};
assign reg_ctrl_lcr_eps         = uart_lcr[4];
assign reg_ctrl_lcr_pen         = uart_lcr[3];
assign reg_ctrl_lcr_stop        = uart_lcr[2];
assign reg_ctrl_lcr_dls[1:0]    = uart_lcr[1:0];
assign reg_ctrl_rbr_vld         = uart_lsr_dr;
assign reg_ctrl_lcr_wen         = uart_lcr_wen;
assign reg_ctrl_set_dllh_vld    = uart_dlh_wen || uart_dll_wen;
assign reg_ctrl_threint_en      = uart_ier_wen && endian_wdata[1];


endmodule


