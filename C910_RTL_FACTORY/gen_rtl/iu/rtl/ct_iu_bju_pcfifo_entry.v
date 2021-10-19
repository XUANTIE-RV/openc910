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

// &ModuleBeg; @27
module ct_iu_bju_pcfifo_entry(
  bju_pcfifo_ex2_bht_mispred,
  bju_pcfifo_ex2_condbr,
  bju_pcfifo_ex2_jmp,
  bju_pcfifo_ex2_length,
  bju_pcfifo_ex2_pc,
  bju_pcfifo_ex2_pcall,
  bju_pcfifo_ex2_pret,
  cp0_iu_icg_en,
  cp0_yy_clk_en,
  cpurst_b,
  forever_cpuclk,
  iu_yy_xx_cancel,
  pad_yy_icg_scan_en,
  pcfifo_create0_data,
  pcfifo_create1_data,
  pcfifo_create2_data,
  rtu_iu_flush_fe,
  rtu_yy_xx_flush,
  x_cmplt_en,
  x_create_en,
  x_flush,
  x_pop_en,
  x_pop_gateclk_en,
  x_rf_read_data,
  x_rt_read_data,
  x_vld
);

// &Ports; @28
input           bju_pcfifo_ex2_bht_mispred; 
input           bju_pcfifo_ex2_condbr;     
input           bju_pcfifo_ex2_jmp;        
input           bju_pcfifo_ex2_length;     
input   [39:0]  bju_pcfifo_ex2_pc;         
input           bju_pcfifo_ex2_pcall;      
input           bju_pcfifo_ex2_pret;       
input           cp0_iu_icg_en;             
input           cp0_yy_clk_en;             
input           cpurst_b;                  
input           forever_cpuclk;            
input           iu_yy_xx_cancel;           
input           pad_yy_icg_scan_en;        
input   [66:0]  pcfifo_create0_data;       
input   [66:0]  pcfifo_create1_data;       
input   [66:0]  pcfifo_create2_data;       
input           rtu_iu_flush_fe;           
input           rtu_yy_xx_flush;           
input           x_cmplt_en;                
input   [2 :0]  x_create_en;               
input           x_pop_en;                  
input           x_pop_gateclk_en;          
output          x_flush;                   
output  [66:0]  x_rf_read_data;            
output  [50:0]  x_rt_read_data;            
output          x_vld;                     

// &Regs; @29
reg             bht_mispred;               
reg             bht_pred;                  
reg             bju;                       
reg     [24:0]  chk_idx;                   
reg             cmplt;                     
reg             condbr;                    
reg             flush;                     
reg             jmp;                       
reg             jmp_mispred;               
reg             length;                    
reg     [39:0]  pc;                        
reg             pcall;                     
reg             pret;                      
reg             vld;                       
reg     [66:0]  x_create_data;             

// &Wires; @30
wire            bju_pcfifo_ex2_bht_mispred; 
wire            bju_pcfifo_ex2_condbr;     
wire            bju_pcfifo_ex2_jmp;        
wire            bju_pcfifo_ex2_length;     
wire    [39:0]  bju_pcfifo_ex2_pc;         
wire            bju_pcfifo_ex2_pcall;      
wire            bju_pcfifo_ex2_pret;       
wire            cmplt_clk;                 
wire            cmplt_clk_en;              
wire            cp0_iu_icg_en;             
wire            cp0_yy_clk_en;             
wire            cpurst_b;                  
wire            create_clk;                
wire            create_clk_en;             
wire            create_en;                 
wire            entry_clk;                 
wire            entry_clk_en;              
wire            forever_cpuclk;            
wire            iu_yy_xx_cancel;           
wire            pad_yy_icg_scan_en;        
wire    [66:0]  pcfifo_create0_data;       
wire    [66:0]  pcfifo_create1_data;       
wire    [66:0]  pcfifo_create2_data;       
wire            rtu_iu_flush_fe;           
wire            rtu_yy_xx_flush;           
wire            x_cmplt_bht_mispred;       
wire            x_cmplt_condbr;            
wire            x_cmplt_en;                
wire            x_cmplt_jmp;               
wire            x_cmplt_length;            
wire    [39:0]  x_cmplt_pc;                
wire            x_cmplt_pcall;             
wire            x_cmplt_pret;              
wire            x_create_bht_pred;         
wire    [24:0]  x_create_chk_idx;          
wire    [2 :0]  x_create_en;               
wire            x_create_jmp_mispred;      
wire    [39:0]  x_create_pc;               
wire            x_flush;                   
wire            x_pop_en;                  
wire            x_pop_gateclk_en;          
wire            x_read_bht_mispred;        
wire            x_read_bht_pred;           
wire            x_read_bju;                
wire    [24:0]  x_read_chk_idx;            
wire            x_read_cmplt;              
wire            x_read_condbr;             
wire            x_read_flush;              
wire            x_read_jmp;                
wire            x_read_jmp_mispred;        
wire            x_read_length;             
wire    [39:0]  x_read_pc;                 
wire            x_read_pcall;              
wire            x_read_pret;               
wire            x_read_vld;                
wire    [66:0]  x_rf_read_data;            
wire    [50:0]  x_rt_read_data;            
wire            x_vld;                     



parameter CREATE_WIDTH = 67;

//==========================================================
//                 Instance of Gated Cell  
//==========================================================
assign entry_clk_en = create_en
                      || rtu_yy_xx_flush
                      || iu_yy_xx_cancel
                      || rtu_iu_flush_fe
                      || x_pop_gateclk_en
                      || x_cmplt_en;
// &Instance("gated_clk_cell", "x_entry_gated_clk"); @44
gated_clk_cell  x_entry_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (entry_clk         ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (entry_clk_en      ),
  .module_en          (cp0_iu_icg_en     ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @45
//          .external_en (1'b0), @46
//          .global_en   (cp0_yy_clk_en), @47
//          .module_en   (cp0_iu_icg_en), @48
//          .local_en    (entry_clk_en), @49
//          .clk_out     (entry_clk)); @50

assign create_clk_en = create_en;
// &Instance("gated_clk_cell", "x_create_gated_clk"); @53
gated_clk_cell  x_create_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (create_clk        ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (create_clk_en     ),
  .module_en          (cp0_iu_icg_en     ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @54
//          .external_en (1'b0), @55
//          .global_en   (cp0_yy_clk_en), @56
//          .module_en   (cp0_iu_icg_en), @57
//          .local_en    (create_clk_en), @58
//          .clk_out     (create_clk)); @59

assign cmplt_clk_en = create_en || x_cmplt_en;
// &Instance("gated_clk_cell", "x_cmplt_gated_clk"); @62
gated_clk_cell  x_cmplt_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (cmplt_clk         ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (cmplt_clk_en      ),
  .module_en          (cp0_iu_icg_en     ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @63
//          .external_en (1'b0), @64
//          .global_en   (cp0_yy_clk_en), @65
//          .module_en   (cp0_iu_icg_en), @66
//          .local_en    (cmplt_clk_en), @67
//          .clk_out     (cmplt_clk)); @68

//==========================================================
//                     Create Ports
//==========================================================
assign create_en = |x_create_en[2:0];

// &CombBeg; @75
always @( pcfifo_create1_data[66:0]
       or pcfifo_create0_data[66:0]
       or x_create_en[2:0]
       or pcfifo_create2_data[66:0])
begin
  case (x_create_en[2:0])
    3'b001 : x_create_data[CREATE_WIDTH-1:0] = pcfifo_create0_data[CREATE_WIDTH-1:0];
    3'b010 : x_create_data[CREATE_WIDTH-1:0] = pcfifo_create1_data[CREATE_WIDTH-1:0];
    3'b100 : x_create_data[CREATE_WIDTH-1:0] = pcfifo_create2_data[CREATE_WIDTH-1:0];
    default: x_create_data[CREATE_WIDTH-1:0] = {CREATE_WIDTH{1'bx}};
  endcase
// &CombEnd; @82
end

//==========================================================
//                  Create and Read Bus
//==========================================================
assign x_create_chk_idx[24:0] = x_create_data[66:42];
assign x_create_jmp_mispred   = x_create_data[41];
assign x_create_bht_pred      = x_create_data[40];
assign x_create_pc[39:0]      = x_create_data[39:0];

assign x_cmplt_length         = bju_pcfifo_ex2_length;
assign x_cmplt_bht_mispred    = bju_pcfifo_ex2_bht_mispred;
assign x_cmplt_jmp            = bju_pcfifo_ex2_jmp;
assign x_cmplt_pret           = bju_pcfifo_ex2_pret;
assign x_cmplt_pcall          = bju_pcfifo_ex2_pcall;
assign x_cmplt_condbr         = bju_pcfifo_ex2_condbr;
assign x_cmplt_pc[39:0]       = bju_pcfifo_ex2_pc[39:0];

assign x_rf_read_data[66:42]  = x_read_chk_idx[24:0];
assign x_rf_read_data[41]     = x_read_jmp_mispred;
assign x_rf_read_data[40]     = x_read_bht_pred;
assign x_rf_read_data[39:0]   = x_read_pc[39:0];

assign x_rt_read_data[50]     = x_read_cmplt;
assign x_rt_read_data[49]     = x_read_flush;
assign x_rt_read_data[48]     = x_read_vld;
assign x_rt_read_data[47]     = x_read_length;
assign x_rt_read_data[46]     = x_read_bht_pred;
assign x_rt_read_data[45]     = x_read_bju;
assign x_rt_read_data[44]     = x_read_bht_mispred;
assign x_rt_read_data[43]     = x_read_jmp;
assign x_rt_read_data[42]     = x_read_pret;
assign x_rt_read_data[41]     = x_read_pcall;
assign x_rt_read_data[40]     = x_read_condbr;
assign x_rt_read_data[39:0]   = x_read_pc[39:0];

//==========================================================
//                      Entry Valid
//==========================================================
assign x_vld = vld;
always @(posedge entry_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    vld <= 1'b0;
  else if(vld && rtu_yy_xx_flush && (flush || iu_yy_xx_cancel || rtu_iu_flush_fe))
    vld <= 1'b0;
  else if(create_en)
    vld <= 1'b1;
  else if(x_pop_en)
    vld <= 1'b0;
  else
    vld <= vld;
end

assign x_read_vld = vld;

//==========================================================
//                      Entry Cmplt
//==========================================================
always @(posedge entry_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    cmplt <= 1'b0;
  else if(vld && rtu_yy_xx_flush && (flush || iu_yy_xx_cancel || rtu_iu_flush_fe))
    cmplt <= 1'b0;
  else if(create_en)
    cmplt <= 1'b0;
  else if(x_cmplt_en)
    cmplt <= 1'b1;
  else if(x_pop_en)
    cmplt <= 1'b0;
  else
    cmplt <= cmplt;
end

assign x_read_cmplt = cmplt;

//==========================================================
//                        Flush
//==========================================================
assign x_flush = flush;
always @(posedge entry_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    flush <= 1'b0;
  else if(vld && (iu_yy_xx_cancel || rtu_iu_flush_fe) && !rtu_yy_xx_flush)
    flush <= 1'b1;
  else if(create_en)
    flush <= 1'b0;
  else
    flush <= flush;
end

assign x_read_flush = flush;

//==========================================================
//                     Information
//==========================================================
always @(posedge create_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    chk_idx[24:0] <= 25'b0;
    bht_pred      <= 1'b0;
    jmp_mispred   <= 1'b0;
  end
  else if(create_en) begin
    chk_idx[24:0] <= x_create_chk_idx[24:0];
    bht_pred      <= x_create_bht_pred;
    jmp_mispred   <= x_create_jmp_mispred;
  end
  else begin
    chk_idx[24:0] <= chk_idx[24:0];
    bht_pred      <= bht_pred;
    jmp_mispred   <= jmp_mispred;
  end
end

assign x_read_chk_idx[24:0] = chk_idx[24:0];
assign x_read_bht_pred      = bht_pred;
assign x_read_jmp_mispred   = jmp_mispred;

always @(posedge cmplt_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    pc[39:0]      <= 40'b0;
    bju           <= 1'b0;
    condbr        <= 1'b0;
    pcall         <= 1'b0;
    pret          <= 1'b0;
    jmp           <= 1'b0;
    bht_mispred   <= 1'b0;
    length        <= 1'b0;
  end
  else if(create_en) begin
    pc[39:0]      <= x_create_pc[39:0];
    bju           <= 1'b0;
    condbr        <= 1'b0;
    pcall         <= 1'b0;
    pret          <= 1'b0;
    jmp           <= 1'b0;
    bht_mispred   <= 1'b0;
    length        <= 1'b0;
  end
  else if(x_cmplt_en) begin
    pc[39:0]      <= x_cmplt_pc[39:0];
    bju           <= 1'b1;
    condbr        <= x_cmplt_condbr;
    pcall         <= x_cmplt_pcall;
    pret          <= x_cmplt_pret;
    jmp           <= x_cmplt_jmp;
    bht_mispred   <= x_cmplt_bht_mispred;
    length        <= x_cmplt_length;
  end
  else begin
    pc[39:0]      <= pc[39:0];
    bju           <= bju;
    condbr        <= condbr;
    pcall         <= pcall;
    pret          <= pret;
    jmp           <= jmp;
    bht_mispred   <= bht_mispred;
    length        <= length;
  end
end

assign x_read_pc[39:0]      = pc[39:0];
assign x_read_bju           = bju;
assign x_read_condbr        = condbr;
assign x_read_pcall         = pcall;
assign x_read_pret          = pret;
assign x_read_jmp           = jmp;
assign x_read_bht_mispred   = bht_mispred;
assign x_read_length        = length;

// &ModuleEnd; @256
endmodule



