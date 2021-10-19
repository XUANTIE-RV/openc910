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

// &ModuleBeg; @18
module ct_ciu_bmbif(
  bmbif_ctcq_bar_req,
  bmbif_ctcq_mid,
  bmbif_ctcq_req_bus,
  bmbif_ncq_bar_req,
  bmbif_ncq_mid,
  bmbif_ncq_req_bus,
  bmbif_piu0_ctcq_grant,
  bmbif_piu0_ncq_grant,
  bmbif_piu0_snb0_grant,
  bmbif_piu0_snb1_grant,
  bmbif_piu1_ctcq_grant,
  bmbif_piu1_ncq_grant,
  bmbif_piu1_snb0_grant,
  bmbif_piu1_snb1_grant,
  bmbif_piu2_ctcq_grant,
  bmbif_piu2_ncq_grant,
  bmbif_piu2_snb0_grant,
  bmbif_piu2_snb1_grant,
  bmbif_piu3_ctcq_grant,
  bmbif_piu3_ncq_grant,
  bmbif_piu3_snb0_grant,
  bmbif_piu3_snb1_grant,
  bmbif_snb0_bar_req,
  bmbif_snb0_mid,
  bmbif_snb0_req_bus,
  bmbif_snb1_bar_req,
  bmbif_snb1_mid,
  bmbif_snb1_req_bus,
  ciu_icg_en,
  cpurst_b,
  ctcq_bmbif_bar_grant,
  forever_cpuclk,
  ncq_bmbif_bar_grant,
  pad_yy_icg_scan_en,
  piu0_bmbif_ctcq_req,
  piu0_bmbif_ncq_req,
  piu0_bmbif_req_bus,
  piu0_bmbif_snb0_req,
  piu0_bmbif_snb1_req,
  piu1_bmbif_ctcq_req,
  piu1_bmbif_ncq_req,
  piu1_bmbif_req_bus,
  piu1_bmbif_snb0_req,
  piu1_bmbif_snb1_req,
  piu2_bmbif_ctcq_req,
  piu2_bmbif_ncq_req,
  piu2_bmbif_req_bus,
  piu2_bmbif_snb0_req,
  piu2_bmbif_snb1_req,
  piu3_bmbif_ctcq_req,
  piu3_bmbif_ncq_req,
  piu3_bmbif_req_bus,
  piu3_bmbif_snb0_req,
  piu3_bmbif_snb1_req,
  snb0_bmbif_bar_grant,
  snb1_bmbif_bar_grant
);

// &Ports; @19
input          ciu_icg_en;           
input          cpurst_b;             
input          ctcq_bmbif_bar_grant; 
input          forever_cpuclk;       
input          ncq_bmbif_bar_grant;  
input          pad_yy_icg_scan_en;   
input          piu0_bmbif_ctcq_req;  
input          piu0_bmbif_ncq_req;   
input   [8:0]  piu0_bmbif_req_bus;   
input          piu0_bmbif_snb0_req;  
input          piu0_bmbif_snb1_req;  
input          piu1_bmbif_ctcq_req;  
input          piu1_bmbif_ncq_req;   
input   [8:0]  piu1_bmbif_req_bus;   
input          piu1_bmbif_snb0_req;  
input          piu1_bmbif_snb1_req;  
input          piu2_bmbif_ctcq_req;  
input          piu2_bmbif_ncq_req;   
input   [8:0]  piu2_bmbif_req_bus;   
input          piu2_bmbif_snb0_req;  
input          piu2_bmbif_snb1_req;  
input          piu3_bmbif_ctcq_req;  
input          piu3_bmbif_ncq_req;   
input   [8:0]  piu3_bmbif_req_bus;   
input          piu3_bmbif_snb0_req;  
input          piu3_bmbif_snb1_req;  
input          snb0_bmbif_bar_grant; 
input          snb1_bmbif_bar_grant; 
output         bmbif_ctcq_bar_req;   
output  [2:0]  bmbif_ctcq_mid;       
output  [8:0]  bmbif_ctcq_req_bus;   
output         bmbif_ncq_bar_req;    
output  [2:0]  bmbif_ncq_mid;        
output  [8:0]  bmbif_ncq_req_bus;    
output         bmbif_piu0_ctcq_grant; 
output         bmbif_piu0_ncq_grant; 
output         bmbif_piu0_snb0_grant; 
output         bmbif_piu0_snb1_grant; 
output         bmbif_piu1_ctcq_grant; 
output         bmbif_piu1_ncq_grant; 
output         bmbif_piu1_snb0_grant; 
output         bmbif_piu1_snb1_grant; 
output         bmbif_piu2_ctcq_grant; 
output         bmbif_piu2_ncq_grant; 
output         bmbif_piu2_snb0_grant; 
output         bmbif_piu2_snb1_grant; 
output         bmbif_piu3_ctcq_grant; 
output         bmbif_piu3_ncq_grant; 
output         bmbif_piu3_snb0_grant; 
output         bmbif_piu3_snb1_grant; 
output         bmbif_snb0_bar_req;   
output  [2:0]  bmbif_snb0_mid;       
output  [8:0]  bmbif_snb0_req_bus;   
output         bmbif_snb1_bar_req;   
output  [2:0]  bmbif_snb1_mid;       
output  [8:0]  bmbif_snb1_req_bus;   

// &Regs; @20

// &Wires; @21
wire           bmbif_ctcq_bar_req;   
wire    [2:0]  bmbif_ctcq_mid;       
wire    [8:0]  bmbif_ctcq_req_bus;   
wire           bmbif_ncq_bar_req;    
wire    [2:0]  bmbif_ncq_mid;        
wire    [8:0]  bmbif_ncq_req_bus;    
wire           bmbif_piu0_ctcq_grant; 
wire           bmbif_piu0_ncq_grant; 
wire           bmbif_piu0_snb0_grant; 
wire           bmbif_piu0_snb1_grant; 
wire           bmbif_piu1_ctcq_grant; 
wire           bmbif_piu1_ncq_grant; 
wire           bmbif_piu1_snb0_grant; 
wire           bmbif_piu1_snb1_grant; 
wire           bmbif_piu2_ctcq_grant; 
wire           bmbif_piu2_ncq_grant; 
wire           bmbif_piu2_snb0_grant; 
wire           bmbif_piu2_snb1_grant; 
wire           bmbif_piu3_ctcq_grant; 
wire           bmbif_piu3_ncq_grant; 
wire           bmbif_piu3_snb0_grant; 
wire           bmbif_piu3_snb1_grant; 
wire           bmbif_snb0_bar_req;   
wire    [2:0]  bmbif_snb0_mid;       
wire    [8:0]  bmbif_snb0_req_bus;   
wire           bmbif_snb1_bar_req;   
wire    [2:0]  bmbif_snb1_mid;       
wire    [8:0]  bmbif_snb1_req_bus;   
wire           ciu_icg_en;           
wire           cpurst_b;             
wire           ctcq_bmbif_bar_grant; 
wire           forever_cpuclk;       
wire           ncq_bmbif_bar_grant;  
wire           pad_yy_icg_scan_en;   
wire           piu0_bmbif_ctcq_req;  
wire           piu0_bmbif_ncq_req;   
wire    [8:0]  piu0_bmbif_req_bus;   
wire           piu0_bmbif_snb0_req;  
wire           piu0_bmbif_snb1_req;  
wire           piu1_bmbif_ctcq_req;  
wire           piu1_bmbif_ncq_req;   
wire    [8:0]  piu1_bmbif_req_bus;   
wire           piu1_bmbif_snb0_req;  
wire           piu1_bmbif_snb1_req;  
wire           piu2_bmbif_ctcq_req;  
wire           piu2_bmbif_ncq_req;   
wire    [8:0]  piu2_bmbif_req_bus;   
wire           piu2_bmbif_snb0_req;  
wire           piu2_bmbif_snb1_req;  
wire           piu3_bmbif_ctcq_req;  
wire           piu3_bmbif_ncq_req;   
wire    [8:0]  piu3_bmbif_req_bus;   
wire           piu3_bmbif_snb0_req;  
wire           piu3_bmbif_snb1_req;  
wire           snb0_bmbif_bar_grant; 
wire           snb1_bmbif_bar_grant; 


// &ConnRule(s/xx_/snb0_/); @23
// &Instance("ct_ciu_bmbif_kid","x_ct_ciu_bmbif_snb0"); @24
ct_ciu_bmbif_kid  x_ct_ciu_bmbif_snb0 (
  .bmbif_piu0_xx_grant   (bmbif_piu0_snb0_grant),
  .bmbif_piu1_xx_grant   (bmbif_piu1_snb0_grant),
  .bmbif_piu2_xx_grant   (bmbif_piu2_snb0_grant),
  .bmbif_piu3_xx_grant   (bmbif_piu3_snb0_grant),
  .bmbif_xx_bar_req      (bmbif_snb0_bar_req   ),
  .bmbif_xx_mid          (bmbif_snb0_mid       ),
  .bmbif_xx_req_bus      (bmbif_snb0_req_bus   ),
  .ciu_icg_en            (ciu_icg_en           ),
  .cpurst_b              (cpurst_b             ),
  .forever_cpuclk        (forever_cpuclk       ),
  .pad_yy_icg_scan_en    (pad_yy_icg_scan_en   ),
  .piu0_bmbif_req_bus    (piu0_bmbif_req_bus   ),
  .piu0_bmbif_xx_req     (piu0_bmbif_snb0_req  ),
  .piu1_bmbif_req_bus    (piu1_bmbif_req_bus   ),
  .piu1_bmbif_xx_req     (piu1_bmbif_snb0_req  ),
  .piu2_bmbif_req_bus    (piu2_bmbif_req_bus   ),
  .piu2_bmbif_xx_req     (piu2_bmbif_snb0_req  ),
  .piu3_bmbif_req_bus    (piu3_bmbif_req_bus   ),
  .piu3_bmbif_xx_req     (piu3_bmbif_snb0_req  ),
  .xx_bmbif_bar_grant    (snb0_bmbif_bar_grant )
);


// &ConnRule(s/xx_/snb1_/); @26
// &Instance("ct_ciu_bmbif_kid","x_ct_ciu_bmbif_snb1"); @27
ct_ciu_bmbif_kid  x_ct_ciu_bmbif_snb1 (
  .bmbif_piu0_xx_grant   (bmbif_piu0_snb1_grant),
  .bmbif_piu1_xx_grant   (bmbif_piu1_snb1_grant),
  .bmbif_piu2_xx_grant   (bmbif_piu2_snb1_grant),
  .bmbif_piu3_xx_grant   (bmbif_piu3_snb1_grant),
  .bmbif_xx_bar_req      (bmbif_snb1_bar_req   ),
  .bmbif_xx_mid          (bmbif_snb1_mid       ),
  .bmbif_xx_req_bus      (bmbif_snb1_req_bus   ),
  .ciu_icg_en            (ciu_icg_en           ),
  .cpurst_b              (cpurst_b             ),
  .forever_cpuclk        (forever_cpuclk       ),
  .pad_yy_icg_scan_en    (pad_yy_icg_scan_en   ),
  .piu0_bmbif_req_bus    (piu0_bmbif_req_bus   ),
  .piu0_bmbif_xx_req     (piu0_bmbif_snb1_req  ),
  .piu1_bmbif_req_bus    (piu1_bmbif_req_bus   ),
  .piu1_bmbif_xx_req     (piu1_bmbif_snb1_req  ),
  .piu2_bmbif_req_bus    (piu2_bmbif_req_bus   ),
  .piu2_bmbif_xx_req     (piu2_bmbif_snb1_req  ),
  .piu3_bmbif_req_bus    (piu3_bmbif_req_bus   ),
  .piu3_bmbif_xx_req     (piu3_bmbif_snb1_req  ),
  .xx_bmbif_bar_grant    (snb1_bmbif_bar_grant )
);


// &ConnRule(s/xx_/ncq_/); @29
// &Instance("ct_ciu_bmbif_kid","x_ct_ciu_bmbif_ncq"); @30
ct_ciu_bmbif_kid  x_ct_ciu_bmbif_ncq (
  .bmbif_piu0_xx_grant  (bmbif_piu0_ncq_grant),
  .bmbif_piu1_xx_grant  (bmbif_piu1_ncq_grant),
  .bmbif_piu2_xx_grant  (bmbif_piu2_ncq_grant),
  .bmbif_piu3_xx_grant  (bmbif_piu3_ncq_grant),
  .bmbif_xx_bar_req     (bmbif_ncq_bar_req   ),
  .bmbif_xx_mid         (bmbif_ncq_mid       ),
  .bmbif_xx_req_bus     (bmbif_ncq_req_bus   ),
  .ciu_icg_en           (ciu_icg_en          ),
  .cpurst_b             (cpurst_b            ),
  .forever_cpuclk       (forever_cpuclk      ),
  .pad_yy_icg_scan_en   (pad_yy_icg_scan_en  ),
  .piu0_bmbif_req_bus   (piu0_bmbif_req_bus  ),
  .piu0_bmbif_xx_req    (piu0_bmbif_ncq_req  ),
  .piu1_bmbif_req_bus   (piu1_bmbif_req_bus  ),
  .piu1_bmbif_xx_req    (piu1_bmbif_ncq_req  ),
  .piu2_bmbif_req_bus   (piu2_bmbif_req_bus  ),
  .piu2_bmbif_xx_req    (piu2_bmbif_ncq_req  ),
  .piu3_bmbif_req_bus   (piu3_bmbif_req_bus  ),
  .piu3_bmbif_xx_req    (piu3_bmbif_ncq_req  ),
  .xx_bmbif_bar_grant   (ncq_bmbif_bar_grant )
);


// &ConnRule(s/xx_/ctcq_/); @32
// &Instance("ct_ciu_bmbif_kid","x_ct_ciu_bmbif_ctcq"); @33
ct_ciu_bmbif_kid  x_ct_ciu_bmbif_ctcq (
  .bmbif_piu0_xx_grant   (bmbif_piu0_ctcq_grant),
  .bmbif_piu1_xx_grant   (bmbif_piu1_ctcq_grant),
  .bmbif_piu2_xx_grant   (bmbif_piu2_ctcq_grant),
  .bmbif_piu3_xx_grant   (bmbif_piu3_ctcq_grant),
  .bmbif_xx_bar_req      (bmbif_ctcq_bar_req   ),
  .bmbif_xx_mid          (bmbif_ctcq_mid       ),
  .bmbif_xx_req_bus      (bmbif_ctcq_req_bus   ),
  .ciu_icg_en            (ciu_icg_en           ),
  .cpurst_b              (cpurst_b             ),
  .forever_cpuclk        (forever_cpuclk       ),
  .pad_yy_icg_scan_en    (pad_yy_icg_scan_en   ),
  .piu0_bmbif_req_bus    (piu0_bmbif_req_bus   ),
  .piu0_bmbif_xx_req     (piu0_bmbif_ctcq_req  ),
  .piu1_bmbif_req_bus    (piu1_bmbif_req_bus   ),
  .piu1_bmbif_xx_req     (piu1_bmbif_ctcq_req  ),
  .piu2_bmbif_req_bus    (piu2_bmbif_req_bus   ),
  .piu2_bmbif_xx_req     (piu2_bmbif_ctcq_req  ),
  .piu3_bmbif_req_bus    (piu3_bmbif_req_bus   ),
  .piu3_bmbif_xx_req     (piu3_bmbif_ctcq_req  ),
  .xx_bmbif_bar_grant    (ctcq_bmbif_bar_grant )
);


// &ModuleEnd; @35
endmodule



