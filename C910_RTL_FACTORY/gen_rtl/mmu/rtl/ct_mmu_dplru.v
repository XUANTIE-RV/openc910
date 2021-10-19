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
module ct_mmu_dplru(
  cp0_mmu_icg_en,
  cpurst_b,
  entry0_vld,
  entry10_vld,
  entry11_vld,
  entry12_vld,
  entry13_vld,
  entry14_vld,
  entry15_vld,
  entry1_vld,
  entry2_vld,
  entry3_vld,
  entry4_vld,
  entry5_vld,
  entry6_vld,
  entry7_vld,
  entry8_vld,
  entry9_vld,
  forever_cpuclk,
  pad_yy_icg_scan_en,
  plru_dutlb_ref_num,
  utlb_plru_read_hit0,
  utlb_plru_read_hit1,
  utlb_plru_read_hit_vld0,
  utlb_plru_read_hit_vld1,
  utlb_plru_refill_on,
  utlb_plru_refill_vld
);

// &Ports; @24
input           cp0_mmu_icg_en;         
input           cpurst_b;               
input           entry0_vld;             
input           entry10_vld;            
input           entry11_vld;            
input           entry12_vld;            
input           entry13_vld;            
input           entry14_vld;            
input           entry15_vld;            
input           entry1_vld;             
input           entry2_vld;             
input           entry3_vld;             
input           entry4_vld;             
input           entry5_vld;             
input           entry6_vld;             
input           entry7_vld;             
input           entry8_vld;             
input           entry9_vld;             
input           forever_cpuclk;         
input           pad_yy_icg_scan_en;     
input   [15:0]  utlb_plru_read_hit0;    
input   [15:0]  utlb_plru_read_hit1;    
input           utlb_plru_read_hit_vld0; 
input           utlb_plru_read_hit_vld1; 
input           utlb_plru_refill_on;    
input           utlb_plru_refill_vld;   
output  [15:0]  plru_dutlb_ref_num;     

// &Regs; @25
reg     [3 :0]  hit_num_flop0;          
reg     [3 :0]  hit_num_flop1;          
reg     [3 :0]  hit_num_index0;         
reg     [3 :0]  hit_num_index1;         
reg             p00;                    
reg             p10;                    
reg             p11;                    
reg             p20;                    
reg             p21;                    
reg             p22;                    
reg             p23;                    
reg             p30;                    
reg             p31;                    
reg             p32;                    
reg             p33;                    
reg             p34;                    
reg             p35;                    
reg             p36;                    
reg             p37;                    
reg     [3 :0]  refill_num_index;       
reg     [15:0]  refill_num_onehot;      
reg     [3 :0]  write_num;              

// &Wires; @26
wire            cp0_mmu_icg_en;         
wire            cpurst_b;               
wire            entry0_vld;             
wire            entry10_vld;            
wire            entry11_vld;            
wire            entry12_vld;            
wire            entry13_vld;            
wire            entry14_vld;            
wire            entry15_vld;            
wire            entry1_vld;             
wire            entry2_vld;             
wire            entry3_vld;             
wire            entry4_vld;             
wire            entry5_vld;             
wire            entry6_vld;             
wire            entry7_vld;             
wire            entry8_vld;             
wire            entry9_vld;             
wire            forever_cpuclk;         
wire    [15:0]  hit_num_onehot0;        
wire    [15:0]  hit_num_onehot1;        
wire            lru_clk;                
wire            lru_clk_en;             
wire            p00_read_updt;          
wire            p00_read_updt_val;      
wire            p00_write_updt;         
wire            p00_write_updt_val;     
wire            p10_rdupdt_by_va0;      
wire            p10_rdupdt_by_va01;     
wire            p10_rdupdt_by_va1;      
wire            p10_read_updt0;         
wire            p10_read_updt1;         
wire            p10_read_updt_val0;     
wire            p10_read_updt_val1;     
wire            p10_write_updt;         
wire            p10_write_updt_val;     
wire            p11_rdupdt_by_va0;      
wire            p11_rdupdt_by_va01;     
wire            p11_rdupdt_by_va1;      
wire            p11_read_updt0;         
wire            p11_read_updt1;         
wire            p11_read_updt_val0;     
wire            p11_read_updt_val1;     
wire            p11_write_updt;         
wire            p11_write_updt_val;     
wire            p20_rdupdt_by_va0;      
wire            p20_rdupdt_by_va01;     
wire            p20_rdupdt_by_va1;      
wire            p20_read_updt0;         
wire            p20_read_updt1;         
wire            p20_read_updt_val0;     
wire            p20_read_updt_val1;     
wire            p20_write_updt;         
wire            p20_write_updt_val;     
wire            p21_rdupdt_by_va0;      
wire            p21_rdupdt_by_va01;     
wire            p21_rdupdt_by_va1;      
wire            p21_read_updt0;         
wire            p21_read_updt1;         
wire            p21_read_updt_val0;     
wire            p21_read_updt_val1;     
wire            p21_write_updt;         
wire            p21_write_updt_val;     
wire            p22_rdupdt_by_va0;      
wire            p22_rdupdt_by_va01;     
wire            p22_rdupdt_by_va1;      
wire            p22_read_updt0;         
wire            p22_read_updt1;         
wire            p22_read_updt_val0;     
wire            p22_read_updt_val1;     
wire            p22_write_updt;         
wire            p22_write_updt_val;     
wire            p23_rdupdt_by_va0;      
wire            p23_rdupdt_by_va01;     
wire            p23_rdupdt_by_va1;      
wire            p23_read_updt0;         
wire            p23_read_updt1;         
wire            p23_read_updt_val0;     
wire            p23_read_updt_val1;     
wire            p23_write_updt;         
wire            p23_write_updt_val;     
wire            p30_rdupdt_by_va0;      
wire            p30_rdupdt_by_va01;     
wire            p30_rdupdt_by_va1;      
wire            p30_read_updt0;         
wire            p30_read_updt1;         
wire            p30_read_updt_val0;     
wire            p30_read_updt_val1;     
wire            p30_write_updt;         
wire            p30_write_updt_val;     
wire            p31_rdupdt_by_va0;      
wire            p31_rdupdt_by_va01;     
wire            p31_rdupdt_by_va1;      
wire            p31_read_updt0;         
wire            p31_read_updt1;         
wire            p31_read_updt_val0;     
wire            p31_read_updt_val1;     
wire            p31_write_updt;         
wire            p31_write_updt_val;     
wire            p32_rdupdt_by_va0;      
wire            p32_rdupdt_by_va01;     
wire            p32_rdupdt_by_va1;      
wire            p32_read_updt0;         
wire            p32_read_updt1;         
wire            p32_read_updt_val0;     
wire            p32_read_updt_val1;     
wire            p32_write_updt;         
wire            p32_write_updt_val;     
wire            p33_rdupdt_by_va0;      
wire            p33_rdupdt_by_va01;     
wire            p33_rdupdt_by_va1;      
wire            p33_read_updt0;         
wire            p33_read_updt1;         
wire            p33_read_updt_val0;     
wire            p33_read_updt_val1;     
wire            p33_write_updt;         
wire            p33_write_updt_val;     
wire            p34_rdupdt_by_va0;      
wire            p34_rdupdt_by_va01;     
wire            p34_rdupdt_by_va1;      
wire            p34_read_updt0;         
wire            p34_read_updt1;         
wire            p34_read_updt_val0;     
wire            p34_read_updt_val1;     
wire            p34_write_updt;         
wire            p34_write_updt_val;     
wire            p35_rdupdt_by_va0;      
wire            p35_rdupdt_by_va01;     
wire            p35_rdupdt_by_va1;      
wire            p35_read_updt0;         
wire            p35_read_updt1;         
wire            p35_read_updt_val0;     
wire            p35_read_updt_val1;     
wire            p35_write_updt;         
wire            p35_write_updt_val;     
wire            p36_rdupdt_by_va0;      
wire            p36_rdupdt_by_va01;     
wire            p36_rdupdt_by_va1;      
wire            p36_read_updt0;         
wire            p36_read_updt1;         
wire            p36_read_updt_val0;     
wire            p36_read_updt_val1;     
wire            p36_write_updt;         
wire            p36_write_updt_val;     
wire            p37_rdupdt_by_va0;      
wire            p37_rdupdt_by_va01;     
wire            p37_rdupdt_by_va1;      
wire            p37_read_updt0;         
wire            p37_read_updt1;         
wire            p37_read_updt_val0;     
wire            p37_read_updt_val1;     
wire            p37_write_updt;         
wire            p37_write_updt_val;     
wire            pad_yy_icg_scan_en;     
wire    [15:0]  plru_dutlb_ref_num;     
wire    [3 :0]  plru_num;               
wire            plru_read_updt;         
wire            plru_read_updt0;        
wire            plru_read_updt1;        
wire            plru_write_updt;        
wire    [15:0]  utlb_plru_read_hit0;    
wire    [15:0]  utlb_plru_read_hit1;    
wire            utlb_plru_read_hit_vld0; 
wire            utlb_plru_read_hit_vld1; 
wire            utlb_plru_refill_on;    
wire            utlb_plru_refill_vld;   
wire    [15:0]  vld_entry_num;          



//==========================================================
//                  Gate Cell
//==========================================================
assign lru_clk_en = utlb_plru_refill_on
                || plru_read_updt0
                || plru_read_updt1;
// &Instance("gated_clk_cell", "x_dplru_gateclk"); @35
gated_clk_cell  x_dplru_gateclk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (lru_clk           ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (lru_clk_en        ),
  .module_en          (cp0_mmu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect( .clk_in     (forever_cpuclk), @36
//           .external_en(1'b0          ), @37
//           .global_en  (1'b1          ), @38
//           .module_en  (cp0_mmu_icg_en), @39
//           .local_en   (lru_clk_en    ), @40
//           .clk_out    (lru_clk       ) @41
//          ); @42



//==========================================================
//                  Entry sel for Refill
//==========================================================
assign vld_entry_num[15:0] = {entry15_vld, entry14_vld, entry13_vld, entry12_vld,
                              entry11_vld, entry10_vld, entry9_vld,  entry8_vld,
                              entry7_vld,  entry6_vld,  entry5_vld,  entry4_vld,
                              entry3_vld,  entry2_vld,  entry1_vld,  entry0_vld};  
// &CombBeg; @53
always @( plru_num[3:0]
       or vld_entry_num[15:0])
begin
casez(vld_entry_num[15:0])
  16'b???????????????0: write_num[3:0] = 4'b0000;
  16'b??????????????01: write_num[3:0] = 4'b0001;
  16'b?????????????011: write_num[3:0] = 4'b0010;
  16'b????????????0111: write_num[3:0] = 4'b0011;
  16'b???????????01111: write_num[3:0] = 4'b0100;
  16'b??????????011111: write_num[3:0] = 4'b0101;
  16'b?????????0111111: write_num[3:0] = 4'b0110;
  16'b????????01111111: write_num[3:0] = 4'b0111;
  16'b???????011111111: write_num[3:0] = 4'b1000;
  16'b??????0111111111: write_num[3:0] = 4'b1001;
  16'b?????01111111111: write_num[3:0] = 4'b1010;
  16'b????011111111111: write_num[3:0] = 4'b1011;
  16'b???0111111111111: write_num[3:0] = 4'b1100;
  16'b??01111111111111: write_num[3:0] = 4'b1101;
  16'b?011111111111111: write_num[3:0] = 4'b1110;
  16'b0111111111111111: write_num[3:0] = 4'b1111;
  16'b1111111111111111: write_num[3:0] = plru_num[3:0];
endcase
// &CombEnd; @73
end


always @(posedge lru_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    refill_num_index[3:0] <= 4'b0;
  else if(utlb_plru_refill_on)
    refill_num_index[3:0] <= write_num[3:0];
end


// &CombBeg; @85
always @( refill_num_index[3:0])
begin
case(refill_num_index[3:0])
  4'b0000: refill_num_onehot[15:0] = 16'b0000000000000001;
  4'b0001: refill_num_onehot[15:0] = 16'b0000000000000010;
  4'b0010: refill_num_onehot[15:0] = 16'b0000000000000100;
  4'b0011: refill_num_onehot[15:0] = 16'b0000000000001000;
  4'b0100: refill_num_onehot[15:0] = 16'b0000000000010000;
  4'b0101: refill_num_onehot[15:0] = 16'b0000000000100000;
  4'b0110: refill_num_onehot[15:0] = 16'b0000000001000000;
  4'b0111: refill_num_onehot[15:0] = 16'b0000000010000000;
  4'b1000: refill_num_onehot[15:0] = 16'b0000000100000000;
  4'b1001: refill_num_onehot[15:0] = 16'b0000001000000000;
  4'b1010: refill_num_onehot[15:0] = 16'b0000010000000000;
  4'b1011: refill_num_onehot[15:0] = 16'b0000100000000000;
  4'b1100: refill_num_onehot[15:0] = 16'b0001000000000000;
  4'b1101: refill_num_onehot[15:0] = 16'b0010000000000000;
  4'b1110: refill_num_onehot[15:0] = 16'b0100000000000000;
  4'b1111: refill_num_onehot[15:0] = 16'b1000000000000000;
endcase
// &CombEnd; @104
end




//----------------------------------------------------------
//                  Final Refill Sel to uTLB
//----------------------------------------------------------
assign plru_dutlb_ref_num[15:0] = refill_num_onehot[15:0];


//==========================================================
//                  Read Update
//==========================================================
// When utlb hit with different entry, updata PLRU path flop
assign hit_num_onehot0[15:0] = utlb_plru_read_hit0[15:0];
// &CombBeg; @120
always @( hit_num_onehot0[15:0])
begin
case(hit_num_onehot0[15:0])
  16'b0000000000000001: hit_num_index0[3:0] = 4'b0000;
  16'b0000000000000010: hit_num_index0[3:0] = 4'b0001;
  16'b0000000000000100: hit_num_index0[3:0] = 4'b0010;
  16'b0000000000001000: hit_num_index0[3:0] = 4'b0011;
  16'b0000000000010000: hit_num_index0[3:0] = 4'b0100;
  16'b0000000000100000: hit_num_index0[3:0] = 4'b0101;
  16'b0000000001000000: hit_num_index0[3:0] = 4'b0110;
  16'b0000000010000000: hit_num_index0[3:0] = 4'b0111;
  16'b0000000100000000: hit_num_index0[3:0] = 4'b1000;
  16'b0000001000000000: hit_num_index0[3:0] = 4'b1001;
  16'b0000010000000000: hit_num_index0[3:0] = 4'b1010;
  16'b0000100000000000: hit_num_index0[3:0] = 4'b1011;
  16'b0001000000000000: hit_num_index0[3:0] = 4'b1100;
  16'b0010000000000000: hit_num_index0[3:0] = 4'b1101;
  16'b0100000000000000: hit_num_index0[3:0] = 4'b1110;
  16'b1000000000000000: hit_num_index0[3:0] = 4'b1111;
  default             : hit_num_index0[3:0] = 4'b0000;
endcase
// &CombEnd; @140
end


always @(posedge lru_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    hit_num_flop0[3:0] <= 4'b0;
  else if(utlb_plru_read_hit_vld0)
    hit_num_flop0[3:0] <= hit_num_index0[3:0];
end


assign hit_num_onehot1[15:0] = utlb_plru_read_hit1[15:0];
// &CombBeg; @153
always @( hit_num_onehot1[15:0])
begin
case(hit_num_onehot1[15:0])
  16'b0000000000000001: hit_num_index1[3:0] = 4'b0000;
  16'b0000000000000010: hit_num_index1[3:0] = 4'b0001;
  16'b0000000000000100: hit_num_index1[3:0] = 4'b0010;
  16'b0000000000001000: hit_num_index1[3:0] = 4'b0011;
  16'b0000000000010000: hit_num_index1[3:0] = 4'b0100;
  16'b0000000000100000: hit_num_index1[3:0] = 4'b0101;
  16'b0000000001000000: hit_num_index1[3:0] = 4'b0110;
  16'b0000000010000000: hit_num_index1[3:0] = 4'b0111;
  16'b0000000100000000: hit_num_index1[3:0] = 4'b1000;
  16'b0000001000000000: hit_num_index1[3:0] = 4'b1001;
  16'b0000010000000000: hit_num_index1[3:0] = 4'b1010;
  16'b0000100000000000: hit_num_index1[3:0] = 4'b1011;
  16'b0001000000000000: hit_num_index1[3:0] = 4'b1100;
  16'b0010000000000000: hit_num_index1[3:0] = 4'b1101;
  16'b0100000000000000: hit_num_index1[3:0] = 4'b1110;
  16'b1000000000000000: hit_num_index1[3:0] = 4'b1111;
  default             : hit_num_index1[3:0] = 4'b0000;
endcase
// &CombEnd; @173
end


always @(posedge lru_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    hit_num_flop1[3:0] <= 4'b0;
  else if(utlb_plru_read_hit_vld1)
    hit_num_flop1[3:0] <= hit_num_index1[3:0];
end



//==========================================================
//                  PLRU Path Flop
//==========================================================
//                             P00
//                             /\
//                            /  \
//                           /    \
//                         0/      \1
//                         /        \
//                     P10            P11
//                      /\           /\
//                    0/  \1       0/  \1
//                    /    \       /    \
//                P20     P21     P22     P23
//               /\      /\       /\       /\
//             0/  \1  0/  \1   0/  \1   0/  \1
//            P30 P31  P32 P33  P34 P35  P36 P37          

assign plru_write_updt = utlb_plru_refill_vld;
assign plru_read_updt0 = utlb_plru_read_hit_vld0
                            && (hit_num_flop0[3:0] != hit_num_index0[3:0]);
assign plru_read_updt1 = utlb_plru_read_hit_vld1
                            && (hit_num_flop1[3:0] != hit_num_index1[3:0]); 
assign plru_read_updt  = plru_read_updt0 || plru_read_updt1;

//----------------------------------------------------------
//                  Level 0 Path
//----------------------------------------------------------
// Path 0
assign p00_write_updt     = plru_write_updt;
assign p00_read_updt      = plru_read_updt
                        && (hit_num_index0[3] == hit_num_index1[3]);

assign p00_write_updt_val = !refill_num_index[3];
assign p00_read_updt_val  = !hit_num_index0[3];

always @(posedge lru_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    p00 <= 1'b0;
  else if(p00_write_updt)
    p00 <= p00_write_updt_val;
  else if(p00_read_updt)
    p00 <= p00_read_updt_val;
end


//----------------------------------------------------------
//                  Level 1 Path
//----------------------------------------------------------
// Path 10
assign p10_write_updt     = plru_write_updt && !refill_num_index[3];
assign p10_read_updt0     = plru_read_updt0 && !hit_num_index0[3];
assign p10_read_updt1     = plru_read_updt1 && !hit_num_index1[3];

assign p10_write_updt_val = (refill_num_index[3:2] == 2'b00); 
assign p10_read_updt_val0 = (hit_num_index0[3:2] == 2'b00);
assign p10_read_updt_val1 = (hit_num_index1[3:2] == 2'b00);

assign p10_rdupdt_by_va0  =  p10_read_updt0 && !p10_read_updt1;
assign p10_rdupdt_by_va1  = !p10_read_updt0 &&  p10_read_updt1;
assign p10_rdupdt_by_va01 = (p10_read_updt0 &&  p10_read_updt1)
                         && (p10_read_updt_val0 ^~ p10_read_updt_val1);

always @(posedge lru_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    p10 <= 1'b0;
  else if(p10_write_updt)
    p10 <= p10_write_updt_val;
  else if(p10_rdupdt_by_va0 || p10_rdupdt_by_va01)
    p10 <= p10_read_updt_val0;
  else if(p10_rdupdt_by_va1)
    p10 <= p10_read_updt_val1;
end

// Path 11
assign p11_write_updt     = plru_write_updt && refill_num_index[3];
assign p11_read_updt0     = plru_read_updt0  && hit_num_index0[3];
assign p11_read_updt1     = plru_read_updt1  && hit_num_index1[3];

assign p11_write_updt_val = (refill_num_index[3:2] == 2'b10);
assign p11_read_updt_val0 = (hit_num_index0[3:2] == 2'b10);
assign p11_read_updt_val1 = (hit_num_index1[3:2] == 2'b10);

assign p11_rdupdt_by_va0  =  p11_read_updt0 && !p11_read_updt1;
assign p11_rdupdt_by_va1  = !p11_read_updt0 &&  p11_read_updt1;
assign p11_rdupdt_by_va01 = (p11_read_updt0 &&  p11_read_updt1)
                         && (p11_read_updt_val0 ^~ p11_read_updt_val1);

always @(posedge lru_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    p11 <= 1'b0;
  else if(p11_write_updt)
    p11 <= p11_write_updt_val;
  else if(p11_rdupdt_by_va0 || p11_rdupdt_by_va01)
    p11 <= p11_read_updt_val0;
 else if(p11_rdupdt_by_va1)
    p11 <= p11_read_updt_val1;
end


//----------------------------------------------------------
//                  Level 2 Path
//----------------------------------------------------------
// Path 20
assign p20_write_updt     = plru_write_updt
                         && (refill_num_index[3:2] == 2'b00);
assign p20_read_updt0     = plru_read_updt0
                         && (hit_num_index0[3:2] == 2'b00);
assign p20_read_updt1     = plru_read_updt1
                         && (hit_num_index1[3:2] == 2'b00);

assign p20_write_updt_val = (refill_num_index[3:1] == 3'b000);
assign p20_read_updt_val0 = (hit_num_index0[3:1] == 3'b000);
assign p20_read_updt_val1 = (hit_num_index1[3:1] == 3'b000);

assign p20_rdupdt_by_va0  =  p20_read_updt0 && !p20_read_updt1;
assign p20_rdupdt_by_va1  = !p20_read_updt0 &&  p20_read_updt1;
assign p20_rdupdt_by_va01 = (p20_read_updt0 &&  p20_read_updt1)
                         && (p20_read_updt_val0 ^~ p20_read_updt_val1);

always @(posedge lru_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    p20 <= 1'b0;
  else if(p20_write_updt)
    p20 <= p20_write_updt_val;
  else if(p20_rdupdt_by_va0 || p20_rdupdt_by_va01)
    p20 <= p20_read_updt_val0;
  else if(p20_rdupdt_by_va1)
    p20 <= p20_read_updt_val1;
end

// Path 21
assign p21_write_updt     = plru_write_updt
                         && (refill_num_index[3:2] == 2'b01);
assign p21_read_updt0     = plru_read_updt0
                         && (hit_num_index0[3:2] == 2'b01);
assign p21_read_updt1     = plru_read_updt1
                         && (hit_num_index1[3:2] == 2'b01);

assign p21_write_updt_val = (refill_num_index[3:1] == 3'b010);
assign p21_read_updt_val0 = (hit_num_index0[3:1] == 3'b010);
assign p21_read_updt_val1 = (hit_num_index1[3:1] == 3'b010);

assign p21_rdupdt_by_va0  =  p21_read_updt0 && !p21_read_updt1;
assign p21_rdupdt_by_va1  = !p21_read_updt0 &&  p21_read_updt1;
assign p21_rdupdt_by_va01 = (p21_read_updt0 &&  p21_read_updt1)
                         && (p21_read_updt_val0 ^~ p21_read_updt_val1);


always @(posedge lru_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    p21 <= 1'b0;
  else if(p21_write_updt)
    p21 <= p21_write_updt_val;
  else if(p21_rdupdt_by_va0 || p21_rdupdt_by_va01)
    p21 <= p21_read_updt_val0;
  else if(p21_rdupdt_by_va1)
    p21 <= p21_read_updt_val1;
end

// Path 22
assign p22_write_updt     = plru_write_updt
                         && (refill_num_index[3:2] == 2'b10);
assign p22_read_updt0     = plru_read_updt0
                         && (hit_num_index0[3:2] == 2'b10);
assign p22_read_updt1     = plru_read_updt1
                         && (hit_num_index1[3:2] == 2'b10);

assign p22_write_updt_val = (refill_num_index[3:1] == 3'b100);
assign p22_read_updt_val0 = (hit_num_index0[3:1] == 3'b100);
assign p22_read_updt_val1 = (hit_num_index1[3:1] == 3'b100);

assign p22_rdupdt_by_va0  =  p22_read_updt0 && !p22_read_updt1;
assign p22_rdupdt_by_va1  = !p22_read_updt0 &&  p22_read_updt1;
assign p22_rdupdt_by_va01 = (p22_read_updt0 &&  p22_read_updt1)
                         && (p22_read_updt_val0 ^~ p22_read_updt_val1);


always @(posedge lru_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    p22 <= 1'b0;
  else if(p22_write_updt)
    p22 <= p22_write_updt_val;
  else if(p22_rdupdt_by_va0 || p22_rdupdt_by_va01)
    p22 <= p22_read_updt_val0;
  else if(p22_rdupdt_by_va1)
    p22 <= p22_read_updt_val1;
end

// Path 23
assign p23_write_updt     = plru_write_updt
                         && (refill_num_index[3:2] == 2'b11);
assign p23_read_updt0     = plru_read_updt0
                         && (hit_num_index0[3:2] == 2'b11);
assign p23_read_updt1     = plru_read_updt1
                         && (hit_num_index1[3:2] == 2'b11);

assign p23_write_updt_val = (refill_num_index[3:1] == 3'b110);
assign p23_read_updt_val0 = (hit_num_index0[3:1] == 3'b110);
assign p23_read_updt_val1 = (hit_num_index1[3:1] == 3'b110);

assign p23_rdupdt_by_va0  =  p23_read_updt0 && !p23_read_updt1;
assign p23_rdupdt_by_va1  = !p23_read_updt0 &&  p23_read_updt1;
assign p23_rdupdt_by_va01 = (p23_read_updt0 &&  p23_read_updt1)
                         && (p23_read_updt_val0 ^~ p23_read_updt_val1);

always @(posedge lru_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    p23 <= 1'b0;
  else if(p23_write_updt)
    p23 <= p23_write_updt_val;
  else if(p23_rdupdt_by_va0 || p23_rdupdt_by_va01)
    p23 <= p23_read_updt_val0;
  else if(p23_rdupdt_by_va1)
    p23 <= p23_read_updt_val1; 
end


//----------------------------------------------------------
//                  Level 3 Path
//----------------------------------------------------------
//Path 30
assign p30_write_updt     = plru_write_updt
                         && (refill_num_index[3:1] == 3'b000);
assign p30_read_updt0     = plru_read_updt0
                         && (hit_num_index0[3:1] == 3'b000);
assign p30_read_updt1     = plru_read_updt1
                         && (hit_num_index1[3:1] == 3'b000);

assign p30_write_updt_val = (refill_num_index[3:0] == 4'b0000);
assign p30_read_updt_val0 = (hit_num_index0[3:0] == 4'b0000);
assign p30_read_updt_val1 = (hit_num_index1[3:0] == 4'b0000);

assign p30_rdupdt_by_va0  =  p30_read_updt0 && !p30_read_updt1;
assign p30_rdupdt_by_va1  = !p30_read_updt0 &&  p30_read_updt1;
assign p30_rdupdt_by_va01 = (p30_read_updt0 &&  p30_read_updt1)
                         && (p30_read_updt_val0 ^~ p30_read_updt_val1);

always @(posedge lru_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    p30 <= 1'b0;
  else if(p30_write_updt)
    p30 <= p30_write_updt_val;
  else if(p30_rdupdt_by_va0 || p30_rdupdt_by_va01)
    p30 <= p30_read_updt_val0;
  else if(p30_rdupdt_by_va1)
    p30 <= p30_read_updt_val1;
end

//Path 31
assign p31_write_updt     = plru_write_updt
                         && (refill_num_index[3:1] == 3'b001);
assign p31_read_updt0     = plru_read_updt0
                         && (hit_num_index0[3:1] == 3'b001);
assign p31_read_updt1     = plru_read_updt1
                         && (hit_num_index1[3:1] == 3'b001);

assign p31_write_updt_val = (refill_num_index[3:0] == 4'b0010);
assign p31_read_updt_val0 = (hit_num_index0[3:0] == 4'b0010);
assign p31_read_updt_val1 = (hit_num_index1[3:0] == 4'b0010);

assign p31_rdupdt_by_va0  =  p31_read_updt0 && !p31_read_updt1;
assign p31_rdupdt_by_va1  = !p31_read_updt0 &&  p31_read_updt1;
assign p31_rdupdt_by_va01 = (p31_read_updt0 &&  p31_read_updt1)
                         && (p31_read_updt_val0 ^~ p31_read_updt_val1);

always @(posedge lru_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    p31 <= 1'b0; 
  else if(p31_write_updt)
    p31 <= p31_write_updt_val;
  else if(p31_rdupdt_by_va0 || p31_rdupdt_by_va01)
    p31 <= p31_read_updt_val0;
  else if(p31_rdupdt_by_va1)
    p31 <= p31_read_updt_val1;
end
  
//Path 32
assign p32_write_updt     = plru_write_updt
                         && (refill_num_index[3:1] == 3'b010);
assign p32_read_updt0     = plru_read_updt0
                         && (hit_num_index0[3:1] == 3'b010);
assign p32_read_updt1     = plru_read_updt1
                         && (hit_num_index1[3:1] == 3'b010);

assign p32_write_updt_val = (refill_num_index[3:0] == 4'b0100);
assign p32_read_updt_val0 = (hit_num_index0[3:0] == 4'b0100);
assign p32_read_updt_val1 = (hit_num_index1[3:0] == 4'b0100);

assign p32_rdupdt_by_va0  =  p32_read_updt0 && !p32_read_updt1;
assign p32_rdupdt_by_va1  = !p32_read_updt0 &&  p32_read_updt1;
assign p32_rdupdt_by_va01 = (p32_read_updt0 &&  p32_read_updt1)
                         && (p32_read_updt_val0 ^~ p32_read_updt_val1);

always @(posedge lru_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    p32 <= 1'b0; 
  else if(p32_write_updt)
    p32 <= p32_write_updt_val;
  else if(p32_rdupdt_by_va0 || p32_rdupdt_by_va01)
    p32 <= p32_read_updt_val0;
  else if(p32_rdupdt_by_va1)
    p32 <= p32_read_updt_val1;
end 
  
//Path 33
assign p33_write_updt     = plru_write_updt
                         && (refill_num_index[3:1] == 3'b011);
assign p33_read_updt0     = plru_read_updt0
                         && (hit_num_index0[3:1] == 3'b011);
assign p33_read_updt1     = plru_read_updt1
                         && (hit_num_index1[3:1] == 3'b011);

assign p33_write_updt_val = (refill_num_index[3:0] == 4'b0110);
assign p33_read_updt_val0 = (hit_num_index0[3:0] == 4'b0110);
assign p33_read_updt_val1 = (hit_num_index1[3:0] == 4'b0110);

assign p33_rdupdt_by_va0  =  p33_read_updt0 && !p33_read_updt1;
assign p33_rdupdt_by_va1  = !p33_read_updt0 &&  p33_read_updt1;
assign p33_rdupdt_by_va01 = (p33_read_updt0 &&  p33_read_updt1)
                         && (p33_read_updt_val0 ^~ p33_read_updt_val1);

always @(posedge lru_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    p33 <= 1'b0; 
  else if(p33_write_updt)
    p33 <= p33_write_updt_val;
  else if(p33_rdupdt_by_va0 || p33_rdupdt_by_va01)
    p33 <= p33_read_updt_val0;
  else if(p33_rdupdt_by_va1)
    p33 <= p33_read_updt_val1;
end 
  
//Path 34
assign p34_write_updt     = plru_write_updt
                         && (refill_num_index[3:1] == 3'b100);
assign p34_read_updt0     = plru_read_updt0
                         && (hit_num_index0[3:1] == 3'b100);
assign p34_read_updt1     = plru_read_updt1
                         && (hit_num_index1[3:1] == 3'b100);

assign p34_write_updt_val = (refill_num_index[3:0] == 4'b1000);
assign p34_read_updt_val0 = (hit_num_index0[3:0] == 4'b1000);
assign p34_read_updt_val1 = (hit_num_index1[3:0] == 4'b1000);

assign p34_rdupdt_by_va0  =  p34_read_updt0 && !p34_read_updt1;
assign p34_rdupdt_by_va1  = !p34_read_updt0 &&  p34_read_updt1;
assign p34_rdupdt_by_va01 = (p34_read_updt0 &&  p34_read_updt1)
                         && (p34_read_updt_val0 ^~ p34_read_updt_val1);

always @(posedge lru_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    p34 <= 1'b0; 
  else if(p34_write_updt)
    p34 <= p34_write_updt_val;
  else if(p34_rdupdt_by_va0 || p34_rdupdt_by_va01)
    p34 <= p34_read_updt_val0;
  else if(p34_rdupdt_by_va1)
    p34 <= p34_read_updt_val1;
end 
  
//Path 35
assign p35_write_updt     = plru_write_updt
                         && (refill_num_index[3:1] == 3'b101);
assign p35_read_updt0     = plru_read_updt0
                         && (hit_num_index0[3:1] == 3'b101);
assign p35_read_updt1     = plru_read_updt1
                         && (hit_num_index1[3:1] == 3'b101);


assign p35_write_updt_val = (refill_num_index[3:0] == 4'b1010);
assign p35_read_updt_val0 = (hit_num_index0[3:0] == 4'b1010);
assign p35_read_updt_val1 = (hit_num_index1[3:0] == 4'b1010);

assign p35_rdupdt_by_va0  =  p35_read_updt0 && !p35_read_updt1;
assign p35_rdupdt_by_va1  = !p35_read_updt0 &&  p35_read_updt1;
assign p35_rdupdt_by_va01 = (p35_read_updt0 &&  p35_read_updt1)
                         && (p35_read_updt_val0 ^~ p35_read_updt_val1);

always @(posedge lru_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    p35 <= 1'b0; 
  else if(p35_write_updt)
    p35 <= p35_write_updt_val;
  else if(p35_rdupdt_by_va0 || p35_rdupdt_by_va01)
    p35 <= p35_read_updt_val0;
  else if(p35_rdupdt_by_va1)
    p35 <= p35_rdupdt_by_va1;
end 
  
//Path 36
assign p36_write_updt     = plru_write_updt
                         && (refill_num_index[3:1] == 3'b110);
assign p36_read_updt0     = plru_read_updt0
                         && (hit_num_index0[3:1] == 3'b110);
assign p36_read_updt1     = plru_read_updt1
                         && (hit_num_index1[3:1] == 3'b110);

assign p36_write_updt_val = (refill_num_index[3:0] == 4'b1100);
assign p36_read_updt_val0 = (hit_num_index0[3:0] == 4'b1100);
assign p36_read_updt_val1 = (hit_num_index1[3:0] == 4'b1100);

assign p36_rdupdt_by_va0  =  p36_read_updt0 && !p36_read_updt1;
assign p36_rdupdt_by_va1  = !p36_read_updt0 &&  p36_read_updt1;
assign p36_rdupdt_by_va01 = (p36_read_updt0 &&  p36_read_updt1)
                         && (p36_read_updt_val0 ^~ p36_read_updt_val1);

always @(posedge lru_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    p36 <= 1'b0; 
  else if(p36_write_updt)
    p36 <= p36_write_updt_val;
  else if(p36_rdupdt_by_va0 || p36_rdupdt_by_va01)
    p36 <= p36_read_updt_val0;
  else if(p36_rdupdt_by_va1)
    p36 <= p36_read_updt_val1;
end 
  
//Path 37
assign p37_write_updt     = plru_write_updt
                         && (refill_num_index[3:1] == 3'b111);
assign p37_read_updt0     = plru_read_updt0
                         && (hit_num_index0[3:1] == 3'b111);
assign p37_read_updt1     = plru_read_updt1
                         && (hit_num_index1[3:1] == 3'b111);

assign p37_write_updt_val = (refill_num_index[3:0] == 4'b1110);
assign p37_read_updt_val0 = (hit_num_index0[3:0] == 4'b1110);
assign p37_read_updt_val1 = (hit_num_index1[3:0] == 4'b1110);

assign p37_rdupdt_by_va0  =  p37_read_updt0 && !p37_read_updt1;
assign p37_rdupdt_by_va1  = !p37_read_updt0 &&  p37_read_updt1;
assign p37_rdupdt_by_va01 = (p37_read_updt0 &&  p37_read_updt1)
                         && (p37_read_updt_val0 ^~ p37_read_updt_val1);

always @(posedge lru_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    p37 <= 1'b0; 
  else if(p37_write_updt)
    p37 <= p37_write_updt_val;
  else if(p37_rdupdt_by_va0 || p37_rdupdt_by_va01)
    p37 <= p37_read_updt_val0;
  else if(p37_rdupdt_by_va1)
    p37 <= p37_read_updt_val1;
end 
  
  
//----------------------------------------------------------
//                  uTLB Replacement Algorithm
//----------------------------------------------------------
assign plru_num[3] =  p00;

assign plru_num[2] = !p00 &&  p10
                   || p00 &&  p11;

assign plru_num[1] = !p00 && !p10 &&  p20
                   ||!p00 &&  p10 &&  p21
                   || p00 && !p11 &&  p22
                   || p00 &&  p11 &&  p23;

assign plru_num[0] = !p00 && !p10 && !p20 && p30
                   ||!p00 && !p10 &&  p20 && p31
                   ||!p00 &&  p10 && !p21 && p32
                   ||!p00 &&  p10 &&  p21 && p33
                   || p00 && !p11 && !p22 && p34
                   || p00 && !p11 &&  p22 && p35
                   || p00 &&  p11 && !p23 && p36
                   || p00 &&  p11 &&  p23 && p37;


// &ModuleEnd; @671
endmodule



