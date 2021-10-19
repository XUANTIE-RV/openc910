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

// &ModuleBeg; @23
module ct_had_common_dbg_info(
  ciu_had_dbg_info,
  core0_dbg_ack_pc,
  core1_dbg_ack_pc,
  cpurst_b,
  dbgfifo2_data,
  dbgfifo2_read_ren,
  forever_cpuclk,
  l2c_had_dbg_info,
  pad_yy_icg_scan_en
);


// &Ports; @25
input   [292:0]  ciu_had_dbg_info;       
input            core0_dbg_ack_pc;       
input            core1_dbg_ack_pc;       
input            cpurst_b;               
input            dbgfifo2_read_ren;      
input            forever_cpuclk;         
input   [43 :0]  l2c_had_dbg_info;       
input            pad_yy_icg_scan_en;     
output  [63 :0]  dbgfifo2_data;          

// &Regs; @26
reg              dbg_ack_info_f;         
reg     [2  :0]  dbg_rptr;               
reg     [63 :0]  dbginfo_dout;           
reg     [336:0]  xx_dbg_info_reg;        

// &Wires; @27
wire    [292:0]  ciu_had_dbg_info;       
wire             core0_dbg_ack_pc;       
wire             core0_dbg_ack_pc_sync;  
wire             core1_dbg_ack_pc;       
wire             core1_dbg_ack_pc_sync;  
wire             core2_dbg_ack_pc_sync;  
wire             core3_dbg_ack_pc_sync;  
wire             cpurst_b;               
wire             dbg_ack_info;           
wire             dbg_info_record;        
wire             dbg_rptr_done;          
wire    [63 :0]  dbgfifo2_data;          
wire             dbgfifo2_read_ren;      
wire             dbginfo_clk;            
wire             dbginfo_clk_en;         
wire             forever_cpuclk;         
wire             had_dbg_ack_pc;         
wire    [43 :0]  l2c_had_dbg_info;       
wire             pad_yy_icg_scan_en;     
wire    [336:0]  xx_dbg_info;            
wire    [383:0]  xx_dbg_info_reg_padding; 


//==========================================================
//                       DBGINFO ACK
//==========================================================
// &Instance("sync_level2pulse", "x_ct_core0_dbg_ack_pc"); @33
// &Connect(.clk       (forever_cpuclk), @34
//          .rst_b     (cpurst_b), @35
//          .sync_in   (core0_dbg_ack_pc), @36
//          .sync_out  (core0_dbg_ack_pc_sync), @37
//          .sync_ack  (core0_dbg_ack_pc_ack) @38
//         ); @39
assign core0_dbg_ack_pc_sync = core0_dbg_ack_pc;

// &Instance("sync_level2pulse", "x_ct_core1_dbg_ack_pc"); @46
// &Connect(.clk       (forever_cpuclk), @47
//          .rst_b     (cpurst_b), @48
//          .sync_in   (core1_dbg_ack_pc), @49
//          .sync_out  (core1_dbg_ack_pc_sync), @50
//          .sync_ack  (core1_dbg_ack_pc_ack) @51
//         ); @52
assign core1_dbg_ack_pc_sync = core1_dbg_ack_pc;


// &Instance("sync_level2pulse", "x_ct_core2_dbg_ack_pc"); @63
// &Connect(.clk       (forever_cpuclk), @64
//          .rst_b     (cpurst_b), @65
//          .sync_in   (core2_dbg_ack_pc), @66
//          .sync_out  (core2_dbg_ack_pc_sync), @67
//          .sync_ack  (core2_dbg_ack_pc_ack) @68
//         ); @69
assign core2_dbg_ack_pc_sync = 1'b0;

// &Instance("sync_level2pulse", "x_ct_core3_dbg_ack_pc"); @79
// &Connect(.clk       (forever_cpuclk), @80
//          .rst_b     (cpurst_b), @81
//          .sync_in   (core3_dbg_ack_pc), @82
//          .sync_out  (core3_dbg_ack_pc_sync), @83
//          .sync_ack  (core3_dbg_ack_pc_ack) @84
//         ); @85
assign core3_dbg_ack_pc_sync = 1'b0;

assign had_dbg_ack_pc = core0_dbg_ack_pc_sync
                      | core1_dbg_ack_pc_sync
                      | core2_dbg_ack_pc_sync
                      | core3_dbg_ack_pc_sync;


parameter DBG_WIDTH = 64;
parameter DBG_RPTR_WIDTH = 3;
parameter DBG_DEPTH = 6;

//==========================================================
//                    DBGINFO FIFO Read
//==========================================================
//csky vperl_off
wire  [DBG_WIDTH-1:0] dbginfo_reg[DBG_DEPTH-1:0];

genvar i;

generate
  for (i = 0; i < DBG_DEPTH; i = i+1)
  begin: DBG_FIFO
    assign dbginfo_reg[i][DBG_WIDTH-1:0] = xx_dbg_info_reg_padding[DBG_WIDTH*i+:DBG_WIDTH];
  end
endgenerate
//csky vperl_on

always @(posedge dbginfo_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    dbginfo_dout[DBG_WIDTH-1:0] <= {DBG_WIDTH{1'b0}};
//csky vperl_off
  else if (dbgfifo2_read_ren)
    dbginfo_dout[DBG_WIDTH-1:0] <= dbginfo_reg[dbg_rptr[DBG_RPTR_WIDTH-1:0]][DBG_WIDTH-1:0];
//csky vperl_on
  else
    dbginfo_dout[DBG_WIDTH-1:0] <= dbginfo_dout[DBG_WIDTH-1:0];
end

assign dbgfifo2_data[DBG_WIDTH-1:0] = dbginfo_dout[DBG_WIDTH-1:0];

//==========================================================
//                    DBGINFO FIFO Write
//==========================================================
assign dbg_ack_info = had_dbg_ack_pc;

always @ (posedge dbginfo_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    dbg_ack_info_f <= 1'b0;
  else
    dbg_ack_info_f <= dbg_ack_info;
end

assign dbg_info_record = dbg_ack_info && !dbg_ack_info_f;

parameter DBG_INFO_WIDTH = 337;

assign xx_dbg_info[DBG_INFO_WIDTH-1:0] = {
         l2c_had_dbg_info[43:0],
         ciu_had_dbg_info[292:0]
};

always @ (posedge dbginfo_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    xx_dbg_info_reg <= {DBG_INFO_WIDTH{1'b0}};
  else if (dbg_info_record)
    xx_dbg_info_reg <= xx_dbg_info[DBG_INFO_WIDTH-1:0];
end

assign xx_dbg_info_reg_padding[DBG_WIDTH*DBG_DEPTH-1:0] = {
           {(DBG_WIDTH*DBG_DEPTH-DBG_INFO_WIDTH){1'b0}},
           xx_dbg_info_reg[DBG_INFO_WIDTH-1:0]
         };
// &Force("nonport", "xx_dbg_info_reg"); @167
// &Force("nonport", "xx_dbg_info_reg_padding"); @168

//==========================================================
//                DBGINFO FIFO Read Pointer
//==========================================================
always @ (posedge dbginfo_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    dbg_rptr[DBG_RPTR_WIDTH-1:0] <= {DBG_RPTR_WIDTH{1'b0}};
  else if (dbgfifo2_read_ren)
    dbg_rptr[DBG_RPTR_WIDTH-1:0] <= {dbg_rptr[DBG_RPTR_WIDTH-1:0] + 1'b1};
  else if (dbg_rptr_done)
    dbg_rptr[DBG_RPTR_WIDTH-1:0] <= {DBG_RPTR_WIDTH{1'b0}};
end

assign dbg_rptr_done = dbg_rptr[DBG_RPTR_WIDTH-1:0] == DBG_DEPTH;

assign dbginfo_clk_en = dbgfifo2_read_ren
                     || dbg_ack_info
                     || dbg_ack_info_f
                     || dbg_rptr_done;
// &Instance("gated_clk_cell", "x_dbginfo_clk"); @189
gated_clk_cell  x_dbginfo_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (dbginfo_clk       ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (dbginfo_clk_en    ),
  .module_en          (1'b0              ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @190
//          .external_en (1'b0), @191
//          .global_en   (1'b1), @192
//          .module_en   (1'b0), @193
//          .local_en    (dbginfo_clk_en), @194
//          .clk_out     (dbginfo_clk)); @195


// &ModuleEnd; @198
endmodule



