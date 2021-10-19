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
module ct_lsu_lq_entry(
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
  ld_dc_secd,
  lq_clk,
  lq_entry_create0_dp_vld_x,
  lq_entry_create0_vld_x,
  lq_entry_create1_dp_vld_x,
  lq_entry_create1_gateclk_en_x,
  lq_entry_create1_vld_x,
  lq_entry_create_gateclk_en_x,
  lq_entry_inst_hit_x,
  lq_entry_rar_spec_fail_x,
  lq_entry_raw_spec_fail_x,
  lq_entry_vld_x,
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
input           ld_dc_secd;                   
input           lq_clk;                       
input           lq_entry_create0_dp_vld_x;    
input           lq_entry_create0_vld_x;       
input           lq_entry_create1_dp_vld_x;    
input           lq_entry_create1_gateclk_en_x; 
input           lq_entry_create1_vld_x;       
input           lq_entry_create_gateclk_en_x; 
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
output          lq_entry_inst_hit_x;          
output          lq_entry_rar_spec_fail_x;     
output          lq_entry_raw_spec_fail_x;     
output          lq_entry_vld_x;               

// &Regs; @27
reg     [35:0]  lq_entry_addr0_tto4;          
reg     [15:0]  lq_entry_bytes_vld;           
reg     [6 :0]  lq_entry_iid;                 
reg             lq_entry_secd;                
reg             lq_entry_vld;                 

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
wire            ld_dc_secd;                   
wire            lq_clk;                       
wire            lq_entry_cmit_hit0;           
wire            lq_entry_cmit_hit1;           
wire            lq_entry_cmit_hit2;           
wire            lq_entry_cmit_vld;            
wire            lq_entry_create0_dp_vld;      
wire            lq_entry_create0_dp_vld_x;    
wire            lq_entry_create0_vld;         
wire            lq_entry_create0_vld_x;       
wire            lq_entry_create1_dp_vld;      
wire            lq_entry_create1_dp_vld_x;    
wire            lq_entry_create1_gateclk_en;  
wire            lq_entry_create1_gateclk_en_x; 
wire            lq_entry_create1_vld;         
wire            lq_entry_create1_vld_x;       
wire            lq_entry_create_clk;          
wire            lq_entry_create_clk_en;       
wire            lq_entry_create_gateclk_en;   
wire            lq_entry_create_gateclk_en_x; 
wire    [39:0]  lq_entry_from_ld_dc_addr0;    
wire    [39:0]  lq_entry_from_ld_dc_addr1;    
wire    [39:0]  lq_entry_from_st_dc_addr0;    
wire            lq_entry_iid_newer_than_ld_dc; 
wire            lq_entry_iid_newer_than_st_dc; 
wire            lq_entry_inst_hit;            
wire            lq_entry_inst_hit_x;          
wire            lq_entry_newer_than_ld_dc;    
wire            lq_entry_newer_than_st_dc;    
wire            lq_entry_pop_vld;             
wire            lq_entry_rar_addr1_do_hit;    
wire            lq_entry_rar_addr1_tto4_hit;  
wire            lq_entry_rar_addr_tto4_hit;   
wire            lq_entry_rar_do_hit;          
wire            lq_entry_rar_spec_fail;       
wire            lq_entry_rar_spec_fail0;      
wire            lq_entry_rar_spec_fail1;      
wire            lq_entry_rar_spec_fail_unmask; 
wire            lq_entry_rar_spec_fail_x;     
wire            lq_entry_raw_addr_tto4_hit;   
wire            lq_entry_raw_do_hit;          
wire            lq_entry_raw_spec_fail;       
wire            lq_entry_raw_spec_fail1;      
wire            lq_entry_raw_spec_fail_x;     
wire            lq_entry_vld_x;               
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


//==========================================================
//                 Instance of Gated Cell  
//==========================================================
assign lq_entry_create_clk_en = lq_entry_create_gateclk_en
                                || lq_entry_create1_gateclk_en;
// &Instance("gated_clk_cell", "x_lsu_lq_entry_create_gated_clk"); @35
gated_clk_cell  x_lsu_lq_entry_create_gated_clk (
  .clk_in                 (forever_cpuclk        ),
  .clk_out                (lq_entry_create_clk   ),
  .external_en            (1'b0                  ),
  .global_en              (cp0_yy_clk_en         ),
  .local_en               (lq_entry_create_clk_en),
  .module_en              (cp0_lsu_icg_en        ),
  .pad_yy_icg_scan_en     (pad_yy_icg_scan_en    )
);

// &Connect(.clk_in        (forever_cpuclk     ), @36
//          .external_en   (1'b0               ), @37
//          .global_en     (cp0_yy_clk_en      ), @38
//          .module_en     (cp0_lsu_icg_en     ), @39
//          .local_en      (lq_entry_create_clk_en), @40
//          .clk_out       (lq_entry_create_clk)); @41

//==========================================================
//                 Register
//==========================================================
//+-----------+
//| entry_vld |
//+-----------+
always @(posedge lq_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    lq_entry_vld  <=  1'b0;
  else if(lq_entry_pop_vld  ||  rtu_yy_xx_flush)
    lq_entry_vld  <=  1'b0;
  else if(lq_entry_create0_vld || lq_entry_create1_vld)
    lq_entry_vld  <=  1'b1;
end

//+-----------+------------+-----+--------+------+
//| addr_tto2 | bytes_vld0 | iid | deform | secd |
//+-----------+------------+-----+--------+------+
always @(posedge lq_entry_create_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
  begin
    lq_entry_addr0_tto4[`PA_WIDTH-5:0]  <=  {`PA_WIDTH-4{1'b0}};
    lq_entry_bytes_vld[15:0]  <=  16'b0;
    lq_entry_iid[6:0]         <=  7'b0;
    lq_entry_secd             <=  1'b0;
  end
  else if(lq_entry_create0_dp_vld)
  begin
    lq_entry_addr0_tto4[`PA_WIDTH-5:0] <=  lq_entry_from_ld_dc_addr0[`PA_WIDTH-1:4];
    lq_entry_bytes_vld[15:0]  <=  ld_dc_bytes_vld[15:0];
    lq_entry_iid[6:0]         <=  ld_dc_iid[6:0];
    lq_entry_secd             <=  ld_dc_secd;
  end
  else if(lq_entry_create1_dp_vld)
  begin
    lq_entry_addr0_tto4[`PA_WIDTH-5:0] <=  lq_entry_from_ld_dc_addr1[`PA_WIDTH-1:4];
    lq_entry_bytes_vld[15:0]  <=  ld_dc_bytes_vld1[15:0];
    lq_entry_iid[6:0]         <=  ld_dc_iid[6:0];
    lq_entry_secd             <=  1'b1;
  end
end

//==========================================================
//                 Generate pop signal
//==========================================================
assign lq_entry_cmit_hit0 = rtu_yy_xx_commit0
                            &&  lq_entry_vld
                            &&  (rtu_yy_xx_commit0_iid[6:0]  ==  lq_entry_iid[6:0]);
assign lq_entry_cmit_hit1 = rtu_yy_xx_commit1
                            &&  lq_entry_vld
                            &&  (rtu_yy_xx_commit1_iid[6:0]  ==  lq_entry_iid[6:0]);
assign lq_entry_cmit_hit2 = rtu_yy_xx_commit2
                            &&  lq_entry_vld
                            &&  (rtu_yy_xx_commit2_iid[6:0]  ==  lq_entry_iid[6:0]);

assign lq_entry_cmit_vld  = (lq_entry_cmit_hit0
                                ||  lq_entry_cmit_hit1
                                ||  lq_entry_cmit_hit2)
                            &&  lq_entry_vld;

assign lq_entry_pop_vld   = lq_entry_cmit_vld;

//==========================================================
//                 lq iid check
//==========================================================
//check iid to judge whether to create lq
assign lq_entry_inst_hit  = lq_entry_vld
                            &&  (lq_entry_secd  ==  ld_dc_secd)
                            &&  (lq_entry_iid[6:0] ==  ld_dc_iid[6:0]);

//==========================================================
//                 RAR speculation check
//==========================================================

// situat ld pipe             lq        addr      bytes_vld
// --------------------------------------------------------
// 0      ld/ldex             x         `PA_WIDTH-1:2      cross

//------------------compare signal--------------------------
//compare the instruction in the entry is newer or older
// &Instance("ct_rtu_compare_iid","x_lsu_lq_entry_compare_ld_dc_iid"); @125
ct_rtu_compare_iid  x_lsu_lq_entry_compare_ld_dc_iid (
  .x_iid0                        (ld_dc_iid[6:0]               ),
  .x_iid0_older                  (lq_entry_iid_newer_than_ld_dc),
  .x_iid1                        (lq_entry_iid[6:0]            )
);

// &Connect( .x_iid0         (ld_dc_iid[6:0]       ), @126
//           .x_iid1         (lq_entry_iid[6:0]    ), @127
//           .x_iid0_older   (lq_entry_iid_newer_than_ld_dc)); @128

assign lq_entry_newer_than_ld_dc  = lq_entry_vld
                                    &&  lq_entry_iid_newer_than_ld_dc;
//addr compare
assign lq_entry_from_ld_dc_addr0[`PA_WIDTH-1:0]  = ld_dc_addr0[`PA_WIDTH-1:0];
assign lq_entry_from_ld_dc_addr1[`PA_WIDTH-1:0]  = ld_dc_addr1[`PA_WIDTH-1:0];
assign lq_entry_rar_addr_tto4_hit   = lq_entry_addr0_tto4[`PA_WIDTH-5:0]
                                      ==  lq_entry_from_ld_dc_addr0[`PA_WIDTH-1:4];
assign lq_entry_rar_addr1_tto4_hit  = lq_entry_addr0_tto4[`PA_WIDTH-5:0]
                                      ==  lq_entry_from_ld_dc_addr1[`PA_WIDTH-1:4];  

//bytes_vld compare
assign lq_entry_rar_do_hit       = |(lq_entry_bytes_vld[15:0] & ld_dc_bytes_vld[15:0]);
assign lq_entry_rar_addr1_do_hit = |(lq_entry_bytes_vld[15:0] & ld_dc_bytes_vld1[15:0]);

//------------------situation 0-----------------------------
assign lq_entry_rar_spec_fail0 = lq_entry_newer_than_ld_dc
                                    &&  ld_dc_inst_chk_vld
                                    &&  lq_entry_rar_addr_tto4_hit
                                    &&  lq_entry_rar_do_hit;

assign lq_entry_rar_spec_fail1 = lq_entry_newer_than_ld_dc
                                    &&  ld_dc_chk_ld_addr1_vld
                                    &&  lq_entry_rar_addr1_tto4_hit
                                    &&  lq_entry_rar_addr1_do_hit;

//------------------combine---------------------------------
assign lq_entry_rar_spec_fail_unmask  = lq_entry_rar_spec_fail0 || lq_entry_rar_spec_fail1;

assign lq_entry_rar_spec_fail         = lq_entry_rar_spec_fail_unmask
                                        &&  !cp0_lsu_corr_dis;

//==========================================================
//                 RAW speculation check
//==========================================================
// situat st pipe             lq        addr      bytes_vld
// 1      st/stex             ld        `PA_WIDTH-1:4      x

//------------------compare signal--------------------------
//compare the instruction in the entry is newer or older
// &Instance("ct_rtu_compare_iid","x_lsu_lq_entry_compare_st_dc_iid"); @169
ct_rtu_compare_iid  x_lsu_lq_entry_compare_st_dc_iid (
  .x_iid0                        (st_dc_iid[6:0]               ),
  .x_iid0_older                  (lq_entry_iid_newer_than_st_dc),
  .x_iid1                        (lq_entry_iid[6:0]            )
);

// &Connect( .x_iid0         (st_dc_iid[6:0]       ), @170
//           .x_iid1         (lq_entry_iid[6:0]    ), @171
//           .x_iid0_older   (lq_entry_iid_newer_than_st_dc)); @172

assign lq_entry_newer_than_st_dc  = lq_entry_vld
                                    &&  lq_entry_iid_newer_than_st_dc;
//addr0 compare
assign lq_entry_from_st_dc_addr0[`PA_WIDTH-1:0] = st_dc_addr0[`PA_WIDTH-1:0];
assign lq_entry_raw_addr_tto4_hit   = lq_entry_addr0_tto4[`PA_WIDTH-5:0]
                                      ==  lq_entry_from_st_dc_addr0[`PA_WIDTH-1:4];

//bytes_vld compare
assign lq_entry_raw_do_hit       = |(lq_entry_bytes_vld[15:0]  & st_dc_bytes_vld[15:0]);

//------------------situation 1-----------------------------
assign lq_entry_raw_spec_fail1    = lq_entry_newer_than_st_dc
                                    &&  (st_dc_chk_st_inst_vld  ||  st_dc_chk_statomic_inst_vld)
                                    &&  lq_entry_raw_addr_tto4_hit
                                    &&  lq_entry_raw_do_hit;

//------------------combine---------------------------------
assign lq_entry_raw_spec_fail     = lq_entry_raw_spec_fail1;

//==========================================================
//                 Generate interface
//==========================================================
//------------------input-----------------------------------
assign lq_entry_create0_vld         = lq_entry_create0_vld_x;
assign lq_entry_create1_vld         = lq_entry_create1_vld_x;
assign lq_entry_create0_dp_vld      = lq_entry_create0_dp_vld_x;
assign lq_entry_create1_dp_vld      = lq_entry_create1_dp_vld_x;
assign lq_entry_create_gateclk_en   = lq_entry_create_gateclk_en_x;
assign lq_entry_create1_gateclk_en  = lq_entry_create1_gateclk_en_x;
//------------------output----------------------------------
assign lq_entry_vld_x               = lq_entry_vld;
assign lq_entry_inst_hit_x          = lq_entry_inst_hit;
assign lq_entry_rar_spec_fail_x     = lq_entry_rar_spec_fail;
assign lq_entry_raw_spec_fail_x     = lq_entry_raw_spec_fail;

// &ModuleEnd; @209
endmodule


