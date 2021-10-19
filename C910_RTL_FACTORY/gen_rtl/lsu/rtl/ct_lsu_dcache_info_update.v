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
module ct_lsu_dcache_info_update(
  compare_dcwp_addr,
  compare_dcwp_hit_idx,
  compare_dcwp_sw_inst,
  compare_dcwp_update_vld,
  dcache_dirty_din,
  dcache_dirty_gwen,
  dcache_dirty_wen,
  dcache_idx,
  dcache_tag_din,
  dcache_tag_gwen,
  dcache_tag_wen,
  origin_dcache_dirty,
  origin_dcache_share,
  origin_dcache_valid,
  origin_dcache_way,
  update_dcache_dirty,
  update_dcache_share,
  update_dcache_valid,
  update_dcache_way
);

// &Ports; @24
input   [39:0]  compare_dcwp_addr;            
input           compare_dcwp_sw_inst;         
input   [6 :0]  dcache_dirty_din;             
input           dcache_dirty_gwen;            
input   [6 :0]  dcache_dirty_wen;             
input   [8 :0]  dcache_idx;                   
input   [51:0]  dcache_tag_din;               
input           dcache_tag_gwen;              
input   [1 :0]  dcache_tag_wen;               
input           origin_dcache_dirty;          
input           origin_dcache_share;          
input           origin_dcache_valid;          
input           origin_dcache_way;            
output          compare_dcwp_hit_idx;         
output          compare_dcwp_update_vld;      
output          update_dcache_dirty;          
output          update_dcache_share;          
output          update_dcache_valid;          
output          update_dcache_way;            

// &Regs; @25

// &Wires; @26
wire    [39:0]  compare_dcwp_addr;            
wire            compare_dcwp_hit_dirty;       
wire    [2 :0]  compare_dcwp_hit_dirty_din;   
wire    [2 :0]  compare_dcwp_hit_dirty_wen;   
wire            compare_dcwp_hit_idx;         
wire            compare_dcwp_hit_sel;         
wire            compare_dcwp_hit_share;       
wire            compare_dcwp_hit_up_vld;      
wire            compare_dcwp_hit_valid;       
wire            compare_dcwp_miss_dirty;      
wire    [2 :0]  compare_dcwp_miss_dirty_din;  
wire            compare_dcwp_miss_share;      
wire            compare_dcwp_miss_up_pre;     
wire            compare_dcwp_miss_up_vld;     
wire            compare_dcwp_miss_up_way0;    
wire            compare_dcwp_miss_up_way0_sel; 
wire            compare_dcwp_miss_up_way1;    
wire            compare_dcwp_miss_up_way1_sel; 
wire            compare_dcwp_miss_valid;      
wire            compare_dcwp_sw_inst;         
wire            compare_dcwp_sw_up_vld;       
wire    [25:0]  compare_dcwp_tag;             
wire            compare_dcwp_update_vld;      
wire    [6 :0]  dcache_dirty_din;             
wire            dcache_dirty_gwen;            
wire    [6 :0]  dcache_dirty_wen;             
wire    [51:0]  dcache_tag_din;               
wire            dcache_tag_gwen;              
wire    [1 :0]  dcache_tag_wen;               
wire            origin_dcache_dirty;          
wire            origin_dcache_share;          
wire            origin_dcache_valid;          
wire            origin_dcache_way;            
wire            update_dcache_dirty;          
wire            update_dcache_dirty_new;      
wire            update_dcache_share;          
wire            update_dcache_share_new;      
wire            update_dcache_valid;          
wire            update_dcache_valid_new;      
wire            update_dcache_way;            
wire            update_dcache_way_new;        


// &Force("output","compare_dcwp_hit_idx"); @28
// &Force("input","compare_dcwp_addr"); @29
// &Force("bus","compare_dcwp_addr","39","0"); @30
// &Force("input","dcache_idx"); @31
// &Force("bus","dcache_idx","8","0"); @32
//csky vperl_off
`ifdef DCACHE_32K
assign compare_dcwp_hit_idx = compare_dcwp_addr[13:6]  ==  dcache_idx[7:0];
`endif//DCACHE_32K

`ifdef DCACHE_64K
assign compare_dcwp_hit_idx = compare_dcwp_addr[14:6]  ==  dcache_idx[8:0];
`endif//DCACHE_64K
//csky vperl_on

//-----------------update if dcache hit---------------------

// &Force("bus","dcache_dirty_din",6,0); @45
// &Force("bus","dcache_dirty_wen",6,0); @46
assign compare_dcwp_hit_dirty_din[2:0]  = origin_dcache_way
                                          ? dcache_dirty_din[5:3]
                                          : dcache_dirty_din[2:0];

assign compare_dcwp_hit_dirty_wen[2:0]  = origin_dcache_way
                                          ? dcache_dirty_wen[5:3]
                                          : dcache_dirty_wen[2:0];

assign compare_dcwp_hit_up_vld          = dcache_dirty_gwen
                                            &&  origin_dcache_valid
                                            &&  compare_dcwp_hit_idx;

assign compare_dcwp_hit_dirty           = compare_dcwp_hit_dirty_wen[2]
                                          ? compare_dcwp_hit_dirty_din[2]
                                          : origin_dcache_dirty;

assign compare_dcwp_hit_share           = compare_dcwp_hit_dirty_wen[1]
                                          ? compare_dcwp_hit_dirty_din[1]
                                          : origin_dcache_share;

assign compare_dcwp_hit_valid           = compare_dcwp_hit_dirty_wen[0]
                                          ? compare_dcwp_hit_dirty_din[0]
                                          : origin_dcache_valid;

//---------------update if dcache miss----------------------
//dcache set&way inst will not appear dcache miss update,
assign compare_dcwp_miss_up_pre         = dcache_tag_gwen
                                          &&  !compare_dcwp_sw_inst
                                          &&  !origin_dcache_valid;

assign compare_dcwp_tag[25:0]           = compare_dcwp_addr[39:14];

assign compare_dcwp_miss_up_way0_sel    = dcache_dirty_wen[0]
                                          &&  dcache_dirty_din[0]
                                          &&  dcache_tag_wen[0]
                                          &&  (compare_dcwp_tag[25:0]
                                              ==  dcache_tag_din[25:0]);

assign compare_dcwp_miss_up_way0        = compare_dcwp_miss_up_pre
                                          &&  compare_dcwp_miss_up_way0_sel
                                          &&  compare_dcwp_hit_idx;

assign compare_dcwp_miss_up_way1_sel    = dcache_dirty_wen[3]
                                          &&  dcache_dirty_din[3]
                                          &&  dcache_tag_wen[1]
                                          &&  (compare_dcwp_tag[25:0]
                                              ==  dcache_tag_din[51:26]);

assign compare_dcwp_miss_up_way1        = compare_dcwp_miss_up_pre
                                          &&  compare_dcwp_miss_up_way1_sel
                                          &&  compare_dcwp_hit_idx;

//if refill cacheline then the ralating dirty wen must open,
//so it will set din to the update signal.
assign compare_dcwp_miss_dirty_din[2:0] = compare_dcwp_miss_up_way1_sel
                                          ? dcache_dirty_din[5:3]
                                          : dcache_dirty_din[2:0];

assign compare_dcwp_miss_up_vld         = compare_dcwp_miss_up_way0
                                          ||  compare_dcwp_miss_up_way1;

assign compare_dcwp_miss_dirty          = compare_dcwp_miss_dirty_din[2];
assign compare_dcwp_miss_share          = compare_dcwp_miss_dirty_din[1];
assign compare_dcwp_miss_valid          = compare_dcwp_miss_dirty_din[0];

//--------------------set&way update------------------------
//only up_vld use set&way signal, other signals reuse hit update signals
assign compare_dcwp_sw_up_vld           = dcache_dirty_gwen
                                          &&  compare_dcwp_sw_inst
                                          &&  compare_dcwp_hit_idx;
//---------------------select-------------------------------
// &Force("output","compare_dcwp_update_vld"); @118
assign compare_dcwp_update_vld          = compare_dcwp_hit_up_vld
                                          ||  compare_dcwp_miss_up_vld
                                          ||  compare_dcwp_sw_up_vld;

assign compare_dcwp_hit_sel             = origin_dcache_valid
                                          ||  compare_dcwp_sw_inst;

assign update_dcache_dirty_new          = compare_dcwp_hit_sel
                                          ? compare_dcwp_hit_dirty
                                          : compare_dcwp_miss_dirty;

assign update_dcache_share_new          = compare_dcwp_hit_sel
                                          ? compare_dcwp_hit_share
                                          : compare_dcwp_miss_share;

assign update_dcache_valid_new          = compare_dcwp_hit_sel
                                          ? compare_dcwp_hit_valid
                                          : compare_dcwp_miss_valid;

assign update_dcache_way_new            = compare_dcwp_hit_sel
                                          ? origin_dcache_way
                                          : compare_dcwp_miss_up_way1;

//if donot need to update, choose origin value
assign update_dcache_dirty              = compare_dcwp_update_vld
                                          ? update_dcache_dirty_new
                                          : origin_dcache_dirty;

assign update_dcache_share              = compare_dcwp_update_vld
                                          ? update_dcache_share_new
                                          : origin_dcache_share;

assign update_dcache_valid              = compare_dcwp_update_vld
                                          ? update_dcache_valid_new
                                          : origin_dcache_valid;

assign update_dcache_way                = compare_dcwp_update_vld
                                          ? update_dcache_way_new
                                          : origin_dcache_way;

// &ModuleEnd; @159
endmodule


