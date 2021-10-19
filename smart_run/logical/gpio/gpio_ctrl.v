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





















module gpio_ctrl(
  gpio_ext_porta,
  gpio_ext_porta_rb,
  gpio_int_polarity,
  gpio_inten,
  gpio_intmask,
  gpio_intr,
  gpio_intr_flag_int,
  gpio_intr_int,
  gpio_intrclk_en,
  gpio_inttype_level,
  gpio_ls_sync,
  gpio_porta_ddr,
  gpio_porta_dr,
  gpio_porta_eoi,
  gpio_raw_intstatus,
  gpio_swporta_ctl,
  gpio_swporta_ddr,
  gpio_swporta_dr,
  pclk,
  pclk_intr,
  presetn
);


input   [7:0]  gpio_ext_porta;           
input   [7:0]  gpio_int_polarity;        
input   [7:0]  gpio_inten;               
input   [7:0]  gpio_intmask;             
input   [7:0]  gpio_inttype_level;       
input          gpio_ls_sync;             
input   [7:0]  gpio_porta_eoi;           
input   [7:0]  gpio_swporta_ctl;         
input   [7:0]  gpio_swporta_ddr;         
input   [7:0]  gpio_swporta_dr;          
input          pclk;                     
input          pclk_intr;                
input          presetn;                  
output  [7:0]  gpio_ext_porta_rb;        
output  [7:0]  gpio_intr;                
output         gpio_intr_flag_int;       
output  [7:0]  gpio_intr_int;            
output         gpio_intrclk_en;          
output  [7:0]  gpio_porta_ddr;           
output  [7:0]  gpio_porta_dr;            
output  [7:0]  gpio_raw_intstatus;       


reg     [7:0]  ed_int_d1;                
reg     [7:0]  ed_out;                   
reg     [7:0]  gpio_ext_porta_int;       
reg     [7:0]  gpio_ext_porta_rb;        
reg     [7:0]  gpio_intr_ed_pm;          
reg            gpio_intrclk_en;          
reg     [7:0]  gpio_porta_ddr;           
reg     [7:0]  gpio_porta_dr;            
reg     [7:0]  int_gpio_raw_intstatus;   
reg     [7:0]  int_pre_in;               
reg     [7:0]  int_s1;                   
reg     [7:0]  int_sy_in;                
reg     [7:0]  intrclk_en;               
reg     [7:0]  ls_int_in;                


wire    [7:0]  ed_rf;                    
wire    [7:0]  gpio_ext_porta;           
wire    [7:0]  gpio_int_polarity;        
wire    [7:0]  gpio_inten;               
wire    [7:0]  gpio_intmask;             
wire    [7:0]  gpio_intr;                
wire           gpio_intr_flag_int;       
wire    [7:0]  gpio_intr_int;            
wire           gpio_intrclk_en_int;      
wire    [7:0]  gpio_inttype_level;       
wire           gpio_ls_sync;             
wire    [7:0]  gpio_porta_eoi;           
wire    [7:0]  gpio_raw_intstatus;       
wire    [7:0]  gpio_swporta_ctl;         
wire    [7:0]  gpio_swporta_ctl_internal; 
wire    [7:0]  gpio_swporta_ddr;         
wire    [7:0]  gpio_swporta_dr;          
wire    [7:0]  int_in;                   
wire           pclk;                     
wire           pclk_intr;                
wire           presetn;                  












integer type_i;

always @( gpio_inttype_level[1:0]
       or gpio_ls_sync
       or gpio_inten[7:0]
       or gpio_inttype_level[7:1])
begin

  for(type_i = 0 ; type_i < 8 ; type_i=type_i+1)
  begin
    if(gpio_inten[type_i] == 1'b1)
      if(gpio_inttype_level[type_i] == 1'b1)
        intrclk_en[type_i] = 1'b1;
      else
        intrclk_en[type_i] = gpio_ls_sync;
    else
      intrclk_en[type_i] = 1'b0;
  end

end

assign gpio_intrclk_en_int = | intrclk_en;

always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    gpio_intrclk_en <= 1'b0;
  else
    gpio_intrclk_en <= gpio_intrclk_en_int;
end



integer polarity_i;

always @( gpio_ext_porta[1:0]
       or gpio_int_polarity[7:0]
       or gpio_ext_porta[7:0]
       or gpio_int_polarity[1:0])
begin
  gpio_ext_porta_int[7:0] = {8{1'b0}};
  for(polarity_i = 0 ; polarity_i < 8 ; polarity_i=polarity_i+1)
  begin
    if(gpio_int_polarity[polarity_i] == 1'b0)
      gpio_ext_porta_int[polarity_i] =  ~gpio_ext_porta[polarity_i];
    else
      gpio_ext_porta_int[polarity_i] =  gpio_ext_porta[polarity_i];
  end

end


always @( gpio_ext_porta_int[7:0])
begin
  int_sy_in[7:0] = {8{1'b0}};
  int_sy_in[7:0] = gpio_ext_porta_int[7:0];

end


always @(posedge pclk_intr or negedge presetn)
begin
  if(!presetn)
    int_s1[7:0] <= {8{1'b0}};
  else
    int_s1[7:0] <= int_sy_in[7:0];
end

always @(posedge pclk_intr or negedge presetn)
begin 
  if(!presetn)
    int_pre_in[7:0] <= {8{1'b0}};
  else
    int_pre_in[7:0] <= int_s1;
end

assign int_in[7:0] = int_pre_in[7:0];


always @(posedge pclk_intr or negedge presetn)
begin
  if(!presetn)
    ed_int_d1[7:0] <= {8{1'b0}};
  else
    ed_int_d1[7:0] <= int_in[7:0];
end

assign ed_rf[7:0] = int_in ^ ed_int_d1;


integer ed_j;

always @( ed_rf[7:0]
       or int_in[7:0])
begin

  ed_out[7:0] = {8{1'b0}};
  for(ed_j = 0 ; ed_j < 8 ; ed_j=ed_j+1)
  begin
    ed_out[ed_j] =  ed_rf[ed_j] & int_in[ed_j];
  end

end






assign gpio_swporta_ctl_internal[7:0] = gpio_swporta_ctl[7:0];
integer int_k;
always @(posedge pclk_intr or negedge presetn)
begin
  if(!presetn)
    gpio_intr_ed_pm[7:0] <= {8{1'b0}};
  else
    for(int_k = 0 ; int_k < 8 ; int_k=int_k+1)
    begin
      if(gpio_inten[int_k] == 1'b0)
        gpio_intr_ed_pm[int_k] <= 1'b0;
      else
        if((ed_out[int_k] == 1'b1) &&
           (gpio_inten[int_k] == 1'b1) &&
           (gpio_swporta_ddr[int_k] == 1'b0) &&
           (gpio_swporta_ctl_internal[int_k] == 1'b0))
          gpio_intr_ed_pm[int_k] <= 1'b1;
      else
        if(gpio_porta_eoi[int_k] == 1'b1)
          gpio_intr_ed_pm[int_k] <= 1'b0;
    end
end





integer lsa_k;


always @( int_in[7:0]
       or gpio_swporta_ddr[7:0]
       or gpio_swporta_ctl_internal[2:0]
       or gpio_ls_sync
       or int_sy_in[7:0]
       or gpio_swporta_ctl_internal[7:2])
begin
  ls_int_in[7:0] = {8{1'b0}};
  for(lsa_k = 0 ; lsa_k < 8 ; lsa_k=lsa_k+1)
  begin
    if(((gpio_swporta_ddr[lsa_k]) == 1'b1) ||  
        (gpio_swporta_ctl_internal[lsa_k] == 1'b1))
      ls_int_in[lsa_k] = 0;
    else
      if(gpio_ls_sync == 1'b1)
        ls_int_in[lsa_k] = int_in[lsa_k];
      else
        ls_int_in[lsa_k] = int_sy_in[lsa_k];
  end

end


integer raw_l;


always @( gpio_inten[7:3]
       or gpio_intr_ed_pm[2:0]
       or gpio_intr_ed_pm[7:1]
       or gpio_inten[4:0]
       or gpio_inttype_level[7:0]
       or ls_int_in[7:0])
begin
  int_gpio_raw_intstatus[7:0] = {8{1'b0}};
  for(raw_l = 0 ; raw_l < 8 ; raw_l=raw_l+1)
  begin
    if(gpio_inten[raw_l] == 1'b0)
      int_gpio_raw_intstatus[raw_l] = 0;
    else
      if(gpio_inttype_level[raw_l] == 1'b1)
        int_gpio_raw_intstatus[raw_l] = gpio_intr_ed_pm[raw_l];
      else
        int_gpio_raw_intstatus[raw_l] = ls_int_in[raw_l];
  end

end

assign gpio_raw_intstatus[7:0] = int_gpio_raw_intstatus[7:0];
assign gpio_intr_int[7:0] = gpio_raw_intstatus[7:0] & ~gpio_intmask[7:0]; 
assign gpio_intr[7:0] = gpio_intr_int[7:0];

assign gpio_intr_flag_int = |gpio_intr_int[7:0];

always @( gpio_swporta_dr[7:0])
begin
  gpio_porta_dr[7:0] = {8{1'b0}};
  gpio_porta_dr[7:0] = gpio_swporta_dr[7:0];

end


always @( gpio_swporta_ddr[7:0])
begin
  gpio_porta_ddr[7:0] = {8{1'b0}};
  gpio_porta_ddr[7:0] = gpio_swporta_ddr[7:0];

end

integer rba_i;


always @( gpio_swporta_dr[2:1]
       or gpio_ext_porta[7:0]
       or gpio_swporta_dr[7:0]
       or gpio_porta_ddr[7:0])
begin
  gpio_ext_porta_rb[7:0] = {8{1'b0}};
  for(rba_i = 0 ; rba_i < 8 ; rba_i=rba_i+1)
  begin
    if(gpio_porta_ddr[rba_i] == 1'b1)
      gpio_ext_porta_rb[rba_i] = gpio_swporta_dr[rba_i];
    else
      gpio_ext_porta_rb[rba_i] = gpio_ext_porta[rba_i];
  end

end

integer rbb_i;


endmodule


