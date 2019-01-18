#include<stdlib.h>
#include <unistd.h>
#include <stdint.h>

#define STATE_WAITING_0 0
#define STATE_WAITING_1 1
#define STATE_WAITING_2 2
#define STATE_WAITING_3 3
#define STATE_WAITING_4 4
#define STATE_WAITING_5 5
#define STATE_WAITING_6 6
#define STATE_WAITING_7 7
#define STATE_WAITING_8 8
#define STATE_WAITING_9 9
#define STATE_WAITING_10 10
#define STATE_WAITING_11 11
#define STATE_WAITING_12 12
#define STATE_WAITING_13 13
#define STATE_WAITING_14 14
#define STATE_WAITING_15 15
#define STATE_WORKING 16

#define SYMBOL2BYTES(sym, idx) ((sym >> (24 - (idx)*8)) & (0x000000FF))

int isSysFrame(uint8_t *packet);
void destroyPacket(uint8_t *packet);
uint8_t *constructPacket(uint32_t data1, uint32_t data2, uint32_t data3, uint32_t data4);
uint8_t *constructHalfbytePacket(uint32_t data);
int stateTransfer(int curState,uint8_t halfByte);