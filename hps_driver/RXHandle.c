#include "RXHandle.h"

// enum RXState{
// 	STATE_WAITING,
// 	STATE_WORKING,

// }
// struct state{
// 	int begCounter;
// 	int state;
// 	// int endCounter;
// };


int stateTransfer(int curState,uint8_t halfByte){
	switch(curState){
		case  STATE_WAITING_0 :return (halfByte==1?STATE_WAITING_1 :STATE_WAITING_0);break;
		case  STATE_WAITING_1 :return (halfByte==6?STATE_WAITING_2 :STATE_WAITING_0);break;
		case  STATE_WAITING_2 :return (halfByte==2?STATE_WAITING_3 :STATE_WAITING_0);break;
		case  STATE_WAITING_3 :return (halfByte==3?STATE_WAITING_4 :STATE_WAITING_0);break;
		case  STATE_WAITING_4 :return (halfByte==1?STATE_WAITING_5 :STATE_WAITING_0);break;
		case  STATE_WAITING_5 :return (halfByte==2?STATE_WAITING_6 :STATE_WAITING_0);break;
		case  STATE_WAITING_6 :return (halfByte==7?STATE_WAITING_7 :STATE_WAITING_0);break;
		case  STATE_WAITING_7 :return (halfByte==5?STATE_WAITING_8 :STATE_WAITING_0);break;
		case  STATE_WAITING_8 :return (halfByte==6?STATE_WAITING_9 :STATE_WAITING_0);break;
		case  STATE_WAITING_9 :return (halfByte==2?STATE_WAITING_10:STATE_WAITING_0);break;
		case  STATE_WAITING_10:return (halfByte==0?STATE_WAITING_11:STATE_WAITING_0);break;
		case  STATE_WAITING_11:return (halfByte==1?STATE_WAITING_12:STATE_WAITING_0);break;
		case  STATE_WAITING_12:return (halfByte==0?STATE_WAITING_13:STATE_WAITING_0);break;
		case  STATE_WAITING_13:return (halfByte==2?STATE_WAITING_14:STATE_WAITING_0);break;
		case  STATE_WAITING_14:return (halfByte==1?STATE_WAITING_15:STATE_WAITING_0);break;
		case  STATE_WAITING_15:return (halfByte==9?STATE_WORKING   :STATE_WAITING_0);break;
		case  STATE_WORKING:return curState;
	}
    return curState;
}


int isSysFrame(uint8_t *packet)
{
	if (
		packet[0] == 0x76 &&
		packet[1] == 0x24 &&
		packet[2] == 0x63 &&
		packet[12] == 0x16 &&
		packet[13] == 0x23 &&
		packet[14] == 0x12 &&
		packet[15] == 0x75)
		return 1;
	else
		return 0;
}
uint8_t *constructPacket(uint32_t data1, uint32_t data2, uint32_t data3, uint32_t data4)
{
    //discard one byte 
	uint8_t *head = (uint8_t *)malloc(14);
	head[0] = SYMBOL2BYTES(data1, 1);
	head[1] = SYMBOL2BYTES(data1, 2);
	head[2] = SYMBOL2BYTES(data1, 0);

	head[3] = SYMBOL2BYTES(data2, 0);
	head[4] = SYMBOL2BYTES(data2, 1);
	head[5] = SYMBOL2BYTES(data2, 2);
	head[6] = SYMBOL2BYTES(data2, 3);

	head[7] = SYMBOL2BYTES(data3, 0);
	head[8] = SYMBOL2BYTES(data3, 1);
	head[9] = SYMBOL2BYTES(data3, 2);
	head[10] = SYMBOL2BYTES(data3,3);

	head[11] = SYMBOL2BYTES(data4, 1);
	head[12] = SYMBOL2BYTES(data4, 2);
	head[13] = SYMBOL2BYTES(data4, 3);
	// head[14] = SYMBOL2BYTES(data4, 3);
	return head;
}

uint8_t *constructHalfbytePacket(uint32_t data){
	uint8_t *head = (uint8_t *)malloc(8);
	int i = 0 ;
	for(i=0;i<8;i++)
		head[i]=(data>>(4*(7-i)))&0x0F;
	return head;
}

void destroyPacket(uint8_t *packet)
{
	free(packet);
}