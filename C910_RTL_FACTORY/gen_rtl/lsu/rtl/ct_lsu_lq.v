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
module ct_lsu_lq(
  cp0_lsu_corr_dis,
  cp0_lsu_icg_en,
  cp0_yy_clk_en,
  cpurst_b,
  forever_cpuclk,
  ld_dc_addr0,
  ld_dc_addr1,
  ld_dc_bytes_vld,
  ld_dc_bytes_vld1,
  ld_dc_chk_ld_addr1_vld,
  ld_dc_iid,
  ld_dc_inst_chk_vld,
  ld_dc_lq_create1_dp_vld,
  ld_dc_lq_create1_gateclk_en,
  ld_dc_lq_create1_vld,
  ld_dc_lq_create_dp_vld,
  ld_dc_lq_create_gateclk_en,
  ld_dc_lq_create_vld,
  ld_dc_secd,
  lq_ld_dc_full,
  lq_ld_dc_inst_hit,
  lq_ld_dc_less2,
  lq_ld_dc_spec_fail,
  lq_st_dc_spec_fail,
  lsu_idu_lq_not_full,
  pad_yy_icg_scan_en,
  rtu_yy_xx_commit0,
  rtu_yy_xx_commit0_iid,
  rtu_yy_xx_commit1,
  rtu_yy_xx_commit1_iid,
  rtu_yy_xx_commit2,
  rtu_yy_xx_commit2_iid,
  rtu_yy_xx_flush,
  st_dc_addr0,
  st_dc_bytes_vld,
  st_dc_chk_st_inst_vld,
  st_dc_chk_statomic_inst_vld,
  st_dc_iid
);

// &Ports; @26
input           cp0_lsu_corr_dis;           
input           cp0_lsu_icg_en;             
input           cp0_yy_clk_en;              
input           cpurst_b;                   
input           forever_cpuclk;             
input   [39:0]  ld_dc_addr0;                
input   [39:0]  ld_dc_addr1;                
input   [15:0]  ld_dc_bytes_vld;            
input   [15:0]  ld_dc_bytes_vld1;           
input           ld_dc_chk_ld_addr1_vld;     
input   [6 :0]  ld_dc_iid;                  
input           ld_dc_inst_chk_vld;         
input           ld_dc_lq_create1_dp_vld;    
input           ld_dc_lq_create1_gateclk_en; 
input           ld_dc_lq_create1_vld;       
input           ld_dc_lq_create_dp_vld;     
input           ld_dc_lq_create_gateclk_en; 
input           ld_dc_lq_create_vld;        
input           ld_dc_secd;                 
input           pad_yy_icg_scan_en;         
input           rtu_yy_xx_commit0;          
input   [6 :0]  rtu_yy_xx_commit0_iid;      
input           rtu_yy_xx_commit1;          
input   [6 :0]  rtu_yy_xx_commit1_iid;      
input           rtu_yy_xx_commit2;          
input   [6 :0]  rtu_yy_xx_commit2_iid;      
input           rtu_yy_xx_flush;            
input   [39:0]  st_dc_addr0;                
input   [15:0]  st_dc_bytes_vld;            
input           st_dc_chk_st_inst_vld;      
input           st_dc_chk_statomic_inst_vld; 
input   [6 :0]  st_dc_iid;                  
output          lq_ld_dc_full;              
output          lq_ld_dc_inst_hit;          
output          lq_ld_dc_less2;             
output          lq_ld_dc_spec_fail;         
output          lq_st_dc_spec_fail;         
output          lsu_idu_lq_not_full;        

// &Regs; @27
reg     [15:0]  lq_create_ptr0;             
reg     [15:0]  lq_create_ptr1;             

// &Wires; @28
wire            cp0_lsu_corr_dis;           
wire            cp0_lsu_icg_en;             
wire            cp0_yy_clk_en;              
wire            cpurst_b;                   
wire            forever_cpuclk;             
wire    [39:0]  ld_dc_addr0;                
wire    [39:0]  ld_dc_addr1;                
wire    [15:0]  ld_dc_bytes_vld;            
wire    [15:0]  ld_dc_bytes_vld1;           
wire            ld_dc_chk_ld_addr1_vld;     
wire    [6 :0]  ld_dc_iid;                  
wire            ld_dc_inst_chk_vld;         
wire            ld_dc_lq_create1_dp_vld;    
wire            ld_dc_lq_create1_gateclk_en; 
wire            ld_dc_lq_create1_vld;       
wire            ld_dc_lq_create_dp_vld;     
wire            ld_dc_lq_create_gateclk_en; 
wire            ld_dc_lq_create_vld;        
wire            ld_dc_secd;                 
wire            lq_clk;                     
wire            lq_clk_en;                  
wire            lq_create1_success;         
wire            lq_create_success;          
wire            lq_empty;                   
wire    [15:0]  lq_entry_create0_dp_vld;    
wire    [15:0]  lq_entry_create0_vld;       
wire    [15:0]  lq_entry_create1_dp_vld;    
wire    [15:0]  lq_entry_create1_gateclk_en; 
wire    [15:0]  lq_entry_create1_vld;       
wire    [15:0]  lq_entry_create_gateclk_en; 
wire    [15:0]  lq_entry_inst_hit;          
wire    [15:0]  lq_entry_rar_spec_fail;     
wire    [15:0]  lq_entry_raw_spec_fail;     
wire    [15:0]  lq_entry_vld;               
wire            lq_full;                    
wire            lq_ld_dc_full;              
wire            lq_ld_dc_inst_hit;          
wire            lq_ld_dc_less2;             
wire            lq_ld_dc_spec_fail;         
wire            lq_st_dc_spec_fail;         
wire            lsu_idu_lq_not_full;        
wire            pad_yy_icg_scan_en;         
wire            rtu_yy_xx_commit0;          
wire    [6 :0]  rtu_yy_xx_commit0_iid;      
wire            rtu_yy_xx_commit1;          
wire    [6 :0]  rtu_yy_xx_commit1_iid;      
wire            rtu_yy_xx_commit2;          
wire    [6 :0]  rtu_yy_xx_commit2_iid;      
wire            rtu_yy_xx_flush;            
wire    [39:0]  st_dc_addr0;                
wire    [15:0]  st_dc_bytes_vld;            
wire            st_dc_chk_st_inst_vld;      
wire            st_dc_chk_statomic_inst_vld; 
wire    [6 :0]  st_dc_iid;                  


parameter LQ_ENTRY  = 16;

//==========================================================
//                 Instance of Gated Cell  
//==========================================================
//if lq has entry or create lq, then this gateclk is on
//lq_clk is used for entry_vld
assign lq_clk_en  = !lq_empty
                    ||  ld_dc_lq_create_gateclk_en;
// &Instance("gated_clk_cell", "x_lsu_lq_gated_clk"); @39
gated_clk_cell  x_lsu_lq_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (lq_clk            ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (lq_clk_en         ),
  .module_en          (cp0_lsu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in        (forever_cpuclk     ), @40
//          .external_en   (1'b0               ), @41
//          .global_en     (cp0_yy_clk_en      ), @42
//          .module_en     (cp0_lsu_icg_en     ), @43
//          .local_en      (lq_clk_en          ), @44
//          .clk_out       (lq_clk             )); @45

//==========================================================
//                 Instance load queue entry
//==========================================================

// &ConnRule(s/_x$/[0]/); @51
// &Instance("ct_lsu_lq_entry","x_ct_lsu_lq_entry_0"); @52
ct_lsu_lq_entry  x_ct_lsu_lq_entry_0 (
  .cp0_lsu_corr_dis               (cp0_lsu_corr_dis              ),
  .cp0_lsu_icg_en                 (cp0_lsu_icg_en                ),
  .cp0_yy_clk_en                  (cp0_yy_clk_en                 ),
  .cpurst_b                       (cpurst_b                      ),
  .forever_cpuclk                 (forever_cpuclk                ),
  .ld_dc_addr0                    (ld_dc_addr0                   ),
  .ld_dc_addr1                    (ld_dc_addr1                   ),
  .ld_dc_bytes_vld                (ld_dc_bytes_vld               ),
  .ld_dc_bytes_vld1               (ld_dc_bytes_vld1              ),
  .ld_dc_chk_ld_addr1_vld         (ld_dc_chk_ld_addr1_vld        ),
  .ld_dc_iid                      (ld_dc_iid                     ),
  .ld_dc_inst_chk_vld             (ld_dc_inst_chk_vld            ),
  .ld_dc_secd                     (ld_dc_secd                    ),
  .lq_clk                         (lq_clk                        ),
  .lq_entry_create0_dp_vld_x      (lq_entry_create0_dp_vld[0]    ),
  .lq_entry_create0_vld_x         (lq_entry_create0_vld[0]       ),
  .lq_entry_create1_dp_vld_x      (lq_entry_create1_dp_vld[0]    ),
  .lq_entry_create1_gateclk_en_x  (lq_entry_create1_gateclk_en[0]),
  .lq_entry_create1_vld_x         (lq_entry_create1_vld[0]       ),
  .lq_entry_create_gateclk_en_x   (lq_entry_create_gateclk_en[0] ),
  .lq_entry_inst_hit_x            (lq_entry_inst_hit[0]          ),
  .lq_entry_rar_spec_fail_x       (lq_entry_rar_spec_fail[0]     ),
  .lq_entry_raw_spec_fail_x       (lq_entry_raw_spec_fail[0]     ),
  .lq_entry_vld_x                 (lq_entry_vld[0]               ),
  .pad_yy_icg_scan_en             (pad_yy_icg_scan_en            ),
  .rtu_yy_xx_commit0              (rtu_yy_xx_commit0             ),
  .rtu_yy_xx_commit0_iid          (rtu_yy_xx_commit0_iid         ),
  .rtu_yy_xx_commit1              (rtu_yy_xx_commit1             ),
  .rtu_yy_xx_commit1_iid          (rtu_yy_xx_commit1_iid         ),
  .rtu_yy_xx_commit2              (rtu_yy_xx_commit2             ),
  .rtu_yy_xx_commit2_iid          (rtu_yy_xx_commit2_iid         ),
  .rtu_yy_xx_flush                (rtu_yy_xx_flush               ),
  .st_dc_addr0                    (st_dc_addr0                   ),
  .st_dc_bytes_vld                (st_dc_bytes_vld               ),
  .st_dc_chk_st_inst_vld          (st_dc_chk_st_inst_vld         ),
  .st_dc_chk_statomic_inst_vld    (st_dc_chk_statomic_inst_vld   ),
  .st_dc_iid                      (st_dc_iid                     )
);


// &ConnRule(s/_x$/[1]/); @54
// &Instance("ct_lsu_lq_entry","x_ct_lsu_lq_entry_1"); @55
ct_lsu_lq_entry  x_ct_lsu_lq_entry_1 (
  .cp0_lsu_corr_dis               (cp0_lsu_corr_dis              ),
  .cp0_lsu_icg_en                 (cp0_lsu_icg_en                ),
  .cp0_yy_clk_en                  (cp0_yy_clk_en                 ),
  .cpurst_b                       (cpurst_b                      ),
  .forever_cpuclk                 (forever_cpuclk                ),
  .ld_dc_addr0                    (ld_dc_addr0                   ),
  .ld_dc_addr1                    (ld_dc_addr1                   ),
  .ld_dc_bytes_vld                (ld_dc_bytes_vld               ),
  .ld_dc_bytes_vld1               (ld_dc_bytes_vld1              ),
  .ld_dc_chk_ld_addr1_vld         (ld_dc_chk_ld_addr1_vld        ),
  .ld_dc_iid                      (ld_dc_iid                     ),
  .ld_dc_inst_chk_vld             (ld_dc_inst_chk_vld            ),
  .ld_dc_secd                     (ld_dc_secd                    ),
  .lq_clk                         (lq_clk                        ),
  .lq_entry_create0_dp_vld_x      (lq_entry_create0_dp_vld[1]    ),
  .lq_entry_create0_vld_x         (lq_entry_create0_vld[1]       ),
  .lq_entry_create1_dp_vld_x      (lq_entry_create1_dp_vld[1]    ),
  .lq_entry_create1_gateclk_en_x  (lq_entry_create1_gateclk_en[1]),
  .lq_entry_create1_vld_x         (lq_entry_create1_vld[1]       ),
  .lq_entry_create_gateclk_en_x   (lq_entry_create_gateclk_en[1] ),
  .lq_entry_inst_hit_x            (lq_entry_inst_hit[1]          ),
  .lq_entry_rar_spec_fail_x       (lq_entry_rar_spec_fail[1]     ),
  .lq_entry_raw_spec_fail_x       (lq_entry_raw_spec_fail[1]     ),
  .lq_entry_vld_x                 (lq_entry_vld[1]               ),
  .pad_yy_icg_scan_en             (pad_yy_icg_scan_en            ),
  .rtu_yy_xx_commit0              (rtu_yy_xx_commit0             ),
  .rtu_yy_xx_commit0_iid          (rtu_yy_xx_commit0_iid         ),
  .rtu_yy_xx_commit1              (rtu_yy_xx_commit1             ),
  .rtu_yy_xx_commit1_iid          (rtu_yy_xx_commit1_iid         ),
  .rtu_yy_xx_commit2              (rtu_yy_xx_commit2             ),
  .rtu_yy_xx_commit2_iid          (rtu_yy_xx_commit2_iid         ),
  .rtu_yy_xx_flush                (rtu_yy_xx_flush               ),
  .st_dc_addr0                    (st_dc_addr0                   ),
  .st_dc_bytes_vld                (st_dc_bytes_vld               ),
  .st_dc_chk_st_inst_vld          (st_dc_chk_st_inst_vld         ),
  .st_dc_chk_statomic_inst_vld    (st_dc_chk_statomic_inst_vld   ),
  .st_dc_iid                      (st_dc_iid                     )
);


// &ConnRule(s/_x$/[2]/); @57
// &Instance("ct_lsu_lq_entry","x_ct_lsu_lq_entry_2"); @58
ct_lsu_lq_entry  x_ct_lsu_lq_entry_2 (
  .cp0_lsu_corr_dis               (cp0_lsu_corr_dis              ),
  .cp0_lsu_icg_en                 (cp0_lsu_icg_en                ),
  .cp0_yy_clk_en                  (cp0_yy_clk_en                 ),
  .cpurst_b                       (cpurst_b                      ),
  .forever_cpuclk                 (forever_cpuclk                ),
  .ld_dc_addr0                    (ld_dc_addr0                   ),
  .ld_dc_addr1                    (ld_dc_addr1                   ),
  .ld_dc_bytes_vld                (ld_dc_bytes_vld               ),
  .ld_dc_bytes_vld1               (ld_dc_bytes_vld1              ),
  .ld_dc_chk_ld_addr1_vld         (ld_dc_chk_ld_addr1_vld        ),
  .ld_dc_iid                      (ld_dc_iid                     ),
  .ld_dc_inst_chk_vld             (ld_dc_inst_chk_vld            ),
  .ld_dc_secd                     (ld_dc_secd                    ),
  .lq_clk                         (lq_clk                        ),
  .lq_entry_create0_dp_vld_x      (lq_entry_create0_dp_vld[2]    ),
  .lq_entry_create0_vld_x         (lq_entry_create0_vld[2]       ),
  .lq_entry_create1_dp_vld_x      (lq_entry_create1_dp_vld[2]    ),
  .lq_entry_create1_gateclk_en_x  (lq_entry_create1_gateclk_en[2]),
  .lq_entry_create1_vld_x         (lq_entry_create1_vld[2]       ),
  .lq_entry_create_gateclk_en_x   (lq_entry_create_gateclk_en[2] ),
  .lq_entry_inst_hit_x            (lq_entry_inst_hit[2]          ),
  .lq_entry_rar_spec_fail_x       (lq_entry_rar_spec_fail[2]     ),
  .lq_entry_raw_spec_fail_x       (lq_entry_raw_spec_fail[2]     ),
  .lq_entry_vld_x                 (lq_entry_vld[2]               ),
  .pad_yy_icg_scan_en             (pad_yy_icg_scan_en            ),
  .rtu_yy_xx_commit0              (rtu_yy_xx_commit0             ),
  .rtu_yy_xx_commit0_iid          (rtu_yy_xx_commit0_iid         ),
  .rtu_yy_xx_commit1              (rtu_yy_xx_commit1             ),
  .rtu_yy_xx_commit1_iid          (rtu_yy_xx_commit1_iid         ),
  .rtu_yy_xx_commit2              (rtu_yy_xx_commit2             ),
  .rtu_yy_xx_commit2_iid          (rtu_yy_xx_commit2_iid         ),
  .rtu_yy_xx_flush                (rtu_yy_xx_flush               ),
  .st_dc_addr0                    (st_dc_addr0                   ),
  .st_dc_bytes_vld                (st_dc_bytes_vld               ),
  .st_dc_chk_st_inst_vld          (st_dc_chk_st_inst_vld         ),
  .st_dc_chk_statomic_inst_vld    (st_dc_chk_statomic_inst_vld   ),
  .st_dc_iid                      (st_dc_iid                     )
);


// &ConnRule(s/_x$/[3]/); @60
// &Instance("ct_lsu_lq_entry","x_ct_lsu_lq_entry_3"); @61
ct_lsu_lq_entry  x_ct_lsu_lq_entry_3 (
  .cp0_lsu_corr_dis               (cp0_lsu_corr_dis              ),
  .cp0_lsu_icg_en                 (cp0_lsu_icg_en                ),
  .cp0_yy_clk_en                  (cp0_yy_clk_en                 ),
  .cpurst_b                       (cpurst_b                      ),
  .forever_cpuclk                 (forever_cpuclk                ),
  .ld_dc_addr0                    (ld_dc_addr0                   ),
  .ld_dc_addr1                    (ld_dc_addr1                   ),
  .ld_dc_bytes_vld                (ld_dc_bytes_vld               ),
  .ld_dc_bytes_vld1               (ld_dc_bytes_vld1              ),
  .ld_dc_chk_ld_addr1_vld         (ld_dc_chk_ld_addr1_vld        ),
  .ld_dc_iid                      (ld_dc_iid                     ),
  .ld_dc_inst_chk_vld             (ld_dc_inst_chk_vld            ),
  .ld_dc_secd                     (ld_dc_secd                    ),
  .lq_clk                         (lq_clk                        ),
  .lq_entry_create0_dp_vld_x      (lq_entry_create0_dp_vld[3]    ),
  .lq_entry_create0_vld_x         (lq_entry_create0_vld[3]       ),
  .lq_entry_create1_dp_vld_x      (lq_entry_create1_dp_vld[3]    ),
  .lq_entry_create1_gateclk_en_x  (lq_entry_create1_gateclk_en[3]),
  .lq_entry_create1_vld_x         (lq_entry_create1_vld[3]       ),
  .lq_entry_create_gateclk_en_x   (lq_entry_create_gateclk_en[3] ),
  .lq_entry_inst_hit_x            (lq_entry_inst_hit[3]          ),
  .lq_entry_rar_spec_fail_x       (lq_entry_rar_spec_fail[3]     ),
  .lq_entry_raw_spec_fail_x       (lq_entry_raw_spec_fail[3]     ),
  .lq_entry_vld_x                 (lq_entry_vld[3]               ),
  .pad_yy_icg_scan_en             (pad_yy_icg_scan_en            ),
  .rtu_yy_xx_commit0              (rtu_yy_xx_commit0             ),
  .rtu_yy_xx_commit0_iid          (rtu_yy_xx_commit0_iid         ),
  .rtu_yy_xx_commit1              (rtu_yy_xx_commit1             ),
  .rtu_yy_xx_commit1_iid          (rtu_yy_xx_commit1_iid         ),
  .rtu_yy_xx_commit2              (rtu_yy_xx_commit2             ),
  .rtu_yy_xx_commit2_iid          (rtu_yy_xx_commit2_iid         ),
  .rtu_yy_xx_flush                (rtu_yy_xx_flush               ),
  .st_dc_addr0                    (st_dc_addr0                   ),
  .st_dc_bytes_vld                (st_dc_bytes_vld               ),
  .st_dc_chk_st_inst_vld          (st_dc_chk_st_inst_vld         ),
  .st_dc_chk_statomic_inst_vld    (st_dc_chk_statomic_inst_vld   ),
  .st_dc_iid                      (st_dc_iid                     )
);


// &ConnRule(s/_x$/[4]/); @63
// &Instance("ct_lsu_lq_entry","x_ct_lsu_lq_entry_4"); @64
ct_lsu_lq_entry  x_ct_lsu_lq_entry_4 (
  .cp0_lsu_corr_dis               (cp0_lsu_corr_dis              ),
  .cp0_lsu_icg_en                 (cp0_lsu_icg_en                ),
  .cp0_yy_clk_en                  (cp0_yy_clk_en                 ),
  .cpurst_b                       (cpurst_b                      ),
  .forever_cpuclk                 (forever_cpuclk                ),
  .ld_dc_addr0                    (ld_dc_addr0                   ),
  .ld_dc_addr1                    (ld_dc_addr1                   ),
  .ld_dc_bytes_vld                (ld_dc_bytes_vld               ),
  .ld_dc_bytes_vld1               (ld_dc_bytes_vld1              ),
  .ld_dc_chk_ld_addr1_vld         (ld_dc_chk_ld_addr1_vld        ),
  .ld_dc_iid                      (ld_dc_iid                     ),
  .ld_dc_inst_chk_vld             (ld_dc_inst_chk_vld            ),
  .ld_dc_secd                     (ld_dc_secd                    ),
  .lq_clk                         (lq_clk                        ),
  .lq_entry_create0_dp_vld_x      (lq_entry_create0_dp_vld[4]    ),
  .lq_entry_create0_vld_x         (lq_entry_create0_vld[4]       ),
  .lq_entry_create1_dp_vld_x      (lq_entry_create1_dp_vld[4]    ),
  .lq_entry_create1_gateclk_en_x  (lq_entry_create1_gateclk_en[4]),
  .lq_entry_create1_vld_x         (lq_entry_create1_vld[4]       ),
  .lq_entry_create_gateclk_en_x   (lq_entry_create_gateclk_en[4] ),
  .lq_entry_inst_hit_x            (lq_entry_inst_hit[4]          ),
  .lq_entry_rar_spec_fail_x       (lq_entry_rar_spec_fail[4]     ),
  .lq_entry_raw_spec_fail_x       (lq_entry_raw_spec_fail[4]     ),
  .lq_entry_vld_x                 (lq_entry_vld[4]               ),
  .pad_yy_icg_scan_en             (pad_yy_icg_scan_en            ),
  .rtu_yy_xx_commit0              (rtu_yy_xx_commit0             ),
  .rtu_yy_xx_commit0_iid          (rtu_yy_xx_commit0_iid         ),
  .rtu_yy_xx_commit1              (rtu_yy_xx_commit1             ),
  .rtu_yy_xx_commit1_iid          (rtu_yy_xx_commit1_iid         ),
  .rtu_yy_xx_commit2              (rtu_yy_xx_commit2             ),
  .rtu_yy_xx_commit2_iid          (rtu_yy_xx_commit2_iid         ),
  .rtu_yy_xx_flush                (rtu_yy_xx_flush               ),
  .st_dc_addr0                    (st_dc_addr0                   ),
  .st_dc_bytes_vld                (st_dc_bytes_vld               ),
  .st_dc_chk_st_inst_vld          (st_dc_chk_st_inst_vld         ),
  .st_dc_chk_statomic_inst_vld    (st_dc_chk_statomic_inst_vld   ),
  .st_dc_iid                      (st_dc_iid                     )
);


// &ConnRule(s/_x$/[5]/); @66
// &Instance("ct_lsu_lq_entry","x_ct_lsu_lq_entry_5"); @67
ct_lsu_lq_entry  x_ct_lsu_lq_entry_5 (
  .cp0_lsu_corr_dis               (cp0_lsu_corr_dis              ),
  .cp0_lsu_icg_en                 (cp0_lsu_icg_en                ),
  .cp0_yy_clk_en                  (cp0_yy_clk_en                 ),
  .cpurst_b                       (cpurst_b                      ),
  .forever_cpuclk                 (forever_cpuclk                ),
  .ld_dc_addr0                    (ld_dc_addr0                   ),
  .ld_dc_addr1                    (ld_dc_addr1                   ),
  .ld_dc_bytes_vld                (ld_dc_bytes_vld               ),
  .ld_dc_bytes_vld1               (ld_dc_bytes_vld1              ),
  .ld_dc_chk_ld_addr1_vld         (ld_dc_chk_ld_addr1_vld        ),
  .ld_dc_iid                      (ld_dc_iid                     ),
  .ld_dc_inst_chk_vld             (ld_dc_inst_chk_vld            ),
  .ld_dc_secd                     (ld_dc_secd                    ),
  .lq_clk                         (lq_clk                        ),
  .lq_entry_create0_dp_vld_x      (lq_entry_create0_dp_vld[5]    ),
  .lq_entry_create0_vld_x         (lq_entry_create0_vld[5]       ),
  .lq_entry_create1_dp_vld_x      (lq_entry_create1_dp_vld[5]    ),
  .lq_entry_create1_gateclk_en_x  (lq_entry_create1_gateclk_en[5]),
  .lq_entry_create1_vld_x         (lq_entry_create1_vld[5]       ),
  .lq_entry_create_gateclk_en_x   (lq_entry_create_gateclk_en[5] ),
  .lq_entry_inst_hit_x            (lq_entry_inst_hit[5]          ),
  .lq_entry_rar_spec_fail_x       (lq_entry_rar_spec_fail[5]     ),
  .lq_entry_raw_spec_fail_x       (lq_entry_raw_spec_fail[5]     ),
  .lq_entry_vld_x                 (lq_entry_vld[5]               ),
  .pad_yy_icg_scan_en             (pad_yy_icg_scan_en            ),
  .rtu_yy_xx_commit0              (rtu_yy_xx_commit0             ),
  .rtu_yy_xx_commit0_iid          (rtu_yy_xx_commit0_iid         ),
  .rtu_yy_xx_commit1              (rtu_yy_xx_commit1             ),
  .rtu_yy_xx_commit1_iid          (rtu_yy_xx_commit1_iid         ),
  .rtu_yy_xx_commit2              (rtu_yy_xx_commit2             ),
  .rtu_yy_xx_commit2_iid          (rtu_yy_xx_commit2_iid         ),
  .rtu_yy_xx_flush                (rtu_yy_xx_flush               ),
  .st_dc_addr0                    (st_dc_addr0                   ),
  .st_dc_bytes_vld                (st_dc_bytes_vld               ),
  .st_dc_chk_st_inst_vld          (st_dc_chk_st_inst_vld         ),
  .st_dc_chk_statomic_inst_vld    (st_dc_chk_statomic_inst_vld   ),
  .st_dc_iid                      (st_dc_iid                     )
);


// &ConnRule(s/_x$/[6]/); @69
// &Instance("ct_lsu_lq_entry","x_ct_lsu_lq_entry_6"); @70
ct_lsu_lq_entry  x_ct_lsu_lq_entry_6 (
  .cp0_lsu_corr_dis               (cp0_lsu_corr_dis              ),
  .cp0_lsu_icg_en                 (cp0_lsu_icg_en                ),
  .cp0_yy_clk_en                  (cp0_yy_clk_en                 ),
  .cpurst_b                       (cpurst_b                      ),
  .forever_cpuclk                 (forever_cpuclk                ),
  .ld_dc_addr0                    (ld_dc_addr0                   ),
  .ld_dc_addr1                    (ld_dc_addr1                   ),
  .ld_dc_bytes_vld                (ld_dc_bytes_vld               ),
  .ld_dc_bytes_vld1               (ld_dc_bytes_vld1              ),
  .ld_dc_chk_ld_addr1_vld         (ld_dc_chk_ld_addr1_vld        ),
  .ld_dc_iid                      (ld_dc_iid                     ),
  .ld_dc_inst_chk_vld             (ld_dc_inst_chk_vld            ),
  .ld_dc_secd                     (ld_dc_secd                    ),
  .lq_clk                         (lq_clk                        ),
  .lq_entry_create0_dp_vld_x      (lq_entry_create0_dp_vld[6]    ),
  .lq_entry_create0_vld_x         (lq_entry_create0_vld[6]       ),
  .lq_entry_create1_dp_vld_x      (lq_entry_create1_dp_vld[6]    ),
  .lq_entry_create1_gateclk_en_x  (lq_entry_create1_gateclk_en[6]),
  .lq_entry_create1_vld_x         (lq_entry_create1_vld[6]       ),
  .lq_entry_create_gateclk_en_x   (lq_entry_create_gateclk_en[6] ),
  .lq_entry_inst_hit_x            (lq_entry_inst_hit[6]          ),
  .lq_entry_rar_spec_fail_x       (lq_entry_rar_spec_fail[6]     ),
  .lq_entry_raw_spec_fail_x       (lq_entry_raw_spec_fail[6]     ),
  .lq_entry_vld_x                 (lq_entry_vld[6]               ),
  .pad_yy_icg_scan_en             (pad_yy_icg_scan_en            ),
  .rtu_yy_xx_commit0              (rtu_yy_xx_commit0             ),
  .rtu_yy_xx_commit0_iid          (rtu_yy_xx_commit0_iid         ),
  .rtu_yy_xx_commit1              (rtu_yy_xx_commit1             ),
  .rtu_yy_xx_commit1_iid          (rtu_yy_xx_commit1_iid         ),
  .rtu_yy_xx_commit2              (rtu_yy_xx_commit2             ),
  .rtu_yy_xx_commit2_iid          (rtu_yy_xx_commit2_iid         ),
  .rtu_yy_xx_flush                (rtu_yy_xx_flush               ),
  .st_dc_addr0                    (st_dc_addr0                   ),
  .st_dc_bytes_vld                (st_dc_bytes_vld               ),
  .st_dc_chk_st_inst_vld          (st_dc_chk_st_inst_vld         ),
  .st_dc_chk_statomic_inst_vld    (st_dc_chk_statomic_inst_vld   ),
  .st_dc_iid                      (st_dc_iid                     )
);


// &ConnRule(s/_x$/[7]/); @72
// &Instance("ct_lsu_lq_entry","x_ct_lsu_lq_entry_7"); @73
ct_lsu_lq_entry  x_ct_lsu_lq_entry_7 (
  .cp0_lsu_corr_dis               (cp0_lsu_corr_dis              ),
  .cp0_lsu_icg_en                 (cp0_lsu_icg_en                ),
  .cp0_yy_clk_en                  (cp0_yy_clk_en                 ),
  .cpurst_b                       (cpurst_b                      ),
  .forever_cpuclk                 (forever_cpuclk                ),
  .ld_dc_addr0                    (ld_dc_addr0                   ),
  .ld_dc_addr1                    (ld_dc_addr1                   ),
  .ld_dc_bytes_vld                (ld_dc_bytes_vld               ),
  .ld_dc_bytes_vld1               (ld_dc_bytes_vld1              ),
  .ld_dc_chk_ld_addr1_vld         (ld_dc_chk_ld_addr1_vld        ),
  .ld_dc_iid                      (ld_dc_iid                     ),
  .ld_dc_inst_chk_vld             (ld_dc_inst_chk_vld            ),
  .ld_dc_secd                     (ld_dc_secd                    ),
  .lq_clk                         (lq_clk                        ),
  .lq_entry_create0_dp_vld_x      (lq_entry_create0_dp_vld[7]    ),
  .lq_entry_create0_vld_x         (lq_entry_create0_vld[7]       ),
  .lq_entry_create1_dp_vld_x      (lq_entry_create1_dp_vld[7]    ),
  .lq_entry_create1_gateclk_en_x  (lq_entry_create1_gateclk_en[7]),
  .lq_entry_create1_vld_x         (lq_entry_create1_vld[7]       ),
  .lq_entry_create_gateclk_en_x   (lq_entry_create_gateclk_en[7] ),
  .lq_entry_inst_hit_x            (lq_entry_inst_hit[7]          ),
  .lq_entry_rar_spec_fail_x       (lq_entry_rar_spec_fail[7]     ),
  .lq_entry_raw_spec_fail_x       (lq_entry_raw_spec_fail[7]     ),
  .lq_entry_vld_x                 (lq_entry_vld[7]               ),
  .pad_yy_icg_scan_en             (pad_yy_icg_scan_en            ),
  .rtu_yy_xx_commit0              (rtu_yy_xx_commit0             ),
  .rtu_yy_xx_commit0_iid          (rtu_yy_xx_commit0_iid         ),
  .rtu_yy_xx_commit1              (rtu_yy_xx_commit1             ),
  .rtu_yy_xx_commit1_iid          (rtu_yy_xx_commit1_iid         ),
  .rtu_yy_xx_commit2              (rtu_yy_xx_commit2             ),
  .rtu_yy_xx_commit2_iid          (rtu_yy_xx_commit2_iid         ),
  .rtu_yy_xx_flush                (rtu_yy_xx_flush               ),
  .st_dc_addr0                    (st_dc_addr0                   ),
  .st_dc_bytes_vld                (st_dc_bytes_vld               ),
  .st_dc_chk_st_inst_vld          (st_dc_chk_st_inst_vld         ),
  .st_dc_chk_statomic_inst_vld    (st_dc_chk_statomic_inst_vld   ),
  .st_dc_iid                      (st_dc_iid                     )
);


// &ConnRule(s/_x$/[8]/); @75
// &Instance("ct_lsu_lq_entry","x_ct_lsu_lq_entry_8"); @76
ct_lsu_lq_entry  x_ct_lsu_lq_entry_8 (
  .cp0_lsu_corr_dis               (cp0_lsu_corr_dis              ),
  .cp0_lsu_icg_en                 (cp0_lsu_icg_en                ),
  .cp0_yy_clk_en                  (cp0_yy_clk_en                 ),
  .cpurst_b                       (cpurst_b                      ),
  .forever_cpuclk                 (forever_cpuclk                ),
  .ld_dc_addr0                    (ld_dc_addr0                   ),
  .ld_dc_addr1                    (ld_dc_addr1                   ),
  .ld_dc_bytes_vld                (ld_dc_bytes_vld               ),
  .ld_dc_bytes_vld1               (ld_dc_bytes_vld1              ),
  .ld_dc_chk_ld_addr1_vld         (ld_dc_chk_ld_addr1_vld        ),
  .ld_dc_iid                      (ld_dc_iid                     ),
  .ld_dc_inst_chk_vld             (ld_dc_inst_chk_vld            ),
  .ld_dc_secd                     (ld_dc_secd                    ),
  .lq_clk                         (lq_clk                        ),
  .lq_entry_create0_dp_vld_x      (lq_entry_create0_dp_vld[8]    ),
  .lq_entry_create0_vld_x         (lq_entry_create0_vld[8]       ),
  .lq_entry_create1_dp_vld_x      (lq_entry_create1_dp_vld[8]    ),
  .lq_entry_create1_gateclk_en_x  (lq_entry_create1_gateclk_en[8]),
  .lq_entry_create1_vld_x         (lq_entry_create1_vld[8]       ),
  .lq_entry_create_gateclk_en_x   (lq_entry_create_gateclk_en[8] ),
  .lq_entry_inst_hit_x            (lq_entry_inst_hit[8]          ),
  .lq_entry_rar_spec_fail_x       (lq_entry_rar_spec_fail[8]     ),
  .lq_entry_raw_spec_fail_x       (lq_entry_raw_spec_fail[8]     ),
  .lq_entry_vld_x                 (lq_entry_vld[8]               ),
  .pad_yy_icg_scan_en             (pad_yy_icg_scan_en            ),
  .rtu_yy_xx_commit0              (rtu_yy_xx_commit0             ),
  .rtu_yy_xx_commit0_iid          (rtu_yy_xx_commit0_iid         ),
  .rtu_yy_xx_commit1              (rtu_yy_xx_commit1             ),
  .rtu_yy_xx_commit1_iid          (rtu_yy_xx_commit1_iid         ),
  .rtu_yy_xx_commit2              (rtu_yy_xx_commit2             ),
  .rtu_yy_xx_commit2_iid          (rtu_yy_xx_commit2_iid         ),
  .rtu_yy_xx_flush                (rtu_yy_xx_flush               ),
  .st_dc_addr0                    (st_dc_addr0                   ),
  .st_dc_bytes_vld                (st_dc_bytes_vld               ),
  .st_dc_chk_st_inst_vld          (st_dc_chk_st_inst_vld         ),
  .st_dc_chk_statomic_inst_vld    (st_dc_chk_statomic_inst_vld   ),
  .st_dc_iid                      (st_dc_iid                     )
);


// &ConnRule(s/_x$/[9]/); @78
// &Instance("ct_lsu_lq_entry","x_ct_lsu_lq_entry_9"); @79
ct_lsu_lq_entry  x_ct_lsu_lq_entry_9 (
  .cp0_lsu_corr_dis               (cp0_lsu_corr_dis              ),
  .cp0_lsu_icg_en                 (cp0_lsu_icg_en                ),
  .cp0_yy_clk_en                  (cp0_yy_clk_en                 ),
  .cpurst_b                       (cpurst_b                      ),
  .forever_cpuclk                 (forever_cpuclk                ),
  .ld_dc_addr0                    (ld_dc_addr0                   ),
  .ld_dc_addr1                    (ld_dc_addr1                   ),
  .ld_dc_bytes_vld                (ld_dc_bytes_vld               ),
  .ld_dc_bytes_vld1               (ld_dc_bytes_vld1              ),
  .ld_dc_chk_ld_addr1_vld         (ld_dc_chk_ld_addr1_vld        ),
  .ld_dc_iid                      (ld_dc_iid                     ),
  .ld_dc_inst_chk_vld             (ld_dc_inst_chk_vld            ),
  .ld_dc_secd                     (ld_dc_secd                    ),
  .lq_clk                         (lq_clk                        ),
  .lq_entry_create0_dp_vld_x      (lq_entry_create0_dp_vld[9]    ),
  .lq_entry_create0_vld_x         (lq_entry_create0_vld[9]       ),
  .lq_entry_create1_dp_vld_x      (lq_entry_create1_dp_vld[9]    ),
  .lq_entry_create1_gateclk_en_x  (lq_entry_create1_gateclk_en[9]),
  .lq_entry_create1_vld_x         (lq_entry_create1_vld[9]       ),
  .lq_entry_create_gateclk_en_x   (lq_entry_create_gateclk_en[9] ),
  .lq_entry_inst_hit_x            (lq_entry_inst_hit[9]          ),
  .lq_entry_rar_spec_fail_x       (lq_entry_rar_spec_fail[9]     ),
  .lq_entry_raw_spec_fail_x       (lq_entry_raw_spec_fail[9]     ),
  .lq_entry_vld_x                 (lq_entry_vld[9]               ),
  .pad_yy_icg_scan_en             (pad_yy_icg_scan_en            ),
  .rtu_yy_xx_commit0              (rtu_yy_xx_commit0             ),
  .rtu_yy_xx_commit0_iid          (rtu_yy_xx_commit0_iid         ),
  .rtu_yy_xx_commit1              (rtu_yy_xx_commit1             ),
  .rtu_yy_xx_commit1_iid          (rtu_yy_xx_commit1_iid         ),
  .rtu_yy_xx_commit2              (rtu_yy_xx_commit2             ),
  .rtu_yy_xx_commit2_iid          (rtu_yy_xx_commit2_iid         ),
  .rtu_yy_xx_flush                (rtu_yy_xx_flush               ),
  .st_dc_addr0                    (st_dc_addr0                   ),
  .st_dc_bytes_vld                (st_dc_bytes_vld               ),
  .st_dc_chk_st_inst_vld          (st_dc_chk_st_inst_vld         ),
  .st_dc_chk_statomic_inst_vld    (st_dc_chk_statomic_inst_vld   ),
  .st_dc_iid                      (st_dc_iid                     )
);


// &ConnRule(s/_x$/[10]/); @81
// &Instance("ct_lsu_lq_entry","x_ct_lsu_lq_entry_10"); @82
ct_lsu_lq_entry  x_ct_lsu_lq_entry_10 (
  .cp0_lsu_corr_dis                (cp0_lsu_corr_dis               ),
  .cp0_lsu_icg_en                  (cp0_lsu_icg_en                 ),
  .cp0_yy_clk_en                   (cp0_yy_clk_en                  ),
  .cpurst_b                        (cpurst_b                       ),
  .forever_cpuclk                  (forever_cpuclk                 ),
  .ld_dc_addr0                     (ld_dc_addr0                    ),
  .ld_dc_addr1                     (ld_dc_addr1                    ),
  .ld_dc_bytes_vld                 (ld_dc_bytes_vld                ),
  .ld_dc_bytes_vld1                (ld_dc_bytes_vld1               ),
  .ld_dc_chk_ld_addr1_vld          (ld_dc_chk_ld_addr1_vld         ),
  .ld_dc_iid                       (ld_dc_iid                      ),
  .ld_dc_inst_chk_vld              (ld_dc_inst_chk_vld             ),
  .ld_dc_secd                      (ld_dc_secd                     ),
  .lq_clk                          (lq_clk                         ),
  .lq_entry_create0_dp_vld_x       (lq_entry_create0_dp_vld[10]    ),
  .lq_entry_create0_vld_x          (lq_entry_create0_vld[10]       ),
  .lq_entry_create1_dp_vld_x       (lq_entry_create1_dp_vld[10]    ),
  .lq_entry_create1_gateclk_en_x   (lq_entry_create1_gateclk_en[10]),
  .lq_entry_create1_vld_x          (lq_entry_create1_vld[10]       ),
  .lq_entry_create_gateclk_en_x    (lq_entry_create_gateclk_en[10] ),
  .lq_entry_inst_hit_x             (lq_entry_inst_hit[10]          ),
  .lq_entry_rar_spec_fail_x        (lq_entry_rar_spec_fail[10]     ),
  .lq_entry_raw_spec_fail_x        (lq_entry_raw_spec_fail[10]     ),
  .lq_entry_vld_x                  (lq_entry_vld[10]               ),
  .pad_yy_icg_scan_en              (pad_yy_icg_scan_en             ),
  .rtu_yy_xx_commit0               (rtu_yy_xx_commit0              ),
  .rtu_yy_xx_commit0_iid           (rtu_yy_xx_commit0_iid          ),
  .rtu_yy_xx_commit1               (rtu_yy_xx_commit1              ),
  .rtu_yy_xx_commit1_iid           (rtu_yy_xx_commit1_iid          ),
  .rtu_yy_xx_commit2               (rtu_yy_xx_commit2              ),
  .rtu_yy_xx_commit2_iid           (rtu_yy_xx_commit2_iid          ),
  .rtu_yy_xx_flush                 (rtu_yy_xx_flush                ),
  .st_dc_addr0                     (st_dc_addr0                    ),
  .st_dc_bytes_vld                 (st_dc_bytes_vld                ),
  .st_dc_chk_st_inst_vld           (st_dc_chk_st_inst_vld          ),
  .st_dc_chk_statomic_inst_vld     (st_dc_chk_statomic_inst_vld    ),
  .st_dc_iid                       (st_dc_iid                      )
);


// &ConnRule(s/_x$/[11]/); @84
// &Instance("ct_lsu_lq_entry","x_ct_lsu_lq_entry_11"); @85
ct_lsu_lq_entry  x_ct_lsu_lq_entry_11 (
  .cp0_lsu_corr_dis                (cp0_lsu_corr_dis               ),
  .cp0_lsu_icg_en                  (cp0_lsu_icg_en                 ),
  .cp0_yy_clk_en                   (cp0_yy_clk_en                  ),
  .cpurst_b                        (cpurst_b                       ),
  .forever_cpuclk                  (forever_cpuclk                 ),
  .ld_dc_addr0                     (ld_dc_addr0                    ),
  .ld_dc_addr1                     (ld_dc_addr1                    ),
  .ld_dc_bytes_vld                 (ld_dc_bytes_vld                ),
  .ld_dc_bytes_vld1                (ld_dc_bytes_vld1               ),
  .ld_dc_chk_ld_addr1_vld          (ld_dc_chk_ld_addr1_vld         ),
  .ld_dc_iid                       (ld_dc_iid                      ),
  .ld_dc_inst_chk_vld              (ld_dc_inst_chk_vld             ),
  .ld_dc_secd                      (ld_dc_secd                     ),
  .lq_clk                          (lq_clk                         ),
  .lq_entry_create0_dp_vld_x       (lq_entry_create0_dp_vld[11]    ),
  .lq_entry_create0_vld_x          (lq_entry_create0_vld[11]       ),
  .lq_entry_create1_dp_vld_x       (lq_entry_create1_dp_vld[11]    ),
  .lq_entry_create1_gateclk_en_x   (lq_entry_create1_gateclk_en[11]),
  .lq_entry_create1_vld_x          (lq_entry_create1_vld[11]       ),
  .lq_entry_create_gateclk_en_x    (lq_entry_create_gateclk_en[11] ),
  .lq_entry_inst_hit_x             (lq_entry_inst_hit[11]          ),
  .lq_entry_rar_spec_fail_x        (lq_entry_rar_spec_fail[11]     ),
  .lq_entry_raw_spec_fail_x        (lq_entry_raw_spec_fail[11]     ),
  .lq_entry_vld_x                  (lq_entry_vld[11]               ),
  .pad_yy_icg_scan_en              (pad_yy_icg_scan_en             ),
  .rtu_yy_xx_commit0               (rtu_yy_xx_commit0              ),
  .rtu_yy_xx_commit0_iid           (rtu_yy_xx_commit0_iid          ),
  .rtu_yy_xx_commit1               (rtu_yy_xx_commit1              ),
  .rtu_yy_xx_commit1_iid           (rtu_yy_xx_commit1_iid          ),
  .rtu_yy_xx_commit2               (rtu_yy_xx_commit2              ),
  .rtu_yy_xx_commit2_iid           (rtu_yy_xx_commit2_iid          ),
  .rtu_yy_xx_flush                 (rtu_yy_xx_flush                ),
  .st_dc_addr0                     (st_dc_addr0                    ),
  .st_dc_bytes_vld                 (st_dc_bytes_vld                ),
  .st_dc_chk_st_inst_vld           (st_dc_chk_st_inst_vld          ),
  .st_dc_chk_statomic_inst_vld     (st_dc_chk_statomic_inst_vld    ),
  .st_dc_iid                       (st_dc_iid                      )
);


// &ConnRule(s/_x$/[12]/); @87
// &Instance("ct_lsu_lq_entry","x_ct_lsu_lq_entry_12"); @88
ct_lsu_lq_entry  x_ct_lsu_lq_entry_12 (
  .cp0_lsu_corr_dis                (cp0_lsu_corr_dis               ),
  .cp0_lsu_icg_en                  (cp0_lsu_icg_en                 ),
  .cp0_yy_clk_en                   (cp0_yy_clk_en                  ),
  .cpurst_b                        (cpurst_b                       ),
  .forever_cpuclk                  (forever_cpuclk                 ),
  .ld_dc_addr0                     (ld_dc_addr0                    ),
  .ld_dc_addr1                     (ld_dc_addr1                    ),
  .ld_dc_bytes_vld                 (ld_dc_bytes_vld                ),
  .ld_dc_bytes_vld1                (ld_dc_bytes_vld1               ),
  .ld_dc_chk_ld_addr1_vld          (ld_dc_chk_ld_addr1_vld         ),
  .ld_dc_iid                       (ld_dc_iid                      ),
  .ld_dc_inst_chk_vld              (ld_dc_inst_chk_vld             ),
  .ld_dc_secd                      (ld_dc_secd                     ),
  .lq_clk                          (lq_clk                         ),
  .lq_entry_create0_dp_vld_x       (lq_entry_create0_dp_vld[12]    ),
  .lq_entry_create0_vld_x          (lq_entry_create0_vld[12]       ),
  .lq_entry_create1_dp_vld_x       (lq_entry_create1_dp_vld[12]    ),
  .lq_entry_create1_gateclk_en_x   (lq_entry_create1_gateclk_en[12]),
  .lq_entry_create1_vld_x          (lq_entry_create1_vld[12]       ),
  .lq_entry_create_gateclk_en_x    (lq_entry_create_gateclk_en[12] ),
  .lq_entry_inst_hit_x             (lq_entry_inst_hit[12]          ),
  .lq_entry_rar_spec_fail_x        (lq_entry_rar_spec_fail[12]     ),
  .lq_entry_raw_spec_fail_x        (lq_entry_raw_spec_fail[12]     ),
  .lq_entry_vld_x                  (lq_entry_vld[12]               ),
  .pad_yy_icg_scan_en              (pad_yy_icg_scan_en             ),
  .rtu_yy_xx_commit0               (rtu_yy_xx_commit0              ),
  .rtu_yy_xx_commit0_iid           (rtu_yy_xx_commit0_iid          ),
  .rtu_yy_xx_commit1               (rtu_yy_xx_commit1              ),
  .rtu_yy_xx_commit1_iid           (rtu_yy_xx_commit1_iid          ),
  .rtu_yy_xx_commit2               (rtu_yy_xx_commit2              ),
  .rtu_yy_xx_commit2_iid           (rtu_yy_xx_commit2_iid          ),
  .rtu_yy_xx_flush                 (rtu_yy_xx_flush                ),
  .st_dc_addr0                     (st_dc_addr0                    ),
  .st_dc_bytes_vld                 (st_dc_bytes_vld                ),
  .st_dc_chk_st_inst_vld           (st_dc_chk_st_inst_vld          ),
  .st_dc_chk_statomic_inst_vld     (st_dc_chk_statomic_inst_vld    ),
  .st_dc_iid                       (st_dc_iid                      )
);


// &ConnRule(s/_x$/[13]/); @90
// &Instance("ct_lsu_lq_entry","x_ct_lsu_lq_entry_13"); @91
ct_lsu_lq_entry  x_ct_lsu_lq_entry_13 (
  .cp0_lsu_corr_dis                (cp0_lsu_corr_dis               ),
  .cp0_lsu_icg_en                  (cp0_lsu_icg_en                 ),
  .cp0_yy_clk_en                   (cp0_yy_clk_en                  ),
  .cpurst_b                        (cpurst_b                       ),
  .forever_cpuclk                  (forever_cpuclk                 ),
  .ld_dc_addr0                     (ld_dc_addr0                    ),
  .ld_dc_addr1                     (ld_dc_addr1                    ),
  .ld_dc_bytes_vld                 (ld_dc_bytes_vld                ),
  .ld_dc_bytes_vld1                (ld_dc_bytes_vld1               ),
  .ld_dc_chk_ld_addr1_vld          (ld_dc_chk_ld_addr1_vld         ),
  .ld_dc_iid                       (ld_dc_iid                      ),
  .ld_dc_inst_chk_vld              (ld_dc_inst_chk_vld             ),
  .ld_dc_secd                      (ld_dc_secd                     ),
  .lq_clk                          (lq_clk                         ),
  .lq_entry_create0_dp_vld_x       (lq_entry_create0_dp_vld[13]    ),
  .lq_entry_create0_vld_x          (lq_entry_create0_vld[13]       ),
  .lq_entry_create1_dp_vld_x       (lq_entry_create1_dp_vld[13]    ),
  .lq_entry_create1_gateclk_en_x   (lq_entry_create1_gateclk_en[13]),
  .lq_entry_create1_vld_x          (lq_entry_create1_vld[13]       ),
  .lq_entry_create_gateclk_en_x    (lq_entry_create_gateclk_en[13] ),
  .lq_entry_inst_hit_x             (lq_entry_inst_hit[13]          ),
  .lq_entry_rar_spec_fail_x        (lq_entry_rar_spec_fail[13]     ),
  .lq_entry_raw_spec_fail_x        (lq_entry_raw_spec_fail[13]     ),
  .lq_entry_vld_x                  (lq_entry_vld[13]               ),
  .pad_yy_icg_scan_en              (pad_yy_icg_scan_en             ),
  .rtu_yy_xx_commit0               (rtu_yy_xx_commit0              ),
  .rtu_yy_xx_commit0_iid           (rtu_yy_xx_commit0_iid          ),
  .rtu_yy_xx_commit1               (rtu_yy_xx_commit1              ),
  .rtu_yy_xx_commit1_iid           (rtu_yy_xx_commit1_iid          ),
  .rtu_yy_xx_commit2               (rtu_yy_xx_commit2              ),
  .rtu_yy_xx_commit2_iid           (rtu_yy_xx_commit2_iid          ),
  .rtu_yy_xx_flush                 (rtu_yy_xx_flush                ),
  .st_dc_addr0                     (st_dc_addr0                    ),
  .st_dc_bytes_vld                 (st_dc_bytes_vld                ),
  .st_dc_chk_st_inst_vld           (st_dc_chk_st_inst_vld          ),
  .st_dc_chk_statomic_inst_vld     (st_dc_chk_statomic_inst_vld    ),
  .st_dc_iid                       (st_dc_iid                      )
);


// &ConnRule(s/_x$/[14]/); @93
// &Instance("ct_lsu_lq_entry","x_ct_lsu_lq_entry_14"); @94
ct_lsu_lq_entry  x_ct_lsu_lq_entry_14 (
  .cp0_lsu_corr_dis                (cp0_lsu_corr_dis               ),
  .cp0_lsu_icg_en                  (cp0_lsu_icg_en                 ),
  .cp0_yy_clk_en                   (cp0_yy_clk_en                  ),
  .cpurst_b                        (cpurst_b                       ),
  .forever_cpuclk                  (forever_cpuclk                 ),
  .ld_dc_addr0                     (ld_dc_addr0                    ),
  .ld_dc_addr1                     (ld_dc_addr1                    ),
  .ld_dc_bytes_vld                 (ld_dc_bytes_vld                ),
  .ld_dc_bytes_vld1                (ld_dc_bytes_vld1               ),
  .ld_dc_chk_ld_addr1_vld          (ld_dc_chk_ld_addr1_vld         ),
  .ld_dc_iid                       (ld_dc_iid                      ),
  .ld_dc_inst_chk_vld              (ld_dc_inst_chk_vld             ),
  .ld_dc_secd                      (ld_dc_secd                     ),
  .lq_clk                          (lq_clk                         ),
  .lq_entry_create0_dp_vld_x       (lq_entry_create0_dp_vld[14]    ),
  .lq_entry_create0_vld_x          (lq_entry_create0_vld[14]       ),
  .lq_entry_create1_dp_vld_x       (lq_entry_create1_dp_vld[14]    ),
  .lq_entry_create1_gateclk_en_x   (lq_entry_create1_gateclk_en[14]),
  .lq_entry_create1_vld_x          (lq_entry_create1_vld[14]       ),
  .lq_entry_create_gateclk_en_x    (lq_entry_create_gateclk_en[14] ),
  .lq_entry_inst_hit_x             (lq_entry_inst_hit[14]          ),
  .lq_entry_rar_spec_fail_x        (lq_entry_rar_spec_fail[14]     ),
  .lq_entry_raw_spec_fail_x        (lq_entry_raw_spec_fail[14]     ),
  .lq_entry_vld_x                  (lq_entry_vld[14]               ),
  .pad_yy_icg_scan_en              (pad_yy_icg_scan_en             ),
  .rtu_yy_xx_commit0               (rtu_yy_xx_commit0              ),
  .rtu_yy_xx_commit0_iid           (rtu_yy_xx_commit0_iid          ),
  .rtu_yy_xx_commit1               (rtu_yy_xx_commit1              ),
  .rtu_yy_xx_commit1_iid           (rtu_yy_xx_commit1_iid          ),
  .rtu_yy_xx_commit2               (rtu_yy_xx_commit2              ),
  .rtu_yy_xx_commit2_iid           (rtu_yy_xx_commit2_iid          ),
  .rtu_yy_xx_flush                 (rtu_yy_xx_flush                ),
  .st_dc_addr0                     (st_dc_addr0                    ),
  .st_dc_bytes_vld                 (st_dc_bytes_vld                ),
  .st_dc_chk_st_inst_vld           (st_dc_chk_st_inst_vld          ),
  .st_dc_chk_statomic_inst_vld     (st_dc_chk_statomic_inst_vld    ),
  .st_dc_iid                       (st_dc_iid                      )
);


// &ConnRule(s/_x$/[15]/); @96
// &Instance("ct_lsu_lq_entry","x_ct_lsu_lq_entry_15"); @97
ct_lsu_lq_entry  x_ct_lsu_lq_entry_15 (
  .cp0_lsu_corr_dis                (cp0_lsu_corr_dis               ),
  .cp0_lsu_icg_en                  (cp0_lsu_icg_en                 ),
  .cp0_yy_clk_en                   (cp0_yy_clk_en                  ),
  .cpurst_b                        (cpurst_b                       ),
  .forever_cpuclk                  (forever_cpuclk                 ),
  .ld_dc_addr0                     (ld_dc_addr0                    ),
  .ld_dc_addr1                     (ld_dc_addr1                    ),
  .ld_dc_bytes_vld                 (ld_dc_bytes_vld                ),
  .ld_dc_bytes_vld1                (ld_dc_bytes_vld1               ),
  .ld_dc_chk_ld_addr1_vld          (ld_dc_chk_ld_addr1_vld         ),
  .ld_dc_iid                       (ld_dc_iid                      ),
  .ld_dc_inst_chk_vld              (ld_dc_inst_chk_vld             ),
  .ld_dc_secd                      (ld_dc_secd                     ),
  .lq_clk                          (lq_clk                         ),
  .lq_entry_create0_dp_vld_x       (lq_entry_create0_dp_vld[15]    ),
  .lq_entry_create0_vld_x          (lq_entry_create0_vld[15]       ),
  .lq_entry_create1_dp_vld_x       (lq_entry_create1_dp_vld[15]    ),
  .lq_entry_create1_gateclk_en_x   (lq_entry_create1_gateclk_en[15]),
  .lq_entry_create1_vld_x          (lq_entry_create1_vld[15]       ),
  .lq_entry_create_gateclk_en_x    (lq_entry_create_gateclk_en[15] ),
  .lq_entry_inst_hit_x             (lq_entry_inst_hit[15]          ),
  .lq_entry_rar_spec_fail_x        (lq_entry_rar_spec_fail[15]     ),
  .lq_entry_raw_spec_fail_x        (lq_entry_raw_spec_fail[15]     ),
  .lq_entry_vld_x                  (lq_entry_vld[15]               ),
  .pad_yy_icg_scan_en              (pad_yy_icg_scan_en             ),
  .rtu_yy_xx_commit0               (rtu_yy_xx_commit0              ),
  .rtu_yy_xx_commit0_iid           (rtu_yy_xx_commit0_iid          ),
  .rtu_yy_xx_commit1               (rtu_yy_xx_commit1              ),
  .rtu_yy_xx_commit1_iid           (rtu_yy_xx_commit1_iid          ),
  .rtu_yy_xx_commit2               (rtu_yy_xx_commit2              ),
  .rtu_yy_xx_commit2_iid           (rtu_yy_xx_commit2_iid          ),
  .rtu_yy_xx_flush                 (rtu_yy_xx_flush                ),
  .st_dc_addr0                     (st_dc_addr0                    ),
  .st_dc_bytes_vld                 (st_dc_bytes_vld                ),
  .st_dc_chk_st_inst_vld           (st_dc_chk_st_inst_vld          ),
  .st_dc_chk_statomic_inst_vld     (st_dc_chk_statomic_inst_vld    ),
  .st_dc_iid                       (st_dc_iid                      )
);

//==========================================================
//                 Generate create pointer
//==========================================================
// &CombBeg; @101
always @( lq_entry_vld[15:0])
begin
lq_create_ptr0[LQ_ENTRY-1:0] = {LQ_ENTRY{1'b0}};
casez(lq_entry_vld[LQ_ENTRY-1:0])
  16'b????_????_????_???0:lq_create_ptr0[0] = 1'b1;
  16'b????_????_????_??01:lq_create_ptr0[1] = 1'b1;
  16'b????_????_????_?011:lq_create_ptr0[2] = 1'b1;
  16'b????_????_????_0111:lq_create_ptr0[3] = 1'b1;
  16'b????_????_???0_1111:lq_create_ptr0[4] = 1'b1;
  16'b????_????_??01_1111:lq_create_ptr0[5] = 1'b1;
  16'b????_????_?011_1111:lq_create_ptr0[6] = 1'b1;
  16'b????_????_0111_1111:lq_create_ptr0[7] = 1'b1;
  16'b????_???0_1111_1111:lq_create_ptr0[8] = 1'b1;
  16'b????_??01_1111_1111:lq_create_ptr0[9] = 1'b1;
  16'b????_?011_1111_1111:lq_create_ptr0[10] = 1'b1;
  16'b????_0111_1111_1111:lq_create_ptr0[11] = 1'b1;
  16'b???0_1111_1111_1111:lq_create_ptr0[12] = 1'b1;
  16'b??01_1111_1111_1111:lq_create_ptr0[13] = 1'b1;
  16'b?011_1111_1111_1111:lq_create_ptr0[14] = 1'b1;
  16'b0111_1111_1111_1111:lq_create_ptr0[15] = 1'b1;
  default:lq_create_ptr0[LQ_ENTRY-1:0] = {LQ_ENTRY{1'b0}};
endcase
// &CombEnd; @122
end

// &CombBeg; @124
always @( lq_entry_vld[15:0])
begin
lq_create_ptr1[LQ_ENTRY-1:0] = {LQ_ENTRY{1'b0}};
casez(lq_entry_vld[LQ_ENTRY-1:0])
  16'b0???_????_????_????:lq_create_ptr1[15] = 1'b1;
  16'b10??_????_????_????:lq_create_ptr1[14] = 1'b1;
  16'b110?_????_????_????:lq_create_ptr1[13] = 1'b1;
  16'b1110_????_????_????:lq_create_ptr1[12] = 1'b1;
  16'b1111_0???_????_????:lq_create_ptr1[11] = 1'b1;
  16'b1111_10??_????_????:lq_create_ptr1[10] = 1'b1;
  16'b1111_110?_????_????:lq_create_ptr1[9] = 1'b1;
  16'b1111_1110_????_????:lq_create_ptr1[8] = 1'b1;
  16'b1111_1111_0???_????:lq_create_ptr1[7] = 1'b1;
  16'b1111_1111_10??_????:lq_create_ptr1[6] = 1'b1;
  16'b1111_1111_110?_????:lq_create_ptr1[5] = 1'b1;
  16'b1111_1111_1110_????:lq_create_ptr1[4] = 1'b1;
  16'b1111_1111_1111_0???:lq_create_ptr1[3] = 1'b1;
  16'b1111_1111_1111_10??:lq_create_ptr1[2] = 1'b1;
  16'b1111_1111_1111_110?:lq_create_ptr1[1] = 1'b1;
  16'b1111_1111_1111_1110:lq_create_ptr1[0] = 1'b1;
  default:lq_create_ptr1[LQ_ENTRY-1:0] = {LQ_ENTRY{1'b0}};
endcase
// &CombEnd; @145
end

assign lq_empty = !(|lq_entry_vld[LQ_ENTRY-1:0]);
assign lq_full  = &lq_entry_vld[LQ_ENTRY-1:0];

//==========================================================
//                 Generate create pointer
//==========================================================
assign lq_create_success  = ld_dc_lq_create_vld
                            &&  !rtu_yy_xx_flush
                            &&  (!lq_ld_dc_less2 
                                 || !lq_ld_dc_full && !ld_dc_lq_create1_vld);

assign lq_create1_success = lq_create_success
                            && ld_dc_lq_create1_vld;

assign lq_entry_create0_vld[LQ_ENTRY-1:0]         = {LQ_ENTRY{lq_create_success}}
                                                    & lq_create_ptr0[LQ_ENTRY-1:0];

assign lq_entry_create1_vld[LQ_ENTRY-1:0]         = {LQ_ENTRY{lq_create1_success}}
                                                    & lq_create_ptr1[LQ_ENTRY-1:0];

assign lq_entry_create0_dp_vld[LQ_ENTRY-1:0]      = {LQ_ENTRY{ld_dc_lq_create_dp_vld}}
                                                    & lq_create_ptr0[LQ_ENTRY-1:0];

assign lq_entry_create1_dp_vld[LQ_ENTRY-1:0]      = {LQ_ENTRY{ld_dc_lq_create1_dp_vld}}
                                                    & lq_create_ptr1[LQ_ENTRY-1:0];

assign lq_entry_create_gateclk_en[LQ_ENTRY-1:0]   = {LQ_ENTRY{ld_dc_lq_create_gateclk_en}}
                                                    & lq_create_ptr0[LQ_ENTRY-1:0];

assign lq_entry_create1_gateclk_en[LQ_ENTRY-1:0]   = {LQ_ENTRY{ld_dc_lq_create1_gateclk_en}}
                                                    & lq_create_ptr1[LQ_ENTRY-1:0];
//==========================================================
//                 Generate interface
//==========================================================
// &Force("output", "lq_ld_dc_full"); @181
// &Force("output", "lq_ld_dc_less2"); @182
assign lq_ld_dc_full        = lq_full;
assign lq_ld_dc_less2       = &(lq_create_ptr0[LQ_ENTRY-1:0] | lq_entry_vld[LQ_ENTRY-1:0]);
assign lq_ld_dc_inst_hit    = |lq_entry_inst_hit[LQ_ENTRY-1:0];
assign lq_ld_dc_spec_fail   = |lq_entry_rar_spec_fail[LQ_ENTRY-1:0];
assign lq_st_dc_spec_fail   = |lq_entry_raw_spec_fail[LQ_ENTRY-1:0];

assign lsu_idu_lq_not_full  = !lq_full;

// &ModuleEnd; @191
endmodule


