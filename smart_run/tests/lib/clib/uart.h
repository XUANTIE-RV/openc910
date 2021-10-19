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
#ifndef __UART_H__
#define __UART_H__

#include "datatype.h"

//#define FAPB    10000000L
#define BAUD    19200L

#define UART0_BASE_ADDR  0x10015000
/* UART registers addr definition */
#define CK_UART_RBR       0x00    /* Receive Buffer Register (32 bits, R) */
#define CK_UART_THR       0x00    /* Transmit Holding Register (32 bits, W) */
#define CK_UART_DLL       0x00    /* Divisor Latch(Low)  (32 bits, R/W) */
#define CK_UART_IER       0x01    /* Interrupt Enable Register (32 bits, R/W) */
#define CK_UART_DLH       0x01    /* Divisor Latch(High) (32 bits, R/W) */
#define CK_UART_IIR       0x02    /* Interrupt Identity Register (32 bits, R) */
#define CK_UART_FCR       0x02    /* fifo Countrol Register (32 bits, W) */
#define CK_UART_LCR       0x03    /* Line Control Register (32 bits, R/W) */
#define CK_UART_MCR       0x04    /* Modem Control Register (32 bits, W) */
#define CK_UART_LSR       0x05    /* Line Status Register (32 bits, R) */
#define CK_UART_MSR       0x06    /* Modem Status Register (32 bits, R/W) */
#define CK_UART_USR       0x1f    /* UART Status Register (32 bits, R/W) */

typedef enum {
    STOPBIT_1,
    STOPBIT_2
} t_ck_uart_stopbit;

typedef enum {
    PARITY_NONE,
    PARITY_ODD,
    PARITY_EVEN
} t_ck_uart_parity;

typedef enum {
    WORDSIZE_5,
    WORDSIZE_6,
    WORDSIZE_7,
    WORDSIZE_8,
    WORDSIZE_9
} t_ck_uart_wordsize;

typedef enum {
    DISABLE,
    ENABLE
} t_ck_uart_mode;

typedef struct {
    uint32_t            baudrate;
    t_ck_uart_stopbit   stopbit;
    t_ck_uart_parity    parity;
    t_ck_uart_wordsize  wordsize;
    t_ck_uart_mode      rxmode;
    t_ck_uart_mode      txmode;
} t_ck_uart_cfig, *p_ck_uart_cfig;

typedef struct {
    uint32_t uart_id;
    uint32_t* register_map;
    uint32_t baudrate;
    t_ck_uart_parity parity;
    t_ck_uart_stopbit stopbit;
    t_ck_uart_wordsize wordsize;
    t_ck_uart_mode rxmode;
    t_ck_uart_mode txmode;
} t_ck_uart_device, *p_ck_uart_device;

/*
 * @brief  open a UART device, use id to select
 *         if more than one UART devices exist in SOC
 * @param  uart_device: uart device handler
 * @param  id: UART device ID
 * @retval 0 if success, 1 if fail
 */
uint32_t ck_uart_open(p_ck_uart_device uart_device, uint32_t id);

/*
 * @brief  close UART device handler
 * @param  uart_device: uart device handler
 * @retval 0 if success, 1 if fail
 */
uint32_t ck_uart_close(p_ck_uart_device uart_device);

/*
 * @brief  Initialize UART configurations from uart_cfig data structure
 * @param  uart_device: uart device handler
 * @param  uart_cfig: uart configurations collection, a structure datatype
 * @retval 0 if success, 1 if fail
 */
uint32_t ck_uart_init(p_ck_uart_device uart_device, p_ck_uart_cfig uart_cfig);

/*
 * @brief  transmit a character through UART
 * @param  uart_device: uart device handler
 * @param  c: character needs to transmit
 * @retval 0 if success, 1 if fail
 */
uint32_t ck_uart_putc(p_ck_uart_device uart_device, uint8_t c);

/*
 * @brief  check uart device's status, busy or idle
 * @param  uart_device: uart device handler
 * @retval 0 if uart is in idle, 1 if busy
 */
uint32_t ck_uart_status(p_ck_uart_device uart_device);

#endif

