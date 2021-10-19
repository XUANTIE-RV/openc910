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
#ifndef __DATATYPE_H__
#define __DATATYPE_H__

typedef	unsigned char           uint8_t;
typedef unsigned short          uint16_t;
typedef unsigned int            uint32_t;
typedef unsigned long           uint64_t;
//typedef unsigned int            uintptr_t;
typedef	signed char             int8_t;
typedef signed short            int16_t;
typedef signed int              int32_t;
typedef signed long             int64_t;
//typedef unsigned int            size_t;
typedef volatile unsigned char  reg8_t;
typedef volatile unsigned short reg16_t;
typedef volatile unsigned int   reg32_t;

#ifndef SUCCESS
#define SUCCESS  0
#endif

#endif

