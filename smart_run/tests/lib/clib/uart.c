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
#include "uart.h"
#include "config.h"

/* UART register bit definitions */
#define USR_UART_BUSY           0x01
#define LSR_DATA_READY          0x01
#define LSR_THR_EMPTY           0x20
#define IER_RDA_INT_ENABLE      0x01
#define IER_THRE_INT_ENABLE     0x02
#define IIR_NO_ISQ_PEND         0x01

#define LCR_SET_DLAB            0x80       /* enable r/w DLR to set the baud rate */
#define LCR_PARITY_ENABLE	    0x08       /* parity enabled */
#define LCR_PARITY_EVEN         0x10   /* Even parity enabled */
#define LCR_PARITY_ODD          0xef   /* Odd parity enabled */
#define LCR_WORD_SIZE_5         0xfc   /* the data length is 5 bits */
#define LCR_WORD_SIZE_6         0x01   /* the data length is 6 bits */
#define LCR_WORD_SIZE_7         0x02   /* the data length is 7 bits */
#define LCR_WORD_SIZE_8         0x03   /* the data length is 8 bits */
#define LCR_STOP_BIT1           0xfb   /* 1 stop bit */
#define LCR_STOP_BIT2           0x04  /* 1.5 stop bit */

#define CK_LSR_PFE              0x80     
#define CK_LSR_TEMT             0x40
#define CK_LSR_THRE             0x40
#define	CK_LSR_BI               0x10
#define	CK_LSR_FE               0x08
#define	CK_LSR_PE               0x04
#define	CK_LSR_OE               0x02
#define	CK_LSR_DR               0x01
#define CK_LSR_TRANS_EMPTY      0x20


void ck_uart_set_baudrate(p_ck_uart_device uart_device, uint32_t baudrate)
{ /* {{{ ck_uart_set_baudrate */
    uint32_t baud_div;
    uint32_t *addr = uart_device->register_map;
    baud_div = (APB_FREQ/baudrate) >> 4;
    uart_device->baudrate = baudrate;
    *(reg8_t*)(addr+CK_UART_LCR) |= LCR_SET_DLAB;
    *(reg8_t*)(addr+CK_UART_DLL) = (baud_div & 0xFF);
    *(reg8_t*)(addr+CK_UART_DLH) = ((baud_div >> 8) & 0xFF);
    *(reg8_t*)(addr+CK_UART_LCR) &= (~LCR_SET_DLAB);
} /* }}} */

void ck_uart_set_parity(p_ck_uart_device uart_device, t_ck_uart_parity parity)
{ /* {{{ ck_uart_set_parity */
    uart_device->parity = parity;
    switch (parity)
    {
        case PARITY_NONE:
            *(reg8_t*)(uart_device->register_map+CK_UART_LCR) &= (~LCR_PARITY_ENABLE);
            break;
        case PARITY_ODD:
            *(reg8_t*)(uart_device->register_map+CK_UART_LCR) |= LCR_PARITY_ENABLE;
            *(reg8_t*)(uart_device->register_map+CK_UART_LCR) &= LCR_PARITY_ODD;
            break;
        case PARITY_EVEN:
            *(reg8_t*)(uart_device->register_map+CK_UART_LCR) |= LCR_PARITY_ENABLE;
            *(reg8_t*)(uart_device->register_map+CK_UART_LCR) |= LCR_PARITY_EVEN;
            break;
        default:
            break;
    }
} /* }}} */

void ck_uart_set_wordsize(p_ck_uart_device uart_device, t_ck_uart_wordsize wordsize)
{ /* {{{ ck_uart_set_wordsize */
    uart_device->wordsize = wordsize;
    switch (wordsize)
    {
        case WORDSIZE_5:
            *(reg8_t*)(uart_device->register_map+CK_UART_LCR) &= LCR_WORD_SIZE_5;
            break;
        case WORDSIZE_6:
            *(reg8_t*)(uart_device->register_map+CK_UART_LCR) &= 0xfd;
            *(reg8_t*)(uart_device->register_map+CK_UART_LCR) |= LCR_WORD_SIZE_6;
            break;
        case WORDSIZE_7:
            *(reg8_t*)(uart_device->register_map+CK_UART_LCR) &= 0xfe;
            *(reg8_t*)(uart_device->register_map+CK_UART_LCR) |= LCR_WORD_SIZE_7;
            break;
        case WORDSIZE_8:
            *(reg8_t*)(uart_device->register_map+CK_UART_LCR) |= LCR_WORD_SIZE_8;
            break;
        default:
            break;
    }			
} /* }}} */

void ck_uart_set_stopbit(p_ck_uart_device uart_device, t_ck_uart_stopbit stopbit)
{ /* {{{ ck_uart_set_stopbit */
    uart_device->stopbit = stopbit;
    switch(stopbit)
    {
        case STOPBIT_1:
            *(reg8_t*)(uart_device->register_map+CK_UART_LCR) &= LCR_STOP_BIT1;
            break;
        case STOPBIT_2:
            *(reg8_t*)(uart_device->register_map+CK_UART_LCR) |= LCR_STOP_BIT2;
            break;
        default:
            break;
    }
} /* }}} */


void ck_uart_set_rxmode(p_ck_uart_device uart_device, t_ck_uart_mode rxmode)
{ /* {{{ ck_uart_set_rxmode */
    uart_device->rxmode = rxmode;

} /* }}} */

void ck_uart_set_txmode(p_ck_uart_device uart_device, t_ck_uart_mode txmode)
{ /* {{{ ck_uart_set_txmode */
    uart_device->txmode = txmode;
} /* }}} */

/*
 * @brief  open a UART device, use id to select
 *         if more than one UART devices exist in SOC
 * @param  uart_device: uart device handler
 * @param  id: UART device ID
 * @retval 0 if success, 1 if fail
 */
uint32_t ck_uart_open(p_ck_uart_device uart_device, uint32_t id)
{
    if (id == 0)
    {
        uart_device->uart_id = 0;
        uart_device->register_map = (uint32_t*)UART0_BASE_ADDR;
        return 0;
    }
    else
    {
        return 1;
    }
}

/*
 * @brief  Initialize UART configurations from uart_cfig data structure
 * @param  uart_device: uart device handler
 * @param  uart_cfig: uart configurations collection, a structure datatype
 * @retval 0 if success, 1 if fail
 */
uint32_t ck_uart_init(p_ck_uart_device uart_device, p_ck_uart_cfig uart_cfig)
{
    if (uart_device->uart_id == 0xFFFF)
        return 1;
    ck_uart_set_baudrate(uart_device, uart_cfig->baudrate);
    ck_uart_set_parity(uart_device, uart_cfig->parity);
    ck_uart_set_wordsize(uart_device, uart_cfig->wordsize);
    ck_uart_set_stopbit(uart_device, uart_cfig->stopbit);
    ck_uart_set_rxmode(uart_device, uart_cfig->rxmode);
    ck_uart_set_txmode(uart_device, uart_cfig->txmode);
    return 0;
}

/*
 * @brief  close UART device handler
 * @param  uart_device: uart device handler
 * @retval 0 if success, 1 if fail
 */
uint32_t ck_uart_close(p_ck_uart_device uart_device)
{
    ck_uart_set_rxmode(uart_device, DISABLE);
    ck_uart_set_txmode(uart_device, DISABLE);
    uart_device->uart_id = 0xFFFF;
    return 0;
}

/*
 * @brief  transmit a character through UART
 * @param  uart_device: uart device handler
 * @param  c: character needs to transmit
 * @retval 0 if success, 1 if fail
 */
uint32_t ck_uart_putc(p_ck_uart_device uart_device, uint8_t c)
{
    if (uart_device->txmode == DISABLE)
        return 1;
    // wait until uart transmit buffer is empty
    while (!((*(reg8_t*)(uart_device->register_map+CK_UART_LSR)) & CK_LSR_TRANS_EMPTY));

    *(reg8_t*)(uart_device->register_map+CK_UART_THR) = c;
    return 0;
}

/*
 * @brief  check uart device's status, busy or idle
 * @param  uart_device: uart device handler
 * @retval 0 if uart is in idle, 1 if busy
 */
uint32_t ck_uart_status(p_ck_uart_device uart_device)
{
    uint8_t uart_lsr;

//    uart_lsr = *(reg8_t*)(uart_device->register_map+CK_UART_LSR);
    if (uart_lsr & CK_LSR_TEMT)
        return 0;
    else
        return 1;
}

