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

// &ModuleBeg; @28
module ct_mmu_sysmap(
  mmu_sysmap_pa_y,
  sysmap_mmu_flg_y,
  sysmap_mmu_hit_y
);

// &Ports; @29
input   [27:0]  mmu_sysmap_pa_y; 
output  [4 :0]  sysmap_mmu_flg_y; 
output  [7 :0]  sysmap_mmu_hit_y; 

// &Regs; @30
reg     [4 :0]  sysmap_mmu_flg_y; 

// &Wires; @31
wire            addr_ge_bottom0; 
wire            addr_ge_bottom1; 
wire            addr_ge_bottom2; 
wire            addr_ge_bottom3; 
wire            addr_ge_bottom4; 
wire            addr_ge_bottom5; 
wire            addr_ge_bottom6; 
wire            addr_ge_bottom7; 
wire            addr_ge_upaddr0; 
wire            addr_ge_upaddr1; 
wire            addr_ge_upaddr2; 
wire            addr_ge_upaddr3; 
wire            addr_ge_upaddr4; 
wire            addr_ge_upaddr5; 
wire            addr_ge_upaddr6; 
wire            addr_ge_upaddr7; 
wire    [27:0]  mmu_sysmap_pa_y; 
wire            sysmap_comp_hit0; 
wire            sysmap_comp_hit1; 
wire            sysmap_comp_hit2; 
wire            sysmap_comp_hit3; 
wire            sysmap_comp_hit4; 
wire            sysmap_comp_hit5; 
wire            sysmap_comp_hit6; 
wire            sysmap_comp_hit7; 
wire    [7 :0]  sysmap_hit;      
wire            sysmap_mmu_hit0; 
wire            sysmap_mmu_hit1; 
wire            sysmap_mmu_hit2; 
wire            sysmap_mmu_hit3; 
wire            sysmap_mmu_hit4; 
wire            sysmap_mmu_hit5; 
wire            sysmap_mmu_hit6; 
wire            sysmap_mmu_hit7; 
wire    [7 :0]  sysmap_mmu_hit_y; 


parameter ADDR_WIDTH = `PA_WIDTH-12;
parameter FLG_WIDTH  = 5;

// compare hit
// &ConnRule(s/_x/0/); @37
// &Instance("ct_mmu_sysmap_hit", "x_ct_mmu_sysmap_hit_0"); @38
ct_mmu_sysmap_hit  x_ct_mmu_sysmap_hit_0 (
  .addr_ge_bottom_x  (addr_ge_bottom0  ),
  .addr_ge_upaddr_x  (addr_ge_upaddr0  ),
  .sysmap_comp_hit_x (sysmap_comp_hit0 ),
  .sysmap_mmu_hit_x  (sysmap_mmu_hit0  )
);


// &ConnRule(s/_x/1/); @40
// &Instance("ct_mmu_sysmap_hit", "x_ct_mmu_sysmap_hit_1"); @41
ct_mmu_sysmap_hit  x_ct_mmu_sysmap_hit_1 (
  .addr_ge_bottom_x  (addr_ge_bottom1  ),
  .addr_ge_upaddr_x  (addr_ge_upaddr1  ),
  .sysmap_comp_hit_x (sysmap_comp_hit1 ),
  .sysmap_mmu_hit_x  (sysmap_mmu_hit1  )
);


// &ConnRule(s/_x/2/); @43
// &Instance("ct_mmu_sysmap_hit", "x_ct_mmu_sysmap_hit_2"); @44
ct_mmu_sysmap_hit  x_ct_mmu_sysmap_hit_2 (
  .addr_ge_bottom_x  (addr_ge_bottom2  ),
  .addr_ge_upaddr_x  (addr_ge_upaddr2  ),
  .sysmap_comp_hit_x (sysmap_comp_hit2 ),
  .sysmap_mmu_hit_x  (sysmap_mmu_hit2  )
);


// &ConnRule(s/_x/3/); @46
// &Instance("ct_mmu_sysmap_hit", "x_ct_mmu_sysmap_hit_3"); @47
ct_mmu_sysmap_hit  x_ct_mmu_sysmap_hit_3 (
  .addr_ge_bottom_x  (addr_ge_bottom3  ),
  .addr_ge_upaddr_x  (addr_ge_upaddr3  ),
  .sysmap_comp_hit_x (sysmap_comp_hit3 ),
  .sysmap_mmu_hit_x  (sysmap_mmu_hit3  )
);


// &ConnRule(s/_x/4/); @49
// &Instance("ct_mmu_sysmap_hit", "x_ct_mmu_sysmap_hit_4"); @50
ct_mmu_sysmap_hit  x_ct_mmu_sysmap_hit_4 (
  .addr_ge_bottom_x  (addr_ge_bottom4  ),
  .addr_ge_upaddr_x  (addr_ge_upaddr4  ),
  .sysmap_comp_hit_x (sysmap_comp_hit4 ),
  .sysmap_mmu_hit_x  (sysmap_mmu_hit4  )
);


// &ConnRule(s/_x/5/); @52
// &Instance("ct_mmu_sysmap_hit", "x_ct_mmu_sysmap_hit_5"); @53
ct_mmu_sysmap_hit  x_ct_mmu_sysmap_hit_5 (
  .addr_ge_bottom_x  (addr_ge_bottom5  ),
  .addr_ge_upaddr_x  (addr_ge_upaddr5  ),
  .sysmap_comp_hit_x (sysmap_comp_hit5 ),
  .sysmap_mmu_hit_x  (sysmap_mmu_hit5  )
);


// &ConnRule(s/_x/6/); @55
// &Instance("ct_mmu_sysmap_hit", "x_ct_mmu_sysmap_hit_6"); @56
ct_mmu_sysmap_hit  x_ct_mmu_sysmap_hit_6 (
  .addr_ge_bottom_x  (addr_ge_bottom6  ),
  .addr_ge_upaddr_x  (addr_ge_upaddr6  ),
  .sysmap_comp_hit_x (sysmap_comp_hit6 ),
  .sysmap_mmu_hit_x  (sysmap_mmu_hit6  )
);


// &ConnRule(s/_x/7/); @58
// &Instance("ct_mmu_sysmap_hit", "x_ct_mmu_sysmap_hit_7"); @59
ct_mmu_sysmap_hit  x_ct_mmu_sysmap_hit_7 (
  .addr_ge_bottom_x  (addr_ge_bottom7  ),
  .addr_ge_upaddr_x  (addr_ge_upaddr7  ),
  .sysmap_comp_hit_x (sysmap_comp_hit7 ),
  .sysmap_mmu_hit_x  (sysmap_mmu_hit7  )
);


// &Force("nonport", "addr_ge_upaddr7"); @61
assign {addr_ge_bottom7, addr_ge_bottom6, 
        addr_ge_bottom5, addr_ge_bottom4,
        addr_ge_bottom3, addr_ge_bottom2,
        addr_ge_bottom1, addr_ge_bottom0} = 
       {addr_ge_upaddr6, addr_ge_upaddr5, 
        addr_ge_upaddr4, addr_ge_upaddr3,
        addr_ge_upaddr2, addr_ge_upaddr1,
        addr_ge_upaddr0, 1'b1};


assign sysmap_hit[7:0] = {sysmap_mmu_hit7, sysmap_mmu_hit6, 
                          sysmap_mmu_hit5, sysmap_mmu_hit4,
                          sysmap_mmu_hit3, sysmap_mmu_hit2,
                          sysmap_mmu_hit1, sysmap_mmu_hit0}; 

// &CombBeg; @77
always @( sysmap_hit[7:0])
begin
  casez(sysmap_hit[7:0])
    8'b00000001  : sysmap_mmu_flg_y[FLG_WIDTH-1:0] = `SYSMAP_FLG0;
    8'b00000010  : sysmap_mmu_flg_y[FLG_WIDTH-1:0] = `SYSMAP_FLG1;
    8'b00000100  : sysmap_mmu_flg_y[FLG_WIDTH-1:0] = `SYSMAP_FLG2;
    8'b00001000  : sysmap_mmu_flg_y[FLG_WIDTH-1:0] = `SYSMAP_FLG3;
    8'b00010000  : sysmap_mmu_flg_y[FLG_WIDTH-1:0] = `SYSMAP_FLG4;
    8'b00100000  : sysmap_mmu_flg_y[FLG_WIDTH-1:0] = `SYSMAP_FLG5;
    8'b01000000  : sysmap_mmu_flg_y[FLG_WIDTH-1:0] = `SYSMAP_FLG6;
    8'b10000000  : sysmap_mmu_flg_y[FLG_WIDTH-1:0] = `SYSMAP_FLG7;
    //default      : sysmap_mmu_flg_y[FLG_WIDTH-1:0] = 5'b01111;
    default      : sysmap_mmu_flg_y[FLG_WIDTH-1:0] = 5'b10011;
endcase
// &CombEnd; @90
end
assign sysmap_mmu_hit_y[7:0] = sysmap_hit[7:0];

// sysmap addr adder
assign sysmap_comp_hit0 = mmu_sysmap_pa_y[ADDR_WIDTH-1:0]
                        < `SYSMAP_BASE_ADDR0;
assign sysmap_comp_hit1 = mmu_sysmap_pa_y[ADDR_WIDTH-1:0]
                        < `SYSMAP_BASE_ADDR1;
assign sysmap_comp_hit2 = mmu_sysmap_pa_y[ADDR_WIDTH-1:0]
                        < `SYSMAP_BASE_ADDR2;
assign sysmap_comp_hit3 = mmu_sysmap_pa_y[ADDR_WIDTH-1:0]
                        < `SYSMAP_BASE_ADDR3;
assign sysmap_comp_hit4 = mmu_sysmap_pa_y[ADDR_WIDTH-1:0]
                        < `SYSMAP_BASE_ADDR4;
assign sysmap_comp_hit5 = mmu_sysmap_pa_y[ADDR_WIDTH-1:0]
                        < `SYSMAP_BASE_ADDR5;
assign sysmap_comp_hit6 = mmu_sysmap_pa_y[ADDR_WIDTH-1:0]
                        < `SYSMAP_BASE_ADDR6;
assign sysmap_comp_hit7 = mmu_sysmap_pa_y[ADDR_WIDTH-1:0]
                        < `SYSMAP_BASE_ADDR7;


// &ModuleEnd; @112
endmodule


