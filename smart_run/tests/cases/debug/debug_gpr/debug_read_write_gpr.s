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

.global main

main:

# #read to x10 & set imm bit to csr
# csrrsi x10,mstatus,0x8
# # csrrsi mstatus, 0x8
# csrci mhcr, 0x1
# csrci mhcr, 0x2

.global LOOP
LOOP:
 c.j LOOP


