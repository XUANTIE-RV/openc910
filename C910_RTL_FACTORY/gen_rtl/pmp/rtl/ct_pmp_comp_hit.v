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
module ct_pmp_comp_hit(
  addr_match_mode_x,
  mmu_addr_ge_bottom_x,
  mmu_addr_ge_upaddr_x,
  mmu_pmp_pa_y,
  pmp_mmu_hit_x,
  pmpaddr_x_value
);

// &Ports; @25
input   [1 :0]  addr_match_mode_x;   
input           mmu_addr_ge_bottom_x; 
input   [27:0]  mmu_pmp_pa_y;        
input   [28:0]  pmpaddr_x_value;     
output          mmu_addr_ge_upaddr_x; 
output          pmp_mmu_hit_x;       

// &Regs; @26
reg     [27:0]  addr_mask;           
reg             pmp_mmu_hit_x;       

// &Wires; @27
wire    [1 :0]  addr_match_mode_x;   
wire            mmu_addr_ge_bottom_x; 
wire            mmu_addr_ge_upaddr_x; 
wire            mmu_addr_ls_top;     
wire    [28:0]  mmu_comp_adder;      
wire            mmu_na4_addr_match;  
wire            mmu_napot_addr_match; 
wire    [27:0]  mmu_pmp_pa_y;        
wire            mmu_tor_addr_match;  
wire    [28:0]  pmpaddr_x_value;     


parameter ADDR_WIDTH = `PA_WIDTH-12;

// //&Force("bus","pmpaddr_x_value",27,0); @31
//==========================================================
//                Address Matching Logic
//==========================================================
//Compare access address by four address-matching mode,and 
//generate address hit information for read uint(mmu)
// &CombBeg; @37
always @( addr_match_mode_x[1:0]
       or mmu_tor_addr_match
       or mmu_na4_addr_match
       or mmu_napot_addr_match)
begin
  case(addr_match_mode_x[1:0])
    2'b00:   pmp_mmu_hit_x = 1'b0;                 //OFF
    2'b01:   pmp_mmu_hit_x = mmu_tor_addr_match;   //TOR 
    2'b10:   pmp_mmu_hit_x = mmu_na4_addr_match;   //NA4
    2'b11:   pmp_mmu_hit_x = mmu_napot_addr_match; //NAPOT
    default: pmp_mmu_hit_x = 1'b0; 
  endcase
// &CombEnd; @45
end


//1. TOR mode : pmpaddr_x_value[i-1]<= addr < pmpaddr_x_value[i]
assign mmu_comp_adder[ADDR_WIDTH:0] = {1'b0,mmu_pmp_pa_y[ADDR_WIDTH-1:0]} - 
                                      {1'b0,pmpaddr_x_value[ADDR_WIDTH:1]};
assign mmu_addr_ls_top      = mmu_comp_adder[ADDR_WIDTH];
assign mmu_tor_addr_match   = mmu_addr_ge_bottom_x && mmu_addr_ls_top;

// for next entry
assign mmu_addr_ge_upaddr_x  = !mmu_comp_adder[ADDR_WIDTH];

//2. NAPOT : addr &addr_mask == pmpaddr_x_value & addr_mask
assign mmu_napot_addr_match = (addr_mask[ADDR_WIDTH-1:0] & mmu_pmp_pa_y[ADDR_WIDTH-1:0]) == (addr_mask[ADDR_WIDTH-1:0] & pmpaddr_x_value[ADDR_WIDTH:1]);
//assign mmu_napot_addr_match = (addr_mask[ADDR_WIDTH-1:0] & mmu_pmp_pa_y[ADDR_WIDTH-1:0]) == pmpaddr_x_value[ADDR_WIDTH:1];

//3. NA4 : addr[31:2] == pmpaddr_x_value[29:0]
//assign mmu_na4_addr_match   = (mmu_pmp_pa_y[31:2] == pmpaddr_x_value[29:0]);
assign mmu_na4_addr_match   = 1'b0;

//----------------------------------------------------------
//Generate the address mask for the addr come from mmu or iu
//register the addr mask signal to avoid timing violation
//----------------------------------------------------------
// &CombBeg; @69
always @( pmpaddr_x_value[28:0])
begin
  casez(pmpaddr_x_value[ADDR_WIDTH:0])
    29'b????_????_????_????_????_????_????_0 : addr_mask[ADDR_WIDTH-1:0] = 28'hfffffff; //4KB
    29'b????_????_????_????_????_????_???0_1 : addr_mask[ADDR_WIDTH-1:0] = 28'hffffffe; //8KB
    29'b????_????_????_????_????_????_??01_1 : addr_mask[ADDR_WIDTH-1:0] = 28'hffffffc; //16KB
    29'b????_????_????_????_????_????_?011_1 : addr_mask[ADDR_WIDTH-1:0] = 28'hffffff8; //32KB
    29'b????_????_????_????_????_????_0111_1 : addr_mask[ADDR_WIDTH-1:0] = 28'hffffff0; //64KB
    29'b????_????_????_????_????_???0_1111_1 : addr_mask[ADDR_WIDTH-1:0] = 28'hfffffe0; //128KB
    29'b????_????_????_????_????_??01_1111_1 : addr_mask[ADDR_WIDTH-1:0] = 28'hfffffc0; //256KB
    29'b????_????_????_????_????_?011_1111_1 : addr_mask[ADDR_WIDTH-1:0] = 28'hfffff80; //512KB
    29'b????_????_????_????_????_0111_1111_1 : addr_mask[ADDR_WIDTH-1:0] = 28'hfffff00; //1M
    29'b????_????_????_????_???0_1111_1111_1 : addr_mask[ADDR_WIDTH-1:0] = 28'hffffe00; //2M
    29'b????_????_????_????_??01_1111_1111_1 : addr_mask[ADDR_WIDTH-1:0] = 28'hffffc00; //4M
    29'b????_????_????_????_?011_1111_1111_1 : addr_mask[ADDR_WIDTH-1:0] = 28'hffff800; //8M
    29'b????_????_????_????_0111_1111_1111_1 : addr_mask[ADDR_WIDTH-1:0] = 28'hffff000; //16M
    29'b????_????_????_???0_1111_1111_1111_1 : addr_mask[ADDR_WIDTH-1:0] = 28'hfffe000; //32M
    29'b????_????_????_??01_1111_1111_1111_1 : addr_mask[ADDR_WIDTH-1:0] = 28'hfffc000; //64M
    29'b????_????_????_?011_1111_1111_1111_1 : addr_mask[ADDR_WIDTH-1:0] = 28'hfff8000; //128M
    29'b????_????_????_0111_1111_1111_1111_1 : addr_mask[ADDR_WIDTH-1:0] = 28'hfff0000; //256M
    29'b????_????_???0_1111_1111_1111_1111_1 : addr_mask[ADDR_WIDTH-1:0] = 28'hffe0000; //512M
    29'b????_????_??01_1111_1111_1111_1111_1 : addr_mask[ADDR_WIDTH-1:0] = 28'hffc0000; //1G
    29'b????_????_?011_1111_1111_1111_1111_1 : addr_mask[ADDR_WIDTH-1:0] = 28'hff80000; //2G
    29'b????_????_0111_1111_1111_1111_1111_1 : addr_mask[ADDR_WIDTH-1:0] = 28'hff00000; //4G
    29'b????_???0_1111_1111_1111_1111_1111_1 : addr_mask[ADDR_WIDTH-1:0] = 28'hfe00000; //8G
    29'b????_??01_1111_1111_1111_1111_1111_1 : addr_mask[ADDR_WIDTH-1:0] = 28'hfc00000; //16G
    29'b????_?011_1111_1111_1111_1111_1111_1 : addr_mask[ADDR_WIDTH-1:0] = 28'hf800000; //32G
    29'b????_0111_1111_1111_1111_1111_1111_1 : addr_mask[ADDR_WIDTH-1:0] = 28'hf000000; //64G
    29'b???0_1111_1111_1111_1111_1111_1111_1 : addr_mask[ADDR_WIDTH-1:0] = 28'he000000; //128G
    29'b??01_1111_1111_1111_1111_1111_1111_1 : addr_mask[ADDR_WIDTH-1:0] = 28'hc000000; //256G
    29'b?011_1111_1111_1111_1111_1111_1111_1 : addr_mask[ADDR_WIDTH-1:0] = 28'h8000000; //512G
    29'b0111_1111_1111_1111_1111_1111_1111_1 : addr_mask[ADDR_WIDTH-1:0] = 28'h0000000; //1T
    default                                  : addr_mask[ADDR_WIDTH-1:0] = 28'b0;
  endcase
// &CombEnd; @102
end

// &ModuleEnd; @104
endmodule


