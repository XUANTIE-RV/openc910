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
module ct_lsu_snoop_snq_entry(
  arb_snq_entry_oldest_index_x,
  biu_snq_cr_resp_acept_x,
  cp0_lsu_icg_en,
  cpurst_b,
  dcache_snq_snoop_tag_grnt,
  dcache_snq_snpdt_grnt,
  dcache_snq_tag_resp_dirty,
  dcache_snq_tag_resp_share,
  dcache_snq_tag_resp_valid,
  dcache_snq_tag_resp_way,
  lfb_bypass_vld_x,
  lfb_snq_bypass_data_id,
  lfb_snq_bypass_share,
  lfb_vb_addr_tto6,
  lsu_snoop_clk,
  pad_yy_icg_scan_en,
  snpdt_snq_cmplt_x,
  snpt_snpdt_start_x,
  snq_cr_resp_valid_x,
  snq_create_addr,
  snq_create_depd,
  snq_create_en_x,
  snq_create_type,
  snq_depd_remove,
  snq_entry_bypass_db_id_v,
  snq_entry_depd_vb_id_v,
  snq_entry_lfb_bypass_chg_tag_data0_x,
  snq_entry_lfb_bypass_chg_tag_data1_x,
  snq_entry_lfb_bypass_invalid_data0_x,
  snq_entry_lfb_bypass_invalid_data1_x,
  snq_entry_lfb_vb_req_hit_idx_x,
  snq_entry_vb_bypass_invalid_x,
  snq_entry_vb_bypass_readonce_x,
  snq_entry_vb_bypass_start_x,
  snq_entry_wmb_read_req_hit_idx_x,
  snq_entry_wmb_write_req_hit_idx_x,
  snq_entryx_addr,
  snq_entryx_cr_resp,
  snq_issued_x,
  snq_need_chg_tag_i_x,
  snq_need_chg_tag_s_x,
  snq_need_chg_tag_x,
  snq_need_read_data_x,
  snq_rd_tag_rdy_x,
  snq_resp_create_en_x,
  snq_snoop_tag_req_x,
  snq_snoop_tag_start_x,
  snq_tag_req_for_inv_x,
  snq_vld_x,
  snq_way_x,
  st_da_snq_ecc_err,
  vb_bypass_vld_x,
  vb_snq_bypass_db_id,
  vb_snq_start_wait_x,
  vb_snq_wait_remove,
  vb_snq_wait_vb_id,
  wmb_read_req_addr,
  wmb_write_ptr,
  wmb_write_req_addr
);

// &Ports; @26
input           arb_snq_entry_oldest_index_x;        
input           biu_snq_cr_resp_acept_x;             
input           cp0_lsu_icg_en;                      
input           cpurst_b;                            
input           dcache_snq_snoop_tag_grnt;           
input           dcache_snq_snpdt_grnt;               
input           dcache_snq_tag_resp_dirty;           
input           dcache_snq_tag_resp_share;           
input           dcache_snq_tag_resp_valid;           
input           dcache_snq_tag_resp_way;             
input           lfb_bypass_vld_x;                    
input   [1 :0]  lfb_snq_bypass_data_id;              
input           lfb_snq_bypass_share;                
input   [33:0]  lfb_vb_addr_tto6;                    
input           lsu_snoop_clk;                       
input           pad_yy_icg_scan_en;                  
input           snpdt_snq_cmplt_x;                   
input   [39:0]  snq_create_addr;                     
input   [9 :0]  snq_create_depd;                     
input           snq_create_en_x;                     
input   [3 :0]  snq_create_type;                     
input   [9 :0]  snq_depd_remove;                     
input           snq_resp_create_en_x;                
input           snq_snoop_tag_start_x;               
input           st_da_snq_ecc_err;                   
input           vb_bypass_vld_x;                     
input   [2 :0]  vb_snq_bypass_db_id;                 
input           vb_snq_start_wait_x;                 
input   [1 :0]  vb_snq_wait_remove;                  
input   [1 :0]  vb_snq_wait_vb_id;                   
input   [39:0]  wmb_read_req_addr;                   
input   [7 :0]  wmb_write_ptr;                       
input   [39:0]  wmb_write_req_addr;                  
output          snpt_snpdt_start_x;                  
output          snq_cr_resp_valid_x;                 
output  [2 :0]  snq_entry_bypass_db_id_v;            
output  [1 :0]  snq_entry_depd_vb_id_v;              
output          snq_entry_lfb_bypass_chg_tag_data0_x; 
output          snq_entry_lfb_bypass_chg_tag_data1_x; 
output          snq_entry_lfb_bypass_invalid_data0_x; 
output          snq_entry_lfb_bypass_invalid_data1_x; 
output          snq_entry_lfb_vb_req_hit_idx_x;      
output          snq_entry_vb_bypass_invalid_x;       
output          snq_entry_vb_bypass_readonce_x;      
output          snq_entry_vb_bypass_start_x;         
output          snq_entry_wmb_read_req_hit_idx_x;    
output          snq_entry_wmb_write_req_hit_idx_x;   
output  [35:0]  snq_entryx_addr;                     
output  [4 :0]  snq_entryx_cr_resp;                  
output          snq_issued_x;                        
output          snq_need_chg_tag_i_x;                
output          snq_need_chg_tag_s_x;                
output          snq_need_chg_tag_x;                  
output          snq_need_read_data_x;                
output          snq_rd_tag_rdy_x;                    
output          snq_snoop_tag_req_x;                 
output          snq_tag_req_for_inv_x;               
output          snq_vld_x;                           
output          snq_way_x;                           

// &Regs; @27
reg             lfb_bypass_mode;                     
reg     [4 :0]  snpt_cur_state;                      
reg     [4 :0]  snpt_next_state;                     
reg     [35:0]  snq_addr;                            
reg     [9 :0]  snq_depd;                            
reg     [2 :0]  snq_entry_bypass_db_id;              
reg             snq_entry_bypass_dcache_share;       
reg     [1 :0]  snq_entry_bypass_lfb_data_id;        
reg             snq_issued;                          
reg             snq_need_chg_tag_ff;                 
reg             snq_need_chg_tag_i_ff;               
reg             snq_need_chg_tag_s_ff;               
reg             snq_need_read_data_ff;               
reg     [1 :0]  snq_need_wait_vb;                    
reg     [4 :0]  snq_resp;                            
reg     [3 :0]  snq_type;                            
reg             snq_vld;                             
reg             snq_way;                             
reg             vb_bypass_mode;                      
reg             vb_bypass_with_clean_ff;             

// &Wires; @28
wire            arb_snq_entry_oldest_index;          
wire            arb_snq_entry_oldest_index_x;        
wire            biu_snq_cr_resp_acept;               
wire            biu_snq_cr_resp_acept_x;             
wire            cp0_lsu_icg_en;                      
wire            cpurst_b;                            
wire            data_transfer;                       
wire    [4 :0]  dcache_snq_resp;                     
wire            dcache_snq_snoop_tag_grnt;           
wire            dcache_snq_snpdt_grnt;               
wire            dcache_snq_tag_resp_dirty;           
wire            dcache_snq_tag_resp_dirty_final;     
wire            dcache_snq_tag_resp_share;           
wire            dcache_snq_tag_resp_share_final;     
wire            dcache_snq_tag_resp_valid;           
wire            dcache_snq_tag_resp_valid_final;     
wire            dcache_snq_tag_resp_way;             
wire            error;                               
wire            is_shared;                           
wire            lfb_bypass_chg_tag;                  
wire            lfb_bypass_chg_tag_data0;            
wire            lfb_bypass_chg_tag_data1;            
wire            lfb_bypass_invalid;                  
wire            lfb_bypass_invalid_data0;            
wire            lfb_bypass_invalid_data1;            
wire            lfb_bypass_vld;                      
wire            lfb_bypass_vld_x;                    
wire    [1 :0]  lfb_snq_bypass_data_id;              
wire            lfb_snq_bypass_share;                
wire    [33:0]  lfb_vb_addr_tto6;                    
wire            lsu_snoop_clk;                       
wire            make_invalid_req;                    
wire            pad_yy_icg_scan_en;                  
wire            pass_dirty;                          
wire            save_tag_resp;                       
wire            snpdt_snq_cmplt;                     
wire            snpdt_snq_cmplt_x;                   
wire            snpt_snpdt_start;                    
wire            snpt_snpdt_start_x;                  
wire            snpt_state_idle;                     
wire            snq_cr_resp_valid_x;                 
wire    [39:0]  snq_create_addr;                     
wire    [9 :0]  snq_create_depd;                     
wire            snq_create_en;                       
wire            snq_create_en_x;                     
wire    [3 :0]  snq_create_type;                     
wire            snq_ctl_clk_en;                      
wire            snq_depd_clk_en;                     
wire    [9 :0]  snq_depd_remove;                     
wire            snq_depd_remove_vld;                 
wire    [2 :0]  snq_entry_bypass_db_id_v;            
wire            snq_entry_clk_en;                    
wire    [33:0]  snq_entry_cmp_lfb_vb_addr_tto6;      
wire    [39:0]  snq_entry_cmp_wmb_read_req_addr;     
wire    [39:0]  snq_entry_cmp_wmb_write_req_addr;    
wire    [1 :0]  snq_entry_depd_vb_id;                
wire    [1 :0]  snq_entry_depd_vb_id_v;              
wire    [39:0]  snq_entry_from_snq_create_addr;      
wire            snq_entry_lfb_bypass_chg_tag_data0_x; 
wire            snq_entry_lfb_bypass_chg_tag_data1_x; 
wire            snq_entry_lfb_bypass_invalid_data0_x; 
wire            snq_entry_lfb_bypass_invalid_data1_x; 
wire            snq_entry_lfb_vb_req_hit_idx;        
wire            snq_entry_lfb_vb_req_hit_idx_x;      
wire            snq_entry_vb_bypass_invalid_x;       
wire            snq_entry_vb_bypass_readonce_x;      
wire            snq_entry_vb_bypass_start_x;         
wire            snq_entry_wmb_read_req_hit_idx;      
wire            snq_entry_wmb_read_req_hit_idx_x;    
wire            snq_entry_wmb_write_req_hit_idx;     
wire            snq_entry_wmb_write_req_hit_idx_x;   
wire    [35:0]  snq_entryx_addr;                     
wire    [4 :0]  snq_entryx_cr_resp;                  
wire            snq_inv_en;                          
wire            snq_issued_x;                        
wire            snq_need_chg_tag_i;                  
wire            snq_need_chg_tag_i_x;                
wire            snq_need_chg_tag_m;                  
wire            snq_need_chg_tag_s;                  
wire            snq_need_chg_tag_s_x;                
wire            snq_need_chg_tag_x;                  
wire            snq_need_read_data;                  
wire            snq_need_read_data_x;                
wire            snq_need_snpdt;                      
wire            snq_rd_tag_rdy;                      
wire            snq_rd_tag_rdy_x;                    
wire            snq_resp_clk_en;                     
wire            snq_resp_create_en;                  
wire            snq_resp_create_en_x;                
wire    [4 :0]  snq_return_snoop_resp;               
wire            snq_return_snoop_resp_vld;           
wire            snq_snoop_tag_req;                   
wire            snq_snoop_tag_req_x;                 
wire            snq_snoop_tag_start;                 
wire            snq_snoop_tag_start_x;               
wire            snq_tag_reissue;                     
wire            snq_tag_req_for_inv;                 
wire            snq_tag_req_for_inv_x;               
wire            snq_tag_req_issued;                  
wire            snq_vld_x;                           
wire            snq_wait_remove_vld;                 
wire            snq_wait_vb_vld;                     
wire            snq_way_x;                           
wire            snqctrlclk;                          
wire            snqdepdclk;                          
wire            snqentyclk;                          
wire            snqrespclk;                          
wire            st_da_snq_ecc_err;                   
wire            vb_bypass_invalid;                   
wire            vb_bypass_need_chg_tag;              
wire            vb_bypass_ready;                     
wire            vb_bypass_start;                     
wire            vb_bypass_vld;                       
wire            vb_bypass_vld_x;                     
wire            vb_bypass_with_clean;                
wire    [2 :0]  vb_snq_bypass_db_id;                 
wire            vb_snq_start_wait;                   
wire            vb_snq_start_wait_x;                 
wire    [1 :0]  vb_snq_wait_remove;                  
wire    [1 :0]  vb_snq_wait_vb_id;                   
wire    [39:0]  wmb_read_req_addr;                   
wire    [7 :0]  wmb_write_ptr;                       
wire    [39:0]  wmb_write_req_addr;                  


//======================================
//    Snoop Queue 
//entry content:
//| vld  | issue_depend[] | addr | snoop_type |
//| prot |    issued      | resp | way|
//======================================
//--------------------------------------
//snq_vld
always @(posedge snqctrlclk or negedge cpurst_b)
begin
  if(~cpurst_b)
    snq_vld   <= 1'b0;
  else
  begin
    if(snq_create_en)
      snq_vld <= 1'b1;
    else if(snq_inv_en) //,and invalid cur entry
      snq_vld <= 1'b0;
    else
      snq_vld <= snq_vld;
  end
end

//--------------------------------------
//issue_depend
assign snq_depd_remove_vld = |(snq_depd[9:0] & snq_depd_remove[9:0]);
 always @(posedge snqdepdclk or negedge cpurst_b)
 begin
   if(~cpurst_b)
     snq_depd[9:0] <= 10'b0;
   else if(snq_create_en)
     snq_depd[9:0] <= snq_create_depd[9:0];
   else if(snq_depd_remove_vld)
     snq_depd[9:0] <= snq_depd[9:0] & (~snq_depd_remove[9:0]);
 end

assign snq_rd_tag_rdy = (!(|snq_depd[9:0])) && snq_vld && !snq_issued;

//to remove deadlock for evict transaction
assign snq_entry_depd_vb_id[1:0] = {2{snq_vld}} & snq_depd[1:0];
//--------------------------------------
//data_buffer_depend
//distinguish from data bypass 
assign snpt_state_idle = !(|snpt_cur_state[4:0]);  //SNPT_IDLE
assign snq_wait_remove_vld = |(snq_need_wait_vb[1:0] & vb_snq_wait_remove[1:0]);
 always @(posedge snqctrlclk or negedge cpurst_b)
 begin
   if(~cpurst_b)
     snq_need_wait_vb[1:0] <= 2'b0;
   else if(vb_snq_start_wait)
     snq_need_wait_vb[1:0] <= vb_snq_wait_vb_id[1:0];
   else if(snq_wait_remove_vld)
     snq_need_wait_vb[1:0] <= snq_need_wait_vb[1:0] & (~vb_snq_wait_remove[1:0]);
 end

assign snq_wait_vb_vld = |snq_need_wait_vb[1:0];

//--------------------------------------
//vb_data_bypass
 always @(posedge snqctrlclk or negedge cpurst_b)
 begin
   if(~cpurst_b)
     vb_bypass_mode <= 1'b0;
   else if(snq_create_en)
     vb_bypass_mode <= 1'b0;
   else if(vb_bypass_vld)
     vb_bypass_mode <= 1'b1;
 end

 always @(posedge snqctrlclk or negedge cpurst_b)
 begin
   if(~cpurst_b)
     snq_entry_bypass_db_id[2:0] <= 3'b0;
   else if(vb_bypass_vld)
     snq_entry_bypass_db_id[2:0] <= vb_snq_bypass_db_id[2:0];
 end

assign vb_bypass_ready   = vb_bypass_need_chg_tag 
                           ? snpt_cur_state[4]
                           : snpt_cur_state[2] && arb_snq_entry_oldest_index; 

assign vb_bypass_start   = vb_bypass_mode 
                           && vb_bypass_ready
                           && !make_invalid_req;

assign vb_bypass_invalid = vb_bypass_mode 
                           && vb_bypass_ready
                           && make_invalid_req;
//--------------------------------------
//lfb_data_bypass
 always @(posedge snqctrlclk or negedge cpurst_b)
 begin
   if(~cpurst_b)
     lfb_bypass_mode <= 1'b0;
   else if(snq_create_en)
     lfb_bypass_mode <= 1'b0;
   else if(lfb_bypass_vld)
     lfb_bypass_mode <= 1'b1;
   else if(save_tag_resp && dcache_snq_tag_resp_valid)
     lfb_bypass_mode <= 1'b0;
 end

 always @(posedge snqctrlclk or negedge cpurst_b)
 begin
   if(~cpurst_b)
   begin
     snq_entry_bypass_lfb_data_id[1:0] <= 2'b0;
     snq_entry_bypass_dcache_share     <= 1'b0;
   end
   else if(lfb_bypass_vld)
   begin
     snq_entry_bypass_lfb_data_id[1:0] <= lfb_snq_bypass_data_id[1:0];
     snq_entry_bypass_dcache_share     <= lfb_snq_bypass_share;
   end
 end

assign lfb_bypass_invalid = lfb_bypass_mode 
                            && (snpt_cur_state[2]
                                   && arb_snq_entry_oldest_index
                                   && snq_need_chg_tag_i_ff
                                || save_tag_resp
                                   && dcache_snq_tag_resp_valid);

assign lfb_bypass_chg_tag = lfb_bypass_mode 
                            && snpt_cur_state[2]
                            && snq_need_chg_tag_s_ff
                            && arb_snq_entry_oldest_index;

assign lfb_bypass_invalid_data0 = lfb_bypass_invalid && snq_entry_bypass_lfb_data_id[0];
assign lfb_bypass_invalid_data1 = lfb_bypass_invalid && snq_entry_bypass_lfb_data_id[1];

assign lfb_bypass_chg_tag_data0 = lfb_bypass_chg_tag && snq_entry_bypass_lfb_data_id[0];
assign lfb_bypass_chg_tag_data1 = lfb_bypass_chg_tag && snq_entry_bypass_lfb_data_id[1];
//--------------------------------------
//addr/type/prot
assign snq_entry_from_snq_create_addr[`PA_WIDTH-1:0] = snq_create_addr[`PA_WIDTH-1:0];
always @(posedge snqentyclk or negedge cpurst_b)
begin
  if(~cpurst_b)
  begin
    snq_addr[`PA_WIDTH-5:0] <= {`PA_WIDTH-4{1'b0}};
    snq_type[3:0]           <= 4'b0;
    //snq_prot[2:0]           <= 3'b0;
  end
  else if(snq_create_en)
  begin
//    snq_depd[11:0] <= snoop_req_create_depd[11:0];
    snq_addr[`PA_WIDTH-5:0] <= snq_entry_from_snq_create_addr[`PA_WIDTH-1:4]; //128bits align
    snq_type[3:0]           <= snq_create_type[3:0];
    //snq_prot[2:0]           <= snq_create_prot[2:0];
  end
end

assign snq_tag_reissue = 1'b0; 
always @(posedge snqctrlclk or negedge cpurst_b)
begin
  if(~cpurst_b)
    snq_issued <= 1'b0;
  else if(snq_inv_en || snq_tag_reissue)
    snq_issued <= 1'b0;
  else if(snq_tag_req_issued)
    snq_issued <= 1'b1;
end
//--------------------------------------
//read tag resp
//[0]: DataTransfer
//[1]: Error
//[2]: PassDirty
//[3]: IsShared
//[4]: WasUnique
parameter READ_SHARED   = 4'b0001;
parameter READ_UNIQUE   = 4'b0111;
parameter READ_ONCE     = 4'b0000;
parameter CLEAN_INVALID = 4'b1001;
parameter CLEAN_SHARED  = 4'b1000;
parameter MAKE_INVALID  = 4'b1101;

assign make_invalid_req = (snq_type[3:0] == MAKE_INVALID);
//for bypass
assign dcache_snq_tag_resp_valid_final = dcache_snq_tag_resp_valid || lfb_bypass_mode || vb_bypass_mode;
assign dcache_snq_tag_resp_dirty_final = dcache_snq_tag_resp_valid
                                            && dcache_snq_tag_resp_dirty
                                         || vb_bypass_mode;
assign dcache_snq_tag_resp_share_final = dcache_snq_tag_resp_valid
                                         ? dcache_snq_tag_resp_share
                                         : lfb_bypass_mode && snq_entry_bypass_dcache_share;

//for vb clean and snq bypass,should change state when needed
assign vb_bypass_with_clean = dcache_snq_tag_resp_valid
                              && vb_bypass_mode;

always @(posedge snqrespclk or negedge cpurst_b)
begin
  if(~cpurst_b)
    vb_bypass_with_clean_ff  <= 1'b0;
  else if(save_tag_resp)
    vb_bypass_with_clean_ff  <= vb_bypass_with_clean;
  else
    vb_bypass_with_clean_ff  <= vb_bypass_with_clean_ff;
end

assign vb_bypass_need_chg_tag = vb_bypass_with_clean_ff
                                && snq_need_chg_tag_ff;   

//since L2 in inclusive, only M will transfer data for efficiency

//assign data_transfer =  (   dcache_snq_tag_resp_valid_final    //valid
//                         && (   snq_type[3:0] == READ_SHARED
//                             || snq_type[3:0] == READ_UNIQUE
//                             || snq_type[3:0] == READ_ONCE))
//                     || (   (dcache_snq_tag_resp_valid_final && dcache_snq_tag_resp_dirty_final)  //(M)
//                         && (   snq_type[3:0] == CLEAN_INVALID
//                             || snq_type[3:0] == CLEAN_SHARED));

assign data_transfer =  (dcache_snq_tag_resp_valid_final && dcache_snq_tag_resp_dirty_final)    //(M) 
                         && (   snq_type[3:0] == READ_SHARED
                             || snq_type[3:0] == READ_UNIQUE
                             || snq_type[3:0] == READ_ONCE
                             || snq_type[3:0] == CLEAN_INVALID
                             || snq_type[3:0] == CLEAN_SHARED);

assign pass_dirty    =  (dcache_snq_tag_resp_valid_final && dcache_snq_tag_resp_dirty_final)    //(M)
                     && (   snq_type[3:0] == READ_SHARED
                         || snq_type[3:0] == READ_UNIQUE
                         || snq_type[3:0] == CLEAN_INVALID
                         || snq_type[3:0] == CLEAN_SHARED);

assign is_shared     =  dcache_snq_tag_resp_valid_final  //
                     && (   snq_type[3:0] == READ_SHARED
                         || snq_type[3:0] == READ_ONCE
                         || snq_type[3:0] == CLEAN_SHARED);
assign error         = st_da_snq_ecc_err;
assign dcache_snq_resp[4:0] = {1'b0, //WasUnique donnot support
                               is_shared,
                               pass_dirty,
                               error,  //error donnot support
                               data_transfer
                              };
always @(posedge snqrespclk or negedge cpurst_b)
begin
  if(~cpurst_b)
  begin
    snq_resp[4:0] <= 5'b0;
    snq_way       <= 1'b0;
  end
  else if(save_tag_resp)
  begin
    snq_resp[4:0] <= dcache_snq_resp[4:0];
    snq_way       <= dcache_snq_tag_resp_way;

  end
  else
  begin
    snq_resp[4:0] <= snq_resp[4:0];
    snq_way       <= snq_way;
  end
end

//--------------------------------------
//after read tag, need read data and(or) change tag state(E/S/I)
// m always change to 0
assign snq_need_read_data =  data_transfer;
assign snq_need_chg_tag_m =  (dcache_snq_tag_resp_valid_final && dcache_snq_tag_resp_dirty_final)    //(M)
                          && (snq_type[3:0] == CLEAN_SHARED);
// &Force("nonport","dcache_snq_tag_resp_share_final"); @299
assign snq_need_chg_tag_s =  (dcache_snq_tag_resp_valid_final && !dcache_snq_tag_resp_share_final) //(E/M)
                          && (   snq_type[3:0] == CLEAN_SHARED
                              || snq_type[3:0] == READ_SHARED);
assign snq_need_chg_tag_i =  dcache_snq_tag_resp_valid_final    //valid
                          && (   snq_type[3:0] == READ_UNIQUE
                              || snq_type[3:0] == CLEAN_INVALID
                              || snq_type[3:0] == MAKE_INVALID);

assign snq_tag_req_for_inv=     snq_type[3:0] == READ_UNIQUE
                            ||  snq_type[3:0] == CLEAN_INVALID
                            ||  snq_type[3:0] == MAKE_INVALID;

always @(posedge snqrespclk or negedge cpurst_b)
begin
  if(~cpurst_b)
  begin
    snq_need_read_data_ff <= 1'b0;
//    snq_need_chg_tag_m_ff <= 1'b0;
    snq_need_chg_tag_s_ff <= 1'b0;
    snq_need_chg_tag_i_ff <= 1'b0;
    snq_need_chg_tag_ff   <= 1'b0;
  end
  else if(save_tag_resp)
  begin
    snq_need_read_data_ff <= snq_need_read_data && !vb_bypass_mode;
//    snq_need_chg_tag_m_ff <= snq_need_chg_tag_m;
    snq_need_chg_tag_s_ff <= snq_need_chg_tag_s;
    snq_need_chg_tag_i_ff <= snq_need_chg_tag_i;
    snq_need_chg_tag_ff   <= snq_need_chg_tag_m || snq_need_chg_tag_s || snq_need_chg_tag_i;
  end
  else
  begin
    snq_need_read_data_ff <= snq_need_read_data_ff;
//    snq_need_chg_tag_m_ff <= snq_need_chg_tag_m_ff;
    snq_need_chg_tag_s_ff <= snq_need_chg_tag_s_ff;
    snq_need_chg_tag_i_ff <= snq_need_chg_tag_i_ff;
    snq_need_chg_tag_ff   <= snq_need_chg_tag_ff;
  end
end

assign snq_need_snpdt =  snq_need_read_data
                      || snq_need_chg_tag_m
                      || snq_need_chg_tag_s
                      || snq_need_chg_tag_i;


//======================================
//          SNPT FSM(Snoop Tag)
//IDLE     : launch read tag req
//WAIT_RESP: wait tag resp,
//           start SDT FSM(read data,if need)
//WAIT_SDT_CMPLT:
//           wait read data and(or) change tag cmplt
//WAIT_POP : if this entry oldest,then 
//           return resp and pop                      
//           
//======================================
parameter SNPT_IDLE             = 5'b00000;
parameter SNPT_WAIT_DATA_BUFFER = 5'b00001;
parameter SNPT_WAIT_RESP        = 5'b00010;
parameter SNPT_SDT_REQ          = 5'b00100;
parameter SNPT_WAIT_SDT_CMPLT   = 5'b01000;
parameter SNPT_WAIT_POP         = 5'b10000;

always @(posedge snqctrlclk or negedge cpurst_b)
begin
  if(!cpurst_b)
    snpt_cur_state[4:0] <= SNPT_IDLE;
  else
    snpt_cur_state[4:0] <= snpt_next_state[4:0];
end

// &CombBeg; @372
always @( snq_wait_vb_vld
       or dcache_snq_snoop_tag_grnt
       or snq_tag_reissue
       or snpdt_snq_cmplt
       or snq_resp_create_en
       or lfb_bypass_mode
       or arb_snq_entry_oldest_index
       or vb_bypass_mode
       or dcache_snq_snpdt_grnt
       or snq_snoop_tag_start
       or snpt_cur_state
       or vb_bypass_need_chg_tag
       or snq_need_snpdt
       or biu_snq_cr_resp_acept)
begin
  case(snpt_cur_state)
    SNPT_IDLE:
    begin
      if(snq_snoop_tag_start && dcache_snq_snoop_tag_grnt)
        snpt_next_state[4:0] = SNPT_WAIT_RESP;
      else
        snpt_next_state[4:0] = SNPT_IDLE;
    end
    SNPT_WAIT_DATA_BUFFER:
    begin
      if(!snq_wait_vb_vld)
        snpt_next_state[4:0] = SNPT_WAIT_POP;
      else
        snpt_next_state[4:0] = SNPT_WAIT_DATA_BUFFER;
    end
    SNPT_WAIT_RESP:
    begin
      if(snq_resp_create_en)
      begin
        if(snq_need_snpdt) //need read data and(or) change tag
          snpt_next_state[4:0] = SNPT_SDT_REQ;
        //for timing to wait pop
        //else if(biu_snq_cr_resp_acept)
        //  snpt_next_state[3:0] = SNPT_IDLE;
        else if(snq_wait_vb_vld)
          snpt_next_state[4:0] = SNPT_WAIT_DATA_BUFFER;
        else
          snpt_next_state[4:0] = SNPT_WAIT_POP;
      end
      else if(snq_tag_reissue)
        snpt_next_state[4:0] = SNPT_IDLE;
      else
        snpt_next_state[4:0] = SNPT_WAIT_RESP;
    end
    SNPT_SDT_REQ:
    begin
      if((vb_bypass_mode && !vb_bypass_need_chg_tag || lfb_bypass_mode) && arb_snq_entry_oldest_index)
        snpt_next_state[4:0] = SNPT_WAIT_POP;
      else if(dcache_snq_snpdt_grnt && arb_snq_entry_oldest_index)
        snpt_next_state[4:0] = SNPT_WAIT_SDT_CMPLT;
      else
        snpt_next_state[4:0] = SNPT_SDT_REQ;
    end
    SNPT_WAIT_SDT_CMPLT:
    begin
      if(snpdt_snq_cmplt && snq_wait_vb_vld)
        snpt_next_state[4:0] = SNPT_WAIT_DATA_BUFFER;
      else if(snpdt_snq_cmplt)
        snpt_next_state[4:0] = SNPT_WAIT_POP;
      else
        snpt_next_state[4:0] = SNPT_WAIT_SDT_CMPLT;
    end
    SNPT_WAIT_POP:
    begin
      if(biu_snq_cr_resp_acept)
        snpt_next_state[4:0] = SNPT_IDLE;
      else
        snpt_next_state[4:0] = SNPT_WAIT_POP;
    end
    default:
      snpt_next_state[4:0] = SNPT_IDLE;
  endcase
// &CombEnd; @435
end

assign snq_snoop_tag_req = snq_snoop_tag_start;
assign snq_tag_req_issued = snq_snoop_tag_start 
                            && dcache_snq_snoop_tag_grnt 
                            && snpt_state_idle;
assign save_tag_resp = snq_resp_create_en; 
assign snpt_snpdt_start =  arb_snq_entry_oldest_index 
                           && snpt_cur_state[2] 
                           && (!vb_bypass_mode || vb_bypass_need_chg_tag) 
                           && !lfb_bypass_mode; 
//                        && (snpt_cur_state[2:0] == SNPT_SDT_REQ);
assign snq_return_snoop_resp_vld =  arb_snq_entry_oldest_index
                                 && snpt_cur_state[4];
assign snq_return_snoop_resp[4:0] = snq_resp[4:0];
assign snq_inv_en =  biu_snq_cr_resp_acept;
                  //&& (snpt_cur_state[2:0] == SNPT_WAIT_POP);


//&CombBeg;
//  snq_snoop_tag_req = 1'b0;
//  snq_tag_req_issued      = 1'b0;
//  save_tag_resp             = 1'b0;
//  snpt_snpdt_start          = 1'b0;
//  snq_return_snoop_resp_vld     = 1'b0;
//  case(snpt_cur_state)
//    SNPT_IDLE:
//    begin
//      if(snq_snoop_tag_start)       //select cur entry to read tag
//      begin
//        snq_snoop_tag_req = 1'b1; //read tag
//        if(dcache_arb_snq_st_grnt)
//          snq_tag_req_issued = 1'b1; //set snq_issued bit
//        else
//          snq_tag_req_issued = 1'b0;
//      end
//      else
//      begin
//        snq_snoop_tag_req = 1'b0;
//        snq_tag_req_issued      = 1'b0;
//      end
//    end
//    SNPT_WAIT_RESP:
//    begin
//      if(snq_resp_create_en)
//        save_tag_resp = 1'b1;
//      else
//        save_tag_resp = 1'b0;
//    end
//    SNPT_WAIT_SDT_CMPLT:
//    begin
//      if(arb_snq_entry_oldest_index)
//        snpt_snpdt_start = 1'b1;
//      else
//        snpt_snpdt_start = 1'b0;
//    end
//    SNPT_WAIT_POP:
//    begin
//      snq_return_snoop_resp_vld = 1'b1;
//      if(biu_snq_cr_resp_acept)
//        snq_inv_en = 1'b1;
//      else
//        snq_inv_en = 1'b0;
//    end
//  endcase
//&CombEnd;
        
//======================================
//         cr resp return
//
//======================================
//assign cur_entry_cr_valid     = snq_return_snoop_resp_vld;
//assign cur_entry_cr_resp[4:0] = snq_resp[4:0];

//==========================================================
//                        hit idx
//==========================================================
//------------------compare wmb write req-------------------
assign snq_entry_cmp_wmb_write_req_addr[`PA_WIDTH-1:0]  = wmb_write_req_addr[`PA_WIDTH-1:0];
//when wmb is writing and snq depend this write,not set hit idx
//do not compare st amo inst
assign snq_entry_wmb_write_req_hit_idx  =  snq_vld
                                        &&  (snq_addr[9:2]
                                            == snq_entry_cmp_wmb_write_req_addr[13:6])
                                        &&  (|((~snq_depd[9:2]) & wmb_write_ptr[7:0]));
//------------------compare wmb read req--------------------
assign snq_entry_cmp_wmb_read_req_addr[`PA_WIDTH-1:0]  = wmb_read_req_addr[`PA_WIDTH-1:0];
//when wmb is writing and snq depend this write,not set hit idx
assign snq_entry_wmb_read_req_hit_idx   =  snq_vld
                                        && (snq_addr[9:2]
                                            == snq_entry_cmp_wmb_read_req_addr[13:6]);
//------------------compare lfb vb req addr-----------------
assign snq_entry_cmp_lfb_vb_addr_tto6[`PA_WIDTH-7:0]  = lfb_vb_addr_tto6[`PA_WIDTH-7:0];
assign snq_entry_lfb_vb_req_hit_idx     = snq_vld
                                          &&  (snq_addr[9:2]
                                              ==  snq_entry_cmp_lfb_vb_addr_tto6[7:0]);
//==========================================================
// low power gated clock for snq entry
//==========================================================

assign snq_ctl_clk_en =  snq_create_en
                        || snq_vld;
// &Instance("gated_clk_cell","x_snq_ctrl_gated_cell"); @537
gated_clk_cell  x_snq_ctrl_gated_cell (
  .clk_in             (lsu_snoop_clk     ),
  .clk_out            (snqctrlclk        ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (snq_ctl_clk_en    ),
  .module_en          (cp0_lsu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect( .clk_in           (lsu_snoop_clk        ), @538
//           .clk_out          (snqctrlclk            ), @539
//           .external_en      (1'b0                  ), @540
//           .global_en        (1'b1                  ), @541
//           .local_en         (snq_ctl_clk_en        ), @542
//           .module_en        (cp0_lsu_icg_en   ) @543
//         ); @544


assign snq_depd_clk_en =  snq_create_en 
                       || snq_depd_remove_vld;
// &Instance("gated_clk_cell","x_snq_depd_gated_cell"); @549
gated_clk_cell  x_snq_depd_gated_cell (
  .clk_in             (lsu_snoop_clk     ),
  .clk_out            (snqdepdclk        ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (snq_depd_clk_en   ),
  .module_en          (cp0_lsu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect( .clk_in           (lsu_snoop_clk        ), @550
//           .clk_out          (snqdepdclk            ), @551
//           .external_en      (1'b0                  ), @552
//           .global_en        (1'b1                  ), @553
//           .local_en         (snq_depd_clk_en       ), @554
//           .module_en        (cp0_lsu_icg_en   ) @555
//         ); @556

assign snq_entry_clk_en = snq_create_en;
// &Instance("gated_clk_cell","x_snq_entry_gated_cell"); @559
gated_clk_cell  x_snq_entry_gated_cell (
  .clk_in             (lsu_snoop_clk     ),
  .clk_out            (snqentyclk        ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (snq_entry_clk_en  ),
  .module_en          (cp0_lsu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect( .clk_in           (lsu_snoop_clk        ), @560
//           .clk_out          (snqentyclk            ), @561
//           .external_en      (1'b0                  ), @562
//           .global_en        (1'b1                  ), @563
//           .local_en         (snq_entry_clk_en      ), @564
//           .module_en        (cp0_lsu_icg_en   ) @565
//         ); @566

assign snq_resp_clk_en = save_tag_resp;
// &Instance("gated_clk_cell","x_snq_resp_gated_cell"); @569
gated_clk_cell  x_snq_resp_gated_cell (
  .clk_in             (lsu_snoop_clk     ),
  .clk_out            (snqrespclk        ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (snq_resp_clk_en   ),
  .module_en          (cp0_lsu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect( .clk_in           (lsu_snoop_clk        ), @570
//           .clk_out          (snqrespclk            ), @571
//           .external_en      (1'b0                  ), @572
//           .global_en        (1'b1                  ), @573
//           .local_en         (snq_resp_clk_en       ), @574
//           .module_en        (cp0_lsu_icg_en   ) @575
//         );  @576

//==========================================================
//                    input/output
//==========================================================
//input
assign snq_create_en              = snq_create_en_x;
assign snq_resp_create_en         = snq_resp_create_en_x;
assign snq_snoop_tag_start        = snq_snoop_tag_start_x;
//--------------------------------------
assign arb_snq_entry_oldest_index = arb_snq_entry_oldest_index_x;
assign snpdt_snq_cmplt            = snpdt_snq_cmplt_x;
assign biu_snq_cr_resp_acept      = biu_snq_cr_resp_acept_x;

//--------------------------------------
//output
//valid
assign snq_vld_x = snq_vld;
//--------------------------------------
//ready
assign snq_rd_tag_rdy_x      = snq_rd_tag_rdy;
//--------------------------------------
// read tag req
assign snq_snoop_tag_req_x = snq_snoop_tag_req;
assign snq_entryx_addr[`PA_WIDTH-5:0] = snq_addr[`PA_WIDTH-5:0];
//--------------------------------------
//start read data/change tag
assign snpt_snpdt_start_x         = snpt_snpdt_start;
//assign snpt_snpdt_start_window_x  = snpt_cur_state[2];
assign snq_need_read_data_x       = snq_need_read_data_ff;
//assign snq_need_chg_tag_m_x       = snq_need_chg_tag_m_ff;
assign snq_need_chg_tag_s_x       = snq_need_chg_tag_s_ff;
assign snq_need_chg_tag_i_x       = snq_need_chg_tag_i_ff;
assign snq_tag_req_for_inv_x      = snq_tag_req_for_inv;
assign snq_need_chg_tag_x         = snq_need_chg_tag_ff; //for timing
assign snq_way_x                  = snq_way;
assign snq_issued_x               = snq_issued;

//--------------------------------------
//resp
assign snq_cr_resp_valid_x     = snq_return_snoop_resp_vld;
assign snq_entryx_cr_resp[4:0] = snq_return_snoop_resp[4:0];

//--------------------------------------
assign vb_snq_start_wait       = vb_snq_start_wait_x;
//data bypass
assign vb_bypass_vld           = vb_bypass_vld_x;
assign lfb_bypass_vld          = lfb_bypass_vld_x;

assign snq_entry_vb_bypass_start_x   = vb_bypass_start;
assign snq_entry_vb_bypass_invalid_x = vb_bypass_invalid;
assign snq_entry_vb_bypass_readonce_x= (snq_type[3:0] == READ_ONCE);
assign snq_entry_bypass_db_id_v[2:0] = snq_entry_bypass_db_id[2:0];

//for evict deadlock
assign snq_entry_depd_vb_id_v[1:0] = snq_entry_depd_vb_id[1:0];

assign snq_entry_lfb_bypass_invalid_data0_x = lfb_bypass_invalid_data0;
assign snq_entry_lfb_bypass_invalid_data1_x = lfb_bypass_invalid_data1;
assign snq_entry_lfb_bypass_chg_tag_data0_x = lfb_bypass_chg_tag_data0;
assign snq_entry_lfb_bypass_chg_tag_data1_x = lfb_bypass_chg_tag_data1;
//--------------------------------------
//hit idx
assign snq_entry_wmb_write_req_hit_idx_x  = snq_entry_wmb_write_req_hit_idx;
assign snq_entry_wmb_read_req_hit_idx_x   = snq_entry_wmb_read_req_hit_idx;
assign snq_entry_lfb_vb_req_hit_idx_x     = snq_entry_lfb_vb_req_hit_idx;

// &ModuleEnd; @646
endmodule













