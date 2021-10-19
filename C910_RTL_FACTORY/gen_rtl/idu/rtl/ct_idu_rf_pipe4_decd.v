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

// &ModuleBeg; @27
module ct_idu_rf_pipe4_decd(
  cp0_lsu_fencei_broad_dis,
  cp0_lsu_fencerw_broad_dis,
  cp0_lsu_tlb_broad_dis,
  pipe4_decd_atomic,
  pipe4_decd_dst_preg,
  pipe4_decd_fence_mode,
  pipe4_decd_icc,
  pipe4_decd_inst_fls,
  pipe4_decd_inst_flush,
  pipe4_decd_inst_mode,
  pipe4_decd_inst_share,
  pipe4_decd_inst_size,
  pipe4_decd_inst_str,
  pipe4_decd_inst_type,
  pipe4_decd_lsfifo,
  pipe4_decd_mmu_req,
  pipe4_decd_off_0_extend,
  pipe4_decd_offset,
  pipe4_decd_offset_plus,
  pipe4_decd_opcode,
  pipe4_decd_shift,
  pipe4_decd_st,
  pipe4_decd_sync_fence
);

// &Ports; @28
input           cp0_lsu_fencei_broad_dis; 
input           cp0_lsu_fencerw_broad_dis; 
input           cp0_lsu_tlb_broad_dis;    
input   [6 :0]  pipe4_decd_dst_preg;      
input   [31:0]  pipe4_decd_opcode;        
output          pipe4_decd_atomic;        
output  [3 :0]  pipe4_decd_fence_mode;    
output          pipe4_decd_icc;           
output          pipe4_decd_inst_fls;      
output          pipe4_decd_inst_flush;    
output  [1 :0]  pipe4_decd_inst_mode;     
output          pipe4_decd_inst_share;    
output  [1 :0]  pipe4_decd_inst_size;     
output          pipe4_decd_inst_str;      
output  [1 :0]  pipe4_decd_inst_type;     
output          pipe4_decd_lsfifo;        
output          pipe4_decd_mmu_req;       
output          pipe4_decd_off_0_extend;  
output  [11:0]  pipe4_decd_offset;        
output  [12:0]  pipe4_decd_offset_plus;   
output  [3 :0]  pipe4_decd_shift;         
output          pipe4_decd_st;            
output          pipe4_decd_sync_fence;    

// &Regs; @29
reg             pipe4_decd_atomic;        
reg     [3 :0]  pipe4_decd_fence_mode;    
reg             pipe4_decd_icc;           
reg             pipe4_decd_inst_fls;      
reg             pipe4_decd_inst_flush;    
reg     [1 :0]  pipe4_decd_inst_mode;     
reg             pipe4_decd_inst_share;    
reg     [1 :0]  pipe4_decd_inst_size;     
reg             pipe4_decd_inst_str;      
reg     [1 :0]  pipe4_decd_inst_type;     
reg             pipe4_decd_inst_vls;      
reg             pipe4_decd_lsfifo;        
reg             pipe4_decd_mmu_req;       
reg             pipe4_decd_off_0_extend;  
reg     [11:0]  pipe4_decd_offset;        
reg     [3 :0]  pipe4_decd_shift;         
reg             pipe4_decd_st;            
reg             pipe4_decd_sync_fence;    
reg     [1 :0]  sfence_inst_mode;         
reg     [3 :0]  str_shift;                

// &Wires; @30
wire            cp0_lsu_fencei_broad_dis; 
wire            cp0_lsu_fencerw_broad_dis; 
wire            cp0_lsu_tlb_broad_dis;    
wire    [31:0]  decd_op;                  
wire    [3 :0]  fence_mode_sel;           
wire    [6 :0]  pipe4_decd_dst_preg;      
wire    [12:0]  pipe4_decd_offset_plus;   
wire    [31:0]  pipe4_decd_opcode;        
wire            rs1_is_zero;              
wire            rs2_is_zero;              


parameter BYTE        = 2'b00,
          HALF        = 2'b01,
          WORD        = 2'b10,
          DWORD       = 2'b11;

//==========================================================
//                    Rename Input
//==========================================================
assign decd_op[31:0] = pipe4_decd_opcode[31:0];

//==========================================================
//              Decode for offset shift
//==========================================================
// &CombBeg; @45
always @( decd_op[26:25])
begin
str_shift[3:0] = 4'b0;
case(decd_op[26:25])
  2'b00:str_shift[0] = 1'b1;
  2'b01:str_shift[1] = 1'b1;
  2'b10:str_shift[2] = 1'b1;
  2'b11:str_shift[3] = 1'b1;
  default:str_shift[3:0] = 4'b0;
endcase
// &CombEnd; @54
end

//==========================================================
//                Decode for specail inst
//==========================================================
//-----------------------fence------------------------------
assign fence_mode_sel[3:0]  = (decd_op[27]
                                ||  decd_op[25]
                                ||  decd_op[23]
                                ||  decd_op[21])
                              ? 4'b1111
                              : 4'b1100;
//---------------------sfence.vma----------------------------
assign rs1_is_zero  = decd_op[19:15]  ==  5'b0;
assign rs2_is_zero  = decd_op[24:20]  ==  5'b0;

// &CombBeg; @70
always @( rs1_is_zero
       or rs2_is_zero)
begin
if(rs1_is_zero  &&  rs2_is_zero)
  sfence_inst_mode[1:0]  = 2'b00;
else if(rs1_is_zero)
  sfence_inst_mode[1:0]  = 2'b01;
else if(rs2_is_zero)
  sfence_inst_mode[1:0]  = 2'b10;
else
  sfence_inst_mode[1:0]  = 2'b11;
// &CombEnd; @79
end










//==========================================================
//                       Decode
//==========================================================
// &CombBeg; @93
always @( decd_op[31:0]
       or cp0_lsu_tlb_broad_dis
       or str_shift[3:0]
       or cp0_lsu_fencerw_broad_dis
       or pipe4_decd_dst_preg[6:0]
       or sfence_inst_mode[1:0]
       or cp0_lsu_fencei_broad_dis
       or fence_mode_sel[3:0])
begin
casez(decd_op[31:0])
//------------------------normal----------------------------
  //  ..28..24..20..16..12...8...4...0
  32'b?????????????????000?????0100011:  //sb
  begin
    pipe4_decd_atomic         = 1'b0;
    pipe4_decd_sync_fence     = 1'b0;
    pipe4_decd_inst_flush     = 1'b0;
    pipe4_decd_inst_share     = 1'b0;
    pipe4_decd_icc            = 1'b0;
    pipe4_decd_st             = 1'b1;
    pipe4_decd_mmu_req        = 1'b1;
    pipe4_decd_inst_type[1:0] = 2'b00;
    pipe4_decd_inst_size[1:0] = 2'b00;
    pipe4_decd_inst_mode[1:0] = 2'b00;
    pipe4_decd_fence_mode[3:0]= 4'b0000;
    pipe4_decd_inst_fls       = 1'b0;
    pipe4_decd_inst_vls       = 1'b0;
    pipe4_decd_offset[11:0]   = {decd_op[31:25],decd_op[11:7]};
    pipe4_decd_shift[3:0]     = 4'b1;
    pipe4_decd_inst_str       = 1'b0;
    pipe4_decd_off_0_extend   = 1'b0;
    pipe4_decd_lsfifo         = 1'b1;
  end
  //  ..28..24..20..16..12...8...4...0
  32'b?????????????????001?????0100011:  //sh
  begin
    pipe4_decd_atomic         = 1'b0;
    pipe4_decd_sync_fence     = 1'b0;
    pipe4_decd_inst_flush     = 1'b0;
    pipe4_decd_inst_share     = 1'b0;
    pipe4_decd_icc            = 1'b0;
    pipe4_decd_st             = 1'b1;
    pipe4_decd_mmu_req        = 1'b1;
    pipe4_decd_inst_type[1:0] = 2'b00;
    pipe4_decd_inst_size[1:0] = 2'b01;
    pipe4_decd_inst_mode[1:0] = 2'b00;
    pipe4_decd_fence_mode[3:0]= 4'b0000;
    pipe4_decd_inst_fls       = 1'b0;
    pipe4_decd_inst_vls       = 1'b0;
    pipe4_decd_offset[11:0]   = {decd_op[31:25],decd_op[11:7]};
    pipe4_decd_shift[3:0]     = 4'b1;
    pipe4_decd_inst_str       = 1'b0;
    pipe4_decd_off_0_extend   = 1'b0;
    pipe4_decd_lsfifo         = 1'b1;
  end
  //  ..28..24..20..16..12...8...4...0
  32'b?????????????????010?????0100011:  //sw
  begin
    pipe4_decd_atomic         = 1'b0;
    pipe4_decd_sync_fence     = 1'b0;
    pipe4_decd_inst_flush     = 1'b0;
    pipe4_decd_inst_share     = 1'b0;
    pipe4_decd_icc            = 1'b0;
    pipe4_decd_st             = 1'b1;
    pipe4_decd_mmu_req        = 1'b1;
    pipe4_decd_inst_type[1:0] = 2'b00;
    pipe4_decd_inst_size[1:0] = 2'b10;
    pipe4_decd_inst_mode[1:0] = 2'b00;
    pipe4_decd_fence_mode[3:0]= 4'b0000;
    pipe4_decd_inst_fls       = 1'b0;
    pipe4_decd_inst_vls       = 1'b0;
    pipe4_decd_offset[11:0]   = {decd_op[31:25],decd_op[11:7]};
    pipe4_decd_shift[3:0]     = 4'b1;
    pipe4_decd_inst_str       = 1'b0;
    pipe4_decd_off_0_extend   = 1'b0;
    pipe4_decd_lsfifo         = 1'b1;
  end
  //  ..28..24..20..16..12...8...4...0
  32'b?????????????????011?????0100011:  //sd
  begin
    pipe4_decd_atomic         = 1'b0;
    pipe4_decd_sync_fence     = 1'b0;
    pipe4_decd_inst_flush     = 1'b0;
    pipe4_decd_inst_share     = 1'b0;
    pipe4_decd_icc            = 1'b0;
    pipe4_decd_st             = 1'b1;
    pipe4_decd_mmu_req        = 1'b1;
    pipe4_decd_inst_type[1:0] = 2'b00;
    pipe4_decd_inst_size[1:0] = 2'b11;
    pipe4_decd_inst_mode[1:0] = 2'b00;
    pipe4_decd_fence_mode[3:0]= 4'b0000;
    pipe4_decd_inst_fls       = 1'b0;
    pipe4_decd_inst_vls       = 1'b0;
    pipe4_decd_offset[11:0]   = {decd_op[31:25],decd_op[11:7]};
    pipe4_decd_shift[3:0]     = 4'b1;
    pipe4_decd_inst_str       = 1'b0;
    pipe4_decd_off_0_extend   = 1'b0;
    pipe4_decd_lsfifo         = 1'b1;
  end
//------------------------atomic----------------------------
  //  ..28..24..20..16..12...8...4...0
  32'b00011????????????010?????0101111:  //sc.w
  begin
    pipe4_decd_atomic         = 1'b1;
    pipe4_decd_sync_fence     = 1'b0;
    pipe4_decd_inst_flush     = 1'b0;
    pipe4_decd_inst_share     = 1'b0;
    pipe4_decd_icc            = pipe4_decd_dst_preg[6];
    pipe4_decd_st             = 1'b1;
    pipe4_decd_mmu_req        = 1'b1;
    pipe4_decd_inst_type[1:0] = 2'b01;
    pipe4_decd_inst_size[1:0] = 2'b10;
    pipe4_decd_inst_mode[1:0] = pipe4_decd_dst_preg[5:4];
    pipe4_decd_fence_mode[3:0]= pipe4_decd_dst_preg[3:0];
    pipe4_decd_inst_fls       = 1'b0;
    pipe4_decd_inst_vls       = 1'b0;
    pipe4_decd_offset[11:0]   = 12'b0;
    pipe4_decd_shift[3:0]     = 4'b1;
    pipe4_decd_inst_str       = 1'b0;
    pipe4_decd_off_0_extend   = 1'b0;
    pipe4_decd_lsfifo         = 1'b0;
  end
  //  ..28..24..20..16..12...8...4...0
  32'b00001????????????010?????0101111,  //amoswap.w
  32'b00000????????????010?????0101111,  //amoadd .w
  32'b00100????????????010?????0101111,  //amoxor .w
  32'b01100????????????010?????0101111,  //amoand .w
  32'b01000????????????010?????0101111,  //amoor  .w
  32'b10000????????????010?????0101111,  //amomin .w
  32'b10100????????????010?????0101111,  //amomax .w
  32'b11000????????????010?????0101111,  //amominu.w
  32'b11100????????????010?????0101111:  //amomaxu.w
  begin
    pipe4_decd_atomic         = 1'b1;
    pipe4_decd_sync_fence     = 1'b0;
    pipe4_decd_inst_flush     = 1'b0;
    pipe4_decd_inst_share     = 1'b0;
    pipe4_decd_icc            = 1'b0;
    pipe4_decd_st             = 1'b1;
    pipe4_decd_mmu_req        = 1'b0;
    pipe4_decd_inst_type[1:0] = 2'b00;
    pipe4_decd_inst_size[1:0] = 2'b10;
    pipe4_decd_inst_mode[1:0] = 2'b0;
    pipe4_decd_fence_mode[3:0]= 4'b0;
    pipe4_decd_inst_fls       = 1'b0;
    pipe4_decd_inst_vls       = 1'b0;
    pipe4_decd_offset[11:0]   = 12'b0;
    pipe4_decd_shift[3:0]     = 4'b1;
    pipe4_decd_inst_str       = 1'b0;
    pipe4_decd_off_0_extend   = 1'b0;
    pipe4_decd_lsfifo         = 1'b0;
  end
  //  ..28..24..20..16..12...8...4...0
  32'b00011????????????011?????0101111:  //sc.d
  begin
    pipe4_decd_atomic         = 1'b1;
    pipe4_decd_sync_fence     = 1'b0;
    pipe4_decd_inst_flush     = 1'b0;
    pipe4_decd_inst_share     = 1'b0;
    pipe4_decd_icc            = pipe4_decd_dst_preg[6];
    pipe4_decd_st             = 1'b1;
    pipe4_decd_mmu_req        = 1'b1;
    pipe4_decd_inst_type[1:0] = 2'b01;
    pipe4_decd_inst_size[1:0] = 2'b11;
    pipe4_decd_inst_mode[1:0] = pipe4_decd_dst_preg[5:4];
    pipe4_decd_fence_mode[3:0]= pipe4_decd_dst_preg[3:0];
    pipe4_decd_inst_fls       = 1'b0;
    pipe4_decd_inst_vls       = 1'b0;
    pipe4_decd_offset[11:0]   = 12'b0;
    pipe4_decd_shift[3:0]     = 4'b1;
    pipe4_decd_inst_str       = 1'b0;
    pipe4_decd_off_0_extend   = 1'b0;
    pipe4_decd_lsfifo         = 1'b0;
  end
  //  ..28..24..20..16..12...8...4...0
  32'b00001????????????011?????0101111,  //amoswap.d
  32'b00000????????????011?????0101111,  //amoadd .d
  32'b00100????????????011?????0101111,  //amoxor .d
  32'b01100????????????011?????0101111,  //amoand .d
  32'b01000????????????011?????0101111,  //amoor  .d
  32'b10000????????????011?????0101111,  //amomin .d
  32'b10100????????????011?????0101111,  //amomax .d
  32'b11000????????????011?????0101111,  //amominu.d
  32'b11100????????????011?????0101111:  //amomaxu.d
  begin
    pipe4_decd_atomic         = 1'b1;
    pipe4_decd_sync_fence     = 1'b0;
    pipe4_decd_inst_flush     = 1'b0;
    pipe4_decd_inst_share     = 1'b0;
    pipe4_decd_icc            = 1'b0;
    pipe4_decd_st             = 1'b1;
    pipe4_decd_mmu_req        = 1'b0;
    pipe4_decd_inst_type[1:0] = 2'b00;
    pipe4_decd_inst_size[1:0] = 2'b11;
    pipe4_decd_inst_mode[1:0] = 2'b0;
    pipe4_decd_fence_mode[3:0]= 4'b0;
    pipe4_decd_inst_fls       = 1'b0;
    pipe4_decd_inst_vls       = 1'b0;
    pipe4_decd_offset[11:0]   = 12'b0;
    pipe4_decd_shift[3:0]     = 4'b1;
    pipe4_decd_inst_str       = 1'b0;
    pipe4_decd_off_0_extend   = 1'b0;
    pipe4_decd_lsfifo         = 1'b0;
  end
//------------------------float-----------------------------
  //  ..28..24..20..16..12...8...4...0
  32'b?????????????????001?????0100111:  //fsh
  begin
    pipe4_decd_atomic         = 1'b0;
    pipe4_decd_sync_fence     = 1'b0;
    pipe4_decd_inst_flush     = 1'b0;
    pipe4_decd_inst_share     = 1'b0;
    pipe4_decd_icc            = 1'b0;
    pipe4_decd_st             = 1'b1;
    pipe4_decd_mmu_req        = 1'b1;
    pipe4_decd_inst_type[1:0] = 2'b00;
    pipe4_decd_inst_size[1:0] = 2'b01;
    pipe4_decd_inst_mode[1:0] = 2'b00;
    pipe4_decd_fence_mode[3:0]= 4'b0000;
    pipe4_decd_inst_fls       = 1'b1;
    pipe4_decd_inst_vls       = 1'b0;
    pipe4_decd_offset[11:0]   = {decd_op[31:25],decd_op[11:7]};
    pipe4_decd_shift[3:0]     = 4'b1;
    pipe4_decd_inst_str       = 1'b0;
    pipe4_decd_off_0_extend   = 1'b0;
    pipe4_decd_lsfifo         = 1'b1;
  end
  //  ..28..24..20..16..12...8...4...0
  32'b?????????????????010?????0100111:  //fsw
  begin
    pipe4_decd_atomic         = 1'b0;
    pipe4_decd_sync_fence     = 1'b0;
    pipe4_decd_inst_flush     = 1'b0;
    pipe4_decd_inst_share     = 1'b0;
    pipe4_decd_icc            = 1'b0;
    pipe4_decd_st             = 1'b1;
    pipe4_decd_mmu_req        = 1'b1;
    pipe4_decd_inst_type[1:0] = 2'b00;
    pipe4_decd_inst_size[1:0] = 2'b10;
    pipe4_decd_inst_mode[1:0] = 2'b00;
    pipe4_decd_fence_mode[3:0]= 4'b0000;
    pipe4_decd_inst_fls       = 1'b1;
    pipe4_decd_inst_vls       = 1'b0;
    pipe4_decd_offset[11:0]   = {decd_op[31:25],decd_op[11:7]};
    pipe4_decd_shift[3:0]     = 4'b1;
    pipe4_decd_inst_str       = 1'b0;
    pipe4_decd_off_0_extend   = 1'b0;
    pipe4_decd_lsfifo         = 1'b1;
  end
  //  ..28..24..20..16..12...8...4...0
  32'b?????????????????011?????0100111:  //fsd
  begin
    pipe4_decd_atomic         = 1'b0;
    pipe4_decd_sync_fence     = 1'b0;
    pipe4_decd_inst_flush     = 1'b0;
    pipe4_decd_inst_share     = 1'b0;
    pipe4_decd_icc            = 1'b0;
    pipe4_decd_st             = 1'b1;
    pipe4_decd_mmu_req        = 1'b1;
    pipe4_decd_inst_type[1:0] = 2'b00;
    pipe4_decd_inst_size[1:0] = 2'b11;
    pipe4_decd_inst_mode[1:0] = 2'b00;
    pipe4_decd_fence_mode[3:0]= 4'b0000;
    pipe4_decd_inst_fls       = 1'b1;
    pipe4_decd_inst_vls       = 1'b0;
    pipe4_decd_offset[11:0]   = {decd_op[31:25],decd_op[11:7]};
    pipe4_decd_shift[3:0]     = 4'b1;
    pipe4_decd_inst_str       = 1'b0;
    pipe4_decd_off_0_extend   = 1'b0;
    pipe4_decd_lsfifo         = 1'b1;
  end
//------------------------short-----------------------------
  //  ..28..24..20..16..12...8...4...0
  32'b????????????????101???????????00:  //c.fsd
  begin
    pipe4_decd_atomic         = 1'b0;
    pipe4_decd_sync_fence     = 1'b0;
    pipe4_decd_inst_flush     = 1'b0;
    pipe4_decd_inst_share     = 1'b0;
    pipe4_decd_icc            = 1'b0;
    pipe4_decd_st             = 1'b1;
    pipe4_decd_mmu_req        = 1'b1;
    pipe4_decd_inst_type[1:0] = 2'b00;
    pipe4_decd_inst_size[1:0] = 2'b11;
    pipe4_decd_inst_mode[1:0] = 2'b00;
    pipe4_decd_fence_mode[3:0]= 4'b0000;
    pipe4_decd_inst_fls       = 1'b1;
    pipe4_decd_inst_vls       = 1'b0;
    pipe4_decd_offset[11:0]   = {4'b0,decd_op[6:5],decd_op[12:10],3'b0};
    pipe4_decd_shift[3:0]     = 4'b1;
    pipe4_decd_inst_str       = 1'b0;
    pipe4_decd_off_0_extend   = 1'b0;
    pipe4_decd_lsfifo         = 1'b1;
  end
  //  ..28..24..20..16..12...8...4...0
  32'b????????????????110???????????00:  //c.sw
  begin
    pipe4_decd_atomic         = 1'b0;
    pipe4_decd_sync_fence     = 1'b0;
    pipe4_decd_inst_flush     = 1'b0;
    pipe4_decd_inst_share     = 1'b0;
    pipe4_decd_icc            = 1'b0;
    pipe4_decd_st             = 1'b1;
    pipe4_decd_mmu_req        = 1'b1;
    pipe4_decd_inst_type[1:0] = 2'b00;
    pipe4_decd_inst_size[1:0] = 2'b10;
    pipe4_decd_inst_mode[1:0] = 2'b00;
    pipe4_decd_fence_mode[3:0]= 4'b0000;
    pipe4_decd_inst_fls       = 1'b0;
    pipe4_decd_inst_vls       = 1'b0;
    pipe4_decd_offset[11:0]   = {5'b0,decd_op[5],decd_op[12:10],decd_op[6],2'b0};
    pipe4_decd_shift[3:0]     = 4'b1;
    pipe4_decd_inst_str       = 1'b0;
    pipe4_decd_off_0_extend   = 1'b0;
    pipe4_decd_lsfifo         = 1'b1;
  end
  //  ..28..24..20..16..12...8...4...0
  32'b????????????????111???????????00:  //c.sd
  begin
    pipe4_decd_atomic         = 1'b0;
    pipe4_decd_sync_fence     = 1'b0;
    pipe4_decd_inst_flush     = 1'b0;
    pipe4_decd_inst_share     = 1'b0;
    pipe4_decd_icc            = 1'b0;
    pipe4_decd_st             = 1'b1;
    pipe4_decd_mmu_req        = 1'b1;
    pipe4_decd_inst_type[1:0] = 2'b00;
    pipe4_decd_inst_size[1:0] = 2'b11;
    pipe4_decd_inst_mode[1:0] = 2'b00;
    pipe4_decd_fence_mode[3:0]= 4'b0000;
    pipe4_decd_inst_fls       = 1'b0;
    pipe4_decd_inst_vls       = 1'b0;
    pipe4_decd_offset[11:0]   = {4'b0,decd_op[6:5],decd_op[12:10],3'b0};
    pipe4_decd_shift[3:0]     = 4'b1;
    pipe4_decd_inst_str       = 1'b0;
    pipe4_decd_off_0_extend   = 1'b0;
    pipe4_decd_lsfifo         = 1'b1;
  end
  //  ..28..24..20..16..12...8...4...0
  32'b????????????????101???????????10:  //c.fsdsp
  begin
    pipe4_decd_atomic         = 1'b0;
    pipe4_decd_sync_fence     = 1'b0;
    pipe4_decd_inst_flush     = 1'b0;
    pipe4_decd_inst_share     = 1'b0;
    pipe4_decd_icc            = 1'b0;
    pipe4_decd_st             = 1'b1;
    pipe4_decd_mmu_req        = 1'b1;
    pipe4_decd_inst_type[1:0] = 2'b00;
    pipe4_decd_inst_size[1:0] = 2'b11;
    pipe4_decd_inst_mode[1:0] = 2'b00;
    pipe4_decd_fence_mode[3:0]= 4'b0000;
    pipe4_decd_inst_fls       = 1'b1;
    pipe4_decd_inst_vls       = 1'b0;
    pipe4_decd_offset[11:0]   = {3'b0,decd_op[9:7],decd_op[12:10],3'b0};
    pipe4_decd_shift[3:0]     = 4'b1;
    pipe4_decd_inst_str       = 1'b0;
    pipe4_decd_off_0_extend   = 1'b0;
    pipe4_decd_lsfifo         = 1'b0;
  end
  //  ..28..24..20..16..12...8...4...0
  32'b????????????????110???????????10:  //c.swsp
  begin
    pipe4_decd_atomic         = 1'b0;
    pipe4_decd_sync_fence     = 1'b0;
    pipe4_decd_inst_flush     = 1'b0;
    pipe4_decd_inst_share     = 1'b0;
    pipe4_decd_icc            = 1'b0;
    pipe4_decd_st             = 1'b1;
    pipe4_decd_mmu_req        = 1'b1;
    pipe4_decd_inst_type[1:0] = 2'b00;
    pipe4_decd_inst_size[1:0] = 2'b10;
    pipe4_decd_inst_mode[1:0] = 2'b00;
    pipe4_decd_fence_mode[3:0]= 4'b0000;
    pipe4_decd_inst_fls       = 1'b0;
    pipe4_decd_inst_vls       = 1'b0;
    pipe4_decd_offset[11:0]   = {4'b0,decd_op[8:7],decd_op[12:9],2'b0};
    pipe4_decd_shift[3:0]     = 4'b1;
    pipe4_decd_inst_str       = 1'b0;
    pipe4_decd_off_0_extend   = 1'b0;
    pipe4_decd_lsfifo         = 1'b0;
  end
  //  ..28..24..20..16..12...8...4...0
  32'b????????????????111???????????10:  //c.sdsp
  begin
    pipe4_decd_atomic         = 1'b0;
    pipe4_decd_sync_fence     = 1'b0;
    pipe4_decd_inst_flush     = 1'b0;
    pipe4_decd_inst_share     = 1'b0;
    pipe4_decd_icc            = 1'b0;
    pipe4_decd_st             = 1'b1;
    pipe4_decd_mmu_req        = 1'b1;
    pipe4_decd_inst_type[1:0] = 2'b00;
    pipe4_decd_inst_size[1:0] = 2'b11;
    pipe4_decd_inst_mode[1:0] = 2'b00;
    pipe4_decd_fence_mode[3:0]= 4'b0000;
    pipe4_decd_inst_fls       = 1'b0;
    pipe4_decd_inst_vls       = 1'b0;
    pipe4_decd_offset[11:0]   = {3'b0,decd_op[9:7],decd_op[12:10],3'b0};
    pipe4_decd_shift[3:0]     = 4'b1;
    pipe4_decd_inst_str       = 1'b0;
    pipe4_decd_off_0_extend   = 1'b0;
    pipe4_decd_lsfifo         = 1'b0;
  end
  //  ..28..24..20..16..12...8...4...0
  32'b00000????????????101?????0001011:  //srb
  begin
    pipe4_decd_atomic         = 1'b0;
    pipe4_decd_sync_fence     = 1'b0;
    pipe4_decd_inst_flush     = 1'b0;
    pipe4_decd_inst_share     = 1'b0;
    pipe4_decd_icc            = 1'b0;
    pipe4_decd_st             = 1'b1;
    pipe4_decd_mmu_req        = 1'b1;
    pipe4_decd_inst_type[1:0] = 2'b00;
    pipe4_decd_inst_size[1:0] = 2'b00;
    pipe4_decd_inst_mode[1:0] = 2'b00;
    pipe4_decd_fence_mode[3:0]= 4'b0000;
    pipe4_decd_inst_fls       = 1'b0;
    pipe4_decd_inst_vls       = 1'b0;
    pipe4_decd_offset[11:0]   = 12'b0;
    pipe4_decd_shift[3:0]     = str_shift[3:0];
    pipe4_decd_inst_str       = 1'b1;
    pipe4_decd_off_0_extend   = 1'b0;
    pipe4_decd_lsfifo         = 1'b1;
  end
  //  ..28..24..20..16..12...8...4...0
  32'b00100????????????101?????0001011:  //srh
  begin
    pipe4_decd_atomic         = 1'b0;
    pipe4_decd_sync_fence     = 1'b0;
    pipe4_decd_inst_flush     = 1'b0;
    pipe4_decd_inst_share     = 1'b0;
    pipe4_decd_icc            = 1'b0;
    pipe4_decd_st             = 1'b1;
    pipe4_decd_mmu_req        = 1'b1;
    pipe4_decd_inst_type[1:0] = 2'b00;
    pipe4_decd_inst_size[1:0] = 2'b01;
    pipe4_decd_inst_mode[1:0] = 2'b00;
    pipe4_decd_fence_mode[3:0]= 4'b0000;
    pipe4_decd_inst_fls       = 1'b0;
    pipe4_decd_inst_vls       = 1'b0;
    pipe4_decd_offset[11:0]   = 12'b0;
    pipe4_decd_shift[3:0]     = str_shift[3:0];
    pipe4_decd_inst_str       = 1'b1;
    pipe4_decd_off_0_extend   = 1'b0;
    pipe4_decd_lsfifo         = 1'b1;
  end
  //  ..28..24..20..16..12...8...4...0
  32'b01000????????????101?????0001011:  //srw
  begin
    pipe4_decd_atomic         = 1'b0;
    pipe4_decd_sync_fence     = 1'b0;
    pipe4_decd_inst_flush     = 1'b0;
    pipe4_decd_inst_share     = 1'b0;
    pipe4_decd_icc            = 1'b0;
    pipe4_decd_st             = 1'b1;
    pipe4_decd_mmu_req        = 1'b1;
    pipe4_decd_inst_type[1:0] = 2'b00;
    pipe4_decd_inst_size[1:0] = 2'b10;
    pipe4_decd_inst_mode[1:0] = 2'b00;
    pipe4_decd_fence_mode[3:0]= 4'b0000;
    pipe4_decd_inst_fls       = 1'b0;
    pipe4_decd_inst_vls       = 1'b0;
    pipe4_decd_offset[11:0]   = 12'b0;
    pipe4_decd_shift[3:0]     = str_shift[3:0];
    pipe4_decd_inst_str       = 1'b1;
    pipe4_decd_off_0_extend   = 1'b0;
    pipe4_decd_lsfifo         = 1'b1;
  end
  //  ..28..24..20..16..12...8...4...0
  32'b01100????????????101?????0001011:  //srd
  begin
    pipe4_decd_atomic         = 1'b0;
    pipe4_decd_sync_fence     = 1'b0;
    pipe4_decd_inst_flush     = 1'b0;
    pipe4_decd_inst_share     = 1'b0;
    pipe4_decd_icc            = 1'b0;
    pipe4_decd_st             = 1'b1;
    pipe4_decd_mmu_req        = 1'b1;
    pipe4_decd_inst_type[1:0] = 2'b00;
    pipe4_decd_inst_size[1:0] = 2'b11;
    pipe4_decd_inst_mode[1:0] = 2'b00;
    pipe4_decd_fence_mode[3:0]= 4'b0000;
    pipe4_decd_inst_fls       = 1'b0;
    pipe4_decd_inst_vls       = 1'b0;
    pipe4_decd_offset[11:0]   = 12'b0;
    pipe4_decd_shift[3:0]     = str_shift[3:0];
    pipe4_decd_inst_str       = 1'b1;
    pipe4_decd_off_0_extend   = 1'b0;
    pipe4_decd_lsfifo         = 1'b1;
  end
  //  ..28..24..20..16..12...8...4...0
  32'b00010????????????101?????0001011:  //surb
  begin
    pipe4_decd_atomic         = 1'b0;
    pipe4_decd_sync_fence     = 1'b0;
    pipe4_decd_inst_flush     = 1'b0;
    pipe4_decd_inst_share     = 1'b0;
    pipe4_decd_icc            = 1'b0;
    pipe4_decd_st             = 1'b1;
    pipe4_decd_mmu_req        = 1'b1;
    pipe4_decd_inst_type[1:0] = 2'b00;
    pipe4_decd_inst_size[1:0] = 2'b00;
    pipe4_decd_inst_mode[1:0] = 2'b00;
    pipe4_decd_fence_mode[3:0]= 4'b0000;
    pipe4_decd_inst_fls       = 1'b0;
    pipe4_decd_inst_vls       = 1'b0;
    pipe4_decd_offset[11:0]   = 12'b0;
    pipe4_decd_shift[3:0]     = str_shift[3:0];
    pipe4_decd_inst_str       = 1'b1;
    pipe4_decd_off_0_extend   = 1'b1;
    pipe4_decd_lsfifo         = 1'b1;
  end
  //  ..28..24..20..16..12...8...4...0
  32'b00110????????????101?????0001011:  //surh
  begin
    pipe4_decd_atomic         = 1'b0;
    pipe4_decd_sync_fence     = 1'b0;
    pipe4_decd_inst_flush     = 1'b0;
    pipe4_decd_inst_share     = 1'b0;
    pipe4_decd_icc            = 1'b0;
    pipe4_decd_st             = 1'b1;
    pipe4_decd_mmu_req        = 1'b1;
    pipe4_decd_inst_type[1:0] = 2'b00;
    pipe4_decd_inst_size[1:0] = 2'b01;
    pipe4_decd_inst_mode[1:0] = 2'b00;
    pipe4_decd_fence_mode[3:0]= 4'b0000;
    pipe4_decd_inst_fls       = 1'b0;
    pipe4_decd_inst_vls       = 1'b0;
    pipe4_decd_offset[11:0]   = 12'b0;
    pipe4_decd_shift[3:0]     = str_shift[3:0];
    pipe4_decd_inst_str       = 1'b1;
    pipe4_decd_off_0_extend   = 1'b1;
    pipe4_decd_lsfifo         = 1'b1;
  end
  //  ..28..24..20..16..12...8...4...0
  32'b01010????????????101?????0001011:  //surw
  begin
    pipe4_decd_atomic         = 1'b0;
    pipe4_decd_sync_fence     = 1'b0;
    pipe4_decd_inst_flush     = 1'b0;
    pipe4_decd_inst_share     = 1'b0;
    pipe4_decd_icc            = 1'b0;
    pipe4_decd_st             = 1'b1;
    pipe4_decd_mmu_req        = 1'b1;
    pipe4_decd_inst_type[1:0] = 2'b00;
    pipe4_decd_inst_size[1:0] = 2'b10;
    pipe4_decd_inst_mode[1:0] = 2'b00;
    pipe4_decd_fence_mode[3:0]= 4'b0000;
    pipe4_decd_inst_fls       = 1'b0;
    pipe4_decd_inst_vls       = 1'b0;
    pipe4_decd_offset[11:0]   = 12'b0;
    pipe4_decd_shift[3:0]     = str_shift[3:0];
    pipe4_decd_inst_str       = 1'b1;
    pipe4_decd_off_0_extend   = 1'b1;
    pipe4_decd_lsfifo         = 1'b1;
  end
  //  ..28..24..20..16..12...8...4...0
  32'b01110????????????101?????0001011:  //surd
  begin
    pipe4_decd_atomic         = 1'b0;
    pipe4_decd_sync_fence     = 1'b0;
    pipe4_decd_inst_flush     = 1'b0;
    pipe4_decd_inst_share     = 1'b0;
    pipe4_decd_icc            = 1'b0;
    pipe4_decd_st             = 1'b1;
    pipe4_decd_mmu_req        = 1'b1;
    pipe4_decd_inst_type[1:0] = 2'b00;
    pipe4_decd_inst_size[1:0] = 2'b11;
    pipe4_decd_inst_mode[1:0] = 2'b00;
    pipe4_decd_fence_mode[3:0]= 4'b0000;
    pipe4_decd_inst_fls       = 1'b0;
    pipe4_decd_inst_vls       = 1'b0;
    pipe4_decd_offset[11:0]   = 12'b0;
    pipe4_decd_shift[3:0]     = str_shift[3:0];
    pipe4_decd_inst_str       = 1'b1;
    pipe4_decd_off_0_extend   = 1'b1;
    pipe4_decd_lsfifo         = 1'b1;
  end
  //  ..28..24..20..16..12...8...4...0
  32'b01000????????????111?????0001011:  //fsrw
  begin
    pipe4_decd_atomic         = 1'b0;
    pipe4_decd_sync_fence     = 1'b0;
    pipe4_decd_inst_flush     = 1'b0;
    pipe4_decd_inst_share     = 1'b0;
    pipe4_decd_icc            = 1'b0;
    pipe4_decd_st             = 1'b1;
    pipe4_decd_mmu_req        = 1'b1;
    pipe4_decd_inst_type[1:0] = 2'b00;
    pipe4_decd_inst_size[1:0] = 2'b10;
    pipe4_decd_inst_mode[1:0] = 2'b00;
    pipe4_decd_fence_mode[3:0]= 4'b0000;
    pipe4_decd_inst_fls       = 1'b1;
    pipe4_decd_inst_vls       = 1'b0;
    pipe4_decd_offset[11:0]   = 12'b0;
    pipe4_decd_shift[3:0]     = str_shift[3:0];
    pipe4_decd_inst_str       = 1'b1;
    pipe4_decd_off_0_extend   = 1'b0;
    pipe4_decd_lsfifo         = 1'b1;
  end
  //  ..28..24..20..16..12...8...4...0
  32'b01100????????????111?????0001011:  //fsrd
  begin
    pipe4_decd_atomic         = 1'b0;
    pipe4_decd_sync_fence     = 1'b0;
    pipe4_decd_inst_flush     = 1'b0;
    pipe4_decd_inst_share     = 1'b0;
    pipe4_decd_icc            = 1'b0;
    pipe4_decd_st             = 1'b1;
    pipe4_decd_mmu_req        = 1'b1;
    pipe4_decd_inst_type[1:0] = 2'b00;
    pipe4_decd_inst_size[1:0] = 2'b11;
    pipe4_decd_inst_mode[1:0] = 2'b00;
    pipe4_decd_fence_mode[3:0]= 4'b0000;
    pipe4_decd_inst_fls       = 1'b1;
    pipe4_decd_inst_vls       = 1'b0;
    pipe4_decd_offset[11:0]   = 12'b0;
    pipe4_decd_shift[3:0]     = str_shift[3:0];
    pipe4_decd_inst_str       = 1'b1;
    pipe4_decd_off_0_extend   = 1'b0;
    pipe4_decd_lsfifo         = 1'b1;
  end
  //  ..28..24..20..16..12...8...4...0
  32'b01010????????????111?????0001011:  //fsurw
  begin
    pipe4_decd_atomic         = 1'b0;
    pipe4_decd_sync_fence     = 1'b0;
    pipe4_decd_inst_flush     = 1'b0;
    pipe4_decd_inst_share     = 1'b0;
    pipe4_decd_icc            = 1'b0;
    pipe4_decd_st             = 1'b1;
    pipe4_decd_mmu_req        = 1'b1;
    pipe4_decd_inst_type[1:0] = 2'b00;
    pipe4_decd_inst_size[1:0] = 2'b10;
    pipe4_decd_inst_mode[1:0] = 2'b00;
    pipe4_decd_fence_mode[3:0]= 4'b0000;
    pipe4_decd_inst_fls       = 1'b1;
    pipe4_decd_inst_vls       = 1'b0;
    pipe4_decd_offset[11:0]   = 12'b0;
    pipe4_decd_shift[3:0]     = str_shift[3:0];
    pipe4_decd_inst_str       = 1'b1;
    pipe4_decd_off_0_extend   = 1'b1;
    pipe4_decd_lsfifo         = 1'b1;
  end
  //  ..28..24..20..16..12...8...4...0
  32'b01110????????????111?????0001011:  //fsurd
  begin
    pipe4_decd_atomic         = 1'b0;
    pipe4_decd_sync_fence     = 1'b0;
    pipe4_decd_inst_flush     = 1'b0;
    pipe4_decd_inst_share     = 1'b0;
    pipe4_decd_icc            = 1'b0;
    pipe4_decd_st             = 1'b1;
    pipe4_decd_mmu_req        = 1'b1;
    pipe4_decd_inst_type[1:0] = 2'b00;
    pipe4_decd_inst_size[1:0] = 2'b11;
    pipe4_decd_inst_mode[1:0] = 2'b00;
    pipe4_decd_fence_mode[3:0]= 4'b0000;
    pipe4_decd_inst_fls       = 1'b1;
    pipe4_decd_inst_vls       = 1'b0;
    pipe4_decd_offset[11:0]   = 12'b0;
    pipe4_decd_shift[3:0]     = str_shift[3:0];
    pipe4_decd_inst_str       = 1'b1;
    pipe4_decd_off_0_extend   = 1'b1;
    pipe4_decd_lsfifo         = 1'b1;
  end
//------------------------fence-----------------------------
  //  ..28..24..20..16..12...8...4...0
  32'b?????????????????000?????0001111:  //fence
  begin
    pipe4_decd_atomic         = 1'b0;
    pipe4_decd_sync_fence     = 1'b1;
    pipe4_decd_inst_flush     = 1'b0;
    pipe4_decd_inst_share     = !cp0_lsu_fencerw_broad_dis;
    pipe4_decd_icc            = 1'b0;
    pipe4_decd_st             = 1'b0;
    pipe4_decd_mmu_req        = 1'b0;
    pipe4_decd_inst_type[1:0] = 2'b01;
    pipe4_decd_inst_size[1:0] = 2'b00;
    pipe4_decd_inst_mode[1:0] = 2'b00;
    pipe4_decd_fence_mode[3:0]= fence_mode_sel[3:0];
    pipe4_decd_inst_fls       = 1'b0;
    pipe4_decd_inst_vls       = 1'b0;
    pipe4_decd_offset[11:0]   = 12'b0;
    pipe4_decd_shift[3:0]     = 4'b1;
    pipe4_decd_inst_str       = 1'b0;
    pipe4_decd_off_0_extend   = 1'b0;
    pipe4_decd_lsfifo         = 1'b0;
  end
  //  ..28..24..20..16..12...8...4...0
  32'b?????????????????001?????0001111:  //fence.i
  begin
    pipe4_decd_atomic         = 1'b0;
    pipe4_decd_sync_fence     = 1'b0;
    pipe4_decd_inst_flush     = 1'b0;
    pipe4_decd_inst_share     = !cp0_lsu_fencei_broad_dis;
    pipe4_decd_icc            = 1'b1;
    pipe4_decd_st             = 1'b0;
    pipe4_decd_mmu_req        = 1'b0;
    pipe4_decd_inst_type[1:0] = 2'b01;
    pipe4_decd_inst_size[1:0] = 2'b00;
    pipe4_decd_inst_mode[1:0] = 2'b00;
    pipe4_decd_fence_mode[3:0]= 4'b0000;
    pipe4_decd_inst_fls       = 1'b0;
    pipe4_decd_inst_vls       = 1'b0;
    pipe4_decd_offset[11:0]   = 12'b0;
    pipe4_decd_shift[3:0]     = 4'b1;
    pipe4_decd_inst_str       = 1'b0;
    pipe4_decd_off_0_extend   = 1'b0;
    pipe4_decd_lsfifo         = 1'b0;
  end
  //  ..28..24..20..16..12...8...4...0
  32'b0001001??????????000000001110011:  //sfence.vma
  begin
    pipe4_decd_atomic         = 1'b0;
    pipe4_decd_sync_fence     = 1'b0;
    pipe4_decd_inst_flush     = 1'b0;
    pipe4_decd_inst_share     = !cp0_lsu_tlb_broad_dis;
    pipe4_decd_icc            = 1'b1;
    pipe4_decd_st             = 1'b0;
    pipe4_decd_mmu_req        = 1'b0;
    pipe4_decd_inst_type[1:0] = 2'b00;
    pipe4_decd_inst_size[1:0] = 2'b00;
    pipe4_decd_inst_mode[1:0] = sfence_inst_mode[1:0];
    pipe4_decd_fence_mode[3:0]= 4'b0000;
    pipe4_decd_inst_fls       = 1'b0;
    pipe4_decd_inst_vls       = 1'b0;
    pipe4_decd_offset[11:0]   = 12'b0;
    pipe4_decd_shift[3:0]     = 4'b1;
    pipe4_decd_inst_str       = 1'b0;
    pipe4_decd_off_0_extend   = 1'b0;
    pipe4_decd_lsfifo         = 1'b0;
  end
//------------------------icc-------------------------------
  //  ..28..24..20..16..12...8...4...0
  32'b00000000001000000000000000001011:  //dcache.iall
  begin
    pipe4_decd_atomic         = 1'b0;
    pipe4_decd_sync_fence     = 1'b0;
    pipe4_decd_inst_flush     = 1'b0;
    pipe4_decd_inst_share     = 1'b0;
    pipe4_decd_icc            = 1'b1;
    pipe4_decd_st             = 1'b0;
    pipe4_decd_mmu_req        = 1'b0;
    pipe4_decd_inst_type[1:0] = 2'b10;
    pipe4_decd_inst_size[1:0] = 2'b10;
    pipe4_decd_inst_mode[1:0] = 2'b00;
    pipe4_decd_fence_mode[3:0]= 4'b0000;
    pipe4_decd_inst_fls       = 1'b0;
    pipe4_decd_inst_vls       = 1'b0;
    pipe4_decd_offset[11:0]   = 12'b0;
    pipe4_decd_shift[3:0]     = 4'b1;
    pipe4_decd_inst_str       = 1'b0;
    pipe4_decd_off_0_extend   = 1'b0;
    pipe4_decd_lsfifo         = 1'b0;
  end
  //  ..28..24..20..16..12...8...4...0
  32'b00000000000100000000000000001011:  //dcache.call
  begin
    pipe4_decd_atomic         = 1'b0;
    pipe4_decd_sync_fence     = 1'b0;
    pipe4_decd_inst_flush     = 1'b0;
    pipe4_decd_inst_share     = 1'b0;
    pipe4_decd_icc            = 1'b1;
    pipe4_decd_st             = 1'b0;
    pipe4_decd_mmu_req        = 1'b0;
    pipe4_decd_inst_type[1:0] = 2'b10;
    pipe4_decd_inst_size[1:0] = 2'b01;
    pipe4_decd_inst_mode[1:0] = 2'b00;
    pipe4_decd_fence_mode[3:0]= 4'b0000;
    pipe4_decd_inst_fls       = 1'b0;
    pipe4_decd_inst_vls       = 1'b0;
    pipe4_decd_offset[11:0]   = 12'b0;
    pipe4_decd_shift[3:0]     = 4'b1;
    pipe4_decd_inst_str       = 1'b0;
    pipe4_decd_off_0_extend   = 1'b0;
    pipe4_decd_lsfifo         = 1'b0;
  end
  //  ..28..24..20..16..12...8...4...0
  32'b00000000001100000000000000001011:  //dcache.ciall
  begin
    pipe4_decd_atomic         = 1'b0;
    pipe4_decd_sync_fence     = 1'b0;
    pipe4_decd_inst_flush     = 1'b0;
    pipe4_decd_inst_share     = 1'b0;
    pipe4_decd_icc            = 1'b1;
    pipe4_decd_st             = 1'b0;
    pipe4_decd_mmu_req        = 1'b0;
    pipe4_decd_inst_type[1:0] = 2'b10;
    pipe4_decd_inst_size[1:0] = 2'b11;
    pipe4_decd_inst_mode[1:0] = 2'b00;
    pipe4_decd_fence_mode[3:0]= 4'b0000;
    pipe4_decd_inst_fls       = 1'b0;
    pipe4_decd_inst_vls       = 1'b0;
    pipe4_decd_offset[11:0]   = 12'b0;
    pipe4_decd_shift[3:0]     = 4'b1;
    pipe4_decd_inst_str       = 1'b0;
    pipe4_decd_off_0_extend   = 1'b0;
    pipe4_decd_lsfifo         = 1'b0;
  end
  //  ..28..24..20..16..12...8...4...0
  32'b000000100010?????000000000001011:  //dcache.isw
  begin
    pipe4_decd_atomic         = 1'b0;
    pipe4_decd_sync_fence     = 1'b0;
    pipe4_decd_inst_flush     = 1'b0;
    pipe4_decd_inst_share     = 1'b0;
    pipe4_decd_icc            = 1'b1;
    pipe4_decd_st             = 1'b0;
    pipe4_decd_mmu_req        = 1'b0;
    pipe4_decd_inst_type[1:0] = 2'b10;
    pipe4_decd_inst_size[1:0] = 2'b10;
    pipe4_decd_inst_mode[1:0] = 2'b10;
    pipe4_decd_fence_mode[3:0]= 4'b0000;
    pipe4_decd_inst_fls       = 1'b0;
    pipe4_decd_inst_vls       = 1'b0;
    pipe4_decd_offset[11:0]   = 12'b0;
    pipe4_decd_shift[3:0]     = 4'b1;
    pipe4_decd_inst_str       = 1'b0;
    pipe4_decd_off_0_extend   = 1'b0;
    pipe4_decd_lsfifo         = 1'b0;
  end
  //  ..28..24..20..16..12...8...4...0
  32'b000000100001?????000000000001011:  //dcache.csw
  begin
    pipe4_decd_atomic         = 1'b0;
    pipe4_decd_sync_fence     = 1'b0;
    pipe4_decd_inst_flush     = 1'b0;
    pipe4_decd_inst_share     = 1'b0;
    pipe4_decd_icc            = 1'b1;
    pipe4_decd_st             = 1'b0;
    pipe4_decd_mmu_req        = 1'b0;
    pipe4_decd_inst_type[1:0] = 2'b10;
    pipe4_decd_inst_size[1:0] = 2'b01;
    pipe4_decd_inst_mode[1:0] = 2'b10;
    pipe4_decd_fence_mode[3:0]= 4'b0000;
    pipe4_decd_inst_fls       = 1'b0;
    pipe4_decd_inst_vls       = 1'b0;
    pipe4_decd_offset[11:0]   = 12'b0;
    pipe4_decd_shift[3:0]     = 4'b1;
    pipe4_decd_inst_str       = 1'b0;
    pipe4_decd_off_0_extend   = 1'b0;
    pipe4_decd_lsfifo         = 1'b0;
  end
  //  ..28..24..20..16..12...8...4...0
  32'b000000100011?????000000000001011:  //dcache.cisw
  begin
    pipe4_decd_atomic         = 1'b0;
    pipe4_decd_sync_fence     = 1'b0;
    pipe4_decd_inst_flush     = 1'b0;
    pipe4_decd_inst_share     = 1'b0;
    pipe4_decd_icc            = 1'b1;
    pipe4_decd_st             = 1'b0;
    pipe4_decd_mmu_req        = 1'b0;
    pipe4_decd_inst_type[1:0] = 2'b10;
    pipe4_decd_inst_size[1:0] = 2'b11;
    pipe4_decd_inst_mode[1:0] = 2'b10;
    pipe4_decd_fence_mode[3:0]= 4'b0000;
    pipe4_decd_inst_fls       = 1'b0;
    pipe4_decd_inst_vls       = 1'b0;
    pipe4_decd_offset[11:0]   = 12'b0;
    pipe4_decd_shift[3:0]     = 4'b1;
    pipe4_decd_inst_str       = 1'b0;
    pipe4_decd_off_0_extend   = 1'b0;
    pipe4_decd_lsfifo         = 1'b0;
  end
  //  ..28..24..20..16..12...8...4...0
  32'b000000100110?????000000000001011:  //dcache.iva
  begin
    pipe4_decd_atomic         = 1'b0;
    pipe4_decd_sync_fence     = 1'b0;
    pipe4_decd_inst_flush     = 1'b0;
    pipe4_decd_inst_share     = 1'b0;
    pipe4_decd_icc            = 1'b1;
    pipe4_decd_st             = 1'b0;
    pipe4_decd_mmu_req        = 1'b1;
    pipe4_decd_inst_type[1:0] = 2'b10;
    pipe4_decd_inst_size[1:0] = 2'b10;
    pipe4_decd_inst_mode[1:0] = 2'b01;
    pipe4_decd_fence_mode[3:0]= 4'b0000;
    pipe4_decd_inst_fls       = 1'b0;
    pipe4_decd_inst_vls       = 1'b0;
    pipe4_decd_offset[11:0]   = 12'b0;
    pipe4_decd_shift[3:0]     = 4'b1;
    pipe4_decd_inst_str       = 1'b0;
    pipe4_decd_off_0_extend   = 1'b0;
    pipe4_decd_lsfifo         = 1'b0;
  end
  //  ..28..24..20..16..12...8...4...0
  32'b000000100101?????000000000001011:  //dcache.cva
  begin
    pipe4_decd_atomic         = 1'b0;
    pipe4_decd_sync_fence     = 1'b0;
    pipe4_decd_inst_flush     = 1'b0;
    pipe4_decd_inst_share     = 1'b0;
    pipe4_decd_icc            = 1'b1;
    pipe4_decd_st             = 1'b0;
    pipe4_decd_mmu_req        = 1'b1;
    pipe4_decd_inst_type[1:0] = 2'b10;
    pipe4_decd_inst_size[1:0] = 2'b01;
    pipe4_decd_inst_mode[1:0] = 2'b01;
    pipe4_decd_fence_mode[3:0]= 4'b0000;
    pipe4_decd_inst_fls       = 1'b0;
    pipe4_decd_inst_vls       = 1'b0;
    pipe4_decd_offset[11:0]   = 12'b0;
    pipe4_decd_shift[3:0]     = 4'b1;
    pipe4_decd_inst_str       = 1'b0;
    pipe4_decd_off_0_extend   = 1'b0;
    pipe4_decd_lsfifo         = 1'b0;
  end
  //  ..28..24..20..16..12...8...4...0
  32'b000000100111?????000000000001011:  //dcache.civa
  begin
    pipe4_decd_atomic         = 1'b0;
    pipe4_decd_sync_fence     = 1'b0;
    pipe4_decd_inst_flush     = 1'b0;
    pipe4_decd_inst_share     = 1'b0;
    pipe4_decd_icc            = 1'b1;
    pipe4_decd_st             = 1'b0;
    pipe4_decd_mmu_req        = 1'b1;
    pipe4_decd_inst_type[1:0] = 2'b10;
    pipe4_decd_inst_size[1:0] = 2'b11;
    pipe4_decd_inst_mode[1:0] = 2'b01;
    pipe4_decd_fence_mode[3:0]= 4'b0000;
    pipe4_decd_inst_fls       = 1'b0;
    pipe4_decd_inst_vls       = 1'b0;
    pipe4_decd_offset[11:0]   = 12'b0;
    pipe4_decd_shift[3:0]     = 4'b1;
    pipe4_decd_inst_str       = 1'b0;
    pipe4_decd_off_0_extend   = 1'b0;
    pipe4_decd_lsfifo         = 1'b0;
  end
  //  ..28..24..20..16..12...8...4...0
  32'b000000100100?????000000000001011:  //dcache.cval1
  begin
    pipe4_decd_atomic         = 1'b0;
    pipe4_decd_sync_fence     = 1'b0;
    pipe4_decd_inst_flush     = 1'b0;
    pipe4_decd_inst_share     = 1'b0;
    pipe4_decd_icc            = 1'b1;
    pipe4_decd_st             = 1'b0;
    pipe4_decd_mmu_req        = 1'b1;
    pipe4_decd_inst_type[1:0] = 2'b10;
    pipe4_decd_inst_size[1:0] = 2'b00;
    pipe4_decd_inst_mode[1:0] = 2'b01;
    pipe4_decd_fence_mode[3:0]= 4'b0000;
    pipe4_decd_inst_fls       = 1'b0;
    pipe4_decd_inst_vls       = 1'b0;
    pipe4_decd_offset[11:0]   = 12'b0;
    pipe4_decd_shift[3:0]     = 4'b1;
    pipe4_decd_inst_str       = 1'b0;
    pipe4_decd_off_0_extend   = 1'b0;
    pipe4_decd_lsfifo         = 1'b0;
  end
  //  ..28..24..20..16..12...8...4...0
  32'b000000101010?????000000000001011:  //dcache.ipa
  begin
    pipe4_decd_atomic         = 1'b0;
    pipe4_decd_sync_fence     = 1'b0;
    pipe4_decd_inst_flush     = 1'b0;
    pipe4_decd_inst_share     = 1'b1;
    pipe4_decd_icc            = 1'b1;
    pipe4_decd_st             = 1'b0;
    pipe4_decd_mmu_req        = 1'b0;
    pipe4_decd_inst_type[1:0] = 2'b10;
    pipe4_decd_inst_size[1:0] = 2'b10;
    pipe4_decd_inst_mode[1:0] = 2'b11;
    pipe4_decd_fence_mode[3:0]= 4'b0000;
    pipe4_decd_inst_fls       = 1'b0;
    pipe4_decd_inst_vls       = 1'b0;
    pipe4_decd_offset[11:0]   = 12'b0;
    pipe4_decd_shift[3:0]     = 4'b1;
    pipe4_decd_inst_str       = 1'b0;
    pipe4_decd_off_0_extend   = 1'b0;
    pipe4_decd_lsfifo         = 1'b0;
  end
  //  ..28..24..20..16..12...8...4...0
  32'b000000101001?????000000000001011:  //dcache.cpa
  begin
    pipe4_decd_atomic         = 1'b0;
    pipe4_decd_sync_fence     = 1'b0;
    pipe4_decd_inst_flush     = 1'b0;
    pipe4_decd_inst_share     = 1'b1;
    pipe4_decd_icc            = 1'b1;
    pipe4_decd_st             = 1'b0;
    pipe4_decd_mmu_req        = 1'b0;
    pipe4_decd_inst_type[1:0] = 2'b10;
    pipe4_decd_inst_size[1:0] = 2'b01;
    pipe4_decd_inst_mode[1:0] = 2'b11;
    pipe4_decd_fence_mode[3:0]= 4'b0000;
    pipe4_decd_inst_fls       = 1'b0;
    pipe4_decd_inst_vls       = 1'b0;
    pipe4_decd_offset[11:0]   = 12'b0;
    pipe4_decd_shift[3:0]     = 4'b1;
    pipe4_decd_inst_str       = 1'b0;
    pipe4_decd_off_0_extend   = 1'b0;
    pipe4_decd_lsfifo         = 1'b0;
  end
  //  ..28..24..20..16..12...8...4...0
  32'b000000101000?????000000000001011:  //dcache.cpal1
  begin
    pipe4_decd_atomic         = 1'b0;
    pipe4_decd_sync_fence     = 1'b0;
    pipe4_decd_inst_flush     = 1'b0;
    pipe4_decd_inst_share     = 1'b0;
    pipe4_decd_icc            = 1'b1;
    pipe4_decd_st             = 1'b0;
    pipe4_decd_mmu_req        = 1'b0;
    pipe4_decd_inst_type[1:0] = 2'b10;
    pipe4_decd_inst_size[1:0] = 2'b00;
    pipe4_decd_inst_mode[1:0] = 2'b11;
    pipe4_decd_fence_mode[3:0]= 4'b0000;
    pipe4_decd_inst_fls       = 1'b0;
    pipe4_decd_inst_vls       = 1'b0;
    pipe4_decd_offset[11:0]   = 12'b0;
    pipe4_decd_shift[3:0]     = 4'b1;
    pipe4_decd_inst_str       = 1'b0;
    pipe4_decd_off_0_extend   = 1'b0;
    pipe4_decd_lsfifo         = 1'b0;
  end
  //  ..28..24..20..16..12...8...4...0
  32'b000000101011?????000000000001011:  //dcache.cipa
  begin
    pipe4_decd_atomic         = 1'b0;
    pipe4_decd_sync_fence     = 1'b0;
    pipe4_decd_inst_flush     = 1'b0;
    pipe4_decd_inst_share     = 1'b1;
    pipe4_decd_icc            = 1'b1;
    pipe4_decd_st             = 1'b0;
    pipe4_decd_mmu_req        = 1'b0;
    pipe4_decd_inst_type[1:0] = 2'b10;
    pipe4_decd_inst_size[1:0] = 2'b11;
    pipe4_decd_inst_mode[1:0] = 2'b11;
    pipe4_decd_fence_mode[3:0]= 4'b0000;
    pipe4_decd_inst_fls       = 1'b0;
    pipe4_decd_inst_vls       = 1'b0;
    pipe4_decd_offset[11:0]   = 12'b0;
    pipe4_decd_shift[3:0]     = 4'b1;
    pipe4_decd_inst_str       = 1'b0;
    pipe4_decd_off_0_extend   = 1'b0;
    pipe4_decd_lsfifo         = 1'b0;
  end
  //  ..28..24..20..16..12...8...4...0
  32'b00000001000000000000000000001011:  //icache.iall
  begin
    pipe4_decd_atomic         = 1'b0;
    pipe4_decd_sync_fence     = 1'b0;
    pipe4_decd_inst_flush     = 1'b0;
    pipe4_decd_inst_share     = 1'b0;
    pipe4_decd_icc            = 1'b1;
    pipe4_decd_st             = 1'b0;
    pipe4_decd_mmu_req        = 1'b0;
    pipe4_decd_inst_type[1:0] = 2'b01;
    pipe4_decd_inst_size[1:0] = 2'b00;
    pipe4_decd_inst_mode[1:0] = 2'b00;
    pipe4_decd_fence_mode[3:0]= 4'b0000;
    pipe4_decd_inst_fls       = 1'b0;
    pipe4_decd_inst_vls       = 1'b0;
    pipe4_decd_offset[11:0]   = 12'b0;
    pipe4_decd_shift[3:0]     = 4'b1;
    pipe4_decd_inst_str       = 1'b0;
    pipe4_decd_off_0_extend   = 1'b0;
    pipe4_decd_lsfifo         = 1'b0;
  end
  //  ..28..24..20..16..12...8...4...0
  32'b00000001000100000000000000001011:  //icache.ialls
  begin
    pipe4_decd_atomic         = 1'b0;
    pipe4_decd_sync_fence     = 1'b0;
    pipe4_decd_inst_flush     = 1'b0;
    pipe4_decd_inst_share     = 1'b1;
    pipe4_decd_icc            = 1'b1;
    pipe4_decd_st             = 1'b0;
    pipe4_decd_mmu_req        = 1'b0;
    pipe4_decd_inst_type[1:0] = 2'b01;
    pipe4_decd_inst_size[1:0] = 2'b00;
    pipe4_decd_inst_mode[1:0] = 2'b00;
    pipe4_decd_fence_mode[3:0]= 4'b0000;
    pipe4_decd_inst_fls       = 1'b0;
    pipe4_decd_inst_vls       = 1'b0;
    pipe4_decd_offset[11:0]   = 12'b0;
    pipe4_decd_shift[3:0]     = 4'b1;
    pipe4_decd_inst_str       = 1'b0;
    pipe4_decd_off_0_extend   = 1'b0;
    pipe4_decd_lsfifo         = 1'b0;
  end
  //  ..28..24..20..16..12...8...4...0
  32'b000000110000?????000000000001011:  //icache.iva
  begin
    pipe4_decd_atomic         = 1'b0;
    pipe4_decd_sync_fence     = 1'b0;
    pipe4_decd_inst_flush     = 1'b0;
    pipe4_decd_inst_share     = 1'b0;
    pipe4_decd_icc            = 1'b1;
    pipe4_decd_st             = 1'b0;
    pipe4_decd_mmu_req        = 1'b1;
    pipe4_decd_inst_type[1:0] = 2'b01;
    pipe4_decd_inst_size[1:0] = 2'b00;
    pipe4_decd_inst_mode[1:0] = 2'b01;
    pipe4_decd_fence_mode[3:0]= 4'b0000;
    pipe4_decd_inst_fls       = 1'b0;
    pipe4_decd_inst_vls       = 1'b0;
    pipe4_decd_offset[11:0]   = 12'b0;
    pipe4_decd_shift[3:0]     = 4'b1;
    pipe4_decd_inst_str       = 1'b0;
    pipe4_decd_off_0_extend   = 1'b0;
    pipe4_decd_lsfifo         = 1'b0;
  end
  //  ..28..24..20..16..12...8...4...0
  32'b000000111000?????000000000001011:  //icache.ipa
  begin
    pipe4_decd_atomic         = 1'b0;
    pipe4_decd_sync_fence     = 1'b0;
    pipe4_decd_inst_flush     = 1'b0;
    pipe4_decd_inst_share     = 1'b1;
    pipe4_decd_icc            = 1'b1;
    pipe4_decd_st             = 1'b0;
    pipe4_decd_mmu_req        = 1'b0;
    pipe4_decd_inst_type[1:0] = 2'b01;
    pipe4_decd_inst_size[1:0] = 2'b00;
    pipe4_decd_inst_mode[1:0] = 2'b11;
    pipe4_decd_fence_mode[3:0]= 4'b0000;
    pipe4_decd_inst_fls       = 1'b0;
    pipe4_decd_inst_vls       = 1'b0;
    pipe4_decd_offset[11:0]   = 12'b0;
    pipe4_decd_shift[3:0]     = 4'b1;
    pipe4_decd_inst_str       = 1'b0;
    pipe4_decd_off_0_extend   = 1'b0;
    pipe4_decd_lsfifo         = 1'b0;
  end
  //  ..28..24..20..16..12...8...4...0
  32'b00000001011000000000000000001011:  //l2cache.iall
  begin
    pipe4_decd_atomic         = 1'b0;
    pipe4_decd_sync_fence     = 1'b0;
    pipe4_decd_inst_flush     = 1'b0;
    pipe4_decd_inst_share     = 1'b0;
    pipe4_decd_icc            = 1'b1;
    pipe4_decd_st             = 1'b0;
    pipe4_decd_mmu_req        = 1'b0;
    pipe4_decd_inst_type[1:0] = 2'b11;
    pipe4_decd_inst_size[1:0] = 2'b10;
    pipe4_decd_inst_mode[1:0] = 2'b00;
    pipe4_decd_fence_mode[3:0]= 4'b0000;
    pipe4_decd_inst_fls       = 1'b0;
    pipe4_decd_inst_vls       = 1'b0;
    pipe4_decd_offset[11:0]   = 12'b0;
    pipe4_decd_shift[3:0]     = 4'b1;
    pipe4_decd_inst_str       = 1'b0;
    pipe4_decd_off_0_extend   = 1'b0;
    pipe4_decd_lsfifo         = 1'b0;
  end
  //  ..28..24..20..16..12...8...4...0
  32'b00000001010100000000000000001011:  //l2cache.call
  begin
    pipe4_decd_atomic         = 1'b0;
    pipe4_decd_sync_fence     = 1'b0;
    pipe4_decd_inst_flush     = 1'b0;
    pipe4_decd_inst_share     = 1'b0;
    pipe4_decd_icc            = 1'b1;
    pipe4_decd_st             = 1'b0;
    pipe4_decd_mmu_req        = 1'b0;
    pipe4_decd_inst_type[1:0] = 2'b11;
    pipe4_decd_inst_size[1:0] = 2'b01;
    pipe4_decd_inst_mode[1:0] = 2'b00;
    pipe4_decd_fence_mode[3:0]= 4'b0000;
    pipe4_decd_inst_fls       = 1'b0;
    pipe4_decd_inst_vls       = 1'b0;
    pipe4_decd_offset[11:0]   = 12'b0;
    pipe4_decd_shift[3:0]     = 4'b1;
    pipe4_decd_inst_str       = 1'b0;
    pipe4_decd_off_0_extend   = 1'b0;
    pipe4_decd_lsfifo         = 1'b0;
  end
  //  ..28..24..20..16..12...8...4...0
  32'b00000001011100000000000000001011:  //l2cache.ciall
  begin
    pipe4_decd_atomic         = 1'b0;
    pipe4_decd_sync_fence     = 1'b0;
    pipe4_decd_inst_flush     = 1'b0;
    pipe4_decd_inst_share     = 1'b0;
    pipe4_decd_icc            = 1'b1;
    pipe4_decd_st             = 1'b0;
    pipe4_decd_mmu_req        = 1'b0;
    pipe4_decd_inst_type[1:0] = 2'b11;
    pipe4_decd_inst_size[1:0] = 2'b11;
    pipe4_decd_inst_mode[1:0] = 2'b00;
    pipe4_decd_fence_mode[3:0]= 4'b0000;
    pipe4_decd_inst_fls       = 1'b0;
    pipe4_decd_inst_vls       = 1'b0;
    pipe4_decd_offset[11:0]   = 12'b0;
    pipe4_decd_shift[3:0]     = 4'b1;
    pipe4_decd_inst_str       = 1'b0;
    pipe4_decd_off_0_extend   = 1'b0;
    pipe4_decd_lsfifo         = 1'b0;
  end
//------------------------sync------------------------------
  //  ..28..24..20..16..12...8...4...0
  32'b00000001100000000000000000001011:  //sync
  begin
    pipe4_decd_atomic         = 1'b0;
    pipe4_decd_sync_fence     = 1'b1;
    pipe4_decd_inst_flush     = 1'b0;
    pipe4_decd_inst_share     = 1'b0;
    pipe4_decd_icc            = 1'b0;
    pipe4_decd_st             = 1'b0;
    pipe4_decd_mmu_req        = 1'b0;
    pipe4_decd_inst_type[1:0] = 2'b00;
    pipe4_decd_inst_size[1:0] = 2'b00;
    pipe4_decd_inst_mode[1:0] = 2'b00;
    pipe4_decd_fence_mode[3:0]= 4'b1111;
    pipe4_decd_inst_fls       = 1'b0;
    pipe4_decd_inst_vls       = 1'b0;
    pipe4_decd_offset[11:0]   = 12'b0;
    pipe4_decd_shift[3:0]     = 4'b1;
    pipe4_decd_inst_str       = 1'b0;
    pipe4_decd_off_0_extend   = 1'b0;
    pipe4_decd_lsfifo         = 1'b0;
  end
  //  ..28..24..20..16..12...8...4...0
  32'b00000001100100000000000000001011:  //sync.s
  begin
    pipe4_decd_atomic         = 1'b0;
    pipe4_decd_sync_fence     = 1'b1;
    pipe4_decd_inst_flush     = 1'b0;
    pipe4_decd_inst_share     = 1'b1;
    pipe4_decd_icc            = 1'b0;
    pipe4_decd_st             = 1'b0;
    pipe4_decd_mmu_req        = 1'b0;
    pipe4_decd_inst_type[1:0] = 2'b00;
    pipe4_decd_inst_size[1:0] = 2'b00;
    pipe4_decd_inst_mode[1:0] = 2'b00;
    pipe4_decd_fence_mode[3:0]= 4'b1111;
    pipe4_decd_inst_fls       = 1'b0;
    pipe4_decd_inst_vls       = 1'b0;
    pipe4_decd_offset[11:0]   = 12'b0;
    pipe4_decd_shift[3:0]     = 4'b1;
    pipe4_decd_inst_str       = 1'b0;
    pipe4_decd_off_0_extend   = 1'b0;
    pipe4_decd_lsfifo         = 1'b0;
  end
  //  ..28..24..20..16..12...8...4...0
  32'b00000001101000000000000000001011:  //sync.i
  begin
    pipe4_decd_atomic         = 1'b0;
    pipe4_decd_sync_fence     = 1'b1;
    pipe4_decd_inst_flush     = 1'b1;
    pipe4_decd_inst_share     = 1'b0;
    pipe4_decd_icc            = 1'b0;
    pipe4_decd_st             = 1'b0;
    pipe4_decd_mmu_req        = 1'b0;
    pipe4_decd_inst_type[1:0] = 2'b00;
    pipe4_decd_inst_size[1:0] = 2'b00;
    pipe4_decd_inst_mode[1:0] = 2'b00;
    pipe4_decd_fence_mode[3:0]= 4'b1111;
    pipe4_decd_inst_fls       = 1'b0;
    pipe4_decd_inst_vls       = 1'b0;
    pipe4_decd_offset[11:0]   = 12'b0;
    pipe4_decd_shift[3:0]     = 4'b1;
    pipe4_decd_inst_str       = 1'b0;
    pipe4_decd_off_0_extend   = 1'b0;
    pipe4_decd_lsfifo         = 1'b0;
  end
  //  ..28..24..20..16..12...8...4...0
  32'b00000001101100000000000000001011:  //sync.is
  begin
    pipe4_decd_atomic         = 1'b0;
    pipe4_decd_sync_fence     = 1'b1;
    pipe4_decd_inst_flush     = 1'b1;
    pipe4_decd_inst_share     = 1'b1;
    pipe4_decd_icc            = 1'b0;
    pipe4_decd_st             = 1'b0;
    pipe4_decd_mmu_req        = 1'b0;
    pipe4_decd_inst_type[1:0] = 2'b00;
    pipe4_decd_inst_size[1:0] = 2'b00;
    pipe4_decd_inst_mode[1:0] = 2'b00;
    pipe4_decd_fence_mode[3:0]= 4'b1111;
    pipe4_decd_inst_fls       = 1'b0;
    pipe4_decd_inst_vls       = 1'b0;
    pipe4_decd_offset[11:0]   = 12'b0;
    pipe4_decd_shift[3:0]     = 4'b1;
    pipe4_decd_inst_str       = 1'b0;
    pipe4_decd_off_0_extend   = 1'b0;
    pipe4_decd_lsfifo         = 1'b0;
  end
  default:
  begin
    pipe4_decd_atomic         = 1'bx;
    pipe4_decd_sync_fence     = 1'bx;
    pipe4_decd_inst_flush     = 1'bx;
    pipe4_decd_inst_share     = 1'bx;
    pipe4_decd_icc            = 1'bx;
    pipe4_decd_st             = 1'bx;
    pipe4_decd_mmu_req        = 1'bx;
    pipe4_decd_inst_type[1:0] = {2{1'bx}};
    pipe4_decd_inst_size[1:0] = {2{1'bx}};
    pipe4_decd_inst_mode[1:0] = {2{1'bx}};
    pipe4_decd_fence_mode[3:0]= {4{1'bx}};
    pipe4_decd_inst_fls       = 1'bx;
    pipe4_decd_inst_vls       = 1'bx;
    pipe4_decd_offset[11:0]   = {12{1'bx}};
    pipe4_decd_shift[3:0]     = {4{1'bx}};
    pipe4_decd_inst_str       = 1'bx;
    pipe4_decd_off_0_extend   = 1'bx;
    pipe4_decd_lsfifo         = 1'bx;
  end
endcase
// &CombEnd; @1756
end

// &Force("output","pipe4_decd_offset"); @1758
assign pipe4_decd_offset_plus[12:0] = {pipe4_decd_offset[11],pipe4_decd_offset[11:0]}
                                      + 13'h10;

//for vector decode
// &Force("output","pipe4_decd_inst_vls"); @1764
// &Force("output","pipe4_decd_atomic"); @1765
// &Force("output","pipe4_decd_unit_stride"); @1766
// &Force("output","pipe4_decd_vmask_vld"); @1767
// &CombBeg; @1783
// &CombEnd; @1793
// &CombBeg; @1799
// &CombEnd; @1807
// &CombBeg; @1816
// &CombEnd; @1824
// &CombBeg; @1830
// &CombEnd; @1844
// &CombBeg; @1846
// &CombEnd; @1866
// &Force("nonport","pipe4_decd_inst_vls"); @1872
// &ModuleEnd; @1874
endmodule


