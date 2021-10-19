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
module ct_mmu_iplru(
  cp0_mmu_icg_en,
  cpurst_b,
  entry0_vld,
  entry10_vld,
  entry11_vld,
  entry12_vld,
  entry13_vld,
  entry14_vld,
  entry15_vld,
  entry16_vld,
  entry17_vld,
  entry18_vld,
  entry19_vld,
  entry1_vld,
  entry20_vld,
  entry21_vld,
  entry22_vld,
  entry23_vld,
  entry24_vld,
  entry25_vld,
  entry26_vld,
  entry27_vld,
  entry28_vld,
  entry29_vld,
  entry2_vld,
  entry30_vld,
  entry31_vld,
  entry3_vld,
  entry4_vld,
  entry5_vld,
  entry6_vld,
  entry7_vld,
  entry8_vld,
  entry9_vld,
  forever_cpuclk,
  pad_yy_icg_scan_en,
  plru_iutlb_ref_num,
  utlb_plru_read_hit,
  utlb_plru_read_hit_vld,
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
input           entry16_vld;           
input           entry17_vld;           
input           entry18_vld;           
input           entry19_vld;           
input           entry1_vld;            
input           entry20_vld;           
input           entry21_vld;           
input           entry22_vld;           
input           entry23_vld;           
input           entry24_vld;           
input           entry25_vld;           
input           entry26_vld;           
input           entry27_vld;           
input           entry28_vld;           
input           entry29_vld;           
input           entry2_vld;            
input           entry30_vld;           
input           entry31_vld;           
input           entry3_vld;            
input           entry4_vld;            
input           entry5_vld;            
input           entry6_vld;            
input           entry7_vld;            
input           entry8_vld;            
input           entry9_vld;            
input           forever_cpuclk;        
input           pad_yy_icg_scan_en;    
input   [31:0]  utlb_plru_read_hit;    
input           utlb_plru_read_hit_vld; 
input           utlb_plru_refill_on;   
input           utlb_plru_refill_vld;  
output  [31:0]  plru_iutlb_ref_num;    

// &Regs; @25
reg     [4 :0]  hit_num_flop;          
reg     [4 :0]  hit_num_index;         
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
reg             p40;                   
reg             p41;                   
reg             p42;                   
reg             p43;                   
reg             p44;                   
reg             p45;                   
reg             p46;                   
reg             p47;                   
reg             p48;                   
reg             p49;                   
reg             p4a;                   
reg             p4b;                   
reg             p4c;                   
reg             p4d;                   
reg             p4e;                   
reg             p4f;                   
reg     [4 :0]  refill_num_index;      
reg     [31:0]  refill_num_onehot;     
reg     [4 :0]  write_num;             

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
wire            entry16_vld;           
wire            entry17_vld;           
wire            entry18_vld;           
wire            entry19_vld;           
wire            entry1_vld;            
wire            entry20_vld;           
wire            entry21_vld;           
wire            entry22_vld;           
wire            entry23_vld;           
wire            entry24_vld;           
wire            entry25_vld;           
wire            entry26_vld;           
wire            entry27_vld;           
wire            entry28_vld;           
wire            entry29_vld;           
wire            entry2_vld;            
wire            entry30_vld;           
wire            entry31_vld;           
wire            entry3_vld;            
wire            entry4_vld;            
wire            entry5_vld;            
wire            entry6_vld;            
wire            entry7_vld;            
wire            entry8_vld;            
wire            entry9_vld;            
wire            forever_cpuclk;        
wire    [31:0]  hit_num_onehot;        
wire            lru_clk;               
wire            lru_clk_en;            
wire            p00_read_updt_val;     
wire            p00_write_updt_val;    
wire            p10_read_updt;         
wire            p10_read_updt_val;     
wire            p10_write_updt;        
wire            p10_write_updt_val;    
wire            p11_read_updt;         
wire            p11_read_updt_val;     
wire            p11_write_updt;        
wire            p11_write_updt_val;    
wire            p20_read_updt;         
wire            p20_read_updt_val;     
wire            p20_write_updt;        
wire            p20_write_updt_val;    
wire            p21_read_updt;         
wire            p21_read_updt_val;     
wire            p21_write_updt;        
wire            p21_write_updt_val;    
wire            p22_read_updt;         
wire            p22_read_updt_val;     
wire            p22_write_updt;        
wire            p22_write_updt_val;    
wire            p23_read_updt;         
wire            p23_read_updt_val;     
wire            p23_write_updt;        
wire            p23_write_updt_val;    
wire            p30_read_updt;         
wire            p30_read_updt_val;     
wire            p30_write_updt;        
wire            p30_write_updt_val;    
wire            p31_read_updt;         
wire            p31_read_updt_val;     
wire            p31_write_updt;        
wire            p31_write_updt_val;    
wire            p32_read_updt;         
wire            p32_read_updt_val;     
wire            p32_write_updt;        
wire            p32_write_updt_val;    
wire            p33_read_updt;         
wire            p33_read_updt_val;     
wire            p33_write_updt;        
wire            p33_write_updt_val;    
wire            p34_read_updt;         
wire            p34_read_updt_val;     
wire            p34_write_updt;        
wire            p34_write_updt_val;    
wire            p35_read_updt;         
wire            p35_read_updt_val;     
wire            p35_write_updt;        
wire            p35_write_updt_val;    
wire            p36_read_updt;         
wire            p36_read_updt_val;     
wire            p36_write_updt;        
wire            p36_write_updt_val;    
wire            p37_read_updt;         
wire            p37_read_updt_val;     
wire            p37_write_updt;        
wire            p37_write_updt_val;    
wire            p40_read_updt;         
wire            p40_read_updt_val;     
wire            p40_write_updt;        
wire            p40_write_updt_val;    
wire            p41_read_updt;         
wire            p41_read_updt_val;     
wire            p41_write_updt;        
wire            p41_write_updt_val;    
wire            p42_read_updt;         
wire            p42_read_updt_val;     
wire            p42_write_updt;        
wire            p42_write_updt_val;    
wire            p43_read_updt;         
wire            p43_read_updt_val;     
wire            p43_write_updt;        
wire            p43_write_updt_val;    
wire            p44_read_updt;         
wire            p44_read_updt_val;     
wire            p44_write_updt;        
wire            p44_write_updt_val;    
wire            p45_read_updt;         
wire            p45_read_updt_val;     
wire            p45_write_updt;        
wire            p45_write_updt_val;    
wire            p46_read_updt;         
wire            p46_read_updt_val;     
wire            p46_write_updt;        
wire            p46_write_updt_val;    
wire            p47_read_updt;         
wire            p47_read_updt_val;     
wire            p47_write_updt;        
wire            p47_write_updt_val;    
wire            p48_read_updt;         
wire            p48_read_updt_val;     
wire            p48_write_updt;        
wire            p48_write_updt_val;    
wire            p49_read_updt;         
wire            p49_read_updt_val;     
wire            p49_write_updt;        
wire            p49_write_updt_val;    
wire            p4a_read_updt;         
wire            p4a_read_updt_val;     
wire            p4a_write_updt;        
wire            p4a_write_updt_val;    
wire            p4b_read_updt;         
wire            p4b_read_updt_val;     
wire            p4b_write_updt;        
wire            p4b_write_updt_val;    
wire            p4c_read_updt;         
wire            p4c_read_updt_val;     
wire            p4c_write_updt;        
wire            p4c_write_updt_val;    
wire            p4d_read_updt;         
wire            p4d_read_updt_val;     
wire            p4d_write_updt;        
wire            p4d_write_updt_val;    
wire            p4e_read_updt;         
wire            p4e_read_updt_val;     
wire            p4e_write_updt;        
wire            p4e_write_updt_val;    
wire            p4f_read_updt;         
wire            p4f_read_updt_val;     
wire            p4f_write_updt;        
wire            p4f_write_updt_val;    
wire            pad_yy_icg_scan_en;    
wire    [31:0]  plru_iutlb_ref_num;    
wire    [4 :0]  plru_num;              
wire            plru_read_updt;        
wire            plru_write_updt;       
wire    [31:0]  utlb_plru_read_hit;    
wire            utlb_plru_read_hit_vld; 
wire            utlb_plru_refill_on;   
wire            utlb_plru_refill_vld;  
wire    [31:0]  vld_entry_num;         



//==========================================================
//                  Gate Cell
//==========================================================
assign lru_clk_en = utlb_plru_refill_on
                 || plru_read_updt;
// &Instance("gated_clk_cell", "x_iplru_gateclk"); @34
gated_clk_cell  x_iplru_gateclk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (lru_clk           ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (lru_clk_en        ),
  .module_en          (cp0_mmu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect( .clk_in     (forever_cpuclk), @35
//           .external_en(1'b0          ), @36
//           .global_en  (1'b1          ), @37
//           .module_en  (cp0_mmu_icg_en), @38
//           .local_en   (lru_clk_en    ), @39
//           .clk_out    (lru_clk       ) @40
//          ); @41


//==========================================================
//                  Entry sel for Refill
//==========================================================
assign vld_entry_num[31:0] = {entry31_vld, entry30_vld, entry29_vld, entry28_vld,
                              entry27_vld, entry26_vld, entry25_vld, entry24_vld,
                              entry23_vld, entry22_vld, entry21_vld, entry20_vld,
                              entry19_vld, entry18_vld, entry17_vld, entry16_vld,
                              entry15_vld, entry14_vld, entry13_vld, entry12_vld,
                              entry11_vld, entry10_vld, entry9_vld,  entry8_vld,
                              entry7_vld,  entry6_vld,  entry5_vld,  entry4_vld,
                              entry3_vld,  entry2_vld,  entry1_vld,  entry0_vld};  
// &CombBeg; @55
always @( plru_num[4:0]
       or vld_entry_num[31:0])
begin
casez(vld_entry_num[31:0])
  32'b???????????????????????????????0: write_num[4:0] = 5'b00000;
  32'b??????????????????????????????01: write_num[4:0] = 5'b00001;
  32'b?????????????????????????????011: write_num[4:0] = 5'b00010;
  32'b????????????????????????????0111: write_num[4:0] = 5'b00011;
  32'b???????????????????????????01111: write_num[4:0] = 5'b00100;
  32'b??????????????????????????011111: write_num[4:0] = 5'b00101;
  32'b?????????????????????????0111111: write_num[4:0] = 5'b00110;
  32'b????????????????????????01111111: write_num[4:0] = 5'b00111;
  32'b???????????????????????011111111: write_num[4:0] = 5'b01000;
  32'b??????????????????????0111111111: write_num[4:0] = 5'b01001;
  32'b?????????????????????01111111111: write_num[4:0] = 5'b01010;
  32'b????????????????????011111111111: write_num[4:0] = 5'b01011;
  32'b???????????????????0111111111111: write_num[4:0] = 5'b01100;
  32'b??????????????????01111111111111: write_num[4:0] = 5'b01101;
  32'b?????????????????011111111111111: write_num[4:0] = 5'b01110;
  32'b????????????????0111111111111111: write_num[4:0] = 5'b01111;
  32'b???????????????01111111111111111: write_num[4:0] = 5'b10000;
  32'b??????????????011111111111111111: write_num[4:0] = 5'b10001;
  32'b?????????????0111111111111111111: write_num[4:0] = 5'b10010;
  32'b????????????01111111111111111111: write_num[4:0] = 5'b10011;
  32'b???????????011111111111111111111: write_num[4:0] = 5'b10100;
  32'b??????????0111111111111111111111: write_num[4:0] = 5'b10101;
  32'b?????????01111111111111111111111: write_num[4:0] = 5'b10110;
  32'b????????011111111111111111111111: write_num[4:0] = 5'b10111;
  32'b???????0111111111111111111111111: write_num[4:0] = 5'b11000;
  32'b??????01111111111111111111111111: write_num[4:0] = 5'b11001;
  32'b?????011111111111111111111111111: write_num[4:0] = 5'b11010;
  32'b????0111111111111111111111111111: write_num[4:0] = 5'b11011;
  32'b???01111111111111111111111111111: write_num[4:0] = 5'b11100;
  32'b??011111111111111111111111111111: write_num[4:0] = 5'b11101;
  32'b?0111111111111111111111111111111: write_num[4:0] = 5'b11110;
  32'b01111111111111111111111111111111: write_num[4:0] = 5'b11111;
  32'b11111111111111111111111111111111: write_num[4:0] = plru_num[4:0];
  default:                              write_num[4:0] = 5'b0;
endcase
// &CombEnd; @92
end


always @(posedge lru_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    refill_num_index[4:0] <= 5'b0;
  else if(utlb_plru_refill_on)
    refill_num_index[4:0] <= write_num[4:0];
end


// &CombBeg; @104
always @( refill_num_index[4:0])
begin
case(refill_num_index[4:0])
  5'h00: refill_num_onehot[31:0] = 32'b00000000000000000000000000000001;
  5'h01: refill_num_onehot[31:0] = 32'b00000000000000000000000000000010;
  5'h02: refill_num_onehot[31:0] = 32'b00000000000000000000000000000100;
  5'h03: refill_num_onehot[31:0] = 32'b00000000000000000000000000001000;
  5'h04: refill_num_onehot[31:0] = 32'b00000000000000000000000000010000;
  5'h05: refill_num_onehot[31:0] = 32'b00000000000000000000000000100000;
  5'h06: refill_num_onehot[31:0] = 32'b00000000000000000000000001000000;
  5'h07: refill_num_onehot[31:0] = 32'b00000000000000000000000010000000;
  5'h08: refill_num_onehot[31:0] = 32'b00000000000000000000000100000000;
  5'h09: refill_num_onehot[31:0] = 32'b00000000000000000000001000000000;
  5'h0a: refill_num_onehot[31:0] = 32'b00000000000000000000010000000000;
  5'h0b: refill_num_onehot[31:0] = 32'b00000000000000000000100000000000;
  5'h0c: refill_num_onehot[31:0] = 32'b00000000000000000001000000000000;
  5'h0d: refill_num_onehot[31:0] = 32'b00000000000000000010000000000000;
  5'h0e: refill_num_onehot[31:0] = 32'b00000000000000000100000000000000;
  5'h0f: refill_num_onehot[31:0] = 32'b00000000000000001000000000000000;
  5'h10: refill_num_onehot[31:0] = 32'b00000000000000010000000000000000;
  5'h11: refill_num_onehot[31:0] = 32'b00000000000000100000000000000000;
  5'h12: refill_num_onehot[31:0] = 32'b00000000000001000000000000000000;
  5'h13: refill_num_onehot[31:0] = 32'b00000000000010000000000000000000;
  5'h14: refill_num_onehot[31:0] = 32'b00000000000100000000000000000000;
  5'h15: refill_num_onehot[31:0] = 32'b00000000001000000000000000000000;
  5'h16: refill_num_onehot[31:0] = 32'b00000000010000000000000000000000;
  5'h17: refill_num_onehot[31:0] = 32'b00000000100000000000000000000000;
  5'h18: refill_num_onehot[31:0] = 32'b00000001000000000000000000000000;
  5'h19: refill_num_onehot[31:0] = 32'b00000010000000000000000000000000;
  5'h1a: refill_num_onehot[31:0] = 32'b00000100000000000000000000000000;
  5'h1b: refill_num_onehot[31:0] = 32'b00001000000000000000000000000000;
  5'h1c: refill_num_onehot[31:0] = 32'b00010000000000000000000000000000;
  5'h1d: refill_num_onehot[31:0] = 32'b00100000000000000000000000000000;
  5'h1e: refill_num_onehot[31:0] = 32'b01000000000000000000000000000000;
  5'h1f: refill_num_onehot[31:0] = 32'b10000000000000000000000000000000;
endcase
// &CombEnd; @139
end



//----------------------------------------------------------
//                  Final Refill Sel to uTLB
//----------------------------------------------------------
assign plru_iutlb_ref_num[31:0] = refill_num_onehot[31:0];


//==========================================================
//                  Read Update
//==========================================================
// When utlb hit with different entry, updata PLRU path flop
assign hit_num_onehot[31:0] = utlb_plru_read_hit[31:0];
// &CombBeg; @154
always @( hit_num_onehot[31:0])
begin
case(hit_num_onehot[31:0])
  32'b00000000000000000000000000000001: hit_num_index[4:0] = 5'b00000;
  32'b00000000000000000000000000000010: hit_num_index[4:0] = 5'b00001;
  32'b00000000000000000000000000000100: hit_num_index[4:0] = 5'b00010;
  32'b00000000000000000000000000001000: hit_num_index[4:0] = 5'b00011;
  32'b00000000000000000000000000010000: hit_num_index[4:0] = 5'b00100;
  32'b00000000000000000000000000100000: hit_num_index[4:0] = 5'b00101;
  32'b00000000000000000000000001000000: hit_num_index[4:0] = 5'b00110;
  32'b00000000000000000000000010000000: hit_num_index[4:0] = 5'b00111;
  32'b00000000000000000000000100000000: hit_num_index[4:0] = 5'b01000;
  32'b00000000000000000000001000000000: hit_num_index[4:0] = 5'b01001;
  32'b00000000000000000000010000000000: hit_num_index[4:0] = 5'b01010;
  32'b00000000000000000000100000000000: hit_num_index[4:0] = 5'b01011;
  32'b00000000000000000001000000000000: hit_num_index[4:0] = 5'b01100;
  32'b00000000000000000010000000000000: hit_num_index[4:0] = 5'b01101;
  32'b00000000000000000100000000000000: hit_num_index[4:0] = 5'b01110;
  32'b00000000000000001000000000000000: hit_num_index[4:0] = 5'b01111;
  32'b00000000000000010000000000000000: hit_num_index[4:0] = 5'b10000;
  32'b00000000000000100000000000000000: hit_num_index[4:0] = 5'b10001;
  32'b00000000000001000000000000000000: hit_num_index[4:0] = 5'b10010;
  32'b00000000000010000000000000000000: hit_num_index[4:0] = 5'b10011;
  32'b00000000000100000000000000000000: hit_num_index[4:0] = 5'b10100;
  32'b00000000001000000000000000000000: hit_num_index[4:0] = 5'b10101;
  32'b00000000010000000000000000000000: hit_num_index[4:0] = 5'b10110;
  32'b00000000100000000000000000000000: hit_num_index[4:0] = 5'b10111;
  32'b00000001000000000000000000000000: hit_num_index[4:0] = 5'b11000;
  32'b00000010000000000000000000000000: hit_num_index[4:0] = 5'b11001;
  32'b00000100000000000000000000000000: hit_num_index[4:0] = 5'b11010;
  32'b00001000000000000000000000000000: hit_num_index[4:0] = 5'b11011;
  32'b00010000000000000000000000000000: hit_num_index[4:0] = 5'b11100;
  32'b00100000000000000000000000000000: hit_num_index[4:0] = 5'b11101;
  32'b01000000000000000000000000000000: hit_num_index[4:0] = 5'b11110;
  32'b10000000000000000000000000000000: hit_num_index[4:0] = 5'b11111;
  default                             : hit_num_index[4:0] = 5'b10000;
endcase
// &CombEnd; @190
end


always @(posedge lru_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    hit_num_flop[4:0] <= 5'b0;
  else if(utlb_plru_read_hit_vld)
    hit_num_flop[4:0] <= hit_num_index[4:0];
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
//            /\            ......            /\
//          P40 P41         ......         P4E P4F

assign plru_write_updt = utlb_plru_refill_vld;
assign plru_read_updt  = utlb_plru_read_hit_vld
                      && (hit_num_flop[4:0] != hit_num_index[4:0]); 


//----------------------------------------------------------
//                  Level 0 Path
//----------------------------------------------------------
// Path 0
assign p00_write_updt_val = !refill_num_index[4];
assign p00_read_updt_val  = !hit_num_index[4];

always @(posedge lru_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    p00 <= 1'b0;
  else if(plru_write_updt)
    p00 <= p00_write_updt_val;
  else if(plru_read_updt)
    p00 <= p00_read_updt_val;
end


//----------------------------------------------------------
//                  Level 1 Path
//----------------------------------------------------------
// Path 10
assign p10_write_updt     = plru_write_updt && !refill_num_index[4];
assign p10_read_updt      = plru_read_updt  && !hit_num_index[4];

assign p10_write_updt_val = (refill_num_index[4:3] == 2'b00); 
assign p10_read_updt_val  = (hit_num_index[4:3] == 2'b00);

always @(posedge lru_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    p10 <= 1'b0;
  else if(p10_write_updt)
    p10 <= p10_write_updt_val;
  else if(p10_read_updt)
    p10 <= p10_read_updt_val;
end

// Path 11
assign p11_write_updt     = plru_write_updt && refill_num_index[4];
assign p11_read_updt      = plru_read_updt  && hit_num_index[4];

assign p11_write_updt_val = (refill_num_index[4:3] == 2'b10);
assign p11_read_updt_val  = (hit_num_index[4:3] == 2'b10);

always @(posedge lru_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    p11 <= 1'b0;
  else if(p11_write_updt)
    p11 <= p11_write_updt_val;
  else if(p11_read_updt)
    p11 <= p11_read_updt_val;
end


//----------------------------------------------------------
//                  Level 2 Path
//----------------------------------------------------------
// Path 20
assign p20_write_updt     = plru_write_updt
                         && (refill_num_index[4:3] == 2'b00);
assign p20_read_updt      = plru_read_updt
                         && (hit_num_index[4:3] == 2'b00);

assign p20_write_updt_val = (refill_num_index[4:2] == 3'b000);
assign p20_read_updt_val  = (hit_num_index[4:2] == 3'b000);

always @(posedge lru_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    p20 <= 1'b0;
  else if(p20_write_updt)
    p20 <= p20_write_updt_val;
  else if(p20_read_updt)
    p20 <= p20_read_updt_val;
end

// Path 21
assign p21_write_updt     = plru_write_updt
                         && (refill_num_index[4:3] == 2'b01);
assign p21_read_updt      = plru_read_updt
                         && (hit_num_index[4:3] == 2'b01);

assign p21_write_updt_val = (refill_num_index[4:2] == 3'b010);
assign p21_read_updt_val  = (hit_num_index[4:2] == 3'b010);

always @(posedge lru_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    p21 <= 1'b0;
  else if(p21_write_updt)
    p21 <= p21_write_updt_val;
  else if(p21_read_updt)
    p21 <= p21_read_updt_val;
end

// Path 22
assign p22_write_updt     = plru_write_updt
                         && (refill_num_index[4:3] == 2'b10);
assign p22_read_updt      = plru_read_updt
                         && (hit_num_index[4:3] == 2'b10);

assign p22_write_updt_val = (refill_num_index[4:2] == 3'b100);
assign p22_read_updt_val  = (hit_num_index[4:2] == 3'b100);

always @(posedge lru_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    p22 <= 1'b0;
  else if(p22_write_updt)
    p22 <= p22_write_updt_val;
  else if(p22_read_updt)
    p22 <= p22_read_updt_val;
end

// Path 23
assign p23_write_updt     = plru_write_updt
                         && (refill_num_index[4:3] == 2'b11);
assign p23_read_updt      = plru_read_updt
                         && (hit_num_index[4:3] == 2'b11);

assign p23_write_updt_val = (refill_num_index[4:2] == 3'b110);
assign p23_read_updt_val  = (hit_num_index[4:2] == 3'b110);

always @(posedge lru_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    p23 <= 1'b0;
  else if(p23_write_updt)
    p23 <= p23_write_updt_val;
  else if(p23_read_updt)
    p23 <= p23_read_updt_val;
end


//----------------------------------------------------------
//                  Level 3 Path
//----------------------------------------------------------
//Path 30
assign p30_write_updt     = plru_write_updt
                         && (refill_num_index[4:2] == 3'b000);
assign p30_read_updt      = plru_read_updt
                         && (hit_num_index[4:2] == 3'b000);

assign p30_write_updt_val = (refill_num_index[4:1] == 4'b0000);
assign p30_read_updt_val  = (hit_num_index[4:1] == 4'b0000);

always @(posedge lru_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    p30 <= 1'b0;
  else if(p30_write_updt)
    p30 <= p30_write_updt_val;
  else if(p30_read_updt)
    p30 <= p30_read_updt_val;
end

//Path 31
assign p31_write_updt     = plru_write_updt
                         && (refill_num_index[4:2] == 3'b001);
assign p31_read_updt      = plru_read_updt
                         && (hit_num_index[4:2] == 3'b001);

assign p31_write_updt_val = (refill_num_index[4:1] == 4'b0010);
assign p31_read_updt_val  = (hit_num_index[4:1] == 4'b0010);

always @(posedge lru_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    p31 <= 1'b0; 
  else if(p31_write_updt)
    p31 <= p31_write_updt_val;
  else if(p31_read_updt)
    p31 <= p31_read_updt_val;
end
  
//Path 32
assign p32_write_updt     = plru_write_updt
                         && (refill_num_index[4:2] == 3'b010);
assign p32_read_updt      = plru_read_updt
                         && (hit_num_index[4:2] == 3'b010);

assign p32_write_updt_val = (refill_num_index[4:1] == 4'b0100);
assign p32_read_updt_val  = (hit_num_index[4:1] == 4'b0100);

always @(posedge lru_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    p32 <= 1'b0; 
  else if(p32_write_updt)
    p32 <= p32_write_updt_val;
  else if(p32_read_updt)
    p32 <= p32_read_updt_val;
end 
  
//Path 33
assign p33_write_updt     = plru_write_updt
                         && (refill_num_index[4:2] == 3'b011);
assign p33_read_updt      = plru_read_updt
                         && (hit_num_index[4:2] == 3'b011);

assign p33_write_updt_val = (refill_num_index[4:1] == 4'b0110);
assign p33_read_updt_val  = (hit_num_index[4:1] == 4'b0110);

always @(posedge lru_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    p33 <= 1'b0; 
  else if(p33_write_updt)
    p33 <= p33_write_updt_val;
  else if(p33_read_updt)
    p33 <= p33_read_updt_val;
end 
  
//Path 34
assign p34_write_updt     = plru_write_updt
                         && (refill_num_index[4:2] == 3'b100);
assign p34_read_updt      = plru_read_updt
                         && (hit_num_index[4:2] == 3'b100);

assign p34_write_updt_val = (refill_num_index[4:1] == 4'b1000);
assign p34_read_updt_val  = (hit_num_index[4:1] == 4'b1000);

always @(posedge lru_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    p34 <= 1'b0; 
  else if(p34_write_updt)
    p34 <= p34_write_updt_val;
  else if(p34_read_updt)
    p34 <= p34_read_updt_val;
end 
  
//Path 35
assign p35_write_updt     = plru_write_updt
                         && (refill_num_index[4:2] == 3'b101);
assign p35_read_updt      = plru_read_updt
                         && (hit_num_index[4:2] == 3'b101);

assign p35_write_updt_val = (refill_num_index[4:1] == 4'b1010);
assign p35_read_updt_val  = (hit_num_index[4:1] == 4'b1010);

always @(posedge lru_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    p35 <= 1'b0; 
  else if(p35_write_updt)
    p35 <= p35_write_updt_val;
  else if(p35_read_updt)
    p35 <= p35_read_updt_val;
end 
  
//Path 36
assign p36_write_updt     = plru_write_updt
                         && (refill_num_index[4:2] == 3'b110);
assign p36_read_updt      = plru_read_updt
                         && (hit_num_index[4:2] == 3'b110);

assign p36_write_updt_val = (refill_num_index[4:1] == 4'b1100);
assign p36_read_updt_val  = (hit_num_index[4:1] == 4'b1100);

always @(posedge lru_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    p36 <= 1'b0; 
  else if(p36_write_updt)
    p36 <= p36_write_updt_val;
  else if(p36_read_updt)
    p36 <= p36_read_updt_val;
end 
  
//Path 37
assign p37_write_updt     = plru_write_updt
                         && (refill_num_index[4:2] == 3'b111);
assign p37_read_updt      = plru_read_updt
                         && (hit_num_index[4:2] == 3'b111);

assign p37_write_updt_val = (refill_num_index[4:1] == 4'b1110);
assign p37_read_updt_val  = (hit_num_index[4:1] == 4'b1110);

always @(posedge lru_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    p37 <= 1'b0; 
  else if(p37_write_updt)
    p37 <= p37_write_updt_val;
  else if(p37_read_updt)
    p37 <= p37_read_updt_val;
end 
  
//----------------------------------------------------------
//                  Level 4 Path
//----------------------------------------------------------
//Path 40
assign p40_write_updt     = plru_write_updt
                         && (refill_num_index[4:1] == 4'b0000);
assign p40_read_updt      = plru_read_updt
                         && (hit_num_index[4:1] == 4'b0000);

assign p40_write_updt_val = (refill_num_index[4:0] == 5'b00000);
assign p40_read_updt_val  = (hit_num_index[4:0] == 5'b00000);

always @(posedge lru_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    p40 <= 1'b0;
  else if(p40_write_updt)
    p40 <= p40_write_updt_val;
  else if(p40_read_updt)
    p40 <= p40_read_updt_val;
end

//Path 41
assign p41_write_updt     = plru_write_updt
                         && (refill_num_index[4:1] == 4'b0001);
assign p41_read_updt      = plru_read_updt
                         && (hit_num_index[4:1] == 4'b0001);

assign p41_write_updt_val = (refill_num_index[4:0] == 5'b00010);
assign p41_read_updt_val  = (hit_num_index[4:0] == 5'b00010);

always @(posedge lru_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    p41 <= 1'b0; 
  else if(p41_write_updt)
    p41 <= p41_write_updt_val;
  else if(p41_read_updt)
    p41 <= p41_read_updt_val;
end
  
//Path 42
assign p42_write_updt     = plru_write_updt
                         && (refill_num_index[4:1] == 4'b0010);
assign p42_read_updt      = plru_read_updt
                         && (hit_num_index[4:1] == 4'b0010);

assign p42_write_updt_val = (refill_num_index[4:0] == 5'b00100);
assign p42_read_updt_val  = (hit_num_index[4:0] == 5'b00100);

always @(posedge lru_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    p42 <= 1'b0; 
  else if(p42_write_updt)
    p42 <= p42_write_updt_val;
  else if(p42_read_updt)
    p42 <= p42_read_updt_val;
end 
  
//Path 43
assign p43_write_updt     = plru_write_updt
                         && (refill_num_index[4:1] == 4'b0011);
assign p43_read_updt      = plru_read_updt
                         && (hit_num_index[4:1] == 4'b0011);

assign p43_write_updt_val = (refill_num_index[4:0] == 5'b00110);
assign p43_read_updt_val  = (hit_num_index[4:0] == 5'b00110);

always @(posedge lru_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    p43 <= 1'b0; 
  else if(p43_write_updt)
    p43 <= p43_write_updt_val;
  else if(p43_read_updt)
    p43 <= p43_read_updt_val;
end 
  
//Path 44
assign p44_write_updt     = plru_write_updt
                         && (refill_num_index[4:1] == 4'b0100);
assign p44_read_updt      = plru_read_updt
                         && (hit_num_index[4:1] == 4'b0100);

assign p44_write_updt_val = (refill_num_index[4:0] == 5'b01000);
assign p44_read_updt_val  = (hit_num_index[4:0] == 5'b01000);

always @(posedge lru_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    p44 <= 1'b0; 
  else if(p44_write_updt)
    p44 <= p44_write_updt_val;
  else if(p44_read_updt)
    p44 <= p44_read_updt_val;
end 
  
//Path 45
assign p45_write_updt     = plru_write_updt
                         && (refill_num_index[4:1] == 4'b0101);
assign p45_read_updt      = plru_read_updt
                         && (hit_num_index[4:1] == 4'b0101);

assign p45_write_updt_val = (refill_num_index[4:0] == 5'b01010);
assign p45_read_updt_val  = (hit_num_index[4:0] == 5'b01010);

always @(posedge lru_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    p45 <= 1'b0; 
  else if(p45_write_updt)
    p45 <= p45_write_updt_val;
  else if(p45_read_updt)
    p45 <= p45_read_updt_val;
end 
  
//Path 46
assign p46_write_updt     = plru_write_updt
                         && (refill_num_index[4:1] == 4'b0110);
assign p46_read_updt      = plru_read_updt
                         && (hit_num_index[4:1] == 4'b0110);

assign p46_write_updt_val = (refill_num_index[4:0] == 5'b01100);
assign p46_read_updt_val  = (hit_num_index[4:0] == 5'b01100);

always @(posedge lru_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    p46 <= 1'b0; 
  else if(p46_write_updt)
    p46 <= p46_write_updt_val;
  else if(p46_read_updt)
    p46 <= p46_read_updt_val;
end 
  
//Path 47
assign p47_write_updt     = plru_write_updt
                         && (refill_num_index[4:1] == 4'b0111);
assign p47_read_updt      = plru_read_updt
                         && (hit_num_index[4:1] == 4'b0111);

assign p47_write_updt_val = (refill_num_index[4:0] == 5'b01110);
assign p47_read_updt_val  = (hit_num_index[4:0] == 5'b01110);

always @(posedge lru_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    p47 <= 1'b0; 
  else if(p47_write_updt)
    p47 <= p47_write_updt_val;
  else if(p47_read_updt)
    p47 <= p47_read_updt_val;
end 
  
//Path 48
assign p48_write_updt     = plru_write_updt
                         && (refill_num_index[4:1] == 4'b1000);
assign p48_read_updt      = plru_read_updt
                         && (hit_num_index[4:1] == 4'b1000);

assign p48_write_updt_val = (refill_num_index[4:0] == 5'b10000);
assign p48_read_updt_val  = (hit_num_index[4:0] == 5'b10000);

always @(posedge lru_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    p48 <= 1'b0;
  else if(p48_write_updt)
    p48 <= p48_write_updt_val;
  else if(p48_read_updt)
    p48 <= p48_read_updt_val;
end

//Path 49
assign p49_write_updt     = plru_write_updt
                         && (refill_num_index[4:1] == 4'b1001);
assign p49_read_updt      = plru_read_updt
                         && (hit_num_index[4:1] == 4'b1001);

assign p49_write_updt_val = (refill_num_index[4:0] == 5'b10010);
assign p49_read_updt_val  = (hit_num_index[4:0] == 5'b10010);

always @(posedge lru_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    p49 <= 1'b0; 
  else if(p49_write_updt)
    p49 <= p49_write_updt_val;
  else if(p49_read_updt)
    p49 <= p49_read_updt_val;
end
  
//Path 4a
assign p4a_write_updt     = plru_write_updt
                         && (refill_num_index[4:1] == 4'b1010);
assign p4a_read_updt      = plru_read_updt
                         && (hit_num_index[4:1] == 4'b1010);

assign p4a_write_updt_val = (refill_num_index[4:0] == 5'b10100);
assign p4a_read_updt_val  = (hit_num_index[4:0] == 5'b10100);

always @(posedge lru_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    p4a <= 1'b0; 
  else if(p4a_write_updt)
    p4a <= p4a_write_updt_val;
  else if(p4a_read_updt)
    p4a <= p4a_read_updt_val;
end 
  
//Path 4b
assign p4b_write_updt     = plru_write_updt
                         && (refill_num_index[4:1] == 4'b1011);
assign p4b_read_updt      = plru_read_updt
                         && (hit_num_index[4:1] == 4'b1011);

assign p4b_write_updt_val = (refill_num_index[4:0] == 5'b10110);
assign p4b_read_updt_val  = (hit_num_index[4:0] == 5'b10110);

always @(posedge lru_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    p4b <= 1'b0; 
  else if(p4b_write_updt)
    p4b <= p4b_write_updt_val;
  else if(p4b_read_updt)
    p4b <= p4b_read_updt_val;
end 
  
//Path 4c
assign p4c_write_updt     = plru_write_updt
                         && (refill_num_index[4:1] == 4'b1100);
assign p4c_read_updt      = plru_read_updt
                         && (hit_num_index[4:1] == 4'b1100);

assign p4c_write_updt_val = (refill_num_index[4:0] == 5'b11000);
assign p4c_read_updt_val  = (hit_num_index[4:0] == 5'b11000);

always @(posedge lru_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    p4c <= 1'b0; 
  else if(p4c_write_updt)
    p4c <= p4c_write_updt_val;
  else if(p4c_read_updt)
    p4c <= p4c_read_updt_val;
end 
  
//Path 4d
assign p4d_write_updt     = plru_write_updt
                         && (refill_num_index[4:1] == 4'b1101);
assign p4d_read_updt      = plru_read_updt
                         && (hit_num_index[4:1] == 4'b1101);

assign p4d_write_updt_val = (refill_num_index[4:0] == 5'b11010);
assign p4d_read_updt_val  = (hit_num_index[4:0] == 5'b11010);

always @(posedge lru_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    p4d <= 1'b0; 
  else if(p4d_write_updt)
    p4d <= p4d_write_updt_val;
  else if(p4d_read_updt)
    p4d <= p4d_read_updt_val;
end 
  
//Path 4e
assign p4e_write_updt     = plru_write_updt
                         && (refill_num_index[4:1] == 4'b1110);
assign p4e_read_updt      = plru_read_updt
                         && (hit_num_index[4:1] == 4'b1110);

assign p4e_write_updt_val = (refill_num_index[4:0] == 5'b11100);
assign p4e_read_updt_val  = (hit_num_index[4:0] == 5'b11100);

always @(posedge lru_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    p4e <= 1'b0; 
  else if(p4e_write_updt)
    p4e <= p4e_write_updt_val;
  else if(p4e_read_updt)
    p4e <= p4e_read_updt_val;
end 
  
//Path 4f
assign p4f_write_updt     = plru_write_updt
                         && (refill_num_index[4:1] == 4'b1111);
assign p4f_read_updt      = plru_read_updt
                         && (hit_num_index[4:1] == 4'b1111);

assign p4f_write_updt_val = (refill_num_index[4:0] == 5'b11110);
assign p4f_read_updt_val  = (hit_num_index[4:0] == 5'b11110);

always @(posedge lru_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    p4f <= 1'b0; 
  else if(p4f_write_updt)
    p4f <= p4f_write_updt_val;
  else if(p4f_read_updt)
    p4f <= p4f_read_updt_val;
end 
  
//----------------------------------------------------------
//                  uTLB Replacement Algorithm
//----------------------------------------------------------
assign plru_num[4] =  p00;

assign plru_num[3] = !p00 &&  p10
                   || p00 &&  p11;

assign plru_num[2] = !p00 && !p10 &&  p20
                   ||!p00 &&  p10 &&  p21
                   || p00 && !p11 &&  p22
                   || p00 &&  p11 &&  p23;

assign plru_num[1] = !p00 && !p10 && !p20 && p30
                   ||!p00 && !p10 &&  p20 && p31
                   ||!p00 &&  p10 && !p21 && p32
                   ||!p00 &&  p10 &&  p21 && p33
                   || p00 && !p11 && !p22 && p34
                   || p00 && !p11 &&  p22 && p35
                   || p00 &&  p11 && !p23 && p36
                   || p00 &&  p11 &&  p23 && p37;

assign plru_num[0] = !p00 && !p10 && !p20 && !p30 && p40
                   ||!p00 && !p10 && !p20 &&  p30 && p41
                   ||!p00 && !p10 &&  p20 && !p31 && p42
                   ||!p00 && !p10 &&  p20 &&  p31 && p43
                   ||!p00 &&  p10 && !p21 && !p32 && p44
                   ||!p00 &&  p10 && !p21 &&  p32 && p45
                   ||!p00 &&  p10 &&  p21 && !p33 && p46
                   ||!p00 &&  p10 &&  p21 &&  p33 && p47
                   ||!p00 && !p11 && !p22 && !p34 && p48
                   ||!p00 && !p11 && !p22 &&  p34 && p49
                   ||!p00 && !p11 &&  p22 && !p35 && p4a
                   ||!p00 && !p11 &&  p22 &&  p35 && p4b
                   ||!p00 &&  p11 && !p23 && !p36 && p4c
                   ||!p00 &&  p11 && !p23 &&  p36 && p4d
                   ||!p00 &&  p11 &&  p23 && !p37 && p4e
                   ||!p00 &&  p11 &&  p23 &&  p37 && p4f;

// &ModuleEnd; @864
endmodule


