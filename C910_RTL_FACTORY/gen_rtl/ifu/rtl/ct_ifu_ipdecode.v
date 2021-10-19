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

// &ModuleBeg; @22
module ct_ifu_ipdecode(
  cp0_idu_cskyee,
  cp0_idu_frm,
  cp0_idu_fs,
  cp0_ifu_vl,
  cp0_ifu_vsetvli_pred_disable,
  h0_data,
  h1_br,
  h1_data,
  h2_br,
  h2_data,
  h3_br,
  h3_data,
  h4_br,
  h4_data,
  h5_br,
  h5_data,
  h6_br,
  h6_data,
  h7_br,
  h7_data,
  h8_br,
  h8_data,
  ipdecode_ipdp_auipc,
  ipdecode_ipdp_branch,
  ipdecode_ipdp_chgflw,
  ipdecode_ipdp_con_br,
  ipdecode_ipdp_dst_vld,
  ipdecode_ipdp_fence,
  ipdecode_ipdp_h0_fence,
  ipdecode_ipdp_h0_ind_br,
  ipdecode_ipdp_h0_ld,
  ipdecode_ipdp_h0_offset,
  ipdecode_ipdp_h0_pcall,
  ipdecode_ipdp_h0_preturn,
  ipdecode_ipdp_h0_split0_type,
  ipdecode_ipdp_h0_split1_type,
  ipdecode_ipdp_h0_st,
  ipdecode_ipdp_h0_vlmax,
  ipdecode_ipdp_h0_vlmul,
  ipdecode_ipdp_h0_vsetvli,
  ipdecode_ipdp_h0_vsew,
  ipdecode_ipdp_h1_offset,
  ipdecode_ipdp_h1_split0_type,
  ipdecode_ipdp_h1_split1_type,
  ipdecode_ipdp_h2_offset,
  ipdecode_ipdp_h2_split0_type,
  ipdecode_ipdp_h2_split1_type,
  ipdecode_ipdp_h3_offset,
  ipdecode_ipdp_h3_split0_type,
  ipdecode_ipdp_h3_split1_type,
  ipdecode_ipdp_h4_offset,
  ipdecode_ipdp_h4_split0_type,
  ipdecode_ipdp_h4_split1_type,
  ipdecode_ipdp_h5_offset,
  ipdecode_ipdp_h5_split0_type,
  ipdecode_ipdp_h5_split1_type,
  ipdecode_ipdp_h6_offset,
  ipdecode_ipdp_h6_split0_type,
  ipdecode_ipdp_h6_split1_type,
  ipdecode_ipdp_h7_offset,
  ipdecode_ipdp_h7_split0_type,
  ipdecode_ipdp_h7_split1_type,
  ipdecode_ipdp_h8_offset,
  ipdecode_ipdp_h8_split0_type,
  ipdecode_ipdp_h8_split1_type,
  ipdecode_ipdp_ind_br,
  ipdecode_ipdp_jal,
  ipdecode_ipdp_jalr,
  ipdecode_ipdp_ld,
  ipdecode_ipdp_pc_oper,
  ipdecode_ipdp_pcall,
  ipdecode_ipdp_preturn,
  ipdecode_ipdp_st,
  ipdecode_ipdp_vlmax,
  ipdecode_ipdp_vlmul,
  ipdecode_ipdp_vsetvli,
  ipdecode_ipdp_vsew
);

// &Ports; @23
input           cp0_idu_cskyee;              
input   [2 :0]  cp0_idu_frm;                 
input   [1 :0]  cp0_idu_fs;                  
input   [7 :0]  cp0_ifu_vl;                  
input           cp0_ifu_vsetvli_pred_disable; 
input   [15:0]  h0_data;                     
input           h1_br;                       
input   [15:0]  h1_data;                     
input           h2_br;                       
input   [15:0]  h2_data;                     
input           h3_br;                       
input   [15:0]  h3_data;                     
input           h4_br;                       
input   [15:0]  h4_data;                     
input           h5_br;                       
input   [15:0]  h5_data;                     
input           h6_br;                       
input   [15:0]  h6_data;                     
input           h7_br;                       
input   [15:0]  h7_data;                     
input           h8_br;                       
input   [15:0]  h8_data;                     
output  [7 :0]  ipdecode_ipdp_auipc;         
output  [7 :0]  ipdecode_ipdp_branch;        
output  [7 :0]  ipdecode_ipdp_chgflw;        
output  [7 :0]  ipdecode_ipdp_con_br;        
output  [7 :0]  ipdecode_ipdp_dst_vld;       
output  [7 :0]  ipdecode_ipdp_fence;         
output          ipdecode_ipdp_h0_fence;      
output          ipdecode_ipdp_h0_ind_br;     
output          ipdecode_ipdp_h0_ld;         
output  [20:0]  ipdecode_ipdp_h0_offset;     
output          ipdecode_ipdp_h0_pcall;      
output          ipdecode_ipdp_h0_preturn;    
output  [2 :0]  ipdecode_ipdp_h0_split0_type; 
output  [2 :0]  ipdecode_ipdp_h0_split1_type; 
output          ipdecode_ipdp_h0_st;         
output  [7 :0]  ipdecode_ipdp_h0_vlmax;      
output  [1 :0]  ipdecode_ipdp_h0_vlmul;      
output          ipdecode_ipdp_h0_vsetvli;    
output  [2 :0]  ipdecode_ipdp_h0_vsew;       
output  [20:0]  ipdecode_ipdp_h1_offset;     
output  [2 :0]  ipdecode_ipdp_h1_split0_type; 
output  [2 :0]  ipdecode_ipdp_h1_split1_type; 
output  [20:0]  ipdecode_ipdp_h2_offset;     
output  [2 :0]  ipdecode_ipdp_h2_split0_type; 
output  [2 :0]  ipdecode_ipdp_h2_split1_type; 
output  [20:0]  ipdecode_ipdp_h3_offset;     
output  [2 :0]  ipdecode_ipdp_h3_split0_type; 
output  [2 :0]  ipdecode_ipdp_h3_split1_type; 
output  [20:0]  ipdecode_ipdp_h4_offset;     
output  [2 :0]  ipdecode_ipdp_h4_split0_type; 
output  [2 :0]  ipdecode_ipdp_h4_split1_type; 
output  [20:0]  ipdecode_ipdp_h5_offset;     
output  [2 :0]  ipdecode_ipdp_h5_split0_type; 
output  [2 :0]  ipdecode_ipdp_h5_split1_type; 
output  [20:0]  ipdecode_ipdp_h6_offset;     
output  [2 :0]  ipdecode_ipdp_h6_split0_type; 
output  [2 :0]  ipdecode_ipdp_h6_split1_type; 
output  [20:0]  ipdecode_ipdp_h7_offset;     
output  [2 :0]  ipdecode_ipdp_h7_split0_type; 
output  [2 :0]  ipdecode_ipdp_h7_split1_type; 
output  [20:0]  ipdecode_ipdp_h8_offset;     
output  [2 :0]  ipdecode_ipdp_h8_split0_type; 
output  [2 :0]  ipdecode_ipdp_h8_split1_type; 
output  [7 :0]  ipdecode_ipdp_ind_br;        
output  [7 :0]  ipdecode_ipdp_jal;           
output  [7 :0]  ipdecode_ipdp_jalr;          
output  [7 :0]  ipdecode_ipdp_ld;            
output  [7 :0]  ipdecode_ipdp_pc_oper;       
output  [7 :0]  ipdecode_ipdp_pcall;         
output  [7 :0]  ipdecode_ipdp_preturn;       
output  [7 :0]  ipdecode_ipdp_st;            
output  [63:0]  ipdecode_ipdp_vlmax;         
output  [15:0]  ipdecode_ipdp_vlmul;         
output  [7 :0]  ipdecode_ipdp_vsetvli;       
output  [23:0]  ipdecode_ipdp_vsew;          

// &Regs; @24

// &Wires; @25
wire            cp0_idu_cskyee;              
wire    [2 :0]  cp0_idu_frm;                 
wire    [1 :0]  cp0_idu_fs;                  
wire    [7 :0]  cp0_ifu_vl;                  
wire            cp0_ifu_vsetvli_pred_disable; 
wire            h0_auipc;                    
wire            h0_br;                       
wire            h0_branch;                   
wire            h0_chgflw;                   
wire            h0_con_br;                   
wire    [15:0]  h0_data;                     
wire            h0_dst_vld;                  
wire            h0_fence;                    
wire    [2 :0]  h0_fence_type;               
wire            h0_ind_br;                   
wire    [31:0]  h0_inst;                     
wire            h0_jal;                      
wire            h0_jalr;                     
wire            h0_ld;                       
wire    [20:0]  h0_offset;                   
wire            h0_pc_oper;                  
wire            h0_pcall;                    
wire            h0_preturn;                  
wire            h0_split;                    
wire    [9 :0]  h0_split_long_type;          
wire    [2 :0]  h0_split_potnt;              
wire            h0_split_short;              
wire    [2 :0]  h0_split_short_potnt;        
wire    [6 :0]  h0_split_short_type;         
wire            h0_st;                       
wire    [7 :0]  h0_vlmax;                    
wire    [1 :0]  h0_vlmul;                    
wire            h0_vsetvli;                  
wire    [2 :0]  h0_vsew;                     
wire            h1_auipc;                    
wire            h1_br;                       
wire            h1_branch;                   
wire            h1_chgflw;                   
wire            h1_con_br;                   
wire    [15:0]  h1_data;                     
wire            h1_dst_vld;                  
wire            h1_fence;                    
wire    [2 :0]  h1_fence_type;               
wire            h1_ind_br;                   
wire    [31:0]  h1_inst;                     
wire            h1_jal;                      
wire            h1_jalr;                     
wire            h1_ld;                       
wire    [20:0]  h1_offset;                   
wire            h1_pc_oper;                  
wire            h1_pcall;                    
wire            h1_preturn;                  
wire            h1_split;                    
wire    [9 :0]  h1_split_long_type;          
wire    [2 :0]  h1_split_potnt;              
wire            h1_split_short;              
wire    [2 :0]  h1_split_short_potnt;        
wire    [6 :0]  h1_split_short_type;         
wire            h1_st;                       
wire    [7 :0]  h1_vlmax;                    
wire    [1 :0]  h1_vlmul;                    
wire            h1_vsetvli;                  
wire    [2 :0]  h1_vsew;                     
wire            h2_auipc;                    
wire            h2_br;                       
wire            h2_branch;                   
wire            h2_chgflw;                   
wire            h2_con_br;                   
wire    [15:0]  h2_data;                     
wire            h2_dst_vld;                  
wire            h2_fence;                    
wire    [2 :0]  h2_fence_type;               
wire            h2_ind_br;                   
wire    [31:0]  h2_inst;                     
wire            h2_jal;                      
wire            h2_jalr;                     
wire            h2_ld;                       
wire    [20:0]  h2_offset;                   
wire            h2_pc_oper;                  
wire            h2_pcall;                    
wire            h2_preturn;                  
wire            h2_split;                    
wire    [9 :0]  h2_split_long_type;          
wire    [2 :0]  h2_split_potnt;              
wire            h2_split_short;              
wire    [2 :0]  h2_split_short_potnt;        
wire    [6 :0]  h2_split_short_type;         
wire            h2_st;                       
wire    [7 :0]  h2_vlmax;                    
wire    [1 :0]  h2_vlmul;                    
wire            h2_vsetvli;                  
wire    [2 :0]  h2_vsew;                     
wire            h3_auipc;                    
wire            h3_br;                       
wire            h3_branch;                   
wire            h3_chgflw;                   
wire            h3_con_br;                   
wire    [15:0]  h3_data;                     
wire            h3_dst_vld;                  
wire            h3_fence;                    
wire    [2 :0]  h3_fence_type;               
wire            h3_ind_br;                   
wire    [31:0]  h3_inst;                     
wire            h3_jal;                      
wire            h3_jalr;                     
wire            h3_ld;                       
wire    [20:0]  h3_offset;                   
wire            h3_pc_oper;                  
wire            h3_pcall;                    
wire            h3_preturn;                  
wire            h3_split;                    
wire    [9 :0]  h3_split_long_type;          
wire    [2 :0]  h3_split_potnt;              
wire            h3_split_short;              
wire    [2 :0]  h3_split_short_potnt;        
wire    [6 :0]  h3_split_short_type;         
wire            h3_st;                       
wire    [7 :0]  h3_vlmax;                    
wire    [1 :0]  h3_vlmul;                    
wire            h3_vsetvli;                  
wire    [2 :0]  h3_vsew;                     
wire            h4_auipc;                    
wire            h4_br;                       
wire            h4_branch;                   
wire            h4_chgflw;                   
wire            h4_con_br;                   
wire    [15:0]  h4_data;                     
wire            h4_dst_vld;                  
wire            h4_fence;                    
wire    [2 :0]  h4_fence_type;               
wire            h4_ind_br;                   
wire    [31:0]  h4_inst;                     
wire            h4_jal;                      
wire            h4_jalr;                     
wire            h4_ld;                       
wire    [20:0]  h4_offset;                   
wire            h4_pc_oper;                  
wire            h4_pcall;                    
wire            h4_preturn;                  
wire            h4_split;                    
wire    [9 :0]  h4_split_long_type;          
wire    [2 :0]  h4_split_potnt;              
wire            h4_split_short;              
wire    [2 :0]  h4_split_short_potnt;        
wire    [6 :0]  h4_split_short_type;         
wire            h4_st;                       
wire    [7 :0]  h4_vlmax;                    
wire    [1 :0]  h4_vlmul;                    
wire            h4_vsetvli;                  
wire    [2 :0]  h4_vsew;                     
wire            h5_auipc;                    
wire            h5_br;                       
wire            h5_branch;                   
wire            h5_chgflw;                   
wire            h5_con_br;                   
wire    [15:0]  h5_data;                     
wire            h5_dst_vld;                  
wire            h5_fence;                    
wire    [2 :0]  h5_fence_type;               
wire            h5_ind_br;                   
wire    [31:0]  h5_inst;                     
wire            h5_jal;                      
wire            h5_jalr;                     
wire            h5_ld;                       
wire    [20:0]  h5_offset;                   
wire            h5_pc_oper;                  
wire            h5_pcall;                    
wire            h5_preturn;                  
wire            h5_split;                    
wire    [9 :0]  h5_split_long_type;          
wire    [2 :0]  h5_split_potnt;              
wire            h5_split_short;              
wire    [2 :0]  h5_split_short_potnt;        
wire    [6 :0]  h5_split_short_type;         
wire            h5_st;                       
wire    [7 :0]  h5_vlmax;                    
wire    [1 :0]  h5_vlmul;                    
wire            h5_vsetvli;                  
wire    [2 :0]  h5_vsew;                     
wire            h6_auipc;                    
wire            h6_br;                       
wire            h6_branch;                   
wire            h6_chgflw;                   
wire            h6_con_br;                   
wire    [15:0]  h6_data;                     
wire            h6_dst_vld;                  
wire            h6_fence;                    
wire    [2 :0]  h6_fence_type;               
wire            h6_ind_br;                   
wire    [31:0]  h6_inst;                     
wire            h6_jal;                      
wire            h6_jalr;                     
wire            h6_ld;                       
wire    [20:0]  h6_offset;                   
wire            h6_pc_oper;                  
wire            h6_pcall;                    
wire            h6_preturn;                  
wire            h6_split;                    
wire    [9 :0]  h6_split_long_type;          
wire    [2 :0]  h6_split_potnt;              
wire            h6_split_short;              
wire    [2 :0]  h6_split_short_potnt;        
wire    [6 :0]  h6_split_short_type;         
wire            h6_st;                       
wire    [7 :0]  h6_vlmax;                    
wire    [1 :0]  h6_vlmul;                    
wire            h6_vsetvli;                  
wire    [2 :0]  h6_vsew;                     
wire            h7_auipc;                    
wire            h7_br;                       
wire            h7_branch;                   
wire            h7_chgflw;                   
wire            h7_con_br;                   
wire    [15:0]  h7_data;                     
wire            h7_dst_vld;                  
wire            h7_fence;                    
wire    [2 :0]  h7_fence_type;               
wire            h7_ind_br;                   
wire    [31:0]  h7_inst;                     
wire            h7_jal;                      
wire            h7_jalr;                     
wire            h7_ld;                       
wire    [20:0]  h7_offset;                   
wire            h7_pc_oper;                  
wire            h7_pcall;                    
wire            h7_preturn;                  
wire            h7_split;                    
wire    [9 :0]  h7_split_long_type;          
wire    [2 :0]  h7_split_potnt;              
wire            h7_split_short;              
wire    [2 :0]  h7_split_short_potnt;        
wire    [6 :0]  h7_split_short_type;         
wire            h7_st;                       
wire    [7 :0]  h7_vlmax;                    
wire    [1 :0]  h7_vlmul;                    
wire            h7_vsetvli;                  
wire    [2 :0]  h7_vsew;                     
wire            h8_auipc;                    
wire            h8_br;                       
wire            h8_branch;                   
wire            h8_chgflw;                   
wire            h8_con_br;                   
wire    [15:0]  h8_data;                     
wire            h8_dst_vld;                  
wire            h8_fence;                    
wire    [2 :0]  h8_fence_type;               
wire            h8_ind_br;                   
wire    [31:0]  h8_inst;                     
wire            h8_jal;                      
wire            h8_jalr;                     
wire            h8_ld;                       
wire    [20:0]  h8_offset;                   
wire            h8_pc_oper;                  
wire            h8_pcall;                    
wire            h8_preturn;                  
wire            h8_split;                    
wire    [9 :0]  h8_split_long_type;          
wire    [2 :0]  h8_split_potnt;              
wire            h8_split_short;              
wire    [2 :0]  h8_split_short_potnt;        
wire    [6 :0]  h8_split_short_type;         
wire            h8_st;                       
wire    [7 :0]  h8_vlmax;                    
wire    [1 :0]  h8_vlmul;                    
wire            h8_vsetvli;                  
wire    [2 :0]  h8_vsew;                     
wire    [7 :0]  ipdecode_ipdp_auipc;         
wire    [7 :0]  ipdecode_ipdp_branch;        
wire    [7 :0]  ipdecode_ipdp_chgflw;        
wire    [7 :0]  ipdecode_ipdp_con_br;        
wire    [7 :0]  ipdecode_ipdp_dst_vld;       
wire    [7 :0]  ipdecode_ipdp_fence;         
wire            ipdecode_ipdp_h0_fence;      
wire            ipdecode_ipdp_h0_ind_br;     
wire            ipdecode_ipdp_h0_ld;         
wire    [20:0]  ipdecode_ipdp_h0_offset;     
wire            ipdecode_ipdp_h0_pcall;      
wire            ipdecode_ipdp_h0_preturn;    
wire    [2 :0]  ipdecode_ipdp_h0_split0_type; 
wire    [2 :0]  ipdecode_ipdp_h0_split1_type; 
wire            ipdecode_ipdp_h0_st;         
wire    [7 :0]  ipdecode_ipdp_h0_vlmax;      
wire    [1 :0]  ipdecode_ipdp_h0_vlmul;      
wire            ipdecode_ipdp_h0_vsetvli;    
wire    [2 :0]  ipdecode_ipdp_h0_vsew;       
wire    [20:0]  ipdecode_ipdp_h1_offset;     
wire    [2 :0]  ipdecode_ipdp_h1_split0_type; 
wire    [2 :0]  ipdecode_ipdp_h1_split1_type; 
wire    [20:0]  ipdecode_ipdp_h2_offset;     
wire    [2 :0]  ipdecode_ipdp_h2_split0_type; 
wire    [2 :0]  ipdecode_ipdp_h2_split1_type; 
wire    [20:0]  ipdecode_ipdp_h3_offset;     
wire    [2 :0]  ipdecode_ipdp_h3_split0_type; 
wire    [2 :0]  ipdecode_ipdp_h3_split1_type; 
wire    [20:0]  ipdecode_ipdp_h4_offset;     
wire    [2 :0]  ipdecode_ipdp_h4_split0_type; 
wire    [2 :0]  ipdecode_ipdp_h4_split1_type; 
wire    [20:0]  ipdecode_ipdp_h5_offset;     
wire    [2 :0]  ipdecode_ipdp_h5_split0_type; 
wire    [2 :0]  ipdecode_ipdp_h5_split1_type; 
wire    [20:0]  ipdecode_ipdp_h6_offset;     
wire    [2 :0]  ipdecode_ipdp_h6_split0_type; 
wire    [2 :0]  ipdecode_ipdp_h6_split1_type; 
wire    [20:0]  ipdecode_ipdp_h7_offset;     
wire    [2 :0]  ipdecode_ipdp_h7_split0_type; 
wire    [2 :0]  ipdecode_ipdp_h7_split1_type; 
wire    [20:0]  ipdecode_ipdp_h8_offset;     
wire    [2 :0]  ipdecode_ipdp_h8_split0_type; 
wire    [2 :0]  ipdecode_ipdp_h8_split1_type; 
wire    [7 :0]  ipdecode_ipdp_ind_br;        
wire    [7 :0]  ipdecode_ipdp_jal;           
wire    [7 :0]  ipdecode_ipdp_jalr;          
wire    [7 :0]  ipdecode_ipdp_ld;            
wire    [7 :0]  ipdecode_ipdp_pc_oper;       
wire    [7 :0]  ipdecode_ipdp_pcall;         
wire    [7 :0]  ipdecode_ipdp_preturn;       
wire    [7 :0]  ipdecode_ipdp_st;            
wire    [63:0]  ipdecode_ipdp_vlmax;         
wire    [15:0]  ipdecode_ipdp_vlmul;         
wire    [7 :0]  ipdecode_ipdp_vsetvli;       
wire    [23:0]  ipdecode_ipdp_vsew;          



//==========================================================
//                split & Fence Predecode
//==========================================================
assign h0_inst[31:0] = {h1_data[15:0],h0_data[15:0]};
assign h1_inst[31:0] = {h2_data[15:0],h1_data[15:0]};
assign h2_inst[31:0] = {h3_data[15:0],h2_data[15:0]};
assign h3_inst[31:0] = {h4_data[15:0],h3_data[15:0]};
assign h4_inst[31:0] = {h5_data[15:0],h4_data[15:0]};
assign h5_inst[31:0] = {h6_data[15:0],h5_data[15:0]};
assign h6_inst[31:0] = {h7_data[15:0],h6_data[15:0]};
assign h7_inst[31:0] = {h8_data[15:0],h7_data[15:0]};
assign h8_inst[31:0] = {16'b0,h8_data[15:0]};

// &ConnRule(s/^x_/h0_/); @41
// &Instance("ct_ifu_decd_normal","x_h0_decd_normal"); @42
ct_ifu_decd_normal  x_h0_decd_normal (
  .cp0_ifu_vl                   (cp0_ifu_vl                  ),
  .cp0_ifu_vsetvli_pred_disable (cp0_ifu_vsetvli_pred_disable),
  .x_auipc                      (h0_auipc                    ),
  .x_br                         (h0_br                       ),
  .x_branch                     (h0_branch                   ),
  .x_chgflw                     (h0_chgflw                   ),
  .x_con_br                     (h0_con_br                   ),
  .x_dst_vld                    (h0_dst_vld                  ),
  .x_ind_br                     (h0_ind_br                   ),
  .x_inst                       (h0_inst                     ),
  .x_jal                        (h0_jal                      ),
  .x_jalr                       (h0_jalr                     ),
  .x_ld                         (h0_ld                       ),
  .x_offset                     (h0_offset                   ),
  .x_pc_oper                    (h0_pc_oper                  ),
  .x_pcall                      (h0_pcall                    ),
  .x_preturn                    (h0_preturn                  ),
  .x_st                         (h0_st                       ),
  .x_vlmax                      (h0_vlmax                    ),
  .x_vlmul                      (h0_vlmul                    ),
  .x_vsetvli                    (h0_vsetvli                  ),
  .x_vsew                       (h0_vsew                     )
);

// &Connect(.x_vl    (cp0_ifu_vl)); @43
// &ConnRule(s/^x_/h1_/); @44
// &Instance("ct_ifu_decd_normal","x_h1_decd_normal"); @45
ct_ifu_decd_normal  x_h1_decd_normal (
  .cp0_ifu_vl                   (cp0_ifu_vl                  ),
  .cp0_ifu_vsetvli_pred_disable (cp0_ifu_vsetvli_pred_disable),
  .x_auipc                      (h1_auipc                    ),
  .x_br                         (h1_br                       ),
  .x_branch                     (h1_branch                   ),
  .x_chgflw                     (h1_chgflw                   ),
  .x_con_br                     (h1_con_br                   ),
  .x_dst_vld                    (h1_dst_vld                  ),
  .x_ind_br                     (h1_ind_br                   ),
  .x_inst                       (h1_inst                     ),
  .x_jal                        (h1_jal                      ),
  .x_jalr                       (h1_jalr                     ),
  .x_ld                         (h1_ld                       ),
  .x_offset                     (h1_offset                   ),
  .x_pc_oper                    (h1_pc_oper                  ),
  .x_pcall                      (h1_pcall                    ),
  .x_preturn                    (h1_preturn                  ),
  .x_st                         (h1_st                       ),
  .x_vlmax                      (h1_vlmax                    ),
  .x_vlmul                      (h1_vlmul                    ),
  .x_vsetvli                    (h1_vsetvli                  ),
  .x_vsew                       (h1_vsew                     )
);

// &Connect(.x_vl    (cp0_ifu_vl)); @46
// &ConnRule(s/^x_/h2_/); @47
// &Instance("ct_ifu_decd_normal","x_h2_decd_normal"); @48
ct_ifu_decd_normal  x_h2_decd_normal (
  .cp0_ifu_vl                   (cp0_ifu_vl                  ),
  .cp0_ifu_vsetvli_pred_disable (cp0_ifu_vsetvli_pred_disable),
  .x_auipc                      (h2_auipc                    ),
  .x_br                         (h2_br                       ),
  .x_branch                     (h2_branch                   ),
  .x_chgflw                     (h2_chgflw                   ),
  .x_con_br                     (h2_con_br                   ),
  .x_dst_vld                    (h2_dst_vld                  ),
  .x_ind_br                     (h2_ind_br                   ),
  .x_inst                       (h2_inst                     ),
  .x_jal                        (h2_jal                      ),
  .x_jalr                       (h2_jalr                     ),
  .x_ld                         (h2_ld                       ),
  .x_offset                     (h2_offset                   ),
  .x_pc_oper                    (h2_pc_oper                  ),
  .x_pcall                      (h2_pcall                    ),
  .x_preturn                    (h2_preturn                  ),
  .x_st                         (h2_st                       ),
  .x_vlmax                      (h2_vlmax                    ),
  .x_vlmul                      (h2_vlmul                    ),
  .x_vsetvli                    (h2_vsetvli                  ),
  .x_vsew                       (h2_vsew                     )
);

// &Connect(.x_vl    (cp0_ifu_vl)); @49
// &ConnRule(s/^x_/h3_/); @50
// &Instance("ct_ifu_decd_normal","x_h3_decd_normal"); @51
ct_ifu_decd_normal  x_h3_decd_normal (
  .cp0_ifu_vl                   (cp0_ifu_vl                  ),
  .cp0_ifu_vsetvli_pred_disable (cp0_ifu_vsetvli_pred_disable),
  .x_auipc                      (h3_auipc                    ),
  .x_br                         (h3_br                       ),
  .x_branch                     (h3_branch                   ),
  .x_chgflw                     (h3_chgflw                   ),
  .x_con_br                     (h3_con_br                   ),
  .x_dst_vld                    (h3_dst_vld                  ),
  .x_ind_br                     (h3_ind_br                   ),
  .x_inst                       (h3_inst                     ),
  .x_jal                        (h3_jal                      ),
  .x_jalr                       (h3_jalr                     ),
  .x_ld                         (h3_ld                       ),
  .x_offset                     (h3_offset                   ),
  .x_pc_oper                    (h3_pc_oper                  ),
  .x_pcall                      (h3_pcall                    ),
  .x_preturn                    (h3_preturn                  ),
  .x_st                         (h3_st                       ),
  .x_vlmax                      (h3_vlmax                    ),
  .x_vlmul                      (h3_vlmul                    ),
  .x_vsetvli                    (h3_vsetvli                  ),
  .x_vsew                       (h3_vsew                     )
);

// &Connect(.x_vl    (cp0_ifu_vl)); @52
// &ConnRule(s/^x_/h4_/); @53
// &Instance("ct_ifu_decd_normal","x_h4_decd_normal"); @54
ct_ifu_decd_normal  x_h4_decd_normal (
  .cp0_ifu_vl                   (cp0_ifu_vl                  ),
  .cp0_ifu_vsetvli_pred_disable (cp0_ifu_vsetvli_pred_disable),
  .x_auipc                      (h4_auipc                    ),
  .x_br                         (h4_br                       ),
  .x_branch                     (h4_branch                   ),
  .x_chgflw                     (h4_chgflw                   ),
  .x_con_br                     (h4_con_br                   ),
  .x_dst_vld                    (h4_dst_vld                  ),
  .x_ind_br                     (h4_ind_br                   ),
  .x_inst                       (h4_inst                     ),
  .x_jal                        (h4_jal                      ),
  .x_jalr                       (h4_jalr                     ),
  .x_ld                         (h4_ld                       ),
  .x_offset                     (h4_offset                   ),
  .x_pc_oper                    (h4_pc_oper                  ),
  .x_pcall                      (h4_pcall                    ),
  .x_preturn                    (h4_preturn                  ),
  .x_st                         (h4_st                       ),
  .x_vlmax                      (h4_vlmax                    ),
  .x_vlmul                      (h4_vlmul                    ),
  .x_vsetvli                    (h4_vsetvli                  ),
  .x_vsew                       (h4_vsew                     )
);

// &Connect(.x_vl    (cp0_ifu_vl)); @55
// &ConnRule(s/^x_/h5_/); @56
// &Instance("ct_ifu_decd_normal","x_h5_decd_normal"); @57
ct_ifu_decd_normal  x_h5_decd_normal (
  .cp0_ifu_vl                   (cp0_ifu_vl                  ),
  .cp0_ifu_vsetvli_pred_disable (cp0_ifu_vsetvli_pred_disable),
  .x_auipc                      (h5_auipc                    ),
  .x_br                         (h5_br                       ),
  .x_branch                     (h5_branch                   ),
  .x_chgflw                     (h5_chgflw                   ),
  .x_con_br                     (h5_con_br                   ),
  .x_dst_vld                    (h5_dst_vld                  ),
  .x_ind_br                     (h5_ind_br                   ),
  .x_inst                       (h5_inst                     ),
  .x_jal                        (h5_jal                      ),
  .x_jalr                       (h5_jalr                     ),
  .x_ld                         (h5_ld                       ),
  .x_offset                     (h5_offset                   ),
  .x_pc_oper                    (h5_pc_oper                  ),
  .x_pcall                      (h5_pcall                    ),
  .x_preturn                    (h5_preturn                  ),
  .x_st                         (h5_st                       ),
  .x_vlmax                      (h5_vlmax                    ),
  .x_vlmul                      (h5_vlmul                    ),
  .x_vsetvli                    (h5_vsetvli                  ),
  .x_vsew                       (h5_vsew                     )
);

// &Connect(.x_vl    (cp0_ifu_vl)); @58
// &ConnRule(s/^x_/h6_/); @59
// &Instance("ct_ifu_decd_normal","x_h6_decd_normal"); @60
ct_ifu_decd_normal  x_h6_decd_normal (
  .cp0_ifu_vl                   (cp0_ifu_vl                  ),
  .cp0_ifu_vsetvli_pred_disable (cp0_ifu_vsetvli_pred_disable),
  .x_auipc                      (h6_auipc                    ),
  .x_br                         (h6_br                       ),
  .x_branch                     (h6_branch                   ),
  .x_chgflw                     (h6_chgflw                   ),
  .x_con_br                     (h6_con_br                   ),
  .x_dst_vld                    (h6_dst_vld                  ),
  .x_ind_br                     (h6_ind_br                   ),
  .x_inst                       (h6_inst                     ),
  .x_jal                        (h6_jal                      ),
  .x_jalr                       (h6_jalr                     ),
  .x_ld                         (h6_ld                       ),
  .x_offset                     (h6_offset                   ),
  .x_pc_oper                    (h6_pc_oper                  ),
  .x_pcall                      (h6_pcall                    ),
  .x_preturn                    (h6_preturn                  ),
  .x_st                         (h6_st                       ),
  .x_vlmax                      (h6_vlmax                    ),
  .x_vlmul                      (h6_vlmul                    ),
  .x_vsetvli                    (h6_vsetvli                  ),
  .x_vsew                       (h6_vsew                     )
);

// &Connect(.x_vl    (cp0_ifu_vl)); @61
// &ConnRule(s/^x_/h7_/); @62
// &Instance("ct_ifu_decd_normal","x_h7_decd_normal"); @63
ct_ifu_decd_normal  x_h7_decd_normal (
  .cp0_ifu_vl                   (cp0_ifu_vl                  ),
  .cp0_ifu_vsetvli_pred_disable (cp0_ifu_vsetvli_pred_disable),
  .x_auipc                      (h7_auipc                    ),
  .x_br                         (h7_br                       ),
  .x_branch                     (h7_branch                   ),
  .x_chgflw                     (h7_chgflw                   ),
  .x_con_br                     (h7_con_br                   ),
  .x_dst_vld                    (h7_dst_vld                  ),
  .x_ind_br                     (h7_ind_br                   ),
  .x_inst                       (h7_inst                     ),
  .x_jal                        (h7_jal                      ),
  .x_jalr                       (h7_jalr                     ),
  .x_ld                         (h7_ld                       ),
  .x_offset                     (h7_offset                   ),
  .x_pc_oper                    (h7_pc_oper                  ),
  .x_pcall                      (h7_pcall                    ),
  .x_preturn                    (h7_preturn                  ),
  .x_st                         (h7_st                       ),
  .x_vlmax                      (h7_vlmax                    ),
  .x_vlmul                      (h7_vlmul                    ),
  .x_vsetvli                    (h7_vsetvli                  ),
  .x_vsew                       (h7_vsew                     )
);

// &Connect(.x_vl    (cp0_ifu_vl)); @64
// &ConnRule(s/^x_/h8_/); @65
// &Instance("ct_ifu_decd_normal","x_h8_decd_normal"); @66
ct_ifu_decd_normal  x_h8_decd_normal (
  .cp0_ifu_vl                   (cp0_ifu_vl                  ),
  .cp0_ifu_vsetvli_pred_disable (cp0_ifu_vsetvli_pred_disable),
  .x_auipc                      (h8_auipc                    ),
  .x_br                         (h8_br                       ),
  .x_branch                     (h8_branch                   ),
  .x_chgflw                     (h8_chgflw                   ),
  .x_con_br                     (h8_con_br                   ),
  .x_dst_vld                    (h8_dst_vld                  ),
  .x_ind_br                     (h8_ind_br                   ),
  .x_inst                       (h8_inst                     ),
  .x_jal                        (h8_jal                      ),
  .x_jalr                       (h8_jalr                     ),
  .x_ld                         (h8_ld                       ),
  .x_offset                     (h8_offset                   ),
  .x_pc_oper                    (h8_pc_oper                  ),
  .x_pcall                      (h8_pcall                    ),
  .x_preturn                    (h8_preturn                  ),
  .x_st                         (h8_st                       ),
  .x_vlmax                      (h8_vlmax                    ),
  .x_vlmul                      (h8_vlmul                    ),
  .x_vsetvli                    (h8_vsetvli                  ),
  .x_vsew                       (h8_vsew                     )
);

// &Connect(.x_vl    (cp0_ifu_vl)); @67

assign h0_br = 1'b0;
// &Force("nonport","h0_con_br"); @70
// &Force("nonport","h0_branch"); @71
// &Force("nonport","h0_pc_oper"); @72
// &Force("nonport","h0_chgflw"); @73
// &Force("nonport","h0_dst_vld"); @74
// &Force("nonport","h0_auipc"); @75
// &Force("nonport","h0_jal"); @76
// &Force("nonport","h0_jalr"); @77

//special decode
// &ConnRule(s/^x_/h0_/); @80
// &Instance("ct_idu_id_decd_special","x_h0_decd_special"); @81
ct_idu_id_decd_special  x_h0_decd_special (
  .cp0_idu_cskyee       (cp0_idu_cskyee      ),
  .cp0_idu_frm          (cp0_idu_frm         ),
  .cp0_idu_fs           (cp0_idu_fs          ),
  .x_fence              (h0_fence            ),
  .x_fence_type         (h0_fence_type       ),
  .x_inst               (h0_inst             ),
  .x_split              (h0_split            ),
  .x_split_long_type    (h0_split_long_type  ),
  .x_split_potnt        (h0_split_potnt      ),
  .x_split_short        (h0_split_short      ),
  .x_split_short_potnt  (h0_split_short_potnt),
  .x_split_short_type   (h0_split_short_type )
);

// &ConnRule(s/^x_/h1_/); @82
// &Instance("ct_idu_id_decd_special","x_h1_decd_special"); @83
ct_idu_id_decd_special  x_h1_decd_special (
  .cp0_idu_cskyee       (cp0_idu_cskyee      ),
  .cp0_idu_frm          (cp0_idu_frm         ),
  .cp0_idu_fs           (cp0_idu_fs          ),
  .x_fence              (h1_fence            ),
  .x_fence_type         (h1_fence_type       ),
  .x_inst               (h1_inst             ),
  .x_split              (h1_split            ),
  .x_split_long_type    (h1_split_long_type  ),
  .x_split_potnt        (h1_split_potnt      ),
  .x_split_short        (h1_split_short      ),
  .x_split_short_potnt  (h1_split_short_potnt),
  .x_split_short_type   (h1_split_short_type )
);

// &ConnRule(s/^x_/h2_/); @84
// &Instance("ct_idu_id_decd_special","x_h2_decd_special"); @85
ct_idu_id_decd_special  x_h2_decd_special (
  .cp0_idu_cskyee       (cp0_idu_cskyee      ),
  .cp0_idu_frm          (cp0_idu_frm         ),
  .cp0_idu_fs           (cp0_idu_fs          ),
  .x_fence              (h2_fence            ),
  .x_fence_type         (h2_fence_type       ),
  .x_inst               (h2_inst             ),
  .x_split              (h2_split            ),
  .x_split_long_type    (h2_split_long_type  ),
  .x_split_potnt        (h2_split_potnt      ),
  .x_split_short        (h2_split_short      ),
  .x_split_short_potnt  (h2_split_short_potnt),
  .x_split_short_type   (h2_split_short_type )
);

// &ConnRule(s/^x_/h3_/); @86
// &Instance("ct_idu_id_decd_special","x_h3_decd_special"); @87
ct_idu_id_decd_special  x_h3_decd_special (
  .cp0_idu_cskyee       (cp0_idu_cskyee      ),
  .cp0_idu_frm          (cp0_idu_frm         ),
  .cp0_idu_fs           (cp0_idu_fs          ),
  .x_fence              (h3_fence            ),
  .x_fence_type         (h3_fence_type       ),
  .x_inst               (h3_inst             ),
  .x_split              (h3_split            ),
  .x_split_long_type    (h3_split_long_type  ),
  .x_split_potnt        (h3_split_potnt      ),
  .x_split_short        (h3_split_short      ),
  .x_split_short_potnt  (h3_split_short_potnt),
  .x_split_short_type   (h3_split_short_type )
);

// &ConnRule(s/^x_/h4_/); @88
// &Instance("ct_idu_id_decd_special","x_h4_decd_special"); @89
ct_idu_id_decd_special  x_h4_decd_special (
  .cp0_idu_cskyee       (cp0_idu_cskyee      ),
  .cp0_idu_frm          (cp0_idu_frm         ),
  .cp0_idu_fs           (cp0_idu_fs          ),
  .x_fence              (h4_fence            ),
  .x_fence_type         (h4_fence_type       ),
  .x_inst               (h4_inst             ),
  .x_split              (h4_split            ),
  .x_split_long_type    (h4_split_long_type  ),
  .x_split_potnt        (h4_split_potnt      ),
  .x_split_short        (h4_split_short      ),
  .x_split_short_potnt  (h4_split_short_potnt),
  .x_split_short_type   (h4_split_short_type )
);

// &ConnRule(s/^x_/h5_/); @90
// &Instance("ct_idu_id_decd_special","x_h5_decd_special"); @91
ct_idu_id_decd_special  x_h5_decd_special (
  .cp0_idu_cskyee       (cp0_idu_cskyee      ),
  .cp0_idu_frm          (cp0_idu_frm         ),
  .cp0_idu_fs           (cp0_idu_fs          ),
  .x_fence              (h5_fence            ),
  .x_fence_type         (h5_fence_type       ),
  .x_inst               (h5_inst             ),
  .x_split              (h5_split            ),
  .x_split_long_type    (h5_split_long_type  ),
  .x_split_potnt        (h5_split_potnt      ),
  .x_split_short        (h5_split_short      ),
  .x_split_short_potnt  (h5_split_short_potnt),
  .x_split_short_type   (h5_split_short_type )
);

// &ConnRule(s/^x_/h6_/); @92
// &Instance("ct_idu_id_decd_special","x_h6_decd_special"); @93
ct_idu_id_decd_special  x_h6_decd_special (
  .cp0_idu_cskyee       (cp0_idu_cskyee      ),
  .cp0_idu_frm          (cp0_idu_frm         ),
  .cp0_idu_fs           (cp0_idu_fs          ),
  .x_fence              (h6_fence            ),
  .x_fence_type         (h6_fence_type       ),
  .x_inst               (h6_inst             ),
  .x_split              (h6_split            ),
  .x_split_long_type    (h6_split_long_type  ),
  .x_split_potnt        (h6_split_potnt      ),
  .x_split_short        (h6_split_short      ),
  .x_split_short_potnt  (h6_split_short_potnt),
  .x_split_short_type   (h6_split_short_type )
);

// &ConnRule(s/^x_/h7_/); @94
// &Instance("ct_idu_id_decd_special","x_h7_decd_special"); @95
ct_idu_id_decd_special  x_h7_decd_special (
  .cp0_idu_cskyee       (cp0_idu_cskyee      ),
  .cp0_idu_frm          (cp0_idu_frm         ),
  .cp0_idu_fs           (cp0_idu_fs          ),
  .x_fence              (h7_fence            ),
  .x_fence_type         (h7_fence_type       ),
  .x_inst               (h7_inst             ),
  .x_split              (h7_split            ),
  .x_split_long_type    (h7_split_long_type  ),
  .x_split_potnt        (h7_split_potnt      ),
  .x_split_short        (h7_split_short      ),
  .x_split_short_potnt  (h7_split_short_potnt),
  .x_split_short_type   (h7_split_short_type )
);

// &ConnRule(s/^x_/h8_/); @96
// &Instance("ct_idu_id_decd_special","x_h8_decd_special"); @97
ct_idu_id_decd_special  x_h8_decd_special (
  .cp0_idu_cskyee       (cp0_idu_cskyee      ),
  .cp0_idu_frm          (cp0_idu_frm         ),
  .cp0_idu_fs           (cp0_idu_fs          ),
  .x_fence              (h8_fence            ),
  .x_fence_type         (h8_fence_type       ),
  .x_inst               (h8_inst             ),
  .x_split              (h8_split            ),
  .x_split_long_type    (h8_split_long_type  ),
  .x_split_potnt        (h8_split_potnt      ),
  .x_split_short        (h8_split_short      ),
  .x_split_short_potnt  (h8_split_short_potnt),
  .x_split_short_type   (h8_split_short_type )
);


// &Force("nonport","h0_split_long_type"); @99
// &Force("nonport","h1_split_long_type"); @100
// &Force("nonport","h2_split_long_type"); @101
// &Force("nonport","h3_split_long_type"); @102
// &Force("nonport","h4_split_long_type"); @103
// &Force("nonport","h5_split_long_type"); @104
// &Force("nonport","h6_split_long_type"); @105
// &Force("nonport","h7_split_long_type"); @106
// &Force("nonport","h8_split_long_type"); @107

// &Force("nonport","h0_split_short_type"); @109
// &Force("nonport","h1_split_short_type"); @110
// &Force("nonport","h2_split_short_type"); @111
// &Force("nonport","h3_split_short_type"); @112
// &Force("nonport","h4_split_short_type"); @113
// &Force("nonport","h5_split_short_type"); @114
// &Force("nonport","h6_split_short_type"); @115
// &Force("nonport","h7_split_short_type"); @116
// &Force("nonport","h8_split_short_type"); @117

// &Force("nonport","h0_fence_type"); @119
// &Force("nonport","h1_fence_type"); @120
// &Force("nonport","h2_fence_type"); @121
// &Force("nonport","h3_fence_type"); @122
// &Force("nonport","h4_fence_type"); @123
// &Force("nonport","h5_fence_type"); @124
// &Force("nonport","h6_fence_type"); @125
// &Force("nonport","h7_fence_type"); @126
// &Force("nonport","h8_fence_type"); @127

// &Force("nonport","h0_split_short"); @129
// &Force("nonport","h1_split_short"); @130
// &Force("nonport","h2_split_short"); @131
// &Force("nonport","h3_split_short"); @132
// &Force("nonport","h4_split_short"); @133
// &Force("nonport","h5_split_short"); @134
// &Force("nonport","h6_split_short"); @135
// &Force("nonport","h7_split_short"); @136
// &Force("nonport","h8_split_short"); @137

// &Force("nonport","h0_split"); @139
// &Force("nonport","h1_split"); @140
// &Force("nonport","h2_split"); @141
// &Force("nonport","h3_split"); @142
// &Force("nonport","h4_split"); @143
// &Force("nonport","h5_split"); @144
// &Force("nonport","h6_split"); @145
// &Force("nonport","h7_split"); @146
// &Force("nonport","h8_split"); @147

//==========================================================
//         Merge and Trans Result to IP Data Path
//==========================================================
assign ipdecode_ipdp_con_br[7:0]     = {h1_con_br,
                                        h2_con_br,
                                        h3_con_br,
                                        h4_con_br,
                                        h5_con_br,
                                        h6_con_br,
                                        h7_con_br,
                                        h8_con_br};

assign ipdecode_ipdp_branch[7:0]     = {h1_branch,
                                        h2_branch,
                                        h3_branch,
                                        h4_branch,
                                        h5_branch,
                                        h6_branch,
                                        h7_branch,
                                        h8_branch};

assign ipdecode_ipdp_pcall[7:0]      = {h1_pcall,
                                        h2_pcall,
                                        h3_pcall,
                                        h4_pcall,
                                        h5_pcall,
                                        h6_pcall,
                                        h7_pcall,
                                        h8_pcall};
assign ipdecode_ipdp_h0_pcall        =  h0_pcall;

assign ipdecode_ipdp_preturn[7:0]    = {h1_preturn,
                                        h2_preturn,
                                        h3_preturn,
                                        h4_preturn,
                                        h5_preturn,
                                        h6_preturn,
                                        h7_preturn,
                                        h8_preturn};
assign ipdecode_ipdp_h0_preturn      = h0_preturn;

assign ipdecode_ipdp_pc_oper[7:0]    = {h1_pc_oper,
                                        h2_pc_oper,
                                        h3_pc_oper,
                                        h4_pc_oper,
                                        h5_pc_oper,
                                        h6_pc_oper,
                                        h7_pc_oper,
                                        h8_pc_oper};

assign ipdecode_ipdp_chgflw[7:0]     = {h1_chgflw,
                                        h2_chgflw,
                                        h3_chgflw,
                                        h4_chgflw,
                                        h5_chgflw,
                                        h6_chgflw,
                                        h7_chgflw,
                                        h8_chgflw};

assign ipdecode_ipdp_h0_ld           = h0_ld;

assign ipdecode_ipdp_ld[7:0]         = {h1_ld,
                                        h2_ld,
                                        h3_ld,
                                        h4_ld,
                                        h5_ld,
                                        h6_ld,
                                        h7_ld,
                                        h8_ld};

assign ipdecode_ipdp_h0_st           = h0_st;
assign ipdecode_ipdp_st[7:0]         = {h1_st,
                                        h2_st,
                                        h3_st,
                                        h4_st,
                                        h5_st,
                                        h6_st,
                                        h7_st,
                                        h8_st};

assign ipdecode_ipdp_dst_vld[7:0]    = {h1_dst_vld,
                                        h2_dst_vld,
                                        h3_dst_vld,
                                        h4_dst_vld,
                                        h5_dst_vld,
                                        h6_dst_vld,
                                        h7_dst_vld,
                                        h8_dst_vld};

assign ipdecode_ipdp_auipc[7:0]      = {h1_auipc,
                                        h2_auipc, 
                                        h3_auipc, 
                                        h4_auipc, 
                                        h5_auipc, 
                                        h6_auipc, 
                                        h7_auipc, 
                                        h8_auipc};

assign ipdecode_ipdp_ind_br[7:0]     = {h1_ind_br,
                                        h2_ind_br,
                                        h3_ind_br,
                                        h4_ind_br,
                                        h5_ind_br,
                                        h6_ind_br,
                                        h7_ind_br,
                                        h8_ind_br};
assign ipdecode_ipdp_h0_ind_br       = h0_ind_br;
                                      
assign ipdecode_ipdp_jal[7:0]        = {h1_jal,
                                        h2_jal,
                                        h3_jal,
                                        h4_jal,
                                        h5_jal,
                                        h6_jal,
                                        h7_jal,
                                        h8_jal};
                                      
assign ipdecode_ipdp_jalr[7:0]       = {h1_jalr,
                                        h2_jalr,
                                        h3_jalr,
                                        h4_jalr,
                                        h5_jalr,
                                        h6_jalr,
                                        h7_jalr,
                                        h8_jalr};
                                      
//assign ipdecode_ipdp_split1[7:0]     = {h1_split,
//                                        h2_split,
//                                        h3_split,
//                                        h4_split,
//                                        h5_split,
//                                        h6_split,
//                                        h7_split,
//                                        h8_split};
//assign ipdecode_ipdp_h0_split1       =  h0_split;
//
//assign ipdecode_ipdp_split0[7:0]     = {h1_split_short,
//                                        h2_split_short,
//                                        h3_split_short,
//                                        h4_split_short,
//                                        h5_split_short,
//                                        h6_split_short,
//                                        h7_split_short,
//                                        h8_split_short};
//assign ipdecode_ipdp_h0_split0       =  h0_split_short;

assign ipdecode_ipdp_fence[7:0]      = {h1_fence,
                                        h2_fence,
                                        h3_fence,
                                        h4_fence,
                                        h5_fence,
                                        h6_fence,
                                        h7_fence,
                                        h8_fence};
assign ipdecode_ipdp_h0_fence        =  h0_fence;

//split short potential
assign ipdecode_ipdp_h0_split0_type[2:0] = h0_split_short_potnt[2:0];
assign ipdecode_ipdp_h1_split0_type[2:0] = h1_split_short_potnt[2:0];
assign ipdecode_ipdp_h2_split0_type[2:0] = h2_split_short_potnt[2:0];
assign ipdecode_ipdp_h3_split0_type[2:0] = h3_split_short_potnt[2:0];
assign ipdecode_ipdp_h4_split0_type[2:0] = h4_split_short_potnt[2:0];
assign ipdecode_ipdp_h5_split0_type[2:0] = h5_split_short_potnt[2:0];
assign ipdecode_ipdp_h6_split0_type[2:0] = h6_split_short_potnt[2:0];
assign ipdecode_ipdp_h7_split0_type[2:0] = h7_split_short_potnt[2:0];
assign ipdecode_ipdp_h8_split0_type[2:0] = h8_split_short_potnt[2:0];

//split long potential
assign ipdecode_ipdp_h0_split1_type[2:0] = h0_split_potnt[2:0];
assign ipdecode_ipdp_h1_split1_type[2:0] = h1_split_potnt[2:0];
assign ipdecode_ipdp_h2_split1_type[2:0] = h2_split_potnt[2:0];
assign ipdecode_ipdp_h3_split1_type[2:0] = h3_split_potnt[2:0];
assign ipdecode_ipdp_h4_split1_type[2:0] = h4_split_potnt[2:0];
assign ipdecode_ipdp_h5_split1_type[2:0] = h5_split_potnt[2:0];
assign ipdecode_ipdp_h6_split1_type[2:0] = h6_split_potnt[2:0];
assign ipdecode_ipdp_h7_split1_type[2:0] = h7_split_potnt[2:0];
assign ipdecode_ipdp_h8_split1_type[2:0] = h8_split_potnt[2:0];

//offset
assign ipdecode_ipdp_h0_offset[20:0]     = h0_offset[20:0];
assign ipdecode_ipdp_h1_offset[20:0]     = h1_offset[20:0];
assign ipdecode_ipdp_h2_offset[20:0]     = h2_offset[20:0];
assign ipdecode_ipdp_h3_offset[20:0]     = h3_offset[20:0];
assign ipdecode_ipdp_h4_offset[20:0]     = h4_offset[20:0];
assign ipdecode_ipdp_h5_offset[20:0]     = h5_offset[20:0];
assign ipdecode_ipdp_h6_offset[20:0]     = h6_offset[20:0];
assign ipdecode_ipdp_h7_offset[20:0]     = h7_offset[20:0];
assign ipdecode_ipdp_h8_offset[20:0]     = h8_offset[20:0];

//vtype
assign ipdecode_ipdp_vsetvli[7:0]    = {h1_vsetvli,
                                        h2_vsetvli,
                                        h3_vsetvli,
                                        h4_vsetvli,
                                        h5_vsetvli,
                                        h6_vsetvli,
                                        h7_vsetvli,
                                        h8_vsetvli};
assign ipdecode_ipdp_h0_vsetvli       = h0_vsetvli;

assign ipdecode_ipdp_vsew[23:0]       = {h1_vsew[2:0],
                                         h2_vsew[2:0],
                                         h3_vsew[2:0],
                                         h4_vsew[2:0],
                                         h5_vsew[2:0],
                                         h6_vsew[2:0],
                                         h7_vsew[2:0],
                                         h8_vsew[2:0]};
assign ipdecode_ipdp_h0_vsew[2:0 ]    = h0_vsew[2:0];

assign ipdecode_ipdp_vlmul[15:0]      = {h1_vlmul[1:0],
                                         h2_vlmul[1:0],
                                         h3_vlmul[1:0],
                                         h4_vlmul[1:0],
                                         h5_vlmul[1:0],
                                         h6_vlmul[1:0],
                                         h7_vlmul[1:0],
                                         h8_vlmul[1:0]};

assign ipdecode_ipdp_h0_vlmul[1:0]    = h0_vlmul[1:0];

assign ipdecode_ipdp_h0_vlmax[7:0]    = h0_vlmax[7:0];
assign ipdecode_ipdp_vlmax[63:0]      = {h1_vlmax[7:0],
                                         h2_vlmax[7:0],
                                         h3_vlmax[7:0],
                                         h4_vlmax[7:0],
                                         h5_vlmax[7:0],
                                         h6_vlmax[7:0],
                                         h7_vlmax[7:0],
                                         h8_vlmax[7:0]};


// &ModuleEnd; @381
endmodule


