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






















module uart(
  apb_uart_paddr,
  apb_uart_penable,
  apb_uart_psel,
  apb_uart_pwdata,
  apb_uart_pwrite,
  rst_b,
  s_in,
  s_out,
  sys_clk,
  uart_apb_prdata,
  uart_vic_int
);


input   [39:0]  apb_uart_paddr;            
input           apb_uart_penable;          
input           apb_uart_psel;             
input   [31:0]  apb_uart_pwdata;           
input           apb_uart_pwrite;           
input           rst_b;                     
input           s_in;                      
input           sys_clk;                   
output          s_out;                     
output  [31:0]  uart_apb_prdata;           
output          uart_vic_int;              




wire    [39:0]  apb_uart_paddr;            
wire            apb_uart_penable;          
wire            apb_uart_psel;             
wire    [31:0]  apb_uart_pwdata;           
wire            apb_uart_pwrite;           
wire    [15:0]  ctrl_baud_gen_divisor;     
wire            ctrl_baud_gen_set_dllh_vld; 
wire    [1 :0]  ctrl_receive_data_length;  
wire            ctrl_receive_parity_bit;   
wire            ctrl_receive_parity_en;    
wire            ctrl_receive_stop_length;  
wire            ctrl_reg_busy;             
wire            ctrl_reg_fe;               
wire    [3 :0]  ctrl_reg_iid;              
wire            ctrl_reg_iid_vld;          
wire            ctrl_reg_oe;               
wire            ctrl_reg_pe;               
wire    [7 :0]  ctrl_reg_rbr_wdata;        
wire            ctrl_reg_rbr_write_en;     
wire            ctrl_reg_thr_read;         
wire            ctrl_reg_thsr_empty;       
wire    [1 :0]  ctrl_trans_data_length;    
wire            ctrl_trans_parity_bit;     
wire            ctrl_trans_parity_en;      
wire    [7 :0]  ctrl_trans_shift_data;     
wire            ctrl_trans_stop_length;    
wire            ctrl_trans_thr_vld;        
wire            receive_clk_en;            
wire            receive_ctrl_busy;         
wire            receive_ctrl_fe;           
wire            receive_ctrl_pe;           
wire    [7 :0]  receive_ctrl_rdata;        
wire            receive_ctrl_redata_over;  
wire    [15:0]  reg_ctrl_dllh_data;        
wire    [2 :0]  reg_ctrl_ier_enable;       
wire    [1 :0]  reg_ctrl_lcr_dls;          
wire            reg_ctrl_lcr_eps;          
wire            reg_ctrl_lcr_pen;          
wire            reg_ctrl_lcr_stop;         
wire            reg_ctrl_lcr_wen;          
wire            reg_ctrl_rbr_vld;          
wire            reg_ctrl_set_dllh_vld;     
wire    [7 :0]  reg_ctrl_thr_data;         
wire            reg_ctrl_thr_vld;          
wire            reg_ctrl_threint_en;       
wire            rst_b;                     
wire            s_in;                      
wire            s_out;                     
wire            sys_clk;                   
wire            trans_clk_en;              
wire            trans_ctrl_busy;           
wire            trans_ctrl_thr_read;       
wire            trans_ctrl_thsr_empty;     
wire    [31:0]  uart_apb_prdata;           
wire            uart_vic_int;              




uart_apb_reg  x_uart_apb_reg (
  .apb_uart_paddr        (apb_uart_paddr       ),
  .apb_uart_penable      (apb_uart_penable     ),
  .apb_uart_psel         (apb_uart_psel        ),
  .apb_uart_pwdata       (apb_uart_pwdata      ),
  .apb_uart_pwrite       (apb_uart_pwrite      ),
  .ctrl_reg_busy         (ctrl_reg_busy        ),
  .ctrl_reg_fe           (ctrl_reg_fe          ),
  .ctrl_reg_iid          (ctrl_reg_iid         ),
  .ctrl_reg_iid_vld      (ctrl_reg_iid_vld     ),
  .ctrl_reg_oe           (ctrl_reg_oe          ),
  .ctrl_reg_pe           (ctrl_reg_pe          ),
  .ctrl_reg_rbr_wdata    (ctrl_reg_rbr_wdata   ),
  .ctrl_reg_rbr_write_en (ctrl_reg_rbr_write_en),
  .ctrl_reg_thr_read     (ctrl_reg_thr_read    ),
  .ctrl_reg_thsr_empty   (ctrl_reg_thsr_empty  ),
  .reg_ctrl_dllh_data    (reg_ctrl_dllh_data   ),
  .reg_ctrl_ier_enable   (reg_ctrl_ier_enable  ),
  .reg_ctrl_lcr_dls      (reg_ctrl_lcr_dls     ),
  .reg_ctrl_lcr_eps      (reg_ctrl_lcr_eps     ),
  .reg_ctrl_lcr_pen      (reg_ctrl_lcr_pen     ),
  .reg_ctrl_lcr_stop     (reg_ctrl_lcr_stop    ),
  .reg_ctrl_lcr_wen      (reg_ctrl_lcr_wen     ),
  .reg_ctrl_rbr_vld      (reg_ctrl_rbr_vld     ),
  .reg_ctrl_set_dllh_vld (reg_ctrl_set_dllh_vld),
  .reg_ctrl_thr_data     (reg_ctrl_thr_data    ),
  .reg_ctrl_thr_vld      (reg_ctrl_thr_vld     ),
  .reg_ctrl_threint_en   (reg_ctrl_threint_en  ),
  .rst_b                 (rst_b                ),
  .sys_clk               (sys_clk              ),
  .uart_apb_prdata       (uart_apb_prdata      ),
  .uart_vic_int          (uart_vic_int         )
);


uart_baud_gen  x_uart_baud_gen (
  .ctrl_baud_gen_divisor      (ctrl_baud_gen_divisor     ),
  .ctrl_baud_gen_set_dllh_vld (ctrl_baud_gen_set_dllh_vld),
  .receive_clk_en             (receive_clk_en            ),
  .rst_b                      (rst_b                     ),
  .sys_clk                    (sys_clk                   ),
  .trans_clk_en               (trans_clk_en              )
);


uart_ctrl  x_uart_ctrl (
  .ctrl_baud_gen_divisor      (ctrl_baud_gen_divisor     ),
  .ctrl_baud_gen_set_dllh_vld (ctrl_baud_gen_set_dllh_vld),
  .ctrl_receive_data_length   (ctrl_receive_data_length  ),
  .ctrl_receive_parity_bit    (ctrl_receive_parity_bit   ),
  .ctrl_receive_parity_en     (ctrl_receive_parity_en    ),
  .ctrl_receive_stop_length   (ctrl_receive_stop_length  ),
  .ctrl_reg_busy              (ctrl_reg_busy             ),
  .ctrl_reg_fe                (ctrl_reg_fe               ),
  .ctrl_reg_iid               (ctrl_reg_iid              ),
  .ctrl_reg_iid_vld           (ctrl_reg_iid_vld          ),
  .ctrl_reg_oe                (ctrl_reg_oe               ),
  .ctrl_reg_pe                (ctrl_reg_pe               ),
  .ctrl_reg_rbr_wdata         (ctrl_reg_rbr_wdata        ),
  .ctrl_reg_rbr_write_en      (ctrl_reg_rbr_write_en     ),
  .ctrl_reg_thr_read          (ctrl_reg_thr_read         ),
  .ctrl_reg_thsr_empty        (ctrl_reg_thsr_empty       ),
  .ctrl_trans_data_length     (ctrl_trans_data_length    ),
  .ctrl_trans_parity_bit      (ctrl_trans_parity_bit     ),
  .ctrl_trans_parity_en       (ctrl_trans_parity_en      ),
  .ctrl_trans_shift_data      (ctrl_trans_shift_data     ),
  .ctrl_trans_stop_length     (ctrl_trans_stop_length    ),
  .ctrl_trans_thr_vld         (ctrl_trans_thr_vld        ),
  .receive_ctrl_busy          (receive_ctrl_busy         ),
  .receive_ctrl_fe            (receive_ctrl_fe           ),
  .receive_ctrl_pe            (receive_ctrl_pe           ),
  .receive_ctrl_rdata         (receive_ctrl_rdata        ),
  .receive_ctrl_redata_over   (receive_ctrl_redata_over  ),
  .reg_ctrl_dllh_data         (reg_ctrl_dllh_data        ),
  .reg_ctrl_ier_enable        (reg_ctrl_ier_enable       ),
  .reg_ctrl_lcr_dls           (reg_ctrl_lcr_dls          ),
  .reg_ctrl_lcr_eps           (reg_ctrl_lcr_eps          ),
  .reg_ctrl_lcr_pen           (reg_ctrl_lcr_pen          ),
  .reg_ctrl_lcr_stop          (reg_ctrl_lcr_stop         ),
  .reg_ctrl_lcr_wen           (reg_ctrl_lcr_wen          ),
  .reg_ctrl_rbr_vld           (reg_ctrl_rbr_vld          ),
  .reg_ctrl_set_dllh_vld      (reg_ctrl_set_dllh_vld     ),
  .reg_ctrl_thr_data          (reg_ctrl_thr_data         ),
  .reg_ctrl_thr_vld           (reg_ctrl_thr_vld          ),
  .reg_ctrl_threint_en        (reg_ctrl_threint_en       ),
  .rst_b                      (rst_b                     ),
  .sys_clk                    (sys_clk                   ),
  .trans_ctrl_busy            (trans_ctrl_busy           ),
  .trans_ctrl_thr_read        (trans_ctrl_thr_read       ),
  .trans_ctrl_thsr_empty      (trans_ctrl_thsr_empty     )
);


uart_trans  x_uart_trans (
  .ctrl_trans_data_length (ctrl_trans_data_length),
  .ctrl_trans_parity_bit  (ctrl_trans_parity_bit ),
  .ctrl_trans_parity_en   (ctrl_trans_parity_en  ),
  .ctrl_trans_shift_data  (ctrl_trans_shift_data ),
  .ctrl_trans_stop_length (ctrl_trans_stop_length),
  .ctrl_trans_thr_vld     (ctrl_trans_thr_vld    ),
  .rst_b                  (rst_b                 ),
  .s_out                  (s_out                 ),
  .sys_clk                (sys_clk               ),
  .trans_clk_en           (trans_clk_en          ),
  .trans_ctrl_busy        (trans_ctrl_busy       ),
  .trans_ctrl_thr_read    (trans_ctrl_thr_read   ),
  .trans_ctrl_thsr_empty  (trans_ctrl_thsr_empty )
);


uart_receive  x_uart_receive (
  .ctrl_receive_data_length (ctrl_receive_data_length),
  .ctrl_receive_parity_bit  (ctrl_receive_parity_bit ),
  .ctrl_receive_parity_en   (ctrl_receive_parity_en  ),
  .ctrl_receive_stop_length (ctrl_receive_stop_length),
  .ctrl_trans_parity_en     (ctrl_trans_parity_en    ),
  .receive_clk_en           (receive_clk_en          ),
  .receive_ctrl_busy        (receive_ctrl_busy       ),
  .receive_ctrl_fe          (receive_ctrl_fe         ),
  .receive_ctrl_pe          (receive_ctrl_pe         ),
  .receive_ctrl_rdata       (receive_ctrl_rdata      ),
  .receive_ctrl_redata_over (receive_ctrl_redata_over),
  .rst_b                    (rst_b                   ),
  .s_in                     (s_in                    ),
  .sys_clk                  (sys_clk                 )
);



endmodule



