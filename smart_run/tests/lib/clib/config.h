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
/*
 * file: config.h
 *
 * Some CPU configure infomation:
 * Data type, Baudrate for UART;
 * MGU, CACHE, SPM, System Frequency.
 *  
 */

#ifndef __DEMO_CONFIG_H
#define __DEMO_CONFIG_H

/******************************
 * Data type.
 *****************************/
#ifndef U32
#define U32 unsigned int
#define U8 unsigned char
#endif

/************************************
 *  UART Terminal 
 * (8 data bitbs, ODD, 1 stop bits)
 ***********************************/

#define BAUDRATE			19200

/*******************************
 * Config System
 *******************************/
/*
 *  Run on SPARK ?
 *  0 -- run on board, 1 -- run on spark.
 */
#define CONFIG_SYS_SPARK		1

/* CPU frequence definition */
#define SYS_FREQ			100000000   /* MHz */
/* APB frequence definition */
#define APB_FREQ			100000000   /* MHz */ 

#define CLOCKS_PER_SEC    APB_FREQ
/*******************************
 * Config CPU cache
 ******************************/

/* 0 - rw; 1 - rwc; 2 - rwc; 3 - rw */
#define CONFIG_CK510_MGU_BLOCKS		0xff06 

/* 0 - baseaddr: 0x0; size: 4G */
#define CONFIG_CK510_MGU_REGION1	0x3f
/* 1- baseaddr: 0x8000000; size: 8M */
#define CONFIG_CK510_MGU_REGION2	0x800002f
/* 2- baseaddr: 0x0; size: 64K */
#define CONFIG_CK510_MGU_REGION3	0x2f
/* 3- baseaddr: 0x0; size: 64k */
#undef CONFIG_CK510_MGU_REGION4

#define CONFIG_CK510_ICACHE		1
#define CONFIG_CK510_DCACHE		1

/*********************************
 *  Config CKCORE SPM
 ********************************/

/* Having SPM ? */
#define	CONFIG_CKCORE_SPM			0
/* Enable SPM?*/
#define	CONFIG_CKCORE_SPM_ENABLE	1
/* Uniform SPM ? */
#define	CONFIG_CKCORE_SPM_UNIFORM	0
/* 
 * Instruction SPM start address mapping
 * Data SPM start address mapping
 * Fixed with ckcore.ld ?
 *
 * You can delete __ckcore_dspm from ckcore.ld,
 * and define CONFIG_CKCORE_DSPM_ADDRESS with
 * other value, such as stack base address.
 */
#if CONFIG_CKCORE_SPM_UNIFORM
#define	CONFIG_CKCORE_SPM_ADDRESS	__ckcore_ispm
#define	CONFIG_CKCORE_ISPM_ADDRESS	CONFIG_CKCORE_SPM_ADDRESS
#define	CONFIG_CKCORE_DSPM_ADDRESS	CONFIG_CKCORE_SPM_ADDRESS
#else
#define	CONFIG_CKCORE_ISPM_ADDRESS	__ckcore_ispm
#define	CONFIG_CKCORE_DSPM_ADDRESS	__ckcore_dspm
#endif
/* 
 * SPM Size
 * Fixed with target.
 * please modify ckcore.ld.
 */
#define	CONFIG_CKCORE_ISPM_SIZE		16384
#define	CONFIG_CKCORE_DSPM_SIZE		8192
/* SPM mode */
#define	CONFIG_CKCORE_ISPM_MODE		1	/* 0 - Cache, 1 - Local memory */
#define	CONFIG_CKCORE_DSPM_MODE		1	/* 0 - Cache, 1 - Local memory */
/* SPM Transfer ? */
#define	CONFIG_CKCORE_ISPM_TRANSFER	1	/* 0 - NO, 1 - YES */
#define	CONFIG_CKCORE_DSPM_TRANSFER	1	/* 0 - NO, 1 - YES */


#endif /* __DEMO_CONFIG_H */
