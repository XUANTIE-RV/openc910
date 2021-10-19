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

// &ModuleBeg; @22
module ct_ifu_lbuf_entry(
  cp0_ifu_icg_en,
  cp0_yy_clk_en,
  cpurst_b,
  entry_32_start_x,
  entry_back_br_x,
  entry_bkpta_x,
  entry_bkptb_x,
  entry_create_32_start_x,
  entry_create_back_br_x,
  entry_create_bkpta_x,
  entry_create_bkptb_x,
  entry_create_clk_en_x,
  entry_create_fence_x,
  entry_create_front_br_x,
  entry_create_inst_data_v,
  entry_create_split0_type_v,
  entry_create_split1_type_v,
  entry_create_vl_v,
  entry_create_vlmul_v,
  entry_create_vsetvli_x,
  entry_create_vsew_v,
  entry_create_x,
  entry_fence_x,
  entry_front_br_x,
  entry_inst_data_v,
  entry_split0_type_v,
  entry_split1_type_v,
  entry_vl_v,
  entry_vld_x,
  entry_vlmul_v,
  entry_vsetvli_x,
  entry_vsew_v,
  fill_state_enter,
  forever_cpuclk,
  lbuf_flush,
  pad_yy_icg_scan_en
);

// &Ports; @23
input           cp0_ifu_icg_en;            
input           cp0_yy_clk_en;             
input           cpurst_b;                  
input           entry_create_32_start_x;   
input           entry_create_back_br_x;    
input           entry_create_bkpta_x;      
input           entry_create_bkptb_x;      
input           entry_create_clk_en_x;     
input           entry_create_fence_x;      
input           entry_create_front_br_x;   
input   [15:0]  entry_create_inst_data_v;  
input   [2 :0]  entry_create_split0_type_v; 
input   [2 :0]  entry_create_split1_type_v; 
input   [7 :0]  entry_create_vl_v;         
input   [1 :0]  entry_create_vlmul_v;      
input           entry_create_vsetvli_x;    
input   [2 :0]  entry_create_vsew_v;       
input           entry_create_x;            
input           fill_state_enter;          
input           forever_cpuclk;            
input           lbuf_flush;                
input           pad_yy_icg_scan_en;        
output          entry_32_start_x;          
output          entry_back_br_x;           
output          entry_bkpta_x;             
output          entry_bkptb_x;             
output          entry_fence_x;             
output          entry_front_br_x;          
output  [15:0]  entry_inst_data_v;         
output  [2 :0]  entry_split0_type_v;       
output  [2 :0]  entry_split1_type_v;       
output  [7 :0]  entry_vl_v;                
output          entry_vld_x;               
output  [1 :0]  entry_vlmul_v;             
output          entry_vsetvli_x;           
output  [2 :0]  entry_vsew_v;              

// &Regs; @24
reg             entry_32_start_x;          
reg             entry_back_br_x;           
reg             entry_bkpta_x;             
reg             entry_bkptb_x;             
reg             entry_fence_x;             
reg             entry_front_br_x;          
reg     [15:0]  entry_inst_data_v;         
reg     [2 :0]  entry_split0_type_v;       
reg     [2 :0]  entry_split1_type_v;       
reg     [7 :0]  entry_vl_v;                
reg             entry_vld_x;               
reg     [1 :0]  entry_vlmul_v;             
reg             entry_vsetvli_x;           
reg     [2 :0]  entry_vsew_v;              

// &Wires; @25
wire            cp0_ifu_icg_en;            
wire            cp0_yy_clk_en;             
wire            cpurst_b;                  
wire            entry_create_32_start_x;   
wire            entry_create_back_br_x;    
wire            entry_create_bkpta_x;      
wire            entry_create_bkptb_x;      
wire            entry_create_clk_en_x;     
wire            entry_create_fence_x;      
wire            entry_create_front_br_x;   
wire    [15:0]  entry_create_inst_data_v;  
wire    [2 :0]  entry_create_split0_type_v; 
wire    [2 :0]  entry_create_split1_type_v; 
wire    [7 :0]  entry_create_vl_v;         
wire    [1 :0]  entry_create_vlmul_v;      
wire            entry_create_vsetvli_x;    
wire    [2 :0]  entry_create_vsew_v;       
wire            entry_create_x;            
wire            fill_state_enter;          
wire            forever_cpuclk;            
wire            lbuf_entry_update_clk;     
wire            lbuf_entry_update_clk_en;  
wire            lbuf_flush;                
wire            lbuf_vld_update_clk;       
wire            lbuf_vld_update_clk_en;    
wire            pad_yy_icg_scan_en;        


//==========================================================
//Loop Buffer Entry Fields Description:
//+-----+----------+---------+----------+------+--------+--------+-------+
//| vld | front_br | back_br | 32_start | inst | split1 | split0 | fence |
//+-----+----------+---------+----------+------+--------+--------+-------+
//==========================================================
//vld        means entry valid
//inst[15:0] means the half word inst data
//front_br   means the half is front branch 0
//back_br    means the half is back  branch 0
//32_start   means this half is the start of inst
//split1     decode infor
//split0     decode infor
//fence      decode infor

//==========================================================
//                  Entry Valid Signal
//==========================================================
// &Instance("gated_clk_cell","x_lbuf_vld_update_clk"); @46
gated_clk_cell  x_lbuf_vld_update_clk (
  .clk_in                 (forever_cpuclk        ),
  .clk_out                (lbuf_vld_update_clk   ),
  .external_en            (1'b0                  ),
  .global_en              (cp0_yy_clk_en         ),
  .local_en               (lbuf_vld_update_clk_en),
  .module_en              (cp0_ifu_icg_en        ),
  .pad_yy_icg_scan_en     (pad_yy_icg_scan_en    )
);

// &Connect( .clk_in         (forever_cpuclk), @47
//           .clk_out        (lbuf_vld_update_clk),//Out Clock @48
//           .external_en    (1'b0), @49
//           .global_en      (cp0_yy_clk_en), @50
//           .local_en       (lbuf_vld_update_clk_en),//Local Condition @51
//           .module_en      (cp0_ifu_icg_en) @52
//         ); @53
assign lbuf_vld_update_clk_en = entry_create_clk_en_x || 
                                entry_vld_x;
always @(posedge lbuf_vld_update_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    entry_vld_x <= 1'b0;
  else if(lbuf_flush)
    entry_vld_x <= 1'b0;
  else if(fill_state_enter)
    entry_vld_x <= 1'b0;
  else if(entry_create_x)
    entry_vld_x <= 1'b1;
  else
    entry_vld_x <= entry_vld_x;
end

//==========================================================
//                  Entry Data Signal
//==========================================================
//----------------------Gate Clock--------------------------
// &Instance("gated_clk_cell","x_lbuf_entry_update_clk"); @74
gated_clk_cell  x_lbuf_entry_update_clk (
  .clk_in                   (forever_cpuclk          ),
  .clk_out                  (lbuf_entry_update_clk   ),
  .external_en              (1'b0                    ),
  .global_en                (cp0_yy_clk_en           ),
  .local_en                 (lbuf_entry_update_clk_en),
  .module_en                (cp0_ifu_icg_en          ),
  .pad_yy_icg_scan_en       (pad_yy_icg_scan_en      )
);

// &Connect( .clk_in         (forever_cpuclk), @75
//           .clk_out        (lbuf_entry_update_clk),//Out Clock @76
//           .external_en    (1'b0), @77
//           .global_en      (cp0_yy_clk_en), @78
//           .local_en       (lbuf_entry_update_clk_en),//Local Condition @79
//           .module_en      (cp0_ifu_icg_en) @80
//         ); @81
assign lbuf_entry_update_clk_en = entry_create_clk_en_x;

//--------------------Register Update-----------------------
//_x _v for instance entry convinent
always @(posedge lbuf_entry_update_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
  begin
    entry_inst_data_v[15:0]  <= 16'b0;
    entry_split0_type_v[2:0] <= 3'b0;
    entry_split1_type_v[2:0] <= 3'b0;
    entry_vlmul_v[1:0]       <= 2'b0;
    entry_vsew_v[2:0]        <= 3'b0;
    entry_vl_v[7:0]          <= 8'b0;
    entry_front_br_x         <= 1'b0;
    entry_back_br_x          <= 1'b0;
    entry_fence_x            <= 1'b0;    
    entry_bkpta_x            <= 1'b0;    
    entry_bkptb_x            <= 1'b0;    
    entry_32_start_x         <= 1'b0;
    entry_vsetvli_x          <= 1'b0;
  end
  else if(entry_create_x)
  begin
    entry_inst_data_v[15:0]  <= entry_create_inst_data_v[15:0];
    entry_split0_type_v[2:0] <= entry_create_split0_type_v[2:0]; 
    entry_split1_type_v[2:0] <= entry_create_split1_type_v[2:0];
    entry_vlmul_v[1:0]       <= entry_create_vlmul_v[1:0];
    entry_vsew_v[2:0]        <= entry_create_vsew_v[2:0];
    entry_vl_v[7:0]          <= entry_create_vl_v[7:0];
    entry_front_br_x         <= entry_create_front_br_x;
    entry_back_br_x          <= entry_create_back_br_x;
    entry_fence_x            <= entry_create_fence_x;    
    entry_bkpta_x            <= entry_create_bkpta_x;    
    entry_bkptb_x            <= entry_create_bkptb_x;    
    entry_32_start_x         <= entry_create_32_start_x;
    entry_vsetvli_x          <= entry_create_vsetvli_x;
  end
  else
  begin
    entry_inst_data_v[15:0]  <= entry_inst_data_v[15:0];
    entry_split0_type_v[2:0] <= entry_split0_type_v[2:0];
    entry_split1_type_v[2:0] <= entry_split1_type_v[2:0];
    entry_vlmul_v[1:0]       <= entry_vlmul_v[1:0];
    entry_vsew_v[2:0]        <= entry_vsew_v[2:0];
    entry_vl_v[7:0]          <= entry_vl_v[7:0];
    entry_front_br_x         <= entry_front_br_x;
    entry_back_br_x          <= entry_back_br_x;
    entry_fence_x            <= entry_fence_x;    
    entry_bkpta_x            <= entry_bkpta_x;    
    entry_bkptb_x            <= entry_bkptb_x;    
    entry_32_start_x         <= entry_32_start_x;
    entry_vsetvli_x          <= entry_vsetvli_x;
  end
end


// &Force("output","entry_inst_data_v"); @155
// &Force("output","entry_split0_type_v"); @156
// &Force("output","entry_split1_type_v"); @157
// &Force("output","entry_vlmul_v"); @158
// &Force("output","entry_vsew_v"); @159
// &Force("output","entry_vl_v"); @160
// &Force("output","entry_front_br_x"); @161
// &Force("output","entry_back_br_x"); @162
// &Force("output","entry_fence_x"); @163
// &Force("output","entry_bkpta_x"); @164
// &Force("output","entry_bkptb_x"); @165
// &Force("output","entry_vsetvli_x"); @166
// &Force("output","entry_32_start_x"); @167
// &Force("output","entry_vld_x"); @168

// &ModuleEnd; @170
endmodule


