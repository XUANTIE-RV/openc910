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

// &ModuleBeg; @25
module ct_lsu_idfifo_8(
  cp0_lsu_icg_en,
  cp0_yy_clk_en,
  cpurst_b,
  forever_cpuclk,
  idfifo_clk_en,
  idfifo_create_id,
  idfifo_create_id_oh,
  idfifo_create_vld,
  idfifo_empty,
  idfifo_pop_id_oh,
  idfifo_pop_vld,
  pad_yy_icg_scan_en
);

// &Ports; @26
input          cp0_lsu_icg_en;              
input          cp0_yy_clk_en;               
input          cpurst_b;                    
input          forever_cpuclk;              
input          idfifo_clk_en;               
input   [2:0]  idfifo_create_id;            
input   [7:0]  idfifo_create_id_oh;         
input          idfifo_create_vld;           
input          idfifo_pop_vld;              
input          pad_yy_icg_scan_en;          
output         idfifo_empty;                
output  [7:0]  idfifo_pop_id_oh;            

// &Regs; @27
reg     [3:0]  idfifo_create_ptr;           
reg     [7:0]  idfifo_pop_id_oh;            
reg     [3:0]  idfifo_pop_ptr;              
reg     [3:0]  idfifo_pop_ptr_next;         

// &Wires; @28
wire           cp0_lsu_icg_en;              
wire           cp0_yy_clk_en;               
wire           cpurst_b;                    
wire           forever_cpuclk;              
wire           idfifo_1vld;                 
wire           idfifo_clk;                  
wire           idfifo_clk_en;               
wire    [2:0]  idfifo_create_id;            
wire    [7:0]  idfifo_create_id_oh;         
wire    [7:0]  idfifo_create_ptr_oh;        
wire           idfifo_create_vld;           
wire           idfifo_empty;                
wire    [7:0]  idfifo_entry_create_vld;     
wire    [2:0]  idfifo_entry_id_0;           
wire    [2:0]  idfifo_entry_id_1;           
wire    [2:0]  idfifo_entry_id_2;           
wire    [2:0]  idfifo_entry_id_3;           
wire    [2:0]  idfifo_entry_id_4;           
wire    [2:0]  idfifo_entry_id_5;           
wire    [2:0]  idfifo_entry_id_6;           
wire    [2:0]  idfifo_entry_id_7;           
wire           idfifo_pe_clr_vld;           
wire           idfifo_pe_sel_create_ptr_vld; 
wire    [2:0]  idfifo_pop_id_next;          
wire    [7:0]  idfifo_pop_id_next_oh;       
wire    [7:0]  idfifo_pop_ptr_next_oh;      
wire           idfifo_pop_vld;              
wire           pad_yy_icg_scan_en;          


//==========================================================
//                 Instance of Gated Cell  
//==========================================================
// &Instance("gated_clk_cell", "x_lsu_idfifo_gated_clk"); @33
gated_clk_cell  x_lsu_idfifo_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (idfifo_clk        ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (idfifo_clk_en     ),
  .module_en          (cp0_lsu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in        (forever_cpuclk     ), @34
//          .external_en   (1'b0               ), @35
//          .global_en     (cp0_yy_clk_en      ), @36
//          .module_en     (cp0_lsu_icg_en     ), @37
//          .local_en      (idfifo_clk_en   ), @38
//          .clk_out       (idfifo_clk      )); @39
//==========================================================
//                  Instance FIFO
//==========================================================
// &ConnRule(s/_x$/[0]/); @43
// &ConnRule(s/_v$/_0/); @44
// &Instance("ct_lsu_idfifo_entry","x_ct_lsu_idfifo_0"); @45
ct_lsu_idfifo_entry  x_ct_lsu_idfifo_0 (
  .cpurst_b                   (cpurst_b                  ),
  .idfifo_clk                 (idfifo_clk                ),
  .idfifo_create_id           (idfifo_create_id          ),
  .idfifo_entry_create_vld_x  (idfifo_entry_create_vld[0]),
  .idfifo_entry_id_v          (idfifo_entry_id_0         )
);


// &ConnRule(s/_x$/[1]/); @47
// &ConnRule(s/_v$/_1/); @48
// &Instance("ct_lsu_idfifo_entry","x_ct_lsu_idfifo_1"); @49
ct_lsu_idfifo_entry  x_ct_lsu_idfifo_1 (
  .cpurst_b                   (cpurst_b                  ),
  .idfifo_clk                 (idfifo_clk                ),
  .idfifo_create_id           (idfifo_create_id          ),
  .idfifo_entry_create_vld_x  (idfifo_entry_create_vld[1]),
  .idfifo_entry_id_v          (idfifo_entry_id_1         )
);


// &ConnRule(s/_x$/[2]/); @51
// &ConnRule(s/_v$/_2/); @52
// &Instance("ct_lsu_idfifo_entry","x_ct_lsu_idfifo_2"); @53
ct_lsu_idfifo_entry  x_ct_lsu_idfifo_2 (
  .cpurst_b                   (cpurst_b                  ),
  .idfifo_clk                 (idfifo_clk                ),
  .idfifo_create_id           (idfifo_create_id          ),
  .idfifo_entry_create_vld_x  (idfifo_entry_create_vld[2]),
  .idfifo_entry_id_v          (idfifo_entry_id_2         )
);


// &ConnRule(s/_x$/[3]/); @55
// &ConnRule(s/_v$/_3/); @56
// &Instance("ct_lsu_idfifo_entry","x_ct_lsu_idfifo_3"); @57
ct_lsu_idfifo_entry  x_ct_lsu_idfifo_3 (
  .cpurst_b                   (cpurst_b                  ),
  .idfifo_clk                 (idfifo_clk                ),
  .idfifo_create_id           (idfifo_create_id          ),
  .idfifo_entry_create_vld_x  (idfifo_entry_create_vld[3]),
  .idfifo_entry_id_v          (idfifo_entry_id_3         )
);


// &ConnRule(s/_x$/[4]/); @59
// &ConnRule(s/_v$/_4/); @60
// &Instance("ct_lsu_idfifo_entry","x_ct_lsu_idfifo_4"); @61
ct_lsu_idfifo_entry  x_ct_lsu_idfifo_4 (
  .cpurst_b                   (cpurst_b                  ),
  .idfifo_clk                 (idfifo_clk                ),
  .idfifo_create_id           (idfifo_create_id          ),
  .idfifo_entry_create_vld_x  (idfifo_entry_create_vld[4]),
  .idfifo_entry_id_v          (idfifo_entry_id_4         )
);


// &ConnRule(s/_x$/[5]/); @63
// &ConnRule(s/_v$/_5/); @64
// &Instance("ct_lsu_idfifo_entry","x_ct_lsu_idfifo_5"); @65
ct_lsu_idfifo_entry  x_ct_lsu_idfifo_5 (
  .cpurst_b                   (cpurst_b                  ),
  .idfifo_clk                 (idfifo_clk                ),
  .idfifo_create_id           (idfifo_create_id          ),
  .idfifo_entry_create_vld_x  (idfifo_entry_create_vld[5]),
  .idfifo_entry_id_v          (idfifo_entry_id_5         )
);


// &ConnRule(s/_x$/[6]/); @67
// &ConnRule(s/_v$/_6/); @68
// &Instance("ct_lsu_idfifo_entry","x_ct_lsu_idfifo_6"); @69
ct_lsu_idfifo_entry  x_ct_lsu_idfifo_6 (
  .cpurst_b                   (cpurst_b                  ),
  .idfifo_clk                 (idfifo_clk                ),
  .idfifo_create_id           (idfifo_create_id          ),
  .idfifo_entry_create_vld_x  (idfifo_entry_create_vld[6]),
  .idfifo_entry_id_v          (idfifo_entry_id_6         )
);


// &ConnRule(s/_x$/[7]/); @71
// &ConnRule(s/_v$/_7/); @72
// &Instance("ct_lsu_idfifo_entry","x_ct_lsu_idfifo_7"); @73
ct_lsu_idfifo_entry  x_ct_lsu_idfifo_7 (
  .cpurst_b                   (cpurst_b                  ),
  .idfifo_clk                 (idfifo_clk                ),
  .idfifo_create_id           (idfifo_create_id          ),
  .idfifo_entry_create_vld_x  (idfifo_entry_create_vld[7]),
  .idfifo_entry_id_v          (idfifo_entry_id_7         )
);


//==========================================================
//                  Register
//==========================================================
//------------------pointer---------------------------------
always @(posedge idfifo_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    idfifo_create_ptr[3:0]  <=  4'b0;
  else if(idfifo_create_vld)
    idfifo_create_ptr[3:0]  <=  idfifo_create_ptr[3:0] + 4'b1;
end

always @(posedge idfifo_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
  begin
    idfifo_pop_ptr[3:0]     <=  4'b0;
    idfifo_pop_ptr_next[3:0]<=  4'b1;
  end
  else if(idfifo_pop_vld)
  begin
    idfifo_pop_ptr[3:0]     <=  idfifo_pop_ptr_next[3:0];
    idfifo_pop_ptr_next[3:0]<=  idfifo_pop_ptr_next[3:0] + 4'b1;
  end
end

always @(posedge idfifo_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    idfifo_pop_id_oh[7:0]   <=  8'b0;
  else if(idfifo_pe_clr_vld)
    idfifo_pop_id_oh[7:0]   <=  8'b0;
  else if(idfifo_pe_sel_create_ptr_vld)
    idfifo_pop_id_oh[7:0]   <=  idfifo_create_id_oh[7:0];
  else if(idfifo_pop_vld)
    idfifo_pop_id_oh[7:0]   <=  idfifo_pop_id_next_oh[7:0];
end
//==========================================================
//                    Wires
//==========================================================
//------------------pop entry signal------------------------
assign idfifo_pe_clr_vld  = idfifo_pop_vld
                            &&  !idfifo_create_vld
                            &&  idfifo_1vld;
assign idfifo_pe_sel_create_ptr_vld = idfifo_create_vld
                                      &&  (idfifo_empty
                                          ||  idfifo_1vld
                                              &&  idfifo_pop_vld);
//------------------entry signal----------------------------
assign idfifo_entry_create_vld[7:0] = idfifo_create_ptr_oh[7:0]
                                      & {8{idfifo_create_vld}};
//------------------pointer---------------------------------
//expand to one hot code
// &Instance("ct_rtu_expand_8","x_lsu_idfifo_create_ptr_expand"); @128
ct_rtu_expand_8  x_lsu_idfifo_create_ptr_expand (
  .x_num                     (idfifo_create_ptr[2:0]   ),
  .x_num_expand              (idfifo_create_ptr_oh[7:0])
);

// &Connect( .x_num          (idfifo_create_ptr[2:0]    ), @129
//           .x_num_expand   (idfifo_create_ptr_oh[7:0] )); @130

// &Instance("ct_rtu_expand_8","x_lsu_idfifo_pop_ptr_next_expand"); @132
ct_rtu_expand_8  x_lsu_idfifo_pop_ptr_next_expand (
  .x_num                       (idfifo_pop_ptr_next[2:0]   ),
  .x_num_expand                (idfifo_pop_ptr_next_oh[7:0])
);

// &Connect( .x_num          (idfifo_pop_ptr_next[2:0]       ), @133
//           .x_num_expand   (idfifo_pop_ptr_next_oh[7:0]    )); @134

//-------------------entry valid signal---------------------
// &Force("output","idfifo_empty"); @137
assign idfifo_empty                 = idfifo_create_ptr[3:0]
                                      ==  idfifo_pop_ptr[3:0];
//only 1 entry is valid
assign idfifo_1vld                  = idfifo_create_ptr[3:0]
                                      ==  idfifo_pop_ptr_next[3:0];

//-------------------next pop id----------------------------
assign idfifo_pop_id_next[2:0]  = {3{idfifo_pop_ptr_next_oh[0]}}  & idfifo_entry_id_0[2:0]
                                  | {3{idfifo_pop_ptr_next_oh[1]}}  & idfifo_entry_id_1[2:0]
                                  | {3{idfifo_pop_ptr_next_oh[2]}}  & idfifo_entry_id_2[2:0]
                                  | {3{idfifo_pop_ptr_next_oh[3]}}  & idfifo_entry_id_3[2:0]
                                  | {3{idfifo_pop_ptr_next_oh[4]}}  & idfifo_entry_id_4[2:0]
                                  | {3{idfifo_pop_ptr_next_oh[5]}}  & idfifo_entry_id_5[2:0]
                                  | {3{idfifo_pop_ptr_next_oh[6]}}  & idfifo_entry_id_6[2:0]
                                  | {3{idfifo_pop_ptr_next_oh[7]}}  & idfifo_entry_id_7[2:0];

// &Instance("ct_rtu_expand_8","x_lsu_idfifo_pop_id_next_expand"); @154
ct_rtu_expand_8  x_lsu_idfifo_pop_id_next_expand (
  .x_num                      (idfifo_pop_id_next[2:0]   ),
  .x_num_expand               (idfifo_pop_id_next_oh[7:0])
);

// &Connect( .x_num          (idfifo_pop_id_next[2:0]        ), @155
//           .x_num_expand   (idfifo_pop_id_next_oh[7:0] )); @156

// &ModuleEnd; @158
endmodule


