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
module ct_vfdsu_pack(
  ex4_out_expt,
  ex4_out_result,
  vfdsu_ex4_denorm_to_tiny_frac,
  vfdsu_ex4_double,
  vfdsu_ex4_dz,
  vfdsu_ex4_expnt_rst,
  vfdsu_ex4_frac,
  vfdsu_ex4_nv,
  vfdsu_ex4_nx,
  vfdsu_ex4_of,
  vfdsu_ex4_of_rst_lfn,
  vfdsu_ex4_potnt_norm,
  vfdsu_ex4_potnt_of,
  vfdsu_ex4_potnt_uf,
  vfdsu_ex4_qnan_f,
  vfdsu_ex4_qnan_sign,
  vfdsu_ex4_result_inf,
  vfdsu_ex4_result_lfn,
  vfdsu_ex4_result_nor,
  vfdsu_ex4_result_qnan,
  vfdsu_ex4_result_sign,
  vfdsu_ex4_result_zero,
  vfdsu_ex4_rslt_denorm,
  vfdsu_ex4_single,
  vfdsu_ex4_uf
);

// &Ports; @23
input           vfdsu_ex4_denorm_to_tiny_frac; 
input           vfdsu_ex4_double;             
input           vfdsu_ex4_dz;                 
input   [12:0]  vfdsu_ex4_expnt_rst;          
input   [54:0]  vfdsu_ex4_frac;               
input           vfdsu_ex4_nv;                 
input           vfdsu_ex4_nx;                 
input           vfdsu_ex4_of;                 
input           vfdsu_ex4_of_rst_lfn;         
input   [1 :0]  vfdsu_ex4_potnt_norm;         
input           vfdsu_ex4_potnt_of;           
input           vfdsu_ex4_potnt_uf;           
input   [51:0]  vfdsu_ex4_qnan_f;             
input           vfdsu_ex4_qnan_sign;          
input           vfdsu_ex4_result_inf;         
input           vfdsu_ex4_result_lfn;         
input           vfdsu_ex4_result_nor;         
input           vfdsu_ex4_result_qnan;        
input           vfdsu_ex4_result_sign;        
input           vfdsu_ex4_result_zero;        
input           vfdsu_ex4_rslt_denorm;        
input           vfdsu_ex4_single;             
input           vfdsu_ex4_uf;                 
output  [4 :0]  ex4_out_expt;                 
output  [63:0]  ex4_out_result;               

// &Regs; @24
reg     [51:0]  ex4_denorm_frac;              
reg     [51:0]  ex4_frac_52;                  
reg     [51:0]  ex4_half_denorm_frac;         
reg     [63:0]  ex4_out_result;               
reg     [51:0]  ex4_single_denorm_frac;       
reg     [12:0]  expnt_add_op1;                

// &Wires; @25
wire            ex4_cor_nx;                   
wire            ex4_cor_uf;                   
wire            ex4_denorm_potnt_norm;        
wire    [63:0]  ex4_denorm_result;            
wire    [63:0]  ex4_doub_lfn;                 
wire    [63:0]  ex4_doub_rst0;                
wire    [63:0]  ex4_doub_rst_inf;             
wire    [63:0]  ex4_doub_rst_norm;            
wire    [63:0]  ex4_doub_rst_qnan;            
wire    [12:0]  ex4_expnt_rst;                
wire            ex4_final_rst_norm;           
wire    [54:0]  ex4_frac;                     
wire    [63:0]  ex4_half_lfn;                 
wire    [63:0]  ex4_half_rst0;                
wire    [63:0]  ex4_half_rst_inf;             
wire    [63:0]  ex4_half_rst_norm;            
wire    [63:0]  ex4_half_rst_qnan;            
wire            ex4_of_plus;                  
wire    [4 :0]  ex4_out_expt;                 
wire            ex4_result_inf;               
wire            ex4_result_lfn;               
wire            ex4_rslt_denorm;              
wire    [63:0]  ex4_rst0;                     
wire    [63:0]  ex4_rst_inf;                  
wire    [63:0]  ex4_rst_lfn;                  
wire            ex4_rst_nor;                  
wire    [63:0]  ex4_rst_norm;                 
wire    [63:0]  ex4_rst_qnan;                 
wire    [63:0]  ex4_sing_lfn;                 
wire    [63:0]  ex4_sing_rst0;                
wire    [63:0]  ex4_sing_rst_inf;             
wire    [63:0]  ex4_sing_rst_norm;            
wire    [63:0]  ex4_sing_rst_qnan;            
wire            ex4_uf_plus;                  
wire            vfdsu_ex4_denorm_to_tiny_frac; 
wire            vfdsu_ex4_double;             
wire            vfdsu_ex4_dz;                 
wire    [12:0]  vfdsu_ex4_expnt_rst;          
wire    [54:0]  vfdsu_ex4_frac;               
wire            vfdsu_ex4_nv;                 
wire            vfdsu_ex4_nx;                 
wire            vfdsu_ex4_of;                 
wire            vfdsu_ex4_of_rst_lfn;         
wire    [1 :0]  vfdsu_ex4_potnt_norm;         
wire            vfdsu_ex4_potnt_of;           
wire            vfdsu_ex4_potnt_uf;           
wire    [51:0]  vfdsu_ex4_qnan_f;             
wire            vfdsu_ex4_qnan_sign;          
wire            vfdsu_ex4_result_inf;         
wire            vfdsu_ex4_result_lfn;         
wire            vfdsu_ex4_result_nor;         
wire            vfdsu_ex4_result_qnan;        
wire            vfdsu_ex4_result_sign;        
wire            vfdsu_ex4_result_zero;        
wire            vfdsu_ex4_rslt_denorm;        
wire            vfdsu_ex4_single;             
wire            vfdsu_ex4_uf;                 


//============================EX4 STAGE=====================
assign ex4_frac[54:0] = vfdsu_ex4_frac[54:0];
//exponent adder
// &CombBeg; @30
always @( ex4_frac[54:53])
begin
casez(ex4_frac[54:53])
  2'b00   : expnt_add_op1[12:0] = 13'h0fff;  //the expnt sub 1
  2'b01   : expnt_add_op1[12:0] = 13'h0;    //the expnt stay the origi
  2'b1?   : expnt_add_op1[12:0] = 13'h1;    // the exptn add 1
  default : expnt_add_op1[12:0] = 13'b0;  
endcase
// &CombEnd; @37
end
assign ex4_expnt_rst[12:0] = vfdsu_ex4_expnt_rst[12:0] + 
                             expnt_add_op1[12:0];

//==========================Result Pack=====================

// result denormal pack 
// shift to the denormal number
// &CombBeg; @45
always @( vfdsu_ex4_expnt_rst[12:0]
       or ex4_frac[54:1]
       or vfdsu_ex4_denorm_to_tiny_frac)
begin
case(vfdsu_ex4_expnt_rst[12:0])
  13'h1:   ex4_denorm_frac[51:0] = {      ex4_frac[52:1]}; //-1022 1
  13'h0:   ex4_denorm_frac[51:0] = {      ex4_frac[53:2]}; //-1023 0
  13'h1fff:ex4_denorm_frac[51:0] = {      ex4_frac[54:3]}; //-1024 -1
  13'h1ffe:ex4_denorm_frac[51:0] = {1'b0, ex4_frac[54:4]}; //-1025 -2
  13'h1ffd:ex4_denorm_frac[51:0] = {2'b0, ex4_frac[54:5]}; //-1026 -3
  13'h1ffc:ex4_denorm_frac[51:0] = {3'b0, ex4_frac[54:6]}; //-1027 -4
  13'h1ffb:ex4_denorm_frac[51:0] = {4'b0, ex4_frac[54:7]}; //-1028 -5
  13'h1ffa:ex4_denorm_frac[51:0] = {5'b0, ex4_frac[54:8]}; //-1029 -6
  13'h1ff9:ex4_denorm_frac[51:0] = {6'b0, ex4_frac[54:9]}; //-1030 -7
  13'h1ff8:ex4_denorm_frac[51:0] = {7'b0, ex4_frac[54:10]}; //-1031 -8
  13'h1ff7:ex4_denorm_frac[51:0] = {8'b0, ex4_frac[54:11]}; //-1032 -9
  13'h1ff6:ex4_denorm_frac[51:0] = {9'b0, ex4_frac[54:12]}; //-1033 -10
  13'h1ff5:ex4_denorm_frac[51:0] = {10'b0,ex4_frac[54:13]}; //-1034 -11
  13'h1ff4:ex4_denorm_frac[51:0] = {11'b0,ex4_frac[54:14]}; //-1035 -12
  13'h1ff3:ex4_denorm_frac[51:0] = {12'b0,ex4_frac[54:15]}; //-1036 -13  
  13'h1ff2:ex4_denorm_frac[51:0] = {13'b0,ex4_frac[54:16]}; // -1037
  13'h1ff1:ex4_denorm_frac[51:0] = {14'b0,ex4_frac[54:17]}; //-1038
  13'h1ff0:ex4_denorm_frac[51:0] = {15'b0,ex4_frac[54:18]}; //-1039
  13'h1fef:ex4_denorm_frac[51:0] = {16'b0,ex4_frac[54:19]}; //-1040
  13'h1fee:ex4_denorm_frac[51:0] = {17'b0,ex4_frac[54:20]}; //-1041
  13'h1fed:ex4_denorm_frac[51:0] = {18'b0,ex4_frac[54:21]}; //-1042
  13'h1fec:ex4_denorm_frac[51:0] = {19'b0,ex4_frac[54:22]}; //-1043
  13'h1feb:ex4_denorm_frac[51:0] = {20'b0,ex4_frac[54:23]}; //-1044
  13'h1fea:ex4_denorm_frac[51:0] = {21'b0,ex4_frac[54:24]}; //-1045
  13'h1fe9:ex4_denorm_frac[51:0] = {22'b0,ex4_frac[54:25]}; //-1046
  13'h1fe8:ex4_denorm_frac[51:0] = {23'b0,ex4_frac[54:26]}; //-1047
  13'h1fe7:ex4_denorm_frac[51:0] = {24'b0,ex4_frac[54:27]}; //-1048
  13'h1fe6:ex4_denorm_frac[51:0] = {25'b0,ex4_frac[54:28]}; //-1049
  13'h1fe5:ex4_denorm_frac[51:0] = {26'b0,ex4_frac[54:29]}; //-1050
  13'h1fe4:ex4_denorm_frac[51:0] = {27'b0,ex4_frac[54:30]}; //-1056
  13'h1fe3:ex4_denorm_frac[51:0] = {28'b0,ex4_frac[54:31]}; //-1052
  13'h1fe2:ex4_denorm_frac[51:0] = {29'b0,ex4_frac[54:32]}; //-1053
  13'h1fe1:ex4_denorm_frac[51:0] = {30'b0,ex4_frac[54:33]}; //-1054
  13'h1fe0:ex4_denorm_frac[51:0] = {31'b0,ex4_frac[54:34]}; //-1055
  13'h1fdf:ex4_denorm_frac[51:0] = {32'b0,ex4_frac[54:35]}; //-1056
  13'h1fde:ex4_denorm_frac[51:0] = {33'b0,ex4_frac[54:36]}; //-1057
  13'h1fdd:ex4_denorm_frac[51:0] = {34'b0,ex4_frac[54:37]}; //-1058
  13'h1fdc:ex4_denorm_frac[51:0] = {35'b0,ex4_frac[54:38]}; //-1059
  13'h1fdb:ex4_denorm_frac[51:0] = {36'b0,ex4_frac[54:39]}; //-1060
  13'h1fda:ex4_denorm_frac[51:0] = {37'b0,ex4_frac[54:40]}; //-1061
  13'h1fd9:ex4_denorm_frac[51:0] = {38'b0,ex4_frac[54:41]}; //-1062
  13'h1fd8:ex4_denorm_frac[51:0] = {39'b0,ex4_frac[54:42]}; //-1063
  13'h1fd7:ex4_denorm_frac[51:0] = {40'b0,ex4_frac[54:43]}; //-1064
  13'h1fd6:ex4_denorm_frac[51:0] = {41'b0,ex4_frac[54:44]}; //-1065
  13'h1fd5:ex4_denorm_frac[51:0] = {42'b0,ex4_frac[54:45]};  //-1066
  13'h1fd4:ex4_denorm_frac[51:0] = {43'b0,ex4_frac[54:46]};  //-1067
  13'h1fd3:ex4_denorm_frac[51:0] = {44'b0,ex4_frac[54:47]};  //-1068
  13'h1fd2:ex4_denorm_frac[51:0] = {45'b0,ex4_frac[54:48]};  //-1069
  13'h1fd1:ex4_denorm_frac[51:0] = {46'b0,ex4_frac[54:49]};  //-1070
  13'h1fd0:ex4_denorm_frac[51:0] = {47'b0,ex4_frac[54:50]};  //-1071
  13'h1fcf:ex4_denorm_frac[51:0] = {48'b0,ex4_frac[54:51]};  //-1072
  13'h1fce:ex4_denorm_frac[51:0] = {49'b0,ex4_frac[54:52]};  //-1073
  13'h1fcd:ex4_denorm_frac[51:0] = {50'b0,ex4_frac[54:53]};  //-1074
  default: ex4_denorm_frac[51:0] = vfdsu_ex4_denorm_to_tiny_frac ? 52'b1 : 52'b0;
endcase                                                                  
// &CombEnd;    @102
end
// &CombBeg; @103
always @( vfdsu_ex4_expnt_rst[12:0]
       or ex4_frac[54:1]
       or vfdsu_ex4_denorm_to_tiny_frac)
begin
case(vfdsu_ex4_expnt_rst[12:0])
  13'h1:   ex4_single_denorm_frac[51:0] = {      ex4_frac[52:1]}; //-1022 1
  13'h0:   ex4_single_denorm_frac[51:0] = {      ex4_frac[53:2]}; //-1023 0
  13'h1fff:ex4_single_denorm_frac[51:0] = {      ex4_frac[54:3]}; //-1024 -1
  13'h1ffe:ex4_single_denorm_frac[51:0] = {1'b0, ex4_frac[54:4]}; //-1025 -2
  13'h1ffd:ex4_single_denorm_frac[51:0] = {2'b0, ex4_frac[54:5]}; //-1026 -3
  13'h1ffc:ex4_single_denorm_frac[51:0] = {3'b0, ex4_frac[54:6]}; //-1027 -4
  13'h1ffb:ex4_single_denorm_frac[51:0] = {4'b0, ex4_frac[54:7]}; //-1028 -5
  13'h1ffa:ex4_single_denorm_frac[51:0] = {5'b0, ex4_frac[54:8]}; //-1029 -6
  13'h1ff9:ex4_single_denorm_frac[51:0] = {6'b0, ex4_frac[54:9]}; //-1030 -7
  13'h1ff8:ex4_single_denorm_frac[51:0] = {7'b0, ex4_frac[54:10]}; //-1031 -8
  13'h1ff7:ex4_single_denorm_frac[51:0] = {8'b0, ex4_frac[54:11]}; //-1032 -9
  13'h1ff6:ex4_single_denorm_frac[51:0] = {9'b0, ex4_frac[54:12]}; //-1033 -10
  13'h1ff5:ex4_single_denorm_frac[51:0] = {10'b0,ex4_frac[54:13]}; //-1034 -11
  13'h1ff4:ex4_single_denorm_frac[51:0] = {11'b0,ex4_frac[54:14]}; //-1035 -12
  13'h1ff3:ex4_single_denorm_frac[51:0] = {12'b0,ex4_frac[54:15]}; //-1036 -13  
  13'h1ff2:ex4_single_denorm_frac[51:0] = {13'b0,ex4_frac[54:16]}; // -1037
  13'h1ff1:ex4_single_denorm_frac[51:0] = {14'b0,ex4_frac[54:17]}; //-1038
  13'h1ff0:ex4_single_denorm_frac[51:0] = {15'b0,ex4_frac[54:18]}; //-1039
  13'h1fef:ex4_single_denorm_frac[51:0] = {16'b0,ex4_frac[54:19]}; //-1040
  13'h1fee:ex4_single_denorm_frac[51:0] = {17'b0,ex4_frac[54:20]}; //-1041
  13'h1fed:ex4_single_denorm_frac[51:0] = {18'b0,ex4_frac[54:21]}; //-1042
  13'h1fec:ex4_single_denorm_frac[51:0] = {19'b0,ex4_frac[54:22]}; //-1043
  13'h1feb:ex4_single_denorm_frac[51:0] = {20'b0,ex4_frac[54:23]}; //-1044
  13'h1fea:ex4_single_denorm_frac[51:0] = {21'b0,ex4_frac[54:24]}; //-1044
  default :ex4_single_denorm_frac[51:0] = vfdsu_ex4_denorm_to_tiny_frac ?{23'b1,29'b0} : 52'b0; //-1045
endcase                                                                  
// &CombEnd; @131
end
// &CombBeg; @132
always @( vfdsu_ex4_expnt_rst[12:0]
       or ex4_frac[54:1]
       or vfdsu_ex4_denorm_to_tiny_frac)
begin
case(vfdsu_ex4_expnt_rst[12:0])
  13'h1:   ex4_half_denorm_frac[51:0] = {      ex4_frac[52:1]}; //-1022 1
  13'h0:   ex4_half_denorm_frac[51:0] = {      ex4_frac[53:2]}; //-1023 0
  13'h1fff:ex4_half_denorm_frac[51:0] = {      ex4_frac[54:3]}; //-1024 -1
  13'h1ffe:ex4_half_denorm_frac[51:0] = {1'b0, ex4_frac[54:4]}; //-1025 -2
  13'h1ffd:ex4_half_denorm_frac[51:0] = {2'b0, ex4_frac[54:5]}; //-1026 -3
  13'h1ffc:ex4_half_denorm_frac[51:0] = {3'b0, ex4_frac[54:6]}; //-1027 -4
  13'h1ffb:ex4_half_denorm_frac[51:0] = {4'b0, ex4_frac[54:7]}; //-1028 -5
  13'h1ffa:ex4_half_denorm_frac[51:0] = {5'b0, ex4_frac[54:8]}; //-1029 -6
  13'h1ff9:ex4_half_denorm_frac[51:0] = {6'b0, ex4_frac[54:9]}; //-1030 -7
  13'h1ff8:ex4_half_denorm_frac[51:0] = {7'b0, ex4_frac[54:10]}; //-1031 -8
  13'h1ff7:ex4_half_denorm_frac[51:0] = {8'b0, ex4_frac[54:11]}; //-1032 -9
  default :ex4_half_denorm_frac[51:0] = vfdsu_ex4_denorm_to_tiny_frac ?{10'b1,42'b0} : 52'b0; //-1045
endcase                                                                  
// &CombEnd; @147
end

//here when denormal number round to add1, it will become normal number
assign ex4_denorm_potnt_norm    = (vfdsu_ex4_potnt_norm[1] && ex4_frac[53]) || 
                                  (vfdsu_ex4_potnt_norm[0] && ex4_frac[54]) ;
assign ex4_rslt_denorm          = !vfdsu_ex4_result_qnan 
                                  && !vfdsu_ex4_result_zero 
                                  && (vfdsu_ex4_rslt_denorm && !ex4_denorm_potnt_norm);
assign ex4_denorm_result[63:0]  = vfdsu_ex4_double ? 
                                  {vfdsu_ex4_result_sign,11'h0,ex4_denorm_frac[51:0]} :
                                  vfdsu_ex4_single ? {32'hffffffff,vfdsu_ex4_result_sign,
                                        8'h0,ex4_single_denorm_frac[51:29]}  : {
                                        48'hffffffffffff,vfdsu_ex4_result_sign,5'h0,
                                        ex4_half_denorm_frac[51:42]};

                               

assign ex4_half_lfn[63:0]      = {48'hffffffffffff,vfdsu_ex4_result_sign,5'h1e,{10{1'b1}}};
assign ex4_half_rst_qnan[63:0] = {48'hffffffffffff,vfdsu_ex4_qnan_sign, 5'h1f,1'b1, vfdsu_ex4_qnan_f[8:0]};
assign ex4_half_rst_inf[63:0]  = {48'hffffffffffff,vfdsu_ex4_result_sign,5'h1f,10'b0};
assign ex4_half_rst_norm[63:0] = {48'hffffffffffff,vfdsu_ex4_result_sign,
                                  ex4_expnt_rst[4:0],
                                  ex4_frac_52[51:42]};
assign ex4_half_rst0[63:0] = {48'hffffffffffff,vfdsu_ex4_result_sign,15'h0};                                
//ex4 overflow/underflow plus                                 
assign ex4_rst_nor = vfdsu_ex4_result_nor;                    
assign ex4_of_plus = vfdsu_ex4_potnt_of  && 
                     (|ex4_frac[54:53])  && 
                     ex4_rst_nor;
assign ex4_uf_plus = vfdsu_ex4_potnt_uf  && 
                     (~|ex4_frac[54:53]) && 
                     ex4_rst_nor;
//ex4 overflow round result
assign ex4_result_lfn = (ex4_of_plus &&  vfdsu_ex4_of_rst_lfn) ||
                        vfdsu_ex4_result_lfn;
assign ex4_result_inf = (ex4_of_plus && !vfdsu_ex4_of_rst_lfn) ||
                        vfdsu_ex4_result_inf;
//Special Result Form
// result largest finity number
assign ex4_doub_lfn[63:0]      = {vfdsu_ex4_result_sign,11'h7fe,{52{1'b1}}};
assign ex4_sing_lfn[63:0]      = {32'hffffffff,vfdsu_ex4_result_sign,8'hfe,{23{1'b1}}};
// result 0
assign ex4_doub_rst0[63:0]     = {vfdsu_ex4_result_sign,63'b0};
assign ex4_sing_rst0[63:0]     = {32'hffffffff,vfdsu_ex4_result_sign,31'b0};
//result qNaN
// &Force("bus","vfdsu_ex4_qnan_f",51,0); @192
assign ex4_doub_rst_qnan[63:0] = {      vfdsu_ex4_qnan_sign, 11'h7ff, 1'b1, vfdsu_ex4_qnan_f[50:0]};
assign ex4_sing_rst_qnan[63:0] = {32'hffffffff,vfdsu_ex4_qnan_sign, 8'hff,   1'b1, vfdsu_ex4_qnan_f[21:0]};
//result infinity
assign ex4_doub_rst_inf[63:0]  = {vfdsu_ex4_result_sign,11'h7ff,52'b0};
assign ex4_sing_rst_inf[63:0]  = {32'hffffffff,vfdsu_ex4_result_sign,8'hff,23'b0};
//result normal
// &CombBeg; @199
always @( ex4_frac[54:0])
begin
casez(ex4_frac[54:53])
  2'b00   : ex4_frac_52[51:0]  = ex4_frac[51:0];
  2'b01   : ex4_frac_52[51:0]  = ex4_frac[52:1];
  2'b1?   : ex4_frac_52[51:0]  = ex4_frac[53:2];
  default : ex4_frac_52[51:0]  = 52'b0;
endcase
// &CombEnd; @206
end
assign ex4_doub_rst_norm[63:0] = {vfdsu_ex4_result_sign,
                                  ex4_expnt_rst[10:0],
                                  ex4_frac_52[51:0]};
assign ex4_sing_rst_norm[63:0] = {32'hffffffff,vfdsu_ex4_result_sign,
                                  ex4_expnt_rst[7:0],
                                  ex4_frac_52[51:29]};
assign ex4_rst_lfn[63:0]       = (vfdsu_ex4_double) ? ex4_doub_lfn[63:0] :
                                  vfdsu_ex4_single  ? ex4_sing_lfn[63:0] : ex4_half_lfn[63:0];

assign ex4_rst0[63:0]          = (vfdsu_ex4_double) ? ex4_doub_rst0[63:0] :
                                  vfdsu_ex4_single  ? ex4_sing_rst0[63:0] : ex4_half_rst0[63:0];

assign ex4_rst_qnan[63:0]      = (vfdsu_ex4_double) ? ex4_doub_rst_qnan[63:0] :
                                  vfdsu_ex4_single  ? ex4_sing_rst_qnan[63:0] 
                                                    : ex4_half_rst_qnan[63:0];

assign ex4_rst_norm[63:0]      = (vfdsu_ex4_double) ? ex4_doub_rst_norm[63:0] :
                                  vfdsu_ex4_single  ? ex4_sing_rst_norm[63:0]
                                                    : ex4_half_rst_norm[63:0];
assign ex4_rst_inf[63:0]       = (vfdsu_ex4_double) ? ex4_doub_rst_inf[63:0] :
                                  vfdsu_ex4_single  ? ex4_sing_rst_inf[63:0]
                                                    : ex4_half_rst_inf[63:0];

      
assign ex4_cor_uf            = (vfdsu_ex4_uf && !ex4_denorm_potnt_norm || ex4_uf_plus)
                               && vfdsu_ex4_nx;
assign ex4_cor_nx            =  vfdsu_ex4_nx 
                                || vfdsu_ex4_of 
                                || ex4_of_plus;
                                        
assign ex4_out_expt[4:0]           = {
                                  vfdsu_ex4_nv,
                                  vfdsu_ex4_dz,
                                  vfdsu_ex4_of | ex4_of_plus,
                                  ex4_cor_uf,
                                  ex4_cor_nx};

assign ex4_final_rst_norm      = !vfdsu_ex4_result_qnan && 
                                 !ex4_result_inf        &&
                                 !ex4_result_lfn        &&
                                 !vfdsu_ex4_result_zero &&
                                 !ex4_rslt_denorm; 
// &CombBeg; @249
always @( ex4_rst_norm[63:0]
       or ex4_result_lfn
       or vfdsu_ex4_result_qnan
       or ex4_rst_qnan[63:0]
       or ex4_rst0[63:0]
       or ex4_rslt_denorm
       or ex4_denorm_result[63:0]
       or ex4_result_inf
       or ex4_final_rst_norm
       or ex4_rst_lfn[63:0]
       or vfdsu_ex4_result_zero
       or ex4_rst_inf[63:0])
begin
case({ex4_rslt_denorm,
      vfdsu_ex4_result_qnan,
      ex4_result_inf,
      ex4_result_lfn,
      vfdsu_ex4_result_zero,
      ex4_final_rst_norm})
  6'b100000 : ex4_out_result[63:0]  = ex4_denorm_result[63:0];
  6'b010000 : ex4_out_result[63:0]  = ex4_rst_qnan[63:0]; 
  6'b001000 : ex4_out_result[63:0]  = ex4_rst_inf[63:0];
  6'b000100 : ex4_out_result[63:0]  = ex4_rst_lfn[63:0];
  6'b000010 : ex4_out_result[63:0]  = ex4_rst0[63:0];
  6'b000001 : ex4_out_result[63:0]  = ex4_rst_norm[63:0];
  default   : ex4_out_result[63:0]  = 64'b0;
endcase
// &CombEnd; @264
end

// &ModuleEnd; @266
endmodule


