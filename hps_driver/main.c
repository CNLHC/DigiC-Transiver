#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/mman.h>
#include "hwlib.h"
#include "socal/socal.h"
#include "socal/hps.h"
#include "socal/alt_gpio.h"
#include "hps_0.h"
#include <time.h>
#include <assert.h>
#include <stdlib.h>
#include "RXHandle.h"


#define HW_REGS_BASE (ALT_STM_OFST)
#define HW_REGS_SPAN (0x04000000)
#define HW_REGS_MASK (HW_REGS_SPAN - 1)
#define FIFO_CSR_FILLLEVER 1
#define H2F_TX_RESET 0
#define H2F_RX_RESET 0
#define H2F_TX_UNRESET 2
#define H2F_RX_UNRESET 1

int main()
{

	void *virtual_base;
	int fd;
	void *pTopSystemID;
	void *pReceiverSystemID;
	void *pReceiverFIFO;
	void *pReceiverStatus;
	void *H2FResetControl;
	// void *pTestFIFOWrite;
	// void *pTestFIFORead;
	// pTestFIFORead =  virtual_base + ( ( unsigned long  )( ALT_LWFPGASLVS_OFST +RECEIVERTOPQSYS_0_HPSTESTFIFO_OUT_BASE) & ( unsigned long)( HW_REGS_MASK ) );
	// pTestFIFOWrite =  virtual_base + ( ( unsigned long  )( ALT_LWFPGASLVS_OFST +RECEIVERTOPQSYS_0_HPSTESTFIFO_IN_BASE ) & ( unsigned long)( HW_REGS_MASK ) );

	// map the address space for the LED registers into user space so we can interact with them.
	// we'll actually map in the entire CSR span of the HPS since we want to access various registers within that span

	if ((fd = open("/dev/mem", (O_RDWR | O_SYNC))) == -1)
	{
		printf("ERROR: could not open \"/dev/mem\"...\n");
		return (1);
	}

	virtual_base = mmap(NULL, HW_REGS_SPAN, (PROT_READ | PROT_WRITE), MAP_SHARED, fd, HW_REGS_BASE);

	if (virtual_base == MAP_FAILED)
	{
		printf("ERROR: mmap() failed...\n");
		close(fd);
		return (1);
	}

	pTopSystemID = virtual_base + ((unsigned long)(ALT_LWFPGASLVS_OFST + SYSID_QSYS_BASE) & (unsigned long)(HW_REGS_MASK));
	pReceiverSystemID = virtual_base + ((unsigned long)(ALT_LWFPGASLVS_OFST + RECEIVERTOPQSYS_0_RECEIVERSYSID_BASE) & (unsigned long)(HW_REGS_MASK));
	pReceiverFIFO = virtual_base + ((unsigned long)(ALT_LWFPGASLVS_OFST + RECEIVERTOPQSYS_0_FIFO_0_OUT_BASE + 0) & (unsigned long)(HW_REGS_MASK));

	pReceiverStatus = virtual_base + ((unsigned long)(ALT_LWFPGASLVS_OFST + RECEIVERTOPQSYS_0_FIFO_0_OUT_CSR_BASE) & (unsigned long)(HW_REGS_MASK));
	H2FResetControl=virtual_base + ((unsigned long)(ALT_LWFPGASLVS_OFST + HPSTOFPGARESETPIO_BASE) & (unsigned long)(HW_REGS_MASK));

	*(uint32_t*)H2FResetControl=H2F_RX_UNRESET|H2F_TX_UNRESET;
	uint32_t tSysID = *((uint32_t *)pTopSystemID);
	tSysID = *((uint32_t *)pTopSystemID);
	tSysID = *((uint32_t *)pTopSystemID);
	printf("Top-QSys sysID: 0x%x\n", tSysID);
	if ((uint32_t)tSysID != SYSID_QSYS_ID)
	{
		printf("Top-Qsys sysID Error!");
		return 1;
	}
	tSysID = *((uint32_t *)pReceiverSystemID);
	tSysID = *((uint32_t *)pReceiverSystemID);
	tSysID = *((uint32_t *)pReceiverSystemID);
	printf("Receiver-QSys sysID: 0x%x\n", tSysID);
	if (tSysID != RECEIVERTOPQSYS_0_RECEIVERSYSID_ID)
	{
		printf("Receiver-Qsys sysID Error!");
		return 1;
	}
	FILE *fp = fopen("./DigiCStream", "wb");
    FILE *log = fopen("./log", "w");
	uint32_t tFIFOFillLevel;
	uint64_t preTimestamp=(unsigned)time(NULL);
	uint64_t curTimestamp;
	uint64_t dummy;
	int curState=STATE_WORKING;
	// int curState=STATE_WAITING_0;
	int nextState=0;
	int8_t halfByteFF=0;
	int8_t fullByteBuf=0;

	*(uint32_t*)H2FResetControl=H2F_RX_RESET|H2F_TX_RESET;
	usleep(1000);
	*(uint32_t*)H2FResetControl=H2F_RX_RESET|H2F_TX_UNRESET;
	usleep(1000);
	*(uint32_t*)H2FResetControl=H2F_RX_UNRESET|H2F_TX_UNRESET;

	// printf("Status:%x %d\n",*(uint32_t*)pReceiverStatus,*(uint32_t*)pReceiverStatus);
	tFIFOFillLevel = *(uint32_t *)pReceiverStatus;
	while(tFIFOFillLevel!=0){
		dummy=*((uint32_t *)pReceiverFIFO);
		tFIFOFillLevel = *(uint32_t *)pReceiverStatus;
	}
	printf("FIFO Clear!\n");

	while (1)
	{
		tFIFOFillLevel = *(uint32_t *)pReceiverStatus;
		curTimestamp=(unsigned)time(NULL);
		if(curTimestamp - preTimestamp >6){
			*(uint32_t*)H2FResetControl=H2F_RX_RESET|H2F_TX_RESET;
			usleep(1000);
			*(uint32_t*)H2FResetControl=H2F_RX_RESET|H2F_TX_UNRESET;
			usleep(1000);
			*(uint32_t*)H2FResetControl=H2F_RX_UNRESET|H2F_TX_UNRESET;

			curState=STATE_WAITING_0;
			preTimestamp=curTimestamp;
			while(tFIFOFillLevel!=0){
				dummy=*((uint32_t *)pReceiverFIFO);
				tFIFOFillLevel = *(uint32_t *)pReceiverStatus;
			}
			fclose(fp);


			
			printf("Timeout! Switch to waiting_0 state\n");
			return 0;
		}
		if (tFIFOFillLevel > 0)
		{
			uint32_t tFIFOData1 = *((uint32_t *)pReceiverFIFO);
			uint32_t tFIFOData2 = *((uint32_t *)pReceiverFIFO);
			uint32_t tFIFOData3 = *((uint32_t *)pReceiverFIFO);
			uint32_t tFIFOData4 = *((uint32_t *)pReceiverFIFO);
			uint8_t * packet  =constructPacket(tFIFOData1,tFIFOData2,tFIFOData3,tFIFOData4);
			preTimestamp=curTimestamp;
			uint8_t tHalfByte;
			// fprintf(log, "data:%08x\t%08x\t%08x\t%08x file:%d\n",tFIFOData1,tFIFOData2,tFIFOData3,tFIFOData4,tFIFOFillLevel);
			// printf("data:%08x\t%08x\t%08x\t%08x file:%d\n",tFIFOData1,tFIFOData2,tFIFOData3,tFIFOData4,tFIFOFillLevel);
			int i=0;
			for(i=0;i<24;i++){
				tHalfByte=(packet[i/2]>>(4*((i+1)%2)))&0x0f;
				if(curState==STATE_WORKING){
					if(!halfByteFF){
						fullByteBuf=(tHalfByte<<4)&0xF0;
						halfByteFF=1;
					}
					else{
						fullByteBuf+=tHalfByte;
						fputc((uint8_t)fullByteBuf,fp);
						halfByteFF=0;
					}
				}
				nextState=stateTransfer(curState,tHalfByte);
				if(curState==STATE_WAITING_15&&nextState==STATE_WORKING)
					printf("I AM WORKING!");
				curState=nextState;
			}
		}
	}

	// clean up our memory mapping and exit

	if (munmap(virtual_base, HW_REGS_SPAN) != 0)
	{
		printf("ERROR: munmap() failed...\n");
		close(fd);
		return (1);
	}
	close(fd);
	return (0);
}