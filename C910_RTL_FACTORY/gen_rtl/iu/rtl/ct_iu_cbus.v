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

// &ModuleBeg; @26
module ct_iu_cbus(
  bju_cbus_ex2_pipe2_abnormal,
  bju_cbus_ex2_pipe2_bht_mispred,
  bju_cbus_ex2_pipe2_iid,
  bju_cbus_ex2_pipe2_jmp_mispred,
  bju_cbus_ex2_pipe2_sel,
  cp0_iu_ex3_abnormal,
  cp0_iu_ex3_efpc,
  cp0_iu_ex3_efpc_vld,
  cp0_iu_ex3_expt_vec,
  cp0_iu_ex3_expt_vld,
  cp0_iu_ex3_flush,
  cp0_iu_ex3_iid,
  cp0_iu_ex3_inst_vld,
  cp0_iu_ex3_mtval,
  cp0_iu_icg_en,
  cp0_yy_clk_en,
  cpurst_b,
  forever_cpuclk,
  idu_iu_rf_div_sel,
  idu_iu_rf_mult_sel,
  idu_iu_rf_pipe0_cbus_gateclk_sel,
  idu_iu_rf_pipe0_iid,
  idu_iu_rf_pipe0_sel,
  idu_iu_rf_pipe1_cbus_gateclk_sel,
  idu_iu_rf_pipe1_iid,
  idu_iu_rf_pipe1_sel,
  iu_rtu_pipe0_abnormal,
  iu_rtu_pipe0_bkpt,
  iu_rtu_pipe0_cmplt,
  iu_rtu_pipe0_efpc,
  iu_rtu_pipe0_efpc_vld,
  iu_rtu_pipe0_expt_vec,
  iu_rtu_pipe0_expt_vld,
  iu_rtu_pipe0_flush,
  iu_rtu_pipe0_high_hw_expt,
  iu_rtu_pipe0_iid,
  iu_rtu_pipe0_immu_expt,
  iu_rtu_pipe0_mtval,
  iu_rtu_pipe0_vsetvl,
  iu_rtu_pipe0_vstart,
  iu_rtu_pipe0_vstart_vld,
  iu_rtu_pipe1_cmplt,
  iu_rtu_pipe1_iid,
  iu_rtu_pipe2_abnormal,
  iu_rtu_pipe2_bht_mispred,
  iu_rtu_pipe2_cmplt,
  iu_rtu_pipe2_iid,
  iu_rtu_pipe2_jmp_mispred,
  pad_yy_icg_scan_en,
  rtu_yy_xx_flush,
  special_cbus_ex1_abnormal,
  special_cbus_ex1_bkpt,
  special_cbus_ex1_expt_vec,
  special_cbus_ex1_expt_vld,
  special_cbus_ex1_flush,
  special_cbus_ex1_high_hw_expt,
  special_cbus_ex1_iid,
  special_cbus_ex1_immu_expt,
  special_cbus_ex1_inst_gateclk_vld,
  special_cbus_ex1_inst_vld,
  special_cbus_ex1_mtval,
  special_cbus_ex1_vsetvl,
  special_cbus_ex1_vstart,
  special_cbus_ex1_vstart_vld
);

// &Ports; @27
input           bju_cbus_ex2_pipe2_abnormal;      
input           bju_cbus_ex2_pipe2_bht_mispred;   
input   [6 :0]  bju_cbus_ex2_pipe2_iid;           
input           bju_cbus_ex2_pipe2_jmp_mispred;   
input           bju_cbus_ex2_pipe2_sel;           
input           cp0_iu_ex3_abnormal;              
input   [38:0]  cp0_iu_ex3_efpc;                  
input           cp0_iu_ex3_efpc_vld;              
input   [4 :0]  cp0_iu_ex3_expt_vec;              
input           cp0_iu_ex3_expt_vld;              
input           cp0_iu_ex3_flush;                 
input   [6 :0]  cp0_iu_ex3_iid;                   
input           cp0_iu_ex3_inst_vld;              
input   [31:0]  cp0_iu_ex3_mtval;                 
input           cp0_iu_icg_en;                    
input           cp0_yy_clk_en;                    
input           cpurst_b;                         
input           forever_cpuclk;                   
input           idu_iu_rf_div_sel;                
input           idu_iu_rf_mult_sel;               
input           idu_iu_rf_pipe0_cbus_gateclk_sel; 
input   [6 :0]  idu_iu_rf_pipe0_iid;              
input           idu_iu_rf_pipe0_sel;              
input           idu_iu_rf_pipe1_cbus_gateclk_sel; 
input   [6 :0]  idu_iu_rf_pipe1_iid;              
input           idu_iu_rf_pipe1_sel;              
input           pad_yy_icg_scan_en;               
input           rtu_yy_xx_flush;                  
input           special_cbus_ex1_abnormal;        
input           special_cbus_ex1_bkpt;            
input   [4 :0]  special_cbus_ex1_expt_vec;        
input           special_cbus_ex1_expt_vld;        
input           special_cbus_ex1_flush;           
input           special_cbus_ex1_high_hw_expt;    
input   [6 :0]  special_cbus_ex1_iid;             
input           special_cbus_ex1_immu_expt;       
input           special_cbus_ex1_inst_gateclk_vld; 
input           special_cbus_ex1_inst_vld;        
input   [31:0]  special_cbus_ex1_mtval;           
input           special_cbus_ex1_vsetvl;          
input   [6 :0]  special_cbus_ex1_vstart;          
input           special_cbus_ex1_vstart_vld;      
output          iu_rtu_pipe0_abnormal;            
output          iu_rtu_pipe0_bkpt;                
output          iu_rtu_pipe0_cmplt;               
output  [38:0]  iu_rtu_pipe0_efpc;                
output          iu_rtu_pipe0_efpc_vld;            
output  [4 :0]  iu_rtu_pipe0_expt_vec;            
output          iu_rtu_pipe0_expt_vld;            
output          iu_rtu_pipe0_flush;               
output          iu_rtu_pipe0_high_hw_expt;        
output  [6 :0]  iu_rtu_pipe0_iid;                 
output          iu_rtu_pipe0_immu_expt;           
output  [31:0]  iu_rtu_pipe0_mtval;               
output          iu_rtu_pipe0_vsetvl;              
output  [6 :0]  iu_rtu_pipe0_vstart;              
output          iu_rtu_pipe0_vstart_vld;          
output          iu_rtu_pipe1_cmplt;               
output  [6 :0]  iu_rtu_pipe1_iid;                 
output          iu_rtu_pipe2_abnormal;            
output          iu_rtu_pipe2_bht_mispred;         
output          iu_rtu_pipe2_cmplt;               
output  [6 :0]  iu_rtu_pipe2_iid;                 
output          iu_rtu_pipe2_jmp_mispred;         

// &Regs; @28
reg             cbus_pipe0_abnormal;              
reg             cbus_pipe0_bkpt;                  
reg     [38:0]  cbus_pipe0_efpc;                  
reg             cbus_pipe0_efpc_vld;              
reg     [4 :0]  cbus_pipe0_expt_vec;              
reg             cbus_pipe0_expt_vld;              
reg             cbus_pipe0_flush;                 
reg             cbus_pipe0_high_hw_expt;          
reg     [6 :0]  cbus_pipe0_iid;                   
reg             cbus_pipe0_immu_expt;             
reg             cbus_pipe0_inst_vld;              
reg     [31:0]  cbus_pipe0_mtval;                 
reg             cbus_pipe0_vsetvl;                
reg     [6 :0]  cbus_pipe0_vstart;                
reg             cbus_pipe0_vstart_vld;            
reg     [6 :0]  cbus_pipe1_iid;                   
reg             cbus_pipe1_inst_vld;              

// &Wires; @29
wire            bju_cbus_ex2_pipe2_abnormal;      
wire            bju_cbus_ex2_pipe2_bht_mispred;   
wire    [6 :0]  bju_cbus_ex2_pipe2_iid;           
wire            bju_cbus_ex2_pipe2_jmp_mispred;   
wire            bju_cbus_ex2_pipe2_sel;           
wire            cbus_pipe0_cmplt;                 
wire            cbus_pipe0_gateclk_cmplt;         
wire            cbus_pipe0_gateclk_src_abnormal;  
wire            cbus_pipe0_src_abnormal;          
wire            cbus_pipe0_src_bkpt;              
wire    [38:0]  cbus_pipe0_src_efpc;              
wire            cbus_pipe0_src_efpc_vld;          
wire    [4 :0]  cbus_pipe0_src_expt_vec;          
wire            cbus_pipe0_src_expt_vld;          
wire            cbus_pipe0_src_flush;             
wire            cbus_pipe0_src_high_hw_expt;      
wire    [6 :0]  cbus_pipe0_src_iid;               
wire            cbus_pipe0_src_immu_expt;         
wire    [31:0]  cbus_pipe0_src_mtval;             
wire            cbus_pipe0_src_vsetvl;            
wire    [6 :0]  cbus_pipe0_src_vstart;            
wire            cbus_pipe0_src_vstart_vld;        
wire            cbus_pipe1_cmplt;                 
wire            cbus_pipe1_gateclk_cmplt;         
wire    [6 :0]  cbus_pipe1_src_iid;               
wire            cp0_iu_ex3_abnormal;              
wire    [38:0]  cp0_iu_ex3_efpc;                  
wire            cp0_iu_ex3_efpc_vld;              
wire    [4 :0]  cp0_iu_ex3_expt_vec;              
wire            cp0_iu_ex3_expt_vld;              
wire            cp0_iu_ex3_flush;                 
wire    [6 :0]  cp0_iu_ex3_iid;                   
wire            cp0_iu_ex3_inst_vld;              
wire    [31:0]  cp0_iu_ex3_mtval;                 
wire            cp0_iu_icg_en;                    
wire            cp0_yy_clk_en;                    
wire            cpurst_b;                         
wire            forever_cpuclk;                   
wire            idu_iu_rf_div_sel;                
wire            idu_iu_rf_mult_sel;               
wire            idu_iu_rf_pipe0_cbus_gateclk_sel; 
wire    [6 :0]  idu_iu_rf_pipe0_iid;              
wire            idu_iu_rf_pipe0_sel;              
wire            idu_iu_rf_pipe1_cbus_gateclk_sel; 
wire    [6 :0]  idu_iu_rf_pipe1_iid;              
wire            idu_iu_rf_pipe1_sel;              
wire            inst_vld_clk;                     
wire            inst_vld_clk_en;                  
wire            iu_rtu_pipe0_abnormal;            
wire            iu_rtu_pipe0_bkpt;                
wire            iu_rtu_pipe0_cmplt;               
wire    [38:0]  iu_rtu_pipe0_efpc;                
wire            iu_rtu_pipe0_efpc_vld;            
wire    [4 :0]  iu_rtu_pipe0_expt_vec;            
wire            iu_rtu_pipe0_expt_vld;            
wire            iu_rtu_pipe0_flush;               
wire            iu_rtu_pipe0_high_hw_expt;        
wire    [6 :0]  iu_rtu_pipe0_iid;                 
wire            iu_rtu_pipe0_immu_expt;           
wire    [31:0]  iu_rtu_pipe0_mtval;               
wire            iu_rtu_pipe0_vsetvl;              
wire    [6 :0]  iu_rtu_pipe0_vstart;              
wire            iu_rtu_pipe0_vstart_vld;          
wire            iu_rtu_pipe1_cmplt;               
wire    [6 :0]  iu_rtu_pipe1_iid;                 
wire            iu_rtu_pipe2_abnormal;            
wire            iu_rtu_pipe2_bht_mispred;         
wire            iu_rtu_pipe2_cmplt;               
wire    [6 :0]  iu_rtu_pipe2_iid;                 
wire            iu_rtu_pipe2_jmp_mispred;         
wire            pad_yy_icg_scan_en;               
wire            pipe0_abnormal_clk;               
wire            pipe0_abnormal_clk_en;            
wire            pipe0_data_clk;                   
wire            pipe0_data_clk_en;                
wire            pipe1_data_clk;                   
wire            pipe1_data_clk_en;                
wire            rtu_yy_xx_flush;                  
wire            special_cbus_ex1_abnormal;        
wire            special_cbus_ex1_bkpt;            
wire    [4 :0]  special_cbus_ex1_expt_vec;        
wire            special_cbus_ex1_expt_vld;        
wire            special_cbus_ex1_flush;           
wire            special_cbus_ex1_high_hw_expt;    
wire    [6 :0]  special_cbus_ex1_iid;             
wire            special_cbus_ex1_immu_expt;       
wire            special_cbus_ex1_inst_gateclk_vld; 
wire            special_cbus_ex1_inst_vld;        
wire    [31:0]  special_cbus_ex1_mtval;           
wire            special_cbus_ex1_vsetvl;          
wire    [6 :0]  special_cbus_ex1_vstart;          
wire            special_cbus_ex1_vstart_vld;      



//==========================================================
//                 Instance of Gated Cell  
//==========================================================
assign inst_vld_clk_en = cbus_pipe0_gateclk_cmplt
                         || cbus_pipe1_gateclk_cmplt
                         || cbus_pipe0_inst_vld
                         || cbus_pipe1_inst_vld;
// &Instance("gated_clk_cell", "x_inst_vld_gated_clk"); @39
gated_clk_cell  x_inst_vld_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (inst_vld_clk      ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (inst_vld_clk_en   ),
  .module_en          (cp0_iu_icg_en     ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @40
//          .external_en (1'b0), @41
//          .global_en   (cp0_yy_clk_en), @42
//          .module_en   (cp0_iu_icg_en), @43
//          .local_en    (inst_vld_clk_en), @44
//          .clk_out     (inst_vld_clk)); @45

//==========================================================
//                 Pipe0 Complete Signals
//==========================================================
//----------------------------------------------------------
//              Complete Source Control Signal
//----------------------------------------------------------
assign cbus_pipe0_cmplt         = idu_iu_rf_pipe0_sel
                               || idu_iu_rf_div_sel
                               || special_cbus_ex1_inst_vld
                               || cp0_iu_ex3_inst_vld;
assign cbus_pipe0_gateclk_cmplt = idu_iu_rf_pipe0_cbus_gateclk_sel
                               || special_cbus_ex1_inst_gateclk_vld
                               || cp0_iu_ex3_inst_vld;

//----------------------------------------------------------
//               Complete Instruction Valid
//----------------------------------------------------------
always @(posedge inst_vld_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    cbus_pipe0_inst_vld <= 1'b0;
  else if(rtu_yy_xx_flush)
    cbus_pipe0_inst_vld <= 1'b0;
  else
    cbus_pipe0_inst_vld <= cbus_pipe0_cmplt;
end
//output to RTU
assign iu_rtu_pipe0_cmplt = cbus_pipe0_inst_vld;

//----------------------------------------------------------
//                 Complete Data Selection
//----------------------------------------------------------
assign cbus_pipe0_src_iid[6:0] =
           {7{idu_iu_rf_pipe0_sel}}       & idu_iu_rf_pipe0_iid[6:0]
         | {7{idu_iu_rf_div_sel}}         & idu_iu_rf_pipe0_iid[6:0]
         | {7{special_cbus_ex1_inst_vld}} & special_cbus_ex1_iid[6:0]
         | {7{cp0_iu_ex3_inst_vld}}       & cp0_iu_ex3_iid[6:0];

assign cbus_pipe0_src_abnormal =
              special_cbus_ex1_inst_vld  && special_cbus_ex1_abnormal
         ||   cp0_iu_ex3_inst_vld        && cp0_iu_ex3_abnormal;

assign cbus_pipe0_gateclk_src_abnormal =
              special_cbus_ex1_inst_gateclk_vld && special_cbus_ex1_abnormal
         ||   cp0_iu_ex3_inst_vld               && cp0_iu_ex3_abnormal;

assign cbus_pipe0_src_expt_vld =
              special_cbus_ex1_inst_vld  && special_cbus_ex1_expt_vld
         ||   cp0_iu_ex3_inst_vld        && cp0_iu_ex3_expt_vld;

assign cbus_pipe0_src_expt_vec[4:0] =
           {5{special_cbus_ex1_inst_vld}} & special_cbus_ex1_expt_vec[4:0]
         | {5{cp0_iu_ex3_inst_vld}}       & cp0_iu_ex3_expt_vec[4:0];

assign cbus_pipe0_src_high_hw_expt=
              special_cbus_ex1_inst_vld  && special_cbus_ex1_high_hw_expt;

assign cbus_pipe0_src_bkpt =
              special_cbus_ex1_inst_vld  && special_cbus_ex1_bkpt;

assign cbus_pipe0_src_vsetvl =
              special_cbus_ex1_inst_vld  && special_cbus_ex1_vsetvl;

assign cbus_pipe0_src_vstart_vld =
              special_cbus_ex1_inst_vld  && special_cbus_ex1_vstart_vld;

assign cbus_pipe0_src_vstart[6:0] =
           {7{special_cbus_ex1_inst_vld}} & special_cbus_ex1_vstart[6:0];

assign cbus_pipe0_src_immu_expt =
              special_cbus_ex1_inst_vld  && special_cbus_ex1_immu_expt;

assign cbus_pipe0_src_mtval[31:0] =
           {32{special_cbus_ex1_inst_vld}} & special_cbus_ex1_mtval[31:0]
         | {32{cp0_iu_ex3_inst_vld}}       & cp0_iu_ex3_mtval[31:0];

assign cbus_pipe0_src_flush =
              cp0_iu_ex3_inst_vld        && cp0_iu_ex3_flush
           || special_cbus_ex1_inst_vld  && special_cbus_ex1_flush;

assign cbus_pipe0_src_efpc_vld =
              cp0_iu_ex3_inst_vld        && cp0_iu_ex3_efpc_vld;

assign cbus_pipe0_src_efpc[38:0] =
           {39{cp0_iu_ex3_inst_vld}}      & cp0_iu_ex3_efpc[38:0];

//----------------------------------------------------------
//                 Instance of Gated Cell  
//----------------------------------------------------------
assign pipe0_data_clk_en = cbus_pipe0_gateclk_cmplt;
// &Instance("gated_clk_cell", "x_pipe0_data_gated_clk"); @137
gated_clk_cell  x_pipe0_data_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (pipe0_data_clk    ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (pipe0_data_clk_en ),
  .module_en          (cp0_iu_icg_en     ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @138
//          .external_en (1'b0), @139
//          .global_en   (cp0_yy_clk_en), @140
//          .module_en   (cp0_iu_icg_en), @141
//          .local_en    (pipe0_data_clk_en), @142
//          .clk_out     (pipe0_data_clk)); @143

assign pipe0_abnormal_clk_en = cbus_pipe0_gateclk_cmplt
                               && (cbus_pipe0_gateclk_src_abnormal
                                  || cbus_pipe0_abnormal);
// &Instance("gated_clk_cell", "x_pipe0_abnormal_gated_clk"); @148
gated_clk_cell  x_pipe0_abnormal_gated_clk (
  .clk_in                (forever_cpuclk       ),
  .clk_out               (pipe0_abnormal_clk   ),
  .external_en           (1'b0                 ),
  .global_en             (cp0_yy_clk_en        ),
  .local_en              (pipe0_abnormal_clk_en),
  .module_en             (cp0_iu_icg_en        ),
  .pad_yy_icg_scan_en    (pad_yy_icg_scan_en   )
);

// &Connect(.clk_in      (forever_cpuclk), @149
//          .external_en (1'b0), @150
//          .global_en   (cp0_yy_clk_en), @151
//          .module_en   (cp0_iu_icg_en), @152
//          .local_en    (pipe0_abnormal_clk_en), @153
//          .clk_out     (pipe0_abnormal_clk)); @154

//----------------------------------------------------------
//                   Complete Data
//----------------------------------------------------------
always @(posedge pipe0_data_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    cbus_pipe0_iid[6:0] <= 7'b0;
    cbus_pipe0_abnormal <= 1'b0;
  end
  else if(cbus_pipe0_cmplt) begin
    cbus_pipe0_iid[6:0] <= cbus_pipe0_src_iid[6:0];
    cbus_pipe0_abnormal <= cbus_pipe0_src_abnormal;
  end
  else begin
    cbus_pipe0_iid[6:0] <= cbus_pipe0_iid[6:0];
    cbus_pipe0_abnormal <= cbus_pipe0_abnormal;
  end
end

//power optimization: clock enable only when abnormal complete
always @(posedge pipe0_abnormal_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    cbus_pipe0_expt_vld      <= 1'b0;
    cbus_pipe0_expt_vec[4:0] <= 5'b0;
    cbus_pipe0_high_hw_expt  <= 1'b0;
    cbus_pipe0_bkpt          <= 1'b0;
    cbus_pipe0_vsetvl        <= 1'b0;
    cbus_pipe0_immu_expt     <= 1'b0;
    cbus_pipe0_mtval[31:0]   <= 32'b0;
    cbus_pipe0_flush         <= 1'b0;
    cbus_pipe0_efpc_vld      <= 1'b0;
    cbus_pipe0_efpc[38:0]    <= 39'b0;
    cbus_pipe0_vstart_vld    <= 1'b0;
    cbus_pipe0_vstart[6:0]   <= 7'b0;
  end
  else if(cbus_pipe0_cmplt) begin
    cbus_pipe0_expt_vld      <= cbus_pipe0_src_expt_vld;
    cbus_pipe0_expt_vec[4:0] <= cbus_pipe0_src_expt_vec[4:0];
    cbus_pipe0_high_hw_expt  <= cbus_pipe0_src_high_hw_expt;
    cbus_pipe0_bkpt          <= cbus_pipe0_src_bkpt;
    cbus_pipe0_vsetvl        <= cbus_pipe0_src_vsetvl;
    cbus_pipe0_immu_expt     <= cbus_pipe0_src_immu_expt;
    cbus_pipe0_mtval[31:0]   <= cbus_pipe0_src_mtval[31:0];
    cbus_pipe0_flush         <= cbus_pipe0_src_flush;
    cbus_pipe0_efpc_vld      <= cbus_pipe0_src_efpc_vld;
    cbus_pipe0_efpc[38:0]    <= cbus_pipe0_src_efpc[38:0];
    cbus_pipe0_vstart_vld    <= cbus_pipe0_src_vstart_vld;
    cbus_pipe0_vstart[6:0]   <= cbus_pipe0_src_vstart[6:0];
  end
  else begin
    cbus_pipe0_expt_vld      <= cbus_pipe0_expt_vld;
    cbus_pipe0_expt_vec[4:0] <= cbus_pipe0_expt_vec[4:0];
    cbus_pipe0_high_hw_expt  <= cbus_pipe0_high_hw_expt;
    cbus_pipe0_bkpt          <= cbus_pipe0_bkpt;
    cbus_pipe0_vsetvl        <= cbus_pipe0_vsetvl;
    cbus_pipe0_immu_expt     <= cbus_pipe0_immu_expt;
    cbus_pipe0_mtval[31:0]   <= cbus_pipe0_mtval[31:0];
    cbus_pipe0_flush         <= cbus_pipe0_flush;
    cbus_pipe0_efpc_vld      <= cbus_pipe0_efpc_vld;
    cbus_pipe0_efpc[38:0]    <= cbus_pipe0_efpc[38:0];
    cbus_pipe0_vstart_vld    <= cbus_pipe0_vstart_vld;
    cbus_pipe0_vstart[6:0]   <= cbus_pipe0_vstart[6:0];
  end
end

//output to RTU
assign iu_rtu_pipe0_iid[6:0]      = cbus_pipe0_iid[6:0];
assign iu_rtu_pipe0_abnormal      = cbus_pipe0_abnormal;
assign iu_rtu_pipe0_expt_vld      = cbus_pipe0_expt_vld;
assign iu_rtu_pipe0_expt_vec[4:0] = cbus_pipe0_expt_vec[4:0];
assign iu_rtu_pipe0_high_hw_expt  = cbus_pipe0_high_hw_expt;
assign iu_rtu_pipe0_bkpt          = cbus_pipe0_bkpt;
assign iu_rtu_pipe0_vsetvl        = cbus_pipe0_vsetvl;
assign iu_rtu_pipe0_immu_expt     = cbus_pipe0_immu_expt;
assign iu_rtu_pipe0_mtval[31:0]   = cbus_pipe0_mtval[31:0];
assign iu_rtu_pipe0_flush         = cbus_pipe0_flush;
assign iu_rtu_pipe0_efpc_vld      = cbus_pipe0_efpc_vld;
assign iu_rtu_pipe0_efpc[38:0]    = cbus_pipe0_efpc[38:0];
assign iu_rtu_pipe0_vstart_vld    = cbus_pipe0_vstart_vld;
assign iu_rtu_pipe0_vstart[6:0]   = cbus_pipe0_vstart[6:0];

//==========================================================
//                 Pipe1 Complete Signals
//==========================================================
//----------------------------------------------------------
//              Complete Source Control Signal
//----------------------------------------------------------
assign cbus_pipe1_cmplt         = idu_iu_rf_pipe1_sel
                               || idu_iu_rf_mult_sel;
assign cbus_pipe1_gateclk_cmplt = idu_iu_rf_pipe1_cbus_gateclk_sel;

//----------------------------------------------------------
//               Complete Instruction Valid
//----------------------------------------------------------
always @(posedge inst_vld_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    cbus_pipe1_inst_vld <= 1'b0;
  else if(rtu_yy_xx_flush)
    cbus_pipe1_inst_vld <= 1'b0;
  else
    cbus_pipe1_inst_vld <= cbus_pipe1_cmplt;
end
//output to RTU
assign iu_rtu_pipe1_cmplt = cbus_pipe1_inst_vld;

//----------------------------------------------------------
//                 Complete Data Selection
//----------------------------------------------------------
assign cbus_pipe1_src_iid[6:0] = idu_iu_rf_pipe1_iid[6:0];

//----------------------------------------------------------
//                 Instance of Gated Cell  
//----------------------------------------------------------
assign pipe1_data_clk_en = cbus_pipe1_gateclk_cmplt;
// &Instance("gated_clk_cell", "x_pipe1_data_gated_clk"); @272
gated_clk_cell  x_pipe1_data_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (pipe1_data_clk    ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (pipe1_data_clk_en ),
  .module_en          (cp0_iu_icg_en     ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @273
//          .external_en (1'b0), @274
//          .global_en   (cp0_yy_clk_en), @275
//          .module_en   (cp0_iu_icg_en), @276
//          .local_en    (pipe1_data_clk_en), @277
//          .clk_out     (pipe1_data_clk)); @278

//----------------------------------------------------------
//                   Complete Data
//----------------------------------------------------------
always @(posedge pipe1_data_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    cbus_pipe1_iid[6:0] <= 7'b0;
  else if(cbus_pipe1_cmplt)
    cbus_pipe1_iid[6:0] <= cbus_pipe1_src_iid[6:0];
  else
    cbus_pipe1_iid[6:0] <= cbus_pipe1_iid[6:0];
end

//output to RTU
assign iu_rtu_pipe1_iid[6:0]      = cbus_pipe1_iid[6:0];

//==========================================================
//                 Pipe2 Complete Signals
//==========================================================
//----------------------------------------------------------
//                   Complete Signals
//----------------------------------------------------------
//pipe2 complete signals are flopped by BJU, only rename in cbus
assign iu_rtu_pipe2_cmplt         = bju_cbus_ex2_pipe2_sel;
assign iu_rtu_pipe2_iid[6:0]      = bju_cbus_ex2_pipe2_iid[6:0];
assign iu_rtu_pipe2_abnormal      = bju_cbus_ex2_pipe2_abnormal;
assign iu_rtu_pipe2_jmp_mispred   = bju_cbus_ex2_pipe2_jmp_mispred;
assign iu_rtu_pipe2_bht_mispred   = bju_cbus_ex2_pipe2_bht_mispred;

// &ModuleEnd; @309
endmodule


