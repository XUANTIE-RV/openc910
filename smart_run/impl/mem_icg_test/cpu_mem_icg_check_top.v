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

module cpu_mem_icg_check_top(); 
  wire bht_mem_passed;
  wire btb_mem_passed;
  wire dmem_passed;
  wire imem_passed;
  wire icg_passed;
  wire mmu_mem_passed;
  wire l2_mem_passed;
  wire ifupred_mem_passed;
  
  
  initial
  begin
  #10000
  
  if(ifupred_mem_passed ===1'b1 )
      begin
             $display("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$");
             $display("$           ifupred mem test passed!!!!!!!!!!!!!!!!!!!!               $");    
             $display("$           ifupred_mem_test passed = %h",ifupred_mem_passed);    
             $display("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$");
      end
  else
      begin
             $display("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$");
             $display("$           ERROR::  ifupred mem test failed!!!!!!!!!!!!!!!!!!!!               $");    
             $display("$           ifupred_mem_test passed = %h",ifupred_mem_passed);    
             $display("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$");
             $finish;
      end
  //#100
  //$finish;
  end 
  initial
  begin
  #10000
  
  if(bht_mem_passed ===1'b1 )
      begin
             $display("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$");
             $display("$           bht mem test passed!!!!!!!!!!!!!!!!!!!!               $");    
             $display("$           bht_mem_test passed = %h",bht_mem_passed);    
             $display("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$");
      end
  else
      begin
             $display("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$");
             $display("$           ERROR::  bht mem test failed!!!!!!!!!!!!!!!!!!!!               $");    
             $display("$           bht_mem_test passed = %h",bht_mem_passed);    
             $display("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$");
             $finish;
      end
  //#100
  //$finish;
  end 
  
  
  initial
  begin
  #10000
  `ifdef BTB
  if(btb_mem_passed ===1'b1 )
      begin
             $display("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$");
             $display("$           btb mem test passed!!!!!!!!!!!!!!!!!!!!               $");    
             $display("$           btb_mem_test passed = %h",btb_mem_passed);    
             $display("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$");
      end
  else
      begin
             $display("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$");
             $display("$           ERROR::  btb mem test failed!!!!!!!!!!!!!!!!!!!!               $");    
             $display("$           btb_mem_test passed = %h",btb_mem_passed);    
             $display("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$");
             $finish;
      end
  `else
  
             $display("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$");
             $display("$          BTB not define ");    
             $display("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$");
  `endif
  //#100
  //$finish;
  end 
  
  
  
  initial
  begin
  #10000
  if(dmem_passed ===1'b1 )
      begin
             $display("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$");
             $display("$           dmem test passed!!!!!!!!!!!!!!!!!!!!               $");    
             $display("$           dmem_test passed = %h",dmem_passed);    
             $display("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$");
      end
  else
      begin
             $display("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$");
             $display("$            ERROR::  dmem test failed!!!!!!!!!!!!!!!!!!!!               $");    
             $display("$           dmem_test passed = %h",dmem_passed);    
             $display("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$");
             $finish;
      end
  //#100
  //$finish;
  end 
  
  
  
  initial
  begin
  #10000
  
  if(imem_passed ===1'b1 )
      begin
             $display("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$");
             $display("$           imem test passed!!!!!!!!!!!!!!!!!!!!               $");    
             $display("$           imem_test passed = %h",imem_passed);    
             $display("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$");
      end
  else
      begin
             $display("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$");
             $display("$           ERROR:: imem test failed!!!!!!!!!!!!!!!!!!!!               $");    
             $display("$           imem_test passed = %h",imem_passed);    
             $display("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$");
             $finish;
      end
  #100
             $display("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$");
             $display("$         Congratuaion all mem & icg test PASSED!!!!!!!!!!                  $");
             $display("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$");
  #100
  $finish;
  end 
  
  
  initial
  begin
  #10000
  if(mmu_mem_passed ===1'b1 )
      begin
             $display("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$");
             $display("$           mmu_mem_test passed!!!!!!!!!!!!!!!!!!!!               $");    
             $display("$           mmu_mem_test passed = %h",mmu_mem_passed);    
             $display("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$");
      end
  else
      begin
             $display("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$");
             $display("$  ERROR::  mmu_mem_test failed!!!!!!!!!!!!!!!!!!!!               $");    
             $display("$           mmu_mem_test passed = %h",mmu_mem_passed);    
             $display("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$");
             $finish;
      end
  //#100
  //$finish;
  end 
  
  initial
  begin
  #100000
  if(l2_mem_passed ===1'b1 )
      begin
             $display("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$");
             $display("$           l2_mem_test passed!!!!!!!!!!!!!!!!!!!!               $");    
             $display("$           l2_mem_test passed = %h",l2_mem_passed);    
             $display("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$");
      end
  else
      begin
             $display("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$");
             $display("$  ERROR::  l2_mem_test failed!!!!!!!!!!!!!!!!!!!!               $");    
             $display("$           l2_mem_test passed = %h",l2_mem_passed);    
             $display("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$");
             $finish;
      end
  //#100
  //$finish;
  end
  
  initial
  begin
  #10000
  if( icg_passed ===1'b1 )
      begin
             $display("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$");
             $display("$           icg_test passed!!!!!!!!!!!!!!!!!!!!               $");    
             $display("$           icg_test passed = %h",icg_passed);    
             $display("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$");
      end
  else
      begin
             $display("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$");
             $display("$  ERROR::  icg_test failed!!!!!!!!!!!!!!!!!!!!               $");    
             $display("$           icg_test passed = %h",icg_passed);    
             $display("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$");
             $finish;
      end
  //#100
  //$finish;
  end
  
  cpu_ifupred_mem_test_tb a(.ifupred_mem_passed(ifupred_mem_passed));
  cpu_imem_test_tb b(.imem_passed (imem_passed));
  cpu_icg_test_tb c(.icg_passed (icg_passed));
  cpu_dmem_test_tb d(.dmem_passed (dmem_passed));
  cpu_bht_mem_test_tb bht(.bht_mem_passed (bht_mem_passed));
  `ifdef BTB
  cpu_btb_mem_test_tb f(.btb_mem_passed (btb_mem_passed));
  `endif 
  cpu_mmu_mem_test_tb g(.mmu_mem_passed (mmu_mem_passed));
  cpu_l2_mem_test_tb h(.l2_mem_passed (l2_mem_passed));
endmodule
