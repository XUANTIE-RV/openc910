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
module ct_piu_other_io(
  ciu_ibiu_csr_cmplt,
  ciu_ibiu_csr_rdata,
  ciu_ibiu_dbgrq_b,
  ciu_ibiu_hpcp_l2of_int,
  ciu_ibiu_me_int,
  ciu_ibiu_ms_int,
  ciu_ibiu_mt_int,
  ciu_ibiu_se_int,
  ciu_ibiu_ss_int,
  ciu_ibiu_st_int,
  ciu_icg_en,
  cpurst_b,
  forever_cpuclk,
  ibiu_ciu_cnt_en,
  ibiu_ciu_csr_sel,
  ibiu_ciu_csr_wdata,
  ibiu_ciu_jdb_pm,
  ibiu_ciu_lpmd_b,
  l2cif_piu_read_data_vld,
  l2cif_piux_read_data,
  pad_yy_icg_scan_en,
  perr_l2pmp_x,
  piu_csr_sel,
  piu_l2cif_read_data,
  piu_l2cif_read_data_ecc,
  piu_l2cif_read_index,
  piu_l2cif_read_req,
  piu_l2cif_read_tag,
  piu_l2cif_read_tag_ecc,
  piu_l2cif_read_way,
  piu_regs_hpcp_cnt_en,
  piu_regs_op,
  piu_regs_sel,
  piu_regs_wdata,
  piu_sysio_jdb_pm,
  piu_sysio_lpmd_b,
  piu_xx_regs_no_op,
  pready_l2pmp_x,
  psel_l2pmp_x,
  regs_piu_cmplt,
  regs_piu_hpcp_l2of_int,
  regs_piux_rdata,
  sysio_piu_dbgrq_b,
  sysio_piu_me_int,
  sysio_piu_ms_int,
  sysio_piu_mt_int,
  sysio_piu_se_int,
  sysio_piu_ss_int,
  sysio_piu_st_int,
  x_prdata_l2pmp
);

// &Ports; @24
input            ciu_icg_en;             
input            cpurst_b;               
input            forever_cpuclk;         
input   [3  :0]  ibiu_ciu_cnt_en;        
input            ibiu_ciu_csr_sel;       
input   [79 :0]  ibiu_ciu_csr_wdata;     
input            ibiu_ciu_jdb_pm;        
input            ibiu_ciu_lpmd_b;        
input            l2cif_piu_read_data_vld; 
input   [127:0]  l2cif_piux_read_data;   
input            pad_yy_icg_scan_en;     
input            psel_l2pmp_x;           
input            regs_piu_cmplt;         
input   [3  :0]  regs_piu_hpcp_l2of_int; 
input   [63 :0]  regs_piux_rdata;        
input            sysio_piu_dbgrq_b;      
input            sysio_piu_me_int;       
input            sysio_piu_ms_int;       
input            sysio_piu_mt_int;       
input            sysio_piu_se_int;       
input            sysio_piu_ss_int;       
input            sysio_piu_st_int;       
output           ciu_ibiu_csr_cmplt;     
output  [127:0]  ciu_ibiu_csr_rdata;     
output           ciu_ibiu_dbgrq_b;       
output  [3  :0]  ciu_ibiu_hpcp_l2of_int; 
output           ciu_ibiu_me_int;        
output           ciu_ibiu_ms_int;        
output           ciu_ibiu_mt_int;        
output           ciu_ibiu_se_int;        
output           ciu_ibiu_ss_int;        
output           ciu_ibiu_st_int;        
output           perr_l2pmp_x;           
output           piu_csr_sel;            
output           piu_l2cif_read_data;    
output           piu_l2cif_read_data_ecc; 
output  [20 :0]  piu_l2cif_read_index;   
output           piu_l2cif_read_req;     
output           piu_l2cif_read_tag;     
output           piu_l2cif_read_tag_ecc; 
output  [3  :0]  piu_l2cif_read_way;     
output  [3  :0]  piu_regs_hpcp_cnt_en;   
output  [15 :0]  piu_regs_op;            
output           piu_regs_sel;           
output  [63 :0]  piu_regs_wdata;         
output  [1  :0]  piu_sysio_jdb_pm;       
output  [1  :0]  piu_sysio_lpmd_b;       
output           piu_xx_regs_no_op;      
output           pready_l2pmp_x;         
output  [31 :0]  x_prdata_l2pmp;         

// &Regs; @25

// &Wires; @26
wire             ciu_ibiu_csr_cmplt;     
wire    [127:0]  ciu_ibiu_csr_rdata;     
wire             ciu_ibiu_dbgrq_b;       
wire    [3  :0]  ciu_ibiu_hpcp_l2of_int; 
wire             ciu_ibiu_me_int;        
wire             ciu_ibiu_ms_int;        
wire             ciu_ibiu_mt_int;        
wire             ciu_ibiu_se_int;        
wire             ciu_ibiu_ss_int;        
wire             ciu_ibiu_st_int;        
wire             ciu_icg_en;             
wire             cpurst_b;               
wire             forever_cpuclk;         
wire    [3  :0]  ibiu_ciu_cnt_en;        
wire             ibiu_ciu_csr_sel;       
wire    [79 :0]  ibiu_ciu_csr_wdata;     
wire             ibiu_ciu_jdb_pm;        
wire             ibiu_ciu_lpmd_b;        
wire             l2cif_piu_read_data_vld; 
wire    [127:0]  l2cif_piux_read_data;   
wire             pad_yy_icg_scan_en;     
wire             perr_l2pmp_x;           
wire             piu_csr_sel;            
wire             piu_l2cif_read_data;    
wire             piu_l2cif_read_data_ecc; 
wire    [20 :0]  piu_l2cif_read_index;   
wire             piu_l2cif_read_req;     
wire             piu_l2cif_read_tag;     
wire             piu_l2cif_read_tag_ecc; 
wire    [3  :0]  piu_l2cif_read_way;     
wire    [3  :0]  piu_regs_hpcp_cnt_en;   
wire    [15 :0]  piu_regs_op;            
wire             piu_regs_sel;           
wire    [63 :0]  piu_regs_wdata;         
wire    [1  :0]  piu_sysio_jdb_pm;       
wire    [1  :0]  piu_sysio_lpmd_b;       
wire             piu_xx_regs_no_op;      
wire             pready_l2pmp_x;         
wire             psel_l2pmp_x;           
wire             regs_piu_cmplt;         
wire    [3  :0]  regs_piu_hpcp_l2of_int; 
wire    [63 :0]  regs_piux_rdata;        
wire             sysio_piu_dbgrq_b;      
wire             sysio_piu_me_int;       
wire             sysio_piu_ms_int;       
wire             sysio_piu_mt_int;       
wire             sysio_piu_se_int;       
wire             sysio_piu_ss_int;       
wire             sysio_piu_st_int;       
wire    [31 :0]  x_prdata_l2pmp;         


// &Instance("ct_piu_other_io_async", "x_ct_piu_other_io_async"); @29
// &Instance("ct_piu_other_io_sync", "x_ct_piu_other_io_sync"); @31
ct_piu_other_io_sync  x_ct_piu_other_io_sync (
  .ciu_ibiu_csr_cmplt      (ciu_ibiu_csr_cmplt     ),
  .ciu_ibiu_csr_rdata      (ciu_ibiu_csr_rdata     ),
  .ciu_ibiu_dbgrq_b        (ciu_ibiu_dbgrq_b       ),
  .ciu_ibiu_hpcp_l2of_int  (ciu_ibiu_hpcp_l2of_int ),
  .ciu_ibiu_me_int         (ciu_ibiu_me_int        ),
  .ciu_ibiu_ms_int         (ciu_ibiu_ms_int        ),
  .ciu_ibiu_mt_int         (ciu_ibiu_mt_int        ),
  .ciu_ibiu_se_int         (ciu_ibiu_se_int        ),
  .ciu_ibiu_ss_int         (ciu_ibiu_ss_int        ),
  .ciu_ibiu_st_int         (ciu_ibiu_st_int        ),
  .ciu_icg_en              (ciu_icg_en             ),
  .cpurst_b                (cpurst_b               ),
  .forever_cpuclk          (forever_cpuclk         ),
  .ibiu_ciu_cnt_en         (ibiu_ciu_cnt_en        ),
  .ibiu_ciu_csr_sel        (ibiu_ciu_csr_sel       ),
  .ibiu_ciu_csr_wdata      (ibiu_ciu_csr_wdata     ),
  .ibiu_ciu_jdb_pm         (ibiu_ciu_jdb_pm        ),
  .ibiu_ciu_lpmd_b         (ibiu_ciu_lpmd_b        ),
  .l2cif_piu_read_data_vld (l2cif_piu_read_data_vld),
  .l2cif_piux_read_data    (l2cif_piux_read_data   ),
  .pad_yy_icg_scan_en      (pad_yy_icg_scan_en     ),
  .perr_l2pmp_x            (perr_l2pmp_x           ),
  .piu_csr_sel             (piu_csr_sel            ),
  .piu_l2cif_read_data     (piu_l2cif_read_data    ),
  .piu_l2cif_read_data_ecc (piu_l2cif_read_data_ecc),
  .piu_l2cif_read_index    (piu_l2cif_read_index   ),
  .piu_l2cif_read_req      (piu_l2cif_read_req     ),
  .piu_l2cif_read_tag      (piu_l2cif_read_tag     ),
  .piu_l2cif_read_tag_ecc  (piu_l2cif_read_tag_ecc ),
  .piu_l2cif_read_way      (piu_l2cif_read_way     ),
  .piu_regs_hpcp_cnt_en    (piu_regs_hpcp_cnt_en   ),
  .piu_regs_op             (piu_regs_op            ),
  .piu_regs_sel            (piu_regs_sel           ),
  .piu_regs_wdata          (piu_regs_wdata         ),
  .piu_sysio_jdb_pm        (piu_sysio_jdb_pm       ),
  .piu_sysio_lpmd_b        (piu_sysio_lpmd_b       ),
  .piu_xx_regs_no_op       (piu_xx_regs_no_op      ),
  .pready_l2pmp_x          (pready_l2pmp_x         ),
  .psel_l2pmp_x            (psel_l2pmp_x           ),
  .regs_piu_cmplt          (regs_piu_cmplt         ),
  .regs_piu_hpcp_l2of_int  (regs_piu_hpcp_l2of_int ),
  .regs_piux_rdata         (regs_piux_rdata        ),
  .sysio_piu_dbgrq_b       (sysio_piu_dbgrq_b      ),
  .sysio_piu_me_int        (sysio_piu_me_int       ),
  .sysio_piu_ms_int        (sysio_piu_ms_int       ),
  .sysio_piu_mt_int        (sysio_piu_mt_int       ),
  .sysio_piu_se_int        (sysio_piu_se_int       ),
  .sysio_piu_ss_int        (sysio_piu_ss_int       ),
  .sysio_piu_st_int        (sysio_piu_st_int       ),
  .x_prdata_l2pmp          (x_prdata_l2pmp         )
);


// &ModuleEnd; @34
endmodule


