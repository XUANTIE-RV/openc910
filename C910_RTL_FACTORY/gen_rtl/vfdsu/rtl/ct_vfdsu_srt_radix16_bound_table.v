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
module ct_vfdsu_srt_radix16_bound_table(
  bound_sel,
  digit_bound_1,
  digit_bound_2,
  digit_bound_3,
  digit_bound_4,
  digit_bound_5,
  digit_bound_6,
  digit_bound_7,
  digit_bound_8,
  digit_bound_9,
  sqrt_first_round,
  sqrt_secd_round,
  sqrt_secd_round_sign
);

// &Ports; @23
input   [6 :0]  bound_sel;           
input           sqrt_first_round;    
input           sqrt_secd_round;     
input           sqrt_secd_round_sign; 
output  [11:0]  digit_bound_1;       
output  [11:0]  digit_bound_2;       
output  [11:0]  digit_bound_3;       
output  [11:0]  digit_bound_4;       
output  [11:0]  digit_bound_5;       
output  [11:0]  digit_bound_6;       
output  [11:0]  digit_bound_7;       
output  [11:0]  digit_bound_8;       
output  [11:0]  digit_bound_9;       

// &Regs; @24
reg     [11:0]  ori_digit_bound_1;   
reg     [11:0]  ori_digit_bound_2;   
reg     [11:0]  ori_digit_bound_3;   
reg     [11:0]  ori_digit_bound_4;   
reg     [11:0]  ori_digit_bound_5;   
reg     [11:0]  ori_digit_bound_6;   
reg     [11:0]  ori_digit_bound_7;   
reg     [11:0]  ori_digit_bound_8;   
reg     [11:0]  ori_digit_bound_9;   
reg     [11:0]  sqrt_digit_boundm2_1; 
reg     [11:0]  sqrt_digit_boundm2_2; 
reg     [11:0]  sqrt_digit_boundm2_3; 
reg     [11:0]  sqrt_digit_boundm2_4; 
reg     [11:0]  sqrt_digit_boundm2_5; 
reg     [11:0]  sqrt_digit_boundm2_6; 
reg     [11:0]  sqrt_digit_boundm2_7; 
reg     [11:0]  sqrt_digit_boundm2_8; 
reg     [11:0]  sqrt_digit_boundm2_9; 
reg     [11:0]  sqrt_digit_boundp2_1; 
reg     [11:0]  sqrt_digit_boundp2_2; 
reg     [11:0]  sqrt_digit_boundp2_3; 
reg     [11:0]  sqrt_digit_boundp2_4; 
reg     [11:0]  sqrt_digit_boundp2_5; 
reg     [11:0]  sqrt_digit_boundp2_6; 
reg     [11:0]  sqrt_digit_boundp2_7; 
reg     [11:0]  sqrt_digit_boundp2_8; 
reg     [11:0]  sqrt_digit_boundp2_9; 

// &Wires; @25
wire    [6 :0]  bound_sel;           
wire    [11:0]  digit_bound_1;       
wire    [11:0]  digit_bound_2;       
wire    [11:0]  digit_bound_3;       
wire    [11:0]  digit_bound_4;       
wire    [11:0]  digit_bound_5;       
wire    [11:0]  digit_bound_6;       
wire    [11:0]  digit_bound_7;       
wire    [11:0]  digit_bound_8;       
wire    [11:0]  digit_bound_9;       
wire    [11:0]  sqrt_digit_bound2_1; 
wire    [11:0]  sqrt_digit_bound2_2; 
wire    [11:0]  sqrt_digit_bound2_3; 
wire    [11:0]  sqrt_digit_bound2_4; 
wire    [11:0]  sqrt_digit_bound2_5; 
wire    [11:0]  sqrt_digit_bound2_6; 
wire    [11:0]  sqrt_digit_bound2_7; 
wire    [11:0]  sqrt_digit_bound2_8; 
wire    [11:0]  sqrt_digit_bound2_9; 
wire            sqrt_first_round;    
wire            sqrt_secd_round;     
wire            sqrt_secd_round_sign; 


// &CombBeg; @27
always @( bound_sel[6:0])
begin
case(bound_sel[6:0])
  	7'h40:
	begin
		ori_digit_bound_1[11:0] = 12'h1b;//27
		ori_digit_bound_2[11:0] = 12'h5c;//92
		ori_digit_bound_3[11:0] = 12'h9d;//157
		ori_digit_bound_4[11:0] = 12'hde;//222
		ori_digit_bound_5[11:0] = 12'h120;//288
		ori_digit_bound_6[11:0] = 12'h161;//353
		ori_digit_bound_7[11:0] = 12'h1a2;//418
		ori_digit_bound_8[11:0] = 12'h1e3;//483
		ori_digit_bound_9[11:0] = 12'h225;//549

	end
	7'h41:
	begin
		ori_digit_bound_1[11:0] = 12'h1b;//27
		ori_digit_bound_2[11:0] = 12'h5d;//93
		ori_digit_bound_3[11:0] = 12'ha0;//160
		ori_digit_bound_4[11:0] = 12'he2;//226
		ori_digit_bound_5[11:0] = 12'h124;//292
		ori_digit_bound_6[11:0] = 12'h166;//358
		ori_digit_bound_7[11:0] = 12'h1a9;//425
		ori_digit_bound_8[11:0] = 12'h1eb;//491
		ori_digit_bound_9[11:0] = 12'h22d;//557

	end
	7'h42:
	begin
		ori_digit_bound_1[11:0] = 12'h1b;//27
		ori_digit_bound_2[11:0] = 12'h5f;//95
		ori_digit_bound_3[11:0] = 12'ha2;//162
		ori_digit_bound_4[11:0] = 12'he5;//229
		ori_digit_bound_5[11:0] = 12'h128;//296
		ori_digit_bound_6[11:0] = 12'h16c;//364
		ori_digit_bound_7[11:0] = 12'h1af;//431
		ori_digit_bound_8[11:0] = 12'h1f2;//498
		ori_digit_bound_9[11:0] = 12'h236;//566

	end
	7'h43:
	begin
		ori_digit_bound_1[11:0] = 12'h1c;//28
		ori_digit_bound_2[11:0] = 12'h60;//96
		ori_digit_bound_3[11:0] = 12'ha4;//164
		ori_digit_bound_4[11:0] = 12'he9;//233
		ori_digit_bound_5[11:0] = 12'h12d;//301
		ori_digit_bound_6[11:0] = 12'h171;//369
		ori_digit_bound_7[11:0] = 12'h1b5;//437
		ori_digit_bound_8[11:0] = 12'h1fa;//506
		ori_digit_bound_9[11:0] = 12'h23e;//574

	end
	7'h44:
	begin
		ori_digit_bound_1[11:0] = 12'h1c;//28
		ori_digit_bound_2[11:0] = 12'h61;//97
		ori_digit_bound_3[11:0] = 12'ha7;//167
		ori_digit_bound_4[11:0] = 12'hec;//236
		ori_digit_bound_5[11:0] = 12'h131;//305
		ori_digit_bound_6[11:0] = 12'h177;//375
		ori_digit_bound_7[11:0] = 12'h1bc;//444
		ori_digit_bound_8[11:0] = 12'h201;//513
		ori_digit_bound_9[11:0] = 12'h246;//582

	end
	7'h45:
	begin
		ori_digit_bound_1[11:0] = 12'h1d;//29
		ori_digit_bound_2[11:0] = 12'h63;//99
		ori_digit_bound_3[11:0] = 12'ha9;//169
		ori_digit_bound_4[11:0] = 12'hef;//239
		ori_digit_bound_5[11:0] = 12'h136;//310
		ori_digit_bound_6[11:0] = 12'h17c;//380
		ori_digit_bound_7[11:0] = 12'h1c2;//450
		ori_digit_bound_8[11:0] = 12'h208;//520
		ori_digit_bound_9[11:0] = 12'h24f;//591

	end
	7'h46:
	begin
		ori_digit_bound_1[11:0] = 12'h1d;//29
		ori_digit_bound_2[11:0] = 12'h64;//100
		ori_digit_bound_3[11:0] = 12'hac;//172
		ori_digit_bound_4[11:0] = 12'hf3;//243
		ori_digit_bound_5[11:0] = 12'h13a;//314
		ori_digit_bound_6[11:0] = 12'h181;//385
		ori_digit_bound_7[11:0] = 12'h1c9;//457
		ori_digit_bound_8[11:0] = 12'h210;//528
		ori_digit_bound_9[11:0] = 12'h257;//599

	end
	7'h47:
	begin
		ori_digit_bound_1[11:0] = 12'h1d;//29
		ori_digit_bound_2[11:0] = 12'h66;//102
		ori_digit_bound_3[11:0] = 12'hae;//174
		ori_digit_bound_4[11:0] = 12'hf6;//246
		ori_digit_bound_5[11:0] = 12'h13e;//318
		ori_digit_bound_6[11:0] = 12'h187;//391
		ori_digit_bound_7[11:0] = 12'h1cf;//463
		ori_digit_bound_8[11:0] = 12'h217;//535
		ori_digit_bound_9[11:0] = 12'h260;//608

	end
	7'h48:
	begin
		ori_digit_bound_1[11:0] = 12'h1e;//30
		ori_digit_bound_2[11:0] = 12'h67;//103
		ori_digit_bound_3[11:0] = 12'hb0;//176
		ori_digit_bound_4[11:0] = 12'hfa;//250
		ori_digit_bound_5[11:0] = 12'h143;//323
		ori_digit_bound_6[11:0] = 12'h18c;//396
		ori_digit_bound_7[11:0] = 12'h1d5;//469
		ori_digit_bound_8[11:0] = 12'h21f;//543
		ori_digit_bound_9[11:0] = 12'h268;//616

	end
	7'h49:
	begin
		ori_digit_bound_1[11:0] = 12'h1e;//30
		ori_digit_bound_2[11:0] = 12'h68;//104
		ori_digit_bound_3[11:0] = 12'hb3;//179
		ori_digit_bound_4[11:0] = 12'hfd;//253
		ori_digit_bound_5[11:0] = 12'h147;//327
		ori_digit_bound_6[11:0] = 12'h192;//402
		ori_digit_bound_7[11:0] = 12'h1dc;//476
		ori_digit_bound_8[11:0] = 12'h226;//550
		ori_digit_bound_9[11:0] = 12'h270;//624

	end
	7'h4a:
	begin
		ori_digit_bound_1[11:0] = 12'h1f;//31
		ori_digit_bound_2[11:0] = 12'h6a;//106
		ori_digit_bound_3[11:0] = 12'hb5;//181
		ori_digit_bound_4[11:0] = 12'h100;//256
		ori_digit_bound_5[11:0] = 12'h14c;//332
		ori_digit_bound_6[11:0] = 12'h197;//407
		ori_digit_bound_7[11:0] = 12'h1e2;//482
		ori_digit_bound_8[11:0] = 12'h22d;//557
		ori_digit_bound_9[11:0] = 12'h279;//633

	end
	7'h4b:
	begin
		ori_digit_bound_1[11:0] = 12'h1f;//31
		ori_digit_bound_2[11:0] = 12'h6b;//107
		ori_digit_bound_3[11:0] = 12'hb8;//184
		ori_digit_bound_4[11:0] = 12'h104;//260
		ori_digit_bound_5[11:0] = 12'h150;//336
		ori_digit_bound_6[11:0] = 12'h19c;//412
		ori_digit_bound_7[11:0] = 12'h1e9;//489
		ori_digit_bound_8[11:0] = 12'h235;//565
		ori_digit_bound_9[11:0] = 12'h281;//641

	end
	7'h4c:
	begin
		ori_digit_bound_1[11:0] = 12'h1f;//31
		ori_digit_bound_2[11:0] = 12'h6d;//109
		ori_digit_bound_3[11:0] = 12'hba;//186
		ori_digit_bound_4[11:0] = 12'h107;//263
		ori_digit_bound_5[11:0] = 12'h154;//340
		ori_digit_bound_6[11:0] = 12'h1a2;//418
		ori_digit_bound_7[11:0] = 12'h1ef;//495
		ori_digit_bound_8[11:0] = 12'h23c;//572
		ori_digit_bound_9[11:0] = 12'h28a;//650

	end
	7'h4d:
	begin
		ori_digit_bound_1[11:0] = 12'h20;//32
		ori_digit_bound_2[11:0] = 12'h6e;//110
		ori_digit_bound_3[11:0] = 12'hbc;//188
		ori_digit_bound_4[11:0] = 12'h10b;//267
		ori_digit_bound_5[11:0] = 12'h159;//345
		ori_digit_bound_6[11:0] = 12'h1a7;//423
		ori_digit_bound_7[11:0] = 12'h1f5;//501
		ori_digit_bound_8[11:0] = 12'h244;//580
		ori_digit_bound_9[11:0] = 12'h292;//658

	end
	7'h4e:
	begin
		ori_digit_bound_1[11:0] = 12'h20;//32
		ori_digit_bound_2[11:0] = 12'h6f;//111
		ori_digit_bound_3[11:0] = 12'hbf;//191
		ori_digit_bound_4[11:0] = 12'h10e;//270
		ori_digit_bound_5[11:0] = 12'h15d;//349
		ori_digit_bound_6[11:0] = 12'h1ad;//429
		ori_digit_bound_7[11:0] = 12'h1fc;//508
		ori_digit_bound_8[11:0] = 12'h24b;//587
		ori_digit_bound_9[11:0] = 12'h29a;//666

	end
	7'h4f:
	begin
		ori_digit_bound_1[11:0] = 12'h21;//33
		ori_digit_bound_2[11:0] = 12'h71;//113
		ori_digit_bound_3[11:0] = 12'hc1;//193
		ori_digit_bound_4[11:0] = 12'h111;//273
		ori_digit_bound_5[11:0] = 12'h162;//354
		ori_digit_bound_6[11:0] = 12'h1b2;//434
		ori_digit_bound_7[11:0] = 12'h202;//514
		ori_digit_bound_8[11:0] = 12'h252;//594
		ori_digit_bound_9[11:0] = 12'h2a3;//675

	end
	7'h50:
	begin
		ori_digit_bound_1[11:0] = 12'h21;//33
		ori_digit_bound_2[11:0] = 12'h72;//114
		ori_digit_bound_3[11:0] = 12'hc4;//196
		ori_digit_bound_4[11:0] = 12'h115;//277
		ori_digit_bound_5[11:0] = 12'h166;//358
		ori_digit_bound_6[11:0] = 12'h1b7;//439
		ori_digit_bound_7[11:0] = 12'h209;//521
		ori_digit_bound_8[11:0] = 12'h25a;//602
		ori_digit_bound_9[11:0] = 12'h2ab;//683

	end
	7'h51:
	begin
		ori_digit_bound_1[11:0] = 12'h21;//33
		ori_digit_bound_2[11:0] = 12'h74;//116
		ori_digit_bound_3[11:0] = 12'hc6;//198
		ori_digit_bound_4[11:0] = 12'h118;//280
		ori_digit_bound_5[11:0] = 12'h16a;//362
		ori_digit_bound_6[11:0] = 12'h1bd;//445
		ori_digit_bound_7[11:0] = 12'h20f;//527
		ori_digit_bound_8[11:0] = 12'h261;//609
		ori_digit_bound_9[11:0] = 12'h2b4;//692

	end
	7'h52:
	begin
		ori_digit_bound_1[11:0] = 12'h22;//34
		ori_digit_bound_2[11:0] = 12'h75;//117
		ori_digit_bound_3[11:0] = 12'hc8;//200
		ori_digit_bound_4[11:0] = 12'h11c;//284
		ori_digit_bound_5[11:0] = 12'h16f;//367
		ori_digit_bound_6[11:0] = 12'h1c2;//450
		ori_digit_bound_7[11:0] = 12'h215;//533
		ori_digit_bound_8[11:0] = 12'h269;//617
		ori_digit_bound_9[11:0] = 12'h2bc;//700

	end
	7'h53:
	begin
		ori_digit_bound_1[11:0] = 12'h22;//34
		ori_digit_bound_2[11:0] = 12'h76;//118
		ori_digit_bound_3[11:0] = 12'hcb;//203
		ori_digit_bound_4[11:0] = 12'h11f;//287
		ori_digit_bound_5[11:0] = 12'h173;//371
		ori_digit_bound_6[11:0] = 12'h1c8;//456
		ori_digit_bound_7[11:0] = 12'h21c;//540
		ori_digit_bound_8[11:0] = 12'h270;//624
		ori_digit_bound_9[11:0] = 12'h2c4;//708

	end
	7'h54:
	begin
		ori_digit_bound_1[11:0] = 12'h23;//35
		ori_digit_bound_2[11:0] = 12'h78;//120
		ori_digit_bound_3[11:0] = 12'hcd;//205
		ori_digit_bound_4[11:0] = 12'h122;//290
		ori_digit_bound_5[11:0] = 12'h178;//376
		ori_digit_bound_6[11:0] = 12'h1cd;//461
		ori_digit_bound_7[11:0] = 12'h222;//546
		ori_digit_bound_8[11:0] = 12'h277;//631
		ori_digit_bound_9[11:0] = 12'h2cd;//717

	end
	7'h55:
	begin
		ori_digit_bound_1[11:0] = 12'h23;//35
		ori_digit_bound_2[11:0] = 12'h79;//121
		ori_digit_bound_3[11:0] = 12'hd0;//208
		ori_digit_bound_4[11:0] = 12'h126;//294
		ori_digit_bound_5[11:0] = 12'h17c;//380
		ori_digit_bound_6[11:0] = 12'h1d2;//466
		ori_digit_bound_7[11:0] = 12'h229;//553
		ori_digit_bound_8[11:0] = 12'h27f;//639
		ori_digit_bound_9[11:0] = 12'h2d5;//725

	end
	7'h56:
	begin
		ori_digit_bound_1[11:0] = 12'h23;//35
		ori_digit_bound_2[11:0] = 12'h7b;//123
		ori_digit_bound_3[11:0] = 12'hd2;//210
		ori_digit_bound_4[11:0] = 12'h129;//297
		ori_digit_bound_5[11:0] = 12'h180;//384
		ori_digit_bound_6[11:0] = 12'h1d8;//472
		ori_digit_bound_7[11:0] = 12'h22f;//559
		ori_digit_bound_8[11:0] = 12'h286;//646
		ori_digit_bound_9[11:0] = 12'h2de;//734

	end
	7'h57:
	begin
		ori_digit_bound_1[11:0] = 12'h24;//36
		ori_digit_bound_2[11:0] = 12'h7c;//124
		ori_digit_bound_3[11:0] = 12'hd4;//212
		ori_digit_bound_4[11:0] = 12'h12d;//301
		ori_digit_bound_5[11:0] = 12'h185;//389
		ori_digit_bound_6[11:0] = 12'h1dd;//477
		ori_digit_bound_7[11:0] = 12'h235;//565
		ori_digit_bound_8[11:0] = 12'h28e;//654
		ori_digit_bound_9[11:0] = 12'h2e6;//742

	end
	7'h58:
	begin
		ori_digit_bound_1[11:0] = 12'h24;//36
		ori_digit_bound_2[11:0] = 12'h7d;//125
		ori_digit_bound_3[11:0] = 12'hd7;//215
		ori_digit_bound_4[11:0] = 12'h130;//304
		ori_digit_bound_5[11:0] = 12'h189;//393
		ori_digit_bound_6[11:0] = 12'h1e3;//483
		ori_digit_bound_7[11:0] = 12'h23c;//572
		ori_digit_bound_8[11:0] = 12'h295;//661
		ori_digit_bound_9[11:0] = 12'h2ee;//750

	end
	7'h59:
	begin
		ori_digit_bound_1[11:0] = 12'h25;//37
		ori_digit_bound_2[11:0] = 12'h7f;//127
		ori_digit_bound_3[11:0] = 12'hd9;//217
		ori_digit_bound_4[11:0] = 12'h133;//307
		ori_digit_bound_5[11:0] = 12'h18e;//398
		ori_digit_bound_6[11:0] = 12'h1e8;//488
		ori_digit_bound_7[11:0] = 12'h242;//578
		ori_digit_bound_8[11:0] = 12'h29c;//668
		ori_digit_bound_9[11:0] = 12'h2f7;//759

	end
	7'h5a:
	begin
		ori_digit_bound_1[11:0] = 12'h25;//37
		ori_digit_bound_2[11:0] = 12'h80;//128
		ori_digit_bound_3[11:0] = 12'hdc;//220
		ori_digit_bound_4[11:0] = 12'h137;//311
		ori_digit_bound_5[11:0] = 12'h192;//402
		ori_digit_bound_6[11:0] = 12'h1ed;//493
		ori_digit_bound_7[11:0] = 12'h249;//585
		ori_digit_bound_8[11:0] = 12'h2a4;//676
		ori_digit_bound_9[11:0] = 12'h2ff;//767

	end
	7'h5b:
	begin
		ori_digit_bound_1[11:0] = 12'h25;//37
		ori_digit_bound_2[11:0] = 12'h82;//130
		ori_digit_bound_3[11:0] = 12'hde;//222
		ori_digit_bound_4[11:0] = 12'h13a;//314
		ori_digit_bound_5[11:0] = 12'h196;//406
		ori_digit_bound_6[11:0] = 12'h1f3;//499
		ori_digit_bound_7[11:0] = 12'h24f;//591
		ori_digit_bound_8[11:0] = 12'h2ab;//683
		ori_digit_bound_9[11:0] = 12'h308;//776

	end
	7'h5c:
	begin
		ori_digit_bound_1[11:0] = 12'h26;//38
		ori_digit_bound_2[11:0] = 12'h83;//131
		ori_digit_bound_3[11:0] = 12'he0;//224
		ori_digit_bound_4[11:0] = 12'h13e;//318
		ori_digit_bound_5[11:0] = 12'h19b;//411
		ori_digit_bound_6[11:0] = 12'h1f8;//504
		ori_digit_bound_7[11:0] = 12'h255;//597
		ori_digit_bound_8[11:0] = 12'h2b3;//691
		ori_digit_bound_9[11:0] = 12'h310;//784

	end
	7'h5d:
	begin
		ori_digit_bound_1[11:0] = 12'h26;//38
		ori_digit_bound_2[11:0] = 12'h84;//132
		ori_digit_bound_3[11:0] = 12'he3;//227
		ori_digit_bound_4[11:0] = 12'h141;//321
		ori_digit_bound_5[11:0] = 12'h19f;//415
		ori_digit_bound_6[11:0] = 12'h1fe;//510
		ori_digit_bound_7[11:0] = 12'h25c;//604
		ori_digit_bound_8[11:0] = 12'h2ba;//698
		ori_digit_bound_9[11:0] = 12'h318;//792

	end
	7'h5e:
	begin
		ori_digit_bound_1[11:0] = 12'h27;//39
		ori_digit_bound_2[11:0] = 12'h86;//134
		ori_digit_bound_3[11:0] = 12'he5;//229
		ori_digit_bound_4[11:0] = 12'h144;//324
		ori_digit_bound_5[11:0] = 12'h1a4;//420
		ori_digit_bound_6[11:0] = 12'h203;//515
		ori_digit_bound_7[11:0] = 12'h262;//610
		ori_digit_bound_8[11:0] = 12'h2c1;//705
		ori_digit_bound_9[11:0] = 12'h321;//801

	end
	7'h5f:
	begin
		ori_digit_bound_1[11:0] = 12'h27;//39
		ori_digit_bound_2[11:0] = 12'h87;//135
		ori_digit_bound_3[11:0] = 12'he8;//232
		ori_digit_bound_4[11:0] = 12'h148;//328
		ori_digit_bound_5[11:0] = 12'h1a8;//424
		ori_digit_bound_6[11:0] = 12'h208;//520
		ori_digit_bound_7[11:0] = 12'h269;//617
		ori_digit_bound_8[11:0] = 12'h2c9;//713
		ori_digit_bound_9[11:0] = 12'h329;//809

	end
	7'h60:
	begin
		ori_digit_bound_1[11:0] = 12'h27;//39
		ori_digit_bound_2[11:0] = 12'h89;//137
		ori_digit_bound_3[11:0] = 12'hea;//234
		ori_digit_bound_4[11:0] = 12'h14b;//331
		ori_digit_bound_5[11:0] = 12'h1ac;//428
		ori_digit_bound_6[11:0] = 12'h20e;//526
		ori_digit_bound_7[11:0] = 12'h26f;//623
		ori_digit_bound_8[11:0] = 12'h2d0;//720
		ori_digit_bound_9[11:0] = 12'h332;//818

	end
	7'h61:
	begin
		ori_digit_bound_1[11:0] = 12'h28;//40
		ori_digit_bound_2[11:0] = 12'h8a;//138
		ori_digit_bound_3[11:0] = 12'hec;//236
		ori_digit_bound_4[11:0] = 12'h14f;//335
		ori_digit_bound_5[11:0] = 12'h1b1;//433
		ori_digit_bound_6[11:0] = 12'h213;//531
		ori_digit_bound_7[11:0] = 12'h275;//629
		ori_digit_bound_8[11:0] = 12'h2d8;//728
		ori_digit_bound_9[11:0] = 12'h33a;//826

	end
	7'h62:
	begin
		ori_digit_bound_1[11:0] = 12'h28;//40
		ori_digit_bound_2[11:0] = 12'h8b;//139
		ori_digit_bound_3[11:0] = 12'hef;//239
		ori_digit_bound_4[11:0] = 12'h152;//338
		ori_digit_bound_5[11:0] = 12'h1b5;//437
		ori_digit_bound_6[11:0] = 12'h219;//537
		ori_digit_bound_7[11:0] = 12'h27c;//636
		ori_digit_bound_8[11:0] = 12'h2df;//735
		ori_digit_bound_9[11:0] = 12'h342;//834

	end
	7'h63:
	begin
		ori_digit_bound_1[11:0] = 12'h29;//41
		ori_digit_bound_2[11:0] = 12'h8d;//141
		ori_digit_bound_3[11:0] = 12'hf1;//241
		ori_digit_bound_4[11:0] = 12'h155;//341
		ori_digit_bound_5[11:0] = 12'h1ba;//442
		ori_digit_bound_6[11:0] = 12'h21e;//542
		ori_digit_bound_7[11:0] = 12'h282;//642
		ori_digit_bound_8[11:0] = 12'h2e6;//742
		ori_digit_bound_9[11:0] = 12'h34b;//843

	end
	7'h64:
	begin
		ori_digit_bound_1[11:0] = 12'h29;//41
		ori_digit_bound_2[11:0] = 12'h8e;//142
		ori_digit_bound_3[11:0] = 12'hf4;//244
		ori_digit_bound_4[11:0] = 12'h159;//345
		ori_digit_bound_5[11:0] = 12'h1be;//446
		ori_digit_bound_6[11:0] = 12'h223;//547
		ori_digit_bound_7[11:0] = 12'h289;//649
		ori_digit_bound_8[11:0] = 12'h2ee;//750
		ori_digit_bound_9[11:0] = 12'h353;//851

	end
	7'h65:
	begin
		ori_digit_bound_1[11:0] = 12'h29;//41
		ori_digit_bound_2[11:0] = 12'h90;//144
		ori_digit_bound_3[11:0] = 12'hf6;//246
		ori_digit_bound_4[11:0] = 12'h15c;//348
		ori_digit_bound_5[11:0] = 12'h1c2;//450
		ori_digit_bound_6[11:0] = 12'h229;//553
		ori_digit_bound_7[11:0] = 12'h28f;//655
		ori_digit_bound_8[11:0] = 12'h2f5;//757
		ori_digit_bound_9[11:0] = 12'h35c;//860

	end
	7'h66:
	begin
		ori_digit_bound_1[11:0] = 12'h2a;//42
		ori_digit_bound_2[11:0] = 12'h91;//145
		ori_digit_bound_3[11:0] = 12'hf8;//248
		ori_digit_bound_4[11:0] = 12'h160;//352
		ori_digit_bound_5[11:0] = 12'h1c7;//455
		ori_digit_bound_6[11:0] = 12'h22e;//558
		ori_digit_bound_7[11:0] = 12'h295;//661
		ori_digit_bound_8[11:0] = 12'h2fd;//765
		ori_digit_bound_9[11:0] = 12'h364;//868

	end
	7'h67:
	begin
		ori_digit_bound_1[11:0] = 12'h2a;//42
		ori_digit_bound_2[11:0] = 12'h92;//146
		ori_digit_bound_3[11:0] = 12'hfb;//251
		ori_digit_bound_4[11:0] = 12'h163;//355
		ori_digit_bound_5[11:0] = 12'h1cb;//459
		ori_digit_bound_6[11:0] = 12'h234;//564
		ori_digit_bound_7[11:0] = 12'h29c;//668
		ori_digit_bound_8[11:0] = 12'h304;//772
		ori_digit_bound_9[11:0] = 12'h36c;//876

	end
	7'h68:
	begin
		ori_digit_bound_1[11:0] = 12'h2b;//43
		ori_digit_bound_2[11:0] = 12'h94;//148
		ori_digit_bound_3[11:0] = 12'hfd;//253
		ori_digit_bound_4[11:0] = 12'h166;//358
		ori_digit_bound_5[11:0] = 12'h1d0;//464
		ori_digit_bound_6[11:0] = 12'h239;//569
		ori_digit_bound_7[11:0] = 12'h2a2;//674
		ori_digit_bound_8[11:0] = 12'h30b;//779
		ori_digit_bound_9[11:0] = 12'h375;//885

	end
	7'h69:
	begin
		ori_digit_bound_1[11:0] = 12'h2b;//43
		ori_digit_bound_2[11:0] = 12'h95;//149
		ori_digit_bound_3[11:0] = 12'h100;//256
		ori_digit_bound_4[11:0] = 12'h16a;//362
		ori_digit_bound_5[11:0] = 12'h1d4;//468
		ori_digit_bound_6[11:0] = 12'h23e;//574
		ori_digit_bound_7[11:0] = 12'h2a9;//681
		ori_digit_bound_8[11:0] = 12'h313;//787
		ori_digit_bound_9[11:0] = 12'h37d;//893

	end
	7'h6a:
	begin
		ori_digit_bound_1[11:0] = 12'h2b;//43
		ori_digit_bound_2[11:0] = 12'h97;//151
		ori_digit_bound_3[11:0] = 12'h102;//258
		ori_digit_bound_4[11:0] = 12'h16d;//365
		ori_digit_bound_5[11:0] = 12'h1d8;//472
		ori_digit_bound_6[11:0] = 12'h244;//580
		ori_digit_bound_7[11:0] = 12'h2af;//687
		ori_digit_bound_8[11:0] = 12'h31a;//794
		ori_digit_bound_9[11:0] = 12'h386;//902

	end
	7'h6b:
	begin
		ori_digit_bound_1[11:0] = 12'h2c;//44
		ori_digit_bound_2[11:0] = 12'h98;//152
		ori_digit_bound_3[11:0] = 12'h104;//260
		ori_digit_bound_4[11:0] = 12'h171;//369
		ori_digit_bound_5[11:0] = 12'h1dd;//477
		ori_digit_bound_6[11:0] = 12'h249;//585
		ori_digit_bound_7[11:0] = 12'h2b5;//693
		ori_digit_bound_8[11:0] = 12'h322;//802
		ori_digit_bound_9[11:0] = 12'h38e;//910

	end
	7'h6c:
	begin
		ori_digit_bound_1[11:0] = 12'h2c;//44
		ori_digit_bound_2[11:0] = 12'h99;//153
		ori_digit_bound_3[11:0] = 12'h107;//263
		ori_digit_bound_4[11:0] = 12'h174;//372
		ori_digit_bound_5[11:0] = 12'h1e1;//481
		ori_digit_bound_6[11:0] = 12'h24f;//591
		ori_digit_bound_7[11:0] = 12'h2bc;//700
		ori_digit_bound_8[11:0] = 12'h329;//809
		ori_digit_bound_9[11:0] = 12'h396;//918

	end
	7'h6d:
	begin
		ori_digit_bound_1[11:0] = 12'h2d;//45
		ori_digit_bound_2[11:0] = 12'h9b;//155
		ori_digit_bound_3[11:0] = 12'h109;//265
		ori_digit_bound_4[11:0] = 12'h177;//375
		ori_digit_bound_5[11:0] = 12'h1e6;//486
		ori_digit_bound_6[11:0] = 12'h254;//596
		ori_digit_bound_7[11:0] = 12'h2c2;//706
		ori_digit_bound_8[11:0] = 12'h330;//816
		ori_digit_bound_9[11:0] = 12'h39f;//927

	end
	7'h6e:
	begin
		ori_digit_bound_1[11:0] = 12'h2d;//45
		ori_digit_bound_2[11:0] = 12'h9c;//156
		ori_digit_bound_3[11:0] = 12'h10c;//268
		ori_digit_bound_4[11:0] = 12'h17b;//379
		ori_digit_bound_5[11:0] = 12'h1ea;//490
		ori_digit_bound_6[11:0] = 12'h259;//601
		ori_digit_bound_7[11:0] = 12'h2c9;//713
		ori_digit_bound_8[11:0] = 12'h338;//824
		ori_digit_bound_9[11:0] = 12'h3a7;//935

	end
	7'h6f:
	begin
		ori_digit_bound_1[11:0] = 12'h2d;//45
		ori_digit_bound_2[11:0] = 12'h9e;//158
		ori_digit_bound_3[11:0] = 12'h10e;//270
		ori_digit_bound_4[11:0] = 12'h17e;//382
		ori_digit_bound_5[11:0] = 12'h1ee;//494
		ori_digit_bound_6[11:0] = 12'h25f;//607
		ori_digit_bound_7[11:0] = 12'h2cf;//719
		ori_digit_bound_8[11:0] = 12'h33f;//831
		ori_digit_bound_9[11:0] = 12'h3b0;//944

	end
	7'h70:
	begin
		ori_digit_bound_1[11:0] = 12'h2e;//46
		ori_digit_bound_2[11:0] = 12'h9f;//159
		ori_digit_bound_3[11:0] = 12'h110;//272
		ori_digit_bound_4[11:0] = 12'h182;//386
		ori_digit_bound_5[11:0] = 12'h1f3;//499
		ori_digit_bound_6[11:0] = 12'h264;//612
		ori_digit_bound_7[11:0] = 12'h2d5;//725
		ori_digit_bound_8[11:0] = 12'h347;//839
		ori_digit_bound_9[11:0] = 12'h3b8;//952

	end
	7'h71:
	begin
		ori_digit_bound_1[11:0] = 12'h2e;//46
		ori_digit_bound_2[11:0] = 12'ha0;//160
		ori_digit_bound_3[11:0] = 12'h113;//275
		ori_digit_bound_4[11:0] = 12'h185;//389
		ori_digit_bound_5[11:0] = 12'h1f7;//503
		ori_digit_bound_6[11:0] = 12'h26a;//618
		ori_digit_bound_7[11:0] = 12'h2dc;//732
		ori_digit_bound_8[11:0] = 12'h34e;//846
		ori_digit_bound_9[11:0] = 12'h3c0;//960

	end
	7'h72:
	begin
		ori_digit_bound_1[11:0] = 12'h2f;//47
		ori_digit_bound_2[11:0] = 12'ha2;//162
		ori_digit_bound_3[11:0] = 12'h115;//277
		ori_digit_bound_4[11:0] = 12'h188;//392
		ori_digit_bound_5[11:0] = 12'h1fc;//508
		ori_digit_bound_6[11:0] = 12'h26f;//623
		ori_digit_bound_7[11:0] = 12'h2e2;//738
		ori_digit_bound_8[11:0] = 12'h355;//853
		ori_digit_bound_9[11:0] = 12'h3c9;//969

	end
	7'h73:
	begin
		ori_digit_bound_1[11:0] = 12'h2f;//47
		ori_digit_bound_2[11:0] = 12'ha3;//163
		ori_digit_bound_3[11:0] = 12'h118;//280
		ori_digit_bound_4[11:0] = 12'h18c;//396
		ori_digit_bound_5[11:0] = 12'h200;//512
		ori_digit_bound_6[11:0] = 12'h274;//628
		ori_digit_bound_7[11:0] = 12'h2e9;//745
		ori_digit_bound_8[11:0] = 12'h35d;//861
		ori_digit_bound_9[11:0] = 12'h3d1;//977

	end
	7'h74:
	begin
		ori_digit_bound_1[11:0] = 12'h2f;//47
		ori_digit_bound_2[11:0] = 12'ha5;//165
		ori_digit_bound_3[11:0] = 12'h11a;//282
		ori_digit_bound_4[11:0] = 12'h18f;//399
		ori_digit_bound_5[11:0] = 12'h204;//516
		ori_digit_bound_6[11:0] = 12'h27a;//634
		ori_digit_bound_7[11:0] = 12'h2ef;//751
		ori_digit_bound_8[11:0] = 12'h364;//868
		ori_digit_bound_9[11:0] = 12'h3da;//986

	end
	7'h75:
	begin
		ori_digit_bound_1[11:0] = 12'h30;//48
		ori_digit_bound_2[11:0] = 12'ha6;//166
		ori_digit_bound_3[11:0] = 12'h11c;//284
		ori_digit_bound_4[11:0] = 12'h193;//403
		ori_digit_bound_5[11:0] = 12'h209;//521
		ori_digit_bound_6[11:0] = 12'h27f;//639
		ori_digit_bound_7[11:0] = 12'h2f5;//757
		ori_digit_bound_8[11:0] = 12'h36c;//876
		ori_digit_bound_9[11:0] = 12'h3e2;//994

	end
	7'h76:
	begin
		ori_digit_bound_1[11:0] = 12'h30;//48
		ori_digit_bound_2[11:0] = 12'ha7;//167
		ori_digit_bound_3[11:0] = 12'h11f;//287
		ori_digit_bound_4[11:0] = 12'h196;//406
		ori_digit_bound_5[11:0] = 12'h20d;//525
		ori_digit_bound_6[11:0] = 12'h285;//645
		ori_digit_bound_7[11:0] = 12'h2fc;//764
		ori_digit_bound_8[11:0] = 12'h373;//883
		ori_digit_bound_9[11:0] = 12'h3ea;//1002

	end
	7'h77:
	begin
		ori_digit_bound_1[11:0] = 12'h31;//49
		ori_digit_bound_2[11:0] = 12'ha9;//169
		ori_digit_bound_3[11:0] = 12'h121;//289
		ori_digit_bound_4[11:0] = 12'h199;//409
		ori_digit_bound_5[11:0] = 12'h212;//530
		ori_digit_bound_6[11:0] = 12'h28a;//650
		ori_digit_bound_7[11:0] = 12'h302;//770
		ori_digit_bound_8[11:0] = 12'h37a;//890
		ori_digit_bound_9[11:0] = 12'h3f3;//1011

	end
	7'h78:
	begin
		ori_digit_bound_1[11:0] = 12'h31;//49
		ori_digit_bound_2[11:0] = 12'haa;//170
		ori_digit_bound_3[11:0] = 12'h124;//292
		ori_digit_bound_4[11:0] = 12'h19d;//413
		ori_digit_bound_5[11:0] = 12'h216;//534
		ori_digit_bound_6[11:0] = 12'h28f;//655
		ori_digit_bound_7[11:0] = 12'h309;//777
		ori_digit_bound_8[11:0] = 12'h382;//898
		ori_digit_bound_9[11:0] = 12'h3fb;//1019

	end
	7'h79:
	begin
		ori_digit_bound_1[11:0] = 12'h31;//49
		ori_digit_bound_2[11:0] = 12'hac;//172
		ori_digit_bound_3[11:0] = 12'h126;//294
		ori_digit_bound_4[11:0] = 12'h1a0;//416
		ori_digit_bound_5[11:0] = 12'h21a;//538
		ori_digit_bound_6[11:0] = 12'h295;//661
		ori_digit_bound_7[11:0] = 12'h30f;//783
		ori_digit_bound_8[11:0] = 12'h389;//905
		ori_digit_bound_9[11:0] = 12'h404;//1028

	end
	7'h7a:
	begin
		ori_digit_bound_1[11:0] = 12'h32;//50
		ori_digit_bound_2[11:0] = 12'had;//173
		ori_digit_bound_3[11:0] = 12'h128;//296
		ori_digit_bound_4[11:0] = 12'h1a4;//420
		ori_digit_bound_5[11:0] = 12'h21f;//543
		ori_digit_bound_6[11:0] = 12'h29a;//666
		ori_digit_bound_7[11:0] = 12'h315;//789
		ori_digit_bound_8[11:0] = 12'h391;//913
		ori_digit_bound_9[11:0] = 12'h40c;//1036

	end
	7'h7b:
	begin
		ori_digit_bound_1[11:0] = 12'h32;//50
		ori_digit_bound_2[11:0] = 12'hae;//174
		ori_digit_bound_3[11:0] = 12'h12b;//299
		ori_digit_bound_4[11:0] = 12'h1a7;//423
		ori_digit_bound_5[11:0] = 12'h223;//547
		ori_digit_bound_6[11:0] = 12'h2a0;//672
		ori_digit_bound_7[11:0] = 12'h31c;//796
		ori_digit_bound_8[11:0] = 12'h398;//920
		ori_digit_bound_9[11:0] = 12'h414;//1044

	end
	7'h7c:
	begin
		ori_digit_bound_1[11:0] = 12'h33;//51
		ori_digit_bound_2[11:0] = 12'hb0;//176
		ori_digit_bound_3[11:0] = 12'h12d;//301
		ori_digit_bound_4[11:0] = 12'h1aa;//426
		ori_digit_bound_5[11:0] = 12'h228;//552
		ori_digit_bound_6[11:0] = 12'h2a5;//677
		ori_digit_bound_7[11:0] = 12'h322;//802
		ori_digit_bound_8[11:0] = 12'h39f;//927
		ori_digit_bound_9[11:0] = 12'h41d;//1053

	end
	7'h7d:
	begin
		ori_digit_bound_1[11:0] = 12'h33;//51
		ori_digit_bound_2[11:0] = 12'hb1;//177
		ori_digit_bound_3[11:0] = 12'h130;//304
		ori_digit_bound_4[11:0] = 12'h1ae;//430
		ori_digit_bound_5[11:0] = 12'h22c;//556
		ori_digit_bound_6[11:0] = 12'h2aa;//682
		ori_digit_bound_7[11:0] = 12'h329;//809
		ori_digit_bound_8[11:0] = 12'h3a7;//935
		ori_digit_bound_9[11:0] = 12'h425;//1061

	end
	7'h7e:
	begin
		ori_digit_bound_1[11:0] = 12'h33;//51
		ori_digit_bound_2[11:0] = 12'hb3;//179
		ori_digit_bound_3[11:0] = 12'h132;//306
		ori_digit_bound_4[11:0] = 12'h1b1;//433
		ori_digit_bound_5[11:0] = 12'h230;//560
		ori_digit_bound_6[11:0] = 12'h2b0;//688
		ori_digit_bound_7[11:0] = 12'h32f;//815
		ori_digit_bound_8[11:0] = 12'h3ae;//942
		ori_digit_bound_9[11:0] = 12'h42e;//1070

	end
	7'h7f:
	begin
		ori_digit_bound_1[11:0] = 12'h34;//52
		ori_digit_bound_2[11:0] = 12'hb4;//180
		ori_digit_bound_3[11:0] = 12'h134;//308
		ori_digit_bound_4[11:0] = 12'h1b5;//437
		ori_digit_bound_5[11:0] = 12'h235;//565
		ori_digit_bound_6[11:0] = 12'h2b5;//693
		ori_digit_bound_7[11:0] = 12'h335;//821
		ori_digit_bound_8[11:0] = 12'h3b6;//950
		ori_digit_bound_9[11:0] = 12'h436;//1078

	end
	7'h00:
	begin
		ori_digit_bound_1[11:0] = 12'h34;//52
		ori_digit_bound_2[11:0] = 12'hb5;//181
		ori_digit_bound_3[11:0] = 12'h137;//311
		ori_digit_bound_4[11:0] = 12'h1b8;//440
		ori_digit_bound_5[11:0] = 12'h239;//569
		ori_digit_bound_6[11:0] = 12'h2bb;//699
		ori_digit_bound_7[11:0] = 12'h33c;//828
		ori_digit_bound_8[11:0] = 12'h3bd;//957
		ori_digit_bound_9[11:0] = 12'h43e;//1086
	end
  default:
  begin
		ori_digit_bound_1[11:0] = {12{1'bx}};
		ori_digit_bound_2[11:0] = {12{1'bx}};
		ori_digit_bound_3[11:0] = {12{1'bx}};
		ori_digit_bound_4[11:0] = {12{1'bx}};
		ori_digit_bound_5[11:0] = {12{1'bx}};
		ori_digit_bound_6[11:0] = {12{1'bx}};
		ori_digit_bound_7[11:0] = {12{1'bx}};
		ori_digit_bound_8[11:0] = {12{1'bx}};
		ori_digit_bound_9[11:0] = {12{1'bx}};
	end
endcase
// &CombEnd; @886
end
// &CombBeg; @887
always @( bound_sel[6:0])
begin
case(bound_sel[6:0])
	7'h40:
	begin
		sqrt_digit_boundp2_1[11:0] = 12'h21;//33
		sqrt_digit_boundp2_2[11:0] = 12'h62;//98
		sqrt_digit_boundp2_3[11:0] = 12'ha4;//164
		sqrt_digit_boundp2_4[11:0] = 12'he7;//231
		sqrt_digit_boundp2_5[11:0] = 12'h12b;//299
		sqrt_digit_boundp2_6[11:0] = 12'h170;//368
		sqrt_digit_boundp2_7[11:0] = 12'h1b6;//438
		sqrt_digit_boundp2_8[11:0] = 12'h1fd;//509
		sqrt_digit_boundp2_9[11:0] = 12'h245;//581
	end
	7'h50:
	begin
		sqrt_digit_boundp2_1[11:0] = 12'h29;//41
		sqrt_digit_boundp2_2[11:0] = 12'h7a;//122
		sqrt_digit_boundp2_3[11:0] = 12'hcc;//204
		sqrt_digit_boundp2_4[11:0] = 12'h11f;//287
		sqrt_digit_boundp2_5[11:0] = 12'h173;//371
		sqrt_digit_boundp2_6[11:0] = 12'h1c8;//456
		sqrt_digit_boundp2_7[11:0] = 12'h21e;//542
		sqrt_digit_boundp2_8[11:0] = 12'h275;//629
		sqrt_digit_boundp2_9[11:0] = 12'h2cd;//717
	end
	7'h60:
	begin
		sqrt_digit_boundp2_1[11:0] = 12'h31;//49
		sqrt_digit_boundp2_2[11:0] = 12'h92;//146
		sqrt_digit_boundp2_3[11:0] = 12'hf4;//244
		sqrt_digit_boundp2_4[11:0] = 12'h157;//343
		sqrt_digit_boundp2_5[11:0] = 12'h1bb;//443
		sqrt_digit_boundp2_6[11:0] = 12'h220;//544
		sqrt_digit_boundp2_7[11:0] = 12'h286;//646
		sqrt_digit_boundp2_8[11:0] = 12'h2ed;//749
		sqrt_digit_boundp2_9[11:0] = 12'h355;//853
	end
	7'h70:
	begin
		sqrt_digit_boundp2_1[11:0] = 12'h39;//57
		sqrt_digit_boundp2_2[11:0] = 12'haa;//170
		sqrt_digit_boundp2_3[11:0] = 12'h11c;//284
		sqrt_digit_boundp2_4[11:0] = 12'h18f;//399
		sqrt_digit_boundp2_5[11:0] = 12'h203;//515
		sqrt_digit_boundp2_6[11:0] = 12'h278;//632
		sqrt_digit_boundp2_7[11:0] = 12'h2ee;//750
		sqrt_digit_boundp2_8[11:0] = 12'h365;//869
		sqrt_digit_boundp2_9[11:0] = 12'h3dd;//989
	end
	7'h00:
	begin
		sqrt_digit_boundp2_1[11:0] = 12'h41;//65
		sqrt_digit_boundp2_2[11:0] = 12'hc2;//194
		sqrt_digit_boundp2_3[11:0] = 12'h144;//324
		sqrt_digit_boundp2_4[11:0] = 12'h1c7;//455
		sqrt_digit_boundp2_5[11:0] = 12'h24b;//587
		sqrt_digit_boundp2_6[11:0] = 12'h2d0;//720
		sqrt_digit_boundp2_7[11:0] = 12'h356;//854
		sqrt_digit_boundp2_8[11:0] = 12'h3dd;//989
		sqrt_digit_boundp2_9[11:0] = 12'h465;//1125
	end
  default:
  begin
		sqrt_digit_boundp2_1[11:0] = {12{1'bx}};//-66
		sqrt_digit_boundp2_2[11:0] = {12{1'bx}};//-190
		sqrt_digit_boundp2_3[11:0] = {12{1'bx}};//-324
		sqrt_digit_boundp2_4[11:0] = {12{1'bx}};//-450
		sqrt_digit_boundp2_5[11:0] = {12{1'bx}};//-588
		sqrt_digit_boundp2_6[11:0] = {12{1'bx}};//-720
		sqrt_digit_boundp2_7[11:0] = {12{1'bx}};//-852
		sqrt_digit_boundp2_8[11:0] = {12{1'bx}};//-988
		sqrt_digit_boundp2_9[11:0] = {12{1'bx}};//-1120
	end


endcase
// &CombEnd; @964
end
// &CombBeg; @965
always @( bound_sel[6:0])
begin
case(bound_sel[6:0])
  7'h40:
	begin
		sqrt_digit_boundm2_1[11:0] = 12'h20;//32
		sqrt_digit_boundm2_2[11:0] = 12'h5f;//95
		sqrt_digit_boundm2_3[11:0] = 12'h9d;//157
		sqrt_digit_boundm2_4[11:0] = 12'hda;//218
		sqrt_digit_boundm2_5[11:0] = 12'h116;//278
		sqrt_digit_boundm2_6[11:0] = 12'h151;//337
		sqrt_digit_boundm2_7[11:0] = 12'h18b;//395
		sqrt_digit_boundm2_8[11:0] = 12'h1c4;//452
		sqrt_digit_boundm2_9[11:0] = 12'h1fc;//508
	end
	7'h50:
	begin
		sqrt_digit_boundm2_1[11:0] = 12'h28;//40
		sqrt_digit_boundm2_2[11:0] = 12'h77;//119
		sqrt_digit_boundm2_3[11:0] = 12'hc5;//197
		sqrt_digit_boundm2_4[11:0] = 12'h112;//274
		sqrt_digit_boundm2_5[11:0] = 12'h15e;//350
		sqrt_digit_boundm2_6[11:0] = 12'h1a9;//425
		sqrt_digit_boundm2_7[11:0] = 12'h1f3;//499
		sqrt_digit_boundm2_8[11:0] = 12'h23c;//572
		sqrt_digit_boundm2_9[11:0] = 12'h284;//644
	end
	7'h60:
	begin
		sqrt_digit_boundm2_1[11:0] = 12'h30;//48
		sqrt_digit_boundm2_2[11:0] = 12'h8f;//143
		sqrt_digit_boundm2_3[11:0] = 12'hed;//237
		sqrt_digit_boundm2_4[11:0] = 12'h14a;//330
		sqrt_digit_boundm2_5[11:0] = 12'h1a6;//422
		sqrt_digit_boundm2_6[11:0] = 12'h201;//513
		sqrt_digit_boundm2_7[11:0] = 12'h25b;//603
		sqrt_digit_boundm2_8[11:0] = 12'h2b4;//692
		sqrt_digit_boundm2_9[11:0] = 12'h30c;//780
	end
	7'h70:
	begin
		sqrt_digit_boundm2_1[11:0] = 12'h38;//56
		sqrt_digit_boundm2_2[11:0] = 12'ha7;//167
		sqrt_digit_boundm2_3[11:0] = 12'h115;//277
		sqrt_digit_boundm2_4[11:0] = 12'h182;//386
		sqrt_digit_boundm2_5[11:0] = 12'h1ee;//494
		sqrt_digit_boundm2_6[11:0] = 12'h259;//601
		sqrt_digit_boundm2_7[11:0] = 12'h2c3;//707
		sqrt_digit_boundm2_8[11:0] = 12'h32c;//812
		sqrt_digit_boundm2_9[11:0] = 12'h394;//916
	end
	7'h00:
	begin
		sqrt_digit_boundm2_1[11:0] = 12'h40;//64
		sqrt_digit_boundm2_2[11:0] = 12'hbf;//191
		sqrt_digit_boundm2_3[11:0] = 12'h13d;//317
		sqrt_digit_boundm2_4[11:0] = 12'h1ba;//442
		sqrt_digit_boundm2_5[11:0] = 12'h236;//566
		sqrt_digit_boundm2_6[11:0] = 12'h2b1;//689
		sqrt_digit_boundm2_7[11:0] = 12'h32b;//811
		sqrt_digit_boundm2_8[11:0] = 12'h3a4;//932
		sqrt_digit_boundm2_9[11:0] = 12'h41c;//1052
	end

  default:
  begin
		sqrt_digit_boundm2_1[11:0] = {12{1'bx}};//-66
		sqrt_digit_boundm2_2[11:0] = {12{1'bx}};//-190
		sqrt_digit_boundm2_3[11:0] = {12{1'bx}};//-324
		sqrt_digit_boundm2_4[11:0] = {12{1'bx}};//-450
		sqrt_digit_boundm2_5[11:0] = {12{1'bx}};//-588
		sqrt_digit_boundm2_6[11:0] = {12{1'bx}};//-720
		sqrt_digit_boundm2_7[11:0] = {12{1'bx}};//-852
		sqrt_digit_boundm2_8[11:0] = {12{1'bx}};//-988
		sqrt_digit_boundm2_9[11:0] = {12{1'bx}};//-1120
	end
endcase
// &CombEnd; @1041
end
assign sqrt_digit_bound2_1[11:0] = sqrt_secd_round_sign ? sqrt_digit_boundm2_1[11:0] : sqrt_digit_boundp2_1[11:0];
assign sqrt_digit_bound2_2[11:0] = sqrt_secd_round_sign ? sqrt_digit_boundm2_2[11:0] : sqrt_digit_boundp2_2[11:0];
assign sqrt_digit_bound2_3[11:0] = sqrt_secd_round_sign ? sqrt_digit_boundm2_3[11:0] : sqrt_digit_boundp2_3[11:0];
assign sqrt_digit_bound2_4[11:0] = sqrt_secd_round_sign ? sqrt_digit_boundm2_4[11:0] : sqrt_digit_boundp2_4[11:0];
assign sqrt_digit_bound2_5[11:0] = sqrt_secd_round_sign ? sqrt_digit_boundm2_5[11:0] : sqrt_digit_boundp2_5[11:0];
assign sqrt_digit_bound2_6[11:0] = sqrt_secd_round_sign ? sqrt_digit_boundm2_6[11:0] : sqrt_digit_boundp2_6[11:0];
assign sqrt_digit_bound2_7[11:0] = sqrt_secd_round_sign ? sqrt_digit_boundm2_7[11:0] : sqrt_digit_boundp2_7[11:0];
assign sqrt_digit_bound2_8[11:0] = sqrt_secd_round_sign ? sqrt_digit_boundm2_8[11:0] : sqrt_digit_boundp2_8[11:0];
assign sqrt_digit_bound2_9[11:0] = sqrt_secd_round_sign ? sqrt_digit_boundm2_9[11:0] : sqrt_digit_boundp2_9[11:0];
                                                

assign digit_bound_1[11:0] = sqrt_first_round ? 12'h2 : 
                                                sqrt_secd_round ? sqrt_digit_bound2_1[11:0] 
                                                                 : ori_digit_bound_1[11:0]; //-2
assign digit_bound_2[11:0] = sqrt_first_round ? 12'h10 : 
                                                sqrt_secd_round ? sqrt_digit_bound2_2[11:0] 
                                                                : ori_digit_bound_2[11:0]; //-16
assign digit_bound_3[11:0] = sqrt_first_round ? 12'h35 : 
                                                sqrt_secd_round ? sqrt_digit_bound2_3[11:0] 
                                                                : ori_digit_bound_3[11:0]; //-53
assign digit_bound_4[11:0] = sqrt_first_round ? 12'h5f : 
                                                sqrt_secd_round ? sqrt_digit_bound2_4[11:0] 
                                                                : ori_digit_bound_4[11:0]; //-95
assign digit_bound_5[11:0] = sqrt_first_round ? 12'ha0 : 
                                                sqrt_secd_round ? sqrt_digit_bound2_5[11:0] 
                                                                : ori_digit_bound_5[11:0]; //-160
assign digit_bound_6[11:0] = sqrt_first_round ? 12'hf0 : 
                                                sqrt_secd_round ? sqrt_digit_bound2_6[11:0] 
                                                                : ori_digit_bound_6[11:0];    //-240
assign digit_bound_7[11:0] = sqrt_first_round ? 12'h14f : 
                                                sqrt_secd_round ? sqrt_digit_bound2_7[11:0] 
                                                                : ori_digit_bound_7[11:0]; //-335
assign digit_bound_8[11:0] = sqrt_first_round ? 12'h1c2 : 
                                                sqrt_secd_round ? sqrt_digit_bound2_8[11:0] 
                                                                : ori_digit_bound_8[11:0]; //-450
assign digit_bound_9[11:0] = sqrt_first_round ? 12'h23a : 
                                                sqrt_secd_round ? sqrt_digit_bound2_9[11:0] 
                                                                : ori_digit_bound_9[11:0]; //-570
// &ModuleEnd; @1080
endmodule



