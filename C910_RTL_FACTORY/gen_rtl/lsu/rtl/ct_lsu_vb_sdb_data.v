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
module ct_lsu_vb_sdb_data(
  cp0_lsu_icg_en,
  cpurst_b,
  forever_cpuclk,
  ld_da_data256,
  ld_da_vb_borrow_vb,
  pad_yy_icg_scan_en,
  sdb_create_data_order,
  sdb_create_en,
  sdb_data_vld,
  sdb_entry_avail,
  sdb_entry_data_0,
  sdb_entry_data_1,
  sdb_entry_data_2,
  sdb_entry_data_index,
  sdb_inv_en,
  sdb_vld,
  snq_data_bypass_hit,
  snq_vb_bypass_invalid,
  snq_vb_bypass_readonce,
  snq_vb_bypass_start,
  vb_data_entry_addr_id_0,
  vb_data_entry_addr_id_1,
  vb_data_entry_addr_id_2,
  vb_data_entry_biu_req,
  vb_data_entry_biu_req_success,
  vb_data_entry_bypass_pop,
  vb_data_entry_create_dp_vld,
  vb_data_entry_create_gateclk_en,
  vb_data_entry_create_vld,
  vb_data_entry_dirty,
  vb_data_entry_inv,
  vb_data_entry_lfb_create,
  vb_data_entry_normal_pop,
  vb_data_entry_req_success,
  vb_data_entry_vld,
  vb_data_entry_wd_sm_grnt,
  vb_data_entry_wd_sm_req,
  vb_data_entry_write_data128_0,
  vb_data_entry_write_data128_1,
  vb_data_entry_write_data128_2,
  vb_rcl_sm_addr_id,
  vb_rcl_sm_data_dcache_dirty,
  vb_rcl_sm_data_set_data_done,
  vb_rcl_sm_inv,
  vb_rcl_sm_lfb_create,
  vb_sdb_data_entry_vld,
  vb_wd_sm_data_bias,
  vb_wd_sm_data_pop_req
);

// &Ports; @26
input            cp0_lsu_icg_en;                 
input            cpurst_b;                       
input            forever_cpuclk;                 
input   [255:0]  ld_da_data256;                  
input   [2  :0]  ld_da_vb_borrow_vb;             
input            pad_yy_icg_scan_en;             
input   [1  :0]  sdb_create_data_order;          
input   [2  :0]  sdb_create_en;                  
input   [3  :0]  sdb_entry_data_index;           
input   [2  :0]  sdb_inv_en;                     
input   [2  :0]  snq_data_bypass_hit;            
input   [2  :0]  snq_vb_bypass_invalid;          
input            snq_vb_bypass_readonce;         
input   [2  :0]  snq_vb_bypass_start;            
input   [2  :0]  vb_data_entry_biu_req_success;  
input   [2  :0]  vb_data_entry_create_dp_vld;    
input   [2  :0]  vb_data_entry_create_gateclk_en; 
input   [2  :0]  vb_data_entry_create_vld;       
input   [2  :0]  vb_data_entry_wd_sm_grnt;       
input   [1  :0]  vb_rcl_sm_addr_id;              
input            vb_rcl_sm_data_dcache_dirty;    
input   [2  :0]  vb_rcl_sm_data_set_data_done;   
input            vb_rcl_sm_inv;                  
input            vb_rcl_sm_lfb_create;           
input   [3  :0]  vb_wd_sm_data_bias;             
input   [2  :0]  vb_wd_sm_data_pop_req;          
output  [2  :0]  sdb_data_vld;                   
output  [2  :0]  sdb_entry_avail;                
output  [127:0]  sdb_entry_data_0;               
output  [127:0]  sdb_entry_data_1;               
output  [127:0]  sdb_entry_data_2;               
output  [2  :0]  sdb_vld;                        
output  [1  :0]  vb_data_entry_addr_id_0;        
output  [1  :0]  vb_data_entry_addr_id_1;        
output  [1  :0]  vb_data_entry_addr_id_2;        
output  [2  :0]  vb_data_entry_biu_req;          
output  [2  :0]  vb_data_entry_bypass_pop;       
output  [2  :0]  vb_data_entry_dirty;            
output  [2  :0]  vb_data_entry_inv;              
output  [2  :0]  vb_data_entry_lfb_create;       
output  [2  :0]  vb_data_entry_normal_pop;       
output  [2  :0]  vb_data_entry_req_success;      
output  [2  :0]  vb_data_entry_vld;              
output  [2  :0]  vb_data_entry_wd_sm_req;        
output  [127:0]  vb_data_entry_write_data128_0;  
output  [127:0]  vb_data_entry_write_data128_1;  
output  [127:0]  vb_data_entry_write_data128_2;  
output  [2  :0]  vb_sdb_data_entry_vld;          

// &Regs; @27

// &Wires; @28
wire             cp0_lsu_icg_en;                 
wire             cpurst_b;                       
wire             forever_cpuclk;                 
wire    [255:0]  ld_da_data256;                  
wire    [2  :0]  ld_da_vb_borrow_vb;             
wire             pad_yy_icg_scan_en;             
wire    [1  :0]  sdb_create_data_order;          
wire    [2  :0]  sdb_create_en;                  
wire    [2  :0]  sdb_data_vld;                   
wire    [2  :0]  sdb_entry_avail;                
wire    [127:0]  sdb_entry_data_0;               
wire    [127:0]  sdb_entry_data_1;               
wire    [127:0]  sdb_entry_data_2;               
wire    [3  :0]  sdb_entry_data_index;           
wire    [2  :0]  sdb_inv_en;                     
wire    [2  :0]  sdb_vld;                        
wire    [2  :0]  snq_data_bypass_hit;            
wire    [2  :0]  snq_vb_bypass_invalid;          
wire             snq_vb_bypass_readonce;         
wire    [2  :0]  snq_vb_bypass_start;            
wire    [1  :0]  vb_data_entry_addr_id_0;        
wire    [1  :0]  vb_data_entry_addr_id_1;        
wire    [1  :0]  vb_data_entry_addr_id_2;        
wire    [2  :0]  vb_data_entry_biu_req;          
wire    [2  :0]  vb_data_entry_biu_req_success;  
wire    [2  :0]  vb_data_entry_bypass_pop;       
wire    [2  :0]  vb_data_entry_create_dp_vld;    
wire    [2  :0]  vb_data_entry_create_gateclk_en; 
wire    [2  :0]  vb_data_entry_create_vld;       
wire    [2  :0]  vb_data_entry_dirty;            
wire    [2  :0]  vb_data_entry_inv;              
wire    [2  :0]  vb_data_entry_lfb_create;       
wire    [2  :0]  vb_data_entry_normal_pop;       
wire    [2  :0]  vb_data_entry_req_success;      
wire    [2  :0]  vb_data_entry_vld;              
wire    [2  :0]  vb_data_entry_wd_sm_grnt;       
wire    [2  :0]  vb_data_entry_wd_sm_req;        
wire    [127:0]  vb_data_entry_write_data128_0;  
wire    [127:0]  vb_data_entry_write_data128_1;  
wire    [127:0]  vb_data_entry_write_data128_2;  
wire    [1  :0]  vb_rcl_sm_addr_id;              
wire             vb_rcl_sm_data_dcache_dirty;    
wire    [2  :0]  vb_rcl_sm_data_set_data_done;   
wire             vb_rcl_sm_inv;                  
wire             vb_rcl_sm_lfb_create;           
wire    [2  :0]  vb_sdb_data_entry_vld;          
wire    [3  :0]  vb_wd_sm_data_bias;             
wire    [2  :0]  vb_wd_sm_data_pop_req;          


parameter DATA_ENTRY       = 3;

//==========================================================
//              Instance data entry
//==========================================================
//3 data entry(share with sdb)
// &ConnRule(s/_x$/[0]/); @36
// &ConnRule(s/_v$/_0/); @37
// &Instance("ct_lsu_vb_sdb_data_entry","x_ct_lsu_vb_sdb_data_entry_0"); @38
ct_lsu_vb_sdb_data_entry  x_ct_lsu_vb_sdb_data_entry_0 (
  .cp0_lsu_icg_en                     (cp0_lsu_icg_en                    ),
  .cpurst_b                           (cpurst_b                          ),
  .forever_cpuclk                     (forever_cpuclk                    ),
  .ld_da_data256                      (ld_da_data256                     ),
  .ld_da_vb_borrow_vb_x               (ld_da_vb_borrow_vb[0]             ),
  .pad_yy_icg_scan_en                 (pad_yy_icg_scan_en                ),
  .sdb_create_data_order              (sdb_create_data_order             ),
  .sdb_create_en_x                    (sdb_create_en[0]                  ),
  .sdb_data_vld_x                     (sdb_data_vld[0]                   ),
  .sdb_entry_avail_x                  (sdb_entry_avail[0]                ),
  .sdb_entry_data_index               (sdb_entry_data_index              ),
  .sdb_entry_data_v                   (sdb_entry_data_0                  ),
  .sdb_inv_en_x                       (sdb_inv_en[0]                     ),
  .sdb_vld_x                          (sdb_vld[0]                        ),
  .snq_data_bypass_hit_x              (snq_data_bypass_hit[0]            ),
  .snq_vb_bypass_invalid_x            (snq_vb_bypass_invalid[0]          ),
  .snq_vb_bypass_readonce             (snq_vb_bypass_readonce            ),
  .snq_vb_bypass_start_x              (snq_vb_bypass_start[0]            ),
  .vb_data_entry_addr_id_v            (vb_data_entry_addr_id_0           ),
  .vb_data_entry_biu_req_success_x    (vb_data_entry_biu_req_success[0]  ),
  .vb_data_entry_biu_req_x            (vb_data_entry_biu_req[0]          ),
  .vb_data_entry_bypass_pop_x         (vb_data_entry_bypass_pop[0]       ),
  .vb_data_entry_create_dp_vld_x      (vb_data_entry_create_dp_vld[0]    ),
  .vb_data_entry_create_gateclk_en_x  (vb_data_entry_create_gateclk_en[0]),
  .vb_data_entry_create_vld_x         (vb_data_entry_create_vld[0]       ),
  .vb_data_entry_dirty_x              (vb_data_entry_dirty[0]            ),
  .vb_data_entry_inv_x                (vb_data_entry_inv[0]              ),
  .vb_data_entry_lfb_create_x         (vb_data_entry_lfb_create[0]       ),
  .vb_data_entry_normal_pop_x         (vb_data_entry_normal_pop[0]       ),
  .vb_data_entry_req_success_x        (vb_data_entry_req_success[0]      ),
  .vb_data_entry_vld_x                (vb_data_entry_vld[0]              ),
  .vb_data_entry_wd_sm_grnt_x         (vb_data_entry_wd_sm_grnt[0]       ),
  .vb_data_entry_wd_sm_req_x          (vb_data_entry_wd_sm_req[0]        ),
  .vb_data_entry_write_data128_v      (vb_data_entry_write_data128_0     ),
  .vb_rcl_sm_addr_id                  (vb_rcl_sm_addr_id                 ),
  .vb_rcl_sm_data_dcache_dirty        (vb_rcl_sm_data_dcache_dirty       ),
  .vb_rcl_sm_data_set_data_done_x     (vb_rcl_sm_data_set_data_done[0]   ),
  .vb_rcl_sm_inv                      (vb_rcl_sm_inv                     ),
  .vb_rcl_sm_lfb_create               (vb_rcl_sm_lfb_create              ),
  .vb_sdb_data_entry_vld_x            (vb_sdb_data_entry_vld[0]          ),
  .vb_wd_sm_data_bias                 (vb_wd_sm_data_bias                ),
  .vb_wd_sm_data_pop_req_x            (vb_wd_sm_data_pop_req[0]          )
);


// &ConnRule(s/_x$/[1]/); @40
// &ConnRule(s/_v$/_1/); @41
// &Instance("ct_lsu_vb_sdb_data_entry","x_ct_lsu_vb_sdb_data_entry_1"); @42
ct_lsu_vb_sdb_data_entry  x_ct_lsu_vb_sdb_data_entry_1 (
  .cp0_lsu_icg_en                     (cp0_lsu_icg_en                    ),
  .cpurst_b                           (cpurst_b                          ),
  .forever_cpuclk                     (forever_cpuclk                    ),
  .ld_da_data256                      (ld_da_data256                     ),
  .ld_da_vb_borrow_vb_x               (ld_da_vb_borrow_vb[1]             ),
  .pad_yy_icg_scan_en                 (pad_yy_icg_scan_en                ),
  .sdb_create_data_order              (sdb_create_data_order             ),
  .sdb_create_en_x                    (sdb_create_en[1]                  ),
  .sdb_data_vld_x                     (sdb_data_vld[1]                   ),
  .sdb_entry_avail_x                  (sdb_entry_avail[1]                ),
  .sdb_entry_data_index               (sdb_entry_data_index              ),
  .sdb_entry_data_v                   (sdb_entry_data_1                  ),
  .sdb_inv_en_x                       (sdb_inv_en[1]                     ),
  .sdb_vld_x                          (sdb_vld[1]                        ),
  .snq_data_bypass_hit_x              (snq_data_bypass_hit[1]            ),
  .snq_vb_bypass_invalid_x            (snq_vb_bypass_invalid[1]          ),
  .snq_vb_bypass_readonce             (snq_vb_bypass_readonce            ),
  .snq_vb_bypass_start_x              (snq_vb_bypass_start[1]            ),
  .vb_data_entry_addr_id_v            (vb_data_entry_addr_id_1           ),
  .vb_data_entry_biu_req_success_x    (vb_data_entry_biu_req_success[1]  ),
  .vb_data_entry_biu_req_x            (vb_data_entry_biu_req[1]          ),
  .vb_data_entry_bypass_pop_x         (vb_data_entry_bypass_pop[1]       ),
  .vb_data_entry_create_dp_vld_x      (vb_data_entry_create_dp_vld[1]    ),
  .vb_data_entry_create_gateclk_en_x  (vb_data_entry_create_gateclk_en[1]),
  .vb_data_entry_create_vld_x         (vb_data_entry_create_vld[1]       ),
  .vb_data_entry_dirty_x              (vb_data_entry_dirty[1]            ),
  .vb_data_entry_inv_x                (vb_data_entry_inv[1]              ),
  .vb_data_entry_lfb_create_x         (vb_data_entry_lfb_create[1]       ),
  .vb_data_entry_normal_pop_x         (vb_data_entry_normal_pop[1]       ),
  .vb_data_entry_req_success_x        (vb_data_entry_req_success[1]      ),
  .vb_data_entry_vld_x                (vb_data_entry_vld[1]              ),
  .vb_data_entry_wd_sm_grnt_x         (vb_data_entry_wd_sm_grnt[1]       ),
  .vb_data_entry_wd_sm_req_x          (vb_data_entry_wd_sm_req[1]        ),
  .vb_data_entry_write_data128_v      (vb_data_entry_write_data128_1     ),
  .vb_rcl_sm_addr_id                  (vb_rcl_sm_addr_id                 ),
  .vb_rcl_sm_data_dcache_dirty        (vb_rcl_sm_data_dcache_dirty       ),
  .vb_rcl_sm_data_set_data_done_x     (vb_rcl_sm_data_set_data_done[1]   ),
  .vb_rcl_sm_inv                      (vb_rcl_sm_inv                     ),
  .vb_rcl_sm_lfb_create               (vb_rcl_sm_lfb_create              ),
  .vb_sdb_data_entry_vld_x            (vb_sdb_data_entry_vld[1]          ),
  .vb_wd_sm_data_bias                 (vb_wd_sm_data_bias                ),
  .vb_wd_sm_data_pop_req_x            (vb_wd_sm_data_pop_req[1]          )
);


// &ConnRule(s/_x$/[2]/); @44
// &ConnRule(s/_v$/_2/); @45
// &Instance("ct_lsu_vb_sdb_data_entry","x_ct_lsu_vb_sdb_data_entry_2"); @46
ct_lsu_vb_sdb_data_entry  x_ct_lsu_vb_sdb_data_entry_2 (
  .cp0_lsu_icg_en                     (cp0_lsu_icg_en                    ),
  .cpurst_b                           (cpurst_b                          ),
  .forever_cpuclk                     (forever_cpuclk                    ),
  .ld_da_data256                      (ld_da_data256                     ),
  .ld_da_vb_borrow_vb_x               (ld_da_vb_borrow_vb[2]             ),
  .pad_yy_icg_scan_en                 (pad_yy_icg_scan_en                ),
  .sdb_create_data_order              (sdb_create_data_order             ),
  .sdb_create_en_x                    (sdb_create_en[2]                  ),
  .sdb_data_vld_x                     (sdb_data_vld[2]                   ),
  .sdb_entry_avail_x                  (sdb_entry_avail[2]                ),
  .sdb_entry_data_index               (sdb_entry_data_index              ),
  .sdb_entry_data_v                   (sdb_entry_data_2                  ),
  .sdb_inv_en_x                       (sdb_inv_en[2]                     ),
  .sdb_vld_x                          (sdb_vld[2]                        ),
  .snq_data_bypass_hit_x              (snq_data_bypass_hit[2]            ),
  .snq_vb_bypass_invalid_x            (snq_vb_bypass_invalid[2]          ),
  .snq_vb_bypass_readonce             (snq_vb_bypass_readonce            ),
  .snq_vb_bypass_start_x              (snq_vb_bypass_start[2]            ),
  .vb_data_entry_addr_id_v            (vb_data_entry_addr_id_2           ),
  .vb_data_entry_biu_req_success_x    (vb_data_entry_biu_req_success[2]  ),
  .vb_data_entry_biu_req_x            (vb_data_entry_biu_req[2]          ),
  .vb_data_entry_bypass_pop_x         (vb_data_entry_bypass_pop[2]       ),
  .vb_data_entry_create_dp_vld_x      (vb_data_entry_create_dp_vld[2]    ),
  .vb_data_entry_create_gateclk_en_x  (vb_data_entry_create_gateclk_en[2]),
  .vb_data_entry_create_vld_x         (vb_data_entry_create_vld[2]       ),
  .vb_data_entry_dirty_x              (vb_data_entry_dirty[2]            ),
  .vb_data_entry_inv_x                (vb_data_entry_inv[2]              ),
  .vb_data_entry_lfb_create_x         (vb_data_entry_lfb_create[2]       ),
  .vb_data_entry_normal_pop_x         (vb_data_entry_normal_pop[2]       ),
  .vb_data_entry_req_success_x        (vb_data_entry_req_success[2]      ),
  .vb_data_entry_vld_x                (vb_data_entry_vld[2]              ),
  .vb_data_entry_wd_sm_grnt_x         (vb_data_entry_wd_sm_grnt[2]       ),
  .vb_data_entry_wd_sm_req_x          (vb_data_entry_wd_sm_req[2]        ),
  .vb_data_entry_write_data128_v      (vb_data_entry_write_data128_2     ),
  .vb_rcl_sm_addr_id                  (vb_rcl_sm_addr_id                 ),
  .vb_rcl_sm_data_dcache_dirty        (vb_rcl_sm_data_dcache_dirty       ),
  .vb_rcl_sm_data_set_data_done_x     (vb_rcl_sm_data_set_data_done[2]   ),
  .vb_rcl_sm_inv                      (vb_rcl_sm_inv                     ),
  .vb_rcl_sm_lfb_create               (vb_rcl_sm_lfb_create              ),
  .vb_sdb_data_entry_vld_x            (vb_sdb_data_entry_vld[2]          ),
  .vb_wd_sm_data_bias                 (vb_wd_sm_data_bias                ),
  .vb_wd_sm_data_pop_req_x            (vb_wd_sm_data_pop_req[2]          )
);


//==========================================================
//              Interface with VB
//==========================================================
//input

//output

//==========================================================
//              Interface with SNQ
//==========================================================
//input

//output

// &ModuleEnd; @62
endmodule


