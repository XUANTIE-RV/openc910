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
module ct_idu_id_decd(
  cp0_idu_cskyee,
  cp0_idu_frm,
  cp0_idu_fs,
  cp0_idu_vill,
  cp0_idu_vs,
  cp0_idu_vstart,
  cp0_idu_zero_delay_move_disable,
  cp0_yy_hyper,
  x_dst_reg,
  x_dst_vld,
  x_dst_x0,
  x_dste_vld,
  x_dstf_reg,
  x_dstf_vld,
  x_dstv_reg,
  x_dstv_vld,
  x_fence_type,
  x_fmla,
  x_fmov,
  x_illegal,
  x_inst,
  x_inst_type,
  x_length,
  x_mla,
  x_mov,
  x_split_long_type,
  x_split_short_type,
  x_src0_reg,
  x_src0_vld,
  x_src1_reg,
  x_src1_vld,
  x_src2_vld,
  x_srcf0_reg,
  x_srcf0_vld,
  x_srcf1_reg,
  x_srcf1_vld,
  x_srcf2_reg,
  x_srcf2_vld,
  x_srcv0_reg,
  x_srcv0_vld,
  x_srcv1_reg,
  x_srcv1_vld,
  x_srcv2_vld,
  x_srcvm_vld,
  x_vl,
  x_vlmul,
  x_vmb,
  x_vmla,
  x_vsew
);

// &Ports; @28
input           cp0_idu_cskyee;                 
input   [2 :0]  cp0_idu_frm;                    
input   [1 :0]  cp0_idu_fs;                     
input           cp0_idu_vill;                   
input   [1 :0]  cp0_idu_vs;                     
input   [6 :0]  cp0_idu_vstart;                 
input           cp0_idu_zero_delay_move_disable; 
input           cp0_yy_hyper;                   
input   [31:0]  x_inst;                         
input   [7 :0]  x_vl;                           
input   [1 :0]  x_vlmul;                        
input   [1 :0]  x_vsew;                         
output  [4 :0]  x_dst_reg;                      
output          x_dst_vld;                      
output          x_dst_x0;                       
output          x_dste_vld;                     
output  [4 :0]  x_dstf_reg;                     
output          x_dstf_vld;                     
output  [4 :0]  x_dstv_reg;                     
output          x_dstv_vld;                     
output  [2 :0]  x_fence_type;                   
output          x_fmla;                         
output          x_fmov;                         
output          x_illegal;                      
output  [9 :0]  x_inst_type;                    
output          x_length;                       
output          x_mla;                          
output          x_mov;                          
output  [9 :0]  x_split_long_type;              
output  [6 :0]  x_split_short_type;             
output  [4 :0]  x_src0_reg;                     
output          x_src0_vld;                     
output  [4 :0]  x_src1_reg;                     
output          x_src1_vld;                     
output          x_src2_vld;                     
output  [4 :0]  x_srcf0_reg;                    
output          x_srcf0_vld;                    
output  [4 :0]  x_srcf1_reg;                    
output          x_srcf1_vld;                    
output  [4 :0]  x_srcf2_reg;                    
output          x_srcf2_vld;                    
output  [4 :0]  x_srcv0_reg;                    
output          x_srcv0_vld;                    
output  [4 :0]  x_srcv1_reg;                    
output          x_srcv1_vld;                    
output          x_srcv2_vld;                    
output          x_srcvm_vld;                    
output          x_vmb;                          
output          x_vmla;                         

// &Regs; @29
reg             decd_16_dst_vld;                
reg             decd_16_dstf_vld;               
reg             decd_16_illegal;                
reg     [9 :0]  decd_16_inst_type;              
reg             decd_16_src0_vld;               
reg             decd_16_src1_vld;               
reg             decd_16_srcf1_vld;              
reg             decd_16_srcf2_vld;              
reg             decd_32_dst_vld;                
reg             decd_32_dste_vld;               
reg             decd_32_dstf_vld;               
reg             decd_32_dstv_vld;               
reg             decd_32_illegal;                
reg     [9 :0]  decd_32_inst_type;              
reg             decd_32_src0_vld;               
reg             decd_32_src1_vld;               
reg             decd_32_srcf0_vld;              
reg             decd_32_srcf1_vld;              
reg             decd_32_srcf2_vld;              
reg             decd_32_srcv0_vld;              
reg             decd_32_srcv2_vld;              
reg             decd_cache_illegal;             
reg     [9 :0]  decd_cache_inst_type;           
reg             decd_cache_src0_vld;            
reg             decd_code_illegal;              
reg             decd_fp0_dst_vld;               
reg             decd_fp0_dste_vld;              
reg             decd_fp0_dstf_vld;              
reg             decd_fp0_illegal;               
reg     [9 :0]  decd_fp0_inst_type;             
reg             decd_fp0_src0_vld;              
reg             decd_fp0_srcf0_vld;             
reg             decd_fp0_srcf1_vld;             
reg             decd_fp1_dst_vld;               
reg             decd_fp1_dste_vld;              
reg             decd_fp1_dstf_vld;              
reg             decd_fp1_illegal;               
reg     [9 :0]  decd_fp1_inst_type;             
reg             decd_fp1_src0_vld;              
reg             decd_fp1_srcf0_vld;             
reg             decd_fp1_srcf1_vld;             
reg             decd_fp1_srcf2_vld;             
reg             decd_fp_dst_vld;                
reg             decd_fp_dste_vld;               
reg             decd_fp_dstf_vld;               
reg             decd_fp_inst_illegal;           
reg     [9 :0]  decd_fp_inst_type;              
reg             decd_fp_src0_vld;               
reg             decd_fp_src1_vld;               
reg             decd_fp_srcf0_vld;              
reg             decd_fp_srcf1_vld;              
reg             decd_fp_srcf2_vld;              
reg             decd_perf_dst_vld;              
reg             decd_perf_dstf_vld;             
reg             decd_perf_illegal;              
reg     [9 :0]  decd_perf_inst_type;            
reg             decd_perf_src0_vld;             
reg             decd_perf_src1_vld;             
reg             decd_perf_src2_vld;             
reg             decd_perf_srcf1_vld;            
reg             decd_perf_srcf2_vld;            
reg             decd_v_dst_vld;                 
reg             decd_v_dste_vld;                
reg             decd_v_dstf_vld;                
reg             decd_v_dstv_vld;                
reg     [9 :0]  decd_v_inst_type;               
reg             decd_v_src0_vld;                
reg             decd_v_src1_vld;                
reg             decd_v_src2_vld;                
reg             decd_v_srcf0_vld;               
reg             decd_v_srcf1_vld;               
reg             decd_v_srcf2_vld;               
reg             decd_v_srcv0_vld;               
reg             decd_v_srcv1_vld;               
reg             decd_v_srcv2_vld;               
reg             decd_vec_dst_vld;               
reg             decd_vec_dste_vld;              
reg             decd_vec_dstf_vld;              
reg             decd_vec_dstv_vld;              
reg             decd_vec_illegal;               
reg     [9 :0]  decd_vec_inst_type;             
reg             decd_vec_src0_vld;              
reg             decd_vec_src1_vld;              
reg             decd_vec_src2_vld;              
reg             decd_vec_srcf0_vld;             
reg             decd_vec_srcf1_vld;             
reg             decd_vec_srcf2_vld;             
reg             decd_vec_srcv0_vld;             
reg             decd_vec_srcv1_vld;             
reg             decd_vec_srcv2_vld;             
reg             x_dst_vld;                      
reg             x_dste_vld;                     
reg             x_dstf_vld;                     
reg             x_dstv_vld;                     
reg     [9 :0]  x_inst_type;                    
reg             x_src0_vld;                     
reg             x_src1_vld;                     
reg             x_src2_vld;                     
reg             x_srcf0_vld;                    
reg             x_srcf1_vld;                    
reg     [4 :0]  x_srcf2_reg;                    
reg             x_srcf2_vld;                    
reg             x_srcv0_vld;                    
reg             x_srcv1_vld;                    
reg             x_srcv2_vld;                    

// &Wires; @30
wire            cp0_idu_cskyee;                 
wire    [2 :0]  cp0_idu_frm;                    
wire    [1 :0]  cp0_idu_fs;                     
wire            cp0_idu_vill;                   
wire    [1 :0]  cp0_idu_vs;                     
wire    [6 :0]  cp0_idu_vstart;                 
wire            cp0_idu_zero_delay_move_disable; 
wire            cp0_yy_hyper;                   
wire            decd_c_illegal;                 
wire    [4 :0]  decd_dst_reg;                   
wire            decd_flsu_illegal;              
wire            decd_fp0_sel;                   
wire            decd_fp1_sel;                   
wire            decd_fp_illegal;                
wire            decd_fp_rounding_illegal;       
wire            decd_fp_sel;                    
wire            decd_fs_illegal;                
wire            decd_i_illegal;                 
wire            decd_inst_cls;                  
wire            decd_inst_cls_sp;               
wire            decd_inst_dst_reg_16bit_3_high; 
wire            decd_inst_dst_reg_16bit_3_low;  
wire            decd_inst_dst_reg_16bit_5;      
wire            decd_inst_dst_reg_32bit;        
wire            decd_inst_dstf_reg_16bit_low;   
wire            decd_inst_dstf_reg_32bit;       
wire            decd_inst_fls;                  
wire            decd_inst_src0_reg_16bit_3;     
wire            decd_inst_src0_reg_16bit_5;     
wire            decd_inst_src0_reg_32bit;       
wire            decd_inst_src0_reg_cmv;         
wire            decd_inst_src0_reg_r2;          
wire            decd_inst_src1_reg_16bit_3;     
wire            decd_inst_src1_reg_16bit_5;     
wire            decd_inst_src1_reg_32bit;       
wire            decd_inst_srcf1_reg_16bit;      
wire            decd_inst_srcf1_reg_16bit_low;  
wire            decd_inst_srcf1_reg_32bit;      
wire            decd_inst_srcf1_reg_32bit_low;  
wire            decd_inst_vec;                  
wire            decd_inst_vls;                  
wire            decd_length;                    
wire            decd_lsu_illegal;               
wire            decd_ovlp_illegal;              
wire    [5 :0]  decd_sel;                       
wire            decd_size_illegal;              
wire    [4 :0]  decd_src0_reg;                  
wire    [4 :0]  decd_src1_reg;                  
wire            decd_start_illegal;             
wire            decd_v_illegal;                 
wire            decd_vec_nop;                   
wire            decd_vill_illegal;              
wire            decd_vlsu_illegal;              
wire            decd_vreg_illegal;              
wire            decd_vs_illegal;                
wire            fcvt_f_x_narrow_il;             
wire            fcvt_f_x_widden;                
wire            fp_dynamic_rounding_illegal;    
wire            fp_fs_illegal;                  
wire            fp_static_rounding_illegal;     
wire            vec_mfvr_inst;                  
wire            vlsu_ld_srcv2_vld;              
wire    [4 :0]  x_dst_reg;                      
wire            x_dst_x0;                       
wire    [4 :0]  x_dstf_reg;                     
wire    [4 :0]  x_dstv_reg;                     
wire            x_fence;                        
wire    [2 :0]  x_fence_type;                   
wire            x_fmla;                         
wire            x_fmov;                         
wire            x_illegal;                      
wire    [31:0]  x_inst;                         
wire            x_length;                       
wire            x_mla;                          
wire            x_mov;                          
wire    [8 :0]  x_ovlp_ill;                     
wire    [2 :0]  x_ovlp_illegal;                 
wire    [3 :0]  x_size_ill_case;                
wire            x_split;                        
wire    [9 :0]  x_split_long_type;              
wire    [2 :0]  x_split_potnt;                  
wire            x_split_short;                  
wire    [2 :0]  x_split_short_potnt;            
wire    [6 :0]  x_split_short_type;             
wire    [4 :0]  x_src0_reg;                     
wire    [4 :0]  x_src1_reg;                     
wire    [4 :0]  x_srcf0_reg;                    
wire    [4 :0]  x_srcf1_reg;                    
wire    [4 :0]  x_srcv0_reg;                    
wire            x_srcv0_srcv1_switch;           
wire    [4 :0]  x_srcv1_reg;                    
wire            x_srcv1_srcv2_switch;           
wire            x_srcvm_vld;                    
wire            x_vec_fp_ac_fcsr;               
wire            x_vec_inst;                     
wire            x_vec_inst_ac_fcsr;             
wire            x_vec_inst_adc;                 
wire            x_vec_inst_comp;                
wire            x_vec_inst_funary;              
wire            x_vec_inst_mask;                
wire            x_vec_inst_narr;                
wire            x_vec_inst_scalar;              
wire            x_vec_inst_slidedown;           
wire            x_vec_inst_slideup;             
wire            x_vec_inst_vcompress;           
wire            x_vec_inst_vid;                 
wire            x_vec_inst_viota;               
wire            x_vec_inst_vred;                
wire            x_vec_inst_vred_n;              
wire            x_vec_inst_vred_w;              
wire            x_vec_inst_vrgather;            
wire            x_vec_inst_wide;                
wire            x_vec_inst_wide_w;              
wire            x_vec_opcfg;                    
wire            x_vec_opfvf;                    
wire            x_vec_opfvv;                    
wire            x_vec_opivi;                    
wire            x_vec_opivv;                    
wire            x_vec_opivx;                    
wire            x_vec_opmvv;                    
wire            x_vec_opmvx;                    
wire            x_vec_vfunary0;                 
wire            x_vec_vfunary1;                 
wire            x_vec_vmunary0;                 
wire            x_vfunary0_vld;                 
wire            x_vfunary0_vld_narr;            
wire            x_vfunary0_vld_norm;            
wire            x_vfunary0_vld_wide;            
wire    [7 :0]  x_vl;                           
wire    [1 :0]  x_vlmul;                        
wire            x_vmb;                          
wire            x_vmla;                         
wire            x_vmunary0_vld;                 
wire            x_vreg_dst_norm;                
wire    [4 :0]  x_vreg_ill;                     
wire    [2 :0]  x_vreg_illegal;                 
wire            x_vreg_src0_norm;               
wire            x_vreg_src1_norm;               
wire    [1 :0]  x_vsew;                         



// &Force("bus","x_inst",31,0); @33
//==========================================================
//                   Decode Split Type
//==========================================================
// &Force ("nonport","x_split"); @37
// &Force ("nonport","x_split_short"); @38
// &Force ("nonport","x_fence"); @39
// &Force ("nonport","x_split_potnt"); @40
// &Force ("nonport","x_split_short_potnt"); @41

// &Instance("ct_idu_id_decd_special", "x_ct_idu_id_decd_special"); @43
ct_idu_id_decd_special  x_ct_idu_id_decd_special (
  .cp0_idu_cskyee      (cp0_idu_cskyee     ),
  .cp0_idu_frm         (cp0_idu_frm        ),
  .cp0_idu_fs          (cp0_idu_fs         ),
  .x_fence             (x_fence            ),
  .x_fence_type        (x_fence_type       ),
  .x_inst              (x_inst             ),
  .x_split             (x_split            ),
  .x_split_long_type   (x_split_long_type  ),
  .x_split_potnt       (x_split_potnt      ),
  .x_split_short       (x_split_short      ),
  .x_split_short_potnt (x_split_short_potnt),
  .x_split_short_type  (x_split_short_type )
);


//==========================================================
//               Decode Instruction Length
//==========================================================
assign decd_length  = (x_inst[1:0] == 2'b11);
assign x_length     = decd_length;

assign decd_fp_sel  = (x_inst[6:0] == 7'b1010011)
                   || ({x_inst[6:4],x_inst[1:0]} == 5'b10011);

//==========================================================
//                Decode move Instruction
//==========================================================
//if mov has same dest and source, disable 0 delay move
//because mov may release its dest preg before its consumer
//get this preg value
assign x_mov  =
  !cp0_idu_zero_delay_move_disable
  && (({x_inst[1:0],x_inst[15:12]} == 6'b10_1000) //c.mv
      && (x_inst[11:7] != 5'd0) //dest not equal to x0
      && (x_inst[11:7] != x_inst[6:2]) //dest not equal to src
   || ({x_inst[6:0],x_inst[14:12]}  == 10'b0010011_000) //mv
      && (x_inst[31:20] == 12'd0)
      && (x_inst[11:7] != 5'd0) //dest not equal to x0
      && (x_inst[11:7] != x_inst[19:15])); //dest not equal to src

assign x_fmov = !cp0_idu_zero_delay_move_disable
                && (x_inst[31:25] == 7'b0010001)  //pseudo fmv(fsgnj.d)
                && (x_inst[14:12] == 3'b000)
                && (x_inst[6:0]   == 7'b1010011)
                && (x_inst[24:20] == x_inst[19:15]) //src0 == src1
                && (x_inst[11:7]  != x_inst[19:15]); //dst not equal to src

//==========================================================
//                 Decode mla Instruction
//==========================================================
assign x_mla   = {x_inst[31:28],x_inst[14:12],x_inst[6:0]} == 14'b0010_001_0001011;

//==========================================================
//                 Decode fmla Instruction
//==========================================================
assign x_fmla  = ({x_inst[6:4],x_inst[1:0]} == 5'b100_11);

//==========================================================
//                 Decode vmla Instruction
//==========================================================
assign x_vmla  = x_vec_inst && x_vec_opmvv && 
                ((x_inst[31:26]==6'b101101) ||  //vmacc
                 (x_inst[31:26]==6'b101111)) 
              || x_vec_inst && x_vec_opfvv &&
                (x_inst[31:28] == 4'b1011); //vfmacc

//==========================================================
//                Decode vec mask Instruction
//==========================================================
assign x_srcvm_vld = x_vec_inst &&  !x_inst[25] && !x_vec_opcfg ||
                     x_vec_inst &&  (x_inst[31:28]==4'b0100) &&  //vadc/vmadc/vsbc/vmsbc
                     (x_vec_opivv || x_vec_opivi) ||
                    ((x_inst[6:0]== 7'b0000111) || (x_inst[6:0]== 7'b0100111))  //vld/vst
                     && !x_inst[25] && ( (x_inst[14:12]==3'b000) || x_inst[14] && |x_inst[13:12]);

//==========================================================
//                 Decode vmb Instruction
//==========================================================
assign x_vmb   = (x_inst[6:0]==7'b0000111)
                 && ((x_inst[14:12]==3'b000)
                     || (x_inst[14:12]==3'b101)
                     || (x_inst[14:12]==3'b110)
                     || (x_inst[14:12]==3'b111))
                 && vlsu_ld_srcv2_vld;

//==========================================================
//              Decode Source Register Index
//==========================================================
//----------------------------------------------------------
//                  Source 0 Register Index
//----------------------------------------------------------
//same like instruction type, the register index has been
//optimazied for timing by ignoring invalid instructions
//so add new instruction should carefully check these logic
assign decd_inst_src0_reg_32bit   = (x_inst[1:0] == 2'b11);
assign decd_inst_src0_reg_16bit_5 = (({x_inst[1:0],x_inst[15]} == 3'b01_0)
                                    || (x_inst[1:0] == 2'b10))
                                       && !decd_inst_src0_reg_r2
                                       && !decd_inst_src0_reg_cmv;
assign decd_inst_src0_reg_cmv     = ({x_inst[1:0],x_inst[15:12]} == 6'b10_1000)
                                    && (x_inst[6:2] != 5'd0); //c.mv
assign decd_inst_src0_reg_16bit_3 = (({x_inst[1:0],x_inst[15]} == 3'b01_1)
                                    || (x_inst[1:0] == 2'b00))
                                       && !decd_inst_src0_reg_r2;
assign decd_inst_src0_reg_r2      = ({x_inst[14:13],x_inst[1:0]} == 4'b00_00) //c.addi4spn
                                    || (x_inst[1:0] == 2'b10) //c. load and store
                                       && (x_inst[15:13] != 3'b000)
                                       && (x_inst[15:13] != 3'b100);
//index select
assign decd_src0_reg[4:0] =
           {5{decd_inst_src0_reg_32bit}}   & x_inst[19:15]
         | {5{decd_inst_src0_reg_16bit_5}} & x_inst[11:7]
         | {5{decd_inst_src0_reg_cmv}}     & x_inst[6:2]
         | {5{decd_inst_src0_reg_16bit_3}} & {2'd1, x_inst[9:7]}
         | {5{decd_inst_src0_reg_r2}}      & 5'd2
         | {5{decd_inst_vec}}              & x_inst[19:15];
//output
assign x_src0_reg[4:0] = decd_src0_reg[4:0];

//----------------------------------------------------------
//                  Source 1 Register Index
//----------------------------------------------------------
assign decd_inst_src1_reg_32bit     = (x_inst[1:0] == 2'b11);
assign decd_inst_src1_reg_16bit_5   = (x_inst[1:0] == 2'b10);
assign decd_inst_src1_reg_16bit_3   = (x_inst[1:0] == 2'b00)
                                   || (x_inst[1:0] == 2'b01);

//index select
assign decd_src1_reg[4:0] =
           {5{decd_inst_src1_reg_32bit}}   & x_inst[24:20]
         | {5{decd_inst_src1_reg_16bit_5}} & x_inst[6:2]
         | {5{decd_inst_src1_reg_16bit_3}} & {2'd1, x_inst[4:2]}
         | {5{decd_inst_vec}}              & x_inst[24:20];

//output
assign x_src1_reg[4:0] = decd_src1_reg[4:0];

//==========================================================
//            Decode Destination Register Index
//==========================================================
//same like instruction type, the register index has been
//optimazied for timing by ignoring invalid instructions
//so add new instruction should carefully check these logic

//----------------------------------------------------------
//          Decode destination register index
//----------------------------------------------------------
assign decd_inst_dst_reg_32bit        =  (x_inst[1:0] == 2'b11);
assign decd_inst_dst_reg_16bit_5      = ({x_inst[1:0],x_inst[15]} == 3'b01_0)
                                      || (x_inst[1:0] == 2'b10);
assign decd_inst_dst_reg_16bit_3_high = ({x_inst[1:0],x_inst[15]} == 3'b01_1);
assign decd_inst_dst_reg_16bit_3_low  =  (x_inst[1:0] == 2'b00);

//index select
assign decd_dst_reg[4:0] =
           {5{decd_inst_dst_reg_32bit}}        & x_inst[11:7]
         | {5{decd_inst_dst_reg_16bit_5}}      & x_inst[11:7]
         | {5{decd_inst_dst_reg_16bit_3_high}} & {2'd1, x_inst[9:7]}
         | {5{decd_inst_dst_reg_16bit_3_low}}  & {2'd1, x_inst[4:2]}
         | {5{decd_inst_vec}}                  & x_inst[11:7];
//output
assign x_dst_reg[4:0] = decd_dst_reg[4:0];
assign x_dst_x0       = (decd_dst_reg[4:0] == 5'd0);

//==========================================================
//            Decode Scalar FP Source Register Index
//==========================================================
//----------------------------------------------------------
//               Scalar FP Source 0 Register Index
//----------------------------------------------------------
//same like instruction type, the register index has been
//optimazied for timing by ignoring invalid instructio
//so add new instruction should carefully check these logic
assign x_srcf0_reg[4:0] = x_inst[19:15];

//----------------------------------------------------------
//               Scalar FP Source 1 Register Index
//----------------------------------------------------------
assign decd_inst_srcf1_reg_32bit     = (x_inst[1:0] == 2'b11)
                                       && (x_inst[6:0] != 7'b0001011)
                                       && !decd_inst_vec;
assign decd_inst_srcf1_reg_32bit_low = (x_inst[1:0] == 2'b11)
                                       && (x_inst[6:0] == 7'b0001011);
assign decd_inst_srcf1_reg_16bit     = (x_inst[1:0] == 2'b10);
assign decd_inst_srcf1_reg_16bit_low = (x_inst[1:0] == 2'b00);

assign x_srcf1_reg[4:0] =
           {5{decd_inst_srcf1_reg_32bit}}     & x_inst[24:20]
         | {5{decd_inst_srcf1_reg_32bit_low}} & x_inst[11:7]
         | {5{decd_inst_srcf1_reg_16bit}}     & x_inst[6:2]
         | {5{decd_inst_srcf1_reg_16bit_low}} & {2'd1, x_inst[4:2]}
         | {5{decd_inst_vec}}                 & x_inst[19:15];

//----------------------------------------------------------
//               Scalar FP Source 2 Register Index
//----------------------------------------------------------
//perf_inst 
assign decd_inst_vls    = x_inst[6:0]==7'b0001011;

//// no other srcf2_vld inst except st
// c.fsd || c.fsdsp
assign decd_inst_cls_sp    = (x_inst[1:0]==2'b10);
assign decd_inst_cls       = (x_inst[1:0]==2'b00);

assign decd_inst_fls       = ((x_inst[6:0]==7'b0100111) || (x_inst[6:0]==7'b0000111)) &&
                             (!x_inst[14] && |x_inst[13:12]);
// &CombBeg; @243
always @( x_inst[11:2]
       or decd_inst_fls
       or x_inst[31:27]
       or x_inst[24:20]
       or x_inst[4:2]
       or decd_inst_cls
       or decd_inst_vls
       or decd_inst_cls_sp)
begin
case({decd_inst_vls,decd_inst_fls,decd_inst_cls_sp,decd_inst_cls})
  4'b1000: x_srcf2_reg[4:0] = x_inst[11: 7];
  4'b0100: x_srcf2_reg[4:0] = x_inst[24:20];
  4'b0010: x_srcf2_reg[4:0] = x_inst[6:2];
  4'b0001: x_srcf2_reg[4:0] = {2'b1,x_inst[4:2]};
  default: x_srcf2_reg[4:0] = x_inst[31:27];
endcase

// &CombEnd; @252
end

//assign x_srcf2_reg[4:0] = decd_inst_vls ? x_inst[11: 7]: 
//                         (decd_inst_fls ? x_inst[24:20]:x_inst[31:27]);
//==========================================================
//            Decode Destination Register Index
//==========================================================
//same like instruction type, the register index has been
//optimazied for timing by ignoring invalid instructions
//so add new instruction should carefully check these logic
assign decd_inst_dstf_reg_32bit     = (x_inst[1:0] != 2'b00);
assign decd_inst_dstf_reg_16bit_low = (x_inst[1:0] == 2'b00);

assign x_dstf_reg[4:0] =
           {5{decd_inst_dstf_reg_32bit}}     & x_inst[11:7]
         | {5{decd_inst_dstf_reg_16bit_low}} & {2'd1, x_inst[4:2]}
         | {5{decd_inst_vec}}                & x_inst[11:7];

//==========================================================
//                 Illegal inst Decoder
//==========================================================
//32 bit decode instruction within inst[31:25],[14:12],[6:0]
//16 bit decode instruction within inst[15:10],[6:5],[1:0]
//decode illegal definition beyond main decoder scope here

//----------------------------------------------------------
//                Base Illegal Instruction
//----------------------------------------------------------
assign decd_i_illegal =
     ({x_inst[31:25],x_inst[14:12],x_inst[6:0]} == 17'b0000000_000_1110011)
     && ({x_inst[24:15],x_inst[11:7]} != 15'b0) //ecall
     && ({x_inst[24:15],x_inst[11:7]} != 15'h400) //ebreak
  || ({x_inst[31:25],x_inst[14:12],x_inst[6:0]} == 17'b0001000_000_1110011)
     && ({x_inst[24:15],x_inst[11:7]} != 15'h800) //sret
     && ({x_inst[24:15],x_inst[11:7]} != 15'h1400) //wfi
  || ({x_inst[31:25],x_inst[14:12],x_inst[6:0]} == 17'b0011000_000_1110011)
     && ({x_inst[24:15],x_inst[11:7]} != 15'h800) //mret
  || ({x_inst[31:25],x_inst[14:12],x_inst[6:0]} == 17'b0001001_000_1110011)
     && (x_inst[11:7] != 5'b0) //sfence.vma
  || ({x_inst[31:25],x_inst[14:12],x_inst[6:0]} == 17'b0010001_000_1110011)
     && ((x_inst[11:7] != 5'b0) //hfence.vvma
         || !cp0_yy_hyper)
  || ({x_inst[31:25],x_inst[14:12],x_inst[6:0]} == 17'b0110001_000_1110011)
     && ((x_inst[11:7] != 5'b0) //hfence.gvma
         || !cp0_yy_hyper)
  || ({x_inst[31:27],x_inst[14:12],x_inst[6:0]} == 15'b00010_010_0101111)
     && (x_inst[24:20] != 5'b0) //lr.w
  || ({x_inst[31:27],x_inst[14:12],x_inst[6:0]} == 15'b00010_011_0101111)
     && (x_inst[24:20] != 5'b0) //lr.d
  || ({x_inst[31:27],x_inst[14:12],x_inst[6:0]} == 15'b10000_001_0001011)
     && (x_inst[24:20] != 5'b0) //tstnbz,rev,ff0,ff1
  || ({x_inst[31:25],x_inst[14:12],x_inst[6:0]} == 17'b1001000_001_0001011)
     && (x_inst[24:20] != 5'b0); //revw

//----------------------------------------------------------
//                  C Illegal Instruction
//----------------------------------------------------------
assign decd_c_illegal =
     ({x_inst[15:13], x_inst[1:0]} == 5'b000_00)
     && (x_inst[12:5] == 8'b0) //c.addi4spn
  || ({x_inst[15:13], x_inst[1:0]} == 5'b001_01)
     && (x_inst[11:7] == 5'b0) //c.addiw
  || ({x_inst[15:13], x_inst[1:0]} == 5'b011_01)
     && ({x_inst[12],x_inst[6:2]} == 6'b0) //c.addi16sp / c.lui
  || ({x_inst[15:13], x_inst[1:0]} == 5'b010_10)
     && (x_inst[11:7] == 5'b0) //c.lwsp
  || ({x_inst[15:13], x_inst[1:0]} == 5'b011_10)
     && (x_inst[11:7] == 5'b0) //c.ldsp
  || ({x_inst[15:12], x_inst[1:0]} == 6'b1000_10)
     && (x_inst[6:2] == 5'b0) //c.jr
     && (x_inst[11:7] == 5'b0);

//----------------------------------------------------------
//            FP load/store Illegal Instruction
//----------------------------------------------------------
//FP load/store illegal:
//when FS=0,execute RV64F/D inst will trigger illegal
assign decd_flsu_illegal =
     (({x_inst[15:13], x_inst[1:0]} == 5'b001_00)     //c.fld
   || ({x_inst[15:13], x_inst[1:0]} == 5'b101_00) //c.fsd
   || ({x_inst[15:13], x_inst[1:0]} == 5'b001_10) //c.fldsp
   || ({x_inst[15:13], x_inst[1:0]} == 5'b101_10) //c.fsdsp
   || ((x_inst[6:0] == 7'b0000111) || (x_inst[6:0] == 7'b0100111)) //flh/flw/fld/fsh/fsw/fsd
      && ((x_inst[14:12]==3'b001)
          || (x_inst[14:12]==3'b010)
          || (x_inst[14:12]==3'b011))
   //if cskyee=0, decd_32_illegal will be 1 due to decd_sel[4] for flr/fsr
   || ({x_inst[31:27],x_inst[14:12],x_inst[6:0]} == 15'b01000_110_0001011) //flrw
   || ({x_inst[31:27],x_inst[14:12],x_inst[6:0]} == 15'b01100_110_0001011) //flrd
   || ({x_inst[31:27],x_inst[14:12],x_inst[6:0]} == 15'b01010_110_0001011) //flurw
   || ({x_inst[31:27],x_inst[14:12],x_inst[6:0]} == 15'b01110_110_0001011) //flurd
   || ({x_inst[31:27],x_inst[14:12],x_inst[6:0]} == 15'b01000_111_0001011) //fsrw
   || ({x_inst[31:27],x_inst[14:12],x_inst[6:0]} == 15'b01100_111_0001011) //fsrd
   || ({x_inst[31:27],x_inst[14:12],x_inst[6:0]} == 15'b01010_111_0001011) //fsurw
   || ({x_inst[31:27],x_inst[14:12],x_inst[6:0]} == 15'b01110_111_0001011))//fsurd
   && (cp0_idu_fs[1:0] == 2'b00);

assign decd_lsu_illegal = decd_flsu_illegal || decd_vlsu_illegal;

// &CombBeg; @369
// &CombEnd; @376
// &CombBeg; @378
// &CombEnd; @387
// &CombBeg; @392
// &CombEnd; @399
// &CombBeg; @401
// &CombEnd; @408
assign decd_vlsu_illegal = 1'b0;
assign vlsu_ld_srcv2_vld = 1'b0;

//----------------------------------------------------------
//                 FP Illegal Instruction
//----------------------------------------------------------
//FP extension illegal
//1. rounding mode == 3'b101 or rounding mode = 3'b110
//2. rounding mode == 3'b111 and fcsr[7:5] == 3'b101~3'b111
//3. FS==0,execute RV64F/D inst or read/write fcsr/fflags/frm/fxcr
//   read/write fcsr/... will decode in CP0
assign fp_static_rounding_illegal  = (x_inst[14:12] == 3'b101)
                                  || (x_inst[14:12] == 3'b110);
assign fp_dynamic_rounding_illegal = (x_inst[14:12] == 3'b111)
                                  && ((cp0_idu_frm[2:0] == 3'b101)
                                      ||(cp0_idu_frm[2:0] == 3'b110)
                                      ||(cp0_idu_frm[2:0] == 3'b111));
assign fp_fs_illegal = (cp0_idu_fs[1:0] == 2'b00); //off
assign decd_fp_illegal =  decd_fp_inst_illegal
                       || fp_static_rounding_illegal
                       || fp_dynamic_rounding_illegal
                       || fp_fs_illegal;

//----------------------------------------------------------
//               Illegal Instruction Result
//----------------------------------------------------------
//output all illegal
assign x_illegal = decd_32_illegal && decd_sel[0]
                || decd_16_illegal && decd_sel[1]
                || decd_i_illegal
                || decd_c_illegal
                || decd_lsu_illegal
                || decd_fp_illegal && decd_sel[2]
                || decd_cache_illegal && decd_sel[3]
                || decd_perf_illegal && decd_sel[4]
                || decd_vec_illegal && decd_sel[5];

//==========================================================
//          Full Decoder for valid and illegal inst
//==========================================================
//the destination and source valid signal and invalid
//instruction exception is hard to optimazied for timing,
//so here implement a full decoder for: type, dst_vld, dst_c_vld
//src0_vld, src1_vld, srcc_vld, dstf_vld, dste_vld, srcf0_vld,
//srcf1_vld, srcf2_vld, inv_expt
parameter TYPE_WIDTH            = 10;

parameter ALU                   = 10'b0000000001;
parameter BJU                   = 10'b0000000010;
parameter MULT                  = 10'b0000000100;
parameter DIV                   = 10'b0000001000;
parameter LSU_P5                = 10'b0000110000;
parameter LSU                   = 10'b0000010000;
parameter PIPE67                = 10'b0001000000;
parameter PIPE6                 = 10'b0010000000;
parameter PIPE7                 = 10'b0100000000;
parameter SPECIAL               = 10'b1000000000;

//----------------------------------------------------------
//                  Decoder Result Selection
//----------------------------------------------------------
//32 bits
assign decd_sel[0] = decd_length
                     && !decd_fp_sel
                     && !decd_sel[3]
                     && !decd_sel[4]
                     && !decd_sel[5];
//16 bits
assign decd_sel[1] = !decd_length;
//fp
assign decd_sel[2] = decd_fp_sel;
//cache
assign decd_sel[3] = ({x_inst[31:26],x_inst[14:0]}
                     == 21'b000000_000_00000_0001011)
                     && cp0_idu_cskyee;
//perf
assign decd_sel[4] = (x_inst[6:0] == 7'b0001011)
                     && (x_inst[14:12] != 3'b000)
                     && cp0_idu_cskyee;
//vector
assign decd_sel[5] = 1'b0;

// &CombBeg; @546
always @( decd_32_srcv2_vld
       or decd_perf_src0_vld
       or decd_32_srcf0_vld
       or decd_vec_srcf2_vld
       or decd_cache_inst_type[9:0]
       or decd_vec_dstf_vld
       or decd_perf_srcf1_vld
       or decd_16_srcf2_vld
       or decd_vec_srcv2_vld
       or decd_32_dst_vld
       or decd_fp_inst_type[9:0]
       or decd_perf_dst_vld
       or decd_vec_inst_type[9:0]
       or decd_vec_src2_vld
       or decd_32_inst_type[9:0]
       or decd_fp_src1_vld
       or decd_perf_inst_type[9:0]
       or decd_vec_srcv0_vld
       or decd_32_src0_vld
       or decd_perf_src1_vld
       or decd_vec_src1_vld
       or decd_32_dstf_vld
       or decd_fp_srcf2_vld
       or decd_perf_src2_vld
       or decd_vec_dstv_vld
       or decd_vec_srcf0_vld
       or decd_vec_srcf1_vld
       or decd_fp_dst_vld
       or decd_32_dstv_vld
       or decd_16_inst_type[9:0]
       or decd_fp_dstf_vld
       or decd_fp_srcf0_vld
       or decd_perf_dstf_vld
       or decd_vec_dste_vld
       or decd_16_srcf1_vld
       or decd_vec_dst_vld
       or decd_vec_src0_vld
       or decd_32_dste_vld
       or decd_perf_srcf2_vld
       or decd_16_dst_vld
       or decd_vec_srcv1_vld
       or decd_16_dstf_vld
       or decd_fp_src0_vld
       or decd_fp_srcf1_vld
       or decd_fp_dste_vld
       or decd_32_src1_vld
       or decd_32_srcf1_vld
       or decd_32_srcf2_vld
       or decd_sel[5:0]
       or decd_cache_src0_vld
       or decd_32_srcv0_vld
       or decd_16_src1_vld
       or decd_16_src0_vld)
begin
  case(decd_sel[5:0])
    6'h1: begin
      x_inst_type[TYPE_WIDTH-1:0] = decd_32_inst_type[TYPE_WIDTH-1:0];
      x_dst_vld                   = decd_32_dst_vld;
      x_dstf_vld                  = decd_32_dstf_vld;
      x_dstv_vld                  = decd_32_dstv_vld;
      x_dste_vld                  = decd_32_dste_vld;
      x_src0_vld                  = decd_32_src0_vld;
      x_src1_vld                  = decd_32_src1_vld;
      x_src2_vld                  = 1'b0;
      x_srcf0_vld                 = decd_32_srcf0_vld;
      x_srcf1_vld                 = decd_32_srcf1_vld;
      x_srcf2_vld                 = decd_32_srcf2_vld;
      x_srcv0_vld                 = decd_32_srcv0_vld;
      x_srcv1_vld                 = 1'b0;
      x_srcv2_vld                 = decd_32_srcv2_vld;
    end
    6'h2: begin
      x_inst_type[TYPE_WIDTH-1:0] = decd_16_inst_type[TYPE_WIDTH-1:0];
      x_dst_vld                   = decd_16_dst_vld;
      x_dstf_vld                  = decd_16_dstf_vld;
      x_dstv_vld                  = 1'b0;
      x_dste_vld                  = 1'b0;
      x_src0_vld                  = decd_16_src0_vld;
      x_src1_vld                  = decd_16_src1_vld;
      x_src2_vld                  = 1'b0;
      x_srcf0_vld                 = 1'b0;
      x_srcf1_vld                 = decd_16_srcf1_vld;
      x_srcf2_vld                 = decd_16_srcf2_vld;
      x_srcv0_vld                 = 1'b0;
      x_srcv1_vld                 = 1'b0;
      x_srcv2_vld                 = 1'b0;
    end
    6'h4: begin
      x_inst_type[TYPE_WIDTH-1:0] = decd_fp_inst_type[TYPE_WIDTH-1:0];
      x_dst_vld                   = decd_fp_dst_vld;
      x_dstf_vld                  = decd_fp_dstf_vld;
      x_dstv_vld                  = 1'b0;
      x_dste_vld                  = decd_fp_dste_vld;
      x_src0_vld                  = decd_fp_src0_vld;
      x_src1_vld                  = decd_fp_src1_vld;
      x_src2_vld                  = 1'b0;
      x_srcf0_vld                 = decd_fp_srcf0_vld;
      x_srcf1_vld                 = decd_fp_srcf1_vld;
      x_srcf2_vld                 = decd_fp_srcf2_vld;
      x_srcv0_vld                 = 1'b0;
      x_srcv1_vld                 = 1'b0;
      x_srcv2_vld                 = 1'b0;
    end
    6'h8: begin
      x_inst_type[TYPE_WIDTH-1:0] = decd_cache_inst_type[TYPE_WIDTH-1:0];
      x_dst_vld                   = 1'b0;
      x_dstf_vld                  = 1'b0;
      x_dstv_vld                  = 1'b0;
      x_dste_vld                  = 1'b0;
      x_src0_vld                  = decd_cache_src0_vld;
      x_src1_vld                  = 1'b0;
      x_src2_vld                  = 1'b0;
      x_srcf0_vld                 = 1'b0;
      x_srcf1_vld                 = 1'b0;
      x_srcf2_vld                 = 1'b0;
      x_srcv0_vld                 = 1'b0;
      x_srcv1_vld                 = 1'b0;
      x_srcv2_vld                 = 1'b0;
    end
    6'h10: begin
      x_inst_type[TYPE_WIDTH-1:0] = decd_perf_inst_type[TYPE_WIDTH-1:0];
      x_dst_vld                   = decd_perf_dst_vld;
      x_dstf_vld                  = decd_perf_dstf_vld;
      x_dstv_vld                  = 1'b0;
      x_dste_vld                  = 1'b0;
      x_src0_vld                  = decd_perf_src0_vld;
      x_src1_vld                  = decd_perf_src1_vld;
      x_src2_vld                  = decd_perf_src2_vld;
      x_srcf0_vld                 = 1'b0;
      x_srcf1_vld                 = decd_perf_srcf1_vld;
      x_srcf2_vld                 = decd_perf_srcf2_vld;
      x_srcv0_vld                 = 1'b0;
      x_srcv1_vld                 = 1'b0;
      x_srcv2_vld                 = 1'b0;
    end
    6'h20: begin
      x_inst_type[TYPE_WIDTH-1:0] = decd_vec_inst_type[TYPE_WIDTH-1:0];
      x_dst_vld                   = decd_vec_dst_vld;
      x_dstf_vld                  = decd_vec_dstf_vld;
      x_dstv_vld                  = decd_vec_dstv_vld;
      x_dste_vld                  = decd_vec_dste_vld;
      x_src0_vld                  = decd_vec_src0_vld;
      x_src1_vld                  = decd_vec_src1_vld;
      x_src2_vld                  = decd_vec_src2_vld;
      x_srcf0_vld                 = decd_vec_srcf0_vld;
      x_srcf1_vld                 = decd_vec_srcf1_vld;
      x_srcf2_vld                 = decd_vec_srcf2_vld;
      x_srcv0_vld                 = decd_vec_srcv0_vld;
      x_srcv1_vld                 = decd_vec_srcv1_vld;
      x_srcv2_vld                 = decd_vec_srcv2_vld;
    end
    default: begin
      x_inst_type[TYPE_WIDTH-1:0] = {TYPE_WIDTH{1'bx}};
      x_dst_vld                   = 1'bx;
      x_dstf_vld                  = 1'bx;
      x_dstv_vld                  = 1'bx;
      x_dste_vld                  = 1'bx;
      x_src0_vld                  = 1'bx;
      x_src1_vld                  = 1'bx;
      x_src2_vld                  = 1'bx;
      x_srcf0_vld                 = 1'bx;
      x_srcf1_vld                 = 1'bx;
      x_srcf2_vld                 = 1'bx;
      x_srcv0_vld                 = 1'bx;
      x_srcv1_vld                 = 1'bx;
      x_srcv2_vld                 = 1'bx;
    end
  endcase
// &CombEnd; @661
end

//----------------------------------------------------------
//                   16 bits Full Decoder
//----------------------------------------------------------
// &CombBeg; @666
always @( x_inst[15:2]
       or x_inst[1:0])
begin
  //initialize decoded information value
  decd_16_inst_type[TYPE_WIDTH-1:0]    = {TYPE_WIDTH{1'b0}};
  //operand prepare information: valid, and types
  decd_16_dst_vld                      = 1'b0;
  decd_16_dstf_vld                     = 1'b0;
  decd_16_src0_vld                     = 1'b0;
  decd_16_src1_vld                     = 1'b0;
  decd_16_srcf1_vld                    = 1'b0;
  decd_16_srcf2_vld                    = 1'b0;
  //illegal instruction
  decd_16_illegal                      = 1'b0;

  casez({x_inst[15:10], x_inst[6:5], x_inst[1:0]})
    //16-bits instructions decode logic
    10'b000???_??00:begin //c.addi4spn
      decd_16_inst_type[TYPE_WIDTH-1:0]    = ALU;
      decd_16_src0_vld                     = 1'b1;
      decd_16_dst_vld                      = 1'b1;
      end
    10'b001???_??00:begin //c.fld
      decd_16_inst_type[TYPE_WIDTH-1:0]    = LSU;
      decd_16_src0_vld                     = 1'b1;
      decd_16_dstf_vld                     = 1'b1;
      end
    10'b010???_??00:begin //c.lw
      decd_16_inst_type[TYPE_WIDTH-1:0]    = LSU;
      decd_16_src0_vld                     = 1'b1;
      decd_16_dst_vld                      = 1'b1;
      end
    10'b011???_??00:begin //c.ld
      decd_16_inst_type[TYPE_WIDTH-1:0]    = LSU;
      decd_16_src0_vld                     = 1'b1;
      decd_16_dst_vld                      = 1'b1;
      end
    10'b101???_??00:begin //c.fsd
      decd_16_inst_type[TYPE_WIDTH-1:0]    = LSU_P5;
      decd_16_src0_vld                     = 1'b1;
      decd_16_srcf2_vld                    = 1'b1;
      end
    10'b110???_??00:begin //c.sw
      decd_16_inst_type[TYPE_WIDTH-1:0]    = LSU_P5;
      decd_16_src0_vld                     = 1'b1;
      decd_16_src1_vld                     = 1'b1;
      end
    10'b111???_??00:begin //c.sd
      decd_16_inst_type[TYPE_WIDTH-1:0]    = LSU_P5;
      decd_16_src0_vld                     = 1'b1;
      decd_16_src1_vld                     = 1'b1;
      end
    10'b000???_??01:begin //c.addi / c.nop
      decd_16_inst_type[TYPE_WIDTH-1:0]    = ALU;
      decd_16_src0_vld                     = (x_inst[11:7] != 5'b0);
      decd_16_dst_vld                      = (x_inst[11:7] != 5'b0);
      end
    10'b001???_??01:begin //c.addiw
      decd_16_inst_type[TYPE_WIDTH-1:0]    = ALU;
      decd_16_src0_vld                     = 1'b1;
      decd_16_dst_vld                      = 1'b1;
      end
    10'b010???_??01:begin //c.li
      decd_16_inst_type[TYPE_WIDTH-1:0]    = ALU;
      decd_16_dst_vld                      = 1'b1;
      end
    10'b011???_??01:begin //c.addi16sp, c.lui
      decd_16_inst_type[TYPE_WIDTH-1:0]    = ALU;
      decd_16_src0_vld                     = (x_inst[11:7] == 5'd2);
      decd_16_dst_vld                      = 1'b1;
      end
    10'b100?00_??01:begin //c.srli
      decd_16_inst_type[TYPE_WIDTH-1:0]    = ALU;
      decd_16_src0_vld                     = 1'b1;
      decd_16_dst_vld                      = 1'b1;
      end
    10'b100?01_??01:begin //c.srai
      decd_16_inst_type[TYPE_WIDTH-1:0]    = ALU;
      decd_16_src0_vld                     = 1'b1;
      decd_16_dst_vld                      = 1'b1;
      end
    10'b100?10_??01:begin //c.andi
      decd_16_inst_type[TYPE_WIDTH-1:0]    = ALU;
      decd_16_src0_vld                     = 1'b1;
      decd_16_dst_vld                      = 1'b1;
      end
    10'b100011_0001:begin //c.sub
      decd_16_inst_type[TYPE_WIDTH-1:0]    = ALU;
      decd_16_src0_vld                     = 1'b1;
      decd_16_src1_vld                     = 1'b1;
      decd_16_dst_vld                      = 1'b1;
      end
    10'b100011_0101:begin //c.xor
      decd_16_inst_type[TYPE_WIDTH-1:0]    = ALU;
      decd_16_src0_vld                     = 1'b1;
      decd_16_src1_vld                     = 1'b1;
      decd_16_dst_vld                      = 1'b1;
      end
    10'b100011_1001:begin //c.or
      decd_16_inst_type[TYPE_WIDTH-1:0]    = ALU;
      decd_16_src0_vld                     = 1'b1;
      decd_16_src1_vld                     = 1'b1;
      decd_16_dst_vld                      = 1'b1;
      end
    10'b100011_1101:begin //c.and
      decd_16_inst_type[TYPE_WIDTH-1:0]    = ALU;
      decd_16_src0_vld                     = 1'b1;
      decd_16_src1_vld                     = 1'b1;
      decd_16_dst_vld                      = 1'b1;
      end
    10'b100111_0001:begin //c.subw
      decd_16_inst_type[TYPE_WIDTH-1:0]    = ALU;
      decd_16_src0_vld                     = 1'b1;
      decd_16_src1_vld                     = 1'b1;
      decd_16_dst_vld                      = 1'b1;
      end
    10'b100111_0101:begin //c.addw
      decd_16_inst_type[TYPE_WIDTH-1:0]    = ALU;
      decd_16_src0_vld                     = 1'b1;
      decd_16_src1_vld                     = 1'b1;
      decd_16_dst_vld                      = 1'b1;
      end
    10'b101???_??01:begin //c.j
      decd_16_inst_type[TYPE_WIDTH-1:0]    = BJU;
      end
    10'b110???_??01:begin //c.beqz
      decd_16_inst_type[TYPE_WIDTH-1:0]    = BJU;
      decd_16_src0_vld                     = 1'b1;
      end
    10'b111???_??01:begin //c.bnez
      decd_16_inst_type[TYPE_WIDTH-1:0]    = BJU;
      decd_16_src0_vld                     = 1'b1;
      end
    10'b000???_??10:begin //c.slli
      decd_16_inst_type[TYPE_WIDTH-1:0]    = ALU;
      decd_16_src0_vld                     = 1'b1;
      decd_16_dst_vld                      = 1'b1;
      end
    10'b001???_??10:begin //c.fldsp
      decd_16_inst_type[TYPE_WIDTH-1:0]    = LSU;
      decd_16_src0_vld                     = 1'b1;
      decd_16_dstf_vld                     = 1'b1;
      end
    10'b010???_??10:begin //c.lwsp
      decd_16_inst_type[TYPE_WIDTH-1:0]    = LSU;
      decd_16_src0_vld                     = 1'b1;
      decd_16_dst_vld                      = 1'b1;
      end
    10'b011???_??10:begin //c.ldsp
      decd_16_inst_type[TYPE_WIDTH-1:0]    = LSU;
      decd_16_src0_vld                     = 1'b1;
      decd_16_dst_vld                      = 1'b1;
      end
    10'b1000??_??10:begin //c.jr / c.mv
      decd_16_inst_type[TYPE_WIDTH-1:0]    = (x_inst[6:2] == 5'b0) ? BJU : ALU;
      decd_16_src0_vld                     = 1'b1;
      decd_16_dst_vld                      = (x_inst[6:2] != 5'b0);
      end
    10'b1001??_??10:begin //c.jalr / c.add //c.ebreak
      decd_16_inst_type[TYPE_WIDTH-1:0]    = (x_inst[6:2] == 5'b0)
                                             ? ((x_inst[11:7] == 5'b0) ? SPECIAL : BJU)
                                             : ALU;
      decd_16_src0_vld                     = (x_inst[11:7] != 5'b0);
      decd_16_src1_vld                     = (x_inst[11:7] != 5'b0)
                                             && (x_inst[6:2] != 5'b0);
      decd_16_dst_vld                      = (x_inst[11:7] != 5'b0)
                                             && (x_inst[6:2] != 5'b0);
      end
    10'b101???_??10:begin //c.fsdsp
      decd_16_inst_type[TYPE_WIDTH-1:0]    = LSU_P5;
      decd_16_src0_vld                     = 1'b1;
      decd_16_srcf2_vld                    = 1'b1;
      end
    10'b110???_??10:begin //c.swsp
      decd_16_inst_type[TYPE_WIDTH-1:0]    = LSU_P5;
      decd_16_src0_vld                     = 1'b1;
      decd_16_src1_vld                     = 1'b1;
      end
    10'b111???_??10:begin //c.sdsp
      decd_16_inst_type[TYPE_WIDTH-1:0]    = LSU_P5;
      decd_16_src0_vld                     = 1'b1;
      decd_16_src1_vld                     = 1'b1;
      end
    default:begin                //invalid instruction
      //deal in fence
      decd_16_illegal                      = 1'b1;  //invalid instruction exception
    end
  endcase
// &CombEnd; @864
end


//----------------------------------------------------------
//                   32 bits Full Decoder
//----------------------------------------------------------
// &CombBeg; @870
always @( x_inst[14:12]
       or x_inst[31:25]
       or x_inst[6:2])
begin
  //initialize decoded information value
  decd_32_inst_type[TYPE_WIDTH-1:0]    = {TYPE_WIDTH{1'b0}};
  //operand prepare information: valid, and types
  decd_32_dst_vld                      = 1'b0;
  decd_32_dstf_vld                     = 1'b0;
  decd_32_dste_vld                     = 1'b0;
  decd_32_src0_vld                     = 1'b0;
  decd_32_src1_vld                     = 1'b0;
  decd_32_srcf0_vld                    = 1'b0;
  decd_32_srcf1_vld                    = 1'b0;
  decd_32_srcf2_vld                    = 1'b0;
  decd_32_srcv0_vld                    = 1'b0;
  decd_32_srcv2_vld                    = 1'b0;
  decd_32_dstv_vld                     = 1'b0;
  //illegal instruction
  decd_32_illegal                      = 1'b0;

  casez({x_inst[31:25], x_inst[14:12], x_inst[6:2]})
    //16-bits instructions decode logic
    //32-bits instructions decode logic
    15'b?????_?????01101:begin //lui
      decd_32_inst_type[TYPE_WIDTH-1:0]    = ALU;
      decd_32_dst_vld                      = 1'b1;
      end
    15'b??????????00101:begin //auipc
      decd_32_inst_type[TYPE_WIDTH-1:0]    = SPECIAL;
      decd_32_dst_vld                      = 1'b1;
      end
    15'b??????????11011:begin //jal (dst_vld deal in split)
      decd_32_inst_type[TYPE_WIDTH-1:0]    = BJU;
      end
    15'b???????00011001:begin //jalr (dst_vld deal in split)
      decd_32_inst_type[TYPE_WIDTH-1:0]    = BJU;
      decd_32_src0_vld                     = 1'b1;
      end
    15'b???????00011000:begin //beq
      decd_32_inst_type[TYPE_WIDTH-1:0]    = BJU;
      decd_32_src0_vld                     = 1'b1;
      decd_32_src1_vld                     = 1'b1;
      end
    15'b???????00111000:begin //bne
      decd_32_inst_type[TYPE_WIDTH-1:0]    = BJU;
      decd_32_src0_vld                     = 1'b1;
      decd_32_src1_vld                     = 1'b1;
      end
    15'b???????10011000:begin //blt
      decd_32_inst_type[TYPE_WIDTH-1:0]    = BJU;
      decd_32_src0_vld                     = 1'b1;
      decd_32_src1_vld                     = 1'b1;
      end
    15'b???????10111000:begin //bge
      decd_32_inst_type[TYPE_WIDTH-1:0]    = BJU;
      decd_32_src0_vld                     = 1'b1;
      decd_32_src1_vld                     = 1'b1;
      end
    15'b???????11011000:begin //bltu
      decd_32_inst_type[TYPE_WIDTH-1:0]    = BJU;
      decd_32_src0_vld                     = 1'b1;
      decd_32_src1_vld                     = 1'b1;
      end
    15'b???????11111000:begin //bgeu
      decd_32_inst_type[TYPE_WIDTH-1:0]    = BJU;
      decd_32_src0_vld                     = 1'b1;
      decd_32_src1_vld                     = 1'b1;
      end
    15'b???????00000000:begin //lb
      decd_32_inst_type[TYPE_WIDTH-1:0]    = LSU;
      decd_32_src0_vld                     = 1'b1;
      decd_32_dst_vld                      = 1'b1;
      end
    15'b???????00100000:begin //lh
      decd_32_inst_type[TYPE_WIDTH-1:0]    = LSU;
      decd_32_src0_vld                     = 1'b1;
      decd_32_dst_vld                      = 1'b1;
      end
    15'b???????01000000:begin //lw
      decd_32_inst_type[TYPE_WIDTH-1:0]    = LSU;
      decd_32_src0_vld                     = 1'b1;
      decd_32_dst_vld                      = 1'b1;
      end
    15'b???????01100000:begin //ld
      decd_32_inst_type[TYPE_WIDTH-1:0]    = LSU;
      decd_32_src0_vld                     = 1'b1;
      decd_32_dst_vld                      = 1'b1;
      end
    15'b???????10000000:begin //lbu
      decd_32_inst_type[TYPE_WIDTH-1:0]    = LSU;
      decd_32_src0_vld                     = 1'b1;
      decd_32_dst_vld                      = 1'b1;
      end
    15'b???????10100000:begin //lhu
      decd_32_inst_type[TYPE_WIDTH-1:0]    = LSU;
      decd_32_src0_vld                     = 1'b1;
      decd_32_dst_vld                      = 1'b1;
      end
    15'b???????11000000:begin //lwu
      decd_32_inst_type[TYPE_WIDTH-1:0]    = LSU;
      decd_32_src0_vld                     = 1'b1;
      decd_32_dst_vld                      = 1'b1;
      end
    15'b???????00100001:begin //flh
      decd_32_inst_type[TYPE_WIDTH-1:0]    = LSU;
      decd_32_src0_vld                     = 1'b1;
      decd_32_dstf_vld                     = 1'b1;
      end
    15'b???????01000001:begin //flw
      decd_32_inst_type[TYPE_WIDTH-1:0]    = LSU;
      decd_32_src0_vld                     = 1'b1;
      decd_32_dstf_vld                     = 1'b1;
      end
    15'b???????01100001:begin //fld
      decd_32_inst_type[TYPE_WIDTH-1:0]    = LSU;
      decd_32_src0_vld                     = 1'b1;
      decd_32_dstf_vld                     = 1'b1;
      end
    15'b???????00001000:begin //sb
      decd_32_inst_type[TYPE_WIDTH-1:0]    = LSU_P5;
      decd_32_src0_vld                     = 1'b1;
      decd_32_src1_vld                     = 1'b1;
      end
    15'b???????00101000:begin //sh
      decd_32_inst_type[TYPE_WIDTH-1:0]    = LSU_P5;
      decd_32_src0_vld                     = 1'b1;
      decd_32_src1_vld                     = 1'b1;
      end
    15'b???????01001000:begin //sw
      decd_32_inst_type[TYPE_WIDTH-1:0]    = LSU_P5;
      decd_32_src0_vld                     = 1'b1;
      decd_32_src1_vld                     = 1'b1;
      end
    15'b???????01101000:begin //sd
      decd_32_inst_type[TYPE_WIDTH-1:0]    = LSU_P5;
      decd_32_src0_vld                     = 1'b1;
      decd_32_src1_vld                     = 1'b1;
      end
    15'b???????00101001:begin //fsh
      decd_32_inst_type[TYPE_WIDTH-1:0]    = LSU_P5;
      decd_32_src0_vld                     = 1'b1;
      decd_32_srcf2_vld                    = 1'b1;
      end
    15'b???????01001001:begin //fsw
      decd_32_inst_type[TYPE_WIDTH-1:0]    = LSU_P5;
      decd_32_src0_vld                     = 1'b1;
      decd_32_srcf2_vld                    = 1'b1;
      end
    15'b???????01101001:begin //fsd
      decd_32_inst_type[TYPE_WIDTH-1:0]    = LSU_P5;
      decd_32_src0_vld                     = 1'b1;
      decd_32_srcf2_vld                    = 1'b1;
      end
    15'b???????00000100:begin //addi
      decd_32_inst_type[TYPE_WIDTH-1:0]    = ALU;
      decd_32_src0_vld                     = 1'b1;
      decd_32_dst_vld                      = 1'b1;
      end
    15'b???????01000100:begin //slti
      decd_32_inst_type[TYPE_WIDTH-1:0]    = ALU;
      decd_32_src0_vld                     = 1'b1;
      decd_32_dst_vld                      = 1'b1;
      end
    15'b???????01100100:begin //sltiu
      decd_32_inst_type[TYPE_WIDTH-1:0]    = ALU;
      decd_32_src0_vld                     = 1'b1;
      decd_32_dst_vld                      = 1'b1;
      end
    15'b???????10000100:begin //xori
      decd_32_inst_type[TYPE_WIDTH-1:0]    = ALU;
      decd_32_src0_vld                     = 1'b1;
      decd_32_dst_vld                      = 1'b1;
      end
    15'b???????11000100:begin //ori
      decd_32_inst_type[TYPE_WIDTH-1:0]    = ALU;
      decd_32_src0_vld                     = 1'b1;
      decd_32_dst_vld                      = 1'b1;
      end
    15'b???????11100100:begin //andi
      decd_32_inst_type[TYPE_WIDTH-1:0]    = ALU;
      decd_32_src0_vld                     = 1'b1;
      decd_32_dst_vld                      = 1'b1;
      end
    15'b000000?00100100:begin //slli
      decd_32_inst_type[TYPE_WIDTH-1:0]    = ALU;
      decd_32_src0_vld                     = 1'b1;
      decd_32_dst_vld                      = 1'b1;
      end
    15'b000000?10100100:begin //srli
      decd_32_inst_type[TYPE_WIDTH-1:0]    = ALU;
      decd_32_src0_vld                     = 1'b1;
      decd_32_dst_vld                      = 1'b1;
      end
    15'b010000?10100100:begin //srai
      decd_32_inst_type[TYPE_WIDTH-1:0]    = ALU;
      decd_32_src0_vld                     = 1'b1;
      decd_32_dst_vld                      = 1'b1;
      end
    15'b???????00000110:begin //addiw
      decd_32_inst_type[TYPE_WIDTH-1:0]    = ALU;
      decd_32_src0_vld                     = 1'b1;
      decd_32_dst_vld                      = 1'b1;
      end
    15'b000000000100110:begin //slliw
      decd_32_inst_type[TYPE_WIDTH-1:0]    = ALU;
      decd_32_src0_vld                     = 1'b1;
      decd_32_dst_vld                      = 1'b1;
      end
    15'b000000010100110:begin //srliw
      decd_32_inst_type[TYPE_WIDTH-1:0]    = ALU;
      decd_32_src0_vld                     = 1'b1;
      decd_32_dst_vld                      = 1'b1;
      end
    15'b010000010100110:begin //sraiw
      decd_32_inst_type[TYPE_WIDTH-1:0]    = ALU;
      decd_32_src0_vld                     = 1'b1;
      decd_32_dst_vld                      = 1'b1;
      end
    15'b000000000001110:begin //addw
      decd_32_inst_type[TYPE_WIDTH-1:0]    = ALU;
      decd_32_src0_vld                     = 1'b1;
      decd_32_src1_vld                     = 1'b1;
      decd_32_dst_vld                      = 1'b1;
      end
    15'b010000000001110:begin //subw
      decd_32_inst_type[TYPE_WIDTH-1:0]    = ALU;
      decd_32_src0_vld                     = 1'b1;
      decd_32_src1_vld                     = 1'b1;
      decd_32_dst_vld                      = 1'b1;
      end
    15'b000000000101110:begin //sllw
      decd_32_inst_type[TYPE_WIDTH-1:0]    = ALU;
      decd_32_src0_vld                     = 1'b1;
      decd_32_src1_vld                     = 1'b1;
      decd_32_dst_vld                      = 1'b1;
      end
    15'b000000010101110:begin //srlw
      decd_32_inst_type[TYPE_WIDTH-1:0]    = ALU;
      decd_32_src0_vld                     = 1'b1;
      decd_32_src1_vld                     = 1'b1;
      decd_32_dst_vld                      = 1'b1;
      end
    15'b010000010101110:begin //sraw
      decd_32_inst_type[TYPE_WIDTH-1:0]    = ALU;
      decd_32_src0_vld                     = 1'b1;
      decd_32_src1_vld                     = 1'b1;
      decd_32_dst_vld                      = 1'b1;
      end
    15'b000000000001100:begin //add
      decd_32_inst_type[TYPE_WIDTH-1:0]    = ALU;
      decd_32_src0_vld                     = 1'b1;
      decd_32_src1_vld                     = 1'b1;
      decd_32_dst_vld                      = 1'b1;
      end
    15'b010000000001100:begin //sub
      decd_32_inst_type[TYPE_WIDTH-1:0]    = ALU;
      decd_32_src0_vld                     = 1'b1;
      decd_32_src1_vld                     = 1'b1;
      decd_32_dst_vld                      = 1'b1;
      end
    15'b000000000101100:begin //sll
      decd_32_inst_type[TYPE_WIDTH-1:0]    = ALU;
      decd_32_src0_vld                     = 1'b1;
      decd_32_src1_vld                     = 1'b1;
      decd_32_dst_vld                      = 1'b1;
      end
    15'b000000001001100:begin //slt
      decd_32_inst_type[TYPE_WIDTH-1:0]    = ALU;
      decd_32_src0_vld                     = 1'b1;
      decd_32_src1_vld                     = 1'b1;
      decd_32_dst_vld                      = 1'b1;
      end
    15'b000000001101100:begin //sltu
      decd_32_inst_type[TYPE_WIDTH-1:0]    = ALU;
      decd_32_src0_vld                     = 1'b1;
      decd_32_src1_vld                     = 1'b1;
      decd_32_dst_vld                      = 1'b1;
      end
    15'b000000010001100:begin //xor
      decd_32_inst_type[TYPE_WIDTH-1:0]    = ALU;
      decd_32_src0_vld                     = 1'b1;
      decd_32_src1_vld                     = 1'b1;
      decd_32_dst_vld                      = 1'b1;
      end
    15'b000000010101100:begin //srl
      decd_32_inst_type[TYPE_WIDTH-1:0]    = ALU;
      decd_32_src0_vld                     = 1'b1;
      decd_32_src1_vld                     = 1'b1;
      decd_32_dst_vld                      = 1'b1;
      end
    15'b010000010101100:begin //sra
      decd_32_inst_type[TYPE_WIDTH-1:0]    = ALU;
      decd_32_src0_vld                     = 1'b1;
      decd_32_src1_vld                     = 1'b1;
      decd_32_dst_vld                      = 1'b1;
      end
    15'b000000011001100:begin //or
      decd_32_inst_type[TYPE_WIDTH-1:0]    = ALU;
      decd_32_src0_vld                     = 1'b1;
      decd_32_src1_vld                     = 1'b1;
      decd_32_dst_vld                      = 1'b1;
      end
    15'b000000011101100:begin //and
      decd_32_inst_type[TYPE_WIDTH-1:0]    = ALU;
      decd_32_src0_vld                     = 1'b1;
      decd_32_src1_vld                     = 1'b1;
      decd_32_dst_vld                      = 1'b1;
      end
    15'b000000100001100:begin //mul
      decd_32_inst_type[TYPE_WIDTH-1:0]    = MULT;
      decd_32_src0_vld                     = 1'b1;
      decd_32_src1_vld                     = 1'b1;
      decd_32_dst_vld                      = 1'b1;
      end
    15'b000000100101100:begin //mulh
      decd_32_inst_type[TYPE_WIDTH-1:0]    = MULT;
      decd_32_src0_vld                     = 1'b1;
      decd_32_src1_vld                     = 1'b1;
      decd_32_dst_vld                      = 1'b1;
      end
    15'b000000101001100:begin //mulhsu
      decd_32_inst_type[TYPE_WIDTH-1:0]    = MULT;
      decd_32_src0_vld                     = 1'b1;
      decd_32_src1_vld                     = 1'b1;
      decd_32_dst_vld                      = 1'b1;
      end
    15'b000000101101100:begin //mulhu
      decd_32_inst_type[TYPE_WIDTH-1:0]    = MULT;
      decd_32_src0_vld                     = 1'b1;
      decd_32_src1_vld                     = 1'b1;
      decd_32_dst_vld                      = 1'b1;
      end
    15'b000000110001100:begin //div
      decd_32_inst_type[TYPE_WIDTH-1:0]    = DIV;
      decd_32_src0_vld                     = 1'b1;
      decd_32_src1_vld                     = 1'b1;
      decd_32_dst_vld                      = 1'b1;
      end
    15'b000000110101100:begin //divu
      decd_32_inst_type[TYPE_WIDTH-1:0]    = DIV;
      decd_32_src0_vld                     = 1'b1;
      decd_32_src1_vld                     = 1'b1;
      decd_32_dst_vld                      = 1'b1;
      end
    15'b000000111001100:begin //rem
      decd_32_inst_type[TYPE_WIDTH-1:0]    = DIV;
      decd_32_src0_vld                     = 1'b1;
      decd_32_src1_vld                     = 1'b1;
      decd_32_dst_vld                      = 1'b1;
      end
    15'b000000111101100:begin //remu
      decd_32_inst_type[TYPE_WIDTH-1:0]    = DIV;
      decd_32_src0_vld                     = 1'b1;
      decd_32_src1_vld                     = 1'b1;
      decd_32_dst_vld                      = 1'b1;
      end
    15'b000000100001110:begin //mulw
      decd_32_inst_type[TYPE_WIDTH-1:0]    = MULT;
      decd_32_src0_vld                     = 1'b1;
      decd_32_src1_vld                     = 1'b1;
      decd_32_dst_vld                      = 1'b1;
      end
    15'b000000110001110:begin //divw
      decd_32_inst_type[TYPE_WIDTH-1:0]    = DIV;
      decd_32_src0_vld                     = 1'b1;
      decd_32_src1_vld                     = 1'b1;
      decd_32_dst_vld                      = 1'b1;
      end
    15'b000000110101110:begin //divuw
      decd_32_inst_type[TYPE_WIDTH-1:0]    = DIV;
      decd_32_src0_vld                     = 1'b1;
      decd_32_src1_vld                     = 1'b1;
      decd_32_dst_vld                      = 1'b1;
      end
    15'b000000111001110:begin //remw
      decd_32_inst_type[TYPE_WIDTH-1:0]    = DIV;
      decd_32_src0_vld                     = 1'b1;
      decd_32_src1_vld                     = 1'b1;
      decd_32_dst_vld                      = 1'b1;
      end
    15'b000000111101110:begin //remuw
      decd_32_inst_type[TYPE_WIDTH-1:0]    = DIV;
      decd_32_src0_vld                     = 1'b1;
      decd_32_src1_vld                     = 1'b1;
      decd_32_dst_vld                      = 1'b1;
      end
    15'b00010??01001011:begin //lr.w
      decd_32_inst_type[TYPE_WIDTH-1:0]    = LSU;
      decd_32_src0_vld                     = 1'b1;
      decd_32_dst_vld                      = 1'b1;
      end
    15'b00011??01001011:begin //sc.w
      decd_32_inst_type[TYPE_WIDTH-1:0]    = LSU_P5;
      decd_32_src0_vld                     = 1'b1;
      decd_32_src1_vld                     = 1'b1;
      decd_32_dst_vld                      = 1'b1;
      end
    15'b00000??01001011:begin //amoadd.w
      //deal in fence / split
      end
    15'b00001??01001011:begin //amoswap.w
      //deal in fence / split
      end
    15'b00100??01001011:begin //amoxor.w
      //deal in fence / split
      end
    15'b01100??01001011:begin //amoand.w
      //deal in fence / split
      end
    15'b01000??01001011:begin //amoor.w
      //deal in fence / split
      end
    15'b10000??01001011:begin //amomin.w
      //deal in fence / split
      end
    15'b10100??01001011:begin //amomax.w
      //deal in fence / split
      end
    15'b11000??01001011:begin //amominu.w
      //deal in fence / split
      end
    15'b11100??01001011:begin //amomaxu.w
      //deal in fence / split
      end
    15'b00010??01101011:begin //lr.d
      decd_32_inst_type[TYPE_WIDTH-1:0]    = LSU;
      decd_32_src0_vld                     = 1'b1;
      decd_32_dst_vld                      = 1'b1;
      end
    15'b00011??01101011:begin //sc.d
      decd_32_inst_type[TYPE_WIDTH-1:0]    = LSU_P5;
      decd_32_src0_vld                     = 1'b1;
      decd_32_src1_vld                     = 1'b1;
      decd_32_dst_vld                      = 1'b1;
      end
    15'b00000??01101011:begin //amoadd.d
      //deal in fence / split
      end
    15'b00001??01101011:begin //amoswap.d
      //deal in fence / split
      end
    15'b00100??01101011:begin //amoxor.d
      //deal in fence / split
      end
    15'b01100??01101011:begin //amoand.d
      //deal in fence / split
      end
    15'b01000??01101011:begin //amoor.d
      //deal in fence / split
      end
    15'b10000??01101011:begin //amomin.d
      //deal in fence / split
      end
    15'b10100??01101011:begin //amomax.d
      //deal in fence / split
      end
    15'b11000??01101011:begin //amominu.d
      //deal in fence / split
      end
    15'b11100??01101011:begin //amomaxu.d
      //deal in fence / split
      end
    15'b???????00000011:begin //fence
      decd_32_inst_type[TYPE_WIDTH-1:0]    = LSU;
      end
    15'b???????00100011:begin //fence.i
      //deal in fence
      end
    15'b000000000011100:begin //ecall ebreak
      decd_32_inst_type[TYPE_WIDTH-1:0]    = SPECIAL;
      end
    15'b000100000011100:begin //sret wfi
      //deal in fence
      end
    15'b000100100011100:begin //sfence.vma
      //deal in fence
      end
    15'b001100000011100:begin //mret
      //deal in fence
      end
    15'b???????00111100:begin //csrrw
      //deal in fence
      end
    15'b???????01011100:begin //csrrs
      //deal in fence
      end
    15'b???????01111100:begin //csrrc
      //deal in fence
      end
    15'b???????10111100:begin //csrwi
      //deal in fence
      end
    15'b???????11011100:begin //csrsi
      //deal in fence
      end
    15'b???????11111100:begin //csrci
      //deal in fence
      end
    default:begin                //invalid instruction
      //deal in fence
      decd_32_illegal                      = 1'b1;  //invalid instruction exception
    end
  endcase
// &CombEnd; @1504
end


//----------------------------------------------------------
//       FP part0 Full Decoder(except fused multiply add)
//----------------------------------------------------------



// &CombBeg; @1526
always @( x_inst[14:12]
       or x_inst[31:20])
begin
  //initialize decoded information value
  decd_fp0_inst_type[TYPE_WIDTH-1:0]    = {TYPE_WIDTH{1'b0}};
  //operand prepare information: valid, and types
  decd_fp0_dst_vld                      = 1'b0;
  decd_fp0_dstf_vld                     = 1'b0;
  decd_fp0_dste_vld                     = 1'b0;
  decd_fp0_src0_vld                     = 1'b0;
  decd_fp0_srcf0_vld                    = 1'b0;
  decd_fp0_srcf1_vld                    = 1'b0;
  //illegal instruction
  decd_fp0_illegal                      = 1'b0;

  casez({x_inst[31:20], x_inst[14:12]})
    15'b0001010????????: begin  //fmul.h
      decd_fp0_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_fp0_dstf_vld                     = 1'b1;
      decd_fp0_dste_vld                     = 1'b1;
      decd_fp0_srcf0_vld                    = 1'b1;
      decd_fp0_srcf1_vld                    = 1'b1;
      end
     15'b0000010????????: begin  //fadd.h
      decd_fp0_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_fp0_dstf_vld                     = 1'b1;
      decd_fp0_dste_vld                     = 1'b1;
      decd_fp0_srcf0_vld                    = 1'b1;
      decd_fp0_srcf1_vld                    = 1'b1;
      end
    15'b0000110????????: begin  //fsub.h
      decd_fp0_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_fp0_dstf_vld                     = 1'b1;
      decd_fp0_dste_vld                     = 1'b1;
      decd_fp0_srcf0_vld                    = 1'b1;
      decd_fp0_srcf1_vld                    = 1'b1;
      end
    15'b0001110????????: begin  //fdiv.h
      decd_fp0_inst_type[TYPE_WIDTH-1:0]    = PIPE6;
      decd_fp0_dstf_vld                     = 1'b1;
      decd_fp0_dste_vld                     = 1'b1;
      decd_fp0_srcf0_vld                    = 1'b1;
      decd_fp0_srcf1_vld                    = 1'b1;
      end
    15'b010111000000???: begin  //fsqrt.h
      decd_fp0_inst_type[TYPE_WIDTH-1:0]    = PIPE6;
      decd_fp0_dstf_vld                     = 1'b1;
      decd_fp0_dste_vld                     = 1'b1;
      decd_fp0_srcf0_vld                    = 1'b1;
      decd_fp0_srcf1_vld                    = 1'b0;
      end
    15'b0010010?????000: begin  //fsgnj.h
      decd_fp0_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_fp0_dstf_vld                     = 1'b1;
      decd_fp0_srcf0_vld                    = 1'b1;
      decd_fp0_srcf1_vld                    = 1'b1;
      end
    15'b0010010?????001: begin  //fsgnjn.h
      decd_fp0_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_fp0_dstf_vld                     = 1'b1;
      decd_fp0_srcf0_vld                    = 1'b1;
      decd_fp0_srcf1_vld                    = 1'b1;
      end
    15'b0010010?????010: begin  //fsgnjx.h
      decd_fp0_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_fp0_dstf_vld                     = 1'b1;
      decd_fp0_srcf0_vld                    = 1'b1;
      decd_fp0_srcf1_vld                    = 1'b1;
      end
    15'b0010110?????000: begin  //fmin.h
      decd_fp0_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_fp0_dstf_vld                     = 1'b1;
      decd_fp0_dste_vld                     = 1'b1;
      decd_fp0_srcf0_vld                    = 1'b1;
      decd_fp0_srcf1_vld                    = 1'b1;
      end
    15'b0010110?????001: begin  //fmax.h
      decd_fp0_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_fp0_dstf_vld                     = 1'b1;
      decd_fp0_dste_vld                     = 1'b1;
      decd_fp0_srcf0_vld                    = 1'b1;
      decd_fp0_srcf1_vld                    = 1'b1;
      end
    15'b110001000000???: begin  //fcvt.w.h
      end
    15'b110001000001???: begin  //fcvt.wu.h
      end
    15'b111001000000000: begin  //fmv.x.h
      decd_fp0_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_fp0_dst_vld                      = 1'b1;
      decd_fp0_srcf0_vld                    = 1'b1;
      end
    15'b1010010?????010: begin //feq.h
      decd_fp0_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_fp0_dst_vld                      = 1'b1;
      decd_fp0_dste_vld                      = 1'b1;
      decd_fp0_srcf0_vld                    = 1'b1;
      decd_fp0_srcf1_vld                    = 1'b1;
      end
    15'b1010010?????001: begin //flt.h
      decd_fp0_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_fp0_dst_vld                      = 1'b1;
      decd_fp0_dste_vld                      = 1'b1;
      decd_fp0_srcf0_vld                    = 1'b1;
      decd_fp0_srcf1_vld                    = 1'b1;
      end
    15'b1010010?????000: begin //fle.h
      decd_fp0_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_fp0_dst_vld                      = 1'b1;
      decd_fp0_dste_vld                      = 1'b1;
      decd_fp0_srcf0_vld                    = 1'b1;
      decd_fp0_srcf1_vld                    = 1'b1;
      end
    15'b111001000000001: begin //fclass.h
      decd_fp0_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_fp0_dst_vld                      = 1'b1;
      decd_fp0_srcf0_vld                    = 1'b1;
      end
    15'b110101000000???: begin //fcvt.h.w
      //deal in split
      end
    15'b110101000001???: begin //fcvt.h.wu
      //deal in split
      end
    15'b111101000000000: begin  //fmv.h.x
      decd_fp0_inst_type[TYPE_WIDTH-1:0]    = ALU;
      decd_fp0_dstf_vld                     = 1'b1;
      decd_fp0_src0_vld                     = 1'b1;
      end
    15'b110001000010???: begin //fcvt.l.h
      //deal in split
      end
    15'b110001000011???: begin //fcvt.lu.h
      //deal in split
      end
    15'b110101000010???: begin //fcvt.h.l
      //deal in split
      end
    15'b110101000011???: begin //fcvt.h.lu
      //deal in split
      end
    15'b010000000010???: begin //fcvt.s.h
      decd_fp0_inst_type[TYPE_WIDTH-1:0]    = PIPE7;
      decd_fp0_dstf_vld                     = 1'b1;
      decd_fp0_dste_vld                     = 1'b1;
      decd_fp0_srcf0_vld                    = 1'b1;
      decd_fp0_srcf1_vld                    = 1'b0;
      end
    15'b010001000000???: begin //fcvt.h.s
      decd_fp0_inst_type[TYPE_WIDTH-1:0]    = PIPE7;
      decd_fp0_dstf_vld                     = 1'b1;
      decd_fp0_dste_vld                     = 1'b1;
      decd_fp0_srcf0_vld                    = 1'b1;
      decd_fp0_srcf1_vld                    = 1'b0;
      end
    15'b010000100010???: begin //fcvt.d.h
      decd_fp0_inst_type[TYPE_WIDTH-1:0]    = PIPE7;
      decd_fp0_dstf_vld                     = 1'b1;
      decd_fp0_dste_vld                     = 1'b1;
      decd_fp0_srcf0_vld                    = 1'b1;
      decd_fp0_srcf1_vld                    = 1'b0;
      end
    15'b010001000001???: begin //fcvt.h.d
      decd_fp0_inst_type[TYPE_WIDTH-1:0]    = PIPE7;
      decd_fp0_dstf_vld                     = 1'b1;
      decd_fp0_dste_vld                     = 1'b1;
      decd_fp0_srcf0_vld                    = 1'b1;
      decd_fp0_srcf1_vld                    = 1'b0;
      end

    15'b0000000????????: begin  //fadd.s
      decd_fp0_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_fp0_dstf_vld                     = 1'b1;
      decd_fp0_dste_vld                     = 1'b1;
      decd_fp0_srcf0_vld                    = 1'b1;
      decd_fp0_srcf1_vld                    = 1'b1;
      end
    15'b0000100????????: begin  //fsub.s
      decd_fp0_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_fp0_dstf_vld                     = 1'b1;
      decd_fp0_dste_vld                     = 1'b1;
      decd_fp0_srcf0_vld                    = 1'b1;
      decd_fp0_srcf1_vld                    = 1'b1;
      end
    15'b0001000????????: begin  //fmul.s
      decd_fp0_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_fp0_dstf_vld                     = 1'b1;
      decd_fp0_dste_vld                     = 1'b1;
      decd_fp0_srcf0_vld                    = 1'b1;
      decd_fp0_srcf1_vld                    = 1'b1;
      end
    15'b0001100????????: begin  //fdiv.s
      decd_fp0_inst_type[TYPE_WIDTH-1:0]    = PIPE6;
      decd_fp0_dstf_vld                     = 1'b1;
      decd_fp0_dste_vld                     = 1'b1;
      decd_fp0_srcf0_vld                    = 1'b1;
      decd_fp0_srcf1_vld                    = 1'b1;
      end
    15'b010110000000???: begin  //fsqrt.s
      decd_fp0_inst_type[TYPE_WIDTH-1:0]    = PIPE6;
      decd_fp0_dstf_vld                     = 1'b1;
      decd_fp0_dste_vld                     = 1'b1;
      decd_fp0_srcf0_vld                    = 1'b1;
      decd_fp0_srcf1_vld                    = 1'b0;
      end
    15'b0010000?????000: begin  //fsgnj.s
      decd_fp0_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_fp0_dstf_vld                     = 1'b1;
      decd_fp0_srcf0_vld                    = 1'b1;
      decd_fp0_srcf1_vld                    = 1'b1;
      end
    15'b0010000?????001: begin  //fsgnjn.s
      decd_fp0_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_fp0_dstf_vld                     = 1'b1;
      decd_fp0_srcf0_vld                    = 1'b1;
      decd_fp0_srcf1_vld                    = 1'b1;
      end
    15'b0010000?????010: begin //fsgnjx.s
      decd_fp0_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_fp0_dstf_vld                     = 1'b1;
      decd_fp0_srcf0_vld                    = 1'b1;
      decd_fp0_srcf1_vld                    = 1'b1;
      end
    15'b0010100?????000: begin //fmin.s
      decd_fp0_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_fp0_dstf_vld                     = 1'b1;
      decd_fp0_dste_vld                     = 1'b1;
      decd_fp0_srcf0_vld                    = 1'b1;
      decd_fp0_srcf1_vld                    = 1'b1;
      end
    15'b0010100?????001: begin //fmax.s
      decd_fp0_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_fp0_dstf_vld                     = 1'b1;
      decd_fp0_dste_vld                     = 1'b1;
      decd_fp0_srcf0_vld                    = 1'b1;
      decd_fp0_srcf1_vld                    = 1'b1;
      end
    15'b110000000000???: begin //fcvt.w.s
      //deal in split
      end
    15'b110000000001???: begin //fcvt.wu.s
      //deal in split
      end
    15'b111000000000000: begin //fmv.x.w
      decd_fp0_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_fp0_dst_vld                      = 1'b1;
      decd_fp0_srcf0_vld                    = 1'b1;
      end
    15'b1010000?????010: begin //feq.s
      decd_fp0_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_fp0_dst_vld                      = 1'b1;
      decd_fp0_dste_vld                      = 1'b1;
      decd_fp0_srcf0_vld                    = 1'b1;
      decd_fp0_srcf1_vld                    = 1'b1;
      end
    15'b1010000?????001: begin //flt.s
      decd_fp0_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_fp0_dst_vld                      = 1'b1;
      decd_fp0_dste_vld                      = 1'b1;
      decd_fp0_srcf0_vld                    = 1'b1;
      decd_fp0_srcf1_vld                    = 1'b1;
      end
    15'b1010000?????000: begin //fle.s
      decd_fp0_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_fp0_dst_vld                      = 1'b1;
      decd_fp0_dste_vld                      = 1'b1;
      decd_fp0_srcf0_vld                    = 1'b1;
      decd_fp0_srcf1_vld                    = 1'b1;
      end
    15'b111000000000001: begin //fclass.s
      decd_fp0_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_fp0_dst_vld                      = 1'b1;
      decd_fp0_srcf0_vld                    = 1'b1;
      end
    15'b110100000000???: begin //fcvt.s.w
      //deal in split
      end
    15'b110100000001???: begin //fcvt.s.wu
      //deal in split
      end
    15'b111100000000000: begin  //fmv.w.x
      decd_fp0_inst_type[TYPE_WIDTH-1:0]    = ALU;
      decd_fp0_dstf_vld                     = 1'b1;
      decd_fp0_src0_vld                     = 1'b1;
      end
    15'b110000000010???: begin //fcvt.l.s
      //deal in split
      end
    15'b110000000011???: begin //fcvt.lu.s
      //deal in split
      end
    15'b110100000010???: begin //fcvt.s.l
      //deal in split
      end
    15'b110100000011???: begin //fcvt.s.lu
      //deal in split
      end
    15'b0000001????????: begin  //fadd.d
      decd_fp0_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_fp0_dstf_vld                     = 1'b1;
      decd_fp0_dste_vld                     = 1'b1;
      decd_fp0_srcf0_vld                    = 1'b1;
      decd_fp0_srcf1_vld                    = 1'b1;
      end
    15'b0000101????????: begin  //fsub.d
      decd_fp0_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_fp0_dstf_vld                     = 1'b1;
      decd_fp0_dste_vld                     = 1'b1;
      decd_fp0_srcf0_vld                    = 1'b1;
      decd_fp0_srcf1_vld                    = 1'b1;
      end
    15'b0001001????????: begin  //fmul.d
      decd_fp0_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_fp0_dstf_vld                     = 1'b1;
      decd_fp0_dste_vld                     = 1'b1;
      decd_fp0_srcf0_vld                    = 1'b1;
      decd_fp0_srcf1_vld                    = 1'b1;
      end
    15'b0001101????????: begin  //fdiv.d
      decd_fp0_inst_type[TYPE_WIDTH-1:0]    = PIPE6;
      decd_fp0_dstf_vld                     = 1'b1;
      decd_fp0_dste_vld                     = 1'b1;
      decd_fp0_srcf0_vld                    = 1'b1;
      decd_fp0_srcf1_vld                    = 1'b1;
      end
    15'b010110100000???: begin  //fsqrt.d
      decd_fp0_inst_type[TYPE_WIDTH-1:0]    = PIPE6;
      decd_fp0_dstf_vld                     = 1'b1;
      decd_fp0_dste_vld                     = 1'b1;
      decd_fp0_srcf0_vld                    = 1'b1;
      decd_fp0_srcf1_vld                    = 1'b0;
      end
    15'b0010001?????000: begin  //fsgnj.d
      decd_fp0_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_fp0_dstf_vld                     = 1'b1;
      decd_fp0_srcf0_vld                    = 1'b1;
      decd_fp0_srcf1_vld                    = 1'b1;
      end
    15'b0010001?????001: begin  //fsgnjn.d
      decd_fp0_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_fp0_dstf_vld                     = 1'b1;
      decd_fp0_srcf0_vld                    = 1'b1;
      decd_fp0_srcf1_vld                    = 1'b1;
      end
    15'b0010001?????010: begin //fsgnjx.d
      decd_fp0_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_fp0_dstf_vld                     = 1'b1;
      decd_fp0_srcf0_vld                    = 1'b1;
      decd_fp0_srcf1_vld                    = 1'b1;
      end
    15'b0010101?????000: begin //fmin.d
      decd_fp0_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_fp0_dstf_vld                     = 1'b1;
      decd_fp0_dste_vld                     = 1'b1;
      decd_fp0_srcf0_vld                    = 1'b1;
      decd_fp0_srcf1_vld                    = 1'b1;
      end
    15'b0010101?????001: begin //fmax.d
      decd_fp0_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_fp0_dstf_vld                     = 1'b1;
      decd_fp0_dste_vld                     = 1'b1;
      decd_fp0_srcf0_vld                    = 1'b1;
      decd_fp0_srcf1_vld                    = 1'b1;
      end
    15'b010000000001???: begin //fcvt.s.d
      decd_fp0_inst_type[TYPE_WIDTH-1:0]    = PIPE7;
      decd_fp0_dstf_vld                     = 1'b1;
      decd_fp0_dste_vld                     = 1'b1;
      decd_fp0_srcf0_vld                    = 1'b1;
      decd_fp0_srcf1_vld                    = 1'b0;
      end
    15'b010000100000???: begin //fcvt.d.s
      decd_fp0_inst_type[TYPE_WIDTH-1:0]    = PIPE7;
      decd_fp0_dstf_vld                     = 1'b1;
      decd_fp0_dste_vld                     = 1'b1;
      decd_fp0_srcf0_vld                    = 1'b1;
      decd_fp0_srcf1_vld                    = 1'b0;
      end
    15'b1010001?????010: begin //feq.d
      decd_fp0_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_fp0_dst_vld                      = 1'b1;
      decd_fp0_dste_vld                      = 1'b1;
      decd_fp0_srcf0_vld                    = 1'b1;
      decd_fp0_srcf1_vld                    = 1'b1;
      end
    15'b1010001?????001: begin //flt.d
      decd_fp0_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_fp0_dst_vld                      = 1'b1;
      decd_fp0_dste_vld                      = 1'b1;
      decd_fp0_srcf0_vld                    = 1'b1;
      decd_fp0_srcf1_vld                    = 1'b1;
      end
    15'b1010001?????000: begin //fle.d
      decd_fp0_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_fp0_dst_vld                      = 1'b1;
      decd_fp0_dste_vld                      = 1'b1;
      decd_fp0_srcf0_vld                    = 1'b1;
      decd_fp0_srcf1_vld                    = 1'b1;
      end
    15'b111000100000001: begin //fclass.d
      decd_fp0_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_fp0_dst_vld                      = 1'b1;
      decd_fp0_srcf0_vld                    = 1'b1;
      end
    15'b110000100000???: begin //fcvt.w.d
      //deal in split
      end
    15'b110000100001???: begin //fcvt.wu.d
      //deal in split
      end
    15'b110100100000???: begin //fcvt.d.w
      //deal in split
      end
    15'b110100100001???: begin //fcvt.d.wu
      //deal in split
      end
    15'b110000100010???: begin //fcvt.l.d
      //deal in split
      end
    15'b110000100011???: begin //fcvt.lu.d
      //deal in split
      end
    15'b111000100000000: begin //fmv.x.d
      decd_fp0_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_fp0_dst_vld                      = 1'b1;
      decd_fp0_srcf0_vld                    = 1'b1;
      end
    15'b110100100010???: begin //fcvt.d.l
      //deal in split
      end
    15'b110100100011???: begin //fcvt.d.lu
      //deal in split
      end
    15'b111100100000000: begin  //fmv.d.x
      decd_fp0_inst_type[TYPE_WIDTH-1:0]    = ALU;
      decd_fp0_dstf_vld                     = 1'b1;
      decd_fp0_src0_vld                     = 1'b1;
      end
    default:             begin  //invalid instruction
      //deal in fence
      decd_fp0_illegal                      = 1'b1;  //invalid instruction exception
    end
  endcase
// &CombEnd; @1967
end


//----------------------------------------------------------
//       FP part1 Full Decoder(fused multiply add)
//----------------------------------------------------------
// &CombBeg; @1974
always @( x_inst[4:2]
       or x_inst[26:25])
begin
  //initialize decoded information value
  decd_fp1_inst_type[TYPE_WIDTH-1:0]    = {TYPE_WIDTH{1'b0}};
  //operand prepare information: valid, and types
  decd_fp1_dst_vld                      = 1'b0;
  decd_fp1_dstf_vld                     = 1'b0;
  decd_fp1_dste_vld                     = 1'b0;
  decd_fp1_src0_vld                     = 1'b0;
  decd_fp1_srcf0_vld                    = 1'b0;
  decd_fp1_srcf1_vld                    = 1'b0;
  decd_fp1_srcf2_vld                    = 1'b0;
  //illegal instruction
  decd_fp1_illegal                      = 1'b0;

  casez({x_inst[26:25], x_inst[4:2]})
    5'b10000: begin //fmadd.h
      decd_fp1_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_fp1_dstf_vld                     = 1'b1;
      decd_fp1_dste_vld                     = 1'b1;
      decd_fp1_srcf0_vld                    = 1'b1;
      decd_fp1_srcf1_vld                    = 1'b1;
      decd_fp1_srcf2_vld                    = 1'b1;
      end
    5'b10001: begin //fmsub.h
      decd_fp1_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_fp1_dstf_vld                     = 1'b1;
      decd_fp1_dste_vld                     = 1'b1;
      decd_fp1_srcf0_vld                    = 1'b1;
      decd_fp1_srcf1_vld                    = 1'b1;
      decd_fp1_srcf2_vld                    = 1'b1;
      end
    5'b10010: begin //fnmsub.h
      decd_fp1_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_fp1_dstf_vld                     = 1'b1;
      decd_fp1_dste_vld                     = 1'b1;
      decd_fp1_srcf0_vld                    = 1'b1;
      decd_fp1_srcf1_vld                    = 1'b1;
      decd_fp1_srcf2_vld                    = 1'b1;
      end
    5'b10011: begin //fnmadd.h
      decd_fp1_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_fp1_dstf_vld                     = 1'b1;
      decd_fp1_dste_vld                     = 1'b1;
      decd_fp1_srcf0_vld                    = 1'b1;
      decd_fp1_srcf1_vld                    = 1'b1;
      decd_fp1_srcf2_vld                    = 1'b1;
      end
    5'b00000: begin //fmadd.s
      decd_fp1_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_fp1_dstf_vld                     = 1'b1;
      decd_fp1_dste_vld                     = 1'b1;
      decd_fp1_srcf0_vld                    = 1'b1;
      decd_fp1_srcf1_vld                    = 1'b1;
      decd_fp1_srcf2_vld                    = 1'b1;
      end
    5'b00001: begin //fmsub.s
      decd_fp1_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_fp1_dstf_vld                     = 1'b1;
      decd_fp1_dste_vld                     = 1'b1;
      decd_fp1_srcf0_vld                    = 1'b1;
      decd_fp1_srcf1_vld                    = 1'b1;
      decd_fp1_srcf2_vld                    = 1'b1;
      end
    5'b00010: begin //fnmsub.s
      decd_fp1_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_fp1_dstf_vld                     = 1'b1;
      decd_fp1_dste_vld                     = 1'b1;
      decd_fp1_srcf0_vld                    = 1'b1;
      decd_fp1_srcf1_vld                    = 1'b1;
      decd_fp1_srcf2_vld                    = 1'b1;
      end
    5'b00011: begin //fnmadd.s
      decd_fp1_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_fp1_dstf_vld                     = 1'b1;
      decd_fp1_dste_vld                     = 1'b1;
      decd_fp1_srcf0_vld                    = 1'b1;
      decd_fp1_srcf1_vld                    = 1'b1;
      decd_fp1_srcf2_vld                    = 1'b1;
      end
    5'b01000: begin //fmadd.d
      decd_fp1_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_fp1_dstf_vld                     = 1'b1;
      decd_fp1_dste_vld                     = 1'b1;
      decd_fp1_srcf0_vld                    = 1'b1;
      decd_fp1_srcf1_vld                    = 1'b1;
      decd_fp1_srcf2_vld                    = 1'b1;
      end
    5'b01001: begin //fmsub.d
      decd_fp1_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_fp1_dstf_vld                     = 1'b1;
      decd_fp1_dste_vld                     = 1'b1;
      decd_fp1_srcf0_vld                    = 1'b1;
      decd_fp1_srcf1_vld                    = 1'b1;
      decd_fp1_srcf2_vld                    = 1'b1;
      end
    5'b01010: begin //fnmsub.d
      decd_fp1_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_fp1_dstf_vld                     = 1'b1;
      decd_fp1_dste_vld                     = 1'b1;
      decd_fp1_srcf0_vld                    = 1'b1;
      decd_fp1_srcf1_vld                    = 1'b1;
      decd_fp1_srcf2_vld                    = 1'b1;
      end
    5'b01011: begin //fnmadd.d
      decd_fp1_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_fp1_dstf_vld                     = 1'b1;
      decd_fp1_dste_vld                     = 1'b1;
      decd_fp1_srcf0_vld                    = 1'b1;
      decd_fp1_srcf1_vld                    = 1'b1;
      decd_fp1_srcf2_vld                    = 1'b1;
      end
    default:             begin  //invalid instruction
      //deal in fence
      decd_fp1_illegal                      = 1'b1;  //invalid instruction exception
    end
  endcase
// &CombEnd; @2090
end

assign decd_fp0_sel = x_inst[6:0] == 7'b1010011;
assign decd_fp1_sel = {x_inst[6:4],x_inst[1:0]} == 5'b10011;

// &CombBeg; @2095
always @( decd_fp1_dst_vld
       or decd_fp1_dste_vld
       or decd_fp1_illegal
       or decd_fp1_sel
       or decd_fp1_srcf2_vld
       or decd_fp0_srcf1_vld
       or decd_fp0_inst_type[9:0]
       or decd_fp1_inst_type[9:0]
       or decd_fp0_src0_vld
       or decd_fp0_illegal
       or decd_fp0_dstf_vld
       or decd_fp0_sel
       or decd_fp1_dstf_vld
       or decd_fp0_dst_vld
       or decd_fp0_srcf0_vld
       or decd_fp1_srcf1_vld
       or decd_fp1_src0_vld
       or decd_fp1_srcf0_vld
       or decd_fp0_dste_vld)
begin
  case({decd_fp1_sel,decd_fp0_sel})
    2'h1: begin
      decd_fp_inst_type[TYPE_WIDTH-1:0] = decd_fp0_inst_type[TYPE_WIDTH-1:0];
      decd_fp_dst_vld                   = decd_fp0_dst_vld;
      decd_fp_dstf_vld                  = decd_fp0_dstf_vld;
      decd_fp_dste_vld                  = decd_fp0_dste_vld;
      decd_fp_src0_vld                  = decd_fp0_src0_vld;
      decd_fp_src1_vld                  = 1'b0;
      decd_fp_srcf0_vld                 = decd_fp0_srcf0_vld;
      decd_fp_srcf1_vld                 = decd_fp0_srcf1_vld;
      decd_fp_srcf2_vld                 = 1'b0;
      decd_fp_inst_illegal              = decd_fp0_illegal;
    end
    2'h2: begin
      decd_fp_inst_type[TYPE_WIDTH-1:0] = decd_fp1_inst_type[TYPE_WIDTH-1:0];
      decd_fp_dst_vld                   = decd_fp1_dst_vld;
      decd_fp_dstf_vld                  = decd_fp1_dstf_vld;
      decd_fp_dste_vld                  = decd_fp1_dste_vld;
      decd_fp_src0_vld                  = decd_fp1_src0_vld;
      decd_fp_src1_vld                  = 1'b0;
      decd_fp_srcf0_vld                 = decd_fp1_srcf0_vld;
      decd_fp_srcf1_vld                 = decd_fp1_srcf1_vld;
      decd_fp_srcf2_vld                 = decd_fp1_srcf2_vld;
      decd_fp_inst_illegal              = decd_fp1_illegal;
    end
    default: begin
      decd_fp_inst_type[TYPE_WIDTH-1:0] = {TYPE_WIDTH{1'bx}};
      decd_fp_dst_vld                   = 1'bx;
      decd_fp_dstf_vld                  = 1'bx;
      decd_fp_dste_vld                  = 1'bx;
      decd_fp_src0_vld                  = 1'bx;
      decd_fp_src1_vld                  = 1'bx;
      decd_fp_srcf0_vld                 = 1'bx;
      decd_fp_srcf1_vld                 = 1'bx;
      decd_fp_srcf2_vld                 = 1'bx;
      decd_fp_inst_illegal              = 1'bx;
    end
  endcase
// &CombEnd; @2134
end

//----------------------------------------------------------
//              Cache Extension Full Decoder
//----------------------------------------------------------
// &CombBeg; @2139
always @( x_inst[25:15])
begin
  //initialize decoded information value
  decd_cache_inst_type[TYPE_WIDTH-1:0]    = {TYPE_WIDTH{1'b0}};
  //operand prepare information: valid, and types
  decd_cache_src0_vld                     = 1'b0;
  //illegal instruction
  decd_cache_illegal                      = 1'b0;

  casez({x_inst[25],x_inst[24:20],x_inst[19:15]})
    //32-bits instructions decode logic
    11'b0_00010_00000:begin //dcache.iall
      decd_cache_inst_type[TYPE_WIDTH-1:0]    = LSU;
      end
    11'b0_00001_00000:begin //dcache.call
      decd_cache_inst_type[TYPE_WIDTH-1:0]    = LSU;
      end
    11'b0_00011_00000:begin //dcache.ciall
      decd_cache_inst_type[TYPE_WIDTH-1:0]    = LSU;
      end
    11'b1_00010_?????:begin //dcache.isw
      decd_cache_inst_type[TYPE_WIDTH-1:0]    = LSU;
      decd_cache_src0_vld                     = 1'b1;
      end
    11'b1_00001_?????:begin //dcache.csw
      decd_cache_inst_type[TYPE_WIDTH-1:0]    = LSU;
      decd_cache_src0_vld                     = 1'b1;
      end
    11'b1_00011_?????:begin //dcache.cisw
      decd_cache_inst_type[TYPE_WIDTH-1:0]    = LSU;
      decd_cache_src0_vld                     = 1'b1;
      end
    11'b1_00110_?????:begin //dcache.iva
      decd_cache_inst_type[TYPE_WIDTH-1:0]    = LSU;
      decd_cache_src0_vld                     = 1'b1;
      end
    11'b1_00101_?????:begin //dcache.cva
      decd_cache_inst_type[TYPE_WIDTH-1:0]    = LSU;
      decd_cache_src0_vld                     = 1'b1;
      end
    11'b1_00100_?????:begin //dcache.cval1
      decd_cache_inst_type[TYPE_WIDTH-1:0]    = LSU;
      decd_cache_src0_vld                     = 1'b1;
      end
    11'b1_00111_?????:begin //dcache.civa
      decd_cache_inst_type[TYPE_WIDTH-1:0]    = LSU;
      decd_cache_src0_vld                     = 1'b1;
      end
    11'b1_01010_?????:begin //dcache.ipa
      decd_cache_inst_type[TYPE_WIDTH-1:0]    = LSU;
      decd_cache_src0_vld                     = 1'b1;
      end
    11'b1_01001_?????:begin //dcache.cpa
      decd_cache_inst_type[TYPE_WIDTH-1:0]    = LSU;
      decd_cache_src0_vld                     = 1'b1;
      end
    11'b1_01000_?????:begin //dcache.cpal1
      decd_cache_inst_type[TYPE_WIDTH-1:0]    = LSU;
      decd_cache_src0_vld                     = 1'b1;
      end
    11'b1_01011_?????:begin //dcache.cipa
      decd_cache_inst_type[TYPE_WIDTH-1:0]    = LSU;
      decd_cache_src0_vld                     = 1'b1;
      end
    11'b0_10000_00000:begin //icache.iall
      decd_cache_inst_type[TYPE_WIDTH-1:0]    = LSU;
      end
    11'b0_10001_00000:begin //icache.ialls
      decd_cache_inst_type[TYPE_WIDTH-1:0]    = LSU;
      end
    11'b1_10000_?????:begin //icache.iva
      decd_cache_inst_type[TYPE_WIDTH-1:0]    = LSU;
      decd_cache_src0_vld                     = 1'b1;
      end
    11'b1_11000_?????:begin //icache.ipa
      decd_cache_inst_type[TYPE_WIDTH-1:0]    = LSU;
      decd_cache_src0_vld                     = 1'b1;
      end
    11'b0_10110_00000:begin //l2cache.iall
      decd_cache_inst_type[TYPE_WIDTH-1:0]    = LSU;
      end
    11'b0_10101_00000:begin //l2cache.call
      decd_cache_inst_type[TYPE_WIDTH-1:0]    = LSU;
      end
    11'b0_10111_00000:begin //l2cache.ciall
      decd_cache_inst_type[TYPE_WIDTH-1:0]    = LSU;
      end
    11'b0_11000_00000:begin //sync
      decd_cache_inst_type[TYPE_WIDTH-1:0]    = LSU;
      end
    11'b0_11001_00000:begin //sync.s
      decd_cache_inst_type[TYPE_WIDTH-1:0]    = LSU;
      end
    11'b0_11010_00000:begin //sync.i
      decd_cache_inst_type[TYPE_WIDTH-1:0]    = LSU;
      end
    11'b0_11011_00000:begin //sync.is
      decd_cache_inst_type[TYPE_WIDTH-1:0]    = LSU;
      end
    default: begin                //invalid instruction
      //deal in fence
      decd_cache_illegal                      = 1'b1;  //invalid instruction exception
    end
  endcase
// &CombEnd; @2242
end

//----------------------------------------------------------
//           Performance Extension Full Decoder
//----------------------------------------------------------
// &CombBeg; @2247
always @( x_inst[14:12]
       or x_inst[31:25])
begin
  //initialize decoded information value
  decd_perf_inst_type[TYPE_WIDTH-1:0]    = {TYPE_WIDTH{1'b0}};
  //operand prepare information: valid, and types
  decd_perf_src0_vld                     = 1'b0;
  decd_perf_src1_vld                     = 1'b0;
  decd_perf_src2_vld                     = 1'b0;
  decd_perf_dst_vld                      = 1'b0;
  decd_perf_srcf1_vld                    = 1'b0;
  decd_perf_srcf2_vld                    = 1'b0;
  decd_perf_dstf_vld                     = 1'b0;
  //illegal instruction
  decd_perf_illegal                      = 1'b0;

  casez({x_inst[31:25],x_inst[14:12]})
    //32-bits instructions decode logic
    10'b00000??001:begin //addsl
      decd_perf_inst_type[TYPE_WIDTH-1:0]    = ALU;
      decd_perf_src0_vld                     = 1'b1;
      decd_perf_src1_vld                     = 1'b1;
      decd_perf_dst_vld                      = 1'b1;
      end
    10'b000100?001:begin //srri
      decd_perf_inst_type[TYPE_WIDTH-1:0]    = ALU;
      decd_perf_src0_vld                     = 1'b1;
      decd_perf_dst_vld                      = 1'b1;
      end
    10'b0001010001:begin //srriw
      decd_perf_inst_type[TYPE_WIDTH-1:0]    = ALU;
      decd_perf_src0_vld                     = 1'b1;
      decd_perf_dst_vld                      = 1'b1;
      end
    10'b1000000001:begin //tstnbz
      decd_perf_inst_type[TYPE_WIDTH-1:0]    = ALU;
      decd_perf_src0_vld                     = 1'b1;
      decd_perf_dst_vld                      = 1'b1;
      end
    10'b1000001001:begin //rev
      decd_perf_inst_type[TYPE_WIDTH-1:0]    = ALU;
      decd_perf_src0_vld                     = 1'b1;
      decd_perf_dst_vld                      = 1'b1;
      end
    10'b1000010001:begin //ff0
      decd_perf_inst_type[TYPE_WIDTH-1:0]    = ALU;
      decd_perf_src0_vld                     = 1'b1;
      decd_perf_dst_vld                      = 1'b1;
      end
    10'b1000011001:begin //ff1
      decd_perf_inst_type[TYPE_WIDTH-1:0]    = ALU;
      decd_perf_src0_vld                     = 1'b1;
      decd_perf_dst_vld                      = 1'b1;
      end
    10'b100010?001:begin //tst
      decd_perf_inst_type[TYPE_WIDTH-1:0]    = ALU;
      decd_perf_src0_vld                     = 1'b1;
      decd_perf_dst_vld                      = 1'b1;
      end
    10'b1001000001:begin //revw
      decd_perf_inst_type[TYPE_WIDTH-1:0]    = ALU;
      decd_perf_src0_vld                     = 1'b1;
      decd_perf_dst_vld                      = 1'b1;
      end
    10'b0100000001:begin //mveqz
      decd_perf_inst_type[TYPE_WIDTH-1:0]    = ALU;
      decd_perf_src0_vld                     = 1'b1;
      decd_perf_src1_vld                     = 1'b1;
      decd_perf_src2_vld                     = 1'b1;
      decd_perf_dst_vld                      = 1'b1;
      end
    10'b0100001001:begin //mvnez
      decd_perf_inst_type[TYPE_WIDTH-1:0]    = ALU;
      decd_perf_src0_vld                     = 1'b1;
      decd_perf_src1_vld                     = 1'b1;
      decd_perf_src2_vld                     = 1'b1;
      decd_perf_dst_vld                      = 1'b1;
      end
    10'b0010000001:begin //mula
      decd_perf_inst_type[TYPE_WIDTH-1:0]    = MULT;
      decd_perf_src0_vld                     = 1'b1;
      decd_perf_src1_vld                     = 1'b1;
      decd_perf_src2_vld                     = 1'b1;
      decd_perf_dst_vld                      = 1'b1;
      end
    10'b0010001001:begin //muls
      decd_perf_inst_type[TYPE_WIDTH-1:0]    = MULT;
      decd_perf_src0_vld                     = 1'b1;
      decd_perf_src1_vld                     = 1'b1;
      decd_perf_src2_vld                     = 1'b1;
      decd_perf_dst_vld                      = 1'b1;
      end
    10'b0010010001:begin //mulaw
      decd_perf_inst_type[TYPE_WIDTH-1:0]    = MULT;
      decd_perf_src0_vld                     = 1'b1;
      decd_perf_src1_vld                     = 1'b1;
      decd_perf_src2_vld                     = 1'b1;
      decd_perf_dst_vld                      = 1'b1;
      end
    10'b0010011001:begin //mulsw
      decd_perf_inst_type[TYPE_WIDTH-1:0]    = MULT;
      decd_perf_src0_vld                     = 1'b1;
      decd_perf_src1_vld                     = 1'b1;
      decd_perf_src2_vld                     = 1'b1;
      decd_perf_dst_vld                      = 1'b1;
      end
    10'b0010100001:begin //mulah
      decd_perf_inst_type[TYPE_WIDTH-1:0]    = MULT;
      decd_perf_src0_vld                     = 1'b1;
      decd_perf_src1_vld                     = 1'b1;
      decd_perf_src2_vld                     = 1'b1;
      decd_perf_dst_vld                      = 1'b1;
      end
    10'b0010101001:begin //mulsh
      decd_perf_inst_type[TYPE_WIDTH-1:0]    = MULT;
      decd_perf_src0_vld                     = 1'b1;
      decd_perf_src1_vld                     = 1'b1;
      decd_perf_src2_vld                     = 1'b1;
      decd_perf_dst_vld                      = 1'b1;
      end
    10'b???????010:begin //ext
      decd_perf_inst_type[TYPE_WIDTH-1:0]    = ALU;
      decd_perf_src0_vld                     = 1'b1;
      decd_perf_dst_vld                      = 1'b1;
      end
    10'b???????011:begin //extu
      decd_perf_inst_type[TYPE_WIDTH-1:0]    = ALU;
      decd_perf_src0_vld                     = 1'b1;
      decd_perf_dst_vld                      = 1'b1;
      end
    10'b00000??100:begin //lrb
      decd_perf_inst_type[TYPE_WIDTH-1:0]    = LSU;
      decd_perf_src0_vld                     = 1'b1;
      decd_perf_src1_vld                     = 1'b1;
      decd_perf_dst_vld                      = 1'b1;
      end
    10'b00100??100:begin //lrh
      decd_perf_inst_type[TYPE_WIDTH-1:0]    = LSU;
      decd_perf_src0_vld                     = 1'b1;
      decd_perf_src1_vld                     = 1'b1;
      decd_perf_dst_vld                      = 1'b1;
      end
    10'b01000??100:begin //lrw
      decd_perf_inst_type[TYPE_WIDTH-1:0]    = LSU;
      decd_perf_src0_vld                     = 1'b1;
      decd_perf_src1_vld                     = 1'b1;
      decd_perf_dst_vld                      = 1'b1;
      end
    10'b01100??100:begin //lrd
      decd_perf_inst_type[TYPE_WIDTH-1:0]    = LSU;
      decd_perf_src0_vld                     = 1'b1;
      decd_perf_src1_vld                     = 1'b1;
      decd_perf_dst_vld                      = 1'b1;
      end
    10'b10000??100:begin //lrbu
      decd_perf_inst_type[TYPE_WIDTH-1:0]    = LSU;
      decd_perf_src0_vld                     = 1'b1;
      decd_perf_src1_vld                     = 1'b1;
      decd_perf_dst_vld                      = 1'b1;
      end
    10'b10100??100:begin //lrhu
      decd_perf_inst_type[TYPE_WIDTH-1:0]    = LSU;
      decd_perf_src0_vld                     = 1'b1;
      decd_perf_src1_vld                     = 1'b1;
      decd_perf_dst_vld                      = 1'b1;
      end
    10'b11000??100:begin //lrwu
      decd_perf_inst_type[TYPE_WIDTH-1:0]    = LSU;
      decd_perf_src0_vld                     = 1'b1;
      decd_perf_src1_vld                     = 1'b1;
      decd_perf_dst_vld                      = 1'b1;
      end
    10'b00010??100:begin //lurb
      decd_perf_inst_type[TYPE_WIDTH-1:0]    = LSU;
      decd_perf_src0_vld                     = 1'b1;
      decd_perf_src1_vld                     = 1'b1;
      decd_perf_dst_vld                      = 1'b1;
      end
    10'b00110??100:begin //lurh
      decd_perf_inst_type[TYPE_WIDTH-1:0]    = LSU;
      decd_perf_src0_vld                     = 1'b1;
      decd_perf_src1_vld                     = 1'b1;
      decd_perf_dst_vld                      = 1'b1;
      end
    10'b01010??100:begin //lurw
      decd_perf_inst_type[TYPE_WIDTH-1:0]    = LSU;
      decd_perf_src0_vld                     = 1'b1;
      decd_perf_src1_vld                     = 1'b1;
      decd_perf_dst_vld                      = 1'b1;
      end
    10'b01110??100:begin //lurd
      decd_perf_inst_type[TYPE_WIDTH-1:0]    = LSU;
      decd_perf_src0_vld                     = 1'b1;
      decd_perf_src1_vld                     = 1'b1;
      decd_perf_dst_vld                      = 1'b1;
      end
    10'b10010??100:begin //lurbu
      decd_perf_inst_type[TYPE_WIDTH-1:0]    = LSU;
      decd_perf_src0_vld                     = 1'b1;
      decd_perf_src1_vld                     = 1'b1;
      decd_perf_dst_vld                      = 1'b1;
      end
    10'b10110??100:begin //lurhu
      decd_perf_inst_type[TYPE_WIDTH-1:0]    = LSU;
      decd_perf_src0_vld                     = 1'b1;
      decd_perf_src1_vld                     = 1'b1;
      decd_perf_dst_vld                      = 1'b1;
      end
    10'b11010??100:begin //lurwu
      decd_perf_inst_type[TYPE_WIDTH-1:0]    = LSU;
      decd_perf_src0_vld                     = 1'b1;
      decd_perf_src1_vld                     = 1'b1;
      decd_perf_dst_vld                      = 1'b1;
      end
    10'b00001??100:begin //lbib
      //deal in fence / split
      end
    10'b00011??100:begin //lbia
      //deal in fence / split
      end
    10'b00101??100:begin //lhib
      //deal in fence / split
      end
    10'b00111??100:begin //lhia
      //deal in fence / split
      end
    10'b01001??100:begin //lwib
      //deal in fence / split
      end
    10'b01011??100:begin //lwia
      //deal in fence / split
      end
    10'b01101??100:begin //ldib
      //deal in fence / split
      end
    10'b01111??100:begin //ldia
      //deal in fence / split
      end
    10'b10001??100:begin //lbuib
      //deal in fence / split
      end
    10'b10011??100:begin //lbuia
      //deal in fence / split
      end
    10'b10101??100:begin //lhuib
      //deal in fence / split
      end
    10'b10111??100:begin //lhuia
      //deal in fence / split
      end
    10'b11001??100:begin //lwuib
      //deal in fence / split
      end
    10'b11011??100:begin //lwuia
      //deal in fence / split
      end
    10'b11100??100:begin //lwd
      //deal in fence / split
      end
    10'b11110??100:begin //lwud
      //deal in fence / split
      end
    10'b11111??100:begin //ldd
      //deal in fence / split
      end
    10'b00000??101:begin //srb
      decd_perf_inst_type[TYPE_WIDTH-1:0]    = LSU_P5;
      decd_perf_src0_vld                     = 1'b1;
      decd_perf_src1_vld                     = 1'b1;
      decd_perf_src2_vld                     = 1'b1;
      end
    10'b00100??101:begin //srh
      decd_perf_inst_type[TYPE_WIDTH-1:0]    = LSU_P5;
      decd_perf_src0_vld                     = 1'b1;
      decd_perf_src1_vld                     = 1'b1;
      decd_perf_src2_vld                     = 1'b1;
      end
    10'b01000??101:begin //srw
      decd_perf_inst_type[TYPE_WIDTH-1:0]    = LSU_P5;
      decd_perf_src0_vld                     = 1'b1;
      decd_perf_src1_vld                     = 1'b1;
      decd_perf_src2_vld                     = 1'b1;
      end
    10'b01100??101:begin //srd
      decd_perf_inst_type[TYPE_WIDTH-1:0]    = LSU_P5;
      decd_perf_src0_vld                     = 1'b1;
      decd_perf_src1_vld                     = 1'b1;
      decd_perf_src2_vld                     = 1'b1;
      end
    10'b00010??101:begin //surb
      decd_perf_inst_type[TYPE_WIDTH-1:0]    = LSU_P5;
      decd_perf_src0_vld                     = 1'b1;
      decd_perf_src1_vld                     = 1'b1;
      decd_perf_src2_vld                     = 1'b1;
      end
    10'b00110??101:begin //surh
      decd_perf_inst_type[TYPE_WIDTH-1:0]    = LSU_P5;
      decd_perf_src0_vld                     = 1'b1;
      decd_perf_src1_vld                     = 1'b1;
      decd_perf_src2_vld                     = 1'b1;
      end
    10'b01010??101:begin //surw
      decd_perf_inst_type[TYPE_WIDTH-1:0]    = LSU_P5;
      decd_perf_src0_vld                     = 1'b1;
      decd_perf_src1_vld                     = 1'b1;
      decd_perf_src2_vld                     = 1'b1;
      end
    10'b01110??101:begin //surd
      decd_perf_inst_type[TYPE_WIDTH-1:0]    = LSU_P5;
      decd_perf_src0_vld                     = 1'b1;
      decd_perf_src1_vld                     = 1'b1;
      decd_perf_src2_vld                     = 1'b1;
      end
    10'b00001??101:begin //sbib
      //deal in fence / split
      end
    10'b00011??101:begin //sbia
      //deal in fence / split
      end
    10'b00101??101:begin //shib
      //deal in fence / split
      end
    10'b00111??101:begin //shia
      //deal in fence / split
      end
    10'b01001??101:begin //swib
      //deal in fence / split
      end
    10'b01011??101:begin //swia
      //deal in fence / split
      end
    10'b01101??101:begin //sdib
      //deal in fence / split
      end
    10'b01111??101:begin //sdia
      //deal in fence / split
      end
    10'b11100??101:begin //swd
      //deal in fence / split
      end
    10'b11111??101:begin //sdd
      //deal in fence / split
      end
    10'b01000??110:begin //flrw
      decd_perf_inst_type[TYPE_WIDTH-1:0]    = LSU;
      decd_perf_src0_vld                     = 1'b1;
      decd_perf_src1_vld                     = 1'b1;
      decd_perf_dstf_vld                     = 1'b1;
      end
    10'b01100??110:begin //flrd
      decd_perf_inst_type[TYPE_WIDTH-1:0]    = LSU;
      decd_perf_src0_vld                     = 1'b1;
      decd_perf_src1_vld                     = 1'b1;
      decd_perf_dstf_vld                     = 1'b1;
      end
    10'b01010??110:begin //flurw
      decd_perf_inst_type[TYPE_WIDTH-1:0]    = LSU;
      decd_perf_src0_vld                     = 1'b1;
      decd_perf_src1_vld                     = 1'b1;
      decd_perf_dstf_vld                     = 1'b1;
      end
    10'b01110??110:begin //flurd
      decd_perf_inst_type[TYPE_WIDTH-1:0]    = LSU;
      decd_perf_src0_vld                     = 1'b1;
      decd_perf_src1_vld                     = 1'b1;
      decd_perf_dstf_vld                     = 1'b1;
      end
    10'b01000??111:begin //fsrw
      decd_perf_inst_type[TYPE_WIDTH-1:0]    = LSU_P5;
      decd_perf_src0_vld                     = 1'b1;
      decd_perf_src1_vld                     = 1'b1;
      decd_perf_srcf2_vld                    = 1'b1;
      end
    10'b01100??111:begin //fsrd
      decd_perf_inst_type[TYPE_WIDTH-1:0]    = LSU_P5;
      decd_perf_src0_vld                     = 1'b1;
      decd_perf_src1_vld                     = 1'b1;
      decd_perf_srcf2_vld                    = 1'b1;
      end
    10'b01010??111:begin //fsurw
      decd_perf_inst_type[TYPE_WIDTH-1:0]    = LSU_P5;
      decd_perf_src0_vld                     = 1'b1;
      decd_perf_src1_vld                     = 1'b1;
      decd_perf_srcf2_vld                    = 1'b1;
      end
    10'b01110??111:begin //fsurd
      decd_perf_inst_type[TYPE_WIDTH-1:0]    = LSU_P5;
      decd_perf_src0_vld                     = 1'b1;
      decd_perf_src1_vld                     = 1'b1;
      decd_perf_srcf2_vld                    = 1'b1;
      end

    default: begin                //invalid instruction
      //deal in fence
      decd_perf_illegal                      = 1'b1;  //invalid instruction exception
    end
  endcase
// &CombEnd; @2642
end


//==========================================================
//                 Vector inst info
//==========================================================
assign x_vec_inst = 1'b0;
assign x_vec_opivv = (x_inst[14:12] == 3'b000);
assign x_vec_opivx = (x_inst[14:12] == 3'b100);
assign x_vec_opivi = (x_inst[14:12] == 3'b011);
assign x_vec_opmvv = (x_inst[14:12] == 3'b010);
assign x_vec_opmvx = (x_inst[14:12] == 3'b110);
assign x_vec_opfvv = (x_inst[14:12] == 3'b001);
assign x_vec_opfvf = (x_inst[14:12] == 3'b101);
assign x_vec_opcfg = (x_inst[14:12] == 3'b111);

assign decd_inst_vec = x_vec_inst;

assign vec_mfvr_inst = (x_inst[31:26] == 6'b001100) && x_vec_opmvv ||  //vext.x.v
                       (x_inst[31:26] == 6'b010100) && x_vec_opmvv ||  //vmpopc
                       (x_inst[31:26] == 6'b010100) && x_vec_opmvv ||  //vmfirst
                       (x_inst[31:26] == 6'b001100) && x_vec_opfvv;    //vfmv.f.s
//==========================================================
//            Decode Vector Source Register Index
//==========================================================
//----------------------------------------------------------
//               Vector Source Register Index
//----------------------------------------------------------
assign x_srcv0_reg[4:0] = x_srcv0_srcv1_switch ? x_inst[19:15] : x_inst[24:20];
assign x_srcv1_reg[4:0] = x_srcv1_srcv2_switch ? x_inst[11: 7] : x_srcv0_srcv1_switch ? x_inst[24:20] : x_inst[19:15];

assign x_srcv0_srcv1_switch = ((x_inst[31:26]==6'b000010)                     //vsub
                            || (x_inst[31:26]==6'b010010)                     //vsbc
                            || (x_inst[31:26]==6'b010011)                     //vmsbc
                            || (x_inst[31:26]==6'b011010)                     //vmsltu
                            || (x_inst[31:26]==6'b011011)                     //vmslt
                            || (x_inst[31:26]==6'b100010)                     //vssubu
                            || (x_inst[31:26]==6'b100011)                     //vssub
                            || (x_inst[31:26]==6'b100110))&& x_vec_opivv      //vasub
                            ||((x_inst[31:26]==6'b101001)                     //vmadd
                            || (x_inst[31:26]==6'b101011))&& x_vec_opmvv      //vnmsub
                            || (x_inst[31:29]==3'b101   ) && x_vec_opfvv;       //vfmacc 
                           // ||((x_inst[31:26]==6'b110010)                     //vwsubu
                           // || (x_inst[31:26]==6'b110011)                     //vwsub
                           // || (x_inst[31:26]==6'b110110)                     //vwsubu.w
                           // || (x_inst[31:26]==6'b110111))&& x_vec_opmvv      //vwsub.w

assign x_srcv1_srcv2_switch =  (x_inst[31:26] == 6'b100010)
                            &&((x_inst[19:15] == 5'b00000) //vfcvt.xu.f.v
                             ||(x_inst[19:15] == 5'b00001) //vfcvt.x.f.v
                             ||(x_inst[19:15] == 5'b00010) //vfcvt.f.xu.v
                             ||(x_inst[19:15] == 5'b00011))//vfcvt.f.x.v
                             && x_vec_opfvv;
//==========================================================
//            Decode Destination Register Index
//==========================================================
//same like instruction type, the register index has been
//optimazied for timing by ignoring invalid instructions
//so add new instruction should carefully check these logic
assign x_dstv_reg[4:0]   = x_inst[11: 7];

//==========================================================
//                 Illegal inst Decoder
//==========================================================
assign x_vec_vmunary0   =(x_inst[31:26]==6'b010110);
assign x_vec_vfunary0   =(x_inst[31:26]==6'b100010);
assign x_vec_vfunary1   =(x_inst[31:26]==6'b100011);

assign x_vmunary0_vld = (x_inst[19:15] == 5'b00001) //vmbf
                      ||(x_inst[19:15] == 5'b00010) //vmif
                      ||(x_inst[19:15] == 5'b00011) //vmof
                      ||(x_inst[19:15] == 5'b10000) //viota
                      ||(x_inst[19:15] == 5'b10001);//vid

assign x_vfunary0_vld_norm = (x_inst[19:17] == 3'b000);

assign x_vfunary0_vld_wide = (x_inst[19:17] == 3'b010) 
                           ||(x_inst[19:15] == 5'b01100);

assign x_vfunary0_vld_narr = (x_inst[19:17] == 3'b100) 
                           ||(x_inst[19:15] == 5'b10100);

assign x_vfunary0_vld = x_vfunary0_vld_norm || x_vfunary0_vld_wide || x_vfunary0_vld_narr;

assign x_vec_inst_funary=(x_vec_vfunary0 || x_vec_vfunary1) && x_vec_opfvv;

assign x_vec_inst_narr  =(x_inst[31:28]==4'b1011) && (x_vec_opivv || x_vec_opivx || x_vec_opivi) //narrow shift
                      ||  x_vec_vfunary0 && x_inst[19] && (x_vec_opfvv);     //narrow fcvt

assign x_vec_inst_wide_w=(x_inst[31:28]==4'b1101)                    //.w wide
                      && (x_vec_opmvv || x_vec_opmvx || x_vec_opfvv || x_vec_opfvf);

assign x_vec_inst_wide  =(x_inst[31:30]==2'b11)                     //widen inst
                      && (x_vec_opivv || x_vec_opivx || x_vec_opmvv 
                       || x_vec_opmvx || x_vec_opfvv || x_vec_opfvf) 
                       || x_vec_vfunary0 && (x_inst[19:18]==2'b01)  //widen fcnvt           
                      && (x_vec_opfvv);

assign x_vec_inst_mask  = (x_inst[31:30]==2'b01) && (x_vec_opmvv);

assign x_vec_inst_scalar= (x_inst[31:27]==5'b00110)
                       && (x_vec_opmvv || x_vec_opmvx || x_vec_opfvv || x_vec_opfvf);

assign x_vec_inst_vred_n = (x_inst[31:29]==3'b000) && (x_vec_opmvv)
                        || (x_inst[31:29]==3'b000) && x_inst[26] && (x_vec_opfvv);

assign x_vec_inst_vred_w = (x_inst[31:28]==4'b1100)&& (x_vec_opivv)
                        || (x_inst[31:28]==4'b1100) && x_inst[26] && (x_vec_opfvv);

assign x_vec_inst_vred   = x_vec_inst_vred_n || x_vec_inst_vred_w;

assign x_vec_inst_comp = (x_inst[31:28]==4'b0100) && x_inst[26]
                      && (x_vec_opivv || x_vec_opivx || x_vec_opivi)
                      || (x_inst[31:29]==3'b011) 
                      && (x_vec_opivv || x_vec_opivx || x_vec_opivi
                      ||  x_vec_opfvv || x_vec_opfvf); 
//----------------------------------------------------------
//              SRCV0 VREG ILLEGAL JUDGE
//----------------------------------------------------------
assign x_vreg_src0_norm  = !x_vec_inst_narr && !x_vec_inst_wide_w
                        &&!(x_vec_inst_mask && !(x_inst[29:26]==4'b0111)) //not compress inst 
                        && !x_vec_inst_scalar;

assign x_vreg_illegal[0]= x_vec_inst_narr   && x_vreg_ill[3] 
                       || x_vec_inst_wide_w && x_vreg_ill[3]
                       || x_vreg_src0_norm  && x_vreg_ill[0];

//----------------------------------------------------------
//              SRCV1 VREG ILLEGAL JUDGE
//----------------------------------------------------------
assign x_vreg_src1_norm  = !x_vec_inst_mask && !x_vec_inst_vred
                        && !x_vec_inst_scalar && !x_vec_inst_funary
                        &&!(x_vec_opivx || x_vec_opivi || x_vec_opmvx || x_vec_opfvf);

assign x_vreg_illegal[1] = x_vreg_src1_norm && x_vreg_ill[1];

//----------------------------------------------------------
//              DSTV VREG ILLEGAL JUDGE
//----------------------------------------------------------

assign x_vreg_dst_norm = !x_vec_inst_vred &&!x_vec_inst_wide
                      &&(!x_vec_inst_mask || x_vec_inst_vcompress 
                       || x_vec_inst_viota|| x_vec_inst_vid)
                      && !x_vec_inst_scalar
                      && !x_vec_inst_comp;

assign x_vreg_illegal[2]= x_vec_inst_wide && !x_vec_inst_vred_w && x_vreg_ill[4]
                        ||x_vreg_dst_norm && x_vreg_ill[2];

assign decd_vreg_illegal = (|x_vreg_illegal[2:0]) && !x_vec_opcfg;
//----------------------------------------------------------
//               Vreg illegal corncerning LMUL
//----------------------------------------------------------
assign x_vreg_ill[0] = (x_vlmul[1:0]==2'b01) &&  x_inst[20]    ||
                       (x_vlmul[1:0]==2'b10) && |x_inst[21:20] ||
                       (x_vlmul[1:0]==2'b11) && |x_inst[22:20];  //normal src0 vreg misalgin

assign x_vreg_ill[1] = (x_vlmul[1:0]==2'b01) &&  x_inst[15]    ||
                       (x_vlmul[1:0]==2'b10) && |x_inst[16:15] ||
                       (x_vlmul[1:0]==2'b11) && |x_inst[17:15];  //normal src1 vreg misalgin

assign x_vreg_ill[2] = (x_vlmul[1:0]==2'b01) &&  x_inst[7]     ||
                       (x_vlmul[1:0]==2'b10) && |x_inst[8 : 7] ||
                       (x_vlmul[1:0]==2'b11) && |x_inst[9 : 7];  //normal dest vreg misalgin

assign x_vreg_ill[3] = (x_vlmul[1:0]==2'b00) &&  x_inst[20]    ||
                       (x_vlmul[1:0]==2'b01) && |x_inst[21:20] ||
                       (x_vlmul[1:0]==2'b10) && |x_inst[22:20];  //widen/narrow src0 vreg misalgin

assign x_vreg_ill[4] = (x_vlmul[1:0]==2'b00) &&  x_inst[7]     ||
                       (x_vlmul[1:0]==2'b01) && |x_inst[8 : 7] ||
                       (x_vlmul[1:0]==2'b10) && |x_inst[9 : 7];  //widen/narrow dest vreg misalgin


assign x_vec_inst_viota     = x_vec_vmunary0 && x_vec_opmvv && (x_inst[19:15]==5'b10000);
assign x_vec_inst_vid       = x_vec_vmunary0 && x_vec_opmvv && (x_inst[19:15]==5'b10001);
assign x_vec_inst_vcompress =(x_inst[31:26]==6'b010111) && x_vec_opmvv;
assign x_vec_inst_slideup   =(x_inst[31:26]==6'b001110) &&(x_vec_opivx || x_vec_opivi || x_vec_opmvx);
assign x_vec_inst_slidedown =(x_inst[31:26]==6'b001111) &&(x_vec_opivx || x_vec_opivi || x_vec_opmvx);
assign x_vec_inst_vrgather  =(x_inst[31:26]==6'b001100) &&(x_vec_opivv || x_vec_opivx || x_vec_opivi);
assign x_vec_inst_adc       =(x_inst[31:28]==4'b0100  ) &&(x_vec_opivv || x_vec_opivx || x_vec_opivi);
//----------------------------------------------------------
//              SRCV0 OVERLAP ILLEGAL JUDGE
//----------------------------------------------------------
assign x_ovlp_illegal[0]= x_vec_inst_narr  && x_ovlp_ill[0] 
                       || x_vec_inst_wide  && !x_vec_inst_wide_w && !x_vec_inst_vred && x_ovlp_ill[0]
                       || x_vec_inst_comp  && x_ovlp_ill[2]
                       ||(x_vec_inst_viota || x_vec_inst_slideup 
                       || x_vec_inst_vcompress|| x_vec_inst_vrgather) && x_ovlp_ill[4]; 

//----------------------------------------------------------
//              SRCV1 OVERLAP ILLEGAL JUDGE
//----------------------------------------------------------
assign x_ovlp_illegal[1] =(x_vec_inst_wide  && !x_vec_inst_vred && !(x_vec_vfunary0 && x_vec_opfvv) && x_ovlp_ill[1]
                        || x_vec_inst_comp  && x_ovlp_ill[3]
                        ||(x_vec_inst_vcompress|| x_vec_inst_vrgather) && x_ovlp_ill[5])
                        &&!(x_vec_opivx || x_vec_opivi || x_vec_opmvx || x_vec_opfvf);

//----------------------------------------------------------
//              SRCVM OVERLAP ILLEGAL JUDGE
//----------------------------------------------------------

assign x_ovlp_illegal[2]= x_vec_inst_adc  &&  x_ovlp_ill[6]
                       || x_vec_inst_wide && !x_vec_inst_vred && x_ovlp_ill[7]
                       ||(x_vec_inst_viota || x_vec_inst_slideup 
                       || x_vec_inst_slidedown || x_vec_inst_vrgather) && x_ovlp_ill[7]
                       || x_vec_inst_vid  &&  x_ovlp_ill[8]
                       || x_ovlp_ill[8] && !x_vec_opcfg && !x_vec_inst_mask;

assign decd_ovlp_illegal = |x_ovlp_illegal[2:0];

//----------------------------------------------------------
//               VREG ovrelap illegal
//----------------------------------------------------------
assign x_ovlp_ill[0] = (x_vlmul[1:0]==2'b00) && (x_inst[24:21]==x_inst[11: 8]) ||
                       (x_vlmul[1:0]==2'b01) && (x_inst[24:22]==x_inst[11: 9]) ||
                       (x_vlmul[1:0]==2'b10) && (x_inst[24:23]==x_inst[11:10]); //vsrc0 overlap with dest when narrow/widen

assign x_ovlp_ill[1] = (x_vlmul[1:0]==2'b00) && (x_inst[19:16]==x_inst[11: 8]) ||
                       (x_vlmul[1:0]==2'b01) && (x_inst[19:17]==x_inst[11: 9]) ||
                       (x_vlmul[1:0]==2'b10) && (x_inst[19:18]==x_inst[11:10]); //vsrc1 overlap with dest when narrow/widen

assign x_ovlp_ill[2]  =(x_vlmul[1:0]==2'b01) && (x_inst[24:21]==x_inst[11: 8]) || //vsrc0 overlap width dest when lmul>1
                       (x_vlmul[1:0]==2'b10) && (x_inst[24:22]==x_inst[11: 9]) ||
                       (x_vlmul[1:0]==2'b11) && (x_inst[24:23]==x_inst[11:10]);

assign x_ovlp_ill[3]  =(x_vlmul[1:0]==2'b01) && (x_inst[19:16]==x_inst[11: 8]) || //vsrc1 overlap width dest when lmul>1
                       (x_vlmul[1:0]==2'b10) && (x_inst[19:17]==x_inst[11: 9]) ||
                       (x_vlmul[1:0]==2'b11) && (x_inst[19:18]==x_inst[11:10]);

assign x_ovlp_ill[4] = (x_vlmul[1:0]==2'b00) && (x_inst[24:20]==x_inst[11: 7]) || //vsrc0 overlap with dest in all case
                       (x_vlmul[1:0]==2'b01) && (x_inst[24:21]==x_inst[11: 8]) ||
                       (x_vlmul[1:0]==2'b10) && (x_inst[24:22]==x_inst[11: 9]) ||
                       (x_vlmul[1:0]==2'b11) && (x_inst[24:23]==x_inst[11:10]);

assign x_ovlp_ill[5] = (x_vlmul[1:0]==2'b00) && (x_inst[19:15]==x_inst[11: 7]) || //vsrc1 overlap with dest in all case
                       (x_vlmul[1:0]==2'b01) && (x_inst[19:16]==x_inst[11: 8]) ||
                       (x_vlmul[1:0]==2'b10) && (x_inst[19:17]==x_inst[11: 9]) ||
                       (x_vlmul[1:0]==2'b11) && (x_inst[19:18]==x_inst[11:10]);

assign x_ovlp_ill[6]  =(x_inst[11: 7]==5'b0) && !(x_vlmul[1:0]==2'b00);//src3 overlap with dest when LMUL>1
assign x_ovlp_ill[7]  =(x_inst[11: 7]==5'b0) && !x_inst[25]; //src3 overlap with dest when masked
assign x_ovlp_ill[8]  =(x_inst[11: 7]==5'b0) && !x_inst[25] && !(x_vlmul[1:0]==2'b00); //src3 overlap with dest when masked and LMUL>1

//----------------------------------------------------------
//               LMUL/SEW illegal for widen and narrow
//----------------------------------------------------------
assign x_size_ill_case[0] = ((x_vlmul[1:0]==2'b11)||(x_vsew[1:0]==2'b11))
                           && x_vec_inst_narr || fcvt_f_x_narrow_il; 

assign x_size_ill_case[1] = ((x_vlmul[1:0]==2'b11)||(x_vsew[1:0]==2'b11)) 
                           && x_vec_inst_wide && !x_vec_inst_vred_w;

assign x_size_ill_case[2] = (x_vsew[1:0]==2'b11)
                           && x_vec_inst_vred_w; 

assign x_size_ill_case[3] = (x_vsew[1:0]==2'b00) 
                         && (x_vec_opfvv&&!fcvt_f_x_widden|| x_vec_opfvf);
assign fcvt_f_x_widden       = (x_inst[31:26] == 6'b100010) && ((x_inst[18])&&(x_inst[16]) ||
                                ((x_inst[19] && ~|x_inst[17:16])));
assign fcvt_f_x_narrow_il    = x_vec_opfvv && (x_inst[31:26] == 6'b100010) && (x_inst[19]) && (x_vsew[1:0]==2'b00)&&(|x_inst[17:16]);
assign decd_size_illegal = |x_size_ill_case[3:0];

//----------------------------------------------------------
//               vstart illegal for normal inst
//----------------------------------------------------------
assign decd_start_illegal = |cp0_idu_vstart[6:0] && !x_vec_opcfg;

assign decd_vill_illegal  = cp0_idu_vill &&  !x_vec_opcfg;  //VLSU inst should also consider this

assign decd_vs_illegal = (cp0_idu_vs[1:0]==2'b0);

assign x_vec_inst_ac_fcsr =((x_inst[31:28]==4'b1000) //vsaddu vsadd vssubu vssub
                          ||(x_inst[31:28]==4'b1001) && !(x_inst[27:26]==2'b01)  //vaadd vasub vsmul
                          ||(x_inst[31:27]==5'b10101)  //vssrl vssra
                          ||(x_inst[31:27]==5'b10111)  //vnclip vnclipu
                          ||(x_inst[31:28]==4'b1111))  //vwsmaccu vwsmacc vwsmaccsu vwsmaccus
                          &&(x_vec_opivv || x_vec_opivx || x_vec_opivi);

assign x_vec_fp_ac_fcsr   = x_vec_opfvf 
                         || ((x_inst[31:29] == 3'b000) //vfadd vfsub 
                             || (x_inst[31:30] == 2'b11) //vfwadd vfwsub vfwmul vfwmacc...
                             || (x_inst[31:28] == 4'b1001) //vfmul
                             || (x_inst[31:27] == 5'b10000) //vfdiv vfrdiv
                             || (x_inst[31:29] == 3'b101)   //vfmacc...
                             || (x_inst[31:29] == 3'b011)   //vfeq...
                             || (x_inst[31:26] == 6'b100011) && !x_inst[19] //vfsqrt
                             || (x_inst[31:26] == 6'b100010) //vfcvt
                             || (x_inst[31:27] == 5'b00110)) //vfmv
                            && x_vec_opfvv;

assign decd_fs_illegal = (cp0_idu_fs[1:0]==2'b0) 
                      && (x_vec_inst_ac_fcsr
                          || x_vec_fp_ac_fcsr);

assign decd_fp_rounding_illegal = ((cp0_idu_frm[2:0] == 3'b101) ||
                                   (cp0_idu_frm[2:0] == 3'b110) ||
                                   (cp0_idu_frm[2:0] == 3'b111))
                               && (x_vec_opfvv || x_vec_opfvf);   
//----------------------------------------------------------
//               ALL type of VECTOR illegal instructions
//----------------------------------------------------------
assign decd_v_illegal = decd_code_illegal || decd_vreg_illegal ||
                        decd_ovlp_illegal || decd_size_illegal ||
                        decd_start_illegal|| decd_vill_illegal ||
                        decd_vs_illegal   || decd_fs_illegal   ||
                        decd_fp_rounding_illegal;

//----------------------------------------------------------
//                  Vector Full Decoder
//----------------------------------------------------------
// &CombBeg; @2957
always @( x_inst[19:12]
       or x_inst[31:15]
       or x_vfunary0_vld
       or x_vmunary0_vld)
begin
  //initialize decoded information value
  decd_v_inst_type[TYPE_WIDTH-1:0]    = {TYPE_WIDTH{1'b0}};
  //operand prepare information: valid, and types
  decd_v_src0_vld                     = 1'b0;
  decd_v_src1_vld                     = 1'b0;
  decd_v_src2_vld                     = 1'b0;
  decd_v_dst_vld                      = 1'b0;
  decd_v_srcf0_vld                    = 1'b0;
  decd_v_srcf1_vld                    = 1'b0;
  decd_v_srcf2_vld                    = 1'b0;
  decd_v_dstf_vld                     = 1'b0;
  decd_v_dste_vld                     = 1'b0;
  decd_v_srcv0_vld                    = 1'b0;
  decd_v_srcv1_vld                    = 1'b0;
  decd_v_srcv2_vld                    = 1'b0;
  decd_v_dstv_vld                     = 1'b0;
  //illegal instruction
  decd_code_illegal                   = 1'b0;
  casez({x_inst[31:26],x_inst[14:12]})
    9'b0?????_111:begin //vsetvli
      decd_v_inst_type[TYPE_WIDTH-1:0]    = SPECIAL;
      decd_v_src0_vld                     = 1'b1;
      decd_v_dst_vld                      = 1'b1;
      end
    9'b100000_111:begin //vsetvl
      decd_v_inst_type[TYPE_WIDTH-1:0]    = SPECIAL;
      decd_v_src0_vld                     = 1'b1;
      decd_v_src1_vld                     = 1'b1;
      decd_v_dst_vld                      = 1'b1;
      decd_code_illegal                   = x_inst[25];
      end
    9'b000000_000:begin //vadd.vv
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b1;
      decd_v_srcv2_vld                    = !x_inst[25];
      decd_v_dstv_vld                     = 1'b1;
      end
    9'b000000_100:begin //vadd.vx always split
      end
    9'b000000_011:begin //vadd.vi
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b0;
      decd_v_srcv2_vld                    = !x_inst[25];
      decd_v_dstv_vld                     = 1'b1;
      end
    9'b000010_000:begin //vsub.vv
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b1;
      decd_v_srcv2_vld                    = !x_inst[25];
      decd_v_dstv_vld                     = 1'b1;
      end
    9'b000010_100:begin //vsub.vx always split
      end
    9'b000011_100:begin //vrsub.vx always split
      end
    9'b000011_011:begin //vrsub.vi
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b0;
      decd_v_srcv2_vld                    = !x_inst[25];
      decd_v_dstv_vld                     = 1'b1;
      end
    9'b000100_000:begin //vminu.vv
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b1;
      decd_v_srcv2_vld                    = !x_inst[25];
      decd_v_dstv_vld                     = 1'b1;
      end
    9'b000100_100:begin //vminu.vx always split
      end
    9'b000101_000:begin //vmin.vv
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b1;
      decd_v_srcv2_vld                    = !x_inst[25];
      decd_v_dstv_vld                     = 1'b1;
      end
    9'b000101_100:begin //vmin.vx always split
      end
    9'b000110_000:begin //vmaxu.vv
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b1;
      decd_v_srcv2_vld                    = !x_inst[25];
      decd_v_dstv_vld                     = 1'b1;
      end
    9'b000110_100:begin //vmaxu.vx always split
      end
    9'b000111_000:begin //vmax.vv
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b1;
      decd_v_srcv2_vld                    = !x_inst[25];
      decd_v_dstv_vld                     = 1'b1;
      end
    9'b000111_100:begin //vmax.vx always split
      end
    9'b001001_000:begin //vand.vv
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b1;
      decd_v_srcv2_vld                    = !x_inst[25];
      decd_v_dstv_vld                     = 1'b1;
      end
    9'b001001_100:begin //vand.vx always split
      end
    9'b001001_011:begin //vand.vi
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b0;
      decd_v_srcv2_vld                    = !x_inst[25];
      decd_v_dstv_vld                     = 1'b1;
      end
    9'b001010_000:begin //vor.vv
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b1;
      decd_v_srcv2_vld                    = !x_inst[25];
      decd_v_dstv_vld                     = 1'b1;
      end
    9'b001010_100:begin //vor.vx always split
      end
    9'b001010_011:begin //vor.vi
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b0;
      decd_v_srcv2_vld                    = !x_inst[25];
      decd_v_dstv_vld                     = 1'b1;
      end
    9'b001011_000:begin //vxor.vv
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b1;
      decd_v_srcv2_vld                    = !x_inst[25];
      decd_v_dstv_vld                     = 1'b1;
      end
    9'b001011_100:begin //vxor.vx always split
      end
    9'b001011_011:begin //vxor.vi
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b0;
      decd_v_srcv2_vld                    = !x_inst[25];
      decd_v_dstv_vld                     = 1'b1;
      end
    9'b001100_000:begin //vrgather.vv
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b1;
      decd_v_srcv2_vld                    = !x_inst[25];
      decd_v_dstv_vld                     = 1'b1;
      end
    9'b001100_100:begin //vrgather.vx always split
      end
    9'b001100_011:begin //vrgather.vi
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b0;
      decd_v_srcv2_vld                    = !x_inst[25];
      decd_v_dstv_vld                     = 1'b1;
      end
    9'b001110_100:begin //vslideup.vx always split
      end
    9'b001110_011:begin //vslideup.vi
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b0;
      decd_v_srcv2_vld                    = 1'b1;
      decd_v_dstv_vld                     = 1'b1;
      end
    9'b001111_100:begin //vslidedown.vx always split
      end
    9'b001111_011:begin //vslidedown.vi
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b0;
      decd_v_srcv2_vld                    = 1'b1;
      decd_v_dstv_vld                     = 1'b1;
      end
    9'b010000_000:begin //vadc.vv
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b1;
      decd_v_srcv2_vld                    = 1'b0;
      decd_v_dstv_vld                     = 1'b1;
      decd_code_illegal                   =!x_inst[25];
      end
    9'b010000_100:begin //vadc.vx always split
      decd_code_illegal                   =!x_inst[25];
      end
    9'b010000_011:begin //vadc.vi
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b0;
      decd_v_srcv2_vld                    = 1'b0;
      decd_v_dstv_vld                     = 1'b1;
      decd_code_illegal                   =!x_inst[25];
      end
    9'b010001_000:begin //vmadc.vv
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b1;
      decd_v_srcv2_vld                    = 1'b0;
      decd_v_dstv_vld                     = 1'b1;
      decd_code_illegal                   =!x_inst[25];
      end
    9'b010001_100:begin //vmadc.vx always split
      decd_code_illegal                   =!x_inst[25];
      end
    9'b010001_011:begin //vmadc.vi
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b0;
      decd_v_srcv2_vld                    = 1'b0;
      decd_v_dstv_vld                     = 1'b1;
      decd_code_illegal                   =!x_inst[25];
      end
    9'b010010_000:begin //vsbc.vv
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b1;
      decd_v_srcv2_vld                    = 1'b0;
      decd_v_dstv_vld                     = 1'b1;
      decd_code_illegal                   =!x_inst[25];
      end
    9'b010010_100:begin //vsbc.vx always split
      decd_code_illegal                   =!x_inst[25];
      end
    9'b010011_000:begin //vmsbc.vv
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b1;
      decd_v_srcv2_vld                    = 1'b0;
      decd_v_dstv_vld                     = 1'b1;
      decd_code_illegal                   =!x_inst[25];
      end
    9'b010011_100:begin //vmsbc.vx always split
      decd_code_illegal                   =!x_inst[25];
      end
    9'b010111_000:begin //vmerge/vmv.vv
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_v_srcv0_vld                    =!x_inst[25];
      decd_v_srcv1_vld                    = 1'b1;
      decd_v_srcv2_vld                    = 1'b0;
      decd_v_dstv_vld                     = 1'b1;
      decd_code_illegal                   = x_inst[25] && |x_inst[24:20];
      end
    9'b010111_100:begin //vmerge.vx always split, vmv.vx not split if LMUL=1
      decd_v_inst_type[TYPE_WIDTH-1:0]    = x_inst[25] ? ALU : PIPE67;
      decd_v_src0_vld                     = x_inst[25];
      decd_v_srcv0_vld                    = 1'b0;
      decd_v_srcv1_vld                    = 1'b0;
      decd_v_srcv2_vld                    = 1'b0;
      decd_v_dstv_vld                     = 1'b1;
      decd_code_illegal                   = x_inst[25] && |x_inst[24:20];
      end
    9'b010111_011:begin //vmerge/vmv.vi
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_v_srcv0_vld                    =!x_inst[25];
      decd_v_srcv1_vld                    = 1'b0;
      decd_v_srcv2_vld                    = 1'b0;
      decd_v_dstv_vld                     = 1'b1;
      decd_code_illegal                   = x_inst[25] && |x_inst[24:20];
      end
    9'b011000_000:begin //vmseq.vv
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b1;
      decd_v_srcv2_vld                    = !x_inst[25];
      decd_v_dstv_vld                     = 1'b1;
      end
    9'b011000_100:begin //vmseq.vx always split
      end
    9'b011000_011:begin //vmseq.vi
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b0;
      decd_v_srcv2_vld                    = !x_inst[25];
      decd_v_dstv_vld                     = 1'b1;
      end
    9'b011001_000:begin //vmsne.vv
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b1;
      decd_v_srcv2_vld                    = !x_inst[25];
      decd_v_dstv_vld                     = 1'b1;
      end
    9'b011001_100:begin //vmsne.vx always split
      end
    9'b011001_011:begin //vmsne.vi
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b0;
      decd_v_srcv2_vld                    = !x_inst[25];
      decd_v_dstv_vld                     = 1'b1;
      end
    9'b011010_000:begin //vmsltu.vv
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b1;
      decd_v_srcv2_vld                    = !x_inst[25];
      decd_v_dstv_vld                     = 1'b1;
      end
    9'b011010_100:begin //vmsltu.vx always split
      end
    9'b011011_000:begin //vmslt.vv
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b1;
      decd_v_srcv2_vld                    = !x_inst[25];
      decd_v_dstv_vld                     = 1'b1;
      end
    9'b011011_100:begin //vmslt.vx always split
      end
    9'b011100_000:begin //vmsleu.vv
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b1;
      decd_v_srcv2_vld                    = !x_inst[25];
      decd_v_dstv_vld                     = 1'b1;
      end
    9'b011100_100:begin //vmsleu.vx always split
      end
    9'b011100_011:begin //vmsleu.vi
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b0;
      decd_v_srcv2_vld                    = !x_inst[25];
      decd_v_dstv_vld                     = 1'b1;
      end
    9'b011101_000:begin //vmsle.vv
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b1;
      decd_v_srcv2_vld                    = !x_inst[25];
      decd_v_dstv_vld                     = 1'b1;
      end
    9'b011101_100:begin //vmsle.vx always split
      end
    9'b011101_011:begin //vmsle.vi
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b0;
      decd_v_srcv2_vld                    = !x_inst[25];
      decd_v_dstv_vld                     = 1'b1;
      end
    9'b011110_100:begin //vmsgtu.vx always split
      end
    9'b011110_011:begin //vmsgtu.vi
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b0;
      decd_v_srcv2_vld                    = !x_inst[25];
      decd_v_dstv_vld                     = 1'b1;
      end
    9'b011111_100:begin //vmsgt.vx always split
      end
    9'b011111_011:begin //vmsgt.vi
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b0;
      decd_v_srcv2_vld                    = !x_inst[25];
      decd_v_dstv_vld                     = 1'b1;
      end
    9'b100000_000:begin //vsaddu.vv
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b1;
      decd_v_srcv2_vld                    = !x_inst[25];
      decd_v_dstv_vld                     = 1'b1;
      decd_v_dste_vld                     = 1'b1;
      end
    9'b100000_100:begin //vsaddu.vx always split
      end
    9'b100000_011:begin //vsaddu.vi
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b0;
      decd_v_srcv2_vld                    = !x_inst[25];
      decd_v_dstv_vld                     = 1'b1;
      decd_v_dste_vld                     = 1'b1;
      end
    9'b100001_000:begin //vsadd.vv
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b1;
      decd_v_srcv2_vld                    = !x_inst[25];
      decd_v_dstv_vld                     = 1'b1;
      decd_v_dste_vld                     = 1'b1;
      end
    9'b100001_100:begin //vsadd.vx always split
      end
    9'b100001_011:begin //vsadd.vi
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b0;
      decd_v_srcv2_vld                    = !x_inst[25];
      decd_v_dstv_vld                     = 1'b1;
      decd_v_dste_vld                     = 1'b1;
      end
    9'b100010_000:begin //vssubu.vv
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b1;
      decd_v_srcv2_vld                    = !x_inst[25];
      decd_v_dstv_vld                     = 1'b1;
      decd_v_dste_vld                     = 1'b1;
      end
    9'b100010_100:begin //vssubu.vx always split
      end
    9'b100011_000:begin //vssub.vv
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b1;
      decd_v_srcv2_vld                    = !x_inst[25];
      decd_v_dstv_vld                     = 1'b1;
      decd_v_dste_vld                     = 1'b1;
      end
    9'b100011_100:begin //vssub.vx always split
      end
    9'b100100_000:begin //vaadd.vv
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b1;
      decd_v_srcv2_vld                    = !x_inst[25];
      decd_v_dstv_vld                     = 1'b1;
      end
    9'b100100_100:begin //vaadd.vx always split
      end
    9'b100100_011:begin //vaadd.vi
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b0;
      decd_v_srcv2_vld                    = !x_inst[25];
      decd_v_dstv_vld                     = 1'b1;
      end
    9'b100101_000:begin //vsll.vv
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE6;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b1;
      decd_v_srcv2_vld                    = !x_inst[25];
      decd_v_dstv_vld                     = 1'b1;
      end
    9'b100101_100:begin //vsll.vx always split
      end
    9'b100101_011:begin //vsll.vi
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE6;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b0;
      decd_v_srcv2_vld                    = !x_inst[25];
      decd_v_dstv_vld                     = 1'b1;
      end
    9'b100110_000:begin //vasub.vv
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b1;
      decd_v_srcv2_vld                    = !x_inst[25];
      decd_v_dstv_vld                     = 1'b1;
      end
    9'b100110_100:begin //vasub.vx always split
      end
    9'b100111_000:begin //vsmul.vv
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE7;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b1;
      decd_v_srcv2_vld                    = !x_inst[25];
      decd_v_dstv_vld                     = 1'b1;
      decd_v_dste_vld                     = 1'b1;
      end
    9'b100111_100:begin //vsmul.vx always split
      end
    9'b101000_000:begin //vsrl.vv
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE6;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b1;
      decd_v_srcv2_vld                    = !x_inst[25];
      decd_v_dstv_vld                     = 1'b1;
      end
    9'b101000_100:begin //vsrl.vx always split
      end
    9'b101000_011:begin //vsrl.vi
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE6;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b0;
      decd_v_srcv2_vld                    = !x_inst[25];
      decd_v_dstv_vld                     = 1'b1;
      end
    9'b101001_000:begin //vsra.vv
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE6;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b1;
      decd_v_srcv2_vld                    = !x_inst[25];
      decd_v_dstv_vld                     = 1'b1;
      end
    9'b101001_100:begin //vsra.vx always split
      end
    9'b101001_011:begin //vsra.vi
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE6;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b0;
      decd_v_srcv2_vld                    = !x_inst[25];
      decd_v_dstv_vld                     = 1'b1;
      end
    9'b101010_000:begin //vssrl.vv
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE6;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b1;
      decd_v_srcv2_vld                    = !x_inst[25];
      decd_v_dstv_vld                     = 1'b1;
      end
    9'b101010_100:begin //vssrl.vx always split
      end
    9'b101010_011:begin //vssrl.vi
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE6;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b0;
      decd_v_srcv2_vld                    = !x_inst[25];
      decd_v_dstv_vld                     = 1'b1;
      end
    9'b101011_000:begin //vssra.vv
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE6;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b1;
      decd_v_srcv2_vld                    = !x_inst[25];
      decd_v_dstv_vld                     = 1'b1;
      end
    9'b101011_100:begin //vssra.vx always split
      end
    9'b101011_011:begin //vssra.vi
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE6;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b0;
      decd_v_srcv2_vld                    = !x_inst[25];
      decd_v_dstv_vld                     = 1'b1;
      end
    9'b101100_000:begin //vnsrl.vv always split
      end
    9'b101100_100:begin //vnsrl.vx always split
      end
    9'b101100_011:begin //vnsrl.vi always split
      end
    9'b101101_000:begin //vnsra.vv always split
      end
    9'b101101_100:begin //vnsra.vx always split
      end
    9'b101101_011:begin //vnsra.vi always split
      end
    9'b101110_000:begin //vnclipu.vv always split
      end
    9'b101110_100:begin //vnclipu.vx always split
      end
    9'b101110_011:begin //vnclipu.vi always split
      end
    9'b101111_000:begin //vnclip.vv always split
      end
    9'b101111_100:begin //vnclip.vx always split
      end
    9'b101111_011:begin //vnclip.vi always split
      end
    9'b110000_000:begin //vwredusumu.vv
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE6;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b1;
      decd_v_srcv2_vld                    = 1'b0;
      decd_v_dstv_vld                     = 1'b1;
      end
    9'b110001_000:begin //vwredusum.vv
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE6;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b1;
      decd_v_srcv2_vld                    = 1'b0;
      decd_v_dstv_vld                     = 1'b1;
      end
    9'b111100_000:begin //vwsmaccu.vv always split
      end
    9'b111100_100:begin //vwsmaccu.vx always split
      end
    9'b111101_000:begin //vwsmacc.vv always split
      end
    9'b111101_100:begin //vwsmacc.vx always split
      end
    9'b111110_000:begin //vwsmaccsu.vv always split
      end
    9'b111110_100:begin //vwsmaccsu.vx always split
      end
    9'b111111_000:begin //vwsmaccus.vv always split
      end
    9'b111111_100:begin //vwsmaccus.vx always split
      end
    9'b000000_010:begin //vredsum.vv
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE6;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b1;
      decd_v_srcv2_vld                    = 1'b0;
      decd_v_dstv_vld                     = 1'b1;
      end
    9'b000001_010:begin //vredand.vv
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE6;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b1;
      decd_v_srcv2_vld                    = 1'b0;
      decd_v_dstv_vld                     = 1'b1;
      end
    9'b000010_010:begin //vredor.vv
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE6;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b1;
      decd_v_srcv2_vld                    = 1'b0;
      decd_v_dstv_vld                     = 1'b1;
      end
    9'b000011_010:begin //vredxor.vv
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE6;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b1;
      decd_v_srcv2_vld                    = 1'b0;
      decd_v_dstv_vld                     = 1'b1;
      end
    9'b000100_010:begin //vredminu.vv
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE6;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b1;
      decd_v_srcv2_vld                    = 1'b0;
      decd_v_dstv_vld                     = 1'b1;
      end
    9'b000101_010:begin //vredmin.vv
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE6;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b1;
      decd_v_srcv2_vld                    = 1'b0;
      decd_v_dstv_vld                     = 1'b1;
      end
    9'b000110_010:begin //vredmaxu.vv
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE6;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b1;
      decd_v_srcv2_vld                    = 1'b0;
      decd_v_dstv_vld                     = 1'b1;
      end
    9'b000111_010:begin //vredmax.vv
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE6;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b1;
      decd_v_srcv2_vld                    = 1'b0;
      decd_v_dstv_vld                     = 1'b1;
      end
    9'b001100_010:begin //vext.x.v(mfvr) only rs1==x0
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b0;
      decd_v_srcv2_vld                    = 1'b0;
      decd_v_dstv_vld                     = 1'b0;
      decd_v_dst_vld                      = 1'b1;  //write GPR
      decd_code_illegal                   =!x_inst[25];
      end
    9'b001101_110:begin //vmv.s.x(mtvr)
      decd_v_inst_type[TYPE_WIDTH-1:0]    = ALU;
      decd_v_src0_vld                     = 1'b1;  //read GPR
      decd_v_srcv0_vld                    = 1'b0;
      decd_v_srcv1_vld                    = 1'b0;
      decd_v_srcv2_vld                    = 1'b0;
      decd_v_dstv_vld                     = 1'b1;
      decd_code_illegal                   =!x_inst[25] || |x_inst[24:20];
      end
    9'b001110_110:begin //vslide1up.vx
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b1;
      decd_v_srcv2_vld                    = !x_inst[25];
      decd_v_dstv_vld                     = 1'b1;
      end
    9'b001111_110:begin //vslide1down.vx
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b1;
      decd_v_srcv2_vld                    = !x_inst[25];
      decd_v_dstv_vld                     = 1'b1;
      end
    9'b010100_010:begin //vmpopc  always split
      decd_code_illegal                   = |x_inst[19:15];
      end
    9'b010101_010:begin //vmfirst always split
      decd_code_illegal                   = |x_inst[19:15];
      end
    9'b010110_010:begin //VMUNARY0;vmsbf vmsif vmsof viota vid
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_v_srcv0_vld                    = !(x_inst[19:15]==5'b10001);
      decd_v_srcv1_vld                    = 1'b0;
      decd_v_srcv2_vld                    = !x_inst[25];
      decd_v_dstv_vld                     = 1'b1;
      decd_code_illegal                   = !x_vmunary0_vld || (x_inst[19:15]==5'b10001) && |x_inst[24:20];
      end
    9'b010111_010:begin //vcompress
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b1;
      decd_v_srcv2_vld                    = 1'b0;
      decd_v_dstv_vld                     = 1'b1;
      decd_code_illegal                   = !x_inst[25];
      end
    9'b011000_010:begin //vmandnot
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b1;
      decd_v_srcv2_vld                    = 1'b0;
      decd_v_dstv_vld                     = 1'b1;
      decd_code_illegal                   = !x_inst[25];
      end
    9'b011001_010:begin //vmand
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b1;
      decd_v_srcv2_vld                    = 1'b0;
      decd_v_dstv_vld                     = 1'b1;
      decd_code_illegal                   = !x_inst[25];
      end
    9'b011010_010:begin //vmor
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b1;
      decd_v_srcv2_vld                    = 1'b0;
      decd_v_dstv_vld                     = 1'b1;
      decd_code_illegal                   = !x_inst[25];
      end
    9'b011011_010:begin //vmxor
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b1;
      decd_v_srcv2_vld                    = 1'b0;
      decd_v_dstv_vld                     = 1'b1;
      decd_code_illegal                   = !x_inst[25];
      end
    9'b011100_010:begin //vmornot
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b1;
      decd_v_srcv2_vld                    = 1'b0;
      decd_v_dstv_vld                     = 1'b1;
      decd_code_illegal                   = !x_inst[25];
      end
    9'b011101_010:begin //vmnand
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b1;
      decd_v_srcv2_vld                    = 1'b0;
      decd_v_dstv_vld                     = 1'b1;
      decd_code_illegal                   = !x_inst[25];
      end
    9'b011110_010:begin //vmnor
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b1;
      decd_v_srcv2_vld                    = 1'b0;
      decd_v_dstv_vld                     = 1'b1;
      decd_code_illegal                   = !x_inst[25];
      end
    9'b011111_010:begin //vmxnor
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b1;
      decd_v_srcv2_vld                    = 1'b0;
      decd_v_dstv_vld                     = 1'b1;
      decd_code_illegal                   = !x_inst[25];
      end
    9'b100000_010:begin //vdivu.vv
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE6;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b1;
      decd_v_srcv2_vld                    = !x_inst[25];
      decd_v_dstv_vld                     = 1'b1;
      end
    9'b100000_110:begin //vdivu.vx always split
      end
    9'b100001_010:begin //vdiv.vv
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE6;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b1;
      decd_v_srcv2_vld                    = !x_inst[25];
      decd_v_dstv_vld                     = 1'b1;
      end
    9'b100001_110:begin //vdiv.vx always split
      end
    9'b100010_010:begin //vremu.vv
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE6;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b1;
      decd_v_srcv2_vld                    = !x_inst[25];
      decd_v_dstv_vld                     = 1'b1;
      end
    9'b100010_110:begin //vremu.vx always split
      end
    9'b100011_010:begin //vrem.vv
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE6;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b1;
      decd_v_srcv2_vld                    = !x_inst[25];
      decd_v_dstv_vld                     = 1'b1;
      end
    9'b100011_110:begin //vrem.vx always split
      end
    9'b100100_010:begin //vmulhu.vv
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE7;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b1;
      decd_v_srcv2_vld                    = !x_inst[25];
      decd_v_dstv_vld                     = 1'b1;
      end
    9'b100100_110:begin //vmulhu.vx always split
      end
    9'b100101_010:begin //vmul.vv
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE7;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b1;
      decd_v_srcv2_vld                    = !x_inst[25];
      decd_v_dstv_vld                     = 1'b1;
      end
    9'b100101_110:begin //vmul.vx always split
      end
    9'b100110_010:begin //vmulhsu.vv
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE7;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b1;
      decd_v_srcv2_vld                    = !x_inst[25];
      decd_v_dstv_vld                     = 1'b1;
      end
    9'b100110_110:begin //vmulhsu.vx always split
      end
    9'b100111_010:begin //vmulh.vv
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE7;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b1;
      decd_v_srcv2_vld                    = !x_inst[25];
      decd_v_dstv_vld                     = 1'b1;
      end
    9'b100111_110:begin //vmulh.vx always split
      end
    9'b101001_010:begin //vmadd.vv
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE7;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b1;
      decd_v_srcv2_vld                    = 1'b1;
      decd_v_dstv_vld                     = 1'b1;
      end
    9'b101001_110:begin //vmadd.vx always split
      end
    9'b101011_010:begin //vnmsub.vv
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE7;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b1;
      decd_v_srcv2_vld                    = 1'b1;
      decd_v_dstv_vld                     = 1'b1;
      end
    9'b101011_110:begin //vnmsub.vx always split
      end
    9'b101101_010:begin //vmacc.vv
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE7;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b1;
      decd_v_srcv2_vld                    = 1'b1;
      decd_v_dstv_vld                     = 1'b1;
      end
    9'b101101_110:begin //vmacc.vx always split
      end
    9'b101111_010:begin //vnmsac.vv
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE7;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b1;
      decd_v_srcv2_vld                    = 1'b1;
      decd_v_dstv_vld                     = 1'b1;
      end
    9'b101111_110:begin //vnmsac.vx always split
      end
    9'b110000_010:begin //vwaddu.vv always split
      end
    9'b110000_110:begin //vwaddu.vx always split
      end
    9'b110001_010:begin //vwadd.vv always split
      end
    9'b110001_110:begin //vwadd.vx always split
      end
    9'b110010_010:begin //vwsubu.vv always split
      end
    9'b110010_110:begin //vwsubu.vx always split
      end
    9'b110011_010:begin //vwsub.vv always split
      end
    9'b110011_110:begin //vwsub.vx always split
      end
    9'b110100_010:begin //vwaddu.w.vv always split
      end
    9'b110100_110:begin //vwaddu.w.vx always split
      end
    9'b110101_010:begin //vwadd.w.vv always split
      end
    9'b110101_110:begin //vwadd.w.vx always split
      end
    9'b110110_010:begin //vwsubu.w.vv always split
      end
    9'b110110_110:begin //vwsubu.w.vx always split
      end
    9'b110111_010:begin //vwsub.w.vv always split
      end
    9'b110111_110:begin //vwsub.w.vx always split
      end
    9'b111000_010:begin //vwmulu.vv always split
      end
    9'b111000_110:begin //vwmulu.vx always split
      end
    9'b111010_010:begin //vwmulsu.vv always split
      end
    9'b111010_110:begin //vwmulsu.vx always split
      end
    9'b111011_010:begin //vwmul.vv always split
      end
    9'b111011_110:begin //vwmul.vx always split
      end
    9'b111100_010:begin //vwmaccu.vv always split
      end
    9'b111100_110:begin //vwmaccu.vx always split
      end
    9'b111101_010:begin //vwmacc.vv always split
      end
    9'b111101_110:begin //vwmacc.vx always split
      end
    9'b111110_010:begin //vwmaccsu.vv always split
      end
    9'b111110_110:begin //vwmaccsu.vx always split
      end
    9'b111111_110:begin //vwmaccus.vx always split
      end
//VECTOR FPU INST
    9'b000000_001:begin //vfadd.vv
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b1;
      decd_v_srcv2_vld                    =!x_inst[25];
      decd_v_dstv_vld                     = 1'b1;
      decd_v_dste_vld                     = 1'b1;
      end
    9'b000000_101:begin //vfadd.vf always split
      end
    9'b000001_001:begin //vfredsum.vv
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b1;
      decd_v_dstv_vld                     = 1'b1;
      decd_v_dste_vld                     = 1'b1;
      end
    9'b000010_001:begin //vfsub.vv
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b1;
      decd_v_srcv2_vld                    =!x_inst[25];
      decd_v_dstv_vld                     = 1'b1;
      decd_v_dste_vld                     = 1'b1;
      end
    9'b000010_101:begin //vfsub.vf always split
      end
    9'b000011_001:begin //vfredosum.vv
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b1;
      decd_v_dstv_vld                     = 1'b1;
      decd_v_dste_vld                     = 1'b1;
      end
    9'b000100_001:begin //vfmin.vv
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b1;
      decd_v_srcv2_vld                    =!x_inst[25];
      decd_v_dstv_vld                     = 1'b1;
      decd_v_dste_vld                     = 1'b1;
      end
    9'b000100_101:begin //vfmin.vf always split
      end
    9'b000101_001:begin //vfredmin.vv
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b1;
      decd_v_srcv2_vld                    =!x_inst[25];
      decd_v_dstv_vld                     = 1'b1;
      decd_v_dste_vld                     = 1'b1;
      end
    9'b000110_001:begin //vfmax.vv
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b1;
      decd_v_srcv2_vld                    =!x_inst[25];
      decd_v_dstv_vld                     = 1'b1;
      decd_v_dste_vld                     = 1'b1;
      end
    9'b000110_101:begin //vfmax.vf always split
      end
    9'b000111_001:begin //vfredmax.vv
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b1;
      decd_v_dstv_vld                     = 1'b1;
      decd_v_dste_vld                     = 1'b1;
      end
    9'b001000_001:begin //vfsgnj.vv
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b1;
      decd_v_srcv2_vld                    =!x_inst[25];
      decd_v_dstv_vld                     = 1'b1;
      end
    9'b001000_101:begin //vfsgnj.vf always split
      end
    9'b001001_001:begin //vfsgnjn.vv
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b1;
      decd_v_srcv2_vld                    =!x_inst[25];
      decd_v_dstv_vld                     = 1'b1;
      end
    9'b001001_101:begin //vfsgnjn.vf always split
      end
    9'b001010_001:begin //vfsgnjx.vv
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b1;
      decd_v_srcv2_vld                    =!x_inst[25];
      decd_v_dstv_vld                     = 1'b1;
      end
    9'b001010_101:begin //vfsgnjx.vf always split
      end
    9'b001100_001:begin //vfmv.f.s
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b0;
      decd_v_dstf_vld                     = 1'b1;
      decd_code_illegal                   =!x_inst[25] || |x_inst[19:15];
      end
    9'b001101_101:begin //vfmv.s.f
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_v_srcf1_vld                    = 1'b1;
      decd_v_dstv_vld                     = 1'b1;
      decd_code_illegal                   =!x_inst[25] || |x_inst[24:20];
      end
    9'b010111_101:begin //vfmerge.vfm/vmv.vf
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_v_srcf1_vld                    = 1'b1;
      decd_v_srcv0_vld                    =!x_inst[25];
      decd_v_dstv_vld                     = 1'b1;
      decd_v_dste_vld                     = 1'b1;
      decd_code_illegal                   = x_inst[25] && |x_inst[24:20];
      end
    9'b011000_001:begin //vmfeq.vv
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b1;
      decd_v_srcv2_vld                    = !x_inst[25];
      decd_v_dstv_vld                     = 1'b1;
      decd_v_dste_vld                     = 1'b1;
      end
    9'b011000_101:begin //vmfeq.vf always split
      end
    9'b011001_001:begin //vmfle.vv
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b1;
      decd_v_srcv2_vld                    = !x_inst[25];
      decd_v_dstv_vld                     = 1'b1;
      decd_v_dste_vld                     = 1'b1;
      end
    9'b011001_101:begin //vmfle.vf always split
      end
    9'b011010_001:begin //vmford.vv
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b1;
      decd_v_srcv2_vld                    = !x_inst[25];
      decd_v_dstv_vld                     = 1'b1;
      decd_v_dste_vld                     = 1'b1;
      end
    9'b011010_101:begin //vmford.vf always split
      end
    9'b011011_001:begin //vmflt.vv
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b1;
      decd_v_srcv2_vld                    = !x_inst[25];
      decd_v_dstv_vld                     = 1'b1;
      decd_v_dste_vld                     = 1'b1;
      end
    9'b011011_101:begin //vmflt.vf always split
      end
    9'b011100_001:begin //vmfne.vv
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b1;
      decd_v_srcv2_vld                    = !x_inst[25];
      decd_v_dstv_vld                     = 1'b1;
      decd_v_dste_vld                     = 1'b1;
      end
    9'b011100_101:begin //vmfne.vx always split
      end
    9'b011101_101:begin //vmfgt.vx always split
      end
    9'b011111_101:begin //vmfge.vx always split
      end
    9'b100000_001:begin //vfdiv.vv
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE6;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b1;
      decd_v_srcv2_vld                    =!x_inst[25];
      decd_v_dstv_vld                     = 1'b1;
      decd_v_dste_vld                     = 1'b1;
      end
    9'b100000_101:begin //vfdiv.vf always split
      end
    9'b100001_101:begin //vfrdiv.vf always split
      end
    9'b100010_001:begin //VFUNARY0 vfcvt.xxxx
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE7;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    =!x_inst[25];//all cvt srcv12 switch
      decd_v_dstv_vld                     = 1'b1;
      decd_v_dste_vld                     = 1'b1;
      decd_code_illegal                   =!x_vfunary0_vld;
      end
    9'b100011_001:begin //VFUNARY1 vfclass/vfsqrt.vv
      decd_v_inst_type[TYPE_WIDTH-1:0]    = x_inst[19]? PIPE67 :PIPE6;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b0;
      decd_v_srcv2_vld                    =!x_inst[25];
      decd_v_dstv_vld                     = 1'b1;
      decd_v_dste_vld                     =!x_inst[19];
      decd_code_illegal                   =|x_inst[18:15];
      end
    9'b100100_001:begin //vfmul.vv
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b1;
      decd_v_srcv2_vld                    =!x_inst[25];
      decd_v_dstv_vld                     = 1'b1;
      decd_v_dste_vld                     = 1'b1;
      end
    9'b100100_101:begin //vfmul.vf always split
      end
    9'b100111_101:begin //vfrsub.vf always split
      end
    9'b101000_001:begin //vfmadd.vv
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b1;
      decd_v_srcv2_vld                    = 1'b1;
      decd_v_dstv_vld                     = 1'b1;
      decd_v_dste_vld                     = 1'b1;
      end
    9'b101000_101:begin //vfmadd.vf always split
      end
    9'b101001_001:begin //vfnmadd.vv
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b1;
      decd_v_srcv2_vld                    = 1'b1;
      decd_v_dstv_vld                     = 1'b1;
      decd_v_dste_vld                     = 1'b1;
      end
    9'b101001_101:begin //vfnmadd.vf always split
      end
    9'b101010_001:begin //vfmsub.vv
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b1;
      decd_v_srcv2_vld                    = 1'b1;
      decd_v_dstv_vld                     = 1'b1;
      decd_v_dste_vld                     = 1'b1;
      end
    9'b101010_101:begin //vfmsub.vf always split
      end
    9'b101011_001:begin //vfnmsub.vv
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b1;
      decd_v_srcv2_vld                    = 1'b1;
      decd_v_dstv_vld                     = 1'b1;
      decd_v_dste_vld                     = 1'b1;
      end
    9'b101011_101:begin //vfnmsub.vf always split
      end
    9'b101100_001:begin //vfmacc.vv
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b1;
      decd_v_srcv2_vld                    = 1'b1;
      decd_v_dstv_vld                     = 1'b1;
      decd_v_dste_vld                     = 1'b1;
      end
    9'b101100_101:begin //vfmacc.vf always split
      end
    9'b101101_001:begin //vfnmacc.vv
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b1;
      decd_v_srcv2_vld                    = 1'b1;
      decd_v_dstv_vld                     = 1'b1;
      decd_v_dste_vld                     = 1'b1;
      end
    9'b101101_101:begin //vfnmacc.vf always split
      end
    9'b101110_001:begin //vfmsac.vv
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b1;
      decd_v_srcv2_vld                    = 1'b1;
      decd_v_dstv_vld                     = 1'b1;
      decd_v_dste_vld                     = 1'b1;
      end
    9'b101110_101:begin //vfmsac.vf always split
      end
    9'b101111_001:begin //vfnmsac.vv
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b1;
      decd_v_srcv2_vld                    = 1'b1;
      decd_v_dstv_vld                     = 1'b1;
      decd_v_dste_vld                     = 1'b1;
      end
    9'b101111_101:begin //vfnmsac.vf always split
      end
    9'b110000_001:begin //vfwadd.vv always split
      end
    9'b110000_101:begin //vfwadd.vf always split
      end
    9'b110001_001:begin //vfwredsum.vv
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b1;
      decd_v_dstv_vld                     = 1'b1;
      decd_v_dste_vld                     = 1'b1;
      end
    9'b110010_001:begin //vfwsub.vv always split
      end
    9'b110010_101:begin //vfwsub.vf always split
      end
    9'b110011_001:begin //vfwredsum.vv
      decd_v_inst_type[TYPE_WIDTH-1:0]    = PIPE67;
      decd_v_srcv0_vld                    = 1'b1;
      decd_v_srcv1_vld                    = 1'b1;
      decd_v_dstv_vld                     = 1'b1;
      decd_v_dste_vld                     = 1'b1;
      end
    9'b110100_001:begin //vfwadd.w.vv always split
      end
    9'b110100_101:begin //vfwadd.w.vf always split
      end
    9'b110110_001:begin //vfwsub.w.vv always split
      end
    9'b110110_101:begin //fwsub.w.vf always split
      end
    9'b111000_001:begin //vfwmul.vv always split
      end
    9'b111000_101:begin //vfwmul.vf always split
      end
    9'b111100_001:begin //vfwmacc.vv always split
      end
    9'b111100_101:begin //vfwmacc.vf always split
      end
    9'b111101_001:begin //vfwnmacc.vv always split
      end
    9'b111101_101:begin //vfwnmacc.vf always split
      end
    9'b111110_001:begin //vfwmsac.vv always split
      end
    9'b111110_101:begin //vfwmsac.vx always split
      end
    9'b111111_001:begin //vfwmnsac.vv always split
      end
    9'b111111_101:begin //vfwmnsac.vx always split
      end
    default: begin                //invalid instruction
      //deal in fence
      decd_code_illegal                   = 1'b1;  //invalid instruction exception
    end
  endcase
// &CombEnd; @4239
end


//when vl is 0, signal dp to mask decoded inst into nop
assign decd_vec_nop = (x_vl[7:0]==8'b0) && !x_vec_opcfg && !vec_mfvr_inst;

// &CombBeg; @4245
always @( decd_v_dst_vld
       or decd_v_illegal
       or decd_vec_nop
       or decd_v_inst_type[9:0]
       or decd_v_srcf2_vld
       or decd_v_dstf_vld
       or decd_v_srcv0_vld
       or decd_v_src2_vld
       or decd_v_src1_vld
       or decd_v_src0_vld
       or decd_v_srcf0_vld
       or decd_v_dstv_vld
       or decd_v_srcv1_vld
       or decd_v_dste_vld
       or decd_v_srcf1_vld
       or decd_v_srcv2_vld)
begin
  if(decd_vec_nop) begin
    //initialize decoded information value
    decd_vec_inst_type[TYPE_WIDTH-1:0]    = SPECIAL;
    //operand prepare information: valid, and types
    decd_vec_src0_vld                     = 1'b0; 
    decd_vec_src1_vld                     = 1'b0; 
    decd_vec_src2_vld                     = 1'b0; 
    decd_vec_dst_vld                      = 1'b0; 
    decd_vec_srcf0_vld                    = 1'b0;  
    decd_vec_srcf1_vld                    = 1'b0;  
    decd_vec_srcf2_vld                    = 1'b0;  
    decd_vec_dstf_vld                     = 1'b0; 
    decd_vec_dste_vld                     = 1'b0; 
    decd_vec_srcv0_vld                    = 1'b0;  
    decd_vec_srcv1_vld                    = 1'b0;  
    decd_vec_srcv2_vld                    = 1'b0;  
    decd_vec_dstv_vld                     = 1'b0; 
    //illegal instruction
    decd_vec_illegal                      = decd_v_illegal;
  end
  else begin
    decd_vec_inst_type[TYPE_WIDTH-1:0]    = decd_v_inst_type[TYPE_WIDTH-1:0];
    //operand prepare information: valid, and types
    decd_vec_src0_vld                     = decd_v_src0_vld;
    decd_vec_src1_vld                     = decd_v_src1_vld;
    decd_vec_src2_vld                     = decd_v_src2_vld;
    decd_vec_dst_vld                      = decd_v_dst_vld;
    decd_vec_srcf0_vld                    = decd_v_srcf0_vld;
    decd_vec_srcf1_vld                    = decd_v_srcf1_vld;
    decd_vec_srcf2_vld                    = decd_v_srcf2_vld;
    decd_vec_dstf_vld                     = decd_v_dstf_vld;
    decd_vec_dste_vld                     = decd_v_dste_vld;
    decd_vec_srcv0_vld                    = decd_v_srcv0_vld;
    decd_vec_srcv1_vld                    = decd_v_srcv1_vld;
    decd_vec_srcv2_vld                    = decd_v_srcv2_vld;
    decd_vec_dstv_vld                     = decd_v_dstv_vld;
    //illegal instruction
    decd_vec_illegal                      = decd_v_illegal;
  end
// &CombEnd; @4285
end


// &ModuleEnd; @4288
endmodule


