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
module ct_vfpu_cbus(
  cp0_vfpu_icg_en,
  cp0_yy_clk_en,
  cpurst_b,
  forever_cpuclk,
  idu_vfpu_rf_pipe6_gateclk_sel,
  idu_vfpu_rf_pipe6_iid,
  idu_vfpu_rf_pipe6_sel,
  idu_vfpu_rf_pipe7_gateclk_sel,
  idu_vfpu_rf_pipe7_iid,
  idu_vfpu_rf_pipe7_sel,
  pad_yy_icg_scan_en,
  rtu_yy_xx_flush,
  vfpu_rtu_pipe6_cmplt,
  vfpu_rtu_pipe6_iid,
  vfpu_rtu_pipe7_cmplt,
  vfpu_rtu_pipe7_iid
);

// &Ports; @23
input          cp0_vfpu_icg_en;              
input          cp0_yy_clk_en;                
input          cpurst_b;                     
input          forever_cpuclk;               
input          idu_vfpu_rf_pipe6_gateclk_sel; 
input   [6:0]  idu_vfpu_rf_pipe6_iid;        
input          idu_vfpu_rf_pipe6_sel;        
input          idu_vfpu_rf_pipe7_gateclk_sel; 
input   [6:0]  idu_vfpu_rf_pipe7_iid;        
input          idu_vfpu_rf_pipe7_sel;        
input          pad_yy_icg_scan_en;           
input          rtu_yy_xx_flush;              
output         vfpu_rtu_pipe6_cmplt;         
output  [6:0]  vfpu_rtu_pipe6_iid;           
output         vfpu_rtu_pipe7_cmplt;         
output  [6:0]  vfpu_rtu_pipe7_iid;           

// &Regs; @24
reg     [6:0]  cbus_pipe6_iid;               
reg            cbus_pipe6_inst_vld;          
reg     [6:0]  cbus_pipe7_iid;               
reg            cbus_pipe7_inst_vld;          

// &Wires; @25
wire           cbus_pipe6_cmplt;             
wire           cbus_pipe6_gateclk_cmplt;     
wire           cbus_pipe7_cmplt;             
wire           cbus_pipe7_gateclk_cmplt;     
wire           cp0_vfpu_icg_en;              
wire           cp0_yy_clk_en;                
wire           cpurst_b;                     
wire           forever_cpuclk;               
wire           idu_vfpu_rf_pipe6_gateclk_sel; 
wire    [6:0]  idu_vfpu_rf_pipe6_iid;        
wire           idu_vfpu_rf_pipe6_sel;        
wire           idu_vfpu_rf_pipe7_gateclk_sel; 
wire    [6:0]  idu_vfpu_rf_pipe7_iid;        
wire           idu_vfpu_rf_pipe7_sel;        
wire           pad_yy_icg_scan_en;           
wire           rtu_yy_xx_flush;              
wire           vfpu_inst_vld_clk;            
wire           vfpu_inst_vld_clk_en;         
wire           vfpu_pipe6_data_clk;          
wire           vfpu_pipe6_data_clk_en;       
wire           vfpu_pipe7_data_clk;          
wire           vfpu_pipe7_data_clk_en;       
wire           vfpu_rtu_pipe6_cmplt;         
wire    [6:0]  vfpu_rtu_pipe6_iid;           
wire           vfpu_rtu_pipe7_cmplt;         
wire    [6:0]  vfpu_rtu_pipe7_iid;           

// &Depend("cpu_cfig.h"); @26
// //&Force("bus","vfpu_yy_xx_expt_en",31,0); @27
//----------------------------------------------------------
//                 Instance of Gated Cell  
//----------------------------------------------------------

assign vfpu_inst_vld_clk_en = cbus_pipe6_gateclk_cmplt
                           || cbus_pipe7_gateclk_cmplt
                           || cbus_pipe6_inst_vld
                           || cbus_pipe7_inst_vld;
// &Instance("gated_clk_cell", "x_vfpu_inst_vld_gated_clk"); @36
gated_clk_cell  x_vfpu_inst_vld_gated_clk (
  .clk_in               (forever_cpuclk      ),
  .clk_out              (vfpu_inst_vld_clk   ),
  .external_en          (1'b0                ),
  .global_en            (cp0_yy_clk_en       ),
  .local_en             (vfpu_inst_vld_clk_en),
  .module_en            (cp0_vfpu_icg_en     ),
  .pad_yy_icg_scan_en   (pad_yy_icg_scan_en  )
);

// &Connect(.clk_in      (forever_cpuclk), @37
//          .external_en (1'b0), @38
//          .global_en   (cp0_yy_clk_en), @39
//          .module_en   (cp0_vfpu_icg_en), @40
//          .local_en    (vfpu_inst_vld_clk_en), @41
//          .clk_out     (vfpu_inst_vld_clk)); @42


//==========================================================
//                 Pipe6 Complete Signals
//==========================================================
assign cbus_pipe6_cmplt         = idu_vfpu_rf_pipe6_sel;
assign cbus_pipe6_gateclk_cmplt = idu_vfpu_rf_pipe6_gateclk_sel;
          
//----------------------------------------------------------
//               Complete Instruction Valid
//----------------------------------------------------------
always @(posedge vfpu_inst_vld_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    cbus_pipe6_inst_vld <= 1'b0;
  else if(rtu_yy_xx_flush)
    cbus_pipe6_inst_vld <= 1'b0;
  else
    cbus_pipe6_inst_vld <= cbus_pipe6_cmplt;
end
//output to RTU
assign vfpu_rtu_pipe6_cmplt = cbus_pipe6_inst_vld;

//----------------------------------------------------------
//                 Instance of Gated Cell  
//----------------------------------------------------------
assign vfpu_pipe6_data_clk_en = cbus_pipe6_gateclk_cmplt;
// &Instance("gated_clk_cell", "x_vfpu_pipe6_data_gated_clk"); @70
gated_clk_cell  x_vfpu_pipe6_data_gated_clk (
  .clk_in                 (forever_cpuclk        ),
  .clk_out                (vfpu_pipe6_data_clk   ),
  .external_en            (1'b0                  ),
  .global_en              (cp0_yy_clk_en         ),
  .local_en               (vfpu_pipe6_data_clk_en),
  .module_en              (cp0_vfpu_icg_en       ),
  .pad_yy_icg_scan_en     (pad_yy_icg_scan_en    )
);

// &Connect(.clk_in      (forever_cpuclk), @71
//          .external_en (1'b0), @72
//          .global_en   (cp0_yy_clk_en), @73
//          .module_en   (cp0_vfpu_icg_en), @74
//          .local_en    (vfpu_pipe6_data_clk_en), @75
//          .clk_out     (vfpu_pipe6_data_clk)); @76

//----------------------------------------------------------
//                   Complete Data
//----------------------------------------------------------
always @(posedge vfpu_pipe6_data_clk or negedge cpurst_b)
begin
  if(!cpurst_b) 
    cbus_pipe6_iid[6:0] <= 7'b0;
  else if(cbus_pipe6_cmplt)
    cbus_pipe6_iid[6:0] <= idu_vfpu_rf_pipe6_iid[6:0];
  else 
    cbus_pipe6_iid[6:0] <= cbus_pipe6_iid[6:0];
end

//output to RTU
assign vfpu_rtu_pipe6_iid[6:0] = cbus_pipe6_iid[6:0];

//==========================================================
//                 Pipe6 Complete Signals
//==========================================================
assign cbus_pipe7_cmplt         = idu_vfpu_rf_pipe7_sel;
assign cbus_pipe7_gateclk_cmplt = idu_vfpu_rf_pipe7_gateclk_sel;
          
//----------------------------------------------------------
//               Complete Instruction Valid
//----------------------------------------------------------
always @(posedge vfpu_inst_vld_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    cbus_pipe7_inst_vld <= 1'b0;
  else if(rtu_yy_xx_flush)
    cbus_pipe7_inst_vld <= 1'b0;
  else
    cbus_pipe7_inst_vld <= cbus_pipe7_cmplt;
end
//output to RTU
assign vfpu_rtu_pipe7_cmplt = cbus_pipe7_inst_vld;

//----------------------------------------------------------
//                 Instance of Gated Cell  
//----------------------------------------------------------
assign vfpu_pipe7_data_clk_en = cbus_pipe7_gateclk_cmplt;
// &Instance("gated_clk_cell", "x_vfpu_pipe7_data_gated_clk"); @119
gated_clk_cell  x_vfpu_pipe7_data_gated_clk (
  .clk_in                 (forever_cpuclk        ),
  .clk_out                (vfpu_pipe7_data_clk   ),
  .external_en            (1'b0                  ),
  .global_en              (cp0_yy_clk_en         ),
  .local_en               (vfpu_pipe7_data_clk_en),
  .module_en              (cp0_vfpu_icg_en       ),
  .pad_yy_icg_scan_en     (pad_yy_icg_scan_en    )
);

// &Connect(.clk_in      (forever_cpuclk), @120
//          .external_en (1'b0), @121
//          .global_en   (cp0_yy_clk_en), @122
//          .module_en   (cp0_vfpu_icg_en), @123
//          .local_en    (vfpu_pipe7_data_clk_en), @124
//          .clk_out     (vfpu_pipe7_data_clk)); @125

//----------------------------------------------------------
//                   Complete Data
//----------------------------------------------------------
always @(posedge vfpu_pipe7_data_clk or negedge cpurst_b)
begin
  if(!cpurst_b) 
    cbus_pipe7_iid[6:0] <= 7'b0;
  else if(cbus_pipe7_cmplt)
    cbus_pipe7_iid[6:0] <= idu_vfpu_rf_pipe7_iid[6:0];
  else 
    cbus_pipe7_iid[6:0] <= cbus_pipe7_iid[6:0];
end

//output to RTU
assign vfpu_rtu_pipe7_iid[6:0] = cbus_pipe7_iid[6:0];

// &ModuleEnd; @143
endmodule


