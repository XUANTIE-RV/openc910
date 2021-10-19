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
module ct_iu_div_srt_radix16(
  cp0_iu_icg_en,
  cp0_yy_clk_en,
  cpurst_b,
  div_ex2_disp_0,
  div_ex2_dvd_disp,
  div_ex2_dvr_disp,
  div_ex2_inst_vld,
  div_exp_disp,
  forever_cpuclk,
  pad_yy_icg_scan_en,
  rtu_yy_xx_flush,
  srt_iter_finish,
  x_srt_div_result,
  x_srt_dvd,
  x_srt_dvr,
  x_srt_finish,
  x_srt_on,
  x_srt_rem_result,
  x_srt_select_vld,
  x_srt_shift_vld
);

// &Ports; @23
input           cp0_iu_icg_en;                
input           cp0_yy_clk_en;                
input           cpurst_b;                     
input           div_ex2_disp_0;               
input   [5 :0]  div_ex2_dvd_disp;             
input   [5 :0]  div_ex2_dvr_disp;             
input           div_ex2_inst_vld;             
input   [6 :0]  div_exp_disp;                 
input           forever_cpuclk;               
input           pad_yy_icg_scan_en;           
input           rtu_yy_xx_flush;              
input   [63:0]  x_srt_dvd;                    
input   [63:0]  x_srt_dvr;                    
input           x_srt_on;                     
input           x_srt_select_vld;             
input           x_srt_shift_vld;              
output          srt_iter_finish;              
output  [63:0]  x_srt_div_result;             
output          x_srt_finish;                 
output  [63:0]  x_srt_rem_result;             

// &Regs; @24
reg     [6 :0]  srt_cnt;                      
reg     [6 :0]  srt_exp_disp;                 
reg     [63:0]  srt_pos_remainder;            

// &Wires; @25
wire            cp0_iu_icg_en;                
wire            cp0_yy_clk_en;                
wire            cpurst_b;                     
wire            div_ex2_disp_0;               
wire    [5 :0]  div_ex2_dvd_disp;             
wire    [5 :0]  div_ex2_dvr_disp;             
wire            div_ex2_inst_vld;             
wire    [6 :0]  div_exp_disp;                 
wire    [63:0]  ex2_dvd_saved;                
wire    [63:0]  ex2_dvr_saved;                
wire            forever_cpuclk;               
wire    [65:0]  initial_divisor_in;           
wire    [70:0]  initial_remainder_in;         
wire            initial_srt_en;               
wire    [3 :0]  last_sel_bit;                 
wire            pad_yy_icg_scan_en;           
wire            rtu_yy_xx_flush;              
wire            srt_clk;                      
wire            srt_clk_en;                   
wire    [6 :0]  srt_cnt_ini;                  
wire    [6 :0]  srt_cnt_ini_tmp;              
wire            srt_cnt_one;                  
wire            srt_cnt_zero;                 
wire            srt_div_clk;                  
wire            srt_div_clk_en;               
wire    [65:0]  srt_divisor_borrowed_val;     
wire    [65:0]  srt_divisor_flop_borrow_in;   
wire            srt_divisor_flop_borrow_vld;  
wire            srt_finish;                   
wire            srt_iter_finish;              
wire    [63:0]  srt_pos_qt;                   
wire    [63:0]  srt_qt_flop_borrow_in_0;      
wire    [63:0]  srt_qt_flop_borrow_in_1;      
wire            srt_qt_flop_borrow_vld;       
wire    [67:0]  srt_qt_flop_borrowed_val_0;   
wire    [67:0]  srt_qt_flop_borrowed_val_1;   
wire    [65:0]  srt_remainder_borrowed_val;   
wire    [65:0]  srt_remainder_flop_borrow_in; 
wire            srt_remainder_flop_borrow_vld; 
wire    [70:0]  srt_remainder_neg;            
wire    [70:0]  srt_remainder_out;            
wire    [70:0]  srt_remainder_pos;            
wire            srt_remainder_zero;           
wire            srt_sm_on;                    
wire    [67:0]  total_qt_rt;                  
wire    [67:0]  total_qt_rt_minus;            
wire    [63:0]  x_srt_div_result;             
wire    [63:0]  x_srt_dvd;                    
wire    [63:0]  x_srt_dvr;                    
wire    [5 :0]  x_srt_dvr_disp;               
wire    [6 :0]  x_srt_exp_disp;               
wire            x_srt_finish;                 
wire            x_srt_inst_vld;               
wire            x_srt_on;                     
wire    [63:0]  x_srt_rem_result;             
wire            x_srt_select_vld;             
wire            x_srt_shift_vld;              


//==========================================================
//    SRT Remainder & Divisor for Quotient/Root Generate
//==========================================================
//===================Remainder Generate=====================
//gate clk
// &Instance("gated_clk_cell","x_srt_clk"); @32
gated_clk_cell  x_srt_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (srt_clk           ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (srt_clk_en        ),
  .module_en          (cp0_iu_icg_en     ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect( .clk_in         (forever_cpuclk), @33
//           .clk_out        (srt_clk),//Out Clock @34
//           .external_en    (1'b0), @35
//           .global_en      (cp0_yy_clk_en), @36
//           .local_en       (srt_clk_en),//Local Condition @37
//           .module_en   (cp0_iu_icg_en) @38
//         ); @39
assign srt_clk_en = rtu_yy_xx_flush
                    || x_srt_shift_vld
                    || x_srt_inst_vld
                    || x_srt_on
                    || x_srt_select_vld;
assign srt_remainder_flop_borrow_vld       = x_srt_shift_vld;
assign srt_remainder_flop_borrow_in[65:0]  = {2'b0,x_srt_dvd[63:0]};
assign srt_divisor_flop_borrow_vld         = x_srt_shift_vld;
assign srt_divisor_flop_borrow_in[65:0]    = {2'b0,x_srt_dvr[63:0]};
assign srt_qt_flop_borrow_vld              = x_srt_select_vld;


assign ex2_dvd_saved[63:0]                 = srt_remainder_borrowed_val[63:0];
assign ex2_dvr_saved[63:0]                 = srt_divisor_borrowed_val[63:0];
assign initial_srt_en             = x_srt_inst_vld;
assign x_srt_inst_vld             = div_ex2_inst_vld && !div_ex2_disp_0;
assign initial_remainder_in[70:0] = {7'b0,ex2_dvd_saved[63:0] << div_ex2_dvd_disp[5:0]};
assign initial_divisor_in[65:0]   = {ex2_dvr_saved[63:0] << div_ex2_dvr_disp[5:0],2'b0};
assign x_srt_exp_disp[6:0]        = div_exp_disp[6:0]; //used for calculate the iteration num
assign x_srt_dvr_disp[5:0]        = div_ex2_dvr_disp[5:0];


// &Instance("ct_vfdsu_srt_radix16_only_div"); @62
ct_vfdsu_srt_radix16_only_div  x_ct_vfdsu_srt_radix16_only_div (
  .cpurst_b                      (cpurst_b                     ),
  .initial_divisor_in            (initial_divisor_in           ),
  .initial_remainder_in          (initial_remainder_in         ),
  .initial_srt_en                (initial_srt_en               ),
  .last_sel_bit                  (last_sel_bit                 ),
  .qt_clk                        (srt_clk                      ),
  .srt_div_clk                   (srt_div_clk                  ),
  .srt_divisor_borrowed_val      (srt_divisor_borrowed_val     ),
  .srt_divisor_flop_borrow_in    (srt_divisor_flop_borrow_in   ),
  .srt_divisor_flop_borrow_vld   (srt_divisor_flop_borrow_vld  ),
  .srt_qt_flop_borrow_in_0       (srt_qt_flop_borrow_in_0      ),
  .srt_qt_flop_borrow_in_1       (srt_qt_flop_borrow_in_1      ),
  .srt_qt_flop_borrow_vld        (srt_qt_flop_borrow_vld       ),
  .srt_qt_flop_borrowed_val_0    (srt_qt_flop_borrowed_val_0   ),
  .srt_qt_flop_borrowed_val_1    (srt_qt_flop_borrowed_val_1   ),
  .srt_rem_clk                   (srt_clk                      ),
  .srt_remainder_borrowed_val    (srt_remainder_borrowed_val   ),
  .srt_remainder_flop_borrow_in  (srt_remainder_flop_borrow_in ),
  .srt_remainder_flop_borrow_vld (srt_remainder_flop_borrow_vld),
  .srt_remainder_neg             (srt_remainder_neg            ),
  .srt_remainder_out             (srt_remainder_out            ),
  .srt_remainder_pos             (srt_remainder_pos            ),
  .srt_remainder_zero            (srt_remainder_zero           ),
  .srt_sm_on                     (srt_sm_on                    ),
  .total_qt_rt                   (total_qt_rt                  ),
  .total_qt_rt_minus             (total_qt_rt_minus            )
);

// &Connect(.srt_first_round(1'b0)); @63
// &Connect(.srt_rem_clk(srt_clk)); @64
// &Connect(.qt_clk(srt_clk)); @65

//=====================Gated Cell===========================
//gate clk
assign srt_div_clk_en = x_srt_shift_vld || x_srt_inst_vld || rtu_yy_xx_flush;
// &Instance("gated_clk_cell","x_srt_div_clk"); @70
gated_clk_cell  x_srt_div_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (srt_div_clk       ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (srt_div_clk_en    ),
  .module_en          (cp0_iu_icg_en     ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect( .clk_in         (forever_cpuclk), @71
//           .clk_out        (srt_div_clk),//Out Clock @72
//           .external_en    (1'b0), @73
//           .global_en      (cp0_yy_clk_en), @74
//           .local_en       (srt_div_clk_en),//Local Condition @75
//           .module_en   (cp0_iu_icg_en) @76
//         ); @77


//=================Save exponent displacement===============
always @(posedge srt_div_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    srt_exp_disp[6:0] <= 7'b0;
  else if(rtu_yy_xx_flush)
    srt_exp_disp[6:0] <= 7'b0;
  else if(x_srt_inst_vld)
    srt_exp_disp[6:0] <= x_srt_exp_disp[6:0];
  else
    srt_exp_disp[6:0] <= srt_exp_disp[6:0];
end

//assign srt_exp_neg = srt_exp_disp[6];

//==========================================================
//                   srt counter and on
//==========================================================
always @(posedge srt_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    srt_cnt[6:0] <= 7'b0;
  else if(x_srt_inst_vld)
    srt_cnt[6:0] <= {1'b0,srt_cnt_ini[5:0]};
  else if(srt_sm_on)
    srt_cnt[6:0] <= srt_cnt[6:0] - 7'b1;
  else
    srt_cnt[6:0] <= srt_cnt[6:0];
end

//srt_cnt_ini[5:0]
//For Long,   initial is 5'd32, calculate 33 round
//For Double, initial is 5'b11100('d28), calculate 29 round
//For Single, initial is 5'b01110('d14), calculate 15 round
assign srt_cnt_ini_tmp[6:0] = {x_srt_exp_disp[6:0]}+7'b10;
assign srt_cnt_ini[6:0] = {2'b0, srt_cnt_ini_tmp[6:2]}
                        + {6'b0, |srt_cnt_ini_tmp[1:0]}-7'd1;
assign last_sel_bit[3:0]= srt_cnt_zero ?  {srt_cnt_ini_tmp[1:0]==2'b00,
                                           srt_cnt_ini_tmp[1:0]==2'b11,
                                           srt_cnt_ini_tmp[1:0]==2'b10,
                                           srt_cnt_ini_tmp[1:0]==2'b01}
                                       : 4'b1000;
assign srt_cnt_zero     = ~|srt_cnt[5:0] || srt_cnt[6];
assign srt_cnt_one      = srt_cnt[5:0] == 6'b1 || srt_cnt_zero;
assign srt_sm_on        = x_srt_on;
//assign srt_sm_on       = x_srt_on && (srt_cnt[6:0] != 7'b0);
//assign srt_last_round   = x_srt_on && (srt_remainder_zero || srt_cnt_zero);
assign srt_finish       = srt_remainder_zero || srt_cnt_one;
assign x_srt_finish     = srt_finish;
assign srt_iter_finish  = srt_remainder_zero || srt_cnt_zero;


//==========================================================
//                 final result select
//==========================================================
// the last round, because we only select few bit of last round's quotient
// the remainder is kindly be shifted, we should shifted back
// &CombBeg; @137
always @( srt_remainder_pos[68:2]
       or srt_remainder_neg[68:2]
       or srt_remainder_out[70]
       or last_sel_bit[3:0])
begin
  case({srt_remainder_out[70],last_sel_bit[3:0]})
    5'b01000: srt_pos_remainder[63:0] = srt_remainder_pos[65:2];
    5'b00100: srt_pos_remainder[63:0] = srt_remainder_pos[66:3];
    5'b00010: srt_pos_remainder[63:0] = srt_remainder_pos[67:4];
    5'b00001: srt_pos_remainder[63:0] = srt_remainder_pos[68:5];
    5'b11000: srt_pos_remainder[63:0] = srt_remainder_neg[65:2];
    5'b10100: srt_pos_remainder[63:0] = srt_remainder_neg[66:3];
    5'b10010: srt_pos_remainder[63:0] = srt_remainder_neg[67:4];
    5'b10001: srt_pos_remainder[63:0] = srt_remainder_neg[68:5];
    default:  srt_pos_remainder[63:0] = {64{1'bx}};
  endcase
// &CombEnd; @149
end
assign srt_qt_flop_borrow_in_1[63:0] = srt_pos_remainder[63:0] >> x_srt_dvr_disp[5:0];
assign srt_pos_qt[63:0]              = srt_remainder_out[70] ? total_qt_rt_minus[66:3]
                                                             : total_qt_rt[66:3];
assign srt_qt_flop_borrow_in_0[63:0] = srt_pos_qt[63:0] >> (6'd63-srt_exp_disp[5:0]);                                                             



assign x_srt_rem_result[63:0] = srt_qt_flop_borrowed_val_1[63:0];
assign x_srt_div_result[63:0] = srt_qt_flop_borrowed_val_0[63:0];


// &ModuleEnd; @161
endmodule


