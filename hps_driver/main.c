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
	H2FResetControl = virtual_base + ((unsigned long)(ALT_LWFPGASLVS_OFST + HPSTOFPGARESETPIO_BASE) & (unsigned long)(HW_REGS_MASK));

	*(uint32_t *)H2FResetControl = H2F_RX_UNRESET | H2F_TX_UNRESET;

	uint32_t tSysID = *((uint32_t *)pTopSystemID);
	tSysID = *((uint32_t *)pTopSystemID);
	// tSysID = *((uint32_t *)pTopSystemID);
	printf("Top-QSys sysID: 0x%x\n", tSysID);
	if ((uint32_t)tSysID != SYSID_QSYS_ID)
	{
		printf("Top-Qsys sysID Error!");
		return 1;
	}
	tSysID = *((uint32_t *)pReceiverSystemID);
	// tSysID = *((uint32_t *)pReceiverSystemID);
	// tSysID = *((uint32_t *)pReceiverSystemID);
	printf("Receiver-QSys sysID: 0x%x\n", tSysID);
	if (tSysID != RECEIVERTOPQSYS_0_RECEIVERSYSID_ID)
	{
		printf("Receiver-Qsys sysID Error!");
		return 1;
	}
	FILE *fp = fopen("./DigiCStream", "wb");
	FILE *log = fopen("./log", "w");
	uint32_t tFIFOFillLevel;
	uint64_t preTimestamp = (unsigned)time(NULL);
	uint64_t curTimestamp;
	uint64_t dummy;
	int curState = STATE_WORKING;
	// int curState=STATE_WAITING_0;
	int nextState = 0;
	int8_t halfByteFF = 0;
	int8_t fullByteBuf = 0;

	*(uint32_t *)H2FResetControl = H2F_RX_RESET | H2F_TX_RESET;
	usleep(1000);
	*(uint32_t *)H2FResetControl = H2F_RX_RESET | H2F_TX_UNRESET;
	usleep(1000);
	*(uint32_t *)H2FResetControl = H2F_RX_UNRESET | H2F_TX_UNRESET;

	// printf("Status:%x %d\n",*(uint32_t*)pReceiverStatus,*(uint32_t*)pReceiverStatus);
	tFIFOFillLevel = *(uint32_t *)pReceiverStatus;
	tFIFOFillLevel = *(uint32_t *)pReceiverStatus;
	while (tFIFOFillLevel != 0)
	{
		dummy = *((uint32_t *)pReceiverFIFO);
		tFIFOFillLevel = *(uint32_t *)pReceiverStatus;
	}
	printf("FIFO Clear!\n");
	uint32_t tFIFOData1;
	uint32_t tFIFOData2;
	uint32_t tFIFOData3;
	uint32_t tFIFOData4;
	uint8_t packet[13];
	uint8_t tHalfByte;
	uint64_t packetCounter;
	uint64_t preFillLevel;

	*(uint32_t *)H2FResetControl = H2F_RX_UNRESET | H2F_TX_UNRESET;
	int i = 0;
	while (1)
	{
		tFIFOFillLevel = *(uint32_t *)pReceiverStatus;
		if (tFIFOFillLevel > 0)
		{
			tFIFOData1 = *((uint32_t *)pReceiverFIFO);
			tFIFOData2 = *((uint32_t *)pReceiverFIFO);
			tFIFOData3 = *((uint32_t *)pReceiverFIFO);
			tFIFOData4 = *((uint32_t *)pReceiverFIFO);
		 	// packet = constructPacket(tFIFOData1, tFIFOData2, tFIFOData3, tFIFOData4);
			// packetCounter++;
			// fprintf(log, "%d\n", tFIFOFillLevel);
			if (tFIFOFillLevel > 500){
				// *(uint32_t *)H2FResetControl = H2F_RX_RESET | H2F_TX_RESET;
				printf("Boom!:%d\n", tFIFOFillLevel);
				// *(uint32_t *)H2FResetControl = H2F_RX_UNRESET | H2F_TX_UNRESET;
				// return 1;
			}

			 fputc(SYMBOL2BYTES(tFIFOData1, 1),fp);
			 fputc(SYMBOL2BYTES(tFIFOData1, 2),fp);
			 fputc(SYMBOL2BYTES(tFIFOData1, 0),fp);
			 fputc(SYMBOL2BYTES(tFIFOData2, 1),fp);
			 fputc(SYMBOL2BYTES(tFIFOData2, 2),fp);
			 fputc(SYMBOL2BYTES(tFIFOData2, 3),fp);
			 fputc(SYMBOL2BYTES(tFIFOData3, 0),fp);
			 fputc(SYMBOL2BYTES(tFIFOData3, 1),fp);
			 fputc(SYMBOL2BYTES(tFIFOData3, 2),fp);
			 fputc(SYMBOL2BYTES(tFIFOData4, 0),fp);
			 fputc(SYMBOL2BYTES(tFIFOData4, 1),fp);
			 fputc(SYMBOL2BYTES(tFIFOData4, 2),fp);
			 fputc(SYMBOL2BYTES(tFIFOData4, 3),fp);

			// packet[0] =  SYMBOL2BYTES(tFIFOData1, 1);
			// packet[1] =  SYMBOL2BYTES(tFIFOData1, 2);
			// packet[2] =  SYMBOL2BYTES(tFIFOData1, 0);
			// packet[3] =  SYMBOL2BYTES(tFIFOData2, 1);
			// packet[4] =  SYMBOL2BYTES(tFIFOData2, 2);
			// packet[5] =  SYMBOL2BYTES(tFIFOData2, 3);
			// packet[6] =  SYMBOL2BYTES(tFIFOData3, 0);
			// packet[7] =  SYMBOL2BYTES(tFIFOData3, 1);
			// packet[8] =  SYMBOL2BYTES(tFIFOData3, 2);
			// packet[9] =  SYMBOL2BYTES(tFIFOData4, 0);
			// packet[10] = SYMBOL2BYTES(tFIFOData4, 1);
			// packet[11] = SYMBOL2BYTES(tFIFOData4, 2);
			// packet[12] = SYMBOL2BYTES(tFIFOData4, 3);

			// for(i=0;i<13;i++)
			// 	fputc(packet[i], fp);
			// for (i = 0; i < 26; i++) {
			// 	tHalfByte = (packet[i / 2] >> (4 * ((i + 1) % 2))) & 0x0f;
			// 	if (i%2==0) 
			// 		fullByteBuf = (tHalfByte << 4) & 0xF0;
			// 	else 
			// 		fputc((uint8_t)(fullByteBuf+tHalfByte), fp);
			// }
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